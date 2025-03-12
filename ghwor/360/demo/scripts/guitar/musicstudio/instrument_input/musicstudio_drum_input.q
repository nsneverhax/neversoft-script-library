jam_percussion_hold_count = 0
debug_drum_velocities = 0

script jam_input_drums \{spawn_id = jam_input_spawns}
	if NOT gotparam \{controller}
		getplayerinfo \{1
			controller}
	endif
	mid_up_strum = 0
	mid_down_strum = 0
	jam_input_add_player_server player = <select_player> spawn_id = <spawn_id>
endscript

script jam_input_drums_per_frame \{percussion = 0
		touch_strum = false}
	if gotparam \{drum_delete_flag}
		return
	endif
	instrument_controls = [enabled]
	if ($game_mode = practice)
		if screenelementexists \{id = jam_band_container}
			jam_band_container :gettags
		elseif screenelementexists \{id = jam_studio_element}
			jam_studio_element :gettags
		endif
	endif
	if NOT (<touch_strum> = true)
		if ($is_percussion_kit = 1)
			<percussion> = 1
		endif
	endif
	if arraycontains array = <instrument_controls> contains = enabled
		jam_update_percussion_kit select_player = <select_player> controller = <controller>
		if isdrumcontroller controller = <controller>
			if (<drum_velocity_valid> = 0)
				jam_input_drum_strum {
					hold_pattern = <hold_pattern>
					controller = <controller>
					select_player = <select_player>
					snare_velocity = $jam_default_snare_velocity
					hihat_velocity = $jam_default_hihat_velocity
					tom1_velocity = $jam_default_tom1_velocity
					crash_velocity = $jam_default_cymbal_velocity
					kick_velocity = $jam_default_kick_velocity
					tom2_velocity = $jam_default_tom2_velocity
					percussion = <percussion>
				}
			else
				jam_input_drum_strum {
					hold_pattern = <hold_pattern>
					controller = <controller>
					select_player = <select_player>
					snare_velocity = <snare_velocity>
					hihat_velocity = <hihat_velocity>
					tom1_velocity = <tom1_velocity>
					crash_velocity = <crash_velocity>
					kick_velocity = <kick_velocity>
					tom2_velocity = <tom2_velocity>
					percussion = <percussion>
				}
			endif
		else
			jam_input_drum_strum {
				hold_pattern = <hold_pattern>
				controller = <controller>
				select_player = <select_player>
				snare_velocity = <velocity>
				hihat_velocity = <velocity>
				tom1_velocity = <velocity>
				crash_velocity = <velocity>
				kick_velocity = <velocity>
				tom2_velocity = <velocity>
				percussion = <percussion>
			}
			if controllerpressed up <controller>
				if (<mid_up_strum> = 0)
					jam_input_drum_strum {
						hold_pattern = 1048576
						controller = <controller>
						select_player = <select_player>
						snare_velocity = <velocity>
						hihat_velocity = <velocity>
						tom1_velocity = <velocity>
						crash_velocity = <velocity>
						kick_velocity = <velocity>
						tom2_velocity = <velocity>
						percussion = <percussion>
					}
				endif
				<mid_up_strum> = (<mid_up_strum> + 1)
			else
				<mid_up_strum> = 0
			endif
			if controllerpressed down <controller>
				if (<mid_down_strum> = 0)
					jam_input_drum_strum {
						hold_pattern = 1048576
						controller = <controller>
						select_player = <select_player>
						snare_velocity = <velocity>
						hihat_velocity = <velocity>
						tom1_velocity = <velocity>
						crash_velocity = <velocity>
						kick_velocity = <velocity>
						tom2_velocity = <velocity>
						percussion = <percussion>
					}
				endif
				<mid_down_strum> = (<mid_down_strum> + 1)
			else
				<mid_down_strum> = 0
			endif
			musicstudio_drum_tilt_needle_update velocity = <velocity> player = <select_player>
		endif
	endif
	return mid_up_strum = <mid_up_strum> mid_down_strum = <mid_down_strum>
endscript

script jam_update_percussion_kit 
	if controllermake select <controller>
		if ($is_percussion_kit = 0)
			change \{is_percussion_kit = 1}
		else
			change \{is_percussion_kit = 0}
		endif
	endif
endscript

script jam_input_drum_strum \{play_back = 0
		drumfill = 0
		druminput = 0
		loop_pitch = 0
		percussion = 0
		touch_strum = false}
	if gotparam \{delay}
		wait <delay> seconds
	endif
	if gotparam \{hold_pattern}
		if (<hold_pattern> != 0)
			musicstudio_jamroom_visualizer_message <...> instrument = 3
		endif
	endif
	jaminputdrumstrum_cfunc <...>
endscript

script jam_get_drum_set 
	if (<play_back> = 1)
		if NOT (<percussion> = 1)
			drum_kit_string = ($drum_kits [$jam_current_drum_kit].string_id)
		else
			drum_kit_string = ($drum_kits [$jam_current_drum_kit].percussion_string_id)
		endif
	else
		if NOT (<percussion> = 1)
			if NOT ($is_percussion_kit = 1)
				drum_kit_string = ($drum_kits [$jam_current_drum_kit].string_id)
			else
				drum_kit_string = ($drum_kits [$jam_current_drum_kit].percussion_string_id)
			endif
		else
			drum_kit_string = ($drum_kits [$jam_current_drum_kit].percussion_string_id)
		endif
	endif
	return drum_kit_string = <drum_kit_string>
endscript

script jam_input_snare_sound 
	if ($debug_drum_velocities = 1)
		printf channel = velocity_debug qs(0x77fbb05b) s = <velocity>
	endif
	jam_record_note_drum {play_back = <play_back>
		velocity = <velocity>
		hold_pattern = 65536
		hold_pattern_color = 4096
		player = <select_player>
		loop_pitch = <loop_pitch>
		percussion = <percussion>}
endscript

script jam_input_hihat_sound 
	if ($debug_drum_velocities = 1)
		printf channel = velocity_debug qs(0x28e511d7) s = <velocity>
	endif
	jam_record_note_drum {play_back = <play_back>
		velocity = <velocity>
		hold_pattern = 4096
		hold_pattern_color = 256
		player = <select_player>
		loop_pitch = <loop_pitch>
		percussion = <percussion>}
endscript

script jam_input_tom1_sound 
	if ($debug_drum_velocities = 1)
		printf channel = velocity_debug qs(0xb87f57d3) s = <velocity>
	endif
	jam_record_note_drum {play_back = <play_back>
		velocity = <velocity>
		hold_pattern = 256
		hold_pattern_color = 16
		player = <select_player>
		loop_pitch = <loop_pitch>
		percussion = <percussion>}
endscript

script jam_input_cymbal_sound 
	if ($debug_drum_velocities = 1)
		printf channel = velocity_debug qs(0x7f27db77) s = <velocity>
	endif
	jam_record_note_drum {play_back = <play_back>
		velocity = <velocity>
		hold_pattern = 16
		hold_pattern_color = 1
		player = <select_player>
		loop_pitch = <loop_pitch>
		percussion = <percussion>}
endscript

script jam_input_tom2_sound 
	if ($debug_drum_velocities = 1)
		printf channel = velocity_debug qs(0x4a28ba2b) s = <velocity>
	endif
	jam_record_note_drum {play_back = <play_back>
		velocity = <velocity>
		hold_pattern = 1
		hold_pattern_color = 65536
		player = <select_player>
		loop_pitch = <loop_pitch>
		percussion = <percussion>}
endscript

script jam_input_kick_sound 
	if ($debug_drum_velocities = 1)
		printf channel = velocity_debug qs(0x511de9e5) s = <velocity>
	endif
	jam_record_note_drum {play_back = <play_back>
		velocity = <velocity>
		hold_pattern = 1048576
		hold_pattern_color = 1048576
		player = <select_player>
		loop_pitch = <loop_pitch>
		percussion = <percussion>}
endscript
