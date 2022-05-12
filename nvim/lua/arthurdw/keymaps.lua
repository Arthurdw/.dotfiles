-- Gravely inspired by https://github.com/LunarVim/Neovim-from-scratch

-- Modes refference
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

local opts = {noremap = true, silent = true}
local km = vim.api.nvim_set_keymap

-- Window navigation
km("n", "<C-h>", "<C-w>h", opts)
km("n", "<C-j>", "<C-w>j", opts)
km("n", "<C-k>", "<C-w>k", opts)
km("n", "<C-l>", "<C-w>l", opts)

-- Resize window with arrows
km("n", "<C-Up>", ":resize -2<CR>", opts)
km("n", "<C-Down>", ":resize +2<CR>", opts)
km("n", "<C-Left>", ":vertical resize -2<CR>", opts)
km("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Explorer
km("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
km("n", "<leader>r", ":RangerWorkingDirectory<CR>", opts)

-- Navigate buffers
km("n", "<S-l>", ":bnext<CR>", opts)
km("n", "<S-h>", ":bprevious<CR>", opts)
km("n", "<leader>c", ":bd<CR>", opts)

-- Move text up and down
km("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
km("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Press jk to enter insert
km("i", "jk", "<ESC>", opts)

-- Stay in indent mode
km("v", "<", "<gv", opts)
km("v", ">", ">gv", opts)

-- Move text up and down
km("v", "<A-j>", ":m .+1<CR>==", opts)
km("v", "<A-k>", ":m .-2<CR>==", opts)
km("x", "J", ":move '>+1<CR>gv-gv", opts)
km("x", "K", ":move '<-2<CR>gv-gv", opts)
km("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
km("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
