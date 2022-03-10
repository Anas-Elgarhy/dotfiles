:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set encoding=UTF-8

" Plugins
call plug#begin()
Plug 'https://github.com/wakatime/vim-wakatime' " wakatime plugin
Plug 'https://github.com/github/copilot.vim' " Copilot
Plug 'https://github.com/vim-scripts/Gist.vim' " Gits plugin
Plug 'https://github.com/folke/todo-comments.nvim' " Highlight todo comments
Plug 'https://github.com/tpope/vim-surround' " Surround
Plug 'https://github.com/tpope/vim-commentary' " Commenting gcc &gc
Plug 'https://github.com/preservim/nerdtree' " File tree
Plug 'https://github.com/preservim/tagbar' " Tagbar
Plug 'https://github.com/terryma/vim-multiple-cursors' " Multiple cursors
Plug 'https://github.com/vim-airline/vim-airline' " Status bar theme
call plug#end()

" NERDTree keybindings
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' LN '
let g:airline_symbols.colnr = ' CN '