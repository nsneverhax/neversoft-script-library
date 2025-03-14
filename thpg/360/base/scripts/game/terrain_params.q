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
				$GP_TER_PH_Sparks_01
			}
			{
				$gp_ter_grind_metal_sparks_burst01
			}
			{
				$GP_TER_PH_RockBits_01
			}
		]
		skaterslideparticleparms = [
			{
				$GP_TER_PH_RockBits_Slide
			}
			{
				$GP_TER_Slide_Metal_Sparks_Burst
			}
		]
		skaterjumplandparticleparms = [
			{
				$GP_TER_PH_JumpLand_Asphalt_Dust01
			}
		]
		skaternatasparticleparms = [
			{
				$gp_ter_natas_metal_sparks01
			}
		]
		skaterrunparticleparms = [
			{
				$GP_TER_PH_Run_Asphalt_Dust01
			}
		]
		skaterskatingparticleparms = [
			{
				$GP_TER_Skating_DRY
			}
			{
				$GP_TER_PH_RockBits_01
			}
		]
		SkaterGrindParticleParms_Wet = [
			{
				$GP_TER_PH_Sparks_WET
			}
			{
				$GP_TER_Grind_Sparks_Burst_WET
			}
			{
				$GP_TER_Grind_WaterSpray
			}
			{
				$GP_TER_Grind_WaterSpray01
			}
		]
		SkaterSlideParticleParms_Wet = [
			{
				$GP_TER_PH_RockBits_01
			}
			{
				$GP_TER_Grind_WaterSpray
			}
			{
				$GP_TER_Slide_Metal_Sparks_Burst
			}
		]
		SkaterNatasParticleParms_Wet = [
			{
				$gp_ter_natas_metal_sparks01
			}
			{
				$GP_TER_Grind_WaterSpray
			}
		]
		SkaterRunParticleParms_Wet = [
			{
				$GP_TER_Running_Wet
			}
		]
		SkaterJumpLandParticleParms_Wet = [
			{
				$GP_TER_JumpLand_WET_01
			}
		]
		SkaterSkatingParticleParms_Wet = [
			{
				$GP_TER_WetSkateBack_WET_01
			}
		]
		SkaterSkatingFrontParticleParms_Wet = [
			{
				$GP_TER_WetSkateFront_WET_02_01
			}
		]
		SkaterSkatingParticleParms_Puddle = [
			{
				$GP_TER_PuddleSkateBack_PUDDLE_01
			}
			{
				$GP_TER_JumpLand_PUDDLE_02
			}
		]
		SkaterSkatingFrontParticleParms_Puddle = [
			{
				$GP_TER_PuddleSkateFront_PUDDLE_02
			}
			{
				$GP_TER_JumpLand_PUDDLE_02
			}
		]
	}
}
STANDARD_TERRAIN_ASPHALTROUGH = {
	soundactions = {
		soundassets = terrain_asphalt_soundassets
	}
	treadactions = {
		skaterskatingparticleparms = [
			{
				$GP_TER_Skating_DRY
			}
			{
				$GP_TER_PH_RockBits_01
			}
		]
		skaterjumplandparticleparms = [
			{
				$GP_TER_PH_JumpLand_Asphalt_Dust01
			}
		]
		skaterrunparticleparms = [
			{
				$GP_TER_PH_Run_Asphalt_Dust01
			}
		]
		SkaterSkatingParticleParms_Wet = [
			{
				$GP_TER_WetSkateBack_WET_01
			}
		]
		SkaterSkatingFrontParticleParms_Wet = [
			{
				$GP_TER_WetSkateFront_WET_02_01
			}
		]
		SkaterJumpLandParticleParms_Wet = [
			{
				$GP_TER_JumpLand_WET_01
			}
		]
		SkaterRunParticleParms_Wet = [
			{
				$GP_TER_Running_Wet
			}
		]
		SkaterJumpLandParticleParms_Puddle = [
			{
				$GP_TER_JumpLand_PUDDLE_03
			}
			{
				$GP_TER_JumpLand_WET_01
			}
		]
		SkaterSkatingParticleParms_Puddle = [
			{
				$GP_TER_PuddleSkateBack_PUDDLE_01
			}
			{
				$GP_TER_JumpLand_PUDDLE_02
			}
		]
		SkaterSkatingFrontParticleParms_Puddle = [
			{
				$GP_TER_PuddleSkateFront_PUDDLE_02
			}
			{
				$GP_TER_JumpLand_PUDDLE_02
			}
		]
	}
}
STANDARD_TERRAIN_ASPHALTSMOOTH = {
	soundactions = {
		soundassets = terrain_asphalt_soundassets
	}
	treadactions = {
		skaterskatingparticleparms = [
			{
				$GP_TER_Skating_DRY
			}
			{
				$GP_TER_PH_RockBits_01
			}
		]
		skaterjumplandparticleparms = [
			{
				$GP_TER_PH_JumpLand_Asphalt_Dust01
			}
		]
		skaterrunparticleparms = [
			{
				$GP_TER_PH_Run_Asphalt_Dust01
			}
		]
		SkaterSkatingParticleParms_Wet = [
			{
				$GP_TER_WetSkateBack_WET_01
			}
		]
		SkaterSkatingFrontParticleParms_Wet = [
			{
				$GP_TER_WetSkateFront_WET_02_01
			}
		]
		SkaterJumpLandParticleParms_Wet = [
			{
				$GP_TER_JumpLand_WET_01
			}
		]
		SkaterRunParticleParms_Wet = [
			{
				$GP_TER_Running_Wet
			}
		]
		SkaterJumpLandParticleParms_Puddle = [
			{
				$GP_TER_JumpLand_PUDDLE_03
			}
			{
				$GP_TER_JumpLand_WET_01
			}
		]
		SkaterSkatingParticleParms_Puddle = [
			{
				$GP_TER_PuddleSkateBack_PUDDLE_01
			}
			{
				$GP_TER_JumpLand_PUDDLE_02
			}
		]
		SkaterSkatingFrontParticleParms_Puddle = [
			{
				$GP_TER_PuddleSkateFront_PUDDLE_02
			}
			{
				$GP_TER_JumpLand_PUDDLE_02
			}
		]
	}
}
standard_terrain_brick = {
	soundactions = {
		soundassets = terrain_default_soundassets
	}
	treadactions = {
		skaterskatingparticleparms = [
			{
				$GP_TER_Skating_DRY
			}
			{
				$GP_TER_PH_RockBits_01
			}
		]
		skatergrindparticleparms = [
			{
				$gp_ter_grind_metal_sparks_burst01
			}
			{
				$GP_TER_PH_Sparks_01
			}
			{
				$gp_ter_grind_default_brick
			}
		]
		skaterrunparticleparms = [
			{
				$GP_TER_PH_Run_Asphalt_Dust01
			}
		]
		skaterslideparticleparms = [
			{
				$gp_ter_grind_default_brick
			}
		]
		skaterjumplandparticleparms = [
			{
				$GP_TER_PH_JumpLand_Asphalt_Dust01
			}
		]
		SkaterSkatingParticleParms_Wet = [
			{
				$GP_TER_WetSkateBack_WET_01
			}
		]
		SkaterSkatingFrontParticleParms_Wet = [
			{
				$GP_TER_WetSkateFront_WET_02_01
			}
		]
		SkaterGrindParticleParms_Wet = [
			{
				$GP_TER_PH_Sparks_WET
			}
			{
				$GP_TER_Grind_Sparks_Burst_WET
			}
			{
				$GP_TER_Grind_WaterSpray
			}
			{
				$GP_TER_Grind_WaterSpray01
			}
			{
				$gp_ter_grind_default_brick
			}
		]
		SkaterRunParticleParms_Wet = [
			{
				$GP_TER_Running_Wet
			}
		]
		SkaterSlideParticleParms_Wet = [
			{
				$GP_TER_PH_RockBits_01
			}
			{
				$GP_TER_Grind_WaterSpray
			}
			{
				$GP_TER_Slide_Metal_Sparks_Burst
			}
			{
				$gp_ter_grind_default_brick
			}
		]
		SkaterJumpLandParticleParms_Wet = [
			{
				$GP_TER_JumpLand_WET_01
			}
		]
		SkaterJumpLandParticleParms_Puddle = [
			{
				$GP_TER_JumpLand_PUDDLE_03
			}
			{
				$GP_TER_JumpLand_WET_01
			}
		]
		SkaterSkatingParticleParms_Puddle = [
			{
				$GP_TER_PuddleSkateBack_PUDDLE_01
			}
			{
				$GP_TER_JumpLand_PUDDLE_02
			}
		]
		SkaterSkatingFrontParticleParms_Puddle = [
			{
				$GP_TER_PuddleSkateFront_PUDDLE_02
			}
			{
				$GP_TER_JumpLand_PUDDLE_02
			}
		]
	}
}
STANDARD_TERRAIN_CARPET = {
	soundactions = {
		soundassets = terrain_default_soundassets
	}
	treadactions = {
		skaterskatingparticleparms = [
			{
				$GP_TER_Skating_DRY
			}
		]
	}
}
STANDARD_TERRAIN_CHAINLINKFENCE = {
	soundactions = {
		soundassets = terrain_default_soundassets
	}
	treadactions = {
		skatergrindparticleparms = [
			{
				$gp_ter_grind_metal_sparks_burst01
			}
			{
				$GP_TER_PH_Sparks_01
			}
		]
		skaterslideparticleparms = [
			{
				$GP_TER_PH_RockBits_01
			}
		]
		SkaterGrindParticleParms_Wet = [
			{
				$GP_TER_PH_Sparks_WET
			}
			{
				$GP_TER_Grind_Sparks_Burst_WET
			}
			{
				$GP_TER_Grind_WaterSpray
			}
			{
				$GP_TER_Grind_WaterSpray01
			}
		]
		SkaterSlideParticleParms_Wet = [
			{
				$GP_TER_PH_RockBits_01
			}
			{
				$GP_TER_Grind_WaterSpray
			}
			{
				$GP_TER_Slide_Metal_Sparks_Burst
			}
		]
	}
}
STANDARD_TERRAIN_COBBLESTONE = {
	soundactions = {
		soundassets = terrain_default_soundassets
	}
	treadactions = {
		skaterrunparticleparms = [
			{
				$GP_TER_PH_Run_Asphalt_Dust01
			}
		]
		skaterjumplandparticleparms = [
			{
				$GP_TER_PH_JumpLand_Asphalt_Dust01
			}
		]
		skaterskatingparticleparms = [
			{
				$GP_TER_PH_RockBits_01
			}
		]
		SkaterRunParticleParms_Wet = [
			{
				$GP_TER_Running_Wet
			}
		]
		SkaterJumpLandParticleParms_Wet = [
			{
				$GP_TER_JumpLand_WET_01
			}
		]
		SkaterSkatingParticleParms_Wet = [
			{
				$GP_TER_WetSkateBack_WET_01
			}
		]
		SkaterSkatingFrontParticleParms_Wet = [
			{
				$GP_TER_WetSkateFront_WET_02_01
			}
		]
		SkaterJumpLandParticleParms_Puddle = [
			{
				$GP_TER_JumpLand_PUDDLE_03
			}
			{
				$GP_TER_JumpLand_WET_01
			}
		]
		SkaterSkatingParticleParms_Puddle = [
			{
				$GP_TER_PuddleSkateBack_PUDDLE_01
			}
			{
				$GP_TER_JumpLand_PUDDLE_02
			}
		]
		SkaterSkatingFrontParticleParms_Puddle = [
			{
				$GP_TER_PuddleSkateFront_PUDDLE_02
			}
			{
				$GP_TER_JumpLand_PUDDLE_02
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
				$gp_ter_grind_metal_sparks_burst01
			}
			{
				$GP_TER_PH_Sparks_01
			}
		]
		skaterslideparticleparms = [
			{
				$GP_TER_PH_RockBits_01
			}
		]
		skaterrunparticleparms = [
			{
				$GP_TER_PH_Run_Asphalt_Dust01
			}
		]
		skaterjumplandparticleparms = [
			{
				$GP_TER_PH_JumpLand_Asphalt_Dust01
			}
		]
		skaterskatingparticleparms = [
			{
				$GP_TER_PH_RockBits_01
			}
		]
		SkaterGrindParticleParms_Wet = [
			{
				$GP_TER_PH_Sparks_WET
			}
			{
				$GP_TER_Grind_Sparks_Burst_WET
			}
			{
				$GP_TER_Grind_WaterSpray
			}
			{
				$GP_TER_Grind_WaterSpray01
			}
		]
		SkaterSlideParticleParms_Wet = [
			{
				$GP_TER_PH_RockBits_01
			}
			{
				$GP_TER_Grind_WaterSpray
			}
			{
				$GP_TER_Slide_Metal_Sparks_Burst
			}
		]
		SkaterRunParticleParms_Wet = [
			{
				$GP_TER_Running_Wet
			}
		]
		SkaterJumpLandParticleParms_Wet = [
			{
				$GP_TER_JumpLand_WET_01
			}
		]
		SkaterSkatingParticleParms_Wet = [
			{
				$GP_TER_WetSkateBack_WET_01
			}
		]
		SkaterSkatingFrontParticleParms_Wet = [
			{
				$GP_TER_WetSkateFront_WET_02_01
			}
		]
		SkaterJumpLandParticleParms_Puddle = [
			{
				$GP_TER_JumpLand_PUDDLE_03
			}
			{
				$GP_TER_JumpLand_WET_01
			}
		]
		SkaterSkatingParticleParms_Puddle = [
			{
				$GP_TER_PuddleSkateBack_PUDDLE_01
			}
			{
				$GP_TER_JumpLand_PUDDLE_02
			}
		]
		SkaterSkatingFrontParticleParms_Puddle = [
			{
				$GP_TER_PuddleSkateFront_PUDDLE_02
			}
			{
				$GP_TER_JumpLand_PUDDLE_02
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
				$gp_ter_grind_metal_sparks_burst01
			}
			{
				$GP_TER_PH_Sparks_01
			}
		]
		skaterslideparticleparms = [
			{
				$GP_TER_PH_RockBits_01
			}
		]
		skaterrunparticleparms = [
			{
				$GP_TER_PH_Run_Asphalt_Dust01
			}
		]
		skaterjumplandparticleparms = [
			{
				$GP_TER_PH_JumpLand_Asphalt_Dust01
			}
		]
		skaterskatingparticleparms = [
			{
				$GP_TER_PH_RockBits_01
			}
		]
		SkaterGrindParticleParms_Wet = [
			{
				$GP_TER_PH_Sparks_WET
			}
			{
				$GP_TER_Grind_Sparks_Burst_WET
			}
			{
				$GP_TER_Grind_WaterSpray
			}
			{
				$GP_TER_Grind_WaterSpray01
			}
		]
		SkaterSlideParticleParms_Wet = [
			{
				$GP_TER_PH_RockBits_01
			}
			{
				$GP_TER_Grind_WaterSpray
			}
			{
				$GP_TER_Slide_Metal_Sparks_Burst
			}
		]
		SkaterRunParticleParms_Wet = [
			{
				$GP_TER_Running_Wet
			}
		]
		SkaterJumpLandParticleParms_Wet = [
			{
				$GP_TER_JumpLand_WET_01
			}
		]
		SkaterSkatingParticleParms_Wet = [
			{
				$GP_TER_WetSkateBack_WET_01
			}
		]
		SkaterSkatingFrontParticleParms_Wet = [
			{
				$GP_TER_WetSkateFront_WET_02_01
			}
		]
		SkaterJumpLandParticleParms_Puddle = [
			{
				$GP_TER_JumpLand_PUDDLE_03
			}
			{
				$GP_TER_JumpLand_WET_01
			}
		]
		SkaterSkatingParticleParms_Puddle = [
			{
				$GP_TER_PuddleSkateBack_PUDDLE_01
			}
			{
				$GP_TER_JumpLand_PUDDLE_02
			}
		]
		SkaterSkatingFrontParticleParms_Puddle = [
			{
				$GP_TER_PuddleSkateFront_PUDDLE_02
			}
			{
				$GP_TER_JumpLand_PUDDLE_02
			}
		]
	}
}
standard_terrain_dirt = {
	soundactions = {
		soundassets = terrain_dirt_soundassets
	}
	treadactions = {
		skaterrunparticleparms = [
			{
				$GP_TER_PH_Run_Dirt_Dust01
			}
		]
		skaterjumplandparticleparms = [
			{
				$GP_TER_PH_JumpLand_Dirt_Dust01
			}
		]
		skaterskatingparticleparms = [
			{
				$GP_TER_PH_Skating_Dirt_Dust01
			}
			{
				$GP_TER_PH_Dirt_DirtBits_01
			}
		]
		SkaterRunParticleParms_Wet = [
			{
				$GP_TER_Running_Wet
			}
		]
		SkaterJumpLandParticleParms_Wet = [
			{
				$GP_TER_JumpLand_WET_01
			}
		]
		SkaterSkatingParticleParms_Wet = [
			{
				$GP_TER_WetSkateBack_WET_01
			}
		]
		SkaterSkatingFrontParticleParms_Wet = [
			{
				$GP_TER_WetSkateFront_WET_02_01
			}
		]
		SkaterJumpLandParticleParms_Puddle = [
			{
				$GP_TER_JumpLand_PUDDLE_03
			}
			{
				$GP_TER_JumpLand_WET_01
			}
		]
		SkaterSkatingParticleParms_Puddle = [
			{
				$GP_TER_PuddleSkateBack_PUDDLE_01
			}
			{
				$GP_TER_JumpLand_PUDDLE_02
			}
		]
		SkaterSkatingFrontParticleParms_Puddle = [
			{
				$GP_TER_PuddleSkateFront_PUDDLE_02
			}
			{
				$GP_TER_JumpLand_PUDDLE_02
			}
		]
	}
}
STANDARD_TERRAIN_GLASS = {
	soundactions = {
		soundassets = terrain_default_soundassets
	}
	treadactions = {
		skaterrunparticleparms = [
			{
				$GP_TER_PH_Run_Asphalt_Dust01
			}
		]
		SkaterRunParticleParms_Wet = [
			{
				$GP_TER_Running_Wet
			}
		]
		SkaterJumpLandParticleParms_Puddle = [
			{
				$GP_TER_JumpLand_PUDDLE_03
			}
			{
				$GP_TER_JumpLand_WET_01
			}
		]
		SkaterSkatingParticleParms_Puddle = [
			{
				$GP_TER_PuddleSkateBack_PUDDLE_01
			}
			{
				$GP_TER_JumpLand_PUDDLE_02
			}
		]
		SkaterSkatingFrontParticleParms_Puddle = [
			{
				$GP_TER_PuddleSkateFront_PUDDLE_02
			}
			{
				$GP_TER_JumpLand_PUDDLE_02
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
				$gp_ter_jumpland_grass_bits01
			}
			{
				$GP_TER_PH_JumpLand_Asphalt_Dust01
			}
		]
		skaterrunparticleparms = [
			{
				$gp_ter_run_grass_bits01
			}
		]
		skaterskatingparticleparms = [
			{
				$gp_ter_skating_grass_grass01
			}
		]
		SkaterJumpLandParticleParms_Wet = [
			{
				$GP_TER_JumpLand_WET_01
			}
		]
		SkaterRunParticleParms_Wet = [
			{
				$GP_TER_Running_Wet
			}
		]
		SkaterSkatingParticleParms_Wet = [
			{
				$gp_ter_skating_grass_grass01
			}
			{
				$GP_TER_WetSkateBack_WET_01
			}
		]
		SkaterJumpLandParticleParms_Puddle = [
			{
				$GP_TER_JumpLand_PUDDLE_03
			}
			{
				$GP_TER_JumpLand_WET_01
			}
		]
		SkaterSkatingParticleParms_Puddle = [
			{
				$GP_TER_PuddleSkateBack_PUDDLE_01
			}
			{
				$GP_TER_JumpLand_PUDDLE_02
			}
		]
		SkaterSkatingFrontParticleParms_Puddle = [
			{
				$GP_TER_PuddleSkateFront_PUDDLE_02
			}
			{
				$GP_TER_JumpLand_PUDDLE_02
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
				$GP_TER_PH_JumpLand_Asphalt_Dust01
			}
			{
				$gp_ter_jumpland_leaves_leaves01
			}
		]
		skaterrunparticleparms = [
			{
				$GP_TER_PH_Run_Asphalt_Dust01
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
				$GP_TER_PH_Dirt_DirtBits_01
			}
		]
		SkaterJumpLandParticleParms_Wet = [
			{
				$GP_TER_JumpLand_WET_01
			}
		]
		SkaterRunParticleParms_Wet = [
			{
				$GP_TER_Running_Wet
			}
		]
		SkaterSkatingParticleParms_Wet = [
			{
				$GP_TER_WetSkateBack_WET_01
			}
		]
		SkaterSkatingFrontParticleParms_Wet = [
			{
				$GP_TER_WetSkateFront_WET_02_01
			}
		]
		SkaterJumpLandParticleParms_Puddle = [
			{
				$GP_TER_JumpLand_PUDDLE_03
			}
			{
				$GP_TER_JumpLand_WET_01
			}
		]
		SkaterSkatingParticleParms_Puddle = [
			{
				$GP_TER_PuddleSkateBack_PUDDLE_01
			}
			{
				$GP_TER_JumpLand_PUDDLE_02
			}
		]
		SkaterSkatingFrontParticleParms_Puddle = [
			{
				$GP_TER_PuddleSkateFront_PUDDLE_02
			}
			{
				$GP_TER_JumpLand_PUDDLE_02
			}
		]
	}
}
standard_terrain_metal = {
	soundactions = {
		soundassets = terrain_metal_soundassets
	}
	treadactions = {
		skaterskatingparticleparms = [
			{
				$GP_TER_PH_RockBits_01
			}
		]
		skaternatasparticleparms = [
			{
				$gp_ter_natas_metal_sparks01
			}
		]
		skatergrindparticleparms = [
			{
				$gp_ter_grind_metal_sparks_burst01
			}
			{
				$GP_TER_PH_Sparks_01
			}
		]
		skaterjumplandparticleparms = [
			{
				$GP_TER_PH_JumpLand_Asphalt_Dust01
			}
		]
		SkaterNatasParticleParms_Wet = [
			{
				$gp_ter_natas_metal_sparks01
			}
		]
		SkaterGrindParticleParms_Wet = [
			{
				$GP_TER_PH_Sparks_WET
			}
			{
				$GP_TER_Grind_Sparks_Burst_WET
			}
			{
				$GP_TER_Grind_WaterSpray
			}
			{
				$GP_TER_Grind_WaterSpray01
			}
		]
		SkaterJumpLandParticleParms_Wet = [
			{
				$GP_TER_JumpLand_WET_01
			}
		]
		SkaterSkatingParticleParms_Wet = [
			{
				$GP_TER_WetSkateBack_WET_01
			}
		]
		SkaterSkatingFrontParticleParms_Wet = [
			{
				$GP_TER_WetSkateFront_WET_02_01
			}
		]
		SkaterJumpLandParticleParms_Puddle = [
			{
				$GP_TER_JumpLand_PUDDLE_03
			}
			{
				$GP_TER_JumpLand_WET_01
			}
		]
		SkaterSkatingParticleParms_Puddle = [
			{
				$GP_TER_PuddleSkateBack_PUDDLE_01
			}
			{
				$GP_TER_JumpLand_PUDDLE_02
			}
		]
		SkaterSkatingFrontParticleParms_Puddle = [
			{
				$GP_TER_PuddleSkateFront_PUDDLE_02
			}
			{
				$GP_TER_JumpLand_PUDDLE_02
			}
		]
	}
}
STANDARD_TERRAIN_METALFLIMSY = {
	soundactions = {
		soundassets = terrain_metal_soundassets
	}
	treadactions = {
		skaterskatingparticleparms = [
			{
				$GP_TER_PH_RockBits_01
			}
		]
		skaterrunparticleparms = [
			{
				$GP_TER_PH_Run_Asphalt_Dust01
			}
		]
		skatergrindparticleparms = [
			{
				$gp_ter_grind_metal_sparks_burst01
			}
			{
				$GP_TER_PH_Sparks_01
			}
		]
		skaterjumplandparticleparms = [
			{
				$GP_TER_PH_JumpLand_Asphalt_Dust01
			}
		]
		SkaterRunParticleParms_Wet = [
			{
				$GP_TER_Running_Wet
			}
		]
		SkaterGrindParticleParms_Wet = [
			{
				$GP_TER_PH_Sparks_WET
			}
			{
				$GP_TER_Grind_Sparks_Burst_WET
			}
			{
				$GP_TER_Grind_WaterSpray
			}
			{
				$GP_TER_Grind_WaterSpray01
			}
		]
		SkaterJumpLandParticleParms_Wet = [
			{
				$GP_TER_JumpLand_WET_01
			}
		]
		SkaterSkatingParticleParms_Wet = [
			{
				$GP_TER_WetSkateBack_WET_01
			}
		]
		SkaterSkatingFrontParticleParms_Wet = [
			{
				$GP_TER_WetSkateFront_WET_02_01
			}
		]
		SkaterJumpLandParticleParms_Puddle = [
			{
				$GP_TER_JumpLand_PUDDLE_03
			}
			{
				$GP_TER_JumpLand_WET_01
			}
		]
		SkaterSkatingParticleParms_Puddle = [
			{
				$GP_TER_PuddleSkateBack_PUDDLE_01
			}
			{
				$GP_TER_JumpLand_PUDDLE_02
			}
		]
		SkaterSkatingFrontParticleParms_Puddle = [
			{
				$GP_TER_PuddleSkateFront_PUDDLE_02
			}
			{
				$GP_TER_JumpLand_PUDDLE_02
			}
		]
	}
}
STANDARD_TERRAIN_METALGRATE = {
	soundactions = {
		soundassets = terrain_metal_soundassets
	}
	treadactions = {
		skatergrindparticleparms = [
			{
				$gp_ter_grind_metal_sparks_burst01
			}
			{
				$GP_TER_PH_Sparks_01
			}
		]
		SkaterGrindParticleParms_Wet = [
			{
				$GP_TER_PH_Sparks_WET
			}
			{
				$GP_TER_Grind_Sparks_Burst_WET
			}
			{
				$GP_TER_Grind_WaterSpray
			}
			{
				$GP_TER_Grind_WaterSpray01
			}
		]
		SkaterSkatingParticleParms_Wet = [
			{
				$GP_TER_WetSkateBack_WET_01
			}
		]
		SkaterSkatingFrontParticleParms_Wet = [
			{
				$GP_TER_WetSkateFront_WET_02_01
			}
		]
		SkaterJumpLandParticleParms_Puddle = [
			{
				$GP_TER_JumpLand_PUDDLE_03
			}
			{
				$GP_TER_JumpLand_WET_01
			}
		]
		SkaterSkatingParticleParms_Puddle = [
			{
				$GP_TER_PuddleSkateBack_PUDDLE_01
			}
			{
				$GP_TER_JumpLand_PUDDLE_02
			}
		]
		SkaterSkatingFrontParticleParms_Puddle = [
			{
				$GP_TER_PuddleSkateFront_PUDDLE_02
			}
			{
				$GP_TER_JumpLand_PUDDLE_02
			}
		]
	}
}
STANDARD_TERRAIN_METALTIN = {
	soundactions = {
		soundassets = terrain_metal_soundassets
	}
	treadactions = {
		skaterskatingparticleparms = [
			{
				$GP_TER_PH_RockBits_01
			}
		]
		skaterrunparticleparms = [
			{
				$GP_TER_PH_Run_Asphalt_Dust01
			}
		]
		skatergrindparticleparms = [
			{
				$gp_ter_grind_metal_sparks_burst01
			}
			{
				$GP_TER_PH_Sparks_01
			}
		]
		skaterjumplandparticleparms = [
			{
				$GP_TER_PH_JumpLand_Asphalt_Dust01
			}
		]
		SkaterRunParticleParms_Wet = [
			{
				$GP_TER_Running_Wet
			}
		]
		SkaterGrindParticleParms_Wet = [
			{
				$GP_TER_PH_Sparks_WET
			}
			{
				$GP_TER_Grind_Sparks_Burst_WET
			}
			{
				$GP_TER_Grind_WaterSpray
			}
			{
				$GP_TER_Grind_WaterSpray01
			}
		]
		SkaterJumpLandParticleParms_Wet = [
			{
				$GP_TER_JumpLand_WET_01
			}
		]
		SkaterSkatingParticleParms_Wet = [
			{
				$GP_TER_WetSkateBack_WET_01
			}
		]
		SkaterSkatingFrontParticleParms_Wet = [
			{
				$GP_TER_WetSkateFront_WET_02_01
			}
		]
		SkaterJumpLandParticleParms_Puddle = [
			{
				$GP_TER_JumpLand_PUDDLE_03
			}
			{
				$GP_TER_JumpLand_WET_01
			}
		]
		SkaterSkatingParticleParms_Puddle = [
			{
				$GP_TER_PuddleSkateBack_PUDDLE_01
			}
			{
				$GP_TER_JumpLand_PUDDLE_02
			}
		]
		SkaterSkatingFrontParticleParms_Puddle = [
			{
				$GP_TER_PuddleSkateFront_PUDDLE_02
			}
			{
				$GP_TER_JumpLand_PUDDLE_02
			}
		]
	}
}
STANDARD_TERRAIN_MUD = {
	soundactions = {
		soundassets = TERRAIN_MUD_SoundAssets
	}
	treadactions = {
		skaterrunparticleparms = [
			{
				$GP_TER_PH_Run_Dirt_Dust01
			}
		]
		skaterjumplandparticleparms = [
			{
				$GP_TER_PH_JumpLand_Dirt_Dust01
			}
		]
		skaterskatingparticleparms = [
			{
				$GP_TER_PH_Skating_Dirt_Dust01
			}
			{
				$GP_TER_PH_Dirt_DirtBits_01
			}
		]
		SkaterRunParticleParms_Wet = [
			{
				$GP_TER_Running_Wet
			}
		]
		SkaterJumpLandParticleParms_Wet = [
			{
				$GP_TER_JumpLand_WET_01
			}
		]
		SkaterSkatingParticleParms_Wet = [
			{
				$GP_TER_WetSkateBack_WET_01
			}
		]
		SkaterSkatingFrontParticleParms_Wet = [
			{
				$GP_TER_WetSkateFront_WET_02_01
			}
		]
		SkaterJumpLandParticleParms_Puddle = [
			{
				$GP_TER_JumpLand_PUDDLE_03
			}
			{
				$GP_TER_JumpLand_WET_01
			}
		]
		SkaterSkatingParticleParms_Puddle = [
			{
				$GP_TER_PuddleSkateBack_PUDDLE_01
			}
			{
				$GP_TER_JumpLand_PUDDLE_02
			}
		]
		SkaterSkatingFrontParticleParms_Puddle = [
			{
				$GP_TER_PuddleSkateFront_PUDDLE_02
			}
			{
				$GP_TER_JumpLand_PUDDLE_02
			}
		]
	}
}
standard_terrain_sidewalk = {
	soundactions = {
		soundassets = terrain_sidewalk_soundassets
	}
	treadactions = {
		skaterrunparticleparms = [
			{
				$GP_TER_PH_Run_Asphalt_Dust01
			}
		]
		skaterjumplandparticleparms = [
			{
				$GP_TER_PH_JumpLand_Asphalt_Dust01
			}
		]
		skaterskatingparticleparms = [
			{
				$GP_TER_PH_RockBits_01
			}
		]
		SkaterRunParticleParms_Wet = [
			{
				$GP_TER_Running_Wet
			}
		]
		SkaterJumpLandParticleParms_Wet = [
			{
				$GP_TER_JumpLand_WET_01
			}
		]
		SkaterSkatingParticleParms_Wet = [
			{
				$GP_TER_WetSkateBack_WET_01
			}
		]
		SkaterSkatingFrontParticleParms_Wet = [
			{
				$GP_TER_WetSkateFront_WET_02_01
			}
		]
		SkaterJumpLandParticleParms_Puddle = [
			{
				$GP_TER_JumpLand_PUDDLE_03
			}
			{
				$GP_TER_JumpLand_WET_01
			}
		]
		SkaterSkatingParticleParms_Puddle = [
			{
				$GP_TER_PuddleSkateBack_PUDDLE_01
			}
			{
				$GP_TER_JumpLand_PUDDLE_02
			}
		]
		SkaterSkatingFrontParticleParms_Puddle = [
			{
				$GP_TER_PuddleSkateFront_PUDDLE_02
			}
			{
				$GP_TER_JumpLand_PUDDLE_02
			}
		]
	}
}
STANDARD_TERRAIN_TILE = {
	soundactions = {
		soundassets = terrain_default_soundassets
	}
	treadactions = {
		skaterrunparticleparms = [
			{
				$GP_TER_PH_Run_Asphalt_Dust01
			}
		]
		skatergrindparticleparms = [
			{
				$gp_ter_grind_metal_sparks_burst01
			}
			{
				$GP_TER_PH_Sparks_01
			}
		]
		skaterjumplandparticleparms = [
			{
				$GP_TER_PH_JumpLand_Asphalt_Dust01
			}
		]
		skaterskatingparticleparms = [
			{
				$GP_TER_PH_RockBits_01
			}
		]
		SkaterRunParticleParms_Wet = [
			{
				$GP_TER_Running_Wet
			}
		]
		SkaterGrindParticleParms_Wet = [
			{
				$GP_TER_PH_Sparks_WET
			}
			{
				$GP_TER_Grind_Sparks_Burst_WET
			}
			{
				$GP_TER_Grind_WaterSpray
			}
			{
				$GP_TER_Grind_WaterSpray01
			}
		]
		SkaterJumpLandParticleParms_Wet = [
			{
				$GP_TER_JumpLand_WET_01
			}
		]
		SkaterSkatingParticleParms_Wet = [
			{
				$GP_TER_WetSkateBack_WET_01
			}
		]
		SkaterSkatingFrontParticleParms_Wet = [
			{
				$GP_TER_WetSkateFront_WET_02_01
			}
		]
		SkaterJumpLandParticleParms_Puddle = [
			{
				$GP_TER_JumpLand_PUDDLE_03
			}
			{
				$GP_TER_JumpLand_WET_01
			}
		]
		SkaterSkatingParticleParms_Puddle = [
			{
				$GP_TER_PuddleSkateBack_PUDDLE_01
			}
			{
				$GP_TER_JumpLand_PUDDLE_02
			}
		]
		SkaterSkatingFrontParticleParms_Puddle = [
			{
				$GP_TER_PuddleSkateFront_PUDDLE_02
			}
			{
				$GP_TER_JumpLand_PUDDLE_02
			}
		]
	}
}
standard_terrain_water = {
	soundactions = {
		soundassets = terrain_water_soundassets
	}
	treadactions = {
		skaterskatingparticleparms = [
			{
				$GP_TER_BoardSplash_LWheel_Back
			}
			{
				$GP_TER_BoardSplash_RWheel_Back
			}
			{
				$GP_TER_JumpLand_PUDDLE_02
			}
		]
		SkaterSkatingFrontParticleParms = [
			{
				$GP_TER_BoardSplash_Wheel_Nose
			}
			{
				$GP_TER_JumpLand_PUDDLE_02
			}
		]
		skaterjumplandparticleparms = [
			{
				$GP_TER_JumpLand_PUDDLE_03
			}
			{
				$GP_TER_JumpLand_WET_01
			}
		]
	}
}
standard_terrain_wood = {
	soundactions = {
		soundassets = terrain_wood_soundassets
	}
	treadactions = {
		skaterrunparticleparms = [
			{
				$GP_TER_PH_Run_Asphalt_Dust01
			}
		]
		skaterjumplandparticleparms = [
			{
				$GP_TER_PH_JumpLand_Asphalt_Dust01
			}
			{
				$gp_ter_grind_wood_burst
			}
		]
		skatergrindparticleparms = [
			{
				$gp_ter_grind_wood_bits01
			}
		]
		SkaterRunParticleParms_Wet = [
			{
				$GP_TER_Running_Wet
			}
		]
		SkaterJumpLandParticleParms_Wet = [
			{
				$GP_TER_JumpLand_WET_01
			}
		]
		SkaterGrindParticleParms_Wet = [
			{
				$gp_ter_grind_wood_bits01
			}
			{
				$GP_TER_Grind_WaterSpray
			}
			{
				$GP_TER_Grind_WaterSpray01
			}
		]
		SkaterSkatingParticleParms_Wet = [
			{
				$GP_TER_WetSkateBack_WET_01
			}
		]
		SkaterSkatingFrontParticleParms_Wet = [
			{
				$GP_TER_WetSkateFront_WET_02_01
			}
		]
		SkaterJumpLandParticleParms_Puddle = [
			{
				$GP_TER_JumpLand_PUDDLE_03
			}
			{
				$GP_TER_JumpLand_WET_01
			}
		]
		SkaterSkatingParticleParms_Puddle = [
			{
				$GP_TER_PuddleSkateBack_PUDDLE_01
			}
			{
				$GP_TER_JumpLand_PUDDLE_02
			}
		]
		SkaterSkatingFrontParticleParms_Puddle = [
			{
				$GP_TER_PuddleSkateFront_PUDDLE_02
			}
			{
				$GP_TER_JumpLand_PUDDLE_02
			}
		]
	}
}
STANDARD_TERRAIN_WOODPLYWOOD = {
	soundactions = {
		soundassets = terrain_wood_soundassets
	}
	treadactions = {
		skaterrunparticleparms = [
			{
				$GP_TER_PH_Run_Asphalt_Dust01
			}
		]
		skaterjumplandparticleparms = [
			{
				$GP_TER_PH_JumpLand_Asphalt_Dust01
			}
			{
				$gp_ter_grind_wood_burst
			}
		]
		skatergrindparticleparms = [
			{
				$gp_ter_grind_wood_bits01
			}
		]
		SkaterRunParticleParms_Wet = [
			{
				$GP_TER_Running_Wet
			}
		]
		SkaterJumpLandParticleParms_Wet = [
			{
				$GP_TER_JumpLand_WET_01
			}
		]
		SkaterGrindParticleParms_Wet = [
			{
				$gp_ter_grind_wood_bits01
			}
			{
				$GP_TER_Grind_WaterSpray
			}
			{
				$GP_TER_Grind_WaterSpray01
			}
		]
		SkaterSkatingParticleParms_Wet = [
			{
				$GP_TER_WetSkateBack_WET_01
			}
		]
		SkaterSkatingFrontParticleParms_Wet = [
			{
				$GP_TER_WetSkateFront_WET_02_01
			}
		]
		SkaterJumpLandParticleParms_Puddle = [
			{
				$GP_TER_JumpLand_PUDDLE_03
			}
			{
				$GP_TER_JumpLand_WET_01
			}
		]
		SkaterSkatingParticleParms_Puddle = [
			{
				$GP_TER_PuddleSkateBack_PUDDLE_01
			}
			{
				$GP_TER_JumpLand_PUDDLE_02
			}
		]
		SkaterSkatingFrontParticleParms_Puddle = [
			{
				$GP_TER_PuddleSkateFront_PUDDLE_02
			}
			{
				$GP_TER_JumpLand_PUDDLE_02
			}
		]
	}
}
terrain_default = standard_terrain_default
terrain_asphaltrough = STANDARD_TERRAIN_ASPHALTROUGH
terrain_asphaltsmooth = STANDARD_TERRAIN_ASPHALTSMOOTH
TERRAIN_BOUNCYKILL = standard_terrain_default
terrain_brick = standard_terrain_brick
terrain_brick_6in = standard_terrain_brick
terrain_brick_1ft = standard_terrain_brick
terrain_brick_2ft = standard_terrain_brick
terrain_canvasawning = STANDARD_TERRAIN_CARPET
terrain_carpet = STANDARD_TERRAIN_CARPET
terrain_chain = STANDARD_TERRAIN_CHAINLINKFENCE
TERRAIN_CHAINLINNKFENCE = STANDARD_TERRAIN_CHAINLINKFENCE
terrain_cobblestone = STANDARD_TERRAIN_COBBLESTONE
terrain_concrough = standard_terrain_concrough
terrain_concsmooth = standard_terrain_concsmooth
terrain_dirt = standard_terrain_dirt
terrain_electricwire = standard_terrain_default
terrain_flowerbed = standard_terrain_dirt
terrain_glass = STANDARD_TERRAIN_GLASS
terrain_grass = standard_terrain_grass
terrain_leaves = standard_terrain_leaves
TERRAIN_LEAVESCONC = standard_terrain_leaves
terrain_mailbox = STANDARD_TERRAIN_METALFLIMSY
terrain_metal = standard_terrain_metal
terrain_metalcar = standard_terrain_metal
TERRAIN_METALFLIMSY = STANDARD_TERRAIN_METALFLIMSY
terrain_metalgrate = STANDARD_TERRAIN_METALGRATE
terrain_metalpole = standard_terrain_metal
terrain_metalthin = STANDARD_TERRAIN_METALFLIMSY
terrain_metaltin = STANDARD_TERRAIN_METALTIN
terrain_mud = STANDARD_TERRAIN_MUD
terrain_rooftop = standard_terrain_default
terrain_rope = standard_terrain_default
terrain_rubber = standard_terrain_default
terrain_sand = standard_terrain_default
terrain_shallowwaterpooltile = STANDARD_TERRAIN_TILE
TERRAIN_SHINGLES = standard_terrain_default
terrain_shingleswood = standard_terrain_default
terrain_sidewalk = standard_terrain_sidewalk
terrain_sidewalk_1ft = standard_terrain_sidewalk
terrain_sidewalk_2ft = standard_terrain_sidewalk
terrain_sidewalk_4ft = standard_terrain_sidewalk
terrain_sidewalk_8ft = standard_terrain_sidewalk
terrain_tile = STANDARD_TERRAIN_TILE
terrain_tile_6in = STANDARD_TERRAIN_TILE
terrain_tile_2ft = STANDARD_TERRAIN_TILE
terrain_tile_4ft = STANDARD_TERRAIN_TILE
terrain_water = standard_terrain_water
terrain_watershallow = standard_terrain_water
terrain_wood = standard_terrain_wood
terrain_wooddeck = standard_terrain_wood
terrain_wood_4ft = standard_terrain_wood
terrain_wood_8ft = standard_terrain_wood
terrain_woodfence = STANDARD_TERRAIN_WOODPLYWOOD
terrain_woodtable = STANDARD_TERRAIN_WOODPLYWOOD
terrain_woodplywood = STANDARD_TERRAIN_WOODPLYWOOD
