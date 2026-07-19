highway_pakman_links = {
}
frontend_anim_path = 'frontend/'
guit_loop_anim_path = 'ingame/Loops/GUIT/'
sing_loop_anim_path = 'ingame/Loops/SING/'
drum_loop_anim_path = 'ingame/Loops/DRUM/'
intro_anim_path = 'ingame/Intros/'
win_anim_path = 'ingame/Wins/'
lose_anim_path = 'ingame/Lose/'
point_win_anim_path = 'ingame/PointWin/'
point_lose_anim_path = 'ingame/PointLose/'
starpower_anim_path = 'ingame/StarPower/'
anim_perm_pakman_links = {
	perm_anims_in_game = {
		name = 'perm_anims_in_game'
		path = 'perm_anims/'
	}
	frontend_perm_anims = {
		name = 'frontend_perm_anims'
		path = $frontend_anim_path
	}
}
anim_loop_guit_singer_pakman_links = {
}
anim_loop_drum_pakman_links = {
}
anim_intro_win_pakman_links = {
}
anim_lose_pakman_links = {
}
anim_starpower_pakman_links = {
}

script guitar_create_character_maps 
endscript
guitar_character_loops_state = unknown

script guitar_character_loops_set_state 
	requireparams \{[
			state
		]
		all}
	if ($guitar_character_loops_state = <state>)
		return
	endif
	switch ($guitar_character_loops_state)
		case unknown
		printf \{qs(0xab596a2b)}
		case loop_paks_enabled
		mpm_free_map \{heap = heap_cas_topdown
			links = anim_loop_guit_singer_pakman_links
			index = 0}
		mpm_free_map \{heap = heap_cas_topdown
			links = anim_loop_guit_singer_pakman_links
			index = 1}
		mpm_free_map \{heap = heap_cas_topdown
			links = anim_loop_guit_singer_pakman_links
			index = 2}
		mpm_free_map \{heap = heap_cas_topdown
			links = anim_loop_drum_pakman_links}
		case loop_paks_disabled
		printf \{qs(0x58c7f341)}
		default
		scriptassert \{qs(0xb3d24fb0)}
	endswitch
	change guitar_character_loops_state = <state>
	switch (<state>)
		case loop_paks_enabled
		mpm_new_map \{heap = heap_cas_topdown
			links = anim_loop_guit_singer_pakman_links
			folder = 'pak/anims/'
			index = 0
			no_vram}
		mpm_new_map \{heap = heap_cas_topdown
			links = anim_loop_guit_singer_pakman_links
			folder = 'pak/anims/'
			index = 1
			no_vram}
		mpm_new_map \{heap = heap_cas_topdown
			links = anim_loop_guit_singer_pakman_links
			folder = 'pak/anims/'
			index = 2
			no_vram}
		mpm_new_map \{heap = heap_cas_topdown
			links = anim_loop_drum_pakman_links
			folder = 'pak/anims/'
			no_vram}
		case loop_paks_disabled
		printf \{qs(0x2888ceb1)}
		default
		scriptassert \{qs(0x9831c0b4)}
	endswitch
endscript

script guitar_force_unload_anim_paks 
	if NOT gotparam \{not_wli}
	endif
endscript

script guitar_destroy_character_maps 
	mpm_free_all_maps
endscript
