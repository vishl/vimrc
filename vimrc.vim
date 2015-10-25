"Vundle configuration
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'vishl/vim-snippets'

Plugin 'kchmck/vim-coffee-script'

Plugin 'tpope/vim-commentary'

Plugin 'cakebaker/scss-syntax.vim'

Plugin 'yssl/QFEnter'

Bundle 'lukaszkorecki/CoffeeTags'

Plugin 'keithbsmiley/swift.vim'

"Plugin 'kballard/vim-swift'

Plugin 'mxw/vim-jsx'

Plugin 'tpope/vim-fugitive'

Plugin 'pangloss/vim-javascript'

"Plugin 'bling/vim-airline' errors with tagbar???

Plugin 'majutsushi/tagbar'

Plugin 'justinmk/vim-ipmotion'

Plugin 'briancollins/vim-jst'

Plugin 'kien/ctrlp.vim'

" YouCompleteMe
" this thing is useless and buggy
"Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
syntax enable
" End Vundle


"pathogen plugin for installing plugins..or something
"if exists("pathogen#infect")
    call pathogen#infect()
"endif
"

" Youcompleteme config
let g:ycm_register_as_syntastic_checker=0


" Ultisnips Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<c-l>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"



syn on
set t_Co=256 "256 colors
colo wombat256
set ts=2 sw=2 sts=2 et
set nowrap
set tw=0
autocmd filetype objcpp set filetype=objc
autocmd filetype ruby,html,jst,javascript,less,css,scss,coffee set nowrap ts=2 sw=2 sts=2 tw=0
autocmd filetype ruby,haml,javascript set nowrap
autocmd filetype text set tw=80 wrap
"count hyphen as part of a word (mostly for html/css)
autocmd filetype ruby,html,jst,javascript,less,css,scss set iskeyword+=-
autocmd filetype objc set ts=4 sw=4 sts=4

set linebreak
set nobackup
set autoindent
set nocindent
set incsearch
set hlsearch
set ru
set showbreak=>
set virtualedit=block
set modeline
set modelines=3
"enable mouse in terminal
set mouse=a

"No toolbar
set guioptions-=T

"rails-vim puts a bunch of stupid balloons everywhere. Turn them off
"set noballooneval

map ,tag :!ctags -R .<CR>
map <C-A> :TagbarToggle <CR>

"Fugitive settings
map <C-G> :Gstatus<CR>

"manual syntastic
let g:syntastic_check_on_wq = 0
" let g:syntastic_mode_map = { 'mode': 'passive' }
map <C-B> :SyntasticCheck<CR>

"statusline
set statusline=%t%h%m%r%y%{fugitive#statusline()}%-10.3n%=%l,%c/%L\ %P
set laststatus=2

"autocmd filetype make set noet
"spellcheck
iab shrot short
iab yeild yield

filetype on
filetype indent on
filetype plugin on
set ofu=syntaxcomplete#Complete

"i never use this command and it always gets fired accidentally
noremap K k

"c-n is a useless command anyways
map <C-n> :nohl<CR>

"grep/find command
function! Fgrepfn(search, fname)
    silent exe "grep -e ".a:search." `find . -name ".a:fname."`"
    cwindo
endfunction
command! -nargs=* Fgrep call Fgrepfn(<f-args>)

command! -range -bar Synth <line1>,<line2>s/^.*\s\*\?\(\S\+\);$/@synthesize \1 = _\1;/<BAR>nohl

"remap / in visual mode to search for what's under the cursor 
vmap / y/<C-R>"<CR>
"use the lvim command to vimgrep for the thing under the cursor (only searches
"files of the same time; also allows editing of the command if you do
":lvim<space>)
cabbrev fif
      \ noautocmd vimgrep /\<lt><C-R><C-W>\>/gj
      \ **/*<C-R>=(expand("%:e")=="" ? "" : ".".expand("%:e"))<CR>
      \ <Bar> cwindo
      \ <C-Left><C-Left><C-Left>


"don't put # comments in column 0.. what a stupid feature
inoremap # X#

"some formatting stuff
autocmd BufRead *.C set filetype=cpp
autocmd BufRead *.sm set filetype=cpp
autocmd BufRead *.h++ set filetype=cpp
autocmd filetype c,cpp,java,python,perl,javascript set nowrap cindent
autocmd filetype yaml set nocindent
au BufNewFile,BufRead *.less set filetype=less
au filetype less set smartindent
au filetype less set nocindent

"Don't automatically comment when you press enter after //
autocmd filetype c,cpp,java,javascript,objc set comments-=://
autocmd filetype c,cpp,java,javascript,objc set comments+=f://

"c++ comments in obj
autocmd filetype objc set commentstring=//\ %s

"fold functions, etc
autocmd filetype cpp,java,ruby,eruby,haml,jst,javascript set fdm=indent foldcolumn=2 foldlevel=99

"autocomment (ctl+j/ctl+k)
"autocmd filetype ruby,perl,yaml vmap <C-j> :s/^/#/<RETURN>:nohl<RETURN>
"autocmd filetype ruby,perl,yaml vmap <C-k> :s/^#//<RETURN>:nohl<RETURN>
"autocmd filetype ruby,perl,yaml map <C-j> :s/^/#/<RETURN>:nohl<RETURN>
"autocmd filetype ruby,perl,yaml map <C-k> :s/^#//<RETURN>:nohl<RETURN>
nmap ,c gcc
nmap ,u gcc
vmap ,c gc
vmap ,u gc
" map ,c :call Comment() <CR>
" map ,u :call Uncomment() <CR>
"comment boxes (ctl+b)
autocmd filetype cpp,java,javascript,objc,swift map ,b O/<ESC>79A*<ESC>o<ESC>o<ESC>77A*<ESC>a/<ESC>0kA 
"autocmd filetype cpp,java,javascript,objc imap <C-b> /<ESC>79A*<ESC>o<ESC>o<ESC>77A*<ESC>a/<ESC>0kA 
"comment lines (ctl+l)
autocmd filetype cpp,java,javascript,objc,swift map ,l O/<ESC>79A/<ESC>45hR 
"autocmd filetype cpp,java,javascript,objc imap <C-l> /<ESC>79A/<ESC>45hR 
autocmd filetype ruby map ,l <ESC>80a#<ESC>==35lR
"autocmd filetype ruby imap <C-l> <ESC>80a#<ESC>==35lR
autocmd filetype css,less map ,l a/<ESC>80a*<ESC>a/<ESC>==35lR
"autocmd filetype css,less imap <C-l> <ESC>a/<ESC>80a*<ESC>a/<ESC>==35lR

"turn a prototype into a function stub
autocmd filetype c,cpp,objc vmap ,f :s/;/\r{\r}\r/<RETURN>:nohl<RETURN>

"autobuild
map ZM :w<RETURN>1gt:make<RETURN><RETURN>

"eruby/html shortcuts
autocmd filetype eruby,jst imap <C-u> <%%><ESC>hi


"autocmd filetype eruby,html,jst imap <C-k> <><ESC>i
"autocmd filetype eruby,html,jst imap <C-l> <ESC>f>a
autocmd filetype html,javascript,eruby,jst imap <C-s> <script type="text/javascript"></script><ESC>8hi

"ctrp ignores
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/Pods/*,*/build/*,*/*.framework/*,*/node_modules/*,scripts/bundles/*

"automatic syntax checking via syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:syntastic_enable_signs=1
"let g:syntastic_javascript_checker="jshint"

let g:EnhCommentifyMultiPartBlocks = 'yes' 

" let g:syntastic_json_jshint_exec='/usr/local/bin/jshint'
let g:syntastic_coffee_checkers = ['coffeelint', 'coffee']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_ruby_checkers = ['rubocop', 'mri']
" let g:syntastic_json_checkers = ['jshint']
let g:jsx_ext_required = 0 " Allow JSX in normal JS files



" Comments range (handles multiple file types)
function! Comment() range
  if &filetype == "php" || &filetype == "css" || &filetype == "less"
    execute ":" . a:firstline . "," . a:firstline . 's/^\(\s*\)/\1\/*/e'
    execute ":" . a:lastline . "," . a:lastline . 's/$/*\//e'
  elseif &filetype == "html" || &filetype == "xml" || &filetype == "xslt" || &filetype == "xsd" || &filetype=="jst" || &filetype=="erb"
    execute ":" . a:firstline . "," . a:firstline . 's/^\(\s*\)/\1<!--/e'
    execute ":" . a:lastline . "," . a:lastline . 's/$/-->/e'
  else
    if &filetype=="objc" || &filetype == "c" || &filetype == "java" || &filetype == "cpp" || &filetype == "cs" || &filetype=="javascript" || &filetype=="scss"
      let commentString = "//"
    elseif &filetype == "vim"
      let commentString = '"'
    else
      let commentString = "#"
    endif
    execute ":" . a:firstline . "," . a:lastline . 's,^,' . commentString . ',e'
  endif
endfunction

" Uncomments range (handles multiple file types)
function! Uncomment() range
  if &filetype == "php" || &filetype == "css"
    execute ":" . a:firstline . "," . a:firstline . 's/\\\*//e'
    execute ":" . a:lastline . "," . a:lastline . 's/\*\\//e'
  elseif &filetype == "html" || &filetype == "xml" || &filetype == "xslt" || &filetype == "xsd" || &filetype=="jst" || &filetype=="erb" || &filetype=="eruby"
    execute ":" . a:firstline . "," . a:firstline . 's/<!--//e'
    execute ":" . a:lastline . "," . a:lastline . 's/-->//e'
  else
    if &filetype=="objc" || &filetype == "c" || &filetype == "java" || &filetype == "cpp" || &filetype == "cs" || &filetype=="javascript" || &filetype=="scss"

      let commentString = "//"
    elseif &filetype == "vim"
      let commentString = '"'
    else
      let commentString = "#"
    endif
    execute ":" . a:firstline . "," . a:lastline . 's,'.commentString.',,e'
  endif
endfunction

let tlist_objc_settings = 'ObjectiveC;P:protocols;i:interfaces;types(...)'

let g:tagbar_ctags_bin = '~/bin/ctags'

 "add a definition for Objective-C to tagbar
let g:tagbar_type_objc = {
    \ 'ctagstype' : 'ObjectiveC',
    \ 'kinds'     : [
        \ 'i:interface',
        \ 'I:implementation',
        \ 'p:Protocol',
        \ 'm:Object_method',
        \ 'c:Class_method',
        \ 'v:Global_variable',
        \ 'F:Object field',
        \ 'f:function',
        \ 'p:property',
        \ 't:type_alias',
        \ 's:type_structure',
        \ 'e:enumeration',
        \ 'M:preprocessor_macro',
    \ ],
    \ 'sro'        : ' ',
    \ 'kind2scope' : {
        \ 'i' : 'interface',
        \ 'I' : 'implementation',
        \ 'p' : 'Protocol',
        \ 's' : 'type_structure',
        \ 'e' : 'enumeration'
    \ },
    \ 'scope2kind' : {
        \ 'interface'      : 'i',
        \ 'implementation' : 'I',
        \ 'Protocol'       : 'p',
        \ 'type_structure' : 's',
        \ 'enumeration'    : 'e'
    \ }
\ }

"let g:tagbar_type_objc = {
"  \ 'ctagstype': 'ObjectiveC',
"  \ 'ctagsargs': [
"    \ '-f',
"    \ '-',
"    \ '--excmd=pattern',
"    \ '--extra=',
"    \ '--format=2',
"    \ '--fields=nksaSmt',
"    \ '--options=' . expand('~/.vim/objctags'),
"    \ '--objc-kinds=-N',
"  \ ],
"  \ 'sro': ' ',
"  \ 'kinds': [
"    \ 'c:constant',
"    \ 'e:enum',
"    \ 't:typedef',
"    \ 'i:interface',
"    \ 'P:protocol',
"    \ 'p:property',
"    \ 'I:implementation',
"    \ 'M:method',
"    \ 'g:pragma',
"  \ ],
"\ }

let g:tagbar_type_js = {
    \ 'ctagstype' : 'JavaScript',
    \ 'kinds'     : [
        \ 'f:functions',
        \ 'c:classes',
        \ 'm:methods',
        \ 'p:properties',
        \ 'v:global variables',
    \ ],
    \ 'sro'        : ' ',
    \ 'kind2scope' : {
        \ 'f' : 'function',
        \ 'm' : 'method',
        \ 'c' : 'class',
    \ },
    \ 'scope2kind' :{
        \ 'function' : 'f',
        \ 'method'   : 'm',
        \ 'class'    : 'c',
    \},
\ }

"let g:ctrlp_custom_ignore = 'node_modules'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|meteor|(.*\.swp))$'

"ctrl+t opens quickfix items in a new tab
let g:qfenter_topen_map = ['<C-t>']

source $HOME/.vimrc.local
if filereadable(".vim.custom")
    so .vim.custom
endif
