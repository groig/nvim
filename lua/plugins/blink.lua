return {
  "saghen/blink.cmp",
  build = "cargo build --release",
  event = "InsertEnter",
  config = function()
    require("blink.cmp").setup({
      keymap = {
        ["<CR>"] = { "accept", "fallback" },
        ["<C-n>"] = { "show", "select_next" },
        ["<C-p>"] = { "show", "select_prev" },
        ["<C-e>"] = { "hide" },
        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },
        ["<Tab>"] = { "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },
      },
      completion = {
        keyword = {
          range = "full",
        },
        list = {
          max_items = 10,
        },
        menu = {
          border = "single",
          draw = {
            columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "kind", "source_name", gap = 1 } },
            treesitter = { "lsp" },
          },
          auto_show = function(ctx)
            return ctx.mode ~= "cmdline"
          end,
        },
        documentation = {
          window = {
            border = "single",
          },
          auto_show = true,
          auto_show_delay_ms = 100,
        },
      },
      signature = {
        window = {
          border = "single",
        },
        enabled = true,
      },
      sources = {
        providers = {
          buffer = {
            opts = {
              get_bufnrs = function()
                return vim.tbl_filter(function(bufnr)
                  return vim.bo[bufnr].buftype == ""
                end, vim.api.nvim_list_bufs())
              end,
            },
          },
        },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
      },
    })
  end,
}
