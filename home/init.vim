syntax on

set number
set cursorline
set background=dark
set clipboard=unnamedplus
set scrolloff=8
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set hidden
" upate git faster
set updatetime=100
" Use <SPACE> as leader
let mapleader = "\<Space>"

" general guideline for line length
set colorcolumn=120

" set background=dark
" colorscheme github
" colorscheme space-vim-dark
" colorscheme embark

" let g:gruvbox_contrast_dark='hard'
" let g:gruvbox_invert_selection='0'
" colorscheme gruvbox

lua << EOF
require('github-theme').setup({
    options = { darken = { floats = true } },
})
EOF

colorscheme github_dark_default

set backspace=indent,eol,start
" Fix colors for alacritty
if has('nvim') || has('termguicolors')
  set termguicolors
endif

" File browser
let g:netrw_banner = 0
let g:netrw_liststyle = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" Telescope
lua << EOF
require'telescope'.setup{}
require'nvim-web-devicons'.setup{}
require'telescope'.load_extension("ui-select")
EOF

" Ctrl-p find files
" nnoremap <C-p> <cmd>Telescope git_files<cr>
nnoremap <C-p> <cmd>lua require'telescope.builtin'.git_files()<cr>
" Ripgrep
" nnoremap <leader>rg <cmd>Telescope live_grep<cr>
" nnoremap <leader>rg <cmd>lua require('telescope').extensions.fzf_writer.staged_grep()<cr>
nnoremap <leader>rg <cmd>lua require'telescope.builtin'.live_grep()<cr>
nnoremap <leader>ts <cmd>lua require'telescope.builtin'.treesitter()<cr>
nnoremap <silent>gr <cmd>lua require'telescope.builtin'.lsp_references()<cr>
nnoremap <silent>gi <cmd>lua require'telescope.builtin'.lsp_implementations()<cr>
nnoremap <leader>ws <cmd>lua require'telescope.builtin'.lsp_workspace_symbols()<cr>
nnoremap <leader>ds <cmd>lua require'telescope.builtin'.lsp_document_symbols()<cr>

nnoremap <leader>rq <cmd>Octo pr search assignee:cbrewster<cr>
nnoremap <leader>pr <cmd>Octo pr search<cr>

" Allow mouse usage
set mouse=a

" Quick edit/reload nvim config
nnoremap gev :e ~/.config/nixpkgs/home/init.vim<CR>
nnoremap gsv :!home-manager switch<CR>:so $MYVIMRC<CR>

" Use <space><space> to toggle to the last buffer
nnoremap <leader><leader> <c-^>

" splits
set splitbelow
set splitright

if has('nvim')
  autocmd BufRead Cargo.toml call crates#toggle()
endif

" Elixir
let g:mix_format_on_save = 1

" Dart
autocmd FileType dart setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Directory specific overrides
" repl it web uses 2 space indent
:autocmd BufRead,BufNewFile /home/cbrewster/Development/replit/repl-it-web/* setlocal ts=2 sw=2 expandtab

lua <<EOF
require('go').setup({
  lsp_inlay_hints = { enable = false },
})

require'treesitter-context'.setup{
  max_lines = 4,
}

require'jj'.setup{}
EOF

" === LSP Tings ===
set signcolumn=yes
set shortmess+=c

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>

" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)

set completeopt=menu,menuone,noselect

lua << EOF
local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
    sources = {
        { name = 'nvim_lua' },
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'vsnip' },
        { name = 'buffer' },
    },
    formatting = {
        format = lspkind.cmp_format {
            with_test = true,
            menu = {
                buffer = "[buf]",
                nvim_lsp = "[lsp]",
                nvim_lua = "[api]",
                path = "[path]",
                vsnip = "[snip]",
            },
        },
    },
    experimental = {
        native_menu = false,
        ghost_text = true,
    },
})

require('conform').setup({
  formatters_by_ft = {
    javascript = { 'prettier' },
    typescript = { 'prettier' },
    html = { 'prettier' },
    css = { 'prettier' },
    json = { 'prettier' },
    yaml = { 'prettier' },
    markdown = { 'prettier' },
  },
})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = function(args)
    require('conform').format({ bufnr = args.buf, lsp_fallback = true })
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp', { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end

    -- Document highlight
    if client.server_capabilities.documentHighlightProvider then
      local buf = args.buf
      vim.api.nvim_create_autocmd('CursorHold', {
        buffer = buf,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd('CursorMoved', {
        buffer = buf,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end,
})

vim.api.nvim_create_user_command('LspRestart', function()
  vim.lsp.stop_client(vim.lsp.get_clients())
end, {})

vim.diagnostic.config {
    float = { border = "rounded" },
}
vim.o.winborder = 'rounded'

vim.lsp.enable('nixd')
vim.lsp.enable('gopls')
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('eslint')
vim.lsp.enable('terraformls')
vim.lsp.enable('bashls')
vim.lsp.enable('pyright')
vim.lsp.enable('zls')
vim.lsp.enable('ruff')
vim.lsp.enable('buf_ls')
vim.lsp.enable('tsgo')

vim.lsp.config('ts_ls', {
    init_options = require'nvim-lsp-ts-utils'.init_options,
})
-- vim.lsp.enable('ts_ls')

require'lualine'.setup{
    options = {
        theme = "github_dark"
    },
    sections = {
        lualine_b = {'filename'},
        lualine_c = {'lsp_status'},

        lualine_x = {'progress'},
        lualine_y = {'location'},
        lualine_z = {'branch'}
    }
}

require'fidget'.setup{}

require'octo'.setup{}

local elixirls = require("elixir.elixirls")
require'elixir'.setup{
    elixirls = {
        cmd = "elixir-ls",
        capabilities = capabilities,
        on_attach = on_attach,
        settings = elixirls.settings {
            incrementalDialyzer = true,
            suggestSpecs = true,
        },
    }
}

local dap = require("dap")
dap.adapters.lldb = {
    type = "executable",
    command = "lldb-dap",
    name = "lldb"
}
dap.configurations.zig = {
    {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
    }
};

local dapui = require("dapui")
dapui.setup()

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

EOF

nnoremap <leader>a  <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent>K  <cmd>lua vim.lsp.buf.hover()<CR>
xnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
inoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>

nnoremap <silent> [e <cmd>lua vim.diagnostic.jump({count = -1})<CR>
nnoremap <silent> ]e <cmd>lua vim.diagnostic.jump({count = 1})<CR>

function! RemoveQFItem()
  let curqfidx = line('.') - 1
  let qfall = getqflist()
  call remove(qfall, curqfidx)
  call setqflist(qfall, 'r')
  execute curqfidx + 1 . "cfirst"
  :copen
endfunction
:command! RemoveQFItem :call RemoveQFItem()
" Use map <buffer> to only map dd in the quickfix window. Requires +localmap
autocmd FileType qf map <buffer> dd :RemoveQFItem<cr>
