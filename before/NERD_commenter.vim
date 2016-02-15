" NERDCommenter mappings
  call janus#add_delayed_command('map <D-/> <plug>NERDCommenterToggle<CR>')
  call janus#add_delayed_command('imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i')
if janus#has_gui_mac()
else
  call janus#add_delayed_command('map <leader>/ <plug>NERDCommenterToggle<CR>')
endif
