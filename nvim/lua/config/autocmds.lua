-- highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
	desc = "Highlight when yanking text",
	callback = function()
		vim.highlight.on_yank({ timeout = 200 })
	end,
})

-- restore cursor to file position in previous editing session
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function(args)
		local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
		local line_count = vim.api.nvim_buf_line_count(args.buf)
		if mark[1] > 0 and mark[1] <= line_count then
			vim.api.nvim_win_set_cursor(0, mark)
			-- defer centering slightly so it's applied after render
			vim.schedule(function()
				vim.cmd("normal! zz")
			end)
		end
	end,
})

-- auto resize splits
vim.api.nvim_create_autocmd("VimResized", {
	command = "wincmd =",
})

-- cursor line only in active window
vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
	group = vim.api.nvim_create_augroup("active_cursorline", { clear = true }),
	callback = function()
		vim.opt_local.cursorline = true
	end,
})

-- highlight references when the cursor is idle (stops/holds)
vim.api.nvim_create_autocmd("CursorHold", {
	group = vim.api.nvim_create_augroup("LspReferenceHighlight", { clear = true }),
	desc = "Highlight references when cursor stops",
	callback = function()
		if vim.fn.mode() ~= "i" then
			local clients = vim.lsp.get_clients({ bufnr = 0 })
			local supports_highlight = false
			for _, client in ipairs(clients) do
				if client.server_capabilities.documentHighlightProvider then
					supports_highlight = true
					-- found a supporting client, no need to check others
					break
				end
			end

			-- proceed only if an LSP is active AND supports the feature
			if supports_highlight then
				vim.lsp.buf.clear_references()
				vim.lsp.buf.document_highlight()
			end
		end
	end,
})

-- clear highlights when the cursor moves again
vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
	group = "LspReferenceHighlight",
	desc = "Clear references when cursor moves",
	callback = function()
		vim.lsp.buf.clear_references()
	end,
})
