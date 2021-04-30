local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end

--- Check if a file or directory exists in this path
local function require_plugin(plugin)
    local plugin_prefix = fn.stdpath("data") .. "/site/pack/packer/opt/"

    local plugin_path = plugin_prefix .. plugin .. "/"
    --	print('test '..plugin_path)
    local ok, err, code = os.rename(plugin_path, plugin_path)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    --	print(ok, err, code)
    if ok then
        vim.cmd("packadd " .. plugin)
    end
    return ok, err, code
end

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

return require("packer").startup(
    function(use)
        -- Packer can manage itself as an optional plugin
        use "wbthomason/packer.nvim"

        -- lspconfig
        use {"neovim/nvim-lspconfig", opt = true}
        require_plugin("nvim-lspconfig")

        -- lspsaga - improves lsp UI
        use {"glepnir/lspsaga.nvim", opt = true}
        require_plugin("lspsaga.nvim")

        -- -- Explorer
        use "kyazdani42/nvim-tree.lua"
        require_plugin("nvim-tree.lua")

        -- -- Color
        use {"christianchiarulli/nvcode-color-schemes.vim", opt = true}
        require_plugin("nvcode-color-schemes.vim")

        -- Autocomplete
        use {"hrsh7th/nvim-compe", opt = true}
        require_plugin("nvim-compe")
        use {"hrsh7th/vim-vsnip", opt = true}
        require_plugin("vim-vsnip")

        -- Treesitter
        use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
        require_plugin("nvim-treesitter")

        -- Git decorations on the side of the source code
        use {"lewis6991/gitsigns.nvim", opt = true}
        require_plugin("gitsigns.nvim")

        -- Autopairs like brackets, speech marks
        use {"windwp/nvim-autopairs", opt = true}
        require_plugin("nvim-autopairs")

        -- Icons
        use {"kyazdani42/nvim-web-devicons", opt = true}
        require_plugin("nvim-web-devicons")

        -- Status Line and Bufferline
        use {"glepnir/galaxyline.nvim", opt = true}
        require_plugin("galaxyline.nvim")

        -- Tabs plugins
        use {"romgrk/barbar.nvim", opt = true}
        require_plugin("barbar.nvim")

        use {"nvim-lua/plenary.nvim", opt = true}
        require_plugin("plenary.nvim")

        use {"kabouzeid/nvim-lspinstall", opt = true}
        require_plugin("nvim-lspinstall")

    end
)
