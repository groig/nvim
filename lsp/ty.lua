return {
  cmd = { "ty", "server" },
  filetypes = { "python" },
  root_markers = { ".git", "pyproject.toml" },
  settings = {
    ty = {
      experimental = {
        autoImport = true,
        rename = true,
      },
      diagnosticMode = "openFilesOnly",
    },
  },
}
