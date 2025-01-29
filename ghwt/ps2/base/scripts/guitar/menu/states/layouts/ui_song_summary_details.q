song_summary_details_row_count = 0

script ui_create_song_summary_details \{for_transition = 0}
	Change menu_flow_locked = ($menu_flow_locked + 1)
	Change \{song_summary_details_row_count = 0}
	gamemode_getnumplayersshown
	trim_boss_from_num_players_show
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
		Pos = {(-1200.0, 0.0) relative}
		event_handlers = [
			{pad_back generic_event_back}
		]
		song_title_text = <song_title>
		exclusive_device = <exclusive_device>
	}
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
		case easy_rhythm
		diff_texture = icon_difficulty_beginner
		case easy
		diff_texture = icon_difficulty_easy
		case medium
		diff_texture = icon_difficulty_medium
		case hard
		diff_texture = icon_difficulty_hard
		case expert
		diff_texture = icon_difficulty_expert
	endswitch
	formatText checksumName = alpha_check 'icons_p%d_alpha' d = <p>
	formatText checksumName = inst_check 'instrument_p%d_texture' d = <p>
	formatText checksumName = diff_check 'DIFFICULTY_p%d_texture' d = <p>
	my_struct = {}
	AddParam structure_name = my_struct Name = <alpha_check> value = 1
	AddParam structure_name = my_struct Name = <inst_check> value = <icon_texture>
	AddParam structure_name = my_struct Name = <diff_check> value = <diff_texture>
	<details_list_alias> :se_setprops <my_struct>
	p = (<p> + 1)
	repeat <num_players_shown>
	song_details_create_scrolling_menu for_transition = <for_transition>
	vocalist = 0
	non_vocalist = 0
	GetArraySize (<gig_details> [0])
	num_songs = <array_Size>
	song_indx = 0
	begin
	get_song_title song = ((<gig_details> [0] [<song_indx>]).song)
	CreateScreenElement \{parent = list_menu
		Type = descinterface
		autosizedims = true
		desc = 'song_summary_details_song_header'}
	if ($game_mode = p2_battle)
		<id> :0x8e6af868 child = sp_phrases text = qs(0x72f9a7b9)
	endif
	if Italian
		<id> :0x8e6af868 child = avg_multiplier dims = (380.0, 35.0)
	endif
	Change song_summary_details_row_count = (($song_summary_details_row_count) + 3)
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
			vocal_phrase_pct = (((<vocal_phrase_quality>) / <vocal_phrase_max_qual>) * 100.0)
			formatText TextName = notes_hit_entry qs(0xa1b58a0a) p = <vocal_phrase_pct> DecimalPlaces = 0
		else
			<notes_hit_entry> = qs(0x4c1271a9)
		endif
		<sp_entry> = qs(0x4c1271a9)
	else
		if (<Type> = battle || <Type> = training)
			<sp_entry> = qs(0x4c1271a9)
		else
			formatText TextName = sp_entry qs(0x2ba0d6d6) g = (<player_data>.sp_phrases_hit) p = (<player_data>.sp_phrases_total)
		endif
		if (<Type> = training)
			formatText TextName = notes_hit_entry qs(0x2ba0d6d6) g = (<player_data>.notes_hit) p = (<player_data>.total_notes)
		else
			formatText TextName = notes_hit_entry qs(0x2ba0d6d6) g = (<player_data>.notes_hit) p = (<player_data>.max_notes)
		endif
	endif
	formatText TextName = mult_entry qs(0x1ad7e10a) p = (<player_data>.avg_multiplier)
	formatText TextName = score_entry qs(0x5d9eae64) g = (<player_data>.score)
	formatText checksumName = notes_hit_cs 'notes_hit_entry_text_p%j' j = <i>
	formatText checksumName = sp_phrases_cs 'sp_phrases_entry_text_p%j' j = <i>
	formatText checksumName = avg_mult_cs 'avg_multiplier_entry_text_p%j' j = <i>
	formatText checksumName = score_cs 'score_entry_text_p%j' j = <i>
	AddParam Name = <score_cs> structure_name = header_struct value = <score_entry>
	AddParam Name = <notes_hit_cs> structure_name = header_struct value = <notes_hit_entry>
	AddParam Name = <sp_phrases_cs> structure_name = header_struct value = <sp_entry>
	if NOT (<Type> = training || <Type> = battle)
		AddParam Name = <avg_mult_cs> structure_name = header_struct value = <mult_entry>
	endif
	<id> :se_setprops <header_struct>
	i = (<i> + 1)
	repeat (<num_players_shown>)
	i = (<num_players_shown> + 1)
	if NOT (4 = <num_players_shown>)
		begin
		formatText checksumName = entry_alpha 'entries_p%i_alpha' i = <i>
		AddParam Name = <entry_alpha> structure_name = entry_alpha_struct value = 0.0
		<id> :se_setprops <entry_alpha_struct>
		i = (<i> + 1)
		repeat (4 - <num_players_shown>)
	endif
	if NOT (<Type> = training || <Type> = battle)
		song_details_add_space_to_table
	else
		<id> :se_setprops {avg_multiplier_alpha = 0}
	endif
	if (<non_vocalist> > 0)
		<sections> = ((<gig_details> [(<non_vocalist> -1)] [<song_indx>]).section_names)
		GetArraySize <sections>
		i = 0
		begin
		CreateScreenElement {
			parent = list_menu
			Type = descinterface
			autosizedims = true
			desc = 'song_summary_details_list_entry'
			verse_text = (<sections> [<i>])
			percent_p1_text = qs(0x877d65b8)
			percent_p2_text = qs(0x877d65b8)
			percent_p3_text = qs(0x877d65b8)
			percent_p4_text = qs(0x877d65b8)
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
				formatText \{TextName = player_percent
					qs(0x72675d42)}
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
		Player = (<Player> + 1)
		repeat (<num_players_shown>)
		Player = (<num_players_shown> + 1)
		if NOT (4 = <num_players_shown>)
			begin
			formatText checksumName = entry_alpha 'percent_P%i_alpha' i = <Player>
			AddParam Name = <entry_alpha> structure_name = entry_alpha_struct value = 0.0
			<id> :se_setprops <entry_alpha_struct>
			Player = (<Player> + 1)
			repeat (4 - <num_players_shown>)
		endif
		i = (<i> + 1)
		repeat <array_Size>
		song_details_add_space_to_table
	endif
	if NOT (<vocalist> = 0)
		vocal_sections = ((<gig_details> [(<vocalist> -1)] [<song_indx>]).section_names)
		i = 0
		GetArraySize <vocal_sections>
		if (<array_Size> > 0)
			begin
			shortenuistring {
				ui_string = (<vocal_sections> [<i>])
				max_len = 24
			}
			if LocalizedStringEquals a = (<vocal_sections> [<i>]) b = $vocal_marker_freeform
				<verse_rgba> = $vocal_marker_freeform_rgba
			else
				RemoveParameter \{verse_rgba}
			endif
			CreateScreenElement {
				parent = list_menu
				Type = descinterface
				autosizedims = true
				desc = 'song_summary_details_list_entry'
				verse_text = <short_ui_string>
				verse_rgba = <verse_rgba>
				percent_p1_text = qs(0x877d65b8)
				percent_p2_text = qs(0x877d65b8)
				percent_p3_text = qs(0x877d65b8)
				percent_p4_text = qs(0x877d65b8)
			}
			Change song_summary_details_row_count = (($song_summary_details_row_count) + 1)
			player_index = 1
			begin
			getplayerinfo <player_index> part
			if (<part> = vocals)
				section_hits = (((<gig_details> [(<player_index> -1)] [<song_indx>]).detailed_stats) [<i>] * 1.0)
				section_possibles = (((<gig_details> [(<player_index> -1)] [<song_indx>]).detailed_stats_max) [<i>] * 1.0)
				my_struct = {}
				if (<section_possibles> = 0)
					formatText \{TextName = player_percent
						qs(0x72675d42)}
					formatText checksumName = field_name 'percent_p%d_text' d = <player_index>
					AddParam Name = <field_name> structure_name = my_struct value = <player_percent>
					<id> :se_setprops <my_struct>
				else
					percent = (((<section_hits> * 1.0) / <section_possibles>) * 100)
					MathFloor <percent>
					CastToInteger \{percent}
					my_color_interp val = <floor> Player = <player_index>
					formatText TextName = player_percent qs(0x76b3fda7) d = <floor>
					player_percent = (<player_percent> + qs(0x0c40a1b2))
					formatText checksumName = field_name 'percent_p%d_text' d = <player_index>
					formatText checksumName = field_name_rgba 'percent_p%d_rgba' d = <player_index>
					AddParam Name = <field_name> structure_name = my_struct value = <player_percent>
					AddParam Name = <field_name_rgba> structure_name = my_struct value = <Color>
					<id> :se_setprops <my_struct>
				endif
			endif
			<player_index> = (<player_index> + 1)
			repeat <num_players_shown>
			Player = (<num_players_shown> + 1)
			if NOT (4 = <num_players_shown>)
				begin
				formatText checksumName = entry_alpha 'percent_P%i_alpha' i = <Player>
				AddParam Name = <entry_alpha> structure_name = entry_alpha_struct value = 0.0
				<id> :se_setprops <entry_alpha_struct>
				Player = (<Player> + 1)
				repeat (4 - <num_players_shown>)
			endif
			i = (<i> + 1)
			repeat <array_Size>
		endif
		song_details_add_space_to_table
	endif
	song_indx = (<song_indx> + 1)
	repeat <num_songs>
	ui_song_details_add_cash_stats
	SetScreenElementProps {
		id = my_current_menu
		tags = {current = 0 fit = 10 total = ($song_summary_details_row_count)}
	}
	if should_use_all_buttons
		all_button_params = {all_buttons}
	endif
	add_user_control_helper text = qs(0xaf4d5dd2) button = red <all_button_params> z = 100000
	LaunchEvent \{Type = focus
		target = my_current_menu}
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script ui_destroy_song_summary_details 
	Change menu_flow_locked = ($menu_flow_locked + 1)
	clean_up_user_control_helpers
	DestroyScreenElement \{id = my_detailed_id}
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
	trim_boss_from_num_players_show
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
			percent = (((<section_hits> * 1.0) / (<section_max> * 1.0)) * 100)
			MathFloor <percent>
			CastToInteger \{percent}
			if (<percent> < <local_mins> [<i>])
				SetArrayElement ArrayName = local_mins index = <i> NewValue = <percent>
			endif
			if (<percent> > <local_maxs> [<i>])
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

script ui_song_details_add_cash_stats 
	gamemode_gettype
	if NOT (<Type> = career || <Type> = quickplay)
		return
	endif
	ui_details_update_song_milestones_data
	ui_details_add_compiled_results_to_table
	song_details_add_space_to_table
endscript

script ui_details_add_compiled_results_to_table 
	collection = ($compiled_individual_cash_rewards)
	GetArraySize <collection>
	if (<array_Size> > 0)
		i = 0
		begin
		temp_struct = (<collection> [<i>])
		mstone = (<temp_struct>.milestone)
		<label> = ($cash_milestones.<mstone>.text)
		row_props = {verse_text = <label>}
		if StructureContains structure = <temp_struct> player1_cash
			formatText TextName = Foo qs(0x447de8d3) d = (<temp_struct>.player1_cash)
			AddParam structure_name = row_props Name = percent_p1_text value = <Foo>
		endif
		if StructureContains structure = <temp_struct> player2_cash
			formatText TextName = Foo qs(0x447de8d3) d = (<temp_struct>.player2_cash)
			AddParam structure_name = row_props Name = percent_p2_text value = <Foo>
		endif
		if StructureContains structure = <temp_struct> player3_cash
			formatText TextName = Foo qs(0x447de8d3) d = (<temp_struct>.player3_cash)
			AddParam structure_name = row_props Name = percent_p3_text value = <Foo>
		endif
		if StructureContains structure = <temp_struct> player4_cash
			formatText TextName = Foo qs(0x447de8d3) d = (<temp_struct>.player4_cash)
			AddParam structure_name = row_props Name = percent_p4_text value = <Foo>
		endif
		CreateScreenElement \{parent = list_menu
			Type = descinterface
			autosizedims = true
			desc = 'song_summary_details_list_entry'
			verse_text = qs(0x00000000)
			percent_p1_text = qs(0x00000000)
			percent_p2_text = qs(0x00000000)
			percent_p3_text = qs(0x00000000)
			percent_p4_text = qs(0x00000000)
			percent_p1_rgba = [
				0
				128
				0
				255
			]
			percent_p2_rgba = [
				0
				128
				0
				255
			]
			percent_p3_rgba = [
				0
				128
				0
				255
			]
			percent_p4_rgba = [
				0
				128
				0
				255
			]}
		Change song_summary_details_row_count = (($song_summary_details_row_count) + 1)
		<id> :se_setprops <row_props>
		i = (<i> + 1)
		repeat <array_Size>
	endif
endscript
compiled_individual_cash_rewards = [
]

script print_compiled_individual_cash_rewards 
	collection = ($compiled_individual_cash_rewards)

endscript

script ui_details_update_song_milestones_data 
	ui_details_compile_cash_rewards
	ui_details_sum_up_milestone_earnings
endscript

script ui_details_sum_up_milestone_earnings 
	gamemode_getnumplayersshown
	trim_boss_from_num_players_show
	collection = ($compiled_individual_cash_rewards)
	GetArraySize <collection>
	i = 0
	if (<array_Size> > 0)
		begin
		temp_struct = (<collection> [<i>])
		award_milestone = 1
		j = 0
		begin
		formatText checksumName = my_check 'player%d_cash' d = (<j> + 1)
		if StructureContains structure = <temp_struct> <my_check>
			amt = (<temp_struct>.<my_check>)
		endif
		j = (<j> + 1)
		repeat <num_players_shown>
		i = (<i> + 1)
		repeat <array_Size>
	endif
endscript

script ui_details_compile_cash_rewards 
	gamemode_getnumplayersshown
	trim_boss_from_num_players_show
	Change \{compiled_individual_cash_rewards = [
		]}
	Player = 1
	begin
	collection = ($cash_milestones_collection_per_song [(<Player> -1)])
	GetArraySize <collection>
	if (<array_Size> > 0)
		i = 0
		begin
		m = (<collection> [<i>])
		compiled_cash_get_duplicate_milestone_index milestone = (<m>.milestone) collection = ($compiled_individual_cash_rewards)
		if (<duplicate_milestone_index> = -1)
			my_struct = {milestone = (<m>.milestone)}
			formatText checksumName = player_cash 'player%d_cash' d = <Player> AddToStringLookup = true
			AddParam Name = <player_cash> structure_name = my_struct value = (<m>.cash)
			AddArrayElement array = ($compiled_individual_cash_rewards) element = <my_struct>
			Change compiled_individual_cash_rewards = <array>
		else
			formatText checksumName = player_cash 'player%d_cash' d = <Player> AddToStringLookup = true
			old_struct = ($compiled_individual_cash_rewards [<duplicate_milestone_index>])
			if StructureContains structure = <old_struct> <player_cash>
				amt = (<old_struct>.<player_cash>)
				AddParam Name = <player_cash> structure_name = old_struct value = ((<m>.cash) + <amt>)
				SetArrayElement ArrayName = compiled_individual_cash_rewards globalarray index = <duplicate_milestone_index> NewValue = <old_struct>
			else
				AddParam Name = <player_cash> structure_name = old_struct value = (<m>.cash)
				SetArrayElement ArrayName = compiled_individual_cash_rewards globalarray index = <duplicate_milestone_index> NewValue = <old_struct>
			endif
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	Player = (<Player> + 1)
	repeat <num_players_shown>
endscript

script compiled_cash_get_duplicate_milestone_index 

	<duplicate_milestone_index> = -1
	GetArraySize <collection>
	if (<array_Size> > 0)
		<i> = 0
		begin
		<milestone_struct> = (<collection> [<i>])
		if StructureContains structure = <milestone_struct> milestone
			if checksumequals a = (<milestone_struct>.milestone) b = <milestone>
				<duplicate_milestone_index> = <i>
				break
			endif
		else
			break
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	return duplicate_milestone_index = <duplicate_milestone_index>
endscript

script song_summary_details_add_band_reward 
	if NOT (<Band> = FALSE)
		<label> = ($cash_milestones.<milestone>.text)
		formatText TextName = reward_name qs(0x4d4555da) s = <label>
		formatText TextName = cash_value qs(0x447de8d3) d = <cash>
		CreateScreenElement {
			parent = list_menu
			Type = descinterface
			autosizedims = true
			desc = 'song_summary_details_list_entry'
			verse_text = <reward_name>
			percent_p1_text = qs(0x00000000)
			percent_p2_text = qs(0x00000000)
			percent_p3_text = qs(0x00000000)
			percent_p4_text = qs(0x00000000)
		}
		gamemode_getnumplayersshown
		i = 1
		begin
		formatText checksumName = cash_val 'percent_p%d_text' d = <i>
		AddParam Name = <cash_val> structure_name = my_struct value = <cash_value>
		i = (<i> + 1)
		repeat <num_players_shown>
		<id> :se_setprops <my_struct>
		Change song_summary_details_row_count = (($song_summary_details_row_count) + 1)
	endif
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
		dims = (970.0, 350.0)
		Pos = (148.0, 341.0)
		just = [left top]
		pos_anchor = [left top]
		event_handlers = <array>
		tags = {current = 0 fit = 11 total = 9}
	}
	CreateScreenElement \{Type = VMenu
		parent = my_current_menu
		id = list_menu
		dims = (100.0, 385.0)
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

script song_details_add_space_to_table 
	CreateScreenElement \{parent = list_menu
		Type = descinterface
		autosizedims = true
		desc = 'song_summary_details_list_entry'
		verse_text = qs(0x00000000)
		percent_p1_text = qs(0x00000000)
		percent_p2_text = qs(0x00000000)
		percent_p3_text = qs(0x00000000)
		percent_p4_text = qs(0x00000000)}
	Change song_summary_details_row_count = (($song_summary_details_row_count) + 1)
endscript

script ui_song_details_shift 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	GetTags
	if GotParam \{down}
		if (<current> >= ((<total> - <fit>) + 1))
			return
		endif
		list_menu :SetProps \{Pos = {
				(0.0, -35.0)
				relative
			}
			time = 0.05}
		SetTags current = (<current> + 1)
		generic_menu_up_or_down_sound \{down}
	else
		if (<current> <= 0)
			return
		endif
		list_menu :SetProps \{Pos = {
				(0.0, 35.0)
				relative
			}
			time = 0.05}
		SetTags current = (<current> - 1)
		generic_menu_up_or_down_sound \{up}
	endif
	GetTags
	Max = ((<total> - <fit>) + 1)
	dx = (197.0 / <Max>)
	Pos = ((358.0, -194.0) + ((0.0, 1.0) * (<current> * <dx>)))
	my_detailed_id :se_setprops setlist_popup_scroll_thumb_pos = <Pos> time = 0.1
endscript

script ui_song_summary_details_anim_in 
	StartRendering \{reason = menu_transition}
	SoundEvent \{event = menu_song_complete_in}

	if ScreenElementExists \{id = my_detailed_id}
		SetScreenElementProps \{id = my_detailed_id
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

	StartRendering \{reason = menu_transition}
	if ScreenElementExists \{id = my_detailed_id}
		SetScreenElementProps \{id = my_detailed_id
			Pos = {
				(1200.0, 0.0)
				relative
			}
			time = 0.1}
		Wait \{0.2
			Second}
	endif
endscript
