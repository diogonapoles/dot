return {
	"nvim-mini/mini.nvim",
	version = false,
	config = function()
		require("mini.pairs").setup()
		require("mini.surround").setup()
		require("mini.icons").setup()
		MiniIcons.mock_nvim_web_devicons()

		require("mini.diff").setup({
			view = {
				style = "sign",
				signs = {
					add = "┃",
					change = "┃",
					delete = "_",
				},
			},
		})

		require("mini.jump").setup()

		require("mini.notify").setup({
			content = {
				format = function(notif)
					return notif.msg
				end,
			},
			window = {
				config = function()
					local has_statusline = vim.o.laststatus > 0
					local pad = vim.o.cmdheight + (has_statusline and 1 or 0)

					return {
						border = "rounded",
						col = vim.o.columns,
						row = vim.o.lines - pad,
						anchor = "SE",
						title = "",
					}
				end,
			},
		})
		MiniNotify.make_notify()

		require("mini.indentscope").setup()
	end,
}
