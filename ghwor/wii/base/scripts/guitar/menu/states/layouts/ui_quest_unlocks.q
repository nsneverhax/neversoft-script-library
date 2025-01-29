
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
	GetArraySize <recent_unlock_data>
	if (<array_Size> < 1)
		ui_quest_unlocks_continue {
			next_state_event = <next_state_event>
			next_state_name = <next_state_name>
			next_state_params = <next_state_params>
		}
		return
	endif
	load_pak_for_quest_chapter
	CreateScreenElement {
		parent = root_window
		id = quest_unlocks_id
		Type = descinterface
		desc = 'chapter_complete'
		dialog_anim_scale = (1.0, 1.0)
		text_scale = (1.0, 1.0)
		text_pos = (0.0, -20.0)
		text_alpha = 0.0
		exclusive_device = ($primary_controller)
		event_handlers = [
			{
				pad_choose ui_sfx params = {menustate = Generic uitype = select}
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
	if InNetGame
		net_career_setup_ui_stream \{parent = quest_unlocks_id}
	endif
	unlock_data = (<recent_unlock_data> [0])
	hero_info = ($<chapter_global>.hero_info)
	hero_name_nl = ($<hero_info>.name_nl)
	ui_quest_get_giglist_bg hero_name_nl = <hero_name_nl> chapter_global = <chapter_global> attempting_encore = 1
	unlock_background = <bg_texture>
	quest_unlocks_id :se_setprops {character_texture = <unlock_background>}
	quest_unlocks_id :SetTags {social_network_message = <social_network_message>}
	ui_quest_unlocks_add_helpers chapter_global = <chapter_global> unlock_background = <unlock_background> ui_event_back = <ui_event_back>
	quest_unlocks_set_text unlock_data = <unlock_data>
	if (<ui_event_back> = 0)
		SpawnScriptNow \{audio_play_quest_reward_anim_sfx}
		quest_unlocks_id :se_setprops \{text_scale = (6.5, 6.5)
			text_alpha = 0.0
			time = 0.5
			motion = ease_in}
		Wait \{0.5
			Seconds}
		quest_unlocks_id :se_setprops \{text_scale = (0.95, 0.95)
			text_alpha = 0.75
			time = 0.4
			motion = ease_out}
		Wait \{0.4
			Seconds}
		quest_unlocks_id :se_setprops \{text_scale = (1.0, 1.0)
			text_alpha = 1.0
			time = 0.2
			motion = ease_in}
		Wait \{0.2
			Seconds}
	else
		quest_unlocks_id :se_setprops \{text_scale = (1.0, 1.0)
			text_alpha = 1.0}
		if quest_unlocks_id :desc_resolvealias \{Name = alias_caption_text
				param = caption_text}
			<caption_text> :se_setprops {
				Scale = (1.0, 1.0)
				alpha = 1.0
			}
		endif
		no_anim_in = 1
	endif
	if quest_unlocks_id :desc_resolvealias \{Name = alias_caption_text
			param = caption_text}
		if NOT ScriptIsRunning \{ui_caption_text_anim}
			<caption_text> :obj_spawnscript ui_caption_text_anim params = {no_anim_in = <no_anim_in>}
		endif
	endif
	AssignAlias \{id = quest_unlocks_id
		alias = current_menu}
	LaunchEvent \{Type = focus
		target = current_menu}
endscript

script ui_quest_unlocks_add_helpers \{chapter_global = !q1768515945
		unlock_background = !q1768515945
		ui_event_back = 0}
	clean_up_user_control_helpers
	add_gamertag_helper exclusive_device = ($primary_controller)
	add_user_control_helper \{text = qs(0x182f0173)
		button = green}
	add_user_control_helper \{text = qs(0xb2867e0a)
		button = yellow}
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
	if NOT social_networks_broadcast_allowed
		if ScreenElementExists \{id = quest_unlocks_id}
			quest_unlocks_id :se_setprops \{event_handlers = [
					{
						pad_L1
						nullscript
					}
				]
				replace_handlers}
		endif
	else
		if NOT isbandcheating
			social_networks_setup_broadcast_handlers {
				message_id = <social_network_message>
				menu_id = quest_unlocks_id
			}
		endif
	endif
endscript

script ui_return_quest_unlocks 
	AssignAlias \{id = quest_unlocks_id
		alias = current_menu}
	chapter_global = ($current_chapter)
	hero_info = ($<chapter_global>.hero_info)
	hero_name_nl = ($<hero_info>.name_nl)
	ui_quest_get_giglist_bg hero_name_nl = <hero_name_nl> chapter_global = <chapter_global> attempting_encore = 1
	ui_quest_unlocks_add_helpers chapter_global = <chapter_global> unlock_background = <bg_texture>
	LaunchEvent \{Type = focus
		target = current_menu}
endscript

script ui_destroy_quest_unlocks 
	clean_up_user_control_helpers
	SpawnScriptNow \{audio_play_loc_vo_manually
		params = {
			stream_to_stop = 'FB_DemiGod_Success'
		}}
	if ScreenElementExists \{id = quest_unlocks_id}
		DestroyScreenElement \{id = quest_unlocks_id}
	endif
	unload_pak_for_quest_chapter
endscript

script quest_unlocks_set_text \{unlock_data = 0x69696969}
	if StructureContains \{structure = unlock_data
			unlock_text_header}
		quest_unlocks_id :se_setprops caption_text = (<unlock_data>.unlock_text_header)
	else
		quest_unlocks_id :se_setprops \{caption_text = qs(0x466e095e)}
	endif
	unlock_text = (<unlock_data>.unlock_text)
	GetArraySize <unlock_text>
	if (<array_Size> < 1)
		SoftAssert \{reason = qs(0x0955183d)}
		return
	endif
	lines_of_text = <array_Size>
	index = 0
	begin
	line_text = qs(0x03ac90f0)
	bullet_alpha = 0.0
	formatText checksumName = line 'line%a_text' a = (<index> + 1)
	formatText checksumName = bullet 'bullet%a_alpha' a = (<index> + 1)
	if (<index> < <array_Size>)
		current_line = (<unlock_text> [<index>])
		line_text = (<current_line>.text)
		bullet_alpha = 1.0
		if StructureContains \{structure = current_line
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
	AddParam structure_name = line_text_params Name = <line> value = <line_text>
	AddParam structure_name = line_text_params Name = <bullet> value = <bullet_alpha>
	index = (<index> + 1)
	repeat <lines_of_text>
	quest_unlocks_id :se_setprops <line_text_params>
endscript

script ui_quest_unlocks_continue \{next_state_event = !q1768515945
		next_state_name = !q1768515945
		next_state_params = 0x69696969
		go_to_credits = 0}
	Change \{g_quest_recent_unlocked_awards = [
		]}
	hide_glitch \{num_frames = 8}
	if (<go_to_credits> = 1)
		SpawnScriptNow \{progression_endcredits_song
			params = {
				state_event = menu_back
			}}
		return
	endif
	ui_event {
		event = <next_state_event>
		state = <next_state_name>
		data = <next_state_params>
	}
endscript

script ui_quest_unlocks_goto_tracker 
	ui_sfx \{menustate = Generic
		uitype = select}
	ui_event \{event = menu_change
		state = uistate_unlock_tracker}
endscript

script quest_unlocks_midboss_complete 
endscript

script quest_unlocks_finale_complete \{ui_event_back = !i1768515945}
	if (<ui_event_back> = 0)
		SpawnScriptNow \{audio_play_loc_vo_manually
			params = {
				stream_name = 'UI_Demigod_Complete'
			}}
	endif
endscript

script quest_unlocks_demigod_complete 
	quest_unlocks_id :se_setprops \{default_bg_alpha = 0.0
		demigod_bg_alpha = 1.0}
	if (<ui_event_back> = 0)
		SpawnScriptNow \{audio_play_loc_vo_manually
			params = {
				stream_name = 'FB_DemiGod_Success'
			}}
	endif
endscript

script ui_caption_text_anim 
	if NOT GotParam \{no_anim_in}
		Wait \{0.15
			Seconds}
		SpawnScriptNow \{audio_play_quest_reward_anim_sfx
			params = {
				play_text_whoosh
			}}
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
