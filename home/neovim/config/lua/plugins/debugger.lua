local dap = require('dap')
require('dapui').setup()

print('i like men')
dap.adapters.lldb = {
	type = 'executable',
	command = '/etc/profiles/per-user/derek/bin/lldb',
	name = 'lldb',
	host = '127.0.0.1',
	port = 12345,
}
dap.adapters.codelldb = {
	type = 'server',
	port = '12345',
	executable = {
		command = '/home/derek/.vscode-oss/extensions/vadimcn.vscode-lldb/adapter/codelldb',
		args = { '--port', '12345' },
	},
}
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
