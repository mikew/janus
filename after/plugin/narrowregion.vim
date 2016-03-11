if janus#is_plugin_disabled('NrrwRgn')
  finish
endif

" Change default key mapping in order to eliminate delay related with
" NERDTree using the same starting sequence <leader>n
silent! nunmap <leader>nr
silent! xunmap <leader>nr
