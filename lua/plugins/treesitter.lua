return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  init = function()
    local ensureInstalled = {
      "bash",
      "c",
      "cpp",
      "cmake",
      "css",
      "csv",
      "diff",
      "dockerfile",
      "dot",
      "elixir",
      "elm",
      "erlang",
      "git_config",
      "git_rebase",
      "gitattributes",
      "gitcommit",
      "gitignore",
      "go",
      "gpg",
      "graphql",
      "heex",
      "html",
      "htmldjango",
      "javascript",
      "jq",
      "json",
      "json5",
      "lua",
      "make",
      "markdown",
      "markdown_inline",
      "po",
      "python",
      "php",
      "query",
      "regex",
      "sql",
      "ssh_config",
      "todotxt",
      "toml",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
    }
    local alreadyInstalled = require("nvim-treesitter.config").get_installed()
    local parsersToInstall = vim
      .iter(ensureInstalled)
      :filter(function(parser)
        return not vim.tbl_contains(alreadyInstalled, parser)
      end)
      :totable()
    require("nvim-treesitter").install(parsersToInstall)
  end,
}
