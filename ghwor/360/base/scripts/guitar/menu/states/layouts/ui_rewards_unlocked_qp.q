g_net_quickplay_show_unlock_screen = 0
g_rewards_unlocked_max_strips = 4

script ui_init_rewards_unlocked_qp 
	social_networks_broadcast_init
endscript

script ui_create_rewards_unlocked_qp \{continue_back_to_gameplay = !i1768515945
		reward_idx = 0}
	<single_player_screen> = 0
	if NOT InNetGame
		if isSinglePlayerGame
			<single_player_screen> = 1
		else
			if isps3
				<single_player_screen> = 1
			endif
		endif
	endif
	if (<single_player_screen> = 1)
		getfirstplayer \{on_screen}
		progression_quickplay_get_rewards_just_unlocked Player = <Player>
		GetArraySize <rewards_just_unlocked>
		<vague_frontend_desc> = (<rewards_just_unlocked> [<reward_idx>].vague_frontend_desc)
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
			rank_capsule_alpha = 1.0
			reward_vague_text_text = ($<vague_frontend_desc>)
			reward_text_text = (<rewards_just_unlocked> [<reward_idx>].frontend_desc)
			reward_image_texture = (<rewards_just_unlocked> [<reward_idx>].unlock_icon)
			exclusive_device = ($primary_controller)
			tags = {
				reward_idx = <reward_idx>
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
				{
					pad_option2
					ui_rewards_unlocked_goto_tracker
				}
			]
		}
		add_user_control_helper \{text = qs(0x182f0173)
			button = green
			z = 100000}
		add_user_control_helper \{text = qs(0xb2867e0a)
			button = yellow
			z = 100000}
		rewards_unlocked_qp_setup_broadcast rewards_just_unlocked = <rewards_just_unlocked> reward_idx = <reward_idx>
		if rewards_qp_screen_id :desc_resolvealias \{Name = alias_rewardtext
				param = reward_text}
			<reward_text> :obj_spawnscript ui_reward_text_anim params = {no_anim_in = <no_anim_in>}
		endif
		if rewards_qp_screen_id :desc_resolvealias \{Name = alias_rank_capsule}
			AssignAlias id = <resolved_id> alias = rank_capsule
		else
			ScriptAssert \{qs(0xe7143133)}
		endif
		get_local_in_game_player_num_from_controller controller_index = ($primary_controller)
		quickplay_get_overall_awards_progress Player = <player_num>
		quickplay_get_recent_award_points Player = <player_num>
		rank_capsule :Obj_SpawnScriptNow qp_earned_stars_animate_rank_meter params = {
			total_time = 0.0
			Player = <player_num>
			desc_id = rewards_qp_screen_id
		}
		rank_capsule :Obj_SpawnScriptNow gamerpic_set_screenelement_texture params = {
			local_id = ($primary_controller)
			local_user_index = ($primary_controller)
			se_prop = gamerpic_texture
			failure_texture = icon_gh6
		}
	else
		getnumplayersingame \{local}
		if (<num_players> > 0)
			ui_sfx \{menustate = rewards
				uitype = award}
			<max_strips_on_screen> = ($g_rewards_unlocked_max_strips)
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
				rank_capsule_alpha = 0.0
				generic_scrollbar_wgt_alpha = 0.0
				timer_rewards_alpha = 0.0
				gamertag_text_text = <leader_text>
				exclusive_device = ($primary_controller)
				tags = {
					top_strip_idx = 0
					bottom_strip_idx = (<max_strips_on_screen> - 1)
					max_strips_on_screen = <max_strips_on_screen>
					continue_back_to_gameplay = <continue_back_to_gameplay>
				}
			}
			if rewards_qp_screen_id :desc_resolvealias \{Name = alias_icon_reward
					param = icon_reward}
				<icon_reward> :obj_spawnscript ui_pulse6
			endif
			if rewards_qp_screen_id :desc_resolvealias \{Name = alias_leader_glow
					param = leader_glow_id}
				<leader_glow_id> :Obj_SpawnScriptNow ui_band_lobby_leader_pulse
			else
				ScriptAssert \{'dschorn1'}
			endif
			if rewards_qp_screen_id :desc_resolvealias \{Name = alias_generic_scrollbar_wgt}
				AssignAlias id = <resolved_id> alias = rewards_qp_scrollbar_id
				generic_scrollbar_wgt_initialize id = <resolved_id>
			endif
			if rewards_qp_screen_id :desc_resolvealias \{Name = alias_rewards_list
					param = rewards_menu_id}
				getfirstplayer \{local}
				if InNetGame
					<net_rewards_unlocked> = []
				endif
				if isps3
					<Player> = ($g_leader_player_num)
					<num_players> = 1
				endif
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
						exclusive_device = ($primary_controller)
						icon_instrument_texture = <icon_texture>
						reward_heading_gamertag_text = <player_name_text>
					}
					<total_strips> = (<total_strips> + 1)
					if InNetGame
						<net_player_rewards> = []
					endif
					begin
					<unlock_struct> = (<rewards_just_unlocked> [<i>])
					ExtendCrc (<unlock_struct>.unlock_icon) '_sm' out = icon_reward_texture
					if InNetGame
						AddArrayElement array = <net_player_rewards> element = (<unlock_struct>.reward_index)
						<net_player_rewards> = <array>
					endif
					if StructureContains \{structure = unlock_struct
							desc_additional_text}
						<desc_additional_text> = (<unlock_struct>.desc_additional_text)
						formatText TextName = reward_text_text qs(0xeef79482) i = (<unlock_struct>.frontend_desc) s = ($<desc_additional_text>)
					else
						reward_text_text = (<unlock_struct>.frontend_desc)
					endif
					CreateScreenElement {
						parent = <rewards_menu_id>
						Type = descinterface
						desc = 'rewards_row'
						autosizedims = true
						exclusive_device = ($primary_controller)
						icon_reward_texture = <icon_reward_texture>
						reward_text_text = <reward_text_text>
					}
					<id> :SetTags {
						strip_id = <id>
						strip_idx = <total_strips>
					}
					<i> = (<i> + 1)
					<total_strips> = (<total_strips> + 1)
					repeat <num_rewards>
					if InNetGame
						getplayerinfo <Player> net_obj_id
						AddArrayElement array = <net_rewards_unlocked> element = {player_id = <net_obj_id> rewards = <net_player_rewards>}
						<net_rewards_unlocked> = <array>
					endif
				endif
				if ($g_leader_player_num = <Player>)
					if NOT InNetGame
						social_rewards_just_unlocked = <rewards_just_unlocked>
						social_reward_idx = <reward_idx>
					endif
				endif
				getnextplayer Player = <Player> local
				repeat <num_players>
				if InNetGame
					GetArraySize \{net_rewards_unlocked}
					if (<array_Size> > 0)
						if IsHost
							net_transfer_remote_rewards_unlocked remote_rewards_unlocked = <net_rewards_unlocked>
						else
							SendStructure callback = net_transfer_remote_rewards_unlocked data_to_send = {remote_rewards_unlocked = <net_rewards_unlocked>}
						endif
					endif
				endif
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
			clean_up_user_control_helpers
			if NOT InNetGame
				add_user_control_helper \{text = qs(0x182f0173)
					button = green
					z = 100000}
				rewards_unlocked_qp_setup_broadcast rewards_just_unlocked = <social_rewards_just_unlocked> reward_idx = <social_reward_idx>
			elseif (<continue_back_to_gameplay> = 0)
				if NOT sessionisover
					add_user_control_helper \{text = qs(0x182f0173)
						button = green
						z = 100000}
				endif
				add_user_control_helper \{text = qs(0x67d9c56d)
					button = red
					z = 100000}
			endif
			if (<total_strips> > <max_strips_on_screen>)
				add_user_control_helper \{text = qs(0xde41a641)
					button = strumbar
					z = 100000}
			endif
		endif
	endif
	if NOT GotParam \{no_sound}
	endif
	LaunchEvent \{Type = focus
		target = rewards_qp_screen_id}
	AssignAlias \{id = rewards_qp_screen_id
		alias = current_menu}
endscript

script ui_return_rewards_unlocked_qp 
	if NOT InNetGame
		ui_event_wait \{event = menu_refresh
			data = {
				no_anim_in = 1
			}}
	else
		if ScreenElementExists \{id = rewards_qp_screen_id}
			if rewards_qp_screen_id :obj_getintegertag \{tag_name = continue_back_to_gameplay
					assert = 0}
				if (<integer_value> = 0)
					if NOT sessionisover
						add_user_control_helper \{text = qs(0x182f0173)
							button = green
							z = 100000}
					endif
					add_user_control_helper \{text = qs(0x67d9c56d)
						button = red
						z = 100000}
				else
					GetNumPlayers
					get_local_players_in_game
					if (<num_local_players> >= <num_players>)
						add_user_control_helper \{text = qs(0x67d9c56d)
							button = red
							z = 100000}
					endif
				endif
			endif
			if rewards_qp_screen_id :desc_resolvealias \{Name = alias_rewards_list
					param = strips_menu_id}
				if GetScreenElementChildren id = <strips_menu_id>
					GetArraySize \{children}
					if (<array_Size> > 0)
						if (<array_Size> > $g_rewards_unlocked_max_strips)
							add_user_control_helper \{text = qs(0xde41a641)
								button = strumbar
								z = 100000}
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script ui_destroy_rewards_unlocked_qp 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = rewards_qp_screen_id}
		DestroyScreenElement \{id = rewards_qp_screen_id}
	endif
	KillSpawnedScript \{Name = display_remote_rewards_unlocked}
endscript

script rewards_unlocked_qp_setup_broadcast \{rewards_just_unlocked = !a1768515945
		reward_idx = !i1768515945}
	if NOT InNetGame
		GetArraySize <rewards_just_unlocked>
		if (<array_Size> > 0)
			GetArraySize (<rewards_just_unlocked> [<reward_idx>].rewards)
			if (<array_Size> > 0)
				<reward_type> = (<rewards_just_unlocked> [<reward_idx>].rewards [0].reward_type)
				<item_name> = (<rewards_just_unlocked> [<reward_idx>].Name)
				specific_type = <reward_type>
				if (<reward_type> = cas)
					if unlock_tracker_sort_cas reward_struct = (<rewards_just_unlocked> [<reward_idx>].rewards [0]) check_array = cas
						specific_type = cas
					elseif unlock_tracker_sort_cas reward_struct = (<rewards_just_unlocked> [<reward_idx>].rewards [0]) check_array = cai
						specific_type = cai
					endif
					reward_type = <specific_type>
				endif
				if NOT isbandcheating
					social_networks_setup_broadcast_handlers {
						message_id = unlock_item
						passed_variables = {item_type = <reward_type> item_image = <reward_type> item_name = <item_name>}
						menu_id = rewards_qp_screen_id
					}
				endif
			endif
		endif
	endif
endscript

script rewards_unlocked_qp_multi_setup_handlers \{continue_back_to_gameplay = !i1768515945}
	if ScreenElementExists \{id = rewards_qp_screen_id}
		if InNetGame
			if (<continue_back_to_gameplay> = 1)
				Change \{g_net_quickplay_show_unlock_screen = 0}
				Change \{song_breakdown_countdown_time = -1}
				<timer_params> = {
					screen_id = rewards_qp_screen_id
					use_button_pill = 1
					continue_to_next_song
				}
				rewards_qp_screen_id :Obj_SpawnScriptNow {
					net_ui_song_breakdown_start_timer_spawned
					params = {
						<timer_params>
					}
				}
			else
				if sessionisover
					event_handlers = [
						{pad_back postgame_lobby_quit params = {id = rewards_qp_screen_id}}
					]
				else
					event_handlers = [
						{pad_choose net_ui_song_breakdown_go_to_setlist}
						{pad_back postgame_lobby_quit params = {id = rewards_qp_screen_id confirm_script = confirm_quit_online confirm_params = {save = 1}}}
					]
				endif
				rewards_qp_screen_id :se_setprops {
					event_handlers = <event_handlers>
				}
			endif
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
			ui_sfx \{menustate = Generic
				uitype = select}
			if (<continue_back_to_gameplay> = 0)
				ui_event_wait_for_safe
				if NOT ($g_songlist_targeted_song = NULL)
					Change \{g_songlist_force_to_challenges = 1}
				endif
				if ui_event_exists_in_stack \{Name = 'songlist'}
					ui_memcard_autosave_all_players \{event = menu_back
						state = uistate_songlist}
				else
					ui_memcard_autosave_all_players \{event = menu_back
						state = uistate_mainmenu}
				endif
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

script rewards_unlocked_qp_scroll \{direction = !q1768515945
		time = 0.1}
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
					<sound_type> = scrollup
					if (<top_strip_idx> > 0)
						<new_y_pos> = ((<menu_pos> [1]) + (<strip_dims> [1]) + (<spacing_between> / 2.0))
						<top_strip_idx> = (<top_strip_idx> - 1)
						<bottom_strip_idx> = (<bottom_strip_idx> - 1)
					endif
				elseif (<direction> = down)
					<sound_type> = scrolldown
					if (<bottom_strip_idx> < (<array_Size> - 1))
						<new_y_pos> = ((<menu_pos> [1]) - (<strip_dims> [1]) - (<spacing_between> / 2.0))
						<top_strip_idx> = (<top_strip_idx> + 1)
						<bottom_strip_idx> = (<bottom_strip_idx> + 1)
					endif
				else
					ScriptAssert 'Invalid direction to scroll: %d' d = <direction>
				endif
				if (<new_y_pos> != (<menu_pos> [1]))
					ui_sfx menustate = Generic uitype = <sound_type>
					rewards_qp_screen_id :SetTags {
						top_strip_idx = <top_strip_idx>
						bottom_strip_idx = <bottom_strip_idx>
					}
					<strips_menu_id> :se_setprops {
						Pos = (((1.0, 0.0) * <menu_pos> [0]) + ((0.0, 1.0) * <new_y_pos>))
						time = <time>
					}
					<strips_menu_id> :Obj_SpawnScriptNow generic_scrollbar_wgt_update_thumb_pos params = {id = rewards_qp_scrollbar_id Dir = <direction>}
					Wait <time> Seconds
				endif
			endif
		endif
		rewards_qp_screen_id :se_setprops \{unblock_events}
		LaunchEvent \{Type = focus
			target = rewards_qp_screen_id}
	endif
endscript

script net_transfer_remote_rewards_unlocked 
	if IsHost
		display_remote_rewards_unlocked remote_rewards_unlocked = <remote_rewards_unlocked>
		SendStructure callback = net_transfer_remote_rewards_unlocked data_to_send = {remote_rewards_unlocked = <remote_rewards_unlocked>}
	else
		display_remote_rewards_unlocked remote_rewards_unlocked = <remote_rewards_unlocked>
	endif
endscript

script display_remote_rewards_unlocked \{remote_rewards_unlocked = !a1768515945}
	printf \{qs(0x09f4b019)}
	if NOT ScreenElementExists \{id = rewards_qp_screen_id}
		<total_wait_time> = 0.0
		begin
		if ScreenElementExists \{id = rewards_qp_screen_id}
			break
		elseif (<total_wait_time> > 15.0)
			return
		endif
		Wait \{0.5
			Seconds}
		<total_wait_time> = (<total_wait_time> + 0.5)
		repeat
	endif
	GetArraySize \{remote_rewards_unlocked}
	<max_strips_on_screen> = ($g_rewards_unlocked_max_strips)
	if (<array_Size> > 0)
		<index> = 0
		printf \{qs(0x872cd294)}
		getnumplayersingame \{remote}
		if rewards_qp_screen_id :desc_resolvealias \{Name = alias_rewards_list
				param = rewards_menu_id}
			printf \{qs(0xac018157)}
			<total_strips> = 0
			if GetScreenElementChildren id = <rewards_menu_id>
				printf \{qs(0xb51ab016)}
				GetArraySize \{children
					param = total_strips}
			endif
			begin
			<player_unlock_struct> = (<remote_rewards_unlocked> [<index>])
			if (<num_players> > 0)
				printf \{qs(0xfa5b26d1)}
				getfirstplayer \{remote}
				begin
				if playerinfoequals <Player> net_obj_id = (<player_unlock_struct>.player_id)
					printf \{qs(0xe3401790)}
					getplayerinfo <Player> part
					ui_song_breakdown_get_player_instrument_texture part = <part>
					ui_song_breakdown_get_player_display_name player_index = <Player>
					CreateScreenElement {
						parent = <rewards_menu_id>
						Type = descinterface
						desc = 'rewards_row_heading'
						autosizedims = true
						exclusive_device = ($primary_controller)
						icon_instrument_texture = <icon_texture>
						reward_heading_gamertag_text = <player_name_text>
					}
					<total_strips> = (<total_strips> + 1)
					<rewards_array> = (<player_unlock_struct>.rewards)
					GetArraySize \{rewards_array
						param = num_rewards}
					<i> = 0
					begin
					<reward_index> = (<rewards_array> [<i>])
					<unlock_struct> = ($award_point_progression [<reward_index>])
					ExtendCrc (<unlock_struct>.unlock_icon) '_sm' out = icon_reward_texture
					if StructureContains \{structure = unlock_struct
							desc_additional_text}
						<desc_additional_text> = (<unlock_struct>.desc_additional_text)
						formatText TextName = reward_text_text qs(0xeef79482) i = (<unlock_struct>.frontend_desc) s = ($<desc_additional_text>)
					else
						<reward_text_text> = (<unlock_struct>.frontend_desc)
					endif
					CreateScreenElement {
						parent = <rewards_menu_id>
						Type = descinterface
						desc = 'rewards_row'
						autosizedims = true
						exclusive_device = ($primary_controller)
						icon_reward_texture = <icon_reward_texture>
						reward_text_text = <reward_text_text>
					}
					<id> :SetTags {
						strip_id = <id>
						strip_idx = <total_strips>
					}
					<i> = (<i> + 1)
					<total_strips> = (<total_strips> + 1)
					repeat <num_rewards>
				endif
				getnextplayer Player = <Player> remote
				repeat <num_players>
			endif
			<index> = (<index> + 1)
			repeat <array_Size>
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
			if ScreenElementExists \{id = rewards_qp_screen_id}
				clean_up_user_control_helpers
				if rewards_qp_screen_id :obj_getintegertag \{tag_name = continue_back_to_gameplay
						assert = 0}
					if (<integer_value> = 0)
						if NOT sessionisover
							add_user_control_helper \{text = qs(0x182f0173)
								button = green
								z = 100000}
						endif
						add_user_control_helper \{text = qs(0x67d9c56d)
							button = red
							z = 100000}
					else
						GetNumPlayers
						get_local_players_in_game
						if (<num_local_players> >= <num_players>)
							add_user_control_helper \{text = qs(0x67d9c56d)
								button = red
								z = 100000}
						endif
					endif
				endif
				if (<total_strips> > <max_strips_on_screen>)
					add_user_control_helper \{text = qs(0xde41a641)
						button = strumbar
						z = 100000}
				endif
			endif
		endif
	endif
endscript

script rewards_unlocked_qp_single_show_next_reward \{continue_back_to_gameplay = !i1768515945
		rewards_just_unlocked = !a1768515945
		device_num = !i1768515945}
	if ScreenElementExists \{id = rewards_qp_screen_id}
		ui_sfx \{menustate = Generic
			uitype = select}
		rewards_qp_screen_id :GetTags
		GetArraySize <rewards_just_unlocked>
		<reward_idx> = (<reward_idx> + 1)
		if (<reward_idx> < <array_Size>)
			rewards_qp_screen_id :se_setprops \{megatext_alpha = 0.0
				image_container_alpha = 0.0
				time = 0.2}
			rewards_qp_screen_id :se_waitprops
			<vague_frontend_desc> = (<rewards_just_unlocked> [<reward_idx>].vague_frontend_desc)
			rewards_qp_screen_id :se_setprops {
				reward_vague_text_text = ($<vague_frontend_desc>)
				reward_text_text = (<rewards_just_unlocked> [<reward_idx>].frontend_desc)
				reward_image_texture = (<rewards_just_unlocked> [<reward_idx>].unlock_icon)
			}
			rewards_qp_screen_id :se_waitprops
			rewards_qp_screen_id :se_setprops \{megatext_alpha = 1.0
				image_container_alpha = 1.0
				time = 0.2}
			rewards_qp_screen_id :se_waitprops
			rewards_qp_screen_id :SetTags reward_idx = <reward_idx>
			ui_event_add_params reward_idx = <reward_idx>
			social_networks_broadcast_init
			rewards_unlocked_qp_setup_broadcast rewards_just_unlocked = <rewards_just_unlocked> reward_idx = <reward_idx>
		else
			rewards_unlocked_qp_continue {
				continue_back_to_gameplay = <continue_back_to_gameplay>
				device_num = <device_num>
			}
		endif
	endif
endscript

script ui_reward_text_anim 
	if NOT GotParam \{no_anim_in}
		ui_sfx \{menustate = rewards}
		se_setprops \{Scale = (3.0, 3.0)
			alpha = 0}
		se_waitprops
		se_setprops \{Scale = (0.9, 0.9)
			time = 0.3
			alpha = 1
			motion = ease_in}
		se_waitprops
		se_setprops \{Scale = (1.1, 1.1)
			time = 0.1
			motion = ease_out}
		se_waitprops
		se_setprops \{Scale = (1.0, 1.0)
			time = 0.1
			motion = ease_in}
		se_waitprops
	endif
	begin
	se_setprops \{Scale = (1.1, 1.1)}
	se_waitprops
	se_setprops \{Scale = (1.0, 1.0)
		time = 0.1
		motion = ease_out}
	se_waitprops
	se_setprops \{Scale = (1.15, 1.15)
		time = 0.15
		motion = ease_out}
	se_waitprops
	se_setprops \{Scale = (0.95, 0.95)
		time = 0.25
		motion = ease_out}
	se_waitprops
	se_setprops \{Scale = (1.0, 1.0)
		time = 0.2
		motion = smooth}
	se_waitprops
	Wait \{3
		Seconds}
	repeat
endscript

script ui_rewards_unlocked_goto_tracker 
	ui_sfx \{menustate = Generic
		uitype = select}
	ui_event \{event = menu_change
		state = uistate_unlock_tracker}
endscript
