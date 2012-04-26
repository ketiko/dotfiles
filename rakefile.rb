require 'rake'
require 'erb'
require 'fileutils'

task :default => ['link_files', 'link_bin', 'update_bundles']#, 'run_templates']

task :link_files do
  Dir.chdir('src')
  items = find_files
  items.each do |item|
    link_file(item)
  end
end

task :link_bin do
  bin = Dir['**/bin'].reject { |item| File.file?(item) }.first
  link_dir(bin)
end

task :run_templates do
  Dir.chdir('src')
  files = Dir['*.erb']
  files.each do |item|
    destination = "#{Dir.home()}/.#{item.sub('.erb','')}"
    if File.exist?(destination)
      print "overwrite #{File.basename(destination)}? [yn] "
      if $stdin.gets.chomp == 'n'
        next
      end
    end

    template_erb(File.expand_path(item), destination)
  end
end

task :update_bundles do
  Dir.chdir(File.expand_path('~/.vim/'))
  system "ruby update_bundles.rb"
end

def find_files
  files = Dir['\.*'].reject { |item| File.directory?(item) || File.extname(item) == '.erb' }
  files.concat(Dir['.vim/**/*'].reject { |item| File.directory?(item) })
  return files
end

def link_file(item)
  source = File.expand_path(item)
  destination = "#{Dir.home()}/#{item}"

  if File.exist?(destination)
    print "overwrite #{File.basename(destination)}? [yn] "
    if $stdin.gets.chomp == 'n'
      return
    end
  end

  link_item(source, destination)
end

def link_item(source, destination)
  FileUtils.mkdir_p File.dirname(destination)
  if File.exists?(destination)
    remove_item(destination)
  end
  system %Q{cmd /C mklink /H "#{destination}" "#{source}"}
end

def link_dir(item)
  source = File.expand_path(item)
  destination = "#{Dir.home()}/#{File.basename(item)}"

  if Dir.exist?(destination)
    print "overwrite #{File.basename(destination)}? [yn] "
    if $stdin.gets.chomp == 'n'
      return
    end
  end

  link_dir_item(source, destination)
end

def link_dir_item(source, destination)
  if Dir.exists?(destination)
    FileUtils.rm_rf(destination)
  end
  system %Q{cmd /C mklink /J "#{destination}" "#{source}"}
end

def remove_item(destination)
  File.delete(destination)
end

def template_erb(template, destination)
  if File.extname(template) == '.erb'
    remove_item(destination)
    File.open(destination, 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  end
end
