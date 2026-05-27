-- https://github.com/okuuva/auto-save.nvim
return {
	"okuuva/auto-save.nvim",
	version = "^1.0.0", -- see https://devhints.io/semver, alternatively use '*' to use the latest tagged release
	cmd = "ASToggle", -- optional for lazy loading on command
	event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
	opts = {
		enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)

		trigger_events = { -- See :h events
			immediate_save = { "BufLeave", "FocusLost", "QuitPre", "VimSuspend" }, -- vim events that trigger an immediate save
			defer_save = { "InsertLeave", "TextChanged" }, -- vim events that trigger a deferred save (saves after `debounce_delay`)
			cancel_deferred_save = { "InsertEnter" }, -- vim events that cancel a pending deferred save
		},
		-- Refuse to overwrite a file that has been modified on disk since we last
		-- read it. On conflict, reload from disk (system version wins) and drop
		-- the unsaved buffer edits — matches the project policy that external
		-- changes (git pull, coding agents, other editors) are intentional and
		-- should beat forgotten in-buffer edits. See init.lua `track-buffer-mtime`.
		condition = function(buf)
			local name = vim.api.nvim_buf_get_name(buf)
			if name == "" or vim.fn.filereadable(name) == 0 then
				return true
			end
			local disk_mtime = vim.fn.getftime(name)
			local known_mtime = vim.b[buf].last_known_mtime or disk_mtime
			if disk_mtime > known_mtime then
				vim.schedule(function()
					if not vim.api.nvim_buf_is_valid(buf) then
						return
					end
					vim.api.nvim_buf_call(buf, function()
						vim.cmd("edit!")
					end)
					vim.notify(
						"Auto-save skipped: " .. vim.fn.fnamemodify(name, ":t")
							.. " changed on disk. Reloaded from disk; unsaved buffer edits discarded.",
						vim.log.levels.WARN
					)
				end)
				return false
			end
			return true
		end,
		write_all_buffers = false, -- write all buffers when the current one meets `condition`
		noautocmd = false, -- do not execute autocmds when saving
		lockmarks = false, -- lock marks when saving, see `:h lockmarks` for more details
		debounce_delay = 1000, -- delay after which a pending save is executed
		-- log debug messages to 'auto-save.log' file in neovim cache directory, set to `true` to enable
		debug = false,
	},
}
