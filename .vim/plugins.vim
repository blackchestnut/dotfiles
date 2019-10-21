call plug#begin('~/.vim/plugged')

" morr
"Plug 'morr/vim-ruby'

" my
" majutsushi/tagbar
" ngmy/vim-rubocop
" othree/javascript-libraries-syntax.vim
" plasticboy/vim-markdown
" saks/Specky
" vim-airline/vim-airline
" vim-airline/vim-airline-themes

Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'bkad/CamelCaseMotion'
Plug 'briancollins/vim-jst'
Plug 'cakebaker/scss-syntax.vim'
Plug 'digitaltoad/vim-pug'
Plug 'elixir-lang/vim-elixir'
Plug 'elzr/vim-json'
Plug 'fatih/vim-go'
Plug 'flazz/vim-colorschemes'
Plug 'henrik/vim-indexed-search'
Plug 'int3/vim-extradite'
Plug 'jparise/vim-graphql'
Plug 'kchmck/vim-coffee-script'
Plug 'keithbsmiley/rspec.vim'
Plug 'mhinz/vim-hugefile'
Plug 'slim-template/vim-slim'
Plug 'sstephenson/eco'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/grep.vim'
Plug 'vim-scripts/matchit.zip'

"-----------------------------------------------------------------------------
" javascript
"-----------------------------------------------------------------------------
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

"-----------------------------------------------------------------------------
" styles
"-----------------------------------------------------------------------------

Plug 'aunsira/macvim-light'
Plug 'davidklsn/vim-sialoquent'
Plug 'dim13/smyck.vim'
Plug 'hzchirs/vim-material'
Plug 'hzchirs/vim-material'
Plug 'lu-ren/SerialExperimentsLain'
Plug 'mom0tomo/dotfiles'
Plug 'nightsense/carbonized'
Plug 'nightsense/seabird'
Plug 'rakr/vim-one'
Plug 'rhysd/vim-color-spring-night'
Plug 'tomasr/molokai'
Plug 'zcodes/vim-colors-basic'

"-----------------------------------------------------------------------------
Plug 'posva/vim-vue'
"-----------------------------------------------------------------------------
au BufNewFile,BufRead *.vue setf vue
" https://github.com/posva/vim-vue#how-to-use-commenting-functionality-with-multiple-languages-in-vue-files
au FileType vue syntax sync fromstart

" Vim slows down when using this plugin How can I fix that?
let g:vue_pre_processors = ['pug', 'sass']

"-----------------------------------------------------------------------------
Plug 'tpope/vim-fugitive'
"-----------------------------------------------------------------------------
autocmd User fugitive
  \ if get(b:, 'fugitive_type', '') =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif
autocmd BufReadPost fugitive://* set bufhidden=delete
set diffopt+=vertical

" nnoremap <f5> :Gcommit<cr>
" inoremap <f5> <c-O>:Gcommit<cr>
" vnoremap <f5> <esc>:Gcommit<cr>

nnoremap <f6> :Gdiff<cr>
inoremap <f6> <c-O>:Gdiff<cr>
vnoremap <f6> <esc>:Gdiff<cr>

"-----------------------------------------------------------------------------
Plug 'ervandew/supertab'
"-----------------------------------------------------------------------------
let g:SuperTabDefaultCompletionType = '<C-n>'

"-----------------------------------------------------------------------------
Plug 'jeetsukumaran/vim-buffergator'
"-----------------------------------------------------------------------------
let g:buffergator_suppress_keymaps = 1
nnoremap <silent> <Leader>b :BuffergatorToggle<CR>

"-----------------------------------------------------------------------------
Plug 'wincent/command-t', {
  \   'do': 'cd ruby/command-t/ext/command-t && RBENV_VERSION=system ruby extconf.rb && make'
  \ }
"-----------------------------------------------------------------------------
let g:CommandTMaxHeight = 17
" let g:CommandTMaxFiles = 25000
let g:CommandTWildIgnore = &wildignore.".git,log,tmp,node_modules,*/public/assets,*/public/uploads,*/public/packs,*/public/packs-test,*/public/system,*/public/images,*/spec/vcr_cassettes"
let g:CommandTFileScanner = 'git'
let g:CommandTTraverseSC = 'pwd'
" let g:CommandTAlwaysShowDotFiles = 1
let g:CommandTMatchWindowReverse = 0
let g:CommandTMatchWindowAtTop = 0
let g:CommandTGitIncludeUntracked = 1

let g:CommandTAcceptSelectionCommand = 'e'
let g:CommandTAcceptSelectionTabCommand = 'tabe'
let g:CommandTAcceptSelectionSplitCommand = 'sp'
let g:CommandTAcceptSelectionVSplitCommand = 'vs'

" nmap <silent> <leader>t :tabe<cr>:CommandT<cr>
" nmap <silent> <leader>t :call <SID>SmartCommandT()<cr>
nmap <silent> <leader>r :CommandTFlush<cr>:CommandT<cr>
" nmap <silent> <leader>j :CommandTJump<CR>

nmap <f1> :CommandT<cr>

function! s:SmartCommandT()
  if bufname("%") == ""
    CommandT
  else
    tabe
    CommandT
  end
endfunction

" буферы закрываем всегда
" function! s:set_bufhidden()
  " if empty(&buftype)
    " setlocal bufhidden=wipe
  " endif
" endfunction

" autocmd! BufRead * call s:set_bufhidden()


"-----------------------------------------------------------------------------
" LustyExplorer
"-----------------------------------------------------------------------------
nmap <silent> <leader>l :LustyBufferGrep<cr>
" nmap <f4> :LustyBufferGrep<cr>

silent! unmap <leader>lf
silent! unmap <leader>lr
silent! unmap <leader>lb
silent! unmap <leader>lg
silent! unmap <leader>lj


"-----------------------------------------------------------------------------
Plug 'scrooloose/nerdtree'
"-----------------------------------------------------------------------------
map <silent> <leader>n :NERDTreeToggle<cr>
map <silent> <leader>N :NERDTreeFind<cr>
nmap <f2> :NERDTreeFind<cr>
nmap <f3> :NERDTreeToggle<cr>

let g:NERDTreeIgnore = ['node_modules']

"-----------------------------------------------------------------------------
" replacement for nerdcommenter that works for vue
Plug 'tyru/caw.vim'
Plug 'Shougo/context_filetype.vim'
"-----------------------------------------------------------------------------
map ,<space> <plug>(caw:hatpos:toggle)

"-----------------------------------------------------------------------------
Plug 'w0rp/ale'
"-----------------------------------------------------------------------------
" only linters from g:ale_linters are enabled
let g:ale_linters_explicit = 1

" hi ALEWarningSign guibg=#FDE1FD guifg=#0512FB gui=bold
" hi ALEErrorSign guibg=#F4DBDC guifg=#662529 gui=bold

" location list is populated by default -
" this might overwrite the contents of already
" opened location list (e.g., search results)
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0

let g:ale_sign_warning = 'W>'
let g:ale_sign_error = 'E>'

" https://github.com/w0rp/ale/issues/505
" to disable g:ale_lint_on_enter, it's necessary
" to disable g:ale_lint_on_filetype_changed as well
"let g:ale_lint_on_enter = 0
let g:ale_lint_on_filetype_changed = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'

let g:ale_linters = {
\   'elixir': ['credo'],
\   'javascript': ['eslint'],
\   'vue': ['eslint'],
\   'coffee': ['coffeelint'],
\   'ruby': ['rubocop']
\ }

au BufNewFile,BufRead *.rb nnoremap <silent> ,R :w<cr>:silent !rubocop --auto-correct %<cr>:edit!<cr>
au BufNewFile,BufRead *.js nnoremap <silent> ,R :w<cr>:silent !yarn run eslint --fix %<cr>:edit!<cr>
au BufNewFile,BufRead *.jsx nnoremap <silent> ,R :w<cr>:silent !yarn run eslint --fix %<cr>:edit!<cr>
au BufNewFile,BufRead *.vue nnoremap <silent> ,R :w<cr>:silent !yarn run eslint --fix %<cr>:edit!<cr>

"-------------------------------------------------------------------------------
Plug 'tpope/vim-rails'
"-------------------------------------------------------------------------------
nmap <Leader>, :A<cr>
nmap <Leader>v :AV<cr>
nmap gs :AV<cr>
" My variant:
"nmap gs :AV<cr><c-w><s-l>

" example projections: https://gist.github.com/henrik/5676109
let g:rails_projections = {
\   'app/*.rb': {
\     'alternate': 'spec/{}_spec.rb'
\   },
\   'app/admin/*.rb': {
\     'alternate': 'spec/controllers/admin/{}_controller_spec.rb'
\   },
\   'spec/controllers/admin/*_controller_spec.rb': {
\     'alternate': 'app/admin/{}.rb'
\   },
\   'config/locales/*ru.yml': {
\     'alternate': 'config/locales/{}en.yml'
\   },
\   'config/locales/*en.yml': {
\     'alternate': 'config/locales/{}ru.yml'
\   }
\ }
" My variant:
"let g:rails_projections = {
"\   'app/admin/*.rb': {
"\     'alternate': 'spec/controllers/admin/{}_controller_spec.rb'
"\   },
"\   'spec/controllers/admin/*_controller_spec.rb': {
"\     'alternate': 'app/admin/{}.rb'
"\   },
"\   'lib/*.rb': {
"\     'alternate': 'spec/{}_spec.rb'
"\   },
"\   'spec/*_spec.rb': {
"\     'alternate': 'lib/{}.rb'
"\   },
"\   'config/locales/*.ru.yml': {
"\     'alternate': 'config/locales/{}.en.yml'
"\   },
"\   'config/locales/*.en.yml': {
"\     'alternate': 'config/locales/{}.ru.yml'
"\   }
"\ }

"-------------------------------------------------------------------------------
" ack.vim
" https://github.com/mileszs/ack.vim/blob/master/doc/ack.txt
" TODO: Try tap349/ack.vim with functions: Search, SearchWithGlob
Plug 'blackchestnut/ack.vim'
"-------------------------------------------------------------------------------

let g:ackhighlight = 1
let g:ackprg = 'rg -FS --sort-files --vimgrep'
" disable empty search (searching the word under cursor) -
" it complicates the logic to parse user input excessively
"
" use <C-r><C-w> to paste the word under cursor
let g:ack_use_cword_for_empty_search = 0

" QFEnter works with both quickfix windows and location lists
" NOTE: Search doen't work, add dir after search, example: ./
"map <Leader>s :call <SID>Search()<CR>
map <Leader>s :Ack!<Space>

" NOTE: Try to fix ack.vim
"let g:ackprg = 'rg --fixed-strings --smart-case --vimgrep'
"let g:ctrlp_user_command = 'rg --files %s'
" NOTE END

" useful symbols: ⎸│⮁⮀
function! s:Search( )
  echohl AckSearch
  let l:input_phrase = input(' SEARCH ⮁ ')
  echohl None

  call <SID>MyLAck(l:input_phrase)
endfunction

" `!` is not allowed in function name
"
" https://github.com/mileszs/ack.vim/issues/5
" https://stackoverflow.com/a/15403852/3632318
" https://stackoverflow.com/questions/5669194
" :help escape()
" :help shellescape()
"
" for rg to work we need:
"
" - not to escape `!` at all
" - to escape `%#` twice
" - to escape other special characters (slashes, etc.) once
" - not to treat strings starting with dashes as rg options
"
" useful functions:
"
" - `shellescape({string})`:
"   escapes all special characters once (excluding `!%#`)
" - `shellescape({string}, 1)`:
"   escapes all special characters once (including `!%#`)
" - `escape({string}, {chars})`:
"   escapes only the characters it's told to escape
" - `--` (options delimiter):
"   signifies the end of rg options
"
" => escape all special characters excluding `!%#` with
"    `shellescape`, escape `%#` with `escape` twice
"    and let `--` deal with strings starting with dashes
"
" NOTE: still IDK how to search for literal '--'
function! s:MyLAck(input_phrase, ...)
  let l:glob = get(a:, 1, '')
  let l:glob_option = len(l:glob) ? '-g ''*' . l:glob . '*''' : ''

  let l:delimiter = ' -- '
  let l:split_args = split(a:input_phrase, l:delimiter)
  let l:args_len = len(l:split_args)

  " no arguments
  if l:args_len == 0
    call <SID>ShowWarningMessage('Empty search')
    return
  " options only (`-w -- `)
  elseif l:args_len == 1 && a:input_phrase =~ l:delimiter . '$'
    call <SID>ShowWarningMessage('Empty search')
    return
  " search phrase only (` -- foo` or `foo`)
  elseif l:args_len == 1
    let l:options = l:glob_option
    let l:search_phrase = join(l:split_args)
  " options and search phrase (`-w -- foo`)
  else
    let l:options = l:glob_option . ' ' . l:split_args[0]
    let l:search_phrase = join(l:split_args[1:-1], l:delimiter)
  endif

  " ack.vim already escapes `|%#` once in autoload/ack.vim -
  " escape `%#` once again here so that they're escaped twice
  let l:escaped_search_phrase = escape(shellescape(l:search_phrase), '%#')

  " don't use `silent` - it suppresses 'no match found' message
  "
  " search might break if ' -- ' is a substring of search phrase
  " and user doesn't provide options - then part of search phrase
  " is parsed as options which might yield unpredictable results
  exec ':LAck! ' . l:options . l:delimiter . l:escaped_search_phrase
endfunction

function! s:ShowWarningMessage(message)
  redraw!
  echohl WarningMsg
  echo a:message
  echohl None
endfunction

"-----------------------------------------------------------------------------
"Plug 'tpope/vim-repeat' TODO
"-----------------------------------------------------------------------------
"silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

"-------------------------------------------------------------------------------
" TODO: make a fork
Plug 'tap349/QFEnter'
" QFEnter respects `switchbuf` option! if selected file is opened
" in another tab all mappings below just switch to that tab
"-------------------------------------------------------------------------------

" disable automatic opening of quickfix window (or location list)
" when opening file from current quickfix window in a new tab
let g:qfenter_enable_autoquickfix = 0

let g:qfenter_keymap = {}
let g:qfenter_keymap.open = ['<C-CR>']
let g:qfenter_keymap.open_keep = ['<S-CR>']
let g:qfenter_keymap.open_close = ['<CR>']
let g:qfenter_keymap.hopen = ['<C-s>']
let g:qfenter_keymap.vopen = ['<C-v>']
let g:qfenter_keymap.topen = ['<C-t>']"

"-----------------------------------------------------------------------------
"Plug 'osyo-manga/vim-anzu' TODO: ???
"-----------------------------------------------------------------------------
"nmap * <Plug>(anzu-star)
"nmap # <Plug>(anzu-sharp)
"nmap n <Plug>(anzu-mode-n)
"nmap N <Plug>(anzu-mode-N)

"-----------------------------------------------------------------------------
" Initialize plugin system
"-----------------------------------------------------------------------------
call plug#end()
