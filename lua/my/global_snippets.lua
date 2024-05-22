return {
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
