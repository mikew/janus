""
"" General Mappings (Normal, Visual, Operator-pending)
""

" Toggle paste mode
call janus#add_delayed_command('nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>')
call janus#add_delayed_command('imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>')

" format the entire file
call janus#add_delayed_command('nnoremap <leader>fef :normal! gg=G``<CR>')

" upper/lower word
call janus#add_delayed_command('nmap <leader>u mQviwU`Q')
call janus#add_delayed_command('nmap <leader>l mQviwu`Q')

" upper/lower first char of word
call janus#add_delayed_command('nmap <leader>U mQgewvU`Q')
call janus#add_delayed_command('nmap <leader>L mQgewvu`Q')

" cd to the directory containing the file in the buffer
call janus#add_delayed_command('nmap <silent> <leader>cd :lcd %:h<CR>')

" Create the directory containing the file in the buffer
call janus#add_delayed_command('nmap <silent> <leader>md :!mkdir -p %:p:h<CR>')

" Some helpers to edit mode
" http://vimcasts.org/e/14
call janus#add_delayed_command('nmap <leader>ew :e <C-R>=expand("%:h")."/"<cr>')
call janus#add_delayed_command('nmap <leader>es :sp <C-R>=expand("%:h")."/"<cr>')
call janus#add_delayed_command('nmap <leader>ev :vsp <C-R>=expand("%:h")."/"<cr>')
call janus#add_delayed_command('nmap <leader>et :tabe <C-R>=expand("%:h")."/"<cr>')

" Swap two words
call janus#add_delayed_command('nnoremap <silent> gw "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>')

" Underline the current line with '='
call janus#add_delayed_command('nmap <silent> <leader>ul :t.<CR>Vr=')

" set text wrapping toggles
call janus#add_delayed_command('nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>')

" find merge conflict markers
call janus#add_delayed_command('nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>')

" Map the arrow keys to be based on display lines, not physical lines
call janus#add_delayed_command('map <Down> gj')
call janus#add_delayed_command('map <Up> gk')
call janus#add_delayed_command('imap <Down> <Esc>gja')
call janus#add_delayed_command('imap <Up> <Esc>gka')

" Toggle hlsearch with <leader>hs
call janus#add_delayed_command('nmap <leader>hs :set hlsearch! hlsearch?<CR>')

" Adjust viewports to the same size
call janus#add_delayed_command('map <Leader>= <C-w>=')

if janus#has_gui_mac()
  " Map command-[ and command-] to indenting or outdenting
  " while keeping the original selection in visual mode
  call janus#add_delayed_command('vmap <D-]> >gv')
  call janus#add_delayed_command('vmap <D-[> <gv')

  call janus#add_delayed_command('nmap <D-]> >>')
  call janus#add_delayed_command('nmap <D-[> <<')

  call janus#add_delayed_command('omap <D-]> >>')
  call janus#add_delayed_command('omap <D-[> <<')

  call janus#add_delayed_command('imap <D-]> <Esc>>>i')
  call janus#add_delayed_command('imap <D-[> <Esc><<i')

  " Bubble single lines
  "call janus#add_delayed_command('nmap <D-Up> [e')
  "call janus#add_delayed_command('nmap <D-Down> ]e')
  call janus#add_delayed_command('nmap <D-k> [e')
  call janus#add_delayed_command('nmap <D-j> ]e')

  " Bubble multiple lines
  "call janus#add_delayed_command('vmap <D-Up> [egv')
  "call janus#add_delayed_command('vmap <D-Down> ]egv')
  call janus#add_delayed_command('vmap <D-k> [egv')
  call janus#add_delayed_command('vmap <D-j> ]egv')

  " Map Command-# to switch tabs
  call janus#add_delayed_command('map  <D-0> 0gt')
  call janus#add_delayed_command('imap <D-0> <Esc>0gt')
  call janus#add_delayed_command('map  <D-1> 1gt')
  call janus#add_delayed_command('imap <D-1> <Esc>1gt')
  call janus#add_delayed_command('map  <D-2> 2gt')
  call janus#add_delayed_command('imap <D-2> <Esc>2gt')
  call janus#add_delayed_command('map  <D-3> 3gt')
  call janus#add_delayed_command('imap <D-3> <Esc>3gt')
  call janus#add_delayed_command('map  <D-4> 4gt')
  call janus#add_delayed_command('imap <D-4> <Esc>4gt')
  call janus#add_delayed_command('map  <D-5> 5gt')
  call janus#add_delayed_command('imap <D-5> <Esc>5gt')
  call janus#add_delayed_command('map  <D-6> 6gt')
  call janus#add_delayed_command('imap <D-6> <Esc>6gt')
  call janus#add_delayed_command('map  <D-7> 7gt')
  call janus#add_delayed_command('imap <D-7> <Esc>7gt')
  call janus#add_delayed_command('map  <D-8> 8gt')
  call janus#add_delayed_command('imap <D-8> <Esc>8gt')
  call janus#add_delayed_command('map  <D-9> 9gt')
  call janus#add_delayed_command('imap <D-9> <Esc>9gt')
else
  " Map command-[ and command-] to indenting or outdenting
  " while keeping the original selection in visual mode
  call janus#add_delayed_command('vmap <A-]> >gv')
  call janus#add_delayed_command('vmap <A-[> <gv')

  call janus#add_delayed_command('nmap <A-]> >>')
  call janus#add_delayed_command('nmap <A-[> <<')

  call janus#add_delayed_command('omap <A-]> >>')
  call janus#add_delayed_command('omap <A-[> <<')

  call janus#add_delayed_command('imap <A-]> <Esc>>>i')
  call janus#add_delayed_command('imap <A-[> <Esc><<i')

  " Bubble single lines
  "call janus#add_delayed_command('nmap <C-Up> [e')
  "call janus#add_delayed_command('nmap <C-Down> ]e')
  call janus#add_delayed_command('nmap <C-k> [e')
  call janus#add_delayed_command('nmap <C-j> ]e')

  " Bubble multiple lines
  "call janus#add_delayed_command('vmap <C-Up> [egv')
  "call janus#add_delayed_command('vmap <C-Down> ]egv')
  call janus#add_delayed_command('vmap <C-k> [egv')
  call janus#add_delayed_command('vmap <C-j> ]egv')

  " Make shift-insert work like in Xterm
  call janus#add_delayed_command('map <S-Insert> <MiddleMouse>')
  call janus#add_delayed_command('map! <S-Insert> <MiddleMouse>')

  " Map Control-# to switch tabs
  call janus#add_delayed_command('map  <C-0> 0gt')
  call janus#add_delayed_command('imap <C-0> <Esc>0gt')
  call janus#add_delayed_command('map  <C-1> 1gt')
  call janus#add_delayed_command('imap <C-1> <Esc>1gt')
  call janus#add_delayed_command('map  <C-2> 2gt')
  call janus#add_delayed_command('imap <C-2> <Esc>2gt')
  call janus#add_delayed_command('map  <C-3> 3gt')
  call janus#add_delayed_command('imap <C-3> <Esc>3gt')
  call janus#add_delayed_command('map  <C-4> 4gt')
  call janus#add_delayed_command('imap <C-4> <Esc>4gt')
  call janus#add_delayed_command('map  <C-5> 5gt')
  call janus#add_delayed_command('imap <C-5> <Esc>5gt')
  call janus#add_delayed_command('map  <C-6> 6gt')
  call janus#add_delayed_command('imap <C-6> <Esc>6gt')
  call janus#add_delayed_command('map  <C-7> 7gt')
  call janus#add_delayed_command('imap <C-7> <Esc>7gt')
  call janus#add_delayed_command('map  <C-8> 8gt')
  call janus#add_delayed_command('imap <C-8> <Esc>8gt')
  call janus#add_delayed_command('map  <C-9> 9gt')
  call janus#add_delayed_command('imap <C-9> <Esc>9gt')
endif

""
"" Command-Line Mappings
""

" After whitespace, insert the current directory into a command-line path
cnoremap <expr> <C-P> getcmdline()[getcmdpos()-2] ==# ' ' ? expand('%:p:h') : "\<C-P>"
