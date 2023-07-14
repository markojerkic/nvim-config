function ColourMyPencils(colour)
	-- colour = colour or "rose-pine"
	colour = colour or vim.g.colorscheme
	vim.cmd.colorscheme(colour)

	vim.api.nvim_set_hl(0, "Normal", {bg = "none"}	)
	vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"}	)
end

function UncolourMyPencils(colour)
	colour = colour or vim.g.colorscheme
	vim.cmd.colorscheme(colour)

	vim.api.nvim_set_hl(100, "Normal", {bg = "none"}	)
	vim.api.nvim_set_hl(100, "NormalFloat", {bg = "none"}	)
end


ColourMyPencils()
