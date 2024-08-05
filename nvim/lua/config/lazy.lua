local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

local lsdp, err = pcall(require, "craftzdog.lsp")
if lsdp then
  vim.api.nvim_set_keymap(
    "n",
    "<leader>ih",
    ":lua require('craftzdog.lsp').toggleInlayHints()<CR>",
    { noremap = true, silent = true }
  )
else
  vim.api.nvim_err_writeln("Failed to load 'craftzdog.lsp': " .. err)
end

require("lazy").setup({
  spec = {
    { "LazyVim/LazyVim", import = "lazyvim.plugins", opts = {
      colorscheme = "solarized-osaka",
    } },
    {
      "akinsho/toggleterm.nvim",
      version = "*",
      config = true,
    },
    { import = "plugins" },
  },
  defaults = {
    lazy = false,
    version = false,
  },
  install = {
    colorscheme = { "tokyonight", "habamax", "gruvbox-material", "everforest" },
  },
  checker = {
    enabled = true,
    notify = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
