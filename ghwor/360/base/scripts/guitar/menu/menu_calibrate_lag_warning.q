
script create_calibrate_lag_warning_menu \{Body = qs(0x0a3798b8)
		cancel_script = generic_event_back
		cancel_func_params = {
			nosound
		}
		yes_func_params = {
		}}
	disable_pause
	if NOT GotParam \{controller}
		<controller> = $primary_controller
	endif
	create_dialog_box {
		body_text = <Body>
		player_device = <controller>
		no_background
		options = [
			{
				func = <cancel_script>
				func_params = <cancel_func_params>
				text = qs(0xf7723015)
			}
			{
				func = menu_calibrate_lag_warning_select_yes
				func_params = <yes_func_params>
				text = qs(0x0e56c83c)
			}
		]
	}
endscript

script destroy_calibrate_lag_warning_menu 
	destroy_dialog_box
	enable_pause
endscript

script menu_calibrate_lag_warning_select_yes 
	kill_intro_celeb_ui
	fadetoblack \{OFF
		id = finalbattle_fade}
	audio_stopping_sounds_killsong_lite
	resetscoreupdateready
	audio_gameplay_fail_song_stop_sounds
	if ScriptExists \{audio_crowd_play_swells_during_stats_screen}
		KillSpawnedScript \{Name = audio_crowd_play_swells_during_stats_screen}
	endif
	if IsSoundEventPlaying \{surge_during_stats_screen}
		StopSoundEvent \{surge_during_stats_screen
			fade_time = 1.5
			fade_type = linear}
	endif
	StopSoundsByBuss \{Encore_Events}
	choose_calibrate_lag
endscript
