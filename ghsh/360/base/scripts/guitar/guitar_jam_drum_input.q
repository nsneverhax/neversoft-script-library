jam_current_drum_kit = 0
is_percussion_kit = 0

script jam_input_drums controller = ($player1_status.controller) spawn_id = jam_input_spawns
	mid_up_strum = 0
	mid_down_strum = 0
	jam_input_add_player_server Player = <select_player> spawn_id = <spawn_id>
endscript

script jam_input_drums_per_frame \{percussion = 0}
	if (($jam_advanced_record) = 0)
		jam_check_simple_record_input controller = <controller> select_player = <select_player>
	endif
	instrument_controls = [Enabled]
	if ($game_mode = training)
		if ScreenElementExists \{id = jam_band_container}
			jam_band_container :GetTags
		elseif ScreenElementExists \{id = jam_studio_element}
			jam_studio_element :GetTags
		endif
	endif
	if ArrayContains array = <instrument_controls> contains = Enabled
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
			if ControllerPressed up <controller>
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
			if ControllerPressed down <controller>
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
			jam_drum_tilt_needle_update velocity = <velocity> Player = <select_player>
		endif
	endif
	return mid_up_strum = <mid_up_strum> mid_down_strum = <mid_down_strum>
endscript

script jam_drum_tilt_needle_update 
	formatText checksumName = tilt_id 'jam_tilt_needle_%s' s = <Player>
	tilt_value = (60.0 * (<velocity> / 127.0))
	if (($jam_advanced_record) = 1)
		ResolveScreenElementID \{id = {
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
		formatText checksumName = player_info_element 'player_info_element_%a' a = <select_player>
		if ControllerPressed select <controller>
			Change jam_percussion_hold_count = ($jam_percussion_hold_count + 1)
		else
			if ($jam_percussion_hold_count > 0 && $jam_percussion_hold_count < 30)
				if ($is_percussion_kit = 0)
					Change \{is_percussion_kit = 1}
					broadcastevent \{Type = jam_tutorial_percussion
						data = {
							percussion = 1
						}}
					if ScreenElementExists id = <player_info_element>
						<player_info_element> :se_setprops glow_alpha = 0.65000004
						<player_info_element> :se_setprops percussion_text = qs(0x6988d970)
					endif
				else
					Change \{is_percussion_kit = 0}
					broadcastevent \{Type = jam_tutorial_percussion
						data = {
							percussion = 0
						}}
					if ScreenElementExists id = <player_info_element>
						<player_info_element> :se_setprops glow_alpha = 0.0
						<player_info_element> :se_setprops percussion_text = qs(0x26239ec0)
					endif
				endif
			endif
			Change \{jam_percussion_hold_count = 0}
		endif
	else
		if ControllerPressed select <controller>
			Change jam_percussion_hold_count = ($jam_percussion_hold_count + 1)
		else
			if ($jam_percussion_hold_count > 0 && $jam_percussion_hold_count < 30)
				if ($is_percussion_kit = 0)
					Change \{is_percussion_kit = 1}
					if ScreenElementExists \{id = jam_studio_element}
						jam_studio_element :se_setprops \{perc_glow_alpha = 0.65000004}
						jam_studio_element :se_setprops \{percussion_text = qs(0x6988d970)}
					endif
				else
					Change \{is_percussion_kit = 0}
					if ScreenElementExists \{id = jam_studio_element}
						jam_studio_element :se_setprops \{perc_glow_alpha = 0.0}
						jam_studio_element :se_setprops \{percussion_text = qs(0x26239ec0)}
					endif
				endif
			endif
			Change \{jam_percussion_hold_count = 0}
		endif
	endif
endscript

script jam_input_drum_strum \{play_back = 0
		drumfill = 0
		druminput = 0
		loop_pitch = 0
		percussion = 0}
	if GotParam \{delay}
		Wait <delay> Seconds
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
debug_drum_velocities = 0

script jam_input_snare_sound 
	if (<druminput> = 0)
		if CompositeObjectExists \{Name = drummer}
			drummer :drumkit_input_playanim \{drum_index = 1}
		endif
	endif
	if ($debug_drum_velocities = 1)
		printf channel = velocity_debug qs(0x77fbb05b) s = <velocity>
	endif
	if NOT IsTrue \{$g_optimized_jam_input_drum_strum}
		jam_get_drum_set <...>
		play_drum_sample drum_kit_string = <drum_kit_string> pad = snare velocity = <velocity> buss = <buss> second_pedal_position = 68 loop_pitch = <loop_pitch> select_player = <select_player>
	endif
	jam_input_drum_sound drum_sample = <drum_sample> play_back = <play_back> velocity = <velocity> hold_pattern = 65536 hold_pattern_color = 4096 select_player = <select_player> loop_pitch = <loop_pitch> percussion = <percussion>
endscript

script jam_input_hihat_sound 
	if (<druminput> = 0)
		if CompositeObjectExists \{Name = drummer}
			drummer :drumkit_input_playanim \{drum_index = 2}
		endif
	endif
	if ($debug_drum_velocities = 1)
		printf channel = velocity_debug qs(0x28e511d7) s = <velocity>
	endif
	if NOT IsTrue \{$g_optimized_jam_input_drum_strum}
		jam_get_drum_set <...>
		play_drum_sample drum_kit_string = <drum_kit_string> pad = hihat velocity = <velocity> buss = <buss> second_pedal_position = 68 loop_pitch = <loop_pitch> select_player = <select_player>
	endif
	jam_input_drum_sound drum_sample = <drum_sample> play_back = <play_back> velocity = <velocity> hold_pattern = 4096 hold_pattern_color = 256 select_player = <select_player> loop_pitch = <loop_pitch> percussion = <percussion>
endscript

script jam_input_tom1_sound 
	if (<druminput> = 0)
		if CompositeObjectExists \{Name = drummer}
			drummer :drumkit_input_playanim \{drum_index = 3}
		endif
	endif
	if ($debug_drum_velocities = 1)
		printf channel = velocity_debug qs(0xb87f57d3) s = <velocity>
	endif
	if NOT IsTrue \{$g_optimized_jam_input_drum_strum}
		jam_get_drum_set <...>
		play_drum_sample drum_kit_string = <drum_kit_string> pad = tom1 velocity = <velocity> buss = <buss> second_pedal_position = 68 loop_pitch = <loop_pitch> select_player = <select_player>
	endif
	jam_input_drum_sound drum_sample = <drum_sample> play_back = <play_back> velocity = <velocity> hold_pattern = 256 hold_pattern_color = 16 select_player = <select_player> loop_pitch = <loop_pitch> percussion = <percussion>
endscript

script jam_input_cymbal_sound 
	if (<druminput> = 0)
		if CompositeObjectExists \{Name = drummer}
			drummer :drumkit_input_playanim \{drum_index = 4}
		endif
	endif
	if ($debug_drum_velocities = 1)
		printf channel = velocity_debug qs(0x7f27db77) s = <velocity>
	endif
	if NOT IsTrue \{$g_optimized_jam_input_drum_strum}
		jam_get_drum_set <...>
		play_drum_sample drum_kit_string = <drum_kit_string> pad = cymbal velocity = <velocity> buss = <buss> second_pedal_position = 68 loop_pitch = <loop_pitch> select_player = <select_player>
	endif
	jam_input_drum_sound drum_sample = <drum_sample> play_back = <play_back> velocity = <velocity> hold_pattern = 16 hold_pattern_color = 1 select_player = <select_player> loop_pitch = <loop_pitch> percussion = <percussion>
endscript

script jam_input_tom2_sound 
	if (<druminput> = 0)
		if CompositeObjectExists \{Name = drummer}
			drummer :drumkit_input_playanim \{drum_index = 0}
		endif
	endif
	if ($debug_drum_velocities = 1)
		printf channel = velocity_debug qs(0x4a28ba2b) s = <velocity>
	endif
	if NOT IsTrue \{$g_optimized_jam_input_drum_strum}
		jam_get_drum_set <...>
		play_drum_sample drum_kit_string = <drum_kit_string> pad = tom2 velocity = <velocity> buss = <buss> second_pedal_position = 68 loop_pitch = <loop_pitch> select_player = <select_player>
	endif
	jam_input_drum_sound drum_sample = <drum_sample> play_back = <play_back> velocity = <velocity> hold_pattern = 1 hold_pattern_color = 65536 select_player = <select_player> loop_pitch = <loop_pitch> percussion = <percussion>
endscript

script jam_input_kick_sound 
	if (<druminput> = 0)
		if CompositeObjectExists \{Name = drummer}
			drummer :drumkit_input_playanim \{drum_index = 5}
		endif
	endif
	if ($debug_drum_velocities = 1)
		printf channel = velocity_debug qs(0x511de9e5) s = <velocity>
	endif
	if NOT IsTrue \{$g_optimized_jam_input_drum_strum}
		jam_get_drum_set <...>
		play_drum_sample drum_kit_string = <drum_kit_string> pad = kick velocity = <velocity> buss = <buss> second_pedal_position = 68 loop_pitch = <loop_pitch> select_player = <select_player>
	endif
	jam_input_drum_sound drum_sample = <drum_sample> play_back = <play_back> velocity = <velocity> hold_pattern = 1048576 hold_pattern_color = 1048576 select_player = <select_player> loop_pitch = <loop_pitch> percussion = <percussion>
endscript

script jam_input_drum_sound \{play_back = 0
		loop_pitch = 0
		percussion = 0}
	if ($jam_tutorial_status = Active)
		broadcastevent Type = jam_tutorial_drum_hit data = {hold_pattern = <hold_pattern>}
	endif
	if (<play_back> = 1)
		return
	endif
	if NOT GotParam \{auto}
		getplayerinfo <select_player> controller
		if isdrumcontroller controller = <controller>
			SpawnScriptNow jam_fretboard_add_note params = {Player = <select_player> gem_pattern = <hold_pattern>}
		else
			SpawnScriptNow jam_fretboard_add_note params = {Player = <select_player> gem_pattern = <hold_pattern_color>}
		endif
		if NOT ($jam_highway_recording = 1)
			return
		endif
		curr_time = $jam_highway_play_time
		CastToInteger \{curr_time}
	else
		curr_time = <time>
		CastToInteger \{curr_time}
	endif
	quantize_to = ($jam_quantize [$jam_current_quantize].value)
	ms_per_beat = (60000.0 / $jam_current_bpm)
	quantize = (<ms_per_beat> / <quantize_to>)
	intervals = (<curr_time> / <quantize>)
	CastToInteger \{intervals}
	if ($jam_highway_step_recording = 0)
		new_time = (<intervals> * <quantize>)
		time_before = (<curr_time> - <new_time>)
		time_after = ((<new_time> + <quantize>) - <curr_time>)
		if (<time_after> <= <time_before>)
			<new_time> = (<new_time> + <quantize>)
		endif
		CastToInteger \{new_time}
	else
		new_time = <curr_time>
		CastToInteger \{new_time}
	endif
	window_quantize_to = ($jam_quantize [9].value)
	window_quantize = (<ms_per_beat> / <window_quantize_to>)
	if NOT GotParam \{auto}
		getplayerinfo <select_player> jam_instrument
	else
		jam_instrument = 3
	endif
	if NOT (<jam_instrument> = -1)
		getjamsessionsize track = ($jam_tracks [<jam_instrument>].id)
		if ((<track_size> + 1) >= ($gemarraysize))
			if NOT GotParam \{auto}
				if ($jam_advanced_record = 1)
					if NOT ScriptIsRunning \{show_warning_message}
						SpawnScriptNow \{show_warning_message
							id = jam_recording_spawns
							params = {
								warning_text = qs(0xdd331019)
							}}
					endif
				else
					SpawnScriptNow jam_note_limit_hit id = <limit_msg> params = {Player = <select_player>}
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
	if NOT GlobalExists Name = <gem_array> Type = array
		return
	endif
	length = 60
	addnotetrackitem Name = <gem_array> time = <new_time> length = <length> pattern = <gem> update_pattern
	new_velocity = <velocity>
	index = -1
	findjamsessionsound track = drum time = <new_time>
	if (<index> >= 0)
		getjamsessionsound track = drum index = <index>
		if (<new_time> = <time>)
			deletejamsessionsound track = drum index = <index>
		endif
	endif
	CastToInteger \{new_velocity}
	if (<percussion> = 1)
		Type = 1
	else
		if NOT ($is_percussion_kit = 1)
			Type = 0
		else
			Type = 1
		endif
	endif
	chord_type = 0
	if (<loop_pitch> < 0)
		chord_type = 1
	elseif (<loop_pitch> > 0)
		chord_type = 2
	endif
	addjamsessionsound track = drum time = <new_time> string = 0 fret = 0 Type = <Type> effect = 0 chord_type = <chord_type> velocity = <new_velocity>
	broadcastevent \{Type = jam_note_hit}
endscript

script guitar_jam_drum_playback \{start_time = 0}
	printf \{channel = jam_mode
		qs(0x921826d7)}
	in_game = 0
	if GotParam \{gem_array}
		GetArraySize ($<gem_array>)
		gem_array_size = <array_Size>
		printf channel = jam_mode qs(0xdb421e13) s = <gem_array_size>
		in_game = 1
	else
		gem_array = ($jam_tracks [3].gem_array)
		suffix = '_size'
		AppendSuffixToChecksum Base = <gem_array> SuffixString = <suffix>
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
	getnotetrackitem Name = <gem_array> index = <track_index>
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
	if IsTrue \{$g_optimized_guitar_jam_drum_playback}
		<track_index> = <start_at_index>
		<session_sound_index> = 0
		begin
		if NOT jamdrumplayback_process <...>
			break
		endif
		Wait \{1
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
		GetSongTimeMs
		CastToInteger \{time}
		curr_song_time = <time>
		if (<gem_array_size> = <orig_size>)
			getnotetrackitem Name = <gem_array> index = <track_index>
			if (<curr_song_time> >= <gem_time>)
				GetArraySize <drum_gems>
				gem_count = 0
				begin
				Mod a = <gem_pattern> b = 2
				if (<Mod> = 1 && <gem_pattern> >= 1)
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
				repeat <array_Size>
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
		Wait \{1
			gameframe}
		repeat
	endif
	printf \{channel = jam_mode
		qs(0x86f046a8)}
endscript
g_optimized_guitar_jam_drum_playback = 1
g_optimized_jam_input_drum_strum = 1
