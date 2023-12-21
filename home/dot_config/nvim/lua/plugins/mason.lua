return {
  {
    "williamboman/mason.nvim",
    lazy = true,
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "tree-sitter-cli",
      })
    end,
  },
}
