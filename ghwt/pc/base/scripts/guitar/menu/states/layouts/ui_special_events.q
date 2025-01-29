
script ui_init_special_events 
	spawnscriptnow \{do_training_loading}
endscript

script ui_create_special_events 
	spawnscriptnow new_create_special_events params = {<...>}
endscript

script new_create_special_events 
	begin
	if ($g_training_loading_done = 1)
		break
	endif
	wait \{1
		gameframe}
	repeat
	change \{current_num_players = 1}
	change \{menu_gp_stage = 0}
	reset_all_special_events
	change special_event_previous_game_mode = ($game_mode)
	spawnscriptnow \{task_menu_default_anim_in
		params = {
			base_name = 'gig_posters'
		}}
	formattext checksumname = special_event_num 'special_event%d' d = (<specialevent_num>)
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
	formattext checksumname = challenge 'challenge%d' d = <challenge_num>
	<challenge_text> = ($special_events_challenges.<special_event_num>.<challenge>.title)
	formattext checksumname = challenge_crc 'challenge%d_unlocked' d = <challenge_num>
	getglobaltags <gig_name> param = (<challenge_crc>)
	if ((<...>.<challenge_crc>) = 1)
		formattext checksumname = challenge_crc 'challenge%d_completed' d = <challenge_num>
		getglobaltags <gig_name> param = (<challenge_crc>)
		if ((<...>.<challenge_crc>) = 1)
			<challenge_text> = (<challenge_text> + qs(0xd3e6a338))
		endif
		add_generic_menu_text_item {
			text = <challenge_text>
			pad_choose_script = gig_posters_choose_next
			pad_choose_params = {progression_flag = <progression_flag> gig_num = <gig_num> challenge_num = <challenge_num> special_event}
			additional_focus_script = focus_special_event_show_desc
			additional_focus_params = {progression_flag = <progression_flag> gig_num = <gig_num> challenge_num = <challenge_num>}
		}
	endif
	<challenge_num> = (<challenge_num> + 1)
	repeat 3
	dim_screen
	current_menu :obj_spawnscript \{menu_music_on}
	menu_finish
	destroy_loading_screen
	startrendering
	launchevent type = focus target = current_menu data = {child_index = <selected_index>}
endscript

script special_event_go_back 
	launchevent \{type = unfocus
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
	killcamanim \{name = ch_view_cam}
	destroy_menu \{menu_id = gig_posters_menu}
	generic_ui_destroy
endscript
