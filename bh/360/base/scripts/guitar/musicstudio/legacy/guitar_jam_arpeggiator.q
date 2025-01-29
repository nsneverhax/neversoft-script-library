jam_arpeggiator_current_pattern = [
	0
	0
	0
	0
	0
]
jam_arpeggiator_current_single_pattern = [
	0
	0
	0
	0
	0
]
jam_current_arpeggiator = [
	0
	0
	0
	0
	0
]
jam_current_arpeggiator_modifier = [
	0
	0
	0
	0
	0
]
jam_arpeggiator_loops = [
	{
		name_text = qs(0xafedae19)
		loop = Arpeggiator1
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_arpeggiator_loop
		submenu_exit_script = guitar_jam_arpeggiator_loop_exit
	}
	{
		name_text = qs(0x41532838)
		loop = Arpeggiator2
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_arpeggiator_loop
		submenu_exit_script = guitar_jam_arpeggiator_loop_exit
	}
	{
		name_text = qs(0x76354b24)
		loop = Arpeggiator2
		fit_to_dims = (160.0, 27.0)
		submenu_script = guitar_jam_change_arpeggiator_loop
		submenu_exit_script = guitar_jam_arpeggiator_loop_exit
	}
]
jam_current_arpeggiator_type = [
	0
	0
	0
	0
	0
]
jam_current_arpeggiator_whammy = [
	0
	0
	0
	0
	0
]
jam_loop_arp_touch_pattern = [
	0
	0
	0
	0
	0
]
jam_arpeggiator_types = [
	{
		name_text = qs(0x0d57a685)
		fit_to_dims = (50.0, 25.0)
		submenu_script = guitar_jam_change_arpeggiator_type
		submenu_exit_script = guitar_jam_arpeggiator_loop_exit
	}
	{
		name_text = qs(0xc33e8f02)
		fit_to_dims = (60.0, 25.0)
		submenu_script = guitar_jam_change_arpeggiator_type
		submenu_exit_script = guitar_jam_arpeggiator_loop_exit
	}
	{
		name_text = qs(0x4e1355f5)
		fit_to_dims = (120.0, 25.0)
		submenu_script = guitar_jam_change_arpeggiator_type
		submenu_exit_script = guitar_jam_arpeggiator_loop_exit
	}
	{
		name_text = qs(0x8f5d9f37)
		fit_to_dims = (120.0, 25.0)
		submenu_script = guitar_jam_change_arpeggiator_type
		submenu_exit_script = guitar_jam_arpeggiator_loop_exit
	}
	{
		name_text = qs(0x9c1b5214)
		fit_to_dims = (120.0, 25.0)
		submenu_script = guitar_jam_change_arpeggiator_type
		submenu_exit_script = guitar_jam_arpeggiator_loop_exit
	}
]

script kill_arpeggiator_loop \{reset_pattern = false}
	FormatText checksumname = arpeggiator_spawn 'arpeggiator_spawn_%s' s = <select_player>
	killspawnedscript id = <arpeggiator_spawn>
	if (<reset_pattern> = true)
		Change \{jam_arpeggiator_current_pattern = [
				0
				0
				0
				0
				0
			]}
		Change \{jam_arpeggiator_current_single_pattern = [
				0
				0
				0
				0
				0
			]}
		Change \{jam_current_arpeggiator_note_count = [
				0
				0
				0
				0
				0
			]}
		Change \{jam_current_arpeggiator_whammy = [
				0
				0
				0
				0
				0
			]}
		Change \{jam_current_arpeggiator_type = [
				2
				2
				2
				2
				2
			]}
	endif
	return arpeggiator_spawn = <arpeggiator_spawn>
endscript
jam_tut_arpeggiator_pattern = 0

script jam_play_loop_adj_for_curr_song_time 
	if NOT (<last_curr_song_time> = 0)
		if (<curr_song_time> < <last_curr_song_time>)
			<num_loops> = ((<curr_song_time> - <note_time>) / <ms_per_loop>)
		endif
	endif
	<last_curr_song_time> = <curr_song_time>
	return num_loops = <num_loops> last_curr_song_time = <last_curr_song_time>
endscript
jam_current_arpeggiator_note_count = [
	0
	0
	0
	0
	0
]

script jam_play_arpeggiator_loop \{bpm = 120
		player = 1
		loop_repeat = 1}
	GetSongTimeMs
	CastToInteger \{time}
	curr_song_time = <time>
	if NOT GlobalExists name = <loop> type = array
		return
	endif
	GetArraySize ($<loop>)
	GetPlayerInfo <player> jam_instrument
	loop_bpm = 125.0
	time_scale_percentage = (<loop_bpm> / <bpm>)
	ms_per_beat = (60000.0 / <bpm>)
	ms_per_loop = (<ms_per_beat> * (4 * 4))
	intervals = (<time> / <ms_per_loop>)
	CastToInteger \{intervals}
	time_into_loop = (<time> - (<ms_per_loop> * <intervals>))
	start_index = -1
	index = 0
	begin
	note_time = ($<loop> [<index>] [0])
	<note_time> = (<note_time> * <time_scale_percentage>)
	if (<note_time> >= <time_into_loop> && <start_index> < 0)
		<start_index> = <index>
		break
	endif
	<index> = (<index> + 1)
	if (<index> = (<array_size> - 1))
		<start_index> = 0
		<intervals> = (<intervals> + 1)
		break
	endif
	repeat
	index = <start_index>
	num_loops = <intervals>
	if ($jam_current_arpeggiator_note_count [<jam_instrument>] <= 0)
		note_count = 0
	else
		note_count = ($jam_current_arpeggiator_note_count [<jam_instrument>] + 1)
	endif
	holding = 0
	last_curr_song_time = 0
	begin
	note_time = ($<loop> [<index>] [0])
	<note_time> = (<note_time> * <time_scale_percentage>)
	orig_note_time = <note_time>
	GetSongTimeMs
	CastToInteger \{time}
	curr_song_time = <time>
	jam_play_loop_adj_for_curr_song_time <...>
	<note_time> = (<note_time> + (<num_loops> * <ms_per_loop>))
	if (<curr_song_time> >= <note_time>)
		first_strum = 0
		begin
		same_time = 0
		between_note_time = 0.0
		gate_note = 0
		if (<first_strum> = 0)
			add_open = 0
			if ControllerPressed up <controller>
				<add_open> = 1
			endif
			if ControllerPressed down <controller>
				<add_open> = 1
			endif
			if (<add_open> = 1)
				SetArrayElement \{arrayName = arpeggio_array
					index = 0
					newValue = 1}
			else
				SetArrayElement \{arrayName = arpeggio_array
					index = 0
					newValue = 0}
			endif
			jam_get_arpeggiator_pattern arpeggio_array = <arpeggio_array> note_count = <note_count> hold_pattern = <hold_pattern> jam_instrument = <jam_instrument>
			if NOT (($jam_current_arpeggiator_modifier [<jam_instrument>]) = 1)
				<holding> = 0
			endif
			note_length = (<ms_per_beat> / 4)
			if (($jam_current_arpeggiator_modifier [<jam_instrument>]) = 2)
				<note_length> = 50
			endif
			if NOT (($jam_current_arpeggiator_modifier [<jam_instrument>]) = 3)
				if NOT (<holding> = 1)
					switch <jam_instrument>
						case 1
						jam_input_lead_strum spawn_id = <spawn_id> record_time = <note_time> note_length = <note_length> hold_pattern = <arpeggiator_pattern> up_strum = 1 stop_sound = 1 controller = <controller> select_player = <player> sustain = 1 no_vibrato
						case 2
						jam_input_bass_strum_recording spawn_id = <spawn_id> record_time = <note_time> note_length = <note_length> hold_pattern = <arpeggiator_pattern> up_strum = 1 stop_sound = 1 controller = <controller> sustain = 1 select_player = <player>
						case 4
						jam_input_melody_strum_recording spawn_id = <spawn_id> record_time = <note_time> note_length = <note_length> hold_pattern = <arpeggiator_pattern> up_strum = 1 stop_sound = 1 controller = <controller> sustain = 1 select_player = <player>
					endswitch
				endif
			else
				SpawnScript stop_arpeggiator_sound id = <spawn_id> params = {jam_instrument = <jam_instrument> time = (25 / 1000.0)}
			endif
			if (<holding> = 0 && ($jam_current_arpeggiator_modifier [<jam_instrument>]) = 1)
				<holding> = 1
			endif
			if (($jam_current_arpeggiator_modifier [<jam_instrument>]) = 2)
				SpawnScript stop_arpeggiator_sound id = <spawn_id> params = {jam_instrument = <jam_instrument> time = (25 / 1000.0)}
			endif
			SetArrayElement arrayName = jam_current_arpeggiator_note_count GlobalArray index = <jam_instrument> newValue = <note_count>
			<note_count> = (<note_count> + 1)
		endif
		if (<index> >= (<array_size> - 1))
			break
		else
			next_note_time = ($<loop> [(<index> + 1)] [0])
			<next_note_time> = (<next_note_time> * <time_scale_percentage>)
			<next_note_time> = (<next_note_time> + (<num_loops> * <ms_per_loop>))
			if (<note_time> = <next_note_time>)
				<index> = (<index> + 1)
				note_time = ($<loop> [<index>] [0])
				<note_time> = (<note_time> * <time_scale_percentage>)
				<note_time> = (<note_time> + (<num_loops> * <ms_per_loop>))
			else
				break
			endif
		endif
		repeat
		<index> = (<index> + 1)
	endif
	if (<index> >= <array_size>)
		if (<loop_repeat> = 1)
			<num_loops> = (<num_loops> + 1)
			<index> = 0
		else
			break
		endif
	endif
	wait \{1
		gameframe}
	repeat
endscript

script stop_arpeggiator_sound 
	wait <time> seconds
	switch <jam_instrument>
		case 1
		jam_update_falling_gem_sustain \{sustain_global = jam_sustain_lead
			Stop = 1}
		StopSound \{unique_id = $jam_input_current_lead
			fade_type = linear
			fade_time = 0.05}
		case 2
		jam_update_falling_gem_sustain \{sustain_global = jam_sustain_bass
			Stop = 1}
		StopSound \{unique_id = $jam_input_current_bass
			fade_type = linear
			fade_time = 0.05}
		case 4
		jam_update_falling_gem_sustain \{sustain_global = jam_sustain_melody
			Stop = 1}
		jam_input_melody_stop_sound
	endswitch
endscript

script jam_get_arpeggiator_pattern \{note_count = 0}
	GetArraySize \{arpeggio_array}
	num_button_holds = 0
	gem_count = 0
	begin
	if (<arpeggio_array> [<gem_count>] = 1)
		<num_button_holds> = (<num_button_holds> + 1)
	endif
	<gem_count> = (<gem_count> + 1)
	repeat <array_size>
	if (<num_button_holds> = 0)
		return \{arpeggiator_pattern = 1048576}
	endif
	switch ($jam_current_arpeggiator_type [<jam_instrument>])
		case 0
		Mod a = <note_count> b = <num_button_holds>
		next_note = (<Mod> + 1)
		case 1
		Mod a = <note_count> b = <num_button_holds>
		next_note = (<num_button_holds> - <Mod>)
		case 2
		if (<num_button_holds> > 2)
			Mod a = <note_count> b = ((<num_button_holds> * 2) - 2)
			if (<Mod> < <num_button_holds>)
				next_note = (<Mod> + 1)
			else
				new_mod = (<Mod> - (<num_button_holds> - 1))
				next_note = (<num_button_holds> - <new_mod>)
			endif
		else
			Mod a = <note_count> b = <num_button_holds>
			next_note = (<Mod> + 1)
		endif
		case 3
		GetRandomValue name = next_note integer a = 1 b = <num_button_holds>
		case 4
		return arpeggiator_pattern = <hold_pattern>
	endswitch
	arpeggio_index = 0
	num_button_holds = 0
	gem_count = 0
	begin
	if (<arpeggio_array> [<gem_count>] = 1)
		<num_button_holds> = (<num_button_holds> + 1)
		if (<num_button_holds> = <next_note>)
			<arpeggio_index> = <gem_count>
		endif
	endif
	<gem_count> = (<gem_count> + 1)
	repeat <array_size>
	switch <arpeggio_index>
		case 0
		arpeggiator_pattern = 1048576
		case 1
		arpeggiator_pattern = 65536
		case 2
		arpeggiator_pattern = 4096
		case 3
		arpeggiator_pattern = 256
		case 4
		arpeggiator_pattern = 16
		case 5
		arpeggiator_pattern = 1
	endswitch
	return arpeggiator_pattern = <arpeggiator_pattern>
endscript

script jam_advanced_recording_toggle_arpeggiator 
	GetPlayerInfo <select_player> jam_instrument
	if (($is_arpeggiator [<jam_instrument>]) = 0)
		SetArrayElement arrayName = is_arpeggiator GlobalArray index = <jam_instrument> newValue = 1
	else
		SetArrayElement arrayName = is_arpeggiator GlobalArray index = <jam_instrument> newValue = 0
	endif
	destroy_dialog_box
	set_focus_color \{Color = pure_white}
	set_unfocus_color \{Color = gh4_jam_orangeish}
	jam_band_remove_pause player_pause = <player_pause> scrolling_options = <scrolling_options> event_cont = <event_cont> select_player = <select_player> respawn_input = <respawn_input>
endscript
