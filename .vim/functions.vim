"-----------------------------------------------------------------------------
" functions
"-----------------------------------------------------------------------------
function! VisualSearch(cmd)
  let l:old_reg=getreg('"')
  let l:old_regtype=getregtype('"')
  normal! gvy
  let @/='\V'.substitute(substitute(substitute(escape(@@, a:cmd.'\'), '^\_s\+', '\\s\\+', ''), '\_s\+$', '\\s\\*', ''), '\_s\+', '\\_s\\+', 'g')
  normal! gV
  call setreg('"', l:old_reg, l:old_regtype)
endfunction

function! RemoveTrailingSpaces()
  normal! mzHmy
"  execute '%s/^        /  /ge'
"  execute '%s/ /  /ge'
  execute '%s/\t/  /ge'
  execute '%s/\s\+$//ge'
  normal! 'yzt`z
endfunction

function! BackupDir()
  if has("win32")
    let l:backupdir=$HOME.'\.backup\'.substitute(expand('%:p:h'), ':', '', '')
  else
    let l:backupdir=substitute($HOME.'/.backup/'.substitute(expand('%:p:h'), ':', '', ''), '//', '/', '')
  endif

  if !isdirectory(l:backupdir)
    call mkdir(l:backupdir, 'p', 0700)
  endif

  let &backupdir=l:backupdir

  if has("win32")
    let &backupext=strftime('~%Y-%m-%d %H_%M_%S~')
  else
    let &backupext=strftime('~%Y-%m-%d %H:%M:%S~')
  endif
endfunction

function! InsertTabWordWrapper()
 let col = col('.') - 1
 if !col || getline('.')[col - 1] !~ '\k'
   return "\<tab>"
 else
   return "\<c-p>"
 endif
endfunction

function! InsertTabLineWrapper()
 let col = col('.') - 1
 if !col || getline('.')[col - 1] !~ '\k'
   return "\<tab>"
 else
   return "\<c-x>\<c-l>"
 endif
endfunction

function! InsertSnippetWrapper()
 let inserted = TriggerSnippet()
 if inserted == "\<tab>"
   return ";"
 else
   return inserted
 endif
endfunction

autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

"return '[\s]' if trailing white space is detected
"return '' otherwise
function! StatuslineTrailingSpaceWarning()
    if !exists("b:statusline_trailing_space_warning")
        if search('\s\+$', 'nw') != 0
            let b:statusline_trailing_space_warning = '[\s]'
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction


"return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction

"recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

"return '[&et]' if &et is set wrong
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let tabs = search('^\t', 'nw') != 0
        let spaces = search('^ ', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning =  '[mixed-indenting]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statusline_tab_warning = '[&et]'
        else
            let b:statusline_tab_warning = ''
        endif
    endif
    return b:statusline_tab_warning
endfunction

"recalculate the long line warning when idle and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_long_line_warning

"return a warning for "long lines" where "long" is either &textwidth or 80 (if
"no &textwidth is set)
"
"return '' if no long lines
"return '[#x,my,$z] if long lines are found, were x is the number of long
"lines, y is the median length of the long lines and z is the length of the
"longest line
function! StatuslineLongLineWarning()
    if !exists("b:statusline_long_line_warning")
        let long_line_lens = s:LongLines()

        if len(long_line_lens) > 0
            let b:statusline_long_line_warning = "[" .
                        \ '#' . len(long_line_lens) . "," .
                        \ 'm' . s:Median(long_line_lens) . "," .
                        \ '$' . max(long_line_lens) . "]"
        else
            let b:statusline_long_line_warning = ""
        endif
    endif
    return b:statusline_long_line_warning
endfunction

"return a list containing the lengths of the long lines in this buffer
function! s:LongLines()
    let threshold = (&tw ? &tw : 80)
    let spaces = repeat(" ", &ts)

    let long_line_lens = []

    let i = 1
    while i <= line("$")
        let len = strlen(substitute(getline(i), '\t', spaces, 'g'))
        if len > threshold
            call add(long_line_lens, len)
        endif
        let i += 1
    endwhile

    return long_line_lens
endfunction

"find the median of the given array of numbers
function! s:Median(nums)
    let nums = sort(a:nums)
    let l = len(nums)

    if l % 2 == 1
        let i = (l-1) / 2
        return nums[i]
    else
        return (nums[l/2] + nums[(l/2)-1]) / 2
    endif
endfunction

"visual search mappings
function! s:VSetSearch()
    let temp = @@
    norm! gvy
    let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>

" The idea is to delete something anywhere, then go select characters elsewhere, and hit g" to swap the delete characters with the newly selected ones.
function! s:SwapVisualWithCut()
  normal! `.``
  if line(".")==line("'.") && col(".") < col("'.")
    let c = col('.')
    normal! gvp```]
    let c = col('.') - c
    normal! ``
    :silent call cursor(line("."),col(".")+c)
    normal! P
  else
    normal! gvp``P
  endif
endfunction
vnoremap <silent> g" <esc>:call <sid>SwapVisualWithCut()<cr>

"jump to last cursor position when opening a file
"dont do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
    if &filetype !~ 'commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal! g`\""
            normal! zz
        endif
    end
endfunction

"define :HighlightLongLines command to highlight the offending parts of
"lines that are longer than the specified length (defaulting to 80)
command! -nargs=? HighlightLongLines call s:HighlightLongLines('<args>')
function! s:HighlightLongLines(width)
    let targetWidth = a:width != '' ? a:width : 79
    if targetWidth > 0
        exec 'match Todo /\%>' . (targetWidth) . 'v/'
    else
        echomsg "Usage: HighlightLongLines [natural number]"
    endif
endfunction

function! ToggleMatchParen()
  if exists("g:loaded_matchparen")
    :NoMatchParen
    :echo 'MatchParen plugin turned off'
  else
    :DoMatchParen
    :echo 'MatchParen plugin turned on'
  endif
endfunction

function! EnableDebugger()
  Rdebugger
  nnoremap <f5> :Rdebugger %<cr>
  inoremap <f5> <c-O>:Rdebugger %<cr>
  vnoremap <f5> <esc>:Rdebugger %<cr>
  nnoremap <s-f5> :call g:RubyDebugger.exit()<cr>
  inoremap <s-f5> <c-O>:call g:RubyDebugger.exit()<cr>
  vnoremap <s-f5> <esc>:call g:RubyDebugger.exit()<cr>
  nnoremap <f8> :call g:RubyDebugger.continue()<cr>
  inoremap <f8> <c-O>:call g:RubyDebugger.continue()<cr>
  vnoremap <f8> <esc>:call g:RubyDebugger.continue()<cr>
  nnoremap <f9> :call g:RubyDebugger.toggle_breakpoint()<cr>
  inoremap <f9> <c-O>:call g:RubyDebugger.toggle_breakpoint()<cr>
  vnoremap <f9> <esc>:call g:RubyDebugger.toggle_breakpoint()<cr>
  nnoremap <f10> :call g:RubyDebugger.next()<cr>
  inoremap <f10> <c-O>:call g:RubyDebugger.next()<cr>
  vnoremap <f10> <esc>:call g:RubyDebugger.next()<cr>
  nnoremap <f11> :call g:RubyDebugger.step()<cr>
  inoremap <f11> <c-O>:call g:RubyDebugger.step()<cr>
  vnoremap <f11> <esc>:call g:RubyDebugger.step()<cr>
  nnoremap <s-f11> :call g:RubyDebugger.finish()<cr>
  inoremap <s-f11> <c-O>:call g:RubyDebugger.finish()<cr>
  vnoremap <s-f11> <esc>:call g:RubyDebugger.finish()<cr>
endfunction

" NOTE: this functions don't work
" nnoremap <silent><leader>'  :<C-U>call <SID>ToggleQuote()<CR>
" nnoremap <silent><leader>"  :<C-U>call <SID>ToggleDoubleQuote()<CR>
" replacement for quotes
"function! s:ToggleQuote()
"    let q = searchpos("'", 'n', line('.'))
"    let qb = searchpos("'", 'bn', line('.'))
"    let dq = searchpos('"', 'n', line('.'))
"    let dqb = searchpos('"', 'bn', line('.'))

"    if q[0] > 0 && qb[0] > 0 && (dq[0] == 0 || dq[0] > q[0])
"        execute "normal mzcs'\"`z"
"    elseif dq[0] > 0 && dqb[0] > 0
"        execute "normal mzcs\"'`z"
"    endif
"endfunction

" replacement for double quotes
"function! s:ToggleDoubleQuote()
"    let q = searchpos('"', 'n', line('.'))
"    let qb = searchpos('"', 'bn', line('.'))
"    let dq = searchpos("'", 'n', line('.'))
"    let dqb = searchpos("'", 'bn', line('.'))

"    if q[0] > 0 && qb[0] > 0 && (dq[0] == 0 || dq[0] > q[0])
"        execute "normal mzcs\"'`z"
"    elseif dq[0] > 0 && dqb[0] > 0
"        execute "normal mzcs'\"`z"
"    endif
"endfunction
