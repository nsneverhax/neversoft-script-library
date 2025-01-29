ui_select_venue_info = {
	load_z_subway = {
		index = 1
	}
	load_z_lhc = {
		index = 2
	}
	load_z_freakshow = {
		index = 3
	}
	load_z_neworleans = {
		index = 4
	}
	load_z_dublin = {
		index = 5
	}
	load_z_dragrace = {
		index = 6
	}
	load_z_carhenge = {
		index = 7
	}
	load_z_vegas = {
		index = 8
	}
	load_z_nashville = {
		index = 9
	}
	load_z_mexicocity = {
		index = 10
	}
	load_z_cairo = {
		index = 11
	}
	load_z_sanfrancisco = {
		index = 12
	}
	load_z_norway = {
		index = 13
	}
	load_z_cube = {
		index = 14
	}
}
current_song_info_id = NULL
ui_gig_posters_skip_helpers = 1
0xc5b91820 = 0

script ui_init_gig_posters 
	cas_destroy_all_characters
endscript

script ui_create_gig_posters 
	destroy_loading_screen
	KillSpawnedScript \{Name = loading_screen_crowd_swell}
	KillSpawnedScript \{Name = crowd_loading_whistle}
	KillSpawnedScript \{Name = oneshotsbetweensongs}
	KillSpawnedScript \{Name = surgebetweensongs}
	SpawnScriptNow \{0xb20ce9b6}
	if NOT ($game_mode = practice || $game_mode = practice)
		SpawnScriptNow \{Skate8_SFX_Backgrounds_New_Area
			params = {
				BG_SFX_Area = frontend_menu_music
			}}
	endif
	clean_up_user_control_helpers
	if ($current_num_players = 1)
		exclusive_device = ($primary_controller)
	else
		exclusive_device = $band_mode_current_leader
	endif
	hide_glitch \{num_frames = 3}
	fadetoblack \{On
		alpha = 1.0
		time = 0
		z_priority = 200}
	if ($signin_change_happening = 1)
		return
	endif
	CreateScreenElement {
		parent = root_window
		id = setlistinterface
		Type = descinterface
		desc = 'setlist_b'
		exclusive_device = <exclusive_device>
	}
	if NOT GotParam \{use_all_controllers}
		Change \{rocking_out_too_hard = 1}
		setlistinterface :obj_spawnscript 0x8ed8c79c params = {from_top_rocker = <from_top_rocker>}
	endif
	SpawnScriptNow ui_create_gig_posters_spawned params = <...>
endscript

script ui_create_gig_posters_spawned 
	Change \{rich_presence_context = presence_gigboard_and_setlist}
	get_current_band_info
	GetGlobalTags <band_info>
	tier_global = gh4_career_band_songs
	Change \{current_progression_flag = career_band}
	part = Band
	check = <career_intro_band_complete>
	if (($current_num_players = 1) && ($is_network_game = 0))
		getplayerinfo \{1
			part}
	endif
	if (<part> = guitar)
		tier_global = gh4_career_guitar_songs
		Change \{current_progression_flag = career_guitar}
	elseif (<part> = bass)
		tier_global = gh4_career_bass_songs
		Change \{current_progression_flag = career_bass}
	elseif (<part> = drum)
		tier_global = gh4_career_drum_songs
		Change \{current_progression_flag = career_drum}
	elseif (<part> = vocals)
		tier_global = gh4_career_vocals_songs
		Change \{current_progression_flag = career_vocals}
	endif
	progression_get_total_stars
	ui_gig_posters_check_movies_played part = <part>
	0x79db87d7
	get_progression_globals ($current_progression_flag)
	setlist_prefix = ($<tier_global>.prefix)
	if ($current_progression_flag = career_band)
		getsavegamefromcontroller controller = ($band_mode_current_leader)
	else
		getsavegamefromcontroller controller = ($primary_controller)
	endif
	0xb17a28cd \{condition = {
			0xdffcb66f
		}}
	menu_music_off
	gig_posters_song_focus
	if ($current_num_players = 1)
		update_ingame_controllers controller = <exclusive_device>
	endif
	if NOT GotParam \{gig_index}
		<gig_index> = ($ui_select_venue_info.($current_level).index)
	endif
	if setlistinterface :desc_resolvealias \{Name = alias_setlist_menu}
		pad_back_script = generic_event_back
		pad_back_params = {gig_index = <gig_index>}
		if GotParam \{save_on_back}
			pad_back_script = ui_memcard_autosave_replace
			pad_back_params = {<pad_back_params> data = {all_active_players = true}}
		endif
		AssignAlias id = <resolved_id> alias = setlist_menu
		setlist_menu :se_setprops {
			event_handlers = [
				{pad_up generic_menu_up_or_down_sound params = {up}}
				{pad_down generic_menu_up_or_down_sound params = {down}}
				{pad_back 0xeea8ea73 params = <pad_back_params>}
				{focus ui_gig_posters_popups}
			]
			tags = {
				from_top_rocker = <from_top_rocker>
				from_leaderboard = <from_leaderboard>
				for_custom_setlist = 0
				current_section = 1
				last_focused_song = None
				custom_setlist_num_id_1 = NULL
				custom_setlist_num_id_2 = NULL
				custom_setlist_num_id_3 = NULL
				custom_setlist_num_id_4 = NULL
				custom_setlist_num_id_5 = NULL
				custom_setlist_num_id_6 = NULL
				section_breaker_index_1 = 99999
				section_breaker_index_2 = 99999
				section_breaker_index_3 = 99999
			}
		}
	endif
	if GotParam \{next_state}
		setlist_menu :SetTags next_state = <next_state>
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
	CreateScreenElement \{parent = setlist_menu
		Type = descinterface
		desc = 'setlist_b_head_desc'
		auto_dims = FALSE
		dims = (0.0, 300.0)
		just = [
			center
			center
		]
		setlist_b_head_text_text = qs(0xa01b0e62)
		not_focusable}
	SpawnScriptLater 0xfd93422a params = {<...>}
endscript

script 0xfd93422a 
	ui_event_wait_for_safe
	menu_index = 1
	last_title_index = 1
	<final_num_songs> = 0
	setlist_menu :SetTags \{highlight = 0}
	SetButtonEventMappings \{block_menu_input}
	i = 1
	Change current_gig_number = <gig_index>
	formatText checksumName = Tier 'tier%n' n = <gig_index>
	if NOT StructureContains structure = ($<tier_global>) <Tier>
		0x93d8d5cf \{'Tier does not exist in selected career progression'}
	endif
	if StructureContains structure = ($<tier_global>.<Tier>) stars

		if (($<tier_global>.<Tier>.stars) <= <total_stars>)
			get_prev_total_songs part = <part> band_info = <band_info> final_num_songs = <final_num_songs>
			if StructureContains structure = ($<tier_global>.<Tier>) title
				CreateScreenElement {
					parent = setlist_menu
					Type = descinterface
					desc = 'setlist_b_divider_desc'
					auto_dims = FALSE
					alpha = 0
					dims = (0.0, 50.0)
					setlist_divider_title_text = ($<tier_global>.<Tier>.title)
					not_focusable
					tags = {
						tier_index = <gig_index>
					}
				}
				if GotParam \{last_listing_id}
					if ((<final_num_songs> + 1) > <prev_total_songs>)

						setlist_menu :SetTags total_songs = <final_num_songs> prev_index = 0
						<id> :se_setprops alpha = 1 time = 0.5
						LaunchEvent target = <last_listing_id> Type = focus
						SoundEvent \{event = GH3_Star_FlyIn}
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
			if StructureContains structure = ($<tier_global>.<Tier>) songs
				i = 0
				begin
				if (<i> = 0)
					songs = ($<tier_global>.<Tier>.songs)
				elseif (<i> = 1)
					if StructureContains structure = ($<tier_global>.<Tier>) 0x29c8d5a6
						songs = ($<tier_global>.<Tier>.0x29c8d5a6)
					else
						break
					endif
				endif
				GetArraySize <songs>
				num_songs = <array_Size>
				j = 0
				begin
				song = (<songs> [<j>])
				get_song_title song = <song>
				get_song_artist song = <song>
				ui_gig_posters_get_scores_and_tags song = <song> part = <part> savegame = <savegame>
				getplayerinfo \{1
					double_kick_drum}
				<double_kick_alpha> = 0
				format_globaltag_song_checksum part = ($<tier_global>.part) song = <song>
				GetGlobalTags <song_checksum> param = unlocked
				GetGlobalTags <song_checksum> param = double_bass_complete
				GetGlobalTags <song_checksum> param = new_song_info
				event_handlers = [
					{focus ui_gig_posters_focus params = {for_custom_setlist = 0}}
					{unfocus ui_gig_posters_unfocus}
					{pad_choose ui_gig_posters_play_song params = {song = <song> level = ($<tier_global>.<Tier>.level) tier_num = <gig_index> unlocked = <unlocked>}}
					{pad_L1 ui_gig_posters_debug_complete params = {song = <song> song_checksum = <song_checksum>}}
				]
				add_listing = 1
				if (<unlocked> = 0)
				endif
				0x9b0fe74b unlocked = <unlocked> song_title = <song_title> song_artist = <song_artist>
				if (<add_listing> = 1)
					CreateScreenElement {
						parent = setlist_menu
						Type = descinterface
						desc = 'setlist_b_listing_desc'
						alpha = 0
						auto_dims = FALSE
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
					}
					if <id> :desc_resolvealias Name = alias_listing
						GetScreenElementChildren id = <resolved_id>
						GetScreenElementPosition id = <resolved_id> summed
						<text_pos> = <screenelementpos>
						GetScreenElementProps id = (<children> [0]) force_update
						<width> = (<dims>.(1.0, 0.0) * <Scale>.(1.0, 0.0))
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
					formatText checksumName = percent100 '%s_percent100' s = (<percent_diffs> [(<difficulty_tags>.highest_stars_difficulty_index)])
					if <id> :desc_resolvealias Name = alias_stars
						percent_param = (<stars_tags>.<percent100>)
						if GotParam \{percent_param}
							if (<percent_param> = 1)
								<id> :se_setprops star_rgba = [255 255 255 175]
							endif
						endif
						GetScreenElementChildren id = <resolved_id>
						num_stars = (<stars_tags>.(<star_diffs> [(<difficulty_tags>.highest_stars_difficulty_index)]))
						if (<num_stars> = 0)
							<resolved_id> :se_setprops alpha = 0
						else
							GetArraySize <children>
							stars_left = <array_Size>
							if (<num_stars> < 5 && <stars_left> = 5)
								if ScreenElementExists id = (<children> [4])
									DestroyScreenElement id = (<children> [4])
									stars_left = (<stars_left> - 1)
								endif
							endif
							if (<num_stars> < 4 && <stars_left> = 4)
								if ScreenElementExists id = (<children> [3])
									DestroyScreenElement id = (<children> [3])
								endif
							endif
						endif
					endif
				endif
				<final_num_songs> = (<final_num_songs> + 1)
				menu_index = (<menu_index> + 1)
				if GotParam \{last_listing_id}
					<last_listing_id> :SetTags fading_in = 1
					LaunchEvent target = setlist_menu data = {child_id = <last_listing_id>} Type = unfocus
				endif
				last_listing_id = <id>
				Progression_CountCompletedSongsInCurrentTier
				if (<completed_songs> = 0)
					setlist_menu :SetTags total_songs = <final_num_songs> prev_index = 0
					<id> :se_setprops alpha = 1 time = 0.25
					LaunchEvent target = setlist_menu data = {child_id = <id>} Type = focus
					SoundEvent \{event = GH3_Star_FlyIn}
					<id> :se_waitprops
				else
					<id> :se_setprops alpha = 1
				endif
				j = (<j> + 1)
				repeat <num_songs>
				i = (<i> + 1)
				repeat 2
			endif
		endif
	endif
	SetButtonEventMappings \{unblock_menu_input}
	LaunchEvent target = setlist_menu data = {child_id = <last_listing_id>} Type = unfocus
	setlist_menu :SetTags \{highlight = 1}
	set_prev_total_songs part = <part> band_info = <band_info> final_num_songs = <final_num_songs>
	setlist_menu :SetTags total_songs = <final_num_songs> prev_index = 0
	SpawnScriptNow \{0xb20ce9b6}
	if ($is_network_game = 0)
		SpawnScriptNow \{0x1e464d15}
	endif
	num_gigs = ($<tier_global>.num_tiers)
	0xaad1f074 = 999
	i = 0
	begin
	if (<i> >= <gig_index>)
		formatText checksumName = next_tier 'tier%n' n = (<i> + 1)
		stars_needed = ($<tier_global>.<next_tier>.stars)
		diff = (<stars_needed> - <total_stars>)
		if (<diff> > 0)
			if (<diff> < <0xaad1f074>)
				<0xaad1f074> = <diff>
			endif
		endif
	endif
	<i> = (<i> + 1)
	repeat <num_gigs>
	formatText checksumName = next_tier 'tier%n' n = (<gig_index> + 1)
	if NOT (<0xaad1f074> = 999)
		if (<0xaad1f074> > 1)
			formatText TextName = stars_to_next_tier qs(0x507aeb0e) n = <0xaad1f074>
		else
			formatText TextName = stars_to_next_tier qs(0xbde57913) n = <0xaad1f074>
		endif
		CreateScreenElement {
			parent = setlist_menu
			Type = descinterface
			desc = 'setlist_b_divider_desc'
			auto_dims = FALSE
			dims = (0.0, 50.0)
			setlist_divider_title_text = <stars_to_next_tier>
			setlist_list_divider_l_alpha = 1
			setlist_list_divider_r_alpha = 1
			not_focusable
		}
	endif
	<max_songs> = 0
	<i> = 1
	begin
	formatText checksumName = Tier 'tier%n' n = <i>
	if StructureContains structure = ($<tier_global>.<Tier>) songs
		GetArraySize ($<tier_global>.<Tier>.songs)
		<max_songs> = (<max_songs> + <array_Size>)
	endif
	if StructureContains structure = ($<tier_global>.<Tier>) 0x29c8d5a6
		GetArraySize ($<tier_global>.<Tier>.0x29c8d5a6)
		<max_songs> = (<max_songs> + <array_Size>)
	endif
	<i> = (<i> + 1)
	repeat (($<tier_global>).num_tiers)
	formatText TextName = number_of_stars_text qs(0xb3fffe17) n = <total_stars> m = (<max_songs> * 5)
	setlistinterface :se_setprops number_of_stars_text = <number_of_stars_text>
	setlistinterface :se_setprops \{scribble_lower_alpha = 1}
	menu_finish
	if ($enable_button_cheats = 1)
		add_user_control_helper \{text = qs(0x91fff11f)
			button = lb
			z = 100000}
	endif
	LaunchEvent \{target = setlist_menu
		data = {
			child_index = $0xc5b91820
		}
		Type = focus}
	destroy_loading_screen \{Force = 1}
	fadetoblack \{OFF
		time = 0}
	0xf00f29a9
	broadcastevent \{Type = setlist_created}
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
	<game_mode_type> = <Type>
	format_globaltag_song_checksum part_text = ($part_list_props.<part>.text_nl) song = <song> difficulty_text_nl = 'beginner'
	GetGlobalTags <song_checksum> param = score savegame = <savegame>
	formatText TextName = score_beginner_text qs(0x4d4555da) s = <score>
	if (<score> = 0 || $game_mode = practice)
		<beginner_skull_alpha> = <ghost_skull_alpha>
		<beginner_text_alpha> = <ghost_text_alpha>
	else
		<completed> = 1
	endif
	format_globaltag_song_checksum part_text = ($part_list_props.<part>.text_nl) song = <song> difficulty_text_nl = 'easy'
	GetGlobalTags <song_checksum> param = score savegame = <savegame>
	formatText TextName = score_easy_text qs(0x4d4555da) s = <score>
	if (<score> = 0 || $game_mode = practice)
		<easy_skull_alpha> = <ghost_skull_alpha>
		<easy_text_alpha> = <ghost_text_alpha>
	else
		<completed> = 1
	endif
	format_globaltag_song_checksum part_text = ($part_list_props.<part>.text_nl) song = <song> difficulty_text_nl = 'medium'
	GetGlobalTags <song_checksum> param = score savegame = <savegame>
	formatText TextName = score_medium_text qs(0x4d4555da) s = <score>
	if (<score> = 0 || $game_mode = practice)
		<medium_skull_alpha> = <ghost_skull_alpha>
		<medium_text_alpha> = <ghost_text_alpha>
	else
		<completed> = 1
	endif
	format_globaltag_song_checksum part_text = ($part_list_props.<part>.text_nl) song = <song> difficulty_text_nl = 'hard'
	GetGlobalTags <song_checksum> param = score savegame = <savegame>
	formatText TextName = score_hard_text qs(0x4d4555da) s = <score>
	if (<score> = 0 || $game_mode = practice)
		<hard_skull_alpha> = <ghost_skull_alpha>
		<hard_text_alpha> = <ghost_text_alpha>
	else
		<completed> = 1
	endif
	format_globaltag_song_checksum part_text = ($part_list_props.<part>.text_nl) song = <song> difficulty_text_nl = 'expert'
	GetGlobalTags <song_checksum> param = score savegame = <savegame>
	formatText TextName = score_expert_text qs(0x4d4555da) s = <score>
	if (<score> = 0 || $game_mode = practice)
		<expert_skull_alpha> = <ghost_skull_alpha>
		<expert_text_alpha> = <ghost_text_alpha>
	else
		<completed> = 1
	endif
	format_globaltag_song_checksum part_text = ($part_list_props.<part>.text_nl) song = <song> difficulty_text_nl = 'beginner'
	GetGlobalTags <song_checksum> param = stars savegame = <savegame>
	GetGlobalTags <song_checksum> param = percent100 savegame = <savegame>
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
	GetGlobalTags <song_checksum> param = stars savegame = <savegame>
	GetGlobalTags <song_checksum> param = percent100 savegame = <savegame>
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
	GetGlobalTags <song_checksum> param = stars savegame = <savegame>
	GetGlobalTags <song_checksum> param = percent100 savegame = <savegame>
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
	GetGlobalTags <song_checksum> param = stars savegame = <savegame>
	GetGlobalTags <song_checksum> param = percent100 savegame = <savegame>
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
	GetGlobalTags <song_checksum> param = stars savegame = <savegame>
	GetGlobalTags <song_checksum> param = percent100 savegame = <savegame>
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
		score_beginner_text = <score_beginner_text>
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
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	if desc_resolvealias \{Name = alias_highlight}
		if GetScreenElementChildren id = <resolved_id>
			(<children> [1]) :obj_spawnscript 0xd5b5a21b
		endif
	endif
endscript

script ui_gig_posters_check_movies_played \{part = Band}
	get_current_band_info
	GetGlobalTags <band_info>
	switch (<part>)
		case guitar
		check = <career_guitar_movies_played>
		case bass
		check = <career_bass_movies_played>
		case drum
		check = <career_drum_movies_played>
		case vocals
		check = <career_vocals_movies_played>
		case Band
		check = <career_band_movies_played>
	endswitch
	return {movies_played = <check>}
endscript

script ui_gig_posters_set_movies_played \{part = Band}

	get_current_band_info
	GetGlobalTags <band_info>
	switch (<part>)
		case guitar
		SetGlobalTags <band_info> params = {career_guitar_movies_played = <value>}
		case bass
		SetGlobalTags <band_info> params = {career_bass_movies_played = <value>}
		case drum
		SetGlobalTags <band_info> params = {career_drum_movies_played = <value>}
		case vocals
		SetGlobalTags <band_info> params = {career_vocals_movies_played = <value>}
		case Band
		SetGlobalTags <band_info> params = {career_band_movies_played = <value>}
	endswitch
endscript

script ui_select_venue_check_ice_movie_played \{part = Band}
	get_current_band_info
	GetGlobalTags <band_info>
	switch (<part>)
		case guitar
		check = <career_guitar_ice_movie_played>
		case bass
		check = <career_bass_ice_movie_played>
		case drum
		check = <career_drum_ice_movie_played>
		case vocals
		check = <career_vocals_ice_movie_played>
		case Band
		check = <career_band_ice_movie_played>
	endswitch
	if (<check> = 1)
		return \{true}
	endif
	return \{FALSE}
endscript

script ui_select_venue_set_ice_movie_played \{part = Band}
	get_current_band_info
	GetGlobalTags <band_info>
	switch (<part>)
		case guitar
		SetGlobalTags <band_info> params = {career_guitar_ice_movie_played = 1}
		case bass
		SetGlobalTags <band_info> params = {career_bass_ice_movie_played = 1}
		case drum
		SetGlobalTags <band_info> params = {career_drum_ice_movie_played = 1}
		case vocals
		SetGlobalTags <band_info> params = {career_vocals_ice_movie_played = 1}
		case Band
		SetGlobalTags <band_info> params = {career_band_ice_movie_played = 1}
	endswitch
endscript

script 0x72ca8448 
	begin
	se_setprops \{texture = 0xd20ee9b5
		time = 0}
	Wait \{0.1
		Seconds}
	se_setprops \{texture = 0x4b07b80f
		time = 0}
	Wait \{0.1
		Seconds}
	se_setprops \{texture = 0x3c008899
		time = 0}
	Wait \{0.1
		Seconds}
	se_setprops \{texture = 0xa2641d3a
		time = 0}
	Wait \{0.1
		Seconds}
	se_setprops \{texture = 0xd5632dac
		time = 0}
	Wait \{0.1
		Seconds}
	repeat
endscript

script ui_gig_posters_play_movie 
	return
	setscriptcannotpause
	clean_up_user_control_helpers
	OnExitRun \{ui_gig_posters_play_movie_destroy}

	menu_music_off
	SpawnScriptNow \{0xb20ce9b6}
	setsoundbussparams {crowd_balance = {vol = (($default_BussSet.crowd_balance.vol) - 100)} time = 2.0}
	setsoundbussparams {Music_Setlist = {vol = (($default_BussSet.Music_Setlist.vol) - 100)} time = 0.5}
	fadetoblack \{On
		time = 0
		alpha = 1.0
		z_priority = 100}
	0xb17a28cd \{condition = {
			0xdffcb66f
		}}
	killallmovies
	Wait \{10
		gameframes}
	set_bink_heap_state \{state = big}
	SoundEvent \{event = precutscene_sfx}
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
	CreateScreenElement \{Type = SpriteElement
		parent = root_window
		id = 0x8d4c8c0e
		texture = 0xd20ee9b5
		Pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		just = [
			left
			top
		]
		z_priority = 9001}
	0x8d4c8c0e :se_setprops \{alpha = 1.0
		time = 0.1}
	RunScriptOnScreenElement \{0x72ca8448
		id = 0x8d4c8c0e}
	CreateScreenElement {
		Type = descinterface
		parent = root_window
		id = silent_movie
		desc = 'silent_movie'
		info_text = <info_text>
		alpha = 0.0
	}
	silent_movie :se_setprops \{alpha = 1.0
		time = 0.1}
	ui_event_wait_for_safe
	0x928a98c9
	Wait \{5
		Seconds}
	silent_movie :se_setprops \{alpha = 0
		time = 0.1}
	0x8d4c8c0e :se_setprops \{alpha = 0
		time = 0.1}
	silent_movie :se_waitprops
	0x8d4c8c0e :se_waitprops
	DestroyScreenElement \{id = silent_movie}
	DestroyScreenElement \{id = 0x8d4c8c0e}
	if GotParam \{0x6d221ff1}
		PlayMovieAndWait movie = <movie> noblack 0x6d221ff1 = true
	else
		PlayMovieAndWait movie = <movie> noblack
	endif
	get_movie_id_by_name movie = <movie>
	SetGlobalTags <id> params = {unlocked = 1} all_active_players = 1
	menu_music_on
	setsoundbussparams {crowd_balance = {vol = (($default_BussSet.crowd_balance.vol))} time = 2.0}
endscript

script ui_gig_posters_play_movie_destroy 
	DestroyScreenElement \{id = silent_movie}
	DestroyScreenElement \{id = 0x8d4c8c0e}
endscript

script ui_gig_posters_play_song 
	if (<unlocked> = 0)
		return
	endif
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	setlist_menu :se_setprops \{block_events}
	if setlist_menu :Menu_SelectedIndexIs \{last}
		Change \{0xc5b91820 = 0}
	else
		setlist_menu :menu_getselectedindex
		Change 0xc5b91820 = (<selected_index>)
	endif
	Change current_song = <song>
	Change current_level = <level>
	Change current_gig_number = <tier_num>
	part = Band
	if ($current_num_players = 1)
		getplayerinfo \{1
			part}
	endif
	ui_gig_posters_check_movies_played part = <part>
	if (($signin_change_happening = 1) || ($invite_controller > -1))
		return
	endif
	generic_event_choose state = uistate_play_song data = {selected_level = <level>}
endscript

script ui_destroy_gig_posters 
	menu_start_transition
	KillSpawnedScript \{Name = ui_create_gig_posters_spawned}
	if NOT (($top_rockers_enabled) || (GotParam from_leaderboard))
		SpawnScriptNow \{0xb20ce9b6}
	endif
	if ScreenElementExists \{id = setlistinterface}
		DestroyScreenElement \{id = setlistinterface}
	endif
	clean_up_user_control_helpers
	fadetoblack \{OFF
		time = 0
		no_wait}
endscript

script ui_gig_posters_focus \{time = 0.1}
	if ScriptIsRunning \{ui_create_gig_posters_spawned}
		time = 0.0
	endif
	GetTags

	if NOT GotParam \{index}
		return
	endif
	destroy_loading_screen \{Force = 1}
	fadetoblack \{OFF
		time = 0}
	se_getparentid
	<parent_id> :GetTags
	if (<prev_index> > <index>)
		pos_move = (0.0, -10.0)
	else
		pos_move = (0.0, 10.0)
	endif
	<ratio> = (<index> / (<total_songs> * 1.0))
	Pos = ((0.0, 1.0) * ((<ratio> * 455) - 230))
	bg_pos = ((0.0, -1.0) * (<ratio> * (4400 - 720)))
	bg_runnerl_pos = (((0.0, -1.0) * (<ratio> * (2200 - 720))) + (-640.0, 0.0))
	overlap = -1.5
	setlistinterface :se_setprops {
		setlist_b_scrollthumb_pos = <Pos>
		setlist_b_bg_pos = <bg_pos>
		setlist_b_bg_runnerl_pos = <bg_runnerl_pos>
		0x514c85e6 = (<bg_runnerl_pos> + ((0.0, 1.0) * (512 + (1 * <overlap>))))
		0x6c2cac56 = (<bg_runnerl_pos> + ((0.0, 1.0) * (1024 + (2 * <overlap>))))
		0xde0c7046 = (<bg_runnerl_pos> + ((0.0, 1.0) * (1536 + (3 * <overlap>))))
		time = 0.0
	}
	<parent_id> :SetTags prev_index = <index>
	if (<highlight> = 0)
		return
	endif
	<info_scores_container_alpha> = 1.0
	<instrument_icons_alpha> = 0.0
	if ($game_mode = p2_pro_faceoff || <unlocked> = 0)
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
		if GotParam \{playback_track1}
			if (<playback_track1> > -1)
				icon_no_instrument_guitar_alpha = 0
			endif
		endif
		if GotParam \{playback_track2}
			if (<playback_track2> > -1)
				icon_no_instrument_bass_alpha = 0
			endif
		endif
		if GotParam \{playback_track_drums}
			if (<playback_track_drums> > 0)
				icon_no_instrument_drums_alpha = 0
			endif
		endif
		if GotParam \{playback_track_vocals}
			if (<playback_track_vocals> > 0)
				icon_no_instrument_mic_alpha = 0
			endif
		endif
	endif
	0x9b0fe74b unlocked = <unlocked> song_title = <song_title> song_artist = <song_artist>
	StringToCharArray string = <song_text>
	GetArraySize <char_array>
	if (<unlocked> = 1)
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
			icon_difficulty_expert_plus_alpha = 0
			<highest_stars_difficulty_text> = qs(0x739da581)
		else
			icon_difficulty_expert_alpha = 0
			icon_difficulty_expert_plus_alpha = 0
		endif
		song_info_icon_alpha = 0
		if (<new_song_info> = 1)
			<song_info_icon_alpha> = 1
		endif
	else
		icon_no_instrument_guitar_alpha = 0
		icon_no_instrument_bass_alpha = 0
		icon_no_instrument_drums_alpha = 0
		icon_no_instrument_mic_alpha = 0
		difficulty_and_stars_alpha = 0
		double_kick_alpha = 0
		song_info_icon_alpha = 0
		icon_difficulty_expert_alpha = 0
		icon_difficulty_expert_plus_alpha = 0
	endif
	se_setprops {
		desc = 'setlist_b_info2_desc'
		auto_dims = FALSE
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
	Obj_GetID
	<objID> :Obj_SpawnScriptNow ui_gig_posters_highlight_motion
	if (<unlocked> = 0)
		gig_posters_song_focus
		return
	endif
	Change current_song_info_id = <objID>
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
	formatText checksumName = percent100 '%s_percent100' s = (<percent_diffs> [<highest_stars_difficulty_index>])
	if GotParam <percent100>
		if <objID> :desc_resolvealias Name = alias_stars
			if (<...>.<percent100> = 1)
				<resolved_id> :se_setprops star_texture = song_complete_star_perfect star_rgba = [255 255 255 255]
			endif
			if <resolved_id> :desc_resolvealias Name = alias_stars
				GetScreenElementChildren id = <resolved_id>
				num_stars = (<...>.(<star_diffs> [<highest_stars_difficulty_index>]))
				if (<num_stars> = 0)
					<resolved_id> :se_setprops alpha = 0
				else
					GetArraySize <children>
					stars_left = <array_Size>
					if (<num_stars> < 5 && <stars_left> = 5)
						if ScreenElementExists id = (<children> [0])
							DestroyScreenElement id = (<children> [0])
							stars_left = (<stars_left> - 1)
						endif
					endif
					if (<num_stars> < 4 && <stars_left> = 4)
						if ScreenElementExists id = (<children> [1])
							DestroyScreenElement id = (<children> [1])
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
	if <objID> :desc_resolvealias Name = alias_setlist_info_title_artist
		GetScreenElementChildren id = <resolved_id>
		GetScreenElementProps id = (<children> [0]) force_update
		<width> = (<dims>.(1.0, 0.0) * <Scale>.(1.0, 0.0))
		<double_kick_offset> = ((1.0, 0.0) * ((<width> / 2) + 12))
		<new_pos> = ((0.0, -30.0) - <double_kick_offset>)
		<objID> :se_setprops double_kick_pos = <new_pos>
	endif
	if (<tag_selected_index> < <section_breaker_index_3>)
		gig_posters_song_focus song = <song>
	else
		gig_posters_song_focus
	endif
	if (<new_song_info> = 1)
		<objID> :Obj_SpawnScriptNow song_info_icon_motion
		setlist_menu :SetTags \{pulse_song_extras = 1}
	else
		setlist_menu :SetTags \{pulse_song_extras = 0}
	endif
	setlist_menu :SetTags last_focused_song = <song>
	if NOT GotParam \{jam_song}
		ui_gig_posters_update_current_section index = <tag_selected_index> song = <song>
	else
		ui_gig_posters_update_current_section index = <tag_selected_index> song = <song> jam_song = <jam_song>
	endif
endscript

script ui_gig_posters_unfocus 
	GetTags
	0x9b0fe74b unlocked = <unlocked> song_title = <song_title> song_artist = <song_artist>
	getplayerinfo \{1
		double_kick_drum}
	<double_kick_alpha> = 0
	se_setprops {
		desc = 'setlist_b_listing_desc'
		auto_dims = FALSE
		dims = (0.0, 50.0)
		listing_text = <song_text>
		double_kick_alpha = <double_kick_alpha>
		stars_alpha = 1
		<difficulty_tags>
	}
	move_double_kick = 1
	if GotParam \{fading_in}
		if (<fading_in> = 1)
			<move_double_kick> = 0
			SetTags \{fading_in = 0}
		endif
	endif
	if (<move_double_kick> = 1)
		if desc_resolvealias \{Name = alias_listing}
			GetScreenElementChildren id = <resolved_id>
			GetScreenElementPosition id = <resolved_id> summed
			<text_pos> = <screenelementpos>
			GetScreenElementProps id = (<children> [0]) force_update
			<width> = (<dims>.(1.0, 0.0) * <Scale>.(1.0, 0.0))
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
	Obj_GetID
	formatText checksumName = percent100 '%s_percent100' s = (<percent_diffs> [<highest_stars_difficulty_index>])
	if <objID> :desc_resolvealias Name = alias_stars
		if (<...>.<percent100> = 1)
			<objID> :se_setprops star_rgba = [255 255 255 175]
		endif
		GetScreenElementChildren id = <resolved_id>
		num_stars = (<...>.(<star_diffs> [<highest_stars_difficulty_index>]))
		if (<num_stars> = 0)
			<resolved_id> :se_setprops alpha = 0
		else
			GetArraySize <children>
			stars_left = <array_Size>
			if (<num_stars> < 5 && <stars_left> = 5)
				if ScreenElementExists id = (<children> [4])
					DestroyScreenElement id = (<children> [4])
					stars_left = (<stars_left> - 1)
				endif
			endif
			if (<num_stars> < 4 && <stars_left> = 4)
				if ScreenElementExists id = (<children> [3])
					DestroyScreenElement id = (<children> [3])
				endif
			endif
		endif
	endif
endscript

script ui_gig_posters_update_current_section 
	setlist_menu :GetTags
	if (<index> >= <section_breaker_index_3>)
		<current_section> = 3
	elseif (<tag_selected_index> >= <section_breaker_index_2>)
		<current_section> = 2
	elseif (<tag_selected_index> >= <section_breaker_index_1>)
		<current_section> = 1
	endif

	setlist_menu :SetTags current_section = <current_section>
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
			if (<pulse_song_extras> = 1)
				SpawnScriptNow pulsate_helper_pill params = {id = <helper_pill_id> time = 0.5 delay_time = 0}
			else
				KillSpawnedScript \{Name = pulsate_helper_pill}
			endif
		endif
		setlist_show_jump_helper_text
		if ($game_mode = gh4_p1_career ||
				$game_mode = gh4_p2_career ||
				$game_mode = gh4_p3_career ||
				$game_mode = gh4_p4_career)
			if ($enable_button_cheats = 1)
				add_user_control_helper \{text = qs(0x91fff11f)
					button = lb
					z = 100000}
			endif
		endif
	endif
endscript

script ui_gig_posters_debug_complete 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if ($enable_button_cheats = 0)
		return
	endif
	i = 1
	begin
	getplayerinfo <i> part
	getplayerinfo <i> controller
	getsavegamefromcontroller controller = <controller>
	GetGlobalTags <song_checksum> param = stars
	<old_stars> = <stars>
	SetGlobalTags <song_checksum> savegame = <savegame> params = {unlocked = 1 stars = 5 score = 1000}
	SetGlobalTags <song> savegame = <savegame> params = {unlocked = 1}
	if (<part> = drum)
		getplayerinfo <i> double_kick_drum
		if (<double_kick_drum> = 1)
			SetGlobalTags <song_checksum> savegame = <savegame> params = {double_bass_complete = 1}
		endif
	endif
	i = (<i> + 1)
	repeat ($current_num_players)
	ui_event \{event = menu_refresh}
endscript

script ui_gig_posters_choose 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	ui_event event = menu_change data = {state = uistate_play_song <...>}
endscript

script song_info_icon_motion 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	if desc_resolvealias \{Name = alias_song_info_icon}
		if GetScreenElementChildren id = <resolved_id>
			GetArraySize <children>
			prev = 0
			curr = 1
			begin
			prev_id = (<children> [<prev>])
			curr_id = (<children> [<curr>])
			if ScreenElementExists id = <prev_id>
				<prev_id> :se_setprops alpha = 0.0
			endif
			if ScreenElementExists id = <curr_id>
				<curr_id> :se_setprops alpha = 1
			endif
			prev = <curr>
			next = RandomInteger (0.0, 1.0)
			if (<next> = <prev>)
				curr = (<curr> + 1)
			else
				curr = <next>
			endif
			if (<curr> >= <array_Size>)
				curr = 0
			endif
			Wait \{0.1
				Second}
			repeat
		endif
	endif
endscript

script ui_gig_posters_popups 

	Change \{ui_gig_posters_skip_helpers = 0}
	get_current_band_info
	GetGlobalTags <band_info> params = {first_career_setlist}
	getplayerinfo \{1
		part}
	getplayerinfo \{1
		double_kick_drum}
	if (<part> = drum && <double_kick_drum> = 1)
		GetGlobalTags <band_info> params = {first_setlist_drum}
		if (<first_setlist_drum> = 1 && <first_career_setlist> = 0)
			Change \{ui_gig_posters_skip_helpers = 1}
			ui_event_wait \{state = uistate_double_bass_popup
				data = {
					is_popup
				}}
			SetGlobalTags <band_info> params = {first_setlist_drum = 0}
		endif
	endif
endscript

script get_prev_total_songs 
	switch <part>
		case guitar
		GetGlobalTags <band_info> params = {career_guitar_prev_total_songs = <final_num_songs>}
		return prev_total_songs = <career_guitar_prev_total_songs>
		case bass
		GetGlobalTags <band_info> params = {career_bass_prev_total_songs = <final_num_songs>}
		return prev_total_songs = <career_bass_prev_total_songs>
		case drum
		GetGlobalTags <band_info> params = {career_drum_prev_total_songs = <final_num_songs>}
		return prev_total_songs = <career_drum_prev_total_songs>
		case vocals
		GetGlobalTags <band_info> params = {career_vocals_prev_total_songs = <final_num_songs>}
		return prev_total_songs = <career_vocals_prev_total_songs>
		case Band
		GetGlobalTags <band_info> params = {career_band_prev_total_songs = <final_num_songs>}
		return prev_total_songs = <career_band_prev_total_songs>
	endswitch
endscript

script set_prev_total_songs 
	switch <part>
		case guitar
		SetGlobalTags <band_info> params = {career_guitar_prev_total_songs = <final_num_songs>}
		case bass
		SetGlobalTags <band_info> params = {career_bass_prev_total_songs = <final_num_songs>}
		case drum
		SetGlobalTags <band_info> params = {career_drum_prev_total_songs = <final_num_songs>}
		case vocals
		SetGlobalTags <band_info> params = {career_vocals_prev_total_songs = <final_num_songs>}
		case Band
		SetGlobalTags <band_info> params = {career_band_prev_total_songs = <final_num_songs>}
	endswitch
endscript

script 0xeea8ea73 
	generic_event_replace state = uistate_select_venue data = {gig_index = <gig_index>}
endscript

script 0x9b0fe74b \{unlocked = 1}
	if (<unlocked> = 1)
		formatText TextName = song_text qs(0x90e80fb9) a = <song_artist> t = <song_title>
	else
		song_text = qs(0x3b78ba7f)
	endif
	return song_text = <song_text>
endscript
