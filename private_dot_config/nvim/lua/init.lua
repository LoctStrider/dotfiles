local _0_0 = nil
do
  local name_0_ = "init"
  local loaded_0_ = package.loaded[name_0_]
  local module_0_ = nil
  if ("table" == type(loaded_0_)) then
    module_0_ = loaded_0_
  else
    module_0_ = {}
  end
  module_0_["aniseed/module"] = name_0_
  module_0_["aniseed/locals"] = (module_0_["aniseed/locals"] or {})
  module_0_["aniseed/local-fns"] = (module_0_["aniseed/local-fns"] or {})
  package.loaded[name_0_] = module_0_
  _0_0 = module_0_
end
local function _1_(...)
  local ok_3f_0_, val_0_ = nil, nil
  local function _1_()
    return {require("aniseed.core"), require("aniseed.nvim")}
  end
  ok_3f_0_, val_0_ = pcall(_1_)
  if ok_3f_0_ then
    _0_0["aniseed/local-fns"] = {require = {a = "aniseed.core", nvim = "aniseed.nvim"}}
    return val_0_
  else
    return print(val_0_)
  end
end
local _local_0_ = _1_(...)
local a = _local_0_[1]
local nvim = _local_0_[2]
local _2amodule_2a = _0_0
local _2amodule_name_2a = "init"
do local _ = ({nil, _0_0, {{}, nil, nil, nil}})[2] end
local set_options_with = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
    local function set_options_with0(function_or_list, ...)
      local options = {...}
      local len = #options
      for i = 1, (len / 2), 1 do
        local id = (i * 2)
        local name = options[(id - 1)]
        local value = options[id]
        if (type(function_or_list) == "table") then
          for _, _function in pairs(function_or_list) do
            _function(name, value)
          end
        else
          function_or_list(name, value)
        end
      end
      return nil
    end
    v_0_0 = set_options_with0
    _0_0["set-options-with"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = _0_0["aniseed/locals"]
  t_0_["set-options-with"] = v_0_
  set_options_with = v_0_
end
local global_option = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nvim.set_option
    _0_0["global-option"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = _0_0["aniseed/locals"]
  t_0_["global-option"] = v_0_
  global_option = v_0_
end
local buffer_option = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
    local function buffer_option0(bufnr)
      local function _2_(name, value)
        return nvim.buf_set_option(bufnr, name, value)
      end
      return _2_
    end
    v_0_0 = buffer_option0
    _0_0["buffer-option"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = _0_0["aniseed/locals"]
  t_0_["buffer-option"] = v_0_
  buffer_option = v_0_
end
local window_option = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
    local function window_option0(winnr)
      local function _2_(name, value)
        return nvim.win_set_option(winnr, name, value)
      end
      return _2_
    end
    v_0_0 = window_option0
    _0_0["window-option"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = _0_0["aniseed/locals"]
  t_0_["window-option"] = v_0_
  window_option = v_0_
end
local set_keymaps = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
    local function set_keymaps0(...)
      local keymaps = {...}
      local len = #keymaps
      for i = 1, (len / 4), 1 do
        local id = (i * 4)
        local mode = keymaps[(id - 3)]
        local lhs = keymaps[(id - 2)]
        local rhs = keymaps[(id - 1)]
        local opts = keymaps[id]
        nvim.set_keymap(mode, lhs, rhs, opts)
      end
      return nil
    end
    v_0_0 = set_keymaps0
    _0_0["set-keymaps"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = _0_0["aniseed/locals"]
  t_0_["set-keymaps"] = v_0_
  set_keymaps = v_0_
end
set_options_with(global_option, "autoread", true, "mouse", "a")
set_options_with({global_option, window_option(0)}, "number", true, "scrolloff", 1)
set_options_with({global_option, buffer_option(0)}, "tabstop", 4, "softtabstop", 4, "shiftwidth", 4, "expandtab", true)
nvim.command("autocmd FileType cpp set cindent cinoptions=(0,Ws,N-s")
set_options_with(global_option, "foldlevelstart", 99)
set_keymaps("n", "<Tab>", "za", {noremap = true})
nvim.command("autocmd FileType cpp set makeprg=g++\\ %\\ -o\\ %<\\ -Wshadow\\ -Wall\\ -Wextra\\ -Werror\\ -g")
set_keymaps("n", "<Space><Space>", "<Cmd>ls<CR>:b<Space>", {noremap = true})
set_options_with(global_option, "background", "dark", "termguicolors", true)
set_keymaps("i", "fj", "<ESC>", {noremap = true})
do
  local treesitter = require("nvim-treesitter.configs")
  treesitter.setup({ensure_installed = "maintained", highlight = {enable = true}, incremental_selection = {enable = true}})
end
set_options_with({global_option, window_option(0)}, "foldmethod", "expr", "foldexpr", "nvim_treesitter#foldexpr()")
set_keymaps("i", "<Tab>", "pumvisible() ? '<C-n>' : '<Tab>'", {expr = true, noremap = true}, "i", "<S-Tab>", "pumvisible() ? '<C-p>' : '<S-Tab>'", {expr = true, noremap = true})
set_options_with(global_option, "completeopt", "menuone,noinsert,noselect", "shortmess", "cfilnxtToOF")
nvim.set_var("completion_enable_snippet", "vim-vsnip")
nvim.set_var("completion_chain_complete_list", {default = {default = {complete_items = {"snippet", "ts"}}}})
return nvim.command("autocmd BufEnter * lua require'completion'.on_attach()")