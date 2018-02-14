# TODO:
[ ]Crafting
[x]action on punch(on/off)
[ ]textures 32/16 configh a traves de config
[ ]hacer window paso de la lux y cortables y/o planas
[ ]crear screenshot.png
[ ] Quitar cristales
[ ] Crear iconos inventario
[ ] modificar metodo register_light para recibir json
[ ] opcion en el json para determinar si la luz es apagable
[ ]Crear textura por defecto para cuando no pasen la textura por config


# IDEAS
--TODO DAR UTILIDA A LA NIeVe EN OTRO MOD CON CUBO
minetest.register_craft({
	type = "shapeless",
	output = "default:water_source",
	recipe = {"default:cube","default:torch","default:snow"},
})

# SNIPPLETS


paramtype2 = "facedir",
		place_param2 = 0,
		groups = {wood = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
		
		tiles = {"default_wood.png^moreblocks_wood_tile_offset.png"},
		sounds = sound_wood,
		no_stairs = true,
		
		
	sunlight_propagates = true,
	
	
	
	recipe = {
		{"default:cobble", "default:cobble", "default:cobble"},
		{"default:cobble", "default:cobble", "default:cobble"},
		{"default:cobble", "default:cobble", "default:cobble"},
	}
	
	minetest.register_craft({
	output = "moreblocks:rope 3",
	recipe = {
		{"default:junglegrass"},
		{"default:junglegrass"},
		{"default:junglegrass"},
	}
})
