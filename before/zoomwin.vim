if janus#is_plugin_disabled('ZoomWin')
  finish
endif

" Map <Leader><Leader> to ZoomWin
call janus#add_delayed_command('map <leader>zw :ZoomWin<CR>')
