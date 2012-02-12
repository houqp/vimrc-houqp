This is houqp's vim configuration, use at your own risk. :-P

# Installation

Move the whole repository into your home directory and rename to `.vim`. 

Then issue following command in `.vim` directory:

```bash
$ make install
```

This will clone the latest Vundle plugin for you. 

The last thing you need to do is to call `:BundleInstall` in vim.



# Usage
### Mappings
`<leader>ms`: save current session to .Session.vim file.

`<leader><TAB>`: switch to previous window.

`<leader>tl`: toggle taglist window.

`<leader>f`: find files.

`<leader>bf`: find buffers.

`<leader>be`: show buffer lists.

`<leader>w`: quick save in normal mode.

`<leader>h`: toggle hex mode.

`<Ctrl>s`: quick save in insert mode.

`<Ctrl>j`: jump to place holder.

`<Alt><F5>`: issue make command in current directory.

### Use sessions for project management
Because I use different color scheme for .gvimrc and .vimrc, so I only
enabled auto session management in GUI. Every time you fire up GVim with no arguments,
the session mode will be set and you can use `<Leader><Leader>ms` to save a
session on current directory.

Then you can easily recover your previous workspace by fire up GVim in the
same directory, where Session.vim is saved. When you quit GVim, it will automatically
save the session for you.


# Plugins notes
### Colorizer

Colorizer is turned off by default, use command `ColorToggle` to turn it on.


### BufExplorer

`:help bufexplorer`


### VOoM

`:Voom format`

VOoM supports lots of format, check out this [page](http://vim-voom.github.com) for the list.


### easymotion

The default leader for easymotion has been changed to <Leader><Leader> to avoid conflcts. So use `<Leader><Leader>w` to trigger the word motion.


### FuzzyFinder

use `<Leader>f` to trigger `:FufFile`, `<Leader>bf` to trigger `:FufBuffer`.


### UltiSnips

in insert mode, press:

expand snips: `<tab>`

jump forward: `<c-j>`

jump backward: `<c-k>`

list snips: `<c-tab>`
