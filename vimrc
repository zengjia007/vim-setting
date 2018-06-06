"pathogen
call pathogen#infect()

"vim-go
syntax enable
filetype plugin on
let g:go_disable_autoinstall = 0
let g:go_version_warning = 0

"go test current function
" "z是保存到register z，yiw貌似是获取当前词，:exe是执行，@z是获取z的内容，后续命令是以.连接
nmap <F9> :w<CR>"zyiw:exe "!go test -test.run ^".@z."$"<CR>

"GoReferrers
nmap <F10> :GoGuruScope code.byted.org/caijing_pay<CR>:GoReferrers<CR>

nmap <C-k> :vertical resize +5<CR>
nmap <C-j> :vertical resize -5<CR>

"tagbar
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
nmap <F2> :TagbarToggle<CR>

"nerdtree
map <C-n> :NERDTreeToggle<CR>

set autoindent
set tabstop=4
set shiftwidth=4
set number
set noswapfile
"colorscheme elflord
colorscheme molokai
"set tags=tags; "分号不能少
set autochdir
nnoremap <silent> <F12> :A<CR>
set smartcase     " ignore case if search pattern is all lowercase,
                  " case-sensitive otherwise
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

" 解决插入模式下delete/backspce键失效问题
set backspace=2

"tab {
  nnoremap <F3> :tabp<CR>
  nnoremap <F4> :tabn<CR>
  nnoremap <F5> :tabnew .<CR>
"}

"auto completion {
  "inoremap <TAB> <C-R>=SmartTabComplete()<CR>
  inoremap <CR>     <C-R>=SmartBraceComplete()<CR>
  "inoremap [     []<ESC>i
  "inoremap "     ""<ESC>i
  "inoremap '     ''<ESC>i
  "inoremap (     ()<ESC>i
  "nnoremap ;     $a;<ESC>

  "set complete-=i
  "set dictionary=/data/duxudong/public/dict
"}

"source .vimrc
nnoremap <F6> :source ~/.vimrc<CR>

"paste {
  nnoremap <F7> :set paste<CR>
  nnoremap <F8> :set nopaste<CR>
"}

function! SmartBraceComplete ()
  "\%23c means the 23 col char
  "getpos('.') will return an array, in which col stay at pos 2
  "\s means while char like space and tab
  return getline('.') =~ '{\%' . getpos('.')[2] . 'c\s*$' ? "\<CR>}\<ESC>O\<TAB>" : "\<CR>"
endfunction

"function! SmartTabComplete ()
"  return getline('.') =~ '^\s*' . '\%' . getpos('.')[2] . 'c' ? "\<TAB>" : "\<C-p>"
"endfunction
