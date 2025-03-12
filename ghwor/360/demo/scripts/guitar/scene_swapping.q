g_scene_swap_prefixes = [
	'_ven'
	'_vis'
	'_char'
	'_dre'
	'_tem'
	'_cub'
]
g_scene_swap_viewport_masks = [
	4
	32768
	16384
	8192
	4096
]
g_viewport_visibility = {
	ven = 4
	vis = 32768
	char = 16384
	all = 65535
	dre = 8192
	tem = 4096
	cub = 8192
}
g_viewport_visibility_default = [
	ven
]
g_current_scene_swap = main

script scene_swap \{name = unknown}
	if gotparam \{sync}
		wait_for_next_odd_frame
		wait \{3
			gameframes}
	endif
	gamemode_gettype
	if (<type> != career)
		playlist_getcurrentsong
		switch <current_song>
			case rush2112p1
			case rush2112p2
			case rush2112p3
			case rush2112p4
			case rush2112p5
			case rush2112p6
			case rush2112p7
			return
			default
		endswitch
		getpakmancurrent \{map = zones}
		if (<pak> = z_modular)
			if (<name> = main)
				name = ($last_rush_selection)
			endif
		endif
	endif
	scene_swap_do <...>
endscript
last_rush_selection = main

script select_initial_scene_swap \{restarting = 0}
	gamemode_gettype
	if (<type> = career)
		if quest_progression_is_chapter_rush
			do_rush_scene_swap
			return
		endif
	else
		getcurrentlevel
		if (<level> = load_z_modular)
			if (<restarting> = 1)
				name = ($last_rush_selection)
			else
				if ($is_network_game = 0)
					RandomNoRepeat (
						@ name = main
						@ name = dream
						@ name = temple
						)
				else
					name = ($last_rush_selection)
				endif
				change last_rush_selection = <name>
			endif
			scene_swap_do name = <name>
			return
		endif
	endif
	scene_swap_do \{name = main}
endscript

script scene_swap_do \{name = unknown}
	if (<name> = unknown)
		scriptassert \{'scene_swap missing name param'}
	endif
	getpakmancurrent \{map = zones}
	switch <name>
		case main
		<prefix_index> = 0
		case hypersphere
		<prefix_index> = 1
		case none
		<prefix_index> = 2
		case dream
		<prefix_index> = 3
		case temple
		<prefix_index> = 4
		case cube
		<prefix_index> = 3
		default
		scriptassert 'scene_swap received unknown name %n' n = <name>
	endswitch
	if (<pak> = z_modular)
		scene_swap_modular_lights name = <name>
	endif
	if gotparam \{prefix_index}
		<viewport_mask> = ($g_scene_swap_viewport_masks [<prefix_index>])
		<partial_prefix> = ($g_scene_swap_prefixes [<prefix_index>])
	endif
	setviewportproperties viewport = bg_viewport viewport_mask = <viewport_mask>
	change g_current_scene_swap = <name>
endscript

script scene_swap_modular_lights 
	switch <name>
		case main
		enablelight \{name = z_modular_lfx_l_band_backright_direct}
		enablelight \{name = z_modular_lfx_l_band_backleft_direct}
		enablelight \{name = z_modular_lfx_l_band_frontleft_direct}
		enablelight \{name = z_modular_lfx_l_band_frontright_direct}
		enablelight \{name = z_modular_lfx_l_band_bottomfill_direct}
		enablelight \{name = z_modular_lfx_l_band_topdown_direct}
		enablelight \{name = z_modular_lfx_l_band_ambient}
		default
		disablelight \{name = z_modular_lfx_l_band_backright_direct}
		disablelight \{name = z_modular_lfx_l_band_backleft_direct}
		disablelight \{name = z_modular_lfx_l_band_frontleft_direct}
		disablelight \{name = z_modular_lfx_l_band_frontright_direct}
		disablelight \{name = z_modular_lfx_l_band_bottomfill_direct}
		disablelight \{name = z_modular_lfx_l_band_topdown_direct}
		disablelight \{name = z_modular_lfx_l_band_ambient}
	endswitch
	switch <name>
		case dream
		enablelight \{name = z_modular_lfx_l_band_ambientdream}
		enablelight \{name = z_modular_lfx_l_band_topdown_direct_dream}
		enablelight \{name = z_modular_lfx_l_band_sun_direct_dream}
		default
		disablelight \{name = z_modular_lfx_l_band_ambientdream}
		disablelight \{name = z_modular_lfx_l_band_topdown_direct_dream}
		disablelight \{name = z_modular_lfx_l_band_sun_direct_dream}
	endswitch
	switch <name>
		case temple
		enablelight \{name = z_modular_lfx_l_band_ambienttemple}
		default
		disablelight \{name = z_modular_lfx_l_band_ambienttemple}
	endswitch
endscript

script get_current_scene_swap 
	return current_scene_swap = ($g_current_scene_swap)
endscript
