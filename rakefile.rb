require 'rake'
require 'erb'
require 'fileutils'

task :default => ['dot_files', 'vim_bundles']

task :dot_files do
  Dir.chdir('src')
  items = find_files
  items.each do |item|
    link_file(item)
  end
end

task :vim_bundles do
  #Dir.chdir('src')
  #items = Dir['.vim/**/*'].reject { |item| File.directory?(item) }
  #puts items
  #items.each do |item|
  #  destination = "#{Dir.home()}/#{item}"
  #  FileUtils.mkdir_p File.dirname(destination)
  #  system %Q{cmd /C mklink /H "#{destination}" "#{item}"}
  #end
  #system "ruby ~/.vim/update_bundles.rb"
end

def find_files
  files = Dir['\.*'].reject { |item| File.directory?(item) || File.extname(item) == '.erb' }
  files.concat(Dir['.vim/**/*'].reject { |item| File.directory?(item) })
  return files
end

def link_file(item)
  source = File.expand_path(item)
  destination = "#{Dir.home()}/#{item}"
  FileUtils.mkdir_p File.dirname(destination)

  if File.exist?(destination)
    print "overwrite #{File.basename(destination)}? [yn] "
    if $stdin.gets.chomp == 'n'
      return
    end
  end

  link_item(source, destination)
end

def link_item(source, destination)
    if File.exists?(destination)
      remove_item(destination)
    end
    system %Q{cmd /C mklink /H "#{destination}" "#{source}"}
end

def remove_item(destination)
  if File.directory?(destination)
    Dir.delete(destination)
  else
    File.delete(destination)
  end
end

def template_erb(template, destination)
  if File.extname(template) == '.erb'
    File.open(destination, 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  end
end

#desc "install the dot files into user's home directory"
#task :oldinstall do
#	replace_all = false
#	Dir['Home/*'].each do |file|
#		next if %w[Rakefile README.rdoc LICENSE].include? file
#
#		if File.exist?(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"))
#			if File.identical? file, File.join(ENV['HOME'], ".#{file.sub('.erb', '')}")
#				puts "identical ~/.#{file.sub('.erb', '')}"
#			elsif replace_all
#				replace_file(file)
#			else
#				print "overwrite ~/.#{file.sub('.erb', '')}? [ynq] "
#				case $stdin.gets.chomp
#				when 'y'
#				  replace_file(file)
#				when 'q'
#				  exit
#				else
#				  puts "skipping ~/.#{file.sub('.erb', '')}"
#				end
#			end
#		else
#			link_file(file)
#		end
#	end
#end

