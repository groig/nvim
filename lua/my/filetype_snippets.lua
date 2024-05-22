return {
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
