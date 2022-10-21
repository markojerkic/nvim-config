local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

--keymap("n", "<leader>e", ":Lex 30<CR>", opts)
keymap("n", "<leader>nn", "<cmd>:NERDTreeFocus<CR>", opts)
keymap("n", "<leader>nt", "<cmd>:NERDTreeToggle<CR>", opts)
keymap("n", "<leader>nf", "<cmd>:NERDTreeFind<CR>", opts)

-- Code completion menu
keymap("n", "<leader>ca", "<cmd>:CodeActionMenu<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)


keymap("n", "<A-l>", "<cmd>Format<CR>", opts)

-- Reooad conf
keymap("n", "<leader><leader>", "<cmd>source $MYVIMRC<CR>", opts)

-- Insert --
-- Press jk fast to enter
-- keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Tabs
keymap("n", "<A-,>", "<cmd>tabp<CR>", opts)
keymap("n", "<A-.>", "<cmd>tabn<CR>", opts)
keymap("n", "<A-o>", "<cmd>tabc<CR>", opts)
keymap("n", "<A-a>", "<cmd>tabonly<CR>", opts)
keymap("n", "<A-<>", "<cmd>+tabmove<CR>", opts)
keymap("n", "<A->>", "<cmd>-tabmove<CR>", opts)
-- TODO
--[[
keymap("n", "<A-p>", "<cmd>BufferPin<CR>", opts)
-- Goto tab
keymap("n", "<A-1>", "<cmd>BufferGoto 1<CR>", opts)
keymap("n", "<A-2>", "<cmd>BufferGoto 2<CR>", opts)
keymap("n", "<A-3>", "<cmd>BufferGoto 3<CR>", opts)
keymap("n", "<A-4>", "<cmd>BufferGoto 4<CR>", opts)
keymap("n", "<A-5>", "<cmd>BufferGoto 5<CR>", opts)
keymap("n", "<A-6>", "<cmd>BufferGoto 6<CR>", opts)
--]]

-- Search
keymap("n", "<leader>n", "<cmd>noh<CR>", opts)

-- Telescope
keymap("n", "<C-f>", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<C-g>", "<cmd>Telescope live_grep<CR>", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
