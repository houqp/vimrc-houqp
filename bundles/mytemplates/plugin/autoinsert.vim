if has("autocmd")
augroup autoinsert
  au!
  autocmd BufNewFile Makefile call s:Template("make")
  autocmd BufNewFile *.py call s:Template("python")
  autocmd BufNewFile *.html,*.htm call s:Template("html")
  autocmd BufNewFile .gitignore call s:Template("gitignore")
  autocmd BufNewFile README.md call s:Template("readme.md")
augroup END
endif

function s:Template(argument)
        if (a:argument == "help")
                echo "Currently available templates:"
                echo " make             - Makefile Template"
                echo " py               - Python Template"
                echo " html             - HTML Template"
                echo " README.md        - README.md Template"
                echo " gitignore        - .gitignore Template"
        else
                " First delete all in the current buffer
                %d

                " The Makefile variants
                if (a:argument == "make")
                        0r $HOME/.vim/templates/make.tpl
                        set ft=make
                " Stuff for python files
                elseif (a:argument == "python")
                        0r $HOME/.vim/templates/py.tpl
                        set ft=python
                elseif (a:argument == "html")
                        0r $HOME/.vim/templates/html.tpl
                        set ft=html
                elseif (a:argument == "gitignore")
                        0r $HOME/.vim/templates/gitignore.tpl
                elseif (a:argument == "readme.md")
                        0r $HOME/.vim/templates/readmemd.tpl
                        set ft=markdown
                endif

                "silent %!~/.vim/do_header %
        endif
endfunction

command! -nargs=1 Template call s:Template(<f-args>)
