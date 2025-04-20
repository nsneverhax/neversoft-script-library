ui_gameplay_show_hud = 1

script ui_create_gameplay 
	printf "**********UI_CREATE_GAMEPLAY"
	pause_menu_fmv_kill
	pause_menu_hide_near_goals
	if gamemodeequals is_career
		SetShouldIgnoreUnboundControllers true
	endif
	if ($ve_playing_music = not_playing)
		if ($0x053c83d6 = 1)
			printpushpopdebuginfo pop name = "ui_create_gameplay"
			popsoundbussparams
			change 0x053c83d6 = 0
		endif
		if ($pausemenu_buss_set_active = 1)
			change pausemenu_buss_set_active = 0
			show_all_hud_sprites
			gman_unpauseallgoals
			printpushpopdebuginfo pop name = "ui_create_gameplay"
			popsoundbussparams
			soundevent event = Music_Pitch_Fixer_Logic2
		endif
	endif
	if ($ui_gameplay_show_hud = 1)
		show_all_hud_items
	endif
	Destroy_MenuFx
	root_window :settags menu_state = off
	spawnscriptnow start_up_crib
	if gamemodeequals is_career
		careerfunc func = enableatomupdate params = {enable = true}
		if istrue $goal_needs_atom_update_in_gameplay
			spawnscriptlater game_progress_process_status
		endif
		change goal_needs_atom_update_in_gameplay = 0
	endif
	if innetgame
		net_rounds_round_list_menu_unhide
	endif
endscript

script ui_destroy_gameplay 
	printf \{'ui_destroy_gameplay'}
	crib_kill_bink
	hide_all_hud_items
	if innetgame
		net_rounds_round_list_menu_hide
	endif
endscript
