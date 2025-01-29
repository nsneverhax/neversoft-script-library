
script freestyle_tutorial_spawn_goal_counter \{Pos = (0.0, -164.0)
		goal_total = 10}
	if NOT ScreenElementExists \{id = goal_counter}
		if (($freestyle_game_mode) = tutorial)
			formatText TextName = text_content qs(0xa1e02847) a = <goal_total>
			highway_player = ($freestyle_player_data [0].highway_player)
			formatText checksumName = freestyle_highway_name 'freestyle_highway_containerp%p' p = <highway_player>
			CreateScreenElement {
				Type = SpriteElement
				parent = <freestyle_highway_name>
				id = goal_counter_background
				texture = countdownbg
				pos_anchor = [center center]
				just = [center center]
				Pos = <Pos>
				z_priority = 300
			}
			CreateScreenElement {
				Type = TextElement
				parent = <freestyle_highway_name>
				Pos = <Pos>
				text = <text_content>
				id = goal_counter
				font = fontgrid_text_a1
				z_priority = 301
				pos_anchor = [center center]
				just = [center center]
			}
			goal_counter :SetTags \{count = 0}
			goal_counter :SetTags goal = <goal_total>
		else
			ScriptAssert \{'Couldnt create the goal counter as the game is not in tutorial mode'}
		endif
	endif
endscript

script freestyle_tutorial_goal_counter_increment 
	if ScreenElementExists \{id = goal_counter}
		goal_counter :GetTags \{count}
		goal_counter :GetTags \{goal}
		if (<count> < <goal>)
			new_count = (<count> + 1)
			goal_counter :SetTags count = <new_count>
			formatText TextName = text_content qs(0x953baf82) a = <new_count> b = <goal>
			goal_counter :se_setprops {text = <text_content>}
			printf 'NEW COUNT: %d GOAL: %e' d = <new_count> e = <goal>
			if (<new_count> > (<goal> -1))
				printf \{'SHOULD LAUNCH STEP COMPLETE NOW!!!'}
				printf 'NEW COUNT: %d GOAL: %e' d = <new_count> e = <goal>
				Wait \{0.25
					Seconds}
				freestyle_tutorial_info_pane :desc_resolvealias \{Name = alias_info_card_event_handler}
				LaunchEvent Type = step_complete target = <resolved_id>
			endif
		endif
	endif
endscript

script freestyle_tutorial_goal_counter_kill 
	if ScreenElementExists \{id = goal_counter}
		DestroyScreenElement \{id = goal_counter}
		DestroyScreenElement \{id = goal_counter_background}
	endif
endscript

script freestyle_tutorial_event_catch 
	if (($freestyle_game_mode) = tutorial)
		if ScreenElementExists \{id = freestyle_tutorial_info_pane}
			freestyle_tutorial_info_pane :GetTags \{controller_type}
			freestyle_get_player_param \{Player = $freestyle_tutorial_player
				param = instrument_handler}
			if (<instrument_handler> = guitar)
				getguitareventtriggered all Player = ($freestyle_tutorial_player)
				if NOT ((<event_triggered_array> [0].event_triggered) = -1)
					freestyle_tutorial_info_pane :desc_resolvealias \{Name = alias_info_card_event_handler}
					LaunchEvent Type = guitar_strum target = <resolved_id> data = {pattern = (<event_triggered_array> [0].event_triggered) event_data = (<event_triggered_array> [0])}
				endif
			endif
		endif
	endif
endscript

script freestyle_tutorial_spawn_complete_notification \{Pos = (-320.0, -270.0)
		time = 3}
	if NOT ScreenElementExists \{id = complete_notification}
		if (($freestyle_game_mode) = tutorial)
			highway_player = ($freestyle_player_data [0].highway_player)
			formatText checksumName = freestyle_highway_name 'freestyle_highway_containerp%p' p = <highway_player>
			if ScreenElementExists id = <freestyle_highway_name>
				CreateScreenElement {
					parent = <freestyle_highway_name>
					id = complete_notification
					Type = descinterface
					desc = 'freestyle_tutorial_complete_notice'
					pos_anchor = [center center]
					just = [center center]
					Pos = <Pos>
				}
				complete_notification :desc_resolvealias \{Name = alias_text}
				<resolved_id> :obj_spawnscript freestyle_animate_solo_indicator id = animate_script
				SoundEvent \{event = gig_challenge_complete}
				Wait <time> Seconds
				KillSpawnedScript \{id = animate_script}
				DestroyScreenElement \{id = complete_notification}
			endif
		else
			ScriptAssert \{qs(0xe9ad153b)}
		endif
	endif
endscript

script freestyle_tutorial_spawn_timer \{time = 15}
	if (($freestyle_game_mode) = tutorial)
		if ScreenElementExists \{id = freestyle_tutorial_info_pane}
			CastToInteger \{time}
			highway_player = ($freestyle_player_data [0].highway_player)
			formatText checksumName = freestyle_highway_name 'freestyle_highway_containerp%p' p = <highway_player>
			time_text = qs(0x3bf547a6)
			if NOT ScreenElementExists \{id = standard_timer}
				CreateScreenElement {
					Type = SpriteElement
					parent = <freestyle_highway_name>
					id = timer_background
					texture = countdownbg
					pos_anchor = [center center]
					just = [center center]
					Pos = (0.0, -164.0)
					z_priority = 300
				}
				CreateScreenElement {
					Type = TextElement
					id = standard_timer
					text = <time_text>
					dims = (64.0, 64.0)
					parent = <freestyle_highway_name>
					Pos = (0.0, -164.0)
					font = fontgrid_text_a1
					z_priority = 301
					pos_anchor = [center center]
					just = [center center]
				}
			endif
			counter = <time>
			begin
			formatText TextName = time_text qs(0x76b3fda7) d = <counter>
			if ScreenElementExists \{id = standard_timer}
				standard_timer :se_setprops {
					text = <time_text>
				}
			else
				return
			endif
			counter = (<counter> -1)
			Wait \{1
				Seconds}
			repeat <time>
			DestroyScreenElement \{id = standard_timer}
			DestroyScreenElement \{id = timer_background}
			freestyle_tutorial_info_pane :desc_resolvealias \{Name = alias_info_card_event_handler}
			LaunchEvent Type = step_complete target = <resolved_id>
		else
			ScriptAssert \{'Could not spawn a timer as no input handler was found to accept its events'}
		endif
	else
		ScriptAssert \{'Could not spawn a timer as it is only supported in tutorial mode'}
	endif
endscript

script freestyle_tutorial_spawn_hold_timer 
	0x5ac2d36c
	SpawnScriptNow 0xec885f60 id = hold_timer_script params = <...>
endscript

script 0xec885f60 \{time = 15}
	if (($freestyle_game_mode) = tutorial)
		if ScreenElementExists \{id = freestyle_tutorial_info_pane}
			CastToInteger \{time}
			highway_player = ($freestyle_player_data [0].highway_player)
			formatText checksumName = freestyle_highway_name 'freestyle_highway_containerp%p' p = <highway_player>
			time_text = qs(0x6160dbf3)
			if NOT ScreenElementExists \{id = hold_timer}
				CreateScreenElement {
					Type = SpriteElement
					parent = <freestyle_highway_name>
					id = timer_background
					texture = black_circle_gradient
					pos_anchor = [center center]
					just = [center center]
					Pos = (0.0, -280.0)
					z_priority = 300
					Scale = 3
				}
				CreateScreenElement {
					Type = TextElement
					id = hold_timer
					text = <time_text>
					dims = (64.0, 64.0)
					parent = <freestyle_highway_name>
					Pos = (0.0, -280.0)
					font = fontgrid_text_a1
					z_priority = 301
					pos_anchor = [center center]
					just = [center center]
				}
			endif
			counter = <time>
			begin
			formatText TextName = time_text qs(0x76b3fda7) d = <counter>
			if ScreenElementExists \{id = hold_timer}
				hold_timer :se_setprops {
					text = <time_text>
				}
			else
				return
			endif
			counter = (<counter> -1)
			Wait \{1
				Seconds}
			repeat <time>
			freestyle_tutorial_goal_counter_increment
			DestroyScreenElement \{id = timer_background}
			DestroyScreenElement \{id = hold_timer}
		else
			ScriptAssert \{qs(0x4bd7fc7f)}
		endif
	else
		ScriptAssert \{qs(0x06b08951)}
	endif
endscript

script 0x5ac2d36c 
	KillSpawnedScript \{id = hold_timer_script}
	if ScreenElementExists \{id = hold_timer}
		DestroyScreenElement \{id = hold_timer}
	endif
	if ScreenElementExists \{id = timer_background}
		DestroyScreenElement \{id = timer_background}
	endif
endscript

script freestyle_tutorial_spawn_let_go_detector 
	begin
	getguitareventplaying all Player = ($freestyle_tutorial_player)
	if ((<event_playing_array> [0].event_playing) = -1)
		freestyle_tutorial_info_pane :desc_resolvealias \{Name = alias_info_card_event_handler}
		LaunchEvent Type = guitar_let_go target = <resolved_id>
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script freestyle_pattern_held_conversion \{pattern_held = 0}
	pattern_array = [0 0 0 0 0]
	temp = (<pattern_held> / 65536)
	if NOT (<temp> = 0)
		SetArrayElement \{ArrayName = pattern_array
			index = 0
			NewValue = 1}
		pattern_held = (<pattern_held> - 65536)
	endif
	temp = (<pattern_held> / 4096)
	if NOT (<temp> = 0)
		SetArrayElement \{ArrayName = pattern_array
			index = 1
			NewValue = 1}
		pattern_held = (<pattern_held> - 4096)
	endif
	temp = (<pattern_held> / 256)
	if NOT (<temp> = 0)
		SetArrayElement \{ArrayName = pattern_array
			index = 2
			NewValue = 1}
		pattern_held = (<pattern_held> - 256)
	endif
	temp = (<pattern_held> / 16)
	if NOT (<temp> = 0)
		SetArrayElement \{ArrayName = pattern_array
			index = 3
			NewValue = 1}
		pattern_held = (<pattern_held> - 16)
	endif
	temp = (<pattern_held> / 1)
	if NOT (<temp> = 0)
		SetArrayElement \{ArrayName = pattern_array
			index = 4
			NewValue = 1}
		pattern_held = (<pattern_held> - 1)
	endif
	printstruct <...>
	return pattern = <pattern_array>
endscript

script freestyle_tutorial_clear_cards 
	freestyle_get_player_param \{Player = $freestyle_tutorial_player
		param = highway_player}
	clearsuggestedgems Player = <highway_player>
	freestyle_clear_all_gem_tracks
	freestyle_auto_play_finish_event Player = ($freestyle_tutorial_player)
	freestyle_clear_auto_play
endscript

script freestyle_tutorial_spawn_card 
	RequireParams \{[
			card
		]
		all}
	Change freestyle_starting_beat = ($freestyle_last_beat_number + 1)
	Change freestyle_total_song_beats = ($freestyle_card_set.<card>.card_length)
	freestyle_tutorial_clear_cards
	freestyle_reset_all_gem_tracks
	freestyle_add_card_events card = <card>
endscript

script freestyle_tutorial_switch_to_auto_play 
	instrumentsetenabled Player = ($freestyle_tutorial_player) enable = true
	freestyle_set_player_param \{Player = $freestyle_tutorial_player
		param = input_source
		value = auto_play}
	freestyle_set_player_param \{Player = $freestyle_tutorial_player
		param = auto_play_enabled
		value = true}
	reloadinstrumentconfigurations
endscript

script freestyle_tutorial_switch_to_controller_play 
	instrumentsetenabled Player = ($freestyle_tutorial_player) enable = true
	freestyle_set_player_param \{Player = $freestyle_tutorial_player
		param = input_source
		value = controller}
	freestyle_set_player_param \{Player = $freestyle_tutorial_player
		param = auto_play_enabled
		value = FALSE}
	reloadinstrumentconfigurations
endscript
