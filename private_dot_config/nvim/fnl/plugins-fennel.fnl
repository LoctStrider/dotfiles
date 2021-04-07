(local p (require :packer))

(fn packer-startup []
  (p.use {1 :wbthomason/packer.nvim
          :opt true})
  (p.use {1 :Olical/aniseed
          :config (fn []
                    (let [env (require :aniseed.env)]
                      (env.init)
                      (values)))
          :requires {1 :bakpakin/fennel.vim
                     :opt true}})
  (p.use {1 :andymass/vim-matchup
          :event "VimEnter *"})
  (p.use {1 :haorenW1025/completion-nvim
          :requires [{1 :hrsh7th/vim-vsnip
                      :opt true}
                     {1 :hrsh7th/vim-vsnip-integ
                      :opt true}]})
  (p.use {1 :nvim-treesitter/nvim-treesitter
          :run ":TSUpdate"})
  (p.use :Olical/conjure)
  (p.use :romainl/vim-cool)
  (p.use {1 :morhetz/gruvbox
          :config (fn []
                    (vim.api.nvim_command "colorscheme gruvbox")
                    (values))})
  (p.use {1 :hoob3rt/lualine.nvim
          :requires {1 :kyazdani42/nvim-web-devicons
                     :opt true}
          :config (fn []
                    (let [lualine (require :lualine)]
                      (lualine.setup {:options {:theme :gruvbox
                                                :section_separators ["" ""]
                                                :component_separators ["" ""]}
                                      :sections {:lualine_a [:mode]
                                                 :lualine_b [:branch]
                                                 :lualine_c [:filename]
                                                 :lualine_x [:encoding :fileformat :filetype]
                                                 :lualine_y [:progress]
                                                 :lualine_z [:location]}
                                      :inactive_sections {:lualine_a []
                                                          :lualine_b []
                                                          :lualine_c [:filename]
                                                          :lualine_x [:location]
                                                          :lualine_y []
                                                          :lualine_z []}
                                      :extensions [:fzf]}))
                    (values))})
  (p.use {1 :nvim-treesitter/completion-treesitter
          :requires [:nvim-treesitter
                     :completion-treesitter]})
  (p.use :gcmt/wildfire.vim)
  (p.use :sgur/vim-editorconfig)
  (p.use :MarcWeber/vim-addon-local-vimrc)
  (p.use {1 :nvim-telescope/telescope.nvim
          :requires [:nvim-lua/popup.nvim
                     :nvim-lua/plenary.nvim]})
  (p.use {1 :skywind3000/asynctasks.vim
          :requires :skywind3000/asyncrun.vim})
  (p.use {1 :GustavoKatel/telescope-asynctasks.nvim
          :requires [:asynctasks.vim
                     :telescope.nvim]})
  (p.use {1 :skywind3000/asyncrun.extra
          :requires :asyncrun.vim})
  (p.use :sheerun/vim-polyglot)
  (values))

(p.startup {1 packer-startup
            :config {:git {:clone_timeout 300}}})
