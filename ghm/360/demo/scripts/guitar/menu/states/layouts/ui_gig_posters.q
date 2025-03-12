current_song_info_id = null
ui_gig_posters_skip_helpers = 1

script ui_init_gig_posters 
	cas_destroy_all_characters
endscript

script ui_create_gig_posters 
	killspawnedscript \{name = loading_screen_crowd_swell}
	killspawnedscript \{name = crowd_loading_whistle}
	killspawnedscript \{name = oneshotsbetweensongs}
	killspawnedscript \{name = surgebetweensongs}
	spawnscriptnow \{destroy_setlist_songpreview_monitor}
	if NOT ($game_mode = practice || $game_mode = training)
		spawnscriptnow \{skate8_sfx_backgrounds_new_area
			params = {
				bg_sfx_area = frontend_menu_music
			}}
	endif
	clean_up_user_control_helpers
	get_all_exclusive_devices
	hide_glitch \{num_frames = 3}
	fadetoblack \{on
		alpha = 1.0
		time = 0
		z_priority = 200}
	if ($signin_change_happening = 1)
		return
	endif
	if screenelementexists \{id = generic_menu}
		ui_destroy_singleplayer_character_hub
	endif
	createscreenelement {
		parent = root_window
		id = setlistinterface
		type = descinterface
		desc = 'setlist_b'
		exclusive_device = <exclusive_device>
	}
	spawnscriptnow ui_create_gig_posters_spawned params = <...>
endscript

script ui_create_gig_posters_spawned 
	change \{rich_presence_context = presence_gigboard_and_setlist}
	get_current_band_info
	getglobaltags <band_info>
	tier_global = gh4_career_band_songs
	change \{current_progression_flag = career_band}
	part = band
	check = <career_intro_band_complete>
	if (($current_num_players = 1) && ($is_network_game = 0))
		getplayerinfo \{1
			part}
	endif
	if (<part> = guitar)
		tier_global = gh4_career_guitar_songs
		change \{current_progression_flag = career_guitar}
	elseif (<part> = bass)
		tier_global = gh4_career_bass_songs
		change \{current_progression_flag = career_bass}
	elseif (<part> = drum)
		tier_global = gh4_career_drum_songs
		change \{current_progression_flag = career_drum}
	elseif (<part> = vocals)
		tier_global = gh4_career_vocals_songs
		change \{current_progression_flag = career_vocals}
	endif
	progression_get_total_stars
	if NOT progression_check_intro_complete
		if NOT (<part> = band)
			ui_event_wait \{event = menu_back
				data = {
					state = uistate_select_difficulty
				}}
		else
			ui_event_wait \{event = menu_back
				data = {
					state = uistate_band_difficulty
				}}
		endif
		return
	else
		ui_gig_posters_check_movies_played part = <part>
		if (<movies_played> = 0)
			ui_gig_posters_play_movie \{movie = 'GHM_Movie1'}
			ui_gig_posters_set_movies_played part = <part> value = 1
			if (($signin_change_happening = 1) || ($invite_controller > -1))
				return
			endif
			ui_memcard_autosave_replace \{data = {
					all_active_players = true
				}}
			return
		elseif (<movies_played> = 1)
			ui_gig_posters_play_movie \{movie = 'GHM_Movie2'}
			ui_gig_posters_set_movies_played part = <part> value = 2
			if (($signin_change_happening = 1) || ($invite_controller > -1))
				return
			endif
			save_on_back = 1
		elseif (<movies_played> = 2)
		endif
	endif
	get_progression_globals ($current_progression_flag)
	setlist_prefix = ($<tier_global>.prefix)
	if ($current_progression_flag = career_band)
		getsavegamefromcontroller controller = ($band_mode_current_leader)
	else
		getsavegamefromcontroller controller = ($primary_controller)
	endif
	wait_for_songpreview_monitor
	menu_music_off
	gig_posters_song_focus
	if ($current_num_players = 1)
		update_ingame_controllers controller = <exclusive_device>
	endif
	if setlistinterface :desc_resolvealias \{name = alias_setlist_menu}
		pad_back_script = generic_event_back
		pad_back_params = {}
		if gotparam \{save_on_back}
			pad_back_script = ui_memcard_autosave_replace
			pad_back_params = {data = {all_active_players = true}}
		endif
		assignalias id = <resolved_id> alias = setlist_menu
		setlist_menu :se_setprops {
			event_handlers = [
				{pad_up generic_menu_up_or_down_sound params = {up}}
				{pad_down generic_menu_up_or_down_sound params = {down}}
				{pad_back <pad_back_script> params = <pad_back_params>}
				{focus ui_gig_posters_popups}
			]
			tags = {
				from_top_rocker = <from_top_rocker>
				from_leaderboard = <from_leaderboard>
				for_custom_setlist = 0
				current_section = 1
				last_focused_song = none
				custom_setlist_num_id_1 = null
				custom_setlist_num_id_2 = null
				custom_setlist_num_id_3 = null
				custom_setlist_num_id_4 = null
				custom_setlist_num_id_5 = null
				custom_setlist_num_id_6 = null
				section_breaker_index_1 = 99999
				section_breaker_index_2 = 99999
				section_breaker_index_3 = 99999
			}
		}
	endif
	if gotparam \{next_state}
		setlist_menu :settags next_state = <next_state>
	endif
	setlist_menu :se_setprops \{event_handlers = [
			{
				pad_option
				setlist_jump_down_section
				params = {
					for_custom_setlist = 0
				}
			}
		]}
	createscreenelement \{parent = setlist_menu
		type = descinterface
		desc = 'setlist_b_head_desc'
		auto_dims = false
		dims = (0.0, 300.0)
		just = [
			center
			center
		]
		setlist_b_head_text_text = qs(0xa01b0e62)
		not_focusable}
	menu_index = 1
	last_title_index = 1
	<final_num_songs> = 0
	<current_tier> = 0
	setlist_menu :settags \{highlight = 0}
	setbuttoneventmappings \{block_menu_input}
	i = 1
	begin
	formattext checksumname = tier 'tier%n' n = <i>
	if NOT structurecontains structure = ($<tier_global>) <tier>
		break
	endif
	if structurecontains structure = ($<tier_global>.<tier>) stars
		printf \{qs(0x6cc57012)}
		if (($<tier_global>.<tier>.stars) <= <total_stars>)
			if NOT structurecontains structure = ($<tier_global>.<tier>) debug_gig
				if NOT (<tier> = tier9)
					<current_tier> = <i>
				endif
			endif
			if (<tier> = tier9)
				format_globaltag_song_checksum part = ($<tier_global>.part) song = thethingthat
				getglobaltags <song_checksum> param = unlocked
				if (<unlocked> = 0)
					break
				endif
				if NOT is_song_downloaded \{song_checksum = thatwasjustyourlife}
					break
				endif
			endif
			get_prev_total_songs part = <part> band_info = <band_info> final_num_songs = <final_num_songs>
			if structurecontains structure = ($<tier_global>.<tier>) title
				createscreenelement {
					parent = setlist_menu
					type = descinterface
					desc = 'setlist_b_divider_desc'
					auto_dims = false
					alpha = 0
					dims = (0.0, 50.0)
					setlist_divider_title_text = ($<tier_global>.<tier>.title)
					not_focusable
					tags = {
						tier_index = <i>
					}
				}
				if gotparam \{last_listing_id}
					if ((<final_num_songs> + 1) > <prev_total_songs>)
						printf \{qs(0xa9487201)
							channel = setlist_debug}
						setlist_menu :settags total_songs = <final_num_songs> prev_index = 0
						<last_listing_id> :settags fading_in = 1
						<id> :se_setprops alpha = 1 time = 0.5
						launchevent target = <last_listing_id> type = focus
						soundevent \{event = gh3_star_flyin}
						<id> :se_waitprops
					else
						<id> :se_setprops alpha = 1
					endif
				else
					<id> :se_setprops alpha = 1
				endif
				menu_index = (<menu_index> + 1)
				last_title_index = <menu_index>
			endif
			if structurecontains structure = ($<tier_global>.<tier>) songs
				songs = ($<tier_global>.<tier>.songs)
				getarraysize <songs>
				num_songs = <array_size>
				j = 0
				begin
				song = (<songs> [<j>])
				get_song_title song = <song>
				get_song_artist song = <song>
				ui_gig_posters_get_scores_and_tags song = <song> part = <part> savegame = <savegame>
				getplayerinfo \{1
					double_kick_drum}
				<double_kick_alpha> = 0
				if (<song> != jamsession && <part> = drum && <double_kick_drum> = 1)
					if (($permanent_songlist_props.<song>.double_kick) = 1)
						<double_kick_alpha> = 1
					endif
				endif
				formattext textname = song_text qs(0x90e80fb9) a = <song_artist> t = <song_title>
				format_globaltag_song_checksum part = ($<tier_global>.part) song = <song>
				getglobaltags <song_checksum> param = unlocked
				getglobaltags <song_checksum> param = double_bass_complete
				getglobaltags <song_checksum> param = new_song_info
				if (<tier> = tier9)
					unlocked = 1
				endif
				if (<unlocked> = 0)
					event_handlers = [
						{focus ui_gig_posters_focus params = {for_custom_setlist = 0}}
						{unfocus ui_gig_posters_unfocus}
						{pad_choose ui_gig_posters_play_song params = {song = <song> level = ($<tier_global>.<tier>.level) tier_num = <i>}}
						{pad_square ui_setlist_choose_song_extras params = {song = <song> song_checksum = <song_checksum> completed = <completed> part = <part>}}
						{pad_l1 ui_gig_posters_debug_complete params = {song = <song> song_checksum = <song_checksum>}}
					]
				else
					event_handlers = [
						{focus ui_gig_posters_focus params = {for_custom_setlist = 0}}
						{unfocus ui_gig_posters_unfocus}
						{pad_choose generic_event_choose params = {state = uistate_select_venue data = {song = <song> level = ($<tier_global>.<tier>.level) tier_num = <i>}}}
						{pad_square ui_setlist_choose_song_extras params = {song = <song> song_checksum = <song_checksum> completed = <completed> part = <part>}}
						{pad_l1 ui_gig_posters_debug_complete params = {song = <song> song_checksum = <song_checksum>}}
					]
				endif
				add_listing = 1
				if (<add_listing> = 1)
					createscreenelement {
						parent = setlist_menu
						type = descinterface
						desc = 'setlist_b_listing_desc'
						alpha = 0
						auto_dims = false
						dims = (0.0, 50.0)
						double_kick_alpha = <double_kick_alpha>
						stars_alpha = 1
						event_handlers = <event_handlers>
						tags = {
							custom_setlist_num = 0
							song_title = <song_title>
							song_artist = <song_artist>
							score_text = <score_text>
							song = <song>
							part = <part>
							index = <final_num_songs>
							unlocked = <unlocked>
							new_song_info = <new_song_info>
							beginner_stars = (<stars_tags>.beginner_stars)
							easy_stars = (<stars_tags>.easy_stars)
							medium_stars = (<stars_tags>.medium_stars)
							hard_stars = (<stars_tags>.hard_stars)
							expert_stars = (<stars_tags>.expert_stars)
							beginner_percent100 = (<stars_tags>.beginner_percent100)
							easy_percent100 = (<stars_tags>.easy_percent100)
							medium_percent100 = (<stars_tags>.medium_percent100)
							hard_percent100 = (<stars_tags>.hard_percent100)
							expert_percent100 = (<stars_tags>.expert_percent100)
							double_bass_complete = <double_bass_complete>
							icon_difficulty_texture = (<difficulty_tags>.icon_difficulty_texture)
							icon_difficulty_alpha = (<difficulty_tags>.icon_difficulty_alpha)
							highest_stars_difficulty_text = (<difficulty_tags>.highest_stars_difficulty_text)
							highest_stars_difficulty_index = (<difficulty_tags>.highest_stars_difficulty_index)
						}
						just = [center center]
						listing_text = <song_text>
						listing_pos = (-20.0, 0.0)
					}
					if <id> :desc_resolvealias name = alias_listing
						getscreenelementchildren id = <resolved_id>
						getscreenelementposition id = <resolved_id> summed
						<text_pos> = <screenelementpos>
						getscreenelementprops id = (<children> [0]) force_update
						<width> = (<dims>.(1.0, 0.0) * <scale>.(1.0, 0.0))
						<double_kick_offset> = ((1.0, 0.0) * ((<width> / 2) + 42) + (0.0, 1.0))
						<new_pos> = (<text_pos> - <double_kick_offset>)
						<id> :se_setprops double_kick_pos = <new_pos>
						<new_pos> = (<text_pos> + <double_kick_offset> - (45.0, 3.0))
						<id> :se_setprops stars_pos = <new_pos>
					endif
					percent_diffs = ['beginner' 'easy' 'medium' 'hard' 'expert']
					percent_aliases = [
						alias_setlist_b_stars_beginner
						alias_setlist_b_stars_easy
						alias_setlist_b_stars_medium
						alias_setlist_b_stars_hard
						alias_setlist_b_stars_expert
					]
					star_diffs = [
						beginner_stars
						easy_stars
						medium_stars
						hard_stars
						expert_stars
					]
					formattext checksumname = percent100 '%s_percent100' s = (<percent_diffs> [(<difficulty_tags>.highest_stars_difficulty_index)])
					if <id> :desc_resolvealias name = alias_stars
						percent_param = (<stars_tags>.<percent100>)
						if gotparam \{percent_param}
							if (<percent_param> = 1)
								<id> :se_setprops star_rgba = [255 255 255 175]
							endif
						endif
						getscreenelementchildren id = <resolved_id>
						num_stars = (<stars_tags>.(<star_diffs> [(<difficulty_tags>.highest_stars_difficulty_index)]))
						if (<num_stars> = 0)
							<resolved_id> :se_setprops alpha = 0
						else
							getarraysize <children>
							stars_left = <array_size>
							if (<num_stars> < 5 && <stars_left> = 5)
								if screenelementexists id = (<children> [4])
									destroyscreenelement id = (<children> [4])
									stars_left = (<stars_left> - 1)
								endif
							endif
							if (<num_stars> < 4 && <stars_left> = 4)
								if screenelementexists id = (<children> [3])
									destroyscreenelement id = (<children> [3])
								endif
							endif
						endif
					endif
				endif
				<final_num_songs> = (<final_num_songs> + 1)
				menu_index = (<menu_index> + 1)
				if gotparam \{last_listing_id}
					launchevent target = <last_listing_id> type = unfocus
				endif
				last_listing_id = <id>
				if (<final_num_songs> > <prev_total_songs>)
					setlist_menu :settags total_songs = <final_num_songs> prev_index = 0
					<id> :se_setprops alpha = 1 time = 0.25
					launchevent target = <id> type = focus
					soundevent \{event = gh3_star_flyin}
					<id> :se_waitprops
					<id> :settags fading_in = 1
				else
					<id> :se_setprops alpha = 1
				endif
				j = (<j> + 1)
				repeat <num_songs>
			endif
		endif
	endif
	i = (<i> + 1)
	repeat
	getglobaltags <band_info> params = {first_career_setlist}
	if (<first_career_setlist> = 0)
		setbuttoneventmappings \{unblock_menu_input}
	endif
	launchevent target = <last_listing_id> type = unfocus
	setlist_menu :settags \{highlight = 1}
	set_prev_total_songs part = <part> band_info = <band_info> final_num_songs = <final_num_songs>
	setlist_menu :settags total_songs = <final_num_songs> prev_index = 0
	spawnscriptnow \{destroy_setlist_songpreview_monitor}
	if ($is_network_game = 0)
		spawnscriptnow \{setlist_songpreview_monitor}
	endif
	formattext checksumname = next_tier 'tier%n' n = (<current_tier> + 1)
	if NOT (<next_tier> = tier9)
		if structurecontains structure = ($<tier_global>) <next_tier>
			<stars_needed> = ($<tier_global>.<next_tier>.stars)
			if (<stars_needed> > 1)
				formattext textname = stars_to_next_tier qs(0x709feb4d) n = (<stars_needed> - <total_stars>)
			else
				formattext textname = stars_to_next_tier qs(0xfb230449) n = (<stars_needed> - <total_stars>)
			endif
			createscreenelement {
				parent = setlist_menu
				type = descinterface
				desc = 'setlist_b_divider_desc'
				auto_dims = false
				dims = (0.0, 50.0)
				setlist_divider_title_text = <stars_to_next_tier>
				setlist_list_divider_l_alpha = 1
				setlist_list_divider_r_alpha = 1
				not_focusable
			}
		endif
	endif
	<max_songs> = 0
	<i> = 1
	begin
	formattext checksumname = tier 'tier%n' n = <i>
	if (<tier> = tier9)
		if NOT is_song_downloaded \{song_checksum = thatwasjustyourlife}
			break
		endif
	endif
	if structurecontains structure = ($<tier_global>.<tier>) songs
		getarraysize ($<tier_global>.<tier>.songs)
		<max_songs> = (<max_songs> + <array_size>)
	endif
	<i> = (<i> + 1)
	repeat (($<tier_global>).num_tiers)
	formattext checksumname = final_tier 'tier%n' n = (($<tier_global>).num_tiers)
	if (<total_stars> >= ($<tier_global>.<final_tier>.stars))
		formattext textname = number_of_stars_text qs(0xb3fffe17) n = <total_stars> m = (<max_songs> * 5)
		setlistinterface :se_setprops number_of_stars_text = <number_of_stars_text>
		setlistinterface :se_setprops \{scribble_lower_alpha = 1}
	else
		setlistinterface :se_setprops \{scribble_lower_alpha = 0}
	endif
	menu_finish
	if ($enable_button_cheats = 1)
		add_user_control_helper \{text = qs(0x91fff11f)
			button = lb
			z = 100000}
	endif
	if (<final_num_songs> > <prev_total_songs>)
		spawnscriptnow ui_gig_posters_wait_and_focus params = {index = <selected_index>}
	else
		launchevent target = setlist_menu type = focus data = {child_index = <selected_index>}
	endif
	destroy_loading_screen \{force = 1}
	fadetoblack \{off
		time = 0}
	broadcastevent \{type = setlist_created}
endscript

script ui_gig_posters_wait_and_focus 
	wait \{2
		second}
	launchevent target = setlist_menu type = focus data = {child_index = <index>}
endscript

script ui_gig_posters_get_scores_and_tags 
	get_song_prefix song = <song>
	beginner_skull_alpha = 0
	easy_skull_alpha = 0
	medium_skull_alpha = 0
	hard_skull_alpha = 0
	expert_skull_alpha = 0
	ghost_skull_alpha = 0
	beginner_text_alpha = 0
	easy_text_alpha = 0
	medium_text_alpha = 0
	hard_text_alpha = 0
	expert_text_alpha = 0
	ghost_text_alpha = 0
	highest_stars_difficulty_texture = icon_difficulty_beginner
	highest_stars_difficulty_alpha = 0
	highest_stars_difficulty_text = qs(0x25b2ecac)
	highest_stars_difficulty_index = 0
	highest_stars = 3
	completed = 0
	gamemode_gettype
	<game_mode_type> = <type>
	format_globaltag_song_checksum part_text = ($part_list_props.<part>.text_nl) song = <song> difficulty_text_nl = 'easy_rhythm'
	getglobaltags <song_checksum> param = score savegame = <savegame>
	formattext textname = score_easy_rhythm_text qs(0x4d4555da) s = <score>
	if (<score> = 0 || $game_mode = training)
		<beginner_skull_alpha> = <ghost_skull_alpha>
		<beginner_text_alpha> = <ghost_text_alpha>
	else
		<completed> = 1
	endif
	format_globaltag_song_checksum part_text = ($part_list_props.<part>.text_nl) song = <song> difficulty_text_nl = 'easy'
	getglobaltags <song_checksum> param = score savegame = <savegame>
	formattext textname = score_easy_text qs(0x4d4555da) s = <score>
	if (<score> = 0 || $game_mode = training)
		<easy_skull_alpha> = <ghost_skull_alpha>
		<easy_text_alpha> = <ghost_text_alpha>
	else
		<completed> = 1
	endif
	format_globaltag_song_checksum part_text = ($part_list_props.<part>.text_nl) song = <song> difficulty_text_nl = 'medium'
	getglobaltags <song_checksum> param = score savegame = <savegame>
	formattext textname = score_medium_text qs(0x4d4555da) s = <score>
	if (<score> = 0 || $game_mode = training)
		<medium_skull_alpha> = <ghost_skull_alpha>
		<medium_text_alpha> = <ghost_text_alpha>
	else
		<completed> = 1
	endif
	format_globaltag_song_checksum part_text = ($part_list_props.<part>.text_nl) song = <song> difficulty_text_nl = 'hard'
	getglobaltags <song_checksum> param = score savegame = <savegame>
	formattext textname = score_hard_text qs(0x4d4555da) s = <score>
	if (<score> = 0 || $game_mode = training)
		<hard_skull_alpha> = <ghost_skull_alpha>
		<hard_text_alpha> = <ghost_text_alpha>
	else
		<completed> = 1
	endif
	format_globaltag_song_checksum part_text = ($part_list_props.<part>.text_nl) song = <song> difficulty_text_nl = 'expert'
	getglobaltags <song_checksum> param = score savegame = <savegame>
	formattext textname = score_expert_text qs(0x4d4555da) s = <score>
	if (<score> = 0 || $game_mode = training)
		<expert_skull_alpha> = <ghost_skull_alpha>
		<expert_text_alpha> = <ghost_text_alpha>
	else
		<completed> = 1
	endif
	format_globaltag_song_checksum part_text = ($part_list_props.<part>.text_nl) song = <song> difficulty_text_nl = 'easy_rhythm'
	getglobaltags <song_checksum> param = stars savegame = <savegame>
	getglobaltags <song_checksum> param = percent100 savegame = <savegame>
	if (<stars> >= <highest_stars>)
		<highest_stars_difficulty_texture> = icon_difficulty_beginner
		<highest_stars_difficulty_alpha> = 1
		<highest_stars_difficulty_text> = qs(0x25b2ecac)
		<highest_stars_difficulty_index> = 0
		<highest_stars> = <stars>
	endif
	beginner_stars = <stars>
	beginner_percent100 = <percent100>
	format_globaltag_song_checksum part_text = ($part_list_props.<part>.text_nl) song = <song> difficulty_text_nl = 'easy'
	getglobaltags <song_checksum> param = stars savegame = <savegame>
	getglobaltags <song_checksum> param = percent100 savegame = <savegame>
	if (<stars> >= <highest_stars>)
		<highest_stars_difficulty_texture> = icon_difficulty_easy
		<highest_stars_difficulty_alpha> = 1
		<highest_stars_difficulty_text> = qs(0xbf7ffd2d)
		<highest_stars_difficulty_index> = 1
		<highest_stars> = <stars>
	endif
	easy_stars = <stars>
	easy_percent100 = <percent100>
	format_globaltag_song_checksum part_text = ($part_list_props.<part>.text_nl) song = <song> difficulty_text_nl = 'medium'
	getglobaltags <song_checksum> param = stars savegame = <savegame>
	getglobaltags <song_checksum> param = percent100 savegame = <savegame>
	if (<stars> >= <highest_stars>)
		<highest_stars_difficulty_texture> = icon_difficulty_medium
		<highest_stars_difficulty_alpha> = 1
		<highest_stars_difficulty_text> = qs(0xeac0f52d)
		<highest_stars_difficulty_index> = 2
		<highest_stars> = <stars>
	endif
	medium_stars = <stars>
	medium_percent100 = <percent100>
	format_globaltag_song_checksum part_text = ($part_list_props.<part>.text_nl) song = <song> difficulty_text_nl = 'hard'
	getglobaltags <song_checksum> param = stars savegame = <savegame>
	getglobaltags <song_checksum> param = percent100 savegame = <savegame>
	if (<stars> >= <highest_stars>)
		<highest_stars_difficulty_texture> = icon_difficulty_hard
		<highest_stars_difficulty_alpha> = 1
		<highest_stars_difficulty_text> = qs(0x63aae385)
		<highest_stars_difficulty_index> = 3
		<highest_stars> = <stars>
	endif
	hard_stars = <stars>
	hard_percent100 = <percent100>
	format_globaltag_song_checksum part_text = ($part_list_props.<part>.text_nl) song = <song> difficulty_text_nl = 'expert'
	getglobaltags <song_checksum> param = stars savegame = <savegame>
	getglobaltags <song_checksum> param = percent100 savegame = <savegame>
	if (<stars> >= <highest_stars>)
		<highest_stars_difficulty_texture> = icon_difficulty_expert
		<highest_stars_difficulty_alpha> = 1
		<highest_stars_difficulty_text> = qs(0xb778e780)
		<highest_stars_difficulty_index> = 4
		<highest_stars> = <stars>
	endif
	expert_stars = <stars>
	expert_percent100 = <percent100>
	score_text = {
		score_beginner_text = <score_easy_rhythm_text>
		score_easy_text = <score_easy_text>
		score_medium_text = <score_medium_text>
		score_hard_text = <score_hard_text>
		score_expert_text = <score_expert_text>
		icon_difficulty_beginner_alpha = <beginner_skull_alpha>
		icon_difficulty_easy_alpha = <easy_skull_alpha>
		icon_difficulty_medium_alpha = <medium_skull_alpha>
		icon_difficulty_hard_alpha = <hard_skull_alpha>
		icon_difficulty_expert_alpha = <expert_skull_alpha>
		score_beginner_alpha = <beginner_text_alpha>
		score_easy_alpha = <easy_text_alpha>
		score_medium_alpha = <medium_text_alpha>
		score_hard_alpha = <hard_text_alpha>
		score_expert_alpha = <expert_text_alpha>
	}
	stars_tags = {
		beginner_stars = <beginner_stars>
		easy_stars = <easy_stars>
		medium_stars = <medium_stars>
		hard_stars = <hard_stars>
		expert_stars = <expert_stars>
		beginner_percent100 = <beginner_percent100>
		easy_percent100 = <easy_percent100>
		medium_percent100 = <medium_percent100>
		hard_percent100 = <hard_percent100>
		expert_percent100 = <expert_percent100>
	}
	difficulty_tags = {
		icon_difficulty_texture = <highest_stars_difficulty_texture>
		icon_difficulty_alpha = <highest_stars_difficulty_alpha>
		highest_stars_difficulty_text = <highest_stars_difficulty_text>
		highest_stars_difficulty_index = <highest_stars_difficulty_index>
	}
	return score_text = <score_text> difficulty_tags = <difficulty_tags> stars_tags = <stars_tags> completed = <completed>
endscript

script ui_gig_posters_highlight_motion 
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	if desc_resolvealias \{name = alias_highlight}
		if getscreenelementchildren id = <resolved_id>
			getarraysize <children>
			prev = 0
			curr = 1
			begin
			prev_id = (<children> [<prev>])
			curr_id = (<children> [<curr>])
			if screenelementexists id = <prev_id>
				<prev_id> :se_setprops alpha = 0.0
			endif
			if screenelementexists id = <curr_id>
				<curr_id> :se_setprops alpha = 1
			endif
			prev = <curr>
			next = RandomInteger (0.0, 2.0)
			if (<next> = <prev>)
				curr = (<curr> + 1)
			else
				curr = <next>
			endif
			if (<curr> >= <array_size>)
				curr = 0
			endif
			if screenelementexists id = <curr_id>
				rand = Random (@ 0 @ 1 )
				if (<rand> = 1)
					<curr_id> :se_setprops flip_v = true
				else
					<curr_id> :se_setprops flip_v = false
				endif
				rand = Random (@ 0 @ 1 )
				if (<rand> = 1)
					<curr_id> :se_setprops flip_h = true
				else
					<curr_id> :se_setprops flip_h = false
				endif
			endif
			wait \{0.1
				second}
			repeat
		endif
	endif
endscript

script ui_gig_posters_check_movies_played \{part = band}
	get_current_band_info
	getglobaltags <band_info>
	switch (<part>)
		case guitar
		check = <career_guitar_movies_played>
		case bass
		check = <career_bass_movies_played>
		case drum
		check = <career_drum_movies_played>
		case vocals
		check = <career_vocals_movies_played>
		case band
		check = <career_band_movies_played>
	endswitch
	return {movies_played = <check>}
endscript

script ui_gig_posters_set_movies_played \{part = band}
	requireparams \{[
			value
		]
		all}
	get_current_band_info
	getglobaltags <band_info>
	switch (<part>)
		case guitar
		setglobaltags <band_info> params = {career_guitar_movies_played = <value>}
		case bass
		setglobaltags <band_info> params = {career_bass_movies_played = <value>}
		case drum
		setglobaltags <band_info> params = {career_drum_movies_played = <value>}
		case vocals
		setglobaltags <band_info> params = {career_vocals_movies_played = <value>}
		case band
		setglobaltags <band_info> params = {career_band_movies_played = <value>}
	endswitch
endscript

script ui_select_venue_check_ice_movie_played \{part = band}
	get_current_band_info
	getglobaltags <band_info>
	switch (<part>)
		case guitar
		check = <career_guitar_ice_movie_played>
		case bass
		check = <career_bass_ice_movie_played>
		case drum
		check = <career_drum_ice_movie_played>
		case vocals
		check = <career_vocals_ice_movie_played>
		case band
		check = <career_band_ice_movie_played>
	endswitch
	if (<check> = 1)
		return \{true}
	endif
	return \{false}
endscript

script ui_select_venue_set_ice_movie_played \{part = band}
	get_current_band_info
	getglobaltags <band_info>
	switch (<part>)
		case guitar
		setglobaltags <band_info> params = {career_guitar_ice_movie_played = 1}
		case bass
		setglobaltags <band_info> params = {career_bass_ice_movie_played = 1}
		case drum
		setglobaltags <band_info> params = {career_drum_ice_movie_played = 1}
		case vocals
		setglobaltags <band_info> params = {career_vocals_ice_movie_played = 1}
		case band
		setglobaltags <band_info> params = {career_band_ice_movie_played = 1}
	endswitch
endscript

script ui_gig_posters_play_movie 
	setscriptcannotpause
	clean_up_user_control_helpers
	onexitrun \{ui_gig_posters_play_movie_destroy}
	requireparams \{[
			movie
		]
		all}
	menu_music_off
	spawnscriptnow \{destroy_setlist_songpreview_monitor}
	setsoundbussparams {crowd_balance = {vol = (($default_bussset.crowd_balance.vol) - 100)} time = 2.0}
	setsoundbussparams {music_setlist = {vol = (($default_bussset.music_setlist.vol) - 100)} time = 0.5}
	fadetoblack \{on
		time = 0
		alpha = 1.0
		z_priority = 100}
	wait_for_songpreview_monitor
	killallmovies
	waitforallmoviestofinish
	set_bink_heap_state \{state = big}
	playmovie \{movie = 'silent_movie'
		textureslot = 0
		texturepri = 1000
		no_hold}
	soundevent \{event = precutscene_sfx}
	info_text = qs(0x00000000)
	switch (<movie>)
		case 'GHM_Movie1'
		info_text = qs(0x7bdd876c)
		case 'GHM_Movie2'
		info_text = qs(0x057a5257)
		case 'GHM_Movie3'
		info_text = qs(0x83dd7272)
		case 'GHM_Movie4'
		info_text = qs(0x09a12dc5)
		case 'GHM_Movie_Outro'
		info_text = qs(0xa908d698)
		case 'stone_intro'
		info_text = qs(0xead25814)
	endswitch
	createscreenelement {
		type = descinterface
		parent = root_window
		id = silent_movie
		desc = 'silent_movie'
		info_text = <info_text>
		alpha = 0.0
	}
	silent_movie :se_setprops \{alpha = 1.0
		time = 0.1}
	wait \{5
		seconds}
	killallmovies
	silent_movie :se_setprops \{alpha = 0
		time = 0.1}
	silent_movie :se_waitprops
	destroyscreenelement \{id = silent_movie}
	waitforallmoviestofinish
	playmovieandwait movie = <movie> noblack
	get_movie_id_by_name movie = <movie>
	setglobaltags <id> params = {unlocked = 1} all_active_players = 1
	menu_music_on
	setsoundbussparams {crowd_balance = {vol = (($default_bussset.crowd_balance.vol))} time = 2.0}
endscript

script ui_gig_posters_play_movie_destroy 
	destroyscreenelement \{id = silent_movie}
endscript

script ui_gig_posters_play_song 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	setlist_menu :se_setprops \{block_events}
	change current_song = <song>
	change current_level = <level>
	change current_gig_number = <tier_num>
	part = band
	if ($current_num_players = 1)
		getplayerinfo \{1
			part}
	endif
	ui_gig_posters_check_movies_played part = <part>
	if (<level> = load_z_donnington)
		if (<movies_played> = 3)
			if screenelementexists \{id = setlistinterface}
				setlistinterface :se_setprops \{block_events}
			endif
			ui_gig_posters_play_movie \{movie = 'GHM_Movie4'}
			ui_gig_posters_set_movies_played part = <part> value = 4
		endif
	elseif (<level> = load_z_icecave)
		if NOT ui_select_venue_check_ice_movie_played part = <part>
			if screenelementexists \{id = setlistinterface}
				setlistinterface :se_setprops \{block_events}
			endif
			ui_gig_posters_play_movie \{movie = 'GHM_Movie_Outro'}
			ui_select_venue_set_ice_movie_played part = <part>
		endif
	endif
	if (($signin_change_happening = 1) || ($invite_controller > -1))
		return
	endif
	generic_event_choose \{state = uistate_play_song}
endscript

script ui_destroy_gig_posters 
	menu_start_transition
	killspawnedscript \{name = ui_create_gig_posters_spawned}
	if NOT (($top_rockers_enabled) || (gotparam from_leaderboard))
		spawnscriptnow \{destroy_setlist_songpreview_monitor}
		if NOT ($game_mode = practice || $game_mode = training)
			menu_music_on
		endif
	endif
	if screenelementexists \{id = setlistinterface}
		destroyscreenelement \{id = setlistinterface}
	endif
	clean_up_user_control_helpers
	fadetoblack \{off
		time = 0
		no_wait}
endscript

script ui_gig_posters_focus \{time = 0.1}
	if scriptisrunning \{ui_create_gig_posters_spawned}
		time = 0.0
	endif
	gettags
	printf \{qs(0x7443fdca)}
	if NOT gotparam \{index}
		return
	endif
	destroy_loading_screen \{force = 1}
	fadetoblack \{off
		time = 0}
	se_getparentid
	<parent_id> :gettags
	if (<prev_index> > <index>)
		pos_move = (0.0, -10.0)
	else
		pos_move = (0.0, 10.0)
	endif
	<ratio> = (<index> / (<total_songs> * 1.0))
	pos = ((0.0, 1.0) * ((<ratio> * 365) - 205))
	bg_pos = ((0.0, -1.0) * (<ratio> * (4400 - 720)))
	bg_runnerc_pos = ((0.0, -1.0) * (<ratio> * (2200 - 720)))
	bg_runnerl_pos = (((0.0, -1.0) * (<ratio> * (2200 - 720))) + (-640.0, 0.0))
	bg_runnerr_pos = (((0.0, -1.0) * (<ratio> * (2200 - 720))) + (640.0, 0.0))
	setlistinterface :se_setprops {
		setlist_b_scrollthumb_pos = <pos>
		setlist_b_bg_pos = <bg_pos>
		setlist_b_bg_runnerc_pos = <bg_runnerc_pos>
		setlist_b_bg_runnerl_pos = <bg_runnerl_pos>
		setlist_b_bg_runnerr_pos = <bg_runnerr_pos>
		time = <time>
	}
	<parent_id> :settags prev_index = <index>
	if (<highlight> = 0)
		return
	endif
	<info_scores_container_alpha> = 1.0
	<instrument_icons_alpha> = 0.0
	if (($game_mode = p2_battle) || ($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff))
		<info_scores_container_alpha> = 0.0
		<instrument_icons_alpha> = 0.0
	endif
	if NOT (<tag_selected_index> < <section_breaker_index_3>)
		<info_scores_container_alpha> = 0.0
		<instrument_icons_alpha> = 1.0
		setlist_get_jammode_playback_tracks jam_song = <jam_song> example_songs = <example_songs>
		icon_no_instrument_guitar_alpha = 1
		icon_no_instrument_bass_alpha = 1
		icon_no_instrument_drums_alpha = 1
		icon_no_instrument_mic_alpha = 1
		if gotparam \{playback_track1}
			if (<playback_track1> > -1)
				icon_no_instrument_guitar_alpha = 0
			endif
		endif
		if gotparam \{playback_track2}
			if (<playback_track2> > -1)
				icon_no_instrument_bass_alpha = 0
			endif
		endif
		if gotparam \{playback_track_drums}
			if (<playback_track_drums> > 0)
				icon_no_instrument_drums_alpha = 0
			endif
		endif
		if gotparam \{playback_track_vocals}
			if (<playback_track_vocals> > 0)
				icon_no_instrument_mic_alpha = 0
			endif
		endif
	endif
	formattext textname = song_text qs(0x90e80fb9) a = <song_artist> t = <song_title>
	stringtochararray string = <song_text>
	getarraysize <char_array>
	getplayerinfo \{1
		double_kick_drum}
	<double_kick_alpha> = 0
	if (<song> != jamsession && <part> = drum && <double_kick_drum> = 1)
		if (($permanent_songlist_props.<song>.double_kick) = 1)
			<double_kick_alpha> = 1
		endif
	endif
	if (<double_bass_complete> = 1)
		icon_difficulty_expert_alpha = 0
		icon_difficulty_expert_plus_alpha = 1
		<highest_stars_difficulty_text> = qs(0x739da581)
	else
		icon_difficulty_expert_alpha = 1
		icon_difficulty_expert_plus_alpha = 0
	endif
	song_info_icon_alpha = 0
	if (<new_song_info> = 1)
		<song_info_icon_alpha> = 1
	endif
	se_setprops {
		desc = 'setlist_b_info2_desc'
		auto_dims = false
		dims = (0.0, 150.0)
		setlist_info_title_artist_text = <song_text>
		setlist_info_title_artist_pos = {<pos_move> relative}
		icon_difficulty_texture = <icon_difficulty_texture>
		difficulty_and_stars_alpha = <icon_difficulty_alpha>
		text_difficulty_text = <highest_stars_difficulty_text>
		double_kick_alpha = <double_kick_alpha>
		song_info_icon_alpha = <song_info_icon_alpha>
		icon_difficulty_alpha = <icon_difficulty_expert_alpha>
		icon_difficulty_expert_plus_alpha = <icon_difficulty_expert_plus_alpha>
	}
	obj_getid
	change current_song_info_id = <objid>
	percent_diffs = ['beginner' 'easy' 'medium' 'hard' 'expert']
	percent_aliases = [
		alias_setlist_b_stars_beginner
		alias_setlist_b_stars_easy
		alias_setlist_b_stars_medium
		alias_setlist_b_stars_hard
		alias_setlist_b_stars_expert
	]
	star_diffs = [
		beginner_stars
		easy_stars
		medium_stars
		hard_stars
		expert_stars
	]
	formattext checksumname = percent100 '%s_percent100' s = (<percent_diffs> [<highest_stars_difficulty_index>])
	if gotparam <percent100>
		if <objid> :desc_resolvealias name = alias_stars
			if (<...>.<percent100> = 1)
				<resolved_id> :se_setprops star_texture = song_complete_star_perfect star_rgba = [255 255 255 255]
			endif
			if <resolved_id> :desc_resolvealias name = alias_stars
				getscreenelementchildren id = <resolved_id>
				num_stars = (<...>.(<star_diffs> [<highest_stars_difficulty_index>]))
				if (<num_stars> = 0)
					<resolved_id> :se_setprops alpha = 0
				else
					getarraysize <children>
					stars_left = <array_size>
					if (<num_stars> < 5 && <stars_left> = 5)
						if screenelementexists id = (<children> [0])
							destroyscreenelement id = (<children> [0])
							stars_left = (<stars_left> - 1)
						endif
					endif
					if (<num_stars> < 4 && <stars_left> = 4)
						if screenelementexists id = (<children> [1])
							destroyscreenelement id = (<children> [1])
						endif
					endif
				endif
			endif
		endif
	endif
	se_setprops {
		setlist_info_title_artist_pos = {(<pos_move> * -1) relative}
		time = <time>
	}
	if <objid> :desc_resolvealias name = alias_setlist_info_title_artist
		getscreenelementchildren id = <resolved_id>
		getscreenelementprops id = (<children> [0]) force_update
		<width> = (<dims>.(1.0, 0.0) * <scale>.(1.0, 0.0))
		<double_kick_offset> = ((1.0, 0.0) * ((<width> / 2) + 12))
		<new_pos> = ((0.0, -30.0) - <double_kick_offset>)
		<objid> :se_setprops double_kick_pos = <new_pos>
	endif
	if (<tag_selected_index> < <section_breaker_index_3>)
		gig_posters_song_focus song = <song>
	else
		gig_posters_song_focus
	endif
	if (<new_song_info> = 1)
		<objid> :obj_spawnscriptnow song_info_icon_motion
		setlist_menu :settags \{pulse_song_extras = 1}
	else
		setlist_menu :settags \{pulse_song_extras = 0}
	endif
	setlist_menu :settags last_focused_song = <song>
	if NOT gotparam \{jam_song}
		ui_gig_posters_update_current_section index = <tag_selected_index> song = <song>
	else
		ui_gig_posters_update_current_section index = <tag_selected_index> song = <song> jam_song = <jam_song>
	endif
	<objid> :obj_spawnscriptnow ui_gig_posters_highlight_motion
endscript

script ui_gig_posters_unfocus 
	gettags
	formattext textname = song_text qs(0x90e80fb9) a = <song_artist> t = <song_title>
	getplayerinfo \{1
		double_kick_drum}
	<double_kick_alpha> = 0
	if (<song> != jamsession && <part> = drum && <double_kick_drum> = 1)
		if (($permanent_songlist_props.<song>.double_kick) = 1)
			<double_kick_alpha> = 1
		endif
	endif
	se_setprops {
		desc = 'setlist_b_listing_desc'
		auto_dims = false
		dims = (0.0, 50.0)
		listing_text = <song_text>
		listing_pos = (-20.0, 0.0)
		double_kick_alpha = <double_kick_alpha>
		stars_alpha = 1
		<difficulty_tags>
	}
	move_double_kick = 1
	if gotparam \{fading_in}
		if (<fading_in> = 1)
			<move_double_kick> = 0
			settags \{fading_in = 0}
		endif
	endif
	if (<move_double_kick> = 1)
		if desc_resolvealias \{name = alias_listing}
			getscreenelementchildren id = <resolved_id>
			getscreenelementposition id = <resolved_id> summed
			<text_pos> = <screenelementpos>
			getscreenelementprops id = (<children> [0]) force_update
			<width> = (<dims>.(1.0, 0.0) * <scale>.(1.0, 0.0))
			<double_kick_offset> = ((1.0, 0.0) * ((<width> / 2) + 42) + (0.0, 1.0))
			<new_pos> = (<text_pos> - <double_kick_offset>)
			se_setprops double_kick_pos = <new_pos>
			<new_pos> = (<text_pos> + <double_kick_offset> - (45.0, 3.0))
			se_setprops stars_pos = <new_pos>
		endif
	endif
	percent_diffs = ['beginner' 'easy' 'medium' 'hard' 'expert']
	star_diffs = [
		beginner_stars
		easy_stars
		medium_stars
		hard_stars
		expert_stars
	]
	obj_getid
	formattext checksumname = percent100 '%s_percent100' s = (<percent_diffs> [<highest_stars_difficulty_index>])
	if <objid> :desc_resolvealias name = alias_stars
		if (<...>.<percent100> = 1)
			<objid> :se_setprops star_rgba = [255 255 255 175]
		endif
		getscreenelementchildren id = <resolved_id>
		num_stars = (<...>.(<star_diffs> [<highest_stars_difficulty_index>]))
		if (<num_stars> = 0)
			<resolved_id> :se_setprops alpha = 0
		else
			getarraysize <children>
			stars_left = <array_size>
			if (<num_stars> < 5 && <stars_left> = 5)
				if screenelementexists id = (<children> [4])
					destroyscreenelement id = (<children> [4])
					stars_left = (<stars_left> - 1)
				endif
			endif
			if (<num_stars> < 4 && <stars_left> = 4)
				if screenelementexists id = (<children> [3])
					destroyscreenelement id = (<children> [3])
				endif
			endif
		endif
	endif
endscript

script ui_gig_posters_update_current_section 
	setlist_menu :gettags
	if (<index> >= <section_breaker_index_3>)
		<current_section> = 3
	elseif (<tag_selected_index> >= <section_breaker_index_2>)
		<current_section> = 2
	elseif (<tag_selected_index> >= <section_breaker_index_1>)
		<current_section> = 1
	endif
	printf qs(0x3c3c9525) a = <index> b = <current_section>
	setlist_menu :settags current_section = <current_section>
	if ($ui_gig_posters_skip_helpers = 1)
		return
	endif
	if (<for_custom_setlist> = 1)
		setup_custom_setlist_helpers song = <song> jam_song = <jam_song>
	else
		clean_up_user_control_helpers
		if ($is_network_game = 1)
			if local_player_is_choosing_song
				add_user_control_helper \{text = qs(0x4d9ad28f)
					button = green
					z = 100}
				add_user_control_helper \{text = qs(0xaf4d5dd2)
					button = red
					z = 100}
			endif
		else
			add_user_control_helper \{text = qs(0x4d9ad28f)
				button = green
				z = 100}
			add_user_control_helper \{text = qs(0xaf4d5dd2)
				button = red
				z = 100}
			add_user_control_helper \{text = qs(0xd9242d03)
				button = blue
				z = 100}
			if (<pulse_song_extras> = 1)
				spawnscriptnow pulsate_helper_pill params = {id = <helper_pill_id> time = 0.5 delay_time = 0}
			else
				killspawnedscript \{name = pulsate_helper_pill}
			endif
		endif
		setlist_show_jump_helper_text
		if ($game_mode = p1_career ||
				$game_mode = p2_career ||
				$game_mode = p3_career ||
				$game_mode = p4_career)
			if ($enable_button_cheats = 1)
				add_user_control_helper \{text = qs(0x91fff11f)
					button = lb
					z = 100000}
			endif
		endif
	endif
endscript

script ui_gig_posters_debug_complete 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	if ($enable_button_cheats = 0)
		return
	endif
	i = 1
	begin
	getplayerinfo <i> part
	getplayerinfo <i> controller
	getsavegamefromcontroller controller = <controller>
	getglobaltags <song_checksum> param = stars
	<old_stars> = <stars>
	setglobaltags <song_checksum> savegame = <savegame> params = {unlocked = 1 stars = 5 score = 1000}
	setglobaltags <song> savegame = <savegame> params = {unlocked = 1}
	if check_if_metallifacts_exists song = ($current_song)
		if (<old_stars> < 3)
			flag_new_song_info_for_all_difficulties new_song_info = 1 part = <part> song = <song>
		endif
	endif
	if (<part> = drum)
		getplayerinfo <i> double_kick_drum
		if (<double_kick_drum> = 1)
			if ($permanent_songlist_props.<song>.double_kick = 1)
				setglobaltags <song_checksum> savegame = <savegame> params = {double_bass_complete = 1}
			endif
		endif
	endif
	i = (<i> + 1)
	repeat ($current_num_players)
	ui_event \{event = menu_refresh}
endscript

script ui_gig_posters_choose 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	ui_event event = menu_change data = {state = uistate_play_song <...>}
endscript

script ui_setlist_choose_song_extras 
	if is_ui_event_running
		return
	endif
	soundevent \{event = select_sound_big}
	requireparams \{[
			song
			song_checksum
		]
		all}
	setlistinterface :se_setprops \{block_events}
	setlist_menu :se_setprops \{block_events}
	spawnscriptnow ui_setlist_choose_song_extras_spawned params = {<...>}
endscript

script ui_setlist_choose_song_extras_spawned 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	if ($current_song_info_id) :desc_resolvealias name = alias_highlight
		getscreenelementchildren id = <resolved_id>
		(<children> [0]) :se_setprops rgba = [255 255 255 200]
		(<children> [1]) :se_setprops rgba = [255 255 255 200]
		(<children> [2]) :se_setprops rgba = [255 255 255 200]
		setlistinterface :se_setprops \{setlist_b_bg_runnerl_pos = {
				relative
				(-200.0, 0.0)
			}
			time = 0.1}
		setlistinterface :se_setprops \{setlist_b_bg_runnerr_pos = {
				relative
				(200.0, 0.0)
			}
			time = 0.1}
		setlistinterface :se_setprops \{setlist_scroll_alpha = 0
			time = 0.1}
		setlistinterface :se_waitprops
		if NOT screenelementexists \{id = setlistinterface}
			return
		endif
		(<children> [0]) :se_setprops rgba = [255 255 255 0]
		(<children> [1]) :se_setprops rgba = [255 255 255 0]
		(<children> [2]) :se_setprops rgba = [255 255 255 0]
	endif
	($current_song_info_id) :se_getprops double_kick_alpha
	($current_song_info_id) :desc_resolvealias name = alias_double_kick
	getscreenelementposition id = <resolved_id> summed
	flag_new_song_info_for_all_difficulties new_song_info = 0 part = <part> song = <song>
	ui_event_wait state = uistate_song_extras data = {<...> from = setlist double_kick_alpha = <double_kick_alpha> double_kick_pos = <screenelementpos>}
endscript

script song_info_icon_motion 
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	if desc_resolvealias \{name = alias_song_info_icon}
		if getscreenelementchildren id = <resolved_id>
			getarraysize <children>
			prev = 0
			curr = 1
			begin
			prev_id = (<children> [<prev>])
			curr_id = (<children> [<curr>])
			if screenelementexists id = <prev_id>
				<prev_id> :se_setprops alpha = 0.0
			endif
			if screenelementexists id = <curr_id>
				<curr_id> :se_setprops alpha = 1
			endif
			prev = <curr>
			next = RandomInteger (0.0, 1.0)
			if (<next> = <prev>)
				curr = (<curr> + 1)
			else
				curr = <next>
			endif
			if (<curr> >= <array_size>)
				curr = 0
			endif
			wait \{0.1
				second}
			repeat
		endif
	endif
endscript

script ui_gig_posters_popups 
	printf \{qs(0xe264c9e1)
		channel = popup_debug}
	change \{ui_gig_posters_skip_helpers = 0}
	get_current_band_info
	getglobaltags <band_info> params = {first_career_setlist}
	if (<first_career_setlist> = 1)
		change \{ui_gig_posters_skip_helpers = 1}
		ui_event_wait \{state = uistate_new_song_info_popup
			data = {
				is_popup
			}}
		setglobaltags <band_info> params = {first_career_setlist = 0}
	else
		getplayerinfo \{1
			part}
		getplayerinfo \{1
			double_kick_drum}
		if (<part> = drum && <double_kick_drum> = 1)
			getglobaltags <band_info> params = {first_setlist_drum}
			if (<first_setlist_drum> = 1 && <first_career_setlist> = 0)
				change \{ui_gig_posters_skip_helpers = 1}
				ui_event_wait \{state = uistate_double_bass_popup
					data = {
						is_popup
					}}
				setglobaltags <band_info> params = {first_setlist_drum = 0}
			endif
		endif
	endif
endscript

script get_prev_total_songs 
	switch <part>
		case guitar
		getglobaltags <band_info> params = {career_guitar_prev_total_songs = <final_num_songs>}
		return prev_total_songs = <career_guitar_prev_total_songs>
		case bass
		getglobaltags <band_info> params = {career_bass_prev_total_songs = <final_num_songs>}
		return prev_total_songs = <career_bass_prev_total_songs>
		case drum
		getglobaltags <band_info> params = {career_drum_prev_total_songs = <final_num_songs>}
		return prev_total_songs = <career_drum_prev_total_songs>
		case vocals
		getglobaltags <band_info> params = {career_vocals_prev_total_songs = <final_num_songs>}
		return prev_total_songs = <career_vocals_prev_total_songs>
		case band
		getglobaltags <band_info> params = {career_band_prev_total_songs = <final_num_songs>}
		return prev_total_songs = <career_band_prev_total_songs>
	endswitch
endscript

script set_prev_total_songs 
	switch <part>
		case guitar
		setglobaltags <band_info> params = {career_guitar_prev_total_songs = <final_num_songs>}
		case bass
		setglobaltags <band_info> params = {career_bass_prev_total_songs = <final_num_songs>}
		case drum
		setglobaltags <band_info> params = {career_drum_prev_total_songs = <final_num_songs>}
		case vocals
		setglobaltags <band_info> params = {career_vocals_prev_total_songs = <final_num_songs>}
		case band
		setglobaltags <band_info> params = {career_band_prev_total_songs = <final_num_songs>}
	endswitch
endscript
