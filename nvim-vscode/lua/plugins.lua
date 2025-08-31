return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        "ggandor/leap.nvim",
        config = function()
            require("leap").add_default_mappings()
        end
    }
end)
