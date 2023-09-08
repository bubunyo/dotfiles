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
--

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = ","
-- add your own keymapping
lvim.keys.insert_mode["jj"] = "<ESC>"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<leader><space>"] = ":noh<cr>"
lvim.keys.normal_mode["<leader>h"] = ":<C-u>split<CR>"
lvim.keys.normal_mode["<leader>v"] = ":<C-u>vsplit<CR>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.

lvim.builtin.which_key.mappings["F"] = { "<cmd>Telescope live_grep<CR>", "Live Grep" }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
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

-- Additional Plugins
lvim.plugins = {
  { "easymotion/vim-easymotion" },
  { "jjo/vim-cue" },
  { 'vim-airline/vim-airline' },
  { 'vim-airline/vim-airline-themes' },
  { 'ray-x/go.nvim',                 config = function() require('go').setup() end },
  { 'ray-x/guihua.lua',              build = 'cd lua/fzy && make' }, -- recommanded if need floating window support
  { 'leoluz/nvim-dap-go',            config = function() require('dap-go').setup() end },
  { "p00f/nvim-ts-rainbow" },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require(
        "lsp_signature").setup()
    end
  },
  { "romgrk/nvim-treesitter-context" },
  { "tpope/vim-rhubarb" },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "simrat39/rust-tools.nvim",
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
}

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
