special_event_alpha_out_gems = 0
special_event_previous_game_mode = None
special_event_stage = 0
special_event_next_state = None
special_event_song_index = 0
current_special_event = None
current_special_event_num = 1
current_special_event_challenge_num = 1
current_special_event_section = -1
current_special_event_completed = [
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
]
current_special_event_percentages = [
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
]
current_special_event_notes_total = [
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
]
current_special_event_miss_notes = [
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
]
total_special_event_time = 0

script debug_fill_out_special_event_percentages 
	i = 0
	GetArraySize \{$current_special_event_percentages}
	begin
	SetArrayElement ArrayName = current_special_event_percentages globalarray index = <i> NewValue = 100
	<i> = (<i> + 1)
	repeat <array_Size>
endscript

script debug_output_special_event_tags \{gignum = $current_gig_number}
	get_progression_globals game_mode = ($game_mode) ($current_progression_flag)
	format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = <gignum>
	GetGlobalTags <gig_name>
	printstruct <...>
endscript

script debug_output_current_special_event_notes_total 
endscript

script debug_output_current_special_event_completed 
endscript

script debug_output_current_special_event_percentages 
endscript

script debug_output_current_special_event_miss_notes 
endscript
special_events_challenges = {
	special_event1 = {
		title = qs(0x00000000)
		challenge1 = {
			title = qs(0x00000000)
			info = qs(0x00000000)
			state = uistate_select_song_section
			guitar_songs = [
				{
					song = theoneilove
					sections = [
						2
						5
						7
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			bass_songs = [
				{
					song = rebelyell
					sections = [
						2
						3
						7
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			drum_songs = [
				{
					song = rebelyell
					sections = [
						2
						3
						7
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			vocals_songs = [
				{
					song = rebelyell
					sections = [
						2
						3
						7
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			Name = se1c1_touchupsong
		}
		challenge2 = {
			title = qs(0x00000000)
			info = qs(0x00000000)
			state = uistate_select_song_section
			guitar_songs = [
				{
					song = crazytrain
					sections = [
						2
						4
						5
						7
						8
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			bass_songs = [
				{
					song = crazytrain
					sections = [
						2
						4
						5
						7
						8
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			drum_songs = [
				{
					song = crazytrain
					sections = [
						2
						4
						5
						7
						8
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			vocals_songs = [
				{
					song = crazytrain
					sections = [
						2
						4
						5
						7
						8
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			Name = se1c2_cleanuptwosongs
		}
		challenge3 = {
			title = qs(0x00000000)
			info = qs(0x00000000)
			state = uistate_select_song_section
			guitar_songs = [
				{
					song = rebelyell
					sections = [
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			bass_songs = [
				{
					song = rebelyell
					sections = [
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			drum_songs = [
				{
					song = rebelyell
					sections = [
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			vocals_songs = [
				{
					song = rebelyell
					sections = [
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			Name = se1c3_ghostplayer
		}
	}
	special_event2 = {
		title = qs(0x00000000)
		challenge1 = {
			title = qs(0x00000000)
			info = qs(0x00000000)
			state = uistate_special_event_popup
			guitar_songs = [
				{
					song = labamba
					sections = [
						2
					]
					allowedtomiss = [
						0
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			bass_songs = [
				{
					song = labamba
					sections = [
						2
					]
					allowedtomiss = [
						0
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			drum_songs = [
				{
					song = labamba
					sections = [
						2
					]
					allowedtomiss = [
						0
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			vocals_songs = [
				{
					song = labamba
					sections = [
						2
					]
					allowedtomiss = [
						0
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			Name = se2c1_tribute
		}
		challenge2 = {
			title = qs(0x00000000)
			info = qs(0x00000000)
			state = uistate_special_event_popup
			guitar_songs = [
				{
					song = labamba
					sections = [
						2
					]
					allowedtomiss = [
						0
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			bass_songs = [
				{
					song = labamba
					sections = [
						2
					]
					allowedtomiss = [
						0
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			drum_songs = [
				{
					song = labamba
					sections = [
						2
					]
					allowedtomiss = [
						0
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			vocals_songs = [
				{
					song = labamba
					sections = [
						2
					]
					allowedtomiss = [
						0
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			Name = se2c2_tribute
		}
		challenge3 = {
			title = qs(0x00000000)
			info = qs(0x00000000)
			state = uistate_special_event_popup
			guitar_songs = [
				{
					song = labamba
					sections = [
						2
					]
					allowedtomiss = [
						0
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			bass_songs = [
				{
					song = labamba
					sections = [
						2
					]
					allowedtomiss = [
						0
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			drum_songs = [
				{
					song = labamba
					sections = [
						2
					]
					allowedtomiss = [
						0
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			vocals_songs = [
				{
					song = labamba
					sections = [
						2
					]
					allowedtomiss = [
						0
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			Name = se2c3_tribute
		}
	}
	special_event3 = {
		title = qs(0x00000000)
		challenge1 = {
			Name = se3c1_songwriter
			title = qs(0x00000000)
			info = qs(0x00000000)
			state = uistate_jam_songwriter_event
			guitar_songs = [
			]
			bass_songs = [
			]
			drum_songs = [
			]
			vocals_songs = [
			]
			steps = [
				songwriter_c1_intro
				songwriter_c1_record_notes
				songwriter_c1_delete_notes
				songwriter_c1_copy_notes
				songwriter_c1_outro
			]
		}
		challenge2 = {
			title = qs(0x00000000)
			info = qs(0x00000000)
			state = uistate_jam_songwriter_event
			guitar_songs = [
			]
			bass_songs = [
			]
			drum_songs = [
			]
			vocals_songs = [
			]
			steps = [
				songwriter_c2_intro
				songwriter_c2_effect
				songwriter_c2_sections
				songwriter_c2_playback
			]
			Name = se3c2_songwriter
		}
		challenge3 = {
			title = qs(0x00000000)
			guitar_songs = [
			]
			bass_songs = [
			]
			drum_songs = [
			]
			vocals_songs = [
			]
		}
	}
}

script is_special_event_completion_on \{index = 0}
	if ($current_special_event_completed [<index>] = 1)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script set_special_event_completion_on \{index = 0}
	SetArrayElement ArrayName = current_special_event_completed globalarray index = <index> NewValue = 1
endscript

script reset_current_special_event_percentages 
	GetArraySize \{$current_special_event_percentages}
	index = 0
	begin
	SetArrayElement ArrayName = current_special_event_completed globalarray index = <index> NewValue = 0
	SetArrayElement ArrayName = current_special_event_percentages globalarray index = <index> NewValue = 0
	SetArrayElement ArrayName = current_special_event_notes_total globalarray index = <index> NewValue = 0
	SetArrayElement ArrayName = current_special_event_miss_notes globalarray index = <index> NewValue = 0
	<index> = (<index> + 1)
	repeat <array_Size>
endscript

script reset_current_special_event_miss_notes 
	GetArraySize \{$current_special_event_percentages}
	index = 0
	begin
	SetArrayElement ArrayName = current_special_event_miss_notes globalarray index = <index> NewValue = 0
	<index> = (<index> + 1)
	repeat <array_Size>
endscript

script special_event_copy_over_stats_at_index \{entry = 0}
	getfirstplayer
	get_section_stats section_index = <entry>
	get_song_section_array
	section_name = (<song_section_array> [<entry>])
	notes_hit = ((<notes_hit> [0]) * 1.0)
	notes_max = ((<notes_max> [0]) * 1.0)
	note_hit_percentage = ($current_special_event_percentages [<entry>])
	new_note_percentage = 0
	if (<notes_max> != 0)
		new_note_percentage = ((<notes_hit> / <notes_max>) * 100)
		CastToInteger \{new_note_percentage}
	endif
	gman_songtool_getcurrentsong
	GetArraySize \{$current_special_event_percentages}
	if (<entry> >= <array_Size>)
	endif
	if (<new_note_percentage> > <note_hit_percentage>)
		if (($current_special_event_miss_notes [<entry>]) < 1)
			SetArrayElement ArrayName = current_special_event_percentages globalarray index = <entry> NewValue = <new_note_percentage>
			<note_hit_percentage> = <new_note_percentage>
		endif
	endif
	GetArraySize <song_section_array>
	if ((<entry> + 1) < <array_Size>)
		section_time = ((<song_section_array> [(<entry> + 1)].time) - (<song_section_array> [<entry>].time))
	else
		songfilemanager func = get_song_end_time song_name = <current_song>
		section_time = (<total_end_time> - (<song_section_array> [<entry>].time))
	endif
	return note_hit_percentage = <note_hit_percentage> new_note_percentage = <new_note_percentage> section_name = <section_name> section_time = <section_time>
endscript

script special_event_copy_over_stats 
	getfirstplayer
	get_song_section_array
	entry = 0
	special_event_entry = 0
	GetArraySize (<song_section_array>)
	section_array_size = <array_Size>
	begin
	get_section_stats section_index = <entry>
	notes_hit = ((<notes_hit> [0]) * 1.0)
	notes_max = ((<notes_max> [0]) * 1.0)
	note_hit_percentage = ($current_special_event_percentages [<entry>])
	new_note_percentage = 0
	if (<notes_max> != 0)
		new_note_percentage = ((<notes_hit> / <notes_max>) * 100)
		CastToInteger \{new_note_percentage}
	endif
	GetArraySize \{$current_special_event_percentages}
	if (<entry> >= <array_Size>)
		gman_songtool_getcurrentsong
	endif
	if (<new_note_percentage> > <note_hit_percentage>)
		if (($current_special_event_miss_notes [<entry>]) < 1)
			SetArrayElement ArrayName = current_special_event_percentages globalarray index = <entry> NewValue = <new_note_percentage>
		endif
	endif
	<entry> = (<entry> + 1)
	repeat <section_array_size>
endscript

script check_current_special_event_percentages 
	getfirstplayer
	getplayerinfo <Player> part
	formatText \{checksumName = event_num
		'special_event%d'
		d = $current_special_event_num}
	formatText \{checksumName = challenge_num
		'challenge%d'
		d = $current_special_event_challenge_num}
	formatText checksumName = songs_ar '%p_songs' p = ($part_list_props.<part>.text_nl)
	get_song_section_array
	GetArraySize <song_section_array>
	song_section_size = <array_Size>
	GetArraySize ($special_events_challenges.<event_num>.<challenge_num>.<songs_ar> [$special_event_song_index].sections)
	if StructureContains structure = ($special_events_challenges.<event_num>.<challenge_num>.<songs_ar> [$special_event_song_index]) allowedtomiss
		num_allowed_to_miss = ($special_events_challenges.<event_num>.<challenge_num>.<songs_ar> [$special_event_song_index].allowedtomiss [0])
	endif
	ret_val = true
	note_missed = 0
	total_time_left_in_sections = 0
	if GotParam \{section_to_check}
		if (($current_special_event_percentages [<section_to_check>]) != 100)
			<ret_val> = FALSE
		endif
		if ($current_special_event_num = 2)
			if (($current_special_event_miss_notes [<section_to_check>]) > <num_allowed_to_miss>)
				<ret_val> = FALSE
				<note_missed> = 1
			endif
		else
			if (($current_special_event_miss_notes [<section_to_check>]) > 0)
				<ret_val> = FALSE
				<note_missed> = 1
			endif
		endif
		if (<ret_val> = FALSE)
			if ((<section_to_check> + 1) < <song_section_size>)
				current_sec_time = ((<song_section_array> [<section_to_check>].time) / 1000)
				next_sec_time = ((<song_section_array> [(<section_to_check> + 1)].time) / 1000)
				<total_time_left_in_sections> = (<total_time_left_in_sections> + (<next_sec_time> - <current_sec_time>))
			else
				gman_songtool_getcurrentsong
				songfilemanager func = get_song_end_time song_name = <current_song>
				time_left = (<total_end_time> - ((<song_section_array> [<section_to_check>].time) / 1000))
				<total_time_left_in_sections> = (<total_time_left_in_sections> + <time_left>)
			endif
		endif
		if NOT GotParam \{dont_count_unplayed_sections}
			if ($current_special_event_notes_total [<section_to_check>] = 0)
				<ret_val> = true
			endif
		endif
	else
		index = 0
		if (<array_Size> > 0)
			begin
			index_to_use = ($special_events_challenges.<event_num>.<challenge_num>.<songs_ar> [$special_event_song_index].sections [<index>])
			can_check = 1
			if GotParam \{dont_count_unplayed_sections}
				if NOT (<index_to_use> >= $practice_start_index && <index_to_use> <= $practice_end_index)
					<can_check> = 0
				endif
			endif
			if (<can_check> = 1)
				if (($current_special_event_percentages [<index_to_use>]) != 100)
					<ret_val> = FALSE
				else
					if GotParam \{dont_use_extra_notes}
						SetArrayElement ArrayName = current_special_event_miss_notes globalarray index = <index_to_use> NewValue = -1
					endif
				endif
				if ($current_special_event_num = 2)
					if (($current_special_event_miss_notes [<index_to_use>]) > <num_allowed_to_miss>)
						<ret_val> = FALSE
						<note_missed> = 1
					endif
				else
					if (($current_special_event_miss_notes [<index_to_use>]) > 0)
						<ret_val> = FALSE
						<note_missed> = 1
					endif
				endif
				if (<ret_val> = FALSE)
					if ((<index_to_use> + 1) < <song_section_size>)
						current_sec_time = ((<song_section_array> [<index_to_use>].time) / 1000)
						next_sec_time = ((<song_section_array> [(<index_to_use> + 1)].time) / 1000)
						<total_time_left_in_sections> = (<total_time_left_in_sections> + (<next_sec_time> - <current_sec_time>))
					else
						gman_songtool_getcurrentsong
						songfilemanager func = get_song_end_time song_name = <current_song>
						time_left = (<total_end_time> - ((<song_section_array> [<index_to_use>].time) / 1000))
						<total_time_left_in_sections> = (<total_time_left_in_sections> + <time_left>)
					endif
				endif
				if ($current_special_event_notes_total [<index_to_use>] = 0)
					<ret_val> = true
				endif
			else
				<ret_val> = FALSE
			endif
			<index> = (<index> + 1)
			repeat <array_Size>
		else
			begin
			if (($current_special_event_percentages [<index>]) != 100)
				<ret_val> = FALSE
			endif
			if ($current_special_event_num = 2)
				if (($current_special_event_miss_notes [<index>]) > <num_allowed_to_miss>)
					<ret_val> = FALSE
					<note_missed> = 1
				endif
			else
				if (($current_special_event_miss_notes [<index>]) > 0)
					<ret_val> = FALSE
					<note_missed> = 1
				endif
			endif
			if (<ret_val> = FALSE)
				if ((<index> + 1) < <song_section_size>)
					current_sec_time = ((<song_section_array> [<index>].time) / 1000)
					next_sec_time = ((<song_section_array> [(<index> + 1)].time) / 1000)
					<total_time_left_in_sections> = (<total_time_left_in_sections> + (<next_sec_time> - <current_sec_time>))
				else
					gman_songtool_getcurrentsong
					songfilemanager func = get_song_end_time song_name = <current_song>
					time_left = (<total_end_time> - ((<song_section_array> [<index>].time) / 1000))
					<total_time_left_in_sections> = (<total_time_left_in_sections> + <time_left>)
				endif
			endif
			if ($current_special_event_notes_total [<index>] = 0)
				<ret_val> = true
			endif
			<index> = (<index> + 1)
			repeat <song_section_size>
		endif
	endif
	return (<ret_val>) note_missed = <note_missed> total_time_left_in_sections = <total_time_left_in_sections>
endscript

script setup_special_event num = ($current_special_event_num)
	if (<num> = 1)
		getspecialeventtimer
		<time> = (<time> - ($special_event_total_expense_time / 1000))
		if (<time> < 0)
			<time> = 0
		endif
		setspecialeventtimer time = <time>
		reset_current_special_event_miss_notes
	endif
	Change \{hide_hud_elements = 1}
	Change \{game_mode = practice}
	Change \{practice_enabled = 1}
endscript

script reset_all_special_events 
	if ($special_event_previous_game_mode != None)
		Change game_mode = ($special_event_previous_game_mode)
	endif
	reset_special_event \{num = 1}
	reset_special_event \{num = 2}
	Change \{practice_enabled = 0}
	Change \{special_event_stage = 0}
	Change \{special_event_next_state = None}
	Change \{current_special_event = None}
	Change \{current_special_event_num = 1}
	Change \{current_special_event_challenge_num = 1}
	Change \{special_event_song_index = 0}
	Change \{current_special_event_section = -1}
	Change \{special_event_alpha_out_gems = 0}
	Change \{hide_hud_elements = 0}
	Change \{gray_gems = 0}
	resetnongraymarkers
endscript

script reset_special_event \{num = 1}
endscript

script get_and_set_special_event_time 
	if ($special_event_stage = 1 || $special_event_stage = 3)
		songfilemanager func = get_song_end_time song_name = <song>
		switch ($current_special_event)
			case se1c1_touchupsong
			time = (<total_end_time> * 3)
			case se1c2_cleanuptwosongs
			time = (<total_end_time> * 2)
			case se1c3_ghostplayer
			time = (<total_end_time> * 1.5)
			case se2c1_tribute
			time = (<total_end_time> * 2)
			default
			time = 0
		endswitch
		CastToInteger \{time}
		<time> = (<time> / 1000)
		setspecialeventtimer time = <time>
	elseif ($special_event_stage = 2)
		getspecialeventtimer
	endif
	return time = <time>
endscript

script format_time_from_seconds \{time = 0}
	CastToInteger \{time}
	Mod a = <time> b = 60
	minutes = (<time> / 60)
	Seconds = <Mod>
	if (<Seconds> < 10)
		formatText TextName = time_formatted '%a:0%b' a = <minutes> b = <Seconds>
	else
		formatText TextName = time_formatted '%a:%b' a = <minutes> b = <Seconds>
	endif
	return time_formatted = <time_formatted>
endscript

script get_special_event_time \{song = unset
		event = se1c1_touchupsong}
	destroy_band
	unload_songqpak
	load_songqpak song_name = <song> async = 0
	songfilemanager func = get_song_end_time song_name = <song>
	switch (<event>)
		case se1c1_touchupsong
		time = (<total_end_time> * 3)
		case se1c2_cleanuptwosongs
		time = (<total_end_time> * 2)
		case se1c3_ghostplayer
		time = (<total_end_time> * 1.5)
		case se2c1_tribute
		time = (<total_end_time> * 2)
		default
		time = 0
	endswitch
	CastToInteger \{time}
	return time = <time>
endscript

script focus_special_event_show_desc 
	get_progression_globals <progression_flag>
	formatText checksumName = tiernum 'tier%d' d = <gig_num>
	getfirstplayer
	getplayerinfo <Player> part
	formatText checksumName = special_event_num 'special_event%d' d = ($<tier_global>.<tiernum>.specialevent)
	formatText checksumName = challenge 'challenge%d' d = <challenge_num>
	formatText checksumName = songs_ar '%p_songs' p = ($part_list_props.<part>.text_nl)
	destroy_menu \{menu_id = special_events_container}
	CreateScreenElement \{Type = ContainerElement
		parent = gig_posters_menu
		id = special_events_container
		Pos = (15.0, 10.0)}
	GetArraySize ($special_events_challenges.<special_event_num>.<challenge>.<songs_ar>)
	song_size = <array_Size>
	total_time_left = 0
	entry = 0
	if (<song_size> > 0)
		begin
		song = ($special_events_challenges.<special_event_num>.<challenge>.<songs_ar> [<entry>].song)
		get_special_event_time song = <song> event = ($special_events_challenges.<special_event_num>.<challenge>.Name)
		<total_time_left> = (<total_time_left> + <time>)
		<entry> = (<entry> + 1)
		repeat <song_size>
	endif
	<total_time_left> = (<total_time_left> / 1000)
	setspecialeventtimer time = <total_time_left>
	format_time_from_seconds time = <total_time_left>
	CreateScreenElement {
		Type = TextBlockElement
		parent = special_events_container
		Pos = <desc_pos>
		dims = (620.0, 800.0)
		text = <time_formatted>
		font = fontgrid_text_a3
		just = [left top]
		rgba = [20 200 20 255]
		Scale = 0.6
	}
	CreateScreenElement \{parent = special_events_container
		id = special_event_info_di
		Type = descinterface
		desc = 'special_event_info'}
	<id> :se_setprops {
		special_event_info_container_alpha = 0.0
		special_event_info_text_text = ($special_events_challenges.<special_event_num>.<challenge>.info)
	}
	Wait \{1
		gameframe}
	<id> :se_setprops {
		special_event_info_container_alpha = 1.0
		time = 0.75
	}
	Wait \{0.75
		Seconds}
endscript

script special_event_get_time_wasted 
	GetSongTimeMs
	songtime = <time>
	get_song_section_array
	GetArraySize ($<song_section_array>)
	if (<songtime> < ($<song_section_array> [0].time))
		return \{time_wasted = 0}
	endif
	total_time_taken = 0
	entry = ($practice_start_index)
	begin
	if ((<entry> + 1) < <array_Size>)
		next_time = ($<song_section_array> [(<entry> + 1)].time)
	else
		songfilemanager func = get_song_end_time song_name = <current_song>
		next_time = <total_end_time>
	endif
	last_time = ($<song_section_array> [<entry>].time)
	time_diff = (<next_time> - <last_time>)
	<total_time_taken> = (<total_time_taken> + <time_diff>)
	if (<songtime> >= ($<song_section_array> [<entry>].time))
		break
	endif
	<entry> = (<entry> + 1)
	repeat ($practice_end_index - $practice_start_index)
	<total_time_taken> = (<total_time_taken> / 1000)
	return time_wasted = <total_time_taken>
endscript

script paused_special_event_start_again 
	ScriptAssert \{'paused_special_event_start_again: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script paused_special_event_quit_segment 
	ScriptAssert \{'paused_special_event_quit_segment: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script paused_special_event_quit_challenge 
	ScriptAssert \{'paused_special_event_quit_challenge: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript
