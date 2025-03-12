g_chapter_encore_anim_flag = 0

script ui_init_quest_map_giglist 
endscript

script ui_create_quest_map_giglist \{chapter_name = !q1768515945
		net_play_song = 0}
	if scriptexists \{audio_crowd_play_swells_during_stats_screen}
		killspawnedscript \{name = audio_crowd_play_swells_during_stats_screen}
	endif
	if issoundeventplaying \{surge_during_stats_screen}
		stopsoundevent \{surge_during_stats_screen
			fade_time = 1.5
			fade_type = linear}
	endif
	if ($g_kiosk_demo = 1)
		change \{g_chapter_encore_anim_flag = 0}
	endif
	spawnscriptnow \{audio_crowd_silence_front_end}
	change \{rich_presence_context = presence_career}
	audio_ui_menu_music_off
	<hero_info> = ($<chapter_name>.hero_info)
	if quest_progression_check_domination_unlocked savegame = ($primary_controller)
		character_name_text = ($<hero_info>.character_transformation_fullname)
		power_type_text = (($demigod_hero_info).character_power2)
		power_description_text = (($demigod_hero_info).power_desc2)
	else
		quest_progression_get_chapter_tag savegame = ($primary_controller) chapter_global = <chapter_name> param = completed
		if (<completed> = 1 || $g_chapter_encore_anim_flag = 1)
			character_name_text = ($<hero_info>.character_transformation_fullname)
			power_description_text = ($<hero_info>.power_desc2)
			power_type_text = ($<hero_info>.character_power2)
		else
			character_name_text = ($<hero_info>.character_fullname)
			quest_progression_get_number_of_stars_earned savegame = ($primary_controller) chapter_global = <chapter_name>
			power_description_text = ($<hero_info>.power_desc1)
			power_type_text = ($<hero_info>.character_power)
		endif
	endif
	hero_name_nl = ($<hero_info>.name_nl)
	getplayerinfo \{$g_net_leader_player_num
		gamertag}
	gamertag = ($<gamertag>)
	if NOT innetgame
		gamertag = qs(0x0accda1e)
	endif
	ui_quest_get_giglist_bg hero_name_nl = <hero_name_nl> chapter_global = <chapter_name>
	createscreenelement {
		parent = root_window
		id = questmapgiglistid
		type = descinterface
		desc = 'career_gig_select'
		power_frame_pos = (-540.0, 30.0)
		power_frame_alpha = 0.0
		song_frame_pos = (200.0, 65.0)
		song_frame_alpha = 0.0
		meter_transform_scale = (0.95, 0.95)
		meter_transform_alpha = 0.0
		scrollbar_alpha = 0
		career_gig_select_leader_text = <gamertag>
		character_name_text = <character_name_text>
		power_description_text = <power_description_text>
		power_type_text = <power_type_text>
		background_texture = <bg_texture>
		tags = {anim_in_finished = 0}
	}
	questmapgiglistid :desc_resolvealias \{name = alias_songlist_menu
		param = songlist_menu}
	<songlist_menu> :se_setprops {
		event_handlers = [
			{pad_back ui_quest_giglist_back}
			{pad_back ui_sfx params = {menustate = career_map uitype = back}}
			{pad_up ui_quest_map_pad_up}
			{pad_down ui_quest_map_pad_down}
		]
		exclusive_device = ($primary_controller)
	}
	questmapgiglistid :obj_spawnscript \{ui_quest_map_giglist_anim_in}
	if questmapgiglistid :desc_resolvealias \{name = alias_leader_glow
			param = leader_glow_id}
		<leader_glow_id> :obj_spawnscriptnow ui_band_lobby_leader_pulse
	else
		scriptassert \{'dschorn1'}
	endif
	if innetgame
		net_career_setup_ui_stream {
			parent = questmapgiglistid
			this_chapter_name = <chapter_name>
			net_play_song = <net_play_song>
		}
	else
		questmapgiglistid :se_setprops \{net_dialog_alpha = 0.0}
	endif
	<num_vocal_players> = 0
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <player> part
		if (<part> = vocals)
			<num_vocal_players> = (<num_vocal_players> + 1)
		endif
		getnextplayer player = <player>
		repeat <num_players>
	endif
	getarraysize ($<chapter_name>.songs)
	<song_index> = 0
	<num_songs_added> = 0
	<stars_earned> = 0
	begin
	<song_name> = ($<chapter_name>.songs [<song_index>])
	get_song_title song = <song_name>
	get_song_artist song = <song_name>
	format_career_song_gigtag chapter_name = ($<chapter_name>.name) song = <song_name>
	if console_is_net_career_client
		<stars> = ($g_net_career_progression.<song_gigtag>.stars)
	else
		getglobaltags savegame = ($primary_controller) <song_gigtag> param = stars
	endif
	<add_song> = 1
	<is_encore_song> = 0
	if (<song_name> = $<chapter_name>.encore && <chapter_name> != quest_chapter_demigod)
		quest_progression_get_chapter_tag savegame = ($primary_controller) chapter_global = <chapter_name> param = encore_unlocked
		if (<encore_unlocked> = 0)
			<add_song> = 0
		endif
		<is_encore_song> = 1
	endif
	if (<add_song> = 1)
		formattext textname = star_number_text qs(0x0bc409e2) a = <stars>
		<event_handlers> = [
			{focus ui_quest_map_giglist_focus params = {song = <song_name> song_num = (<song_index> + 1) total_songs = <array_size>}}
			{unfocus ui_quest_map_giglist_unfocus}
			{pad_choose ui_quest_map_giglist_choose params = {song_name = <song_name> chapter_name = <chapter_name>}}
			{pad_choose ui_sfx params = {menustate = career_map uitype = select}}
		]
		if ininternetmode
			if NOT ishost
				<event_handlers> = [
					{focus ui_quest_map_giglist_focus params = {song = <song_name> song_num = (<song_index> + 1) total_songs = <array_size>}}
					{unfocus ui_quest_map_giglist_unfocus}
					{pad_choose ui_quest_map_client_attempt_giglist_choose params = {song_name = <song_name> chapter_name = <chapter_name>}}
				]
			endif
		endif
		not_focusable = 0
		quest_progression_get_number_of_stars_earned savegame = ($primary_controller) chapter_global = <chapter_name>
		quest_progression_get_chapter_tag savegame = ($primary_controller) chapter_global = <chapter_name> param = completed
		if (<stars_earned> >= $<chapter_name>.stars_for_encore && <completed> = 0)
			not_focusable = 1
			if (<is_encore_song> = 1)
				not_focusable = 0
			endif
		endif
		<focus_params> = {}
		if (<num_vocal_players> = <num_players>)
			get_song_difficulty_ratings song = <song_name>
			if (<vocals_difficulty_rating> = 0)
				<focus_params> = {not_focusable song_rgba = grey_dk artist_rgba = grey_dk}
			elseif (<not_focusable> = 1)
				<focus_params> = {not_focusable song_rgba = grey_dk artist_rgba = grey_dk}
			endif
		elseif (<not_focusable> = 1)
			<focus_params> = {not_focusable song_rgba = grey_dk artist_rgba = grey_dk}
		endif
		createscreenelement {
			parent = <songlist_menu>
			type = descinterface
			desc = 'career_gig_select_item'
			song_text = <song_title>
			artist_text = <song_artist>
			star_number_text = <star_number_text>
			highlight_bar_alpha = 0
			dims = (600.0, 86.0)
			<focus_params>
			event_handlers = <event_handlers>
		}
		if (<is_encore_song> = 0)
			<id> :desc_resolvealias name = alias_song_list
			resolvescreenelementid id = {<resolved_id> child = 0}
			destroyscreenelement id = <resolved_id>
		endif
		<num_songs_added> = (<num_songs_added> + 1)
		<stars_earned> = (<stars_earned> + <stars>)
		if NOT retailbuild
			<id> :se_setprops event_handlers = [{pad_r1 ui_quest_map_giglist_debug_beat params = {chosen_song_name = <song_name> chapter_global = <chapter_name> refresh_menu = 1}}]
			<id> :se_setprops event_handlers = [{pad_l1 ui_quest_map_giglist_debug_beat params = {chosen_song_name = <song_name> chapter_global = <chapter_name> refresh_menu = 1 dominate = 1}}]
		endif
	endif
	<song_index> = (<song_index> + 1)
	repeat <array_size>
	quest_progression_get_number_of_stars_earned savegame = ($primary_controller) chapter_global = <chapter_name>
	<stars_needed_for_transform> = ($<chapter_name>.stars_for_encore)
	if NOT quest_progression_check_domination_unlocked savegame = ($primary_controller)
		if (<stars_earned> < <stars_needed_for_transform>)
			<star_diff> = (<stars_needed_for_transform> - <stars_earned>)
			if (<star_diff> = 1)
				formattext textname = star_amount_needed_text qs(0xc2796c07) d = <star_diff>
			else
				formattext textname = star_amount_needed_text qs(0x0f5753f8) d = <star_diff>
			endif
		else
			quest_progression_get_chapter_tag savegame = ($primary_controller) chapter_global = <chapter_name> param = completed
			if (<completed> = 0)
				star_amount_needed_text = qs(0x08f1b580)
			else
				star_amount_needed_text = qs(0xde6df04e)
			endif
		endif
	else
		<stars_needed_for_reward> = ($<chapter_name>.stars_for_reward)
		<star_diff> = (<stars_needed_for_reward> - <stars_earned>)
		if (<star_diff> <= 0)
			<star_amount_needed_text> = qs(0x77d6579b)
		else
			if (<star_diff> = 1)
				formattext textname = star_amount_needed_text qs(0x809e4f33) d = <star_diff>
			else
				formattext textname = star_amount_needed_text qs(0x809e4f33) d = <star_diff>
			endif
		endif
	endif
	questmapgiglistid :se_setprops tags = {stars_earned = <stars_earned> stars_needed = <stars_needed_for_transform>} stars_needed_text_text = <star_amount_needed_text>
	<songlist_menu> :se_setprops tags = {max_items = <num_songs_added>}
	questmapgiglistid :desc_resolvealias \{name = alias_generic_scrollbar_wgt}
	generic_scrollbar_wgt_initialize id = <resolved_id>
	generic_scrollbar_wgt_set_resolution id = <resolved_id> num_elements = <num_songs_added>
	quest_get_character_desc_text savegame = ($primary_controller) chapter_name = <chapter_name>
	questmapgiglistid :se_setprops character_description_text = <desc_text>
	if (<chapter_name> = quest_chapter_newmale)
		<hero_name_nl> = 'dude'
	elseif (<chapter_name> = quest_chapter_newfemale)
		<hero_name_nl> = 'chicka'
	elseif (<chapter_name> = quest_chapter_midboss)
		<hero_name_nl> = 'ax'
	elseif (<chapter_name> = quest_chapter_finale)
		<hero_name_nl> = 'demi'
	elseif (<chapter_name> = quest_chapter_demigod)
		<hero_name_nl> = 'demi'
	endif
	if (<stars_needed_for_transform> = 0)
		percent_done = 1.0
	else
		<percent_done> = (<stars_earned> / (<stars_needed_for_transform> * 1.0))
	endif
	if (<percent_done> >= 1.0)
		<percent_done> = 1.0
		questmapgiglistid :se_setprops \{fx_special_alpha = 1}
		questmapgiglistid :se_setprops \{fx_normal_alpha = 0}
		questmapgiglistid :se_setprops \{power_type_blendmode = brighten}
	endif
	quest_get_char_icon hero_name_nl = ($<hero_info>.name_nl) chapter_name = <chapter_name>
	if quest_progression_check_for_chapter_complete savegame = ($primary_controller) chapter_global = <chapter_name>
		<character_texture> = <character_trans_texture>
	endif
	if ($g_chapter_encore_anim_flag = 1)
		<character_texture> = <character_trans_texture>
	endif
	questmapgiglistid :se_setprops meter_transform_icon_character_texture = <character_texture>
	questmapgiglistid :desc_resolvealias \{name = alias_description_window
		param = window_parent}
	questmapgiglistid :desc_resolvealias \{name = alias_character_description}
	<resolved_id> :obj_spawnscriptnow ui_quest_map_giglist_scroll_text params = {parent = <window_parent> id = <resolved_id>}
	ui_event_remove_params \{param = keep_ui_for_loading_screen}
	add_gamertag_helper exclusive_device = ($primary_controller)
	if NOT console_is_net_career_client
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green}
	endif
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red}
	if NOT retailbuild
		quest_progression_get_song_stars_for_domination chapter = <chapter_name>
		formattext textname = debug_dominate_stars qs(0x22e904d2) a = <stars_req_per_song>
		add_user_control_helper text = <debug_dominate_stars> button = orange
		quest_progression_get_song_stars_for_encore chapter = <chapter_name>
		formattext textname = debug_encore_stars qs(0x22e904d2) a = <stars_req_per_song>
		add_user_control_helper text = <debug_encore_stars> button = rb
	endif
	apply_blue_flame = 0
	quest_progression_get_chapter_tag savegame = ($primary_controller) chapter_global = <chapter_name> param = encore_unlocked
	quest_progression_get_chapter_tag savegame = ($primary_controller) chapter_global = <chapter_name> param = completed
	if (<encore_unlocked> = 1 && <completed> = 0)
		apply_blue_flame = 1
	endif
	stop_at_blue = 1
	completed = 0
	if quest_progression_check_domination_unlocked savegame = ($primary_controller)
		stop_at_blue = 0
		completed = 1
	endif
	questmapgiglistid :desc_resolvealias \{name = alias_meter_transform}
	song_breakdown_apply_career_medallion_progress {
		song_stars_earned = 0
		current_total_stars = <stars_earned>
		stars_needed_for_transform = ($<chapter_name>.stars_for_encore)
		stars_needed_for_max = ($<chapter_name>.stars_for_reward)
		apply_initial = 1
		desc_id = <resolved_id>
		force_stats_finished_animating = 1
		stop_at_blue = <stop_at_blue>
		encore_completed = <completed>
		apply_blue_flame = <apply_blue_flame>
	}
	begin
	wait \{1
		gameframe}
	questmapgiglistid :getsingletag \{anim_in_finished}
	if (<anim_in_finished> = 1)
		break
	endif
	repeat
	assignalias id = <songlist_menu> alias = current_menu
endscript

script ui_destroy_quest_map_giglist 
	clean_up_user_control_helpers
	songlist_update_song_preview \{song = none}
	if screenelementexists \{id = questmapgiglistid}
		if NOT gotparam \{keep_ui_for_loading_screen}
			destroyscreenelement \{id = questmapgiglistid}
		else
			questmapgiglistid :se_setprops \{loading_text_frame_alpha = 1.0
				stars_next_transform_alpha = 0.0
				career_gig_select_leader_alpha = 0.0
				generic_scrollbar_wgt_alpha = 0.0}
			questmapgiglistid :desc_resolvealias \{name = alias_song_frame
				param = song_frame}
			<song_frame> :die
			questmapgiglistid :desc_resolvealias \{name = alias_generic_scrollbar_wgt
				param = scrollbar_wgt}
			<scrollbar_wgt> :die
		endif
	endif
endscript

script ui_deinit_quest_map_giglist 
	change \{g_chapter_encore_anim_flag = 0}
	audio_ui_menu_music_on
endscript

script ui_quest_map_giglist_anim_in 
	ui_sfx \{menustate = questgiglist
		uitype = animatein}
	se_setprops \{power_frame_pos = (-540.0, 30.0)
		song_frame_pos = (700.0, 65.0)
		power_frame_alpha = 0.0
		song_frame_alpha = 0.0
		meter_transform_scale = (3.0, 3.0)
		meter_transform_alpha = 0.0
		scrollbar_alpha = 0
		time = 0.5
		motion = ease_in}
	wait \{0.5
		seconds}
	se_setprops \{power_frame_pos = (-310.0, 30.0)
		song_frame_pos = (-30.0, 65.0)
		power_frame_alpha = 0.5
		song_frame_alpha = 0.5
		meter_transform_scale = (2.0, 2.0)
		meter_transform_alpha = 0.5
		scrollbar_alpha = 0
		time = 0.25
		motion = ease_out}
	wait \{0.25
		seconds}
	se_setprops \{power_frame_pos = (-340.0, 30.0)
		song_frame_pos = (0.0, 65.0)
		power_frame_alpha = 1
		song_frame_alpha = 1
		meter_transform_scale = (0.95, 0.95)
		meter_transform_alpha = 1
		scrollbar_alpha = 1
		time = 0.15
		motion = ease_in}
	stopsoundevent \{audio_ui_quest_giglist_animate_in
		fade_type = linear
		fade_time = 0.9}
	stopsoundevent \{audio_ui_quest_giglist_animate_in_2
		fade_type = linear
		fade_time = 0.9}
	wait \{0.15
		seconds}
	settags \{anim_in_finished = 1}
endscript

script ui_quest_map_giglist_scroll_text \{parent = !q1768515945
		id = !q1768515945}
	<initial_wait> = 5.0
	wait <initial_wait> seconds
	getscreenelementdims id = <parent>
	<parent_y> = <height>
	getscreenelementdims id = <id>
	<id_y> = <height>
	if (<id_y> <= <parent_y>)
		return
	endif
	<diff> = (<parent_y> - <id_y>)
	getscreenelementposition id = <id>
	<original_pos> = <screenelementpos>
	<scroll_time> = (<diff> * -0.05)
	begin
	<id> :se_setprops pos = (<screenelementpos> + (<diff> * (0.0, 1.0))) time = <scroll_time>
	wait <scroll_time> seconds
	wait <initial_wait> seconds
	<fade_time> = 1.0
	<id> :se_setprops alpha = 0 time = <fade_time>
	wait <fade_time> seconds
	<id> :se_setprops pos = <original_pos>
	<id> :se_setprops alpha = 1 time = <fade_time>
	wait <fade_time> seconds
	wait <initial_wait> seconds
	repeat
endscript

script ui_quest_map_giglist_choose \{song_name = !q1768515945
		chapter_name = !q1768515945}
	if scriptisrunning \{ui_quest_map_giglist_focus}
		return
	endif
	playlist_clear
	chapter_song_name = <song_name>
	songlist_update_song_preview \{song = none}
	quest_progression_get_chapter_tag savegame = ($primary_controller) chapter_global = <chapter_name> param = completed
	quest_progression_get_chapter_tag savegame = ($primary_controller) chapter_global = <chapter_name> param = encore_unlocked
	if (<encore_unlocked> = 1)
		quest_progression_set_player_score_attribute \{level = 2}
	else
		quest_progression_set_player_score_attribute \{level = 1}
	endif
	<set_song> = 1
	encore_anim_flag = ($g_chapter_encore_anim_flag)
	if (<song_name> = $<chapter_name>.encore)
		setglobaltags savegame = ($primary_controller) career_progression_tags params = {encore_ready = 1} progression = true
		format_career_song_gigtag chapter_name = ($<chapter_name>.name) song = <song_name>
		getglobaltags savegame = ($primary_controller) <song_gigtag> param = stars
		if (<stars> = 0 || $g_e3_demo_flow = 1 || $g_kiosk_demo = 1)
			quest_progression_add_transformation_songs chapter_global = <chapter_name>
			<set_song> = 0
		endif
	endif
	if (<set_song> = 1)
		playlist_setcurrentsong song = <chapter_song_name>
	endif
	ui_event_add_params \{keep_ui_for_loading_screen = 1}
	create_empty_loading_screen \{use_ui_element = questmapgiglistid}
	change \{g_quest_recent_unlocked_awards = [
		]}
	if ininternetmode
		questmapgiglistid :obj_killspawnedscript \{name = net_career_host_update}
		net_career_proceed_to_gameplay net_song_name = <chapter_song_name> chapter_name = <chapter_name> encore_anim_flag = <encore_anim_flag>
	else
		generic_event_choose \{state = uistate_play_song}
	endif
endscript

script ui_quest_map_giglist_focus \{song_num = !i1768515945
		total_songs = !i1768515945
		song = !q1768515945}
	obj_getid
	<objid> :se_setprops {
		highlight_bar_alpha = 1
		song_rgba = [249 243 190 255]
		artist_rgba = [249 243 190 255]
	}
	questmapgiglistid :desc_resolvealias \{name = alias_songlist_menu
		param = songlist_menu}
	<songlist_menu> :menu_getselectedindex
	questmapgiglistid :desc_resolvealias \{name = alias_generic_scrollbar_wgt}
	generic_scrollbar_wgt_update_thumb_pos id = <resolved_id> index = <selected_index>
	songlist_update_song_preview song = <song>
endscript

script ui_quest_map_giglist_unfocus 
	obj_getid
	<objid> :se_setprops {
		highlight_bar_alpha = 0
		song_rgba = [206 196 124 255]
		artist_rgba = [174 148 87 255]
	}
endscript

script ui_quest_map_pad_up 
	gettags
	menu_getselectedindex
	if (<selected_index> > 0)
		ui_sfx \{menustate = career_map
			uitype = scrollup}
	endif
endscript

script ui_quest_map_pad_down 
	gettags
	menu_getselectedindex
	if (<selected_index> + 1 < <max_items>)
		ui_sfx \{menustate = career_map
			uitype = scrolldown}
	endif
endscript

script ui_quest_get_giglist_bg \{hero_name_nl = 0x69696969
		chapter_global = !q1768515945
		attempting_encore = 0}
	if (<chapter_global> = quest_chapter_demigod)
		<bg_texture> = gigselect_illo_demigod
	elseif (<chapter_global> = quest_chapter_finale)
		<bg_texture> = gigselect_illo_final_2
	elseif (<chapter_global> = quest_chapter_midboss)
		<bg_texture> = gigselect_illo_guitar
	else
		if console_is_net_career_client
			get_savegame_from_controller controller = ($primary_controller)
		else
			get_savegame_from_player player = ($g_net_leader_player_num)
		endif
		quest_progression_get_chapter_tag savegame = ($primary_controller) chapter_global = <chapter_global> param = completed
		quest_progression_get_number_of_stars_earned savegame = ($primary_controller) chapter_global = <chapter_global>
		if (<completed> = 1 || <attempting_encore> = 1 || $g_chapter_encore_anim_flag = 1)
			formattext checksumname = bg_texture 'gigselect_illo_%h_2' h = <hero_name_nl>
		else
			formattext checksumname = bg_texture 'gigselect_illo_%h' h = <hero_name_nl>
		endif
	endif
	return bg_texture = <bg_texture>
endscript

script ui_quest_giglist_back 
	hide_glitch \{num_frames = 5}
	generic_event_back
endscript

script ui_quest_map_giglist_debug_beat \{chosen_song_name = !q1768515945
		chapter_global = !q1768515945
		refresh_menu = !i1768515945
		dominate = 0}
	<chapter_name> = ($<chapter_global>.name)
	quest_progression_set_chapter_tags savegame = ($primary_controller) chapter_global = <chapter_global> params = {has_been_played = 1 started = 1}
	if (<dominate> = 1)
		quest_progression_get_song_stars_for_domination chapter = <chapter_global>
		stars_awarded = <stars_req_per_song>
	else
		quest_progression_get_song_stars_for_encore chapter = <chapter_global>
		stars_awarded = <stars_req_per_song>
	endif
	format_career_song_gigtag chapter_name = <chapter_name> song = <chosen_song_name>
	setglobaltags savegame = ($primary_controller) <song_gigtag> params = {stars = <stars_awarded>} progression = true
	set_chapter_venue_intro_flags level = ($<chapter_global>.venue) value = 1
	quest_progression_get_chapter_tag savegame = ($primary_controller) chapter_global = <chapter_global> param = completed
	if (<completed> = 0)
		<stars_needed> = ($<chapter_global>.stars_for_encore)
		<total_stars> = 0
		getarraysize ($<chapter_global>.songs)
		<song_index> = 0
		begin
		temp_song_name = ($<chapter_global>.songs [<song_index>])
		format_career_song_gigtag chapter_name = <chapter_name> song = <temp_song_name>
		getglobaltags savegame = ($primary_controller) <song_gigtag> param = stars
		<total_stars> = (<total_stars> + <stars>)
		<song_index> = (<song_index> + 1)
		repeat <array_size>
		if (<total_stars> >= <stars_needed>)
			quest_progression_set_chapter_tags savegame = ($primary_controller) chapter_global = <chapter_global> params = {encore_unlocked = 1}
		endif
	endif
	chapter_songs = ($<chapter_global>.songs)
	getarraysize <chapter_songs>
	encore_song = (<chapter_songs> [<array_size> -1])
	if (<chosen_song_name> = <encore_song>)
		quest_progression_set_chapter_tags savegame = ($primary_controller) chapter_global = <chapter_global> params = {completed = 1}
		updateatoms savegame = ($primary_controller)
	endif
	if (<refresh_menu> = 1)
		ui_event \{event = menu_refresh}
	endif
endscript

script quest_get_character_desc_text \{chapter_name = !q1768515945
		savegame = !i1768515945}
	hero_info = ($<chapter_name>.hero_info)
	quest_progression_get_chapter_tag savegame = <savegame> chapter_global = <chapter_name> param = completed
	if (<completed> = 1 || $g_chapter_encore_anim_flag = 1)
		return desc_text = ($<hero_info>.post_trans_desc)
	else
		return desc_text = ($<hero_info>.pre_trans_desc)
	endif
endscript
