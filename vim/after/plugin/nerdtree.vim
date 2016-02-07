let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o$', '\~$']

" Default mapping, <leader>n
if maparg("<leader>n") !~ 'NERDTree'
  map <leader>n :NERDTreeToggle<CR> :NERDTreeMirror<CR>
endif

autocmd VimEnter * call s:NERDTreeTabsOpen(expand("<amatch>"))
autocmd FocusGained * call s:UpdateNERDTree()

function s:NERDTreeTabsOpen(directory)
  let l:main_bufnr = bufnr('%')
  if (isdirectory(a:directory)) || a:directory =~ "NERD_tree_[0-9]\\+"
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
