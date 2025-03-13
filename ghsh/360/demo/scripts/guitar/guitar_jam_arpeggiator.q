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
		loop = arpeggiator1
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_arpeggiator_loop
		submenu_exit_script = guitar_jam_arpeggiator_loop_exit
	}
	{
		name_text = qs(0x41532838)
		loop = arpeggiator2
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_arpeggiator_loop
		submenu_exit_script = guitar_jam_arpeggiator_loop_exit
	}
	{
		name_text = qs(0x76354b24)
		loop = arpeggiator2
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

script jam_arpeggiator_per_frame_get_strum_change 
	<strum_change> = no_change
	if controllerpressed up <controller>
		if (<mid_up_strum> = 0)
			<strum_change> = on
		endif
		<mid_up_strum> = 1
	else
		if (<mid_up_strum> = 1)
			<strum_change> = off
		endif
		<mid_up_strum> = 0
	endif
	if controllerpressed down <controller>
		if (<mid_down_strum> = 0)
			<strum_change> = on
		endif
		<mid_down_strum> = 1
	else
		if (<mid_down_strum> = 1)
			<strum_change> = off
		endif
		<mid_down_strum> = 0
	endif
	return <...>
endscript

script kill_arpeggiator_loop \{reset_pattern = false}
	formattext checksumname = arpeggiator_spawn 'arpeggiator_spawn_%s' s = <select_player>
	killspawnedscript id = <arpeggiator_spawn>
	if (<reset_pattern> = true)
		change \{jam_arpeggiator_current_pattern = [
				0
				0
				0
				0
				0
			]}
		change \{jam_arpeggiator_current_single_pattern = [
				0
				0
				0
				0
				0
			]}
		change \{jam_current_arpeggiator_note_count = [
				0
				0
				0
				0
				0
			]}
		change \{jam_current_arpeggiator_whammy = [
				0
				0
				0
				0
				0
			]}
		change \{jam_current_arpeggiator_type = [
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

script jam_arpeggiator_per_frame 
	instrument_controls = [enabled]
	if ($game_mode = training)
		change jam_tut_arpeggiator_pattern = <hold_pattern>
		if screenelementexists \{id = jam_band_container}
			jam_band_container :gettags
		elseif screenelementexists \{id = jam_studio_element}
			jam_studio_element :gettags
		endif
	endif
	if (($jam_advanced_record) = 0)
		jam_check_simple_record_input controller = <controller> select_player = <select_player>
	endif
	getplayerinfo <select_player> jam_instrument
	control_change = false
	jam_arpeggiator_per_frame_get_strum_change <...>
	if NOT (<strum_change> = no_change)
		<control_change> = true
	elseif NOT (<hold_pattern> = ($jam_arpeggiator_current_pattern [<jam_instrument>]))
		<control_change> = true
	endif
	do_loop = 0
	new_loop = 1
	if (<control_change> = true)
		if (<touch_pattern> = 16 || <touch_pattern> = 272)
			if ($jam_arpeggiator_current_single_pattern [<jam_instrument>] = <single_hold_pattern>)
				<new_loop> = 0
			endif
		endif
		if NOT (<hold_pattern> = 1048576)
			do_loop = 1
		elseif ((<mid_up_strum> = 1) || (<mid_down_strum> = 1))
			do_loop = 1
		else
			kill_arpeggiator_loop select_player = <select_player>
			switch <jam_instrument>
				case 1
				jam_update_falling_gem_sustain \{sustain_global = jam_sustain_lead
					stop = 1}
				stopsound \{unique_id = $jam_input_current_lead
					fade_type = linear
					fade_time = 0.05}
				case 2
				jam_update_falling_gem_sustain \{sustain_global = jam_sustain_bass
					stop = 1}
				stopsound \{unique_id = $jam_input_current_bass
					fade_type = linear
					fade_time = 0.05}
				case 4
				jam_update_falling_gem_sustain \{sustain_global = jam_sustain_melody
					stop = 1}
				jam_input_melody_stop_sound
			endswitch
		endif
		if (<new_loop> = 0)
			<do_loop> = 0
		endif
		setarrayelement arrayname = jam_arpeggiator_current_pattern globalarray index = <jam_instrument> newvalue = <hold_pattern>
		setarrayelement arrayname = jam_arpeggiator_current_single_pattern globalarray index = <jam_instrument> newvalue = <single_hold_pattern>
	endif
	if ($jam_current_arpeggiator_whammy [<jam_instrument>] = 1)
		if (<whammy_value> < -100)
			setarrayelement arrayname = jam_current_arpeggiator_whammy globalarray index = <jam_instrument> newvalue = 0
		endif
	else
		if (<whammy_value> > 0)
			setarrayelement arrayname = jam_current_arpeggiator_whammy globalarray index = <jam_instrument> newvalue = 1
			curr_arp_type = ($jam_current_arpeggiator_type [<jam_instrument>])
			if (<curr_arp_type> = 3)
				setarrayelement arrayname = jam_current_arpeggiator_type globalarray index = <jam_instrument> newvalue = 0
			else
				setarrayelement arrayname = jam_current_arpeggiator_type globalarray index = <jam_instrument> newvalue = (<curr_arp_type> + 1)
			endif
		endif
	endif
	curr_arp_type = ($jam_current_arpeggiator_type [<jam_instrument>])
	arp_text = ($jam_arpeggiator_types [<curr_arp_type>].name_text)
	formattext checksumname = extra_info_id 'jam_band_extra_info_%s' s = <select_player>
	if screenelementexists id = <extra_info_id>
		formattext textname = arp_text qs(0xd8ce0d36) s = <arp_text>
		<extra_info_id> :se_setprops info4_text = <arp_text>
	endif
	switch <touch_pattern>
		case 272
		case 16
		setarrayelement arrayname = jam_current_arpeggiator_modifier globalarray index = <jam_instrument> newvalue = 1
		case 4096
		case 256
		setarrayelement arrayname = jam_current_arpeggiator_modifier globalarray index = <jam_instrument> newvalue = 2
		case 65536
		setarrayelement arrayname = jam_current_arpeggiator_modifier globalarray index = <jam_instrument> newvalue = 0
		case 17
		case 1
		setarrayelement arrayname = jam_current_arpeggiator_modifier globalarray index = <jam_instrument> newvalue = 3
		default
		setarrayelement arrayname = jam_current_arpeggiator_modifier globalarray index = <jam_instrument> newvalue = 0
	endswitch
	holding_open = 0
	if (<mid_up_strum> > 0 || <mid_down_strum> > 0)
		<holding_open> = 1
	endif
	arpeggiator_loop = arpeggiator1
	if NOT ((<touch_pattern> = $jam_loop_arp_touch_pattern [<jam_instrument>]) && <do_loop> = 0)
		if NOT (<hold_pattern> = 1048576 && <holding_open> = 0)
			switch <touch_pattern>
				case 65536
				case 4096
				case 69632
				<do_loop> = 1
				setarrayelement arrayname = jam_arpeggiator_current_pattern globalarray index = <jam_instrument> newvalue = <hold_pattern>
				<arpeggiator_loop> = arpeggiator2
				case 256
				<do_loop> = 1
				setarrayelement arrayname = jam_arpeggiator_current_pattern globalarray index = <jam_instrument> newvalue = <hold_pattern>
				<arpeggiator_loop> = arpeggiator1
				case 0
				last_touch = ($jam_loop_arp_touch_pattern [<jam_instrument>])
				if (<last_touch> = 65536 || <last_touch> = 69632 || <last_touch> = 4096 || <last_touch> = 256)
					<do_loop> = 1
					setarrayelement arrayname = jam_arpeggiator_current_pattern globalarray index = <jam_instrument> newvalue = <hold_pattern>
					<arpeggiator_loop> = arpeggiator1
				endif
			endswitch
			setarrayelement arrayname = jam_loop_arp_touch_pattern globalarray index = <jam_instrument> newvalue = <touch_pattern>
		endif
	endif
	if arraycontains array = <instrument_controls> contains = enabled
		if (<do_loop> = 1)
			kill_arpeggiator_loop select_player = <select_player>
			appendsuffixtochecksum base = <arpeggiator_loop> suffixstring = '_drum_loop'
			if NOT (<touch_pattern> = 16 || <touch_pattern> = 272)
				spawnscriptnow id = <arpeggiator_spawn> jam_play_arpeggiator_loop params = {spawn_id = <spawn_id> hold_pattern = <hold_pattern> arpeggio_array = <arpeggio_array> controller = <controller> player = <select_player> loop = <appended_id> bpm = ($jam_current_bpm)}
			else
				spawnscriptnow id = <arpeggiator_spawn> jam_play_arpeggiator_loop params = {spawn_id = <spawn_id> hold_pattern = <single_hold_pattern> arpeggio_array = <single_arpeggio_array> controller = <controller> player = <select_player> loop = <appended_id> bpm = ($jam_current_bpm)}
			endif
		endif
	endif
	return mid_up_strum = <mid_up_strum> mid_down_strum = <mid_down_strum>
endscript

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
	getsongtimems
	casttointeger \{time}
	curr_song_time = <time>
	if NOT globalexists name = <loop> type = array
		return
	endif
	getarraysize ($<loop>)
	getplayerinfo <player> jam_instrument
	loop_bpm = 125.0
	time_scale_percentage = (<loop_bpm> / <bpm>)
	ms_per_beat = (60000.0 / <bpm>)
	ms_per_loop = (<ms_per_beat> * (4 * 4))
	intervals = (<time> / <ms_per_loop>)
	casttointeger \{intervals}
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
	getsongtimems
	casttointeger \{time}
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
			if controllerpressed up <controller>
				<add_open> = 1
			endif
			if controllerpressed down <controller>
				<add_open> = 1
			endif
			if (<add_open> = 1)
				setarrayelement \{arrayname = arpeggio_array
					index = 0
					newvalue = 1}
			else
				setarrayelement \{arrayname = arpeggio_array
					index = 0
					newvalue = 0}
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
				spawnscript stop_arpeggiator_sound id = <spawn_id> params = {jam_instrument = <jam_instrument> time = (25 / 1000.0)}
			endif
			if (<holding> = 0 && ($jam_current_arpeggiator_modifier [<jam_instrument>]) = 1)
				<holding> = 1
			endif
			if (($jam_current_arpeggiator_modifier [<jam_instrument>]) = 2)
				spawnscript stop_arpeggiator_sound id = <spawn_id> params = {jam_instrument = <jam_instrument> time = (25 / 1000.0)}
			endif
			setarrayelement arrayname = jam_current_arpeggiator_note_count globalarray index = <jam_instrument> newvalue = <note_count>
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
			stop = 1}
		stopsound \{unique_id = $jam_input_current_lead
			fade_type = linear
			fade_time = 0.05}
		case 2
		jam_update_falling_gem_sustain \{sustain_global = jam_sustain_bass
			stop = 1}
		stopsound \{unique_id = $jam_input_current_bass
			fade_type = linear
			fade_time = 0.05}
		case 4
		jam_update_falling_gem_sustain \{sustain_global = jam_sustain_melody
			stop = 1}
		jam_input_melody_stop_sound
	endswitch
endscript

script jam_get_arpeggiator_pattern \{note_count = 0}
	getarraysize \{arpeggio_array}
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
		mod a = <note_count> b = <num_button_holds>
		next_note = (<mod> + 1)
		case 1
		mod a = <note_count> b = <num_button_holds>
		next_note = (<num_button_holds> - <mod>)
		case 2
		if (<num_button_holds> > 2)
			mod a = <note_count> b = ((<num_button_holds> * 2) - 2)
			if (<mod> < <num_button_holds>)
				next_note = (<mod> + 1)
			else
				new_mod = (<mod> - (<num_button_holds> - 1))
				next_note = (<num_button_holds> - <new_mod>)
			endif
		else
			mod a = <note_count> b = <num_button_holds>
			next_note = (<mod> + 1)
		endif
		case 3
		getrandomvalue name = next_note integer a = 1 b = <num_button_holds>
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
	getplayerinfo <select_player> jam_instrument
	if (($is_arpeggiator [<jam_instrument>]) = 0)
		setarrayelement arrayname = is_arpeggiator globalarray index = <jam_instrument> newvalue = 1
	else
		setarrayelement arrayname = is_arpeggiator globalarray index = <jam_instrument> newvalue = 0
	endif
	destroy_popup_warning_menu
	set_focus_color \{rgba = [
			255
			255
			255
			255
		]}
	set_unfocus_color \{rgba = [
			210
			130
			0
			255
		]}
	jam_band_remove_pause player_pause = <player_pause> scrolling_options = <scrolling_options> event_cont = <event_cont> select_player = <select_player> respawn_input = <respawn_input>
endscript
