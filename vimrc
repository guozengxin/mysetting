"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: 小新
" Email: gzxabcdefg@163.com
" 操作方式：
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=3000               "VIM记录的历史的行数
set helplang=cn                "VIM的帮助的语言

" 打开文件自动检测功能
filetype plugin on
filetype indent on

" 当文件从外部更改时可以自动更新文件
set autoread

" 设置一个map leader使可以作用更多的命令组合
let mapleader = ","
let g:mapleader = ","

" 快速保存
nmap <leader>w :w!<cr>

" 记住上次打开文件的位置
if has("autocmd")
	autocmd BufReadPost *
				\ if line("'\"") > 0 && line ("'\"") <= line("$") |
				\ exe "normal g'\"" |
				\ endif 
endif
let $NVIM_COC_LOG_LEVEL='debug'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM界面
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 屏幕滚动时在光标上下方保留7行
set so=5
" 在命令模式下使用 Tab 自动补全的时候，将补全内容使用一个漂亮的单行菜单形式显示出来
set wildmenu
" 补全窗口不额外显示一个窗口
set completeopt=longest,menuone
" 始终在右下角显示状态行
set ruler
" 设置命令行高度
set cmdheight=2
" 允许在有未保存的修改时切换缓冲区
set hidden 
" 设置退格键的模式：eol删除上一行，start删除此次插入之前的内容，indent删除自动缩进的内容
set backspace=eol,start,indent
" 设置折返上一行或下一行时允许的快捷键：左右方向键, h和l键
set whichwrap+=<,>,h,l
" 搜索时忽略大小写
set ignorecase
" 搜索时关键词出现一个大字字母时才区分大小写
set smartcase
" 高亮搜索的内容
set hlsearch
" 设置增量查找
set incsearch
" 设置当运行宏时不重绘(使运行速度更快)
set lazyredraw
" 查找时的magic设置，查看:h magic
set magic
" 高亮显示匹配的括号
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" 禁止报警声
set noerrorbells
set novisualbell
" 可视铃声
set t_vb=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 颜色和字体
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable "Enable syntax hl

" 设置字体
set gfn=Monospace\ 10
set shell=/bin/bash
" 设置配色模式，背景色
set background=dark
" colorscheme zellner
colorscheme default
" 开启256颜色
set t_Co=256
" 设置默认无行号
set nonu
set updatetime=300
" 设置内部编码
set encoding=utf-8
" 终端显示编码
set termencoding=utf-8
" 设置可识别的文件编码
set fileencodings=utf-8,gb18030,cp936,ucs-bom,big5,euc-jp,euc-kr,latin1
try
    lang en_US
catch
endtry
" 默认的文件类型
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 文件、备份和undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 关闭备份
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 文本、制表符和缩进
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自动缩进每一步使用的空白数目
set shiftwidth=4
" 设置文件中tab表示的空格数
set tabstop=4
set expandtab
set smarttab
set softtabstop=4
" 设置linebreak，使VIM在文件中空白的地方折行
set linebreak
" 设置文件宽度，0表示不限制
set textwidth=0
" 开启行限制
" set colorcolumn=+1
" highlight ColorColumn ctermbg=240 guibg=#2c2d27
" 设置自动缩进
set autoindent
" 开户新行的采用自动缩进 
set si
" 大于的一行的文本会换行显示
set wrap
" 映射0为^
map 0 ^


""""""""""""""""""""""""""""""
" => vundle插件安装
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'nvie/vim-flake8'
Bundle 'fatih/vim-go'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Bundle 'scrooloose/nerdtree'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

" Bundle 'Valloric/YouCompleteMe'
" Plugin 'Yggdroot/indentLine'
" Bundle 'othree/html5.vim'
" Bundle 'jistr/vim-nerdtree-tabs'
" Bundle 'chase/vim-ansible-yaml'
" Bundle 'chilicuil/vim-sml-coursera'
" Bundle 'solarnz/thrift.vim'
" Bundle 'minibufexplorerpp'
" Bundle 'scrooloose/syntastic'
" Bundle 'bufexplorer.zip'
" Bundle 'majutsushi/tagbar'
" Bundle 'terryma/vim-multiple-cursors'
" Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plugin 'junegunn/fzf.vim'


""""""""""""""""""""""""""""""
" => coc-vim设置
""""""""""""""""""""""""""""""
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>
nmap <leader>rn <Plug>(coc-rename)
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


""""""""""""""""""""""""""""""
" => fzf-vim设置
""""""""""""""""""""""""""""""
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'right': '~40%' }

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
map <leader>ca :FZF ~/<cr>
map <leader>cl :FZF<cr>

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)


""""""""""""""""""""""""""""""
" => Visual模式相关
""""""""""""""""""""""""""""""
" 在visual模式按下*或#会查找当前选中的部分
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" From an idea by Michael Naumann
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 在窗口之间移动时，采用此映射
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" 在窗口之间移动
" map <right> :bn<cr>
" map <left> :bp<cr>
map <right> gt
map <left> gT

" tab快捷键
map <leader>tn :tabnew! %<cr>
map <leader>te :tabedit 
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 


""""""""""""""""""""""""""""""
" => 状态行
""""""""""""""""""""""""""""""
" 设置状态行总是显示
set laststatus=2
set statusline=\ %F%m%r%h\ %w\ \ Line:\ %l/%L

""""""""""""""""""""""""""""""
" => NERDTreeTab plugin
""""""""""""""""""""""""""""""
nmap <leader>tl <plug>NERDTreeToggle<CR>

""""""""""""""""""""""""""""""
" => 将tab转为4个空格的文件
""""""""""""""""""""""""""""""
autocmd FileType cfg,thrift,conf setlocal expandtab smarttab shiftwidth=4 softtabstop=4

let g:indentLine_char_list = ['┊', '|', '¦', '┆']


""""""""""""""""""""""""""""""
" => css 部分
""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead *.less set filetype=less
autocmd BufNewFile,BufRead *.scss set filetype=scss
autocmd FileType css,less,scss setlocal expandtab smarttab shiftwidth=2 softtabstop=2
autocmd FileType css set omnifunc=csscomplete#CompleteCSS


""""""""""""""""""""""""""""""
" => matlab 部分
""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead *.m set filetype=matlab
autocmd FileType matlab setlocal expandtab smarttab shiftwidth=4 softtabstop=4


""""""""""""""""""""""""""""""
" => Python部分
""""""""""""""""""""""""""""""
" 使flake8插件
let python_highlight_all = 1
au BufWritePost *.py call Flake8()

au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python inoremap <buffer> $r return 
au FileType python inoremap <buffer> $i import 
au FileType python inoremap <buffer> $p print 
au FileType python inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi
au FileType python map <buffer> <leader>1 /class 
au FileType python map <buffer> <leader>2 /def 
au FileType python map <buffer> <leader>C ?class 
au FileType python map <buffer> <leader>D ?def 
au FileType python setlocal expandtab smarttab shiftwidth=4 softtabstop=4

" 删除多余空白，在python中有用
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()


""""""""""""""""""""""""""""""
" => python-mode
""""""""""""""""""""""""""""""
let g:pymode = 1
let g:pymode_python = 'python'
let g:pymode_folding = 0
let g:pymode_indent = 1
let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'
let g:pymode_lint_on_write = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8']
let g:pymode_options_max_line_length = 200
let g:pymode_lint_ignore = "E231,E501,W601,E128"
let g:pymode_rope = 0
let g:pymode_options = 0


"""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.js set filetype=javascript
au FileType javascript setl fen
au FileType javascript setl nocindent

au FileType javascript imap <c-t> AJS.log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return 
au FileType javascript inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi


"""""""""""""""""""""""""""""""
" => Html部分
"""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.htm,*.html set filetype=html
au FileType html setlocal expandtab smarttab shiftwidth=2 softtabstop=2


"""""""""""""""""""""""""""""""
" => xml部分
"""""""""""""""""""""""""""""""
au FileType xml setlocal expandtab smarttab shiftwidth=2 softtabstop=2


"""""""""""""""""""""""""""""""
" => Golang部分
"""""""""""""""""""""""""""""""
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_gocode_propose_source = 0
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
let g:go_def_mapping_enabled = 0

au FileType go nmap <Leader>gs <Plug>(go-implements)
au FileType go nmap <Leader>gi <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>gr <Plug>(go-run)
au FileType go nmap <leader>gb <Plug>(go-build)
au FileType go nmap <leader>gt <Plug>(go-test)
au FileType go nmap <leader>gc <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>ge <Plug>(go-rename)


""""""""""""""""""""""""""""""
" => MRU插件，可以记录最近打开历史
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>

set tags=./.tags;,.tags;tags;../tags;../../tags;../../../tags;../../../../tags
