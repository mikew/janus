let s:delayed_commands = []

function! janus#add_delayed_command(cmd)
  call add(s:delayed_commands, a:cmd)
endfunction

function! janus#commit_delayed_commands()
  echom 'janus#commit_delayed_commands'
  for cmd in s:delayed_commands
    execute cmd
  endfor
endfunction
