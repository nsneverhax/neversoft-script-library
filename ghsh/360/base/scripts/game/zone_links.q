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
	z_amazon = {
		Name = 'Z_Amazon'
		path = 'Z_Amazon/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_canyon = {
		Name = 'Z_Canyon'
		path = 'Z_Canyon/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_greatwall = {
		Name = 'Z_GreatWall'
		path = 'Z_GreatWall/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_icecap = {
		Name = 'Z_Icecap'
		path = 'Z_Icecap/'
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
	z_sphinx = {
		Name = 'Z_Sphinx'
		path = 'Z_Sphinx/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_atlantis = {
		Name = 'Z_Atlantis'
		path = 'Z_Atlantis/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_quebec = {
		Name = 'Z_Quebec'
		path = 'Z_Quebec/'
		$common_gh_zone_params
		zones = [
			z_in_game
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
	$Download_Zones
	z_in_game = {
		Name = 'Z_In_Game'
		path = 'Z_In_Game/'
		$common_gh_zone_params
	}
}
