" CtrlP OS-X Menu remapping
if has("gui_macvim")
  macmenu &File.New\ Tab key=<D-S-t>
endif

if filereadable(expand("~/.gvimrc.after"))
  source ~/.gvimrc.after
endif

call janus#commit_delayed_commands()
