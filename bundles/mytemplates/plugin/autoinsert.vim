if has("autocmd")
augroup autoinsert
  au!
  autocmd BufNewFile Makefile call s:Template("make")
  autocmd BufNewFile *.py call s:Template("python")
  autocmd BufNewFile .gitignore call s:Template("gitignore")
augroup END
endif

function s:Template(argument)
        if (a:argument == "help")
                echo "Currently available templates:"
                echo " make             - Makefile Template"
                echo " py               - Python Template"
        else
                " First delete all in the current buffer
                %d

                " The Makefile variants
                if (a:argument == "make")
                        0r ~/.vim/skeletons/template.make
                        set ft=make

                " Stuff for python files
                elseif (a:argument == "python")
                        0r ~/.vim/skeletons/template.py
                        set ft=python
                elseif (a:argument == "gitignore")
                        0r ~/.vim/skeletons/template.gitignore
                endif

                "silent %!~/.vim/do_header %
        endif
endfunction

command! -nargs=1 Template call s:Template(<f-args>)
