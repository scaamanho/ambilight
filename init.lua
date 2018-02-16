--[[
	Ambilight mod for minetest
	Copyright (C) 2018 Santiago Caamaño  <scaamanho@gmail.com>
	hereby released under the GNU LESSER GENERAL PUBLIC LICENSE v3 license.
]]--

local modpath = minetest.get_modpath(minetest.get_current_modname())
--local creative_mode = minetest.setting_getbool("creative_mode")

ambilight = {}

function ambilight.register_recipe(name, recipe)
	minetest.register_craft({
		--type = "shapeless",
		output = "ambilight:"..name,
		recipe = recipe
	})
end

function ambilight.register_light(name, node, recipe)
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
		--inventory_image = node.inventory_image,
		--wield_image = node.wield_image,
		paramtype = "light",
		sunlight_propagates = true,
		light_source = node.light_source,
		
		--buildable_to = true,
		on_punch = node.on_punch,
		groups = {dig_immediate=2},
		sounds = default.node_sound_glass_defaults(),
	})

	if recipe then
		ambilight.register_recipe(name, recipe)
	end

	-- TODO: sacar a funcion
	if node.slice_block then -- and node.drawtipe == "nodebox"
		-- todo: crear nodo slice
		-- llamada recursiva con slice_block = false
		-- generar recipe de manera automatica con el bloque padre
	end


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
			sunlight_propagates = true,
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
ambilight.register_light("one",
--node
{id = 1, enable_interact = true},
-- recipe
{{"default:torch","default:torch","default:torch"},{"","",""},{"","",""}})

ambilight.register_light("two",{
	id=2,
	light_source = default.LIGHT_MAX-4,
	enable_interact=true
},
-- recipe
{{"default:torch","default:torch",""},{"","",""},{"","",""}}
)

ambilight.register_light("tree",{
	id=3,
	light_source = default.LIGHT_MAX-4,
	enable_interact=true
},
-- recipe
{{"default:torch","",""},{"default:torch","",""},{"","",""}})

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

-- custom lights
ambilight.register_light("window",{
	light_source = default.LIGHT_MAX-6,
	tiles = {"ambilight_window1.png"},
	enable_interact=true
})

ambilight.register_light("petrol2",{
	light_source = default.LIGHT_MAX-4,
	drawtype ="plantlike",
	type = "fixed",
	fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25},
	tiles = {"ambitest2.png"}
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


--[[
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
})]]--

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


