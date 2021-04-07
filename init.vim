set nu
set fileencodings=utf-8,ucs-bom,gbk,gb2312,cp936
set termencoding=utf-8
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set laststatus=2




if has('syntax')
	syntax enable
endif

set background=dark



" * Plugin Install *

call plug#begin('~/.config/nvim/plug')


Plug 'junegunn/vim-easy-align'

" Plug 'jiangmiao/auto-pairs'


" * Complete Framework *

Plug 'neoclide/coc.nvim', {'branch': 'release'}




""" Beautify Plugins

Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

call plug#end()


" colorscheme inkstained
"
" let g:deoplete#enable_at_startup = 1


" let g:rustfmt_autosave = 1

" let $RUST_SRC_PATH='.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
" 
" let g:racer_experimental_completer = 1
" let g:racer_insert_paren = 1


" **
" ** COC config
" **
" coc 扩充
let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-vimlsp', 'coc-marketplace', 'coc-yaml', 'coc-tabnine', 'coc-toml', 'coc-syntax', 'coc-pairs', 'coc-rust-analyzer', 'coc-metals', 'coc-cmake', 'coc-java', 'coc-sh', 'coc-clangd', 'coc-python', 'coc-xml', 'coc-gocode']


set hidden

set updatetime=100
set shortmess+=c


" *** Enable tab complete

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" ctrl-space 补全
inoremap <silent><expr> <c-space> coc#refresh()

" enter 补全代码片段
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" normal mode [ ]跳转诊断信息
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" normal mode 跳转代码定义、实现、类型定义
" gd = go definition
" gy = go type definition
" gi = go implementation
" gr = go references
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" K 调用文档
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" 相同字段 高亮
autocmd CursorHold * silent call CocActionAsync('highlight')

" 字段 重命名 space-rn
nmap <leader>rn <Plug>(coc-rename)

" space-f 格式化
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" space-a 代码选项
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)


" lightline 样式配置
let g:lightline = {
	\ 'colorscheme': 'PaperColor',
	\ 'active': {
	\		'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'tabline': {
	\		'left': [ ['buffers'] ],
	\		'right': [ ['close'] ]
    \ },
    \ 'component_expand': {
    \		'buffers': 'lightline#bufferline#buffers'
    \ },
    \ 'component_type': {
    \		'buffers': 'tabsel'
    \ }
\ }
