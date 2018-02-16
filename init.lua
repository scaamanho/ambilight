--[[
	Ambilight mod for minetest
	Copyright (C) 2018 Santiago Caamaño  <scaamanho@gmail.com>
	hereby released under the GNU LESSER GENERAL PUBLIC LICENSE v3 license.
]]--

local modpath = minetest.get_modpath(minetest.get_current_modname())
--local creative_mode = minetest.setting_getbool("creative_mode")

ambilight = {}

--dofile(modpath .. "/api.lua")

function ambilight.register_recipe(name, recipe)
	minetest.register_craft({
		--type = "shapeless",
		output = "ambilight:"..name,
		recipe = recipe
	})
end

-- TODO: check mod stairs
function ambilight.register_stairs(name,node)
	-- Register default stairs and slabs
	stairs.register_stair_and_slab("anbilight"..name, "ambilight:"..name,
		{snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
		node.tiles,
		name.." Stair",
		name.." Slab",
		default.node_sound_glass_defaults())

	-- override created nodes
	-- override stair
	minetest.registered_nodes["stairs:stair_anbilight"..name].sunlight_propagates = true
	minetest.registered_nodes["stairs:stair_anbilight"..name].light_source = 14
	minetest.registered_nodes["stairs:stair_anbilight"..name].paramtype = "light"
	
	-- override slab
	minetest.registered_nodes["stairs:slab_anbilight"..name].sunlight_propagates = true
	minetest.registered_nodes["stairs:slab_anbilight"..name].light_source = 14
	minetest.registered_nodes["stairs:stair_anbilight"..name].paramtype = "light"

end

function ambilight.register_pane(name, node)
	
	--create default recipe for ambilight panes based in ambilight nodes
	recipe={{"ambilight:"..name,"ambilight:"..name,"ambilight:"..name},
					{"ambilight:"..name,"ambilight:"..name,"ambilight:"..name},
					{"","",""}}
	
	-- writed this code as it is for show clear sample of register nodes
	-- feel free to change it if you wish and reuse ambilight.register_light
	pane={ 
		description = node.description.." Pane",
		drawtype = "torchlike",
		tiles = node.tiles,
		inventory_image = node.tiles[1],
		wield_image = node.tiles[1],
		paramtype = "light",
		paramtype2 = "wallmounted",
		sunlight_propagates = true,
		walkable = true,
		groups = {choppy=2,dig_immediate=3},
		legacy_wallmounted = false,
		buildable_to = true,
		selection_box = {
			type = "wallmounted",
			wall_side = {-0.5, -0.5, -0.05, 0.5, 0.5, 0.05},
		}}
		
		minetest.register_node("ambilight:"..name.."_pane", pane)
		minetest.register_craft({
			output = "ambilight:"..name.."_pane 12",
			recipe = recipe
		})
		--[[]]--
end

--[[
	TODO: Doc API and defatult values
]]--
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
		
		-- enable_interact =true
		on_punch = node.on_punch,
		groups = {dig_immediate=2},
		sounds = default.node_sound_glass_defaults(),
	})

	-- register recipe for block
	if recipe then
		ambilight.register_recipe(name, recipe)
	end

	--register panes for block
	if node.reg_panel then 
		ambilight.register_pane(name,node)
	end

	-- register stairs and slabs
	if node.reg_stair then
		ambilight.register_stairs(name,node)
	end

	--TODO: Sacar a funcion

	-- set light off
	if node.enable_interact then

		-- TODO: poner capa por encima en vez de tener 2 imagenes y tener que definir tiles_off
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
	enable_interact = true
},
-- recipe
{{"default:torch","default:torch",""},{"","",""},{"","",""}}
)

ambilight.register_light("tree",{
	id=3,
	light_source = default.LIGHT_MAX-4,
	enable_interact = true
},
-- recipe
{{"default:torch","",""},{"default:torch","",""},{"","",""}})

ambilight.register_light("four",{
	id=4,
	light_source = default.LIGHT_MAX-4,
	enable_interact = true
})

ambilight.register_light("five",{
	id=5,
	light_source = default.LIGHT_MAX-4,
	enable_interact = true
})

ambilight.register_light("six",{
	id=6,
	light_source = default.LIGHT_MAX-4,
	enable_interact = true
})

ambilight.register_light("seven",{
	id=7,
	light_source = default.LIGHT_MAX-4,
	drawtype ="plantlike",
	type = "fixed",
	fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25},
	enable_interact = true
})

-- custom lights

--no light window glass
ambilight.register_light("window",{
	light_source = 0,
	tiles = {"ambilight_window1.png"},
	reg_stair = true,
	reg_panel = true,
	enable_interact = false
})

ambilight.register_light("petrol2",{
	light_source = default.LIGHT_MAX-4,
	drawtype ="plantlike",
	type = "fixed",
	fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25},
	tiles = {"ambitest2.png"}
})

--TODO: test drawtype = "torchlike",-->need top,wall,bott
ambilight.register_light("petrol3",{
	light_source = default.LIGHT_MAX-4,
	drawtype ="plantlike",
	type = "fixed",
	fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25},
	tiles = {"ambitest3_32.png"},
	inventory_image = "ambitest3_32.png",
	wield_image = "ambitest3_32.png"
})

--TODO: Lampara de item

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
]]--

