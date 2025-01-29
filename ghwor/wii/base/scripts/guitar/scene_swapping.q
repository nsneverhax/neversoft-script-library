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

script scene_swap \{Name = unknown}
	if GotParam \{sync}
		wait_for_next_odd_frame
		Wait \{3
			gameframes}
	endif
	gamemode_gettype
	if (<Type> != career)
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
		GetPakManCurrent \{map = zones}
		if (<pak> = z_modular)
			if (<Name> = main)
				Name = ($last_rush_selection)
			endif
		endif
	endif
	scene_swap_do <...>
endscript
last_rush_selection = main

script select_initial_scene_swap \{restarting = 0}
	gamemode_gettype
	if (<Type> = career)
		if quest_progression_is_chapter_rush
			do_rush_scene_swap
			return
		endif
	else
		GetCurrentLevel
		if (<level> = load_z_modular)
			if (<restarting> = 1)
				Name = ($last_rush_selection)
			else
				if ($is_network_game = 0)
					RandomNoRepeat (
						@ Name = main
						@ Name = dream
						@ Name = temple
						)
				else
					Name = ($last_rush_selection)
				endif
				Change last_rush_selection = <Name>
			endif
			scene_swap_do Name = <Name>
			return
		endif
	endif
	scene_swap_do \{Name = main}
endscript

script scene_swap_do \{Name = unknown}
	if (<Name> = unknown)
		ScriptAssert \{'scene_swap missing name param'}
	endif
	GetPakManCurrent \{map = zones}
	switch <Name>
		case main
		<prefix_index> = 0
		case hypersphere
		<prefix_index> = 1
		case None
		<prefix_index> = 2
		case dream
		<prefix_index> = 3
		case temple
		<prefix_index> = 4
		case cube
		<prefix_index> = 3
		default
		ScriptAssert 'scene_swap received unknown name %n' n = <Name>
	endswitch
	if (<pak> = z_modular)
		scene_swap_modular_lights Name = <Name>
		if (<Name> = main)
			if (ScriptExists z_modular_create_guitar_static_fx)
				SpawnScriptNow \{z_modular_create_guitar_static_fx}
			endif
		else
			if (ScriptExists z_modular_kill_guitar_static_fx)
				SpawnScriptNow \{z_modular_kill_guitar_static_fx}
			endif
		endif
	endif
	if GotParam \{prefix_index}
		<viewport_mask> = ($g_scene_swap_viewport_masks [<prefix_index>])
		<partial_prefix> = ($g_scene_swap_prefixes [<prefix_index>])
	endif
	SetViewportProperties viewport = bg_viewport viewport_mask = <viewport_mask>
	Change g_current_scene_swap = <Name>
endscript

script scene_swap_modular_lights 
	switch <Name>
		case main
		enablelight \{Name = z_modular_lfx_l_band_backright_direct}
		enablelight \{Name = z_modular_lfx_l_band_backleft_direct}
		enablelight \{Name = z_modular_lfx_l_band_frontleft_direct}
		enablelight \{Name = z_modular_lfx_l_band_frontright_direct}
		enablelight \{Name = z_modular_lfx_l_band_bottomfill_direct}
		enablelight \{Name = z_modular_lfx_l_band_topdown_direct}
		enablelight \{Name = z_modular_lfx_l_band_ambient}
		default
		disablelight \{Name = z_modular_lfx_l_band_backright_direct}
		disablelight \{Name = z_modular_lfx_l_band_backleft_direct}
		disablelight \{Name = z_modular_lfx_l_band_frontleft_direct}
		disablelight \{Name = z_modular_lfx_l_band_frontright_direct}
		disablelight \{Name = z_modular_lfx_l_band_bottomfill_direct}
		disablelight \{Name = z_modular_lfx_l_band_topdown_direct}
		disablelight \{Name = z_modular_lfx_l_band_ambient}
	endswitch
	switch <Name>
		case dream
		enablelight \{Name = z_modular_lfx_l_band_ambientdream}
		enablelight \{Name = z_modular_lfx_l_band_topdown_direct_dream}
		enablelight \{Name = z_modular_lfx_l_band_sun_direct_dream}
		default
		disablelight \{Name = z_modular_lfx_l_band_ambientdream}
		disablelight \{Name = z_modular_lfx_l_band_topdown_direct_dream}
		disablelight \{Name = z_modular_lfx_l_band_sun_direct_dream}
	endswitch
	switch <Name>
		case temple
		enablelight \{Name = z_modular_lfx_l_band_ambienttemple}
		default
		disablelight \{Name = z_modular_lfx_l_band_ambienttemple}
	endswitch
endscript

script get_current_scene_swap 
	return current_scene_swap = ($g_current_scene_swap)
endscript
