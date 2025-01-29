calibrate_lag_warning_menu_font = fontgrid_title_a1

script create_calibrate_lag_warning_menu \{Body = qs(0x4370f34e)
		cancel_script = generic_event_back
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
endscript

script menu_calibrate_lag_warning_select_yes 
	kill_intro_celeb_ui
	resetscoreupdateready
	GH3_SFX_fail_song_stop_sounds
	choose_calibrate_lag
endscript
