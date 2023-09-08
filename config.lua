--[[
lvim is the global options object

Linters should be
filled in as strings with eithera global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colrscheme = "slate"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = fals

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = ","
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<leader><space>"] = ":noh<cr>"
lvim.keys.normal_mode["<leader>h"] = ":<C-u>split<CR>"
lvim.keys.normal_mode["<leader>v"] = ":<C-u>vsplit<CR>"
-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.

lvim.builtin.which_key.mappings["F"] = { "<cmd>Telescope live_grep<CR>", "Live Grep" }
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.dap.active = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "go",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.lualine.style = "lvim"

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumeko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
lvim.plugins = {
  { "easymotion/vim-easymotion" },
  { "jjo/vim-cue" },
  { 'vim-airline/vim-airline' },
  { 'vim-airline/vim-airline-themes' },
  { 'ray-x/go.nvim', config = function() require('go').setup() end },
  { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' }, -- recommanded if need floating window support
  { 'leoluz/nvim-dap-go', config = function() require('dap-go').setup() end },
  { "p00f/nvim-ts-rainbow" },
  { "ray-x/lsp_signature.nvim", event = "BufRead", config = function() require("lsp_signature").setup() end },
  { "romgrk/nvim-treesitter-context" },
  { "tpope/vim-rhubarb" },
  -- { "kevinhwang91/nvim-ufo",
  --   run = ':TSUpdate',
  --   event = { "BufReadPre" },
  --   requires = "kevinhwang91/promise-async",
  --   config = function()
  --     -- https://alpha2phi.medium.com/neovim-for-beginners-code-folding-7574925412ea
  --     require("ufo").setup({
  --       provider_selector = function(bufnr, filetype, buftype)
  --         return { 'treesitter', 'indent' }
  --       end
  --     })
  --     vim.keymap.set("n", "zR", require("ufo").openAllFolds)
  --     vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
  --   end,
  -- },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  { "simrat39/rust-tools.nvim",
    config = function()
      local status_ok, rust_tools = pcall(require, "rust-tools")
      if not status_ok then
        return
      end
      local opts = {
        tools = {
          executor = require("rust-tools/executors").termopen, -- can be quickfix or termopen
          reload_workspace_from_cargo_toml = true,
          inlay_hints = {
            auto = true,
            only_current_line = false,
            show_parameter_hints = true,
            parameter_hints_prefix = "<-",
            other_hints_prefix = "=>",
            max_len_align = false,
            max_len_align_padding = 1,
            right_align = false,
            right_align_padding = 7,
            highlight = "Comment",
          },
          hover_actions = {
            auto_focus = true,
          },
          runnables = {
            use_telescope = true,
          },
        },
        server = {
          -- cmd = { "ra-multiplex" },
          on_attach = require("lvim.lsp").common_on_attach,
          on_init = require("lvim.lsp").common_on_init,
        },
      }
      -- WARNING: I did not try to get debugging working at all,
      -- hence things being commented out.
      -- See: https://github.com/LunarVim/LunarVim/issues/2894
      -- local extension_path = vim.fn.expand "~/" .. ".vscode/extensions/vadimcn.vscode-lldb-1.7.3/"
      -- local codelldb_path = extension_path .. "adapter/codelldb"
      -- local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
      -- opts.dap = {
      --        adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
      -- }
      rust_tools.setup(opts)
      rust_tools.inlay_hints.enable()
    end,
    ft = { "rust", "rs" },
  },
  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit"
    },
    ft = { "fugitive" }
  },
  -- { 'mfussenegger/nvim-dap' },
  -- { 'rcarriga/nvim-dap-ui', config = function() require('dapui').setup({
  --     icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
  --     mappings = {
  --       -- Use a table to apply multiple mappings
  --       expand = { "<CR>", "<2-LeftMouse>" },
  --       open = "o",
  --       remove = "d",
  --       edit = "e",
  --       repl = "r",
  --       toggle = "t",
  --     },
  --     -- Expand lines larger than the window
  --     -- Requires >= 0.7
  --     expand_lines = vim.fn.has("nvim-0.7") == 1,
  --     -- Layouts define sections of the screen to place windows.
  --     -- The position can be "left", "right", "top" or "bottom".
  --     -- The size specifies the height/width depending on position. It can be an Int
  --     -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
  --     -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
  --     -- Elements are the elements shown in the layout (in order).
  --     -- Layouts are opened in order so that earlier layouts take priority in window sizing.
  --     layouts = {
  --       {
  --         elements = {
  --           -- Elements can be strings or table with id and size keys.
  --           { id = "scopes", size = 0.25 },
  --           "breakpoints",
  --           "stacks",
  --           "watches",
  --         },
  --         size = 40, -- 40 columns
  --         position = "left",
  --       },
  --       {
  --         elements = {
  --           "repl",
  --           "console",
  --         },
  --         size = 0.25, -- 25% of total lines
  --         position = "bottom",
  --       },
  --     },
  --     controls = {
  --       -- Requires Neovim nightly (or 0.8 when released)
  --       enabled = true,
  --       -- Display controls in this element
  --       element = "repl",
  --       icons = {
  --         pause = "",
  --         play = "",
  --         step_into = "",
  --         step_over = "",
  --         step_out = "",
  --         step_back = "",
  --         run_last = "↻",
  --         terminate = "□",
  --       },
  --     },
  --     floating = {
  --       max_height = nil, -- These can be integers or a float between 0 and 1.
  --       max_width = nil, -- Floats will be treated as percentage of your screen.
  --       border = "single", -- Border style. Can be "single", "double" or "rounded"
  --       mappings = {
  --         close = { "q", "<Esc>" },
  --       },
  --     },
  --     windows = { indent = 1 },
  --     render = {
  --       max_type_length = nil, -- Can be integer or nil.
  --       max_value_lines = 100, -- Can be integer or nil.
  --     }
  --   })
  -- end }
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })


-- -- enable folding
-- local vim = vim
-- local opt = vim.opt

-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"

-- local api = vim.api
-- local M = {}
-- -- function to create a list of commands and convert them to autocommands
-- -------- This function is taken from https://github.com/norcalli/nvim_utils
-- function M.nvim_create_augroups(definitions)
--   for group_name, definition in pairs(definitions) do
--     api.nvim_command('augroup ' .. group_name)
--     api.nvim_command('autocmd!')
--     for _, def in ipairs(definition) do
--       local command = table.concat(vim.tbl_flatten { 'autocmd', def }, ' ')
--       api.nvim_command(command)
--     end
--     api.nvim_command('augroup END')
--   end
-- end

-- local autoCommands = {
--   -- other autocommands
--   open_folds = {
--     { "BufReadPost,FileReadPost", "*", "normal zR" }
--   }
-- }

-- M.nvim_create_augroups(autoCommands)

-- go bindings
lvim.builtin.which_key.mappings["lg"] = {
  name = "Go Binding",
  n = { "<cmd>GoTest -n<cr>", "Test nearest, see GoTestFunc" },
  f = { "<cmd>GoTest -f<cr>", "Test current file, see GoTestFile" },
  p = { "<cmd>GoTest -p<cr>", "Test current package, see GoTestPkg" },
  l = { "<cmd>GoLint<cr>", "golangci-lint" },
  r = { "<cmd>GoRun<cr>", "Equal to go run .; or GoRun ./cmd equal to go run ./cmd" },
}

lvim.builtin.which_key.mappings["t"] = {
  name = "Diagnostics",
  t = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
  d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}
