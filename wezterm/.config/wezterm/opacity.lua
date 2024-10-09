local wezterm = require 'wezterm';

local module = {}

-- Toggle opacity
wezterm.on('toggle-opacity', function(window, pane)
  local overrides = window:get_config_overrides() or {}
  if not overrides.window_background_opacity then
    overrides.window_background_opacity = 0.7
    overrides.text_background_opacity = 0.7
  else
    overrides.window_background_opacity = nil
    overrides.text_background_opacity = nil
  end
  window:set_config_overrides(overrides)
end)

return module
