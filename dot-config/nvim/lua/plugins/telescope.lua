local builtin = require('telescope.builtin')
return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    -- config = true,
    keys = {
        { '<leader>ff', builtin.find_files },
        { '<leader>fg', builtin.live_grep },
        { '<leader>fb', builtin.buffers },
        { '<leader>fh', builtin.help_tags },
    }
}
-- nvim-treesitter/nvim-treesitter (finder/preview)
