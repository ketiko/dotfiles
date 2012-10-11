#!/usr/bin/env ruby

require 'sqlite3'
require 'date'
require 'term/ansicolor'
include Term::ANSIColor

$db = SQLite3::Database.new "#{ENV['HOME']}/.local/share/hamster-applet/hamster.db"
$db.results_as_hash = true

start = Date.today - Date.today.wday

grand_total = 0.0
day_totals = {}
activity_totals = {}

$db.execute( "
  SELECT * FROM facts
  WHERE DATE(start_time) >= ?
  ", start.to_s ) do |fact|
  start_time = DateTime.parse fact["start_time"], 
  if fact["end_time"]
    end_time = DateTime.parse fact["end_time"]
  else
    now = DateTime.now.to_s.sub( 'T', ' ' )[0..18]
    end_time = DateTime.parse( now )
  end

  diff = end_time - start_time
  hours = diff * 24

  day = Date.parse( fact["start_time"] )
  day_totals[day] ||= 0.0
  day_totals[day] += hours

  activity_totals[fact["activity_id"]] ||= 0
  activity_totals[fact["activity_id"]] += hours

  grand_total += hours
end

def out label, hours, total=nil, show_remaining=false
  minutes = hours * 60 % 60
  printf "%20s: %2i:%02i ", label, hours, minutes
  if total
    printf "%4i%%", hours / total * 100
  end
  hours = total - hours
  if show_remaining
    printf " (%2i:%02i)", hours, hours * 60 % 60
  end
  puts
end

hours_per_week = 32.0

day_totals.keys.sort.each do |day|
  total = day_totals[day]
  print green if day == Date.today
  out day.strftime( '%a' ), total, hours_per_week / 5
  print reset
end

puts '                ------------------'

print bold
out 'Tot', grand_total, hours_per_week
print reset

puts

remaining = hours_per_week - grand_total
out 'Rem', remaining, hours_per_week

days_left = 5 - Date.today.wday
if days_left > 1
  out 'Left', remaining / days_left, hours_per_week / 5
end
exit
puts
puts

activity_totals.keys.sort.each do |activity|
  total = activity_totals[activity]
  name = $db.get_first_value( "
    SELECT name FROM activities WHERE id = ?
    ", activity )
  out name, total, name == 'tukios' ? 5.5 * 3 : 5.5, true
end
