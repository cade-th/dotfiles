-- Enable relative line numbers
vim.opt.relativenumber = true

-- Enable absolute line numbers for the current line
vim.opt.number = true

-- Map Ctrl+e to :Explore
vim.api.nvim_set_keymap('n', '<C-e>', ':Explore<CR>', { noremap = true, silent = true })


