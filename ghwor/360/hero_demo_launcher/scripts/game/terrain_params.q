terrain_actions = [
]

script setterraindefault 
	loadterrainsounds \{terrain = terrain_default}
endscript
standard_terrain_default = {
	soundactions = {
		soundassets = terrain_default_soundassets
	}
	physicsactions = {
		skate_roll_friction = $default_friction
		skate_grind_friction = $default_rail_friction
	}
	treadactions = {
		skatergrindparticleparms = [
			{
				$gp_ter_grind_metal_sparks01
			}
			{
				$gp_ter_grind_metal_sparks_burst01
			}
			{
				$gp_ter_grind_rocks_bits01
			}
		]
		skaterslideparticleparms = [
			{
				$gp_ter_slide_paintchips_burst01
			}
			{
				$gp_ter_slide_rocks_bits01
			}
		]
		skaterjumplandparticleparms = [
			{
				$gp_ter_jumpland_default_dust01
			}
		]
		skaternatasparticleparms = [
			{
				$gp_ter_natas_default_rocks01
			}
		]
		skaterrunparticleparms = [
			{
				$gp_ter_run_default_dust01
			}
		]
		skaterskatingparticleparms = [
			{
				$gp_ter_skating_default_rocks01
			}
		]
	}
}
standard_terrain_concsmooth = {
	soundactions = {
		soundassets = terrain_concsmooth_soundassets
	}
	treadactions = {
		skatergrindparticleparms = [
			{
				$gp_ter_grind_metal_sparks01
			}
			{
				$gp_ter_grind_metal_sparks_burst01
			}
			{
				$gp_ter_grind_rocks_bits01
			}
		]
		skaterslideparticleparms = [
			{
				$gp_ter_slide_paintchips_burst01
			}
			{
				$gp_ter_slide_rocks_bits01
			}
		]
		skaterjumplandparticleparms = [
			{
				$gp_ter_jumpland_default_dust01
			}
		]
		skaternatasparticleparms = [
			{
				$gp_ter_natas_default_rocks01
			}
		]
		skaterrunparticleparms = [
			{
				$gp_ter_run_default_dust01
			}
		]
		skaterskatingparticleparms = [
			{
				$gp_ter_skating_default_dust01
			}
		]
	}
}
standard_terrain_concrough = {
	soundactions = {
		soundassets = terrain_concrough_soundassets
	}
	treadactions = {
		skatergrindparticleparms = [
			{
				$gp_ter_grind_metal_sparks01
			}
			{
				$gp_ter_grind_metal_sparks_burst01
			}
			{
				$gp_ter_grind_rocks_bits01
			}
		]
		skaterslideparticleparms = [
			{
				$gp_ter_slide_paintchips_burst01
			}
			{
				$gp_ter_slide_rocks_bits01
			}
		]
		skaterjumplandparticleparms = [
			{
				$gp_ter_jumpland_default_dust01
			}
		]
		skaternatasparticleparms = [
			{
				$gp_ter_natas_default_rocks01
			}
		]
		skaterrunparticleparms = [
			{
				$gp_ter_run_default_dust01
			}
		]
		skaterskatingparticleparms = [
			{
				$gp_ter_skating_default_dust01
			}
		]
	}
}
standard_terrain_concroughtraining = {
	soundactions = {
		soundassets = terrain_concrough_soundassets
	}
	treadactions = {
		skatergrindparticleparms = [
			{
				$gp_ter_grind_metal_sparks01
			}
			{
				$gp_ter_grind_metal_sparks_burst01
			}
			{
				$gp_ter_grind_rocks_bits01
			}
		]
		skaterslideparticleparms = [
			{
				$gp_ter_slide_paintchips_burst01
			}
			{
				$gp_ter_slide_rocks_bits01
			}
		]
		skaterjumplandparticleparms = [
			{
				$gp_ter_jumpland_concsmoothtraining_dust01
			}
		]
		skaternatasparticleparms = [
			{
				$gp_ter_natas_default_rocks01
			}
		]
		skaterrunparticleparms = [
			{
				$gp_ter_run_concsmoothtraining_dust01
			}
		]
		skaterskatingparticleparms = [
			{
				$gp_ter_skating_concsmoothtraining_dust01
			}
		]
	}
}
standard_terrain_concsmoothtraining = {
	soundactions = {
		soundassets = terrain_concsmooth_soundassets
	}
	treadactions = {
		skatergrindparticleparms = [
			{
				$gp_ter_grind_metal_sparks01
			}
			{
				$gp_ter_grind_metal_sparks_burst01
			}
			{
				$gp_ter_grind_rocks_bits01
			}
		]
		skaterslideparticleparms = [
			{
				$gp_ter_slide_paintchips_burst01
			}
			{
				$gp_ter_slide_rocks_bits01
			}
		]
		skaterjumplandparticleparms = [
			{
				$gp_ter_jumpland_concsmoothtraining_dust01
			}
		]
		skaternatasparticleparms = [
			{
				$gp_ter_natas_default_rocks01
			}
		]
		skaterrunparticleparms = [
			{
				$gp_ter_run_concsmoothtraining_dust01
			}
		]
		skaterskatingparticleparms = [
			{
				$gp_ter_skating_concsmoothtraining_dust01
			}
		]
	}
}
standard_terrain_brick = {
	soundactions = {
		soundassets = terrain_default_soundassets
	}
	treadactions = {
		skatergrindparticleparms = [
			{
				$gp_ter_grind_metal_sparks01
			}
			{
				$gp_ter_grind_metal_sparks_burst01
			}
			{
				$gp_ter_grind_default_brick
			}
		]
		skaterslideparticleparms = [
			{
				$gp_ter_slide_paintchips_burst01
			}
			{
				$gp_ter_slide_rocks_bits01
			}
		]
		skaterjumplandparticleparms = [
			{
				$gp_ter_jumpland_default_dust01
			}
		]
		skaternatasparticleparms = [
			{
				$gp_ter_natas_brick_bits01
			}
		]
		skaterrunparticleparms = [
			{
				$gp_ter_run_default_dust01
			}
		]
		skaterskatingparticleparms = [
			{
				$gp_ter_skating_default_dust01
			}
		]
	}
}
standard_terrain_sidewalk = {
	soundactions = {
		soundassets = terrain_sidewalk_soundassets
	}
	treadactions = {
		skatergrindparticleparms = [
			{
				$gp_ter_grind_metal_sparks01
			}
			{
				$gp_ter_grind_metal_sparks_burst01
			}
			{
				$gp_ter_grind_rocks_bits01
			}
		]
		skaterslideparticleparms = [
			{
				$gp_ter_slide_paintchips_burst01
			}
			{
				$gp_ter_slide_rocks_bits01
			}
		]
		skaterjumplandparticleparms = [
			{
				$gp_ter_jumpland_default_dust01
			}
		]
		skaterrunparticleparms = [
			{
				$gp_ter_run_default_dust01
			}
		]
		skaterskatingparticleparms = [
			{
				$gp_ter_skating_default_dust01
			}
		]
	}
}
standard_terrain_asphalt = {
	soundactions = {
		soundassets = terrain_asphalt_soundassets
	}
	treadactions = {
		skatergrindparticleparms = [
			{
				$gp_ter_grind_metal_sparks01
			}
			{
				$gp_ter_grind_metal_sparks_burst01
			}
			{
				$gp_ter_grind_rocks_bits01
			}
		]
		skaterslideparticleparms = [
			{
				$gp_ter_slide_paintchips_burst01
			}
			{
				$gp_ter_slide_rocks_bits01
			}
		]
		skaterjumplandparticleparms = [
			{
				$gp_ter_jumpland_asphalt_dust01
			}
		]
		skaterrunparticleparms = [
			{
				$gp_ter_run_asphalt_dust01
			}
		]
		skaterskatingparticleparms = [
			{
				$gp_ter_skating_asphalt_rocks01
			}
			{
				$gp_ter_skating_default_dust01
			}
		]
	}
}
standard_terrain_goldcoins = {
	soundactions = {
		soundassets = terrain_metal_soundassets
	}
	treadactions = {
		skaterjumplandparticleparms = [
			{
				$gp_ter_jumpland_goldcoins_dust01
			}
			{
				$gp_ter_jumpland_goldcoins_glitter01
			}
			{
				$gp_ter_jumpland_goldcoins_coins01
			}
		]
		skaterrunparticleparms = [
			{
				$gp_ter_run_goldcoins_dust01
			}
			{
				$gp_ter_run_goldcoins_glitter01
			}
			{
				$gp_ter_run_goldcoins_coins01
			}
		]
		skaterskatingparticleparms = [
			{
				$gp_ter_skating_goldcoins_coins01
			}
		]
	}
}
standard_terrain_flowerbed = {
	soundactions = {
		soundassets = terrain_dirt_soundassets
	}
	treadactions = {
		skaterjumplandparticleparms = [
			{
				$gp_ter_jumpland_dirt_dust01
			}
			{
				$gp_ter_jumpland_flowerbed_petals01
			}
		]
		skaterrunparticleparms = [
			{
				$gp_ter_run_dirt_dust01
			}
			{
				$gp_ter_run_flowerbed_petals01
			}
		]
		skaterskatingparticleparms = [
			{
				$gp_ter_skating_flowerbed_petals01
			}
			{
				$gp_ter_skating_default_dust01
			}
		]
	}
}
standard_terrain_leaves = {
	soundactions = {
		soundassets = terrain_default_soundassets
	}
	treadactions = {
		skaterjumplandparticleparms = [
			{
				$gp_ter_jumpland_default_dust01
			}
			{
				$gp_ter_jumpland_leaves_leaves01
			}
		]
		skaterrunparticleparms = [
			{
				$gp_ter_run_default_dust01
			}
			{
				$gp_ter_run_leaves_leaves01
			}
		]
		skaterskatingparticleparms = [
			{
				$gp_ter_skating_leaves_leaves01
			}
			{
				$gp_ter_skating_default_dust01
			}
		]
	}
}
standard_terrain_sand = {
	soundactions = {
		soundassets = terrain_dirt_soundassets
	}
	treadactions = {
		skaterjumplandparticleparms = [
			{
				$gp_ter_jumpland_default_dust01
			}
			{
				$gp_ter_jumpland_sand_bits01
			}
		]
		skaterrunparticleparms = [
			{
				$gp_ter_run_default_dust01
			}
			{
				$gp_ter_run_sand_bits01
			}
		]
		skaterskatingparticleparms = [
			{
				$gp_ter_skating_sand_sand01
			}
			{
				$gp_ter_skating_sand_dust01
			}
		]
	}
}
standard_terrain_metal = {
	soundactions = {
		soundassets = terrain_metal_soundassets
	}
	treadactions = {
		skatergrindparticleparms = [
			{
				$gp_ter_grind_metal_sparks01
			}
			{
				$gp_ter_grind_metal_sparks_burst01
			}
		]
		skaterslideparticleparms = [
			{
				$gp_ter_slide_paintchips_burst01
			}
		]
		skaterjumplandparticleparms = [
			{
				$gp_ter_jumpland_default_dust01
			}
		]
		skaternatasparticleparms = [
			{
				$gp_ter_natas_metal_sparks01
			}
		]
		skaterrunparticleparms = [
			{
				$gp_ter_run_default_dust01
			}
		]
		skaterskatingparticleparms = [
			{
				$gp_ter_skating_default_dust01
			}
		]
	}
}
standard_terrain_wood = {
	soundactions = {
		soundassets = terrain_wood_soundassets
	}
	treadactions = {
		skatergrindparticleparms = [
			{
				$gp_ter_grind_wood_bits01
			}
			{
				$gp_ter_grind_wood_burst
			}
		]
		skaterslideparticleparms = [
			{
				$gp_ter_slide_paintchips_burst01
			}
		]
		skaterjumplandparticleparms = [
			{
				$gp_ter_jumpland_default_dust01
			}
		]
		skaternatasparticleparms = [
			{
				$gp_ter_natas_wood_bits01
			}
		]
		skaterrunparticleparms = [
			{
				$gp_ter_run_default_dust01
			}
		]
		skaterskatingparticleparms = [
			{
				$gp_ter_skating_default_dust01
			}
		]
	}
}
standard_terrain_wood_painted_w = {
	soundactions = {
		soundassets = terrain_wood_soundassets
	}
	treadactions = {
		skatergrindparticleparms = [
			{
				$gp_ter_grind_woodpaint_bits
			}
			{
				$gp_ter_grind_woodpaint_burst
			}
		]
		skaterslideparticleparms = [
			{
				$gp_ter_slide_paintchips_burst01
			}
		]
		skaterjumplandparticleparms = [
			{
				$gp_ter_jumpland_default_dust01
			}
		]
		skaternatasparticleparms = [
			{
				$gp_ter_natas_wood_bits01
			}
		]
		skaterrunparticleparms = [
			{
				$gp_ter_run_default_dust01
			}
		]
		skaterskatingparticleparms = [
			{
				$gp_ter_skating_default_dust01
			}
		]
	}
}
standard_terrain_grass_dried = {
	soundactions = {
		soundassets = terrain_grass_soundassets
	}
	treadactions = {
		skaterjumplandparticleparms = [
			{
				$gp_ter_jumpland_grass_dust01
			}
			{
				$gp_ter_jumpland_grass_bits01
			}
		]
		skaterrunparticleparms = [
			{
				$gp_ter_run_default_dust01
			}
			{
				$gp_ter_run_grass_bits01
			}
		]
		skaterskatingparticleparms = [
			{
				$gp_ter_skating_grass_grass01
			}
			{
				$gp_ter_skating_dirt_dust01
			}
		]
	}
}
standard_terrain_grass = {
	soundactions = {
		soundassets = terrain_grass_soundassets
	}
	treadactions = {
		skaterjumplandparticleparms = [
			{
				$gp_ter_jumpland_grass_dust01
			}
			{
				$gp_ter_jumpland_grass_bits01
			}
		]
		skaterrunparticleparms = [
			{
				$gp_ter_run_default_dust01
			}
			{
				$gp_ter_run_grass_bits01
			}
		]
		skaterskatingparticleparms = [
			{
				$gp_ter_skating_grass_grass01
			}
			{
				$gp_ter_skating_default_dust01
			}
		]
	}
}
standard_terrain_grass_hf = {
	$standard_terrain_highfriction_houses
	$standard_terrain_grass
}
standard_terrain_dirt = {
	soundactions = {
		soundassets = terrain_dirt_soundassets
	}
	treadactions = {
		skaterjumplandparticleparms = [
			{
				$gp_ter_jumpland_dirt_dust01
			}
		]
		skaterrunparticleparms = [
			{
				$gp_ter_run_dirt_dust01
			}
		]
		skaterskatingparticleparms = [
			{
				$gp_ter_skating_dirt_bits01
			}
			{
				$gp_ter_skating_dirt_dust01
			}
		]
	}
}
standard_terrain_water = {
	soundactions = {
		soundassets = terrain_water_soundassets
	}
	treadactions = {
		skaterjumplandparticleparms = [
			{
				$gp_ter_jumpland_water_splash01
			}
		]
		skaterrunparticleparms = [
			{
				$gp_watersplash_small01
			}
		]
		skaterskatingparticleparms = [
			{
				$gp_ter_skating_water_splash01
			}
		]
	}
}
standard_terrain_metalpole = {
	soundactions = {
		soundassets = terrain_metalpole_soundassets
	}
	treadactions = {
		skatergrindparticleparms = [
			{
				$gp_ter_grind_metal_sparks01
			}
			{
				$gp_ter_grind_metal_sparks_burst01
			}
		]
		skaterslideparticleparms = [
			{
				$gp_ter_slide_paintchips_burst01
			}
		]
		skaternatasparticleparms = [
			{
				$gp_ter_natas_metal_sparks01
			}
		]
	}
}
standard_terrain_electricwire = {
	soundactions = {
		soundassets = terrain_electricwire_soundassets
	}
	treadactions = {
		skatergrindparticleparms = [
			{
				$gp_ter_grind_electricwire_sparks01
			}
		]
	}
}
standard_terrain_bamboo = {
	soundactions = {
		soundassets = terrain_water_soundassets
	}
	treadactions = {
		skatergrindparticleparms = [
			{
				$gp_ter_grind_wood_bits01
			}
		]
		skaterslideparticleparms = [
			{
				$gp_ter_slide_paintchips_burst01
			}
			{
				$gp_ter_grind_wood_bits01
			}
		]
		skaterjumplandparticleparms = [
			{
				$gp_ter_jumpland_default_dust01
			}
		]
		skaternatasparticleparms = [
			{
				$gp_ter_natas_wood_bits01
			}
		]
		skaterrunparticleparms = [
			{
				$gp_ter_run_default_dust01
			}
		]
		skaterskatingparticleparms = [
			{
				$gp_ter_skating_default_dust01
			}
		]
	}
}
standard_terrain_tile_4ft = {
	soundactions = {
		soundassets = terrain_water_soundassets
	}
	treadactions = {
		skatergrindparticleparms = [
			{
				$gp_ter_grind_metal_sparks01
			}
			{
				$gp_ter_grind_metal_sparks_burst01
			}
			{
				$gp_ter_grind_rocks_bits01
			}
		]
		skaterslideparticleparms = [
			{
				$gp_ter_slide_paintchips_burst01
			}
			{
				$gp_ter_slide_rocks_bits01
			}
		]
		skaterjumplandparticleparms = [
			{
				$gp_ter_jumpland_default_dust01
			}
		]
		skaternatasparticleparms = [
			{
				$gp_ter_natas_tile_bits01
			}
		]
		skaterrunparticleparms = [
			{
				$gp_ter_run_default_dust01
			}
		]
		skaterskatingparticleparms = [
			{
				$gp_ter_skating_default_dust01
			}
		]
	}
}
standard_terrain_arcade = {
	soundactions = {
		soundassets = terrain_default_soundassets
	}
	physicsactions = {
		skate_roll_friction = $default_friction
		skate_grind_friction = $default_rail_friction
	}
	treadactions = {
		skatergrindparticleparms = [
			{
				$gp_ter_grind_metal_sparks01
			}
			{
				$gp_ter_grind_metal_sparks_burst01
			}
			{
				$gp_ter_grind_rocks_bits01
			}
		]
		skaterslideparticleparms = [
			{
				$gp_ter_slide_paintchips_burst01
			}
			{
				$gp_ter_slide_rocks_bits01
			}
		]
		skaterjumplandparticleparms = [
			{
				$gp_ter_jumpland_default_dust01
			}
		]
		skaternatasparticleparms = [
			{
				$gp_ter_natas_default_rocks01
			}
		]
		skaterrunparticleparms = [
			{
				$gp_ter_run_default_dust01
			}
		]
		skaterskatingparticleparms = [
			{
				$gp_ter_skating_default_dust01
			}
		]
	}
}
standard_terrain_zerofriction = {
	soundactions = {
		soundassets = terrain_default_soundassets
	}
	physicsactions = {
		skate_roll_friction = 0
		skate_grind_friction = 0
	}
	treadactions = {
		skatergrindparticleparms = [
			{
				$gp_ter_grind_metal_sparks01
			}
			{
				$gp_ter_grind_metal_sparks_burst01
			}
			{
				$gp_ter_grind_rocks_bits01
			}
		]
		skaterslideparticleparms = [
			{
				$gp_ter_slide_paintchips_burst01
			}
			{
				$gp_ter_slide_rocks_bits01
			}
		]
		skaterjumplandparticleparms = [
			{
				$gp_ter_jumpland_default_dust01
			}
		]
		skaternatasparticleparms = [
			{
				$gp_ter_natas_default_rocks01
			}
		]
		skaterrunparticleparms = [
			{
				$gp_ter_run_default_dust01
			}
		]
		skaterskatingparticleparms = [
			{
				$gp_ter_skating_default_dust01
			}
		]
	}
}
standard_terrain_highfriction = {
	soundactions = {
		soundassets = terrain_default_soundassets
	}
	physicsactions = {
		skate_roll_friction = 0.15
		skate_grind_friction = 0
	}
	treadactions = {
		skatergrindparticleparms = [
			{
				$gp_ter_grind_metal_sparks01
			}
			{
				$gp_ter_grind_metal_sparks_burst01
			}
			{
				$gp_ter_grind_rocks_bits01
			}
		]
		skaterslideparticleparms = [
			{
				$gp_ter_slide_paintchips_burst01
			}
			{
				$gp_ter_slide_rocks_bits01
			}
		]
		skaterjumplandparticleparms = [
			{
				$gp_ter_jumpland_default_dust01
			}
		]
		skaternatasparticleparms = [
			{
				$gp_ter_natas_default_rocks01
			}
		]
		skaterrunparticleparms = [
			{
				$gp_ter_run_default_dust01
			}
		]
		skaterskatingparticleparms = [
			{
				$gp_ter_skating_default_dust01
			}
		]
	}
}
standard_terrain_highfriction_houses = {
	$standard_terrain_default
	physicsactions = {
		skate_roll_friction = 0.05
	}
}
terrain_default = standard_terrain_default
terrain_arcade = standard_terrain_arcade
terrain_asphalt = standard_terrain_asphalt
terrain_asphaltsmooth_hf = standard_terrain_highfriction_houses
terrain_bamboo = standard_terrain_bamboo
terrain_brick = standard_terrain_brick
terrain_concrough = standard_terrain_concrough
terrain_concroughtraining = standard_terrain_concroughtraining
terrain_concsmooth = standard_terrain_concsmooth
terrain_concsmoothtraining = standard_terrain_concsmoothtraining
terrain_dirt = standard_terrain_dirt
terrain_electricwire = standard_terrain_electricwire
terrain_flowerbed = standard_terrain_flowerbed
terrain_goldcoins = standard_terrain_goldcoins
terrain_grass = standard_terrain_grass
terrain_grass_hf = standard_terrain_grass_hf
terrain_grassdried = standard_terrain_grassdried
terrain_highfriction = standard_terrain_highfriction
terrain_leaves = standard_terrain_leaves
terrain_metal = standard_terrain_metal
terrain_metalpole = standard_terrain_metalpole
terrain_sand = standard_terrain_sand
terrain_shallowwaterpooltile = standard_terrain_water
terrain_sidewalk = standard_terrain_sidewalk
terrain_sidewalk_4ft_hf = standard_terrain_highfriction_houses
terrain_sidewalk_8ft = standard_terrain_sidewalk
terrain_tile_4ft = standard_terrain_tile_4ft
terrain_water = standard_terrain_water
terrain_waterpuddle = standard_terrain_water
terrain_watershallow = standard_terrain_water
terrain_wood_painted_w = standard_terrain_wood_painted_w
terrain_wood = standard_terrain_wood
terrain_wood_4ft = standard_terrain_wood
terrain_wood_8ft = standard_terrain_wood
terrain_woodbamboopillons = standard_terrain_bamboo
terrain_zerofriction = standard_terrain_zerofriction
