""
"" Janus setup
""

" Define paths
if has('win32') || has('win64') || has('win32unix')
  let g:janus_path = expand("~/.vim")
  let g:janus_vim_path = expand("~/.vim")
else
  let g:janus_path = escape(fnamemodify(resolve(expand("<sfile>:p")), ":h"), ' ')
  let g:janus_vim_path = escape(fnamemodify(resolve(expand("<sfile>:p" . "vim")), ":h"), ' ')
endif

" It seems `exists('neovim_dot_app')` is 1 here, but 0 when checked in
" autoload/, so we have to pass some info along.
call janus#setup_helpers({
      \ 'has_gui_running': has("gui_running") || exists("neovim_dot_app"),
      \ 'has_gui_mac': (has('gui_running') && has('gui_macvim')) || exists('neovim_dot_app'),
      \ 'c': exists('neovim_dot_app') ? 'T' : 'D',
      \ })

" Manually source all files in before/, if we rely on plugin/ they are sourced
" after vim-plug despite appearing first in the rtp
call janus#source_files_in(g:janus_vim_path . '/before')

""
"" Customisations
""

if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

if janus#has_gui_running() && filereadable(expand("~/.gvimrc.before"))
  source ~/.gvimrc.before
endif

""
"" vim-plug setup
""

call plug#begin(g:janus_vim_path . '/plugged')
  execute 'source ' . g:janus_vim_path . '/tools.vim'
  execute 'source ' . g:janus_vim_path . '/langs.vim'

  " Load the user's plugins
  if filereadable(expand("~/.vimrc.plugins"))
    source ~/.vimrc.plugins
  endif

  "Plug g:janus_vim_path . '/after', { 'as': 'janus-after' }
call plug#end()

" .vimrc.after is loaded after the plugins have loaded
