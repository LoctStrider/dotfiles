local p = require("packer")
local function packer_startup()
  p.use({"wbthomason/packer.nvim", opt = true})
  local function _1_()
    local env = require("aniseed.env")
    env.init()
    return 
  end
  p.use({"Olical/aniseed", config = _1_, requires = {"bakpakin/fennel.vim", opt = true}})
  p.use({"andymass/vim-matchup", event = "VimEnter *"})
  p.use({"haorenW1025/completion-nvim", requires = {{"hrsh7th/vim-vsnip", opt = true}, {"hrsh7th/vim-vsnip-integ", opt = true}}})
  p.use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"})
  p.use("Olical/conjure")
  p.use("romainl/vim-cool")
  local function _2_()
    vim.api.nvim_command("colorscheme gruvbox")
    return 
  end
  p.use({"morhetz/gruvbox", config = _2_})
  local function _3_()
    do
      local lualine = require("lualine")
      lualine.theme = "gruvbox"
      lualine.separator = "|"
      lualine.sections = {lualine_a = {"mode"}, lualine_b = {"branch"}, lualine_c = {"filename"}, lualine_x = {"encoding", "fileformat", "filetype"}, lualine_y = {"progress"}, lualine_z = {"location"}}
      lualine.inactive_sections = {lualine_a = {}, lualine_b = {}, lualine_c = {"filename"}, lualine_x = {"location"}, lualine_y = {}, lualine_z = {}}
      lualine.extensions = {"fzf"}
      lualine.status()
    end
    return 
  end
  p.use({"hoob3rt/lualine.nvim", config = _3_, requires = {"kyazdani42/nvim-web-devicons", opt = true}})
  p.use({"nvim-treesitter/completion-treesitter", requires = {"nvim-treesitter", "completion-treesitter"}})
  p.use("gcmt/wildfire.vim")
  p.use("sgur/vim-editorconfig")
  p.use("MarcWeber/vim-addon-local-vimrc")
  return 
end
return p.startup(packer_startup)