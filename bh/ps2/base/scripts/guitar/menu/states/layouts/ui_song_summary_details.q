song_summary_details_row_count = 0
0x7a85de77 = 0
0x3ef40519 = 7
0x04ef1201 = 4
0x4027c7fa = 0
0xb1808f7f = 0
num_non_vocal_sections = 0
num_vocal_sections = 0

script ui_create_song_summary_details \{for_transition = 0}
	Change menu_flow_locked = ($menu_flow_locked + 1)
	0x4b5f7892
	Change \{song_summary_details_row_count = 0}
	gamemode_getnumplayersshown
	gamemode_gettype
	song_details_set_mins_and_maxes
	gig_details = ($gig_detailed_stats)
	GetArraySize <gig_details>
	if (<array_Size> = 0)

	endif
	get_song_title song = ((<gig_details> [0] [0]).song)
	get_all_exclusive_devices
	CreateScreenElement {
		parent = root_window
		id = my_detailed_id
		Type = descinterface
		desc = 'song_summary_details'
		Pos = {(-1500.0, 0.0) relative}
		event_handlers = [
			{pad_back generic_event_back}
		]
		song_title_text = <song_title>
		exclusive_device = <exclusive_device>
	}
	if (<Type> = practice)
		my_detailed_id :se_setprops \{Pos = (0.0, 0.0)
			main_menu_bg_alpha = 1}
	endif
	if my_detailed_id :desc_resolvealias \{Name = alias_song_summary_details_list
			param = details_list_alias}
	else

	endif
	p = 1
	begin
	getplayerinfo <p> part
	getplayerinfo <p> difficulty
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
			getplayerinfo <p> double_kick_drum
			if (<double_kick_drum> = 1)
				diff_texture = icon_difficulty_expert_plus
			endif
		endif
	endswitch
	formatText checksumName = alpha_check 'icons_p%d_alpha' d = <p>
	formatText checksumName = inst_check 'instrument_p%d_texture' d = <p>
	formatText checksumName = diff_check 'DIFFICULTY_p%d_texture' d = <p>
	formatText checksumName = double_kick_alpha 'double_kick_p%d_alpha' d = <p>
	formatText checksumName = difficulty_alpha 'DIFFICULTY_p%d_alpha' d = <p>
	my_struct = {}
	AddParam structure_name = my_struct Name = <alpha_check> value = 1.0
	AddParam structure_name = my_struct Name = <inst_check> value = <icon_texture>
	AddParam structure_name = my_struct Name = <diff_check> value = <diff_texture>
	getplayerinfo <p> double_kick_drum
	if (<double_kick_drum> = 1)
		AddParam structure_name = my_struct Name = <double_kick_alpha> value = 1
		AddParam structure_name = my_struct Name = <difficulty_alpha> value = 0
	else
		AddParam structure_name = my_struct Name = <double_kick_alpha> value = 0
		AddParam structure_name = my_struct Name = <difficulty_alpha> value = 1
	endif
	<details_list_alias> :se_setprops <my_struct>
	my_struct = {}
	formatText checksumName = 0x2caca66e 'gamer_tag_0%d_text' d = <p>
	formatText checksumName = 0xadffeaaa 'gamer_tag_0%d_alpha' d = <p>
	formatText TextName = 0x49047faf qs(0x72f23aff) d = <p>
	AddParam structure_name = my_struct Name = <0x2caca66e> value = <0x49047faf>
	AddParam structure_name = my_struct Name = <0xadffeaaa> value = 1.0
	my_detailed_id :se_setprops <my_struct>
	p = (<p> + 1)
	repeat <num_players_shown>
	song_details_create_scrolling_menu for_transition = <for_transition>
	vocalist = 0
	non_vocalist = 0
	GetArraySize (<gig_details> [0])
	num_songs = <array_Size>
	song_indx = 0
	get_song_title song = ((<gig_details> [0] [<song_indx>]).song)
	0xb7251e92
	Change \{0x4027c7fa = 0}
	Change \{0xb1808f7f = 0}
	Change \{num_non_vocal_sections = 0}
	Change \{num_vocal_sections = 0}
	Change \{song_summary_details_row_count = 0}
	0x9a50f97c = 0
	0xe661d380 = 1
	0xdcdcf63f = 2
	0xc61905e9 = <id>
	0x15ccb0bc {
		ui_string = qs(0x8795155b)
		0x678c9e77 = <0x9a50f97c>
		column = 0
	}
	0x15ccb0bc {
		ui_string = qs(0xf75837da)
		0x678c9e77 = <0xe661d380>
		column = 0
	}
	0x15ccb0bc {
		ui_string = qs(0xff3216c6)
		0x678c9e77 = <0xdcdcf63f>
		column = 0
	}
	Change \{song_summary_details_row_count = $0x04ef1201}
	i = 1
	begin
	getplayerinfo <i> part
	getplayerinfo <i> difficulty
	if (<part> = vocals)
		vocalist = <i>
	elseif (<non_vocalist> = 0)
		non_vocalist = <i>
	endif
	player_data = (<gig_details> [(<i> -1)] [<song_indx>])
	if (<part> = vocals)
		vocal_phrase_max_qual = (<player_data>.vocal_phrase_max_qual)
		vocal_phrase_quality = (<player_data>.vocal_phrase_quality)
		vocal_phrase_pct = 0
		if (<vocal_phrase_max_qual> > 0)
			percent_notes_hit = (((<vocal_phrase_quality> * 1.0) / <vocal_phrase_max_qual>) * 100.0)
			MathFloor <percent_notes_hit>
			<percent_notes_hit> = <floor>
			if (<percent_notes_hit> = 0 && <vocal_phrase_quality> > 0)
				<percent_notes_hit> = 1
			endif
			formatText TextName = notes_hit_entry qs(0xea41c83d) p = <percent_notes_hit> DecimalPlaces = 0
		else
			<notes_hit_entry> = qs(0x6a5cf46c)
		endif
		<sp_entry> = qs(0x6a5cf46c)
	else
		if (<Type> = practice)
			<sp_entry> = qs(0x6a5cf46c)
		else
			formatText TextName = sp_entry qs(0x2ba0d6d6) g = (<player_data>.sp_phrases_hit) p = (<player_data>.sp_phrases_total)
		endif
		if (<Type> = practice)
			formatText TextName = notes_hit_entry qs(0x2ba0d6d6) g = (<player_data>.notes_hit) p = (<player_data>.total_notes)
		else
			formatText TextName = notes_hit_entry qs(0x2ba0d6d6) g = (<player_data>.notes_hit) p = (<player_data>.max_notes)
		endif
	endif
	average_mult = (<player_data>.avg_multiplier)
	if (<average_mult> > 8)
		average_mult = 8
	elseif (<average_mult> < 1)
		average_mult = 1
	endif
	formatText TextName = 0xd2fd3c13 qs(0x5d9eae64) g = (<player_data>.score)
	formatText TextName = mult_entry qs(0x1ad7e10a) p = <average_mult>
	0x15ccb0bc {
		ui_string = <notes_hit_entry>
		0x678c9e77 = <0x9a50f97c>
		column = <i>
	}
	0x15ccb0bc {
		ui_string = <sp_entry>
		0x678c9e77 = <0xe661d380>
		column = <i>
	}
	0x15ccb0bc {
		ui_string = <mult_entry>
		0x678c9e77 = <0xdcdcf63f>
		column = <i>
	}
	i = (<i> + 1)
	repeat (<num_players_shown>)
	if (<non_vocalist> > 0)
		<sections> = ((<gig_details> [(<non_vocalist> -1)] [<song_indx>]).section_names)
		GetArraySize <sections>
		if (<array_Size> > 0)
			Change \{0x4027c7fa = 1}
			Change num_non_vocal_sections = (<array_Size> + 1)
			i = 0
			begin
			0x50866222 = (<i> + ($0x04ef1201))
			0x15ccb0bc {
				ui_string = (<sections> [<i>])
				0x678c9e77 = <0x50866222>
				column = 0
			}
			Change song_summary_details_row_count = (($song_summary_details_row_count) + 1)
			Player = 1
			begin
			getplayerinfo <Player> part
			if (<part> = vocals)
			else
				section_hits = (((<gig_details> [(<Player> -1)] [<song_indx>]).detailed_stats) [<i>] * 1.0)
				section_possibles = (((<gig_details> [(<Player> -1)] [<song_indx>]).detailed_stats_max) [<i>] * 1.0)
				section_hits = (<section_hits> * 1.0)
				my_struct = {}
				if (<section_possibles> = 0)
					0x15ccb0bc {
						ui_string = qs(0x6a5cf46c)
						0x678c9e77 = <0x50866222>
						column = <Player>
					}
				else
					adjust_percent_for_display percent = (((<section_hits> * 1.0) / <section_possibles>) * 100)
					percent = <adjusted_percent>
					formatText TextName = player_percent qs(0x76b3fda7) d = <percent>
					player_percent = (<player_percent> + qs(0x0c40a1b2))
					0x15ccb0bc {
						ui_string = <player_percent>
						0x678c9e77 = <0x50866222>
						column = <Player>
					}
				endif
			endif
			Player = (<Player> + 1)
			repeat (<num_players_shown>)
			i = (<i> + 1)
			repeat <array_Size>
		endif
	endif
	if NOT (<vocalist> = 0)
		vocal_sections = ((<gig_details> [(<vocalist> -1)] [<song_indx>]).section_names)
		i = 0
		GetArraySize <vocal_sections>
		if (<array_Size> > 0)
			Change \{0xb1808f7f = 1}
			Change num_vocal_sections = (<array_Size> + 1)
			begin
			RemoveParameter \{verse_rgba}
			if ((<vocal_sections> [<i>]) = qs(0x00000000))
				<verse_rgba> = $vocal_marker_hype_rgba
			endif
			if ((<vocal_sections> [<i>]) = qs(0x00000000))
				<short_ui_string> = qs(0xb723938a)
			else
				shortenuistring {
					ui_string = (<vocal_sections> [<i>])
					max_len = 24
				}
			endif
			add_row = 1
			if (<num_players_shown> = 2)
				getplayerinfo \{1
					part}
				p1_part = <part>
				getplayerinfo \{2
					part}
				p2_part = <part>
				if (<p1_part> = vocals && <p2_part> = vocals)
					if LocalizedStringEquals a = (<vocal_sections> [<i>]) b = $vocal_marker_freeform
						<add_row> = 0
					endif
					if LocalizedStringEquals a = (<vocal_sections> [<i>]) b = $vocal_marker_hype
						<add_row> = 0
					endif
				endif
			endif
			if (<add_row> = 1)
				0x50866222 = (<i> + ($0x04ef1201))
				if (($0x4027c7fa) = 1)
					<0x50866222> = (($num_non_vocal_sections) + <i> + ($0x04ef1201))
				endif
				0x15ccb0bc {
					ui_string = <short_ui_string>
					0x678c9e77 = <0x50866222>
					column = 0
				}
				Change song_summary_details_row_count = (($song_summary_details_row_count) + 1)
				player_index = 1
				begin
				getplayerinfo <player_index> part
				if (<part> = vocals)
					section_hits = (((<gig_details> [(<player_index> -1)] [<song_indx>]).detailed_stats) [<i>] * 1.0)
					section_possibles = (((<gig_details> [(<player_index> -1)] [<song_indx>]).detailed_stats_max) [<i>] * 1.0)
					my_struct = {}
					if (<vocal_sections> [<i>] = qs(0x00000000))
						<section_possibles> = 0
					endif
					if (<section_possibles> = 0)
						0x15ccb0bc {
							ui_string = qs(0x6a5cf46c)
							0x678c9e77 = <0x50866222>
							column = <player_index>
						}
					else
						adjust_percent_for_display percent = (((<section_hits> * 1.0) / <section_possibles>) * 100)
						percent = <adjusted_percent>
						vocals_score_percent_to_text percent = <percent>
						0x15ccb0bc {
							ui_string = <vocals_score_text>
							0x678c9e77 = <0x50866222>
							column = <player_index>
						}
					endif
				endif
				<player_index> = (<player_index> + 1)
				repeat <num_players_shown>
			endif
			i = (<i> + 1)
			repeat <array_Size>
		endif
	endif
	0x145f9f35
	0xd7a60c99 \{Base = 0}
	0x261bed48 = ($song_summary_details_row_count - $0x04ef1201)
	if (($0x4027c7fa) = 1)
		0x261bed48 = (<0x261bed48> + 2)
	endif
	SetScreenElementProps {
		id = my_current_menu
		tags = {current = 0 fit = 7 total = <0x261bed48>}
	}
	if should_use_all_buttons
		all_button_params = {all_buttons}
	endif
	add_user_control_helper text = qs(0xaf4d5dd2) button = red <all_button_params> z = 100000
	LaunchEvent \{Type = focus
		target = my_current_menu}
	if my_detailed_id :desc_resolvealias \{Name = alias_banner
			param = 0x7363d093}
		<0x7363d093> :obj_spawnscript ui_shakey params = {0x4d641ae8}
		<0x7363d093> :obj_spawnscript ui_frazzmatazz
	else

	endif
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script ui_destroy_song_summary_details 
	Change menu_flow_locked = ($menu_flow_locked + 1)
	Change \{0x7a85de77 = 0}
	clean_up_user_control_helpers
	DestroyScreenElement \{id = my_detailed_id}
	0x9ae23992
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script my_color_interp \{val = 100
		Player = 1}
	array = [0 0 0 255]
	min = (($min_percents) [(<Player> -1)])
	if (<val> = 100)
		Color = [0 128 0 255]
	elseif (<val> <= 90 && <val> = <min>)
		Color = [128 0 0 255]
	else
		Color = [59 62 52 255]
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
	gig_details = ($gig_detailed_stats)
	local_mins = [101 101 101 101]
	local_maxs = [-1 -1 -1 -1]
	gamemode_getnumplayersshown
	i = 0
	begin
	sections = ((<gig_details> [<i>] [0]).section_names)
	section_hits_array = ((<gig_details> [<i>] [0]).detailed_stats)
	section_max_array = ((<gig_details> [<i>] [0]).detailed_stats_max)
	GetArraySize <sections>
	if (<array_Size> > 0)
		j = 0
		begin
		section_max = (<section_max_array> [<j>] * 1.0)
		if NOT (<section_max> <= 0)
			section_hits = (<section_hits_array> [<j>] * 1.0)
			adjust_percent_for_display percent = (((<section_hits> * 1.0) / (<section_max> * 1.0)) * 100)
			percent = <adjusted_percent>
			if (<percent> < (<local_mins> [<i>]))
				SetArrayElement ArrayName = local_mins index = <i> NewValue = <percent>
			endif
			if (<percent> > (<local_maxs> [<i>]))
				SetArrayElement ArrayName = local_maxs index = <i> NewValue = <percent>
			endif
		endif
		j = (<j> + 1)
		repeat <array_Size>
	endif
	i = (<i> + 1)
	repeat <num_players_shown>
	Change min_percents = <local_mins>
	Change max_percents = <local_maxs>
endscript

script my_find_max_and_min 
	t_max = -1
	t_min = -1

	GetArraySize \{array}
	if (<array_Size> > 0)
		t_max = <array> [0]
		t_min = <array> [0]
		i = 0
		begin
		if (<array> [<i>] < min)
			t_min = <array> [0]
		endif
		if (<array> [<i>] > Max)
			t_max = <array> [0]
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	return Max = <t_max> min = <t_min>
endscript

script song_details_create_scrolling_menu 
	if my_detailed_id :desc_resolvealias \{Name = alias_song_summary_details_list
			param = details_list_alias}
	else

	endif
	array = [
		{pad_up ui_song_details_shift params = {up}}
		{pad_down ui_song_details_shift params = {down}}
		{pad_back generic_event_back}
	]
	if (<for_transition> = 1)
		SetArrayElement \{ArrayName = array
			index = 2
			NewValue = {
				pad_back
				generic_event_back
				params = {
					data = {
						transitioning = 1
					}
				}
			}}
	endif
	CreateScreenElement {
		Type = WindowElement
		parent = <details_list_alias>
		id = my_current_menu
		dims = (980.0, 280.0)
		Pos = (48.0, 367.0)
		just = [left top]
		pos_anchor = [left top]
		event_handlers = <array>
		tags = {current = 0 fit = 7 total = 7}
	}
	CreateScreenElement \{Type = VMenu
		parent = my_current_menu
		id = list_menu
		dims = (980.0, 280.0)
		just = [
			left
			top
		]
		internal_just = [
			left
			top
		]
		spacing_between = 0}
	SetScreenElementProps \{id = my_detailed_id
		arrow_top_alpha = 0}
endscript

script ui_song_details_shift 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	GetTags
	GetScreenElementDims \{id = list_menu}
	GetScreenElementPosition \{id = list_menu}
	if GotParam \{down}
		if (<current> >= ((<total> - <fit>) + 1))
			return
		endif
		Change 0x7a85de77 = ($0x7a85de77 + 1)
		if ($0x7a85de77 < $0x04ef1201)
			Change \{0x7a85de77 = $0x04ef1201}
		endif
		0xd7a60c99 Base = ($0x7a85de77)
		SetTags current = (<current> + 1)
		generic_menu_up_or_down_sound \{down}
	else
		if (<current> <= 0)
			return
		endif
		if (($0x7a85de77) > 0)
			Change 0x7a85de77 = ($0x7a85de77 - 1)
			if ($0x7a85de77 < $0x04ef1201)
				Change \{0x7a85de77 = 0}
			endif
			0xd7a60c99 Base = ($0x7a85de77)
			SetTags current = (<current> - 1)
			generic_menu_up_or_down_sound \{up}
		endif
	endif
	GetTags
	Max = ((<total> - <fit>) + 1)
	dx = (212.0 / <Max>)
	Pos = ((0.0, -100.0) + ((0.0, 1.0) * (<current> * <dx>)))
	my_detailed_id :se_setprops slider_nub_cont_pos = <Pos> time = 0.1
endscript

script 0x145f9f35 
	i = 0
	begin
	formatText checksumName = 0x00d23912 'string_entry_%c' c = <i>
	CreateScreenElement {
		parent = list_menu
		id = <0x00d23912>
		Type = descinterface
		autosizedims = true
		desc = 'song_summary_details_entry'
		verse_text = qs(0x00000000)
		percent_p1_text = qs(0x00000000)
		percent_p2_text = qs(0x00000000)
		percent_p3_text = qs(0x00000000)
		percent_p4_text = qs(0x00000000)
	}
	i = (<i> + 1)
	repeat ($0x3ef40519)
endscript

script 0xd7a60c99 \{Base = 0}

	i = <Base>
	j = 0
	begin
	formatText checksumName = 0x00d23912 'string_entry_%c' c = <j>
	0x258b3203 {
		0x678c9e77 = <i>
	}
	<0x00d23912> :se_setprops {
		verse_text = <0x866b7ee7>
		percent_p1_text = <0x5ad3f133>
		percent_p2_text = <0xd45cf6d0>
		percent_p3_text = <0x18f6f64e>
		percent_p4_text = <0x1233ff57>
	}
	if (<i> = 0)
		<0x00d23912> :se_setprops {
			verse_rgba = [255 , 200 , 200 , 255]
			percent_p1_rgba = [255 , 200 , 200 , 255]
			percent_p2_rgba = [255 , 200 , 200 , 255]
			percent_p3_rgba = [255 , 200 , 200 , 255]
			percent_p4_rgba = [255 , 200 , 200 , 255]
		}
	elseif ((<i> = 1) || (<i> = 2))
		<0x00d23912> :se_setprops {
			verse_rgba = [200 , 200 , 255 , 255]
			percent_p1_rgba = [200 , 200 , 255 , 255]
			percent_p2_rgba = [200 , 200 , 255 , 255]
			percent_p3_rgba = [200 , 200 , 255 , 255]
			percent_p4_rgba = [200 , 200 , 255 , 255]
		}
	else
		<0x00d23912> :se_setprops {
			verse_rgba = [255 , 255 , 255 , 255]
			percent_p1_rgba = [255 , 255 , 255 , 255]
			percent_p2_rgba = [255 , 255 , 255 , 255]
			percent_p3_rgba = [255 , 255 , 255 , 255]
			percent_p4_rgba = [255 , 255 , 255 , 255]
		}
	endif
	i = (<i> + 1)
	j = (<j> + 1)
	repeat ($0x3ef40519)
endscript

script ui_song_summary_details_anim_in 
	gamemode_gettype
	if (<Type> = practice)
		return
	endif
	SoundEvent \{event = menu_song_complete_in}

	if ScreenElementExists \{id = my_detailed_id}
		SetScreenElementProps \{id = my_detailed_id
			Pos = {
				(1500.0, 0.0)
				relative
			}
			time = 0.120000005}
		Wait \{0.2
			Second}
	endif
endscript

script ui_song_summary_details_anim_out 
	gamemode_gettype
	if (<Type> = practice)
		return
	endif
	SoundEvent \{event = menu_song_complete_out}

	if ScreenElementExists \{id = my_detailed_id}
		SetScreenElementProps \{id = my_detailed_id
			Pos = {
				(1500.0, 0.0)
				relative
			}
			time = 0.120000005}
		Wait \{0.2
			Second}
	endif
endscript
