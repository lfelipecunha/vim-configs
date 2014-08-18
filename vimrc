"enble syntax
syntax on
"enable lines numbers
set nu
"enable ruler
set ruler
"enable auto indentation
set ai

"set color scheme
colorscheme wombat256mod

set wrap

"set search highlights
set is hls ic scs magic

"change tabs to spaces
set expandtab
"set tab width
set tabstop=4
"set indentation width
set shiftwidth=4
"set tab behavior to enable backspace behavior
set softtabstop=4
"set text 'limit'
set colorcolumn=120

set fileformat=unix

"enable auto save
set autowrite

"enable all function of mouse
set mouse=a

"enable another syntax into php files
let php_sql_query = 1
let php_parent_error_close = 1
let php_parent_error_open = 1
let php_htmlInStrings = 1

"enable auto complete
if has("autocmd") && exists("+omnifunc")
autocmd Filetype *
	    \	if &omnifunc == "" |
	    \		setlocal omnifunc=syntaxcomplete#Complete |
	    \	endif
endif

"map backspace to clean searchs highlights
map <BS> :noh<cr>

"function to remove extra spaces
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
"call function before file save
autocmd BufWrite * :call DeleteTrailingWS()

"plugin to documentation of php
source ~/.vim/php-doc.vim
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR>

"show the invisible chars
set list
set listchars=tab:>-,trail:·,eol:$,extends:>

"Config to keep text selected on <, >, TAB and SHIF+TAB
vnoremap < <gv
vnoremap > >gv
vmap <TAB> >
vmap <S-TAB> <

"Map to use xclip to copy to clipboard when it's not possible. OBS: Need install xclip
"vmap "+y y<CR> :call system('echo '.shellescape(@").' \| xclip -f -sel clip')<CR>
"map "+p :r!xclip -o -sel clip<CR>

