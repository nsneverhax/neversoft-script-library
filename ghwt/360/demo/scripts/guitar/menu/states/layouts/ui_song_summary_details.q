song_summary_details_row_count = 0

script ui_create_song_summary_details \{for_transition = 0}
	change \{song_summary_details_row_count = 0}
	gamemode_getnumplayersshown
	trim_boss_from_num_players_show
	gamemode_gettype
	song_details_set_mins_and_maxes
	gig_details = ($gig_detailed_stats)
	getarraysize <gig_details>
	if (<array_size> = 0)
		scriptassert \{qs(0x6b7fb6d2)}
	endif
	get_song_title song = ((<gig_details> [0] [0]).song)
	get_all_exclusive_devices
	createscreenelement {
		parent = root_window
		id = my_detailed_id
		type = descinterface
		desc = 'song_summary_details'
		pos = {(-1200.0, 0.0) relative}
		event_handlers = [
			{pad_back generic_event_back}
		]
		song_title_text = <song_title>
		exclusive_device = <exclusive_device>
	}
	if my_detailed_id :desc_resolvealias \{name = alias_song_summary_details_list
			param = details_list_alias}
	else
		scriptassert \{qs(0xf31b08af)}
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
	formattext checksumname = alpha_check 'icons_p%d_alpha' d = <p>
	formattext checksumname = inst_check 'instrument_p%d_texture' d = <p>
	formattext checksumname = diff_check 'DIFFICULTY_p%d_texture' d = <p>
	my_struct = {}
	addparam structure_name = my_struct name = <alpha_check> value = 1
	addparam structure_name = my_struct name = <inst_check> value = <icon_texture>
	addparam structure_name = my_struct name = <diff_check> value = <diff_texture>
	<details_list_alias> :se_setprops <my_struct>
	p = (<p> + 1)
	repeat <num_players_shown>
	song_details_create_scrolling_menu for_transition = <for_transition>
	vocalist = 0
	non_vocalist = 0
	getarraysize (<gig_details> [0])
	num_songs = <array_size>
	song_indx = 0
	begin
	get_song_title song = ((<gig_details> [0] [<song_indx>]).song)
	createscreenelement \{parent = list_menu
		type = descinterface
		autosizedims = true
		desc = 'song_summary_details_song_header'}
	change song_summary_details_row_count = (($song_summary_details_row_count) + 3)
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
			formattext textname = notes_hit_entry qs(0xa1b58a0a) p = <vocal_phrase_pct> decimalplaces = 0
		else
			<notes_hit_entry> = qs(0x4c1271a9)
		endif
		<sp_entry> = qs(0x4c1271a9)
	else
		if (<type> = battle || <type> = training)
			<sp_entry> = qs(0x4c1271a9)
		else
			formattext textname = sp_entry qs(0x2ba0d6d6) g = (<player_data>.sp_phrases_hit) p = (<player_data>.sp_phrases_total)
		endif
		if (<type> = training)
			formattext textname = notes_hit_entry qs(0x2ba0d6d6) g = (<player_data>.notes_hit) p = (<player_data>.total_notes)
		else
			formattext textname = notes_hit_entry qs(0x2ba0d6d6) g = (<player_data>.notes_hit) p = (<player_data>.max_notes)
		endif
	endif
	formattext textname = mult_entry qs(0x1ad7e10a) p = (<player_data>.avg_multiplier)
	formattext textname = score_entry qs(0x5d9eae64) g = (<player_data>.score)
	formattext checksumname = notes_hit_cs 'notes_hit_entry_text_p%j' j = <i>
	formattext checksumname = sp_phrases_cs 'sp_phrases_entry_text_p%j' j = <i>
	formattext checksumname = avg_mult_cs 'avg_multiplier_entry_text_p%j' j = <i>
	formattext checksumname = score_cs 'score_entry_text_p%j' j = <i>
	addparam name = <score_cs> structure_name = header_struct value = <score_entry>
	addparam name = <notes_hit_cs> structure_name = header_struct value = <notes_hit_entry>
	addparam name = <sp_phrases_cs> structure_name = header_struct value = <sp_entry>
	if NOT (<type> = training || <type> = battle)
		addparam name = <avg_mult_cs> structure_name = header_struct value = <mult_entry>
	endif
	<id> :se_setprops <header_struct>
	i = (<i> + 1)
	repeat (<num_players_shown>)
	i = (<num_players_shown> + 1)
	if NOT (4 = <num_players_shown>)
		begin
		formattext checksumname = entry_alpha 'entries_p%i_alpha' i = <i>
		addparam name = <entry_alpha> structure_name = entry_alpha_struct value = 0.0
		<id> :se_setprops <entry_alpha_struct>
		i = (<i> + 1)
		repeat (4 - <num_players_shown>)
	endif
	if NOT (<type> = training || <type> = battle)
		song_details_add_space_to_table
	else
		<id> :se_setprops {avg_multiplier_alpha = 0}
	endif
	if (<non_vocalist> > 0)
		<sections> = ((<gig_details> [(<non_vocalist> -1)] [<song_indx>]).section_names)
		getarraysize <sections>
		i = 0
		begin
		createscreenelement {
			parent = list_menu
			type = descinterface
			autosizedims = true
			desc = 'song_summary_details_list_entry'
			verse_text = (<sections> [<i>])
			percent_p1_text = qs(0x877d65b8)
			percent_p2_text = qs(0x877d65b8)
			percent_p3_text = qs(0x877d65b8)
			percent_p4_text = qs(0x877d65b8)
		}
		change song_summary_details_row_count = (($song_summary_details_row_count) + 1)
		player = 1
		begin
		getplayerinfo <player> part
		if (<part> = vocals)
		else
			section_hits = (((<gig_details> [(<player> -1)] [<song_indx>]).detailed_stats) [<i>] * 1.0)
			section_possibles = (((<gig_details> [(<player> -1)] [<song_indx>]).detailed_stats_max) [<i>] * 1.0)
			section_hits = (<section_hits> * 1.0)
			my_struct = {}
			if (<section_possibles> = 0)
				formattext \{textname = player_percent
					qs(0x72675d42)}
				formattext checksumname = field_name 'percent_p%d_text' d = <player>
				addparam name = <field_name> structure_name = my_struct value = <player_percent>
				<id> :se_setprops <my_struct>
			else
				percent = (((<section_hits> * 1.0) / <section_possibles>) * 100)
				mathfloor <percent>
				casttointeger \{percent}
				my_color_interp val = <floor> player = <player>
				formattext textname = player_percent qs(0x76b3fda7) d = <floor>
				player_percent = (<player_percent> + qs(0x0c40a1b2))
				formattext checksumname = field_name 'percent_p%d_text' d = <player>
				formattext checksumname = field_name_rgba 'percent_p%d_rgba' d = <player>
				addparam name = <field_name> structure_name = my_struct value = <player_percent>
				addparam name = <field_name_rgba> structure_name = my_struct value = <color>
				<id> :se_setprops <my_struct>
			endif
		endif
		player = (<player> + 1)
		repeat (<num_players_shown>)
		player = (<num_players_shown> + 1)
		if NOT (4 = <num_players_shown>)
			begin
			formattext checksumname = entry_alpha 'percent_P%i_alpha' i = <player>
			addparam name = <entry_alpha> structure_name = entry_alpha_struct value = 0.0
			<id> :se_setprops <entry_alpha_struct>
			player = (<player> + 1)
			repeat (4 - <num_players_shown>)
		endif
		i = (<i> + 1)
		repeat <array_size>
		song_details_add_space_to_table
	endif
	if NOT (<vocalist> = 0)
		vocal_sections = ((<gig_details> [(<vocalist> -1)] [<song_indx>]).section_names)
		i = 0
		getarraysize <vocal_sections>
		if (<array_size> > 0)
			begin
			shortenuistring {
				ui_string = (<vocal_sections> [<i>])
				max_len = 24
			}
			if localizedstringequals a = (<vocal_sections> [<i>]) b = $vocal_marker_freeform
				<verse_rgba> = $vocal_marker_freeform_rgba
			else
				removeparameter \{verse_rgba}
			endif
			createscreenelement {
				parent = list_menu
				type = descinterface
				autosizedims = true
				desc = 'song_summary_details_list_entry'
				verse_text = <short_ui_string>
				verse_rgba = <verse_rgba>
				percent_p1_text = qs(0x877d65b8)
				percent_p2_text = qs(0x877d65b8)
				percent_p3_text = qs(0x877d65b8)
				percent_p4_text = qs(0x877d65b8)
			}
			change song_summary_details_row_count = (($song_summary_details_row_count) + 1)
			player_index = 1
			begin
			getplayerinfo <player_index> part
			if (<part> = vocals)
				section_hits = (((<gig_details> [(<player_index> -1)] [<song_indx>]).detailed_stats) [<i>] * 1.0)
				section_possibles = (((<gig_details> [(<player_index> -1)] [<song_indx>]).detailed_stats_max) [<i>] * 1.0)
				my_struct = {}
				if (<section_possibles> = 0)
					formattext \{textname = player_percent
						qs(0x72675d42)}
					formattext checksumname = field_name 'percent_p%d_text' d = <player_index>
					addparam name = <field_name> structure_name = my_struct value = <player_percent>
					<id> :se_setprops <my_struct>
				else
					percent = (((<section_hits> * 1.0) / <section_possibles>) * 100)
					mathfloor <percent>
					casttointeger \{percent}
					my_color_interp val = <floor> player = <player_index>
					formattext textname = player_percent qs(0x76b3fda7) d = <floor>
					player_percent = (<player_percent> + qs(0x0c40a1b2))
					formattext checksumname = field_name 'percent_p%d_text' d = <player_index>
					formattext checksumname = field_name_rgba 'percent_p%d_rgba' d = <player_index>
					addparam name = <field_name> structure_name = my_struct value = <player_percent>
					addparam name = <field_name_rgba> structure_name = my_struct value = <color>
					<id> :se_setprops <my_struct>
				endif
			endif
			<player_index> = (<player_index> + 1)
			repeat <num_players_shown>
			player = (<num_players_shown> + 1)
			if NOT (4 = <num_players_shown>)
				begin
				formattext checksumname = entry_alpha 'percent_P%i_alpha' i = <player>
				addparam name = <entry_alpha> structure_name = entry_alpha_struct value = 0.0
				<id> :se_setprops <entry_alpha_struct>
				player = (<player> + 1)
				repeat (4 - <num_players_shown>)
			endif
			i = (<i> + 1)
			repeat <array_size>
		endif
		song_details_add_space_to_table
	endif
	song_indx = (<song_indx> + 1)
	repeat <num_songs>
	ui_song_details_add_cash_stats
	setscreenelementprops {
		id = my_current_menu
		tags = {current = 0 fit = 10 total = ($song_summary_details_row_count)}
	}
	if should_use_all_buttons
		all_button_params = {all_buttons}
	endif
	add_user_control_helper text = qs(0xaf4d5dd2) button = red <all_button_params> z = 100000
	launchevent \{type = focus
		target = my_current_menu}
endscript

script ui_destroy_song_summary_details 
	clean_up_user_control_helpers
	destroyscreenelement \{id = my_detailed_id}
endscript

script my_color_interp \{val = 100
		player = 1}
	array = [0 0 0 255]
	min = (($min_percents) [(<player> -1)])
	if (<val> = 100)
		color = [0 128 0 255]
	elseif (<val> <= 90 && <val> = <min>)
		color = [128 0 0 255]
	else
		color = [59 62 52 255]
	endif
	return color = <color>
endscript
min_percents = [
]
max_percents = [
]

script reset_mins_and_maxes 
	change \{my_min = [
		]}
	change \{my_max = [
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
	getarraysize <sections>
	if (<array_size> > 0)
		j = 0
		begin
		section_max = (<section_max_array> [<j>] * 1.0)
		if NOT (<section_max> <= 0)
			section_hits = (<section_hits_array> [<j>] * 1.0)
			percent = (((<section_hits> * 1.0) / (<section_max> * 1.0)) * 100)
			mathfloor <percent>
			casttointeger \{percent}
			if (<percent> < <local_mins> [<i>])
				setarrayelement arrayname = local_mins index = <i> newvalue = <percent>
			endif
			if (<percent> > <local_maxs> [<i>])
				setarrayelement arrayname = local_maxs index = <i> newvalue = <percent>
			endif
		endif
		j = (<j> + 1)
		repeat <array_size>
	endif
	i = (<i> + 1)
	repeat <num_players_shown>
	change min_percents = <local_mins>
	change max_percents = <local_maxs>
endscript

script my_find_max_and_min 
	t_max = -1
	t_min = -1
	requireparams \{[
			array
		]
		all}
	getarraysize \{array}
	if (<array_size> > 0)
		t_max = <array> [0]
		t_min = <array> [0]
		i = 0
		begin
		if (<array> [<i>] < min)
			t_min = <array> [0]
		endif
		if (<array> [<i>] > max)
			t_max = <array> [0]
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return max = <t_max> min = <t_min>
endscript

script ui_song_details_add_cash_stats 
	gamemode_gettype
	if NOT (<type> = career || <type> = quickplay)
		return
	endif
	ui_details_update_song_milestones_data
	ui_details_add_compiled_results_to_table
	song_details_add_space_to_table
endscript

script ui_details_add_compiled_results_to_table 
	collection = ($compiled_individual_cash_rewards)
	getarraysize <collection>
	if (<array_size> > 0)
		i = 0
		begin
		temp_struct = (<collection> [<i>])
		mstone = (<temp_struct>.milestone)
		<label> = ($cash_milestones.<mstone>.text)
		row_props = {verse_text = <label>}
		if structurecontains structure = <temp_struct> player1_cash
			formattext textname = foo qs(0x447de8d3) d = (<temp_struct>.player1_cash)
			addparam structure_name = row_props name = percent_p1_text value = <foo>
		endif
		if structurecontains structure = <temp_struct> player2_cash
			formattext textname = foo qs(0x447de8d3) d = (<temp_struct>.player2_cash)
			addparam structure_name = row_props name = percent_p2_text value = <foo>
		endif
		if structurecontains structure = <temp_struct> player3_cash
			formattext textname = foo qs(0x447de8d3) d = (<temp_struct>.player3_cash)
			addparam structure_name = row_props name = percent_p3_text value = <foo>
		endif
		if structurecontains structure = <temp_struct> player4_cash
			formattext textname = foo qs(0x447de8d3) d = (<temp_struct>.player4_cash)
			addparam structure_name = row_props name = percent_p4_text value = <foo>
		endif
		createscreenelement \{parent = list_menu
			type = descinterface
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
		change song_summary_details_row_count = (($song_summary_details_row_count) + 1)
		<id> :se_setprops <row_props>
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript
compiled_individual_cash_rewards = [
]

script print_compiled_individual_cash_rewards 
	collection = ($compiled_individual_cash_rewards)
	printstruct channel = mychannel <...>
endscript

script ui_details_update_song_milestones_data 
	ui_details_compile_cash_rewards
	ui_details_sum_up_milestone_earnings
endscript

script ui_details_sum_up_milestone_earnings 
	gamemode_getnumplayersshown
	trim_boss_from_num_players_show
	collection = ($compiled_individual_cash_rewards)
	getarraysize <collection>
	i = 0
	if (<array_size> > 0)
		begin
		temp_struct = (<collection> [<i>])
		award_milestone = 1
		j = 0
		begin
		formattext checksumname = my_check 'player%d_cash' d = (<j> + 1)
		if structurecontains structure = <temp_struct> <my_check>
			amt = (<temp_struct>.<my_check>)
		endif
		j = (<j> + 1)
		repeat <num_players_shown>
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script ui_details_compile_cash_rewards 
	gamemode_getnumplayersshown
	trim_boss_from_num_players_show
	change \{compiled_individual_cash_rewards = [
		]}
	player = 1
	begin
	collection = ($cash_milestones_collection_per_song [(<player> -1)])
	getarraysize <collection>
	if (<array_size> > 0)
		i = 0
		begin
		m = (<collection> [<i>])
		compiled_cash_get_duplicate_milestone_index milestone = (<m>.milestone) collection = ($compiled_individual_cash_rewards)
		if (<duplicate_milestone_index> = -1)
			my_struct = {milestone = (<m>.milestone)}
			formattext checksumname = player_cash 'player%d_cash' d = <player> addtostringlookup = true
			addparam name = <player_cash> structure_name = my_struct value = (<m>.cash)
			addarrayelement array = ($compiled_individual_cash_rewards) element = <my_struct>
			change compiled_individual_cash_rewards = <array>
		else
			formattext checksumname = player_cash 'player%d_cash' d = <player> addtostringlookup = true
			old_struct = ($compiled_individual_cash_rewards [<duplicate_milestone_index>])
			if structurecontains structure = <old_struct> <player_cash>
				amt = (<old_struct>.<player_cash>)
				addparam name = <player_cash> structure_name = old_struct value = ((<m>.cash) + <amt>)
				setarrayelement arrayname = compiled_individual_cash_rewards globalarray index = <duplicate_milestone_index> newvalue = <old_struct>
			else
				addparam name = <player_cash> structure_name = old_struct value = (<m>.cash)
				setarrayelement arrayname = compiled_individual_cash_rewards globalarray index = <duplicate_milestone_index> newvalue = <old_struct>
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	player = (<player> + 1)
	repeat <num_players_shown>
endscript

script compiled_cash_get_duplicate_milestone_index 
	requireparams \{[
			milestone
			collection
		]
		all}
	<duplicate_milestone_index> = -1
	getarraysize <collection>
	if (<array_size> > 0)
		<i> = 0
		begin
		<milestone_struct> = (<collection> [<i>])
		if structurecontains structure = <milestone_struct> milestone
			if checksumequals a = (<milestone_struct>.milestone) b = <milestone>
				<duplicate_milestone_index> = <i>
				break
			endif
		else
			break
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	return duplicate_milestone_index = <duplicate_milestone_index>
endscript

script song_summary_details_add_band_reward 
	if NOT (<band> = false)
		<label> = ($cash_milestones.<milestone>.text)
		formattext textname = reward_name qs(0x4d4555da) s = <label>
		formattext textname = cash_value qs(0x447de8d3) d = <cash>
		createscreenelement {
			parent = list_menu
			type = descinterface
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
		formattext checksumname = cash_val 'percent_p%d_text' d = <i>
		addparam name = <cash_val> structure_name = my_struct value = <cash_value>
		i = (<i> + 1)
		repeat <num_players_shown>
		<id> :se_setprops <my_struct>
		change song_summary_details_row_count = (($song_summary_details_row_count) + 1)
	endif
endscript

script song_details_create_scrolling_menu 
	if my_detailed_id :desc_resolvealias \{name = alias_song_summary_details_list
			param = details_list_alias}
	else
		scriptassert \{qs(0xf31b08af)}
	endif
	array = [
		{pad_up ui_song_details_shift params = {up}}
		{pad_down ui_song_details_shift params = {down}}
		{pad_back generic_event_back}
	]
	if (<for_transition> = 1)
		setarrayelement \{arrayname = array
			index = 2
			newvalue = {
				pad_back
				generic_event_back
				params = {
					data = {
						transitioning = 1
					}
				}
			}}
	endif
	createscreenelement {
		type = windowelement
		parent = <details_list_alias>
		id = my_current_menu
		dims = (970.0, 350.0)
		pos = (148.0, 341.0)
		just = [left top]
		pos_anchor = [left top]
		event_handlers = <array>
		tags = {current = 0 fit = 11 total = 9}
	}
	createscreenelement \{type = vmenu
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
	setscreenelementprops \{id = my_detailed_id
		arrow_top_alpha = 0}
endscript

script song_details_add_space_to_table 
	createscreenelement \{parent = list_menu
		type = descinterface
		autosizedims = true
		desc = 'song_summary_details_list_entry'
		verse_text = qs(0x00000000)
		percent_p1_text = qs(0x00000000)
		percent_p2_text = qs(0x00000000)
		percent_p3_text = qs(0x00000000)
		percent_p4_text = qs(0x00000000)}
	change song_summary_details_row_count = (($song_summary_details_row_count) + 1)
endscript

script ui_song_details_shift 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	gettags
	if gotparam \{down}
		if (<current> >= (<total> - <fit>))
			return
		endif
		list_menu :setprops \{pos = {
				(0.0, -35.0)
				relative
			}
			time = 0.05}
		settags current = (<current> + 1)
		generic_menu_up_or_down_sound \{down}
	else
		if (<current> <= 0)
			return
		endif
		list_menu :setprops \{pos = {
				(0.0, 35.0)
				relative
			}
			time = 0.05}
		settags current = (<current> - 1)
		generic_menu_up_or_down_sound \{up}
	endif
	gettags
	max = ((<total> - <fit>) + 1)
	dx = (197.0 / <max>)
	pos = ((358.0, -194.0) + ((0.0, 1.0) * (<current> * <dx>)))
	my_detailed_id :se_setprops setlist_popup_scroll_thumb_pos = <pos> time = 0.1
endscript

script ui_song_summary_details_anim_in 
	startrendering \{reason = menu_transition}
	soundevent \{event = menu_song_complete_in}
	printf \{channel = mychannel
		qs(0x69a79a5b)}
	if screenelementexists \{id = my_detailed_id}
		setscreenelementprops \{id = my_detailed_id
			pos = {
				(1200.0, 0.0)
				relative
			}
			time = 0.1}
		wait \{0.2
			second}
	endif
endscript

script ui_song_summary_details_anim_out 
	soundevent \{event = menu_song_complete_out}
	printf \{channel = mychannel
		qs(0x53871813)}
	startrendering \{reason = menu_transition}
	if screenelementexists \{id = my_detailed_id}
		setscreenelementprops \{id = my_detailed_id
			pos = {
				(1200.0, 0.0)
				relative
			}
			time = 0.1}
		wait \{0.2
			second}
	endif
endscript
