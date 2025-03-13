
script ui_create_rewards_unlocked 
	requireparams \{[
			unlock_struct
		]
		all}
	clean_up_user_control_helpers
	createscreenelement \{parent = root_window
		id = rewards_unlocked_screen_id
		type = descinterface
		desc = 'rewards'
		pos = (0.0, 0.0)
		z_priority = 100}
	song_breakdown_check_bot_play
	if (<bot_play> = 0)
		song_breakdown_get_exclusive_devices \{band_leader_only}
		if screenelementexists \{id = rewards_unlocked_screen_id}
			rewards_unlocked_screen_id :se_setprops {
				exclusive_device = <exclusive_devices>
			}
		endif
	endif
	if NOT gotparam \{venue_checksum}
		venue_checksum = none
	endif
	rewards_unlocked_populate_rewards_menu unlock_struct = <unlock_struct>
	ui_rewards_unlocked_handle_unlocked_venue venue_checksum = <venue_checksum> gig_display_index = <gig_display_index>
	launchevent \{type = focus
		target = rewards_unlocked_screen_id}
	if rewards_unlocked_screen_id :desc_resolvealias \{name = alias_bkg_anim
			param = bkg_anim_id}
		<bkg_anim_id> :obj_spawnscript ui_shakey
	else
		scriptassert \{'dschorn1'}
	endif
	if rewards_unlocked_screen_id :desc_resolvealias \{name = alias_bkg_anim
			param = bkg_anim_id}
		<bkg_anim_id> :obj_spawnscript ui_frazzmatazz
	else
		scriptassert \{'dschorn1'}
	endif
	if rewards_unlocked_screen_id :desc_resolvealias \{name = alias_reward_anim
			param = reward_anim_id}
		<reward_anim_id> :obj_spawnscript ui_roto
	else
		scriptassert \{'dschorn1'}
	endif
	spawnscriptnow \{unlock_item_ui_sfx}
endscript

script ui_destroy_rewards_unlocked 
	clean_up_user_control_helpers
	if screenelementexists \{id = rewards_unlocked_screen_id}
		destroyscreenelement \{id = rewards_unlocked_screen_id}
	endif
endscript

script ui_return_rewards_unlocked 
	if screenelementexists \{id = rewards_unlocked_screen_id}
		launchevent \{type = focus
			target = rewards_unlocked_screen_id}
		if ininternetmode
			getplayerinfo ($g_net_leader_player_num) is_local_client
			if (<is_local_client> = 1)
				add_user_control_helper \{text = qs(0x182f0173)
					button = green
					z = 100000}
			endif
			add_user_control_helper \{text = qs(0x67d9c56d)
				button = red
				z = 100000}
		else
			add_user_control_helper \{text = qs(0x182f0173)
				button = green
				z = 100000}
		endif
	endif
endscript

script rewards_unlocked_populate_rewards_menu 
	requireparams \{[
			unlock_struct
		]
		all}
	if screenelementexists \{id = rewards_unlocked_screen_id}
		if rewards_unlocked_screen_id :desc_resolvealias \{name = alias_list_menu
				param = rewards_menu_id}
			if structurecontains \{structure = unlock_struct
					artists
					reward_progression_index}
				reward_index = (<unlock_struct>.reward_progression_index)
				reward_atom = (($reward_progression) [<reward_index>])
				text = (<reward_atom>.frontend_desc)
				rewards_unlocked_screen_id :se_setprops {
					reward_text_text = <text>
					reward_image_texture = (<reward_atom>.unlock_icon)
				}
			endif
		endif
	endif
endscript

script ui_rewards_unlocked_handle_unlocked_venue 
	requireparams \{[
			venue_checksum
		]
		all}
	if screenelementexists \{id = rewards_unlocked_screen_id}
		array = []
		if (<venue_checksum> != none)
			if ininternetmode
				addarrayelement {
					array = <array>
					element = {
						pad_choose
						net_gig_complete_noncompetitive_continue_to_venue_unlock
						params = {
							venue_checksum = <venue_checksum>
						}
					}
				}
				addarrayelement {
					array = <array>
					element = {
						pad_back
						postgame_lobby_quit
						params = {
							id = rewards_unlocked_screen_id
						}
					}
				}
			else
				addarrayelement {
					array = <array>
					element = {
						pad_choose
						generic_event_choose
						params = {
							state = uistate_unlock_venue
							data = {
								load_venue_checksum = <venue_checksum>
							}
						}
					}
				}
			endif
		else
			if ($end_credits = 1)
				addarrayelement {
					array = <array>
					element = {pad_choose unlock_and_goto_credits}
				}
			else
				if ininternetmode
					addarrayelement {
						array = <array>
						element = {pad_choose net_gig_complete_noncompetitive_continue_to_venue_select params = {autosave = 1}}
					}
					addarrayelement {
						array = <array>
						element = {
							pad_back
							postgame_lobby_quit
							params = {
								id = rewards_unlocked_screen_id
							}
						}
					}
				else
					addarrayelement {
						array = <array>
						element = {pad_choose ui_gig_complete_noncompetitive_continue_to_next_screen params = {gig_display_index = <gig_display_index>}}
					}
				endif
			endif
		endif
		rewards_unlocked_screen_id :se_setprops {
			event_handlers = <array>
			replace_handlers
		}
		if ininternetmode
			getplayerinfo ($g_net_leader_player_num) is_local_client
			if (<is_local_client> = 1)
				add_user_control_helper \{text = qs(0x182f0173)
					button = green
					z = 100000}
			endif
			add_user_control_helper \{text = qs(0x67d9c56d)
				button = red
				z = 100000}
		else
			add_user_control_helper \{text = qs(0x182f0173)
				button = green
				z = 100000}
		endif
	endif
endscript
