set number
set mouse=a
set syntax=enable
set showcmd
set encoding=utf-8
set showmatch
set relativenumber

call plug#begin('~/.vim/plugged')
	" THEME
	Plug 'Shatur/neovim-ayu'

	Plug 'windwp/nvim-autopairs'

	" LSP
	Plug 'neovim/nvim-lspconfig'

	" COMPLETION
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'

	" For vsnip users.
	Plug 'hrsh7th/cmp-vsnip'
	Plug 'hrsh7th/vim-vsnip'

	" For luasnip users.
	" Plug 'L3MON4D3/LuaSnip'
	" Plug 'saadparwaiz1/cmp_luasnip'

	" For ultisnips users.
	" Plug 'SirVer/ultisnips:'

	" For snippy users.
	" Plug 'dcampos/nvim-snippy'
	" Plug 'dcampos/cmp-snippy'
	" JAVASCRIPT PLUGINS
	Plug 'pangloss/vim-javascript'
	Plug 'maxmellon/vim-jsx-pretty'

	Plug 'SirVer/ultisnips'
	Plug 'mlaursen/vim-react-snippets'
	Plug 'mattn/emmet-vim'
	Plug 'sbdchd/neoformat'

call plug#end()

set termguicolors
let ayucolor="dark"
colorscheme ayu

" SNIPPET CONFIGURATION

let g:UtilSnipsExpandTrigger='<tab>'
let g:python3_host_prog='/bin/python'
let g:user_emmet_mode='n'
let g:user_emmet_leader_key=','
let g:user_emmet_settings={'javascript': {'extends': 'jsx'}}
let g:neoformat_try_node_exe = 0

lua << EOF

	require("nvim-autopairs").setup {}
	local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.

	require('lspconfig')['bashls'].setup{capabilities = capabilities}
	require('lspconfig')['clangd'].setup{capabilities = capabilities}
	require('lspconfig')['tsserver'].setup{capabilities = capabilities}
	require('lspconfig')['sqlls'].setup{capabilities = capabilities}
	require('lspconfig')['angularls'].setup{capabilities = capabilities}
	require('lspconfig')['html'].setup{capabilities = capabilities}
	require('lspconfig')['cssls'].setup{capabilities = capabilities}

EOF
