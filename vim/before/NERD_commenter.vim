" NERDCommenter mappings
if has("gui_macvim") && has("gui_running")
  call janus#add_delayed_command('map <D-/> <plug>NERDCommenterToggle<CR>')
  call janus#add_delayed_command('imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i')
else
  call janus#add_delayed_command('map <leader>/ <plug>NERDCommenterToggle<CR>')
endif
