local function s(trigger, body)
  return { trigger = trigger, body = body }
end

return {
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
}
