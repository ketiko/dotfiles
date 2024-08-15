return {
  {
    "mileszs/ack.vim",
    init = function()
      vim.g.ackprg = "ag --smart-case --vimgrep"
    end,
  },
}
