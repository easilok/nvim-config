-- [nfnl] plugin/sassy.fnl
local M = {options = {default_name = "session", old_sessions = 30, sassy_dir = (vim.fn.stdpath("data") .. "/sassy")}, sassy_is_tracking = false}
local function clean_path(name)
  if name then
    return name:gsub("%s+", "_"):gsub("[^%w_-]", "")
  else
    return nil
  end
end
local function get_git_root()
  local git_root = vim.fn.system("git rev-parse --show-toplevel | tr -d \"\\n\" 2>/dev/null")
  if (vim.v.shell_error == 0) then
    return vim.fn.fnamemodify(git_root, ":t")
  else
    return nil
  end
end
local function get_root_directory()
  local cwd = vim.fn.getcwd()
  return vim.fn.fnamemodify(cwd, ":t")
end
local function get_git_branch()
  local branch = vim.fn.system("git branch --show-current | tr -d \"\\n\" 2>/dev/null")
  if (vim.v.shell_error == 0) then
    return branch
  else
    return nil
  end
end
local function ensure_directory(path)
  return vim.fn.mkdir(path, "p")
end
local function check_existing_session(session_path)
  if session_path then
    return not (vim.fn.filereadable(session_path) == 0)
  else
    return nil
  end
end
local function create_new_session(sassy)
  local project = (get_git_root() or get_root_directory())
  local session = (get_git_branch() or sassy.options.default_name)
  local base_dir = sassy.options.sassy_dir
  local project_dir = (base_dir .. "/" .. clean_path(project))
  local session_path = string.format("%s/%s.vim", project_dir, clean_path(session))
  ensure_directory(project_dir)
  if check_existing_session(session_path) then
    local ok, _ = pcall(vim.api.nvim_exec2, ("source " .. session_path), {})
    local obsession_status = vim.call("ObsessionStatus")
    sassy.sassy_is_tracking = true
    if not ok then
      if (obsession_status == ",S,") then
        vim.notify("Error loading session but starting Obsession anyway...", vim.log.levels.INFO)
        return vim.cmd("Obsession")
      else
        vim.notify("Could not load session...", vim.log.levels.ERROR)
        sassy.sassy_is_tracking = false
        return nil
      end
    else
      return nil
    end
  else
    vim.cmd(("Obsession " .. session_path))
    sassy.sassy_is_tracking = true
    return nil
  end
end
M.start_session = function(self)
  local obsession_status = vim.call("ObsessionStatus")
  if (self.sassy_is_tracking and (obsession_status == "[S]")) then
    return vim.cmd("Obsession")
  else
    return create_new_session(self)
  end
end
M.stop_session = function(self)
  if not self.sassy_is_tracking then
    return vim.notify("No current tracking session", vim.log.levels.ERROR)
  else
    local obsession_status = vim.call("ObsessionStatus")
    if (obsession_status == "[$]") then
      vim.cmd("Obsession")
      self.sassy_is_tracking = false
      return nil
    else
      return vim.notify("Obsession not reporting onging session", vim.log.levels.ERROR)
    end
  end
end
M.clean_sessions = function()
  local base_dir = M.options.sassy_dir
  local cmd = string.format("find %s -type f -name \"*.vim\" -mtime +%d -exec rm -f {} \\;", base_dir, M.options.old_sessions)
  vim.fn.system(cmd)
  if (vim.v.shell_error == 0) then
    return vim.notify("Deleted old sessions.", vim.log.levels.INFO)
  else
    return vim.notify("Something went wrong cleaning old sessions", vim.log.levels.ERROR)
  end
end
local function setup_commands()
  local function _12_()
    return M:start_session()
  end
  vim.api.nvim_create_user_command("Sassy", _12_, {})
  local function _13_()
    return M:stop_session()
  end
  vim.api.nvim_create_user_command("SassyStop", _13_, {})
  local function _14_()
    return M:clean_sessions()
  end
  return vim.api.nvim_create_user_command("SassyClean", _14_, {})
end
M.setup = function(self, options)
  if options then
    for k, v in ipairs(options) do
      self.options[k] = v
    end
  else
  end
  return setup_commands()
end
M:setup()
return M
