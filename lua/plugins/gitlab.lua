return {
	"harrisoncramer/gitlab.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
	},
	build = function()
		require("gitlab.server").build(true)
	end, -- Builds the Go binary
	config = function()
		require("gitlab").setup({
			connection_settings = {
				insecure = true, -- This might be the option name
			},
		})

		-- GitLab.nvim Custom Commands
		-- Add this to your init.lua or in a separate file and require it

		-- Core MR Management Commands
		vim.api.nvim_create_user_command("MRSelect", function(opts)
			if opts.args and opts.args ~= "" then
				-- If MR ID provided, switch to specific MR
				require("gitlab").switch_merge_request(tonumber(opts.args))
			else
				-- Show MR picker/list
				require("gitlab").choose_merge_request()
			end
		end, {
			nargs = "?",
			desc = "Select/Switch MR (optional: provide MR ID)",
			complete = function()
				-- You could implement MR ID completion here if the plugin supports it
				return {}
			end,
		})

		vim.api.nvim_create_user_command("MRReview", function()
			require("gitlab").review()
		end, { desc = "Start reviewing current MR" })

		vim.api.nvim_create_user_command("MRSummary", function()
			require("gitlab").summary()
		end, { desc = "Show MR summary and details" })

		vim.api.nvim_create_user_command("MRCreate", function()
			require("gitlab").create_mr()
		end, { desc = "Create new merge request" })

		vim.api.nvim_create_user_command("MROpen", function()
			require("gitlab").open_in_browser()
		end, { desc = "Open current MR in browser" })

		-- Comment and Discussion Commands
		vim.api.nvim_create_user_command("MRComment", function(opts)
			if opts.range == 2 then
				-- Visual selection - multiline comment
				require("gitlab").create_multiline_comment()
			else
				-- Single line comment
				require("gitlab").create_comment()
			end
		end, {
			range = true,
			desc = "Add comment to current line or selection",
		})

		vim.api.nvim_create_user_command("MRNote", function()
			require("gitlab").create_note()
		end, { desc = "Create general MR note (not tied to code)" })

		vim.api.nvim_create_user_command("MRSuggest", function()
			require("gitlab").create_comment_suggestion()
		end, { desc = "Create code suggestion comment" })

		vim.api.nvim_create_user_command("MRDiscussions", function()
			require("gitlab").toggle_discussions()
		end, { desc = "Toggle discussions panel" })

		vim.api.nvim_create_user_command("MRDrafts", function(opts)
			if opts.args == "publish" then
				require("gitlab").publish_all_drafts()
			else
				require("gitlab").toggle_draft_mode()
			end
		end, {
			nargs = "?",
			desc = 'Toggle draft mode or publish all drafts (use "publish" arg)',
			complete = function()
				return { "publish" }
			end,
		})

		-- Approval and Review Commands
		vim.api.nvim_create_user_command("MRApprove", function()
			require("gitlab").approve()
		end, { desc = "Approve current MR" })

		vim.api.nvim_create_user_command("MRRevoke", function()
			require("gitlab").revoke()
		end, { desc = "Revoke MR approval" })

		vim.api.nvim_create_user_command("MRAddReviewer", function(opts)
			if opts.args and opts.args ~= "" then
				require("gitlab").add_reviewer(opts.args)
			else
				require("gitlab").add_reviewer()
			end
		end, {
			nargs = "?",
			desc = "Add reviewer to MR (optional: specify username)",
		})

		vim.api.nvim_create_user_command("MRRemoveReviewer", function(opts)
			if opts.args and opts.args ~= "" then
				require("gitlab").delete_reviewer(opts.args)
			else
				require("gitlab").delete_reviewer()
			end
		end, {
			nargs = "?",
			desc = "Remove reviewer from MR (optional: specify username)",
		})

		vim.api.nvim_create_user_command("MRAddAssignee", function(opts)
			if opts.args and opts.args ~= "" then
				require("gitlab").add_assignee(opts.args)
			else
				require("gitlab").add_assignee()
			end
		end, {
			nargs = "?",
			desc = "Add assignee to MR (optional: specify username)",
		})

		vim.api.nvim_create_user_command("MRRemoveAssignee", function(opts)
			if opts.args and opts.args ~= "" then
				require("gitlab").delete_assignee(opts.args)
			else
				require("gitlab").delete_assignee()
			end
		end, {
			nargs = "?",
			desc = "Remove assignee from MR (optional: specify username)",
		})

		-- Pipeline and CI Commands
		vim.api.nvim_create_user_command("MRPipeline", function()
			require("gitlab").pipeline()
		end, { desc = "Show MR pipeline status" })

		vim.api.nvim_create_user_command("MRJobs", function()
			require("gitlab").open_in_browser() -- Usually opens to pipeline tab
			vim.notify("Opening pipeline in browser. For detailed job logs, check the GitLab web interface.")
		end, { desc = "View MR pipeline jobs (opens in browser)" })

		-- Utility Commands
		vim.api.nvim_create_user_command("MRSettings", function()
			require("gitlab").print_settings()
		end, { desc = "Print current GitLab plugin settings" })

		vim.api.nvim_create_user_command("MRRefresh", function()
			require("gitlab").refresh()
		end, { desc = "Refresh MR data" })

		vim.api.nvim_create_user_command("MRInfo", function()
			-- Custom info command that shows key MR details
			local gitlab = require("gitlab")
			gitlab.summary()
			vim.defer_fn(function()
				vim.notify("Use :MRSummary for detailed info, :MRPipeline for CI status")
			end, 1000)
		end, { desc = "Show MR information and available commands" })

		-- Quick workflow commands
		vim.api.nvim_create_user_command("MRQuickReview", function()
			-- Quick review workflow
			require("gitlab").review()
			vim.defer_fn(function()
				require("gitlab").toggle_discussions()
			end, 500)
		end, { desc = "Quick review: open MR review with discussions" })

		vim.api.nvim_create_user_command("MRQuickApprove", function()
			-- Quick approve with confirmation
			local choice = vim.fn.confirm("Approve this MR?", "&Yes\n&No", 2)
			if choice == 1 then
				require("gitlab").approve()
				vim.notify("MR approved! 👍")
			end
		end, { desc = "Quick approve with confirmation dialog" })

		-- Help command
		vim.api.nvim_create_user_command("MRHelp", function()
			local help_text = [[
GitLab MR Commands:
─────────────────────
Core:
  :MRSelect [id]     - Select/switch MR
  :MRReview          - Start reviewing
  :MRSummary         - Show MR details
  :MRCreate          - Create new MR
  :MROpen            - Open in browser

Comments:
  :MRComment         - Add comment to line/selection
  :MRNote            - Add general note
  :MRSuggest         - Suggest code changes
  :MRDiscussions     - Toggle discussions
  :MRDrafts [publish] - Manage draft comments

Review:
  :MRApprove         - Approve MR
  :MRRevoke          - Revoke approval
  :MRAddReviewer     - Add reviewer
  :MRRemoveReviewer  - Remove reviewer

Quick Actions:
  :MRQuickReview     - Review + discussions
  :MRQuickApprove    - Approve with confirmation
  :MRInfo            - Show MR info
]]
			vim.notify(help_text)
		end, { desc = "Show GitLab MR commands help" })

		-- Optional: Create abbreviations for frequently used commands
		vim.cmd("cnoreabbrev mr MRSelect")
		vim.cmd("cnoreabbrev mrr MRReview")
		vim.cmd("cnoreabbrev mra MRApprove")
		vim.cmd("cnoreabbrev mrc MRComment")
		vim.cmd("cnoreabbrev mro MROpen")
	end,
}
