local M = {}

function M.setup()
    local telescope = require('telescope')
    local actions = require('telescope.actions')
    local action_state = require('telescope.actions.state')
    local finders = require('telescope.finders')
    local pickers = require('telescope.pickers')
    local sorters = require('telescope.sorters')
    local utils = require('telescope.utils')
    local previewers = require('telescope.previewers')

    local image_preview = function(opts)
        opts = opts or {}

        -- Use find command to get all jpg files in the specified directory
        local results = vim.fn.systemlist('find ~/Slike/WP -name "*.jpg"')
        local files = {}
        print("Results:")
        for i, v in ipairs(results) do
            print(i, vim.fn.fnamemodify(v, ':t'))
            files[i] = vim.fn.fnamemodify(v, ':t')
            -- local file = vim.fn.fnamemodify(v, ':t')
        end
        -- print(vim.inspect(results))

        pickers.new(opts, {
            prompt_title = 'Images in WP',
            finder = finders.new_table {
                results = files,
                entry_maker = function(line)
                    return {
                        value = line,
                        ordinal = line,
                        display = vim.fn.fnamemodify(line, ':t') -- Display just the filename
                    }
                end,
            },
            sorter = sorters.get_generic_fuzzy_sorter(),
            -- preview_title = 'Image Preview',
            -- previewer = previewers.new_termopen_previewer({
            --     get_command = function(entry)
            --         -- Use chafa to generate preview with specified parameters
            --         return { 'chafa', entry.value, '--format', 'symbols', '--symbols', 'vhalf', '--size', '60x17',
            --             '--stretch' }
            --     end
            -- }),
            attach_mappings = function(prompt_bufnr, map)
                actions.select_default:replace(function()
                    local selection = action_state.get_selected_entry()
                    actions.close(prompt_bufnr)

                    -- Open the selected image (you can customize this)
                    -- vim.fn.system({ 'xdg-open', selection.value })
                    print("Opening image: " .. selection.value)
                end)
                return true
            end,
        }):find()
    end

    -- Optional: Add a keymapping to trigger this function
    vim.keymap.set({ "n", "t" }, '<C-b>', image_preview, { noremap = true, silent = true })
end

return M
