return require("packer").startup(function()
    use 'wbthomason/packer.nvim'

    -- Leap (pengganti sneak)
    use {
        "ggandor/leap.nvim",
        config = function()
            require("leap").add_default_mappings()
        end
    }
end)
