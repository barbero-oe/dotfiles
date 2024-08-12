return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    -- config = true,
    keys = {
        { '<leader>ff', function() require('telescope.builtin').find_files() end },
        { '<leader>fg', function() require('telescope.builtin').live_grep() end },
        { '<leader>fb', function() require('telescope.builtin').buffers() end },
        { '<leader>fh', function() require('telescope.builtin').help_tags() end },
    }
}
-- nvim-treesitter/nvim-treesitter (finder/preview)
