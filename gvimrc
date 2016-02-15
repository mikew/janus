" CtrlP OS-X Menu remapping
if has("gui_macvim")
  macmenu &File.New\ Tab key=<D-S-t>
elseif exists("neovim_dot_app")
  call MacMenu("Window.New Tab", "T-S-t")
endif

if filereadable(expand("~/.gvimrc.after"))
  source ~/.gvimrc.after
endif

call janus#commit_delayed_commands()
