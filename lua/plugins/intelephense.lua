local lspUtil = require("lspconfig.util")

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        intelephense = {
          root_dir = lspUtil.root_pattern("wp-config.php", "composer.json", ".git"),
        },
      },
    },
  },
}
