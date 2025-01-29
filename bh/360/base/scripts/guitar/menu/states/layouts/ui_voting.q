DEBUG_FORCE_VOTE = 0
NUM_LIST_ENTRIES = 7
g_received_final_vote_counts = 0

script ui_create_voting 
	if InNetGame
		spawn_player_drop_listeners \{drop_player_script = voting_drop_player
			end_game_script = voting_end_game}
	endif
	spawnscriptnow \{menu_music_on}
	spawnscriptnow \{Skate8_SFX_Backgrounds_New_Area
		params = {
			BG_SFX_Area = FrontEnd_Menu_Music
			fadeouttime = 5
			fadeouttype = linear
		}}
	spawnscriptnow \{Neutral_Crowd_Wait_To_Lower_Stats}
	RequireParams \{[
			voting_items_array
		]
		all}
	CreateScreenElement \{id = VotingInterface
		parent = root_window
		type = DescInterface
		desc = 'generic_voting'
		z_priority = 20.0
		alpha = 0.0
		just = [
			left
			top
		]
		Pos = (0.0, 0.0)
		autoSizeDims = false
		dims = (1280.0, 720.0)
		tags = {
			left_vote_count = 0
			right_vote_count = 0
		}}
	if VotingInterface :Desc_ResolveAlias \{name = alias_bg_anim1
			param = vote_bg2_anim_id}
		<vote_bg2_anim_id> :Obj_SpawnScript ui_shakey
	else
		ScriptAssert \{'pdetrich'}
	endif
	if VotingInterface :Desc_ResolveAlias \{name = alias_bg_anim1
			param = vote_bg2_anim_id}
		<vote_bg2_anim_id> :Obj_SpawnScript ui_frazzmatazz
	else
		ScriptAssert \{'pdetrich'}
	endif
	if VotingInterface :Desc_ResolveAlias \{name = alias_bg_anim2
			param = vote_bg3_anim_id}
		<vote_bg3_anim_id> :Obj_SpawnScript ui_shakey
	else
		ScriptAssert \{'pdetrich2'}
	endif
	if VotingInterface :Desc_ResolveAlias \{name = alias_bg_anim2
			param = vote_bg3_anim_id}
		<vote_bg3_anim_id> :Obj_SpawnScript ui_frazzmatazz
	else
		ScriptAssert \{'pdetrich2'}
	endif
	Change \{g_vote_counts = [
			0
			0
		]}
	Change \{g_received_final_vote_counts = 0}
	Change \{g_controllers_that_voted = [
		]}
	user_control_helper_get_buttonchar button = orange controller = ($primary_controller)
	orange_button = <buttonchar>
	user_control_helper_get_buttonchar button = blue controller = ($primary_controller)
	blue_button = <buttonchar>
	VotingInterface :SE_SetProps {
		voting_title_text = <voting_title>
		voting_subtitle_text = <voting_subtitle>
		left_button_text = <blue_button>
		right_button_text = <orange_button>
	}
	GetArraySize <info_list>
	if (<array_size> > 0)
		printstruct <...>
		if GotParam \{info_list_title}
			printf \{qs(0xb56a311e)}
			VotingInterface :SE_SetProps {optional_info_title_text = <info_list_title>}
		endif
		if VotingInterface :Desc_ResolveAlias \{name = alias_optional_info_list
				param = menu_id}
			<index> = 0
			begin
			if ((<index> + 1) = $NUM_LIST_ENTRIES)
				<text> = qs(0x3871eb3b)
			else
				<text> = (<info_list> [<index>])
			endif
			FormatText TextName = pos_text qs(0xc31d83ea) i = (<index> + 1)
			CreateScreenElement {
				type = TextBlockElement
				parent = <menu_id>
				fit_width = truncate
				fit_height = `scale	down	if	larger`
				scale_mode = proportional
				text = <text>
				font = fontgrid_text_A1
				autoSizeDims = false
				just = [left center]
				pos_anchor = [left top]
				internal_just = [left bottom]
				z_priority = 35
				rgba = GH51_blue_lt
				alpha = 0.9
				dims = (300.0, 30.0)
			}
			if ((<index> + 1) = $NUM_LIST_ENTRIES)
				break
			endif
			<index> = (<index> + 1)
			repeat <array_size>
		endif
	endif
	if NOT GotParam \{menu_id}
		ScriptAssert \{'Could not resolve menu for event handlers'}
	endif
	menu_id = <resolved_id>
	array = []
	GetNumPlayersInGame \{local}
	if (<num_players> > 0)
		GetFirstPlayer \{local}
		begin
		GetPlayerInfo <player> controller
		AddArrayElement array = <array> element = <controller>
		GetNextPlayer player = <player> local
		repeat <num_players>
		controllers_allowed_to_vote = <array>
	endif
	GetArraySize <voting_items_array>
	if (<array_size> = 3)
		VotingInterface :SetTags {voting_items_array = <voting_items_array>}
		left_text = (<voting_items_array> [0])
		right_text = (<voting_items_array> [1])
		VotingInterface :SE_SetProps {
			left_choice_text = ($<left_text>.text)
			right_choice_text = ($<right_text>.text)
		}
		if ((($is_network_game = 0) || (IsHost)) && (($GLOBAL_SHOULD_USE_NET_DEBUGGING) = 1))
			event_handlers = [
				{pad_option generic_cast_vote params = {option = 0}}
				{pad_L1 generic_cast_vote params = {option = 1}}
				{pad_choose debug_choose_mode}
			]
		else
			event_handlers = [
				{pad_option generic_cast_vote params = {option = 0}}
				{pad_L1 generic_cast_vote params = {option = 1}}
			]
		endif
		clean_up_user_control_helpers
		if NOT InNetGame
			add_user_control_helper \{text = qs(0xaf4d5dd2)
				button = red
				z = 100000}
		endif
		FormatText TextName = button_helper_string qs(0x3f014b7b) d = ($<left_text>.upper_text)
		add_user_control_helper text = <button_helper_string> button = blue z = 100000
		FormatText TextName = button_helper_string qs(0x3f014b7b) d = ($<right_text>.upper_text)
		add_user_control_helper text = <button_helper_string> button = orange z = 100000
	else
		ScriptAssert \{'Generic voting needs voting_items_array of size 3'}
	endif
	VotingInterface :Obj_SpawnScriptNow \{update_voting_timer}
	<menu_id> :Obj_SpawnScriptNow ui_voting_update params = {voting_items_array = <voting_items_array>}
	<menu_id> :SE_SetProps event_handlers = <event_handlers> exclusive_device = <controllers_allowed_to_vote>
	start_bat_animations
	if GotParam \{voting_callback}
		VotingInterface :SetTags voting_complete_callback = <voting_callback>
	endif
	if GotParam \{next_state}
		VotingInterface :SetTags next_state = <next_state>
	endif
	if ScreenElementExists id = <menu_id>
		if GotParam \{back_script}
			if NOT GotParam \{back_params}
				back_params = {}
			endif
			<menu_id> :SE_SetProps {
				event_handlers = [
					{pad_back <back_script> params = <back_params>}
				]
				exclusive_device = <controllers_allowed_to_vote>
			}
		endif
	endif
	AssignAlias id = <menu_id> alias = current_menu
endscript

script ui_destroy_voting 
	clean_up_user_control_helpers
	DestroyScreenElement \{id = VotingInterface}
	killspawnedscript \{name = Counter_Play_Beep_Spawn}
endscript

script ui_anim_in_voting 
	printf \{qs(0x8b7d23e4)}
	if ScreenElementExists \{id = VotingInterface}
		VotingInterface :SE_SetProps \{alpha = 1.0
			time = 0.4
			motion = ease_out}
		VotingInterface :SE_WaitProps
		LaunchEvent \{type = focus
			target = current_menu}
	endif
endscript

script update_voting_timer 
	Obj_GetID
	if NOT InInternetMode
		<objID> :SE_SetProps vote_timer_hand_rgba = [255 255 255 0]
		<objID> :SE_SetProps clock_timer_alpha = 0
		return
	endif
	OnExitRun reset_voting_timer params = {objID = <objID>}
	<objID> :SE_SetProps timer_rotation = 360 time = 10.0
	wait \{7.5
		seconds}
	<objID> :SE_SetProps vote_timer_hand_rgba = [130 40 40 255]
	voting_screen_timer
	wait \{2.5
		seconds}
endscript

script reset_voting_timer 
	RequireParams \{[
			objID
		]
		all}
	if ScreenElementExists id = <objID>
		<objID> :SE_SetProps vote_timer_hand_rgba = [255 255 255 0]
	endif
endscript

script start_bat_animations 
	if ScreenElementExists \{id = VotingInterface}
		if VotingInterface :Desc_ResolveAlias \{name = alias_vote_bat_gold1
				param = bat_gold1}
			<bat_gold1> :Obj_SpawnScriptNow bat_animation_loop
		endif
		if VotingInterface :Desc_ResolveAlias \{name = alias_vote_bat_gold2
				param = bat_gold2}
			<bat_gold2> :Obj_SpawnScriptNow bat_animation_loop
		endif
		if VotingInterface :Desc_ResolveAlias \{name = alias_vote_bat_gold3
				param = bat_gold3}
			<bat_gold3> :Obj_SpawnScriptNow bat_animation_loop
		endif
		if VotingInterface :Desc_ResolveAlias \{name = alias_vote_bat_hell1
				param = bat_hell1}
			<bat_hell1> :Obj_SpawnScriptNow bat_animation_loop
		endif
		if VotingInterface :Desc_ResolveAlias \{name = alias_vote_bat_hell2
				param = bat_hell2}
			<bat_hell2> :Obj_SpawnScriptNow bat_animation_loop
		endif
		if VotingInterface :Desc_ResolveAlias \{name = alias_vote_bat_hell3
				param = bat_hell3}
			<bat_hell3> :Obj_SpawnScriptNow bat_animation_loop
		endif
	endif
endscript

script bat_animation_loop 
	Obj_GetID
	randomwait = Random (@ 0 @ 0.2 @ 0.3 @ 0.4 )
	wait <randomwait> seconds
	randomtime = RandomFloat (0.5, 1.0)
	randomoffset = RandomInteger (10.0, 20.0)
	offsetup = (<randomoffset> * (0.0, 2.0))
	offsetdn = (<randomoffset> * (0.0, -2.0))
	<objID> :SE_SetProps Pos = {(<offsetup> * (0.5)) relative} rot_angle = 0 time = <randomtime> motion = ease_in
	begin
	randomrot = Random (@ -3 @ 3 @ 2 @ -2 @ 0 )
	<objID> :SE_SetProps Pos = {<offsetdn> relative} rot_angle = <randomrot> time = <randomtime> motion = ease_out
	<objID> :SE_WaitProps
	<objID> :SE_SetProps Pos = {<offsetup> relative} rot_angle = 0 time = <randomtime> motion = ease_in
	<objID> :SE_WaitProps
	repeat
endscript

script generic_cast_vote 
	RequireParams \{[
			option
		]
		all}
	printf \{qs(0x20f736cb)}
	allowed = 1
	GetArraySize ($g_controllers_that_voted)
	if (<array_size> > 0)
		i = 0
		begin
		if (<device_num> = (($g_controllers_that_voted) [<i>]))
			allowed = 0
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	if (<allowed> = 1)
		array = ($g_controllers_that_voted)
		AddArrayElement array = <array> element = <device_num>
		Change g_controllers_that_voted = <array>
		if InInternetMode
			SendStructure callback = cast_vote_callback data_to_send = {option = <option>}
			if IsHost
				cast_vote_ui_sfx option = <option>
				SetArrayElement GlobalArray arrayName = g_vote_counts index = <option> newValue = (($g_vote_counts [<option>]) + 1)
			endif
		else
			cast_vote_ui_sfx option = <option>
			SetArrayElement GlobalArray arrayName = g_vote_counts index = <option> newValue = (($g_vote_counts [<option>]) + 1)
		endif
	else
		printf \{qs(0x4395d3e0)}
	endif
endscript

script ui_voting_update 
	printf \{qs(0x1f01040c)}
	RequireParams \{[
			voting_items_array
		]
		all}
	GetNumPlayersInGame
	if (<num_players> > 0)
		<count> = 0
		begin
		if ScreenElementExists \{id = VotingInterface}
			VotingInterface :GetSingleTag \{left_vote_count}
			VotingInterface :GetSingleTag \{right_vote_count}
			if (<left_vote_count> != ($g_vote_counts [0]))
				VotingInterface :SE_SetProps \{vote_display_1_scale = 1.5}
				VotingInterface :SE_SetProps \{vote_display_1_scale = 1.0
					time = 0.2
					motion = ease_out}
			endif
			if (<right_vote_count> != ($g_vote_counts [1]))
				VotingInterface :SE_SetProps \{vote_display_2_scale = 1.5}
				VotingInterface :SE_SetProps \{vote_display_2_scale = 1.0
					time = 0.2
					motion = ease_out}
			endif
			FormatText TextName = vote0_count qs(0x48c6d14c) d = ($g_vote_counts [0])
			FormatText TextName = vote1_count qs(0x48c6d14c) d = ($g_vote_counts [1])
			VotingInterface :SE_SetProps {
				left_count_text = <vote0_count>
				right_count_text = <vote1_count>
			}
			VotingInterface :SetTags {
				left_vote_count = ($g_vote_counts [0])
				right_vote_count = ($g_vote_counts [1])
			}
		endif
		if (<num_players> = (($g_vote_counts [0]) + ($g_vote_counts [1])))
			break
		endif
		if (
				(($g_vote_counts [0]) > (<num_players> / 2.0)) ||
				(($g_vote_counts [1]) > (<num_players> / 2.0))
			)
			break
		endif
		wait \{0.25
			seconds}
		if InInternetMode
			<count> = (<count> + 1)
			if (<count> > 40 || $DEBUG_FORCE_VOTE = 1)
				break
			endif
		elseif ($DEBUG_FORCE_VOTE = 1)
			break
		endif
		repeat
		killspawnedscript \{name = voting_screen_timer}
		killspawnedscript \{name = Counter_Play_Beep_Spawn}
		killspawnedscript \{name = update_voting_timer}
		voting_update_complete
	endif
endscript

script voting_update_complete 
	printf \{qs(0x4217906e)}
	resolve_voting_outcome
	if ScreenElementExists \{id = VotingInterface}
		VotingInterface :GetSingleTag \{voting_items_array}
		if ($GLOBAL_SHOULD_USE_NET_DEBUGGING = 1 || $DEBUG_FORCE_VOTE = 1)
			Change \{DEBUG_FORCE_VOTE = 0}
			result = ($g_force_vote)
		else
			result = (<voting_items_array> [<winner_index>])
		endif
		<vote_tie> = 0
		if GotParam \{winner_index}
			if (<winner_index> = 2)
				<vote_tie> = 1
			endif
		endif
		printstruct <...>
		if InInternetMode
			if IsHost
				SendStructure {
					callback = client_voting_result
					data_to_send = {
						result = <result>
						tie = <vote_tie>
						left_vote_count = ($g_vote_counts [0])
						right_vote_count = ($g_vote_counts [1])
					}
				}
				current_menu :Obj_SpawnScriptNow display_voting_result_and_exit params = {result = <result> tie = <vote_tie>}
			endif
		else
			current_menu :Obj_SpawnScriptNow display_voting_result_and_exit params = {result = <result> tie = <vote_tie>}
		endif
	endif
endscript

script client_voting_result 
	Change \{g_received_final_vote_counts = 1}
	if ScreenElementExists \{id = VotingInterface}
		if (<left_vote_count> != ($g_vote_counts [0]))
			SetArrayElement GlobalArray arrayName = g_vote_counts index = 0 newValue = <left_vote_count>
			VotingInterface :SE_SetProps \{vote_display_1_scale = 1.5}
			VotingInterface :SE_SetProps \{vote_display_1_scale = 1.0
				time = 0.2
				motion = ease_out}
		endif
		if (<right_vote_count> != ($g_vote_counts [1]))
			SetArrayElement GlobalArray arrayName = g_vote_counts index = 1 newValue = <right_vote_count>
			VotingInterface :SE_SetProps \{vote_display_2_scale = 1.5}
			VotingInterface :SE_SetProps \{vote_display_2_scale = 1.0
				time = 0.2
				motion = ease_out}
		endif
		FormatText TextName = vote0_count qs(0x48c6d14c) d = ($g_vote_counts [0])
		FormatText TextName = vote1_count qs(0x48c6d14c) d = ($g_vote_counts [1])
		VotingInterface :SE_SetProps {
			left_count_text = <vote0_count>
			right_count_text = <vote1_count>
		}
		VotingInterface :SetTags {
			left_vote_count = ($g_vote_counts [0])
			right_vote_count = ($g_vote_counts [1])
		}
		VotingInterface :Obj_SpawnScriptNow display_voting_result_and_exit params = <...>
	endif
endscript

script resolve_voting_outcome 
	printf \{qs(0x482c0c6d)}
	if (($g_vote_counts [0]) > ($g_vote_counts [1]))
		return \{winner_index = 0}
	elseif (($g_vote_counts [0]) < ($g_vote_counts [1]))
		return \{winner_index = 1}
	else
		return \{winner_index = 2}
	endif
endscript

script display_voting_result_and_exit 
	printf \{qs(0x242fc4bf)}
	RequireParams \{[
			result
			tie
		]
		all}
	if ScreenElementExists \{id = VotingInterface}
		voting_display_winner result = <result> tie = <tie>
		wait \{3
			seconds}
		Menu_Music_Off
		if ($current_transition = None)
			if NOT InNetGame
				Change current_level = ($g_band_lobby_current_level)
				venue = ($g_band_lobby_current_level)
				if StructureContains structure = ($LevelZones.<venue>) name = loading_movie
					create_venue_loading_screen movie_params = ($LevelZones.<venue>)
				else
					create_loading_screen
				endif
			endif
		else
			StopRendering
		endif
		if ScreenElementExists \{id = VotingInterface}
			if VotingInterface :GetSingleTag \{voting_complete_callback}
				printf \{qs(0xaf67751d)}
				if NOT checksumequals a = <voting_complete_callback> b = null
					printf \{qs(0x8d22404a)}
					<voting_complete_callback> <...>
				endif
			endif
		endif
		if ScreenElementExists \{id = VotingInterface}
			if VotingInterface :GetSingleTag \{next_state}
				generic_event_replace no_sound state = <next_state>
			endif
		endif
	endif
endscript

script voting_display_winner 
	printf \{qs(0x32f3ab6a)}
	printstruct <...>
	if ScreenElementExists \{id = VotingInterface}
		VotingInterface :GetSingleTag \{voting_items_array}
		GetArraySize <voting_items_array>
		<index> = 0
		begin
		if checksumequals a = (<voting_items_array> [<index>]) b = <result>
			break
		endif
		<index> = (<index> + 1)
		repeat <array_size>
		if (<index> > 1)
			<index> = 1
		endif
		if GotParam \{tie}
			if (<tie> = 1)
				Voting_Outcome_Result_SFX \{winner = 2}
				wait \{1.5
					seconds}
				<count> = 0
				wait_time = 0.025
				begin
				Mod a = <count> b = 2
				if (<Mod> = 0)
					VotingInterface :SE_SetProps tie_breaker_flipper_2_alpha = 0.0 time = (<wait_time> / 2) motion = ease_in
					VotingInterface :SE_WaitProps
				else
					VotingInterface :SE_SetProps tie_breaker_flipper_1_alpha = 0.0 time = (<wait_time> / 2) motion = ease_in
					VotingInterface :SE_WaitProps
				endif
				if (<Mod> = 0)
					VotingInterface :SE_SetProps tie_breaker_flipper_1_alpha = 1.0 time = (<wait_time> / 2) motion = ease_out
					VotingInterface :SE_WaitProps
				else
					VotingInterface :SE_SetProps tie_breaker_flipper_2_alpha = 1.0 time = (<wait_time> / 2) motion = ease_out
					VotingInterface :SE_WaitProps
				endif
				<wait_time> = (<wait_time> * 1.2)
				if ((<wait_time> > 0.6) && (<index> = <Mod>))
					break
				endif
				Tie_Breaker_SFX count = <count>
				<count> = (<count> + 1)
				repeat
			endif
		endif
		if (<index> = 0)
			Voting_Outcome_Result_SFX \{winner = 0}
			create_ui_star_particles \{Pos = (327.0, 440.0)
				z = 30
				parent = VotingInterface}
			VotingInterface :SE_SetProps \{vote_display_2_pos = {
					(0.0, 500.0)
					relative
				}
				time = 2.0
				motion = ease_in}
			VotingInterface :SE_SetProps \{vote_display_2_rot_angle = 265
				time = 2.0}
		else
			Voting_Outcome_Result_SFX \{winner = 1}
			create_ui_star_particles \{Pos = (602.0, 362.0)
				z = 30
				parent = VotingInterface}
			VotingInterface :SE_SetProps \{vote_display_1_pos = {
					(0.0, 500.0)
					relative
				}
				time = 2.0
				motion = ease_in}
			VotingInterface :SE_SetProps \{vote_display_1_rot_angle = -265
				time = 2.0}
		endif
	endif
endscript

script display_competitive_rules_voting 
	prepare_game_rules_voting
	GetArraySize ($current_playlist)
	if (<array_size> > 0)
		<array> = []
		<index> = 0
		begin
		get_ui_song_struct_items song = ($current_playlist [<index>])
		if (<index> = 0)
			<voting_subtitle> = (<ui_struct>.song_title)
		endif
		AddArrayElement array = <array> element = (<ui_struct>.song_title)
		<index> = (<index> + 1)
		repeat <array_size>
		<info_list> = <array>
	endif
	if InInternetMode
		if IsHost
			SendStructure {
				callback = net_display_competitive_rules_voting
				data_to_send = {
					voting_callback = <voting_callback>
					voting_items_array = <game_rules_voting_array>
				}
			}
			choose_script = generic_event_choose
			if ui_event_is_top_popup
				<choose_script> = generic_event_replace
			endif
			<choose_script> {
				state = UIstate_voting
				data = {
					voting_items_array = <game_rules_voting_array>
					voting_callback = <voting_callback>
					voting_title = qs(0x452393b2)
					voting_subtitle = <voting_subtitle>
					info_list = <info_list>
					info_list_title = qs(0xc70894d4)
				}
			}
		endif
	else
		generic_event_choose {
			state = UIstate_voting
			data = {
				back_script = generic_event_back
				back_params = {voting_screen <back_params>}
				voting_items_array = <game_rules_voting_array>
				voting_callback = <voting_callback>
				next_state = <next_state>
				voting_title = qs(0x452393b2)
				voting_subtitle = <voting_subtitle>
				info_list = <info_list>
				info_list_title = qs(0xc70894d4)
			}
		}
	endif
endscript

script net_display_competitive_rules_voting 
	GetArraySize ($current_playlist)
	if (<array_size> > 0)
		<array> = []
		<index> = 0
		begin
		get_ui_song_struct_items song = ($current_playlist [<index>])
		if (<index> = 0)
			<voting_subtitle> = (<ui_struct>.song_title)
		endif
		AddArrayElement array = <array> element = (<ui_struct>.song_title)
		<index> = (<index> + 1)
		repeat <array_size>
		<info_list> = <array>
	endif
	ui_event_get_top
	if (<base_name> = 'online_quit_warning')
		ui_event \{event = menu_back}
		ui_event_wait_for_safe
	endif
	choose_script = generic_event_choose
	if GotParam \{is_popup}
		<choose_script> = generic_event_replace
	endif
	<choose_script> {
		state = UIstate_voting
		data = {
			voting_items_array = <voting_items_array>
			voting_title = qs(0x452393b2)
			voting_callback = <voting_callback>
			voting_subtitle = <voting_subtitle>
			info_list = <info_list>
			info_list_title = qs(0xc70894d4)
		}
	}
endscript

script debug_choose_mode 
	LaunchEvent \{type = unfocus
		target = current_menu}
	CreateScreenElement \{parent = VotingInterface
		Pos = (0.0, 0.0)
		type = MenuElement
		pos_anchor = [
			center
			center
		]
		just = [
			center
			center
		]
		z_priority = 200
		dims = (150.0, 40.0)
		alpha = 1
		isVertical = true
		internal_just = [
			center
			center
		]
		fit_major = `expand	if	content	larger`
		fit_minor = `keep	dims`}
	<menu_id> = <id>
	GetArraySize ($competitive_rules_array)
	if (<array_size> > 0)
		i = 0
		begin
		add_element = 1
		<competitive_rules> = (($competitive_rules_array) [<i>])
		if NOT GameMode_IsTeamGame
			if (($<competitive_rules>.team) = 1)
				add_element = 0
			endif
		else
			if (($<competitive_rules>.team) = 0)
				add_element = 0
			endif
		endif
		if checksumequals a = <competitive_rules> b = elimination
			GetNumPlayersInGame
			if (<num_players> > ($<competitive_rules>.min_players))
				add_element = 1
			else
				add_element = 0
			endif
		elseif checksumequals a = (($competitive_rules_array) [<i>]) b = solo_fest_mode
			add_element = 0
		elseif checksumequals a = (($competitive_rules_array) [<i>]) b = team_fest_mode
			add_element = 0
		endif
		if (<add_element> = 1)
			CreateScreenElement {
				type = TextBlockElement
				parent = <menu_id>
				text = ($<competitive_rules>.text)
				font = fontgrid_text_A1
				dims = (150.0, 40.0)
				alpha = 0.5
				just = [left , top]
				rgba = [240 240 240 255]
				fit_height = `scale	down	if	larger`
				fit_width = `scale	each	line	if	larger`
				event_handlers = [
					{pad_choose set_force_vote params = {rules = <competitive_rules>}}
					{focus voting_item_change_focus params = {focus}}
					{unfocus voting_item_change_focus params = {unfocus}}
				]
			}
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	AssignAlias id = <menu_id> alias = current_menu
	LaunchEvent \{type = focus
		target = current_menu}
endscript

script set_force_vote 
	Change \{DEBUG_FORCE_VOTE = 1}
	Change g_force_vote = <rules>
endscript

script voting_item_change_focus 
	Obj_GetID
	if GotParam \{focus}
		<objID> :SE_SetProps alpha = 1.0
	elseif GotParam \{unfocus}
		<objID> :SE_SetProps alpha = 0.5
	endif
endscript

script voting_drop_player 
	if ScreenElementExists \{id = VotingInterface}
		<parent> = VotingInterface
	endif
	songlist_drop_player <...>
endscript

script voting_end_game 
	killspawnedscript \{name = ui_voting_update}
	killspawnedscript \{name = display_voting_result_and_exit}
	songlist_end_game <...>
endscript
