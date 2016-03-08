let s:delayed_commands = []

function! janus#add_delayed_command(cmd)
  call add(s:delayed_commands, a:cmd)
endfunction

function! janus#commit_delayed_commands()
  for cmd in s:delayed_commands
    execute cmd
  endfor
endfunction

function! janus#source_files_in(directory)
  for rcfile in split(globpath(a:directory, '*.vim'), '\n')
    execute 'source ' . rcfile
  endfor
endfunction

function! janus#VimEnter(directory)
  let l:main_bufnr = bufnr('%')

  "if isdirectory(a:directory)
    exe "cd " . fnameescape(expand('%:p:h'))
  "endif

  if isdirectory(a:directory) || a:directory =~ "NERD_tree_[0-9]\\+"
    bd
  endif

  try
    NERDTreeTabsOpen
  catch
    NERDTree
  endtry
  exe bufwinnr(l:main_bufnr) . "wincmd w"
endfunction

function janus#FocusGained(...)
  let stay = 0

  if(exists("a:1"))
    let stay = a:1
  end

  if exists("t:NERDTreeBufName")
    let nr = bufwinnr(t:NERDTreeBufName)
    if nr != -1
      exe nr . "wincmd w"
      exe substitute(mapcheck("R"), "<CR>", "", "")
      if !stay
        wincmd p
      end
    endif
  endif
endfunction

function! janus#has_gui_running()
  return $VIM_FORCE_GVIM || has("gui_running") || exists("g:neovim_dot_app")
endfunction

function! janus#has_gui_mac()
  return janus#has_gui_running() && has('macunix')
endfunction

function! janus#OutputToTab(...)
  tabnew
  redir @a
  exec 'silent ' . join(a:000, ' ')
  redir END
  normal "apdd
endfunction

command! -nargs=+ -complete=command OutputToTab call janus#OutputToTab(<f-args>)

function! janus#Guifont(name, size)
  let fontstr_mac = printf('%s:h%s', a:name, a:size)
  let fontstr_unix = printf('%s %s', a:name, a:size)

  if exists('*rpcnotify')
    " Support neovim-qt
    call rpcnotify(0, 'Gui', 'SetFont', fontstr_mac)
    let g:Guifont = fontstr_mac

    " Support Neovim.app
    call rpcnotify(1, 'neovim.app.setfont', a:name, a:size)
  endif

  if janus#has_gui_mac()
    let &guifont = fontstr_mac
  else
    let &guifont = fontstr_unix
  endif
endfunction
