""Plugins
let maplocalleader = ";"
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'lervag/vimtex'
Plug 'sheerun/vim-polyglot'
Plug 'philj56/vim-asm-indent'
Plug 'dylanaraps/wal.vim'

call plug#end()

"" Options
filetype plugin indent on
set nocompatible
syntax on
set number
set tabstop=4
set shiftwidth=4
set expandtab
highlight ColorColumn ctermbg=lightgray
set so=5
set cc=81
setl tw=80
set nofoldenable

" Set omnicomplete options
set omnifunc=syntaxcomplete#Complete
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
set completeopt+=menuone

" Sets relative numbers while in normal mode
set nu rnu
augroup Vimrc
    autocmd FocusLost,InsertEnter * setl nornu
    autocmd FocusGained,InsertLeave * setl rnu
augroup END

" Colorscheme
"set bg=dark
"let g:gruvbox_contrast_dark='hard'
"let g:gruvbox_italic=0
"set termguicolors
"colorscheme gruvbox
colorscheme wal
hi Normal guibg=NONE ctermbg=NONE

" Spell Highlighting
hi SpellBad cterm=underline ctermfg=red
hi SpellCap cterm=underline ctermfg=LightBlue

"" Debugging
packadd termdebug
let g:termdebug_popup = 0
let g:termdebug_wide = 163

"" General Binds
let mapleader = " "
inoremap {{ <ESC>A<CR>{<CR>}<ESC>O
inoremap (( ()<ESC>i
inoremap )) <ESC>/)<CR>a
inoremap [[ []<ESC>i
nnoremap <c-l> :bn<CR>
nnoremap <c-h> :bp<CR>
inoremap <c-c> <ESC>
nnoremap <Leader>l :cn<CR>
nnoremap <Leader>h :cp<CR>
nnoremap <Leader>o :copen<CR>
nnoremap <Leader>g :Termdebug<CR>
inoremap <c-s> <Del>

"" Netrw options
let g:netrw_banner=0
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

"" Snippets and Lang Specific Binds
" Latex
autocmd FileType plaintex setlocal ft=tex
autocmd Filetype tex let g:vimtex_view_general_viewer='zathura'
autocmd FileType tex setlocal spell spelllang=en_us
autocmd FileType tex inoremap ;n <ESC>/(<>)<CR>cf)
autocmd FileType tex nmap ;art :-1read
            \ ~/.vim/templates/tex/art_template.tex<CR>i;n
autocmd FileType tex imap ;tab <ESC>:-1read
                        \ ~/.vim/templates/tex/table_template.tex<CR>5==i;n
autocmd FileType tex imap ;enum <ESC>:-1read
            \ ~/.vim/templates/tex/enum.tex<CR>6==i;n
autocmd FileType tex imap ;fr <CR><ESC>:-1read
            \ ~/.vim/templates/tex/frac.tex<CR>kJJBhxI;n
autocmd FileType tex imap ;mi <CR><ESC>:-1read
            \ ~/.vim/templates/tex/inline.tex<CR>kJJ==I;n
autocmd FileType tex imap ;mt <ESC>:read
            \ ~/.vim/templates/tex/math.tex<CR>5==i;n
autocmd FileType tex imap ;code <ESC>:-1read
            \ ~/.vim/templates/tex/code.tex<CR>4==i;n

" C and C++
autocmd FileType c,cpp  inoremap ;; <ESC>A;
autocmd FileType c,cpp  nnoremap <Leader>c :read 
            \ ~/.vim/templates/c/f_header.c<CR>jA
autocmd FileType c,cpp  nnoremap <Leader>r :silent !ctags -R --languages=C,C++
            \ <CR>:redraw!<CR>

" Makefile
autocmd FileType make inoremap ;n <ESC>/(<>)<CR>cf)
autocmd FileType make nmap ;make :-1read ~/.vim/templates/Makefile<CR>ggi;n

" HTML
autocmd FileType html setlocal spell spelllang=en_us
autocmd FileType html setlocal cc=0
autocmd FileType html inoremap ;n <ESC>/<()><CR>cf>
autocmd FileType html nmap ;html :-1read
            \ ~/.vim/templates/html/skel.html<CR>Gddggi;n
autocmd FileType html imap ;p <ESC>:-1read
            \ ~/.vim/templates/html/paragraph.html<CR>jddk==I;n
autocmd FileType html imap ;ref <ESC>:-1read
            \ ~/.vim/templates/html/href.html<CR>jddk==I;n
autocmd FileType html imap ;css <ESC>:-1read
            \ ~/.vim/templates/html/css.html<CR>jddk==I;n
autocmd FileType html imap ;js <ESC>:-1read
            \ ~/.vim/templates/html/js.html<CR>jddk==I;n
autocmd FileType html imap ;div <ESC>:-1read
            \ ~/.vim/templates/html/div.html<CR>jjjddkkk3==I;n
" CSS
autocmd FileType css nnoremap <Leader>c maI/*<ESC>A*/<ESC>`a
autocmd FileType css nnoremap <Leader>dc ma^xxV/\%V*\/$<CR><ESC>xx`a

" Markdown
autocmd FileType markdown setlocal spell spelllang=en_us
autocmd FileType markdown nnoremap <c-p> :!markdown_previewer %<CR>:redraw!<CR>

" Rust
autocmd FileType rust setl tw=80

"" Command Mode settings
" Finding files in subdirs
set path+=**

" Show all matches during tab-complete
set wildmenu
