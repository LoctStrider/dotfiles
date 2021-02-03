vim.cmd [[packadd packer.nvim]]

function expand(filename)
    return vim.fn.expand(filename)
end

function filereadable(filename)
    return vim.fn.filereadable(filename)
end

local fennel_ver_path = vim.fn.stdpath('config') .. '/lua/plugins-fennel.lua'

if filereadable(expand(fennel_ver_path)) then
    return require('plugins-fennel')
else
    return require('packer').startup(function()
        use {'wbthomason/packer.nvim', opt = true}
        use {
            'Olical/aniseed',
            config = function()
                require("aniseed.env").init()
            end,
            requires = {'bakpakin/fennel.vim', opt = true}
        }
    end)
end
