local dap = require('dap')
local dapui = require('dapui')

dapui.setup()
require("nvim-dap-virtual-text").setup({})

-- DAP keymaps
vim.keymap.set('n', '<localleader>ds', dap.continue, { desc = 'Start debug session' })
vim.keymap.set('n', '<localleader>dc', dap.continue, { desc = 'Dap continue' })
vim.keymap.set('n', '<localleader>db', dap.toggle_breakpoint, { desc = 'Dap toggle breakpoint' })
vim.keymap.set('n', '<localleader>dB', function()
  dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end, { desc = 'Dap conditional breakpoint ' })
vim.keymap.set('n', '<localleader>dn', dap.step_over, { desc = 'Dap step over' })
vim.keymap.set('n', '<localleader>di', dap.step_into, { desc = 'Dap step into' })
vim.keymap.set('n', '<localleader>do', dap.step_out, { desc = 'Dap step out' })
vim.keymap.set('n', '<localleader>dC', dap.clear_breakpoints, { desc = 'Dap clear breakpoints' })
vim.keymap.set('n', '<localleader>de', dap.terminate, { desc = 'End debug session' })

-- DAP UI
dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
  dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
  dapui.close()
end

-- DAP Go setup
require('dap-go').setup()
