let NERDTreeHijackNetrw = 0
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o$', '\~$', '\.git$']
let g:nerdtree_tabs_startup_cd = 0
let g:nerdtree_tabs_smart_startup_focus = 0
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_tabs_open_on_console_startup = 0

" Default mapping, <leader>n
if maparg('<leader>n') !~ 'NERDTree'
  call janus#add_delayed_command('map <leader>n :NERDTreeTabsToggle<CR>')
endif

" Something about our VimEnter function means it needs to be run after
" nerdtree-tabs
call janus#add_delayed_command('autocmd VimEnter * call janus#VimEnter(expand("<amatch>"))')
autocmd FocusGained * call janus#FocusGained()
