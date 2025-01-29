showpakmap = 0
showpakmapexpand = 0
download_zones = {
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
		name = 'Z_Soundcheck'
		path = 'Z_Soundcheck/'
		$common_gh_zone_params
		zones = [
			z_frontend
		]
	}
	z_frontend = {
		name = 'Z_Frontend'
		path = 'Z_Frontend/'
		$common_gh_zone_params
		zones = [
			z_soundcheck
		]
	}
	z_soundcheck_cas = {
		name = 'Z_Soundcheck'
		pakname_checksum = z_soundcheck
		links_only
		$common_gh_zone_params
		zones = [
			z_soundcheck
		]
	}
	z_soundcheck_practice = {
		name = 'Z_Soundcheck'
		pakname_checksum = z_soundcheck
		links_only
		$common_gh_zone_params
		zones = [
			z_soundcheck
			z_in_game
		]
	}
	z_credits = {
		name = 'Z_Credits'
		path = 'Z_Credits/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_template = {
		name = 'Z_Template'
		path = 'Z_Template/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_bayou = {
		name = 'Z_Bayou'
		path = 'Z_Bayou/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_castle = {
		name = 'Z_Castle'
		path = 'Z_Castle/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_fairgrounds = {
		name = 'Z_Fairgrounds'
		path = 'Z_Fairgrounds/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_frathouse = {
		name = 'Z_Frathouse'
		path = 'Z_Frathouse/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_goth = {
		name = 'Z_Goth'
		path = 'Z_Goth/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_newyork = {
		name = 'Z_NewYork'
		path = 'Z_NewYork/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_recordstore = {
		name = 'Z_Recordstore'
		path = 'Z_Recordstore/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_metalfest = {
		name = 'Z_Metalfest'
		path = 'Z_Metalfest/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_ballpark = {
		name = 'Z_Ballpark'
		path = 'Z_Ballpark/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_military = {
		name = 'Z_Military'
		path = 'Z_Military/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_hotel = {
		name = 'Z_Hotel'
		path = 'Z_Hotel/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_cathedral = {
		name = 'Z_Cathedral'
		path = 'Z_Cathedral/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_harbor = {
		name = 'Z_Harbor'
		path = 'Z_Harbor/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_test01 = {
		name = 'Z_Test01'
		path = 'Z_Test01/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_hob = {
		name = 'Z_HoB'
		path = 'Z_HoB/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_tool = {
		name = 'Z_Tool'
		path = 'Z_Tool/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_whitebox = {
		name = 'Z_Whitebox'
		path = 'Z_Whitebox/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_studio = {
		name = 'Z_Studio'
		path = 'Z_Studio/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_studio2 = {
		name = 'Z_Studio2'
		path = 'Z_Studio2/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_board_room = {
		name = 'Z_Board_Room'
		path = 'Z_Board_Room/'
		$common_gh_zone_params
		zones = [
		]
	}
	z_studio_album_art = {
		name = 'Z_Studio'
		pakname_checksum = z_studio
		links_only
		$common_gh_zone_params
		zones = [
			z_studio
		]
	}
	z_scifi = {
		name = 'Z_Scifi'
		path = 'Z_Scifi/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_viewer = {
		name = 'Z_Viewer'
		path = 'Z_Viewer/'
		extra_size = 19000
		anim_size = 228167
		model_size = 286064
		scene_size = 8656217
		zones = [
			z_in_game
		]
		pak_optional
	}
	$download_zones
	z_in_game = {
		name = 'Z_In_Game'
		path = 'Z_In_Game/'
		$common_gh_zone_params
	}
}
