Terrain_Actions = [
]

script SetTerrainDefault 
	LoadTerrainSounds \{terrain = TERRAIN_DEFAULT}
endscript
STANDARD_TERRAIN_DEFAULT = {
	SoundActions = {
		SoundAssets = TERRAIN_DEFAULT_SoundAssets
	}
	physicsactions = {
		SKATE_ROLL_FRICTION = $default_friction
		SKATE_GRIND_FRICTION = $default_rail_friction
	}
	treadActions = {
		SkaterGrindParticleParms = [
			{
				$GP_TER_Grind_Metal_Sparks01
			}
			{
				$GP_TER_Grind_Metal_Sparks_Burst01
			}
			{
				$GP_TER_Grind_Rocks_Bits01
			}
		]
		SkaterSlideParticleParms = [
			{
				$GP_TER_Slide_PaintChips_Burst01
			}
			{
				$GP_TER_Slide_Rocks_Bits01
			}
		]
		SkaterJumpLandParticleParms = [
			{
				$GP_TER_JumpLand_Default_Dust01
			}
		]
		SkaterNatasParticleParms = [
			{
				$GP_TER_Natas_Default_Rocks01
			}
		]
		SkaterRunParticleParms = [
			{
				$GP_TER_Run_Default_Dust01
			}
		]
		SkaterSkatingParticleParms = [
			{
				$GP_TER_Skating_Default_Rocks01
			}
		]
	}
}
STANDARD_TERRAIN_CONCSMOOTH = {
	SoundActions = {
		SoundAssets = TERRAIN_CONCSMOOTH_SoundAssets
	}
	treadActions = {
		SkaterGrindParticleParms = [
			{
				$GP_TER_Grind_Metal_Sparks01
			}
			{
				$GP_TER_Grind_Metal_Sparks_Burst01
			}
			{
				$GP_TER_Grind_Rocks_Bits01
			}
		]
		SkaterSlideParticleParms = [
			{
				$GP_TER_Slide_PaintChips_Burst01
			}
			{
				$GP_TER_Slide_Rocks_Bits01
			}
		]
		SkaterJumpLandParticleParms = [
			{
				$GP_TER_JumpLand_Default_Dust01
			}
		]
		SkaterNatasParticleParms = [
			{
				$GP_TER_Natas_Default_Rocks01
			}
		]
		SkaterRunParticleParms = [
			{
				$GP_TER_Run_Default_Dust01
			}
		]
		SkaterSkatingParticleParms = [
			{
				$GP_TER_Skating_Default_Dust01
			}
		]
	}
}
STANDARD_TERRAIN_CONCROUGH = {
	SoundActions = {
		SoundAssets = TERRAIN_CONCROUGH_SoundAssets
	}
	treadActions = {
		SkaterGrindParticleParms = [
			{
				$GP_TER_Grind_Metal_Sparks01
			}
			{
				$GP_TER_Grind_Metal_Sparks_Burst01
			}
			{
				$GP_TER_Grind_Rocks_Bits01
			}
		]
		SkaterSlideParticleParms = [
			{
				$GP_TER_Slide_PaintChips_Burst01
			}
			{
				$GP_TER_Slide_Rocks_Bits01
			}
		]
		SkaterJumpLandParticleParms = [
			{
				$GP_TER_JumpLand_Default_Dust01
			}
		]
		SkaterNatasParticleParms = [
			{
				$GP_TER_Natas_Default_Rocks01
			}
		]
		SkaterRunParticleParms = [
			{
				$GP_TER_Run_Default_Dust01
			}
		]
		SkaterSkatingParticleParms = [
			{
				$GP_TER_Skating_Default_Dust01
			}
		]
	}
}
STANDARD_TERRAIN_CONCROUGHTRAINING = {
	SoundActions = {
		SoundAssets = TERRAIN_CONCROUGH_SoundAssets
	}
	treadActions = {
		SkaterGrindParticleParms = [
			{
				$GP_TER_Grind_Metal_Sparks01
			}
			{
				$GP_TER_Grind_Metal_Sparks_Burst01
			}
			{
				$GP_TER_Grind_Rocks_Bits01
			}
		]
		SkaterSlideParticleParms = [
			{
				$GP_TER_Slide_PaintChips_Burst01
			}
			{
				$GP_TER_Slide_Rocks_Bits01
			}
		]
		SkaterJumpLandParticleParms = [
			{
				$GP_TER_JumpLand_ConcSmoothTraining_Dust01
			}
		]
		SkaterNatasParticleParms = [
			{
				$GP_TER_Natas_Default_Rocks01
			}
		]
		SkaterRunParticleParms = [
			{
				$GP_TER_Run_ConcSmoothTraining_Dust01
			}
		]
		SkaterSkatingParticleParms = [
			{
				$GP_TER_Skating_ConcSmoothTraining_Dust01
			}
		]
	}
}
STANDARD_TERRAIN_CONCSMOOTHTRAINING = {
	SoundActions = {
		SoundAssets = TERRAIN_CONCSMOOTH_SoundAssets
	}
	treadActions = {
		SkaterGrindParticleParms = [
			{
				$GP_TER_Grind_Metal_Sparks01
			}
			{
				$GP_TER_Grind_Metal_Sparks_Burst01
			}
			{
				$GP_TER_Grind_Rocks_Bits01
			}
		]
		SkaterSlideParticleParms = [
			{
				$GP_TER_Slide_PaintChips_Burst01
			}
			{
				$GP_TER_Slide_Rocks_Bits01
			}
		]
		SkaterJumpLandParticleParms = [
			{
				$GP_TER_JumpLand_ConcSmoothTraining_Dust01
			}
		]
		SkaterNatasParticleParms = [
			{
				$GP_TER_Natas_Default_Rocks01
			}
		]
		SkaterRunParticleParms = [
			{
				$GP_TER_Run_ConcSmoothTraining_Dust01
			}
		]
		SkaterSkatingParticleParms = [
			{
				$GP_TER_Skating_ConcSmoothTraining_Dust01
			}
		]
	}
}
STANDARD_TERRAIN_BRICK = {
	SoundActions = {
		SoundAssets = TERRAIN_DEFAULT_SoundAssets
	}
	treadActions = {
		SkaterGrindParticleParms = [
			{
				$GP_TER_Grind_Metal_Sparks01
			}
			{
				$GP_TER_Grind_Metal_Sparks_Burst01
			}
			{
				$GP_TER_Grind_Default_Brick
			}
		]
		SkaterSlideParticleParms = [
			{
				$GP_TER_Slide_PaintChips_Burst01
			}
			{
				$GP_TER_Slide_Rocks_Bits01
			}
		]
		SkaterJumpLandParticleParms = [
			{
				$GP_TER_JumpLand_Default_Dust01
			}
		]
		SkaterNatasParticleParms = [
			{
				$GP_TER_Natas_Brick_Bits01
			}
		]
		SkaterRunParticleParms = [
			{
				$GP_TER_Run_Default_Dust01
			}
		]
		SkaterSkatingParticleParms = [
			{
				$GP_TER_Skating_Default_Dust01
			}
		]
	}
}
STANDARD_TERRAIN_SIDEWALK = {
	SoundActions = {
		SoundAssets = TERRAIN_SIDEWALK_SoundAssets
	}
	treadActions = {
		SkaterGrindParticleParms = [
			{
				$GP_TER_Grind_Metal_Sparks01
			}
			{
				$GP_TER_Grind_Metal_Sparks_Burst01
			}
			{
				$GP_TER_Grind_Rocks_Bits01
			}
		]
		SkaterSlideParticleParms = [
			{
				$GP_TER_Slide_PaintChips_Burst01
			}
			{
				$GP_TER_Slide_Rocks_Bits01
			}
		]
		SkaterJumpLandParticleParms = [
			{
				$GP_TER_JumpLand_Default_Dust01
			}
		]
		SkaterRunParticleParms = [
			{
				$GP_TER_Run_Default_Dust01
			}
		]
		SkaterSkatingParticleParms = [
			{
				$GP_TER_Skating_Default_Dust01
			}
		]
	}
}
STANDARD_TERRAIN_ASPHALT = {
	SoundActions = {
		SoundAssets = TERRAIN_ASPHALT_SoundAssets
	}
	treadActions = {
		SkaterGrindParticleParms = [
			{
				$GP_TER_Grind_Metal_Sparks01
			}
			{
				$GP_TER_Grind_Metal_Sparks_Burst01
			}
			{
				$GP_TER_Grind_Rocks_Bits01
			}
		]
		SkaterSlideParticleParms = [
			{
				$GP_TER_Slide_PaintChips_Burst01
			}
			{
				$GP_TER_Slide_Rocks_Bits01
			}
		]
		SkaterJumpLandParticleParms = [
			{
				$GP_TER_JumpLand_Asphalt_Dust01
			}
		]
		SkaterRunParticleParms = [
			{
				$GP_TER_Run_Asphalt_Dust01
			}
		]
		SkaterSkatingParticleParms = [
			{
				$GP_TER_Skating_Asphalt_Rocks01
			}
			{
				$GP_TER_Skating_Default_Dust01
			}
		]
	}
}
STANDARD_TERRAIN_GOLDCOINS = {
	SoundActions = {
		SoundAssets = TERRAIN_METAL_SoundAssets
	}
	treadActions = {
		SkaterJumpLandParticleParms = [
			{
				$GP_TER_JumpLand_GoldCoins_Dust01
			}
			{
				$GP_TER_JumpLand_GoldCoins_Glitter01
			}
			{
				$GP_TER_JumpLand_GoldCoins_Coins01
			}
		]
		SkaterRunParticleParms = [
			{
				$GP_TER_Run_GoldCoins_Dust01
			}
			{
				$GP_TER_Run_GoldCoins_Glitter01
			}
			{
				$GP_TER_Run_GoldCoins_Coins01
			}
		]
		SkaterSkatingParticleParms = [
			{
				$GP_TER_Skating_GoldCoins_Coins01
			}
		]
	}
}
STANDARD_TERRAIN_FLOWERBED = {
	SoundActions = {
		SoundAssets = TERRAIN_DIRT_SoundAssets
	}
	treadActions = {
		SkaterJumpLandParticleParms = [
			{
				$GP_TER_JumpLand_Dirt_Dust01
			}
			{
				$GP_TER_JumpLand_FlowerBed_Petals01
			}
		]
		SkaterRunParticleParms = [
			{
				$GP_TER_Run_Dirt_Dust01
			}
			{
				$GP_TER_Run_FlowerBed_Petals01
			}
		]
		SkaterSkatingParticleParms = [
			{
				$GP_TER_Skating_FlowerBed_Petals01
			}
			{
				$GP_TER_Skating_Default_Dust01
			}
		]
	}
}
STANDARD_TERRAIN_LEAVES = {
	SoundActions = {
		SoundAssets = TERRAIN_DEFAULT_SoundAssets
	}
	treadActions = {
		SkaterJumpLandParticleParms = [
			{
				$GP_TER_JumpLand_Default_Dust01
			}
			{
				$GP_TER_JumpLand_Leaves_Leaves01
			}
		]
		SkaterRunParticleParms = [
			{
				$GP_TER_Run_Default_Dust01
			}
			{
				$GP_TER_Run_Leaves_Leaves01
			}
		]
		SkaterSkatingParticleParms = [
			{
				$GP_TER_Skating_Leaves_Leaves01
			}
			{
				$GP_TER_Skating_Default_Dust01
			}
		]
	}
}
STANDARD_TERRAIN_SAND = {
	SoundActions = {
		SoundAssets = TERRAIN_DIRT_SoundAssets
	}
	treadActions = {
		SkaterJumpLandParticleParms = [
			{
				$GP_TER_JumpLand_Default_Dust01
			}
			{
				$GP_TER_JumpLand_Sand_Bits01
			}
		]
		SkaterRunParticleParms = [
			{
				$GP_TER_Run_Default_Dust01
			}
			{
				$GP_TER_Run_Sand_Bits01
			}
		]
		SkaterSkatingParticleParms = [
			{
				$GP_TER_Skating_Sand_Sand01
			}
			{
				$GP_TER_Skating_Sand_Dust01
			}
		]
	}
}
STANDARD_TERRAIN_METAL = {
	SoundActions = {
		SoundAssets = TERRAIN_METAL_SoundAssets
	}
	treadActions = {
		SkaterGrindParticleParms = [
			{
				$GP_TER_Grind_Metal_Sparks01
			}
			{
				$GP_TER_Grind_Metal_Sparks_Burst01
			}
		]
		SkaterSlideParticleParms = [
			{
				$GP_TER_Slide_PaintChips_Burst01
			}
		]
		SkaterJumpLandParticleParms = [
			{
				$GP_TER_JumpLand_Default_Dust01
			}
		]
		SkaterNatasParticleParms = [
			{
				$GP_TER_Natas_Metal_Sparks01
			}
		]
		SkaterRunParticleParms = [
			{
				$GP_TER_Run_Default_Dust01
			}
		]
		SkaterSkatingParticleParms = [
			{
				$GP_TER_Skating_Default_Dust01
			}
		]
	}
}
STANDARD_TERRAIN_WOOD = {
	SoundActions = {
		SoundAssets = TERRAIN_WOOD_SoundAssets
	}
	treadActions = {
		SkaterGrindParticleParms = [
			{
				$GP_TER_Grind_Wood_Bits01
			}
			{
				$GP_TER_Grind_Wood_Burst
			}
		]
		SkaterSlideParticleParms = [
			{
				$GP_TER_Slide_PaintChips_Burst01
			}
		]
		SkaterJumpLandParticleParms = [
			{
				$GP_TER_JumpLand_Default_Dust01
			}
		]
		SkaterNatasParticleParms = [
			{
				$GP_TER_Natas_Wood_Bits01
			}
		]
		SkaterRunParticleParms = [
			{
				$GP_TER_Run_Default_Dust01
			}
		]
		SkaterSkatingParticleParms = [
			{
				$GP_TER_Skating_Default_Dust01
			}
		]
	}
}
STANDARD_TERRAIN_WOOD_PAINTED_W = {
	SoundActions = {
		SoundAssets = TERRAIN_WOOD_SoundAssets
	}
	treadActions = {
		SkaterGrindParticleParms = [
			{
				$GP_TER_Grind_WoodPaint_Bits
			}
			{
				$GP_TER_Grind_WoodPaint_Burst
			}
		]
		SkaterSlideParticleParms = [
			{
				$GP_TER_Slide_PaintChips_Burst01
			}
		]
		SkaterJumpLandParticleParms = [
			{
				$GP_TER_JumpLand_Default_Dust01
			}
		]
		SkaterNatasParticleParms = [
			{
				$GP_TER_Natas_Wood_Bits01
			}
		]
		SkaterRunParticleParms = [
			{
				$GP_TER_Run_Default_Dust01
			}
		]
		SkaterSkatingParticleParms = [
			{
				$GP_TER_Skating_Default_Dust01
			}
		]
	}
}
STANDARD_TERRAIN_GRASS_DRIED = {
	SoundActions = {
		SoundAssets = TERRAIN_GRASS_SoundAssets
	}
	treadActions = {
		SkaterJumpLandParticleParms = [
			{
				$GP_TER_JumpLand_Grass_Dust01
			}
			{
				$GP_TER_JumpLand_Grass_Bits01
			}
		]
		SkaterRunParticleParms = [
			{
				$GP_TER_Run_Default_Dust01
			}
			{
				$GP_TER_Run_Grass_Bits01
			}
		]
		SkaterSkatingParticleParms = [
			{
				$GP_TER_Skating_Grass_Grass01
			}
			{
				$GP_TER_Skating_Dirt_Dust01
			}
		]
	}
}
STANDARD_TERRAIN_GRASS = {
	SoundActions = {
		SoundAssets = TERRAIN_GRASS_SoundAssets
	}
	treadActions = {
		SkaterJumpLandParticleParms = [
			{
				$GP_TER_JumpLand_Grass_Dust01
			}
			{
				$GP_TER_JumpLand_Grass_Bits01
			}
		]
		SkaterRunParticleParms = [
			{
				$GP_TER_Run_Default_Dust01
			}
			{
				$GP_TER_Run_Grass_Bits01
			}
		]
		SkaterSkatingParticleParms = [
			{
				$GP_TER_Skating_Grass_Grass01
			}
			{
				$GP_TER_Skating_Default_Dust01
			}
		]
	}
}
STANDARD_TERRAIN_GRASS_HF = {
	$STANDARD_TERRAIN_HIGHFRICTION_HOUSES
	$STANDARD_TERRAIN_GRASS
}
STANDARD_TERRAIN_DIRT = {
	SoundActions = {
		SoundAssets = TERRAIN_DIRT_SoundAssets
	}
	treadActions = {
		SkaterJumpLandParticleParms = [
			{
				$GP_TER_JumpLand_Dirt_Dust01
			}
		]
		SkaterRunParticleParms = [
			{
				$GP_TER_Run_Dirt_Dust01
			}
		]
		SkaterSkatingParticleParms = [
			{
				$GP_TER_Skating_Dirt_Bits01
			}
			{
				$GP_TER_Skating_Dirt_Dust01
			}
		]
	}
}
STANDARD_TERRAIN_WATER = {
	SoundActions = {
		SoundAssets = TERRAIN_WATER_SoundAssets
	}
	treadActions = {
		SkaterJumpLandParticleParms = [
			{
				$GP_TER_JumpLand_Water_Splash01
			}
		]
		SkaterRunParticleParms = [
			{
				$GP_WaterSplash_Small01
			}
		]
		SkaterSkatingParticleParms = [
			{
				$GP_TER_Skating_Water_Splash01
			}
		]
	}
}
STANDARD_TERRAIN_METALPOLE = {
	SoundActions = {
		SoundAssets = TERRAIN_METALPOLE_SoundAssets
	}
	treadActions = {
		SkaterGrindParticleParms = [
			{
				$GP_TER_Grind_Metal_Sparks01
			}
			{
				$GP_TER_Grind_Metal_Sparks_Burst01
			}
		]
		SkaterSlideParticleParms = [
			{
				$GP_TER_Slide_PaintChips_Burst01
			}
		]
		SkaterNatasParticleParms = [
			{
				$GP_TER_Natas_Metal_Sparks01
			}
		]
	}
}
STANDARD_TERRAIN_ELECTRICWIRE = {
	SoundActions = {
		SoundAssets = TERRAIN_ELECTRICWIRE_SoundAssets
	}
	treadActions = {
		SkaterGrindParticleParms = [
			{
				$GP_TER_Grind_ElectricWire_Sparks01
			}
		]
	}
}
STANDARD_TERRAIN_BAMBOO = {
	SoundActions = {
		SoundAssets = TERRAIN_WATER_SoundAssets
	}
	treadActions = {
		SkaterGrindParticleParms = [
			{
				$GP_TER_Grind_Wood_Bits01
			}
		]
		SkaterSlideParticleParms = [
			{
				$GP_TER_Slide_PaintChips_Burst01
			}
			{
				$GP_TER_Grind_Wood_Bits01
			}
		]
		SkaterJumpLandParticleParms = [
			{
				$GP_TER_JumpLand_Default_Dust01
			}
		]
		SkaterNatasParticleParms = [
			{
				$GP_TER_Natas_Wood_Bits01
			}
		]
		SkaterRunParticleParms = [
			{
				$GP_TER_Run_Default_Dust01
			}
		]
		SkaterSkatingParticleParms = [
			{
				$GP_TER_Skating_Default_Dust01
			}
		]
	}
}
STANDARD_TERRAIN_TILE_4FT = {
	SoundActions = {
		SoundAssets = TERRAIN_WATER_SoundAssets
	}
	treadActions = {
		SkaterGrindParticleParms = [
			{
				$GP_TER_Grind_Metal_Sparks01
			}
			{
				$GP_TER_Grind_Metal_Sparks_Burst01
			}
			{
				$GP_TER_Grind_Rocks_Bits01
			}
		]
		SkaterSlideParticleParms = [
			{
				$GP_TER_Slide_PaintChips_Burst01
			}
			{
				$GP_TER_Slide_Rocks_Bits01
			}
		]
		SkaterJumpLandParticleParms = [
			{
				$GP_TER_JumpLand_Default_Dust01
			}
		]
		SkaterNatasParticleParms = [
			{
				$GP_TER_Natas_Tile_Bits01
			}
		]
		SkaterRunParticleParms = [
			{
				$GP_TER_Run_Default_Dust01
			}
		]
		SkaterSkatingParticleParms = [
			{
				$GP_TER_Skating_Default_Dust01
			}
		]
	}
}
STANDARD_TERRAIN_ARCADE = {
	SoundActions = {
		SoundAssets = TERRAIN_DEFAULT_SoundAssets
	}
	physicsactions = {
		SKATE_ROLL_FRICTION = $default_friction
		SKATE_GRIND_FRICTION = $default_rail_friction
	}
	treadActions = {
		SkaterGrindParticleParms = [
			{
				$GP_TER_Grind_Metal_Sparks01
			}
			{
				$GP_TER_Grind_Metal_Sparks_Burst01
			}
			{
				$GP_TER_Grind_Rocks_Bits01
			}
		]
		SkaterSlideParticleParms = [
			{
				$GP_TER_Slide_PaintChips_Burst01
			}
			{
				$GP_TER_Slide_Rocks_Bits01
			}
		]
		SkaterJumpLandParticleParms = [
			{
				$GP_TER_JumpLand_Default_Dust01
			}
		]
		SkaterNatasParticleParms = [
			{
				$GP_TER_Natas_Default_Rocks01
			}
		]
		SkaterRunParticleParms = [
			{
				$GP_TER_Run_Default_Dust01
			}
		]
		SkaterSkatingParticleParms = [
			{
				$GP_TER_Skating_Default_Dust01
			}
		]
	}
}
STANDARD_TERRAIN_ZEROFRICTION = {
	SoundActions = {
		SoundAssets = TERRAIN_DEFAULT_SoundAssets
	}
	physicsactions = {
		SKATE_ROLL_FRICTION = 0
		SKATE_GRIND_FRICTION = 0
	}
	treadActions = {
		SkaterGrindParticleParms = [
			{
				$GP_TER_Grind_Metal_Sparks01
			}
			{
				$GP_TER_Grind_Metal_Sparks_Burst01
			}
			{
				$GP_TER_Grind_Rocks_Bits01
			}
		]
		SkaterSlideParticleParms = [
			{
				$GP_TER_Slide_PaintChips_Burst01
			}
			{
				$GP_TER_Slide_Rocks_Bits01
			}
		]
		SkaterJumpLandParticleParms = [
			{
				$GP_TER_JumpLand_Default_Dust01
			}
		]
		SkaterNatasParticleParms = [
			{
				$GP_TER_Natas_Default_Rocks01
			}
		]
		SkaterRunParticleParms = [
			{
				$GP_TER_Run_Default_Dust01
			}
		]
		SkaterSkatingParticleParms = [
			{
				$GP_TER_Skating_Default_Dust01
			}
		]
	}
}
STANDARD_TERRAIN_HIGHFRICTION = {
	SoundActions = {
		SoundAssets = TERRAIN_DEFAULT_SoundAssets
	}
	physicsactions = {
		SKATE_ROLL_FRICTION = 0.15
		SKATE_GRIND_FRICTION = 0
	}
	treadActions = {
		SkaterGrindParticleParms = [
			{
				$GP_TER_Grind_Metal_Sparks01
			}
			{
				$GP_TER_Grind_Metal_Sparks_Burst01
			}
			{
				$GP_TER_Grind_Rocks_Bits01
			}
		]
		SkaterSlideParticleParms = [
			{
				$GP_TER_Slide_PaintChips_Burst01
			}
			{
				$GP_TER_Slide_Rocks_Bits01
			}
		]
		SkaterJumpLandParticleParms = [
			{
				$GP_TER_JumpLand_Default_Dust01
			}
		]
		SkaterNatasParticleParms = [
			{
				$GP_TER_Natas_Default_Rocks01
			}
		]
		SkaterRunParticleParms = [
			{
				$GP_TER_Run_Default_Dust01
			}
		]
		SkaterSkatingParticleParms = [
			{
				$GP_TER_Skating_Default_Dust01
			}
		]
	}
}
STANDARD_TERRAIN_HIGHFRICTION_HOUSES = {
	$STANDARD_TERRAIN_DEFAULT
	physicsactions = {
		SKATE_ROLL_FRICTION = 0.05
	}
}
TERRAIN_DEFAULT = STANDARD_TERRAIN_DEFAULT
TERRAIN_ARCADE = STANDARD_TERRAIN_ARCADE
TERRAIN_ASPHALT = STANDARD_TERRAIN_ASPHALT
TERRAIN_ASPHALTSMOOTH_HF = STANDARD_TERRAIN_HIGHFRICTION_HOUSES
TERRAIN_BAMBOO = STANDARD_TERRAIN_BAMBOO
TERRAIN_BRICK = STANDARD_TERRAIN_BRICK
TERRAIN_CONCROUGH = STANDARD_TERRAIN_CONCROUGH
TERRAIN_CONCROUGHTRAINING = STANDARD_TERRAIN_CONCROUGHTRAINING
TERRAIN_CONCSMOOTH = STANDARD_TERRAIN_CONCSMOOTH
TERRAIN_CONCSMOOTHTRAINING = STANDARD_TERRAIN_CONCSMOOTHTRAINING
TERRAIN_DIRT = STANDARD_TERRAIN_DIRT
TERRAIN_ELECTRICWIRE = STANDARD_TERRAIN_ELECTRICWIRE
TERRAIN_FLOWERBED = STANDARD_TERRAIN_FLOWERBED
TERRAIN_GOLDCOINS = STANDARD_TERRAIN_GOLDCOINS
TERRAIN_GRASS = STANDARD_TERRAIN_GRASS
TERRAIN_GRASS_HF = STANDARD_TERRAIN_GRASS_HF
TERRAIN_GRASSDRIED = STANDARD_TERRAIN_GRASSDRIED
TERRAIN_HIGHFRICTION = STANDARD_TERRAIN_HIGHFRICTION
TERRAIN_LEAVES = STANDARD_TERRAIN_LEAVES
TERRAIN_METAL = STANDARD_TERRAIN_METAL
TERRAIN_METALPOLE = STANDARD_TERRAIN_METALPOLE
TERRAIN_SAND = STANDARD_TERRAIN_SAND
TERRAIN_SHALLOWWATERPOOLTILE = STANDARD_TERRAIN_WATER
TERRAIN_SIDEWALK = STANDARD_TERRAIN_SIDEWALK
TERRAIN_SIDEWALK_4FT_HF = STANDARD_TERRAIN_HIGHFRICTION_HOUSES
TERRAIN_SIDEWALK_8FT = STANDARD_TERRAIN_SIDEWALK
TERRAIN_TILE_4FT = STANDARD_TERRAIN_TILE_4FT
TERRAIN_WATER = STANDARD_TERRAIN_WATER
TERRAIN_WATERPUDDLE = STANDARD_TERRAIN_WATER
TERRAIN_WATERSHALLOW = STANDARD_TERRAIN_WATER
TERRAIN_WOOD_PAINTED_W = STANDARD_TERRAIN_WOOD_PAINTED_W
TERRAIN_WOOD = STANDARD_TERRAIN_WOOD
TERRAIN_WOOD_4FT = STANDARD_TERRAIN_WOOD
TERRAIN_WOOD_8FT = STANDARD_TERRAIN_WOOD
TERRAIN_WOODBAMBOOPILLONS = STANDARD_TERRAIN_BAMBOO
TERRAIN_ZEROFRICTION = STANDARD_TERRAIN_ZEROFRICTION
