return {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = true,
    keys = {
        { "<leader>m", ":NvimTreeToggle<cr>" }
    }
}
