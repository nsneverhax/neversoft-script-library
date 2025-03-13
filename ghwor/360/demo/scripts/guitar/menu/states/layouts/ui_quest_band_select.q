g_quest_band_a = [
	none
	none
	none
	none
]
g_quest_band_b = [
	none
	none
	none
	none
]
g_finale_battle_vo_played = 0

script ui_init_quest_band_select 
	change \{g_quest_band_a = [
			none
			none
			none
			none
		]}
	change \{g_quest_band_b = [
			none
			none
			none
			none
		]}
endscript

script ui_create_quest_band_select \{from_fail_song = 0}
	if gotparam \{from_fail_song}
		ui_init_quest_band_select
	endif
	universal_help_display_help_check help_context = final_battle device_num = ($primary_controller)
	ui_sfx \{menustate = generic
		uitype = select}
	audio_ui_enter_band_select
	if (<show_help_page> = 1)
		hide_glitch \{num_frames = 8}
		ui_event_wait {
			event = menu_change
			state = uistate_universal_help
			data = {
				next_state_event = menu_back
				next_state_name = uistate_quest_band_select
				next_state_params = {
					chapter_name = quest_chapter_finale
				}
				help_global_index = <help_index>
				device_num = ($primary_controller)
			}
		}
		return
	endif
	spawn_player_drop_listeners \{drop_player_script = band_select_drop_player
		end_game_script = band_select_end_game}
	if console_is_net_career_client
		event_handlers = [
			{pad_choose ui_sfx params = {menustate = recruitwarrior uitype = select}}
			{pad_choose net_career_prompt_client_no_continue}
			{pad_back generic_event_back}
			{pad_back ui_sfx params = {menustate = recruitwarrior uitype = back}}
		]
	else
		event_handlers = [
			{pad_choose ui_sfx params = {menustate = recruitwarrior uitype = select}}
			{pad_choose ui_quest_band_select_continue params = {from_fail_song = <from_fail_song>}}
			{pad_choose ui_quest_band_select_choose params = {device_num = $primary_controller}}
			{pad_l1 ui_quest_band_select_reset_bands}
			{pad_back generic_event_back}
			{pad_back ui_sfx params = {menustate = recruitwarrior uitype = back}}
		]
	endif
	createscreenelement {
		parent = root_window
		id = questbandselectid
		type = descinterface
		desc = 'band_selection'
		event_handlers = <event_handlers>
		exclusive_device = ($primary_controller)
	}
	questbandselectid :desc_resolvealias \{name = alias_band_select_menu
		param = band_select_menu}
	if console_is_net_career_client
		event_handlers = [
			{pad_back generic_event_back}
			{pad_back ui_sfx params = {menustate = recruitwarrior uitype = back}}
		]
	else
		event_handlers = [
			{pad_up ui_quest_band_select_move params = {savegame = ($primary_controller) dir = up}}
			{pad_down ui_quest_band_select_move params = {savegame = ($primary_controller) dir = down}}
			{pad_back generic_event_back}
			{pad_back ui_sfx params = {menustate = recruitwarrior uitype = back}}
			{pad_l1 ui_quest_band_select_reset_bands}
		]
	endif
	<band_select_menu> :se_setprops {event_handlers = <event_handlers>}
	<quest_globals> = [
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
	<quest_chapter> = (<quest_globals> [<child_idx>])
	<rocker_id> = ($<quest_chapter>.power_rocker)
	<rocker_hero_info> = ($<quest_chapter>.hero_info)
	<rockers_name_text> = ($<rocker_hero_info>.character_transformation_fullname)
	<rocker_power_text> = ($<rocker_hero_info>.character_power2)
	<rocker_icon> = (<rocker_icons>.<quest_chapter>)
	(<children> [<child_idx>]) :desc_applyscene name = unselected time = 0
	if NOT console_is_net_career_client
		(<children> [<child_idx>]) :se_setprops {
			event_handlers = [
				{focus ui_quest_band_select_focus}
				{unfocus ui_quest_band_select_unfocus}
				{pad_choose ui_quest_band_select_choose params = {device_num = $primary_controller}}
				{pad_option generic_event_choose params = {state = uistate_quest_band_select_power_details data = {is_popup chapter_name = <quest_chapter>}}}
				{pad_option ui_sfx params = {menustate = generic uitype = select}}
			]
		}
	endif
	(<children> [<child_idx>]) :se_setprops {
		character_head_texture = <rocker_icon>
		char_name_text = <rockers_name_text>
		char_def_text = <rocker_power_text>
		tags = {state = unselected rocker_id = <rocker_id> char_name_text = <rockers_name_text> char_def_text = <rocker_power_text> character_head_texture = <rocker_icon>}
	}
	if (<child_idx> < 4)
		ui_quest_band_select_set_band_head band = 1 slot = (<child_idx> + 1) texture = final_nochar_icon
	else
		ui_quest_band_select_set_band_head band = 2 slot = ((<child_idx> - 4) + 1) texture = final_nochar_icon
	endif
	<child_idx> = (<child_idx> + 1)
	repeat <children_size>
	ui_quest_band_select_setup_helpers
	if (<from_fail_song> = 1)
		ui_quest_band_select_reset_bands
	endif
	if innetgame
		net_career_setup_ui_stream \{parent = questbandselectid}
	endif
	if ($g_finale_battle_vo_played = 0)
		change \{g_finale_battle_vo_played = 1}
		spawnscriptnow \{audio_play_loc_vo_manually
			params = {
				stream_name = 'UI_Band_Choose'
				stream_to_stop = 'Map_FB_Intro'
			}}
	endif
	assignalias id = <band_select_menu> alias = current_menu
endscript

script ui_destroy_quest_band_select 
	clean_up_user_control_helpers
	audio_ui_exit_band_select
	if screenelementexists \{id = questbandselectid}
		destroyscreenelement \{id = questbandselectid}
	endif
endscript

script ui_return_quest_band_select 
	ui_quest_band_select_setup_helpers
	questbandselectid :desc_resolvealias \{name = alias_band_select_menu
		param = band_select_menu}
	assignalias id = <band_select_menu> alias = current_menu
	launchevent \{type = unfocus
		target = current_menu}
endscript

script ui_quest_band_select_setup_helpers \{state = choosing}
	clean_up_user_control_helpers
	if NOT console_is_net_career_client
		if (<state> = choosing)
			if ($g_quest_band_b [0] = none)
				add_user_control_helper \{text = qs(0x7e8907d6)
					button = green}
			else
				add_user_control_helper \{text = qs(0x3fbf3e39)
					button = green}
			endif
		else
			add_user_control_helper \{text = qs(0x384a81dd)
				button = green}
		endif
	endif
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red}
	if NOT console_is_net_career_client
		if (<state> = choosing)
			if ($g_quest_band_b [0] = none)
				add_user_control_helper \{text = qs(0xa89b795e)
					button = blue}
			endif
		endif
		if NOT ($g_quest_band_a [0] = none)
			add_user_control_helper \{text = qs(0xc79e6497)
				button = orange}
		endif
	endif
endscript

script ui_quest_band_select_reset_props \{id = !q1768515945}
	<id> :getsingletag char_name_text
	<id> :getsingletag char_def_text
	<id> :getsingletag character_head_texture
	<id> :se_setprops char_name_text = <char_name_text> char_def_text = <char_def_text> character_head_texture = <character_head_texture>
endscript

script ui_quest_band_select_focus 
	gettags
	if (<state> = unselected)
		desc_applyscene \{name = selected
			time = 0}
		settags \{state = selected}
		autosizedims = false
		obj_getid
		ui_quest_band_select_reset_props id = <objid>
	endif
endscript

script ui_quest_band_select_unfocus 
	gettags
	if (<state> = selected)
		desc_applyscene \{name = unselected
			time = 0}
		settags \{state = unselected}
		autosizedims = true
		obj_getid
		ui_quest_band_select_reset_props id = <objid>
	endif
endscript

script ui_quest_band_select_move 
	questbandselectid :desc_resolvealias \{name = alias_band_select_menu
		param = band_select_menu}
	<band_select_menu> :menu_getselectedindex
	ui_quest_band_select_find_open_slot
	if (<dir> = up)
		if (<selected_index> > <slot_index>)
			<selected_index> = (<selected_index> - 1)
			ui_sfx \{menustate = recruitwarrior
				uitype = scrollup}
		endif
	else
		if (<selected_index> + 1 < 8)
			<selected_index> = (<selected_index> + 1)
			ui_sfx \{menustate = recruitwarrior
				uitype = scrolldown}
		endif
	endif
endscript

script ui_quest_band_select_choose \{device_num = !i1768515945}
	gettags
	if ui_quest_band_select_find_open_slot fill_with = <rocker_id>
		ui_quest_band_select_set_band_head band = 1 slot = (<slot_index> + 1) texture = <character_head_texture>
	endif
	if (<slot_index> < 4)
		questbandselectid :desc_resolvealias \{name = alias_band_select_menu
			param = band_select_menu}
		<band_select_menu> :menu_getselectedindex
		<band_select_menu> :menu_setitemindex index = <selected_index> newindex = <slot_index>
		launchevent \{type = unfocus
			target = current_menu}
		if (<selected_index> <= <slot_index>)
			<selected_index> = (<slot_index> + 1)
		endif
		launchevent type = focus target = current_menu data = {child_index = <selected_index>}
		desc_applyscene \{name = band_one_added
			time = 0}
		settags \{state = band_one_added}
		se_setprops \{not_focusable}
		obj_getid
		ui_quest_band_select_reset_props id = <objid>
		ui_sfx \{menustate = recruitwarrior
			uitype = addtoplaylist}
	endif
	if (<slot_index> = 3)
		ui_quest_band_select_setup_helpers
		launchevent \{type = unfocus
			target = current_menu}
		launchevent \{type = focus
			target = questbandselectid}
		ui_quest_band_select_setup_helpers \{state = ready}
		ui_quest_band_select_set_band2_member \{menu_index = 4
			array_index = 0}
		ui_quest_band_select_set_band2_member \{menu_index = 5
			array_index = 1}
		ui_quest_band_select_set_band2_member \{menu_index = 6
			array_index = 2}
		ui_quest_band_select_set_band2_member \{menu_index = 7
			array_index = 3}
	endif
	if NOT (<slot_index> = 4)
		ui_quest_band_select_setup_helpers
	endif
endscript

script ui_quest_band_select_continue 
	launchevent \{type = unfocus
		target = questbandselectid}
	clean_up_user_control_helpers
	ui_quest_band_select_change_band \{band_num = 1}
	<current_chapter> = ($current_chapter)
	playlist_clear
	getarraysize ($<current_chapter>.songs)
	<songs_index> = 0
	begin
	<song> = ($<current_chapter>.songs [<songs_index>])
	playlist_addsong song = <song> insert_at = back
	<songs_index> = (<songs_index> + 1)
	repeat <array_size>
	spawnscriptnow \{spawned_to_battle_line_instance_limiting}
	wait \{1.2
		second}
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
	ui_event_add_params \{keep_ui_for_loading_screen = 1}
	create_empty_loading_screen \{use_ui_element = questmapgiglistid}
	if (<from_fail_song> = 1)
		change \{suppress_finalbattle_from_band_select = 1}
	endif
	if innetgame
		questbandselectid :obj_killspawnedscript \{name = net_career_host_update}
		net_career_proceed_to_gameplay chapter_name = <current_chapter> net_song_name = final_battle final_battle_fast_intro = ($suppress_finalbattle_from_band_select)
	else
		generic_event_choose \{state = uistate_play_song}
	endif
endscript

script spawned_to_battle_line_instance_limiting 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	spawnscriptnow \{audio_play_loc_vo_manually
		params = {
			stream_name = 'UI_Band_Chosen'
		}}
	wait \{1.2
		seconds}
endscript

script ui_quest_band_get_gender 
	gender = male
	switch <member>
		case gh_rocker_johnny_2
		case gh_rocker_austin_tejas_2
		case gh_rocker_lars_2
		case gh_rocker_axel_2
		gender = male
		case gh_rocker_echo_tesla_2
		case gh_rocker_judy_2
		case gh_rocker_pandora_2
		case gh_rocker_casey_2
		gender = female
	endswitch
	return gender = <gender>
endscript

script ui_quest_band_select_change_band \{band_num = !i1768515945
		rocker_part = guitarist}
	<band> = error_assert
	if (<band_num> = 1)
		<band> = g_quest_band_a
	elseif (<band_num> = 2)
		<band> = g_quest_band_b
	endif
	swap_index = 1
	if (<rocker_part> = vocalist)
		swap_index = 0
	endif
	band_array = ($<band>)
	index = 0
	begin
	ui_quest_band_get_gender member = (<band_array> [<index>])
	if (<gender> = male)
		temp = (<band_array> [<index>])
		setarrayelement arrayname = band_array index = <index> newvalue = (<band_array> [<swap_index>])
		setarrayelement arrayname = band_array index = <swap_index> newvalue = <temp>
		break
	endif
	index = (<index> + 1)
	repeat 4
	change structurename = rockerband_gh_rocker_demigod power_rocker = (<band_array> [0])
	change structurename = rockerband_gh_rocker_demigod power_male1 = (<band_array> [1])
	change structurename = rockerband_gh_rocker_demigod power_male2 = (<band_array> [2])
	change structurename = rockerband_gh_rocker_demigod power_female1 = (<band_array> [3])
endscript

script ui_quest_band_select_reset_bands 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	if ($g_quest_band_a [0] = none)
		return
	endif
	if screenelementexists id = <current_menu>
		launchevent \{type = unfocus
			target = current_menu}
	endif
	launchevent \{type = unfocus
		target = questbandselectid}
	ui_init_quest_band_select
	ui_sfx \{menustate = recruitwarrior
		uitype = remove}
	ui_event \{event = menu_refresh}
endscript

script ui_quest_band_select_find_open_slot \{fill_with = none}
	<slot_index> = 0
	begin
	if ($g_quest_band_a [<slot_index>] = none)
		if NOT (<fill_with> = none)
			setarrayelement arrayname = g_quest_band_a globalarray index = <slot_index> newvalue = <fill_with>
		endif
		return true slot_index = <slot_index>
	endif
	<slot_index> = (<slot_index> + 1)
	repeat 4
	return false slot_index = <slot_index>
endscript

script ui_quest_band_select_set_band2_member \{menu_index = !i1768515945
		array_index = !i1768515945
		selected = 1}
	questbandselectid :desc_resolvealias \{name = alias_band_select_menu
		param = band_select_menu}
	resolvescreenelementid id = {<band_select_menu> child = <menu_index>}
	<resolved_id> :getsingletag rocker_id
	<resolved_id> :getsingletag character_head_texture
	if (<selected> = 1)
		<resolved_id> :desc_applyscene name = band_two_added time = 0
		<resolved_id> :settags state = selected
		ui_quest_band_select_reset_props id = <resolved_id>
		setarrayelement arrayname = g_quest_band_b globalarray index = <array_index> newvalue = <rocker_id>
		ui_quest_band_select_set_band_head band = 2 slot = (<array_index> + 1) texture = <character_head_texture>
	else
		<resolved_id> :desc_applyscene name = unselected time = 0
		<resolved_id> :settags state = unselected
		ui_quest_band_select_reset_props id = <resolved_id>
		setarrayelement arrayname = g_quest_band_b globalarray index = <array_index> newvalue = none
		ui_quest_band_select_set_band_head band = 2 slot = (<array_index> + 1) texture = final_nochar_icon
	endif
endscript

script ui_quest_band_select_set_band_head \{band = !i1768515945
		slot = !i1768515945
		texture = !q1768515945}
	<band_text> = ''
	if (<band> = 2)
		<band_text> = 'b'
	endif
	formattext checksumname = character_head 'character_head0%d%b_texture' d = <slot> b = <band_text>
	props = {}
	addparam structure_name = props name = <character_head> value = <texture>
	questbandselectid :se_setprops <props>
endscript

script ui_quest_band_get_head_texture \{character_name_nl = 0x69696969
		level = 2}
	if (<character_name_nl> = 'newmale')
		<character_name_nl> = 'dude'
	elseif (<character_name_nl> = 'newfemale')
		<character_name_nl> = 'chicka'
	elseif (<character_name_nl> = 'demigod')
		<character_name_nl> = 'Ax'
	elseif (<character_name_nl> = 'ampzilla')
		<character_name_nl> = 'Ax'
	endif
	formattext checksumname = character_trans_texture 'Car_%d0%e_ICON' d = <character_name_nl> e = <level>
	return head_texture = <character_trans_texture>
endscript

script band_select_drop_player 
	killspawnedscript \{name = ui_quest_band_select_continue}
	ui_event_wait_for_safe
	band_lobby_drop_player <...>
endscript

script band_select_end_game 
	if screenelementexists \{id = questbandselectid}
		launchevent \{type = unfocus
			target = questbandselectid}
	endif
	killspawnedscript \{name = ui_quest_band_select_continue}
	ui_event_wait_for_safe
	band_lobby_end_game <...>
endscript
