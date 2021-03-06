"-------------------------------------------------------------------------------
" General
"-------------------------------------------------------------------------------
let mapleader = ';'
imap jj <Esc>

"-------------------------------------------------------------------------------
" Clipboard (unix only)
" NOTE: win32 http://vim.wikia.com/wiki/Copy_filename_to_clipboard
"-------------------------------------------------------------------------------
nmap ,cs :let @*=expand("%")<CR>
nmap ,cl :let @*=expand("%:p")<CR>

"-------------------------------------------------------------------------------
" Command-T
"-------------------------------------------------------------------------------
nmap <silent> <leader>t :CommandT<cr>
nmap <silent> <leader>r :CommandTFlush<cr>:CommandT<cr>
nmap <silent> <leader>j :CommandTJump<cr>

"-----------------------------------------------------------------------------
" Navigations
"-----------------------------------------------------------------------------
vmap <c-k> 10k
nmap <c-k> 10k
vmap <c-j> 10j
nmap <c-j> 10j
" up
nmap k gk
vmap k gk
imap <c-k> <up>
cmap <c-k> <up>
" down
nmap j gj
vmap j gj
imap <c-j> <down>
cmap <c-j> <down>
" left
nmap h <left>
vmap h <left>
imap <c-h> <left>
cmap <c-h> <left>
" right
nmap l <right>
vmap l <right>
imap <c-l> <right>
cmap <c-l> <right>
" arrows
nmap <down> gj
nmap <up> gk
vmap <down> gj
vmap <up> gk
imap <down> <c-O>gj
imap <up> <c-O>gk
" beginning of line
nmap <s-h> <c-0>^
vmap <s-h> <c-0>^
" end of line
nmap <s-l> $
vmap <s-l> $
" CamelCase movement
map <silent> b <plug>CamelCaseMotion_b
map <silent> w <plug>CamelCaseMotion_w
map <silent> e <plug>CamelCaseMotion_e

"-----------------------------------------------------------------------------
" Save position while page up/down
"-----------------------------------------------------------------------------
nmap <pageup> <c-U><c-U>
imap <pageup> <c-O><c-U><c-O><c-U>
vmap <pageup> <c-U><c-U>
nmap <pagedown> <c-D><c-D>
imap <pagedown> <c-O><c-D><c-O><c-D>
vmap <pagedown> <c-D><c-D>

"-----------------------------------------------------------------------------
" Tabs
"-----------------------------------------------------------------------------
nmap <silent> <a-S-left> :tabmove -1<cr>
imap <silent> <a-S-left> <c-O>:tabmove -1<cr>
nmap <silent> <a-S-right> :tabmove +1<cr>
imap <silent> <a-S-right> <c-O>:tabmove +1<cr>

"-----------------------------------------------------------------------------
" Insert newlines
"-----------------------------------------------------------------------------
nmap <silent> <cr> o<Esc>
nmap <silent> <s-cr> O<Esc>

"-----------------------------------------------------------------------------
" Turn off highlighting and clear messages
"-----------------------------------------------------------------------------
nmap <silent> <space> :nohlsearch<Bar>:echo<cr>

"-----------------------------------------------------------------------------
" Moving selected block
"-----------------------------------------------------------------------------
vmap < <gv
vmap > >gv

"-----------------------------------------------------------------------------
" Copy/Paste
"-----------------------------------------------------------------------------
vnoremap <c-x> "+x
vnoremap <s-del> "+x

vnoremap <c-c> "+y
vnoremap <c-insert> "+y

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.

exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

imap <s-insert> <c-v>
vmap <s-insert> <c-v>
nmap <a-v> <c-v>
vmap <a-v> <c-v>

"-----------------------------------------------------------------------------
" Bubble single lines
"-----------------------------------------------------------------------------
nmap <c-up> [e
nmap <c-down> ]e

"-----------------------------------------------------------------------------
" Buffers
"-----------------------------------------------------------------------------
nmap <f3> :BuffergatorToggle<cr>

"-----------------------------------------------------------------------------
" RemoveTrailingSpaces
"-----------------------------------------------------------------------------
nmap <silent>,t :call RemoveTrailingSpaces()<cr>:echo 'trailing spaces have been removed'<cr>
function! RemoveTrailingSpaces()
  normal! mzHmy
  execute '%s/\t/  /ge'
  execute '%s/\s\+$//ge'
  normal! 'yzt`z
endfunction

"-------------------------------------------------------------------------------
" Generators
"-------------------------------------------------------------------------------
inoremap {{ {}<Esc>i
inoremap {{{ {{}}<Esc>hi
inoremap (( ()<Esc>i

"-------------------------------------------------------------------------------
" Quotes
"-------------------------------------------------------------------------------
"nmap <Leader>' cs"'
"nmap <Leader>" cs'"
"nmap <Leader>'' ciw'"<Esc>P
"nmap <Leader>'' ciw''<Esc>P
"nmap <Leader>'d daW"=substitute(@@,"'\\\|\"","","g")<CR>P

"-----------------------------------------------------------------------------
" rebuild syntax
"-----------------------------------------------------------------------------
map <F10> :syntax sync fromstart<cr>
