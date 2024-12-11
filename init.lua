package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"
vim.g.python3_host_prog=vim.fn.expand("~/.virtualenvs/neovim/bin/python3")
require("oreok")


