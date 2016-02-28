-----------------------------------------------------------------------------------------------------------------------
--                                                Rules config                                                       --
-----------------------------------------------------------------------------------------------------------------------

-- Grab environment
local awful =require("awful")

-- Initialize tables and vars for module
-----------------------------------------------------------------------------------------------------------------------
local rules = {}

-- Shifty -- http://awesome.naquadah.org/wiki/Shifty change -- TODO
-- Build rule table
-----------------------------------------------------------------------------------------------------------------------
function rules:build(args)

	local args = args or {}
	local tags = args.tags or {} -- bad !!!

	local user_rules = {
    {
      rule_any   = { class = { "terminator", "Terminal" }},
      properties = { tag = tags[1][1] }
    },
    {
      rule_any   = { class = { "dolphin", "nemo", "ark", "ranger", "nautilus", "thunar" }},
      properties = { tag = tags[1][2] }
    },
    {
      rule_any   = { class = { "no_app" }},
      properties = { tag = tags[1][3] }
    },
    {
      rule_any   = { class = { "evince", "okular", "zathura" }},
      properties = { tag = tags[1][4] }
    },
    {
      rule_any   = { class = { "gedit", "kate", "emacs", "gvim", "atom" }},
      properties = { tag = tags[1][5] }
    },
    {
      rule_any   = { role = { "browser" }},
      properties = { tag = tags[1][6] }
    },
    {
      rule_any   = { class = { "quassel", "skype", "Telegram" }},
      properties = { tag = tags[1][7] }
    },
    {
      rule_any   = { class = { "clementine", "banshee", "rhythmbox" }},
      properties = { tag = tags[1][8] }
    },
    {
      rule_any   = { class = { "inkscape", "blender" }},
      properties = { tag = tags[1][9] }
    },


		{
			rule       = { class = "Gimp" }, except = { role = "gimp-image-window" },
			properties = { floating = true }
		},
		{
			rule       = { class = "Firefox" }, except = { role = "browser" },
			properties = { floating = true }
		},
		{
			rule_any   = { class = { "pinentry", "Plugin-container", "Acyl.py" } },
			properties = { floating = true }
		},
		{
			rule       = { class = "Key-mon" },
			properties = { sticky = true }
		},
		{
			rule = { class = "Exaile" },
			callback = function(c)
				for _, exist in ipairs(awful.client.visible(c.screen)) do
					if c ~= exist and c.class == exist.class then
						awful.client.floating.set(c, true)
						return
					end
				end
				awful.client.movetotag(tags[1][2], c)
				c.minimized = true
			end
		}
	}

	return user_rules
end

-- End
-----------------------------------------------------------------------------------------------------------------------
return rules
