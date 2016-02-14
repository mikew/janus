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
