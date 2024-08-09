return {
    {
        "nyoom-engineering/oxocarbon.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            vim.opt.background = "light" -- set this to dark or light
            vim.cmd("colorscheme oxocarbon")
        end,
    }
}
