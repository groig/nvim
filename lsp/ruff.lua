vim.lsp.config("ruff", {
  cmd = { "ruff", "server" },
  filetypes = { "python" },
  root_markers = { ".git", "pyproject.toml" },
  settings = {},
})
