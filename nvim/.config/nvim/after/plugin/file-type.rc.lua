local status, file_type = pcall(require, "filetype")
if not status then
  return
end

file_type.setup {
  overrides = {
    extensions = {
      tf = "terraform",
      tfvars = "terraform",
      tfstate = "json"
    }
  }
}
