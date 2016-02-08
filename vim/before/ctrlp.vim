let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_map = ''
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
  \ }

if has("gui_macvim") && has("gui_running")
  call janus#add_delayed_command('map <D-t> :CtrlP<CR>')
  call janus#add_delayed_command('imap <D-t> <ESC>:CtrlP<CR>')
endif
