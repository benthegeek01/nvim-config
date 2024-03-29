local dap, ui = require("dap"), require("dapui")

ui.setup()
require("which-key").register({
	d = {
		function()
			print("No debug configuration found for this file type.")
		end,
		"[NO DEBUGGING CONFIGURED]",
	},
}, { prefix = "<leader>" })

local dap_configs = {
	python = ".py",
}

for k, v in pairs(dap_configs) do
	vim.cmd(string.format(
		[[
        augroup DAPConfig_%s
            autocmd!
            autocmd BufRead,BufNewFile *%s lua require("conf.plugins.dap-configs.%s").configure()
        augroup END
    ]],
		k,
		v,
		k
	))
end
