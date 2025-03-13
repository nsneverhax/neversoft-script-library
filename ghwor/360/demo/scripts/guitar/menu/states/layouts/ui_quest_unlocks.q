
script ui_init_quest_unlocks 
	social_networks_broadcast_init
endscript

script ui_create_quest_unlocks \{next_state_event = menu_back
		next_state_name = uistate_quest_map_giglist
		next_state_params = {
		}
		go_to_credits = 0
		ui_event_back = 0}
	clean_up_user_control_helpers
	recent_unlock_data = ($g_quest_recent_unlocked_awards)
	chapter_global = ($current_chapter)
	getarraysize <recent_unlock_data>
	if (<array_size> < 1)
		ui_quest_unlocks_continue {
			next_state_event = <next_state_event>
			next_state_name = <next_state_name>
			next_state_params = <next_state_params>
		}
		return
	endif
	createscreenelement {
		parent = root_window
		id = quest_unlocks_id
		type = descinterface
		desc = 'chapter_complete'
		dialog_anim_scale = (1.0, 1.0)
		text_scale = (1.0, 1.0)
		text_pos = (0.0, -20.0)
		text_alpha = 0.0
		exclusive_device = ($primary_controller)
		event_handlers = [
			{
				pad_choose ui_sfx params = {menustate = generic uitype = select}
			}
			{
				pad_choose
				ui_quest_unlocks_continue
				params = {
					next_state_event = <next_state_event>
					next_state_name = <next_state_name>
					next_state_params = <next_state_params>
					go_to_credits = <go_to_credits>
				}
			}
			{
				pad_option2
				ui_quest_unlocks_goto_tracker
			}
		]
	}
	if innetgame
		net_career_setup_ui_stream \{parent = quest_unlocks_id}
	endif
	unlock_data = (<recent_unlock_data> [0])
	hero_info = ($<chapter_global>.hero_info)
	hero_name_nl = ($<hero_info>.name_nl)
	ui_quest_get_giglist_bg hero_name_nl = <hero_name_nl> chapter_global = <chapter_global> attempting_encore = 1
	unlock_background = <bg_texture>
	quest_unlocks_id :se_setprops {character_texture = <unlock_background>}
	ui_quest_unlocks_add_helpers chapter_global = <chapter_global> unlock_background = <unlock_background> ui_event_back = <ui_event_back>
	quest_unlocks_set_text unlock_data = <unlock_data>
	if (<ui_event_back> = 0)
		spawnscriptnow \{audio_play_quest_reward_anim_sfx}
		quest_unlocks_id :se_setprops \{text_scale = (6.5, 6.5)
			text_alpha = 0.0
			time = 0.5
			motion = ease_in}
		wait \{0.5
			seconds}
		quest_unlocks_id :se_setprops \{text_scale = (0.95, 0.95)
			text_alpha = 0.75
			time = 0.4
			motion = ease_out}
		wait \{0.4
			seconds}
		quest_unlocks_id :se_setprops \{text_scale = (1.0, 1.0)
			text_alpha = 1.0
			time = 0.2
			motion = ease_in}
		wait \{0.2
			seconds}
	else
		quest_unlocks_id :se_setprops \{text_scale = (1.0, 1.0)
			text_alpha = 1.0}
		if quest_unlocks_id :desc_resolvealias \{name = alias_caption_text
				param = caption_text}
			<caption_text> :se_setprops {
				scale = (1.0, 1.0)
				alpha = 1.0
			}
		endif
		no_anim_in = 1
	endif
	if quest_unlocks_id :desc_resolvealias \{name = alias_caption_text
			param = caption_text}
		if NOT scriptisrunning \{ui_caption_text_anim}
			<caption_text> :obj_spawnscript ui_caption_text_anim params = {no_anim_in = <no_anim_in>}
		endif
	endif
	assignalias \{id = quest_unlocks_id
		alias = current_menu}
	launchevent \{type = focus
		target = current_menu}
endscript

script ui_quest_unlocks_add_helpers \{chapter_global = !q1768515945
		unlock_background = !q1768515945
		ui_event_back = 0}
	clean_up_user_control_helpers
	add_gamertag_helper exclusive_device = ($primary_controller)
	add_user_control_helper \{text = qs(0x182f0173)
		button = green}
	social_network_message = encore_complete
	quest_progression_get_number_of_stars_earned savegame = ($primary_controller) chapter_global = <chapter_global>
	if (<unlock_background> = gigselect_illo_guitar)
		quest_unlocks_midboss_complete
		social_network_message = encore_complete
	elseif (<unlock_background> = gigselect_illo_final_2)
		quest_unlocks_finale_complete ui_event_back = <ui_event_back>
		social_network_message = encore_complete
	elseif (<unlock_background> = gigselect_illo_demigod)
		quest_unlocks_demigod_complete ui_event_back = <ui_event_back>
		social_network_message = chapter_dominated
	elseif quest_progression_check_chapter_dominated savegame = ($primary_controller) chapter = <chapter_global>
		social_network_message = chapter_dominated
	endif
	if NOT isbandcheating
		social_networks_setup_broadcast_handlers {
			message_id = <social_network_message>
			menu_id = quest_unlocks_id
		}
	endif
endscript

script ui_return_quest_unlocks 
	assignalias \{id = quest_unlocks_id
		alias = current_menu}
	chapter_global = ($current_chapter)
	hero_info = ($<chapter_global>.hero_info)
	hero_name_nl = ($<hero_info>.name_nl)
	ui_quest_get_giglist_bg hero_name_nl = <hero_name_nl> chapter_global = <chapter_global> attempting_encore = 1
	ui_quest_unlocks_add_helpers chapter_global = <chapter_global> unlock_background = <bg_texture>
	launchevent \{type = focus
		target = current_menu}
endscript

script ui_destroy_quest_unlocks 
	clean_up_user_control_helpers
	spawnscriptnow \{audio_play_loc_vo_manually
		params = {
			stream_to_stop = 'FB_DemiGod_Success'
		}}
	if screenelementexists \{id = quest_unlocks_id}
		destroyscreenelement \{id = quest_unlocks_id}
	endif
endscript

script get_recent_career_unlocks 
	recent_unlock_data = ($g_quest_recent_unlocked_awards)
	getarraysize <recent_unlock_data>
	if (<array_size> > 0)
		return \{true}
	endif
	return \{false}
endscript

script quest_unlocks_set_text \{unlock_data = 0x69696969}
	if structurecontains \{structure = unlock_data
			unlock_text_header}
		quest_unlocks_id :se_setprops caption_text = (<unlock_data>.unlock_text_header)
	else
		quest_unlocks_id :se_setprops \{caption_text = qs(0x466e095e)}
	endif
	unlock_text = (<unlock_data>.unlock_text)
	getarraysize <unlock_text>
	if (<array_size> < 1)
		softassert \{reason = qs(0x0955183d)}
		return
	endif
	lines_of_text = <array_size>
	index = 0
	begin
	line_text = qs(0x03ac90f0)
	bullet_alpha = 0.0
	formattext checksumname = line 'line%a_text' a = (<index> + 1)
	formattext checksumname = bullet 'bullet%a_alpha' a = (<index> + 1)
	if (<index> < <array_size>)
		current_line = (<unlock_text> [<index>])
		line_text = (<current_line>.text)
		bullet_alpha = 1.0
		if structurecontains \{structure = current_line
				show_alt_text_if}
			alt_text_script = (<current_line>.show_alt_text_if)
			if <alt_text_script>
				line_text = (<current_line>.alt_text)
			endif
		endif
		if (<line_text> = qs(0x03ac90f0) || <line_text> = qs(0x00000000))
			bullet_alpha = 0.0
		endif
	endif
	addparam structure_name = line_text_params name = <line> value = <line_text>
	addparam structure_name = line_text_params name = <bullet> value = <bullet_alpha>
	index = (<index> + 1)
	repeat <lines_of_text>
	quest_unlocks_id :se_setprops <line_text_params>
endscript

script ui_quest_unlocks_continue \{next_state_event = !q1768515945
		next_state_name = !q1768515945
		next_state_params = 0x69696969
		go_to_credits = 0}
	change \{g_quest_recent_unlocked_awards = [
		]}
	hide_glitch \{num_frames = 8}
	if ($g_kiosk_demo = 0)
		0xa920eb49 = ($quest_progression_unlocks)
		0x7f2ec8f9 = (<0xa920eb49> [0])
		getarraysize <0x7f2ec8f9>
		i = 0
		0xc0960ad5 = 1
		begin
		quest_progression_get_chapter_tag savegame = ($primary_controller) chapter_global = (<0x7f2ec8f9> [<i>]) param = completed
		if (<completed> = 0)
			0xc0960ad5 = 0
			break
		endif
		i = (<i> + 1)
		repeat <array_size>
		if (<0xc0960ad5> = 1)
			go_to_credits = 1
		endif
	endif
	if (<go_to_credits> = 1)
		launchevent \{type = unfocus
			target = current_menu}
		quest_unlocks_id :se_setprops \{block_events}
		0x8fe60540
		next_state_event = menu_back
		next_state_name = uistate_quest_map
		next_state_params = {}
	endif
	hide_glitch \{num_frames = 8}
	ui_event {
		event = <next_state_event>
		state = <next_state_name>
		data = <next_state_params>
	}
endscript

script ui_quest_unlocks_goto_tracker 
endscript

script quest_unlocks_midboss_complete 
endscript

script quest_unlocks_finale_complete \{ui_event_back = !i1768515945}
	if (<ui_event_back> = 0)
		spawnscriptnow \{audio_play_loc_vo_manually
			params = {
				stream_name = 'UI_Demigod_Complete'
			}}
	endif
endscript

script quest_unlocks_demigod_complete 
	quest_unlocks_id :se_setprops \{default_bg_alpha = 0.0
		demigod_bg_alpha = 1.0}
	if (<ui_event_back> = 0)
		spawnscriptnow \{audio_play_loc_vo_manually
			params = {
				stream_name = 'FB_DemiGod_Success'
			}}
	endif
endscript

script ui_caption_text_anim 
	if NOT gotparam \{no_anim_in}
		wait \{0.15
			seconds}
		spawnscriptnow \{audio_play_quest_reward_anim_sfx
			params = {
				play_text_whoosh
			}}
		se_setprops \{scale = (3.0, 3.0)
			alpha = 0}
		se_waitprops
		se_setprops \{scale = (0.9, 0.9)
			time = 0.3
			alpha = 1
			motion = ease_in}
		se_waitprops
		se_setprops \{scale = (1.1, 1.1)
			time = 0.1
			motion = ease_out}
		se_waitprops
		se_setprops \{scale = (1.0, 1.0)
			time = 0.1
			motion = ease_in}
		se_waitprops
	endif
	begin
	se_setprops \{scale = (1.1, 1.1)}
	se_waitprops
	se_setprops \{scale = (1.0, 1.0)
		time = 0.1
		motion = ease_out}
	se_waitprops
	se_setprops \{scale = (1.15, 1.15)
		time = 0.15
		motion = ease_out}
	se_waitprops
	se_setprops \{scale = (0.95, 0.95)
		time = 0.25
		motion = ease_out}
	se_waitprops
	se_setprops \{scale = (1.0, 1.0)
		time = 0.2
		motion = smooth}
	se_waitprops
	wait \{3
		seconds}
	repeat
endscript
