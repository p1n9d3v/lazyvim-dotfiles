local wezterm = require('wezterm')
local backdrops = require('utils.backdrops')
local act = wezterm.action

local leader = { key = 't', mods = 'CTRL' }

local keys = {
   -- Pane splitting
   {
      key = '=',
      mods = 'LEADER',
      action = act.SplitHorizontal({
         domain = 'CurrentPaneDomain',
      }),
   },
   {
      key = '-',
      mods = 'LEADER',
      action = act.SplitVertical({
         domain = 'CurrentPaneDomain',
      }),
   },

   -- Tabs Management
   { key = 'c', mods = 'LEADER', action = act.SpawnTab('DefaultDomain') },
   { key = 'x', mods = 'LEADER', action = act.CloseCurrentTab({ confirm = false }) },

   --  Tabs: navigation
   { key = 'p', mods = 'LEADER', action = act.ActivateTabRelative(-1) },
   { key = 'n', mods = 'LEADER', action = act.ActivateTabRelative(1) },

   -- Pane switching
   { key = 'k', mods = 'LEADER', action = act.ActivatePaneDirection('Up') },
   { key = 'j', mods = 'LEADER', action = act.ActivatePaneDirection('Down') },
   { key = 'h', mods = 'LEADER', action = act.ActivatePaneDirection('Left') },
   { key = 'l', mods = 'LEADER', action = act.ActivatePaneDirection('Right') },

   -- Close all panes except the current one (equivalent to kill-pane -a)
   { key = 'e', mods = 'LEADER', action = act.CloseCurrentPane({ confirm = false }) },

   -- Backdrops
   {
      key = [[,]],
      mods = 'LEADER',
      action = wezterm.action_callback(function(window, _pane)
         backdrops:cycle_back(window)
      end),
   },
   {
      key = [[.]],
      mods = 'LEADER',
      action = wezterm.action_callback(function(window, _pane)
         backdrops:cycle_forward(window)
      end),
   },
   {
      key = [[/]],
      mods = 'LEADER',
      action = act.InputSelector({
         title = 'InputSelector: Select Background',
         choices = backdrops:choices(),
         fuzzy = true,
         fuzzy_description = 'Select Background: ',
         action = wezterm.action_callback(function(window, _pane, idx)
            if not idx then
               return
            end
            ---@diagnostic disable-next-line: param-type-mismatch
            backdrops:set_img(window, tonumber(idx))
         end),
      }),
   },

   -- Page scrolling --
   { key = 'PageUp', mods = 'LEADER', action = act.ScrollByPage(-1) },
   { key = 'PageDown', mods = 'LEADER', action = act.ScrollByPage(1) },

   -- key-tables --
   -- resizes fonts
   {
      key = 'f',
      mods = 'LEADER',
      action = act.ActivateKeyTable({
         name = 'resize_font',
         one_shot = false,
         timemout_miliseconds = 1000,
      }),
   },
   -- resize panes
   {
      key = 'w',
      mods = 'LEADER',
      action = act.ActivateKeyTable({
         name = 'resize_pane',
         one_shot = false,
         timemout_miliseconds = 1000,
      }),
   },
   -- -- copy/paste --
   -- { key = 'c', mods = 'CTRL|SHIFT', action = act.CopyTo('Clipboard') },
   -- { key = 'v', mods = 'CTRL|SHIFT', action = act.PasteFrom('Clipboard') },
   { key = 'c', mods = 'CMD', action = act.CopyTo('Clipboard') },
   { key = 'v', mods = 'CMD', action = act.PasteFrom('Clipboard') },
}

local key_tables = {
   resize_font = {
      { key = 'k', action = act.IncreaseFontSize },
      { key = 'j', action = act.DecreaseFontSize },
      { key = 'r', action = act.ResetFontSize },
      { key = 'Escape', action = 'PopKeyTable' },
      { key = 'q', action = 'PopKeyTable' },
   },
   resize_pane = {
      { key = 'k', action = act.AdjustPaneSize({ 'Up', 1 }) },
      { key = 'j', action = act.AdjustPaneSize({ 'Down', 1 }) },
      { key = 'h', action = act.AdjustPaneSize({ 'Left', 1 }) },
      { key = 'l', action = act.AdjustPaneSize({ 'Right', 1 }) },
      { key = 'Escape', action = 'PopKeyTable' },
      { key = 'q', action = 'PopKeyTable' },
   },
}

local mouse_bindings = {
   -- Ctrl-click will open the link under the mouse cursor
   {
      event = { Up = { streak = 1, button = 'Left' } },
      mods = 'CTRL',
      action = act.OpenLinkAtMouseCursor,
   },
}

return {
   disable_default_key_bindings = true,
   leader = leader,
   keys = keys,
   key_tables = key_tables,
   mouse_bindings = mouse_bindings,
}
