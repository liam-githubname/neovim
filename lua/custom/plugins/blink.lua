-- return {
--   'saghen/blink.cmp',
--   -- optional: provides snippets for the snippet source
--   dependencies = 'rafamadriz/friendly-snippets',
--
--   -- use a release tag to download pre-built binaries
--   version = '*',
--   -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
--   -- build = 'cargo build --release',
--   -- If you use nix, you can build from source using latest nightly rust with:
--   -- build = 'nix run .#build-plugin',
--   opts = {
--     -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept, C-n/C-p for up/down)
--     -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys for up/down)
--     -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
--     --
--     -- All presets have the following mappings:
--     -- C-space: Open menu or open docs if already open
--     -- C-e: Hide menu
--     -- C-k: Toggle signature help
--     --
--     -- See the full "keymap" documentation for information on defining your own keymap.
--     keymap = { preset = 'default' },
--
--     appearance = {
--       -- Sets the fallback highlight groups to nvim-cmp's highlight groups
--       -- Useful for when your theme doesn't support blink.cmp
--       -- Will be removed in a future release
--       use_nvim_cmp_as_default = true,
--       -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
--       -- Adjusts spacing to ensure icons are aligned
--       nerd_font_variant = 'mono',
--     },
--
--     -- Default list of enabled providers defined so that you can extend it
--     -- elsewhere in your config, without redefining it, due to `opts_extend`
--     sources = {
--       default = { 'lsp', 'path', 'snippets', 'buffer' },
--     },
--
--     -- Blink.cmp uses a Rust fuzzy matcher by default for typo resistance and significantly better performance
--     -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
--     -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
--     --
--     -- See the fuzzy documentation for more information
--     fuzzy = { implementation = 'prefer_rust_with_warning' },
--
--     completion = {
--       -- Disable auto brackets
--       -- NOTE: some LSPs may add auto brackets themselves anyway
--       accept = { auto_brackets = { enabled = false } },
--
--       -- Show documentation when selecting a completion item
--       documentation = { auto_show = true, auto_show_delay_ms = 500 },
--
--       -- Display a preview of the selected item on the current line
--       -- ghost_text = { enabled = true },
--     },
--
--     signature = { enabled = true }, },
--   opts_extend = { 'sources.default' },
-- }

return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = { 'rafamadriz/friendly-snippets' },

  version = '*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = 'default' },

    cmdline = {
      completion = {
        menu = {},
        list = {
          selection = {},
        },
      },
    },
    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono',
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = 'prefer_rust_with_warning' },

    completion = {
      accept = {
        auto_brackets = { enabled = true },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 250,
        window = {
          border = 'padded',
          winblend = 20,
        },
      },

      menu = {
        draw = {
          columns = { { 'label', 'kind_icon', gap = 1 }, { 'kind', 'source_name', gap = 1 } },
          components = {},
        },
        border = 'padded',
        winblend = 20,
      },
    },
    signature = {
      enabled = true,
      window = {
        winblend = 20,
        show_documentation = true,
        border = 'solid',
      },
    },
  },
  opts_extend = { 'sources.default' },
}
