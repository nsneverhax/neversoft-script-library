showPakMap = 0
showPakMapExpand = 0
Download_Zones = {
}
common_gh_zone_params = {
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
ghzones = {
	z_soundcheck = {
		Name = 'Z_Soundcheck'
		path = 'Z_Soundcheck/'
		$common_gh_zone_params
		zones = [
			z_frontend
		]
	}
	z_soundcheck2 = {
		Name = 'Z_Soundcheck2'
		path = 'Z_Soundcheck2/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_frontend = {
		Name = 'Z_Frontend'
		path = 'Z_Frontend/'
		$common_gh_zone_params
		zones = [
			z_soundcheck
		]
	}
	z_soundcheck_cas = {
		Name = 'Z_Soundcheck'
		pakname_checksum = z_soundcheck
		links_only
		$common_gh_zone_params
		zones = [
			z_soundcheck
		]
	}
	z_objviewer_cas = {
		Name = 'Z_Objviewer'
		pakname_checksum = z_objviewer
		links_only
		$common_gh_zone_params
		zones = [
			z_objviewer
		]
	}
	z_soundcheck_practice = {
		Name = 'Z_Soundcheck'
		pakname_checksum = z_soundcheck
		links_only
		$common_gh_zone_params
		zones = [
			z_soundcheck
			z_in_game
		]
	}
	z_studio = {
		Name = 'Z_Studio'
		path = 'Z_Studio/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_studio2 = {
		Name = 'Z_Studio2'
		path = 'Z_Studio2/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_studio_album_art = {
		Name = 'Z_Studio'
		pakname_checksum = z_studio
		links_only
		$common_gh_zone_params
		zones = [
			z_studio
		]
	}
	z_objviewer = {
		Name = 'Z_ObjViewer'
		path = 'Z_ObjViewer/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_viewer = {
		Name = 'Z_Viewer'
		path = 'Z_Viewer/'
		extra_size = 19000
		anim_size = 228167
		model_size = 286064
		scene_size = 8656217
		zones = [
			z_in_game
		]
		PAK_OPTIONAL
	}
	z_frankenstrat = {
		Name = 'Z_Frankenstrat'
		path = 'Z_Frankenstrat/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_s_stage = {
		Name = 'Z_S_Stage'
		path = 'Z_S_Stage/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_starwood = {
		Name = 'Z_Starwood'
		path = 'Z_Starwood/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_drum_kit = {
		Name = 'Z_Drum_kit'
		path = 'Z_Drum_kit/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_london = {
		Name = 'Z_London'
		path = 'Z_London/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_rome = {
		Name = 'Z_Rome'
		path = 'Z_Rome/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_la_block_party = {
		Name = 'Z_la_block_party'
		path = 'Z_la_block_party/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_paris = {
		Name = 'Z_paris'
		path = 'Z_paris/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	$Download_Zones
	z_in_game = {
		Name = 'Z_In_Game'
		path = 'Z_In_Game/'
		$common_gh_zone_params
	}
}
