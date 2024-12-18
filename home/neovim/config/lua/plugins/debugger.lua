local dap = require('dap')
require('dapui').setup()

-- dap.adapters.lldb = {
-- 	type = 'executable',
-- 	command = '/etc/profiles/per-user/derek/bin/lldb',
-- 	name = 'lldb',
-- 	host = '127.0.0.1',
-- 	port = 12345,
-- }
dap.adapters.codelldb = function(cb, config)
	vim.fn.system({
		'/run/current-system/sw/bin/g++',
		'fdiagnostics-color=always',
		'-g',
		vim.fn.expand('%'),
		'-o',
		vim.fn.getcwd() .. '/main',
		'-D',
		'DEBUG',
	})

	cb({
		type = 'server',
		port = '12345',
		executable = {
			command = '/home/derek/.vscode-oss/extensions/vadimcn.vscode-lldb/adapter/codelldb',
			args = { '--port', '12345' },
		},
	})
end
dap.configurations.cpp = {
	{
		name = 'Launch file',
		type = 'codelldb',
		request = 'launch',
		program = function()
			return vim.fn.getcwd() .. '/main'
		end,
		cwd = '${workspaceFolder}',
		stopOnEntry = false,
	},
}

return {
	{
		'mfussenegger/nvim-dap',
		config = function() end,
	},
}
