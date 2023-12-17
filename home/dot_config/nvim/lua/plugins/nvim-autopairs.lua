return {
  { "echasnovski/mini.pairs", enabled = false },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function(_, opts)
      local pairs = require("nvim-autopairs")
      pairs.setup(opts)
      pairs.add_rules(require("nvim-autopairs.rules.endwise-elixir"))
      pairs.add_rules(require("nvim-autopairs.rules.endwise-lua"))
      pairs.add_rules(require("nvim-autopairs.rules.endwise-ruby"))
    end,
  },
}
