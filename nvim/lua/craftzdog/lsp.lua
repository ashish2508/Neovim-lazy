local M = {}

function M.toggleInlayHints()
  local bufnr = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients({ bufnr = bufnr })

  for _, client in ipairs(clients) do
    if client.name == "rust_analyzer" then
      local settings = client.config.settings and client.config.settings["rust-analyzer"]

      if settings then
        local inlayHintsEnabled = settings.inlayHints and settings.inlayHints.enabled or false
        settings.inlayHints.enabled = not inlayHintsEnabled
        client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
      else
        print("Rust Analyzer settings are not available")
      end
    end
  end
end

return M
