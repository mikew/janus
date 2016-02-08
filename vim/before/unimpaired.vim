" Normal Mode: Bubble single lines
call janus#add_delayed_command('nmap <C-Up> [e')
call janus#add_delayed_command('nmap <C-Down> ]e')

" Visual Mode: Bubble multiple lines
call janus#add_delayed_command('vmap <C-Up> [egv')
call janus#add_delayed_command('vmap <C-Down> ]egv')
