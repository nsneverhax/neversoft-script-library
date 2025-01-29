showPakMap = 0
showPakMapExpand = 0
Download_Zones = {
}
g_zone_budget_lod_skins = [
	`models/real_crowd/crowd_ped_01_3d.skin`
	`models/real_crowd/crowd_ped_02_3d.skin`
	`models/real_crowd/crowd_ped_03_3d.skin`
	`models/real_crowd/crowd_pedf_1_3d.skin`
]
gh_zone_xenon_budget = {
	main_size = 3531600
	vram_size = 27787264
	scripts_size = 1757008
	sfx_size = 4962304
	texture_size = 23003136
	anim_size = 811008
	extra_size = 1024
	model_size = 8192000
	col_size = 1024
	instance_count = 100
	object_count = 250
}
gh_zone_no_budget = {
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
common_gh_zone_params = {
	xenon_budgets = {
		$gh_zone_xenon_budget
	}
	windx_budgets = {
		$gh_zone_no_budget
	}
	ps3_budgets = {
		$gh_zone_no_budget
	}
	zones = [
	]
}
z_finalbattle_zone_params = {
	xenon_budgets = {
		$gh_zone_xenon_budget
		anim_size = 1118208
		scripts_size = 1449808
		main_size = 4465488
	}
	windx_budgets = {
		$gh_zone_no_budget
	}
	ps3_budgets = {
		$gh_zone_no_budget
	}
	zones = [
	]
}
z_nobudget_zone_params = {
	xenon_budgets = {
		$gh_zone_no_budget
	}
	windx_budgets = {
		$gh_zone_no_budget
	}
	ps3_budgets = {
		$gh_zone_no_budget
	}
	zones = [
	]
}
ghzones = {
	z_viewer = {
		Name = 'Z_Viewer'
		extra_size = 19000
		anim_size = 228167
		model_size = 286064
		scene_size = 8656217
		PAK_OPTIONAL
	}
	z_screenshot = {
		Name = 'Z_Screenshot'
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
	z_studio = {
		Name = 'Z_Studio'
		$common_gh_zone_params
	}
	z_epicstage = {
		Name = 'Z_EpicStage'
		$common_gh_zone_params
	}
	z_houseband = {
		Name = 'Z_HouseBand'
		$common_gh_zone_params
	}
	z_barbarian = {
		Name = 'Z_Barbarian'
		$common_gh_zone_params
	}
	z_punkstage = {
		Name = 'Z_PunkStage'
		$common_gh_zone_params
	}
	z_riothouse = {
		Name = 'Z_RiotHouse'
		$common_gh_zone_params
	}
	z_mansionstudio = {
		Name = 'Z_MansionStudio'
		$common_gh_zone_params
	}
	z_egypt = {
		Name = 'Z_Egypt'
		$common_gh_zone_params
	}
	z_festival = {
		Name = 'Z_Festival'
		$common_gh_zone_params
	}
	z_modular = {
		Name = 'Z_Modular'
		$common_gh_zone_params
	}
	z_credits = {
		Name = 'Z_credits'
		$common_gh_zone_params
	}
	z_finalbattle = {
		Name = 'Z_FinalBattle'
		$z_finalbattle_zone_params
	}
	$Download_Zones
	$extra_memory_zones
}
extra_memory_zones = {
	z_gh6intro = {
		Name = 'Z_Gh6Intro'
		$z_nobudget_zone_params
		PAK_OPTIONAL
	}
}
