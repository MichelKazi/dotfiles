local status, navigator = pcall(require, "navigator")
if (not status) then return end

navigator.setup({
  mason = true
})
