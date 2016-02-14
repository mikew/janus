let NERDTreeHijackNetrw = 0
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o$', '\~$', '\.git$']
let g:nerdtree_tabs_startup_cd = 0
let g:nerdtree_tabs_smart_startup_focus = 0
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_tabs_open_on_console_startup = 0

" Default mapping, <leader>n
if maparg("<leader>n") !~ 'NERDTree'
  call janus#add_delayed_command('map <leader>n :NERDTreeTabsToggle<CR>')
endif

autocmd VimEnter * call s:NERDTreeTabsOpen(expand("<amatch>"))
autocmd FocusGained * call s:UpdateNERDTree()

function s:NERDTreeTabsOpen(directory)
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

" NERDTree utility function
function s:UpdateNERDTree(...)
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
