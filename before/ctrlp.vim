let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -co --exclude-standard', 'find %s -type f']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
  \ }

  let g:ctrlp_map = '<D-t>'
if janus#has_gui_mac()
  call janus#add_delayed_command('imap ' . g:ctrlp_map . ' <ESC>:CtrlP<CR>')
endif
