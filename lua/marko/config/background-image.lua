-- local M = {}
--
-- --- Find all images in the specified directory using nvim io api
-- ---@return table
-- function M.find_images()
--     local files = vim.fn.globpath(vim.fn.expand("~/Slike/WP"), "*.jpg", true, true)
--
--     local results = {}
--     for _, file in ipairs(files) do
--         table.insert(results, vim.fn.fnamemodify(file, ':t'))
--     end
--
--     return results
-- end
--
-- function M.setup()
--     local telescope = require('telescope')
--     local actions = require('telescope.actions')
--     local action_state = require('telescope.actions.state')
--     local finders = require('telescope.finders')
--     local pickers = require('telescope.pickers')
--     local sorters = require('telescope.sorters')
--     local utils = require('telescope.utils')
--     local previewers = require('telescope.previewers')
--
--     local image_preview = function(opts)
--         opts = opts or {}
--         local files = M.find_images()
--
--         -- pickers.new(opts, {
--         --     opts = opts or {},
--         pickers.new(opts, {
--             prompt_title = "colors",
--             finder = finders.new_table {
--                 results = { "marko", files[1] },
--                 entry_maker = function(filepath)
--                     print("Filepath: " .. filepath)
--                     return {
--                         value = filepath,
--                         ordinal = vim.fn.fnamemodify(filepath, ':t'),
--                         display = vim.fn.fnamemodify(filepath, ':t')
--                     }
--                 end,
--             },
--             -- sorter = sorters.get_generic_fuzzy_sorter(),
--         }):find()
--
--         -- prompt_title = 'Images in WP',
--         -- finder = finders.new_table {
--         --     results = results,
--         --     entry_maker = function(filepath)
--         --         return {
--         --             value = filepath,
--         --             ordinal = vim.fn.fnamemodify(filepath, ':t'),
--         --             display = vim.fn.fnamemodify(filepath, ':t')
--         --         }
--         --     end,
--         -- },
--         -- sorter = sorters.get_generic_fuzzy_sorter(),
--         -- -- previewer = previewers.new_termopen_previewer({
--         -- --     get_command = function(entry)
--         -- --         -- Use chafa to generate preview with specified parameters
--         -- --         return {
--         -- --             'chafa',
--         -- --             entry.value,
--         -- --             '--format', 'symbols',
--         -- --             '--symbols', 'vhalf',
--         -- --             '--size', '60x17',
--         -- --             '--stretch'
--         -- --         }
--         -- --     end
--         -- -- }),
--         -- attach_mappings = function(prompt_bufnr, map)
--         --     actions.select_default:replace(function()
--         --         local selection = action_state.get_selected_entry()
--         --         actions.close(prompt_bufnr)
--         --
--         --         -- Open the selected image
--         --         vim.fn.system({ 'xdg-open', selection.value })
--         --         print("Opening image: " .. selection.value)
--         --     end)
--         --     return true
--         -- end,
--         -- }):find()
--     end
--
--     -- Optional: Add a keymapping to trigger this function
--     local Marko_ImagePicker = vim.api.nvim_create_augroup("Marko_ImagePicker", {})
--     local autocmd = vim.api.nvim_create_autocmd
--
--     autocmd("BufWinEnter", {
--         group = Marko_ImagePicker,
--         pattern = "*",
--         callback = function()
--             vim.keymap.set({ "n", "t" }, '<C-b>', function()
--                 image_preview()
--             end)
--         end
--     })
-- end
--
-- return M
--

local M = {}


function M.get_image_dimensions(filepath)
    local cmd = string.format("identify -format '%%w %%h' '%s'", filepath)
    local result = vim.fn.systemlist(cmd)

    if #result > 0 then
        local width, height = result[1]:match("(%d+) (%d+)")
        return tonumber(width), tonumber(height)
    end

    return nil, nil
end

function M.setup()
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')
    local actions = require('telescope.actions')
    local previewers = require('telescope.previewers')

    local image_preview = function(opts)
        opts = opts or {}

        -- Use vim.fn.globpath to get files
        local files = vim.fn.globpath(vim.fn.expand("~/Slike/WP"), "*.jpg", true, true)

        -- Use Telescope's built-in file picker with a specific path
        builtin.find_files({
            prompt_title = "Images in WP",
            cwd = "~/Slike/WP",
            file_ignore_patterns = { "*" }, -- Clear any ignore patterns
            previewer = previewers.new_termopen_previewer({
                get_command = function(entry)
                    local width = math.floor(vim.o.columns / 2.5)
                    local height = math.floor(width * 0.3) -- Calculate proportional height
                    print("Image size: " .. string.format('%dx%d', width, height))

                    return {
                        'chafa',
                        entry.path,
                        '--format', 'symbols',
                        '--symbols', 'vhalf',
                        '--size', string.format('%dx%d', width, height),
                        '--stretch'
                    }
                end
            }),
            attach_mappings = function(prompt_bufnr)
                actions.select_default:replace(function()
                    local selection = require('telescope.actions.state').get_selected_entry()
                    actions.close(prompt_bufnr)

                    if selection and selection.path then
                        print("Selected image: " .. selection.path)
                        vim.fn.system({ 'xdg-open', selection.path })
                    end
                end)
                return true
            end
        })
    end

    -- Global keymapping
    vim.keymap.set({ "n", "t" }, '<C-b>', image_preview, { noremap = true, silent = false })
end

return M
