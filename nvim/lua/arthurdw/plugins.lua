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

        -- Finding files
        use {"nvim-telescope/telescope.nvim"}
        use {"preservim/nerdtree"}
        use {"francoiscabrol/ranger.vim"}
        use {"rbgrouleff/bclose.vim"}

        -- Theme
        use {"shaunsingh/moonlight.nvim"}
        use {"p00f/nvim-ts-rainbow"}

        -- Git integration
        use {"airblade/vim-gitgutter"}

        -- Treesitter
        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate"
        }
        use {"nvim-treesitter/playground"}

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

        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        if PACKER_BOOTSTRAP then
            require("packer").sync()
        end
    end
)
