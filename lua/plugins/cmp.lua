return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp-signature-help",
  },
  config = function()
    require("my.snippets").register_cmp_source()
    local cmp = require("cmp")
    cmp.setup({
      completion = {
        keyword_length = 1,
      },
      view = { entries = { follow_cursor = true } },
      mapping = cmp.mapping.preset.insert({
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
        ["<TAB>"] = function(fallback)
          if vim.snippet.active({ direction = 1 }) then
            vim.snippet.jump(1)
          else
            fallback()
          end
        end,
        ["<S-TAB>"] = function(fallback)
          vim.snippet.jump(-1)
        end,
      }),
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          local kind = ({
            Class = " ",
            Color = " ",
            Constant = " ",
            Constructor = " ",
            Enum = " ",
            EnumMember = " ",
            Field = "󰄶 ",
            File = " ",
            Folder = " ",
            Function = " ",
            Interface = "󰜰",
            Keyword = "󰌆 ",
            Method = "ƒ ",
            Module = "󰏗 ",
            Property = " ",
            Snippet = "󰘍 ",
            Struct = " ",
            Text = " ",
            Unit = " ",
            Value = "󰎠 ",
            Variable = " ",
            Supermaven = "",
          })[vim_item.kind]

          if entry.source.name == "nvim_lsp" then
            if entry.source.source.client.name == "jedi_language_server" then
              vim_item.menu = "jedi"
            else
              vim_item.menu = entry.source.source.client.name
            end
          elseif entry.source.name == "nvim_lsp_signature_help" then
            vim_item.menu = "signature"
          else
            vim_item.menu = entry.source.name
          end

          vim_item.kind = kind

          return vim_item
        end,
      },
      window = {
        completion = cmp.config.window.bordered({ scrollbar = false }),
        documentation = cmp.config.window.bordered({ scrollbar = false }),
      },
      experimental = { ghost_text = { hl_group = "Comment" } },
      performance = {
        debounce = 300,
        throttle = 100,
      },
      sources = {
        { name = "supermaven", priority = 100 },
        { name = "nvim_lsp_signature_help", priority = 95 },
        { name = "nvim_lsp", priority = 90 },
        {
          name = "snippets",
          priority = 80,
          entry_filter = function()
            local context = require("cmp.config.context")
            return not context.in_treesitter_capture("string") and not context.in_syntax_group("String")
          end,
        },
        {
          name = "buffer",
          priority = 40,
          option = {
            get_bufnrs = function()
              return vim.api.nvim_list_bufs()
            end,
          },
        },
        { name = "path", priority = 20 },
      },
    })
  end,
}
