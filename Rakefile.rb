require 'rake'
require 'fileutils'

task :default => :install

desc "Install the dotfiles into the user's home directory"
task :install => :git_submodules do
  linkables = Dir.glob('*/**{.symlink}')

  skip_all = false
  overwrite_all = false
  backup_all = false

  linkables.each do |linkable|
    overwrite = false
    backup = false

    file = linkable.split('/').last.split('.symlink').last
    target = "#{ENV["HOME"]}/.#{file}"

    if File.exists?(target) || File.symlink?(target)
      unless skip_all || overwrite_all || backup_all
        puts "File already exists: #{target}, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all"
        case STDIN.gets.chomp
        when 'o' then overwrite = true
        when 'b' then backup = true
        when 'O' then overwrite_all = true
        when 'B' then backup_all = true
        when 'S' then skip_all = true
        when 's' then next
        end
      end
      FileUtils.rm_rf(target) if overwrite || overwrite_all
      `mv "$HOME/.#{file}" "$HOME/.#{file}.backup"` if backup || backup_all
    end

      #if [[ "$uname" = MINGW* || "$uname" = CYGWIN* ]]; then
        #sourcestep=${source:2}
        #source=${sourcestep//\//\\}
        #targetstep=${target:2}
        #target=${targetstep//\//\\}

        #$COMSPEC \/c link.bat\ ${HOMEDRIVE}$source\ ${HOMEDRIVE}$target
        #return
      #else
        #ln -sfv ${source} ${target}
      #fi
    `ln -s "$PWD/#{linkable}" "#{target}"`
  end

  Rake::Task["vimupdate"].execute
end

desc "Pull git submodules"
task :git_submodules do
    puts "Initializing submodules..."
    sh "git submodule init && git submodule update"
end

desc "VIM/Vundle"
task :vimupdate => :git_submodules do
    puts "Updating vundle..."
    sh "git submodule update"

    #puts "Installing/Updating vundles..."
    #sh "vim +BundleInstall! +BundleClean +qa"

    puts "Done!"
end


desc "Remove the dotfiles from the user's home directory"
task :uninstall do

  Dir.glob('**/*.symlink').each do |linkable|

    file = linkable.split('/').last.split('.symlink').last
    target = "#{ENV["HOME"]}/.#{file}"

    # Remove all symlinks created during installation
    if File.symlink?(target)
      FileUtils.rm(target)
    end

    # Replace any backups made during installation
    if File.exists?("#{ENV["HOME"]}/.#{file}.backup")
      `mv "$HOME/.#{file}.backup" "$HOME/.#{file}"` 
    end

  end
end

def replace_file(file)
  system %Q{rm "$HOME/.#{file}"}
  link_file(file)
end

def link_file(file)
  puts "linking ~/.#{file}"
  system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
end
