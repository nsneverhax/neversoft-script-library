roadie_challenge_target_select_medal_textures = [
	ac_wgt_vinyl_frame
	ac_wgt_gold_frame
	ac_wgt_silver_frame
	ac_wgt_diamond_frame
]

script ui_create_roadie_challenge_target_select \{transition = 0x00000018}
	getplayerinfo ($g_leader_player_num) controller out = leader_controller
	switch (<transition>)
		case first_song
		playlist_getsongname \{index = 0}
		<song_name> = <requested_song_name>
		case next_song
		playlist_getnextsong
		<song_name> = <next_song>
		default
		ScriptAssert 'unhandled transition type %t' t = <transition>
	endswitch
	get_song_title song = <song_name>
	CreateScreenElement {
		parent = root_window
		Type = descinterface
		id = target_select
		desc = 'roadie_challenge_target_menu'
		header_text = <song_title>
		tags = {
			song_name = <song_name>
			leader_controller = <leader_controller>
			transition = <transition>
		}
	}
	if target_select :desc_resolvealias \{Name = alias_menu}
		AssignAlias id = <resolved_id> alias = target_select_menu
	else
		ScriptAssert \{'failed to resolve alias_menu'}
	endif
	target_select_menu :se_setprops {
		exclusive_device = <leader_controller>
		event_handlers = [
			{menu_selection_changed ui_sfx params = {menustate = Generic uitype = scrollup}}
			{pad_back roadie_challenge_target_select_back}
		]
	}
	if target_select :desc_resolvealias \{Name = alias_item_highlight}
		AssignAlias id = <resolved_id> alias = item_highlight
	else
		ScriptAssert \{'failed to resolve alias_item_highlight'}
	endif
	roadie_challenge_target_select_create_menu_items
	if target_select :desc_resolvealias \{Name = alias_generic_scrollbar_wgt}
		AssignAlias id = <resolved_id> alias = scrollbar
	else
		ScriptAssert \{'failed to resolve alias_generic_scrollbar_wgt'}
	endif
	generic_scrollbar_wgt_initialize \{id = scrollbar}
	generic_scrollbar_wgt_set_resolution id = scrollbar num_elements = <menu_item_count>
	clean_up_user_control_helpers
	add_gamertag_helper exclusive_device = <leader_controller> z = 100000
	add_user_control_helper \{text = qs(0x195ba859)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	LaunchEvent \{Type = focus
		target = target_select_menu
		data = {
			child_index = 0
		}}
endscript

script ui_destroy_roadie_challenge_target_select 
	clean_up_user_control_helpers
	DestroyScreenElement \{id = target_select}
endscript

script roadie_challenge_target_select_back 
	target_select :GetSingleTag \{transition}
	if (<transition> = first_song)
		songlist_component :membfunc_songlist_uistack_getmode
		if (<mode> = play_song)
			songlist_clear
		endif
	endif
	generic_event_back
endscript

script roadie_challenge_target_select_create_menu_items 
	target_select :GetSingleTag \{song_name}
	gman_getsongchallengeprops song_name = <song_name> instrument = None
	GetArraySize \{$g_qp_required_challenge_props_order}
	<inst_config_count> = (<array_Size> - 1)
	<inst_config_index> = 0
	<menu_item_count> = 0
	<challenge_index> = 0
	begin
	<inst_config> = ($g_qp_required_challenge_props_order [<inst_config_index>])
	if roadie_challenge_target_select_is_instrument_config_valid inst_config = <inst_config>
		<inst_config_valid> = true
	else
		<inst_config_valid> = FALSE
	endif
	if StructureContains structure = <challenge_props> <inst_config>
		GetArraySize (<challenge_props>.<inst_config>)
		<inst_challenge_count> = <array_Size>
		<inst_challenge_index> = 0
		begin
		<goal_name> = (<challenge_props>.<inst_config> [<inst_challenge_index>].goal_name)
		if (<inst_config_valid> = true)
			if roadie_challenge_target_select_is_goal_valid goal_name = <goal_name>
				roadie_challenge_target_select_add_menu_item {
					inst_config = <inst_config>
					goal_name = <goal_name>
					challenge_index = <challenge_index>
					menu_index = <menu_item_count>
				}
				<menu_item_count> = (<menu_item_count> + 1)
			endif
		endif
		<inst_challenge_index> = (<inst_challenge_index> + 1)
		<challenge_index> = (<challenge_index> + 1)
		repeat <inst_challenge_count>
	endif
	<inst_config_index> = (<inst_config_index> + 1)
	repeat <inst_config_count>
	return menu_item_count = <menu_item_count>
endscript

script roadie_challenge_target_select_add_menu_item \{inst_config = !q1768515945
		goal_name = !q1768515945
		challenge_index = !i1768515945
		menu_index = !i1768515945}
	target_select :GetSingleTag \{song_name}
	target_select :GetSingleTag \{leader_controller}
	quickplay_get_challenge_icon base_name = <goal_name>
	ExtendCrc <goal_name> '_info' out = challenge_struct
	<challenge_name_text> = ($<challenge_struct>.title_string)
	<challenge_description_text> = qs(0x03ac90f0)
	if StructureContains structure = ($<challenge_struct>) constants
		if StructureContains structure = ($<challenge_struct>.constants) desc_txt
			<challenge_description_text> = ($<challenge_struct>.constants.desc_txt)
		endif
	endif
	if (<inst_config> = Band)
		<instrument_icon_texture> = icon_band_sm
	else
		formatText checksumName = instrument_icon_texture 'icon_%i_fill' i = ($instrument_list.<inst_config>.text_nl)
	endif
	getsavegamefromcontroller controller = <leader_controller>
	GetGlobalTags savegame = <savegame> <song_name>
	<challenge_number> = (<challenge_index> + 1)
	if (<challenge_number> < 10)
		formatText checksumName = grade_checksum 'challenge0%s_grade' s = <challenge_number>
	else
		formatText checksumName = grade_checksum 'challenge%s_grade' s = <challenge_number>
	endif
	<challenge_grade> = (<...>.<grade_checksum>)
	<medal_bg_texture> = ($roadie_challenge_target_select_medal_textures [<challenge_grade>])
	gman_getchallengetargets song_name = <song_name> goal_name = <goal_name> instrument = <inst_config>
	GetArraySize <challenge_targets>
	if (<challenge_grade> < <array_Size>)
		<target_score> = (<challenge_targets> [<challenge_grade>])
	else
		if (<challenge_number> < 10)
			formatText checksumName = best_score_checksum 'challenge0%s_best_score' s = <challenge_number>
		else
			formatText checksumName = best_score_checksum 'challenge%s_best_score' s = <challenge_number>
		endif
		<target_score> = ((<...>.<best_score_checksum>) + 1)
	endif
	qp_get_score_string goal_name = <goal_name> score = <target_score>
	formatText {
		qs(0x0f4c2480)
		TextName = target_text
		s = <score_text>
	}
	CreateScreenElement {
		parent = target_select_menu
		Type = descinterface
		desc = 'roadie_challenge_target_menu_item'
		exclusive_device = <leader_controller>
		z_priority = 7
		event_handlers = [
			{focus roadie_challenge_target_select_item_focus}
			{pad_choose roadie_challenge_target_select_choose_challenge}
		]
		autosizedims = true
		tags = {
			inst_config = <inst_config>
			goal_name = <goal_name>
			challenge_index = <challenge_index>
			menu_index = <menu_index>
			challenge_name = <challenge_name_text>
			challenge_description = <challenge_description_text>
			challenge_grade = <challenge_grade>
			target_score = <target_score>
			target_score_text = <score_text>
		}
		challenge_name_text = <challenge_name_text>
		medal_bg_texture = <medal_bg_texture>
		challenge_icon_texture = <icon_name>
		instrument_icon_texture = <instrument_icon_texture>
		target_text = <target_text>
	}
	if NOT <id> :desc_resolvealias Name = alias_star_container param = star_container
		ScriptAssert \{'failed to resolve alias_star_container'}
	endif
	GetScreenElementChildren id = <star_container>
	<star> = 0
	if (<challenge_grade> > 0)
		begin
		(<children> [<star>]) :se_setprops rgba = [255 255 255 255] Scale = 1.4
		<star> = (<star> + 1)
		repeat <challenge_grade>
	endif
endscript

script roadie_challenge_target_select_item_focus 
	Obj_GetID
	GetSingleTag \{menu_index}
	GetSingleTag \{challenge_description}
	generic_scrollbar_wgt_update_thumb_pos {
		id = scrollbar
		index = <menu_index>
	}
	item_highlight :se_setprops {
		parent = <objID>
		Pos = (0.0, 0.0)
		alpha = 0.4
		pos_anchor = [center center]
		just = [center center]
		z_priority = 0
	}
	target_select :se_setprops instructions_text = <challenge_description>
endscript

script roadie_challenge_target_select_choose_challenge 
	target_select :GetSingleTag \{song_name}
	GetSingleTag \{goal_name}
	GetSingleTag \{inst_config}
	GetSingleTag \{challenge_name}
	GetSingleTag \{challenge_description}
	GetSingleTag \{challenge_grade}
	GetSingleTag \{target_score}
	GetSingleTag \{target_score_text}
	ui_sfx \{menustate = Generic
		uitype = select}
	get_song_title song = <song_name>
	convert_to_ds_enum {
		order_array_name = roadie_battle_challenge_instrument_order
		checksum_value = <inst_config>
		out_name = challenge_instrument
	}
	wiidscommunication :sendmessage {
		roadie_challenge_info
		song_title = <song_title>
		challenge_name = <challenge_name>
		challenge_description = <challenge_description>
		challenge_instrument = <challenge_instrument>
		stars_earned = <challenge_grade>
		target_score = <target_score>
		target_score_text = <target_score_text>
	}
	roadie_battle_goto_ds_menu \{aids = $roadie_battle_signed_in_ds_aids
		menu_name = challenge}
	gman_challengemanagerfunc \{goal = quickplay
		tool = challenges
		func = disable_power_score_challenge}
	gman_setdata goal = quickplay params = {targeted_challenge = <goal_name> targeted_challenge_inst_config = <inst_config>}
	Change roadie_battle_targeted_challenge_score = <target_score>
	roadie_challenge_target_select_start_song
endscript

script roadie_challenge_target_select_start_song 
	target_select :GetSingleTag \{transition}
	switch (<transition>)
		case first_song
		gman_venuefunc {goal = quickplay tool = venue_handler func = set_venue params = {venue_name = ($g_band_lobby_current_level)}}
		create_loading_screen
		ui_event_wait \{event = menu_replace
			state = uistate_play_song
			data = {
				reset_target_data = 0
			}}
		case next_song
		if ($g_songlist_infinite_playlist = 1)
			playlist_removefirstsong \{populate_list = 1}
		else
			playlist_switchtonextsong
		endif
		Change \{songtime_paused = 0}
		Change \{gameplay_restart_song = 1}
		create_loading_screen
		generic_event_back \{state = Uistate_gameplay}
		default
		ScriptAssert 'unhandled transition type %t' t = <transition>
	endswitch
endscript

script roadie_challenge_target_select_is_instrument_config_valid \{inst_config = !q1768515945}
	getnumplayersingame
	if (<inst_config> = Band)
		if (<num_players> = 1)
			return \{FALSE}
		endif
	else
		getfirstplayer
		<found_instrument> = FALSE
		begin
		if playerinfoequals <Player> part = <inst_config>
			<found_instrument> = true
			break
		endif
		getnextplayer Player = <Player>
		repeat <num_players>
		if (<found_instrument> = FALSE)
			return \{FALSE}
		endif
	endif
	target_select :GetSingleTag \{song_name}
	get_song_difficulty_ratings song = <song_name>
	if (<inst_config> = Band)
		getfirstplayer
		<num_players_with_track> = 0
		begin
		getplayerinfo Player = <Player> part
		if (<part> = guitar && <guitar_difficulty_rating> != 0)
			<num_players_with_track> = (<num_players_with_track> + 1)
		elseif (<part> = bass && <bass_difficulty_rating> != 0)
			<num_players_with_track> = (<num_players_with_track> + 1)
		elseif (<part> = vocals && <vocals_difficulty_rating> != 0)
			<num_players_with_track> = (<num_players_with_track> + 1)
		elseif (<part> = drum && <drums_difficulty_rating> != 0)
			<num_players_with_track> = (<num_players_with_track> + 1)
		endif
		getnextplayer Player = <Player>
		repeat <num_players>
		if (<num_players_with_track> <= 1)
			return \{FALSE}
		endif
	endif
	return \{true}
endscript

script roadie_challenge_target_select_is_goal_valid \{goal_name = !q1768515945}
	if (<goal_name> = qp_power_score_points)
		return \{FALSE}
	endif
	ExtendCrc <goal_name> '_info' out = challenge_struct
	if StructureContains structure = ($<challenge_struct>) constants
		if StructureContains structure = ($<challenge_struct>.constants) required_band
			<required_band> = (($<challenge_struct>.constants.required_band) [0])
			switch (<required_band>)
				case solo_only
				getnumplayersingame
				if (<num_players> > 1)
					return \{FALSE}
				endif
				case standard_band
				if NOT is_traditional_game
					return \{FALSE}
				endif
				case non_standard_band
				if is_traditional_game
					return \{FALSE}
				endif
				default
				ScriptAssert 'unhandled band type %b' b = <required_band>
			endswitch
		endif
		if StructureContains structure = ($<challenge_struct>.constants) single_play_only
			getnumplayersingame
			if (<num_players> > 1)
				return \{FALSE}
			endif
		endif
	endif
	return \{true}
endscript

script should_show_roadie_challenge_target_select_screen 
	if is_roadie_battle_coop
		if NOT playlist_isfinished
			return \{true}
		endif
		if ($g_songlist_infinite_playlist = 1)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript
