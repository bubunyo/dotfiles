set autoindent
set autoread                                                        " Reload files when changed on disk, i.e. via `git checkout`.
set backspace=2                                                     " Fix broken backspace in some setups.
set backupcopy=yes                                                  " See :help crontab.
set clipboard=unnamed                                               " Yank and paste with the system clipboard.
set directory-=.                                                    " Don't store swap files in current directory.
set encoding=utf-8
"set expandtab                                                       " Expand tabs to spaces.
set ignorecase                                                      " Case-insensitive search.
set incsearch                                                       " Search as I type.
set laststatus=2                                                    " Always show statusline.
"set list                                                            " Show trailing whitespace.
set number                                                          " Show line number.
set ruler                                                           " Show where you are.
set scrolloff=3                                                     " Show content above/below cursorline.
set shiftwidth=2                                                    " Normal mode indentation commands use 2 spaces.
set showcmd
set smartcase                                                       " Case-sensitive search if any caps.
set softtabstop=2                                                   " Insert mode tab and backspace use 2 spaces.
set tabstop=4                                                       " Actual tabs occupy 8 characters.
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.pyc,*.rbc
set wildmenu                                                        " Show a navigable menu for tab completion
set wildmode=longest,list,full

" custom sets
set relativenumber

" Keyboard shortcuts
let mapleader = ','
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
nnoremap <leader>l :Align
nnoremap <leader>a :Ag<space>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>o :NERDTreeMapActivateNode<CR>
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nnoremap <leader>] :TagbarToggle<CR>
nnoremap <leader>g :GitGutterToggle<CR>
nnoremap <leader>c <Plug>Kwbd
nnoremap <silent> <leader>V :source ~/.vimrc<CR>:filetype dtect<CR>:exe ":echo 'vimrc reloaded'"<CR>
map <F7> mzgg=G`z

