--[[
	Ambilight mod for minetest
	Copyright (C) 2018 Santiago Caamaño  <scaamanho@gmail.com>
	hereby released under the GNU LESSER GENERAL PUBLIC LICENSE v3 license.
]]--

local modpath = minetest.get_modpath(minetest.get_current_modname())

ambilight = {}

function ambilight.register_light(name, node)
	if not node.drawtype then
		node.drawtype="nodebox"
	end

	if not node.tiles then
		if not node.id then
			-- default texture
			node.tiles = {"ambilight_light1.png"} 
		else
			-- ambilight predefined id
			node.tiles = {"ambilight_light"..node.id..".png"}
		end
	end

	if not node.inventory_image then
		if not node.id then
			--defaut inv img
			node.inventory_image = node.tiles 
		else
			-- ambilight predefined id
			node.inventory_image = {"ambilight_light"..node.id..".png"}
		end
	end

	if not node.wield_image then
		if not node.id then
			-- default weild image
			node.wield_image = node.tiles 
		else
			-- ambilight predefined id
			node.wield_image = {"ambilight_light"..node.id..".png"} -- ambilight predefined
		end
	end

	-- set default node description
	if not node.description then
		node.description = "Ambilight "..name
	end

	-- set default light intensity
	if not node.light_source then
		node.light_source = default.LIGHT_MAX - 5
	end

	-- set light interaction
	if not node.enable_interact then
		node.enable_interact = false
	else
		node.on_punch = function(pos, node, clicker, itemstack, pointed_thing)
			minetest.set_node(pos, {name = "ambilight:"..name.."_off"})
		end
	end

	minetest.register_node("ambilight:"..name, {
		description = node.description,
		drawtype = node.drawtype,
		selection_box = node.selection_box,
		tiles = node.tiles,
		inventory_image = node.inventory_image,
		wield_image = node.wield_image,
		paramtype = "light",
		light_source = node.light_source,
		
		--buildable_to = true,
		on_punch = node.on_punch,
		groups = {dig_immediate=2},
		sounds = default.node_sound_glass_defaults(),
	})


	-- set light off
	if node.enable_interact then

		if not node.tiles_off then
			if not node.id then
				--load default texture
				node.tiles_off = node.tiles
			else
				-- ambilight predefined id
				node.tiles_off = {"ambilight_light"..node.id.."_off.png"}
			end
		end

		minetest.register_node("ambilight:"..name.."_off", {
			description = node.description.." off",
			drawtype = node.drawtype,
			selection_box = node.selection_box,
			tiles = node.tiles_off,
			paramtype = "light",
			--buildable_to = true,
			groups = {dig_immediate=2, not_in_creative_inventory=1},
			on_punch = function(pos, node, clicker, itemstack, pointed_thing)
				minetest.set_node(pos, {name = "ambilight:"..name})	  
			end,
			drop = "ambilight:"..name
			
		})
	end

end


-- default mod lights
ambilight.register_light("one",{
	id=1,
	enable_interact=true
})

ambilight.register_light("two",{
	id=2,
	light_source = default.LIGHT_MAX-4,
	enable_interact=true
})

ambilight.register_light("tree",{
	id=3,
	light_source = default.LIGHT_MAX-4,
	enable_interact=true
})

ambilight.register_light("four",{
	id=4,
	light_source = default.LIGHT_MAX-4,
	enable_interact=true
})

ambilight.register_light("five",{
	id=5,
	light_source = default.LIGHT_MAX-4,
	enable_interact=true
})

ambilight.register_light("six",{
	id=6,
	light_source = default.LIGHT_MAX-4,
	enable_interact=true
})

ambilight.register_light("seven",{
	id=7,
	light_source = default.LIGHT_MAX-4,
	drawtype ="plantlike",
	type = "fixed",
	fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25},
	enable_interact=true
})

ambilight.register_light("petrol3",{
	light_source = default.LIGHT_MAX-4,
	drawtype ="plantlike",
	type = "fixed",
	fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25},
	tiles = {"ambitest3_32.png"},
	inventory_image = "ambitest3_32.png",
	wield_image = "ambitest3_32.png"
})

--ambilight.register_light(8,default.LIGHT_MAX-1,nil,nil,{"ambilight_light8.png"})



minetest.register_node("ambilight:window1", {
	description = "Light 6 test",
	drawtype = "nodebox",
	tiles = {"ambilight_window1.png"},
--	inventory_image = "ambilight_window1.png",
--	wield_image = "ambilight_window1.png",
	paramtype = "light",
	light_source = 5,
	--buildable_to = true,
	groups = {dig_immediate=2},
	
})

minetest.register_node("ambilight:window2", {
	description = "Light 6 test",
	drawtype = "nodebox",
	tiles = {"ambilight_window2.png"},
--	inventory_image = "ambilight_window2.png",
--	wield_image = "ambilight_window2.png",
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


