" Coral language implementation
autocmd BufRead,BufNewFile *.coral set filetype=coral
autocmd BufRead,BufNewFile *.coral set syntax=swift

" Line
set nu
set relativenumber
set nowrap

" Indentation
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Search
set nohlsearch
set incsearch

" History
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" Misc
set hidden
set termguicolors
set scrolloff=4
set signcolumn=yes
set colorcolumn=80

" Dashboard
let g:dashboard_default_executive = 'telescope'
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>
