-- Structure from https://github.com/LunarVim/Neovim-from-scratch
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP =
        fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float {border = "rounded"}
        end
    }
}

-- Install your plugins here
return packer.startup(
    function(use)
        -- General plugin management
        use {"wbthomason/packer.nvim"} -- Have packer manage itself
        use {"nvim-lua/popup.nvim"} -- An implementation of the Popup API from vim in Neovim
        use {"nvim-lua/plenary.nvim"} -- Useful lua functions used by lots of plugins

        -- General utility
        use {"tpope/vim-surround"}
        use {"mg979/vim-visual-multi"}
        use {"sbdchd/neoformat"}
        use {"tpope/vim-repeat"}
        use {"tpope/vim-speeddating"}
        use {"svermeulen/vim-easyclip"}
        use {"godlygeek/tabular"}
        use {"easymotion/vim-easymotion"}
        use {"windwp/nvim-autopairs"}
        use {"akinsho/toggleterm.nvim"}
        use {
            "ThePrimeagen/refactoring.nvim",
            requires = {
                {"nvim-lua/plenary.nvim"},
                {"nvim-treesitter/nvim-treesitter"}
            }
        }
        use {
            "filipdutescu/renamer.nvim",
            branch = "master",
            requires = {{"nvim-lua/plenary.nvim"}},
            config = function()
                local r = require "renamer"
                r.setup {}
                r._apply_workspace_edit = function(resp)
                    local params = vim.lsp.util.make_position_params()
                    local results_lsp, _ =
                        vim.lsp.buf_request_sync(0, require "renamer.constants".strings.lsp_req_rename, params)
                    local client_id = results_lsp and next(results_lsp) or nil
                    local client = vim.lsp.get_client_by_id(client_id)
                    require "vim.lsp.util".apply_workspace_edit(resp, client.offset_encoding)
                end
            end
        }
        use {"glepnir/dashboard-nvim"}
        use {"karb94/neoscroll.nvim"}
        use {
            "folke/zen-mode.nvim",
            config = function()
                require("zen-mode").setup {}
            end
        }
        use {"mizlan/iswap.nvim"}
        use {"haringsrob/nvim_context_vt"}
        use {"ethanholz/nvim-lastplace"}
        use {
            "abecodes/tabout.nvim",
            config = function()
                require("tabout").setup {
                    tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
                    backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
                    act_as_tab = true, -- shift content if tab out is not possible
                    act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
                    default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
                    default_shift_tab = "<C-d>", -- reverse shift default action,
                    enable_backwards = true, -- well ...
                    completion = true, -- if the tabkey is used in a completion pum
                    tabouts = {
                        {open = "'", close = "'"},
                        {open = '"', close = '"'},
                        {open = "`", close = "`"},
                        {open = "(", close = ")"},
                        {open = "[", close = "]"},
                        {open = "{", close = "}"}
                    },
                    ignore_beginning = true --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]],
                    exclude = {} -- tabout will ignore these filetypes
                }
            end,
            wants = {"nvim-treesitter"}, -- or require if not used so far
            after = {"nvim-cmp"} -- if a completion plugin is using tabs load it before
        }
        use {"lukas-reineke/indent-blankline.nvim"}
        use {"mfussenegger/nvim-dap"}

        -- Finding files
        use {"nvim-telescope/telescope.nvim"}
        use {"francoiscabrol/ranger.vim"}
        use {"rbgrouleff/bclose.vim"}
        use {
            "kyazdani42/nvim-tree.lua",
            requires = {
                "kyazdani42/nvim-web-devicons" -- optional, for file icon
            }
        }

        -- Theme
        -- use {"shaunsingh/moonlight.nvim"}
        use {"folke/tokyonight.nvim"}
        use {"p00f/nvim-ts-rainbow"}

        -- Git integration
        use {"airblade/vim-gitgutter"}
        use {"f-person/git-blame.nvim"}

        -- Treesitter
        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate"
        }
        use {"nvim-treesitter/playground"}
        use {"nvim-treesitter/nvim-treesitter-context"}

        -- Commenting
        use {
            "numToStr/Comment.nvim",
            config = function()
                require("Comment").setup()
            end
        }
        use {"JoosepAlviste/nvim-ts-context-commentstring"}

        -- Status bar
        use {"vim-airline/vim-airline"}
        use {"vim-airline/vim-airline-themes"}
        use {
            "akinsho/bufferline.nvim",
            requires = "kyazdani42/nvim-web-devicons"
        }
        use {"moll/vim-bbye"}

        -- Emmet support
        use {"mattn/emmet-vim"}

        -- Completion
        use {"hrsh7th/cmp-buffer"}
        use {"hrsh7th/cmp-path"}
        use {"hrsh7th/cmp-cmdline"}
        use {"hrsh7th/nvim-cmp"}

        -- LSP
        use {"neovim/nvim-lspconfig"}
        use {"hrsh7th/cmp-nvim-lsp"}
        use {"williamboman/nvim-lsp-installer"}
        use {"tamago324/nlsp-settings.nvim"}
        use {"hrsh7th/cmp-nvim-lsp-signature-help"}

        -- Crates.io completion
        use {
            "saecki/crates.nvim",
            event = {"BufRead Cargo.toml"},
            requires = {{"nvim-lua/plenary.nvim"}},
            config = function()
                require("crates").setup()
            end
        }

        -- Tabnine completion
        use {
            "tzachar/cmp-tabnine",
            run = "./install.sh"
        }

        -- Copilot completion
        use {"github/copilot.vim"}
        use {"hrsh7th/cmp-copilot"}

        -- Snippet engine
        use {"SirVer/ultisnips"}
        use {"quangnguyen30192/cmp-nvim-ultisnips"}

        -- Snippets
        use {"honza/vim-snippets"}

        -- Live server for HTML, CSS, and JavaScript
        use {
            "turbio/bracey.vim",
            run = "npm install --prefix server"
        }

        -- Syntax checking
        use {"vim-syntastic/syntastic"}

        -- Discord presence
        use {"vimsence/vimsence"}

        -- Specific language plugins
        -- Shared
        use {
            "bennypowers/nvim-regexplainer",
            config = function()
                require "regexplainer".setup()
            end,
            requires = {
                "nvim-treesitter/nvim-treesitter",
                "MunifTanjim/nui.nvim"
            }
        }
        use {
            "rcarriga/vim-ultest",
            requires = {"vim-test/vim-test"},
            run = ":UpdateRemotePlugins"
        }

        -- Go
        use {
            "fatih/vim-go",
            run = ":GoUpdateBinaries"
        }

        -- Markdown preview
        use {
            "iamcco/markdown-preview.nvim",
            run = "cd app && yarn install"
        }

        -- HTML etc
        use {"windwp/nvim-ts-autotag"}

        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        if PACKER_BOOTSTRAP then
            require("packer").sync()
        end
    end
)
