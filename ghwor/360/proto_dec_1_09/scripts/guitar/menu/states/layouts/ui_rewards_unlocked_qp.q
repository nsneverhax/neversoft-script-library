
script ui_create_rewards_unlocked_qp \{continue_back_to_gameplay = !i1768515945}
	if isSinglePlayerGame
		getfirstplayer \{on_screen}
		progression_quickplay_get_rewards_just_unlocked Player = <Player>
		GetArraySize <rewards_just_unlocked>
		<vague_frontend_desc> = (<rewards_just_unlocked> [0].vague_frontend_desc)
		uistack_createboundscreenelement {
			parent = root_window
			Type = descinterface
			desc = 'rewards'
			id = rewards_qp_screen_id
			pos_anchor = [center , center]
			just = [center , center]
			Pos = (0.0, 0.0)
			single_player_container_alpha = 1.0
			multi_player_container_alpha = 0.0
			reward_vague_text_text = ($<vague_frontend_desc>)
			reward_text_text = (<rewards_just_unlocked> [0].frontend_desc)
			reward_image_texture = (<rewards_just_unlocked> [0].unlock_icon)
			tags = {
				reward_idx = 1
				rewards_just_unlocked = <rewards_just_unlocked>
				continue_back_to_gameplay = <continue_back_to_gameplay>
			}
			event_handlers = [
				{
					pad_choose
					rewards_unlocked_qp_single_show_next_reward
					params = {
						continue_back_to_gameplay = <continue_back_to_gameplay>
						rewards_just_unlocked = <rewards_just_unlocked>
					}
				}
			]
		}
		add_user_control_helper \{text = qs(0x182f0173)
			button = green
			z = 100000}
	else
		getnumplayersingame
		if (<num_players> > 0)
			<max_strips_on_screen> = 4
			<total_strips> = 0
			ui_song_breakdown_get_player_display_name player_index = ($g_net_leader_player_num)
			formatText TextName = leader_text qs(0x2ec30d65) p = <player_name_text>
			uistack_createboundscreenelement {
				parent = root_window
				Type = descinterface
				desc = 'rewards'
				id = rewards_qp_screen_id
				pos_anchor = [center , center]
				just = [center , center]
				Pos = (0.0, 0.0)
				single_player_container_alpha = 0.0
				multi_player_container_alpha = 1.0
				generic_scrollbar_wgt_alpha = 0.0
				timer_rewards_alpha = 0.0
				gamertag_text_text = <leader_text>
				tags = {
					top_strip_idx = 0
					bottom_strip_idx = (<max_strips_on_screen> - 1)
					max_strips_on_screen = <max_strips_on_screen>
				}
			}
			if rewards_qp_screen_id :desc_resolvealias \{Name = alias_generic_scrollbar_wgt}
				AssignAlias id = <resolved_id> alias = rewards_qp_scrollbar_id
				generic_scrollbar_wgt_initialize id = <resolved_id>
			endif
			if rewards_qp_screen_id :desc_resolvealias \{Name = alias_rewards_list
					param = rewards_menu_id}
				getfirstplayer
				begin
				progression_quickplay_get_rewards_just_unlocked Player = <Player>
				GetArraySize <rewards_just_unlocked>
				if (<array_Size> > 0)
					<i> = 0
					<num_rewards> = <array_Size>
					getplayerinfo <Player> part
					ui_song_breakdown_get_player_instrument_texture part = <part>
					ui_song_breakdown_get_player_display_name player_index = <Player>
					CreateScreenElement {
						parent = <rewards_menu_id>
						Type = descinterface
						desc = 'rewards_row_heading'
						autosizedims = true
						icon_instrument_texture = <icon_texture>
						reward_heading_gamertag_text = <player_name_text>
					}
					<total_strips> = (<total_strips> + 1)
					begin
					<unlock_struct> = (<rewards_just_unlocked> [<i>])
					ExtendCrc (<unlock_struct>.unlock_icon) '_sm' out = icon_reward_texture
					CreateScreenElement {
						parent = <rewards_menu_id>
						Type = descinterface
						desc = 'rewards_row'
						autosizedims = true
						icon_reward_texture = <icon_reward_texture>
						reward_text_text = (<unlock_struct>.frontend_desc)
					}
					<id> :SetTags {
						strip_id = <id>
						strip_idx = <total_strips>
					}
					<i> = (<i> + 1)
					<total_strips> = (<total_strips> + 1)
					repeat <num_rewards>
				endif
				getnextplayer Player = <Player>
				repeat <num_players>
				if (<total_strips> > <max_strips_on_screen>)
					generic_scrollbar_wgt_set_resolution {
						id = rewards_qp_scrollbar_id
						num_elements = (<total_strips> - <max_strips_on_screen> + 1)
					}
					rewards_qp_screen_id :se_setprops \{generic_scrollbar_wgt_alpha = 1.0
						event_handlers = [
							{
								pad_up
								rewards_unlocked_qp_scroll
								params = {
									direction = up
								}
							}
							{
								pad_down
								rewards_unlocked_qp_scroll
								params = {
									direction = down
								}
							}
						]}
				endif
			endif
			rewards_unlocked_qp_multi_setup_handlers continue_back_to_gameplay = <continue_back_to_gameplay>
			if NOT ininternetmode
				add_user_control_helper \{text = qs(0x182f0173)
					button = green
					z = 100000}
			endif
			if (<total_strips> > <max_strips_on_screen>)
				add_user_control_helper \{text = qs(0xde41a641)
					button = strumbar
					z = 100000}
			endif
		endif
	endif
	LaunchEvent \{Type = focus
		target = rewards_qp_screen_id}
endscript

script ui_destroy_rewards_unlocked_qp 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = rewards_qp_screen_id}
		DestroyScreenElement \{id = rewards_qp_screen_id}
	endif
endscript

script rewards_unlocked_qp_multi_setup_handlers \{continue_back_to_gameplay = !i1768515945}
	if ScreenElementExists \{id = rewards_qp_screen_id}
		if ininternetmode
			<timer_params> = {
				screen_id = rewards_qp_screen_id
				use_button_pill = 0
				property_text_chksum = timer_rewards_text
				property_alpha_chksum = timer_rewards_alpha
			}
			if (<continue_back_to_gameplay> = 0)
				<timer_params> = {
					continue_to_next_song
				}
			endif
			rewards_qp_screen_id :Obj_SpawnScriptNow {
				net_ui_song_breakdown_start_timer_spawned
				params = {
					<timer_params>
				}
			}
		else
			event_handlers = [
				{
					pad_choose
					rewards_unlocked_qp_continue
					params = {
						continue_back_to_gameplay = <continue_back_to_gameplay>
					}
				}
			]
			rewards_qp_screen_id :se_setprops {
				event_handlers = <event_handlers>
			}
		endif
	endif
endscript

script rewards_unlocked_qp_continue \{continue_back_to_gameplay = !i1768515945
		device_num = !i1768515945}
	if (<device_num> = ($primary_controller))
		if ScreenElementExists \{id = rewards_qp_screen_id}
			LaunchEvent \{Type = unfocus
				target = rewards_qp_screen_id}
			rewards_qp_screen_id :se_setprops \{block_events}
			if (<continue_back_to_gameplay> = 0)
				ui_event_wait_for_safe
				ui_memcard_autosave_all_players \{event = menu_back
					state = uistate_songlist}
			else
				if ($last_song_played != jamsession)
					Change \{songtime_paused = 0}
				endif
				ui_event_wait_for_safe
				generic_event_back \{nosound
					state = Uistate_gameplay}
			endif
		endif
	endif
endscript

script rewards_unlocked_qp_scroll \{direction = !q1768515945}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	<strips_window_vdims> = 280.0
	if ScreenElementExists \{id = rewards_qp_screen_id}
		LaunchEvent \{Type = unfocus
			target = rewards_qp_screen_id}
		rewards_qp_screen_id :se_setprops \{block_events}
		if rewards_qp_screen_id :desc_resolvealias \{Name = alias_rewards_list
				param = strips_menu_id}
			rewards_qp_screen_id :GetTags
			<strips_menu_id> :se_getprops
			<menu_pos> = <Pos>
			<menu_dims> = <dims>
			GetScreenElementChildren id = <strips_menu_id>
			GetArraySize <children>
			if (<array_Size> > 0)
				(<children> [0]) :se_getprops
				<strip_dims> = <dims>
				<new_y_pos> = (<menu_pos> [1])
				if (<direction> = up)
					if (<top_strip_idx> > 0)
						<new_y_pos> = ((<menu_pos> [1]) + (<strip_dims> [1]) + (<spacing_between> / 2.0))
						<top_strip_idx> = (<top_strip_idx> - 1)
						<bottom_strip_idx> = (<bottom_strip_idx> - 1)
					endif
				elseif (<direction> = down)
					if (<bottom_strip_idx> < (<array_Size> - 1))
						<new_y_pos> = ((<menu_pos> [1]) - (<strip_dims> [1]) - (<spacing_between> / 2.0))
						<top_strip_idx> = (<top_strip_idx> + 1)
						<bottom_strip_idx> = (<bottom_strip_idx> + 1)
					endif
				else
					ScriptAssert 'Invalid direction to scroll: %d' d = <direction>
				endif
				if (<new_y_pos> != (<menu_pos> [1]))
					rewards_qp_screen_id :SetTags {
						top_strip_idx = <top_strip_idx>
						bottom_strip_idx = <bottom_strip_idx>
					}
					<strips_menu_id> :se_setprops {
						Pos = (((1.0, 0.0) * <menu_pos> [0]) + ((0.0, 1.0) * <new_y_pos>))
						time = 0.1
					}
					generic_scrollbar_wgt_update_thumb_pos id = rewards_qp_scrollbar_id Dir = <direction>
				endif
			endif
		endif
		rewards_qp_screen_id :se_setprops \{unblock_events}
		LaunchEvent \{Type = focus
			target = rewards_qp_screen_id}
	endif
endscript

script rewards_unlocked_qp_single_show_next_reward \{continue_back_to_gameplay = !i1768515945
		rewards_just_unlocked = !a1768515945
		device_num = !i1768515945}
	if ScreenElementExists \{id = rewards_qp_screen_id}
		rewards_qp_screen_id :GetTags
		GetArraySize <rewards_just_unlocked>
		if (<reward_idx> < <array_Size>)
			rewards_qp_screen_id :se_setprops \{single_player_container_alpha = 0.0
				time = 0.2}
			rewards_qp_screen_id :se_waitprops
			<vague_frontend_desc> = (<rewards_just_unlocked> [<reward_idx>].vague_frontend_desc)
			rewards_qp_screen_id :se_setprops {
				reward_vague_text_text = ($<vague_frontend_desc>)
				reward_text_text = (<rewards_just_unlocked> [<reward_idx>].frontend_desc)
				reward_image_texture = (<rewards_just_unlocked> [<reward_idx>].unlock_icon)
			}
			rewards_qp_screen_id :se_waitprops
			rewards_qp_screen_id :se_setprops \{single_player_container_alpha = 1.0
				time = 0.2}
			rewards_qp_screen_id :se_waitprops
			<reward_idx> = (<reward_idx> + 1)
			rewards_qp_screen_id :SetTags reward_idx = <reward_idx>
		else
			rewards_unlocked_qp_continue {
				continue_back_to_gameplay = <continue_back_to_gameplay>
				device_num = <device_num>
			}
		endif
	endif
endscript
