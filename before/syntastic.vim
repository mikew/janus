if janus#is_plugin_disabled('syntastic')
  finish
endif

let g:syntastic_enable_signs = 1
"let g:syntastic_quiet_warnings = 0
let g:syntastic_auto_loc_list = 2
