
return {
  {
    'mfussenegger/nvim-dap',
    tag = '0.6.0',
    config = function()
      local dap = require('dap')

      dap.adapters.cppdbg = {
        id = 'cppdbg',
        type = 'executable',
        command = '/opt/vscode-cpptools/v1.27.7/extension/debugAdapters/bin/OpenDebugAD7',
      }

      local gdb_pretty_print = {
        {
          text = '-enable-pretty-printing',
          description = 'enable pretty prining',
          ignoreFailures = false,
        },
      }

      dap.configurations.c = {
        {
          name = 'Launch file',
          type = 'cppdbg',
          request = 'launch',
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopAtEntry = true,
          setupCommands = gdb_pretty_print,
        },

        {
          name = 'Attach to gdbserver :1234',
          type = 'cppdbg',
          request = 'launch',
          MIMode = 'gdb',
          miDebuggerServiceAddress = 'localhost:1234',
          miDebuggerPath = '/usr/bin/gdb',
          cwd = '${workspaceFolder}',
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          setupCommands = gdb_pretty_print,
        },
      }

      dap.configurations.cpp = dap.configurations.c
      dap.configurations.rust = dap.configurations.c

    end,
    keys = {
      { '<F5>', '<Cmd>lua require("dap").continue()<cr>' },
      { '<F10>', '<Cmd>lua require("dap").step_over()<cr>' },
      { '<F11>', '<Cmd>lua require("dap").step_into()<cr>' },
      { '<F12>', '<Cmd>lua require("dap").step_out()<cr>' },
      { '<leader>b', '<Cmd>lua require("dap").toggle_breakpoint()<cr>' },
      { '<leader>B', '<Cmd>lua require("dap").set_breakpoint()<cr>' },
      { '<leader>lp', '<Cmd>lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<cr>' },
      { '<leader>dr', '<Cmd>lua require("dap").repl.open()<cr>' },
      { '<leader>dl', '<Cmd>lua require("dap").run_last()<cr>' },
      { '<leader>dh', '<Cmd>lua require("dap.ui.widgets").hover()<cr>', mode = { 'n', 'v' } },
      { '<leader>dp', '<Cmd>lua require("dap.ui.widgets").preview()<cr>', mode = { 'n', 'v' } },
      { '<leader>df', '<Cmd>lua require("dap.ui.widgets").centered_float(require("dap.ui.widgets").frames)<cr>' },
      { '<leader>ds', '<Cmd>lua require("dap.ui.widgets").centered_float(require("dap.ui.widgets").scopes)<cr>' },
    }
  },
}
