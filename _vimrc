set langmenu=en_US
let $LANG= 'en_US'
"字体与大小
set guifont=Consolas:h12
"set langmenu=zh_CN
"let $LANG = 'zh_CN.UTF-8'
let autosave=30
set autowrite
set encoding=utf-8
"以最大化的方式打开
au GUIEnter * simalt ~x
set autoindent
set fileencodings=utf-8,chinese,latin-1
set fileencoding=utf-8
let mapleader=","

vmap <C-c> "+y
noremap <leader>p "+p
noremap <leader>P "+P
noremap <leader>del :%g /^\s*/d<CR>
" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set bs=2
set nocompatible
filetype off
" incremental search
set incsearch
" highlighted search results
set hlsearch
set ignorecase
set smartcase
set number
set relativenumber
"map <leader>px :0%!xmllint % --format<CR>
nmap <leader>del :%g /^\s*$/d<CR>
autocmd BufEnter * silent! lcd %:p:h
set ls=2

nmap <leader>h ^
nmap <leader>l $
nmap G Gzz
nmap n nzz
nmap N Nzz
nmap } }zz
nmap { {zz

"""""""""""""""""""""""""""""" 以下是插件安装 """"""""""""""""""""""""""""""
let vim_plug_just_installed = 0 "vim初次安装标识
let vim_plug_path = expand('~/vimfiles/bundle/Vundle.vim/autoload/vundle.vim')
if !filereadable(vim_plug_path)
    "配置vim缓存文件的位置
    set directory=~/vimfiles/dirs/tmp     " directory to place swap files in
    set backup                        " make backup files
    set backupdir=~/vimfiles/dirs/backups " where to put backup files
    set undofile                      " persistent undos - undo after you re-open the file
    set undodir=~/vimfiles/dirs/undos
    set viminfo+=n~/vimfiles/dirs/viminfo
    if !isdirectory(&backupdir)
        call mkdir(&backupdir, "p")
    endif
    if !isdirectory(&directory)
        call mkdir(&directory, "p")
    endif
    if !isdirectory(&undodir)
        call mkdir(&undodir, "p")
    endif
	let vim_plug_just_installed = 1
    echo "Installing Vim-plug..."
	echo ""
	cd $USERPROFILE
	!git clone https://github.com/VundleVim/Vundle.vim.git ./vimfiles/bundle/Vundle.vim
    "!curl -fLo vimfiles/bundle/Vundle.vim --create-dirs https://github.com/VundleVim/Vundle.vim
endif

if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

set rtp+=~/vimfiles/bundle/Vundle.vim
call vundle#begin('~/vimfiles/bundle/')

" Override configs by directory 
"Plugin 'arielrossanigo/dir-configs-override.vim'
Plugin 'VundleVim/Vundle.vim'
"" Better file browser
Plugin 'scrooloose/nerdtree'
"" Code commenter
Plugin 'scrooloose/nerdcommenter'
"" Class/module browser 依赖cTag，而且是显示文档结构，不常用
"Plugin 'majutsushi/tagbar'
" Code and files fuzzy finder
Plugin 'ctrlpvim/ctrlp.vim'
" Extension to ctrlp, for fuzzy command finder
Plugin 'fisadev/vim-ctrlp-cmdpalette'
" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Terminal Vim with 256 colors colorscheme
" Consoles as buffers
"Plugin 'rosenfeld/conque-term'
" Autoclose
Plugin 'Townk/vim-autoclose'
" Indent text object
Plugin 'michaeljsmith/vim-indent-object'
" Indentation based movements
Plugin 'jeetsukumaran/vim-indentwise'
" Python autocompletion, go to definition.
Plugin 'davidhalter/jedi-vim'
" Better autocompletion
"http://blog.csdn.net/dark_tone/article/details/52926394
"comparation between youcompleteme and neocomplete
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
" Snippets manager (SnipMate), dependencies, and snippets repo
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'
Plugin 'garbas/vim-snipmate'
" Automatically sort python imports
Plugin 'fisadev/vim-isort'
" Python and other languages code checker
Plugin 'scrooloose/syntastic'
" Ack code search (requires ack installed in the system)
Plugin 'mileszs/ack.vim'
Plugin 'Yggdroot/indentLine'
if has('python')
    " YAPF formatter for Python
    Plugin 'pignacio/vim-yapf-format'
endif

" Search results counter
Plugin 'vim-scripts/IndexedSearch'
" XML/HTML tags navigation
Plugin 'vim-scripts/matchit.zip'
" Gvim colorscheme
Plugin 'vim-scripts/Wombat'
"
" 多光标选中编辑
" " multiplecursors
Plugin 'terryma/vim-multiple-cursors'
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Tell vim-Plugin we finished declaring Pluginins, so it can load them
"
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction

"Plugin 'tmhedberg/simpylfold'
Plugin 'altercation/vim-colors-solarized'
Plugin 'yegappan/mru'
Plugin 'tsaleh/vim-align'
Plugin 'python-mode/python-mode'
Plugin 'wikitopian/hardmode'
Plugin 'ianva/vim-youdao-translater'
call vundle#end()

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PluginInstall
endif
filetype plugin on

filetype indent on

"split navigations
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>


" tab length exceptions on some file types
autocmd FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType htmldjango setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4

"syntax highlight on
syntax on

" tab navigation mappings
map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm 
map tt :tabnew 
map ts :tab split<CR>
map <C-S-Right> :tabn<CR>
imap <C-S-Right> <ESC>:tabn<CR>
map <C-S-Left> :tabp<CR>
imap <C-S-Left> <ESC>:tabp<CR>
"仅作用于命令模式 （cab）
cab nt NERDTree


" navigate windows with meta+arrows
map <M-l> gt
map <M-h> gT

" old autocomplete keyboard shortcut
imap <C-J> <C-X><C-O>

" Comment this line to enable autocompletion preview window
" (displays documentation related to the selected completion option)
" Disabled by default because preview makes the window flicker
set completeopt-=preview

" save as sudo
ca w!! w !sudo tee "%"

colorscheme solarized

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" better backup, swap and undos storage
set directory=~/vimfiles/dirs/tmp     " directory to place swap files in
set backup                        " make backup files
set backupdir=~/vimfiles/dirs/backups " where to put backup files
set undofile                      " persistent undos - undo after you re-open the file
set undodir=~/vimfiles/dirs/undos
set viminfo+=n~/vimfiles/dirs/viminfo

""######################python mode############################################
let g:pymode_folding = 0
"Turn off plugin's warnings                                 *'g:pymode_warnings'*
let g:pymode_warnings = 0
"Trim unused white spaces on save                   *'g:pymode_trim_whitespaces'*
let g:pymode_trim_whitespaces = 1

let g:pymode_rope_autoimport = 1
let g:pymode_rope_autoimport_modules = ['os', 'shutil', 'datetime']
let g:pymode_syntax = 0
let g:pymode_lint_on_write = 1
let g:pymode_lint_on_fly = 0

" NERDTree ----------------------------- 

" toggle nerdtree display
map <F3> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>
" don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\.zip$', '\.jpg$', '\.bmp$', '\.png$','\.pptx$', '\.docx$','\.exe$', '\.xls$']


" CtrlP ------------------------------

" file finder mapping
let g:ctrlp_map = ',e'
" tags (symbols) in current file finder mapping
"nmap ,g :CtrlPBufTag<CR>
" tags (symbols) in all files finder mapping
"nmap ,G :CtrlPBufTagAll<CR>
" general code finder in all files mapping
nmap <leader>f :CtrlPLine<CR>
" recent files finder mapping
nmap <leader>m :CtrlPMRUFiles<CR>
" commands finder mapping
"nmap ,c :CtrlPCmdPalette<CR>
" to be able to call CtrlP with default search text
function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    execute ':CtrlP' . a:ctrlp_command_end
    call feedkeys(a:search_text)
endfunction
" same as previous mappings, but calling with current word as default text
nmap <leader>wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
nmap <leader>wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
nmap <leader>wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
nmap <leader>we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
nmap <leader>pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
nmap <leader>wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
nmap <leader>wc :call CtrlPWithSearchText(expand('<cword>'), 'CmdPalette')<CR>
" don't change working directory
let g:ctrlp_working_path_mode = 0
" ignore these files and folders on file finder
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules)$',
  \ 'file': '\.pyc$\|\.pyo$',
  \ }
let g:ctrlp_mruf_max = 20
" Syntastic ------------------------------

" show list of errors and warnings on the current file
nmap <leader>e :Errors<CR>
" check also when just opened the file
let g:syntastic_check_on_open = 1
" don't put icons on the sign column (it hides the vcs status icons of signify)
let g:syntastic_enable_signs = 0
" custom icons (enable them if you use a patched font, and enable the previous 
" setting)
"let g:syntastic_error_symbol = '?'
"let g:syntastic_warning_symbol = '?'
"let g:syntastic_style_error_symbol = '?'
"let g:syntastic_style_warning_symbol = '?'

" Jedi-vim ------------------------------

" All these mappings work only for python code:
" Go to definition
let g:jedi#goto_command = ',d'
" Find ocurrences
let g:jedi#usages_command = ',o'
" Find assignments
let g:jedi#goto_assignments_command = ',a'
" Go to definition in new tab
nmap ,D :tab split<CR>:call jedi#goto()<CR>

" NeoComplete ------------------------------

" most of them not documented because I'm not sure how they work
" (docs aren't good, had to do a lot of trial and error to make 
" it play nice)
let g:acp_enableAtStartup = 1
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_ignore_case = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3 
let g:neocomplete#auto_completion_start_length = 1
let g:neocomplete#min_keyword_length = 3
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()

" Autoclose ------------------------------

" Fix to let ESC work as espected with Autoclose plugin
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227


" mapping
nmap  -  <Plug>(choosewin)
" show big letters
let g:choosewin_overlay_enable = 1

" Airline ------------------------------

let g:airline_powerline_fonts = 0
let g:airline_theme = 'molokai'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
"翻译-------------------- 
vnoremap <silent> <C-T> :<C-u>Ydv<CR>
nnoremap <silent> <C-T> :<C-u>Ydc<CR>
noremap <leader>yd :<C-u>Yde<CR>

autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"  
autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m  
"autocmd BufRead *.py nmap <F5> :!python3 %<CR>  
autocmd BufRead *.py nmap <F5> :PymodeRun<CR>  
autocmd BufRead *.py nmap <F6> :make<CR>  

