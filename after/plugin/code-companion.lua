-- [nfnl] after/plugin/code-companion.fnl
local _local_1_ = require("easilok.utils")
local keyset = _local_1_["keyset"]
local available_models = {"google/gemini-2.5-pro", "google/gemini-2.5-flash-preview-05-20", "anthropic/claude-sonnet-4", "anthropic/claude-3.7-sonnet", "openai/gpt-4o-mini"}
local current_model = "openai/gpt-4o-mini"
local function select_model()
  local function _2_(choice)
    if choice then
      current_model = choice
      return vim.notify(("Selected model: " .. current_model))
    else
      return nil
    end
  end
  return vim.ui.select(available_models, {prompt = "Select  Model:"}, _2_)
end
local function create_openrouter_adapter()
  local adapters = require("codecompanion.adapters")
  return adapters.extend("openai_compatible", {env = {url = "https://openrouter.ai/api", api_key = "OPENROUTER_API_KEY", chat_url = "/v1/chat/completions"}, schema = {model = {default = current_model}}})
end
local ok, codecompanion = pcall(require, "codecompanion")
if ok then
  codecompanion.setup({telescope_integration = true, lsp_integration = true, strategies = {chat = {adapter = "anthropic", model = "claude-sonnet-4-20250514"}}, inline = {adapter = "anthropic", model = "claude-sonnet-4-20250514"}, adapters = {openrouter = create_openrouter_adapter}})
  local function _4_()
    return vim.call("CodeCompanionChat toggle", {desc = "Toggle CodeCompanion"})
  end
  keyset("n", "<space>cc", _4_)
  local function _5_()
    return vim.call("CodeCompanionAsk")
  end
  keyset("v", "<space>ca", _5_, {desc = "Ask about selected code"})
  keyset("n", "<space>cm", select_model, {desc = "Select Openrouter module"})
  local function _6_()
    return vim.call("CodeCompanionReview")
  end
  keyset("v", "<space>cr", _6_, {desc = "Review selected code"})
  local function _7_()
    return vim.call("CodeCompanionTest")
  end
  keyset("v", "<space>ct", _7_, {desc = "Generate tests for selected code"})
  local function _8_()
    return vim.call("CodeCompanionFix")
  end
  return keyset("n", "<space>cf", _8_, {desc = "Fix problems in current buffer"})
else
  return nil
end
