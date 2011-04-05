git_bundles = [ 
  "git://github.com/msanders/snipmate.vim.git",
  "git://github.com/scrooloose/nerdtree.git",
  "git://github.com/timcharper/textile.vim.git",
  "git://github.com/tpope/vim-fugitive.git",
  "git://github.com/tpope/vim-haml.git",
  "git://github.com/tpope/vim-markdown.git",
  "git://github.com/tpope/vim-rails.git",
  "git://github.com/tpope/vim-repeat.git",
  "git://github.com/tpope/vim-surround.git",
  "git://github.com/tpope/vim-vividchalk.git",
  "git://github.com/tsaleh/vim-align.git",
  "git://github.com/tsaleh/vim-supertab.git",
  "git://github.com/tsaleh/vim-tcomment.git",
  "git://github.com/vim-ruby/vim-ruby.git",
  "git://github.com/vim-scripts/peaksea.git",
]

require 'fileutils'
require 'open-uri'

`git init`
`git add .`
`git commit -am "Initial commit."`

bundles_dir = File.join(File.dirname(__FILE__), "bundle")

git_bundles.each do |url|
  dir = File.join bundles_dir, url.split('/').last.sub(/\.git$/, '')
  puts "  Unpacking #{url} into #{dir}"
  `git submodule add #{url} #{dir}`
  `git add .`
  `git commit -m "Install submodule #{url}."`
end

