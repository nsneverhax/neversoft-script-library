g_net_career_progression = {
}
g_net_song_won_update = 0
g_net_career_ignore_unlock_atoms = 0
g_net_career_display_save_warning = 0
net_career_host_status_def = {
	module_name = net_career_host_status_struct
	module_def = [
		{
			name = menu_state
			type = checksum
			value = `default`
		}
		{
			name = var_1
			type = checksum
			value = `default`
		}
		{
			name = var_2
			type = checksum
			value = `default`
		}
		{
			name = int_var
			type = int
			value = 0
		}
	]
}
host_status_strings = {
	`default` = qs(0xab4f2ff7)
	quest_map = qs(0xb47aeb12)
	quest_map_giglist_johnny = qs(0x1463eee5)
	quest_map_giglist_judy = qs(0x323fd9ae)
	quest_map_giglist_newfemale = qs(0x11632706)
	quest_map_giglist_newmale = qs(0xcf1e3293)
	quest_map_giglist_pandora = qs(0x4237edb2)
	quest_map_giglist_lars = qs(0x384fc042)
	quest_map_giglist_casey = qs(0xf6551fc2)
	quest_map_giglist_axel = qs(0x347021e4)
	quest_band_select = qs(0x2cbefd7e)
	quest_map_giglist_demigod = qs(0xd343f3e1)
	play_song = qs(0xd52128b4)
	unlock_screen = qs(0x8b7f64c5)
	save_warning = qs(0x46fa3c2c)
}

script dump_net_progression 
	printf \{channel = tmr_debug
		qs(0x6eda12cd)}
	printstruct ($g_net_career_progression) channel = tmr_debug
endscript

script net_career_setup_ui_stream \{parent = !q1768515945
		net_play_song = 0}
	if ishost
		<parent> :se_setprops net_dialog_alpha = 0.0
		<parent> :obj_spawnscript net_career_host_update
	else
		<parent> :se_setprops net_dialog_alpha = 1.0
		if (<net_play_song> = 1)
			<parent> :se_setprops net_dialog_text = ($host_status_strings.play_song)
		endif
	endif
endscript

script net_career_build_host_progression 
	host_progression = {}
	getplayerinfo ($g_leader_player_num) controller
	get_savegame_from_controller controller = <controller>
	getglobaltags savegame = <savegame> career_progression_tags out = career_tags
	addparam structure_name = host_progression name = career_progression_tags value = <career_tags>
	get_current_band_name savegame = <savegame>
	addparam structure_name = host_progression name = progression_name value = <band_name>
	<unlock_index> = 0
	getarraysize \{$quest_progression_unlocks}
	<unlocks_size> = <array_size>
	begin
	<inner_index> = 0
	getarraysize ($quest_progression_unlocks [<unlock_index>])
	<unlock_array_size> = <array_size>
	begin
	<chapter> = ($quest_progression_unlocks [<unlock_index>] [<inner_index>])
	<chapter_name> = ($<chapter>.name)
	formattext checksumname = chapter_unlock '%s' s = <chapter_name>
	default_net_career_tags = {
		chapter_unlocked_this_session = 0
		encore_unlocked_this_session = 0
		encore_completed_this_session = 0
		chapter_dominated_this_session = 0
	}
	getglobaltags savegame = <savegame> <chapter_unlock> out = chapter_tags
	<chapter_tags> = (<chapter_tags> + <default_net_career_tags>)
	addparam structure_name = host_progression name = <chapter_unlock> value = <chapter_tags>
	<songs_array> = ($<chapter>.songs)
	getarraysize <songs_array>
	<song_array_size> = <array_size>
	<song_index> = 0
	begin
	<song> = (<songs_array> [<song_index>])
	format_career_song_gigtag chapter_name = <chapter_name> song = <song>
	getglobaltags savegame = <savegame> <song_gigtag> out = song_tags
	addparam structure_name = host_progression name = <song_gigtag> value = <song_tags>
	<song_index> = (<song_index> + 1)
	repeat <song_array_size>
	<song> = ($<chapter>.encore)
	if (<song> != none)
		format_career_song_gigtag chapter_name = <chapter_name> song = <song>
		getglobaltags savegame = <savegame> <song_gigtag> out = song_tags
		addparam structure_name = host_progression name = <song_gigtag> value = <song_tags>
	endif
	<inner_index> = (<inner_index> + 1)
	repeat <unlock_array_size>
	<unlock_index> = (<unlock_index> + 1)
	repeat <unlocks_size>
	getarraysize \{$levelzonearray}
	<zone_index> = 0
	begin
	<venue> = ($levelzonearray [<zone_index>])
	if NOT structurecontains structure = ($levelzones.<venue>) debug_only
		<zone> = ($levelzones.<venue>.zone)
		getglobaltags savegame = <savegame> venue_intro_flags
		if structurecontains structure = <...> <zone>
			<venue_flag> = (<...>.<zone>)
			addparam name = <zone> value = <venue_flag> structure_name = new_venue_struct
			addparam structure_name = host_progression name = venue_intro_flags value = <new_venue_struct>
		endif
		getglobaltags savegame = <savegame> celeb_intro_flags
		if structurecontains structure = <...> <zone>
			<celeb_flag> = (<...>.<zone>)
			addparam name = <zone> value = <celeb_flag> structure_name = new_celeb_struct
			addparam structure_name = host_progression name = celeb_intro_flags value = <new_celeb_struct>
		endif
		formattext checksumname = venue_checksum 'venue_%s' s = ($levelzones.<venue>.name)
		getglobaltags savegame = <savegame> <venue_checksum> out = venue_tags
		addparam structure_name = host_progression name = <venue_checksum> value = <venue_tags>
	endif
	<zone_index> = (<zone_index> + 1)
	repeat <array_size>
	getglobaltags unlocked_profiles savegame = <savegame>
	addparam structure_name = host_progression name = unlocked_profiles value = <unlocked_profiles>
	change g_net_career_progression = <host_progression>
endscript

script net_career_host_update 
	begin
	ui_event_get_stack
	host_ui_state = `default`
	switch (<stack> [0].base_name)
		case 'quest_map'
		<host_ui_state> = quest_map
		case 'quest_map_giglist'
		switch ($current_chapter)
			case quest_chapter_johnny
			<host_ui_state> = quest_map_giglist_johnny
			case quest_chapter_newfemale
			<host_ui_state> = quest_map_giglist_newfemale
			case quest_chapter_judy
			<host_ui_state> = quest_map_giglist_judy
			case quest_chapter_newmale
			<host_ui_state> = quest_map_giglist_newmale
			case quest_chapter_pandora
			<host_ui_state> = quest_map_giglist_pandora
			case quest_chapter_lars
			<host_ui_state> = quest_map_giglist_lars
			case quest_chapter_casey
			<host_ui_state> = quest_map_giglist_casey
			case quest_chapter_axel
			<host_ui_state> = quest_map_giglist_axel
			case quest_chapter_demigod
			<host_ui_state> = quest_map_giglist_demigod
		endswitch
		case 'quest_band_select'
		<host_ui_state> = quest_band_select
		case 'quest_unlocks'
		case 'unlock_tracker'
		<host_ui_state> = unlock_screen
	endswitch
	get_quest_final_battle_band
	data_to_send = {
		menu_state = <host_ui_state>
		quest_final_battle_band = <quest_final_battle_band>
	}
	sendstructure callback = net_career_update_host_state data_to_send = {<data_to_send>}
	wait \{20
		frames}
	repeat
endscript

script get_quest_final_battle_band 
	array = [none none none none none none none none]
	i = 0
	begin
	if (<i> < 4)
		hero = ($g_quest_band_a [<i>])
	else
		hero = ($g_quest_band_b [(<i> -4)])
	endif
	switch (<hero>)
		case gh_rocker_johnny_2
		chapter_global = quest_chapter_johnny
		case gh_rocker_echo_tesla_2
		chapter_global = quest_chapter_newfemale
		case gh_rocker_judy_2
		chapter_global = quest_chapter_judy
		case gh_rocker_austin_tejas_2
		chapter_global = quest_chapter_newmale
		case gh_rocker_pandora_2
		chapter_global = quest_chapter_pandora
		case gh_rocker_lars_2
		chapter_global = quest_chapter_lars
		case gh_rocker_casey_2
		chapter_global = quest_chapter_casey
		case gh_rocker_axel_2
		chapter_global = quest_chapter_axel
		default
		chapter_global = none
	endswitch
	setarrayelement arrayname = array index = <i> newvalue = <chapter_global> resolveglobals = 0
	<i> = (<i> + 1)
	repeat 8
	return quest_final_battle_band = <array>
endscript

script net_career_update_host_state 
	ui_event_get_stack
	switch (<stack> [0].base_name)
		case 'quest_map'
		parent_id = questmapid
		case 'quest_map_giglist'
		parent_id = questmapgiglistid
	endswitch
	if screenelementexists id = <parent_id>
		if ($g_net_career_display_save_warning = 1)
			state = save_warning
		else
			state = <menu_state>
		endif
		<parent_id> :se_setprops net_dialog_text = ($host_status_strings.<state>)
	endif
	ui_event_get_top
	if (<base_name> = 'quest_band_select')
		net_career_client_refresh_band_select quest_final_battle_band = <quest_final_battle_band>
	endif
endscript

script net_career_client_play_song \{encore_anim_flag = 0}
	params = {
		net_song_name = <var_1>
		chapter_name = <var_2>
		host_obj_id = <int_var>
		this_chapter_name = <this_chapter_name>
		score_attribute_level = <score_attribute_level>
	}
	change g_chapter_encore_anim_flag = <encore_anim_flag>
	if (<var_2> = quest_chapter_finale)
		<params> = (<params> + {quest_final_battle_band = <quest_final_battle_band> final_battle_fast_intro = <final_battle_fast_intro>})
	endif
	spawnscriptnow net_career_proceed_to_gameplay params = <params>
endscript

script ui_quest_map_client_attempt_giglist_choose 
endscript

script net_career_proceed_to_gameplay \{net_song_name = !q1768515945
		chapter_name = !q1768515945}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	if ishost
		getplayerinfo ($g_net_leader_player_num) net_obj_id
		getplayerinfo ($g_net_leader_player_num) score_attribute_level
		data_to_send = {
			menu_state = play_song
			var_1 = <net_song_name>
			var_2 = <chapter_name>
			int_var = <net_obj_id>
			score_attribute_level = <score_attribute_level>
			encore_anim_flag = <encore_anim_flag>
		}
		if (<chapter_name> = quest_chapter_finale)
			get_quest_final_battle_band
			<data_to_send> = (<data_to_send> + {quest_final_battle_band = <quest_final_battle_band> final_battle_fast_intro = <final_battle_fast_intro>})
		endif
		sendstructure callback = net_career_client_play_song data_to_send = <data_to_send>
	else
		host_chapter_name = <chapter_name>
		ui_event_wait_for_safe
		playlist_clear
		<venue> = ($<host_chapter_name>.venue)
		change current_level = <venue>
		playlist_debugprint
		if ui_event_is_top_popup
			generic_event_back
			ui_event_wait_for_safe
		endif
		audio_ui_menu_music_off
		songlist_kill_cycle_song_previews
		if (<host_chapter_name> = quest_chapter_finale)
			<go_to_state> = uistate_quest_band_select
		else
			<go_to_state> = uistate_quest_map_giglist
		endif
		ui_event_get_top
		if (<base_name> = 'quest_unlocks')
			ui_quest_unlocks_continue \{next_state_name = uistate_quest_map
				next_state_event = menu_back
				next_state_params = {
					net_play_song = 1
				}}
			ui_event_wait_for_safe
			ui_event {
				event = menu_change
				data = {
					state = <go_to_state>
					chapter_name = <host_chapter_name>
					net_play_song = 1
				}
			}
		elseif (<base_name> = 'unlock_tracker')
			generic_event_back
			ui_event_wait_for_safe
			ui_quest_unlocks_continue \{next_state_name = uistate_quest_map
				next_state_event = menu_back
				next_state_params = {
					net_play_song = 1
				}}
			ui_event_wait_for_safe
			ui_event {
				event = menu_change
				data = {
					state = <go_to_state>
					chapter_name = <host_chapter_name>
					net_play_song = 1
				}
			}
		elseif ui_event_exists_in_stack \{name = 'quest_map_giglist'}
			ui_event {
				event = menu_replace
				data = {
					state = <go_to_state>
					chapter_name = <host_chapter_name>
					net_play_song = 1
				}
			}
		elseif (<base_name> = 'quest_map')
			ui_event {
				event = menu_change
				data = {
					state = <go_to_state>
					chapter_name = <host_chapter_name>
					net_play_song = 1
				}
			}
		elseif (<base_name> = 'quest_band_select')
			if NOT (<host_chapter_name> = quest_chapter_finale)
				generic_event_back
				ui_event_wait_for_safe
				ui_event {
					event = menu_change
					data = {
						state = <go_to_state>
						chapter_name = <host_chapter_name>
						net_play_song = 1
					}
				}
			endif
		else
			ui_event_get_stack
			printstruct <...>
			scriptassert \{'unknown UI state while trying to launch online career game'}
		endif
		ui_event_wait_for_safe
		set_song = 1
		if (<net_song_name> = $<host_chapter_name>.encore)
			temp_struct = ($g_net_career_progression.career_progression_tags + {encore_ready = 1})
			appendstruct struct = g_net_career_progression field = career_progression_tags params = <temp_struct> globalstruct
			format_career_song_gigtag chapter_name = ($<host_chapter_name>.name) song = <net_song_name>
			<stars> = ($g_net_career_progression.<song_gigtag>.stars)
			if (<stars> = 0)
				quest_progression_add_transformation_songs chapter_global = <host_chapter_name>
				<set_song> = 0
			endif
		elseif (<host_chapter_name> = quest_chapter_finale)
			<set_song> = 0
		endif
		change current_chapter = <host_chapter_name>
		<current_chapter> = ($current_chapter)
		if (<host_chapter_name> = quest_chapter_finale)
			change suppress_finalbattle_from_band_select = <final_battle_fast_intro>
			playlist_clear
			getarraysize ($<current_chapter>.songs)
			<songs_index> = 0
			begin
			<song> = ($<current_chapter>.songs [<songs_index>])
			playlist_addsong song = <song> insert_at = back
			<songs_index> = (<songs_index> + 1)
			repeat <array_size>
			createscreenelement {
				parent = root_window
				id = questmapgiglistid
				type = descinterface
				desc = 'career_gig_select'
				alpha = 1.0
				z_priority = 50
				background_texture = gigselect_illo_final
				career_gig_select_action_safe_container_alpha = 0.0
				loading_special_2_alpha = 1.0
				loading_special_title_2_text = (($<current_chapter>).load_screen_title)
				loading_special_body_2_text = (($<current_chapter>).load_screen_text)
				loading_text_frame_alpha = 1.0
			}
			spawnscriptnow \{audio_play_loc_vo_manually
				params = {
					stream_name = 'UI_Band_Chosen'
				}}
			getarraysize <quest_final_battle_band>
			<i> = 0
			begin
			<arr_chapter_global> = (<quest_final_battle_band> [<i>])
			<rocker> = ($<arr_chapter_global>.power_rocker)
			if (<i> < 4)
				setarrayelement arrayname = g_quest_band_a globalarray index = <i> newvalue = <rocker>
			else
				setarrayelement arrayname = g_quest_band_b globalarray index = (<i> - 4) newvalue = <rocker>
			endif
			<i> = (<i> + 1)
			repeat <array_size>
			ui_quest_band_select_change_band \{band_num = 1}
		else
			set_net_character_ids character_id = ($<host_chapter_name>.rocker_id) host_obj_id = <host_obj_id> score_attribute_level = <score_attribute_level>
		endif
		if (<set_song> = 1)
			playlist_setcurrentsong song = <net_song_name>
		endif
		ui_event_add_params \{keep_ui_for_loading_screen = 1}
		create_empty_loading_screen \{use_ui_element = questmapgiglistid}
		change \{g_quest_recent_unlocked_awards = [
			]}
	endif
	generic_event_choose \{state = uistate_play_song}
endscript

script set_net_character_ids \{character_id = !q1768515945
		host_obj_id = !i1768515945
		score_attribute_level = !i1768515945}
	getnumplayersingame
	getfirstplayer
	begin
	setplayerinfo <player> character_id = <character_id>
	setplayerinfo <player> score_attribute_level = <score_attribute_level>
	getnextplayer player = <player>
	repeat <num_players>
endscript

script ui_net_career_transformation_continue 
	stop_music_post_encore_when_load_is_done
	if console_is_net_career_client
		net_career_prompt_client_no_continue
	else
		ui_sfx \{menustate = generic
			uitype = select}
		launchevent \{type = unfocus
			target = questtransformationinfo}
		sync_host_and_client \{callback = ui_quest_transformation_continue}
	endif
endscript

script ui_net_quest_breakdown_continue 
	if console_is_net_career_client
		net_career_prompt_client_no_continue
	else
		sendstructure \{callback = ui_quest_transformation_continue
			data_to_send = {
				none
			}}
		ui_quest_transformation_continue
	endif
endscript

script net_career_prompt_client_no_continue 
endscript

script net_career_quit_song \{quit_type = !q1768515945}
	if ishost
		if (<quit_type> = newgig)
			generic_event_back \{nosound
				state = uistate_quest_map}
		elseif (<quit_type> = newsong)
			generic_event_back nosound state = uistate_quest_map_giglist data = {chapter_name = ($current_chapter)}
		elseif (<quit_type> = bandlobby)
			generic_event_back \{nosound
				state = uistate_band_lobby}
		endif
	else
		if ((<quit_type> = newgig) || (<quit_type> = newsong))
			generic_event_back \{nosound
				state = uistate_quest_map}
		else
			generic_event_back \{nosound
				state = uistate_band_lobby}
		endif
	endif
endscript

script net_career_continue_rush_set \{song = !i1768515945}
	ui_event_wait_for_safe
	if ui_event_is_top_popup
		generic_event_back
		ui_event_wait_for_safe
	endif
	audio_ui_menu_music_off
	songlist_kill_cycle_song_previews
	ui_event_get_top
	if ui_event_exists_in_stack \{name = 'quest_map_giglist'}
		generic_event_back \{nosound
			state = uistate_quest_map}
	endif
	ui_event_wait_for_safe
	change \{continue_rush_set_transition = fastintro}
	switch <song>
		case 1
		change \{continue_rush_set_transition = none}
		<song_array> = $g_rush_setlist
		case 2
		<song_array> = [rush2112p2 rush2112p3 rush2112p4 rush2112p5 rush2112p6 rush2112p7]
		case 3
		<song_array> = [rush2112p3 rush2112p4 rush2112p5 rush2112p6 rush2112p7]
		case 4
		<song_array> = [rush2112p4 rush2112p5 rush2112p6 rush2112p7]
		case 5
		<song_array> = [rush2112p5 rush2112p6 rush2112p7]
		case 6
		<song_array> = [rush2112p6 rush2112p7]
		case 7
		<song_array> = [rush2112p7]
		default
		scriptassert 'continue_rush_set unexpected value %i for rush_set_current_song' i = <song>
	endswitch
	playlist_clear
	playlist_addsongarray song_array = <song_array>
	change \{current_chapter = quest_chapter_midboss}
	change current_level = (($quest_chapter_midboss).venue)
	createscreenelement {
		parent = root_window
		id = questmapgiglistid
		type = descinterface
		desc = 'career_gig_select'
		alpha = 1.0
		z_priority = 50
		background_texture = gigselect_illo_guitar
		career_gig_select_action_safe_container_alpha = 0.0
		loading_special_alpha = 1.0
		loading_special_title_text = (($quest_chapter_midboss).load_screen_title)
		loading_special_body_text = (($quest_chapter_midboss).load_screen_text)
		loading_text_frame_alpha = 1.0
	}
	ui_event_add_params \{keep_ui_for_loading_screen = 1}
	create_empty_loading_screen \{use_ui_element = questmapgiglistid}
	generic_event_choose \{state = uistate_play_song}
endscript

script net_career_client_refresh_band_select \{quest_final_battle_band = !a1768515945}
	if screenelementexists \{id = questbandselectid}
		if questbandselectid :desc_resolvealias \{name = alias_band_select_menu
				param = band_select_menu}
			<remaining_band_members> = [
				quest_chapter_newmale
				quest_chapter_axel
				quest_chapter_johnny
				quest_chapter_pandora
				quest_chapter_lars
				quest_chapter_judy
				quest_chapter_newfemale
				quest_chapter_casey
			]
			<rocker_icons> = {
				quest_chapter_newmale = final_char_dude_icon
				quest_chapter_axel = final_char_axel_icon
				quest_chapter_johnny = final_char_johnny_icon
				quest_chapter_pandora = final_char_pandora_icon
				quest_chapter_lars = final_char_lars_icon
				quest_chapter_judy = final_char_judy_icon
				quest_chapter_newfemale = final_char_chicka_icon
				quest_chapter_casey = final_char_casey_icon
			}
			getscreenelementchildren id = <band_select_menu>
			getarraysize <children>
			<children_size> = <array_size>
			<child_idx> = 0
			begin
			resolvescreenelementid id = {<band_select_menu> child = <child_idx>}
			if NOT (<quest_final_battle_band> [<child_idx>] = none)
				<quest_chapter> = (<quest_final_battle_band> [<child_idx>])
				<rocker_id> = ($<quest_chapter>.power_rocker)
				<rocker_hero_info> = ($<quest_chapter>.hero_info)
				<rockers_name_text> = ($<rocker_hero_info>.character_name)
				<rocker_power_text> = ($<rocker_hero_info>.character_power)
				<rocker_icon> = (<rocker_icons>.<quest_chapter>)
				if (<child_idx> < 4)
					<selected_state> = band_one_added
				else
					<selected_state> = band_two_added
				endif
				(<children> [<child_idx>]) :desc_applyscene name = <selected_state> time = 0
				if (<child_idx> < 4)
					ui_quest_band_select_set_band_head band = 1 slot = (<child_idx> + 1) texture = <rocker_icon>
				else
					ui_quest_band_select_set_band_head band = 2 slot = ((<child_idx> - 4) + 1) texture = <rocker_icon>
				endif
			else
				<quest_chapter> = (<remaining_band_members> [0])
				<rocker_id> = ($<quest_chapter>.power_rocker)
				<rocker_hero_info> = ($<quest_chapter>.hero_info)
				<rockers_name_text> = ($<rocker_hero_info>.character_name)
				<rocker_power_text> = ($<rocker_hero_info>.character_power)
				<rocker_icon> = (<rocker_icons>.<quest_chapter>)
				if (<child_idx> < 4)
					ui_quest_band_select_set_band_head band = 1 slot = (<child_idx> + 1) texture = final_nochar_icon
				else
					ui_quest_band_select_set_band_head band = 2 slot = ((<child_idx> - 4) + 1) texture = final_nochar_icon
				endif
				<selected_state> = unselected
			endif
			(<children> [<child_idx>]) :se_setprops {
				character_head_texture = <rocker_icon>
				char_name_text = <rockers_name_text>
				char_def_text = <rocker_power_text>
				dims = (800.0, 62.0)
				autosizedims = true
				tags = {state = <selected_state> rocker_id = <rocker_id> char_name_text = <rockers_name_text> char_def_text = <rocker_power_text> character_head_texture = <rocker_icon>}
			}
			ui_quest_band_select_reset_props id = <resolved_id>
			removearrayelement array = <remaining_band_members> element = (<quest_chapter>)
			<remaining_band_members> = <array>
			<child_idx> = (<child_idx> + 1)
			repeat <children_size>
		endif
	endif
endscript

script net_career_back_to_lobby 
	ui_event_wait_for_safe
	ui_event \{event = menu_back
		state = uistate_band_lobby}
endscript

script net_career_flip_save_warning_flag 
	setscriptcannotpause
	change \{g_net_career_display_save_warning = 1}
	wait \{10
		seconds}
	change \{g_net_career_display_save_warning = 0}
endscript
