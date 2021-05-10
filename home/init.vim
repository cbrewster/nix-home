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

" coc-explorer
nmap <leader>e :CocCommand explorer<CR>

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

lua << EOF
local gl = require('galaxyline')
-- local colors = require('galaxyline.theme').default
local condition = require('galaxyline.condition')
local diagnostic = require('galaxyline.provider_diagnostic')
local lspclient = require('galaxyline.provider_lsp')
local gls = gl.section
local lsp_status = require('lsp-status')

local gruvbox = {
    bg = '#282828',
    fg = '#ebdbb2',
    yellow = '#fabd2f',
    cyan = '#85a598',
    darkblue = '#458588',
    green = '#b8bb26',
    orange = '#f37b19',
    violet = '#b16286',
    magenta = '#d3869b',
    blue = '#8ec07c',
    red = '#fb4934',
};
colors = gruvbox

local function printer(str)
	return function() return str end
end

local space = printer(' ')

gl.short_line_list = {'NvimTree','vista','dbui'}

gls.left[1] = {
  RainbowRed = {
    provider = function() return ' ' end,
    highlight = {colors.blue,colors.bg}
  },
}
gls.left[2] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode_color = {n = colors.red, i = colors.green,v=colors.blue,
                          [''] = colors.blue,V=colors.blue,
                          c = colors.magenta,no = colors.red,s = colors.orange,
                          S=colors.orange,[''] = colors.orange,
                          ic = colors.yellow,R = colors.violet,Rv = colors.violet,
                          cv = colors.red,ce=colors.red, r = colors.cyan,
                          rm = colors.cyan, ['r?'] = colors.cyan,
                          ['!']  = colors.red,t = colors.red}
      vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()])
      return '  '
    end,
    highlight = {colors.red,colors.bg,'bold'},
  },
}
gls.left[3] = {
  FileSize = {
    provider = 'FileSize',
    condition = condition.buffer_not_empty,
    highlight = {colors.fg,colors.bg},
    separator = '',
    separator_highlight = {colors.bg,colors.green},
  }
}
gls.left[4] ={
  FileIcon = {
    provider = {space, 'FileIcon'},
    condition = condition.buffer_not_empty,
    highlight = {colors.bg,colors.green},
    separator = '',
    separator_highlight = {colors.bg,colors.green},
  },
}

gls.left[5] = {
  FileName = {
    provider = {space, 'FileName'},
    separator = ' ',
    condition = condition.buffer_not_empty,
    highlight = {colors.magenta,colors.bg,'bold'},
    separator_highlight = {colors.magenta,colors.bg,'bold'}
  }
}

gls.left[6] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.fg,colors.bg},
  },
}

gls.left[7] = {
  PerCent = {
    provider = 'LinePercent',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.fg,colors.bg,'bold'},
  }
}

gls.left[8] = {
    LspStatus = {
        provider = function()
            symbol = ''
            local current_function = vim.b.lsp_current_function
            if current_function and current_function ~= '' then
              symbol = symbol .. '(' .. current_function .. ') '
            end
            return symbol
        end,
        highlight = {colors.green,colors.bg,'bold'}
    }
}

gls.left[9] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.red,colors.bg}
  }
}
gls.left[10] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.yellow,colors.bg},
  }
}

gls.left[11] = {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = '  ',
    separator = '',
    condition = condition.buffer_not_empty,
    highlight = {colors.blue,colors.bg},
  }
}

gls.left[12] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    highlight = {colors.blue,colors.bg},
  }
}

gls.right[1] = {
  FileEncode = {
    provider = 'FileEncode',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.green,colors.bg,'bold'}
  }
}

gls.right[2] = {
  FileFormat = {
    provider = 'FileFormat',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.green,colors.bg,'bold'}
  }
}

gls.right[3] = {
  GitIcon = {
    provider = function() return '  ' end,
    condition = condition.check_git_workspace,
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.violet,colors.bg,'bold'},
  }
}

gls.right[4] = {
  GitBranch = {
    provider = {space,'GitBranch', space},
    condition = condition.check_git_workspace,
    highlight = {colors.bg,colors.violet,'bold'},
    separator = '',
    separator_highlight = {colors.bg,colors.violet,'bold'},
  }
}

gls.right[5] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.green,colors.bg},
    separator = '',
    separator_highlight = {colors.bg,colors.violet,'bold'},
  }
}
gls.right[6] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.orange,colors.bg},
  }
}
gls.right[7] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.red,colors.bg},
  }
}

gls.right[8] = {
  RainbowBlue = {
    provider = function() return '  ' end,
    highlight = {colors.blue,colors.bg}
  },
}

gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.blue,colors.bg,'bold'}
  }
}

gls.short_line_left[2] = {
  SFileName = {
    provider =  'SFileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.fg,colors.bg,'bold'}
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    highlight = {colors.fg,colors.bg}
  }
}
EOF

