song_summary_details_row_count = 0
song_summary_details_row_display_max = 7

script ui_init_song_summary_details 
	Change \{respond_to_signin_changed_func = ui_signin_changed_func}
endscript

script ui_create_song_summary_details \{for_transition = 0}
	SoundEvent \{event = menu_song_complete_in}
	Change \{song_summary_details_row_count = 0}
	getnumplayersingame \{on_screen}
	gamemode_gettype
	if (<Type> != practice)
		RequireParams \{[
				transition_param
			]
			all}
	endif
	song_details_set_mins_and_maxes
	gig_details = ($song_stats_backup)
	GetArraySize <gig_details>
	if (<array_Size> = 0)
		ScriptAssert \{qs(0x1173f3e0)}
	endif
	getfirstplayer \{on_screen}
	get_song_title song = ((<gig_details> [(<Player> - 1)]).song)
	CreateScreenElement {
		parent = root_window
		id = stats_summary_id
		Type = descinterface
		desc = 'song_summary_details_gh5'
		Pos = (0.0, 0.0)
		z_priority = 0
		song_title_text = <song_title>
		tags = {
			left_displayed_player_num = 1
			can_scroll_players = 0
		}
	}
	if ((<Type> = career) || (<Type> = quickplay))
		if isSinglePlayerGame
			stats_summary_id :se_setprops \{yellow_sub_title_alpha = 0}
		else
			getplayerinfo <Player> Band
			band_moments_hit = ($song_stats_backup_band [(<Band> - 1)].band_moments_hit)
			band_moments_possible = ($song_stats_backup_band [(<Band> - 1)].band_moments_possible)
			formatText TextName = band_moments qs(0xf826750a) h = <band_moments_hit> p = <band_moments_possible>
			stats_summary_id :se_setprops {
				band_moments_text = <band_moments>
			}
		endif
	else
		stats_summary_id :se_setprops \{yellow_sub_title_alpha = 0}
	endif
	if NOT stats_summary_id :desc_resolvealias \{Name = alias_song_summary_details_list
			param = details_list_alias}
		ScriptAssert \{qs(0xf31b08af)}
	endif
	if (<num_players_shown> > 0)
		exclusive_device = []
		if (<num_players_shown> > 4)
			stats_summary_id :SetTags \{can_scroll_players = 1}
		endif
		getfirstplayer \{on_screen}
		begin
		getplayerinfo <Player> part
		getplayerinfo <Player> difficulty
		switch (<part>)
			case guitar
			icon_texture = mixer_icon_guitar
			case bass
			icon_texture = mixer_icon_bass
			case drum
			icon_texture = mixer_icon_drums
			case vocals
			icon_texture = mixer_icon_vox
		endswitch
		switch (<difficulty>)
			case beginner
			diff_texture = icon_difficulty_beginner
			case easy
			diff_texture = icon_difficulty_easy
			case medium
			diff_texture = icon_difficulty_medium
			case hard
			diff_texture = icon_difficulty_hard
			case expert
			diff_texture = icon_difficulty_expert
			if (<part> = drum)
				getplayerinfo <Player> double_kick_drum
				if (<double_kick_drum> = 1)
					diff_texture = icon_difficulty_expert_plus
				endif
			endif
		endswitch
		ui_song_breakdown_get_player_display_name player_index = <Player>
		formatText checksumName = alpha_check 'icons_p%d_alpha' d = <Player>
		formatText checksumName = inst_check 'instrument_p%d_texture' d = <Player>
		formatText checksumName = diff_check 'DIFFICULTY_p%d_texture' d = <Player>
		my_struct = {}
		AddParam structure_name = my_struct Name = <alpha_check> value = 1
		AddParam structure_name = my_struct Name = <inst_check> value = <icon_texture>
		AddParam structure_name = my_struct Name = <diff_check> value = <diff_texture>
		<details_list_alias> :se_setprops <my_struct>
		formatText checksumName = player_color_left 'gamer_tag_bg_0%d_rgba' d = <Player>
		formatText checksumName = player_alpha 'gamer_tag_0%d_alpha' d = <Player>
		formatText checksumName = player_color_right 'p%d_md' d = <Player>
		formatText checksumName = player_name 'gamer_tag_0%d_text' d = <Player>
		AddParam structure_name = gamertag_struct Name = <player_color_left> value = <player_color_right>
		AddParam structure_name = gamertag_struct Name = <player_alpha> value = 1
		AddParam structure_name = gamertag_struct Name = <player_name> value = <player_name_text>
		stats_summary_id :se_setprops {
			<gamertag_struct>
		}
		<bot_play> = 0
		getplayerinfo <Player> bot_play
		if (<bot_play> = 1)
			getplayerinfo <Player> bot_original_controller
			controller = <bot_original_controller>
		else
			getplayerinfo <Player> controller
		endif
		AddArrayElement array = <exclusive_device> element = <controller>
		<exclusive_device> = <array>
		getnextplayer on_screen Player = <Player>
		repeat <num_players_shown>
	endif
	if (<Type> = competitive)
		if ((($competitive_rules) = momentum) || (($competitive_rules) = team_momentum))
			<details_list_alias> :se_setprops difficulty_alpha = 0
		endif
	endif
	stats_summary_id :se_setprops {
		exclusive_device = <exclusive_device>
	}
	song_details_create_scrolling_menu {
		for_transition = <for_transition>
		exclusive_device = <exclusive_device>
	}
	if (<Type> = practice)
		extra_row = 0
	else
		extra_row = 1
	endif
	num_rows_remaining = ($song_summary_details_row_display_max)
	song_summary_details_create_song_header gig_details = <gig_details>
	<num_rows_remaining> = (<num_rows_remaining> - 3)
	Change song_summary_details_row_count = (($song_summary_details_row_count) + 3)
	if NOT (<Type> = practice)
		song_details_add_space_to_table
		Change song_summary_details_row_count = (($song_summary_details_row_count) + 1)
		<num_rows_remaining> = (<num_rows_remaining> - 1)
	else
		<id> :se_setprops {avg_multiplier_alpha = 0}
	endif
	if (<non_vocalist> > 0)
		<sections> = ((<gig_details> [(<non_vocalist> -1)]).section_names)
		GetArraySize <sections>
		song_summary_details_should_hide_last_section sections = <sections>
		Change song_summary_details_row_count = (($song_summary_details_row_count) + (<array_Size> - <should_hide>))
		list_menu :SetTags num_non_vocal_sections = (<array_Size> - <should_hide>)
		if (<array_Size> > 0)
			if (<array_Size> >= <num_rows_remaining>)
				num_loops = <num_rows_remaining>
				num_rows_remaining = 0
				list_menu :SetTags \{bottom_row_index = 4}
			else
				num_loops = <array_Size>
				<num_rows_remaining> = (<num_rows_remaining> - <array_Size>)
				list_menu :SetTags {
					bottom_row_index = <array_Size>
				}
			endif
			i = 0
			begin
			song_summary_details_create_non_vocals_section_entry {
				gig_details = <gig_details>
				sections = <sections>
				section_index = <i>
			}
			i = (<i> + 1)
			repeat <num_loops>
		endif
	endif
	if NOT (<vocalist> = 0)
		vocal_sections = ((<gig_details> [(<vocalist> -1)]).section_names)
		i = 0
		GetArraySize <vocal_sections>
		song_summary_details_should_hide_last_section sections = <vocal_sections>
		Change song_summary_details_row_count = (($song_summary_details_row_count) + (<array_Size> - <should_hide>))
		list_menu :SetTags num_vocal_sections = (<array_Size> - <should_hide>)
		if (<num_rows_remaining> > 0)
			if (<array_Size> > 0)
				if (<array_Size> >= <num_rows_remaining>)
					num_loops = <num_rows_remaining>
					num_rows_remaining = 0
					list_menu :SetTags \{bottom_row_index = 4}
				else
					num_loops = <array_Size>
					<num_rows_remaining> = (<num_rows_remaining> - <array_Size>)
					list_menu :SetTags {
						bottom_row_index = <array_Size>
					}
				endif
				begin
				song_summary_details_create_vocals_section_entry {
					gig_details = <gig_details>
					vocal_sections = <vocal_sections>
					section_index = <i>
				}
				i = (<i> + 1)
				repeat <num_loops>
			endif
		endif
	endif
	SetScreenElementProps {
		id = list_menu
		tags = {current = 0 fit = 7 total = (($song_summary_details_row_count) - 2)}
	}
	if should_use_all_buttons
		all_button_params = {all_buttons}
	endif
	if ($is_network_game = 1)
		if ScreenElementExists \{id = stats_summary_id}
			gamemode_gettype
			GetNumPlayers
			get_local_players_in_game
			if (<num_local_players> < <num_players>)
				if ((<Type> = career) || (<Type> = quickplay))
					if ((<transition_param> != end_of_setlist_transition) && (<transition_param> != net_transition_not_career))
						if ((<transition_param> = continue_setlist_transition) || (<transition_param> = add_setlist_continue_handlers))
							stats_summary_id :Obj_SpawnScriptNow net_ui_song_breakdown_start_timer_spawned params = {<transition_param> continue_to_next_song}
						else
							stats_summary_id :Obj_SpawnScriptNow net_ui_song_breakdown_start_timer_spawned params = {<transition_param>}
						endif
					endif
				elseif (<Type> = competitive)
					stats_summary_id :Obj_SpawnScriptNow net_ui_song_breakdown_competitive_start_timer_spawned params = {<transition_param>}
				endif
			endif
		endif
	else
		if ScreenElementExists \{id = stats_summary_id}
			stats_summary_id :se_setprops \{net_timer_text_alpha = 0}
		endif
	endif
	add_user_control_helper text = qs(0xaf4d5dd2) button = red <all_button_params> z = 100000
	if ininternetmode
		add_user_control_helper text = qs(0xd16792bf) button = yellow <all_button_params> z = 100000
	endif
	stats_summary_id :GetSingleTag \{can_scroll_players}
	if (<can_scroll_players> = 1)
		add_user_control_helper text = qs(0xf65ffd8f) button = blue <all_button_params> z = 100000
		add_user_control_helper text = qs(0x1e9bfbbc) button = orange <all_button_params> z = 100000
	endif
	LaunchEvent \{Type = focus
		target = list_menu}
	if stats_summary_id :desc_resolvealias \{Name = alias_bkg_anim
			param = bkg_anim_id}
		<bkg_anim_id> :obj_spawnscript ui_shakey
	else
		ScriptAssert \{'dschorn1'}
	endif
	if stats_summary_id :desc_resolvealias \{Name = alias_bkg_anim
			param = bkg_anim_id}
		<bkg_anim_id> :obj_spawnscript ui_frazzmatazz_02
	else
		ScriptAssert \{'dschorn1'}
	endif
	if stats_summary_id :desc_resolvealias \{Name = alias_banner
			param = banner_id}
		<banner_id> :obj_spawnscript ui_shakey
	else
		ScriptAssert \{'dschorn1'}
	endif
	if stats_summary_id :desc_resolvealias \{Name = alias_banner
			param = banner_id}
		<banner_id> :obj_spawnscript ui_frazzmatazz
	else
		ScriptAssert \{'dschorn1'}
	endif
endscript

script ui_destroy_song_summary_details 
	SoundEvent \{event = menu_song_complete_out}
	KillSpawnedScript \{Name = net_ui_song_breakdown_start_timer_spawned}
	clean_up_user_control_helpers
	if ScreenElementExists \{id = stats_summary_id}
		if stats_summary_id :GetSingleTag \{players_list_id}
			if ScreenElementExists id = <players_list_id>
				DestroyScreenElement id = <players_list_id>
			endif
		endif
		DestroyScreenElement \{id = stats_summary_id}
	endif
endscript

script ui_return_song_summary_details 
	if ScreenElementExists \{id = band_lobby_popup_menu}
		band_lobby_update_button_helpers controller = ($primary_controller) menu = playerslist
	else
		if ininternetmode
			GetNumPlayers
			get_local_players_in_game
			if (<num_local_players> >= <num_players>)
				clean_up_user_control_helpers
				all_button_params = {}
				if should_use_all_buttons
					all_button_params = {all_buttons}
				endif
				LaunchEvent \{Type = focus
					target = stats_summary_id}
				LaunchEvent \{Type = focus
					target = list_menu}
				add_user_control_helper text = qs(0x67d9c56d) button = red <all_button_params> z = 100000
			endif
		endif
	endif
endscript

script my_color_interp \{val = 100
		Player = 1}
	array = [0 0 0 255]
	min = (($min_percents) [(<Player> -1)])
	if (<val> = 100)
		Color = [0 200 0 255]
	elseif (<val> <= 90 && <val> = <min>)
		Color = [225 30 30 255]
	else
		Color = [255 255 255 255]
	endif
	return Color = <Color>
endscript
min_percents = [
]
max_percents = [
]

script reset_mins_and_maxes 
	Change \{my_min = [
		]}
	Change \{my_max = [
		]}
endscript

script song_details_set_mins_and_maxes 
	gig_details = ($song_stats_backup)
	local_mins = [101 101 101 101 101 101 101 101]
	local_maxs = [-1 -1 -1 -1 -1 -1 -1 -1]
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		sections = ((<gig_details> [(<Player> - 1)]).section_names)
		section_hits_array = ((<gig_details> [(<Player> - 1)]).detailed_stats)
		section_max_array = ((<gig_details> [(<Player> - 1)]).detailed_stats_max)
		GetArraySize <sections>
		if (<array_Size> > 0)
			j = 0
			begin
			section_max = (<section_max_array> [<j>] * 1.0)
			if NOT (<section_max> <= 0)
				section_hits = (<section_hits_array> [<j>] * 1.0)
				percent = (((<section_hits> * 1.0) / (<section_max> * 1.0)) * 100)
				MathFloor <percent>
				CastToInteger \{percent}
				if (<percent> < <local_mins> [(<Player> - 1)])
					SetArrayElement ArrayName = local_mins index = (<Player> - 1) NewValue = <percent>
				endif
				if (<percent> > <local_maxs> [(<Player> - 1)])
					SetArrayElement ArrayName = local_maxs index = (<Player> - 1) NewValue = <percent>
				endif
			endif
			j = (<j> + 1)
			repeat <array_Size>
		endif
		getnextplayer on_screen Player = <Player>
		repeat <num_players_shown>
	endif
	Change min_percents = <local_mins>
	Change max_percents = <local_maxs>
endscript

script song_details_create_scrolling_menu 
	RequireParams \{[
			exclusive_device
		]
		all}
	gamemode_gettype
	is_practice = 0
	if (<Type> = practice)
		<is_practice> = 1
	endif
	if NOT stats_summary_id :desc_resolvealias \{Name = alias_stats_smenu}
		ScriptAssert \{qs(0xf31b08af)}
	endif
	<resolved_id> :se_setprops {
		top_selection = true
	}
	if NOT stats_summary_id :desc_resolvealias \{Name = alias_stats_vmenu}
		ScriptAssert \{qs(0xf31b08af)}
	endif
	AssignAlias id = <resolved_id> alias = list_menu
	list_menu :SetTags \{top_row_index = 0
		bottom_row_index = 1
		num_non_vocal_sections = 0
		num_vocal_sections = 0
		vocalist_pnum = 0
		non_vocalist_pnum = 0}
	array = [
		{pad_up ui_song_details_shift params = {up}}
		{
			pad_up
			ui_song_summary_details_scroll_stats
			params = {
				direction = up
				is_practice = <is_practice>
			}
		}
		{pad_down ui_song_details_shift params = {down}}
		{
			pad_down
			ui_song_summary_details_scroll_stats
			params = {
				direction = down
				is_practice = <is_practice>
			}
		}
		{pad_back generic_event_back}
		{pad_option ui_song_summary_details_scroll_players params = {direction = left}}
		{pad_L1 ui_song_summary_details_scroll_players params = {direction = right}}
	]
	if ininternetmode
		AddArrayElement {
			array = <array>
			element = {
				pad_option2
				net_ui_song_breakdown_show_players_list
				params = {
					screen_id = stats_summary_id
					destroy_players_list_script = net_ui_song_summary_details_destroy_players_list
				}
			}
		}
	endif
	list_menu :se_setprops {
		event_handlers = <array>
		exclusive_device = <exclusive_device>
	}
	SetScreenElementProps \{id = stats_summary_id
		arrow_top_alpha = 0}
endscript

script song_details_add_space_to_table 
	CreateScreenElement \{parent = list_menu
		Type = descinterface
		autosizedims = true
		desc = 'song_summary_details_list_entry_gh5'
		verse_text = qs(0x00000000)
		percent_p1_text = qs(0x00000000)
		percent_p2_text = qs(0x00000000)
		percent_p3_text = qs(0x00000000)
		percent_p4_text = qs(0x00000000)}
endscript

script ui_song_details_shift 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	GetTags
	gamemode_gettype
	if (<Type> = practice)
		extra_row = 0
	else
		extra_row = 1
	endif
	if GotParam \{down}
		if (<current> >= (<total> - <fit>))
			return
		endif
		SetTags current = (<current> + 1)
		generic_menu_up_or_down_sound \{down}
	else
		if (<current> <= 0)
			return
		endif
		SetTags current = (<current> - 1)
		generic_menu_up_or_down_sound \{up}
	endif
	GetTags
	Max = ((<total> - <fit>))
	dx = (228.0 / <Max>)
	Pos = ((0.0, 92.0) + ((0.0, 1.0) * (<current> * <dx>)))
	stats_summary_id :se_setprops slider_nub_cont_pos = <Pos> time = 0.1
endscript

script ui_song_summary_details_anim_in 
	SoundEvent \{event = menu_song_complete_in}
	printf \{channel = mychannel
		qs(0x69a79a5b)}
	if ScreenElementExists \{id = stats_summary_id}
		SetScreenElementProps \{id = stats_summary_id
			Pos = {
				(1200.0, 0.0)
				relative
			}
			time = 0.1}
		Wait \{0.2
			Second}
	endif
endscript

script ui_song_summary_details_anim_out 
	SoundEvent \{event = menu_song_complete_out}
	printf \{channel = mychannel
		qs(0x53871813)}
	if ScreenElementExists \{id = stats_summary_id}
		SetScreenElementProps \{id = stats_summary_id
			Pos = {
				(1400.0, 0.0)
				relative
			}
			time = 0.1}
		Wait \{0.2
			Second}
	endif
endscript

script song_summary_details_create_song_header 
	RequireParams \{[
			gig_details
		]
		all}
	gamemode_gettype
	sp_phrases_alpha = 1
	if (<Type> = competitive)
		if ((($competitive_rules) != faceoff) && (($competitive_rules) != team_faceoff))
			<sp_phrases_alpha> = 0
		endif
	endif
	CreateScreenElement {
		parent = list_menu
		id = header_desc_id
		Type = descinterface
		autosizedims = true
		desc = 'song_summary_details_song_header_gh5'
		sp_phrases_alpha = <sp_phrases_alpha>
		z_priority = 20
	}
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		vocalist = 0
		non_vocalist = 0
		i = 1
		getfirstplayer \{on_screen}
		begin
		getplayerinfo <Player> part
		getplayerinfo <Player> difficulty
		if (<part> = vocals)
			vocalist = <Player>
		elseif (<non_vocalist> = 0)
			non_vocalist = <Player>
		endif
		player_data = (<gig_details> [(<Player> -1)])
		if (<part> = vocals)
			vocal_phrase_max_qual = (<player_data>.vocal_phrase_max_qual)
			vocal_phrase_quality = (<player_data>.vocal_phrase_quality)
			if (<vocal_phrase_max_qual> > 0)
				vocal_phrase_pct = (((<vocal_phrase_quality> * 1.0) / <vocal_phrase_max_qual>) * 100.0)
				MathFloor <vocal_phrase_pct>
				<vocal_phrase_pct> = <floor>
				if (<vocal_phrase_pct> = 0 && <vocal_phrase_quality> > 0)
					<vocal_phrase_pct> = 1
				endif
				formatText TextName = notes_hit_entry qs(0x581d2af2) p = <vocal_phrase_pct> DecimalPlaces = 0
				notes_hit_entry = (<notes_hit_entry> + qs(0x0c40a1b2))
			else
				<notes_hit_entry> = qs(0x6a5cf46c)
			endif
			if (<Type> = practice)
				<sp_entry> = qs(0x6a5cf46c)
			else
				formatText TextName = sp_entry qs(0x2ba0d6d6) g = (<player_data>.sp_phrases_hit) p = (<player_data>.sp_phrases_total)
			endif
		else
			if (<Type> = practice)
				<sp_entry> = qs(0x6a5cf46c)
			else
				formatText TextName = sp_entry qs(0x2ba0d6d6) g = (<player_data>.sp_phrases_hit) p = (<player_data>.sp_phrases_total)
			endif
			if (<Type> = practice)
				formatText TextName = notes_hit_entry qs(0x2ba0d6d6) g = (<player_data>.notes_hit) p = (<player_data>.total_notes)
			elseif (<Type> = competitive)
				total_notes = (<player_data>.notes_created)
				getplayerinfo <Player> bot_play
				getplayerinfo <Player> is_local_client
				if (<bot_play> = 1 || <is_local_client> = 0)
					total_notes = ((<player_data>.notes_created) / 2)
					CastToInteger \{total_notes}
				endif
				formatText TextName = notes_hit_entry qs(0x2ba0d6d6) g = (<player_data>.notes_hit) p = <total_notes>
			else
				formatText TextName = notes_hit_entry qs(0x2ba0d6d6) g = (<player_data>.notes_hit) p = (<player_data>.max_notes)
			endif
		endif
		if (<Type> = competitive)
			if (($competitive_rules = momentum) || ($competitive_rules = team_momentum))
				formatText \{TextName = mult_entry
					qs(0x6a5cf46c)}
			else
				formatText TextName = mult_entry qs(0x1ad7e10a) p = (<player_data>.avg_multiplier)
			endif
		else
			formatText TextName = mult_entry qs(0x1ad7e10a) p = (<player_data>.avg_multiplier)
		endif
		formatText TextName = score_entry qs(0x5d9eae64) g = (<player_data>.score)
		formatText checksumName = notes_hit_cs 'notes_hit_entry_text_p%j' j = <Player>
		formatText checksumName = sp_phrases_cs 'sp_phrases_entry_text_p%j' j = <Player>
		formatText checksumName = avg_mult_cs 'avg_multiplier_entry_text_p%j' j = <Player>
		formatText checksumName = score_cs 'score_entry_text_p%j' j = <Player>
		AddParam Name = <score_cs> structure_name = header_struct value = <score_entry>
		AddParam Name = <notes_hit_cs> structure_name = header_struct value = <notes_hit_entry>
		AddParam Name = <sp_phrases_cs> structure_name = header_struct value = <sp_entry>
		if NOT (<Type> = practice)
			AddParam Name = <avg_mult_cs> structure_name = header_struct value = <mult_entry>
		endif
		<id> :se_setprops <header_struct>
		formatText checksumName = entry_alpha 'entries_p%i_alpha' i = <Player>
		AddParam Name = <entry_alpha> structure_name = entry_alpha_struct value = 1.0
		getnextplayer on_screen Player = <Player>
		<i> = (<i> + 1)
		repeat (<num_players_shown>)
		<id> :se_setprops <entry_alpha_struct>
		<entry_alpha_struct> = {}
		list_menu :SetTags {
			vocalist_pnum = <vocalist>
			non_vocalist_pnum = <non_vocalist>
		}
		return {
			vocalist = <vocalist>
			non_vocalist = <non_vocalist>
		}
	endif
endscript

script song_summary_details_create_non_vocals_section_entry 
	RequireParams \{[
			gig_details
			sections
			section_index
		]
		all}
	i = <section_index>
	section_added = 0
	if NOT ((<sections> [<i>]) = qs(0x00167369))
		CreateScreenElement {
			parent = list_menu
			Type = descinterface
			autosizedims = true
			desc = 'song_summary_details_list_entry_gh5'
			verse_text = (<sections> [<i>])
			percent_p1_text = qs(0x00000000)
			percent_p2_text = qs(0x00000000)
			percent_p3_text = qs(0x00000000)
			percent_p4_text = qs(0x00000000)
		}
		getnumplayersingame \{on_screen}
		if (<num_players_shown> > 0)
			getfirstplayer \{on_screen}
			begin
			getplayerinfo <Player> part
			if (<part> = vocals)
			else
				section_hits = (((<gig_details> [(<Player> -1)]).detailed_stats) [<i>] * 1.0)
				section_possibles = (((<gig_details> [(<Player> -1)]).detailed_stats_max) [<i>] * 1.0)
				section_hits = (<section_hits> * 1.0)
				my_struct = {}
				if (<section_possibles> = 0)
					formatText \{TextName = player_percent
						qs(0x6a5cf46c)}
					formatText checksumName = field_name 'percent_p%d_text' d = <Player>
					AddParam Name = <field_name> structure_name = my_struct value = <player_percent>
					<id> :se_setprops <my_struct>
				else
					percent = (((<section_hits> * 1.0) / <section_possibles>) * 100)
					MathFloor <percent>
					CastToInteger \{percent}
					my_color_interp val = <floor> Player = <Player>
					formatText TextName = player_percent qs(0x76b3fda7) d = <floor>
					player_percent = (<player_percent> + qs(0x0c40a1b2))
					formatText checksumName = field_name 'percent_p%d_text' d = <Player>
					formatText checksumName = field_name_rgba 'percent_p%d_rgba' d = <Player>
					AddParam Name = <field_name> structure_name = my_struct value = <player_percent>
					AddParam Name = <field_name_rgba> structure_name = my_struct value = <Color>
					<id> :se_setprops <my_struct>
				endif
			endif
			formatText checksumName = entry_alpha 'percent_P%i_alpha' i = <Player>
			AddParam Name = <entry_alpha> structure_name = entry_alpha_struct value = 1.0
			getnextplayer on_screen Player = <Player>
			repeat (<num_players_shown>)
			<id> :se_setprops <entry_alpha_struct>
			<entry_alpha_struct> = {}
		endif
		<section_added> = 1
	endif
	return section_added = <section_added>
endscript

script song_summary_details_create_vocals_section_entry 
	RequireParams \{[
			gig_details
			vocal_sections
			section_index
		]
		all}
	i = <section_index>
	section_added = 0
	freeform_verse = FALSE
	if NOT ((<vocal_sections> [<i>]) = qs(0x00167369))
		if ((<vocal_sections> [<i>]) = qs(0x00000000))
			verse_text = qs(0x4db2ad32)
			freeform_verse = true
		else
			shortenuistring {
				ui_string = (<vocal_sections> [<i>])
				max_len = 24
			}
			verse_text = <short_ui_string>
		endif
		RemoveParameter \{verse_rgba}
		if LocalizedStringEquals a = (<vocal_sections> [<i>]) b = $vocal_marker_freeform
			<verse_rgba> = $vocal_marker_freeform_rgba
		endif
		CreateScreenElement {
			parent = list_menu
			Type = descinterface
			autosizedims = true
			desc = 'song_summary_details_list_entry_gh5'
			verse_text = <verse_text>
			verse_rgba = <verse_rgba>
			percent_p1_text = qs(0x00000000)
			percent_p2_text = qs(0x00000000)
			percent_p3_text = qs(0x00000000)
			percent_p4_text = qs(0x00000000)
		}
		getnumplayersingame \{on_screen}
		if (<num_players_shown> > 0)
			getfirstplayer \{on_screen}
			begin
			getplayerinfo <Player> part
			if (<part> = vocals)
				section_hits = (((<gig_details> [(<Player> -1)]).detailed_stats) [<i>] * 1.0)
				section_possibles = (((<gig_details> [(<Player> -1)]).detailed_stats_max) [<i>] * 1.0)
				my_struct = {}
				if LocalizedStringEquals a = (<vocal_sections> [<i>]) b = $vocal_marker_freeform
					<section_possibles> = 0
				endif
				if (<freeform_verse> = true)
					CastToInteger \{section_hits}
					if (<section_hits> = 0)
						text = qs(0x6a5cf46c)
					else
						quality_index = (<section_hits> -1)
						text = ($vocal_freeform_qualities [<quality_index>].text)
					endif
					formatText checksumName = field_name 'percent_p%d_text' d = <Player>
					AddParam Name = <field_name> structure_name = my_struct value = <text>
					<id> :se_setprops <my_struct>
				else
					if (<section_possibles> = 0)
						formatText \{TextName = player_percent
							qs(0x6a5cf46c)}
						formatText checksumName = field_name 'percent_p%d_text' d = <Player>
						AddParam Name = <field_name> structure_name = my_struct value = <player_percent>
						<id> :se_setprops <my_struct>
					else
						percent = (((<section_hits> * 1.0) / <section_possibles>) * 100)
						MathFloor <percent>
						CastToInteger \{percent}
						vocals_score_percent_to_text percent = <percent>
						formatText checksumName = field_name 'percent_p%d_text' d = <Player>
						formatText checksumName = field_name_rgba 'percent_p%d_rgba' d = <Player>
						AddParam Name = <field_name> structure_name = my_struct value = <vocals_score_text>
						AddParam Name = <field_name_rgba> structure_name = my_struct value = <vocals_score_rgba>
						<id> :se_setprops <my_struct>
					endif
				endif
			endif
			formatText checksumName = entry_alpha 'percent_P%i_alpha' i = <Player>
			AddParam Name = <entry_alpha> structure_name = entry_alpha_struct value = 1.0
			getnextplayer on_screen Player = <Player>
			repeat <num_players_shown>
			<id> :se_setprops <entry_alpha_struct>
			<entry_alpha_struct> = {}
		endif
		<section_added> = 1
	endif
	return section_added = <section_added>
endscript

script ui_song_summary_details_scroll_players 
	RequireParams \{[
			direction
		]
		all}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	stats_summary_id :se_setprops \{block_events}
	stats_summary_id :GetTags
	if (<can_scroll_players> = 1)
		if (<direction> = left)
			if (<left_displayed_player_num> < 5)
				SpawnScriptNow ui_song_summary_details_scroll_gamertags params = {direction = <direction>}
				SpawnScriptNow ui_song_summary_details_scroll_player_icons params = {direction = <direction>}
				SpawnScriptNow ui_song_summary_details_scroll_header params = {direction = <direction>}
				SpawnScriptNow ui_song_summary_details_scroll_verse_entries params = {direction = <direction>}
				stats_summary_id :SetTags left_displayed_player_num = (<left_displayed_player_num> + 1)
			endif
		else
			if (<left_displayed_player_num> > 1)
				SpawnScriptNow ui_song_summary_details_scroll_gamertags params = {direction = <direction>}
				SpawnScriptNow ui_song_summary_details_scroll_player_icons params = {direction = <direction>}
				SpawnScriptNow ui_song_summary_details_scroll_header params = {direction = <direction>}
				SpawnScriptNow ui_song_summary_details_scroll_verse_entries params = {direction = <direction>}
				stats_summary_id :SetTags left_displayed_player_num = (<left_displayed_player_num> - 1)
			endif
		endif
	endif
	stats_summary_id :se_setprops \{unblock_events}
endscript

script ui_song_summary_details_scroll_gamertags 
	RequireParams \{[
			direction
		]
		all}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	stats_summary_id :se_setprops \{block_events}
	if (<direction> = left)
		distance_to_add = -157
	else
		distance_to_add = 157
	endif
	if ScreenElementExists \{id = stats_summary_id}
		stats_summary_id :se_getprops
		if GotParam \{gamer_tag_container_pos}
			new_pos = (((1.0, 0.0) * ((<gamer_tag_container_pos> [0]) + <distance_to_add>)) + ((0.0, 1.0) * (<gamer_tag_container_pos> [1])))
			stats_summary_id :se_setprops {
				gamer_tag_container_pos = <new_pos>
			}
		endif
	endif
	stats_summary_id :se_setprops \{unblock_events}
endscript

script ui_song_summary_details_scroll_player_icons 
	RequireParams \{[
			direction
		]
		all}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	stats_summary_id :se_setprops \{block_events}
	if (<direction> = left)
		distance_to_add = -157
	else
		distance_to_add = 157
	endif
	if ScreenElementExists \{id = stats_summary_id}
		if stats_summary_id :desc_resolvealias \{Name = alias_song_summary_details_list
				param = details_list_id}
			<details_list_id> :se_getprops
			if GotParam \{icons_container_pos}
				new_pos = (((1.0, 0.0) * ((<icons_container_pos> [0]) + <distance_to_add>)) + ((0.0, 1.0) * (<icons_container_pos> [1])))
				<details_list_id> :se_setprops {
					icons_container_pos = <new_pos>
				}
			endif
		endif
	endif
	stats_summary_id :se_setprops \{unblock_events}
endscript

script ui_song_summary_details_scroll_header 
	RequireParams \{[
			direction
		]
		all}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	stats_summary_id :se_setprops \{block_events}
	if (<direction> = left)
		distance_to_add = -160
	else
		distance_to_add = 160
	endif
	if ScreenElementExists \{id = stats_summary_id}
		if ScreenElementExists \{id = header_desc_id}
			header_desc_id :se_getprops
			if GotParam \{header_stats_container_pos}
				new_pos = (((1.0, 0.0) * ((<header_stats_container_pos> [0]) + <distance_to_add>)) + ((0.0, 1.0) * (<header_stats_container_pos> [1])))
				header_desc_id :se_setprops {
					header_stats_container_pos = <new_pos>
				}
			endif
		endif
	endif
	stats_summary_id :se_setprops \{unblock_events}
endscript

script ui_song_summary_details_scroll_verse_entries 
	RequireParams \{[
			direction
		]
		all}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	stats_summary_id :se_setprops \{block_events}
	if (<direction> = left)
		distance_to_add = -160
	else
		distance_to_add = 160
	endif
	if ScreenElementExists \{id = stats_summary_id}
		if ScreenElementExists \{id = list_menu}
			GetScreenElementChildren \{id = list_menu}
			GetArraySize <children>
			list_menu :GetSingleTag \{top_row_index}
			if (<top_row_index> = 0)
				first_index_to_scroll = 1
			else
				first_index_to_scroll = 0
			endif
			if (<array_Size> > <first_index_to_scroll>)
				i = <first_index_to_scroll>
				begin
				(<children> [<i>]) :se_getprops
				if GotParam \{verse_entry_pos}
					new_pos = (((1.0, 0.0) * ((<verse_entry_pos> [0]) + <distance_to_add>)) + ((0.0, 1.0) * (<verse_entry_pos> [1])))
					(<children> [<i>]) :se_setprops {
						verse_entry_pos = <new_pos>
					}
				endif
				<i> = (<i> + 1)
				repeat (<array_Size> - <first_index_to_scroll>)
			endif
		endif
	endif
	stats_summary_id :se_setprops \{unblock_events}
endscript

script ui_song_summary_details_scroll_stats 
	RequireParams \{[
			direction
			is_practice
		]
		all}
	num_header_rows = 3
	Obj_GetID
	<objID> :GetTags
	extra_row = 0
	if (<is_practice> = 0)
		extra_row = 1
	endif
	if ((<num_non_vocal_sections> + <num_vocal_sections> + <num_header_rows> + <extra_row>) > ($song_summary_details_row_display_max))
		LaunchEvent \{Type = unfocus
			target = list_menu}
		if (<direction> = up)
			if (<top_row_index> > 0)
				if (<top_row_index> = 1)
					if ((<num_non_vocal_sections> + <num_vocal_sections>) >= 3)
						GetScreenElementChildren \{id = list_menu}
						GetArraySize <children>
						if (<array_Size> >= 3)
							index_to_delete = (<array_Size> - 1)
							begin
							DestroyScreenElement id = (<children> [<index_to_delete>])
							<index_to_delete> = (<index_to_delete> - 1)
							repeat 3
							song_summary_details_create_song_header {
								gig_details = ($song_stats_backup)
							}
							GetScreenElementChildren \{id = list_menu}
							GetArraySize <children>
							if (<array_Size> > 0)
								menu_setitemindex index = (<array_Size> - 1) newindex = 0
							endif
							list_menu :SetTags {
								top_row_index = 0
								bottom_row_index = (<bottom_row_index> - 3)
							}
						endif
					endif
				else
					if ((<is_practice> = 0) && (<top_row_index> = 2))
						GetScreenElementChildren \{id = list_menu}
						GetArraySize <children>
						if (<array_Size> >= 1)
							DestroyScreenElement id = (<children> [(<array_Size> - 1)])
						endif
						song_details_add_space_to_table
						menu_setitemindex index = (<array_Size> - 1) newindex = 0
					else
						GetScreenElementChildren \{id = list_menu}
						GetArraySize <children>
						DestroyScreenElement id = (<children> [(<array_Size> - 1)])
						if (<top_row_index> = (<num_non_vocal_sections> + (1 + <extra_row>)))
							song_summary_details_create_non_vocals_section_entry {
								gig_details = ($song_stats_backup)
								sections = ((($song_stats_backup) [(<non_vocalist_pnum> -1)]).section_names)
								section_index = (<num_non_vocal_sections> - 1)
							}
						elseif (<top_row_index> < (<num_non_vocal_sections> + (1 + <extra_row>)))
							song_summary_details_create_non_vocals_section_entry {
								gig_details = ($song_stats_backup)
								sections = ((($song_stats_backup) [(<non_vocalist_pnum> -1)]).section_names)
								section_index = (<top_row_index> - (2 + <extra_row>))
							}
						else
							song_summary_details_create_vocals_section_entry {
								gig_details = ($song_stats_backup)
								vocal_sections = ((($song_stats_backup) [(<vocalist_pnum> -1)]).section_names)
								section_index = (<top_row_index> - <num_non_vocal_sections> - (2 + <extra_row>))
							}
						endif
						menu_setitemindex index = (<array_Size> - 1) newindex = 0
					endif
					list_menu :SetTags {
						top_row_index = (<top_row_index> - 1)
						bottom_row_index = (<bottom_row_index> - 1)
					}
				endif
			endif
		else
			if (<bottom_row_index> < (<num_non_vocal_sections> + <num_vocal_sections> + <extra_row>))
				GetScreenElementChildren \{id = list_menu}
				GetArraySize <children>
				if (<top_row_index> = 0)
					if (<array_Size> > 0)
						DestroyScreenElement id = (<children> [0])
					endif
					num_sections_to_add = 3
					if (<num_non_vocal_sections> < <num_sections_to_add>)
						if (<num_non_vocal_sections> > 0)
							i = (<bottom_row_index> - <extra_row>)
							begin
							song_summary_details_create_non_vocals_section_entry {
								gig_details = ($song_stats_backup)
								sections = ((($song_stats_backup) [(<non_vocalist_pnum> -1)]).section_names)
								section_index = <i>
							}
							<i> = (<i> + 1)
							repeat <num_non_vocal_sections>
						endif
						i = (<bottom_row_index> - (<extra_row> + <num_non_vocal_sections>))
						begin
						song_summary_details_create_vocals_section_entry {
							gig_details = ($song_stats_backup)
							vocal_sections = ((($song_stats_backup) [(<vocalist_pnum> -1)]).section_names)
							section_index = <i>
						}
						<i> = (<i> + 1)
						repeat (<num_sections_to_add> - <num_non_vocal_sections>)
					else
						i = (<bottom_row_index> - <extra_row>)
						begin
						song_summary_details_create_non_vocals_section_entry {
							gig_details = ($song_stats_backup)
							sections = ((($song_stats_backup) [(<non_vocalist_pnum> -1)]).section_names)
							section_index = <i>
						}
						<i> = (<i> + 1)
						repeat <num_sections_to_add>
					endif
					list_menu :SetTags {
						top_row_index = (<top_row_index> + 1)
						bottom_row_index = (<bottom_row_index> + 3)
					}
				else
					GetScreenElementChildren \{id = list_menu}
					GetArraySize <children>
					if (<array_Size> > 0)
						DestroyScreenElement id = (<children> [0])
					endif
					if (<bottom_row_index> < (<num_non_vocal_sections> + <extra_row>))
						song_summary_details_create_non_vocals_section_entry {
							gig_details = ($song_stats_backup)
							sections = ((($song_stats_backup) [(<non_vocalist_pnum> -1)]).section_names)
							section_index = (<bottom_row_index> - <extra_row>)
						}
						if (<section_added> = 0)
							song_summary_details_create_vocals_section_entry {
								gig_details = ($song_stats_backup)
								vocal_sections = ((($song_stats_backup) [(<vocalist_pnum> -1)]).section_names)
								section_index = 0
							}
							<bottom_row_index> = (<bottom_row_index> + 1)
						endif
					elseif (<bottom_row_index> = (<num_non_vocal_sections> + <extra_row>))
						song_summary_details_create_vocals_section_entry {
							gig_details = ($song_stats_backup)
							vocal_sections = ((($song_stats_backup) [(<vocalist_pnum> -1)]).section_names)
							section_index = 0
						}
					else
						song_summary_details_create_vocals_section_entry {
							gig_details = ($song_stats_backup)
							vocal_sections = ((($song_stats_backup) [(<vocalist_pnum> -1)]).section_names)
							section_index = (<bottom_row_index> - (<num_non_vocal_sections> + <extra_row>))
						}
					endif
					list_menu :SetTags {
						top_row_index = (<top_row_index> + 1)
						bottom_row_index = (<bottom_row_index> + 1)
					}
				endif
			endif
		endif
		LaunchEvent \{Type = focus
			target = list_menu}
	endif
endscript

script song_summary_details_pause_all_musicians 
	begin
	i = 1
	formatText checksumName = musician 'musician%i' i = <i>
	if CompositeObjectExists <musician>
		<musician> :Pause
	endif
	<i> = (<i> + 1)
	repeat 4
endscript

script song_summary_details_unpause_all_musicians 
	begin
	i = 1
	formatText checksumName = musician 'musician%i' i = <i>
	if CompositeObjectExists <musician>
		<musician> :Unpause
	endif
	<i> = (<i> + 1)
	repeat 4
endscript

script net_ui_song_summary_details_destroy_players_list 
	RequireParams \{[
			players_list_id
		]
		all}
	DestroyScreenElement id = <players_list_id>
	if ScreenElementExists \{id = stats_summary_id}
		LaunchEvent \{Type = focus
			target = stats_summary_id}
		LaunchEvent \{Type = focus
			target = list_menu}
		clean_up_user_control_helpers
		add_user_control_helper text = qs(0xaf4d5dd2) button = red <all_button_params> z = 100000
		if ininternetmode
			add_user_control_helper text = qs(0xd16792bf) button = yellow <all_button_params> z = 100000
		endif
		stats_summary_id :GetSingleTag \{can_scroll_players}
		if (<can_scroll_players> = 1)
			add_user_control_helper text = qs(0xf65ffd8f) button = blue <all_button_params> z = 100000
			add_user_control_helper text = qs(0x1e9bfbbc) button = orange <all_button_params> z = 100000
		endif
	endif
endscript

script song_summary_details_should_hide_last_section 
	RequireParams \{[
			sections
		]
		all}
	should_hide = 0
	GetArraySize <sections>
	if ((<sections> [(<array_Size> - 1)]) = qs(0x00167369))
		<should_hide> = 1
	endif
	return should_hide = <should_hide>
endscript
