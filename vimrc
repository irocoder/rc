filetype plugin on " Recognize file types and load plug-ins
set omnifunc=syntaxcomplete#Complete " Use syntax completion specific to each programming language with Ctrl-X, Ctrl-O
set t_Co=16
if &t_Co > 2
   syntax on " Turn on syntax highlighting, if the terminal has colors
endif

set nocompatible              " be iMproved, required
filetype off                  " required

set visualbell

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'jlfwong/vim-mercenary' " Mecurial Wrapper
Plugin 'vimwiki/vimwiki' " Makes writing documentation pleasant
Plugin 'vim-airline/vim-airline-themes' " Themes for vim-airline
Plugin 'vim-airline/vim-airline' " Status-line
Plugin 'ntpeters/vim-better-whitespace' " Highlighted trailing whitespace and :StripWWhitespace
Plugin 'ryanoasis/vim-devicons' " Pretty icons
Plugin 'ctrlpvim/ctrlp.vim' " File finder
Plugin 'vim-scripts/functionlist.vim' " Functionlist - use Flisttoggle to use
Plugin 'stephpy/vim-yaml' " Non-slow YAML syntax highlighting
Plugin 'tpope/vim-fugitive' " The worst Git wrapper of all time
Plugin 'tpope/vim-dispatch' " Asynchronous dispatcher
Plugin 'mileszs/ack.vim' " Ack-Grep in Vim
Plugin 'danro/rename.vim' " Easy renaming of current file
Plugin 'godlygeek/tabular' " Dependency for vim-markdown
Plugin 'plasticboy/vim-markdown' " Markdown syntax highlighting and other features

call vundle#end()            " required
filetype plugin indent on    " required

syntax on
filetype plugin indent on

" Tab and space options
set expandtab " Convert tabs to spaces when typing
set shiftwidth=2 " Number of spaces text is indented during indent operation
set smartindent " Automatically indent inside braces
set softtabstop=0 " How many columns to use when you hit Tab in insert mode
set tabstop=2 " How many columns a tab counts for
set smarttab
" set statusline+=%F
set laststatus=2
set number
set breakindent
set grepprg=ack-grep\ -a
set hidden
"set pastetoggle=<F2>

" Search
set incsearch " Do incremental searching
set nohls " Do not highlight the last used search pattern
set nowrapscan " Do not wrap to beginning of a file when searching for a string

" Other
set backspace=indent,eol,start " Allow backspacing over everything in insert mode
set history=50 " Keep 50 lines of command line history
set ruler " Show the cursor position all the time
set scrolloff=10 " Show at least 10 lines of context above and below the cursor
set showcmd " Display information about characters and lines selected while selecting them
set encoding=utf8

let g:loaded_matchparen = 1 " Turn on parenthesis matching
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'
let g:ack_default_options = " -H --nocolor --nogroup --column"
let g:airline#extensions#tabline#enabled = 1
let g:easytags_async = 1 " Asynchronous tags
let g:vim_markdown_folding_disabled = 1

map <C-H> :bprev<CR>
map <C-L> :bnext<CR>
nnoremap ; :

" Visual mode swapping - to use, in visual mode, delete some text, then select
" some other text, then press Ctrl-X.  The text will be swapped.
:vnoremap <C-X> <Esc>`.``gvP``P

" Disable linewrap
set textwidth=0
set wrapmargin=0

" Highlight text past end of line in reverse color.
" Note that ctermbg must use an available color word for the terminal.
augroup vimrc_autocmds
  autocmd BufEnter * highlight OverLength ctermbg=black ctermfg=white guibg=black guifg=white
  autocmd BufEnter * match OverLength /\%121v.*/
  autocmd VimEnter * wincmd p
"  autocmd BufReadPost,FileReadPost,BufNewFile,BufEnter * call system("tmux rename-window 'vim | " . expand("%:t") . "'")
"  autocmd VimLeave * call system("tmux rename-window 'tmux'")
augroup END

au BufNewFile,BufRead *.spec set filetype=xml
