#!/usr/bin/env ruby
require 'open-uri'

git_bundles = [
  "git://github.com/altercation/vim-colors-solarized.git",
  "git://github.com/msanders/snipmate.vim.git",
  "git://github.com/pangloss/vim-javascript.git",
  "git://github.com/scrooloose/nerdcommenter.git",
  "git://github.com/scrooloose/nerdtree.git",
  "git://github.com/sukima/xmledit.git",
  "git://github.com/tpope/vim-surround.git",
  "git://github.com/tsaleh/vim-matchit.git",
  "git://github.com/vim-ruby/vim-ruby.git",
  "git://github.com/vim-scripts/csharp.vim.git",
  "git://github.com/vim-scripts/taglist.vim.git",
]

bundles_dir = File.join(File.dirname(__FILE__), "bundle")

if !Dir.exists?(bundles_dir)
  Dir.mkdir(bundles_dir)
end

Dir.chdir(bundles_dir)

puts 'Installing vim bundles'

git_bundles.each do |url|
  dir = url.split('/').last.sub(/\.git$/, '')
  if Dir.exists?(dir)
    Dir.chdir(dir)
    `git clean -fd pull`
    Dir.chdir('..')
  else
   `git clone #{url} #{dir}`
  end
end

