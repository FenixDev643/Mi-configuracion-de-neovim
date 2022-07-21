" ==          NEOVIM 0.6.0 CONFIG     ==
" ==          by FenixDEV             ==


set encoding=UTF-8
set number
set nowrap
set mouse=a " allow mouse
set title
set expandtab
set cursorline  " highlits the current line
set termguicolors

call plug#begin('~/AppData/Local/nvim/Plugins')
" cool tree
Plug 'preservim/nerdtree'

" icons for the tree, requires NerdFont
Plug 'ryanoasis/vim-devicons'

" auto pairs () [] {}
Plug 'jiangmiao/auto-pairs'

" snippets
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" coc snippets
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" my theme
Plug 'sainnhe/sonokai'
Plug 'tribela/vim-transparent'

" typescript support
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'

" file searcher
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" color preview
Plug 'norcalli/nvim-colorizer.lua'

call plug#end()

" color preview setup
lua require'colorizer'.setup()

"airline y theme config
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='biogoo'
let g:airline#extensions#tabline#formatter = 'unique_tail'

colorscheme sonokai 

" == KEYS SHORTCUTS ==

nnoremap <C-t> :NERDTreeToggle<CR>

nnoremap <S-Left> :tabN<CR>
nnoremap <S-Right> :tabn<CR>

nnoremap <S-Down> :tabclose<CR>

nnoremap <S-Up> :q<CR>

nnoremap <C-s> :w<CR>
nnoremap <C-z> :u<CR>

nnoremap <C-f> :Telescope find_files<CR>

nnoremap <S-t> :terminal<CR>

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use D to show documentation in preview window.
nnoremap <silent> D :call ShowDocumentation()<CR>
nnoremap <C-d> :CocList diagnostics<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('D', 'in')
  endif
endfunction

" typescript support
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
