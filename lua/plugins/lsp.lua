return {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  dependencies = {
    {
      "seblj/nvim-echo-diagnostics",
      config = function()
        require("echo-diagnostics").setup({})
        vim.opt.updatetime = 250

        vim.api.nvim_create_autocmd("CursorHold", {
          pattern = "*",
          callback = function(opts)
            require("echo-diagnostics").echo_line_diagnostic()
          end,
        })
      end,
    },
    {
      "SmiteshP/nvim-navic",
      config = function()
        local navic = require("nvim-navic")
        navic.setup({
          lsp = {
            auto_attach = true,
            preference = { "elixirls", "tailwindcss", "html" },
          },
        })

        vim.opt.statusline =
          " %f %{&modified?' +':''} %{&readonly?' ':''}%= %{%v:lua.require'nvim-navic'.get_location()%} %3p%%"
      end,
      event = "LspAttach",
    },
  },
  config = function()
    local lspconfig = require("lspconfig")

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded",
    })

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
      bmap("n", "[d", function()
        vim.diagnostic.jump({ count = 1 })
      end, opts)
      bmap("n", "]d", function()
        vim.diagnostic.jump({ count = -1 })
      end, opts)

      client.server_capabilities.semanticTokensProvider = nil
    end

    local capabilities = require("blink.cmp").get_lsp_capabilities()
    local lsp_options = {
      on_attach = on_attach,
      single_file_support = true,
      capabilities = capabilities,
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
      virtual_text = false,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "● ",
          [vim.diagnostic.severity.WARN] = "● ",
          [vim.diagnostic.severity.INFO] = "● ",
          [vim.diagnostic.severity.HINT] = "● ",
        },
      },
      underline = false,
      update_in_insert = true,
      severity_sort = true,
      float = { source = true, border = "rounded" },
    })
  end,
}
