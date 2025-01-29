
script ui_init_special_events 
	SpawnScriptNow \{do_training_loading}
endscript

script ui_create_special_events 
	SpawnScriptNow new_create_special_events params = {<...>}
endscript

script new_create_special_events 
	begin
	if ($g_training_loading_done = 1)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	reset_all_special_events
	Change special_event_previous_game_mode = ($game_mode)
	SpawnScriptNow \{task_menu_default_anim_in
		params = {
			base_name = 'gig_posters'
		}}
	formatText checksumName = special_event_num 'special_event%d' d = (<specialevent_num>)
	make_generic_menu {
		title = ($special_events_challenges.<special_event_num>.title)
		menu_id = gig_posters_menu
		vmenu_id = gig_posters_vmenu
		pad_back_script = special_event_go_back
		pad_back_params = {}
		scrolling
	}
	get_progression_globals game_mode = ($game_mode) ($current_progression_flag)
	format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = <gig_num>
	challenge_num = 1
	begin
	formatText checksumName = challenge 'challenge%d' d = <challenge_num>
	<challenge_text> = ($special_events_challenges.<special_event_num>.<challenge>.title)
	formatText checksumName = challenge_crc 'challenge%d_unlocked' d = <challenge_num>
	GetGlobalTags <gig_name> param = (<challenge_crc>)
	if ((<...>.<challenge_crc>) = 1)
		formatText checksumName = challenge_crc 'challenge%d_completed' d = <challenge_num>
		GetGlobalTags <gig_name> param = (<challenge_crc>)
		if ((<...>.<challenge_crc>) = 1)
			<challenge_text> = (<challenge_text> + qs(0xd3e6a338))
		endif
	endif
	<challenge_num> = (<challenge_num> + 1)
	repeat 3
	dim_screen
	current_menu :obj_spawnscript \{menu_music_on}
	menu_finish
	destroy_loading_screen
	StartRendering
	LaunchEvent Type = focus target = current_menu data = {child_index = <selected_index>}
endscript

script special_event_go_back 
	LaunchEvent \{Type = unfocus
		target = current_menu}
	create_loading_screen
	reset_all_special_events
	generic_event_back
endscript

script ui_deinit_special_events 
	destroy_band
	destroy_bandname_viewport
endscript

script ui_destroy_special_events 
	dim_screen \{undim}
	KillCamAnim \{Name = ch_view_cam}
	destroy_menu \{menu_id = gig_posters_menu}
	generic_ui_destroy
endscript
