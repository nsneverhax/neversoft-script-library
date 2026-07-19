showPakMap = 0
showPakMapExpand = 0
Download_Zones = {
}
Common_GH_Zone_Params = {
	xenon_budgets = {
		extra_size = 1000000
		texture_size = 30000000
		scene_size = 10000000
		col_size = 4304000
		anim_size = 0
		model_size = 5000000
		instance_count = 100
		object_count = 200
		sfx_size = 1000000
		gfx_size = 1000000
		scripts_size = 256000
	}
	ps3_budgets = {
		extra_size = 30000000
		texture_size = 30000000
		scene_size = 10000000
		col_size = 4304000
		anim_size = 0
		model_size = 5000000
		instance_count = 100
		object_count = 200
		sfx_size = 1000000
		gfx_size = 1000000
		scripts_size = 256000
	}
	zones = [
	]
}
GHZones = {
	z_soundcheck = {
		name = 'Z_Soundcheck'
		path = 'Z_Soundcheck/'
		$Common_GH_Zone_Params
		zones = [
			z_frontend
		]
	}
	z_frontend = {
		name = 'Z_Frontend'
		path = 'Z_Frontend/'
		$Common_GH_Zone_Params
		zones = [
			z_soundcheck
		]
	}
}
