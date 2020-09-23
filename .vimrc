" ----------------------------------------------------------------------------
" System Configurations
" ----------------------------------------------------------------------------

" Set paths for Windows to use Unix-like Vim directory structure
if has('win32')
  set rtp^=~/.vim
  set viminfo+=n~/.viminfo
endif

" Automatically download and install vim-plug if it is not present
if empty(glob('~/.vim/autoload/plug.vim'))
  if has('win32')
    silent !curl -fLo .vim\autoload\plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  else
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  endif
endif

" The list of plugins to be installed when 'PlugInstall' is called.
" Automatically executes 'filetype plugin indent on' and 'syntax enable'.
call plug#begin('~/.vim/plugged')
  Plug 'airblade/vim-gitgutter'
  Plug 'preservim/nerdtree'
  Plug 'simnalamburt/vim-mundo'
  Plug 'sonph/onehalf', {'rtp': 'vim/'}
  Plug 'tpope/vim-fugitive'
  Plug 'vim-airline/vim-airline'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'ryanoasis/vim-devicons'
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

set foldmethod=syntax  " Fold according to syntax file
set nofoldenable       " Disable automatic folding

" Remove any trailing whitespace at the end of each line
autocmd BufWritePre * %s/\s\+$//e

" Always show the completion popup menu even if there is one match and never
" insert any text until it is selected
set completeopt=menuone,noinsert

" Keep completion popup menu open while typing
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Recursively search for 'tags' file starting from the current directory
" up until the root directory
set tags=./tags;

" ----------------------------------------------------------------------------
" UI Configurations
" ----------------------------------------------------------------------------

set wildmenu               " Use command-line completion menu
set wildmode=longest:full  " Complete till longest common string

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

" Set font as DejaVu Sans Mono Nerd Font with the size of 10
set guifont=DejaVuSansMono_NF:h10

" Set encoding to UTF-8 to show glyphs
set encoding=UTF-8

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

let NERDTreeDirArrowExpandable='▸'   " Use 'right' arrow for expandable folder
let NERDTreeDirArrowCollapsible='▾'  " Use 'down' arrow for collapsible folder

" Use Nerd Fonts for the Git state symbols
let NERDTreeGitStatusUseNerdFonts=1
