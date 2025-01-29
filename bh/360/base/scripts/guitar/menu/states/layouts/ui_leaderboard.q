LeaderboardSearchValue = overall
LeaderboardJumpToButton = ui_leaderboard_jump_to_friends

script ui_init_leaderboard 
	Change \{LeaderboardSearchValue = overall}
	Change \{LeaderboardJumpToButton = ui_leaderboard_jump_to_friends}
	ui_leaderboard_reinit
endscript

script ui_create_leaderboard 
	SetSoundBussParams \{Crowd = {
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
		id = LeaderboardInterface
		type = DescInterface
		desc = 'leaderboard'
		exclusive_device = ($lb_controller)
		z_priority = -100
		scroll_fill_easy_dims = (0.0, 0.0)
		scroll_fill_medium_dims = (0.0, 0.0)
		scroll_fill_hard_dims = (0.0, 0.0)
		scroll_fill_expert_dims = (0.0, 0.0)
		scroll_fill_xxpert_dims = (0.0, 0.0)
		leader_gamertag_alpha = 0
		leaderboard_pointer_alpha = 0
		icon_instrument_texture = <instrument_tex>
		icon_instrument_rgba = <instrument_rgba>
		row_head_gamertag_text = <row_gamertag_text>
		event_handlers = [
			{pad_back generic_event_back params = {mode = leaderboard pad_back_script = songlist_leaderboard_back}}
		]
	}
	if LeaderboardInterface :Desc_ResolveAlias \{name = alias_diamondBling
			param = diamondBling_id}
		<diamondBling_id> :Obj_SpawnScript anim_bling_horizontal_sm_crown params = {minwidth = 12 maxwidth = 12 maxtime = 0.5}
	else
		ScriptAssert \{'UI_art'}
	endif
	if LeaderboardInterface :Desc_ResolveAlias \{name = alias_diamondBling2
			param = diamondBling2_id}
		<diamondBling2_id> :Obj_SpawnScript anim_bling_horizontal_sm_crown params = {minwidth = 12 maxwidth = 12 maxtime = 0.5}
	else
		ScriptAssert \{'UI_art'}
	endif
	if LeaderboardInterface :Desc_ResolveAlias \{name = alias_Menu}
		AssignAlias id = <resolved_id> alias = leaderboard_menu
		leaderboard_menu :SE_SetProps {
			event_handlers = [
				{pad_up ui_leaderboard_scroll_sound params = {up}}
				{pad_down ui_leaderboard_scroll_sound params = {down}}
				{pad_up ui_leaderboard_scroll params = {up}}
				{pad_down ui_leaderboard_scroll params = {down}}
				{pad_option ($LeaderboardJumpToButton)}
				{pad_option2 ui_leaderboard_pad_rock_record}
				{pad_L1 ui_leaderboard_jump_to_me}
			]
			exclusive_device = ($lb_controller)
			alpha = 0
			allow_wrap = false
			tags = {current_status = None}
		}
		if IsXenonOrWinDX
			leaderboard_menu :SE_SetProps \{event_handlers = [
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
			my_gamertag = <name>
			total_size = 0
			current_row_size = 0
			easy_start = -1
			medium_start = -1
			hard_start = -1
			expert_start = -1
			expert_plus_start = -1
			num_start_received = 0
			focus_leader = 0
		}
		if ($current_leaderboard_group = song)
			get_song_title song = ($current_leaderboard_song)
			get_song_artist song = ($current_leaderboard_song)
			<id> :SE_SetProps {
				headline_text = qs(0x3cfbef77)
				song_name_text = (qs(0x07ee29ea) + <song_title> + qs(0x07ee29ea))
			}
		endif
		leaderboard_menu :SE_SetProps \{alpha = 1.0
			time = 0.1}
	endif
	array = []
	idx = 0
	begin
	CreateScreenElement {
		parent = leaderboard_menu
		type = DescInterface
		desc = 'leaderboard_row'
		autoSizeDims = false
		event_handlers = [
			{focus ui_leaderboard_item_focus}
			{focus ui_leaderboard_text_focus}
			{unfocus ui_leaderboard_text_unfocus}
		]
		rank_text = qs(0x03ac90f0)
		GamerTag_text = qs(0x03ac90f0)
		score_text = qs(0x03ac90f0)
		date_text = qs(0x03ac90f0)
		tags = {index = <idx> player_xuid = [0 , 0] orig_text_color = GH51_blue_lt}
	}
	GetScreenElementDims id = <id>
	<id> :SE_SetProps dims = (<width> * (1.0, 0.0) + (0.0, 37.0) * 1)
	AddArrayElement array = <array> element = <id>
	idx = (<idx> + 1)
	repeat ($lb_num_rows)
	leaderboard_menu :SetTags menu_items = <array>
	ui_leaderboard_add_helper_text
	LeaderboardInterface :Desc_ResolveAlias \{name = alias_leaderboard_leader}
	AssignAlias id = <resolved_id> alias = leaderboard_leader
	leaderboard_leader :SE_SetProps \{rank_text = qs(0x03ac90f0)
		GamerTag_text = qs(0x03ac90f0)
		score_text = qs(0x03ac90f0)
		date_text = qs(0x03ac90f0)
		difficulty_bg_alpha = 0}
	get_song_prefix song = ($current_leaderboard_song)
	FormatText checksumname = lb_id '%a_%b' a = <song_prefix> b = ($current_leaderboard_instrument)
	Change current_leaderboard_id = <lb_id>
	LeaderboardInterface :Obj_SpawnScriptNow \{ui_create_leaderboard_spawned}
	LaunchEvent \{type = focus
		target = LeaderboardInterface}
endscript

script ui_create_leaderboard_spawned 
	LeaderboardInterface :Obj_SpawnScript \{ui_leaderboard_load_spin}
	begin
	ui_leaderboard_reinit
	if NetSessionFunc \{func = is_leaderboard_lobby_available}
		break
	endif
	wait \{1
		second}
	repeat 30
	if NOT ui_leaderboard_check_online_status
		return
	endif
	ReadLeaderboardByDifficulty callback = ui_leaderboard_get_difficulty_start leaderboard_id = ($current_leaderboard_id) num_rows = 1 difficulty = easy
	ReadLeaderboardByDifficulty callback = ui_leaderboard_get_difficulty_start leaderboard_id = ($current_leaderboard_id) num_rows = 1 difficulty = medium
	ReadLeaderboardByDifficulty callback = ui_leaderboard_get_difficulty_start leaderboard_id = ($current_leaderboard_id) num_rows = 1 difficulty = hard
	ReadLeaderboardByDifficulty callback = ui_leaderboard_get_difficulty_start leaderboard_id = ($current_leaderboard_id) num_rows = 1 difficulty = expert
	ReadLeaderboardByDifficulty callback = ui_leaderboard_get_difficulty_start leaderboard_id = ($current_leaderboard_id) num_rows = 1 difficulty = expert_plus
	ReadLeaderboardByFriendsList {
		callback = ui_leaderboard_plot_friends_in_scrollbar
		leaderboard_id = ($current_leaderboard_id)
		offset = 0
		num_rows = ($lb_num_rows)
		controller_Id = ($lb_controller)
	}
	Change \{lb_offset = 2}
	spawnscriptnow ui_leaderboard_refresh_data params = {offset = ($lb_offset)}
endscript

script ui_leaderboard_reinit 
	NetSessionFunc \{func = stats_uninit}
	NetSessionFunc \{func = stats_init}
endscript

script ui_leaderboard_item_focus \{time = 0.1}
	LeaderboardInterface :Desc_ResolveAlias \{name = alias_highlight}
	GetTags
	base_pos = (-28.0, -157.0)
	menu_spacing = (0.0, 38.0)
	new_pos = (<base_pos> + <menu_spacing> * <index>)
	<resolved_id> :SE_SetProps Pos = <new_pos> hiddenLocal = false
	if <resolved_id> :Obj_SpawnScript create_ui_highlight_particles params = {Pos = (300.0, 0.0) z = 26 parent = <leaderboard_row_highlight_id> start_scale = (0.1, 0.1) end_scale = (0.4, 0.4) emit_spread = 4 velocity = 1.0}
	else
		ScriptAssert \{'UI_art'}
	endif
endscript

script ui_leaderboard_item_unfocus 
	LeaderboardInterface :Desc_ResolveAlias \{name = alias_highlight}
	<resolved_id> :SE_SetProps hiddenLocal = true
endscript

script ui_leaderboard_text_focus 
	SE_SetProps \{text_rgba = GH51_blue_dk}
endscript

script ui_leaderboard_text_unfocus 
	GetTags
	SE_SetProps text_rgba = <orig_text_color>
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
	leaderboard_menu :SE_SetProps \{unblock_events}
endscript

script ui_leaderboard_scroll_sound 
	Menu_GetSelectedIndex
	if GotParam \{up}
		if (<selected_index> = 0 && $lb_offset = 2)
			return
		endif
	endif
	generic_menu_up_or_down_sound
endscript

script ui_destroy_leaderboard 
	SetSoundBussParams {Crowd = {vol = (($default_BussSet.Crowd.vol)) pitch = 0.0} time = 1}
	clean_up_user_control_helpers
	if ScreenElementExists \{id = LeaderboardInterface}
		DestroyScreenElement \{id = LeaderboardInterface}
	endif
endscript

script ui_leaderboard_check_online_status 
	if isXenon
		if NOT CheckForSignIn local controller_index = ($lb_controller)
			spawnscriptlater ui_leaderboard_signin params = {song = ($current_leaderboard_song)}
			return \{false}
		elseif NOT CheckForSignIn network_platform_only controller_index = ($lb_controller)
			spawnscriptlater \{ui_leaderboard_process_failed
				params = {
					wait_frames = 2
				}}
			return \{false}
		endif
	elseif IsPS3
		if NOT CheckForSignIn network_platform_only controller_index = ($lb_controller)
			spawnscriptlater ui_leaderboard_signin params = {song = ($current_leaderboard_song)}
			return \{false}
		endif
	endif
	if NetSessionFunc \{func = IsCableUnplugged}
		spawnscriptlater \{ui_leaderboard_process_failed
			params = {
				wait_frames = 2
			}}
		return \{false}
	endif
	if NOT NetSessionFunc \{func = IsOldEnoughForOnline}
		spawnscriptlater \{ui_leaderboard_not_old_enough}
		return \{false}
	endif
	if NOT GotParam \{dont_check_lobby}
		if NOT NetSessionFunc \{func = is_leaderboard_lobby_available}
			spawnscriptlater \{ui_leaderboard_process_failed
				params = {
					wait_frames = 2
				}}
			return \{false}
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
	if IsXenonOrWinDX
		add_user_control_helper text = qs(0x9a7d1fe5) button = start <all_button_params> z = 100
	endif
endscript

script ui_leaderboard_update_leader 
	printf \{'ui_leaderboard_update_leader'}
	printstruct <...>
	if (<status> = failed)
		spawnscriptnow ui_leaderboard_process_failed params = {<...>}
		return
	endif
	if NOT ScreenElementExists \{id = LeaderboardInterface}
		return
	endif
	leaderboard_menu :GetSingleTag \{current_status}
	if (<current_status> = failed)
		return
	endif
	GetArraySize <rows>
	if (<array_size> > 0)
		FormatText TextName = rank_text qs(0x76b3fda7) d = (<rows> [0].rank)
		if StructureContains structure = (<rows> [0]) band_members
			band_members_arr = (<rows> [0].band_members)
			GetArraySize <band_members_arr>
			difficulty_index = 0
			if (<array_size> > 0)
				band_index = 0
				begin
				band_member = (<band_members_arr> [<band_index>])
				diff_idx = ($difficulty_list_props.(<band_member>.difficulty).index)
				if (<diff_idx> > <difficulty_index>)
					difficulty_index = <diff_idx>
				endif
				band_index = (<band_index> + 1)
				repeat <array_size>
			endif
			ui_leaderboard_get_difficulty_icon difficulty = ($difficulty_list [<difficulty_index>])
		else
			ui_leaderboard_get_difficulty_icon difficulty = (<rows> [0].difficulty)
		endif
		ui_leaderboard_get_difficulty_score_text row = (<rows> [0])
		if (<rows> [0].days_on_board > 0)
			FormatText TextName = date_text {
				qs(0xb6914fa1)
				a = (<rows> [0].days_on_board)
				b = (<rows> [0].hours_on_board)
				c = (<rows> [0].minutes_on_board)
			}
		else
			FormatText TextName = date_text {
				qs(0x9800c230)
				a = (<rows> [0].hours_on_board)
				b = (<rows> [0].minutes_on_board)
				c = (<rows> [0].seconds_on_board)
			}
		endif
	else
		rows = [{GamerTag = qs(0x03ac90f0) player_id = [0 0]}]
	endif
	LeaderboardInterface :Desc_ResolveAlias \{name = alias_spotlighter}
	<resolved_id> :SE_SetProps hiddenLocal = false
	LeaderboardInterface :Desc_ResolveAlias \{name = alias_leaderboard_leader}
	<resolved_id> :SE_SetProps {
		rank_text = <rank_text>
		GamerTag_text = (<rows> [0].gamer_tag)
		score_text = <score_text>
		date_text = <date_text>
		difficulty_icon_texture = <difficulty_icon>
		difficulty_bg_rgba = <difficulty_bg_rgba>
		difficulty_bg_alpha = 1
		event_handlers = [
			{focus ui_leaderboard_item_focus}
			{focus ui_leaderboard_text_focus}
			{unfocus ui_leaderboard_text_unfocus}
			{pad_down generic_menu_up_or_down_sound}
			{pad_down ui_leaderboard_leader_scroll_down}
			{pad_option ($LeaderboardJumpToButton)}
			{pad_option2 ui_leaderboard_pad_rock_record}
			{pad_L1 ui_leaderboard_jump_to_me}
		]
		replace_handlers
		tags = {index = -1 player_xuid = (<rows> [0].player_id) orig_text_color = GH51_blue_lt}
	}
	LeaderboardInterface :SE_SetProps career_gig_select_leader_text = (<rows> [0].gamer_tag) leader_gamertag_alpha = 1
	if (<array_size> = 0)
		LeaderboardInterface :SE_SetProps \{leader_gamertag_alpha = 0}
	endif
	if IsXenonOrWinDX
		<resolved_id> :SE_SetProps {
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
	leaderboard_rows_size = <array_size>
	if (<leaderboard_rows_size> > 0)
		begin
		current_id = (<menu_items> [<row_index>])
		<current_id> :SE_SetProps {
			GamerTag_text = qs(0x03ac90f0)
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
		spawnscriptnow ui_leaderboard_process_failed params = {<...>}
		return
	endif
	if NOT ScreenElementExists \{id = LeaderboardInterface}
		return
	endif
	leaderboard_menu :GetSingleTag \{current_status}
	if (<current_status> = failed)
		return
	endif
	if ($LeaderboardSearchValue = friends)
		leaderboard_menu :SetTags friends_rows = <rows>
	endif
	leaderboard_menu :SetTags current_row_size = <total_size>
	leaderboard_menu :GetTags
	row_index = 0
	using_leader = 0
	GetArraySize <rows>
	leaderboard_rows_size = <array_size>
	if (<leaderboard_rows_size> > 0)
		if ($LeaderboardSearchValue != friends)
			Change lb_offset = (<rows> [0].rank)
			if ($lb_offset < 2)
				Change \{lb_offset = 2}
			endif
		endif
		begin
		current_id = (<menu_items> [(<row_index> - <using_leader>)])
		FormatText TextName = rank_text qs(0x76b3fda7) d = (<rows> [<row_index>].rank)
		if StructureContains structure = (<rows> [<row_index>]) band_members
			band_members_arr = (<rows> [<row_index>].band_members)
			GetArraySize <band_members_arr>
			difficulty_index = 0
			if (<array_size> > 0)
				band_index = 0
				begin
				band_member = (<band_members_arr> [<band_index>])
				diff_idx = ($difficulty_list_props.(<band_member>.difficulty).index)
				if (<diff_idx> > <difficulty_index>)
					difficulty_index = <diff_idx>
				endif
				band_index = (<band_index> + 1)
				repeat <array_size>
			endif
			ui_leaderboard_get_difficulty_icon difficulty = ($difficulty_list [<difficulty_index>])
		else
			ui_leaderboard_get_difficulty_icon difficulty = (<rows> [<row_index>].difficulty)
		endif
		ui_leaderboard_get_difficulty_score_text row = (<rows> [<row_index>])
		text_rgba = GH51_blue_lt
		if ((<rows> [<row_index>].gamer_tag) = <my_gamertag>)
			text_rgba = GH51_red_lt
			if ($LeaderboardSearchValue = me)
				focus_pos = (<row_index> - <using_leader>)
				last_index = (<row_index> - <using_leader>)
				update_scroll_params = {force_rank = (<rows> [<row_index>].rank - 1)}
				if (<rows> [<row_index>].rank = 1)
					focus_leader = 1
				endif
			endif
		endif
		if IsXenonOrWinDX
			if GotParam \{friendlist}
				GetArraySize <friendlist>
				friend_index = 0
				begin
				if ((<friendlist> [<friend_index>].id [1]) = (<rows> [<row_index>].player_id [1]))
					text_rgba = [200 35 35 255]
					break
				endif
				friend_index = (<friend_index> + 1)
				repeat <array_size>
			endif
		endif
		if (<rows> [<row_index>].days_on_board > 0)
			FormatText TextName = date_text {
				qs(0xb6914fa1)
				a = (<rows> [<row_index>].days_on_board)
				b = (<rows> [<row_index>].hours_on_board)
				c = (<rows> [<row_index>].minutes_on_board)
			}
		else
			FormatText TextName = date_text {
				qs(0x9800c230)
				a = (<rows> [<row_index>].hours_on_board)
				b = (<rows> [<row_index>].minutes_on_board)
				c = (<rows> [<row_index>].seconds_on_board)
			}
		endif
		menu_id = <current_id>
		if (<row_index> = 0)
			if (qs(0x22ee76e7) = <rank_text> || ($LeaderboardSearchValue = friends && $lb_offset = 2))
				menu_id = leaderboard_leader
				using_leader = 1
				update_scroll_params = {force_rank = 0}
				last_index = 0
			endif
		endif
		<menu_id> :SE_SetProps {
			GamerTag_text = (<rows> [<row_index>].gamer_tag)
			rank_text = <rank_text>
			score_text = <score_text>
			date_text = <date_text>
			difficulty_icon_texture = <difficulty_icon>
			difficulty_bg_rgba = <difficulty_bg_rgba>
			difficulty_bg_alpha = 1
			text_rgba = <text_rgba>
		}
		<menu_id> :SetTags player_xuid = (<rows> [<row_index>].player_id) orig_text_color = <text_rgba>
		row_index = (<row_index> + 1)
		if (<row_index> - <using_leader> >= $lb_num_rows)
			break
		endif
		repeat <leaderboard_rows_size>
	endif
	leaderboard_menu :SetTags focus_pos = <focus_pos> last_index = <last_index>
	ui_leaderboard_update_scroll <update_scroll_params>
	leaderboard_menu :SE_SetProps \{alpha = 1.0
		time = 0.1}
	LeaderboardInterface :Obj_SpawnScript \{ui_leaderboard_load_spin_kill}
	leaderboard_leader :SE_SetProps \{unblock_events}
	leaderboard_menu :SE_SetProps \{unblock_events}
	if (<focus_leader> = 1)
		LaunchEvent \{type = unfocus
			target = leaderboard_menu}
		LaunchEvent \{type = focus
			target = leaderboard_leader}
		leaderboard_menu :SetTags \{focus_leader = 0}
	else
		LaunchEvent type = focus target = leaderboard_menu data = {child_index = <focus_pos>}
	endif
endscript

script ui_leaderboard_get_difficulty_icon 
	difficulty_bg_rgba = GH5_dif_easy
	difficulty_icon = icon_difficulty_easy
	switch <difficulty>
		case beginner
		case easy
		difficulty_bg_rgba = GH5_dif_easy
		difficulty_icon = icon_difficulty_easy
		case medium
		difficulty_bg_rgba = GH5_dif_medium
		difficulty_icon = icon_difficulty_medium
		case hard
		difficulty_bg_rgba = GH5_dif_hard
		difficulty_icon = icon_difficulty_hard
		case expert
		difficulty_bg_rgba = GH5_dif_expert
		difficulty_icon = icon_difficulty_expert
		case expert_plus
		difficulty_bg_rgba = GH5_dif_xxpert
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
	wait \{1
		gameframe}
	Obj_GetID
	SetScreenElementLock id = <objID> lock
	SetScreenElementLock id = <objID> unlock
	Menu_GetSelectedIndex
	GetSingleTag \{current_row_size}
	GetSingleTag \{last_index}
	SetTags last_index = <selected_index>
	if (<selected_index> = <last_index>)
		LaunchEvent \{type = unfocus
			target = leaderboard_menu}
		SE_SetProps \{block_events}
		ui_leaderboard_item_unfocus
		failed = 0
		if GotParam \{down}
			if ($lb_offset + $lb_num_rows <= <current_row_size>)
				Change lb_offset = ($lb_offset + $lb_num_rows)
				spawnscriptnow ui_leaderboard_refresh_data params = {offset = ($lb_offset) Dir = down}
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
						LaunchEvent \{type = focus
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
				spawnscriptnow ui_leaderboard_refresh_data params = {offset = ($lb_offset) Dir = up}
			endif
		endif
		if (<failed> = 1)
			SE_SetProps \{unblock_events}
			LaunchEvent \{type = focus
				target = leaderboard_menu}
			return
		endif
	endif
	ui_leaderboard_update_scroll
endscript

script ui_leaderboard_leader_scroll_down 
	if ScreenElementExists \{id = leaderboard_leader}
		LaunchEvent \{type = unfocus
			target = leaderboard_leader}
	endif
	if ScreenElementExists \{id = leaderboard_menu}
		leaderboard_menu :SE_SetProps \{unblock_events}
		LaunchEvent \{type = focus
			target = leaderboard_menu
			data = {
				child_index = 0
			}}
		ui_leaderboard_update_scroll
	endif
endscript

script ui_leaderboard_refresh_data 
	if ScreenElementExists \{id = LeaderboardInterface}
		leaderboard_menu :GetSingleTag \{current_status}
		if (<current_status> = failed)
			return
		endif
	endif
	if ($LeaderboardSearchValue = me)
		Change \{LeaderboardSearchValue = overall}
	endif
	if GotParam \{Dir}
		LeaderboardInterface :Obj_SpawnScript ui_leaderboard_pulse_arrow params = {Dir = <Dir>}
	endif
	ui_leaderboard_clear_rows
	if NOT ScriptIsRunning \{ui_leaderboard_load_spin}
		LeaderboardInterface :Obj_SpawnScript \{ui_leaderboard_load_spin}
	endif
	wait \{1
		second}
	if NOT ScreenElementExists \{id = LeaderboardInterface}
		return
	endif
	if NOT GotParam \{Dir}
		ReadLeaderboardByOffset {
			callback = ui_leaderboard_update_leader
			leaderboard_id = ($current_leaderboard_id)
			offset = 1
			num_rows = 1
		}
	endif
	if ($LeaderboardSearchValue = overall)
		ReadLeaderboardByOffset {
			callback = ui_leaderboard_update_rows
			leaderboard_id = ($current_leaderboard_id)
			offset = <offset>
			num_rows = ($lb_num_rows)
		}
	elseif ($LeaderboardSearchValue = friends)
		ReadLeaderboardByFriendsList {
			callback = ui_leaderboard_update_rows
			leaderboard_id = ($current_leaderboard_id)
			offset = <offset>
			num_rows = ($lb_num_rows)
		}
	elseif ($LeaderboardSearchValue = me)
		ReadLeaderboardByPivot {
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
		LeaderboardInterface :Desc_ResolveAlias \{name = alias_leaderboard_scroll_arrow_dn}
	else
		LeaderboardInterface :Desc_ResolveAlias \{name = alias_leaderboard_scroll_arrow_up}
	endif
	<resolved_id> :SE_GetProps
	original_dims = <dims>
	<resolved_id> :SE_SetProps dims = (<dims> * 1.3) time = 0.08
	<resolved_id> :SE_WaitProps
	<resolved_id> :SE_SetProps dims = <original_dims> time = 0.08
	<resolved_id> :SE_WaitProps
endscript

script ui_leaderboard_plot_friends_in_scrollbar 
	if ScreenElementExists \{id = LeaderboardInterface}
		LeaderboardInterface :Obj_SpawnScript ui_leaderboard_plot_friends_in_scrollbar_spawned params = <...>
	endif
endscript

script ui_leaderboard_plot_friends_in_scrollbar_spawned 
	printf \{'ui_leaderboard_plot_friends_in_scrollbar'}
	printstruct <...>
	if (<status> = failed)
		spawnscriptnow ui_leaderboard_process_failed params = {<...>}
		return
	endif
	if ScreenElementExists \{id = LeaderboardInterface}
		leaderboard_menu :GetSingleTag \{current_status}
		if (<current_status> = failed)
			return
		endif
		begin
		leaderboard_menu :GetSingleTag \{current_row_size}
		if (<current_row_size> != 0)
			break
		endif
		wait \{1
			gameframe}
		repeat
		if NOT ScreenElementExists \{id = LeaderboardInterface}
			return
		endif
		GetArraySize <rows>
		if (<array_size> > 0)
			idx = 0
			begin
			rank = (<rows> [<idx>].rank - 1)
			ratio = (<rank> / ((<current_row_size>) * 1.0))
			friend_line_pos = (((0.0, 430.0) * <ratio>) - (0.0, 38.0))
			LeaderboardInterface :Desc_ResolveAlias \{name = alias_scroll_container}
			CreateScreenElement {
				type = SpriteElement
				parent = <resolved_id>
				texture = leaderboard_scroll_friend
				rgba = GH5_blue_lt
				just = [center center]
				pos_anchor = [center center]
				Pos = <friend_line_pos>
				dims = (60.0, 16.0)
				z_priority = 10
			}
			idx = (<idx> + 1)
			repeat <array_size>
		endif
	endif
endscript

script ui_leadeboard_get_friends 
	if ScreenElementExists \{id = leaderboard_menu}
		if GotParam \{friendlist}
			GetArraySize <friendlist>
			if (<array_size> > 0)
				leaderboard_menu :SetTags friendlist = <friendlist>
			endif
		endif
	endif
endscript

script ui_leaderboard_jump_to_overall 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	generic_menu_pad_choose_sound
	ui_leaderboard_clear_rows
	leaderboard_leader :SE_SetProps \{rank_text = qs(0x03ac90f0)
		GamerTag_text = qs(0x03ac90f0)
		score_text = qs(0x03ac90f0)
		date_text = qs(0x03ac90f0)
		difficulty_bg_alpha = 0}
	leaderboard_leader :SetTags \{player_xuid = [
			0
			0
		]}
	LeaderboardInterface :Desc_ResolveAlias \{name = alias_spotlighter}
	<resolved_id> :SE_SetProps hiddenLocal = true
	LeaderboardInterface :Obj_SpawnScript \{ui_leaderboard_load_spin}
	SE_SetProps \{block_events}
	ui_leaderboard_item_unfocus
	LaunchEvent \{type = unfocus
		target = leaderboard_leader}
	LaunchEvent \{type = unfocus
		target = leaderboard_menu}
	SetTags \{focus_pos = 0
		last_index = 0
		focus_leader = 0}
	leaderboard_leader :SE_SetProps \{text_rgba = GH51_blue_lt}
	Change \{LeaderboardSearchValue = overall}
	Change \{LeaderboardJumpToButton = ui_leaderboard_jump_to_friends}
	Change \{lb_offset = 2}
	leaderboard_menu :SE_SetProps {
		event_handlers = [
			{pad_option ($LeaderboardJumpToButton)}
		]
		replace_handlers
	}
	leaderboard_leader :SE_SetProps {
		event_handlers = [
			{pad_option ($LeaderboardJumpToButton)}
		]
		replace_handlers
	}
	wait \{1
		second}
	if NOT ScreenElementExists \{id = LeaderboardInterface}
		return
	endif
	ReadLeaderboardByOffset {
		callback = ui_leaderboard_update_leader
		leaderboard_id = ($current_leaderboard_id)
		offset = 1
		num_rows = 1
	}
	ui_leaderboard_add_helper_text
	ReadLeaderboardByOffset {
		callback = ui_leaderboard_update_rows
		leaderboard_id = ($current_leaderboard_id)
		offset = ($lb_offset)
		num_rows = ($lb_num_rows)
	}
endscript

script ui_leaderboard_jump_to_me 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	generic_menu_pad_choose_sound
	ui_leaderboard_clear_rows
	leaderboard_leader :SE_SetProps \{rank_text = qs(0x03ac90f0)
		GamerTag_text = qs(0x03ac90f0)
		score_text = qs(0x03ac90f0)
		date_text = qs(0x03ac90f0)
		difficulty_bg_alpha = 0}
	leaderboard_leader :SetTags \{player_xuid = [
			0
			0
		]}
	LeaderboardInterface :Desc_ResolveAlias \{name = alias_spotlighter}
	<resolved_id> :SE_SetProps hiddenLocal = true
	LeaderboardInterface :Obj_SpawnScript \{ui_leaderboard_load_spin}
	SE_SetProps \{block_events}
	ui_leaderboard_item_unfocus
	LaunchEvent \{type = unfocus
		target = leaderboard_leader}
	LaunchEvent \{type = unfocus
		target = leaderboard_menu}
	SetTags focus_pos = ($lb_num_rows / 2) last_index = ($lb_num_rows / 2) focus_leader = 0
	leaderboard_leader :SE_SetProps \{text_rgba = GH51_blue_lt}
	Change \{LeaderboardSearchValue = me}
	wait \{1
		second}
	if NOT ScreenElementExists \{id = LeaderboardInterface}
		return
	endif
	ReadLeaderboardByOffset {
		callback = ui_leaderboard_update_leader
		leaderboard_id = ($current_leaderboard_id)
		offset = 1
		num_rows = 1
	}
	ReadLeaderboardByPivot {
		callback = ui_leaderboard_update_rows
		leaderboard_id = ($current_leaderboard_id)
		controller_index = ($lb_controller)
		num_rows = ($lb_num_rows + 1)
	}
endscript

script ui_leaderboard_jump_to_friends 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	generic_menu_pad_choose_sound
	ui_leaderboard_clear_rows
	leaderboard_leader :SE_SetProps \{rank_text = qs(0x03ac90f0)
		GamerTag_text = qs(0x03ac90f0)
		score_text = qs(0x03ac90f0)
		date_text = qs(0x03ac90f0)
		difficulty_bg_alpha = 0}
	leaderboard_leader :SetTags \{player_xuid = [
			0
			0
		]}
	LeaderboardInterface :Desc_ResolveAlias \{name = alias_spotlighter}
	<resolved_id> :SE_SetProps hiddenLocal = true
	LeaderboardInterface :Obj_SpawnScript \{ui_leaderboard_load_spin}
	SE_SetProps \{block_events}
	ui_leaderboard_item_unfocus
	LaunchEvent \{type = unfocus
		target = leaderboard_leader}
	LaunchEvent \{type = unfocus
		target = leaderboard_menu}
	SetTags \{focus_pos = 0
		last_index = 0
		focus_leader = 0}
	leaderboard_leader :SE_SetProps \{text_rgba = GH51_blue_lt}
	Change \{LeaderboardSearchValue = friends}
	Change \{LeaderboardJumpToButton = ui_leaderboard_jump_to_overall}
	Change \{lb_offset = 2}
	leaderboard_menu :SE_SetProps {
		event_handlers = [
			{pad_option ($LeaderboardJumpToButton)}
		]
		replace_handlers
	}
	leaderboard_leader :SE_SetProps {
		event_handlers = [
			{pad_option ($LeaderboardJumpToButton)}
		]
		replace_handlers
	}
	ui_leaderboard_add_helper_text \{blue_button_text = qs(0xccb53cc9)}
	wait \{1
		second}
	if NOT ScreenElementExists \{id = LeaderboardInterface}
		return
	endif
	ReadLeaderboardByFriendsList {
		callback = ui_leaderboard_update_leader
		leaderboard_id = ($current_leaderboard_id)
		offset = 0
		num_rows = 1
		controller_Id = ($lb_controller)
	}
	ReadLeaderboardByFriendsList {
		callback = ui_leaderboard_update_rows
		leaderboard_id = ($current_leaderboard_id)
		offset = 1
		num_rows = ($lb_num_rows)
		controller_Id = ($lb_controller)
	}
endscript

script ui_leaderboard_show_gamercard 
	if ui_leaderboard_check_online_status
		leaderboard_menu :GetTags
		if (<last_index> != -1)
			if IsScreenElementInFocus \{id = leaderboard_leader}
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
	leaderboard_menu :GetTags
	if ($LeaderboardSearchValue = friends)
		if GotParam \{friends_rows}
			GetArraySize <friends_rows>
			if (<array_size> = 0)
				return
			endif
		endif
	endif
	if (<total_size> > 0)
		if IsScreenElementInFocus \{id = leaderboard_leader}
			ratio = 0
			if ($LeaderboardSearchValue = friends)
				current_rank = (<friends_rows> [0].rank - 1)
				if NOT (<total_size> = 0)
					ratio = (<current_rank> / ((<total_size>) * 1.0))
				endif
			endif
			LeaderboardInterface :SE_SetProps pointer_pos = (((0.0, 412.0) * <ratio>) - (0.0, 38.0))
		else
			if (<last_index> = -1)
				last_index = 0
			endif
			if GotParam \{force_rank}
				current_rank = <force_rank>
			else
				if ($LeaderboardSearchValue = friends)
					current_rank = <last_index>
					if ($lb_offset < $lb_num_rows)
						current_rank = ($lb_offset + <last_index> - 1)
					endif
				else
					current_rank = ($lb_offset + <last_index> - 1)
				endif
			endif
			if ($LeaderboardSearchValue = friends)
				if (<current_rank> >= <array_size>)
					current_rank = (<array_size> - 1)
				endif
				current_rank = (<friends_rows> [<current_rank>].rank - 1)
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
			LeaderboardInterface :SE_SetProps pointer_pos = (((0.0, 412.0) * <ratio>) - (0.0, 38.0))
		endif
	endif
endscript

script ui_leaderboard_get_difficulty_score_text 
	score = (<row>.score)
	CastToInteger \{score}
	FormatText TextName = score_text qs(0x76b3fda7) d = <score> UseCommas
	return score_text = <score_text>
endscript

script ui_leaderboard_view_current_song 
	ui_event event = menu_change state = UIstate_leaderboard data = {song = ($current_leaderboard_song)}
endscript

script ui_leaderboard_process_failed 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if GotParam \{wait_frames}
		wait <wait_frames> gameframes
	endif
	printf \{'ui_leaderboard_process_failed 1'}
	printstruct <...>
	if ScreenElementExists \{id = LeaderboardInterface}
		leaderboard_menu :GetSingleTag \{current_status}
		printstruct <...>
		if NOT (<current_status> = failed)
			leaderboard_menu :SetTags \{current_status = failed}
		endif
	endif
	if ((ScreenElementExists id = LeaderboardInterface) || (ScreenElementExists id = RockRecordInterface))
		ui_leaderboard_get_error_text reason = <reason>
		printf \{'ui_leaderboard_process_failed 3'}
		printstruct <...>
		wait \{10
			gameframes}
		generic_event_replace no_sound state = UIstate_generic_dialog_box data = {template = continue heading_text = qs(0xaa163738) body_text = <error_text>}
	endif
endscript

script ui_leaderboard_process_empty 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	ui_event_get_top
	if (<base_name> = 'generic_dialog_box')
		return
	endif
	options = [
		{func = generic_event_back func_params = {nosound} text = qs(0xc735c271)}
		{func = generic_event_back func_params = {nosound data = {state = uistate_songlist}} text = qs(0xf7723015)}
	]
	generic_event_choose state = UIstate_generic_dialog_box data = {is_popup options = <options> heading_text = qs(0xaa163738) body_text = qs(0x9e140cc9)}
endscript

script ui_leaderboard_get_start_size 
	new_array = [0 0 0 0 0 0]
	GetArraySize <array>
	idx = 0
	begin
	start_num = (<array> [<idx>])
	if (<start_num> = -1)
		SetArrayElement arrayName = new_array index = <idx> newValue = 0
	else
		if (<idx> + 1 < <array_size>)
			jdx = (<idx> + 1)
			begin
			next_start = (<array> [<jdx>])
			if (<next_start> != -1)
				size = (<array> [<idx>] - <array> [<jdx>])
				SetArrayElement arrayName = new_array index = <jdx> newValue = <size>
				break
			endif
			jdx = (<jdx> + 1)
			repeat (<array_size> - (<idx> + 1))
		endif
	endif
	idx = (<idx> + 1)
	repeat <array_size>
	return new_array = <new_array>
endscript

script ui_leaderboard_resize_scroll 
	if ScreenElementExists \{id = LeaderboardInterface}
		leaderboard_menu :GetTags
		if (<total_size> > 0 && <num_start_received> = 5)
			array = [0 0 0 0 0 0]
			SetArrayElement arrayName = array index = 0 newValue = (<total_size> + 1)
			SetArrayElement arrayName = array index = 1 newValue = <easy_start>
			SetArrayElement arrayName = array index = 2 newValue = <medium_start>
			SetArrayElement arrayName = array index = 3 newValue = <hard_start>
			SetArrayElement arrayName = array index = 4 newValue = <expert_start>
			SetArrayElement arrayName = array index = 5 newValue = <expert_plus_start>
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
			easy_dims = ((60.0, 0.0) + (0.0, 1.0) * (<easy_percent> * 416))
			medium_dims = ((60.0, 0.0) + (0.0, 1.0) * (<medium_percent> * 416))
			hard_dims = ((60.0, 0.0) + (0.0, 1.0) * (<hard_percent> * 416))
			expert_dims = ((60.0, 0.0) + (0.0, 1.0) * (<expert_percent> * 416))
			expert_plus_dims = ((60.0, 0.0) + (0.0, 1.0) * (<expert_plus_percent> * 416))
			LeaderboardInterface :SE_SetProps {
				scroll_fill_easy_dims = <easy_dims>
				scroll_fill_medium_dims = <medium_dims>
				scroll_fill_hard_dims = <hard_dims>
				scroll_fill_expert_dims = <expert_dims>
				scroll_fill_xxpert_dims = <expert_plus_dims>
				leaderboard_pointer_alpha = 1
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
		spawnscriptnow ui_leaderboard_process_failed params = {<...>}
		return
	endif
	if NOT ScreenElementExists \{id = LeaderboardInterface}
		return
	endif
	leaderboard_menu :GetSingleTag \{current_status}
	if (<current_status> = failed)
		return
	endif
	if (<status> = succeeded)
		leaderboard_menu :GetSingleTag \{num_start_received}
		leaderboard_menu :SetTags num_start_received = (<num_start_received> + 1)
		GetArraySize <rows>
		if (<array_size> > 0)
			if ScreenElementExists \{id = LeaderboardInterface}
				switch (<rows> [0].difficulty)
					case easy
					leaderboard_menu :SetTags total_size = <total_size> easy_start = (<rows> [0].rank)
					case medium
					leaderboard_menu :SetTags total_size = <total_size> medium_start = (<rows> [0].rank)
					case hard
					leaderboard_menu :SetTags total_size = <total_size> hard_start = (<rows> [0].rank)
					case expert
					leaderboard_menu :SetTags total_size = <total_size> expert_start = (<rows> [0].rank)
					case expert_plus
					leaderboard_menu :SetTags total_size = <total_size> expert_plus_start = (<rows> [0].rank)
					default
					leaderboard_menu :SetTags total_size = <total_size> expert_start = 1
					LeaderboardInterface :SE_SetProps \{scroll_fill_expert_rgba = black}
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
		if IsScreenElementInFocus \{id = leaderboard_leader}
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

script ui_leaderboard_show_rock_record 
	printf \{'ui_leaderboard_show_rock_record'}
	printstruct <...>
	if GotParam \{rows}
		GetArraySize <rows>
		if (<array_size> > 0)
			if StructureContains structure = (<rows> [0]) player_id
				display_rock_record net_id = (<rows> [0].player_id) unfocus_id = leaderboard_menu
			endif
		endif
	endif
endscript

script ui_create_leaderboard_failed 
	wait \{2
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
	generic_event_replace state = UIstate_generic_dialog_box data = {template = <temp> heading_text = qs(0xaa163738) body_text = <error_text> <extra_params>}
endscript

script ui_leaderboard_signin 
	wait \{2
		gameframes}
	generic_event_replace state = uistate_signin data = {device_num = ($lb_controller) require_live = 1 new_state = UIstate_leaderboard allow_back = 1 new_data = {device_num = ($lb_controller) song = ($current_leaderboard_song)}}
endscript

script ui_leaderboard_get_error_text 
	error = Default
	if isXenon
		signed_in = 0
		live_enabled = 0
		if NetSessionFunc func = IsLiveEnabled params = {controller_index = ($lb_controller)}
			live_enabled = 1
		endif
		if CheckForSignIn network_platform_only controller_index = ($lb_controller)
			signed_in = 1
		endif
		if NetSessionFunc \{func = IsCableUnplugged}
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
	elseif IsPS3
		signed_in = 0
		multiplayer_allowed = 0
		if CheckForSignIn \{network_platform_only}
			signed_in = 1
		endif
		if NetSessionFunc \{func = IsOldEnoughForOnline}
			multiplayer_allowed = 1
		endif
		if (<signed_in> = 0)
			error = notsignedin
		else
			if NetSessionFunc \{func = IsCableUnplugged}
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
	elseif IsPS3
		return error_text = ($leaderboard_error_text_PS3.<error>) error = <error>
	endif
	return \{error_text = qs(0xa8fbcc2e)}
endscript
