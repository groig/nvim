-- https://old.reddit.com/r/neovim/comments/1cxfhom/builtin_snippets_so_good_i_removed_luasnip/

M = {}

local global_snippets = {
  {
    trigger = "date",
    body = function()
      return os.date("%Y/%m/%d")
    end,
  },
  {
    trigger = "time",
    body = function()
      return os.date("%Y/%m/%d %H:%M:%S")
    end,
  },
  {
    trigger = "todo",
    body = function()
      return vim.bo.commentstring:gsub("%%s", "TODO: ")
    end,
  },
  { trigger = "lorem", body = "Lorem ipsum dolor sit amet, consectetur adipiscing elit." },
  {
    trigger = "uuid",
    body = function()
      local random = math.random
      local template = "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx"
      return string.gsub(template, "[xy]", function(c)
        local v = (c == "x") and random(0, 0xf) or random(8, 0xb)
        return string.format("%x", v)
      end)
    end,
  },
}

local snippets_by_filetype = {
  python = {
    { trigger = "pudb", body = "import pudb; pudb.set_trace()" },
    { trigger = "docs", body = '"""\n$0\n"""' },
    {
      trigger = "timer",
      body = "import time\nstart_time = time.time()\n$0\nprint('Execution Time:', time.time() - start_time)",
    },
    { trigger = "nq", body = "# noqa" },
  },
  javascript = {
    { trigger = "cl", body = "console.log($0);" },
  },
}

local function get_buf_snips()
  local ft = vim.bo.filetype
  local snips = vim.list_slice(global_snippets)

  if ft and snippets_by_filetype[ft] then
    vim.list_extend(snips, snippets_by_filetype[ft])
  end

  return snips
end

local function get_snippet()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  local cur_line = vim.api.nvim_buf_get_lines(0, line - 1, line, true)
  local line_pre_cursor = cur_line[1]:sub(1, col)

  for _, s in ipairs(get_buf_snips()) do
    if vim.endswith(line_pre_cursor, s.trigger) then
      return s.trigger, s.body, line, col
    end
  end

  return nil
end

local function expand_under_cursor()
  local trigger, body, line, col = get_snippet()
  if not trigger or not line or not col then
    return false
  end
  vim.api.nvim_buf_set_text(0, line - 1, col - #trigger, line - 1, col, {})
  vim.api.nvim_win_set_cursor(0, { line, col - #trigger })

  vim.snippet.expand(type(body) == "function" and body() or body)
  return true
end

-- cmp source for snippets to show up in completion menu
function M.register_cmp_source()
  local cmp_source = {}
  cmp_source.new = function()
    local self = setmetatable({ cache = {} }, { __index = cmp_source })
    return self
  end
  cmp_source.complete = function(self, _, callback)
    local bufnr = vim.api.nvim_get_current_buf()
    if not self.cache[bufnr] then
      local completion_items = vim.tbl_map(function(s)
        return {
          word = s.trigger,
          label = s.trigger,
          kind = require("cmp").lsp.CompletionItemKind.Snippet,
        }
      end, get_buf_snips())

      self.cache[bufnr] = completion_items
      callback(completion_items)
    end

    callback(self.cache[bufnr])
  end

  function cmp_source:execute(completion_item, callback)
    expand_under_cursor()
    callback(completion_item)
  end
  require("cmp").register_source("snippets", cmp_source.new())
end

return M
