jam_current_drum_kit = 0
is_percussion_kit = 0

script jam_input_drums controller = ($player1_status.controller) spawn_id = jam_input_spawns
	mid_up_strum = 0
	mid_down_strum = 0
	jam_input_add_player_server player = <select_player> spawn_id = <spawn_id>
endscript

script jam_input_drums_per_frame \{percussion = 0}
	if (($jam_advanced_record) = 0)
		jam_check_simple_record_input controller = <controller> select_player = <select_player>
	endif
	instrument_controls = [enabled]
	if ($game_mode = training)
		if screenelementexists \{id = jam_band_container}
			jam_band_container :gettags
		elseif screenelementexists \{id = jam_studio_element}
			jam_studio_element :gettags
		endif
	endif
	if arraycontains array = <instrument_controls> contains = enabled
		jam_update_percussion_kit select_player = <select_player> controller = <controller>
		if isdrumcontroller controller = <controller>
			if isrbdrum controller = <controller_index>
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
			jam_drum_tilt_needle_update velocity = <velocity> player = <select_player>
		endif
	endif
	return mid_up_strum = <mid_up_strum> mid_down_strum = <mid_down_strum>
endscript

script jam_drum_tilt_needle_update 
	formattext checksumname = tilt_id 'jam_tilt_needle_%s' s = <player>
	tilt_value = (60.0 * (<velocity> / 127.0))
	if (($jam_advanced_record) = 1)
		resolvescreenelementid \{id = {
				jam_studio_element
				child = {
					adv_record
					child = {
						pitch_indicator
						child = pitch_dial
					}
				}
			}}
		legacydoscreenelementmorph id = <resolved_id> time = 0.03 rot_angle = (-24 + <tilt_value>)
	else
		legacydoscreenelementmorph id = <tilt_id> time = 0.03 rot_angle = (-24 + <tilt_value>)
	endif
endscript
jam_percussion_hold_count = 0

script jam_update_percussion_kit 
	if (($jam_advanced_record) = 0)
		formattext checksumname = player_info_element 'player_info_element_%a' a = <select_player>
		if controllerpressed select <controller>
			change jam_percussion_hold_count = ($jam_percussion_hold_count + 1)
		else
			if ($jam_percussion_hold_count > 0 && $jam_percussion_hold_count < 30)
				if ($is_percussion_kit = 0)
					change \{is_percussion_kit = 1}
					broadcastevent \{type = jam_tutorial_percussion
						data = {
							percussion = 1
						}}
					if screenelementexists id = <player_info_element>
						<player_info_element> :se_setprops glow_alpha = 0.65000004
						<player_info_element> :se_setprops percussion_text = qs(0x6988d970)
					endif
				else
					change \{is_percussion_kit = 0}
					broadcastevent \{type = jam_tutorial_percussion
						data = {
							percussion = 0
						}}
					if screenelementexists id = <player_info_element>
						<player_info_element> :se_setprops glow_alpha = 0.0
						<player_info_element> :se_setprops percussion_text = qs(0x26239ec0)
					endif
				endif
			endif
			change \{jam_percussion_hold_count = 0}
		endif
	else
		if controllerpressed select <controller>
			change jam_percussion_hold_count = ($jam_percussion_hold_count + 1)
		else
			if ($jam_percussion_hold_count > 0 && $jam_percussion_hold_count < 30)
				if ($is_percussion_kit = 0)
					change \{is_percussion_kit = 1}
					if screenelementexists \{id = jam_studio_element}
						jam_studio_element :se_setprops \{perc_glow_alpha = 0.65000004}
						jam_studio_element :se_setprops \{percussion_text = qs(0x6988d970)}
					endif
				else
					change \{is_percussion_kit = 0}
					if screenelementexists \{id = jam_studio_element}
						jam_studio_element :se_setprops \{perc_glow_alpha = 0.0}
						jam_studio_element :se_setprops \{percussion_text = qs(0x26239ec0)}
					endif
				endif
			endif
			change \{jam_percussion_hold_count = 0}
		endif
	endif
endscript

script jam_input_drum_strum \{play_back = 0
		drumfill = 0
		druminput = 0
		loop_pitch = 0
		percussion = 0}
	if gotparam \{delay}
		wait <delay> seconds
	endif
	if istrue \{$g_optimized_jam_input_drum_strum}
		jaminputdrumstrum_cfunc <...>
		return
	endif
	if gotparam \{buss}
		got_buss = 1
	endif
	getplayerinfo <select_player> controller
	getplayerinfo <select_player> lefthanded_button_ups
	if (<druminput> = 1)
		if (<lefthanded_button_ups> = 0)
			snare_pattern = 4096
			hihat_pattern = 256
			tom1_pattern = 16
			cymbal_pattern = 1
			tom2_pattern = 65536
			kick_pattern = 1048576
		else
			if usefourlanehighway player = <select_player>
				snare_pattern = 65536
				hihat_pattern = 16
				tom1_pattern = 256
				cymbal_pattern = 1
				tom2_pattern = 4096
				kick_pattern = 1048576
			else
				snare_pattern = 65536
				hihat_pattern = 1
				tom1_pattern = 16
				cymbal_pattern = 256
				tom2_pattern = 4096
				kick_pattern = 1048576
			endif
		endif
		use_practice_busses = 1
	elseif (<play_back> = 0)
		if (<lefthanded_button_ups> = 0)
			snare_pattern = 4096
			hihat_pattern = 256
			tom1_pattern = 16
			cymbal_pattern = 1
			tom2_pattern = 65536
			kick_pattern = 1048576
		else
			snare_pattern = 1
			hihat_pattern = 16
			tom1_pattern = 256
			cymbal_pattern = 65536
			tom2_pattern = 4096
			kick_pattern = 1048576
		endif
	else
		if (<lefthanded_button_ups> = 0)
			snare_pattern = 65536
			hihat_pattern = 4096
			tom1_pattern = 256
			cymbal_pattern = 16
			tom2_pattern = 1
			kick_pattern = 1048576
		else
			snare_pattern = 1
			hihat_pattern = 16
			tom1_pattern = 256
			cymbal_pattern = 4096
			tom2_pattern = 65536
			kick_pattern = 1048576
		endif
	endif
	if gotparam \{velocity}
		snare_velocity = <velocity>
		hihat_velocity = <velocity>
		tom1_velocity = <velocity>
		crash_velocity = <velocity>
		tom2_velocity = <velocity>
		kick_velocity = <velocity>
	endif
	if (<hold_pattern> && <snare_pattern>)
		if NOT gotparam \{snare_velocity}
			snare_velocity = ($jam_default_snare_velocity)
		endif
		if gotparam \{use_practice_busses}
			buss = drums_ingame_snare
		elseif NOT gotparam \{got_buss}
			buss = jammode_drums_snare
		endif
		spawnscriptnow jam_input_snare_sound params = {velocity = <snare_velocity> play_back = <play_back> hold_pattern = <hold_pattern> buss = <buss> select_player = <select_player> loop_pitch = <loop_pitch> percussion = <percussion>}
	endif
	if (<hold_pattern> && <hihat_pattern>)
		if NOT gotparam \{hihat_velocity}
			hihat_velocity = ($jam_default_hihat_velocity)
		endif
		if gotparam \{use_practice_busses}
			buss = drums_ingame_cymbals
		elseif NOT gotparam \{got_buss}
			buss = jammode_drums_cymbals
		endif
		spawnscriptnow jam_input_hihat_sound params = {velocity = <hihat_velocity> play_back = <play_back> hold_pattern = <hold_pattern> buss = <buss> select_player = <select_player> loop_pitch = <loop_pitch> percussion = <percussion>}
	endif
	if (<hold_pattern> && <tom1_pattern>)
		if NOT gotparam \{tom1_velocity}
			tom1_velocity = ($jam_default_tom1_velocity)
		endif
		if gotparam \{use_practice_busses}
			buss = drums_ingame_toms
		elseif NOT gotparam \{got_buss}
			buss = jammode_drums_toms
		endif
		spawnscriptnow jam_input_tom1_sound params = {velocity = <tom1_velocity> play_back = <play_back> hold_pattern = <hold_pattern> buss = <buss> select_player = <select_player> loop_pitch = <loop_pitch> percussion = <percussion>}
	endif
	if (<hold_pattern> && <cymbal_pattern>)
		if NOT gotparam \{crash_velocity}
			crash_velocity = ($jam_default_cymbal_velocity)
		endif
		if gotparam \{use_practice_busses}
			buss = drums_ingame_cymbals
		elseif NOT gotparam \{got_buss}
			buss = jammode_drums_cymbals
		endif
		spawnscriptnow jam_input_cymbal_sound params = {velocity = <crash_velocity> play_back = <play_back> hold_pattern = <hold_pattern> buss = <buss> select_player = <select_player> loop_pitch = <loop_pitch> percussion = <percussion>}
	endif
	if (<hold_pattern> && <tom2_pattern>)
		if NOT gotparam \{tom2_velocity}
			tom2_velocity = ($jam_default_tom2_velocity)
		endif
		if gotparam \{use_practice_busses}
			buss = drums_ingame_toms
		elseif NOT gotparam \{got_buss}
			buss = jammode_drums_toms
		endif
		spawnscriptnow jam_input_tom2_sound params = {velocity = <tom2_velocity> play_back = <play_back> hold_pattern = <hold_pattern> buss = <buss> select_player = <select_player> loop_pitch = <loop_pitch> percussion = <percussion>}
	endif
	if (<hold_pattern> && <kick_pattern>)
		if NOT gotparam \{kick_velocity}
			kick_velocity = ($jam_default_kick_velocity)
		endif
		if gotparam \{use_practice_busses}
			buss = drums_ingame_kick
		elseif NOT gotparam \{got_buss}
			buss = jammode_drums_kick
		endif
		spawnscriptnow jam_input_kick_sound params = {velocity = <kick_velocity> play_back = <play_back> hold_pattern = <hold_pattern> buss = <buss> select_player = <select_player> loop_pitch = <loop_pitch> percussion = <percussion>}
	endif
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
debug_drum_velocities = 0

script jam_input_snare_sound 
	if compositeobjectexists \{name = drummer}
		drummer :anim_command target = drumkit command = applydrumkitdifference_playanim params = {anim = ($drumkit_anims [4]) blend_period = $drum_kit_blend_time}
	endif
	if ($debug_drum_velocities = 1)
		printf channel = velocity_debug qs(0x77fbb05b) s = <velocity>
	endif
	if NOT istrue \{$g_optimized_jam_input_drum_strum}
		jam_get_drum_set <...>
		play_drum_sample drum_kit_string = <drum_kit_string> pad = snare velocity = <velocity> buss = <buss> second_pedal_position = 68 loop_pitch = <loop_pitch> select_player = <select_player>
	endif
	jam_input_drum_sound drum_sample = <drum_sample> play_back = <play_back> velocity = <velocity> hold_pattern = 65536 hold_pattern_color = 4096 select_player = <select_player> loop_pitch = <loop_pitch>
endscript

script jam_input_hihat_sound 
	if compositeobjectexists \{name = drummer}
		drummer :anim_command target = drumkit command = applydrumkitdifference_playanim params = {anim = ($drumkit_anims [6]) blend_period = $drum_kit_blend_time}
	endif
	if ($debug_drum_velocities = 1)
		printf channel = velocity_debug qs(0x28e511d7) s = <velocity>
	endif
	if NOT istrue \{$g_optimized_jam_input_drum_strum}
		jam_get_drum_set <...>
		play_drum_sample drum_kit_string = <drum_kit_string> pad = hihat velocity = <velocity> buss = <buss> second_pedal_position = 68 loop_pitch = <loop_pitch> select_player = <select_player>
	endif
	jam_input_drum_sound drum_sample = <drum_sample> play_back = <play_back> velocity = <velocity> hold_pattern = 4096 hold_pattern_color = 256 select_player = <select_player> loop_pitch = <loop_pitch>
endscript

script jam_input_tom1_sound 
	if compositeobjectexists \{name = drummer}
		drummer :anim_command target = drumkit command = applydrumkitdifference_playanim params = {anim = ($drumkit_anims [3]) blend_period = $drum_kit_blend_time}
	endif
	if ($debug_drum_velocities = 1)
		printf channel = velocity_debug qs(0xb87f57d3) s = <velocity>
	endif
	if NOT istrue \{$g_optimized_jam_input_drum_strum}
		jam_get_drum_set <...>
		play_drum_sample drum_kit_string = <drum_kit_string> pad = tom1 velocity = <velocity> buss = <buss> second_pedal_position = 68 loop_pitch = <loop_pitch> select_player = <select_player>
	endif
	jam_input_drum_sound drum_sample = <drum_sample> play_back = <play_back> velocity = <velocity> hold_pattern = 256 hold_pattern_color = 16 select_player = <select_player> loop_pitch = <loop_pitch>
endscript

script jam_input_cymbal_sound 
	if compositeobjectexists \{name = drummer}
		drummer :anim_command target = drumkit command = applydrumkitdifference_playanim params = {anim = ($drumkit_anims [8]) blend_period = $drum_kit_blend_time}
	endif
	if ($debug_drum_velocities = 1)
		printf channel = velocity_debug qs(0x7f27db77) s = <velocity>
	endif
	if NOT istrue \{$g_optimized_jam_input_drum_strum}
		jam_get_drum_set <...>
		play_drum_sample drum_kit_string = <drum_kit_string> pad = cymbal velocity = <velocity> buss = <buss> second_pedal_position = 68 loop_pitch = <loop_pitch> select_player = <select_player>
	endif
	jam_input_drum_sound drum_sample = <drum_sample> play_back = <play_back> velocity = <velocity> hold_pattern = 16 hold_pattern_color = 1 select_player = <select_player> loop_pitch = <loop_pitch>
endscript

script jam_input_tom2_sound 
	if compositeobjectexists \{name = drummer}
		drummer :anim_command target = drumkit command = applydrumkitdifference_playanim params = {anim = ($drumkit_anims [2]) blend_period = $drum_kit_blend_time}
	endif
	if ($debug_drum_velocities = 1)
		printf channel = velocity_debug qs(0x4a28ba2b) s = <velocity>
	endif
	if NOT istrue \{$g_optimized_jam_input_drum_strum}
		jam_get_drum_set <...>
		play_drum_sample drum_kit_string = <drum_kit_string> pad = tom2 velocity = <velocity> buss = <buss> second_pedal_position = 68 loop_pitch = <loop_pitch> select_player = <select_player>
	endif
	jam_input_drum_sound drum_sample = <drum_sample> play_back = <play_back> velocity = <velocity> hold_pattern = 1 hold_pattern_color = 65536 select_player = <select_player> loop_pitch = <loop_pitch>
endscript

script jam_input_kick_sound 
	if compositeobjectexists \{name = drummer}
		drummer :anim_command target = drumkit command = applydrumkitdifference_playanim params = {anim = ($drumkit_anims [0]) blend_period = $drum_kit_blend_time}
	endif
	if ($debug_drum_velocities = 1)
		printf channel = velocity_debug qs(0x511de9e5) s = <velocity>
	endif
	if NOT istrue \{$g_optimized_jam_input_drum_strum}
		jam_get_drum_set <...>
		play_drum_sample drum_kit_string = <drum_kit_string> pad = kick velocity = <velocity> buss = <buss> second_pedal_position = 68 loop_pitch = <loop_pitch> select_player = <select_player>
	endif
	jam_input_drum_sound drum_sample = <drum_sample> play_back = <play_back> velocity = <velocity> hold_pattern = 1048576 hold_pattern_color = 1048576 select_player = <select_player> loop_pitch = <loop_pitch>
endscript

script jam_input_drum_sound \{play_back = 0
		loop_pitch = 0}
	if ($jam_tutorial_status = active)
		broadcastevent type = jam_tutorial_drum_hit data = {hold_pattern = <hold_pattern>}
	endif
	if (<play_back> = 1)
		return
	endif
	if NOT gotparam \{auto}
		getplayerinfo <select_player> controller
		if isdrumcontroller controller = <controller>
			spawnscriptnow jam_fretboard_add_note params = {player = <select_player> gem_pattern = <hold_pattern>}
		else
			spawnscriptnow jam_fretboard_add_note params = {player = <select_player> gem_pattern = <hold_pattern_color>}
		endif
		if NOT ($jam_highway_recording = 1)
			return
		endif
		curr_time = $jam_highway_play_time
		casttointeger \{curr_time}
	else
		curr_time = <time>
		casttointeger \{curr_time}
	endif
	quantize_to = ($jam_quantize [$jam_current_quantize].value)
	ms_per_beat = (60000.0 / $jam_current_bpm)
	quantize = (<ms_per_beat> / <quantize_to>)
	intervals = (<curr_time> / <quantize>)
	casttointeger \{intervals}
	if ($jam_highway_step_recording = 0)
		new_time = (<intervals> * <quantize>)
		time_before = (<curr_time> - <new_time>)
		time_after = ((<new_time> + <quantize>) - <curr_time>)
		if (<time_after> <= <time_before>)
			<new_time> = (<new_time> + <quantize>)
		endif
		casttointeger \{new_time}
	else
		new_time = <curr_time>
		casttointeger \{new_time}
	endif
	window_quantize_to = ($jam_quantize [7].value)
	window_quantize = (<ms_per_beat> / <window_quantize_to>)
	if NOT gotparam \{auto}
		getplayerinfo <select_player> jam_instrument
	else
		jam_instrument = 3
	endif
	if NOT (<jam_instrument> = -1)
		getjamsessionsize track = ($jam_tracks [<jam_instrument>].id)
		if ((<track_size> + 1) >= ($gemarraysize))
			if NOT gotparam \{auto}
				if ($jam_advanced_record = 1)
					if NOT scriptisrunning \{show_warning_message}
						spawnscriptnow \{show_warning_message
							id = jam_recording_spawns
							params = {
								warning_text = qs(0xdd331019)
							}}
					endif
				else
					spawnscriptnow jam_note_limit_hit id = <limit_msg> params = {player = <select_player>}
				endif
			endif
			return
		endif
	endif
	gem = 0
	if (<hold_pattern> && 65536)
		<gem> = (<gem> + 1)
	endif
	if (<hold_pattern> && 4096)
		<gem> = (<gem> + 2)
	endif
	if (<hold_pattern> && 256)
		<gem> = (<gem> + 4)
	endif
	if (<hold_pattern> && 16)
		<gem> = (<gem> + 8)
	endif
	if (<hold_pattern> && 1)
		<gem> = (<gem> + 16)
	endif
	if (<hold_pattern> && 1048576)
		<gem> = (<gem> + 32)
	endif
	gem_array = ($jam_tracks [3].gem_array)
	if NOT globalexists name = <gem_array> type = array
		return
	endif
	length = 60
	addnotetrackitem name = <gem_array> time = <new_time> length = <length> pattern = <gem> update_pattern
	new_velocity = <velocity>
	index = -1
	findjamsessionsound track = drum time = <new_time>
	if (<index> >= 0)
		getjamsessionsound track = drum index = <index>
		if (<new_time> = <time>)
			deletejamsessionsound track = drum index = <index>
		endif
	endif
	casttointeger \{new_velocity}
	if NOT ($is_percussion_kit = 1)
		type = 0
	else
		type = 1
	endif
	chord_type = 0
	if (<loop_pitch> < 0)
		chord_type = 1
	elseif (<loop_pitch> > 0)
		chord_type = 2
	endif
	addjamsessionsound track = drum time = <new_time> string = 0 fret = 0 type = <type> effect = 0 chord_type = <chord_type> velocity = <new_velocity>
	broadcastevent \{type = jam_note_hit}
endscript

script guitar_jam_drum_playback \{start_time = 0}
	printf \{channel = jam_mode
		qs(0x921826d7)}
	in_game = 0
	if gotparam \{gem_array}
		getarraysize ($<gem_array>)
		gem_array_size = <array_size>
		printf channel = jam_mode qs(0xdb421e13) s = <gem_array_size>
		in_game = 1
	else
		gem_array = ($jam_tracks [3].gem_array)
		suffix = '_size'
		appendsuffixtochecksum base = <gem_array> suffixstring = <suffix>
		gem_array_size = ($<appended_id>)
		gem_array_size_id = <appended_id>
		in_game = 0
	endif
	reset_song_time starttime = <start_time>
	orig_size = <gem_array_size>
	if (<gem_array_size> = 0)
		return
	endif
	track_index = 0
	start_at_index = -1
	begin
	getnotetrackitem name = <gem_array> index = <track_index>
	if (<gem_time> >= <start_time>)
		start_at_index = <track_index>
		break
	endif
	<track_index> = (<track_index> + 2)
	if (<track_index> >= <gem_array_size>)
		break
	endif
	repeat
	if (<start_at_index> = -1)
		return
	endif
	if istrue \{$g_optimized_guitar_jam_drum_playback}
		<track_index> = <start_at_index>
		<session_sound_index> = 0
		begin
		if NOT jamdrumplayback_process <...>
			break
		endif
		wait \{1
			gameframe}
		repeat
	else
		drum_gems = [
			{pattern = 65536}
			{pattern = 4096}
			{pattern = 256}
			{pattern = 16}
			{pattern = 1}
			{pattern = 1048576}
		]
		<track_index> = <start_at_index>
		<session_sound_index> = 0
		begin
		getsongtimems
		casttointeger \{time}
		curr_song_time = <time>
		if (<gem_array_size> = <orig_size>)
			getnotetrackitem name = <gem_array> index = <track_index>
			if (<curr_song_time> >= <gem_time>)
				getarraysize <drum_gems>
				gem_count = 0
				begin
				mod a = <gem_pattern> b = 2
				if (<mod> = 1 && <gem_pattern> >= 1)
					getjamsessionsize \{track = drum}
					note_type = 0
					if ((<track_index> / 2) >= <track_size>)
						velocity = $jam_default_drum_velocity
					else
						getjamsessionsound track = drum index = (<track_index> / 2)
					endif
					loop_pitch = 0
					if (<chord_type> = 1)
						<loop_pitch> = -12
					elseif (<chord_type> = 2)
						<loop_pitch> = 12
					endif
					jam_input_drum_strum hold_pattern = (<drum_gems> [<gem_count>].pattern) controller = 0 select_player = 1 play_back = 1 percussion = <note_type> loop_pitch = <loop_pitch> velocity = <velocity>
				endif
				<gem_pattern> = (<gem_pattern> / 2)
				<gem_count> = (<gem_count> + 1)
				repeat <array_size>
				<track_index> = (<track_index> + 2)
			endif
		endif
		if (<in_game> = 0)
			<gem_array_size> = ($<gem_array_size_id>)
		endif
		if (<gem_array_size> > <orig_size>)
			<track_index> = (<track_index> + 2)
			<orig_size> = <gem_array_size>
		endif
		if (<track_index> >= <gem_array_size>)
			break
		endif
		wait \{1
			gameframe}
		repeat
	endif
	printf \{channel = jam_mode
		qs(0x86f046a8)}
endscript
g_optimized_guitar_jam_drum_playback = 1
g_optimized_jam_input_drum_strum = 1
