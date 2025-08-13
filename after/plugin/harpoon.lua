-- [nfnl] after/plugin/harpoon.fnl
local _local_1_ = require("easilok.utils")
local keyset = _local_1_["keyset"]
local harpoon = require("harpoon")
harpoon:setup()
local function _2_()
  return harpoon:list():add()
end
keyset("n", "<leader>aa", _2_, {desc = "H[a]rpoon [A]dd"})
local function _3_()
  return harpoon.ui:toggle_quick_menu(harpoon:list())
end
keyset("n", "<leader>tq", _3_, {desc = "[T]oggle Harpoon [Q]uick Menu"})
local function _4_()
  return harpoon:list():add()
end
keyset("n", "<space>ha", _4_, {desc = "[H]arpoon [A]dd"})
local function _5_()
  return harpoon.ui:toggle_quick_menu(harpoon:list())
end
keyset("n", "<space>hm", _5_, {desc = "[H]arpoon toggle [M]enu"})
local function _6_()
  return harpoon:list():select(1)
end
keyset("n", "<M-h>", _6_, {desc = "Harpoon select 1"})
local function _7_()
  return harpoon:list():select(2)
end
keyset("n", "<M-j>", _7_, {desc = "Harpoon select 2"})
local function _8_()
  return harpoon:list():select(3)
end
keyset("n", "<M-k>", _8_, {desc = "Harpoon select 3"})
local function _9_()
  return harpoon:list():select(4)
end
keyset("n", "<M-l>", _9_, {desc = "Harpoon select 4"})
local function _10_()
  return harpoon:list():prev()
end
keyset("n", "<C-S-P>", _10_, {desc = "Harpoon select previous"})
local function _11_()
  return harpoon:list():next()
end
keyset("n", "<C-S-N>", _11_, {desc = "Harpoon select next"})
local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local telescope_conf = require("telescope.config").values
  local picker = pickers.new({}, {prompt_title = "Harpoon", finder = finders.new_table({results = file_paths}), previewer = telescope_conf.file_previewer({}), sorter = telescope_conf.generic_sorter({})})
  return picker:find()
end
local function _12_()
  return toggle_telescope(harpoon:list())
end
keyset("n", "<leader>ga", _12_, {desc = "Telescope [g]rep h[a]rpoon"})
local function _13_()
  return toggle_telescope(harpoon:list())
end
return keyset("n", "<space>ht", _13_, {desc = "[H]arpoon [T]elescope grep"})
