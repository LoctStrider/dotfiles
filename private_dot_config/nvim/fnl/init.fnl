(module init
  {require {a aniseed.core
            nvim aniseed.nvim}})

(defn set-options-with [function-or-list ...]
  "Set the given options."
  (let [options [...]
        len (length options)]
    (for [i 1 (/ len 2) 1]
      (let [id (* i 2)
            name (. options (- id 1))
            value (. options id)]
        (if (= (type function-or-list) :table)
          (each [_ function (pairs function-or-list)]
            (function name value))
          (function-or-list name value))))))

(def global-option nvim.set_option)
(defn buffer-option [bufnr]
  (fn [name value]
    (nvim.buf_set_option bufnr name value)))
(defn window-option [winnr]
  (fn [name value]
    (nvim.win_set_option winnr name value)))

(defn set-keymaps [...]
  "Set the given keymaps."
  (let [keymaps [...]
        len (length keymaps)]
    (for [i 1 (/ len 4) 1]
      (let [id (* i 4)
            mode (. keymaps (- id 3))
            lhs (. keymaps (- id 2))
            rhs (. keymaps (- id 1))
            opts (. keymaps id)]
        (nvim.set_keymap mode lhs rhs opts)))))

;; misc
(set-options-with global-option
                  :autoread true
                  :mouse :a)
(set-options-with [global-option (window-option 0)]
                  :number true
                  :scrolloff 1)

;; indenting
(set-options-with [global-option (buffer-option 0)]
                  :tabstop 4
                  :softtabstop 4
                  :shiftwidth 4
                  :expandtab true)
(nvim.command "autocmd FileType cpp set cindent cinoptions=(0,Ws,N-s")

;; folding
(set-options-with global-option
                  :foldlevelstart 99)
(set-keymaps :n "<Tab>" "za" {:noremap true})

;; compile
(nvim.command "autocmd FileType cpp set makeprg=g++\\ %\\ -o\\ %<\\ -Wshadow\\ -Wall\\ -Wextra\\ -Werror\\ -g")

;; navigating
(set-keymaps :n "<Space><Space>" "<Cmd>ls<CR>:b<Space>" {:noremap true})

;; colorscheme
(set-options-with global-option
                  :background :dark
                  :termguicolors true)

;; keymaps
(set-keymaps :i "fj" "<ESC>" {:noremap true})

;; nvim-treesitter
(let [treesitter (require :nvim-treesitter.configs)]
  (treesitter.setup {:ensure_installed :maintained
                     :highlight {:enable true}
                     :incremental_selection {:enable true}}))
(set-options-with [global-option (window-option 0)]
                  :foldmethod :expr
                  :foldexpr "nvim_treesitter#foldexpr()")

;; completion-nvim
(set-keymaps :i "<Tab>" "pumvisible() ? '<C-n>' : '<Tab>'" {:noremap true :expr true}
             :i "<S-Tab>" "pumvisible() ? '<C-p>' : '<S-Tab>'" {:noremap true :expr true})
(set-options-with global-option
                  :completeopt "menuone,noinsert,noselect"
                  :shortmess "cfilnxtToOF")
(nvim.set_var :completion_chain_complete_list
              {:default {:default [{:complete_items [:ts]}]}})
(nvim.command "autocmd BufEnter * lua require'completion'.on_attach()")
