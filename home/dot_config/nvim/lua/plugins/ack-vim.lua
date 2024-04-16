return {
  {
    "mileszs/ack.vim",
    init = function()
      vim.g.ackprg = "rg --smart-case --vimgrep"
    end,
  }
}
