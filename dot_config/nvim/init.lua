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
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.confirm = true
vim.opt.timeoutlen = 300
vim.opt.undofile = true

vim.pack.add({
        { src = "https://github.com/navarasu/onedark.nvim" },
        { src = "https://github.com/echasnovski/mini.pick" },
        { src = "https://github.com/echasnovski/mini.icons" },
        { src = "https://github.com/echasnovski/mini.snippets" },
        { src = "https://github.com/echasnovski/mini.completion" },
        { src = "https://github.com/echasnovski/mini.extra" },
        { src = "https://github.com/neovim/nvim-lspconfig" },
        { src = "https://github.com/mason-org/mason.nvim" },
        { src = "https://github.com/christoomey/vim-tmux-navigator" },
        { src = "https://github.com/folke/which-key.nvim" },
        { src = "https://github.com/lewis6991/gitsigns.nvim" },
        { src = "https://github.com/m4xshen/hardtime.nvim" },
        { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
        { src = "https://github.com/stevearc/conform.nvim" },
})

-- mini ecosystem
require "mini.pick".setup()
require "mini.icons".setup()
require "mini.snippets".setup()
require "mini.completion".setup()
require "mini.extra".setup()

-- other plugins
require "mason".setup()
require "hardtime".setup()
require "gitsigns".setup {
        signs = { change = { text = '~' }, }
}

-- treesitter
require "nvim-treesitter.configs".setup({
        ensure_installed = { "go", "lua", "python", "bash", "vim", "vimdoc", "yaml" },
        sync_install = false,
        auto_install = true,
        highlight = { enable = true },
})

-- autoformatting
require("conform").setup({
        formatters_by_ft = {
                python = { "isort", "ruff_format" },
                go = { "goimports", "gofumpt" },
                json = { "jq" },
        },
        format_on_save = function(bufnr)
                local ft = vim.bo[bufnr].filetype
                if ft == "yaml" then
                        return nil
                end
                return { timeout_ms = 5000, lsp_format = "fallback" }
        end,
})

-- lsp configurations
vim.lsp.enable({ "lua_ls", "basedpyright", "bashls", "yamlls", "postgres_lsp" })
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

-- movement
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'half page up and center' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'half page down and center' })

-- file changes
vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>', { desc = 'update and source' })
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)

-- finder for files, buffers, help, lsp symbols, marks
vim.keymap.set('n', '<leader>ff', ":Pick files sort=visit_recent<CR>")
vim.keymap.set('n', '<leader>fb', ":Pick buffers<CR>")
vim.keymap.set('n', '<leader>h', ":Pick help<CR>")
vim.keymap.set('n', '<leader>fs', ":Pick lsp scope='document_symbol'<CR>", { desc = 'Pick current buffer LSP symbols' })
vim.keymap.set('n', '<leader>fS', ":Pick lsp scope='workspace_symbol'<CR>", { desc = 'Pick workspace LSP symbols' })
vim.keymap.set('n', '<leader>fm', ':Pick marks scope="buf"<CR>', { desc = 'Pick marks (current buffer)' })
vim.keymap.set('n', '<leader>fM', ':Pick marks<CR>', { desc = 'Pick marks (global)' })

-- global clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from clipboard" })

-- highlight yanked text briefly
vim.api.nvim_create_autocmd("TextYankPost", {
        desc = "Highlight selection on yank",
        group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
        callback = function()
                vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
        end,
})

-- diagnostic configuration: toggle with <leader>d
vim.g.diagnostics_virtual_lines = true
local function toggle_virtual_lines()
        vim.g.diagnostics_virtual_lines = not vim.g.diagnostics_virtual_lines
        vim.diagnostic.config({
                virtual_lines = vim.g.diagnostics_virtual_lines,
        })
end
vim.keymap.set("n", "<leader>d", toggle_virtual_lines, { desc = "Toggle diagnostics (virtual_lines)" })

vim.cmd("colorscheme onedark")
