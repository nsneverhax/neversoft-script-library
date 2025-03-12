
script jam_input_hopo \{spawn_id = jam_input_spawns}
	if controllerpressed select <controller>
		return
	endif
	final_note_sample = null
	if (<hold_pattern> && 1)
		<hold_pattern> = 1
		jam_get_sample player = <select_player> button = 5 tilt = ($<tilt_global>) hopo = 1
		<hammer_sample> = <final_note_sample>
		jam_get_sample player = <select_player> button = 5 tilt = ($<tilt_global>) hopo = 2
		<pulloff_sample> = <final_note_sample>
	elseif (<hold_pattern> && 16)
		<hold_pattern> = 16
		jam_get_sample player = <select_player> button = 4 tilt = ($<tilt_global>) hopo = 1
		<hammer_sample> = <final_note_sample>
		jam_get_sample player = <select_player> button = 4 tilt = ($<tilt_global>) hopo = 2
		<pulloff_sample> = <final_note_sample>
	elseif (<hold_pattern> && 256)
		<hold_pattern> = 256
		jam_get_sample player = <select_player> button = 3 tilt = ($<tilt_global>) hopo = 1
		<hammer_sample> = <final_note_sample>
		jam_get_sample player = <select_player> button = 3 tilt = ($<tilt_global>) hopo = 2
		<pulloff_sample> = <final_note_sample>
	elseif (<hold_pattern> && 4096)
		<hold_pattern> = 4096
		jam_get_sample player = <select_player> button = 2 tilt = ($<tilt_global>) hopo = 1
		<hammer_sample> = <final_note_sample>
		jam_get_sample player = <select_player> button = 2 tilt = ($<tilt_global>) hopo = 2
		<pulloff_sample> = <final_note_sample>
	elseif (<hold_pattern> && 65536)
		<hold_pattern> = 65536
		jam_get_sample player = <select_player> button = 1 tilt = ($<tilt_global>) hopo = 1
		<hammer_sample> = <final_note_sample>
		jam_get_sample player = <select_player> button = 1 tilt = ($<tilt_global>) hopo = 2
		<pulloff_sample> = <final_note_sample>
	endif
	if NOT (<final_note_sample> = null)
		if (<hammer> = 1)
			<final_note_sample> = <hammer_sample>
			<note_type> = 1
		else
			<final_note_sample> = <pulloff_sample>
			<note_type> = 2
		endif
		getplayerinfo <select_player> jam_instrument
		instrument = <jam_instrument>
		player = <select_player>
		hopo_note = 1
		sustain = 1
		musicstudio_play_sound <...>
		switch <instrument>
			case 1
			spawnscriptnow jam_input_stop_sound_lead id = <spawn_id> params = {select_player = <select_player> controller = <controller>}
			case 2
			spawnscriptnow jam_input_stop_sound_bass id = <spawn_id> params = {select_player = <select_player> controller = <controller>}
			case 4
			spawnscriptnow jam_input_stop_sound_melody id = <spawn_id> params = {select_player = <select_player> controller = <controller>}
		endswitch
		musicstudio_input_send_pattern_to_highway gem_pattern = <hold_pattern> player = <player>
		jam_record_note {
			player = <select_player>
			note_string = <note_string>
			note_fret = <note_fret>
			note_type = <note_type>
			velocity = <note_velocity>
			chord_type = 0
			curr_time = $jam_highway_play_time
			hold_pattern = <hold_pattern>
			hopo = 1
		}
	endif
endscript
