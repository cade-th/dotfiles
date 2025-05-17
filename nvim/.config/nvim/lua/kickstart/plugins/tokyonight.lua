return {
  -- Inside your Lazy plugin spec
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000, -- Load before other UI plugins
    config = function()
      require('gruvbox').setup {
        terminal_colors = true,
        transparent_mode = true,
      }
      vim.cmd.colorscheme 'gruvbox'
    end,
  },
}
