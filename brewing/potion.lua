local modpath, S = ...

--The Potion Part!!!
brewing.potions = {
	players = {},
	effects = {
		phys_override = function(sname, name, fname, time, sdata, flags)
			local def = {
				on_use = function(itemstack, user, pointed_thing)
					brewing.magic_sound(user)
					brewing.magic_aura(user)
					brewing.potions.grant(time, user:get_player_name(), fname.."_"..flags.type..sdata.type, name, flags)
					itemstack:take_item()
					return itemstack
				end,
				potions = {
					speed = 0,
					jump = 0,
					gravity = 0,
					tnt = 0,
					air = 0,
				},
			}
			return def
		end,
		fixhp = function(sname, name, fname, time, sdata, flags)
			local def = {
				on_use = function(itemstack, user, pointed_thing)
					brewing.magic_sound(user)
					brewing.magic_aura(user)
					for i=0, (sdata.time or 0) do
						minetest.after(i, function()
							local hp = user:get_hp()
							if flags.inv==true then
								hp = hp - (sdata.hp or 3)
							else
								hp = hp + (sdata.hp or 3)
							end
							hp = math.min(20, hp)
							hp = math.max(0, hp)
							user:set_hp(hp)
						end)
					end
					itemstack:take_item()
					return itemstack
				end,
			}
			def.mobs = {
				on_near = def.on_use,
			}
			return def
		end,
		air = function(sname, name, fname, time, sdata, flags)
			local def = {
				on_use = function(itemstack, user, pointed_thing)
					brewing.magic_sound(user)
					brewing.magic_aura(user)
					local potions_e = brewing.potions.players[user:get_player_name()]
					potions_e.air = potions_e.air + (sdata.time or 0)
					for i=0, (sdata.time or 0) do
						minetest.after(i, function()
							local br = user:get_breath()
							if flags.inv==true then
								br = br - (sdata.br or 3)
							else
								br = br + (sdata.br or 3)
							end
							br = math.min(11, br)
							br = math.max(0, br)
							user:set_breath(br)
							
							if i==(sdata.time or 0) then
								potions_e.air = potions_e.air - (sdata.time or 0)
							end
						end)
					end
					itemstack:take_item()
					return itemstack
				end,
			}
			return def
		end,
		blowup = function(sname, name, fname, time, sdata, flags)
			local def = {
				on_use = function(itemstack, user, pointed_thing)
					brewing.magic_sound(user)
					brewing.magic_aura(user)
					brewing.potions.grant(time, user:get_player_name(), fname.."_"..flags.type..sdata.type, name, flags)
					itemstack:take_item()
					return itemstack
				end,
				potions = {
					speed = 0,
					jump = 0,
					gravity = 0,
					tnt = 0,
				},
			}
			def.mobs = {
				on_near = function(itemstack, user, pointed_thing)
					local str = user:get_luaentity().brewing.potions.exploding
					if flags.inv==true then
						str = math.max(0, str - sdata.power)
					else
						str = math.min(str + sdata.power, 250)
					end
					user:get_luaentity().brewing.potions.exploding = str
					itemstack:take_item()
					return itemstack
				end,
			}
			return def
		end,
	},
	grant = function(time, playername, potion_name, type, flags)
		local rootdef = minetest.registered_items[potion_name]
		if rootdef == nil then
			return
		end
		if rootdef.potions == nil then
			return
		end
		local def = {}
		for name, val in pairs(rootdef.potions) do
			def[name] = val
		end
		if flags.inv==true then
			def.gravity = 0 - def.gravity
			def.speed = 0 - def.speed
			def.jump = 0 - def.jump
			def.tnt = 0 - def.tnt
		end
		brewing.potions.addPrefs(playername, def.speed, def.jump, def.gravity, def.tnt)
		brewing.potions.refresh(playername)
		minetest.chat_send_player(playername, "You are under the effects of the "..type.." potion.")
		minetest.after(time, function()
			brewing.potions.addPrefs(playername, 0-def.speed, 0-def.jump, 0-def.gravity, 0-def.tnt)
			brewing.potions.refresh(playername)
			minetest.chat_send_player(playername, "The effects of the "..type.." potion have worn off.")
		end)
	end,
	addPrefs = function(playername, speed, jump, gravity, tnt)
		local prefs = brewing.potions.players[playername]
		prefs.speed = prefs.speed + speed
		prefs.jump = prefs.jump + jump
		prefs.gravity = prefs.gravity + gravity
		prefs.tnt = prefs.tnt + tnt
	end,
	refresh = function(playername)
		if minetest.get_player_by_name(playername)~=nil then
			local prefs = brewing.potions.players[playername]
			minetest.get_player_by_name(playername):set_physics_override(prefs.speed, prefs.jump, prefs.gravity)
		end
	end,
	register_potion = function(sname, name, fname, time, def)
		local tps = {"add", "sub"}
		for t=1, #tps do
			for i=1, #def.types do
				local sdata = def.types[i]
				local item_def = {
					description = name.." "..S("Potion (type:").." "..tps[t]..sdata.type..")",
					inventory_image = "potions_bottle.png^potions_"..(def.texture or sname)..".png^potions_"..tps[t]..sdata.type..".png",
					drawtype = "plantlike",
					paramtype = "light",
					walkable = false,
					groups = {dig_immediate=3,attached_node=1},
					--sounds = default.node_sound_glass_defaults(),
				}
				item_def.tiles = {item_def.inventory_image}
				local flags = {
					inv = false,
					type = tps[t],
				}
				if t == 2 then
					flags.inv = true
				end
				for name, val in pairs(brewing.potions.effects[def.effect](sname, name, fname, time, sdata, flags)) do
					item_def[name] = val
				end
				for name, val in pairs(sdata.set) do
					item_def[name] = val
				end
				for name, val in pairs(sdata.effects) do
					item_def.potions[name] = val
				end
				minetest.register_node(fname.."_"..tps[t]..sdata.type, item_def)
				--potions.register_liquid(i..tps[t]..sname, name.." ("..tps[t].." "..i..")", item_def.on_use)
				if minetest.get_modpath("throwing")~=nil then
					brewing.potions.register_arrow(fname.."_"..tps[t]..sdata.type, i..tps[t]..sname, name.." ("..tps[t].." "..i..")", item_def.on_use,
							item_def.description, item_def.inventory_image)
				end
			end
		end
	end,
	register_liquid = function(name, hname, funct)
		minetest.register_node("brewing:"..name.."_flowing", {
			description = S("Potion (")..hname..") (flowing)",
			inventory_image = minetest.inventorycube("oil_oil.png"),
			drawtype = "flowingliquid",
			tile_images = {"oil_oil.png"},
			paramtype = "light",
			walkable = false,
			pointable = false,
			diggable = false,
			buildable_to = true,
			liquidtype = "flowing",
			liquid_alternative_flowing = "oil:oil_flowing",
			liquid_alternative_source = "oil:oil_source",
			liquid_viscosity = OIL_VISC,
			post_effect_color = {a=40, r=0, g=0, b=0},
			special_materials = {
				{image="oil_oil.png", backface_culling=false},
				{image="oil_oil.png", backface_culling=true},
			},
			potionWalk = funct,
		})
		
		minetest.register_node("brewing:"..name.."_source", {
			description = S("Potion (")..hname..")",
			inventory_image = minetest.inventorycube("oil_oil.png"),
			drawtype = "liquid",
			tile_images = {"oil_oil.png"},
			paramtype = "light",
			walkable = false,
			pointable = false,
			diggable = false,
			buildable_to = true,
			liquidtype = "source",
			liquid_alternative_flowing = "oil:oil_flowing",
			liquid_alternative_source = "oil:oil_source",
			liquid_viscosity = OIL_VISC,
			post_effect_color = {a=40, r=0, g=0, b=0},
			special_materials = {
				{image="oil_oil.png", backface_culling=false},
			},
			potionWalk = funct,
		})
		
--		bucket.register_liquid(
--			"brewing:"..name.."_source",
--			"brewing:"..name.."_flowing",
--			"brewing:bucket_"..name,
--			"oil_oil_bucket.png",
--			"Bucket of potion ("..hname..")"
--		)
	end,
}

dofile(modpath.."/arrows.lua")

brewing.potions.register_potion("speed", S("Speed"), "brewing:speed", 300, {
	effect = "phys_override",
	types = {
		{
			type = 1,
			set = {},
			effects = {
				speed = 1,
			},
		},
		{
			type = 2,
			set = {},
			effects = {
				speed = 2,
			},
		},
		{
			type = 3,
			set = {},
			effects = {
				speed = 3,
			},
		},
	}
})
brewing.potions.register_potion("antigrav", S("Anti-Gravity"), "brewing:antigravity", 300, {
	effect = "phys_override",
	types = {
		{
			type = 1,
			set = {},
			effects = {
				gravity = -0.1,
			},
		},
		{
			type = 2,
			set = {},
			effects = {
				gravity = -0.2,
			},
		},
		{
			type = 3,
			set = {},
			effects = {
				gravity = -0.3,
			},
		},
	}
})

brewing.potions.register_potion("jump", S("Jumping"), "brewing:jumping", 300, {
	effect = "phys_override",
	types = {
		{
			type = 1,
			set = {},
			effects = {
				jump = 0.5,
			},
		},
		{
			type = 2,
			set = {},
			effects = {
				jump = 1,
			},
		},
		{
			type = 3,
			set = {},
			effects = {
				jump = 1.5,
			},
		},
	}
})

brewing.potions.register_potion("ouhealth", S("One Use Health"), "brewing:ouhealth", 300, {
	effect = "fixhp",
	types = {
		{
			type = 1,
			hp = 20,
			set = {},
			effects = {
			},
		},
		{
			type = 2,
			hp = 40,
			set = {},
			effects = {
			},
		},
		{
			type = 3,
			hp = 60,
			set = {},
			effects = {
			},
		},
	}
})

brewing.potions.register_potion("health", S("Health"), "brewing:health", 300, {
	effect = "fixhp",
	types = {
		{
			type = 1,
			time = 60,
			set = {},
			effects = {
			},
		},
		{
			type = 2,
			time = 120,
			set = {},
			effects = {
			},
		},
		{
			type = 3,
			time = 180,
			set = {},
			effects = {
			},
		},
	}
})

brewing.potions.register_potion("ouair", S("One Use Air"), "brewing:ouair", 300, {
	effect = "air",
	types = {
		{
			type = 1,
			br = 2,
			set = {},
			effects = {
			},
		},
		{
			type = 2,
			br = 5,
			set = {},
			effects = {
			},
		},
		{
			type = 3,
			br = 10,
			set = {},
			effects = {
			},
		},
	}
})

brewing.potions.register_potion("air", S("Air"), "brewing:air", 300, {
	effect = "air",
	types = {
		{
			type = 1,
			time = 60,
			set = {},
			effects = {
			},
		},
		{
			type = 2,
			time = 120,
			set = {},
			effects = {
			},
		},
		{
			type = 3,
			time = 180,
			set = {},
			effects = {
			},
		},
	}
})

--potions.register_potion("tnt", "Liquid Tnt", "brewing:tnt", 300, {
--	effect = "blowup",
--	types = {
--		{
--			type = 1,
--			power = 5,
--			set = {},
--			effects = {
--				tnt = 5,
--			},
--		},
--	}
--})

--minetest.register_craftitem("brewing:jump_add1", {
--	description = "Jumping Potion",
--	--inventory_image = "morefoods_chocolate.png",
--	on_use = function(itemstack, user, pointed_thing)
--		potions.grant(300, user:get_player_name(), "brewing:jump_add1", "Jumping")
--		itemstack:take_item()
--		return itemstack
--	end,
--	potions = {
--		speed = 0,
--		jump = 0.5,
--		gravity = 0,
--	},
--})

--minetest.register_craftitem("brewing:antigravity_add1", {
--	description = "Anti-Gravity Potion",
--	--inventory_image = "morefoods_chocolate.png",
--	on_use = function(itemstack, user, pointed_thing)
--		potions.grant(300, user:get_player_name(), "brewing:antigravity_add1", "Anti-Gravity")
--		itemstack:take_item()
--		return itemstack
--	end,
--	potions = {
--		speed = 0,
--		jump = 0,
--		gravity = -0.1,
--	},
--})

--minetest.register_craftitem("brewing:speed_add1", {
--	description = "Speed Potion",
--	--inventory_image = "morefoods_chocolate.png",
--	on_use = function(itemstack, user, pointed_thing)
--		potions.grant(300, user:get_player_name(), "brewing:speed_add1", "Speed")
--		itemstack:take_item()
--		return itemstack
--	end,
--	potions = {
--		speed = 3,
--		jump = 0,
--		gravity = 0,
--	},
--})

minetest.register_on_joinplayer(function(player)
	brewing.potions.players[player:get_player_name()] = {
		antigravity = 1,
		jump = 1,
		gravity = 1,
		tnt = 0,
		air = 0,
	}
end)

minetest.register_on_joinplayer(function(player)
	brewing.potions.players[player:get_player_name()] = {
		speed = 1,
		jump = 1,
		gravity = 1,
		tnt = 0,
		air = 0,
	}
end)

--local timer = 0
--minetest.register_globalstep(function(dtime)
--	timer = timer + dtime;
--	if timer >= 1 then
--		for _,player in ipairs(minetest.get_connected_players()) do
----			local pos = player:getpos()
----			local def = minetest.registered_nodes[minetest.get_node(pos).name]
----			if def.potionWalk~=nil then
----				def.potionWalk(nil, player, nil)
----			end
----			
----			if potions.players[player:get_player_name()].tnt > 0 and math.random(potions.players[player:get_player_name()].tnt)==0 then
----				
----			end
--		end
--		timer = 0
--	end
--end)

--dofile(minetest.get_modpath("potions").."/table.lua")

minetest.register_chatcommand("effect", {
	params = "none",
	description = "get effect info",
	func = function(name, param)
		minetest.chat_send_player(name, "effects:")
		local potions_e = brewing.potions.players[name]
		if potions_e~=nil then
			for potion_name, val in pairs(potions_e) do
				minetest.chat_send_player(name, potion_name .. "=" .. val)
			end
		end
	end,
})