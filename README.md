# Neovim Configuration (personal)

A compact, modular Neovim setup using folke/lazy.nvim for plugin management.

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/f4fb1e48-32c6-465c-89d0-f2b6775111a4" />

---

## Quick summary ✅
- Location: `~/.config/nvim`
- Manager: `folke/lazy.nvim` (bootstrapped in `init.lua`)
- Structure: `init.lua` loads global options and `lazy` with the `plugins` module directory (`lua/plugins/*`).

---

## Requirements 🔧
- Neovim (stable >= 0.11+ recommended)
- Git (used by the bootstrap in `init.lua`)

How to install: clone this repo to `~/.config/nvim`, open Neovim and `lazy.nvim` will prompt to install the plugins. Use `:Lazy` to manage plugins interactively.


---

## Plugin modules and what they provide (file → plugin(s) & deps) 🔍
All plugin names are given as GitHub `owner/repo` for quick lookup.

- `lua/plugins/alpha.lua` → `goolord/alpha-nvim`
  - deps: `nvim-tree/nvim-web-devicons`
  - purpose: start/dashboard screen with a custom ASCII header,

- `lua/plugins/autopairs.lua` → `windwp/nvim-autopairs`
  - purpose: auto-close brackets/quotes, uses Treesitter for smarter behavior.
  - 

- `lua/plugins/better-comments.lua` → `folke/todo-comments.nvim`
  - deps: `nvim-lua/plenary.nvim`
  - purpose: highlight and navigate TODO/TFIXME-style comments.

- `lua/plugins/catpuccin.lua` → `catppuccin/nvim`
  - purpose: colorscheme; loaded with high priority and set as active scheme.

- `lua/plugins/colorizer.lua` → `NvChad/nvim-colorizer.lua`, `roobert/tailwindcss-colorizer-cmp.nvim`
  - purpose: inline color preview in buffers and completion menu (Tailwind support).

- `lua/plugins/completion.lua` → `hrsh7th/nvim-cmp`, `hrsh7th/cmp-nvim-lsp`, `L3MON4D3/LuaSnip`
  - deps: `saadparwaiz1/cmp_luasnip`, `rafamadriz/friendly-snippets`
  - purpose: LSP completion, snippet integration and configuration (keymaps: `<C-k>`/`<C-j>` for snippet navigation).

- `lua/plugins/devicons.lua` → `nvim-tree/nvim-web-devicons`
  - purpose: filetype icons used across UI plugins (neo-tree, alpha, etc.).

- `lua/plugins/emoji.lua` → `allaman/emoji.nvim`
  - deps: `nvim-lua/plenary.nvim`, `hrsh7th/nvim-cmp`, `nvim-telescope/telescope.nvim`
  - purpose: emoji picker + Telescope integration (keymap: `<C-e>` to open emoji Telescope).

- `lua/plugins/fold.lua` → `kevinhwang91/nvim-ufo`
  - deps: `kevinhwang91/promise-async`
  - purpose: better code folding powered by Treesitter and indent; keymaps `zR`/`zM`.

- `lua/plugins/imageViewr.lua` → `3rd/image.nvim`
  - purpose: image preview in Neovim (basic setup provided).

- `lua/plugins/indent-blank-line.lua` → `lukas-reineke/indent-blankline.nvim`
  - purpose: persistent indent guides and scope highlighting (toggle and scope keys provided).

- `lua/plugins/lsp-config.lua` → `williamboman/mason.nvim`, `williamboman/mason-lspconfig.nvim`, `neovim/nvim-lspconfig`
  - ensures LSP servers: `lua_ls`, `clangd`, `pyright`, `jsonls`, `html`, `cssls`, `ts_ls`, `tailwindcss` (configured via `mason-lspconfig`).
  - purpose: LSP setup, diagnostics float on CursorHold, common keymaps (`K`, `gd`, `<leader>ca`).

- `lua/plugins/lualine.lua` → `nvim-lualine/lualine.nvim`
  - purpose: statusline (uses `dracula` theme option in config).

- `lua/plugins/neo-tree.lua` → `nvim-neo-tree/neo-tree.nvim`
  - deps: `nvim-lua/plenary.nvim`, `MunifTanjim/nui.nvim`, `nvim-tree/nvim-web-devicons`
  - purpose: file explorer; keymap `<C-n>` toggles Neo-tree.

- `lua/plugins/telescope.lua` → `nvim-telescope/telescope.nvim`, `nvim-telescope/telescope-ui-select.nvim`
  - deps: `nvim-lua/plenary.nvim`
  - purpose: fuzzy finder and UI-select integration; keymaps: `<C-p>` (find files), `<leader>fg` (live grep).

- `lua/plugins/terminal.lua` → `akinsho/toggleterm.nvim`
  - purpose: floating terminal with mapping `<C-\>` (Ctrl+Backslash) to open.

- `lua/plugins/treesitter.lua` → `nvim-treesitter/nvim-treesitter`, `windwp/nvim-ts-autotag`
  - ensures parsers: `lua`, `javascript`, `typescript`, `tsx`, `html`, `css`, `json`, `markdown`, `c`, `cpp`.
  - purpose: syntax highlighting, indent, autotagging for HTML/JSX/TSX files.

---

## Notable key mappings (high level) ⌨️
- `<CTRL-p>` — Telescope: find files
- `<SPACE>fg` — Telescope: live grep
- `<CTRL-n>` — Toggle Neo-tree
- `<CTRL-\>` — Toggle floating terminal
- `<C-e>` — Telescope emoji picker
- `zR` / `zM` — open/close all folds (ufo)

---

## How to add or modify plugins ✍️
- Add a new module file in `lua/plugins/` that returns a plugin spec (same format used in existing files), or add entries to `lua/plugins.lua` (if you prefer a single file).
- After editing, open Neovim and run `:Lazy sync` to install/update.

---

Enjoy your tidy Neovim setup! ✨
