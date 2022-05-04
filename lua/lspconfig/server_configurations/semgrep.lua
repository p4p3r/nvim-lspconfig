local util = require 'lspconfig.util'

local cmd = { 'python', '-m', 'semgrep_rpc.server', '--lsp', '--config', 'p/r2c' }

if vim.fn.has 'win32' == 1 then
  cmd = { 'cmd.exe', '/C', 'python', '-m', 'semgrep_rpc.server', '--lsp', '--config', 'p/r2c' }
end

return {
  default_config = {
    cmd = cmd,
    filetypes = { 'python' },
    root_dir = function(fname)
      return util.find_git_ancestor(fname) or vim.loop.os_homedir()
    end,
    single_file_support = true,
  },
  docs = {
    description = [[
https://github.com/returntocorp/semgrep
A language server for Semgrep.
]],
  },
}
