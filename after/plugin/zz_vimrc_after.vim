" Customization
"
" This loads after the janus plugins so that janus-specific plugin mappings can
" be overwritten.

if filereadable(expand("~/.vimrc.after"))
  source ~/.vimrc.after
endif

"if has("gui_running") && filereadable(expand("~/.gvimrc.after"))
  "source ~/.gvimrc.after
"endif

if !janus#has_gui_running()
  call janus#commit_delayed_commands()
endif
