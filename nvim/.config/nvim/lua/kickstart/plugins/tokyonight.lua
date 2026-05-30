return {
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = function()
      require('gruvbox').setup {
        terminal_colors = true,
        transparent_mode = false,
      }
      vim.cmd.colorscheme 'gruvbox'
    end,
  },
}
