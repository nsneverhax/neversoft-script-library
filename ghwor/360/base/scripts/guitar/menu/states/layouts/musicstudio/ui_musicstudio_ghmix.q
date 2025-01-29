
script ui_create_musicstudio_ghmix \{from_song = 0}
	pushunsafeforshutdown \{context = ghmix
		Type = unchecked}
	CreateScreenElement \{parent = root_window
		id = musicstudio_ghmix
		Type = descinterface
		desc = 'musicstudio_ghmix'
		Pos = (0.0, 0.0)
		menu_header_cont_alpha = 1.0
		menu_header_text_text = qs(0x79dfdd25)}
	musicstudio_show_nowbar
	if musicstudio_ghmix :desc_resolvealias \{Name = alias_ghmix_menu
			param = ghmix_menu}
		<ghmix_menu> :se_setprops alpha = 1.0 Pos = (756.0, 31.0)
		<ghmix_menu> :se_setprops tip_alpha = 1 tip_text = qs(0x03ac90f0) time = 0
		musicstudio_mainobj :musicstudio_getmainplayercontroller
		musicstudio_mainobj :musicstudio_getmainplayeridindex
		musicstudio_mainobj :musicstudio_getplayerfromindex Player = <playerid_index>
		setplayerinfo <playerid_index> in_game = 1
		<player_object> :musicstudiomenu_init Player = <playerid_index> controller = <controller>
		<player_object> :musicstudiomenu_setstate {
			id = <ghmix_menu>
			state = musicstudio_transport_state
		}
	endif
	musicstudio_ghmix_init editing = <editing> from_song = <from_song>
	musicstudio_ghmix :Obj_SpawnScriptNow \{musicstudio_ghmix_show_inst_tabs
		params = {
			animate = 0
		}}
	musicstudio_ghmix :obj_spawnscript \{jam_recording_check_disconnect}
	musicstudio_force_drum_track
	musicstudio_set_ambience \{ambience = ghmix_ambience}
	SpawnScriptNow \{musicstudiodelayedsafeshutdownhack}
endscript

script musicstudiodelayedsafeshutdownhack 
	Wait \{1
		Second}
	popunsafeforshutdown \{context = ghmix
		Type = unchecked}
endscript

script ui_destroy_musicstudio_ghmix 
	musicstudio_reinit_in_game_players
	musicstudio_ghmix_deinit
	DestroyScreenElement \{id = musicstudio_ghmix}
	clean_up_user_control_helpers
	destroy_dialog_box
endscript

script ui_init_musicstudio_ghmix 
endscript

script ui_deinit_musicstudio_ghmix 
endscript

script musicstudio_force_drum_track 
	getcontrollertype controller = ($primary_controller)
	if (<controller_type> = drum)
		musicstudio_select_track_focus \{index = 1}
		musicstudio_select_track_focus \{index = 2}
		musicstudio_select_track_focus \{index = 3}
		if GotParam \{song}
			musicstudio_song_select_track_deinit
		else
			musicstudio_select_track_deinit
		endif
	endif
endscript

script ghmix_menu_update_snap_text 
	if NOT GotParam \{snap_index}
		snap_index = ($jam_current_quantize)
	endif
	formatText TextName = snap_text qs(0x3ef8b3c6) s = ($jam_quantize [<snap_index>].name_text)
	if musicstudio_ghmix :desc_resolvealias \{Name = alias_ghmix_menu
			param = ghmix_menu}
		<ghmix_menu> :se_setprops left_right_text = <snap_text>
	endif
	return name_text = <snap_text>
endscript

script ghmix_menu_update_area_hightlight 
	RequireParams \{[
			highlight_pos
			highlight_dims
			matching_area
		]
		all}
	<screen_elem_id> = ghmix_area_highlight
	if (<matching_area> != -1)
		formatText checksumName = screen_elem_id 'ghmix_area_highlight_%d' d = <matching_area>
	endif
	if ScreenElementExists id = <screen_elem_id>
		DestroyScreenElement id = <screen_elem_id>
	endif
	offset = (0.0, 0.0)
	dims = (0.0, 0.0)
	if NOT (<highlight_all> = true)
		<offset> = (450.0, 0.0)
		<dims> = (211.0, 0.0)
	else
		<dims> = (661.0, 0.0)
	endif
	<rgba> = [255 0 0 50]
	if (<matching_area> != -1)
		<rgba> = [0 0 255 50]
	endif
	CreateScreenElement {
		Type = SpriteElement
		parent = jam_highway_container
		id = <screen_elem_id>
		texture = white
		just = [left bottom]
		rgba = <rgba>
		Pos = (<highlight_pos> + <offset>)
		dims = (<highlight_dims> + <dims>)
		z_priority = 10
	}
endscript

script ghmix_menu_remove_area_highlight 
	if ScreenElementExists \{id = ghmix_area_highlight}
		DestroyScreenElement \{id = ghmix_area_highlight}
	endif
	musicstudio_mainobj :musicstudioghmix_getnummatchingareas
	if (<num_matching_areas> > 0)
		<area_num> = 1
		begin
		formatText checksumName = screen_elem_id 'ghmix_area_highlight_%d' d = <area_num>
		if ScreenElementExists id = <screen_elem_id>
			DestroyScreenElement id = <screen_elem_id>
		endif
		<area_num> = (<area_num> + 1)
		repeat <num_matching_areas>
	endif
endscript

script animate_move_and_rebound 
	RequireParams \{[
			start_pos
			end_pos
			pixels_per_second
		]
		all}
	se_setprops Pos = <start_pos>
	dist_x = (<start_pos> [0] - <end_pos> [0])
	dist_y = (<start_pos> [1] - <end_pos> [1])
	vector_magnitude vect = ((<dist_x> * (1.0, 0.0)) + (<dist_y> * (0.0, 1.0)))
	animation_time = (<magnitude> / <pixels_per_second>)
	se_setprops Pos = <end_pos> time = <animation_time>
endscript

script musicstudio_menu_set_button 
	RequireParams \{[
			id
			button
		]
		all}
	musicstudio_menu_update_helper_text button = <button> button_struct = <button_struct>
	if NOT musicstudio_menu_flip_back button = <button>
		return
	endif
	if musicstudio_mainobj :musicstudiojamroom_isinjamroom
		if (<button> = back)
			if GotParam \{button_text}
				musicstudio_jamroom_set_start_text text = <button_text> alpha = 1.0 Player = <Player>
			else
				musicstudio_jamroom_set_start_text text = qs(0x00000000) alpha = 0.0 Player = <Player>
			endif
		endif
	endif
	if <id> :desc_resolvealias Name = <button> param = children_button
		if GetScreenElementChildren id = <children_button>
			show_button = 0
			if GotParam \{button_text}
				<show_button> = 1
			endif
			if (<button> = up_down)
				<show_button> = 0
			endif
			if (<button> = left)
				(<children> [1]) :se_setprops text = qs(0x097a48f7)
			endif
			if (<button> = right)
				<show_button> = 0
			endif
			if StructureContains structure = <button_struct> debug
				if CD
					<show_button> = 0
				endif
			endif
			rgba = [113 121 133 255]
			if (<show_button> = 1)
				(<children> [0]) :se_setprops alpha = 1 text = <button_text> time = 0.2 rgba = <rgba>
				(<children> [1]) :se_setprops alpha = 1 time = 0.2
				(<children> [2]) :se_setprops alpha = 0.3 time = 0.2
			else
				(<children> [0]) :se_setprops alpha = 0 time = 0.2 rgba = <rgba>
				(<children> [1]) :se_setprops alpha = 0 time = 0.2
				(<children> [2]) :se_setprops alpha = 0 time = 0.2
			endif
			if GotParam \{Active}
				if (<show_button> = 1)
					if (<Active> = 0)
						(<children> [0]) :se_setprops alpha = 0.15 time = 0.2 rgba = <rgba>
						(<children> [1]) :se_setprops alpha = 0.15 time = 0.2
						(<children> [2]) :se_setprops alpha = 0.1 time = 0.2
					endif
				endif
			endif
			if (<button> = orange)
				if (<show_button> = 1)
					alpha = 1
					if GotParam \{Active}
						if (<Active> = 0)
							<alpha> = 0.15
						endif
					endif
					if isrbdrum controller = <controller>
						<id> :se_setprops orange_alpha = 0 kick_alpha = <alpha>
					else
						<id> :se_setprops orange_alpha = <alpha> kick_alpha = 0
					endif
				else
					<id> :se_setprops orange_alpha = 0 kick_alpha = 0
				endif
			endif
		endif
	endif
endscript

script musicstudio_menu_update_helper_text 
	if NOT musicstudio_mainobj :musicstudiojamroom_isinjamroom
		if (<button> = start)
			clean_up_user_control_helpers
			if StructureContains structure = <button_struct> name_text
				musicstudio_ghmix_control_helper_start start_text = (<button_struct>.name_text)
			endif
		endif
		if (<button> = up_down)
			if StructureContains structure = <button_struct> name_text
				musicstudio_ghmix_control_helper_up_down up_down_text = (<button_struct>.name_text)
			endif
		endif
	else
		clean_up_user_control_helpers
	endif
endscript

script musicstudio_menu_flip_back 
	flip_back = 0
	if musicstudio_mainobj :musicstudiojamroom_isinjamroom
		<flip_back> = 1
	endif
	if (<flip_back> = 1)
		if (<button> = start)
			<button> = back
			return true button = <button>
		elseif (<button> = back)
			return \{FALSE}
		endif
	endif
	return \{true}
endscript

script musicstudio_menu_update_button_text \{rgba = [
			113
			121
			133
			255
		]}
	RequireParams \{[
			button
			button_text
		]
		all}
	update_button_text = 0
	if musicstudio_mainobj :musicstudiojamroom_isinjamroom
		formatText checksumName = musicstudio_menu 'musicstudio_menu_%s' s = <Player>
		if <musicstudio_menu> :desc_resolvealias Name = alias_jamroom_player_menu param = curr_menu
			<update_button_text> = 1
		endif
	else
		if musicstudio_ghmix :desc_resolvealias \{Name = alias_ghmix_menu
				param = curr_menu}
			<update_button_text> = 1
		endif
	endif
	if (<update_button_text> = 1)
		if <curr_menu> :desc_resolvealias Name = <button> param = children_button
			if GetScreenElementChildren id = <children_button>
				alpha = 1
				if GotParam \{Active}
					if NOT (<Active> = 1)
						<alpha> = 0.15
					endif
				endif
				if GotParam \{Hide}
					if (<Hide> = 1)
						<alpha> = 0
					endif
				endif
				(<children> [0]) :se_setprops alpha = <alpha> text = <button_text> rgba = <rgba>
				if NOT GotParam \{no_icon}
					(<children> [1]) :se_setprops alpha = <alpha>
				else
					(<children> [1]) :se_setprops alpha = 0
				endif
				(<children> [2]) :se_setprops alpha = 0.25
				if (<button> = orange)
					if isrbdrum controller = ($primary_controller)
						<curr_menu> :se_setprops orange_alpha = 0 kick_alpha = <alpha>
					else
						<curr_menu> :se_setprops orange_alpha = <alpha> kick_alpha = 0
					endif
				endif
			endif
		endif
	endif
endscript

script musicstudio_clear_button_text 
	button_array = [green red yellow blue orange start]
	GetArraySize <button_array>
	count = 0
	begin
	if <menu_id> :desc_resolvealias Name = (<button_array> [<count>]) param = children_button
		if GetScreenElementChildren id = <children_button>
			(<children> [0]) :se_setprops alpha = 0 time = 0.2
			(<children> [1]) :se_setprops alpha = 0 time = 0.2
			(<children> [2]) :se_setprops alpha = 0 time = 0.2
		endif
	endif
	<count> = (<count> + 1)
	repeat <array_Size>
endscript

script musicstudio_menu_state_show 
	<id> :se_setprops menu_cont_alpha = 1
	if StructureContains structure = <state_structure> swap_colors_for_lefty_drum
		musicstudio_update_button_colors \{swap_colors_for_lefty_drum = 1}
	else
		musicstudio_update_button_colors
	endif
endscript

script musicstudio_update_button_colors \{swap_colors_for_lefty_drum = 0}
	if NOT ScreenElementExists \{id = musicstudio_ghmix}
		return
	endif
	button_array = [green red yellow blue orange start]
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getplayerindex
	<main_player> :musicstudioplayer_getcontroller
	lefty_flip = 0
	if isdrumcontroller controller = <controller>
		getplayerinfo <Player> lefty_flip
	endif
	button_colors = [
		[55 116 61 255]
		[151 68 85 255]
		[185 171 71 255]
		[68 92 131 255]
		[154 80 56 255]
	]
	if (<lefty_flip> = 1 && <swap_colors_for_lefty_drum> = 1)
		button_colors = [
			[151 68 85 255]
			[55 116 61 255]
			[154 80 56 255]
			[68 92 131 255]
			[185 171 71 255]
		]
	endif
	GetArraySize <button_array>
	count = 0
	begin
	if musicstudio_ghmix :desc_resolvealias \{Name = alias_ghmix_menu
			param = ghmix_menu}
		if <ghmix_menu> :desc_resolvealias Name = (<button_array> [<count>]) param = children_button
			if GetScreenElementChildren id = <children_button>
				(<children> [1]) :se_setprops rgba = (<button_colors> [<count>])
			endif
		endif
	endif
	<count> = (<count> + 1)
	repeat <array_Size>
endscript

script musicstudio_menu_set_tabs 
	RequireParams \{[
			id
			num_tabs
			header_text
		]
		all}
	if <id> :desc_resolvealias Name = alias_tabs param = tabs
		if GetScreenElementChildren id = <tabs>
			GetArraySize <children>
			index = 0
			begin
			if (<index> < <num_tabs>)
				(<children> [<index>]) :se_setprops alpha = 1 time = 0.2
			else
				(<children> [<index>]) :se_setprops alpha = 0 time = 0.2
			endif
			<index> = (<index> + 1)
			repeat <array_Size>
		endif
	endif
	if NOT musicstudio_mainobj :musicstudiojamroom_isinjamroom
		<id> :se_setprops header_text = <header_text>
	else
		musicstudio_jamroom_set_title_text text = <header_text> Player = <Player>
	endif
endscript

script musicstudio_set_state_header_text 
	if musicstudio_ghmix :desc_resolvealias \{Name = alias_ghmix_menu
			param = ghmix_menu}
		<ghmix_menu> :se_setprops header_text = <header_text>
	endif
endscript

script musicstudio_menu_tool_tip 
	if StructureContains structure = <button_struct> debug
		if CD
			return
		endif
	endif
	if StructureContains structure = <button_struct> musicstudio_get_active
		if StructureContains structure = <button_struct> get_active_params
			(<button_struct>.musicstudio_get_active) Player = <Player> (<button_struct>.get_active_params)
		else
			(<button_struct>.musicstudio_get_active) Player = <Player>
		endif
		if (<Active> = 0)
			return
		endif
	endif
	flow_wait_frames = 30
	getplayerinfo <Player> controller
	LaunchEvent Type = unfocus target = <musicstudio_menu>
	held_down = 1
	if musicstudio_mainobj :musicstudiojamroom_isinjamroom
		<held_down> = 0
	elseif isdrumcontroller controller = <controller>
		<held_down> = 0
	else
		begin
		if NOT ControllerPressed <pad> <controller>
			<held_down> = 0
			break
		endif
		Wait \{1
			gameframe}
		repeat <flow_wait_frames>
	endif
	if (<held_down> = 0)
		musicstudio_menu_button_choose musicstudio_menu = <musicstudio_menu> curr_state = <state> go_back_state = <go_back_state> button_checksum = <button_checksum> button_struct = <button_struct> Player = <Player> controller = <controller>
	else
		hide_user_control_helpers
		GetGlobalTags \{achievement_info
			param = ghmix_tooltips_read}
		<ghmix_tooltips_read> = (<ghmix_tooltips_read> + 1)
		SetGlobalTags achievement_info params = {ghmix_tooltips_read = <ghmix_tooltips_read>}
		musicstudio_mixer_hide
		musicstudio_remove_scale_staff_reference
		musicstudio_line6pod_destroy Player = <Player>
		musicstudio_drum_pad_display_destroy
		musicstudio_ghmix_menu_sound_show_help
		musicstudio_pulse_tip_text_stop
		<musicstudio_menu> :musicstudio_menu_blackout_on index = <index> musicstudio_menu = <musicstudio_menu>
		<musicstudio_menu> :se_setprops tip_alpha = 1 time = 0.2
		musicstudio_highway_blackout \{blackout = [
				1
				1
				1
				1
				1
			]
			alpha = 0.85}
		musicstudio_show_help help_text = <tool_tip_text>
		begin
		if NOT ControllerPressed <pad> <controller>
			musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
			<player_object> :musicstudiomenu_setstate {
				id = <musicstudio_menu>
				state = <state>
			}
			break
		endif
		Wait \{1
			gameframe}
		repeat
		<musicstudio_menu> :musicstudio_menu_blackout_off
		musicstudio_highway_blackout \{remove}
		musicstudio_hide_help
		show_user_control_helpers
	endif
endscript

script musicstudio_pulse_tip_text 
	if NOT ScreenElementExists \{id = musicstudio_ghmix}
		return
	endif
	pulse_time = 0.5
	pulse_scale = 0.025
	pulse_original_rgba = [113 121 133 255]
	pulse_rgba = [175 175 175 255]
	Wait ($musicstudio_time_before_pulse) Seconds
	if ScreenElementExists \{id = musicstudio_ghmix}
		if musicstudio_ghmix :desc_resolvealias \{Name = alias_ghmix_menu
				param = ghmix_menu}
			begin
			if ScreenElementExists id = <ghmix_menu>
				<ghmix_menu> :se_setprops tip_scale = (1.0 + <pulse_scale>) tip_rgba = <pulse_rgba> time = <pulse_time>
				<ghmix_menu> :se_waitprops
			else
				break
			endif
			if ScreenElementExists id = <ghmix_menu>
				<ghmix_menu> :se_setprops tip_scale = 1.0 tip_rgba = <pulse_original_rgba> time = <pulse_time>
				<ghmix_menu> :se_waitprops
			else
				break
			endif
			repeat
		endif
	endif
endscript

script musicstudio_pulse_tip_text_stop 
	pulse_time = 0.5
	KillSpawnedScript \{Name = musicstudio_pulse_tip_text}
	if NOT ScreenElementExists \{id = musicstudio_ghmix}
		return
	endif
	if musicstudio_ghmix :desc_resolvealias \{Name = alias_ghmix_menu
			param = ghmix_menu}
		<ghmix_menu> :se_setprops tip_scale = 1.0 tip_rgba = [113 121 133 255] time = <pulse_time>
	endif
endscript

script musicstudio_pulse_tip_text_start 
	if NOT ScreenElementExists \{id = musicstudio_ghmix}
		return
	endif
	musicstudio_pulse_tip_text_stop
	SpawnScriptNow \{id = jam_recording_spawns
		musicstudio_pulse_tip_text}
endscript

script musicstudio_menu_update_song_info_text 
	if musicstudio_ghmix :desc_resolvealias \{Name = alias_ghmix_menu
			param = ghmix_menu}
		if ($jam_band_new_song = 0)
			song = ($memcard_jamsession_file_name)
		else
			jam_recording_get_unique_name
		endif
		formatText TextName = song_name qs(0x9e0225f1) s = <song>
		<ghmix_menu> :se_setprops song_name_text = <song_name>
		formatText TextName = bpm_text qs(0x2cfa5c38) s = ($jam_current_bpm)
		<ghmix_menu> :se_setprops bpm_text = <bpm_text>
	endif
endscript

script musicstudio_menu_button_choose_sound 
	if StructureContains structure = <button_struct> sound_script
		(<button_struct>.sound_script)
	else
		switch <button_checksum>
			case green
			case red
			case yellow
			case blue
			case orange
			musicstudio_ghmix_menu_sound_choose
			case left
			case right
			<allow_sound> = true
			if StructureContains structure = <button_struct> choose_script
				if (((<button_struct>.choose_script) = musicstudio_jamroom_transport_right) || ((<button_struct>.choose_script) = musicstudio_jamroom_transport_left))
					<allow_sound> = FALSE
				endif
			endif
			if (<allow_sound> = true)
				musicstudio_ghmix_menu_sound_left_right
			endif
			case up
			case down
			musicstudio_ghmix_menu_sound_up_down
			case back
			musicstudio_ghmix_menu_sound_choose
			case start
			if StructureContains structure = <button_struct> musicstudio_popup_state
			else
				musicstudio_ghmix_menu_sound_back
			endif
		endswitch
	endif
endscript

script musicstudio_menu_button_choose 
	musicstudio_pulse_tip_text_stop
	musicstudio_pulse_tip_text_start
	if StructureContains structure = <button_struct> debug
		if CD
			return
		endif
	endif
	if StructureContains structure = <button_struct> musicstudio_get_active
		if StructureContains structure = <button_struct> get_active_params
			(<button_struct>.musicstudio_get_active) Player = <Player> (<button_struct>.get_active_params)
		else
			(<button_struct>.musicstudio_get_active) Player = <Player>
		endif
		if (<Active> = 0)
			return
		endif
	endif
	musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
	if StructureContains structure = <button_struct> choose_script
		musicstudio_menu_button_choose_sound button_checksum = <button_checksum> button_struct = <button_struct>
		LaunchEvent Type = focus target = <musicstudio_menu>
		choose_params = {}
		if StructureContains structure = <button_struct> choose_params
			choose_params = (<button_struct>.choose_params)
		endif
		(<button_struct>.choose_script) <choose_params> Player = <Player> id = <musicstudio_menu>
	endif
	if StructureContains structure = <button_struct> musicstudio_state
		musicstudio_menu_button_choose_sound button_checksum = <button_checksum> button_struct = <button_struct>
		musicstudio_state = (<button_struct>.musicstudio_state)
		if StructureContains structure = ($<musicstudio_state>) init_params
			<player_object> :musicstudiomenu_setstate {
				id = <musicstudio_menu>
				state = (<button_struct>.musicstudio_state)
				init_params = ($<musicstudio_state>.init_params)
				animate
			}
		else
			<player_object> :musicstudiomenu_setstate {
				id = <musicstudio_menu>
				state = (<button_struct>.musicstudio_state)
				animate
			}
		endif
	elseif StructureContains structure = <button_struct> musicstudio_get_state
		musicstudio_menu_button_choose_sound button_checksum = <button_checksum> button_struct = <button_struct>
		(<button_struct>.musicstudio_get_state) Player = <Player>
		if GotParam \{musicstudio_scrolling_state}
			<player_object> :musicstudiomenu_setscrollingstate {
				id = <musicstudio_menu>
				scrolling_state = <musicstudio_scrolling_state>
			}
		elseif (<musicstudio_state> != NULL)
			<player_object> :musicstudiomenu_setstate {
				id = <musicstudio_menu>
				state = <musicstudio_state>
				animate
			}
		else
			<player_object> :musicstudiomenu_setstate {
				id = <musicstudio_menu>
				state = <curr_state>
			}
			if StructureContains structure = <button_struct> musicstudio_unactive_warning
				unactive_warning = (<button_struct>.musicstudio_unactive_warning)
				musicstudio_show_popup_warning warning = ($<unactive_warning>)
			endif
		endif
	elseif StructureContains structure = <button_struct> musicstudio_popup_state
		musicstudio_menu_button_choose_sound button_checksum = <button_checksum> button_struct = <button_struct>
		<player_object> :musicstudiomenu_setpopupstate {
			id = <musicstudio_menu>
			popup_state = (<button_struct>.musicstudio_popup_state)
		}
	elseif StructureContains structure = <button_struct> musicstudio_scrolling_state
		musicstudio_menu_button_choose_sound button_checksum = <button_checksum> button_struct = <button_struct>
		<player_object> :musicstudiomenu_setscrollingstate {
			id = <musicstudio_menu>
			scrolling_state = (<button_struct>.musicstudio_scrolling_state)
		}
	elseif StructureContains structure = <button_struct> musicstudio_change_value_state
		musicstudio_menu_button_choose_sound button_checksum = <button_checksum> button_struct = <button_struct>
		<player_object> :musicstudiomenu_setchangevaluestate {
			id = <musicstudio_menu>
			change_value_state = (<button_struct>.musicstudio_change_value_state)
		}
	endif
	if NOT musicstudio_mainobj :musicstudiojamroom_isinjamroom
		musicstudio_mainobj :musicstudio_getmainplayercontroller
		if isdrumcontroller controller = <controller>
			<musicstudio_menu> :se_setprops tip_text = qs(0x03ac90f0)
		endif
	endif
endscript

script musicstudio_menu_blackout_on \{index = 1}
	if (<index> = 5)
		<index> = 6
	endif
	if (<index> = 9)
		<index> = 5
	endif
	if <musicstudio_menu> :desc_resolvealias Name = alias_blackout param = blackout_buttons
		if GetScreenElementChildren id = <blackout_buttons>
			GetArraySize <children>
			i = 0
			begin
			if (<i> = <index>)
				(<children> [<i>]) :se_setprops alpha = 0
			else
				(<children> [<i>]) :se_setprops alpha = 1
			endif
			<i> = (<i> + 1)
			repeat <array_Size>
		endif
	endif
	se_setprops \{blackout_alpha = 1
		tab_blackout_alpha = 1
		time = 0.2}
endscript

script musicstudio_menu_blackout_off 
	se_setprops \{blackout_alpha = 0
		tab_blackout_alpha = 0
		time = 0.2}
endscript
musicstudio_inst_tabs_animate_time = 0.03
musicstudio_inst_tabs_animate_alpha = 0.25

script musicstudio_ghmix_show_inst_tabs \{direction = 0
		animate = 1}
	if (<direction> = 0)
		<animate> = 0
	endif
	animate_time = 0
	if (<animate> = 1)
		animate_time = ($musicstudio_inst_tabs_animate_time)
	endif
	if musicstudio_ghmix :desc_resolvealias \{Name = alias_ghmix_inst_tabs
			param = inst_tabs_container}
		musicstudio_mainobj :musicstudio_getcurrmainplayer
		<main_player> :musicstudioplayer_getinstrument
		<inst_tabs_container> :se_setprops alpha = 1 inst_tab_text = ($jam_tracks [<instrument>].alt_text)
		if <inst_tabs_container> :desc_resolvealias Name = inst_tabs_menu param = inst_tabs_menu
			if GetScreenElementChildren id = <inst_tabs_menu>
				inst_tabs_menu_elements = <children>
				if (<animate> = 1)
					musicstudio_ghmix_inst_tab_arrows id = <inst_tabs_menu_elements> direction = <direction>
				endif
				GetArraySize <inst_tabs_menu_elements>
				if GetScreenElementChildren id = (<inst_tabs_menu_elements> [(<array_Size> - 1)])
					if (<instrument> = 3 && $is_percussion_kit = 1)
						musicstudio_ghmix_update_inst_tab {id = (<children> [0]) texture = ghmix_percussionon_icon time = <animate_time>}
					else
						musicstudio_ghmix_update_inst_tab {id = (<children> [0]) texture = ($jam_tracks [<instrument>].icon) time = <animate_time>}
					endif
				endif
				if NOT (<direction> = 1)
					curr_instrument = (<instrument> + 1)
					i = 0
				else
					curr_instrument = (<instrument> - 1)
					i = (<array_Size> - 2)
				endif
				begin
				if GetScreenElementChildren id = (<inst_tabs_menu_elements> [<i>])
					if (<curr_instrument> > (<array_Size> - 1))
						<curr_instrument> = 0
					elseif (<curr_instrument> < 0)
						<curr_instrument> = (<array_Size> - 1)
					endif
					if (<curr_instrument> = 3 && $is_percussion_kit = 1)
						musicstudio_ghmix_update_inst_tab {id = (<children> [0]) texture = ghmix_percussionon_icon time = <animate_time>}
					else
						musicstudio_ghmix_update_inst_tab {id = (<children> [0]) texture = ($jam_tracks [<curr_instrument>].icon) time = <animate_time>}
					endif
				endif
				if NOT (<direction> = 1)
					<i> = (<i> + 1)
					<curr_instrument> = (<curr_instrument> + 1)
				else
					<i> = (<i> - 1)
					<curr_instrument> = (<curr_instrument> - 1)
				endif
				repeat (<array_Size> - 1)
			endif
		endif
	endif
endscript

script musicstudio_ghmix_inst_tab_arrows 
	GetArraySize <id>
	if GetScreenElementChildren id = (<id> [(<array_Size> - 1)])
		if (<direction> = 1)
			(<children> [0]) :se_setprops texture = ghmix_arrow_icon flip_v = true alpha = ($musicstudio_inst_tabs_animate_alpha) time = ($musicstudio_inst_tabs_animate_time)
		else
			(<children> [0]) :se_setprops texture = ghmix_arrow_icon flip_v = FALSE alpha = ($musicstudio_inst_tabs_animate_alpha) time = ($musicstudio_inst_tabs_animate_time)
		endif
	endif
	Wait ($musicstudio_inst_tabs_animate_time) Seconds
	if NOT (<direction> = 1)
		i = 0
	else
		i = (<array_Size> - 2)
	endif
	begin
	if GetScreenElementChildren id = (<id> [<i>])
		if (<direction> = 1)
			(<children> [0]) :se_setprops texture = ghmix_arrow_icon flip_v = true alpha = ($musicstudio_inst_tabs_animate_alpha) time = ($musicstudio_inst_tabs_animate_time)
		else
			(<children> [0]) :se_setprops texture = ghmix_arrow_icon flip_v = FALSE alpha = ($musicstudio_inst_tabs_animate_alpha) time = ($musicstudio_inst_tabs_animate_time)
		endif
	endif
	Wait ($musicstudio_inst_tabs_animate_time) Seconds
	if NOT (<direction> = 1)
		<i> = (<i> + 1)
	else
		<i> = (<i> - 1)
	endif
	repeat (<array_Size> - 1)
endscript

script musicstudio_ghmix_update_main_inst_tab 
	if NOT ScreenElementExists \{id = musicstudio_ghmix}
		return
	endif
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	if ScreenElementExists \{id = musicstudio_ghmix}
		if musicstudio_ghmix :desc_resolvealias \{Name = alias_ghmix_inst_tabs
				param = inst_tabs_container}
			if <inst_tabs_container> :desc_resolvealias Name = inst_tabs_menu param = inst_tabs_menu
				if GetScreenElementChildren id = <inst_tabs_menu>
					inst_tabs_menu_elements = <children>
					GetArraySize <inst_tabs_menu_elements>
					if GetScreenElementChildren id = (<inst_tabs_menu_elements> [(<array_Size> - 1)])
						if (<instrument> = 3 && $is_percussion_kit = 1)
							(<children> [0]) :se_setprops texture = ghmix_percussionon_icon rot_angle = 0 flip_v = FALSE alpha = 1.0 time = 0
						else
							(<children> [0]) :se_setprops texture = ($jam_tracks [<instrument>].icon) rot_angle = 0 flip_v = FALSE alpha = 1.0 time = 0
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script musicstudio_ghmix_update_inst_tab \{rot_angle = 0}
	<id> :se_setprops texture = <texture> rot_angle = <rot_angle> flip_v = FALSE alpha = 1.0 time = <time>
	Wait ($musicstudio_inst_tabs_animate_time) Seconds
endscript

script musicstudio_ghmix_inst_text_show 
	RequireParams \{[
			instrument
		]
		all}
	if musicstudio_ghmix :desc_resolvealias \{Name = alias_ghmix_inst_text
			param = inst_text_container}
		<inst_text_container> :se_setprops alpha = 0
		<inst_text_container> :se_setprops {
			alpha = 1
			time = 0.5
			inst_text = ($musicstudio_ghmix_tracks [<instrument>].name_text)
			info_text = ($musicstudio_ghmix_tracks [<instrument>].info_text)
		}
	endif
endscript

script musicstudio_ghmix_inst_text_hide 
	if musicstudio_ghmix :desc_resolvealias \{Name = alias_ghmix_inst_text
			param = inst_text_container}
		<inst_text_container> :se_setprops alpha = 0 time = ($musicstudio_inst_tabs_animate_time)
	endif
endscript

script musicstudio_ghmix_hide_inst_tabs 
	if musicstudio_ghmix :desc_resolvealias \{Name = alias_ghmix_inst_tabs
			param = inst_tabs_container}
		if NOT GotParam \{animate}
			<inst_tabs_container> :se_setprops alpha = 0
		else
			<inst_tabs_container> :se_setprops alpha = 0 time = 0.5
			<inst_tabs_container> :se_waitprops
		endif
	endif
endscript

script musicstudio_show_help 
	if ScreenElementExists \{id = musicstudio_ghmix}
		if musicstudio_ghmix :desc_resolvealias \{Name = alias_ghmix_help
				param = help_cont}
			<help_cont> :se_setprops alpha = 1 help_text = <help_text> time = 0.25
		endif
	endif
endscript

script musicstudio_hide_help 
	if ScreenElementExists \{id = musicstudio_ghmix}
		if musicstudio_ghmix :desc_resolvealias \{Name = alias_ghmix_help
				param = help_cont}
			<help_cont> :se_setprops alpha = 0 help_text = qs(0x03ac90f0) time = 0.25
		endif
	endif
endscript

script musicstudio_show_popup_warning \{warning = qs(0x813dc526)
		heading_text = qs(0xaa163738)}
	musicstudio_mainobj :musicstudio_pauseall \{stack_id = popup_warning
		Pause = true}
	musicstudio_ghmix_menu_sound_popup_warning
	if NOT GotParam \{after_script}
		after_script = musicstudio_menu_unused_button
	endif
	if musicstudio_ghmix :desc_resolvealias \{Name = alias_ghmix_menu
			param = ghmix_menu}
		<ghmix_menu> :desc_resolvealias Name = alias_scrolling_menu_elements param = scrolling_menu_elements
		if isscreenelementinfocus id = <scrolling_menu_elements>
			LaunchEvent Type = unfocus target = <scrolling_menu_elements>
			AssignAlias id = <scrolling_menu_elements> alias = musicstudio_menu_to_focus_after_warning
		else
			LaunchEvent Type = unfocus target = <ghmix_menu>
			AssignAlias id = <ghmix_menu> alias = musicstudio_menu_to_focus_after_warning
		endif
	endif
	hide_user_control_helpers
	destroy_dialog_box \{dont_remove_helpers}
	create_dialog_box {
		heading_text = <heading_text>
		body_text = <warning>
		player_device = ($primary_controller)
		no_background
		options = [
			{
				func = musicstudio_hide_popup_warning
				func_params = {after_script = <after_script>}
				text = qs(0x182f0173)
				sound_func = musicstudio_ghmix_menu_sound_back
			}
		]
		dont_remove_helpers
		no_helpers
	}
endscript

script musicstudio_hide_popup_warning 
	show_user_control_helpers
	destroy_dialog_box \{dont_remove_helpers}
	<after_script>
	LaunchEvent \{Type = focus
		target = musicstudio_menu_to_focus_after_warning}
	musicstudio_mainobj :musicstudio_pauseall \{stack_id = popup_warning
		Pause = FALSE}
endscript

script musicstudio_popup 
	musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
	<player_object> :musicstudioplayer_getcontroller
	musicstudio_mainobj :musicstudio_pauseall \{stack_id = popup
		Pause = true}
	RequireParams \{[
			menu_id
			popup_state
			prev_state
		]
		all}
	musicstudio_menu_id = <menu_id>
	LaunchEvent Type = unfocus target = <menu_id>
	if NOT musicstudio_mainobj :musicstudiojamroom_isinjamroom
		musicstudio_mainobj :musicstudio_getcurrmainplayer
		<main_player> :musicstudioplayer_enablewhammyrewind enable = FALSE
	endif
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = unfocus
			target = current_menu}
	endif
	popup_options_array = ($<popup_state>.options)
	set_focus_color
	set_unfocus_color
	parent = musicstudio_ghmix
	if ScreenElementExists \{id = jam_band_container}
		<parent> = jam_band_container
	endif
	destroy_dialog_box
	create_dialog_box {
		heading_text = ($<popup_state>.name_text)
		body_text = <warning>
		player_device = <controller>
		no_background
		options = <popup_options_array>
		no_up_down_sound_handlers
		on_destroy_script = musicstudio_on_destroy_popup
		on_destroy_script_params = {Player = <Player>}
	}
	dialog_box_desc_id :se_setprops \{dlog_body_text = qs(0x03ac90f0)}
	first_element = (<popup_options_array> [0])
	if StructureContains structure = <first_element> tool_tip
		dialog_box_desc_id :se_setprops dlog_body_text = (<first_element>.tool_tip)
	endif
	GetArraySize <popup_options_array>
	if (<array_Size> > 1)
		event_handlers = [
			{pad_up musicstudio_popup_updown params = {popup_state = <popup_state>}}
			{pad_down musicstudio_popup_updown params = {popup_state = <popup_state>}}
			{focus musicstudio_popup_focus params = {popup_state = <popup_state>}}
		]
		dialog_box_vmenu :se_setprops event_handlers = <event_handlers>
	endif
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	add_user_control_helper \{text = qs(0x00688155)
		button = start
		z = 100000}
	if StructureContains structure = ($<popup_state>) go_back_script
		event_handlers = [
			{pad_back ($<popup_state>.go_back_script) params = {id = <musicstudio_menu_id>
					Player = <Player>
					prev_state = <prev_state>}}
			{pad_start ($<popup_state>.go_back_script) params = {id = <musicstudio_menu_id>
					Player = <Player>
					prev_state = <prev_state>}}
		]
	else
		event_handlers = [
			{pad_back musicstudio_popup_remove params = {id = <musicstudio_menu_id>
					Player = <Player>
					prev_state = <prev_state>}}
			{pad_start musicstudio_popup_remove params = {id = <musicstudio_menu_id>
					Player = <Player>
					prev_state = <prev_state>}}
		]
	endif
	Wait \{1
		gameframe}
	dialog_box_vmenu :se_setprops event_handlers = <event_handlers> replace_handlers
	LaunchEvent \{Type = focus
		target = dialog_box_vmenu
		data = {
			child_index = 0
		}}
	musicstudio_ghmix_menu_sound_pause
endscript

script musicstudio_on_destroy_popup 
	musicstudio_mainobj :musicstudio_pauseall \{stack_id = popup
		Pause = FALSE}
endscript

script musicstudio_popup_legacy 
	RequireParams \{[
			menu_id
			popup_state
			prev_state
		]
		all}
	LaunchEvent Type = unfocus target = <menu_id>
	if NOT musicstudio_mainobj :musicstudiojamroom_isinjamroom
		musicstudio_mainobj :musicstudio_getcurrmainplayer
		<main_player> :musicstudioplayer_enablewhammyrewind enable = FALSE
	endif
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = unfocus
			target = current_menu}
	endif
	popup_options_array = ($<popup_state>.options)
	animate = 1
	if ScreenElementExists \{id = musicstudio_ghmix_popup}
		DestroyScreenElement \{id = musicstudio_ghmix_popup}
		<animate> = 0
	endif
	set_focus_color
	set_unfocus_color
	parent = musicstudio_ghmix
	if ScreenElementExists \{id = jam_band_container}
		<parent> = jam_band_container
	endif
	CreateScreenElement {
		parent = <parent>
		id = musicstudio_ghmix_popup
		Type = descinterface
		desc = 'mainmenu'
		mainmenu_helper_text_text = qs(0x03ac90f0)
		z_priority = 1000
		alpha = 0.0
	}
	if (<animate> = 1)
		musicstudio_ghmix_popup :se_setprops \{alpha = 1.0
			time = 0.3}
	else
		musicstudio_ghmix_popup :se_setprops \{alpha = 1.0
			time = 0.0}
	endif
	mainmenu_setup_physics_elements \{screen_id = musicstudio_ghmix_popup}
	GetArraySize <popup_options_array>
	i = 0
	begin
	choose_script = (<popup_options_array> [<i>].choose_script)
	choose_params = {}
	if StructureContains structure = (<popup_options_array> [<i>]) musicstudio_popup_state
		choose_script = musicstudio_sub_popup
		choose_params = {id = <menu_id>
			Player = <Player>
			popup_state = (<popup_options_array> [<i>].musicstudio_popup_state)
		}
	endif
	helper_text = qs(0x03ac90f0)
	if StructureContains structure = (<popup_options_array> [<i>]) tool_tip
		helper_text = (<popup_options_array> [<i>].tool_tip)
	endif
	mainmenu_setup_option {
		choose_script = musicstudio_popup_choose
		choose_params = {choose_script = <choose_script> choose_params = <choose_params>}
		menu_item_text = (<popup_options_array> [<i>].name_text)
		no_sound
	}
	event_handlers = [
		{focus musicstudio_popup_focus params = {helper_text = <helper_text>}}
	]
	<mainmenu_item_id> :se_setprops event_handlers = <event_handlers>
	<i> = (<i> + 1)
	repeat <array_Size>
	main_menu_finalize
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000
		all_buttons}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000
		all_buttons}
	add_user_control_helper \{text = qs(0x00688155)
		button = start
		z = 100000
		all_buttons}
	event_handlers = [
		{pad_back musicstudio_popup_remove params = {id = <menu_id>
				Player = <Player>
				prev_state = <prev_state>}}
		{pad_start musicstudio_popup_remove params = {id = <menu_id>
				Player = <Player>
				prev_state = <prev_state>}}
	]
	Wait \{1
		gameframe}
	current_menu :se_setprops event_handlers = <event_handlers>
	LaunchEvent \{Type = focus
		target = current_menu
		data = {
			child_index = 0
		}}
	musicstudio_ghmix_menu_sound_pause
endscript

script musicstudio_popup_choose 
	musicstudio_ghmix_menu_sound_choose
	<choose_script> <choose_params>
endscript

script musicstudio_sub_popup 
	musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
	<player_object> :musicstudiomenu_setpopupstate {
		id = <id>
		popup_state = <popup_state>
		no_deinit
	}
endscript

script musicstudio_popup_updown 
	musicstudio_ghmix_menu_sound_pause_updown
	Wait \{1
		gameframe}
	musicstudio_popup_focus popup_state = <popup_state>
endscript

script musicstudio_popup_focus 
	dialog_box_vmenu :menu_getselectedindex
	curr_option = ($<popup_state>.options [<selected_index>])
	dialog_box_desc_id :se_setprops dlog_body_text = (<curr_option>.tool_tip)
endscript

script musicstudio_popup_remove 
	LaunchEvent \{Type = unfocus
		target = dialog_box_vmenu}
	if NOT musicstudio_mainobj :musicstudiojamroom_isinjamroom
		musicstudio_mainobj :musicstudio_getcurrmainplayer
		<main_player> :musicstudioplayer_enablewhammyrewind enable = true
	endif
	Wait \{1
		gameframe}
	parent = musicstudio_ghmix
	if ScreenElementExists \{id = jam_band_container}
		<parent> = jam_band_container
	endif
	<parent> :Obj_SpawnScriptNow musicstudio_popup_remove_fadout params = {id = <id> Player = <Player> prev_state = <prev_state>}
endscript

script musicstudio_popup_remove_fadout 
	destroy_dialog_box
	musicstudio_ghmix_menu_sound_unpause
	musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
	<player_object> :musicstudiomenu_setstate {
		id = <id>
		state = <prev_state>
		no_deinit
	}
endscript

script musicstudio_scrolling 
	LaunchEvent Type = unfocus target = <menu_id>
	<menu_id> :se_setprops menu_cont_alpha = 0
	musicstudio_pulse_tip_text_stop
	if StructureContains structure = ($<scrolling_state>) Name = tool_tip
		tool_tip_global = ($<scrolling_state>.tool_tip)
		if GlobalExists Name = <tool_tip_global>
			if NOT isdrumcontroller controller = <controller>
				<menu_id> :se_setprops tip_text = ($<tool_tip_global>)
			endif
		endif
	endif
	extra_params = {}
	if StructureContains structure = ($<scrolling_state>) Name = params
		<extra_params> = ($<scrolling_state>.params)
	endif
	selected = 0
	if StructureContains structure = ($<scrolling_state>) Name = get_selected_script
		($<scrolling_state>.get_selected_script) <extra_params> Player = <Player>
	endif
	no_back = 0
	if StructureContains structure = ($<scrolling_state>) Name = no_back
		<no_back> = 1
	endif
	ordered = 0
	if StructureContains structure = ($<scrolling_state>) Name = get_list_checksum_script
		($<scrolling_state>.get_list_checksum_script) Player = <Player>
		list = ($<list_checksum>)
		GetArraySize <list> param = list_size
	elseif StructureContains structure = ($<scrolling_state>) Name = get_list_script
		($<scrolling_state>.get_list_script) Player = <Player>
		GetArraySize <list> param = list_size
	endif
	if StructureContains structure = ($<scrolling_state>) Name = get_list_size_script
		($<scrolling_state>.get_list_size_script) Player = <Player>
	endif
	<yellow_params> = {}
	if StructureContains structure = ($<scrolling_state>) Name = yellow
		<menu_id> :se_setprops scrolling_yellow_alpha = 1 scrolling_yellow_text = ($<scrolling_state>.yellow.name_text)
		yellow_script = ($<scrolling_state>.yellow.choose_script)
		if StructureContains structure = ($<scrolling_state>.yellow) Name = params
			<yellow_params> = ($<scrolling_state>.yellow.params)
		endif
	else
		<menu_id> :se_setprops scrolling_yellow_alpha = 0
		yellow_script = musicstudio_menu_unused_button
	endif
	yellow_pad_event = pad_option2
	blue_pad_event = pad_option
	if isps3
		if isdrumcontroller controller = <controller>
			<yellow_pad_event> = pad_option
			<blue_pad_event> = pad_option2
		endif
	endif
	unfocus_script = musicstudio_menu_unused_button
	go_back_script = musicstudio_menu_unused_button
	if StructureContains structure = ($<scrolling_state>) Name = unfocus_script
		unfocus_script = ($<scrolling_state>.unfocus_script) Player = <Player>
	endif
	if StructureContains structure = ($<scrolling_state>) Name = go_back_script
		go_back_script = ($<scrolling_state>.go_back_script)
	endif
	if StructureContains structure = ($<scrolling_state>) Name = musicstudio_state_go_back
		<prev_state> = ($<scrolling_state>.musicstudio_state_go_back)
	endif
	if musicstudio_mainobj :musicstudiojamroom_isinjamroom
		if StructureContains structure = ($<scrolling_state>) Name = ghjam_pause_text
			musicstudio_jamroom_set_start_text text = ($<scrolling_state>.ghjam_pause_text) alpha = 1.0 Player = <Player>
		else
			musicstudio_jamroom_set_start_text text = qs(0x00000000) alpha = 0.0 Player = <Player>
		endif
	endif
	if <menu_id> :desc_resolvealias Name = alias_scrolling_cont param = scrolling_cont
		<scrolling_cont> :se_setprops alpha = 1
		<menu_id> :se_setprops tip_text = ($<scrolling_state>.tool_tip)
		if <menu_id> :desc_resolvealias Name = alias_scrolling_menu_elements param = scrolling_menu_elements
			if GetScreenElementChildren id = <scrolling_menu_elements>
				GetArraySize <children>
				i = 0
				begin
				if ScreenElementExists id = (<children> [<i>])
					DestroyScreenElement id = (<children> [<i>])
				endif
				<i> = (<i> + 1)
				repeat <array_Size>
			endif
			num_elements = <list_size>
			if (<num_elements> > 0)
				i = 0
				begin
				focusable = focusable
				alpha = 1.0
				if StructureContains structure = ($<scrolling_state>) Name = get_focusable_script
					($<scrolling_state>.get_focusable_script) index = <i> Player = <Player>
					if (<focusable> = not_focusable)
						<alpha> = 0.2
					endif
				endif
				if StructureContains structure = ($<scrolling_state>) Name = get_name_text_script
					($<scrolling_state>.get_name_text_script) index = <i> Player = <Player>
				else
					if (<ordered> = 1)
						formatText TextName = name_text qs(0x0bc409e2) a = (<ordered_low> + <i>)
					else
						name_text = (<list> [<i>].name_text)
					endif
				endif
				desc = 'musicstudio_ghmix_scrolling_element'
				if musicstudio_mainobj :musicstudiojamroom_isinjamroom
					desc = 'musicstudio_jamroom_scrolling_element'
				endif
				<ignore> = 0
				if GotParam \{list}
					if StructureContains structure = (<list> [<i>]) Name = ignore
						<ignore> = 1
					endif
				endif
				if (<ignore> = 0)
					CreateScreenElement {
						parent = <scrolling_menu_elements>
						Type = descinterface
						desc = <desc>
						just = [left , top]
						pos_anchor = [left , top]
						dims = (350.0, 30.0)
						highlight_alpha = 0
						alpha = <alpha>
						element_text = <name_text>
						exclusive_device = <controller>
						event_handlers = [
							{focus musicstudio_scrolling_focus params = {index = <i>
									id = <menu_id>
									Player = <Player>
									num_elements = <num_elements>
									scrolling_menu_elements = <scrolling_menu_elements>
									scrolling_state = <scrolling_state>
									name_text = <name_text>}}
							{unfocus musicstudio_scrolling_unfocus params = {index = <i>
									id = <menu_id>
									Player = <Player>
									num_elements = <num_elements>
									scrolling_menu_elements = <scrolling_menu_elements>
									unfocus_script = <unfocus_script>}}
							{pad_choose musicstudio_scrolling_choose params = {index = <i>
									id = <menu_id>
									Player = <Player>
									prev_state = <prev_state>
									scrolling_cont = <scrolling_cont>
									scrolling_state = <scrolling_state>
									scrolling_menu_elements = <scrolling_menu_elements>
									extra_params = <extra_params>}}
							{<yellow_pad_event> <yellow_script> params = {index = <i>
									id = <menu_id>
									Player = <Player>
									prev_state = <prev_state>
									scrolling_cont = <scrolling_cont>
									scrolling_state = <scrolling_state>
									scrolling_menu_elements = <scrolling_menu_elements>
									name_text = <name_text>
									<extra_params>
									<yellow_params>}}
							{pad_start musicstudio_scrolling_choose params = {index = <i>
									id = <menu_id>
									Player = <Player>
									prev_state = <prev_state>
									scrolling_cont = <scrolling_cont>
									scrolling_state = <scrolling_state>
									scrolling_menu_elements = <scrolling_menu_elements>
									extra_params = <extra_params>
									start
									no_back = <no_back>}}
						]
						<focusable>
						replace_handlers
					}
				endif
				if musicstudio_mainobj :musicstudiojamroom_isinjamroom
					if (<num_elements> > 5)
						element_dims = (176.0, 30.0)
					else
						element_dims = (191.0, 30.0)
					endif
					<id> :se_setprops element_dims = <element_dims>
				endif
				<i> = (<i> + 1)
				repeat <num_elements>
			endif
			if StructureContains structure = ($<scrolling_state>) Name = focusable_setup_complete
				($<scrolling_state>.focusable_setup_complete) Player = <Player>
			endif
			sound_script = musicstudio_ghmix_menu_sound_scroll
			if StructureContains structure = ($<scrolling_state>) Name = no_scrolling_sound
				<sound_script> = musicstudio_menu_unused_button
			endif
			<scrolling_menu_elements> :se_setprops {
				event_handlers = [{pad_up <sound_script>}
					{pad_down <sound_script>}
					{<blue_pad_event> musicstudio_scrolling_blue params = {id = <menu_id>
							Player = <Player>
							scrolling_state = <scrolling_state>
							scrolling_menu_elements = <scrolling_menu_elements>}}
					{pad_L1 musicstudio_scrolling_orange params = {id = <menu_id>
							Player = <Player>
							scrolling_state = <scrolling_state>
							scrolling_menu_elements = <scrolling_menu_elements>}}
				]
				exclusive_device = <controller>
				replace_handlers
			}
			LaunchEvent Type = focus target = <scrolling_menu_elements> data = {child_index = 0}
			Wait \{1
				gameframe}
			LaunchEvent Type = unfocus target = <scrolling_menu_elements>
			SetScreenElementLock id = <scrolling_menu_elements> OFF
			SetScreenElementLock id = <scrolling_menu_elements> On
			LaunchEvent Type = focus target = <scrolling_menu_elements> data = {child_index = <selected>}
		endif
	endif
	if NOT musicstudio_mainobj :musicstudiojamroom_isinjamroom
		clean_up_user_control_helpers
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = start
			z = 100}
	endif
	if StructureContains structure = ($<scrolling_state>) Name = sort_by_blue
		add_user_control_helper text = ($<scrolling_state>.sort_by_blue) button = blue z = 100
	endif
	if StructureContains structure = ($<scrolling_state>) Name = sort_by_orange
		add_user_control_helper text = ($<scrolling_state>.sort_by_orange) button = orange z = 100
	endif
	Wait \{1
		gameframe}
endscript

script musicstudio_scrolling_choose \{no_back = 0}
	($<scrolling_state>.choose_script) index = <index> Player = <Player> <extra_params>
	go_back = 0
	if GotParam \{start}
		if NOT (<no_back> = 1)
			<go_back> = 1
		endif
	endif
	if (<go_back> = 1)
		musicstudio_scrolling_remove {id = <id>
			Player = <Player>
			prev_state = <prev_state>
			scrolling_cont = <scrolling_cont>
			scrolling_state = <scrolling_state>
			scrolling_menu_elements = <scrolling_menu_elements>}
	else
		if StructureContains structure = ($<scrolling_state>) Name = musicstudio_scrolling_state
			LaunchEvent Type = unfocus target = <scrolling_menu_elements>
			musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
			<player_object> :musicstudiomenu_setscrollingstate {
				id = <id>
				scrolling_state = ($<scrolling_state>.musicstudio_scrolling_state)
				no_deinit
			}
		elseif StructureContains structure = ($<scrolling_state>) Name = musicstudio_scrolling_get_state
			($<scrolling_state>.musicstudio_scrolling_get_state) index = <index> Player = <Player>
			LaunchEvent Type = unfocus target = <scrolling_menu_elements>
			musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
			<player_object> :musicstudiomenu_setscrollingstate {
				id = <id>
				scrolling_state = <musicstudio_scrolling_state>
				no_deinit
			}
		elseif StructureContains structure = ($<scrolling_state>) Name = musicstudio_state
			musicstudio_scrolling_remove {id = <id>
				Player = <Player>
				prev_state = <prev_state>
				scrolling_cont = <scrolling_cont>
				scrolling_state = <scrolling_state>
				scrolling_menu_elements = <scrolling_menu_elements>
				musicstudio_state = ($<scrolling_state>.musicstudio_state)
				musicstudio_state_type = musicstudio_state}
		elseif StructureContains structure = ($<scrolling_state>) Name = musicstudio_get_state
			($<scrolling_state>.musicstudio_get_state) index = <index> Player = <Player>
			musicstudio_scrolling_remove {id = <id>
				Player = <Player>
				prev_state = <prev_state>
				scrolling_cont = <scrolling_cont>
				scrolling_state = <scrolling_state>
				scrolling_menu_elements = <scrolling_menu_elements>
				musicstudio_state = <musicstudio_state>
				musicstudio_state_type = <musicstudio_state_type>}
		else
			musicstudio_scrolling_remove {id = <id>
				Player = <Player>
				prev_state = <prev_state>
				scrolling_cont = <scrolling_cont>
				scrolling_state = <scrolling_state>
				scrolling_menu_elements = <scrolling_menu_elements>}
		endif
	endif
endscript
musicstudio_scrolling_sort = 0

script musicstudio_scrolling_reset_sort 
	Change \{musicstudio_scrolling_sort = 0}
endscript

script musicstudio_scrolling_blue 
	if StructureContains structure = ($<scrolling_state>) Name = sort_by_blue
		Change \{musicstudio_scrolling_sort = 1}
		LaunchEvent Type = unfocus target = <scrolling_menu_elements>
		musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
		<player_object> :musicstudiomenu_setscrollingstate {
			id = <id>
			scrolling_state = <scrolling_state>
		}
	endif
endscript

script musicstudio_scrolling_orange 
	if StructureContains structure = ($<scrolling_state>) Name = sort_by_orange
		Change \{musicstudio_scrolling_sort = 2}
		LaunchEvent Type = unfocus target = <scrolling_menu_elements>
		musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
		<player_object> :musicstudiomenu_setscrollingstate {
			id = <id>
			scrolling_state = <scrolling_state>
		}
	endif
endscript

script musicstudio_scrolling_remove \{no_back = 0}
	musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
	<player_object> :musicstudiomenu_stopupdatescript
	if (<no_back> = 1)
		return
	endif
	musicstudio_ghmix_menu_sound_back
	<scrolling_cont> :se_setprops alpha = 0
	LaunchEvent Type = unfocus target = <scrolling_menu_elements>
	Wait \{1
		gameframe}
	if GotParam \{go_back_script}
		<go_back_script> Player = <Player>
	endif
	if StructureContains structure = ($<scrolling_state>) Name = deinit_script
		($<scrolling_state>.deinit_script) Player = <Player>
	endif
	if GotParam \{musicstudio_state}
		musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
		switch <musicstudio_state_type>
			case musicstudio_state
			<player_object> :musicstudiomenu_setstate {
				id = <id>
				state = <musicstudio_state>
				no_deinit
			}
			case musicstudio_scrolling_state
			<player_object> :musicstudiomenu_setscrollingstate {
				id = <id>
				scrolling_state = <musicstudio_state>
				no_deinit
			}
			case musicstudio_popup_state
			<player_object> :musicstudiomenu_setpopupstate {
				id = <id>
				popup_state = <musicstudio_state>
				no_deinit
			}
		endswitch
	else
		musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
		<player_object> :musicstudiomenu_setstate {
			id = <id>
			state = <prev_state>
			no_deinit
		}
	endif
	if GetScreenElementChildren id = <scrolling_menu_elements>
		GetArraySize <children>
		i = 0
		begin
		if ScreenElementExists id = (<children> [<i>])
			DestroyScreenElement id = (<children> [<i>])
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
endscript

script musicstudio_scrolling_focus 
	if NOT musicstudio_mainobj :musicstudiojamroom_isinjamroom
		start_pos = (0.0, 5.0)
		scroll_length = ((0.0, 214.0) - (0.0, 5.0))
		max_elements = 7
	else
		start_pos = (0.0, 4.0)
		scroll_length = ((0.0, 135.0) - (0.0, 4.0))
		max_elements = 5
	endif
	if GetScreenElementChildren id = <scrolling_menu_elements>
		GetArraySize <children>
		remove_index = 0
		begin
		(<children> [<remove_index>]) :se_setprops highlight_alpha = 0
		(<children> [<remove_index>]) :se_setprops element_rgba = [113 121 133 255]
		<remove_index> = (<remove_index> + 1)
		repeat <array_Size>
		casttofloat \{num_elements}
		if (<num_elements> > <max_elements>)
			<id> :se_setprops scroll_bar_alpha = 1.0
			if musicstudio_mainobj :musicstudiojamroom_isinjamroom
				(<children> [<index>]) :se_setprops highlight_dims = (182.0, 28.0)
			else
				(<children> [<index>]) :se_setprops highlight_dims = (270.0, 30.0)
			endif
		else
			<id> :se_setprops scroll_bar_alpha = 0.0
			if musicstudio_mainobj :musicstudiojamroom_isinjamroom
				(<children> [<index>]) :se_setprops highlight_dims = (200.0, 28.0)
			else
				(<children> [<index>]) :se_setprops highlight_dims = (300.0, 30.0)
			endif
		endif
		<num_elements> = (<num_elements> - 1)
		scroll_ratio = 0
		if (<num_elements> > 0)
			scroll_ratio = (<index> / <num_elements>)
		endif
		<id> :se_setprops scroll_indicator_pos = ((<scroll_length> * <scroll_ratio>) + <start_pos>)
		(<children> [<index>]) :se_setprops highlight_alpha = 1
		(<children> [<index>]) :se_setprops element_rgba = [22 26 30 255]
	endif
	if StructureContains structure = ($<scrolling_state>) Name = focus_script
		($<scrolling_state>.focus_script) name_text = <name_text> index = <index> id = <id> Player = <Player>
	endif
endscript

script musicstudio_scrolling_unfocus 
	<unfocus_script> index = <index> Player = <Player>
	if GetScreenElementChildren id = <scrolling_menu_elements>
		(<children> [<index>]) :se_setprops highlight_alpha = 0
		(<children> [<index>]) :se_setprops element_rgba = [113 121 133 255]
	endif
endscript

script musicstudio_change_value 
	LaunchEvent Type = unfocus target = <menu_id>
	<menu_id> :se_setprops menu_cont_alpha = 0
	musicstudio_pulse_tip_text_stop
	if StructureContains structure = ($<change_value_state>) Name = tool_tip
		tool_tip_global = ($<change_value_state>.tool_tip)
		if GlobalExists Name = <tool_tip_global>
			if NOT isdrumcontroller controller = <controller>
				<menu_id> :se_setprops tip_text = ($<tool_tip_global>)
			endif
		endif
	endif
	extra_params = {}
	if StructureContains structure = ($<change_value_state>) Name = params
		<extra_params> = ($<change_value_state>.params)
	endif
	if StructureContains structure = ($<change_value_state>) Name = yellow
		<menu_id> :se_setprops change_value_yellow_alpha = 1 change_value_yellow_text = ($<change_value_state>.yellow.name_text)
		yellow_script = ($<change_value_state>.yellow.choose_script)
	else
		<menu_id> :se_setprops change_value_yellow_alpha = 0
		yellow_script = musicstudio_menu_unused_button
	endif
	if StructureContains structure = ($<change_value_state>) Name = blue
		<menu_id> :se_setprops change_value_blue_alpha = 1 change_value_blue_text = ($<change_value_state>.blue.name_text)
		blue_script = ($<change_value_state>.blue.choose_script)
	else
		<menu_id> :se_setprops change_value_blue_alpha = 0
		blue_script = musicstudio_menu_unused_button
	endif
	if StructureContains structure = ($<change_value_state>) Name = orange
		<menu_id> :se_setprops change_value_orange_alpha = 1 change_value_orange_text = ($<change_value_state>.orange.name_text)
		orange_script = ($<change_value_state>.orange.choose_script)
	else
		<menu_id> :se_setprops change_value_orange_alpha = 0
		orange_script = musicstudio_menu_unused_button
	endif
	yellow_pad_event = pad_option2
	blue_pad_event = pad_option
	orange_pad_event = pad_L1
	if isps3
		if isdrumcontroller controller = <controller>
			<yellow_pad_event> = pad_option
			<blue_pad_event> = pad_option2
		endif
	endif
	curr_value = 0
	if StructureContains structure = ($<change_value_state>) Name = get_curr_value_script
		($<change_value_state>.get_curr_value_script) Player = <Player>
	endif
	low_bound = 0
	high_bound = 0
	if StructureContains structure = ($<change_value_state>) Name = get_value_bounds_script
		($<change_value_state>.get_value_bounds_script) Player = <Player>
	endif
	if (<curr_value> < <low_bound>)
		<curr_value> = <low_bound>
	endif
	if (<curr_value> > <high_bound>)
		<curr_value> = <high_bound>
	endif
	unfocus_script = musicstudio_menu_unused_button
	go_back_script = musicstudio_menu_unused_button
	change_value_script = musicstudio_menu_unused_button
	up_down_script = musicstudio_menu_unused_button
	if StructureContains structure = ($<change_value_state>) Name = unfocus_script
		unfocus_script = ($<change_value_state>.unfocus_script)
	endif
	if StructureContains structure = ($<change_value_state>) Name = go_back_script
		go_back_script = ($<change_value_state>.go_back_script)
	endif
	if StructureContains structure = ($<change_value_state>) Name = change_value_script
		change_value_script = ($<change_value_state>.change_value_script)
	endif
	if StructureContains structure = ($<change_value_state>) Name = up_down_script
		up_down_script = ($<change_value_state>.up_down_script)
	endif
	append_text = qs(0x03ac90f0)
	if StructureContains structure = ($<change_value_state>) Name = append_text
		<append_text> = ($<change_value_state>.append_text)
	endif
	scrolling_sound = 1
	if StructureContains structure = ($<change_value_state>) Name = no_scrolling_sound
		<scrolling_sound> = 0
	endif
	quick_change_value = 0
	if StructureContains structure = ($<change_value_state>) Name = quick_change_value
		<quick_change_value> = 1
	endif
	if musicstudio_mainobj :musicstudiojamroom_isinjamroom
		if StructureContains structure = ($<change_value_state>) Name = ghjam_pause_text
			musicstudio_jamroom_set_start_text text = ($<change_value_state>.ghjam_pause_text) alpha = 1.0 Player = <Player>
		else
			musicstudio_jamroom_set_start_text text = qs(0x00000000) alpha = 0.0 Player = <Player>
		endif
	endif
	if <menu_id> :desc_resolvealias Name = alias_change_value_cont param = change_value_cont
		musicstudio_change_value_update {curr_value = <curr_value>
			append_text = <append_text>
			menu_id = <menu_id>}
		<change_value_cont> :se_setprops alpha = 1
		<change_value_cont> :se_setprops {
			exclusive_device = <controller>
			event_handlers = [{pad_up musicstudio_change_value_up_down params = {menu_id = <menu_id>
						Dir = 1
						low_bound = <low_bound>
						high_bound = <high_bound>
						append_text = <append_text>
						up_down_script = <up_down_script>
						Player = <Player>
						scrolling_sound = <scrolling_sound>
						quick_change_value = <quick_change_value>}}
				{pad_down musicstudio_change_value_up_down params = {menu_id = <menu_id>
						Dir = -1
						low_bound = <low_bound>
						high_bound = <high_bound>
						append_text = <append_text>
						up_down_script = <up_down_script>
						Player = <Player>
						scrolling_sound = <scrolling_sound>
						quick_change_value = <quick_change_value>}}
				{pad_start musicstudio_change_value_remove params = {menu_id = <menu_id>
						Player = <Player>
						prev_state = <prev_state>
						change_value_cont = <change_value_cont>
						change_value_state = <change_value_state>
						go_back_script = <go_back_script>
						change_value_script = <change_value_script>}}
				{pad_choose musicstudio_change_value_remove params = {menu_id = <menu_id>
						Player = <Player>
						prev_state = <prev_state>
						change_value_cont = <change_value_cont>
						change_value_state = <change_value_state>
						go_back_script = <go_back_script>
						change_value_script = <change_value_script>}}
				{<yellow_pad_event> <yellow_script> params = {menu_id = <menu_id>
						prev_state = <prev_state>
						change_value_cont = <change_value_cont>
						change_value_state = <change_value_state>
						name_text = <name_text>
						Player = <Player>
						<extra_params>}}
				{<blue_pad_event> <blue_script> params = {menu_id = <menu_id>
						prev_state = <prev_state>
						change_value_cont = <change_value_cont>
						change_value_state = <change_value_state>
						name_text = <name_text>
						Player = <Player>
						<extra_params>}}
				{<orange_pad_event> <orange_script> params = {menu_id = <menu_id>
						prev_state = <prev_state>
						change_value_cont = <change_value_cont>
						change_value_state = <change_value_state>
						name_text = <name_text>
						Player = <Player>
						<extra_params>}}
			]
			replace_handlers
		}
		LaunchEvent Type = unfocus target = <change_value_cont>
		LaunchEvent Type = focus target = <change_value_cont>
	endif
	Change \{musicstudio_change_value_curr_hold = 0}
	if NOT musicstudio_mainobj :musicstudiojamroom_isinjamroom
		clean_up_user_control_helpers
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = start
			z = 100}
	endif
	Wait \{1
		gameframe}
endscript
musicstudio_change_value_curr_hold = 0

script musicstudio_change_value_up_down \{scrolling_sound = 1
		quick_change_value = 0}
	getplayerinfo <Player> controller
	if ControllerMake up <controller>
		Change \{musicstudio_change_value_curr_hold = 0}
	elseif ControllerMake down <controller>
		Change \{musicstudio_change_value_curr_hold = 0}
	else
		Change musicstudio_change_value_curr_hold = ($musicstudio_change_value_curr_hold + 1)
	endif
	<menu_id> :GetTags
	if (<quick_change_value> = 1)
		if (($musicstudio_change_value_curr_hold) > 10)
			<curr_value> = (<curr_value> + (<Dir> * 10))
		else
			<curr_value> = (<curr_value> + <Dir>)
		endif
	else
		<curr_value> = (<curr_value> + <Dir>)
	endif
	if (<curr_value> < <low_bound>)
		<curr_value> = <low_bound>
		<scrolling_sound> = 0
	endif
	if (<curr_value> > <high_bound>)
		<curr_value> = <high_bound>
		<scrolling_sound> = 0
	endif
	if (<scrolling_sound> = 1)
		musicstudio_ghmix_menu_sound_scroll
	endif
	if GotParam \{up_down_script}
		<up_down_script> curr_value = <curr_value> Player = <Player>
	endif
	if (<Dir> = 1)
		<menu_id> :se_setprops up_arrow_alpha = 1 up_arrow_scale = 1.25
		<menu_id> :se_setprops up_arrow_alpha = 0 up_arrow_scale = 1.0 time = 0.5
	else
		<menu_id> :se_setprops down_arrow_alpha = 1 down_arrow_scale = 1.25
		<menu_id> :se_setprops down_arrow_alpha = 0 down_arrow_scale = 1.0 time = 0.5
	endif
	musicstudio_change_value_update {curr_value = <curr_value>
		append_text = <append_text>
		menu_id = <menu_id>}
endscript

script musicstudio_change_value_update 
	<menu_id> :SetTags curr_value = <curr_value>
	formatText TextName = change_value_text qs(0x6ecbac27) a = <curr_value> b = <append_text>
	<menu_id> :se_setprops change_value_text = <change_value_text>
endscript

script musicstudio_change_value_remove 
	musicstudio_ghmix_menu_sound_back
	<menu_id> :GetTags
	if GotParam \{change_value_script}
		<change_value_script> curr_value = <curr_value> Player = <Player>
	endif
	if GotParam \{go_back_script}
		<go_back_script>
	endif
	if StructureContains structure = ($<change_value_state>) Name = deinit_script
		($<change_value_state>.deinit_script) Player = <Player>
	endif
	<change_value_cont> :se_setprops alpha = 0
	LaunchEvent Type = unfocus target = <change_value_cont>
	Wait \{1
		gameframe}
	musicstudio_mainobj :musicstudio_getplayerfromindex Player = <Player>
	<player_object> :musicstudiomenu_setstate {
		id = <menu_id>
		state = <prev_state>
		no_deinit
	}
endscript

script musicstudio_menu_hide_scrolling_seelct 
	if <id> :desc_resolvealias Name = alias_scrolling_cont param = scrolling_cont
		<scrolling_cont> :se_setprops alpha = 0
		if <id> :desc_resolvealias Name = alias_scrolling_menu_elements param = scrolling_menu_elements
			LaunchEvent Type = unfocus target = <scrolling_menu_elements>
		endif
	endif
endscript

script musicstudio_menu_unused_button 
endscript

script musicstudio_ghmix_control_helper_up_down 
	add_user_control_helper text = <up_down_text> button = strumbar z = 100
endscript

script musicstudio_ghmix_control_helper_start 
	add_user_control_helper text = <start_text> button = start z = 100
endscript

script jam_recording_check_disconnect 
	<practice> = 0
	if ($game_mode = practice)
		<practice> = 1
	endif
	if NOT CD
		if ($allow_controller_for_all_instruments = 1)
			return
		endif
	endif
	getcontrollertype controller = ($primary_controller)
	begin
	prev_controller_type = <controller_type>
	getcontrollertype controller = ($primary_controller)
	GetActiveControllers
	<is_active_controller> = (<active_controllers> [($primary_controller)])
	data = {practice = <practice>}
	if GotParam \{recording_studio}
		data = {jamroom_new_functionallity practice = <practice>}
	endif
	if NOT (<is_active_controller> = 1)
		ui_event_wait state = uistate_recording_disconnect data = <data>
		return
	endif
	if NOT ((<controller_type> = guitar) || (<controller_type> = drum))
		ui_event_wait state = uistate_recording_disconnect data = <data>
		return
	endif
	if NOT (<controller_type> = <prev_controller_type>)
		ui_event_wait state = uistate_recording_disconnect data = <data>
		return
	endif
	Wait \{5
		gameframes}
	repeat
endscript
