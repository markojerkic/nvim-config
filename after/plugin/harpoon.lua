local harpoon = require("harpoon")
local keymap = vim.keymap.set

local settings = {
	-- saves the harpoon file upon every change. disabling is unrecommended.
	save_on_change = true,

	-- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
	enter_on_sendcmd = false,

	-- closes any tmux windows harpoon that harpoon creates when you close Neovim.
	tmux_autoclose_windows = false,

	-- filetypes that you want to prevent from adding to the harpoon list menu.
	excluded_filetypes = { "harpoon" },

	-- set marks specific to each git branch inside git repository
	mark_branch = false,
};

-- REQUIRED
harpoon:setup({
	settings = {
		save_on_toggle = true,
	},
	global_settings = settings,
})
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

keymap("n", "<leader>1", function() harpoon:list():select(1) end, opts)
keymap("n", "<leader>2", function() harpoon:list():select(2) end, opts)
keymap("n", "<leader>3", function() harpoon:list():select(3) end, opts)
keymap("n", "<leader>4", function() harpoon:list():select(4) end, opts)
keymap("n", "<leader>5", function() harpoon:list():select(5) end, opts)
keymap("n", "<leader>6", function() harpoon:list():select(6) end, opts)
keymap("n", "<leader>7", function() harpoon:list():select(7) end, opts)
keymap("n", "<leader>8", function() harpoon:list():select(8) end, opts)
keymap("n", "<leader>9", function() harpoon:list():select(9) end, opts)


-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
