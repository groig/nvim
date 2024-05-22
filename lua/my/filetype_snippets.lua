local function s(trigger, body)
  return { trigger = trigger, body = body }
end

return {
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
