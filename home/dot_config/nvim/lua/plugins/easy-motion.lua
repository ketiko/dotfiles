return {
  {
    "easymotion/vim-easymotion",
    event = "BufEnter",
    lazy = true,
    dependencies = {
      {
        "nvim-telescope/telescope.nvim",
        keys = {
          { "<leader><leader>", false }, -- disable the keymap to grep files so we can use easymotion
        },
      },
    },
  },
}
