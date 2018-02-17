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
[ ] Lampara de mounstro
[ ] Lamapara de zombihead
[ ] Lamapara de item




# SNIPPLETS


## CHECK 4 OTHER MOD

```
if not minetest.get_modpath("moreores") then
	armor.materials.mithril = nil
end
```
	
## RECIPES

```	
	recipe = {
		{"default:cobble", "default:cobble", "default:cobble"},
		{"default:cobble", "default:cobble", "default:cobble"},
		{"default:cobble", "default:cobble", "default:cobble"},
	}
	
	minetest.register_craft({
	output = "moreblocks:rope 3",
	recipe = {{"default:junglegrass"},{"default:junglegrass"},{"default:junglegrass"}}
	})
```






	
