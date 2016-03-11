if janus#is_plugin_disabled('tagbar')
  finish
endif

" Tagbar mappings.
call janus#add_delayed_command('map <Leader>rt :TagbarToggle<CR>')
