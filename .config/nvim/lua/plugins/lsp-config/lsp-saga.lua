local saga = require("lspsaga")

saga.setup{
  server_filetype_map = {
    typescript = 'typescript'
  },
  ui = {
    title = false,
  }
}
