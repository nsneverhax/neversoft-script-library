showpakmap = 0
showpakmapexpand = 0
download_zones = {
}
common_gh_zone_params = {
	xenon_budgets = {
		main_size = 2498560
		vram_size = 25714688
		scripts_size = 1809408
		sfx_size = 4962304
		texture_size = 23003136
		anim_size = 65536
		extra_size = 1024
		model_size = 7864320
		col_size = 1024
		instance_count = 100
		object_count = 250
	}
	windx_budgets = {
		main_size = 1792000
		vram_size = 25714688
		scripts_size = 1010688
		sfx_size = 4194304
		texture_size = 23003136
		anim_size = 65536
		extra_size = 1024
		model_size = 7864320
		col_size = 1024
		instance_count = 100
		object_count = 250
	}
	ps3_budgets = {
		main_size = 30000000
		vram_size = 30000000
		scripts_size = 30000000
		sfx_size = 30000000
		texture_size = 30000000
		anim_size = 30000000
		extra_size = 30000000
		model_size = 30000000
		instance_count = 30000000
		object_count = 30000000
	}
	zones = [
	]
}
ghzones = {
	z_studio = {
		name = 'Z_Studio'
		$common_gh_zone_params
	}
	z_viewer = {
		name = 'Z_Viewer'
		extra_size = 19000
		anim_size = 228167
		model_size = 286064
		scene_size = 8656217
		pak_optional
	}
	z_cabo = {
		name = 'Z_Cabo'
		$common_gh_zone_params
	}
	z_tokyo = {
		name = 'Z_Tokyo'
		$common_gh_zone_params
	}
	z_gorge = {
		name = 'Z_Gorge'
		$common_gh_zone_params
	}
	z_montreux = {
		name = 'Z_Montreux'
		$common_gh_zone_params
	}
	z_paris = {
		name = 'Z_Paris'
		$common_gh_zone_params
	}
	z_centralpark = {
		name = 'Z_CentralPark'
		$common_gh_zone_params
	}
	0x53d2aff0 = {
		name = 'Z_Mall'
		$common_gh_zone_params
	}
	z_space = {
		name = 'Z_Space'
		$common_gh_zone_params
	}
	z_awardshow = {
		name = 'Z_AwardShow'
		$common_gh_zone_params
	}
	z_easterisland = {
		name = 'Z_EasterIsland'
		$common_gh_zone_params
	}
	z_visualizer = {
		name = 'Z_Visualizer'
		$common_gh_zone_params
	}
	z_cube = {
		name = 'Z_Cube'
		$common_gh_zone_params
	}
	$download_zones
}
0x4ef6283c = load_z_paris
0x0e020950 = {
	z_paris = {
		name = 'Z_Paris'
		$common_gh_zone_params
	}
}
