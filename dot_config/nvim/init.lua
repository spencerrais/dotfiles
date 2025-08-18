vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.wrap = false
vim.opt.winborder = "rounded"

vim.pack.add({
        { src = "https://github.com/navarasu/onedark.nvim" },
        { src = "https://github.com/echasnovski/mini.pick" },
        { src = "https://github.com/echasnovski/mini.icons" },
        { src = "https://github.com/echasnovski/mini.snippets" },
        { src = "https://github.com/echasnovski/mini.completion" },
        { src = "https://github.com/neovim/nvim-lspconfig" },
        { src = "https://github.com/mason-org/mason.nvim" },
        { src = "https://github.com/christoomey/vim-tmux-navigator" },
        { src = "https://github.com/folke/which-key.nvim" },
        { src = "https://github.com/lewis6991/gitsigns.nvim" },
        { src = "https://github.com/m4xshen/hardtime.nvim" },
        { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
        { src = "https://github.com/stevearc/conform.nvim" },
})

require "mini.pick".setup()
require "mini.icons".setup()
require "mini.snippets".setup()
require "mini.completion".setup()
require "mason".setup()
require "gitsigns".setup {
        signs = { change = { text = '~' }, }
}
require "hardtime".setup()
require "nvim-treesitter.configs".setup({
        ensure_installed = { "go", "lua", "python", "bash", "vim", "vimdoc" },
        highlight = { enable = true },
})
require("conform").setup({
        formatters_by_ft = {
                python = { "isort", "ruff_format" },
        },
        format_on_save = {
                timeout_ms = 500,
                lsp_format = "fallback",
        },
})

vim.lsp.enable({ "lua_ls", "basedpyright" })
vim.lsp.config("lua_ls",
        {
                settings = {
                        Lua = {
                                workspace = {
                                        library = vim.api.nvim_get_runtime_file("", true),
                                }
                        }
                }
        })

vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>', { desc = "update and source" })
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>ff', ":Pick files<CR>")
vim.keymap.set('n', '<leader>fb', ":Pick buffers<CR>")
vim.keymap.set('n', '<leader>h', ":Pick help<CR>")
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostic" })

vim.cmd("colorscheme onedark")
