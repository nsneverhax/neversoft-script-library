showPakMap = 0
showPakMapExpand = 0
Download_Zones = {
}
common_gh_zone_params = {
	xenon_budgets = {
		main_size = 2385920
		vram_size = 25714688
		scripts_size = 1707008
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
		Name = 'Z_Studio'
		$common_gh_zone_params
	}
	z_viewer = {
		Name = 'Z_Viewer'
		extra_size = 19000
		anim_size = 228167
		model_size = 286064
		scene_size = 8656217
		PAK_OPTIONAL
	}
	z_cairo = {
		Name = 'Z_Cairo'
		$common_gh_zone_params
	}
	z_neworleans = {
		Name = 'Z_NewOrleans'
		$common_gh_zone_params
	}
	z_mexicocity = {
		Name = 'Z_MexicoCity'
		$common_gh_zone_params
	}
	z_nashville = {
		Name = 'Z_Nashville'
		$common_gh_zone_params
	}
	z_norway = {
		Name = 'z_norway'
		$common_gh_zone_params
	}
	z_dublin = {
		Name = 'Z_Dublin'
		$common_gh_zone_params
	}
	z_vegas = {
		Name = 'Z_Vegas'
		$common_gh_zone_params
	}
	z_subway = {
		Name = 'Z_Subway'
		$common_gh_zone_params
	}
	z_sanfrancisco = {
		Name = 'Z_SanFrancisco'
		$common_gh_zone_params
	}
	z_carhenge = {
		Name = 'Z_CarHenge'
		$common_gh_zone_params
	}
	z_freakshow = {
		Name = 'Z_FreakShow'
		$common_gh_zone_params
	}
	z_dragrace = {
		Name = 'Z_Dragrace'
		$common_gh_zone_params
	}
	z_lhc = {
		Name = 'Z_LHC'
		$common_gh_zone_params
	}
	z_visualizer = {
		Name = 'Z_Visualizer'
		$common_gh_zone_params
	}
	z_cube = {
		Name = 'Z_Cube'
		$common_gh_zone_params
	}
	$Download_Zones
}
