debug_force_vote = 0
num_list_entries = 7

script ui_create_voting 
	if innetgame
		spawn_player_drop_listeners \{drop_player_script = voting_drop_player
			end_game_script = songlist_end_game}
	endif
	spawnscriptnow \{menu_music_on}
	spawnscriptnow \{skate8_sfx_backgrounds_new_area
		params = {
			bg_sfx_area = frontend_menu_music
			fadeouttime = 5
			fadeouttype = linear
		}}
	spawnscriptnow \{neutral_crowd_wait_to_lower_stats}
	requireparams \{[
			voting_items_array
		]
		all}
	createscreenelement \{id = votinginterface
		parent = root_window
		type = descinterface
		desc = 'generic_voting'
		z_priority = 20.0
		alpha = 0.0
		just = [
			left
			top
		]
		pos = (0.0, 0.0)
		autosizedims = false
		dims = (1280.0, 720.0)
		tags = {
			left_vote_count = 0
			right_vote_count = 0
		}}
	if votinginterface :desc_resolvealias \{name = alias_bg_anim1
			param = vote_bg2_anim_id}
		<vote_bg2_anim_id> :obj_spawnscript ui_shakey
	else
		scriptassert \{'pdetrich'}
	endif
	if votinginterface :desc_resolvealias \{name = alias_bg_anim1
			param = vote_bg2_anim_id}
		<vote_bg2_anim_id> :obj_spawnscript ui_frazzmatazz
	else
		scriptassert \{'pdetrich'}
	endif
	if votinginterface :desc_resolvealias \{name = alias_bg_anim2
			param = vote_bg3_anim_id}
		<vote_bg3_anim_id> :obj_spawnscript ui_shakey
	else
		scriptassert \{'pdetrich2'}
	endif
	if votinginterface :desc_resolvealias \{name = alias_bg_anim2
			param = vote_bg3_anim_id}
		<vote_bg3_anim_id> :obj_spawnscript ui_frazzmatazz
	else
		scriptassert \{'pdetrich2'}
	endif
	change \{g_vote_counts = [
			0
			0
		]}
	change \{g_controllers_that_voted = [
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
	getarraysize <info_list>
	if (<array_size> > 0)
		printstruct <...>
		if gotparam \{info_list_title}
			printf \{qs(0xb56a311e)}
			votinginterface :se_setprops {optional_info_title_text = <info_list_title>}
		endif
		if votinginterface :desc_resolvealias \{name = alias_optional_info_list
				param = menu_id}
			<index> = 0
			begin
			if ((<index> + 1) = $num_list_entries)
				<text> = qs(0x3871eb3b)
			else
				<text> = (<info_list> [<index>])
			endif
			formattext textname = pos_text qs(0xc31d83ea) i = (<index> + 1)
			createscreenelement {
				type = textblockelement
				parent = <menu_id>
				fit_width = truncate
				fit_height = `scale down if larger`
				scale_mode = proportional
				text = <text>
				font = fontgrid_title_a1
				autosizedims = false
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
			repeat <array_size>
		endif
	endif
	if NOT gotparam \{menu_id}
		scriptassert \{'Could not resolve menu for event handlers'}
	endif
	menu_id = <resolved_id>
	array = []
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		begin
		getplayerinfo <player> controller
		addarrayelement array = <array> element = <controller>
		getnextplayer player = <player> local
		repeat <num_players>
		controllers_allowed_to_vote = <array>
	endif
	getarraysize <voting_items_array>
	if (<array_size> = 3)
		votinginterface :settags {voting_items_array = <voting_items_array>}
		left_text = (<voting_items_array> [0])
		right_text = (<voting_items_array> [1])
		votinginterface :se_setprops {
			left_choice_text = ($<left_text>.text)
			right_choice_text = ($<right_text>.text)
		}
		if ((($is_network_game = 0) || (ishost)) && (($global_should_use_net_debugging) = 1))
			event_handlers = [
				{pad_option generic_cast_vote params = {option = 0}}
				{pad_l1 generic_cast_vote params = {option = 1}}
				{pad_choose debug_choose_mode}
			]
		else
			event_handlers = [
				{pad_option generic_cast_vote params = {option = 0}}
				{pad_l1 generic_cast_vote params = {option = 1}}
			]
		endif
		clean_up_user_control_helpers
		if NOT innetgame
			add_user_control_helper \{text = qs(0xaf4d5dd2)
				button = red
				z = 100000}
		endif
		formattext textname = button_helper_string qs(0x3f014b7b) d = ($<left_text>.upper_text)
		add_user_control_helper text = <button_helper_string> button = blue z = 100000
		formattext textname = button_helper_string qs(0x3f014b7b) d = ($<right_text>.upper_text)
		add_user_control_helper text = <button_helper_string> button = orange z = 100000
	else
		scriptassert \{'Generic voting needs voting_items_array of size 3'}
	endif
	votinginterface :obj_spawnscriptnow \{update_voting_timer}
	<menu_id> :obj_spawnscriptnow ui_voting_update params = {voting_items_array = <voting_items_array>}
	<menu_id> :se_setprops event_handlers = <event_handlers> exclusive_device = <controllers_allowed_to_vote>
	start_bat_animations
	if gotparam \{voting_callback}
		votinginterface :settags voting_complete_callback = <voting_callback>
	endif
	if gotparam \{next_state}
		votinginterface :settags next_state = <next_state>
	endif
	if screenelementexists id = <menu_id>
		if gotparam \{back_script}
			if NOT gotparam \{back_params}
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
	assignalias id = <menu_id> alias = current_menu
	enable_ui_visualizer
endscript

script ui_destroy_voting 
	clean_up_user_control_helpers
	destroyscreenelement \{id = votinginterface}
	killspawnedscript \{name = counter_play_beep_spawn}
	disable_ui_visualizer
endscript

script ui_anim_in_voting 
	printf \{qs(0x8b7d23e4)}
	if screenelementexists \{id = votinginterface}
		votinginterface :se_setprops \{alpha = 1.0
			time = 0.4
			motion = ease_out}
		votinginterface :se_waitprops
		launchevent \{type = focus
			target = current_menu}
	endif
endscript

script update_voting_timer 
	obj_getid
	if NOT ininternetmode
		<objid> :se_setprops vote_timer_hand_rgba = [255 255 255 0]
		return
	endif
	onexitrun reset_voting_timer params = {objid = <objid>}
	<objid> :se_setprops timer_rotation = 360 time = 10.0
	wait \{7.5
		seconds}
	<objid> :se_setprops vote_timer_hand_rgba = [130 40 40 255]
	voting_screen_timer
	wait \{2.5
		seconds}
endscript

script reset_voting_timer 
	requireparams \{[
			objid
		]
		all}
	if screenelementexists id = <objid>
		<objid> :se_setprops vote_timer_hand_rgba = [255 255 255 0]
	endif
endscript

script start_bat_animations 
	if screenelementexists \{id = votinginterface}
		if votinginterface :desc_resolvealias \{name = alias_vote_bat_gold1
				param = bat_gold1}
			<bat_gold1> :obj_spawnscriptnow bat_animation_loop
		endif
		if votinginterface :desc_resolvealias \{name = alias_vote_bat_gold2
				param = bat_gold2}
			<bat_gold2> :obj_spawnscriptnow bat_animation_loop
		endif
		if votinginterface :desc_resolvealias \{name = alias_vote_bat_gold3
				param = bat_gold3}
			<bat_gold3> :obj_spawnscriptnow bat_animation_loop
		endif
		if votinginterface :desc_resolvealias \{name = alias_vote_bat_hell1
				param = bat_hell1}
			<bat_hell1> :obj_spawnscriptnow bat_animation_loop
		endif
		if votinginterface :desc_resolvealias \{name = alias_vote_bat_hell2
				param = bat_hell2}
			<bat_hell2> :obj_spawnscriptnow bat_animation_loop
		endif
		if votinginterface :desc_resolvealias \{name = alias_vote_bat_hell3
				param = bat_hell3}
			<bat_hell3> :obj_spawnscriptnow bat_animation_loop
		endif
	endif
endscript

script bat_animation_loop 
	obj_getid
	randomwait = Random (@ 0 @ 0.2 @ 0.3 @ 0.4 )
	wait <randomwait> seconds
	randomtime = RandomFloat (0.5, 1.0)
	randomoffset = RandomInteger (10.0, 20.0)
	offsetup = (<randomoffset> * (0.0, 2.0))
	offsetdn = (<randomoffset> * (0.0, -2.0))
	<objid> :se_setprops pos = {(<offsetup> * (0.5)) relative} rot_angle = 0 time = <randomtime> motion = ease_in
	begin
	randomrot = Random (@ -3 @ 3 @ 2 @ -2 @ 0 )
	<objid> :se_setprops pos = {<offsetdn> relative} rot_angle = <randomrot> time = <randomtime> motion = ease_out
	<objid> :se_waitprops
	<objid> :se_setprops pos = {<offsetup> relative} rot_angle = 0 time = <randomtime> motion = ease_in
	<objid> :se_waitprops
	repeat
endscript

script generic_cast_vote 
	requireparams \{[
			option
		]
		all}
	printf \{qs(0x20f736cb)}
	allowed = 1
	getarraysize ($g_controllers_that_voted)
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
		addarrayelement array = <array> element = <device_num>
		change g_controllers_that_voted = <array>
		if ininternetmode
			sendstructure callback = cast_vote_callback data_to_send = {option = <option>}
			if ishost
				setarrayelement globalarray arrayname = g_vote_counts index = <option> newvalue = (($g_vote_counts [<option>]) + 1)
			endif
		else
			cast_vote_ui_sfx option = <option>
			setarrayelement globalarray arrayname = g_vote_counts index = <option> newvalue = (($g_vote_counts [<option>]) + 1)
		endif
	else
		printf \{qs(0x4395d3e0)}
	endif
endscript

script ui_voting_update 
	printf \{qs(0x1f01040c)}
	requireparams \{[
			voting_items_array
		]
		all}
	getnumplayersingame
	if (<num_players> > 0)
		<count> = 0
		begin
		if screenelementexists \{id = votinginterface}
			votinginterface :getsingletag \{left_vote_count}
			votinginterface :getsingletag \{right_vote_count}
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
			formattext textname = vote0_count qs(0x48c6d14c) d = ($g_vote_counts [0])
			formattext textname = vote1_count qs(0x48c6d14c) d = ($g_vote_counts [1])
			votinginterface :se_setprops {
				left_count_text = <vote0_count>
				right_count_text = <vote1_count>
			}
			votinginterface :settags {
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
		if ininternetmode
			<count> = (<count> + 1)
			if (<count> > 40 || $debug_force_vote = 1)
				break
			endif
		elseif ($debug_force_vote = 1)
			break
		endif
		repeat
		killspawnedscript \{name = voting_screen_timer}
		killspawnedscript \{name = counter_play_beep_spawn}
		killspawnedscript \{name = update_voting_timer}
		voting_update_complete
	endif
endscript

script voting_update_complete 
	printf \{qs(0x4217906e)}
	resolve_voting_outcome
	if screenelementexists \{id = votinginterface}
		votinginterface :getsingletag \{voting_items_array}
		if ($global_should_use_net_debugging = 1 || $debug_force_vote = 1)
			change \{debug_force_vote = 0}
			result = ($g_force_vote)
		else
			result = (<voting_items_array> [<winner_index>])
		endif
		<vote_tie> = 0
		if gotparam \{winner_index}
			if (<winner_index> = 2)
				<vote_tie> = 1
			endif
		endif
		printstruct <...>
		if ininternetmode
			if ishost
				sendstructure {
					callback = client_voting_result
					data_to_send = {
						result = <result>
						tie = <vote_tie>
					}
				}
				current_menu :obj_spawnscriptnow display_voting_result_and_exit params = {result = <result> tie = <vote_tie>}
			endif
		else
			current_menu :obj_spawnscriptnow display_voting_result_and_exit params = {result = <result> tie = <vote_tie>}
		endif
	endif
endscript

script client_voting_result 
	if screenelementexists \{id = votinginterface}
		votinginterface :obj_spawnscriptnow display_voting_result_and_exit params = <...>
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
	requireparams \{[
			result
			tie
		]
		all}
	if screenelementexists \{id = votinginterface}
		voting_display_winner result = <result> tie = <tie>
		wait \{3
			seconds}
		menu_music_off
		if ($current_transition = none)
			if NOT innetgame
				change current_level = ($g_band_lobby_current_level)
				venue = ($g_band_lobby_current_level)
				if structurecontains structure = ($levelzones.<venue>) name = loading_movie
					create_venue_loading_screen movie_params = ($levelzones.<venue>)
				else
					create_loading_screen
				endif
			endif
		else
			stoprendering
		endif
		if screenelementexists \{id = votinginterface}
			if votinginterface :getsingletag \{voting_complete_callback}
				printf \{qs(0xaf67751d)}
				if NOT checksumequals a = <voting_complete_callback> b = null
					printf \{qs(0x8d22404a)}
					<voting_complete_callback> <...>
				endif
			endif
		endif
		if screenelementexists \{id = votinginterface}
			if votinginterface :getsingletag \{next_state}
				generic_event_replace no_sound state = <next_state>
			endif
		endif
	endif
endscript

script voting_display_winner 
	printf \{qs(0x32f3ab6a)}
	printstruct <...>
	if screenelementexists \{id = votinginterface}
		votinginterface :getsingletag \{voting_items_array}
		getarraysize <voting_items_array>
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
		if gotparam \{tie}
			if (<tie> = 1)
				voting_outcome_result_sfx \{winner = 2}
				wait \{1.5
					seconds}
				<count> = 0
				wait_time = 0.025
				begin
				mod a = <count> b = 2
				if (<mod> = 0)
					votinginterface :se_setprops tie_breaker_flipper_2_alpha = 0.0 time = (<wait_time> / 2) motion = ease_in
					votinginterface :se_waitprops
				else
					votinginterface :se_setprops tie_breaker_flipper_1_alpha = 0.0 time = (<wait_time> / 2) motion = ease_in
					votinginterface :se_waitprops
				endif
				if (<mod> = 0)
					votinginterface :se_setprops tie_breaker_flipper_1_alpha = 1.0 time = (<wait_time> / 2) motion = ease_out
					votinginterface :se_waitprops
				else
					votinginterface :se_setprops tie_breaker_flipper_2_alpha = 1.0 time = (<wait_time> / 2) motion = ease_out
					votinginterface :se_waitprops
				endif
				<wait_time> = (<wait_time> * 1.2)
				if ((<wait_time> > 0.6) && (<index> = <mod>))
					break
				endif
				tie_breaker_sfx count = <count>
				<count> = (<count> + 1)
				repeat
			endif
		endif
		if (<index> = 0)
			voting_outcome_result_sfx \{winner = 0}
			create_ui_star_particles \{pos = (-530.0, 170.0)
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
			voting_outcome_result_sfx \{winner = 1}
			create_ui_star_particles \{pos = (-250.0, 50.0)
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
	getarraysize ($current_playlist)
	if (<array_size> > 0)
		<array> = []
		<index> = 0
		begin
		get_ui_song_struct_items song = ($current_playlist [<index>])
		if (<index> = 0)
			<voting_subtitle> = (<ui_struct>.song_title)
		endif
		addarrayelement array = <array> element = (<ui_struct>.song_title)
		<index> = (<index> + 1)
		repeat <array_size>
		<info_list> = <array>
	endif
	if ininternetmode
		if ishost
			sendstructure {
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
	getarraysize ($current_playlist)
	if (<array_size> > 0)
		<array> = []
		<index> = 0
		begin
		get_ui_song_struct_items song = ($current_playlist [<index>])
		if (<index> = 0)
			<voting_subtitle> = (<ui_struct>.song_title)
		endif
		addarrayelement array = <array> element = (<ui_struct>.song_title)
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
	if gotparam \{is_popup}
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
	launchevent \{type = unfocus
		target = current_menu}
	createscreenelement \{parent = votinginterface
		pos = (0.0, 0.0)
		type = menuelement
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
		fit_major = `expand if content larger`
		fit_minor = `keep dims`}
	<menu_id> = <id>
	getarraysize ($competitive_rules_array)
	if (<array_size> > 0)
		i = 0
		begin
		add_element = 1
		<competitive_rules> = (($competitive_rules_array) [<i>])
		if NOT gamemode_isteamgame
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
			createscreenelement {
				type = textblockelement
				parent = <menu_id>
				text = ($<competitive_rules>.text)
				font = fontgrid_text_a1
				dims = (150.0, 40.0)
				alpha = 0.5
				just = [left , top]
				rgba = [240 240 240 255]
				fit_height = `scale down if larger`
				fit_width = `scale each line if larger`
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
	assignalias id = <menu_id> alias = current_menu
	launchevent \{type = focus
		target = current_menu}
endscript

script set_force_vote 
	change \{debug_force_vote = 1}
	change g_force_vote = <rules>
endscript

script voting_item_change_focus 
	obj_getid
	if gotparam \{focus}
		<objid> :se_setprops alpha = 1.0
	elseif gotparam \{unfocus}
		<objid> :se_setprops alpha = 0.5
	endif
endscript

script voting_drop_player 
	if screenelementexists \{id = votinginterface}
		<parent> = votinginterface
	endif
	songlist_drop_player <...>
endscript
