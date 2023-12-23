vim.cmd("colorscheme rose-pine-main")

function ColourMyPencils(colour)
	colour = colour or vim.g.colors_name
	vim.cmd.colorscheme(colour)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

function UncolourMyPencils(colour)
	colour = colour or vim.g.colors_name
	vim.cmd.colorscheme(colour)

	vim.api.nvim_set_hl(100, "Normal", {})
	vim.api.nvim_set_hl(100, "NormalFloat", {})
end

ColourMyPencils()
