call pathogen#runtime_append_all_bundles()

" Changes leader key
let mapleader                      = ","

set autoindent
set nocompatible  " Use Vim settings, rather then Vi settings
set nobackup
set nowritebackup
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set encoding=utf-8
set clipboard=unnamed
set tags=tags;./;/                            " Search for ctags file up to /
set nowrap                                 " Whitespace stuff
set tabstop=2                              " Whitespace stuff
set shiftwidth=2                           " Whitespace stuff
set softtabstop=2                          " Whitespace stuff
set expandtab                              " Whitespace stuff
set list listchars=tab:\ \ ,trail:·        " Whitespace stuff
set hlsearch                               " Search stuff
set incsearch                              " Search stuff
set ignorecase                             " Search stuff
set smartcase                              " Search stuff
set laststatus=2                           " Status bar
set modelines=5                            " Status bar
set wrap                                   " Sets lines wrap
set hidden                                 " Buffers are just hidden when closing files
set ttyfast                                " Fasth terminal connection
set timeout timeoutlen=300 ttimeoutlen=300 " Timeout for keystrokes
set wildignore+=*.o                        " Ignored files paths
set wildignore+=*.obj                      " Ignored files paths
set wildignore+=.git                       " Ignored files paths
set wildignore+=*.rbc                      " Ignored files paths
set wildignore+=*.class                    " Ignored files paths
set wildignore+=.svn                       " Ignored files paths
set wildignore+=vendor/gems/*              " Ignored files paths
set wildignore+=*.jpg                      " Ignored files paths
set wildignore+=*.jpeg                     " Ignored files paths
set wildignore+=*.jpeg*                    " Ignored files paths
set wildignore+=*.png                      " Ignored files paths
set wildignore+=*.gif                      " Ignored files paths
set wildignore+=*/public/uploads/*         " Ignored files paths
set wildignore+=*/.git/*                   " Ignored files paths
set wildignore+=*/.bundle/*                " Ignored files paths
set wildignore+=*/bin/*                    " Ignored files paths
set wildignore+=*/log/*                    " Ignored files paths
set wildignore+=*/tmp/*                    " Ignored files paths
set wildignore+=*/.sass-cache/*            " Ignored files paths
set wildignore+=*/.jhw-cache/*             " Ignored files paths
set wildignore+=*/node_modules/*           " Ignored files paths
set nobackup
set nowritebackup
set noswapfile
set splitright                             " Vertical splits at right side
set splitbelow                             " Horizontal splits below
set gdefault                               " don't need /g after :s or :g

" Switch between buffers
nmap <tab> <C-w><C-w>

" Remember last location in file
if has("autocmd")
   au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
   \| exe "normal g'\"" | endif
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
"
syntax on

filetype plugin indent on

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor
endif

" Numbers
set number

" Snippets are activated by Shift+Tab
let g:snippetsEmu_key = "<S-Tab>"

" Tab completion options
set wildmode=list:longest,list:full
set complete=.,w,t

"Change windows"
nnoremap <C-left> <C-w>h
nnoremap <C-down> <C-w>j
nnoremap <C-up> <C-w>k
nnoremap <C-right> <C-w>l


" Insert the ruby debugger"
map <leader>id orequire 'pry';binding.pry<ESC>

" Use the mouse"
set mouse=a

"Search a file recursively in the fs"
nmap <leader>e :FufRenewCache<CR>\|:FufCoverageFile<CR>

" by Elias (WeRelax)
" 13 de Octubre 2011: CoffeeScript correctness check
function! CheckCoffeeSyntax (file)
  let l:js = system('coffee -cp ' . a:file)
  let l:error = matchstr(l:js, '^Error: .* line \d*')
  if empty(l:error)
    return
  else
    :echohl ErrorMsg | echo l:error | echohl None
  endif
endfunction
autocmd! BufWritePost *.coffee :call CheckCoffeeSyntax(expand("%:p"))
"-------

" Sort and Unique .gitignore file"
function! SortAndUnique()
  %sort u
endfunction
autocmd! BufWritePost .gitignore :call SortAndUnique()

"Cleaning options for gvim/mvim"
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar"

let g:ackprg="ack-grep -H --nocolor --nogroup --column"
set hlsearch

"Splits  ,v to open a new vertical split and switch to it
nn <leader>v <C-w>v<C-w>l
nn <leader>h <C-w>s<C-w>l

" Move between splits
nn <C-h> <C-w>h
nn <C-j> <C-w>j
nn <C-k> <C-w>k
nn <C-l> <C-w>l

map  <leader>0 0gt
map  <leader>1 1gt
map  <leader>2 2gt
map  <leader>3 3gt
map  <leader>4 4gt
map  <leader>5 5gt
map  <leader>6 6gt
map  <leader>7 7gt
map  <leader>8 8gt
map  <leader>9 9gt

" Formats json files
map <leader>jf  <Esc>:%!python -m json.tool<CR>

""""""""""""""""""""""""""""""""""""""""""
" Fri Mar 9: Cool split auto-resizing (via the great Gary Bernhardt)
set winwidth=84
" We have to have a winheight bigger than we want to set winminheight. But
" if we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=10
set winminheight=10
set winheight=999

"highlights
au BufNewFile,BufRead *.hamlc set ft=haml

"rspec goodies
nmap <leader>r :!rspec %<CR>

"Copy to clipboard
nmap Y :'<,'>!pbcopy<CR>

"Color scheme (w/ failback)
colorscheme favmonster

"mvim goodies for imac 27"
if has("gui_macvim")
  set guifont=Menlo:h18
  set guifont=Consolas:h18
endif
