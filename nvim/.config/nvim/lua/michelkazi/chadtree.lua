local status_ok = pcall(require, "chadtree")
if not status_ok then
  return
end
local chadtree_settings = {
  ["keymap.tertiary"] = {"t"},
  ["keymap.v_split"] = {"s"},
  ["keymap.split"] = {"S"},
  ["keymap.trash"] = {"d"},
  ["keymap.delete"] =  {"D"},
}

vim.api.nvim_set_var("chadtree_settings", chadtree_settings)
