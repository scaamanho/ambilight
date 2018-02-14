--[[
	Ambilight mod for minetest
	Copyright (C) 2018 Santiago Caamaño  <scaamanho@gmail.com>
	hereby released under the GNU LESSER GENERAL PUBLIC LICENSE v3 license.
]]--

local modpath = minetest.get_modpath(minetest.get_current_modname())

ambilight = {}


function ambilight.register_light(id, light_level, drawtype, selection_box, tiles)
	if not drawtype then
		drawtype = "nodebox"
	end	

	if not tiles then
		tiles = {"ambilight_light"..id..".png"}
	else 
		tiles=tiles
	end

	minetest.register_node("ambilight:"..id, {
		description = "Light "..id.." test",
		drawtype = drawtype,
		selection_box = selection_box,
		tiles = tiles,
		inventory_image = "ambilight_light"..id..".png",
		wield_image = "ambilight_light"..id..".png",
		paramtype = "light",
		light_source = light_level,
		
		--buildable_to = true,
		on_punch = function(pos, node, clicker, itemstack, pointed_thing)
			minetest.set_node(pos, {name = "ambilight:"..id.."_off"})	  
		end,
		groups = {dig_immediate=2},
		sounds = default.node_sound_glass_defaults(),
	})
	

	if not tiles then
		tiles = {"ambilight_light"..id.."_off.png"}
	else 
		tiles=tiles
	end

	minetest.register_node("ambilight:"..id.."_off", {
		description = "Light "..id.." test off",
		drawtype = drawtype,
		selection_box = selection_box,
		tiles = tiles,
		wield_image = "ambilight_light"..id..".png",
		paramtype = "light",
		--buildable_to = true,
		groups = {dig_immediate=2, not_in_creative_inventory=1},
		on_punch = function(pos, node, clicker, itemstack, pointed_thing)
			minetest.set_node(pos, {name = "ambilight:"..id})	  
		end,
		drop = "ambilight:"..id
		
	})
end


ambilight.register_light(1,default.LIGHT_MAX-4)
ambilight.register_light(2,default.LIGHT_MAX-4,"nodebox",{})
ambilight.register_light(3,default.LIGHT_MAX-4,"nodebox",{})
ambilight.register_light(4,default.LIGHT_MAX-4)
ambilight.register_light(5,default.LIGHT_MAX-4)
ambilight.register_light(6,default.LIGHT_MAX-4)
ambilight.register_light(7,default.LIGHT_MAX-4,"plantlike",{
	type = "fixed",
	fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
})

--ambilight.register_light(8,default.LIGHT_MAX-1,nil,nil,{"ambilight_light8.png"})



minetest.register_node("ambilight:window1", {
	description = "Light 6 test",
	drawtype = "nodebox",
	tiles = {"ambilight_window1.png"},
	inventory_image = "ambilight_window1.png",
	wield_image = "ambilight_window1.png",
	paramtype = "light",
	light_source = 5,
	--buildable_to = true,
	groups = {dig_immediate=2},
	
})

minetest.register_node("ambilight:window2", {
	description = "Light 6 test",
	drawtype = "nodebox",
	tiles = {"ambilight_window2.png"},
	inventory_image = "ambilight_window2.png",
	wield_image = "ambilight_window2.png",
	paramtype = "light",
	light_source = 5,
	--buildable_to = true,
	groups = {dig_immediate=2},
	
})

minetest.register_node("ambilight:window3", {
	description = "Light 6 test",
	drawtype = "nodebox",
	tiles = {"ambilight_window3.png"},
	inventory_image = "ambilight_window3.png",
	wield_image = "ambilight_window3.png",
	paramtype = "light",
	light_source = 5,
	--buildable_to = true,
	groups = {dig_immediate=2},
	
})



minetest.register_craft({
	--type = "shapeless",
	output = "ambilight:1",
	recipe = {{"default:torch","default:torch","default:torch"},{"","",""},{"","",""}}
})

minetest.register_craft({
	--type = "shapeless",
	output = "ambilight:2 4",
	recipe = {{"default:torch","default:torch",""},{"","",""},{"","",""}}
})

minetest.register_craft({
	--type = "shapeless",
	output = "ambilight:3 4",
	recipe = {{"default:torch","",""},{"default:torch","",""},{"","",""}}
})


