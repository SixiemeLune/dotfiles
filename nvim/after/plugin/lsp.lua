require('mason').setup({})
require('mason-lspconfig').setup({
	-- Replace the language servers listed here 
	-- with the ones you want to install
	ensure_installed = {'lua_ls', 'bashls'},

    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
        -- Next, you can provide targeted overrides for specific servers.
        ["pyright"] = function ()
            local lspconfig = require("lspconfig")
            lspconfig.pyright.setup {
                settings = {
                    python = {
                        analysis = {
                            include = {"/home/s.junck/SheepDip/sheepdip_os/rpm/sheepdip_api"},
                        },
                    },
                },
            }
        end,
    },
})

local cmp = require('cmp')

cmp.setup({
	sources = {
		{name = 'nvim_lsp'},
	},
	snippet = {
		expand = function(args)
			-- You need Neovim v0.10 to use vim.snippet
			vim.snippet.expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({}),
})
-- NOTE: to make any of this work you need a language server.
-- If you don't know what that is, watch this 5 min video:
-- https://www.youtube.com/watch?v=LaS32vctfOY

-- Reserve a space in the gutter
vim.opt.signcolumn = 'yes'

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end)
    vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end)
    vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end)
    vim.keymap.set('n', 'go', function() vim.lsp.buf.type_definition() end)
    vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end)
    vim.keymap.set('n', 'gs', function() vim.lsp.buf.signature_help() end)
    vim.keymap.set('n', '<F2>', function() vim.lsp.buf.rename() end)
    vim.keymap.set({'n', 'x'}, '<F3>', function() vim.lsp.buf.format({async = true}) end)
    vim.keymap.set('n', '<F4>', function() vim.lsp.buf.code_action() end)
  end,
})

-- You'll find a list of language servers here:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
-- These are example language servers. 

local cmp = require('cmp')

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  snippet = {
    expand = function(args)
      -- You need Neovim v0.10 to use vim.snippet
      vim.snippet.expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({}),
})
