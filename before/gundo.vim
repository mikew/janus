if janus#is_plugin_disabled('gundo.vim')
  finish
endif

" Toggle Gundo
call janus#add_delayed_command('nmap <F5> :GundoToggle<CR>')
call janus#add_delayed_command('imap <F5> <ESC>:GundoToggle<CR>')
