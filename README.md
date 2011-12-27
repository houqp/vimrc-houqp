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
