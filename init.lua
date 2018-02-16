--[[
	Ambilight mod for minetest
	Copyright (C) 2018 Santiago Caamaño  <scaamanho@gmail.com>
	hereby released under the GNU LESSER GENERAL PUBLIC LICENSE v3 license.
]]--

local modpath = minetest.get_modpath(minetest.get_current_modname())
--local creative_mode = minetest.setting_getbool("creative_mode")

ambilight = {}

-- load api with the function ambilight.register_light api
-- ambilight.register_light(name, node, recipe)
dofile(modpath .. "/api.lua")




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
	reg_pane = true,
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

--[[
--TODO: Lampara de item

ambilight.register_light("texturelamp1",{
	light_source = default.LIGHT_MAX-4,
	tiles = {"ambilight_light2_32","ambilight_light5_32.png"},
	reg_stair = false,
	reg_pane = false,
	enable_interact = true
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
]]--

