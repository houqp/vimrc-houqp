This is houqp's vim configuration, use at your own risk. ;-P



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

`<leader>tl`: toggle TagBar window.

`<leader>f`: find files.

`<leader>bf`: find buffers.

`<leader>r`: show MRU list.

`<leader>be`: show buffer lists.

`<leader>w`: quick save in normal mode.

`<leader>h`: toggle hex mode.

`<leader>t`: show tasklist (todo, fix, etc).

`<leader>q`: toggle quickfix window.

`[q` & `]q`: previous & next quickfix item.

`<Ctrl>s`: quick save in insert mode.

`<Ctrl>j`: jump to place holder.

`<Ctrl>l`: OmniComplete.

`<Alt><F5>`: issue make command in current directory.


### Use sessions for project management
Because I use different color scheme for .gvimrc and .vimrc, so I only
enabled auto session management in GUI. Every time you fire up GVim with no arguments,
the session mode will be set and you can use `<Leader><Leader>ms` to save a
session on current directory.

Then you can easily recover your previous workspace by fire up GVim in the
same directory, where Session.vim is saved. When you quit GVim, it will automatically
save the session for you.



# Tips for installed plugins
### Colorizer

Colorizer is turned off by default, use command `ColorToggle` to turn it on.


### BufExplorer

`:help bufexplorer`


### VOoM

`:Voom format`

VOoM supports lots of format, check out this [page](http://vim-voom.github.com) for the list.


### easymotion

The default leader for easymotion has been changed to <Leader><Leader> to avoid
conflcts. So use `<Leader><Leader>w` to trigger the word motion.


### UltiSnips

in insert mode, press:

expand snips: `<TAB>`

jump forward: `<Ctrl>j`

jump backward: `<Ctrl>k`

list snips: `<Ctrl><TAB>`


### CtrlP

inside the prompt:

 * toggle search by filename between by full path: `<Ctrl>d`
 * selection up: `<Ctrl>k`
 * selection down: `<Ctrl>j`
 * exit: `<Ctrl>c`, `<Ctrl>g`, `<esc>`
 * toggle regexp search: `<Ctrl>r`
 * purge cache: `<F5>`
 * forward: `<Ctrl>f`
 * backward: `<Ctrl>b`
 * wipe MRU list: `<F7>`
 * help page: `?`+`<CR>`


### Tagbar

in Tagbar buffer:

 * display help page: `<F1>`
 * change tags sort order: `s`
 * folding: same as Vim's built-in mappings:
   * open: `zo`
   * close: `zc`
   * toggle: `za`
   * open all: `zR`
   * close all: `zM`
 * goto next top level: `<Ctrl>N`
 * goto previous top level: `<Ctrl>P`
 * zoom tagbar window: `x`
 * display tag protogype: `<Space>`


### echofunc

next proto: `<Alt>=`

previous proto: `<Alt>-`


### Fugitive

find out the author of every line: `Gblame`

add current editing file: `Gwrite`

commit staged changes: `Gcommit`

view revisions for current file: `Glog`

show complete commit logs: `Glog --`


### GitGutter

Toggle GitGutter: `GitGutterToggle`

jump bwteen hunks: `]h`, `[h`


### vim-trailing-whitespace
use `FixWhitespace` command to automatically remove all trailing whitespaces.

### tcomment_vim
toggle comment: `gc`
