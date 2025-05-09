return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2", -- Ensure Harpoon v2
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    -- Add/Prepend
    vim.keymap.set("n", "<leader>A", function()
      harpoon:list():prepend()
    end, { desc = "Prepend Harpoon File" })
    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():add()
    end, { desc = "Add Harpoon File" })

    -- Toggle UI
    vim.keymap.set("n", "<C-e>", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Harpoon Quick Menu" })

    -- Navigate
    vim.keymap.set("n", "<C-f>", function()
      harpoon:list():select(1)
    end, { desc = "Harpoon File 1" })
    vim.keymap.set("n", "<C-t>", function()
      harpoon:list():select(2)
    end, { desc = "Harpoon File 2" })
    vim.keymap.set("n", "<C-n>", function()
      harpoon:list():select(3)
    end, { desc = "Harpoon File 3" })
    vim.keymap.set("n", "<C-s>", function()
      harpoon:list():select(4)
    end, { desc = "Harpoon File 4" })

    -- Replace
    vim.keymap.set("n", "<leader><C-h>", function()
      harpoon:list():replace_at(1)
    end, { desc = "Replace Harpoon 1" })
    vim.keymap.set("n", "<leader><C-t>", function()
      harpoon:list():replace_at(2)
    end, { desc = "Replace Harpoon 2" })
    vim.keymap.set("n", "<leader><C-n>", function()
      harpoon:list():replace_at(3)
    end, { desc = "Replace Harpoon 3" })
    vim.keymap.set("n", "<leader><C-s>", function()
      harpoon:list():replace_at(4)
    end, { desc = "Replace Harpoon 4" })
  end,
}
