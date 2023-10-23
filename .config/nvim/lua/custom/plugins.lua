local plugins = {
  --- GENERAL PLUGINS
  {
    "neovim/nvim-lspconfig",
    config = function(_)
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },
  {
    -- to install LSPs
    "williamboman/mason.nvim",
    opts = {
      -- LSPs required
      ensure_installed = {
        "gopls",
        "typescript-language-server",
        "eslint-lsp",
        "prettier",
        "js-debug-adapter"
      }
    },
  },
  {
    -- formatting plugin for multiple languages
    "jose-elias-alvarez/null-ls.nvim",
    ft = "go",
    opts = function ()
      return require "custom.configs.null-ls"
    end
  },
  --[[ {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require "custom.configs.lint"
    end
  }, ]]
  --- LANGUAGE SPECIFIC
  -- GO
  {
    "mfussenegger/nvim-dap",
    init = function ()
      require("core.utils").load_mappings("dap")
      require "custom.configs.dap"
    end
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    config = function (_, opts)
      require("dap-go").setup(opts)
    end
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function (_, opts)
      require("gopher").setup(opts)
    end,
    build = function ()
      vim.cmd [[silent! GoInstallDeps]]
    end
  },
  -- NODE, TS, JS
  --[[ {
    "mhartington/formatter.nvim",
    event = "VeryLazy",
    opts = function ()
      return require "custom.configs.formatter"
    end
  } ]]
}

return plugins;
