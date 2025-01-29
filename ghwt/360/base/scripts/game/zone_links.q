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
	z_credits = {
		Name = 'Z_Credits'
		path = 'Z_Credits/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_template = {
		Name = 'Z_Template'
		path = 'Z_Template/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_bayou = {
		Name = 'Z_Bayou'
		path = 'Z_Bayou/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_castle = {
		Name = 'Z_Castle'
		path = 'Z_Castle/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_fairgrounds = {
		Name = 'Z_Fairgrounds'
		path = 'Z_Fairgrounds/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_frathouse = {
		Name = 'Z_Frathouse'
		path = 'Z_Frathouse/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_goth = {
		Name = 'Z_Goth'
		path = 'Z_Goth/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_newyork = {
		Name = 'Z_NewYork'
		path = 'Z_NewYork/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_recordstore = {
		Name = 'Z_Recordstore'
		path = 'Z_Recordstore/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_metalfest = {
		Name = 'Z_Metalfest'
		path = 'Z_Metalfest/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_ballpark = {
		Name = 'Z_Ballpark'
		path = 'Z_Ballpark/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_military = {
		Name = 'Z_Military'
		path = 'Z_Military/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_hotel = {
		Name = 'Z_Hotel'
		path = 'Z_Hotel/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_cathedral = {
		Name = 'Z_Cathedral'
		path = 'Z_Cathedral/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	Z_Harbor = {
		Name = 'Z_Harbor'
		path = 'Z_Harbor/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_test01 = {
		Name = 'Z_Test01'
		path = 'Z_Test01/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_hob = {
		Name = 'Z_HoB'
		path = 'Z_HoB/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_tool = {
		Name = 'Z_Tool'
		path = 'Z_Tool/'
		$common_gh_zone_params
		zones = [
			z_in_game
		]
	}
	z_whitebox = {
		Name = 'Z_Whitebox'
		path = 'Z_Whitebox/'
		$common_gh_zone_params
		zones = [
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
	z_board_room = {
		Name = 'Z_Board_Room'
		path = 'Z_Board_Room/'
		$common_gh_zone_params
		zones = [
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
	z_scifi = {
		Name = 'Z_Scifi'
		path = 'Z_Scifi/'
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
