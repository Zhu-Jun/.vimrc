
function! myspacevim#init() abort
  let g:mapleader=","
  " let g:spacevim_localleader = ","
  " 默认python3.0
  let g:jedi#force_py_version=3
  let g:jedi#auto_close_doc=0
  let g:jedi#use_tabs_not_buffers=1

  let g:NERDTreeChDirMode = 2
  call SpaceVim#custom#SPC('nnoremap', ['f', 't'], 'echom "hello world"', 'test custom SPC', 1)
  let g:spacevim_enable_language_specific_leader=0
  let g:spacevim_filemanager             = 'nerdtree'

  set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
  set termencoding=utf-8
  set encoding=utf-8

  nnoremap <leader>nerd :NERDTree C:\Users\zhujun\<CR>
  nnoremap <leader>conf :e C:/Users/zhujun/.SpaceVim.d/autoload/myspacevim.vim<CR>
  vnoremap <leader>h ^
  inoremap <leader>h <ESC>^i
  nnoremap <leader>h ^
  nnoremap <leader>p "+p
  nnoremap <leader>l $
  nnoremap <leader>noh :noh<CR>
  nnoremap <leader>an :set ft=android_log<CR>
  nnoremap <leader>map ggVG=
  nnoremap <leader>s :w <CR>
  nnoremap Y y$
  inoremap <leader>l <END>
  inoremap <c-a> <ESC>^i
  vnoremap <leader>l $
  nnoremap <leader>qq :q<CR>

  nnoremap <c-j> <c-w><c-j>
  nnoremap <c-k> <c-w><c-k>
  nnoremap <c-l> <c-w><c-l>
  nnoremap <c-h> <c-w><c-h>
  nnoremap G Gzz
  nnoremap n nzz
  nnoremap N Nzz
  nnoremap } }zz
  nnoremap { {zz
  inoremap <C-f> <Right>
  inoremap <C-b> <Left>
  inoremap <C-p> <Up>
  inoremap <C-n> <Down>
  inoremap <C-d> <Del>

  "no <down> ddp 
  "no <up> ddkP


  vnoremap <silent> <C-T> :<C-u>Ydv<CR>
  vnoremap <C-c> "+y
  nnoremap <silent> <C-T> :<C-u>Ydc<CR>
  noremap <leader>yd :<C-u>Yde<CR>


  " tab length exceptions on some file types
  autocmd FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=4
  autocmd FileType htmldjango setlocal shiftwidth=4 tabstop=4 softtabstop=4
  autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4


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

  " navigate windows with meta+arrows
  map <M-Right> <c-w>l
  map <M-Left> <c-w>h
  map <M-Up> <c-w>k
  map <M-Down> <c-w>j
  imap <M-Right> <ESC><c-w>l
  imap <M-Left> <ESC><c-w>h
  imap <M-Up> <ESC><c-w>k
  imap <M-Down> <ESC><c-w>j
  "
  let g:ctrlp_map = ',e'
  " tags (symbols) in current file finder mapping
  nmap ,g :CtrlPBufTag<CR>
  " tags (symbols) in all files finder mapping
  nmap ,G :CtrlPBufTagAll<CR>
  " general code finder in all files mapping
  nmap ,f :CtrlPLine<CR>
  " recent files finder mapping
  nmap ,m :CtrlPMRUFiles<CR>
  " commands finder mapping
  nmap ,c :CtrlPCmdPalette<CR>
  " to be able to call CtrlP with default search text
  function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    execute ':CtrlP' . a:ctrlp_command_end
    call feedkeys(a:search_text)
  endfunction
  " same as previous mappings, but calling with current word as default text
  nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
  nmap ,wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
  nmap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
  nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
  nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
  nmap ,wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
  nmap ,wc :call CtrlPWithSearchText(expand('<cword>'), 'CmdPalette')<CR>
  " don't change working directory
  let g:ctrlp_working_path_mode = 0
  " ignore these files and folders on file finder
  "let g:ctrlp_custom_ignore = {
  "":syn region logTime start=+^\d\{2}-\d\{2} \d\{2}:\d\{2}:\d\{2}\.\d\{3}+ end=+ +me=e-1
  "":syn region logError start=+E/+ end=+ +me=e-1
  "":syn region logWarn start=+W/+ end=+ +me=e-1
  "":syn region logInfo start=+I/+ end=+ +me=e-1
  "":syn region logDebug start=+D/+ end=+ +me=e-1

  ""hi def logError ctermfg=red
  ""hi def logWarn ctermfg=yellow
  ""hi def logInfo ctermfg=green
  ""hi def logDebug ctermfg=blue
  ""hi def logTime ctermfg=white ctermbg=blue
  noremap <leader>del :%g /^\s*$/d<CR>
  autocmd BufEnter * lcd %:p:h

  "autocmd BufEnter * if &modifiable | NERDTreeFind | wincmd p | endif
  "autocmd StdinReadPre * let s:std_in=1
  "autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif




endfunction
function! NERDTreeToggleInCurDir()
  " If NERDTree is open in the current buffer
  echom "hello"
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":NERDTreeClose"
  else
    if (expand("%:t") != '')
      exe ":NERDTreeFind"
    else
      exe ":NERDTreeToggle"
    endif
  endif
endfunction

function! myspacevim#after() abort
  nnoremap <silent> <F3> :call NERDTreeToggleInCurDir()<cr>
  nnoremap <leader>b :CtrlPBuffer<CR>
  nnoremap <leader><leader>l <Plug>(easymotion-overwin-line)
  let g:NERDTreeWinPos='left'
  let g:tagbar_left = 0

  autocmd VimEnter * unmap <c-e>
  autocmd BufRead *.log set ft=android_log
  set smartcase
  set ignorecase
  
  inoremap <C-e> <END>
  " augroup fmt
    " autocmd!
    " autocmd BufWritePre * undojoin | Neoformat
    " autocmd BufRead,BufWritePre *.py  undojoin | Neoformat! python yapf
  " augroup END
endfunction
" nnoremap <leader>nf :NERDTreeFind<cr>
