syntax enable
set tabstop=4
set softtabstop=4
set shiftwidth=4
set number
filetype indent on
set showmatch
set incsearch
set hlsearch
set relativenumber number
set undofile
set undodir="$HOME/.VIM_UNDO_FILES"
" Enhance command-line completion
set wildmenu
" Ignore when expanding wildcards
set wildignore=*.swp,*.swo,*.class
" Make tabs into spaces (set by tabstop)
set expandtab
" Not for make
autocmd FileType make setlocal noexpandtab
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Optimize for fast terminal connections
set ttyfast
" Enable mouse in all modes
set mouse=a
" Hide the mouse cursor while typing
set mousehide

""" Tabs {{{
  nnoremap <silent> <Tab><Tab> :tabnew<CR>
  nnoremap <silent> <Tab>q :tabclose<CR>
  nnoremap <silent> <Tab>o :tabonly<CR>
  nnoremap <silent> <Tab>s :tabs<CR>
  nnoremap <silent> <Tab>^ :tabfirst<CR>
  nnoremap <silent> <Tab>$ :tablast<CR>
  nnoremap <silent> <Tab>k :tabfirst<CR>
  nnoremap <silent> <Tab>j :tablast<CR>
  nnoremap <silent> <Tab>l :tabnext<CR>
  nnoremap <silent> <Tab>h :tabprevious<CR>
  nnoremap <silent> <Tab>n :tabnext<CR>
  nnoremap <silent> <Tab>p :tabprevious<CR>
  nnoremap <silent> <Tab><Right> :tabnext<CR>
  nnoremap <silent> <Tab><Left> :tabprevious<CR>
  nnoremap <silent> <Tab>1 :tabnext 1<CR>
  nnoremap <silent> <Tab>2 :tabnext 2<CR>
  nnoremap <silent> <Tab>3 :tabnext 3<CR>
  nnoremap <silent> <Tab>4 :tabnext 4<CR>
  nnoremap <silent> <Tab>5 :tabnext 5<CR>
  nnoremap <silent> <Tab>6 :tabnext 6<CR>
  nnoremap <silent> <Tab>7 :tabnext 7<CR>
  nnoremap <silent> <Tab>8 :tabnext 8<CR>
  nnoremap <silent> <Tab>9 :tabnext 9<CR>
" }}}

" Map Ctrl-l to Escape key      
imap <C-L> <Esc>
 
" Close the buffer but not the window
nnoremap <C-d> :bp\|bd #<CR>

" Show list of buffers and select a buffer using <F5>
nnoremap <F5> :buffers<CR>:buffer<Space>

" Split windows vertically and horizontally
nnoremap <C-w>\ :vsplit<CR>
nnoremap <C-w>- :split<CR>

noremap H ^
noremap L g_

" Open NERDTree with Ctrl-f
map <C-f> :NERDTreeToggle<CR>
        
" Unmap the arrow keys in command, insert and visual mode
no <up> <Nop>            
no <down> <Nop>               
no <left> <Nop>               
no <right> <Nop>               
ino <up> <Nop>                  
ino <down> <Nop>               
ino <left> <Nop>               
ino <right> <Nop>

" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.dotfiles/vim/.vim/plugged')

Plug 'tpope/vim-sleuth' " detect indent style (tabs vs. spaces)
Plug 'sickill/vim-pasta' " context-aware pasting
Plug 'ervandew/supertab' " Perform all your vim insert mode completions with Tab
Plug 'sotte/presenting.vim', { 'for': 'markdown' } " a simple tool for presenting slides in vim based on text files
Plug 'tpope/vim-fugitive' " amazing git wrapper for vim
Plug 'tpope/vim-rhubarb' " hub extension for fugitive
Plug 'Raimondi/delimitMate' " automatic closing of quotes, parenthesis, brackets, etc.
Plug 'tomtom/tcomment_vim' " comment stuff by selecting text
Plug 'ryanoasis/vim-devicons' " GUI icons
Plug 'terryma/vim-multiple-cursors' " Multiple cursors
Plug 'tpope/vim-surround' " Surround strings with stuff

" markdown
Plug 'itspriddle/vim-marked', { 'for': 'markdown', 'on': 'MarkedOpen' } " Open markdown files in Marked.app - mapped to <leader>m
" Plug 'tpope/vim-markdown', { 'for': 'markdown' } " markdown support

" Make sure you use single quotes
" Syntastic. Not sure if it'll work
Plug 'vim-syntastic/syntastic'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'


" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Color scheme
Plug 'rakr/vim-one'
Plug 'mhartington/oceanic-next'

" Themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'

" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Color scheme
let g:airline_theme='oceanicnext'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0    " Do not overwrite the current themes
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
let g:airline_powerline_fonts = 1
colorscheme OceanicNext
set background=dark " for the dark version
"set background=light " for the light version
set termguicolors
