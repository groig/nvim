return {
  "L3MON4D3/LuaSnip",
  event = "InsertEnter",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load()
    local ls = require("luasnip")
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    ls.add_snippets("python", {
      s("docs", {
        t('"""'),
        i(1, "docs"),
        t('"""'),
      }),
    })
  end,
}
