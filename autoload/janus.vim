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

let s:has_gui_running = 0
let s:has_gui_mac = 0

function! janus#setup_helpers(state)
  let s:has_gui_running = get(a:state, 'has_gui_running', 0)
  let s:has_gui_mac = get(a:state, 'has_gui_mac', 0)
  let g:c = get(a:state, 'c', 'D')
endfunction

function! janus#has_gui_running()
  return s:has_gui_running
endfunction

function! janus#has_gui_mac()
  return s:has_gui_mac
endfunction
