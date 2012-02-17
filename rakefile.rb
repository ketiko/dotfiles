require 'rake'
require 'erb'

task :default => ['install']

task :install do
items = get_files_to_link
items.each do |item|
  source = item
  destination = "#{Dir.home()}/.#{File.basename(item)}"
  if !File.directory?(source)
    if File.exist?(destination)
      print "overwrite #{File.basename(destination.sub('.erb', ''))}? [yn] "
      case $stdin.gets.chomp
      when 'y'
        remove_item(destination)
        link_item(source, destination)
      end
    else
      link_item(source, destination)
    end
  end
end

  copy_vimfiles()
  sh "source ~/.bashrc"
end

def copy_vimfiles()
  system %Q{cp -R Home/vimfiles #{Dir.home()}}
  Dir.chdir(Dir.home() + '/vimfiles')
  system "ruby ./update_bundles.rb"
end

def get_files_to_link
  Dir['Home/*'].reject {|item| File.extname(item) == '.erb' }
end

def link_item(source, destination)
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

