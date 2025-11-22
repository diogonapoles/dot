return {
	"ibhagwan/fzf-lua",
	dependencies = { "echasnovski/mini.icons" },
	cmd = "FzfLua",
	keys = {
		{ "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find Files" },
		{ "<leader>fg", "<cmd>FzfLua live_grep<cr>", desc = "Live Grep" },
		{ "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Find Buffers" },
		{ "<leader>fh", "<cmd>FzfLua help_tags<cr>", desc = "Help Tags" },
		{ "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Recent Files" },
		{ "<leader>fd", "<cmd>FzfLua diagnostics_document<cr>", desc = "Document Diagnostics" },
		{ "<leader>fD", "<cmd>FzfLua diagnostics_workspace<cr>", desc = "Workspace Diagnostics" },
	},
	opts = function()
		local actions = require("fzf-lua.actions")
		return {
			"default-title",
			winopts = {
				height = 0.85,
				width = 0.80,
				row = 0.35,
				col = 0.50,
				border = "rounded",
				preview = {
					border = "rounded",
					scrollbar = "float",
				},
			},
			files = {
				prompt = "Files❯ ",
				cwd_prompt = false,
				actions = {
					["ctrl-g"] = actions.toggle_ignore,
				},
			},
			grep = {
				prompt = "Grep❯ ",
				actions = {
					["ctrl-g"] = actions.toggle_ignore,
				},
			},
			lsp = {
				symbols = {
					symbol_icons = {
						File = "󰈔",
						Module = "󰆧",
						Namespace = "󰅪",
						Package = "󰏗",
						Class = "󰌗",
						Method = "󰆧",
						Property = "󰜢",
						Field = "󰜢",
						Constructor = "",
						Enum = "",
						Interface = "",
						Function = "󰊕",
						Variable = "󰀫",
						Constant = "󰏿",
						String = "󰀬",
						Number = "󰎠",
						Boolean = "◩",
						Array = "󰅪",
						Object = "󰅩",
						Key = "󰌋",
						Null = "󰟢",
						EnumMember = "",
						Struct = "󰌗",
						Event = "",
						Operator = "󰆕",
						TypeParameter = "󰊄",
					},
				},
			},
		}
	end,
}
