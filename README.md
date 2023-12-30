# Installation

Move the whole repository into your home directory and rename to `.vim`.

Then issue following command in `.vim` directory:

```bash
$ make install
```

# Configuration

Plugin specific lua configs are mananaged in `lua/plugins` including treesitter and lspconfig.

Most of the syntax highlights are supported through treesitter.

Plug installed dependencies are managed in `allrc.vim`. Packer installed
dependencies are managed in `nvim/init.lua`. Configs in `lua/plugins` are
manually sourced in `init.lua`.

# Usage
### Mappings
`<leader>do`: Show error message in popup.

`K`: Show LSP popup, e.g. type info.

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

### Commands

`Ag KEYWORD`: search keyword using ag.
`Agc`: search current word under cursor using ag.

# Tips for installed plugins
### BufExplorer

`:help bufexplorer`


### easymotion

The default leader for easymotion has been changed to <Leader><Leader> to avoid
conflcts. So use `<Leader><Leader>w` to trigger the word motion.


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

Toggle GitGutter: `<leader>gd` or `:GitGutterToggle`

jump bwteen hunks: `]h`, `[h`


### vim-trailing-whitespace
use `FixWhitespace` command to automatically remove all trailing whitespaces.


### tcomment_vim
toggle comment: `gc`
