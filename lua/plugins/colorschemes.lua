--[[
-- lua/

return {
    "tiesen243/vercel.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("vercel").setup({
            theme = "dark",        -- ADDED COMMA HERE
            transparent = false,   
            italics = {
                comments = true,   
                keywords = true,   
                functions = true,  
                strings = true,    
                variables = true,  
                bufferline = false 
            },
            overrides = {},        
        })

        vim.cmd.colorscheme("vercel")
    end,
}
--]]
--

return {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,    -- Ensure it loads on startup
    priority = 1000, -- Load this before other plugins
    config = function()
        require("rose-pine").setup({
            variant = "auto", -- or 'main', 'moon', 'dawn'
            dark_variant = "main",
        })
        vim.cmd("colorscheme rose-pine")
    end
}
