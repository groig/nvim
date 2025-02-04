return {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  config = function()
    local lspconfig = require("lspconfig")

    local on_attach = function(client, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }
      local bmap = vim.keymap.set

      bmap("n", "K", function()
        vim.lsp.buf.hover()
      end, opts)
      bmap("n", "<leader>a", function()
        vim.lsp.buf.code_action()
      end, opts)
      bmap("n", "<C-f>", function()
        vim.lsp.buf.references()
      end, opts)
      bmap("n", "<leader>e", function()
        vim.diagnostic.open_float()
      end, opts)
      bmap("n", "<leader>l", function()
        vim.diagnostic.setloclist()
      end, opts)
      bmap("n", "<leader>d", function()
        vim.diagnostic.jump({ count = 1 })
      end, opts)
      bmap("n", "<leader>D", function()
        vim.diagnostic.jump({ count = -1 })
      end, opts)

      client.server_capabilities.semanticTokensProvider = nil
    end

    local lsp_options = {
      on_attach = on_attach,
      single_file_support = true,
    }

    require("lspconfig").lua_ls.setup({
      on_init = function(client)
        local path = client.workspace_folders[1].name
        if vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc") then
          return
        end

        client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
          runtime = {
            version = "LuaJIT",
          },
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
            },
          },
        })
      end,
      settings = {
        -- Lua = { hint = { enable = true } },
        Lua = {},
      },
    })

    lspconfig.lexical.setup(vim.tbl_extend("force", lsp_options, {
      cmd = { "/home/roig/src/lexical/_build/prod/package/lexical/bin/start_lexical.sh" },
    }))

    lspconfig.html.setup(vim.tbl_extend("force", lsp_options, {
      filetypes = { "html", "elixir", "eelixir", "heex" },
    }))

    lspconfig.emmet_language_server.setup(vim.tbl_extend("force", lsp_options, {
      filetypes = {
        "css",
        "html",
        "htmldjango",
        "heex",
        "elixir",
      },
    }))

    lspconfig.tailwindcss.setup(vim.tbl_extend("force", lsp_options, {
      filetypes = { "html", "elixir", "eelixir", "heex" },
      init_options = {
        userLanguages = {
          elixir = "html-eex",
          eelixir = "html-eex",
          heex = "html-eex",
        },
      },
      root_dir = lspconfig.util.root_pattern(
        "tailwind.config.js",
        "tailwind.config.ts",
        "postcss.config.js",
        "postcss.config.ts",
        "package.json",
        "node_modules",
        ".git",
        "mix.exs"
      ),
      settings = {
        tailwindCSS = {
          experimental = {
            classRegex = {
              'class[:]\\s*"([^"]*)"',
            },
          },
        },
      },
    }))

    lspconfig.basedpyright.setup(vim.tbl_extend("force", lsp_options, {
      settings = {
        basedpyright = {
          analysis = {
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
            diagnosticMode = "openFilesOnly",
            typeCheckingMode = "off",
            diagnosticSeverityOverrides = {
              reportUnusedParameter = false,
              reportUnreachable = false,
            },
          },
        },
      },
    }))

    local servers = {
      "ts_ls",
      "bashls",
      "gopls",
      "ruff",
    }

    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup(lsp_options)
    end

    -- diagnostics
    vim.diagnostic.config({
      virtual_lines = { current_line = true },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "● ",
          [vim.diagnostic.severity.WARN] = "● ",
          [vim.diagnostic.severity.INFO] = "● ",
          [vim.diagnostic.severity.HINT] = "● ",
        },
      },
      severity_sort = true,
      float = { source = true, border = "rounded" },
    })
  end,
}
