-- python_files.lua
--
-- python specific settings for files
return {
  -- look for python files
  config = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "python",
      command = "setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4",
    })
  end,
}
