-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local discipline = require("craftzdog.discipline")

discipline.cowboy()
local lsdp = require("craftzdog.lsp")

local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local key = vim.keymap.set
local toggleterm = require("toggleterm")
-- Do things without affecting the registers
keymap.set("n", "x", '"_x')
keymap.set("n", "<Leader>p", '"0p')
keymap.set("n", "<Leader>P", '"0P')
keymap.set("v", "<Leader>p", '"0p')
keymap.set("n", "<Leader>c", '"_c')
keymap.set("n", "<Leader>C", '"_C')
keymap.set("v", "<Leader>c", '"_c')
keymap.set("v", "<Leader>C", '"_C')
keymap.set("n", "<Leader>d", '"_d')
keymap.set("n", "<Leader>D", '"_D')
keymap.set("v", "<Leader>d", '"_d')
keymap.set("v", "<Leader>D", '"_D')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "<C-n>", ":tabedit<CR>", opts)
keymap.set("n", "<C-]>", ":tabnext<CR>", opts)
keymap.set("n", "<C-p>", ":tabprev<CR>", opts)
-- Split windoW
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

keymap.set("n", "<leader>r", function()
  require("craftzdog.hsl").replaceHexWithHSL()
end)

keymap.set("n", "<leader><M-o>)", function()
  lsdp.toggleInlayHints()
end)

local function save_file()
  vim.cmd("wq")
end
vim.keymap.set({ "n", "i", "v" }, "<C-q>", save_file, opts)
vim.g.have_nerd_font = true

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })

vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>.e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list " })

--vscode keybindings

vim.keymap.set("i", "jj", "<Esc><CR>==", opts)
vim.keymap.set({ "n", "v" }, "ii", ":%y+<CR>==", opts)

vim.keymap.set({ "n", "v" }, "xx", ":%d+<CR>==", opts)
vim.keymap.set("n", "<M-Down>", ":m .+1<CR>==", opts)
vim.keymap.set("v", "<M-Down>", ":m '>+1<CR>gv=gv", opts)

vim.keymap.set("n", "<M-Up>", ":m .-2<CR>==", opts)
vim.keymap.set("v", "<M-Up>", ":m '<-2<CR>gv=gv", opts)

vim.keymap.set("n", "<C-M-Down>", ":t .<CR>", opts)
vim.keymap.set("v", "<C-M-Down>", ":t .<CR>", opts)

vim.keymap.set("n", "<C-M-Up>", ":t .<CR> .-2<CR>", opts)
vim.keymap.set("n", "<C-M-Up>", ":t .<CR> '<-2<CR>gv", opts)

--toggle-term

-- Key mappings for toggleterm
key("n", "<C-s>", ":w<CR>", { desc = "Save file" })

