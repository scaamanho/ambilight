minetest.register_node("ambilight:one", {
	description = "Light 1 test",
	drawtype = "nodebox",
	tiles = {"ambilight_light1.png"},
	inventory_image = "ambilight_light1.png",
	wield_image = "ambilight_light1.png",
	paramtype = "light",
	light_source = 15,
	--buildable_to = true,
	groups = {dig_immediate=2},
	
	
})

minetest.register_node("ambilight:two", {
	description = "Light 2 test",
	drawtype = "nodebox",
	tiles = {"ambilight_light2.png"},
	inventory_image = "ambilight_light2.png",
	wield_image = "ambilight_light2.png",
	paramtype = "light",
	light_source = 5,
	--buildable_to = true,
	groups = {dig_immediate=2},
	
})

minetest.register_node("ambilight:tree", {
	description = "Light 3 test",
	drawtype = "nodebox",
	tiles = {"ambilight_light3.png"},
	inventory_image = "ambilight_light3.png",
	wield_image = "ambilight_light3.png",
	paramtype = "light",
	light_source = 5,
	--buildable_to = true,
	groups = {dig_immediate=2},
	
})


minetest.register_node("ambilight:four", {
	description = "Light 4 test",
	drawtype = "nodebox",
	tiles = {"ambilight_light4.png"},
	inventory_image = "ambilight_light4.png",
	wield_image = "ambilight_light4.png",
	paramtype = "light",
	light_source = 5,
	--buildable_to = true,
	groups = {dig_immediate=2},
	
})

minetest.register_node("ambilight:five", {
	description = "Light 5 test",
	drawtype = "nodebox",
	tiles = {"ambilight_light5.png"},
	inventory_image = "ambilight_light5.png",
	wield_image = "ambilight_light5.png",
	paramtype = "light",
	light_source = 5,
	--buildable_to = true,
	groups = {dig_immediate=2},
	
})

minetest.register_node("ambilight:six", {
	description = "Light 6 test",
	drawtype = "nodebox",
	tiles = {"ambilight_light6.png"},
	inventory_image = "ambilight_light6.png",
	wield_image = "ambilight_light6.png",
	paramtype = "light",
	light_source = 5,
	--buildable_to = true,
	groups = {dig_immediate=2},
	
})



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
	output = "ambilight:one",
	recipe = {{"default:torch","default:torch","default:torch"},{"","",""},{"","",""}}
})

minetest.register_craft({
	--type = "shapeless",
	output = "ambilight:two 4",
	recipe = {{"default:torch","default:torch",""},{"","",""},{"","",""}}
})

minetest.register_craft({
	--type = "shapeless",
	output = "ambilight:tree 4",
	recipe = {{"default:torch","",""},{"default:torch","",""},{"","",""}}
})


