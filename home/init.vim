syntax on

set number
set cursorline
set background=dark
set clipboard=unnamedplus
set scrolloff=8
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
" upate git faster
set updatetime=100
" Use <SPACE> as leader
let mapleader = "\<Space>"

" set background=dark
" colorscheme github
" colorscheme space-vim-dark
" colorscheme embark

let g:gruvbox_contrast_dark='hard'
let g:gruvbox_invert_selection='0'
colorscheme gruvbox

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
nnoremap <leader>ws <cmd>lua require'telescope.builtin'.lsp_workspace_symbols()<cr>
nnoremap <leader>ds <cmd>lua require'telescope.builtin'.lsp_document_symbols()<cr>

" Allow mouse usage
set mouse=a

" Quick edit/reload nvim config
nnoremap gev :e $MYVIMRC<CR>
nnoremap gsv :so $MYVIMRC<CR>

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

" JS crap
autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx Neoformat prettier

" Directory specific overrides
" repl it web uses 2 space indent
:autocmd BufRead,BufNewFile /Users/cbrewster/Development/repl-it-web/* setlocal ts=2 sw=2 expandtab

" Tree sitter tings
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
EOF

" === LSP Tings ===
set signcolumn=yes
set shortmess+=c
set completeopt=menuone,noselect

" compe mappings
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>

autocmd BufWritePre *.go,*.rs lua vim.lsp.buf.formatting_sync(nil, 1000)
" TODO: Not sure if these even work :(
" autocmd CursorHold   <buffer> lua vim.lsp.buf.document_highlight()
" autocmd CursorHoldI  <buffer> lua vim.lsp.buf.document_highlight()
" autocmd CursorMoved  <buffer> lua vim.lsp.buf.clear_references()

lua << EOF
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    vsnip = true;
    nvim_lsp = true;
    nvim_lua = true;
    spell = true;
    tags = true;
    treesitter = true;
  };
}

local lsp_status = require('lsp-status')
lsp_status.register_progress()
lsp_status.config({
    status_symbol = '',
})

local on_attach = function(client, bufnr)
    lsp_status.on_attach(client, bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = vim.tbl_extend('keep', capabilities, lsp_status.capabilities)

require'lspconfig'.gopls.setup{
    capablities = capabilities,
    on_attach = on_attach,
}

require'lspconfig'.rust_analyzer.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
        }
    }
}

require'lspconfig'.tsserver.setup{
    capabilities = capabilities,
    on_attach = on_attach,
}

require'lspconfig'.flow.setup{
    capabilities = capabilities,
    on_attach = on_attach,
}

require'lspconfig'.vimls.setup{
    capabilities = capabilities,
    on_attach = on_attach,
}

local saga = require 'lspsaga'
saga.init_lsp_saga{}

require('lualine').setup({
    options = {
        theme = "gruvbox"
    },
    sections = {
        lualine_c = {"os.data('%a')", "data", require'lsp-status'.status}
    }
})
EOF

nnoremap <leader>a  <cmd>lua require('lspsaga.codeaction').code_action()<CR>
nnoremap <silent>K  <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
xnoremap <silent> <c-k> <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
inoremap <silent> <c-k> <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
nnoremap <leader>rn <cmd>lua require('lspsaga.rename').rename()<CR>

nnoremap <silent><leader>cd <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>

nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>
nnoremap <silent> [e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>
nnoremap <silent> ]e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>

function LspReload()
    lua vim.lsp.stop_client(vim.lsp.get_active_clients())
    edit
endfunction

command LspReload :call LspReload()

