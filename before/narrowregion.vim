if janus#is_plugin_disabled('NrrwRgn')
  finish
endif

call janus#add_delayed_command('map <leader>rn :NarrowRegion<CR>')
