return {
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false, -- Load immediately
    priority = 1000, -- Load before other plugins
    config = function()
      require('gruvbox').setup {
        -- Optional configuration options
        contrast = '', -- Options: "hard", "soft", or "" (default)
        transparent_mode = false, -- Set to true for transparent background
      }
      vim.cmd [[colorscheme gruvbox]]
    end,
  },
}
