if executable("ag")
  let g:ackprg = "ag --vimgrep"
elseif executable("ack-grep")
  let g:ackprg = "ack-grep -H --nocolor --nogroup --column"
endif

if janus#has_gui_mac()
  " Command-Shift-F on OSX
  call janus#add_delayed_command('map <D-F> :Ack<space>')
else
  " Define <C-F> to a dummy value to see if it would set <C-f> as well.
  call janus#add_delayed_command('map <C-F> :dummy')

  if maparg("<C-f>") == ":dummy"
    " <leader>f on systems where <C-f> == <C-F>
    call janus#add_delayed_command('map <leader>f :Ack<space>')
  else
    " <C-F> if we can still map <C-f> to <S-Down>
    call janus#add_delayed_command('map <C-F> :Ack<space>')
  endif

  call janus#add_delayed_command('map <C-f> <S-Down>')
endif
