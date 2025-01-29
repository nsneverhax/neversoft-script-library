debug_force_vote = 0
num_list_entries = 7
g_received_final_vote_counts = 0

script ui_create_voting 
	if InNetGame
		spawn_player_drop_listeners \{drop_player_script = voting_drop_player
			end_game_script = voting_end_game}
	endif
	SpawnScriptNow \{audio_ui_menu_music_on}
	SpawnScriptNow \{sfx_backgrounds_new_area
		params = {
			BG_SFX_Area = frontend_menu_music
			fadeouttime = 5
			fadeouttype = linear
		}}
	SpawnScriptNow \{audio_crowd_neutral_crowd_wait_to_lower_stats}
	RequireParams \{[
			voting_items_array
		]
		all}
	CreateScreenElement \{id = votinginterface
		parent = root_window
		Type = descinterface
		desc = 'generic_voting'
		z_priority = 20.0
		alpha = 0.0
		just = [
			left
			top
		]
		Pos = (0.0, 0.0)
		autosizedims = FALSE
		dims = (1280.0, 720.0)
		tags = {
			left_vote_count = 0
			right_vote_count = 0
		}}
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
	votinginterface :se_setprops {
		voting_title_text = <voting_title>
		voting_subtitle_text = <voting_subtitle>
		left_button_text = <blue_button>
		right_button_text = <orange_button>
	}
	GetArraySize <info_list>
	if (<array_Size> > 0)
		printstruct <...>
		if GotParam \{info_list_title}
			printf \{qs(0xb56a311e)}
			votinginterface :se_setprops {optional_info_title_text = <info_list_title>}
		endif
		if votinginterface :desc_resolvealias \{Name = alias_optional_info_list
				param = menu_id}
			<index> = 0
			begin
			if ((<index> + 1) = $num_list_entries)
				<text> = qs(0x3871eb3b)
			else
				<text> = (<info_list> [<index>])
			endif
			formatText TextName = pos_text qs(0xc31d83ea) i = (<index> + 1)
			CreateScreenElement {
				Type = TextBlockElement
				parent = <menu_id>
				fit_width = truncate
				fit_height = `scale	down	if	larger`
				scale_mode = proportional
				text = <text>
				font = fontgrid_title_a1
				autosizedims = FALSE
				just = [left center]
				pos_anchor = [left top]
				internal_just = [left bottom]
				z_priority = 25
				rgba = gh5_blue_xdk
				alpha = 0.5
				dims = (300.0, 30.0)
			}
			if ((<index> + 1) = $num_list_entries)
				break
			endif
			<index> = (<index> + 1)
			repeat <array_Size>
		endif
	endif
	if NOT GotParam \{menu_id}
		ScriptAssert \{'Could not resolve menu for event handlers'}
	endif
	menu_id = <resolved_id>
	array = []
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		begin
		getplayerinfo <Player> controller
		AddArrayElement array = <array> element = <controller>
		getnextplayer Player = <Player> local
		repeat <num_players>
		controllers_allowed_to_vote = <array>
	endif
	GetArraySize <voting_items_array>
	if (<array_Size> = 3)
		votinginterface :SetTags {voting_items_array = <voting_items_array>}
		left_text = (<voting_items_array> [0])
		right_text = (<voting_items_array> [1])
		votinginterface :se_setprops {
			left_choice_text = ($<left_text>.text)
			right_choice_text = ($<right_text>.text)
		}
		if ((($is_network_game = 0) || (IsHost)) && (($global_should_use_net_debugging) = 1))
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
		formatText TextName = button_helper_string qs(0x3f014b7b) d = ($<left_text>.upper_text)
		add_user_control_helper text = <button_helper_string> button = blue z = 100000
		formatText TextName = button_helper_string qs(0x3f014b7b) d = ($<right_text>.upper_text)
		add_user_control_helper text = <button_helper_string> button = orange z = 100000
	else
		ScriptAssert \{'Generic voting needs voting_items_array of size 3'}
	endif
	votinginterface :Obj_SpawnScriptNow \{update_voting_timer}
	<menu_id> :Obj_SpawnScriptNow ui_voting_update params = {voting_items_array = <voting_items_array>}
	<menu_id> :se_setprops event_handlers = <event_handlers> exclusive_device = <controllers_allowed_to_vote>
	start_bat_animations
	if GotParam \{voting_callback}
		votinginterface :SetTags voting_complete_callback = <voting_callback>
	endif
	if GotParam \{next_state}
		votinginterface :SetTags next_state = <next_state>
	endif
	if ScreenElementExists id = <menu_id>
		if GotParam \{back_script}
			if NOT GotParam \{back_params}
				back_params = {}
			endif
			<menu_id> :se_setprops {
				event_handlers = [
					{pad_back <back_script> params = <back_params>}
				]
				exclusive_device = <controllers_allowed_to_vote>
			}
		endif
	endif
	AssignAlias id = <menu_id> alias = current_menu
	enable_ui_visualizer
endscript

script ui_destroy_voting 
	clean_up_user_control_helpers
	DestroyScreenElement \{id = votinginterface}
	KillSpawnedScript \{Name = audio_gameplay_counter_play_beep_spawn}
	disable_ui_visualizer
endscript

script ui_anim_in_voting 
	printf \{qs(0x8b7d23e4)}
	if ScreenElementExists \{id = votinginterface}
		votinginterface :se_setprops \{alpha = 1.0
			time = 0.4
			motion = ease_out}
		votinginterface :se_waitprops
		LaunchEvent \{Type = focus
			target = current_menu}
	endif
endscript

script update_voting_timer 
	Obj_GetID
	if NOT ininternetmode
		<objID> :se_setprops vote_timer_hand_rgba = [255 255 255 0]
		return
	endif
	OnExitRun reset_voting_timer params = {objID = <objID>}
	<objID> :se_setprops timer_rotation = 360 time = 10.0
	Wait \{7.5
		Seconds}
	<objID> :se_setprops vote_timer_hand_rgba = [130 40 40 255]
	audio_ui_voting_screen_timer
	Wait \{2.5
		Seconds}
endscript

script reset_voting_timer 
	RequireParams \{[
			objID
		]
		all}
	if ScreenElementExists id = <objID>
		<objID> :se_setprops vote_timer_hand_rgba = [255 255 255 0]
	endif
endscript

script start_bat_animations 
	if ScreenElementExists \{id = votinginterface}
		if votinginterface :desc_resolvealias \{Name = alias_vote_bat_gold1
				param = bat_gold1}
			<bat_gold1> :Obj_SpawnScriptNow bat_animation_loop
		endif
		if votinginterface :desc_resolvealias \{Name = alias_vote_bat_gold2
				param = bat_gold2}
			<bat_gold2> :Obj_SpawnScriptNow bat_animation_loop
		endif
		if votinginterface :desc_resolvealias \{Name = alias_vote_bat_gold3
				param = bat_gold3}
			<bat_gold3> :Obj_SpawnScriptNow bat_animation_loop
		endif
		if votinginterface :desc_resolvealias \{Name = alias_vote_bat_hell1
				param = bat_hell1}
			<bat_hell1> :Obj_SpawnScriptNow bat_animation_loop
		endif
		if votinginterface :desc_resolvealias \{Name = alias_vote_bat_hell2
				param = bat_hell2}
			<bat_hell2> :Obj_SpawnScriptNow bat_animation_loop
		endif
		if votinginterface :desc_resolvealias \{Name = alias_vote_bat_hell3
				param = bat_hell3}
			<bat_hell3> :Obj_SpawnScriptNow bat_animation_loop
		endif
	endif
endscript

script bat_animation_loop 
	Obj_GetID
	randomwait = Random (@ 0 @ 0.2 @ 0.3 @ 0.4 )
	Wait <randomwait> Seconds
	randomtime = RandomFloat (0.5, 1.0)
	randomoffset = RandomInteger (10.0, 20.0)
	offsetup = (<randomoffset> * (0.0, 2.0))
	offsetdn = (<randomoffset> * (0.0, -2.0))
	<objID> :se_setprops Pos = {(<offsetup> * (0.5)) relative} rot_angle = 0 time = <randomtime> motion = ease_in
	begin
	randomrot = Random (@ -3 @ 3 @ 2 @ -2 @ 0 )
	<objID> :se_setprops Pos = {<offsetdn> relative} rot_angle = <randomrot> time = <randomtime> motion = ease_out
	<objID> :se_waitprops
	<objID> :se_setprops Pos = {<offsetup> relative} rot_angle = 0 time = <randomtime> motion = ease_in
	<objID> :se_waitprops
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
	if (<array_Size> > 0)
		i = 0
		begin
		if (<device_num> = (($g_controllers_that_voted) [<i>]))
			allowed = 0
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	if (<allowed> = 1)
		array = ($g_controllers_that_voted)
		AddArrayElement array = <array> element = <device_num>
		Change g_controllers_that_voted = <array>
		if ininternetmode
			SendStructure callback = cast_vote_callback data_to_send = {option = <option>}
			if IsHost
				audio_ui_play_cast_vote_sfx option = <option>
				SetArrayElement globalarray ArrayName = g_vote_counts index = <option> NewValue = (($g_vote_counts [<option>]) + 1)
			endif
		else
			audio_ui_play_cast_vote_sfx option = <option>
			SetArrayElement globalarray ArrayName = g_vote_counts index = <option> NewValue = (($g_vote_counts [<option>]) + 1)
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
	getnumplayersingame
	if (<num_players> > 0)
		<count> = 0
		begin
		if ScreenElementExists \{id = votinginterface}
			votinginterface :GetSingleTag \{left_vote_count}
			votinginterface :GetSingleTag \{right_vote_count}
			if (<left_vote_count> != ($g_vote_counts [0]))
				votinginterface :se_setprops \{vote_display_1_scale = 1.5}
				votinginterface :se_setprops \{vote_display_1_scale = 1.0
					time = 0.2
					motion = ease_out}
			endif
			if (<right_vote_count> != ($g_vote_counts [1]))
				votinginterface :se_setprops \{vote_display_2_scale = 1.5}
				votinginterface :se_setprops \{vote_display_2_scale = 1.0
					time = 0.2
					motion = ease_out}
			endif
			formatText TextName = vote0_count qs(0x48c6d14c) d = ($g_vote_counts [0])
			formatText TextName = vote1_count qs(0x48c6d14c) d = ($g_vote_counts [1])
			votinginterface :se_setprops {
				left_count_text = <vote0_count>
				right_count_text = <vote1_count>
			}
			votinginterface :SetTags {
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
		Wait \{0.25
			Seconds}
		if ininternetmode
			<count> = (<count> + 1)
			if (<count> > 40 || $debug_force_vote = 1)
				break
			endif
		elseif ($debug_force_vote = 1)
			break
		endif
		repeat
		KillSpawnedScript \{Name = audio_ui_voting_screen_timer}
		KillSpawnedScript \{Name = audio_gameplay_counter_play_beep_spawn}
		KillSpawnedScript \{Name = update_voting_timer}
		voting_update_complete
	endif
endscript

script voting_update_complete 
	printf \{qs(0x4217906e)}
	resolve_voting_outcome
	if ScreenElementExists \{id = votinginterface}
		votinginterface :GetSingleTag \{voting_items_array}
		if ($debug_force_vote = 1)
			Change \{debug_force_vote = 0}
			Result = ($g_force_vote)
		else
			Result = (<voting_items_array> [<winner_index>])
		endif
		<vote_tie> = 0
		if GotParam \{winner_index}
			if (<winner_index> = 2)
				<vote_tie> = 1
			endif
		endif
		printstruct <...>
		if ininternetmode
			if IsHost
				SendStructure {
					callback = client_voting_result
					data_to_send = {
						Result = <Result>
						tie = <vote_tie>
						left_vote_count = ($g_vote_counts [0])
						right_vote_count = ($g_vote_counts [1])
					}
				}
				current_menu :Obj_SpawnScriptNow display_voting_result_and_exit params = {Result = <Result> tie = <vote_tie>}
			endif
		else
			current_menu :Obj_SpawnScriptNow display_voting_result_and_exit params = {Result = <Result> tie = <vote_tie>}
		endif
	endif
endscript

script client_voting_result 
	Change \{g_received_final_vote_counts = 1}
	if ScreenElementExists \{id = votinginterface}
		if (<left_vote_count> != ($g_vote_counts [0]))
			SetArrayElement globalarray ArrayName = g_vote_counts index = 0 NewValue = <left_vote_count>
			votinginterface :se_setprops \{vote_display_1_scale = 1.5}
			votinginterface :se_setprops \{vote_display_1_scale = 1.0
				time = 0.2
				motion = ease_out}
		endif
		if (<right_vote_count> != ($g_vote_counts [1]))
			SetArrayElement globalarray ArrayName = g_vote_counts index = 1 NewValue = <right_vote_count>
			votinginterface :se_setprops \{vote_display_2_scale = 1.5}
			votinginterface :se_setprops \{vote_display_2_scale = 1.0
				time = 0.2
				motion = ease_out}
		endif
		formatText TextName = vote0_count qs(0x48c6d14c) d = ($g_vote_counts [0])
		formatText TextName = vote1_count qs(0x48c6d14c) d = ($g_vote_counts [1])
		votinginterface :se_setprops {
			left_count_text = <vote0_count>
			right_count_text = <vote1_count>
		}
		votinginterface :SetTags {
			left_vote_count = ($g_vote_counts [0])
			right_vote_count = ($g_vote_counts [1])
		}
		votinginterface :Obj_SpawnScriptNow display_voting_result_and_exit params = <...>
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
			Result
			tie
		]
		all}
	if ScreenElementExists \{id = votinginterface}
		voting_display_winner Result = <Result> tie = <tie>
		Wait \{3
			Seconds}
		audio_ui_menu_music_off
		if ($current_transition = None)
			if NOT InNetGame
				Change current_level = ($g_band_lobby_current_level)
				venue = ($g_band_lobby_current_level)
				if StructureContains structure = ($LevelZones.<venue>) Name = loading_movie
					create_venue_loading_screen movie_params = ($LevelZones.<venue>)
				else
					create_loading_screen
				endif
			endif
		else
			StopRendering
		endif
		if ScreenElementExists \{id = votinginterface}
			if votinginterface :GetSingleTag \{voting_complete_callback}
				printf \{qs(0xaf67751d)}
				if NOT checksumequals a = <voting_complete_callback> b = NULL
					printf \{qs(0x8d22404a)}
					<voting_complete_callback> <...>
				endif
			endif
		endif
		if ScreenElementExists \{id = votinginterface}
			if votinginterface :GetSingleTag \{next_state}
				generic_event_replace no_sound state = <next_state>
			endif
		endif
	endif
endscript

script voting_display_winner 
	printf \{qs(0x32f3ab6a)}
	printstruct <...>
	if ScreenElementExists \{id = votinginterface}
		votinginterface :GetSingleTag \{voting_items_array}
		GetArraySize <voting_items_array>
		<index> = 0
		begin
		if checksumequals a = (<voting_items_array> [<index>]) b = <Result>
			break
		endif
		<index> = (<index> + 1)
		repeat <array_Size>
		if (<index> > 1)
			<index> = 1
		endif
		if GotParam \{tie}
			if (<tie> = 1)
				audio_ui_play_voting_outcome_result_sfx \{winner = 2}
				Wait \{1.5
					Seconds}
				<count> = 0
				wait_time = 0.025
				begin
				Mod a = <count> b = 2
				if (<Mod> = 0)
					votinginterface :se_setprops tie_breaker_flipper_2_alpha = 0.0 time = (<wait_time> / 2) motion = ease_in
					votinginterface :se_waitprops
				else
					votinginterface :se_setprops tie_breaker_flipper_1_alpha = 0.0 time = (<wait_time> / 2) motion = ease_in
					votinginterface :se_waitprops
				endif
				if (<Mod> = 0)
					votinginterface :se_setprops tie_breaker_flipper_1_alpha = 1.0 time = (<wait_time> / 2) motion = ease_out
					votinginterface :se_waitprops
				else
					votinginterface :se_setprops tie_breaker_flipper_2_alpha = 1.0 time = (<wait_time> / 2) motion = ease_out
					votinginterface :se_waitprops
				endif
				<wait_time> = (<wait_time> * 1.2)
				if ((<wait_time> > 0.6) && (<index> = <Mod>))
					break
				endif
				audio_ui_play_tie_breaker_sfx count = <count>
				<count> = (<count> + 1)
				repeat
			endif
		endif
		if (<index> = 0)
			audio_ui_play_voting_outcome_result_sfx \{winner = 0}
			create_ui_star_particles \{Pos = (-530.0, 170.0)
				z = 30}
			votinginterface :se_setprops \{vote_display_2_pos = {
					(0.0, 500.0)
					relative
				}
				time = 2.0
				motion = ease_in}
			votinginterface :se_setprops \{vote_display_2_rot_angle = 265
				time = 2.0}
		else
			audio_ui_play_voting_outcome_result_sfx \{winner = 1}
			create_ui_star_particles \{Pos = (-250.0, 50.0)
				z = 30}
			votinginterface :se_setprops \{vote_display_1_pos = {
					(0.0, 500.0)
					relative
				}
				time = 2.0
				motion = ease_in}
			votinginterface :se_setprops \{vote_display_1_rot_angle = -265
				time = 2.0}
		endif
	endif
endscript

script display_competitive_rules_voting 
	prepare_game_rules_voting
	GetArraySize ($current_playlist)
	if (<array_Size> > 0)
		<array> = []
		<index> = 0
		begin
		get_ui_song_struct_items song = ($current_playlist [<index>])
		if (<index> = 0)
			<voting_subtitle> = (<ui_struct>.song_title)
		endif
		AddArrayElement array = <array> element = (<ui_struct>.song_title)
		<index> = (<index> + 1)
		repeat <array_Size>
		<info_list> = <array>
	endif
	if ininternetmode
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
				state = uistate_voting
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
			state = uistate_voting
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
	if (<array_Size> > 0)
		<array> = []
		<index> = 0
		begin
		get_ui_song_struct_items song = ($current_playlist [<index>])
		if (<index> = 0)
			<voting_subtitle> = (<ui_struct>.song_title)
		endif
		AddArrayElement array = <array> element = (<ui_struct>.song_title)
		<index> = (<index> + 1)
		repeat <array_Size>
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
		state = uistate_voting
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
	LaunchEvent \{Type = unfocus
		target = current_menu}
	CreateScreenElement \{parent = votinginterface
		Pos = (0.0, 0.0)
		Type = menuelement
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
		isvertical = true
		internal_just = [
			center
			center
		]
		fit_major = `expand	if	content	larger`
		fit_minor = `keep	dims`}
	<menu_id> = <id>
	GetArraySize ($competitive_rules_array)
	if (<array_Size> > 0)
		i = 0
		begin
		add_element = 1
		<competitive_rules> = (($competitive_rules_array) [<i>])
		if NOT teammodeequals \{team_mode = two_teams}
			if (($<competitive_rules>.team) = 1)
				add_element = 0
			endif
		else
			if (($<competitive_rules>.team) = 0)
				add_element = 0
			endif
		endif
		if checksumequals a = <competitive_rules> b = elimination
			getnumplayersingame
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
				Type = TextBlockElement
				parent = <menu_id>
				text = ($<competitive_rules>.text)
				font = fontgrid_text_a1
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
		repeat <array_Size>
	endif
	AssignAlias id = <menu_id> alias = current_menu
	LaunchEvent \{Type = focus
		target = current_menu}
endscript

script set_force_vote 
	Change \{debug_force_vote = 1}
	Change g_force_vote = <rules>
endscript

script voting_item_change_focus 
	Obj_GetID
	if GotParam \{focus}
		<objID> :se_setprops alpha = 1.0
	elseif GotParam \{unfocus}
		<objID> :se_setprops alpha = 0.5
	endif
endscript

script voting_drop_player 
	if ScreenElementExists \{id = votinginterface}
		<parent> = votinginterface
	endif
	songlist_drop_player <...>
endscript

script voting_end_game 
	KillSpawnedScript \{Name = ui_voting_update}
	KillSpawnedScript \{Name = display_voting_result_and_exit}
	songlist_end_game <...>
endscript
