return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			diagnostics = "nvim_lsp",
			separator_style = "slant",
			show_buffer_close_icons = false,
			-- Pin master.tex (always visible)
			custom_filter = function(buf_number)
				local name = vim.api.nvim_buf_get_name(buf_number)
				return not string.match(name, "master.tex") or vim.bo[buf_number].filetype == "latex"
			end,
		},
	},
}
