showpakmap = 0
showpakmapexpand = 0
zone_extra_budget = 10240
zone_texture_budget = 15728640
zone_scene_budget = 5242880
zone_scripts_size = 1048576
zone_col_budget = 2304000
zone_anim_budget = 0
zone_instance_budget = 100
zone_object_budget = 150
zone_sfx_budget = 102400
zone_gfx_budget = 102400
scene_anim_budget = 1024768
skateparkzones = {
}
multiplayerzones = {
}
netskatezones = {
}
bedroomzones = {
	z_bedroom = {
		name = 'Z_Bedroom'
		extra_size = 19000
		anim_size = 228167
		model_size = 286064
		scene_size = 8656217
		zones = [
		]
	}
}
mainmenuzones = {
	z_mainmenu = {
		name = 'Z_Mainmenu'
		extra_size = 1058487
		anim_size = 0
		model_size = 0
		scene_size = 1058487
		zones = [
		]
	}
}
ViewerZones = {
	z_viewer = {
		name = 'Z_Viewer'
		extra_size = 19000
		anim_size = 228167
		model_size = 286064
		scene_size = 8656217
		zones = [
		]
		pak_optional
	}
}
CribZones = {
	z_crib = {
		name = 'Z_Crib'
		params_struct = Z_Crib_Params
		zones = [
		]
		$WWWZoneSizes
	}
}
CribThemes = {
	z_crib_Chrome = {
		name = 'Z_Crib_Chrome'
		zones = [
		]
	}
	z_crib_club = {
		name = 'Z_Crib_Club'
		zones = [
		]
	}
	z_crib_default = {
		name = 'Z_Crib_Default'
		zones = [
		]
	}
	z_crib_dojo = {
		name = 'Z_Crib_Dojo'
		zones = [
		]
	}
	z_crib_Gothic = {
		name = 'Z_Crib_Gothic'
		zones = [
		]
	}
	z_crib_Graffiti = {
		name = 'Z_Crib_Graffiti'
		zones = [
		]
	}
	z_crib_Prison = {
		name = 'Z_Crib_Prison'
		zones = [
		]
	}
	z_crib_Rectro = {
		name = 'Z_Crib_Rectro'
		zones = [
		]
	}
	z_crib_Skatepark = {
		name = 'Z_Crib_Skatepark'
		zones = [
		]
	}
	z_crib_Temple = {
		name = 'Z_Crib_Temple'
		zones = [
		]
	}
	z_crib_Theater = {
		name = 'Z_Crib_Theater'
		zones = [
		]
	}
	z_crib_Tiki = {
		name = 'Z_Crib_Tiki'
		zones = [
		]
	}
}
zonepakdir = 'd:\\data\\zones\\'
zonepakomit = [
	'z_world.pak'
]
WWWZoneSizes = {
	extra_size = $zone_extra_budget
	anim_size = $zone_anim_budget
	model_size = $zone_model_budget
	scene_size = $zone_scene_budget
	scripts_size = $zone_scripts_size
	texture_size = $zone_texture_budget
	col_size = $zone_col_budget
	instance_count = $zone_instance_budget
	object_count = $zone_object_budget
	sfx_size = $zone_sfx_budget
	gfx_size = $zone_sfx_budget
}
WWWZones = {
	z_fdr = {
		name = 'Z_FDR'
		params_struct = z_fdr_params
		$WWWZoneSizes
		zones = [
			z_love
			z_slums
			z_pb_bridge
		]
	}
	z_slums = {
		name = 'Z_Slums'
		params_struct = z_slums_params
		$WWWZoneSizes
		zones = [
			z_love
			z_fdr
			z_pb_bridge
		]
	}
	z_bell = {
		name = 'Z_Bell'
		params_struct = z_bell_params
		$WWWZoneSizes
		zones = [
			z_slums
			z_love
			z_wp_bridge
		]
	}
	z_love = {
		name = 'Z_Love'
		params_struct = z_love_params
		$WWWZoneSizes
		zones = [
			z_slums
			z_fdr
			z_bell
		]
	}
	z_bcity = {
		name = 'Z_BCity'
		params_struct = z_bcity_params
		$WWWZoneSizes
		zones = [
			z_harbor
			z_lansdowne
			z_pb_bridge
		]
	}
	z_harbor = {
		name = 'Z_Harbor'
		params_struct = z_harbor_params
		$WWWZoneSizes
		zones = [
			z_bcity
			z_lansdowne
			z_bw_bridge
		]
	}
	z_lansdowne = {
		name = 'Z_Lansdowne'
		params_struct = z_lansdowne_params
		$WWWZoneSizes
		zones = [
			z_bcity
			z_harbor
			z_bw_bridge
		]
	}
	z_monuments = {
		name = 'Z_Monuments'
		params_struct = z_monuments_params
		$WWWZoneSizes
		zones = [
			z_bw_bridge
			z_museums
			z_wp_bridge
		]
	}
	z_museums = {
		name = 'Z_Museums'
		params_struct = z_museums_params
		$WWWZoneSizes
		zones = [
			z_monuments
			z_museum_int
			z_bw_bridge
		]
	}
	z_museum_int = {
		name = 'Z_Museum_Int'
		params_struct = z_museum_int_params
		$WWWZoneSizes
		zones = [
			z_museums
			z_bw_bridge
			z_monuments
		]
	}
	z_pb_bridge = {
		name = 'Z_PB_Bridge'
		params_struct = z_pb_bridge_params
		$WWWZoneSizes
		zones = [
			z_bcity
			z_slums
			Z_SECRET
		]
	}
	z_bw_bridge = {
		name = 'Z_BW_Bridge'
		params_struct = z_bw_bridge_params
		$WWWZoneSizes
		zones = [
			z_harbor
			Z_SECRET
			z_monuments
		]
	}
	z_wp_bridge = {
		name = 'Z_WP_Bridge'
		params_struct = z_wp_bridge_params
		$WWWZoneSizes
		zones = [
			z_monuments
			z_bell
			z_love
		]
	}
	Z_SECRET = {
		name = 'Z_Secret'
		params_struct = Z_Secret_Params
		$WWWZoneSizes
		zones = [
			z_bw_bridge
			z_pb_bridge
		]
	}
	z_anim = {
		name = 'Z_Anim'
		extra_size = 19000
		anim_size = 228167
		model_size = 286064
		scene_size = 8656217
		zones = [
		]
	}
	z_testlevel = {
		name = 'Z_TestLevel'
		extra_size = 19000
		anim_size = 228167
		model_size = 286064
		scene_size = 8656217
		zones = [
		]
	}
	Z_TestLevel_Peds = {
		name = 'Z_TestLevel_Peds'
		extra_size = 19000
		anim_size = 228167
		model_size = 286064
		scene_size = 8656217
		zones = [
		]
	}
	z_testlevel_a1 = {
		name = 'Z_TestLevel_A1'
		extra_size = 19000
		anim_size = 228167
		model_size = 286064
		scene_size = 8656217
		zones = [
		]
	}
	Z_TestLevel_Climbing = {
		name = 'Z_TestLevel_Climbing'
		extra_size = 19000
		anim_size = 228167
		model_size = 286064
		scene_size = 8656217
		zones = [
		]
	}
	Z_AmbientScenes = {
		name = 'Z_AmbientScenes'
		extra_size = 19000
		anim_size = 228167
		model_size = 286064
		scene_size = 8656217
		zones = [
		]
	}
	z_mainmenu = {
		name = 'Z_Mainmenu'
		extra_size = 19000
		anim_size = 228167
		model_size = 286064
		scene_size = 8656217
		zones = [
		]
	}
}
SceneLinksParams = {
	anim_size = $scene_anim_budget
	priority = 70000
}
SceneLinks = {
	z_love_scenes = {
		name = 'Z_Love_Scenes'
		$SceneLinksParams
		zones = [
		]
	}
	z_BCity_scenes = {
		name = 'z_bcity_scenes'
		$SceneLinksParams
		zones = [
		]
	}
	z_Harbor_scenes = {
		name = 'z_harbor_scenes'
		$SceneLinksParams
		zones = [
		]
	}
	z_Lansdowne_scenes = {
		name = 'z_lansdowne_scenes'
		$SceneLinksParams
		zones = [
		]
	}
	z_monuments_scenes = {
		name = 'z_monuments_scenes'
		$SceneLinksParams
		zones = [
		]
	}
	z_museum_int_scenes = {
		name = 'z_museum_int_scenes'
		$SceneLinksParams
		zones = [
		]
	}
	z_museums_scenes = {
		name = 'z_museums_scenes'
		$SceneLinksParams
		zones = [
		]
	}
	z_bw_Bridge_scenes = {
		name = 'z_bw_bridge_scenes'
		$SceneLinksParams
		zones = [
		]
	}
	z_Bell_scenes = {
		name = 'z_bell_scenes'
		$SceneLinksParams
		zones = [
		]
	}
	z_Slums_scenes = {
		name = 'z_slums_scenes'
		$SceneLinksParams
		zones = [
		]
	}
	z_pb_bridge_scenes = {
		name = 'z_pb_bridge_scenes'
		$SceneLinksParams
		zones = [
		]
	}
	z_FDR_scenes = {
		name = 'z_fdr_scenes'
		$SceneLinksParams
		zones = [
		]
	}
	z_wp_Bridge_scenes = {
		name = 'z_wp_bridge_scenes'
		$SceneLinksParams
		zones = [
		]
	}
}
