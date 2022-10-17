vim.cmd [[
try
  colorscheme spaceduck 
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
