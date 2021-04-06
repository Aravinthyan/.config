-- move to next line with theses keys
vim.cmd('syntax on') 
-- Required to keep multiple buffers open multiple buffers
vim.o.hidden = true 
-- Display long lines as just one line
vim.wo.wrap = false 
-- The encoding written to file
vim.o.encoding= "utf-8" 
-- Makes popup menu smaller
vim.o.pumheight = 10 
-- The encoding written to file
vim.o.fileencoding = "utf-8" 
vim.o.ruler = true
-- More space for displaying messages
vim.o.cmdheight = 2 
-- Horizontal splits will automatically be below
vim.o.splitbelow = true 
-- Vertical splits will automatically be to the right
vim.o.splitright = true 
-- set term giu colors most terminals support this
vim.o.termguicolors = true 
-- Support 256 colors
vim.o.t_Co = "256" 
-- To see `` in markdown files
vim.o.conceallevel = 0 
-- Insert 2 spaces for a tab
vim.cmd('set tabstop=4') 
-- Change the number of space characters inserted for indentation
vim.cmd('set shiftwidth=4') 
-- setting column to 81
vim.cmd('set colorcolumn=101')
vim.o.smarttab = true 
-- Converts tabs to spaces
vim.bo.expandtab = true 
-- Makes indenting smart
vim.bo.smartindent = true 
vim.bo.autoindent = true
-- set numbered lines
vim.wo.number = true 
-- set relative number
vim.wo.relativenumber = O.relative_number 
-- Enable highlighting of the current line
vim.wo.cursorline = true 
-- Always show tabs
vim.o.showtabline = 2 
-- Faster completion
vim.o.updatetime = 300 
-- By default timeoutlen is 1000 ms
vim.o.timeoutlen = 500 
-- Copy paste between vim and everything else
vim.o.clipboard = "unnamedplus" 
