return {
    {
	"ray-x/navigator.lua",
	config = true,
	dependencies = {
	    { "ray-x/guihua.lua", build = "cd lua/fzy && make" },
	    { "neovim/nvim-lspconfig" },
	},
	mason = true,
    },
}
