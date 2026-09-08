-- [nfnl] fnl/easilok/dap.fnl
local _local_1_ = require("easilok.utils")
local keyset = _local_1_["keyset"]
local dap = require("dap")
local dap_virtual_text = require("nvim-dap-virtual-text")
local dapui = require("dapui")
dap.set_log_level("INFO")
local function dap_terminate_and_close()
  dap.terminate()
  return dapui.close()
end
dap_virtual_text.setup({})
dapui.setup()
keyset("n", "<F5>", dap.continue, {desc = "Dap Continue"})
keyset("n", "<F3>", dap.step_over, {desc = "Dap Step Over"})
keyset("n", "<F2>", dap.step_into, {desc = "Dap Step Into"})
keyset("n", "<F4>", dap.step_out, {desc = "Dap Step Out"})
keyset("n", "<space>db", dap.toggle_breakpoint, {desc = "[D]ap toggle [b]reakpoint"})
local function _2_()
  return dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end
keyset("n", "<space>dB", _2_, {desc = "[D]ap [B]reakpoint condition"})
local function _3_()
  return dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end
keyset("n", "<space>dp", _3_, {desc = "[D]ap set break[p]oint"})
keyset("n", "<space>dr", dap.repl.open, {desc = "[D]ap [R]epl"})
keyset("n", "<space>dx", dap_terminate_and_close, {desc = "[D]apui Close"})
keyset("n", "<space>dt", dap_terminate_and_close, {desc = "[D]apui [T]erminate"})
local function _4_()
  return dapui.open()
end
dap.listeners.after.event_initialized.dapui_config = _4_
local adapters = dap.adapters
if not adapters["pwa-node"] then
  adapters["pwa-node"] = {type = "server", host = "localhost", port = "${port}", executable = {command = "node", args = {vim.fn.expand("~/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js"), "${port}"}}}
else
end
if not adapters.node then
  dap.adapters.node = function(cb, config)
    if (config.type == "node") then
      config.type = "pwa-node"
    else
    end
    local native_adapter = dap.adapters["pwa-node"]
    if (type(native_adapter) == "function") then
      return native_adapter(cb, config)
    else
      return cb(native_adapter)
    end
  end
  apaters["node"] = dap.adapters.node
else
end
local function find_python_interpreter()
  local venv = os.getenv("VIRTUAL_ENV")
  if venv then
    return (venv .. "/bin/python")
  else
    return "python"
  end
end
if not adapters.python then
  local python = find_python_interpreter()
  adapters["python"] = {type = "executable", command = python, args = {"-m", "debugpy.adapter"}}
else
end
return {dap = dap, ["find-python-interpreter"] = find_python_interpreter}
