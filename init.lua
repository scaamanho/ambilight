--[[
	Ambilight mod for minetest
	Copyright (C) 2018 Santiago Caamaño  <scaamanho@gmail.com>
	hereby released under the GNU LESSER GENERAL PUBLIC LICENSE v3 license.
]]--

local modpath = minetest.get_modpath(minetest.get_current_modname())
--local creative_mode = minetest.setting_getbool("creative_mode")

ambilight = {}

-- load api with the function ambilight.register_light api
-- `ambilight.register_light(name, node, recipe)`
dofile(modpath .. "/api.lua")




-- default mod lights
ambilight.register_light("glasslamp",
--node
{id = 1,light_source = default.LIGHT_MAX-2, enable_interact = true},
-- recipe
{{"default:paper","default:paper","default:paper"},
{"default:glass","default:torch","default:glass"},
{"default:paper","default:paper","default:paper"}})



ambilight.register_light("stonelamp",{
	id=2,
	light_source = default.LIGHT_MAX-2,
	enable_interact = true
},
-- recipe
{{"default:paper","default:paper","default:paper"},
{"default:stone","default:torch","default:stone"},
{"default:paper","default:paper","default:paper"}})

ambilight.register_light("paperlamp",{
	id=3,
	light_source = default.LIGHT_MAX-2,
	enable_interact = true
},
-- recipe
{{"default:paper","default:paper","default:paper"},
{"default:paper","default:torch","default:paper"},
{"default:paper","default:paper","default:paper"}})

ambilight.register_light("chineselamp",{
	id=4,
	light_source = default.LIGHT_MAX-3,
	enable_interact = true
},
-- recipe
{{"default:paper","default:paper","default:paper"},
{"dye:red","default:torch","dye:red"},
{"default:paper","default:paper","default:paper"}})



--Circle lamps
ambilight.register_light("glasslamp_cicle",{
	id=5,
	light_source = default.LIGHT_MAX-4,
	enable_interact = true
},
-- recipe
{{"","default:stick",""},
{"default:stick","ambilight:glasslamp","default:stick"},
{"","default:stick",""}})

ambilight.register_light("stonelamp_cicle",{
	id=6,
	light_source = default.LIGHT_MAX-4,
	enable_interact = true
},
-- recipe
{{"","default:stick",""},
{"default:stick","ambilight:stonelamp","default:stick"},
{"","default:stick",""}})


ambilight.register_light("paperlamp_cicle",{
	id=7,
	light_source = default.LIGHT_MAX-4,
	enable_interact = true
},
-- recipe
{{"","default:stick",""},
{"default:stick","ambilight:paperlamp","default:stick"},
{"","default:stick",""}})


--Square lamps
ambilight.register_light("glasslamp_square",{
	id=8,
	light_source = default.LIGHT_MAX-4,
	enable_interact = true
},
-- recipe
{{"default:stick","","default:stick"},
{"default:stick","ambilight:glasslamp","default:stick"},
{"default:stick","","default:stick"}})

ambilight.register_light("stonelamp_square",{
	id=9,
	light_source = default.LIGHT_MAX-4,
	enable_interact = true
},
-- recipe
{{"default:stick","","default:stick"},
{"default:stick","ambilight:stonelamp","default:stick"},
{"default:stick","","default:stick"}})



ambilight.register_light("paperlamp_square",{
	id=10,
	light_source = default.LIGHT_MAX-1,
	enable_interact = true
},
-- recipe
{{"default:stick","","default:stick"},
{"default:stick","ambilight:paperlamp","default:stick"},
{"default:stick","","default:stick"}})


--Chinese lamp tail
ambilight.register_light("chinese_tail",{
	light_source = 0,
	drawtype ="plantlike",
	type = "fixed",
	tiles = {"chinese_tail.png"},
	walkable = false,
	sounds = default.node_sound_leaves_defaults(),
	fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25},
	enable_interact = false
},
-- recipe
{{"dye:red","dye:yellow","farming:cotton"},
{"","",""},
{"","",""}})

--[[ambilight.register_light("seven",{
	id=7,
	light_source = default.LIGHT_MAX-4,
	drawtype ="plantlike",
	type = "fixed",
	fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25},
	enable_interact = true
},
-- recipe
{{"default:torch","",""},
{"default:torch","",""},
{"","",""}})

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
})]]--

--[[
ambilight.register_light("cubelamp1",{
	light_source = default.LIGHT_MAX-4,
	tiles = {"latern_cube_top.png","latern_cube_side.png"},
	inventory_image = {"latern_cube_top.png","latern_cube_side.png"},
	wield_image = "latern_cube_side.png",
	reg_stair = false,
	reg_pane = false,
	enable_interact = true
},
-- recipe
{{"default:torch","",""},
{"default:torch","",""},
{"","",""}})


ambilight.register_light("cubelamp2",{
	light_source = default.LIGHT_MAX-4,
	tiles = {"latern_cube2_top.png","latern_cube2_side.png"},
	inventory_image = {"latern_cube2_top.png","latern_cube2_side.png"},
	wield_image = "latern_cube2_side.png",
	enable_interact = true
},
-- recipe
{{"default:torch","",""},
{"default:torch","",""},
{"","",""}})

ambilight.register_light("cubelamp3",{
	light_source = default.LIGHT_MAX-4,
	tiles = {"latern_cube3_top.png","latern_cube3_side.png"},
	inventory_image = {"latern_cube3_top.png","latern_cube3_side.png"},
	wield_image = "latern_cube3_side.png",
	enable_interact = true
},
-- recipe
{{"default:torch","",""},
{"default:torch","",""},
{"","",""}})

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

