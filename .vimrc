" don't bother with vi compatibility
set nocompatible

" enable syntax highlighting
syntax enable

" ========= VUNDLE =========
" configure Vundle
filetype on " without this vim emits a zero exit status, later, because of :ft off
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif
call vundle#end()

" glaive install needs to be after loading vundle plugins
call glaive#Install()

" ensure ftdetect et al work by including this after the Vundle stuff
filetype plugin indent on
" ========= VUNDLE =========

set autoindent
set autoread                                  " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                               " Fix broken backspace in some setups
set backupcopy=yes                            " see :help crontab
set clipboard^=unnamed,unnamedplus            " yank and paste with the system clipboard
set directory-=.                              " don't store swapfiles in the current directory
set encoding=utf-8
set expandtab                                 " expand tabs to spaces
set ignorecase                                " case-insensitive search
set incsearch                                 " search as you type
set laststatus=2                              " always show statusline
set list                                      " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
set nocursorline                              " don't highlight current line
set number                                    " show line numbers
set ruler                                     " show where you are
set scrolloff=3                               " show context above/below cursorline
set shiftwidth=2                              " normal mode indentation commands use 2 spaces
set showcmd
set smartcase                                 " case-sensitive search if any caps
set softtabstop=2                             " insert mode tab and backspace use 2 spaces
set tabstop=8                                 " actual tabs occupy 8 characters
"set textwidth=80                             " line break after 80 chars
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                  " show a navigable menu for tab completion
set wildmode=longest,list,full

" highlight search
"set hlsearch
"nmap <leader>hl :let @/ = ""<CR>

" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX')  " Support resizing in tmux
  " https://neovim.io/doc/user/nvim.html#nvim-from-vim
  if has('nvim')
    tnoremap <Esc> <C-\><C-n>
  else
    set ttymouse=xterm2
  endif
endif

" keyboard shortcuts
let mapleader = ' '
"noremap <C-Left>  <C-w>h
"noremap <C-Down>  <C-w>j
"noremap <C-Up>    <C-w>k
"noremap <C-Right> <C-w>l
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
noremap <silent> <leader>R :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" play well with system clipboard
" NOTE: pbcopy / pbpaste are aliased in .bash_aliases
vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>


" vim + tmux panes
" https://github.com/melonmanchan/vim-tmux-resizer
let g:tmux_resizer_no_mappings = 1
"nnoremap <silent> <C-h> :TmuxResizeLeft<CR>
"nnoremap <silent> <C-j> :TmuxResizeDown<CR>
"nnoremap <silent> <C-k> :TmuxResizeUp<CR>
"nnoremap <silent> <C-l> :TmuxResizeRight<CR>
" https://github.com/christoomey/vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-Left>  :TmuxNavigateLeft<cr>
nnoremap <silent> <C-Down>  :TmuxNavigateDown<cr>
nnoremap <silent> <C-Up>    :TmuxNavigateUp<cr>
nnoremap <silent> <C-Right> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\>     :TmuxNavigatePrevious<cr>

" in case you forgot to sudo
cnoremap w!! %!sudo tee > /dev/null %

" https://github.com/scrooloose/nerdtree
let g:NERDSpaceDelims=1

" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md set spell
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Don't copy the contents of an overwritten selection.
vnoremap p "_dP

" Powerline only when not in neovim mode.
if !has('nvim')
  " https://github.com/powerline/powerline
  set guifont=Monaco\ for\ Powerline:h12
  let g:Powerline_symbols = 'fancy'
  set encoding=utf-8
  set t_Co=256
  set fillchars+=stl:\ ,stlnc:\
  set term=xterm-256color
  set termencoding=utf-8
  " for compatibility with powerline:
  set laststatus=2  " Always display the statusline in all windows
  set showtabline=2 " Always display the tabline, even if there is only one tab
  set noshowmode    " Hide the default mode text (e.g. -- INSERT -- below the statusline)
else
  let g:powerline_loaded = 1
endif

" gui settings
if (&t_Co == 256 || has('gui_running'))
  syntax on
  let g:solarized_termtrans = 1
  let g:solarized_termcolors = 16 "256
  let g:solarized_visibility = 'high'
  let g:solarized_contrast = 'high'
  set background=dark
  colorscheme solarized
  "colorscheme desert
endif

" YouCompleteMe only when not in neovim mode.
if !has('nvim')
  " https://github.com/Valloric/YouCompleteMe
  let g:ycm_confirm_extra_conf = 0
  "let g:ycm_server_use_vim_stdout = 1
  "let g:ycm_server_keep_logfiles = 1
  let g:ycm_server_log_level = 'debug'
  let g:ycm_max_diagnostics_to_display = 10000
  let g:ycm_enable_diagnostic_signs = 1
  let g:ycm_enable_diagnostic_highlighting = 0
  let g:ycm_always_populate_location_list = 1 "default 0
else
  let g:loaded_youcompleteme = 1
endif

" https://github.com/google/vim-codefmt
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,java,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,json AutoFormatBuffer js-beautify
  " autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType python set shiftwidth=2
  autocmd FileType python set tabstop=2
  autocmd FileType python set softtabstop=2
augroup END

" https://github.com/rust-lang/rust.vim
let g:rustfmt_autosave = 1
" jfon: send clipboard to Rust playpen (vim command is :RustPlay)
"let g:rust_clip_command = 'pbcopy'  " Mac OS X
let g:rust_clip_command = 'xclip -selection clipboard'  " Linux

" Run google-vimcodefmt and vim-isort on all lines of the file buffer.
":augroup codeformatter
":    autocmd BufWritePost * FormatCode
":    autocmd BufWritePost * Isort
":augroup END

" Ctrl-i to sort Python imports (from fisadev/vim-isort Vundle plugin).
"let g:vim_isort_map = '<C-i>'

" https://stackoverflow.com/questions/10694516/vim-copy-mac-over-ssh
" Plugin is 'ojroques/vim-oscyank' (see .vimrc.bundles)
autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '' | OSCYankReg " | endif
