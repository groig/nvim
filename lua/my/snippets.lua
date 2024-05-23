-- https://old.reddit.com/r/neovim/comments/1cxfhom/builtin_snippets_so_good_i_removed_luasnip/

M = {}

local function s(trigger, body)
  return { trigger = trigger, body = body }
end

local snippets = {
  global = {
    s("date", function()
      return os.date("%Y/%m/%d")
    end),
    s("time", function()
      return os.date("%Y/%m/%d %H:%M:%S")
    end),
    s("todo", function()
      return vim.bo.commentstring:gsub("%%s", "TODO: ")
    end),
    s("lorem", "Lorem ipsum dolor sit amet, consectetur adipiscing elit."),
    s("uuid", function()
      local random = math.random
      local template = "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx"
      return string.gsub(template, "[xy]", function(c)
        local v = (c == "x") and random(0, 0xf) or random(8, 0xb)
        return string.format("%x", v)
      end)
    end),
  },
  python = {
    s("pudb", "import pudb; pudb.set_trace()"),
    s("docs", '"""\n$0\n"""'),
    s("timer", "import time\nstart_time = time.time()\n$0\nprint('Execution Time:', time.time() - start_time)"),
    s("nq", "# noqa"),
  },
  javascript = {
    s("cl", "console.log($0);"),
  },
  markdown = {
    s("link", "[$0]($1)"),
    s("img", "![$0]($1)"),
    s("code", "```\n$0\n```"),
  },
}

local function get_buf_snips()
  local ft = vim.bo.filetype
  local snips = vim.list_slice(snippets["global"])

  if ft and snippets[ft] then
    vim.list_extend(snips, snippets[ft])
  end

  return snips
end

function M.register_source()
  local cmp_source = {}
  local cache = {}
  function cmp_source.complete(_, _, callback)
    local filetype = vim.bo.filetype
    if not cache[filetype] then
      local completion_items = vim.tbl_map(function(s)
        local insert_text = type(s.body) == "function" and s.body() or s.body
        local item = {
          word = s.trigger,
          label = s.trigger,
          kind = vim.lsp.protocol.CompletionItemKind.Snippet,
          insertText = insert_text,
          insertTextFormat = vim.lsp.protocol.InsertTextFormat.Snippet,
        }
        return item
      end, get_buf_snips())

      cache[filetype] = completion_items
    end

    callback(cache[filetype])
  end

  require("cmp").register_source("snippets", cmp_source)
end

return M
