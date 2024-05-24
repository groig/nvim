local function s(trigger, body)
  return { trigger = trigger, body = body }
end

return {
  global = {
    s("date", function()
      return os.date("%Y/%m/%d")
    end),
    s("time", function()
      return os.date("%Y/%m/%d %H:%M:%S")
    end),
    s("timest", function()
      return tostring(os.time())
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
    s("pr", "print($0)"),
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
