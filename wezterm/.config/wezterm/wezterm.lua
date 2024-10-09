local wezterm = require 'wezterm';
local balance = require('balance')
local opacity = require('opacity')

return {
    hyperlink_rules = {
        -- Linkify things that look like URLs
        -- The default regex doesn't support port numbers.
        {
            regex = "\\b\\w+://(?:[\\w.-]+)\\S*\\b",
            format = "$0",
        },
    },

    -- color_scheme = "Cai (Gogh)",
    -- color_scheme = "Seti UI (base16)",
    -- color_scheme = "Solarized Dark Higher Contrast",
    -- color_scheme = "Pulp (terminal.sexy)",
    color_scheme = "Molokai",
    font = wezterm.font("JetBrainsMono Nerd Font", {weight = "Bold"}),
    font_size = 14.0,
    window_frame = {
        font = wezterm.font("JetBrainsMono Nerd Font", {weight="Bold"}),
        font_size = 16.0,
    },

    inactive_pane_hsb = {
        saturation = 0.5,
        brightness = 0.3,
    },

    -- window_background_opacity = 0.5,

    window_decorations = 'RESIZE|INTEGRATED_BUTTONS',

    mouse_bindings = {
        -- Change the default click behavior so that it only selects
        -- text and doesn't open hyperlinks
        {
            event={Up={streak=1, button="Left"}},
            mods="NONE",
            action=wezterm.action.CompleteSelection("PrimarySelection"),
        },

        -- and make Cmd-Click open hyperlinks
        {
            event={Up={streak=1, button="Left"}},
            mods="SUPER",
            action=wezterm.action.OpenLinkAtMouseCursor,
        },
    },

    leader = { key="j", mods="SUPER", timeout_milliseconds=1000 },
    keys = {

        -- Open config with CMD-,
        {
            key = ',',
            mods = 'SUPER',
            action = wezterm.action.SpawnCommandInNewTab {
                cwd = wezterm.home_dir,
                args = { '/opt/homebrew/bin/nvim', wezterm.config_file },
            },
        },

        -- New Tab in HOME directory.
        {key="t", mods="LEADER", action=wezterm.action.SpawnCommandInNewTab {args={"/opt/homebrew/bin/fish", "-l"}, cwd=wezterm.home_dir}},
        {key="t", mods="SUPER", action=wezterm.action.SpawnCommandInNewTab {args={"/opt/homebrew/bin/fish", "-l"}, cwd=wezterm.home_dir}},

        -- Tabs
        {key="LeftArrow", mods="SUPER", action=wezterm.action{ActivateTabRelative=-1}},
        {key="RightArrow", mods="SUPER", action=wezterm.action{ActivateTabRelative=1}},

        {key="LeftArrow", mods="SHIFT|SUPER", action=wezterm.action{MoveTabRelative=-1}},
        {key="RightArrow", mods="SHIFT|SUPER", action=wezterm.action{MoveTabRelative=1}},

        -- Panes
        {key="z", mods="SUPER", action="TogglePaneZoomState"},
        {key="d", mods="SUPER", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
        {key="|", mods="LEADER", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
        {key="D", mods="SUPER", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
        {key="-", mods="LEADER", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},

        {key="LeftArrow", mods="META|SUPER", action=wezterm.action{ActivatePaneDirection="Left"}},
        {key="RightArrow", mods="META|SUPER", action=wezterm.action{ActivatePaneDirection="Right"}},
        {key="UpArrow", mods="META|SUPER", action=wezterm.action{ActivatePaneDirection="Up"}},
        {key="DownArrow", mods="META|SUPER", action=wezterm.action{ActivatePaneDirection="Down"}},
        {key="j", mods="META|SUPER|SHIFT|CTRL", action=wezterm.action{ActivatePaneDirection="Down"}},
        {key="k", mods="META|SUPER|SHIFT|CTRL", action=wezterm.action{ActivatePaneDirection="Up"}},
        {key="h", mods="META|SUPER|SHIFT|CTRL", action=wezterm.action{ActivatePaneDirection="Left"}},
        {key="l", mods="META|SUPER|SHIFT|CTRL", action=wezterm.action{ActivatePaneDirection="Right"}},
        {key="j", mods="LEADER", action=wezterm.action{ActivatePaneDirection="Down"}},
        {key="k", mods="LEADER", action=wezterm.action{ActivatePaneDirection="Up"}},
        {key="h", mods="LEADER", action=wezterm.action{ActivatePaneDirection="Left"}},
        {key="l", mods="LEADER", action=wezterm.action{ActivatePaneDirection="Right"}},

        {key = "H", mods = "LEADER", action=wezterm.action{AdjustPaneSize={"Left", 5}}},
        {key = "LeftArrow", mods = "LEADER", action=wezterm.action{AdjustPaneSize={"Left", 5}}},
        {key = "L", mods = "LEADER", action=wezterm.action{AdjustPaneSize={"Right", 5}}},
        {key = "RightArrow", mods = "LEADER", action=wezterm.action{AdjustPaneSize={"Right", 5}}},
        {key = "J", mods = "LEADER", action=wezterm.action{AdjustPaneSize={"Down", 5}}},
        {key = "DownArrow", mods = "LEADER", action=wezterm.action{AdjustPaneSize={"Down", 5}}},
        {key = "K", mods = "LEADER", action=wezterm.action{AdjustPaneSize={"Up", 5}}},
        {key = "UpArrow", mods = "LEADER", action=wezterm.action{AdjustPaneSize={"Up", 5}}},

        -- Kill off annoying bindings
        {key="-", mods="CTRL", action="DisableDefaultAssignment"},
        {key="_", mods="CTRL|SHIFT", action="DisableDefaultAssignment"},
        {key="+", mods="CTRL", action="DisableDefaultAssignment"},
        {key="Enter", mods="META", action="DisableDefaultAssignment"},

        -- Toggle opacity
        {key = "u", mods = "SUPER", action = wezterm.action.EmitEvent "toggle-opacity"},

        -- Balance panes
        {
            -- balance x & y
            key = "b",
            mods = "META|SUPER|SHIFT|CTRL",
            action = wezterm.action.Multiple {
                wezterm.action_callback(balance.balance_panes("x")),
                wezterm.action_callback(balance.balance_panes("y")),
            },
        },
        {
            -- balance x
            key = "x",
            mods = "META|SUPER|SHIFT|CTRL",
            action = wezterm.action_callback(balance.balance_panes("x")),
        },
        {
            -- balance y
            key = "y",
            mods = "META|SUPER|SHIFT|CTRL",
            action = wezterm.action_callback(balance.balance_panes("y")),
        },
    }
}
