g_e3_demo_flow = 0
g_quest_map_index = 0
g_quest_map_first_time = 1
g_quest_map_state = [
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
]
g_quest_map_stars = [
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
]
g_quest_map_last_player_num = 0
g_quest_map_last_gamertag = qs(0xbceb627d)
g_career_skip_narration = 1
g_quest_map_initial_wait_before_anim = 1.0
g_quest_map_wait_inbetween_anim = 1.0
g_domination_anim_delay = 4.0
g_domination_anim_speed = 1.0
g_domination_anim_default = 1.0
g_domination_anim_start_time = 2.75
g_domination_anim_accelerator = 0.71999997
g_quest_map_info_box_text = [
	{
		chapters = 0
		text = qs(0x646aa51e)
	}
	{
		chapters = 1
		text = qs(0x72c0f7bb)
	}
	{
		chapters = 4
		text = qs(0xb1c5dc72)
	}
	{
		chapters = 5
		text = qs(0x72c0f7bb)
	}
	{
		chapters = 8
		text = qs(0x3b8575e2)
	}
	{
		chapters = 9
		text = qs(0x33959787)
	}
	{
		chapters = 10
		text = qs(0xede8ecfe)
	}
	{
		chapters = 11
		text = qs(0x6876acd2)
	}
]

script ui_init_quest_map 
	change \{respond_to_signin_changed_func = none}
	change \{g_quest_map_index = 0}
	net_leader = ($g_net_leader_player_num)
	if (<net_leader> < 1)
		getfirstplayer \{local}
		net_leader = <player>
	endif
	if (<net_leader> > 0)
		getplayerinfo <net_leader> gamertag
		if ($<gamertag> != $g_quest_map_last_gamertag)
			change \{g_quest_map_index = 0}
		endif
		change g_quest_map_last_player_num = <net_leader>
		change g_quest_map_last_gamertag = ($<gamertag>)
	endif
	for_each_quest_progression_unlock \{callback = ui_quest_map_fillout_star_count}
	audio_ui_enter_quest_map
	change \{g_quest_map_first_time = 1}
endscript

script ui_create_quest_map \{play_outro_vo = 0
		outro_vo_strings = [
		]
		net_play_song = 0}
	if ($g_kiosk_demo = 1)
		change \{g_chapter_encore_anim_flag = 0}
	endif
	audio_ui_menu_music_on
	spawnscriptnow \{audio_kill_crowds_during_stats_screen}
	change \{rich_presence_context = presence_career_map}
	change \{respond_to_signin_changed = 1}
	change \{respond_to_signin_changed_all_players = 1}
	change \{respond_to_signin_changed_func = none}
	destroy_friend_feed
	createscreenelement {
		parent = root_window
		id = questmapid
		type = descinterface
		desc = 'career_map'
		tags = {
			map_index = -1
			map_fillout_pass = 1
			linear_progression = []
			num_unlocked = 0
			vo_unique_ids = []
			initial_wait_flag = 0
			domination_unlocked = 0
		}
		exclusive_device = ($primary_controller)
		character_description_alpha = 0
		instruction_alpha = 0
	}
	getarraysize <outro_vo_strings> param = num_vo_strings
	if (<num_vo_strings> = 0)
		play_outro_vo = 0
	endif
	quest_map_add_event_handlers vo_playing = <play_outro_vo>
	if innetgame
		net_career_setup_ui_stream \{parent = questmapid}
	endif
	if ($g_quest_map_first_time = 1)
		for_each_quest_progression_unlock \{callback = ui_quest_map_fillout_unlock_array}
	endif
	for_each_quest_progression_unlock \{callback = ui_quest_create_linear_progression_array}
	if (<play_outro_vo> = 1)
		counter = 0
		getarraysize <outro_vo_strings>
		if (<array_size> > 0)
			begin
			if ((<outro_vo_strings> [<counter>]) = 'Map_Demigod_Complete')
				tutorial_system_get_language_prefix
				formattext checksumname = mapdemigodcompletestreamname '%l_UI_Demigod_Complete' l = <language_prefix>
				stopsound <mapdemigodcompletestreamname>
				questmapid :settags \{domination_unlocked = 1}
				break
			endif
			counter = (<counter> + 1)
			repeat <array_size>
		endif
	endif
	for_each_quest_progression_unlock \{callback = ui_quest_map_fillout}
	questmapid :desc_resolvealias \{name = alias_container}
	questmapid :getsingletag \{num_unlocked}
	if (<num_unlocked> > 9)
		questmapid :se_setprops \{tier03b_alpha = 1}
	endif
	if (<num_unlocked> > 5)
		questmapid :se_setprops \{tier03_alpha = 1}
	endif
	if (<num_unlocked> > 4)
		questmapid :se_setprops \{tier02b_alpha = 1}
	endif
	if (<num_unlocked> > 2)
		questmapid :se_setprops \{tier02_alpha = 1}
	endif
	quest_progression_get_number_of_completed_chapters savegame = ($primary_controller)
	<index> = 0
	getarraysize ($g_quest_map_info_box_text)
	begin
	<chapters> = ($g_quest_map_info_box_text [<index>].chapters)
	if (<number_of_unlocked_chapters> >= <chapters>)
		questmapid :se_setprops instructional_text_text = ($g_quest_map_info_box_text [<index>].text)
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	if console_is_net_career_client
		<quest_map_first_time_setup> = ($g_net_career_progression.career_progression_tags.quest_map_first_time_setup)
	else
		getglobaltags savegame = ($primary_controller) career_progression_tags param = quest_map_first_time_setup
	endif
	getsavegamefromcontroller controller = ($primary_controller)
	quest_calculate_career_progress {savegame = <savegame>}
	formattext textname = percentage_text qs(0x22cb1903) a = <career_complete_percentage> decimalplaces = 0
	questmapid :se_setprops percentage_text_text = <percentage_text>
	for_each_quest_progression_unlock \{callback = ui_quest_map_focus}
	if (<quest_map_first_time_setup> = 0)
		if console_is_net_career_client
			temp_struct = ($g_net_career_progression.career_progression_tags + {quest_map_first_time_setup = 1})
			appendstruct struct = g_net_career_progression field = career_progression_tags params = <temp_struct> globalstruct
		else
			setglobaltags savegame = ($primary_controller) career_progression_tags params = {quest_map_first_time_setup = 1} progression = true
		endif
		addarrayelement array = <outro_vo_strings> element = 'Map_Intro'
		<outro_vo_strings> = <array>
		quest_map_add_event_handlers \{vo_playing = 1}
		questmapid :obj_spawnscript ui_quest_map_play_outro_vo params = {vo_array = <outro_vo_strings> finished_callback = quest_map_vo_finished play_outro_vo = 1}
	elseif (<play_outro_vo> = 1)
		questmapid :obj_spawnscript ui_quest_map_play_outro_vo params = {vo_array = <outro_vo_strings> finished_callback = quest_map_vo_finished play_outro_vo = <play_outro_vo>}
	else
		questmapid :obj_spawnscript quest_map_vo_finished params = {vo_array = <outro_vo_strings> play_outro_vo = <play_outro_vo>}
	endif
	quest_map_get_slot_id chapter_num = ($g_quest_map_index + 1)
	<slot_id> :se_setprops career_meter_scale = (1.5, 1.5)
	wait \{0.1
		seconds}
	if (<net_play_song> = 0)
		questmapid :settags \{map_fillout_pass = 2}
		questmapid :getsingletag \{domination_unlocked}
		if (<domination_unlocked> = 0)
			for_each_quest_progression_unlock \{callback = ui_quest_map_fillout
				spawned = 1}
		else
			wait ($g_domination_anim_delay) seconds
			change \{g_domination_anim_speed = $g_domination_anim_start_time}
			for_each_quest_progression_unlock \{callback = ui_quest_map_fillout}
		endif
	endif
	questmapid :settags map_index = ($g_quest_map_index)
	change \{g_quest_map_first_time = 0}
	ui_event_remove_params \{param = play_outro_vo}
endscript

script ui_return_quest_map 
	if NOT screenelementexists \{id = band_lobby_popup_menu}
		quest_map_add_helpers
		quest_map_add_event_handlers
		assignalias \{id = questmapid
			alias = current_menu}
		launchevent \{type = focus
			target = current_menu}
	else
		assignalias \{id = band_lobby_popup_menu
			alias = current_menu}
		clean_up_user_control_helpers
		add_user_control_helper controller = ($primary_controller) text = ($band_lobby_strings.button_select) button = green z = 100000
		band_lobby_update_button_helpers controller = ($primary_controller) menu = playerslist
	endif
endscript

script quest_map_add_event_handlers \{vo_playing = 0}
	if console_is_net_career_client
		<array> = [
			{pad_up ui_quest_map_move params = {savegame = ($primary_controller)}}
			{pad_down ui_quest_map_move params = {savegame = ($primary_controller) up = 1}}
			{pad_back postgame_lobby_quit params = {id = questmapid}}
			{pad_back ui_sfx params = {menustate = career_map uitype = back}}
			{pad_choose ui_quest_map_choose params = {device_num = <device_num>}}
			{pad_choose ui_sfx params = {menustate = career_map uitype = select}}
		]
	else
		<array> = [
			{pad_up ui_quest_map_move params = {savegame = ($primary_controller)}}
			{pad_down ui_quest_map_move params = {savegame = ($primary_controller) up = 1}}
			{pad_back ui_quest_map_back}
			{pad_back ui_sfx params = {menustate = career_map uitype = back}}
			{pad_choose ui_quest_map_choose params = {device_num = <device_num>}}
			{pad_choose ui_sfx params = {menustate = career_map uitype = select}}
		]
	endif
	if innetgame
		addarrayelement array = <array> element = {pad_option quest_map_players params = {device_num = <device_num>}}
	else
		if NOT retailbuild
			quest_progression_get_chapter_tag savegame = ($primary_controller) chapter_global = quest_chapter_finale param = completed
			if (<completed> = 0)
				addarrayelement array = <array> element = {pad_l1 ui_quest_map_debug_beat params = {beat_encore = 1}}
				addarrayelement array = <array> element = {pad_r1 ui_quest_map_debug_beat}
			else
				addarrayelement array = <array> element = {pad_l1 ui_quest_map_debug_beat params = {dominate = 1}}
				addarrayelement array = <array> element = {pad_r1 ui_quest_map_debug_beat}
			endif
			if ($g_career_skip_narration = 1 && <vo_playing> = 1)
				questmapid :se_setprops \{event_handlers = [
					]
					replace_handlers}
				array = [{pad_option2 quest_map_kill_vo}]
			endif
		endif
	endif
	questmapid :se_setprops {
		event_handlers = <array>
		replace_handlers
	}
	if (<vo_playing> = 1)
		if cd
			questmapid :se_setprops \{block_events}
		else
			if ($g_career_skip_narration = 1)
				clean_up_user_control_helpers
				add_user_control_helper \{text = qs(0x8f5f1203)
					button = yellow}
				launchevent \{type = focus
					target = questmapid}
			else
				questmapid :se_setprops \{block_events}
			endif
		endif
	else
		questmapid :se_setprops \{unblock_events}
	endif
endscript

script quest_map_add_helpers 
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red}
	if innetgame
		add_user_control_helper \{text = qs(0xa83061c6)
			button = blue}
	else
		if NOT retailbuild
			if quest_progression_check_domination_unlocked savegame = ($primary_controller)
				add_user_control_helper \{text = qs(0x532a33ac)
					button = orange}
			else
				add_user_control_helper \{text = qs(0x5ffd0ea3)
					button = orange}
			endif
			add_user_control_helper \{text = qs(0xc6180e71)
				button = rb}
		endif
	endif
endscript

script quest_map_hilight_anim 
	begin
	se_setprops \{alpha = 1
		scale = (0.85, 0.85)
		time = 0}
	wait \{0.25
		seconds}
	se_setprops \{alpha = 0.5
		scale = (0.9, 0.9)
		time = 0.25}
	wait \{0.25
		seconds}
	se_setprops \{alpha = 1
		scale = (0.85, 0.85)
		time = 0.25}
	wait \{0.25
		seconds}
	repeat
endscript

script quest_map_vo_finished \{play_outro_vo = 0}
	wait \{1
		gameframe}
	show_help_page = 0
	if gotparam \{vo_array}
		getarraysize <vo_array>
		if (<array_size> > 0)
			if ((<vo_array> [0]) = 'Map_Demigod_Complete')
				universal_help_display_help_check help_context = domination_intro device_num = ($primary_controller)
				change g_domination_anim_speed = ($g_domination_anim_default)
			endif
		endif
	endif
	if NOT gotparam \{fb_outro}
		questmapid :settags \{map_fillout_pass = 3}
		for_each_quest_progression_unlock \{callback = ui_quest_map_fillout}
	endif
	quest_map_get_slot_id chapter_num = ($g_quest_map_index + 1)
	<slot_id> :se_setprops hilight_alpha = 1
	<slot_id> :se_setprops hilight_glow_alpha = 1
	<slot_id> :se_setprops career_meter_scale = (1.5, 1.5)
	if <slot_id> :desc_resolvealias name = alias_hilight param = hilight_id
		<hilight_id> :obj_spawnscript quest_map_hilight_anim
	else
		scriptassert \{'dschorn1'}
	endif
	if <slot_id> :desc_resolvealias name = alias_hilight_glow param = hilight_glow_id
		<hilight_glow_id> :obj_spawnscript quest_map_hilight_anim
	else
		scriptassert \{'dschorn1'}
	endif
	for_each_quest_progression_unlock \{callback = ui_quest_map_focus}
	for_each_quest_progression_unlock \{callback = ui_quest_map_fillout_unlock_array}
	if (<show_help_page> = 1)
		wait \{1.2
			second}
		ui_event_wait {
			event = menu_change
			state = uistate_universal_help
			data = {
				next_state_event = menu_back
				next_state_name = uistate_quest_map
				help_global_index = <help_index>
				device_num = ($primary_controller)
				is_popup
			}
		}
		launchevent \{type = unfocus
			target = questmapid}
	else
		quest_map_add_helpers
		quest_map_add_event_handlers
		assignalias \{id = questmapid
			alias = current_menu}
		launchevent \{type = focus
			target = current_menu}
	endif
endscript

script quest_map_kill_hilight_anim 
	se_setprops \{alpha = 0}
endscript

script quest_map_kill_vo 
	questmapid :getsingletag \{vo_unique_ids}
	getarraysize <vo_unique_ids>
	if (<array_size> > 0)
		<vo_index> = 0
		begin
		<id> = (<vo_unique_ids> [<vo_index>])
		stopsound unique_id = <id> fade_time = 0.1 fade_type = linear
		<vo_index> = (<vo_index> + 1)
		repeat <array_size>
	endif
	questmapid :obj_spawnscript \{quest_map_vo_finished}
endscript

script ui_destroy_quest_map 
	quest_map_kill_vo
	clean_up_user_control_helpers
	if screenelementexists \{id = questmapid}
		destroyscreenelement \{id = questmapid}
	endif
endscript

script ui_deinit_quest_map 
	destroy_band
	audio_ui_exit_quest_map
endscript

script ui_quest_map_play_outro_vo \{vo_array = [
		]
		finished_callback = nullscript}
	<lang_crc> = null
	if english
		<lang_crc> = en_
	elseif german
		<lang_crc> = gr_
	elseif french
		<lang_crc> = fr_
	elseif italian
		<lang_crc> = it_
	elseif spanish
		<lang_crc> = sp_
	endif
	<vo_index> = 0
	getarraysize <vo_array>
	if (<array_size> > 0)
		<vo_array_size> = <array_size>
		begin
		extendcrc <lang_crc> (<vo_array> [<vo_index>]) out = outro_vo_crc
		preloadstream <outro_vo_crc>
		questmapid :getsingletag \{vo_unique_ids}
		addarrayelement array = <vo_unique_ids> element = <unique_id>
		questmapid :settags vo_unique_ids = <array>
		begin
		if preloadstreamdone <unique_id>
			break
		endif
		wait \{1
			gameframe}
		repeat
		audio_cutscene_get_vol_tweak_of_preloaded_stream streamname = (<vo_array> [<vo_index>])
		startpreloadedstream <unique_id> buss = front_end forcesafepreload = 1 vol = <volumetweak> priority = 1
		if (<vo_index> = 0)
			quest_map_add_event_handlers \{vo_playing = 1}
		endif
		if (<vo_array_size> > 1 && <vo_index> + 1 < <vo_array_size>)
			audio_menu_music_duck_volume outro_vo = (<vo_array> [<vo_index>])
			begin
			if NOT issoundplaying <outro_vo_crc>
				break
			endif
			wait \{1
				gameframe}
			repeat
		else
			audio_menu_music_duck_volume outro_vo = (<vo_array> [<vo_index>])
		endif
		if (<vo_index> = 0)
			if (<vo_array> [<vo_index>] = 'Map_Demigod_Complete')
				questmapid :settags \{map_fillout_pass = 3}
				for_each_quest_progression_unlock \{callback = ui_quest_map_fillout}
			else
				questmapid :obj_spawnscript <finished_callback> params = {vo_array = <vo_array>}
			endif
		elseif (<vo_index> = 1 && (<vo_array> [<vo_index>] = 'Map_FB_Outro'))
			questmapid :obj_spawnscript <finished_callback> params = {vo_array = <vo_array> fb_outro}
		endif
		<vo_index> = (<vo_index> + 1)
		repeat <vo_array_size>
	endif
endscript

script ui_quest_create_linear_progression_array \{chapter_global = !q1768515945}
	questmapid :getsingletag \{linear_progression}
	addarrayelement array = <linear_progression> element = <chapter_global>
	<linear_progression> = <array>
	questmapid :settags linear_progression = <linear_progression>
endscript

script ui_quest_map_fillout_unlock_array \{chapter_global = !q1768515945
		chapter_num = !i1768515945}
	get_savegame_from_controller controller = ($primary_controller)
	quest_progression_get_chapter_tag savegame = <savegame> chapter_global = <chapter_global> param = unlocked
	setarrayelement arrayname = g_quest_map_state globalarray index = (<chapter_num> - 1) newvalue = <unlocked>
endscript

script quest_get_char_icon \{hero_name_nl = 0x69696969
		chapter_name = !q1768515945}
	formattext checksumname = character_texture 'Car_%s01_ICON' s = <hero_name_nl>
	formattext checksumname = character_trans_texture 'Car_%s02_ICON' s = <hero_name_nl>
	if (<chapter_name> = quest_chapter_newfemale)
		<character_texture> = car_chicka01_icon
		<character_trans_texture> = car_chicka02_icon
	elseif (<chapter_name> = quest_chapter_newmale)
		<character_texture> = car_dude01_icon
		<character_trans_texture> = car_dude02_icon
	elseif (<chapter_name> = quest_chapter_midboss)
		<character_texture> = car_ax01_icon
		<character_trans_texture> = car_ax02_icon
	elseif (<chapter_name> = quest_chapter_demigod)
		<character_texture> = car_demi01_icon
		<character_trans_texture> = car_demi02_icon
	elseif (<chapter_name> = quest_chapter_finale)
		<character_texture> = car_amp01_icon
		<character_trans_texture> = car_amp02_icon
	endif
	return character_texture = <character_texture> character_trans_texture = <character_trans_texture>
endscript

script ui_quest_map_fillout \{chapter_global = !q1768515945
		chapter_num = !i1768515945}
	<chapter_name> = ($<chapter_global>.name)
	<hero_info> = ($<chapter_global>.hero_info)
	<hero_name_nl> = ($<hero_info>.name_nl)
	formattext checksumname = chapter_unlock '%s' s = <chapter_name>
	get_savegame_from_controller controller = ($primary_controller)
	domination_unlocked = 0
	questmapid :getsingletag \{map_fillout_pass}
	questmapid :getsingletag \{domination_unlocked}
	if console_is_net_career_client
		addparams ($g_net_career_progression.<chapter_unlock>)
	else
		getglobaltags <chapter_unlock> savegame = <savegame>
	endif
	quest_map_get_slot_id chapter_num = <chapter_num>
	quest_get_char_icon hero_name_nl = <hero_name_nl> chapter_name = <chapter_global>
	<hero_global> = ($<chapter_global>.hero_info)
	if (<map_fillout_pass> = 1)
		if (<unlocked> = 1)
			questmapid :getsingletag \{num_unlocked}
			questmapid :settags num_unlocked = (<num_unlocked> + 1)
			<slot_id> :se_setprops icon_character_texture = <character_texture>
			if ($g_quest_map_state [(<chapter_num> - 1)] = 1)
				<slot_id> :se_setprops alpha = 1
			endif
			if quest_progression_check_for_chapter_complete savegame = ($primary_controller) chapter_global = <chapter_global>
				<character_texture> = <character_trans_texture>
				<slot_id> :se_setprops icon_character_texture = <character_texture>
			endif
			if (<domination_unlocked> = 1)
				quest_progression_get_number_of_stars_earned chapter_global = <chapter_global> savegame = ($primary_controller)
				stars_needed_for_transform = ($<chapter_global>.stars_for_encore)
				stars_needed_for_max = ($<chapter_global>.stars_for_reward)
				force_red_fill = 0
				stop_at_blue = 1
				encore_completed = 0
				if (<hero_global> = midboss_hero_info || <hero_global> = finale_hero_info)
					force_red_fill = 1
					stop_at_blue = 0
					encore_completed = 1
					stars_earned = 10
					stars_needed_for_transform = 0
					stars_needed_for_max = 10
				endif
				song_breakdown_apply_career_medallion_progress {
					song_stars_earned = 0
					current_total_stars = <stars_earned>
					stars_needed_for_transform = <stars_needed_for_transform>
					stars_needed_for_max = <stars_needed_for_max>
					apply_initial = 1
					desc_id = <slot_id>
					use_16_textures = 1
					force_stats_finished_animating = 1
					stop_at_blue = <stop_at_blue>
					encore_completed = 1
					force_red_fill = <force_red_fill>
					domination_unlocked = 0
					encore_completed = <encore_completed>
				}
			endif
		endif
	elseif (<map_fillout_pass> = 2)
		if (<unlocked> = 1)
			if (<has_been_played> = 1)
				quest_progression_get_number_of_stars_earned chapter_global = <chapter_global> savegame = ($primary_controller)
				<stars_before> = ($g_quest_map_stars [<chapter_num> - 1])
				<new_stars> = (<stars_earned> - <stars_before>)
				if (<stars_before> < $<chapter_global>.stars_for_encore)
					<slot_id> :se_setprops icon_character_texture = <character_texture>
				endif
				<stars_needed_for_transform> = ($<chapter_global>.stars_for_encore)
				<stars_needed_for_max> = ($<chapter_global>.stars_for_reward)
				if (<chapter_global> = quest_chapter_midboss || <chapter_global> = quest_chapter_finale)
					if console_is_net_career_client
						<rush_set_current_song> = ($g_net_career_progression.career_progression_tags.rush_set_current_song)
					else
						getglobaltags career_progression_tags params = rush_set_current_song savegame = ($primary_controller)
					endif
					songs_array = ($<chapter_global>.songs)
					getarraysize <songs_array> param = num_songs
					<one_fraction> = ((1.0 / <num_songs>) * 100.0)
					casttointeger \{one_fraction}
					<stars> = <one_fraction>
					if (<chapter_global> = quest_chapter_midboss)
						rush_set_current_song = (<rush_set_current_song> - 1)
						stars_earned = (<one_fraction> * <rush_set_current_song>)
					else
						stars_earned = 0
					endif
					<new_stars> = 0
					<stars_needed_for_transform> = 100
					<stars_needed_for_max> = 300
					quest_progression_get_chapter_tag savegame = ($primary_controller) chapter_global = <chapter_global> param = completed
					if (<completed> = 1)
						<new_stars> = 0
						stars_earned = <num_songs>
						stars_needed_for_transform = <num_songs>
						stars_needed_for_max = <num_songs>
					endif
				endif
				apply_blue_flame = 0
				quest_progression_get_chapter_tag savegame = ($primary_controller) chapter_global = <chapter_global> param = encore_unlocked
				quest_progression_get_chapter_tag savegame = ($primary_controller) chapter_global = <chapter_global> param = completed
				if (<encore_unlocked> = 1 && <completed> = 0)
					apply_blue_flame = 1
				endif
				stop_at_blue = 1
				completed = 0
				if quest_progression_check_domination_unlocked savegame = ($primary_controller)
					stop_at_blue = 0
					completed = 1
				endif
				force_red_fill = 0
				force_stats_finished_animating = 1
				if (<hero_global> = midboss_hero_info || <hero_global> = finale_hero_info)
					quest_progression_get_chapter_tag savegame = ($primary_controller) chapter_global = <chapter_global> param = completed
					force_red_fill = 1
					force_stats_finished_animating = 1
					stop_at_blue = 0
				endif
				apply_initial = 1
				if (<domination_unlocked> = 1)
					apply_initial = 0
					force_stats_finished_animating = 0
					force_red_fill = 1
					if (<hero_global> = midboss_hero_info || <hero_global> = finale_hero_info)
						return
					endif
					if ($g_medallion_pitch = 0)
						playsound \{stats_screen_stars_loop
							buss = ui
							num_loops = -1
							vol = -10}
					else
						setsoundparams stats_screen_stars_loop vol = ((($g_medallion_pitch / 7) * 10) - 10) pitch = (($g_medallion_pitch / 7) * 5)
					endif
					playsound medallion_flip vol = -10 buss = front_end pitch = (($g_medallion_pitch / 5) * 5)
					printf \{channel = sfx
						qs(0x0eec8116)
						s = $g_medallion_pitch}
					change g_medallion_pitch = ($g_medallion_pitch + 1)
				endif
				if ($g_medallion_pitch = 8)
					change \{g_medallion_pitch = 0}
					stopsound \{stats_screen_stars_loop}
				endif
				song_breakdown_apply_career_medallion_progress {
					song_stars_earned = <new_stars>
					current_total_stars = <stars_earned>
					stars_needed_for_transform = <stars_needed_for_transform>
					stars_needed_for_max = <stars_needed_for_max>
					apply_initial = <apply_initial>
					desc_id = <slot_id>
					use_16_textures = 1
					force_stats_finished_animating = <force_stats_finished_animating>
					stop_at_blue = <stop_at_blue>
					encore_completed = <completed>
					force_red_fill = <force_red_fill>
					apply_blue_flame = <apply_blue_flame>
					domination_unlocked = <domination_unlocked>
				}
				if (<new_stars> > 0)
					wait ($g_quest_map_wait_inbetween_anim) seconds
					<callback_params> = {}
					force_stats_finished_animating = 1
					if quest_progression_check_for_chapter_complete savegame = ($primary_controller) chapter_global = <chapter_global>
						<callback_params> = {
							animating_callback = quest_map_medallion_animating_callback
							animating_callback_params = {chapter_num = <chapter_num> chapter_global = <chapter_global>}
						}
						force_stats_finished_animating = 0
					endif
					song_breakdown_apply_career_medallion_progress {
						song_stars_earned = <new_stars>
						current_total_stars = <stars_earned>
						stars_needed_for_transform = <stars_needed_for_transform>
						stars_needed_for_max = <stars_needed_for_max>
						desc_id = <slot_id>
						use_16_textures = 1
						wait_time = 1
						stop_at_blue = <stop_at_blue>
						encore_completed = <completed>
						force_red_fill = <force_red_fill>
						apply_blue_flame = <apply_blue_flame>
						force_stats_finished_animating = <force_stats_finished_animating>
						<callback_params>
					}
				endif
			endif
		else
			if (<chapter_num> = $g_quest_map_index + 1)
				change \{g_quest_map_index = 0}
			endif
		endif
	elseif (<map_fillout_pass> = 3)
		if (<unlocked> = 1)
			if ($g_quest_map_state [(<chapter_num> - 1)] = 0)
				<slot_id> :se_setprops alpha = 1
				quest_map_anim_in_medallion slot_id = <slot_id>
			endif
		endif
	endif
endscript

script quest_map_medallion_animating_callback \{chapter_num = !i1768515945
		chapter_global = !q1768515945}
	quest_map_get_slot_id chapter_num = <chapter_num>
	<hero_info> = ($<chapter_global>.hero_info)
	<hero_name_nl> = ($<hero_info>.name_nl)
	quest_get_char_icon hero_name_nl = <hero_name_nl> chapter_name = <chapter_global>
	if quest_progression_check_for_chapter_complete savegame = ($primary_controller) chapter_global = <chapter_global>
		quest_map_get_slot_id chapter_num = <chapter_num>
		quest_get_char_icon hero_name_nl = <hero_name_nl> chapter_name = <chapter_global>
		<character_texture> = <character_trans_texture>
	endif
	<slot_id> :se_setprops icon_character_texture = <character_texture>
endscript

script quest_map_anim_in_medallion \{slot_id = !q1768515945}
	<time> = 0.2
	soundevent \{event = audio_ui_career_medallion_appear}
	<slot_id> :se_setprops career_meter_scale = (0.0, 0.0) glow_scale = (0.0, 0.0) glow_alpha = 0 time = <time>
	wait <time> seconds
	<slot_id> :se_setprops career_meter_scale = (2.0, 2.0) glow_scale = (1.5, 1.5) glow_alpha = 1 time = <time>
	wait <time> seconds
	<slot_id> :se_setprops career_meter_scale = (1.0, 1.0) glow_scale = (0.0, 0.0) glow_alpha = 0 time = <time>
	wait <time> seconds
endscript

script quest_map_get_slot_id \{chapter_num = !i1768515945}
	if screenelementexists \{id = questmapid}
		questmapid :desc_resolvealias \{name = alias_container}
		formattext checksumname = slot_child_id 'slot%d' d = <chapter_num>
		resolvescreenelementid id = {<resolved_id> child = <slot_child_id>}
		return slot_id = <resolved_id>
	endif
endscript

script ui_quest_map_move \{up = 0}
	questmapid :getsingletag \{map_index}
	questmapid :getsingletag \{linear_progression}
	getarraysize <linear_progression>
	<old_map_index> = <map_index>
	<check_for_unlock> = 0
	if (<up> = 1)
		if (<map_index> + 1 < <array_size>)
			<map_index> = (<map_index> + 1)
			<check_for_unlock> = 1
		endif
	else
		if (<map_index> > 0)
			<map_index> = (<map_index> - 1)
			<check_for_unlock> = 1
		endif
	endif
	quest_map_get_slot_id chapter_num = (<map_index> + 1)
	<slot_id> :se_getprops alpha
	if (<alpha> = 0)
		return
	endif
	if (<check_for_unlock> = 1)
		<chapter_global> = (<linear_progression> [<map_index>])
		quest_progression_get_chapter_tag savegame = <savegame> chapter_global = <chapter_global> param = unlocked
		if (<unlocked> = 1)
			questmapid :settags map_index = <map_index>
			change g_quest_map_index = <map_index>
			quest_map_get_slot_id chapter_num = (<old_map_index> + 1)
			if screenelementexists id = <slot_id>
				<slot_id> :se_getprops
				if (<type> = descinterface)
					<slot_id> :se_setprops hilight_alpha = 0
					<slot_id> :se_setprops career_meter_scale = (1.0, 1.0)
					if <slot_id> :desc_resolvealias name = alias_hilight param = hilight_id
						<hilight_id> :obj_spawnscript quest_map_kill_hilight_anim
						<hilight_id> :obj_killspawnedscript name = quest_map_hilight_anim
					else
						scriptassert \{'dschorn1'}
					endif
					if <slot_id> :desc_resolvealias name = alias_hilight_glow param = hilight_glow_id
						<hilight_glow_id> :obj_spawnscript quest_map_kill_hilight_anim
						<hilight_glow_id> :obj_killspawnedscript name = quest_map_hilight_anim
					else
						scriptassert \{'dschorn1'}
					endif
					quest_map_get_slot_id chapter_num = (<map_index> + 1)
					<slot_id> :se_setprops hilight_alpha = 1
					<slot_id> :se_setprops hilight_glow_alpha = 1
					<slot_id> :se_setprops career_meter_scale = (1.5, 1.5)
					if <slot_id> :desc_resolvealias name = alias_hilight param = hilight_id
						<hilight_id> :obj_spawnscript quest_map_hilight_anim
					else
						scriptassert \{'dschorn1'}
					endif
					if <slot_id> :desc_resolvealias name = alias_hilight_glow param = hilight_glow_id
						<hilight_glow_id> :obj_spawnscript quest_map_hilight_anim
					else
						scriptassert \{'dschorn1'}
					endif
				endif
			else
				printf channel = jleckner 'slot_id - %d, map_index - %i does not EXIST' d = <slot_id> i = (<old_map_index> + 1)
			endif
			for_each_quest_progression_unlock \{callback = ui_quest_map_focus}
			if (<up> = 1)
				ui_sfx \{menustate = career_map
					uitype = scrollup}
			else
				ui_sfx \{menustate = career_map
					uitype = scrolldown}
			endif
		endif
	endif
endscript

script ui_quest_map_focus \{chapter_global = !q1768515945
		chapter_num = !i1768515945}
	if (<chapter_num> != $g_quest_map_index + 1)
		return
	endif
	<completed_text> = qs(0xd230996d)
	max_stars = ($<chapter_global>.stars_for_encore)
	domination_unlocked = 0
	if quest_progression_check_domination_unlocked savegame = ($primary_controller)
		domination_unlocked = 1
	endif
	special_case_info_text = none
	if (<domination_unlocked> = 0 && <chapter_global> != quest_chapter_demigod)
		quest_progression_get_number_of_stars_earned savegame = ($primary_controller) chapter_global = <chapter_global>
		if (<stars_earned> >= $<chapter_global>.stars_for_encore)
			quest_progression_get_chapter_tag savegame = ($primary_controller) chapter_global = <chapter_global> param = completed
			if (<completed> = 0 && <chapter_global> != quest_chapter_midboss && <chapter_global> != quest_chapter_demigod && <chapter_global> != quest_chapter_finale)
				<completed_text> = qs(0xab08bfb0)
				special_case_info_text = pass_encore
			elseif (<chapter_global> != quest_chapter_midboss && <chapter_global> != quest_chapter_demigod && <chapter_global> != quest_chapter_finale)
				<completed_text> = qs(0xfcc1ea3b)
				<stars_earned> = <max_stars>
				special_case_info_text = complete
			endif
		endif
	else
		if quest_progression_check_chapter_dominated savegame = ($primary_controller) chapter = <chapter_global>
			completed_text = qs(0xb12cf33d)
			max_stars = ($<chapter_global>.stars_for_reward)
		else
			completed_text = qs(0x6c9c9533)
			max_stars = ($<chapter_global>.stars_for_reward)
		endif
	endif
	quest_progression_get_number_of_stars_earned savegame = ($primary_controller) chapter_global = <chapter_global>
	if (<stars_earned> > <max_stars>)
		stars_earned = <max_stars>
	endif
	formattext textname = stars_number_text qs(0x9f9d1ef2) a = <stars_earned> b = <max_stars>
	<hero_info> = ($<chapter_global>.hero_info)
	if quest_progression_check_domination_unlocked savegame = ($primary_controller)
		hero_name = ($<hero_info>.character_transformation_fullname)
		power_name = (($demigod_hero_info).character_power2)
	else
		quest_progression_get_chapter_tag savegame = ($primary_controller) chapter_global = <chapter_global> param = completed
		if (<completed> = 1)
			hero_name = ($<hero_info>.character_transformation_fullname)
			power_name = ($<hero_info>.character_power2)
		else
			hero_name = ($<hero_info>.character_fullname)
			power_name = ($<hero_info>.character_power)
		endif
	endif
	questmapid :se_setprops {
		character_name_text = <hero_name>
		power_name_text = <power_name>
		stars_number_text = <stars_number_text>
		stars_completed_text = <completed_text>
		character_description_alpha = 1
		instruction_alpha = 1
		time = 0.1
	}
	if (<chapter_global> = quest_chapter_midboss || <chapter_global> = quest_chapter_finale)
		questmapid :se_setprops \{stars_to_complete_alpha = 0.0
			character_name_pos = (-5.0, -16.0)
			power_name_pos = (48.0, 90.0)}
	else
		questmapid :se_setprops \{stars_to_complete_alpha = 1.0
			character_name_pos = (-5.0, -29.0)
			character_name_scale = 1.0
			power_name_pos = (48.0, 70.0)
			power_name_scale = 1.0
			rush_smoke_scale = 1.0
			final_smoke_scale = 1.0
			demigod_smoke_scale = 1.0}
	endif
	if (<special_case_info_text> = complete)
		questmapid :se_setprops \{stars_to_complete_alpha = 0.0
			chapter_complete_alpha = 1.0
			chapter_complete_text = qs(0x015c3862)}
	elseif (<special_case_info_text> = pass_encore)
		questmapid :se_setprops \{stars_to_complete_alpha = 0.0
			chapter_complete_alpha = 1.0
			chapter_complete_text = qs(0x84c9bc8d)}
	else
		questmapid :se_setprops \{chapter_complete_alpha = 0.0}
	endif
	if (<chapter_global> = quest_chapter_midboss)
		questmapid :se_setprops \{rush_smoke_scale = 1.7}
	elseif (<chapter_global> = quest_chapter_finale)
		questmapid :se_setprops \{final_smoke_scale = 1.7
			demigod_smoke_scale = 1.0}
	elseif (<chapter_global> = quest_chapter_demigod)
		questmapid :se_setprops \{demigod_smoke_scale = 1.5
			final_smoke_scale = 1.0}
	endif
	if console_is_net_career_client
		if ((<chapter_global> = quest_chapter_midboss) || (<chapter_global> = quest_chapter_finale))
			clean_up_user_control_helpers
			add_user_control_helper \{text = qs(0xaf4d5dd2)
				button = red}
			add_user_control_helper \{text = qs(0xa83061c6)
				button = blue}
		else
			quest_map_add_helpers
		endif
	endif
endscript

script ui_quest_map_choose \{device_num = !i1768515945}
	questmapid :getsingletag \{map_index}
	questmapid :getsingletag \{linear_progression}
	getarraysize <linear_progression>
	if (<map_index> < 0 || <map_index> > (<array_size> - 1))
		return
	endif
	<chapter_name> = (<linear_progression> [<map_index>])
	<venue> = ($<chapter_name>.venue)
	change current_level = <venue>
	for_each_quest_progression_unlock \{callback = ui_quest_map_fillout_star_count}
	<state> = uistate_quest_map_giglist
	<character_id> = ($<chapter_name>.rocker_id)
	getnumplayersingame \{local}
	getfirstplayer \{local}
	begin
	getplayerinfo <player> controller
	if (<controller> = <device_num>)
		setplayerinfo <player> character_id = <character_id>
		setplayerinfo <player> score_attribute_level = 1
		break
	endif
	getnextplayer player = <player> local
	repeat <num_players>
	change current_chapter = <chapter_name>
	change \{g_quest_recent_unlocked_awards = [
		]}
	if (<chapter_name> = quest_chapter_midboss || <chapter_name> = quest_chapter_finale)
		if console_is_net_career_client
			net_career_prompt_client_no_continue
		elseif (<chapter_name> = quest_chapter_midboss)
			ui_quest_map_choose_rush_set
		elseif (<chapter_name> = quest_chapter_finale)
			hide_glitch \{num_frames = 8}
			ui_quest_map_choose_final_battle chapter_name = <chapter_name>
		endif
	else
		generic_event_choose state = <state> data = {chapter_name = <chapter_name>}
	endif
endscript

script ui_quest_map_fillout_star_count \{chapter_global = !q1768515945
		chapter_num = !i1768515945}
	quest_progression_get_number_of_stars_earned savegame = ($primary_controller) chapter_global = <chapter_global>
	setarrayelement arrayname = g_quest_map_stars globalarray index = (<chapter_num> - 1) newvalue = <stars_earned>
endscript

script ui_quest_get_vo_array \{chapter_name = !q1768515945}
	<outro_vo_strings> = []
	quest_progression_get_number_of_completed_chapters savegame = ($primary_controller)
	if (<number_of_unlocked_chapters> = 1)
		if structurecontains structure = ($<chapter_name>) alt_outro_vo
			addarrayelement array = <outro_vo_strings> element = ($<chapter_name>.alt_outro_vo)
			<outro_vo_strings> = <array>
			addarrayelement array = <outro_vo_strings> element = 'Map_Unlock_2nd_Tier'
			<outro_vo_strings> = <array>
		endif
	else
		addarrayelement array = <outro_vo_strings> element = ($<chapter_name>.outro_vo)
		<outro_vo_strings> = <array>
		if (<number_of_unlocked_chapters> = 4)
			addarrayelement array = <outro_vo_strings> element = 'Map_Unlock_Rush'
		elseif (<number_of_unlocked_chapters> = 9)
			addarrayelement array = <outro_vo_strings> element = 'Map_FB_Intro'
		elseif (<number_of_unlocked_chapters> = 10)
			addarrayelement array = <outro_vo_strings> element = 'Map_Unlock_Demigod'
		elseif (<number_of_unlocked_chapters> = 11)
			addarrayelement array = <outro_vo_strings> element = 'Map_FB_Outro'
		endif
		<outro_vo_strings> = <array>
	endif
	recent_unlock_data = ($g_quest_recent_unlocked_awards)
	getarraysize <recent_unlock_data>
	if (<array_size> > 0)
		reward_check_counter = 0
		begin
		reward_struct = (<recent_unlock_data> [<reward_check_counter>])
		if structurecontains structure = <reward_struct> reward_when
			if (<reward_struct>.reward_when = chapter_dominated)
				outro_vo_strings = []
				break
			endif
		endif
		reward_check_counter = (<reward_check_counter> + 1)
		repeat <array_size>
	endif
	return vo_array = <outro_vo_strings>
endscript
debug_quest_map_view_all_animations = 0

script ui_quest_map_debug_beat \{dominate = 0
		beat_encore = 0
		debugging_from_map = 1}
	if (<debugging_from_map> = 1)
		questmapid :getsingletag \{map_index}
		questmapid :getsingletag \{linear_progression}
		<chapter_name> = (<linear_progression> [<map_index>])
	elseif NOT gotparam \{chapter_name}
		return
	endif
	change \{g_quest_recent_unlocked_awards = [
		]}
	songlist = ($<chapter_name>.songs)
	song_idx = 0
	getarraysize <songlist>
	encore_song = (<songlist> [<array_size> -1])
	begin
	song = (<songlist> [<song_idx>])
	if (<song> = <encore_song> && <dominate> = 0 && <beat_encore> = 0)
		break
	endif
	ui_quest_map_giglist_debug_beat chosen_song_name = <song> chapter_global = <chapter_name> refresh_menu = 0 dominate = <dominate>
	<song_idx> = (<song_idx> + 1)
	repeat <array_size>
	set_chapter_venue_intro_flags level = ($<chapter_name>.venue) value = 1
	if (<debugging_from_map> = 0)
		return
	endif
	if ($debug_quest_map_view_all_animations = 0)
		quest_progression_get_number_of_stars_earned chapter_global = <chapter_name> savegame = ($primary_controller)
		setarrayelement arrayname = g_quest_map_state globalarray index = (<map_index>) newvalue = 1
		setarrayelement arrayname = g_quest_map_stars globalarray index = (<map_index>) newvalue = <stars_earned>
	endif
	ui_quest_get_vo_array chapter_name = <chapter_name>
	getarraysize <vo_array>
	play_outro_vo = 0
	if (<array_size> > 0)
		play_outro_vo = 1
	endif
	ui_event event = menu_refresh data = {play_outro_vo = <play_outro_vo> outro_vo_strings = <vo_array>}
endscript

script quest_map_players 
	if screenelementexists \{id = questmapid}
		if questmapid :desc_resolvealias \{name = alias_pu_cont_parent}
			audio_ui_band_lobby_sfx_logic player_num = <player> choose = 1
			getfirstplayer \{local}
			begin
			getplayerinfo <player> controller
			if (<controller> = <device_num>)
				break
			endif
			getnextplayer player = <player> local
			repeat
			launchevent \{type = unfocus
				target = questmapid}
			band_lobby_create_popup_menu {
				menu = playerslist
				player = <player>
				container = <resolved_id>
				parent = questmapid
			}
		endif
	endif
endscript

script quest_calculate_career_progress \{map_id = questmapid
		savegame = 0}
	<map_id> :settags {
		current_total_percentage = 0
	}
	for_each_quest_progression_unlock {
		callback = quest_sum_chapter_percentages
		params = {map_id = <map_id> savegame = <savegame>}
	}
	<map_id> :getsingletag current_total_percentage
	return career_complete_percentage = <current_total_percentage>
endscript

script quest_sum_chapter_percentages \{map_id = !q1768515945
		chapter_global = !q1768515945
		savegame = !i1768515945}
	<map_id> :getsingletag current_total_percentage
	quest_progression_get_chapter_tag savegame = ($primary_controller) chapter_global = <chapter_global> param = completed
	quest_progression_get_number_of_stars_earned savegame = ($primary_controller) chapter_global = <chapter_global>
	if (<completed> = 1)
		if (<chapter_global> = quest_chapter_finale)
			current_total_percentage = (<current_total_percentage> + $g_final_battle_percentage)
		elseif (<chapter_global> = quest_chapter_midboss)
			current_total_percentage = (<current_total_percentage> + $g_rush_percentage)
		elseif (<chapter_global> = quest_chapter_demigod)
			if (<stars_earned> >= ($<chapter_global>.stars_for_reward))
				current_total_percentage = (<current_total_percentage> + $g_demigod_percentage)
			endif
		else
			current_total_percentage = (<current_total_percentage> + $g_chapter_completed_percentage)
			if (<stars_earned> >= ($<chapter_global>.stars_for_reward))
				current_total_percentage = (<current_total_percentage> + $g_chapter_dominated_percentage)
			endif
		endif
	endif
	<map_id> :settags {
		current_total_percentage = <current_total_percentage>
	}
endscript

script quest_sum_chapter_domination_stars \{map_id = !q1768515945
		chapter_global = !q1768515945
		savegame = !i1768515945}
	<map_id> :getsingletag total_domination_stars
	<map_id> :getsingletag current_domination_stars
	<map_id> :getsingletag total_special_chapter_percentage
	<map_id> :getsingletag current_special_chapter_percentage
	chapter_songs = ($<chapter_global>.songs)
	getarraysize <chapter_songs> param = num_songs
	if (<num_songs> < 1)
		return
	endif
	boss_chapter = 0
	song_percentage_value = 0
	if structurecontains structure = ($<chapter_global>) song_percentage_value
		boss_chapter = 1
		song_percentage_value = ($<chapter_global>.song_percentage_value)
	endif
	if (<boss_chapter> = 0)
		<map_id> :settags {
			total_domination_stars = (<total_domination_stars> + ($<chapter_global>.stars_for_reward))
		}
	elseif (<boss_chapter> = 1)
		<map_id> :settags {
			total_special_chapter_percentage = (<total_special_chapter_percentage> + (<song_percentage_value> * <num_songs>))
		}
	endif
	earned_stars = 0
	earned_percentage = 0
	song_index = 0
	begin
	format_career_song_gigtag chapter_name = ($<chapter_global>.name) song = (<chapter_songs> [<song_index>])
	if console_is_net_career_client
		stars = ($g_net_career_progression.<song_gigtag>.stars)
	else
		getglobaltags savegame = <savegame> <song_gigtag> param = stars
	endif
	if (<boss_chapter> = 0)
		earned_stars = (<earned_stars> + <stars>)
	elseif (<boss_chapter> = 1 && <stars> > 0)
		earned_percentage = (<earned_percentage> + <song_percentage_value>)
	endif
	song_index = (<song_index> + 1)
	repeat <num_songs>
	<map_id> :settags {
		current_domination_stars = (<current_domination_stars> + <earned_stars>)
	}
	<map_id> :settags {
		current_special_chapter_percentage = (<current_special_chapter_percentage> + <earned_percentage>)
	}
endscript

script ui_quest_map_back 
	if innetgame
		if ishost
			sendstructure \{callback = net_career_back_to_lobby
				data_to_send = {
					none
				}}
			net_career_back_to_lobby
		endif
	else
		generic_event_back
	endif
endscript

script 0xc5436ade \{chapter_name = !q1768515945}
	change \{g_quest_recent_unlocked_awards = [
		]}
	quest_progression_set_chapter_tags savegame = ($primary_controller) chapter_global = <chapter_name> params = {
		has_been_played = 0
		started = 0
		encore_unlocked = 0
		completed = 0
	}
	setglobaltags savegame = ($primary_controller) career_progression_tags params = {quest_map_first_time_setup = 0} progression = true
	setglobaltags savegame = ($primary_controller) career_progression_tags params = {career_first_time_setup = 0} progression = true
	songlist = ($<chapter_name>.songs)
	song_idx = 0
	getarraysize <songlist>
	encore_song = (<songlist> [<array_size> -1])
	begin
	song = (<songlist> [<song_idx>])
	0x3a1faadd = ($<chapter_name>.name)
	format_career_song_gigtag chapter_name = <0x3a1faadd> song = <song>
	setglobaltags savegame = ($primary_controller) <song_gigtag> params = {stars = 0} progression = true
	<song_idx> = (<song_idx> + 1)
	repeat <array_size>
	set_chapter_venue_intro_flags level = ($<chapter_name>.venue) value = 0
	get_savegame_from_controller controller = ($primary_controller)
	reset_progression_atoms savegame = <savegame> async = 0 force_update = 1
endscript
