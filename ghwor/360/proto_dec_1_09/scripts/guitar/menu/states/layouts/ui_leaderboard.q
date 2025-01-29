LeaderboardSearchValue = overall
leaderboardjumptobutton = ui_leaderboard_jump_to_friends

script ui_init_leaderboard 
	Change \{LeaderboardSearchValue = overall}
	Change \{leaderboardjumptobutton = ui_leaderboard_jump_to_friends}
	ui_leaderboard_reinit
endscript

script ui_create_leaderboard 
	setsoundbussparams \{Crowd = {
			vol = -100
			pitch = 0.0
		}
		time = 2}
	Change lb_controller = <device_num>
	Change current_leaderboard_song = <song>
	Change \{rich_presence_context = presence_leaderboards}
	instrument_rgba = black
	switch ($current_leaderboard_instrument)
		case 'guitar'
		instrument_tex = icon_instrument_guitar_top
		case 'backup'
		instrument_tex = icon_instrument_bass_top
		case 'drums'
		instrument_tex = icon_instrument_drums_top
		case 'mic'
		instrument_tex = icon_instrument_vox_top
		case 'band'
		case 'altband'
		instrument_tex = icon_band
		instrument_rgba = white
		default
		instrument_tex = white
	endswitch
	if isXenon
		row_gamertag_text = qs(0x87c2c294)
	else
		row_gamertag_text = qs(0x5217670b)
	endif
	CreateScreenElement {
		parent = root_window
		id = leaderboardinterface
		Type = descinterface
		desc = 'leaderboard'
		exclusive_device = ($lb_controller)
		z_priority = -100
		scroll_fill_easy_dims = (0.0, 0.0)
		scroll_fill_medium_dims = (0.0, 0.0)
		scroll_fill_hard_dims = (0.0, 0.0)
		scroll_fill_expert_dims = (0.0, 0.0)
		scroll_fill_xxpert_dims = (0.0, 0.0)
		icon_instrument_texture = <instrument_tex>
		icon_instrument_rgba = <instrument_rgba>
		row_head_gamertag_text = <row_gamertag_text>
		event_handlers = [
			{pad_back ui_sfx params = {menustate = Generic uitype = back}}
			{pad_back generic_event_back params = {mode = leaderboard pad_back_script = songlist_leaderboard_back}}
		]
	}
	if leaderboardinterface :desc_resolvealias \{Name = alias_menu}
		AssignAlias id = <resolved_id> alias = leaderboard_menu
		leaderboard_menu :se_setprops {
			event_handlers = [
				{pad_up ui_leaderboard_scroll_sound params = {up}}
				{pad_down ui_leaderboard_scroll_sound params = {down}}
				{pad_up ui_leaderboard_scroll params = {up}}
				{pad_down ui_leaderboard_scroll params = {down}}
				{pad_option ($leaderboardjumptobutton)}
				{pad_option2 ui_leaderboard_pad_rock_record}
				{pad_L1 ui_leaderboard_jump_to_me}
			]
			exclusive_device = ($lb_controller)
			alpha = 0
			allow_wrap = FALSE
			tags = {current_status = None}
		}
		if isxenonorwindx
			leaderboard_menu :se_setprops \{event_handlers = [
					{
						pad_start
						ui_leaderboard_show_gamercard
					}
				]}
		endif
		ui_leaderboard_check_online_status \{dont_check_lobby}
		NetSessionFunc \{func = friends_init}
		NetSessionFunc Obj = friends func = begin_retrieve_friends_list params = {callback = ui_leadeboard_get_friends device_num = ($lb_controller) callback_params = {None}}
		NetSessionFunc Obj = match func = get_gamertag params = {controller = ($lb_controller)}
		leaderboard_menu :SetTags {
			last_index = 0
			focus_pos = 0
			my_gamertag = <Name>
			total_size = 0
			easy_start = -1
			medium_start = -1
			hard_start = -1
			expert_start = -1
			expert_plus_start = -1
			num_start_received = 0
		}
		if ($current_leaderboard_group = song)
			get_song_title song = ($current_leaderboard_song)
			get_song_artist song = ($current_leaderboard_song)
			<id> :se_setprops {
				headline_text = qs(0x3cfbef77)
				song_name_text = (qs(0x07ee29ea) + <song_title> + qs(0x07ee29ea))
			}
		endif
		leaderboard_menu :se_setprops \{alpha = 1.0
			time = 0.1}
	endif
	array = []
	idx = 0
	begin
	CreateScreenElement {
		parent = leaderboard_menu
		Type = descinterface
		desc = 'leaderboard_row'
		autosizedims = FALSE
		event_handlers = [
			{focus ui_leaderboard_item_focus}
		]
		rank_text = qs(0x03ac90f0)
		gamertag_text = qs(0x03ac90f0)
		score_text = qs(0x03ac90f0)
		date_text = qs(0x03ac90f0)
		tags = {index = <idx> player_xuid = [0 , 0]}
	}
	GetScreenElementDims id = <id>
	<id> :se_setprops dims = (<width> * (1.0, 0.0) + (0.0, 37.0) * 1)
	AddArrayElement array = <array> element = <id>
	idx = (<idx> + 1)
	repeat ($lb_num_rows)
	leaderboard_menu :SetTags menu_items = <array>
	ui_leaderboard_add_helper_text
	leaderboardinterface :desc_resolvealias \{Name = alias_leaderboard_leader}
	AssignAlias id = <resolved_id> alias = leaderboard_leader
	leaderboard_leader :se_setprops \{rank_text = qs(0x03ac90f0)
		gamertag_text = qs(0x03ac90f0)
		score_text = qs(0x03ac90f0)
		date_text = qs(0x03ac90f0)
		difficulty_bg_alpha = 0}
	get_song_prefix song = ($current_leaderboard_song)
	formatText checksumName = lb_id '%a_%b' a = <song_prefix> b = ($current_leaderboard_instrument)
	Change current_leaderboard_id = <lb_id>
	leaderboardinterface :Obj_SpawnScriptNow \{ui_create_leaderboard_spawned}
	LaunchEvent \{Type = focus
		target = leaderboardinterface}
endscript

script ui_create_leaderboard_spawned 
	leaderboardinterface :obj_spawnscript \{ui_leaderboard_load_spin}
	begin
	ui_leaderboard_reinit
	if NetSessionFunc \{func = is_leaderboard_lobby_available}
		break
	endif
	Wait \{1
		Second}
	repeat 30
	if NOT ui_leaderboard_check_online_status
		return
	endif
	readleaderboardbydifficulty callback = ui_leaderboard_get_difficulty_start leaderboard_id = ($current_leaderboard_id) num_rows = 1 difficulty = easy
	readleaderboardbydifficulty callback = ui_leaderboard_get_difficulty_start leaderboard_id = ($current_leaderboard_id) num_rows = 1 difficulty = medium
	readleaderboardbydifficulty callback = ui_leaderboard_get_difficulty_start leaderboard_id = ($current_leaderboard_id) num_rows = 1 difficulty = hard
	readleaderboardbydifficulty callback = ui_leaderboard_get_difficulty_start leaderboard_id = ($current_leaderboard_id) num_rows = 1 difficulty = expert
	readleaderboardbydifficulty callback = ui_leaderboard_get_difficulty_start leaderboard_id = ($current_leaderboard_id) num_rows = 1 difficulty = expert_plus
	readleaderboardbyfriendslist {
		callback = ui_leaderboard_plot_friends_in_scrollbar
		leaderboard_id = ($current_leaderboard_id)
		offset = 0
		num_rows = ($lb_num_rows)
		controller_id = ($lb_controller)
	}
	Change \{lb_offset = 2}
	SpawnScriptNow ui_leaderboard_refresh_data params = {offset = ($lb_offset)}
endscript

script ui_leaderboard_reinit 
	NetSessionFunc \{func = stats_uninit}
	NetSessionFunc \{func = stats_init}
endscript

script ui_leaderboard_item_focus \{time = 0.1}
	leaderboardinterface :desc_resolvealias \{Name = alias_highlight}
	GetTags
	base_pos = (0.0, -107.0)
	menu_spacing = (0.0, 37.0)
	new_pos = (<base_pos> + <menu_spacing> * <index>)
	<resolved_id> :se_setprops Pos = <new_pos> hiddenlocal = FALSE
endscript

script ui_leaderboard_item_unfocus 
	leaderboardinterface :desc_resolvealias \{Name = alias_highlight}
	<resolved_id> :se_setprops hiddenlocal = true
endscript

script ui_return_leaderboard 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	ui_leaderboard_reinit
	leaderboard_menu :SetTags \{current_status = None}
	if ($LeaderboardSearchValue = friends)
		ui_leaderboard_add_helper_text \{blue_button_text = qs(0xccb53cc9)}
	else
		ui_leaderboard_add_helper_text
	endif
	leaderboard_menu :se_setprops \{unblock_events}
endscript

script ui_leaderboard_scroll_sound 
	menu_getselectedindex
	if GotParam \{up}
		if (<selected_index> = 0 && $lb_offset = 2)
			ui_sfx \{menustate = Generic
				uitype = scrollup}
			return
		endif
	else
		ui_sfx \{menustate = Generic
			uitype = scrolldown}
	endif
endscript

script ui_destroy_leaderboard 
	setsoundbussparams {Crowd = {vol = (($default_BussSet.Crowd.vol)) pitch = 0.0} time = 1}
	clean_up_user_control_helpers
	if ScreenElementExists \{id = leaderboardinterface}
		DestroyScreenElement \{id = leaderboardinterface}
	endif
endscript

script ui_leaderboard_check_online_status 
	if isXenon
		if NOT CheckForSignIn local controller_index = ($lb_controller)
			SpawnScriptLater ui_leaderboard_signin params = {song = ($current_leaderboard_song)}
			return \{FALSE}
		elseif NOT CheckForSignIn network_platform_only controller_index = ($lb_controller)
			SpawnScriptLater \{ui_leaderboard_process_failed
				params = {
					wait_frames = 2
				}}
			return \{FALSE}
		endif
	elseif isps3
		if NOT CheckForSignIn network_platform_only controller_index = ($lb_controller)
			SpawnScriptLater ui_leaderboard_signin params = {song = ($current_leaderboard_song)}
			return \{FALSE}
		endif
	endif
	if NetSessionFunc \{func = iscableunplugged}
		SpawnScriptLater \{ui_leaderboard_process_failed
			params = {
				wait_frames = 2
			}}
		return \{FALSE}
	endif
	if NOT NetSessionFunc \{func = isoldenoughforonline}
		SpawnScriptLater \{ui_leaderboard_not_old_enough}
		return \{FALSE}
	endif
	if NOT GotParam \{dont_check_lobby}
		if NOT NetSessionFunc \{func = is_leaderboard_lobby_available}
			SpawnScriptLater \{ui_leaderboard_process_failed
				params = {
					wait_frames = 2
				}}
			return \{FALSE}
		endif
	endif
	return \{true}
endscript

script ui_leaderboard_add_helper_text \{blue_button_text = qs(0xf41fb4ee)}
	clean_up_user_control_helpers
	if should_use_all_buttons
		all_button_params = {all_buttons}
	endif
	add_user_control_helper text = qs(0xaf4d5dd2) button = red <all_button_params> z = 100
	add_user_control_helper text = qs(0xbe4c0e5b) button = yellow <all_button_params> z = 100
	add_user_control_helper text = <blue_button_text> button = blue <all_button_params> z = 100
	add_user_control_helper text = qs(0x3acb1b43) button = orange <all_button_params> z = 100
	if isxenonorwindx
		add_user_control_helper text = qs(0x9a7d1fe5) button = start <all_button_params> z = 100
	endif
endscript

script ui_leaderboard_update_leader 
	printf \{'ui_leaderboard_update_leader'}
	printstruct <...>
	if (<status> = failed)
		SpawnScriptNow ui_leaderboard_process_failed params = {<...>}
		return
	endif
	if NOT ScreenElementExists \{id = leaderboardinterface}
		return
	endif
	leaderboard_menu :GetSingleTag \{current_status}
	if (<current_status> = failed)
		return
	endif
	GetArraySize <rows>
	if (<array_Size> > 0)
		formatText TextName = rank_text qs(0x76b3fda7) d = (<rows> [0].rank)
		if StructureContains structure = (<rows> [0]) band_members
			band_members_arr = (<rows> [0].band_members)
			GetArraySize <band_members_arr>
			difficulty_index = 0
			if (<array_Size> > 0)
				band_index = 0
				begin
				band_member = (<band_members_arr> [<band_index>])
				diff_idx = ($difficulty_list_props.(<band_member>.difficulty).index)
				if (<diff_idx> > <difficulty_index>)
					difficulty_index = <diff_idx>
				endif
				band_index = (<band_index> + 1)
				repeat <array_Size>
			endif
			ui_leaderboard_get_difficulty_icon difficulty = ($difficulty_list [<difficulty_index>])
		else
			ui_leaderboard_get_difficulty_icon difficulty = (<rows> [0].difficulty)
		endif
		ui_leaderboard_get_difficulty_score_text row = (<rows> [0])
		if (<rows> [0].days_on_board > 0)
			formatText TextName = date_text {
				qs(0xb6914fa1)
				a = (<rows> [0].days_on_board)
				b = (<rows> [0].hours_on_board)
				c = (<rows> [0].minutes_on_board)
			}
		else
			formatText TextName = date_text {
				qs(0x9800c230)
				a = (<rows> [0].hours_on_board)
				b = (<rows> [0].minutes_on_board)
				c = (<rows> [0].seconds_on_board)
			}
		endif
	else
		rows = [{gamertag = qs(0x03ac90f0) player_id = [0 0]}]
	endif
	leaderboardinterface :desc_resolvealias \{Name = alias_leaderboard_leader}
	<resolved_id> :se_setprops {
		rank_text = <rank_text>
		gamertag_text = (<rows> [0].gamer_tag)
		score_text = <score_text>
		date_text = <date_text>
		difficulty_icon_texture = <difficulty_icon>
		difficulty_bg_rgba = <difficulty_bg_rgba>
		difficulty_bg_alpha = 1
		event_handlers = [
			{focus ui_leaderboard_item_focus}
			{pad_down ui_sfx params = {menustate = Generic uitype = scrolldown}}
			{pad_down ui_leaderboard_leader_scroll_down}
			{pad_option ($leaderboardjumptobutton)}
			{pad_option2 ui_leaderboard_pad_rock_record}
			{pad_L1 ui_leaderboard_jump_to_me}
		]
		replace_handlers
		tags = {index = -1 player_xuid = (<rows> [0].player_id)}
	}
	if isxenonorwindx
		<resolved_id> :se_setprops {
			event_handlers = [
				{pad_start ui_leaderboard_show_gamercard}
			]
			replace_handlers
		}
	endif
endscript

script ui_leaderboard_clear_rows 
	if NOT ScreenElementExists \{id = leaderboard_menu}
		ScriptAssert \{qs(0xdbce8e79)}
		return
	endif
	leaderboard_menu :GetSingleTag \{menu_items}
	row_index = 0
	GetArraySize <menu_items>
	leaderboard_rows_size = <array_Size>
	if (<leaderboard_rows_size> > 0)
		begin
		current_id = (<menu_items> [<row_index>])
		<current_id> :se_setprops {
			gamertag_text = qs(0x03ac90f0)
			rank_text = qs(0x03ac90f0)
			score_text = qs(0x03ac90f0)
			date_text = qs(0x03ac90f0)
			difficulty_bg_alpha = 0
			tags = {player_xuid = [0 , 0]}
		}
		row_index = (<row_index> + 1)
		repeat <leaderboard_rows_size>
	endif
endscript

script ui_leaderboard_update_rows 
	printf \{'ui_leaderboard_update_rows'}
	printstruct <...>
	if (<status> = failed)
		SpawnScriptNow ui_leaderboard_process_failed params = {<...>}
		return
	endif
	if NOT ScreenElementExists \{id = leaderboardinterface}
		return
	endif
	leaderboard_menu :GetSingleTag \{current_status}
	if (<current_status> = failed)
		return
	endif
	leaderboard_menu :SetTags total_size = <total_size>
	leaderboard_menu :GetTags
	row_index = 0
	using_leader = 0
	GetArraySize <rows>
	leaderboard_rows_size = <array_Size>
	if (<leaderboard_rows_size> > 0)
		if ($LeaderboardSearchValue != friends)
			Change lb_offset = (<rows> [0].rank)
			if ($lb_offset < 2)
				Change \{lb_offset = 2}
			endif
		endif
		begin
		current_id = (<menu_items> [(<row_index> - <using_leader>)])
		formatText TextName = rank_text qs(0x76b3fda7) d = (<rows> [<row_index>].rank)
		if StructureContains structure = (<rows> [<row_index>]) band_members
			band_members_arr = (<rows> [<row_index>].band_members)
			GetArraySize <band_members_arr>
			difficulty_index = 0
			if (<array_Size> > 0)
				band_index = 0
				begin
				band_member = (<band_members_arr> [<band_index>])
				diff_idx = ($difficulty_list_props.(<band_member>.difficulty).index)
				if (<diff_idx> > <difficulty_index>)
					difficulty_index = <diff_idx>
				endif
				band_index = (<band_index> + 1)
				repeat <array_Size>
			endif
			ui_leaderboard_get_difficulty_icon difficulty = ($difficulty_list [<difficulty_index>])
		else
			ui_leaderboard_get_difficulty_icon difficulty = (<rows> [<row_index>].difficulty)
		endif
		ui_leaderboard_get_difficulty_score_text row = (<rows> [<row_index>])
		text_rgba = gh5_blue_xdk
		if ((<rows> [<row_index>].gamer_tag) = <my_gamertag>)
			text_rgba = [35 35 200 255]
			if ($LeaderboardSearchValue = me)
				focus_pos = (<row_index> - <using_leader>)
				last_index = (<row_index> - <using_leader>)
				update_scroll_params = {force_rank = (<rows> [<row_index>].rank - 1)}
			endif
		endif
		if isxenonorwindx
			if GotParam \{friendlist}
				GetArraySize <friendlist>
				friend_index = 0
				begin
				if ((<friendlist> [<friend_index>].id [1]) = (<rows> [<row_index>].player_id [1]))
					text_rgba = [200 35 35 255]
					break
				endif
				friend_index = (<friend_index> + 1)
				repeat <array_Size>
			endif
		endif
		if (<rows> [<row_index>].days_on_board > 0)
			formatText TextName = date_text {
				qs(0xb6914fa1)
				a = (<rows> [<row_index>].days_on_board)
				b = (<rows> [<row_index>].hours_on_board)
				c = (<rows> [<row_index>].minutes_on_board)
			}
		else
			formatText TextName = date_text {
				qs(0x9800c230)
				a = (<rows> [<row_index>].hours_on_board)
				b = (<rows> [<row_index>].minutes_on_board)
				c = (<rows> [<row_index>].seconds_on_board)
			}
		endif
		menu_id = <current_id>
		if (<row_index> = 0)
			if (qs(0x22ee76e7) = <rank_text>)
				menu_id = leaderboard_leader
				using_leader = 1
				update_scroll_params = {force_rank = 0}
				last_index = 0
			endif
		endif
		<menu_id> :se_setprops {
			gamertag_text = (<rows> [<row_index>].gamer_tag)
			rank_text = <rank_text>
			score_text = <score_text>
			date_text = <date_text>
			difficulty_icon_texture = <difficulty_icon>
			difficulty_bg_rgba = <difficulty_bg_rgba>
			difficulty_bg_alpha = 1
			text_rgba = <text_rgba>
		}
		<menu_id> :SetTags player_xuid = (<rows> [<row_index>].player_id)
		row_index = (<row_index> + 1)
		if (<row_index> - <using_leader> >= $lb_num_rows)
			break
		endif
		repeat <leaderboard_rows_size>
	endif
	leaderboard_menu :SetTags focus_pos = <focus_pos> last_index = <last_index>
	ui_leaderboard_update_scroll <update_scroll_params>
	leaderboard_menu :se_setprops \{alpha = 1.0
		time = 0.1}
	leaderboardinterface :obj_spawnscript \{ui_leaderboard_load_spin_kill}
	leaderboard_leader :se_setprops \{unblock_events}
	leaderboard_menu :se_setprops \{unblock_events}
	if (<using_leader> = 1)
		LaunchEvent \{Type = unfocus
			target = leaderboard_menu}
		LaunchEvent \{Type = focus
			target = leaderboard_leader}
	else
		LaunchEvent Type = focus target = leaderboard_menu data = {child_index = <focus_pos>}
	endif
endscript

script ui_leaderboard_get_difficulty_icon 
	difficulty_bg_rgba = gh5_dif_easy
	difficulty_icon = icon_difficulty_easy
	switch <difficulty>
		case beginner
		case easy
		difficulty_bg_rgba = gh5_dif_easy
		difficulty_icon = icon_difficulty_easy
		case medium
		difficulty_bg_rgba = gh5_dif_medium
		difficulty_icon = icon_difficulty_medium
		case hard
		difficulty_bg_rgba = gh5_dif_hard
		difficulty_icon = icon_difficulty_hard
		case expert
		difficulty_bg_rgba = gh5_dif_expert
		difficulty_icon = icon_difficulty_expert
		case expert_plus
		difficulty_bg_rgba = gh5_dif_xxpert
		difficulty_icon = icon_difficulty_expert_plus
	endswitch
	return difficulty_icon = <difficulty_icon> difficulty_bg_rgba = <difficulty_bg_rgba>
endscript

script ui_leaderboard_get_instrument_icon 
	switch ($current_leaderboard_instrument)
		case guitar
		return \{instrument_icon = mixer_icon_guitar
			instrument_text = qs(0xeabf65f8)}
		case backup
		return \{instrument_icon = mixer_icon_bass
			instrument_text = qs(0xef9ff915)}
		case drums
		return \{instrument_icon = mixer_icon_drums
			instrument_text = qs(0x5121e5b2)}
		case mic
		return \{instrument_icon = mixer_icon_vox
			instrument_text = qs(0xa1f34e3c)}
	endswitch
endscript

script ui_leaderboard_scroll 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	GetSingleTag \{current_status}
	if (<current_status> = failed)
		ui_leaderboard_item_unfocus
		return
	endif
	Wait \{1
		gameframe}
	Obj_GetID
	SetScreenElementLock id = <objID> lock
	SetScreenElementLock id = <objID> unlock
	menu_getselectedindex
	GetSingleTag \{total_size}
	GetSingleTag \{last_index}
	SetTags last_index = <selected_index>
	if (<selected_index> = <last_index>)
		LaunchEvent \{Type = unfocus
			target = leaderboard_menu}
		se_setprops \{block_events}
		ui_leaderboard_item_unfocus
		failed = 0
		if GotParam \{down}
			if ($lb_offset + $lb_num_rows <= <total_size>)
				Change lb_offset = ($lb_offset + $lb_num_rows)
				SpawnScriptNow ui_leaderboard_refresh_data params = {offset = ($lb_offset) Dir = down}
				SetTags \{focus_pos = 0
					last_index = 0}
			else
				failed = 1
			endif
		else
			if ($lb_offset <= 2)
				failed = 1
				if (<selected_index> = 0)
					if ScreenElementExists \{id = leaderboard_leader}
						LaunchEvent \{Type = focus
							target = leaderboard_leader}
						ui_leaderboard_update_scroll
						return
					endif
				endif
			elseif ($lb_offset < 11)
				Change \{lb_offset = 2}
			else
				Change lb_offset = ($lb_offset - $lb_num_rows)
			endif
			if (<failed> = 0)
				SetTags focus_pos = ($lb_num_rows - 1) last_index = ($lb_num_rows - 1)
				SpawnScriptNow ui_leaderboard_refresh_data params = {offset = ($lb_offset) Dir = up}
			endif
		endif
		if (<failed> = 1)
			se_setprops \{unblock_events}
			LaunchEvent \{Type = focus
				target = leaderboard_menu}
			return
		endif
	endif
	ui_leaderboard_update_scroll
endscript

script ui_leaderboard_leader_scroll_down 
	if ScreenElementExists \{id = leaderboard_leader}
		LaunchEvent \{Type = unfocus
			target = leaderboard_leader}
	endif
	if ScreenElementExists \{id = leaderboard_menu}
		leaderboard_menu :se_setprops \{unblock_events}
		LaunchEvent \{Type = focus
			target = leaderboard_menu
			data = {
				child_index = 0
			}}
		ui_leaderboard_update_scroll
	endif
endscript

script ui_leaderboard_refresh_data 
	if ScreenElementExists \{id = leaderboardinterface}
		leaderboard_menu :GetSingleTag \{current_status}
		if (<current_status> = failed)
			return
		endif
	endif
	if ($LeaderboardSearchValue = me)
		Change \{LeaderboardSearchValue = overall}
	endif
	if GotParam \{Dir}
		leaderboardinterface :obj_spawnscript ui_leaderboard_pulse_arrow params = {Dir = <Dir>}
	endif
	ui_leaderboard_clear_rows
	if NOT ScriptIsRunning \{ui_leaderboard_load_spin}
		leaderboardinterface :obj_spawnscript \{ui_leaderboard_load_spin}
	endif
	Wait \{1
		Second}
	if NOT ScreenElementExists \{id = leaderboardinterface}
		return
	endif
	if NOT GotParam \{Dir}
		readleaderboardbyoffset {
			callback = ui_leaderboard_update_leader
			leaderboard_id = ($current_leaderboard_id)
			offset = 1
			num_rows = 1
		}
	endif
	if ($LeaderboardSearchValue = overall)
		readleaderboardbyoffset {
			callback = ui_leaderboard_update_rows
			leaderboard_id = ($current_leaderboard_id)
			offset = <offset>
			num_rows = ($lb_num_rows)
		}
	elseif ($LeaderboardSearchValue = friends)
		Change \{lb_offset = 0}
		readleaderboardbyfriendslist {
			callback = ui_leaderboard_update_rows
			leaderboard_id = ($current_leaderboard_id)
			offset = <offset>
			num_rows = ($lb_num_rows)
		}
	elseif ($LeaderboardSearchValue = me)
		readleaderboardbypivot {
			callback = ui_leaderboard_update_rows
			leaderboard_id = ($current_leaderboard_id)
			controller_index = ($lb_controller)
			num_rows = ($lb_num_rows)
		}
	endif
endscript

script ui_leaderboard_pulse_arrow 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if (<Dir> = down)
		leaderboardinterface :desc_resolvealias \{Name = alias_leaderboard_scroll_arrow_dn}
	else
		leaderboardinterface :desc_resolvealias \{Name = alias_leaderboard_scroll_arrow_up}
	endif
	<resolved_id> :se_getprops
	original_dims = <dims>
	<resolved_id> :se_setprops dims = (<dims> * 1.3) time = 0.08
	<resolved_id> :se_waitprops
	<resolved_id> :se_setprops dims = <original_dims> time = 0.08
	<resolved_id> :se_waitprops
endscript

script ui_leaderboard_plot_friends_in_scrollbar 
	printf \{'ui_leaderboard_plot_friends_in_scrollbar'}
	printstruct <...>
	if (<status> = failed)
		SpawnScriptNow ui_leaderboard_process_failed params = {<...>}
		return
	endif
	if ScreenElementExists \{id = leaderboardinterface}
		leaderboard_menu :GetSingleTag \{current_status}
		if (<current_status> = failed)
			return
		endif
		if (<total_size> > 0)
			GetArraySize <rows>
			if (<array_Size> > 0)
				idx = 0
				begin
				rank = (<rows> [<idx>].rank - 1)
				ratio = (<rank> / ((<total_size>) * 1.0))
				friend_line_pos = ((0.0, 416.0) * <ratio>)
				leaderboardinterface :desc_resolvealias \{Name = alias_scroll_container}
				CreateScreenElement {
					Type = SpriteElement
					parent = <resolved_id>
					texture = leaderboard_scroll_friend
					rgba = gh5_blue_lt
					just = [center center]
					Pos = ((8.0, 48.0) + <friend_line_pos>)
					dims = (64.0, 16.0)
					z_priority = 10
				}
				idx = (<idx> + 1)
				repeat <array_Size>
			endif
		endif
	endif
endscript

script ui_leadeboard_get_friends 
	if ScreenElementExists \{id = leaderboard_menu}
		if GotParam \{friendlist}
			GetArraySize <friendlist>
			if (<array_Size> > 0)
				leaderboard_menu :SetTags friendlist = <friendlist>
			endif
		endif
	endif
endscript

script ui_leaderboard_jump_to_overall 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	ui_sfx \{menustate = Generic
		uitype = select}
	ui_leaderboard_clear_rows
	leaderboard_leader :se_setprops \{rank_text = qs(0x03ac90f0)
		gamertag_text = qs(0x03ac90f0)
		score_text = qs(0x03ac90f0)
		date_text = qs(0x03ac90f0)
		difficulty_bg_alpha = 0}
	leaderboard_leader :SetTags \{player_xuid = [
			0
			0
		]}
	leaderboardinterface :obj_spawnscript \{ui_leaderboard_load_spin}
	se_setprops \{block_events}
	ui_leaderboard_item_unfocus
	LaunchEvent \{Type = unfocus
		target = leaderboard_leader}
	LaunchEvent \{Type = unfocus
		target = leaderboard_menu}
	SetTags \{focus_pos = 0
		last_index = 0}
	Change \{LeaderboardSearchValue = overall}
	Change \{leaderboardjumptobutton = ui_leaderboard_jump_to_friends}
	Change \{lb_offset = 2}
	leaderboard_menu :se_setprops {
		event_handlers = [
			{pad_option ($leaderboardjumptobutton)}
		]
		replace_handlers
	}
	leaderboard_leader :se_setprops {
		event_handlers = [
			{pad_option ($leaderboardjumptobutton)}
		]
		replace_handlers
	}
	Wait \{1
		Second}
	if NOT ScreenElementExists \{id = leaderboardinterface}
		return
	endif
	readleaderboardbyoffset {
		callback = ui_leaderboard_update_leader
		leaderboard_id = ($current_leaderboard_id)
		offset = 1
		num_rows = 1
	}
	ui_leaderboard_add_helper_text
	readleaderboardbyoffset {
		callback = ui_leaderboard_update_rows
		leaderboard_id = ($current_leaderboard_id)
		offset = ($lb_offset)
		num_rows = ($lb_num_rows)
	}
endscript

script ui_leaderboard_jump_to_me 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	ui_sfx \{menustate = Generic
		uitype = select}
	ui_leaderboard_clear_rows
	leaderboard_leader :se_setprops \{rank_text = qs(0x03ac90f0)
		gamertag_text = qs(0x03ac90f0)
		score_text = qs(0x03ac90f0)
		date_text = qs(0x03ac90f0)
		difficulty_bg_alpha = 0}
	leaderboard_leader :SetTags \{player_xuid = [
			0
			0
		]}
	leaderboardinterface :obj_spawnscript \{ui_leaderboard_load_spin}
	se_setprops \{block_events}
	ui_leaderboard_item_unfocus
	LaunchEvent \{Type = unfocus
		target = leaderboard_leader}
	LaunchEvent \{Type = unfocus
		target = leaderboard_menu}
	SetTags focus_pos = ($lb_num_rows / 2) last_index = ($lb_num_rows / 2)
	Change \{LeaderboardSearchValue = me}
	Wait \{1
		Second}
	if NOT ScreenElementExists \{id = leaderboardinterface}
		return
	endif
	readleaderboardbyoffset {
		callback = ui_leaderboard_update_leader
		leaderboard_id = ($current_leaderboard_id)
		offset = 1
		num_rows = 1
	}
	readleaderboardbypivot {
		callback = ui_leaderboard_update_rows
		leaderboard_id = ($current_leaderboard_id)
		controller_index = ($lb_controller)
		num_rows = ($lb_num_rows + 1)
	}
endscript

script ui_leaderboard_jump_to_friends 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	ui_sfx \{menustate = Generic
		uitype = select}
	ui_leaderboard_clear_rows
	leaderboard_leader :se_setprops \{rank_text = qs(0x03ac90f0)
		gamertag_text = qs(0x03ac90f0)
		score_text = qs(0x03ac90f0)
		date_text = qs(0x03ac90f0)
		difficulty_bg_alpha = 0}
	leaderboard_leader :SetTags \{player_xuid = [
			0
			0
		]}
	leaderboardinterface :obj_spawnscript \{ui_leaderboard_load_spin}
	se_setprops \{block_events}
	ui_leaderboard_item_unfocus
	LaunchEvent \{Type = unfocus
		target = leaderboard_leader}
	LaunchEvent \{Type = unfocus
		target = leaderboard_menu}
	SetTags \{focus_pos = 0
		last_index = 0}
	Change \{LeaderboardSearchValue = friends}
	Change \{leaderboardjumptobutton = ui_leaderboard_jump_to_overall}
	Change \{lb_offset = 2}
	leaderboard_menu :se_setprops {
		event_handlers = [
			{pad_option ($leaderboardjumptobutton)}
		]
		replace_handlers
	}
	leaderboard_leader :se_setprops {
		event_handlers = [
			{pad_option ($leaderboardjumptobutton)}
		]
		replace_handlers
	}
	ui_leaderboard_add_helper_text \{blue_button_text = qs(0xccb53cc9)}
	Wait \{1
		Second}
	if NOT ScreenElementExists \{id = leaderboardinterface}
		return
	endif
	readleaderboardbyfriendslist {
		callback = ui_leaderboard_update_leader
		leaderboard_id = ($current_leaderboard_id)
		offset = 0
		num_rows = 1
		controller_id = ($lb_controller)
	}
	readleaderboardbyfriendslist {
		callback = ui_leaderboard_update_rows
		leaderboard_id = ($current_leaderboard_id)
		offset = 1
		num_rows = ($lb_num_rows)
		controller_id = ($lb_controller)
	}
endscript

script ui_leaderboard_show_gamercard 
	if ui_leaderboard_check_online_status
		leaderboard_menu :GetTags
		if (<last_index> != -1)
			if isscreenelementinfocus \{id = leaderboard_leader}
				leaderboard_leader :GetTags
				if (<player_xuid> [0] != 0 && <player_xuid> [1] != 0)
					NetSessionFunc func = showGamerCard params = {player_xuid = <player_xuid> controller_index = ($lb_controller)}
				endif
			else
				(<menu_items> [<last_index>]) :GetTags
				printstruct <...>
				if (<player_xuid> [0] != 0 && <player_xuid> [1] != 0)
					NetSessionFunc func = showGamerCard params = {player_xuid = <player_xuid> controller_index = ($lb_controller)}
				endif
			endif
		endif
	endif
endscript

script ui_leaderboard_update_scroll 
	if ($LeaderboardSearchValue = friends)
		return
	endif
	leaderboard_menu :GetTags
	if (<total_size> > 0)
		if isscreenelementinfocus \{id = leaderboard_leader}
			leaderboardinterface :se_setprops \{pointer_pos = (0.0, 0.0)}
		else
			if (<last_index> = -1)
				last_index = 0
			endif
			if GotParam \{force_rank}
				current_rank = <force_rank>
			else
				current_rank = ($lb_offset + <last_index> - 1)
			endif
			total_size = (<total_size> - 1)
			if (<current_rank> > <total_size>)
				current_rank = <total_size>
			endif
			if (<total_size> = 0)
				ratio = 0
			else
				ratio = (<current_rank> / ((<total_size>) * 1.0))
			endif
			printf \{'ui_leaderboard_update_scroll'}
			printstruct <...>
			leaderboardinterface :se_setprops pointer_pos = ((0.0, 416.0) * <ratio>)
		endif
	endif
endscript

script ui_leaderboard_get_difficulty_score_text 
	score = (<row>.score)
	CastToInteger \{score}
	formatText TextName = score_text qs(0x76b3fda7) d = <score>
	return score_text = <score_text>
endscript

script ui_leaderboard_view_current_song 
	ui_event event = menu_change state = uistate_leaderboard data = {song = ($current_leaderboard_song)}
endscript

script ui_leaderboard_process_failed 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if GotParam \{wait_frames}
		Wait <wait_frames> gameframes
	endif
	printf \{'ui_leaderboard_process_failed 1'}
	printstruct <...>
	if ScreenElementExists \{id = leaderboardinterface}
		leaderboard_menu :GetSingleTag \{current_status}
		printstruct <...>
		if NOT (<current_status> = failed)
			leaderboard_menu :SetTags \{current_status = failed}
			ui_leaderboard_get_error_text reason = <reason>
			printf \{'ui_leaderboard_process_failed 3'}
			printstruct <...>
			Wait \{10
				gameframes}
			generic_event_replace state = uistate_generic_dialog_box data = {template = continue heading_text = qs(0xaa163738) body_text = <error_text>}
		endif
	endif
endscript

script ui_leaderboard_get_start_size 
	new_array = [0 0 0 0 0 0]
	GetArraySize <array>
	idx = 0
	begin
	start_num = (<array> [<idx>])
	if (<start_num> = -1)
		SetArrayElement ArrayName = new_array index = <idx> NewValue = 0
	else
		if (<idx> + 1 < <array_Size>)
			jdx = (<idx> + 1)
			begin
			next_start = (<array> [<jdx>])
			if (<next_start> != -1)
				size = (<array> [<idx>] - <array> [<jdx>])
				SetArrayElement ArrayName = new_array index = <jdx> NewValue = <size>
				break
			endif
			jdx = (<jdx> + 1)
			repeat (<array_Size> - (<idx> + 1))
		endif
	endif
	idx = (<idx> + 1)
	repeat <array_Size>
	return new_array = <new_array>
endscript

script ui_leaderboard_resize_scroll 
	if ScreenElementExists \{id = award_case_desc_id}
		printf \{qs(0xa0430085)}
		award_case_desc_id :GetTags
		if (<total_size> > 0 && <num_start_received> = 5)
			if award_case_desc_id :desc_resolvealias \{Name = alias_difficulty_scrollbar_wgt}
				generic_scrollbar_wgt_set_resolution id = <resolved_id> num_elements = <total_size>
				generic_scrollbar_wgt_update_thumb_pos id = <resolved_id> index = 0
				award_case_desc_id :se_setprops \{difficulty_scroll_alpha = 1}
				if award_case_desc_id :desc_resolvealias \{Name = alias_friends_scrollbar
						param = scrollbar_id}
					<scrollbar_id> :se_setprops alpha = 0.0
				endif
			endif
			array = [0 0 0 0 0 0]
			SetArrayElement ArrayName = array index = 0 NewValue = (<total_size> + 1)
			SetArrayElement ArrayName = array index = 1 NewValue = <easy_start>
			SetArrayElement ArrayName = array index = 2 NewValue = <medium_start>
			SetArrayElement ArrayName = array index = 3 NewValue = <hard_start>
			SetArrayElement ArrayName = array index = 4 NewValue = <expert_start>
			SetArrayElement ArrayName = array index = 5 NewValue = <expert_plus_start>
			ui_leaderboard_get_start_size array = <array>
			easy_size = (<new_array> [1])
			medium_size = (<new_array> [2])
			hard_size = (<new_array> [3])
			expert_size = (<new_array> [4])
			expert_plus_size = (<new_array> [5])
			easy_percent = (<easy_size> / (<total_size> * 1.0))
			medium_percent = (<medium_size> / (<total_size> * 1.0))
			hard_percent = (<hard_size> / (<total_size> * 1.0))
			expert_percent = (<expert_size> / (<total_size> * 1.0))
			expert_plus_percent = (<expert_plus_size> / (<total_size> * 1.0))
			total_heh = (<easy_percent> + <medium_percent> + <hard_percent> + <expert_percent> + <expert_plus_percent>)
			easy_dims = ((60.0, 0.0) + (0.0, 1.0) * (<easy_percent> * 275))
			medium_dims = ((60.0, 0.0) + (0.0, 1.0) * (<medium_percent> * 275))
			hard_dims = ((60.0, 0.0) + (0.0, 1.0) * (<hard_percent> * 275))
			expert_dims = ((60.0, 0.0) + (0.0, 1.0) * (<expert_percent> * 275))
			expert_plus_dims = ((60.0, 0.0) + (0.0, 1.0) * (<expert_plus_percent> * 275))
			award_case_desc_id :se_setprops {
				scroll_fill_easy_dims = <easy_dims>
				scroll_fill_medium_dims = <medium_dims>
				scroll_fill_hard_dims = <hard_dims>
				scroll_fill_expert_dims = <expert_dims>
				scroll_fill_xxpert_dims = <expert_plus_dims>
			}
		endif
		printf \{'ui_leaderboard_resize_scroll'}
		printstruct <...>
	endif
endscript

script ui_leaderboard_get_difficulty_start 
	printf \{'ui_leaderboard_get_difficulty_start'}
	printstruct <...>
	if (<status> = failed)
		SpawnScriptNow ui_leaderboard_process_failed params = {<...>}
		return
	endif
	if NOT ScreenElementExists \{id = award_case_desc_id}
		return
	endif
	if (<status> = succeeded)
		award_case_desc_id :GetSingleTag \{num_start_received}
		award_case_desc_id :SetTags num_start_received = (<num_start_received> + 1)
		GetArraySize <rows>
		if (<array_Size> > 0)
			if ScreenElementExists \{id = award_case_desc_id}
				switch (<rows> [0].difficulty)
					case easy
					award_case_desc_id :SetTags total_size = <total_size> easy_start = (<rows> [0].rank)
					case medium
					award_case_desc_id :SetTags total_size = <total_size> medium_start = (<rows> [0].rank)
					case hard
					award_case_desc_id :SetTags total_size = <total_size> hard_start = (<rows> [0].rank)
					case expert
					award_case_desc_id :SetTags total_size = <total_size> expert_start = (<rows> [0].rank)
					case expert_plus
					award_case_desc_id :SetTags total_size = <total_size> expert_plus_start = (<rows> [0].rank)
				endswitch
				ui_leaderboard_resize_scroll
			endif
		endif
	endif
endscript

script ui_leaderboard_pad_rock_record 
	printf \{'ui_leaderboard_pad_rock_record'}
	printstruct <...>
	leaderboard_menu :GetTags
	if (<last_index> != -1)
		if isscreenelementinfocus \{id = leaderboard_leader}
			leaderboard_leader :GetTags
			if (<player_xuid> [0] != 0 && <player_xuid> [1] != 0)
				display_rock_record net_id = <player_xuid> unfocus_id = leaderboard_leader device_num = <device_num>
			endif
		else
			(<menu_items> [<last_index>]) :GetTags
			if (<player_xuid> [0] != 0 && <player_xuid> [1] != 0)
				display_rock_record net_id = <player_xuid> unfocus_id = leaderboard_menu device_num = <device_num>
			endif
		endif
	endif
endscript

script ui_create_leaderboard_failed 
	Wait \{2
		gameframes}
	ui_leaderboard_get_error_text
	temp = continue
	extra_params = {}
	if (<error> = notsignedin)
		temp = cancel_confirm
		extra_params = {
			options = [
				{
					func = generic_event_back
					text = qs(0xf7723015)
				}
				{
					func = ui_leaderboard_signin
					text = qs(0x17df5913)
				}
			]
		}
	endif
	generic_event_replace state = uistate_generic_dialog_box data = {template = <temp> heading_text = qs(0xaa163738) body_text = <error_text> <extra_params>}
endscript

script ui_leaderboard_signin 
	ui_sfx \{menustate = Generic
		uitype = select}
	Wait \{2
		gameframes}
	generic_event_replace state = uistate_signin data = {device_num = ($lb_controller) require_live = 1 new_state = uistate_leaderboard allow_back = 1 new_data = {device_num = ($lb_controller) song = ($current_leaderboard_song)}}
endscript

script ui_leaderboard_get_error_text 
	error = Default
	if isXenon
		signed_in = 0
		live_enabled = 0
		if NetSessionFunc func = isliveenabled params = {controller_index = ($lb_controller)}
			live_enabled = 1
		endif
		if CheckForSignIn network_platform_only controller_index = ($lb_controller)
			signed_in = 1
		endif
		if NetSessionFunc \{func = iscableunplugged}
			error = cableunplugged
		else
			if (<signed_in> = 0)
				error = notsignedin
			elseif (<signed_in> = 1)
				if (<live_enabled> = 0)
					error = notliveaccount
				endif
			endif
		endif
	elseif isps3
		signed_in = 0
		multiplayer_allowed = 0
		if CheckForSignIn \{network_platform_only}
			signed_in = 1
		endif
		if NetSessionFunc \{func = isoldenoughforonline}
			multiplayer_allowed = 1
		endif
		if (<signed_in> = 0)
			error = notsignedin
		else
			if NetSessionFunc \{func = iscableunplugged}
				error = cableunplugged
			elseif (<signed_in> = 1 && <multiplayer_allowed> = 0)
				error = notliveaccount
			endif
		endif
	endif
	if (<error> = Default)
		if NetSessionFunc \{func = is_leaderboard_lobby_available}
			if GotParam \{reason}
				switch (<reason>)
					case no_results
					case no_data_available
					if ($LeaderboardSearchValue = me)
						error = youhaventposted
					else
						error = nodataavailable
					endif
					case content_restricted
					error = contentrestricted
					default
				endswitch
			endif
		else
			if GotParam \{reason}
				if (<reason> = stats_call_timed_out)
					error = timedout
				endif
			endif
		endif
	endif
	if isXenon
		return error_text = ($leaderboard_error_text_xenon.<error>) error = <error>
	elseif isps3
		return error_text = ($leaderboard_error_text_ps3.<error>) error = <error>
	endif
	return \{error_text = qs(0xa8fbcc2e)}
endscript

script ui_leaderboard_load_spin 
	Obj_GetID
	if <objID> :desc_resolvealias Name = alias_instrument_spinner param = spinner_id
		<spinner_id> :se_setprops alpha = 1.0
		<spinner_id> :Obj_SpawnScriptNow savegame_ui_icon_anim
	endif
endscript

script ui_leaderboard_load_spin_kill 
	Obj_GetID
	if <objID> :desc_resolvealias Name = alias_instrument_spinner param = spinner_id
		<spinner_id> :Obj_KillSpawnedScript Name = savegame_ui_icon_anim
		<spinner_id> :se_setprops alpha = 0.0 time = 0.5
	endif
endscript
