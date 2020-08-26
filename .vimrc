" ----------------------------------------------------------------------------
" System Configurations
" ----------------------------------------------------------------------------

" Set plugin paths according to the host OS
if has('win32')
  let plug_dir=$HOME.'\vimfiles\plugged'
  let vim_plug=$HOME.'\vimfiles\autoload\plug.vim'
else
  let plug_dir='~/.vim/plugged'
  let vim_plug='~/.vim/autoload/plug.vim'
endif

" Automatically download and install vim-plug if it is not present
if empty(glob(vim_plug))
  silent execute '!curl -fLo '.vim_plug.' --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

" The list of plugins to be installed when 'PlugInstall' is called.
" Automatically executes 'filetype plugin indent on' and 'syntax enable'.
call plug#begin(plug_dir)
  Plug 'airblade/vim-gitgutter'
  Plug 'preservim/nerdtree'
  Plug 'simnalamburt/vim-mundo'
  Plug 'sonph/onehalf', {'rtp': 'vim/'}
  Plug 'vim-airline/vim-airline'
call plug#end()

" Automatically install plugins at the startup sequence
" autocmd VimEnter * PlugInstall --sync | source $MYVIMRC

" ----------------------------------------------------------------------------
" Editor Configurations
" ----------------------------------------------------------------------------

" Automatically read if the file has been changed outside of Vim
set autoread

" Backspacing over autoindent, line break and start of insert action
set backspace=indent,eol,start

set shiftwidth=4   " The length of the tab indentation
set softtabstop=4  " The length of soft tabs
set expandtab      " Use soft tabs when <TAB> is pressed

" Remove any trailing whitespace at the end of each line
autocmd BufWritePre * %s/\s\+$//e

" Always show the completion popup menu even if there is one match and never
" insert any text until it is selected
set completeopt=menuone,noinsert

" Keep completion popup menu open while typing
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" ----------------------------------------------------------------------------
" UI Configurations
" ----------------------------------------------------------------------------

set wildmenu       " Use command-line completion menu
set wildmode=full  " Complete the next full match

set guioptions-=m  " Hide menu bar
set guioptions-=T  " Hide toolbar
set guioptions-=r  " Hide right-hand scroll bar
set guioptions-=L  " Hide left-hand scroll bar

" Set GUI color scheme as One Half Dark
colorscheme onehalfdark

" Enable 24-bit true colors for color matching in terminal with Vim
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Set font as DejaVu Sans Mono with the size of 10
set guifont=DejaVu_Sans_Mono:h10

set number      " Show line numbers
set cursorline  " Highlight current line
set noshowmode  " Hide mode message on the last line

set colorcolumn=80  " Set column marker to 80

" ----------------------------------------------------------------------------
" Plugin Specific Configurations
" ----------------------------------------------------------------------------

let NERDTreeShowHidden=1             " Show hidden files in NERDTree
let NERDTreeStatusline='%#NonText#'  " Hide NERDTree statusline

" Assign keybinding to 'NERDTreeToggle'
map <C-n> :NERDTreeToggle<CR>
