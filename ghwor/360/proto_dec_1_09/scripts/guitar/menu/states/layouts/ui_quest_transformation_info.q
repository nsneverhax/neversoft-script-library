
script ui_init_quest_transformation_info 
	Change \{song_breakdown_gem_scroller_restarted = 0}
	Change \{song_breakdown_countdown_time_added = 0}
	Change \{ui_song_breakdown_already_animated_stats = 0}
	Change \{respond_to_signin_changed_func = ui_signin_changed_func}
	Change \{song_breakdown_countdown_time = -1}
	Change \{sb_jam_song_end_time = 0}
	Change \{net_breakdown_continue_msg_sent = 0}
	Change \{songtime_paused = 1}
	Change \{playing_song = 0}
	disable_pause
endscript

script ui_create_quest_transformation_info \{starttime = !i1768515945}
	CreateScreenElement \{Type = descinterface
		desc = 'career_transformation_info'
		parent = root_window
		id = questtransformationinfo
		event_handlers = [
			{
				pad_choose
				ui_quest_transformation_continue
			}
		]}
	quest_progression_transform_character
	begin
	if ScriptIsRunning \{persistent_band_prepare_for_song}
		blockforscript \{persistent_band_prepare_for_song}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	SpawnScriptLater restart_gem_scroller params = {starttime = <starttime> practice_intro = 0 loading_transition = 1 no_render = 0}
endscript

script ui_quest_transformation_add_handlers 
	if NOT ScreenElementExists \{id = questtransformationinfo}
		return
	endif
	if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
		LaunchEvent \{Type = unfocus
			target = song_breakdown_noncompetitive_id}
	endif
	AssignAlias \{id = questtransformationinfo
		alias = current_menu}
	LaunchEvent \{Type = focus
		target = current_menu}
	add_user_control_helper \{controller = $primary_controller
		text = qs(0x494b4d7f)
		button = green
		z = 100000}
endscript

script ui_destroy_quest_transformation_info 
	if ScreenElementExists \{id = questtransformationinfo}
		DestroyScreenElement \{id = questtransformationinfo}
	endif
	clean_up_user_control_helpers
endscript

script ui_deinit_quest_transformation_info 
endscript

script ui_quest_transformation_continue 
	Change \{songtime_paused = 0}
	generic_event_back \{nosound
		state = Uistate_gameplay}
	ui_destroy_quest_transformation_info
endscript
