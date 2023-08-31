local plugins = {
  
  {
    "sitiom/nvim-numbertoggle",
    lazy = false,
  },
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    config = function()
      require("transparent").setup{
        groups = { -- table: default groups
          'Normal',
          'NormalNC', 
          'Comment', 'Constant', 'Special', 'Identifier',
          'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
          'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
          'SignColumn', 'CursorLineNr', 'EndOfBuffer',
      },
  
      extra_groups = {
          "NormalFloat", 
          "NvimTreeNormal",
          "NvimTreeIndentMarker",
          "NvimTreePopup",
          "NvimTreeWinSeparator",
          "NvimTreeNormalFloat",
          "NvimTreeNormalNC",
          "NvimTreeCursorColumn",
          'FoldColumn', 'Folded', 'VertSplit', 'StatusLine',
          'StatusLineNC', 'TabLineFill', 'TabLineSel', 'TabLine', 'CursorLine', 'CursorColumn', 'St_EmptySpace2',
          'ColorColumn','FloatShadow', 'FloatShadowThrough','Visual','QuickFixLine',
          'Pmenu', 'PmenuKind', 'PmenuExtra', 'PmenuSbar', 'PmenuThumb','Folded, FoldColumn',
        }, -- table: additional groups that should be cleared
      exclude_groups = {}, -- table: groups you don't want to clear
    }
    end,  
  },  
  {
    "ggandor/leap.nvim",
    event = 'VimEnter',
    config = function()
      require('leap').add_default_mappings()
  end,
  },
  {
    "github/copilot.vim",
    event = 'InsertEnter',
  },
  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        theme = 'hyper',
        disable_move = false,
        config = {
          week_header = {
            enable = true,
            concat = 'Dev, Writing, Notetakeing',
          }
        }

      }
    end,
    dependencies = {{'nvim-tree/nvim-web-devicons'}}
  },
  {
    "mg979/vim-visual-multi"
  },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup({
        api_key_cmd = "op read op://Private/OpenAI_Cred/credential"})
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    }
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python"},
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
        "black",
        "debugpy",
        "mypy",
        "ruff",
        "pyright",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
}
return plugins
