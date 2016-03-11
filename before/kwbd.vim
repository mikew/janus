if janus#is_plugin_disabled('Kwbd.vim')
  finish
endif

call janus#add_delayed_command('nmap <C-W>! <Plug>Kwbd')
