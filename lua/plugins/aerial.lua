return {
	"stevearc/aerial.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("aerial").setup({
			-- optionally use on_attach to set keymaps when aerial has attached to a buffer
      backends = { "treesitter", "lsp", "markdown", "man" },
			on_attach = function(bufnr)
				-- Jump forwards/backwards with '{' and '}'
				vim.keymap.set("n", "[m", "<cmd>AerialPrev<CR>", { buffer = bufnr })
				vim.keymap.set("n", "]m", "<cmd>AerialNext<CR>", { buffer = bufnr })
			end,
		})
    require("telescope").load_extension("aerial")
		-- You probably also want to set a keymap to toggle aerial
		vim.keymap.set("n", "<leader>a", "<cmd>Telescope aerial<CR>")
	end,
}
