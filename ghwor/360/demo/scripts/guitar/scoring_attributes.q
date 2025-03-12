g_crowd_meter_star_bonus_max_1 = 2
g_crowd_meter_star_bonus_max_2 = 5
g_crowd_meter_star_bonus_percentage = 20.0
g_multiplier_star_bonus_max_1 = 2
g_multiplier_star_bonus_max_2 = 5
g_johnny_bonus_song_percent = 15.0
g_casey_reset_streaks = 1
g_casey_notestreak_thresholds_1 = [
	8
	9
]
g_casey_notestreak_thresholds_2 = [
	8
	9
	10
	11
	12
]
g_casey_phrasestreak_thresholds_1 = [
	7
	8
]
g_casey_phrasestreak_thresholds_2 = [
	7
	8
	9
	10
	12
]
g_debug_show_scoring_attributes_on_pause = 0
g_default_scoring = {
	gem_score = 50
	gem_hopo_score = 50
	gem_chord_score = 50
	gem_chord_hopo_score = 50
	gem_tap_score = 50
	sustain_beat_score = 25
	multiplier_1 = 1
	multiplier_2 = 2
	multiplier_3 = 3
	multiplier_4 = 4
	multiplier_5 = 0
	multiplier_6 = 0
	multiplier_speed = 1
	min_multiplier = 1
	star_power_multiplier = 2
	star_power_gain_multiplier = 1.0
	star_power_per_note_streak = 0.0
	crowd_meter_start_bonus = 0.0
	miss_note_bonus_allowed = 0
	miss_note_bonus_ms = 0.0
	current_resurrection_lives = 0
}
g_default_band_scoring = {
	max_resurrection_lives = 0
}
g_scoring_max_multiplier = {
	set_all_players = 1
	level1 = [
		{
			name = multiplier_1
			value = 0
		}
		{
			name = multiplier_2
			value = 0
		}
		{
			name = multiplier_3
			value = 0
		}
		{
			name = multiplier_4
			value = 0
		}
		{
			name = multiplier_5
			value = 5
		}
		{
			name = multiplier_6
			value = 0
		}
	]
	level2 = [
		{
			name = multiplier_1
			value = 0
		}
		{
			name = multiplier_2
			value = 0
		}
		{
			name = multiplier_3
			value = 0
		}
		{
			name = multiplier_4
			value = 0
		}
		{
			name = multiplier_5
			value = 5
		}
		{
			name = multiplier_6
			value = 6
		}
	]
}
g_scoring_star_power_per_note_streak = {
	set_all_players = 1
	level1 = [
		{
			name = star_power_per_note_streak
			value = 5.0
		}
	]
	level2 = [
		{
			name = star_power_per_note_streak
			value = 10.0
		}
	]
}
g_scoring_crowd_meter_start_bonus = {
	set_all_players = 1
	level1 = [
		{
			name = crowd_meter_start_bonus
			value = 1.3349999
		}
	]
	level2 = [
		{
			name = crowd_meter_start_bonus
			value = 2.0
		}
	]
}
g_scoring_miss_note_bonus = {
	set_all_players = 1
	level1 = [
		{
			name = miss_note_bonus_allowed
			value = 1
		}
		{
			name = miss_note_bonus_ms
			value = 3000
		}
	]
	level2 = [
		{
			name = miss_note_bonus_allowed
			value = 2
		}
		{
			name = miss_note_bonus_ms
			value = 1000
		}
	]
}
g_scoring_star_power_gain_multiplier = {
	set_all_players = 1
	level1 = [
		{
			name = star_power_gain_multiplier
			value = 1.0
		}
	]
	level2 = [
		{
			name = star_power_gain_multiplier
			value = 3.0
		}
	]
}
g_scoring_resurrection = {
	band = 1
	level1 = [
		{
			name = current_resurrection_lives
			value = 0
		}
	]
	level2 = [
		{
			name = current_resurrection_lives
			value = 0
		}
	]
	band_level1 = [
		{
			name = max_resurrection_lives
			value = 2
		}
	]
	band_level2 = [
		{
			name = max_resurrection_lives
			value = 5
		}
	]
}
g_scoring_min_multiplier = {
	set_all_players = 1
	level1 = [
		{
			name = min_multiplier
			value = 1
		}
	]
	level2 = [
		{
			name = min_multiplier
			value = 1
		}
		{
			name = multiplier_speed
			value = 1
		}
	]
}
g_scoring_star_power_multiplier = {
	set_all_players = 1
	level1 = [
		{
			name = star_power_multiplier
			value = 1
		}
	]
	level2 = [
		{
			name = star_power_multiplier
			value = 4
		}
	]
}
g_scoring_demigod = {
}

script set_scoring_attributes_to_band \{band = 1
		globalname = g_default_band_scoring}
	setbandinfo <band> max_resurrection_lives = ($<globalname>.max_resurrection_lives)
	setbandinfo <band> crowd_meter_bonus_stars = 0
	setbandinfo <band> mult_timer_bonus_stars = 0
	setbandinfo <band> current_resurrection_lives = 0
	setbandinfo <band> used_resurrection_lives = 0
endscript

script set_scoring_attributes_to_player \{player = !i1768515945
		globalname = g_default_scoring}
	setplayerinfo <player> gem_score = ($<globalname>.gem_score)
	setplayerinfo <player> gem_hopo_score = ($<globalname>.gem_hopo_score)
	setplayerinfo <player> gem_chord_score = ($<globalname>.gem_chord_score)
	setplayerinfo <player> gem_chord_hopo_score = ($<globalname>.gem_chord_hopo_score)
	setplayerinfo <player> gem_tap_score = ($<globalname>.gem_tap_score)
	setplayerinfo <player> sustain_beat_score = ($<globalname>.sustain_beat_score)
	setplayerinfo <player> multiplier_speed = ($<globalname>.multiplier_speed)
	setplayerinfo <player> min_multiplier = ($<globalname>.min_multiplier)
	setplayerinfo <player> star_power_multiplier = ($<globalname>.star_power_multiplier)
	setplayerinfo <player> star_power_gain_multiplier = ($<globalname>.star_power_gain_multiplier)
	setplayerinfo <player> star_power_per_note_streak = ($<globalname>.star_power_per_note_streak)
	setplayerinfo <player> crowd_meter_start_bonus = ($<globalname>.crowd_meter_start_bonus)
	setplayerinfo <player> miss_note_bonus_allowed = ($<globalname>.miss_note_bonus_allowed)
	setplayerinfo <player> miss_note_bonus_ms = ($<globalname>.miss_note_bonus_ms)
	setplayerinfo <player> current_resurrection_lives = ($<globalname>.current_resurrection_lives)
	setplayerinfo <player> multiplier_1 = ($<globalname>.multiplier_1)
	setplayerinfo <player> multiplier_2 = ($<globalname>.multiplier_2)
	setplayerinfo <player> multiplier_3 = ($<globalname>.multiplier_3)
	setplayerinfo <player> multiplier_4 = ($<globalname>.multiplier_4)
	setplayerinfo <player> multiplier_5 = ($<globalname>.multiplier_5)
	setplayerinfo <player> multiplier_6 = ($<globalname>.multiplier_6)
endscript
g_debug_scoring_attribute_level = 0

script add_character_scoring_attributes_to_player \{player = !i1768515945
		character_id = none
		power_global = none}
	if ($g_debug_scoring_attribute_level > 0)
		setplayerinfo <player> score_attribute_level = ($g_debug_scoring_attribute_level)
	endif
	if NOT gotparam \{level}
		getplayerinfo <player> score_attribute_level
	else
		score_attribute_level = <level>
	endif
	if (<power_global> = none)
		if (<character_id> = none)
			getplayerinfo <player> character_id
		endif
		switch (<character_id>)
			case gh_rocker_newmale
			case gh_rocker_newmale_2
			case gh_rocker_austin_tejas
			case gh_rocker_austin_tejas_2
			<global_struct> = ($newmale_hero_info.power_global)
			case gh_rocker_2009
			case gh_rocker_2009_2
			case gh_rocker_echo_tesla
			case gh_rocker_echo_tesla_2
			<global_struct> = ($newfemale_hero_info.power_global)
			case gh_rocker_johnny
			case gh_rocker_johnny_2
			<global_struct> = ($johnny_hero_info.power_global)
			case gh_rocker_axel
			case gh_rocker_axel_2
			<global_struct> = ($axel_hero_info.power_global)
			case gh_rocker_judy
			case gh_rocker_judy_2
			<global_struct> = ($judy_hero_info.power_global)
			case gh_rocker_pandora
			case gh_rocker_pandora_2
			<global_struct> = ($pandora_hero_info.power_global)
			case gh_rocker_lars
			case gh_rocker_lars_2
			<global_struct> = ($lars_hero_info.power_global)
			case gh_rocker_casey
			case gh_rocker_casey_2
			<global_struct> = ($casey_hero_info.power_global)
			case gh_rocker_demigod
			case gh_rocker_demigodscaled
			<global_struct> = ($demigod_hero_info.power_global)
			default
			return
		endswitch
	else
		<global_struct> = <power_global>
	endif
	add_scoring_attributes_to_player player = <player> globalname = <global_struct> level = <score_attribute_level>
endscript

script add_scoring_attributes_to_player \{player = !i1768515945
		globalname = !q1768515945
		level = 1}
	this_player = <player>
	gamemode_gettype
	formattext checksumname = levelchecksum 'level%d' d = <level>
	formattext checksumname = bandlevelchecksum 'band_level%d' d = <level>
	set_all_players = 0
	if structurecontains structure = ($<globalname>) set_all_players
		set_all_players = 1
	endif
	set_band = 0
	if structurecontains structure = ($<globalname>) band
		set_band = 1
	endif
	<level_array> = ($<globalname>.<levelchecksum>)
	<level_index> = 0
	getarraysize <level_array>
	begin
	<attrib_name> = (<level_array> [<level_index>].name)
	<attrib_value> = (<level_array> [<level_index>].value)
	getplayerinfo <this_player> <attrib_name>
	<scoring_attrib> = {}
	addparam structure_name = scoring_attrib name = <attrib_name> value = ((<...>.<attrib_name>) + <attrib_value>)
	if (<set_all_players> = 1)
		getnumplayersingame \{local}
		if (<num_players> > 0)
			getfirstplayer \{local}
			begin
			if (<type> = career)
				setplayerinfo <player> score_attribute_level = <level>
			endif
			setplayerinfo <player> <scoring_attrib>
			getnextplayer player = <player> local
			repeat <num_players>
		endif
	else
		setplayerinfo <this_player> <scoring_attrib>
	endif
	if (<set_band> = 1)
		getplayerinfo <this_player> band
		setbandinfo <band> <scoring_attrib>
	endif
	if (<attrib_name> = miss_note_bonus_allowed)
		getplayerinfo <this_player> band
		getbandinfo <band> <attrib_name>
		<scoring_attrib> = {}
		addparam structure_name = scoring_attrib name = <attrib_name> value = ((<...>.<attrib_name>) + <attrib_value>)
		setbandinfo <band> <scoring_attrib>
	endif
	<level_index> = (<level_index> + 1)
	repeat <array_size>
	if structurecontains structure = ($<globalname>) <bandlevelchecksum>
		getplayerinfo <this_player> band
		this_band = <band>
		<level_array> = ($<globalname>.<bandlevelchecksum>)
		<level_index> = 0
		getarraysize <level_array>
		begin
		<attrib_name> = (<level_array> [<level_index>].name)
		<attrib_value> = (<level_array> [<level_index>].value)
		getbandinfo <this_player> <attrib_name>
		<scoring_attrib> = {}
		addparam structure_name = scoring_attrib name = <attrib_name> value = ((<...>.<attrib_name>) + <attrib_value>)
		setbandinfo <this_band> <scoring_attrib>
		<level_index> = (<level_index> + 1)
		repeat <array_size>
	endif
endscript

script print_player_scoring_info \{player = !i1768515945}
	getplayerinfo <player> score_attribute_level
	getplayerinfo <player> gem_score
	getplayerinfo <player> gem_hopo_score
	getplayerinfo <player> gem_chord_score
	getplayerinfo <player> gem_chord_hopo_score
	getplayerinfo <player> gem_tap_score
	getplayerinfo <player> sustain_beat_score
	getplayerinfo <player> multiplier_speed
	getplayerinfo <player> min_multiplier
	getplayerinfo <player> star_power_multiplier
	getplayerinfo <player> star_power_gain_multiplier
	getplayerinfo <player> star_power_per_note_streak
	getplayerinfo <player> crowd_meter_start_bonus
	getplayerinfo <player> miss_note_bonus_allowed
	getplayerinfo <player> miss_note_bonus_ms
	getplayerinfo <player> current_resurrection_lives
	getplayerinfo <player> multiplier_1
	getplayerinfo <player> multiplier_2
	getplayerinfo <player> multiplier_3
	getplayerinfo <player> multiplier_4
	getplayerinfo <player> multiplier_5
	getplayerinfo <player> multiplier_6
	printstruct channel = zdebug <...>
endscript

script apply_scoring_attributes_for_players 
	debug_globals = [
		'debug_sp_mult_%d'
		'debug_mult_max_%d'
		'debug_mult_enhance_%d'
		'debug_star_power_gain_multiplier_%d'
		'debug_sp_note_streak_%d'
		'debug_crowd_meter_start_bonus_%d'
		'debug_miss_note_bonus_%d'
		'debug_resurrection_lives_%d'
	]
	debug_names = [
		g_scoring_star_power_multiplier
		g_scoring_max_multiplier
		g_scoring_min_multiplier
		g_scoring_star_power_gain_multiplier
		g_scoring_star_power_per_note_streak
		g_scoring_crowd_meter_start_bonus
		g_scoring_miss_note_bonus
		g_scoring_resurrection
	]
	getarraysize <debug_globals>
	<num_debugs> = <array_size>
	gamemode_gettype
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		getplayerinfo <player> band
		set_scoring_attributes_to_band band = <band>
		begin
		set_scoring_attributes_to_player player = <player>
		getnextplayer player = <player> local
		repeat <num_players>
	endif
	if (<num_players> > 0)
		if (<type> = career)
			player = ($g_net_leader_player_num)
			if console_is_net_career_client
				band_leader_savegame = -1
			else
				if (<player> < 1)
					getfirstplayer \{local}
				endif
				getplayerinfo <player> controller
				getsavegamefromcontroller controller = <controller>
				band_leader_savegame = <savegame>
			endif
			getfirstplayer \{local}
			<using_debug> = 0
			<idx> = 0
			begin
			formattext checksumname = sa_global (<debug_globals> [<idx>]) d = <player>
			if ($<sa_global> > 0)
				add_scoring_attributes_to_player player = <player> level = ($<sa_global>) globalname = (<debug_names> [<idx>])
				<using_debug> = 1
			endif
			<idx> = (<idx> + 1)
			repeat <num_debugs>
			if (<using_debug> = 0)
				<add_all_powers> = 0
				if quest_progression_is_chapter_finale
					setplayerinfo <player> score_attribute_level = 2
					if quest_progression_check_for_demigod_playing
						<add_all_powers> = 1
					else
						add_character_scoring_attributes_to_player player = <player> character_id = ($rockerband_gh_rocker_demigod.power_rocker)
						add_character_scoring_attributes_to_player player = <player> character_id = ($rockerband_gh_rocker_demigod.power_male1)
						add_character_scoring_attributes_to_player player = <player> character_id = ($rockerband_gh_rocker_demigod.power_male2)
						add_character_scoring_attributes_to_player player = <player> character_id = ($rockerband_gh_rocker_demigod.power_female1)
					endif
				elseif quest_progression_is_chapter_rush
					setplayerinfo <player> score_attribute_level = 2
					add_character_scoring_attributes_to_player player = <player> character_id = ($rockerband_tier2complete.power_rocker)
					add_character_scoring_attributes_to_player player = <player> character_id = ($rockerband_tier2complete.power_male1)
					add_character_scoring_attributes_to_player player = <player> character_id = ($rockerband_tier2complete.power_male2)
					add_character_scoring_attributes_to_player player = <player> character_id = ($rockerband_tier2complete.power_female1)
				elseif quest_progression_is_chapter_credits
					<add_all_powers> = 1
				elseif quest_progression_check_domination_unlocked savegame = <band_leader_savegame>
					<add_all_powers> = 1
				else
					current_chapter = ($current_chapter)
					<hero_info_global> = ($<current_chapter>.hero_info)
					power = ($<hero_info_global>.power_global)
					add_character_scoring_attributes_to_player player = <player> power_global = <power>
				endif
				if (<add_all_powers> = 1)
					setplayerinfo <player> score_attribute_level = 2
					add_character_scoring_attributes_to_player player = <player> character_id = gh_rocker_austin_tejas
					add_character_scoring_attributes_to_player player = <player> character_id = gh_rocker_echo_tesla
					add_character_scoring_attributes_to_player player = <player> character_id = gh_rocker_johnny
					add_character_scoring_attributes_to_player player = <player> character_id = gh_rocker_axel
					add_character_scoring_attributes_to_player player = <player> character_id = gh_rocker_judy
					add_character_scoring_attributes_to_player player = <player> character_id = gh_rocker_pandora
					add_character_scoring_attributes_to_player player = <player> character_id = gh_rocker_lars
					add_character_scoring_attributes_to_player player = <player> character_id = gh_rocker_casey
				endif
			endif
		elseif (<type> = quickplay)
			if ($autotest_on = 1)
				getfirstplayer \{local}
				autotest_powers = ($g_autotest_career_powers)
				getarraysize <autotest_powers> param = num_autotest_powers
				if (<num_autotest_powers> > 0)
					<power_index> = 0
					begin
					current_power = (<autotest_powers> [<power_index>])
					if (<current_power>.level != 0)
						add_character_scoring_attributes_to_player player = <player> level = (<current_power>.level) character_id = (<current_power>.power)
					endif
					<power_index> = (<power_index> + 1)
					repeat <num_autotest_powers>
				endif
			endif
			if gman_ispowerscoreenabled
				gman_getdata \{goal = quickplay
					name = powers_enabled}
				getfirstplayer \{local}
				getarraysize \{powers_enabled}
				if (<array_size> > 0)
					<cnt> = 0
					begin
					<power_info> = ((<powers_enabled> [<cnt>]).power_info)
					<level_info> = ((<powers_enabled> [<cnt>]).level)
					add_character_scoring_attributes_to_player player = <player> power_global = ($<power_info>.power_global) level = <level_info>
					<cnt> = (<cnt> + 1)
					repeat <array_size>
				endif
			endif
		endif
	endif
endscript

script debug_show_scoring_attributes \{parent = !q1768515945
		player = !i1768515945}
	if NOT screenelementexists id = <parent>
		return
	endif
	getplayerinfo <player> score_attribute_level
	getplayerinfo <player> multiplier_speed
	getplayerinfo <player> min_multiplier
	getplayerinfo <player> star_power_multiplier
	getplayerinfo <player> star_power_gain_multiplier
	getplayerinfo <player> star_power_per_note_streak
	getplayerinfo <player> crowd_meter_start_bonus
	getplayerinfo <player> miss_note_bonus_allowed
	getplayerinfo <player> miss_note_bonus_ms
	getplayerinfo <player> current_resurrection_lives
	getplayerinfo <player> multiplier_1
	getplayerinfo <player> multiplier_2
	getplayerinfo <player> multiplier_3
	getplayerinfo <player> multiplier_4
	getplayerinfo <player> multiplier_5
	getplayerinfo <player> multiplier_6
	<default_props> = {type = textelement parent = <parent> font = fontgrid_title_a1 scale = 0.2 just = [left top]}
	<pos> = (-500.0, -100.0)
	<pos_increase> = (0.0, 20.0)
	createscreenelement {
		<default_props>
		text = qs(0x168007dc)
		pos = <pos>
		rgba = [200 10 10 255]
	}
	<pos> = (<pos> + <pos_increase>)
	formattext textname = text qs(0xca762e35) d = <score_attribute_level>
	createscreenelement {
		<default_props>
		text = <text>
		pos = <pos>
	}
	<pos> = (<pos> + <pos_increase>)
	formattext textname = text qs(0x5e066daa) d = <min_multiplier>
	createscreenelement {
		<default_props>
		text = <text>
		pos = <pos>
	}
	<pos> = (<pos> + <pos_increase>)
	formattext textname = text qs(0x71e0604a) d = <star_power_multiplier>
	createscreenelement {
		<default_props>
		text = <text>
		pos = <pos>
	}
	<pos> = (<pos> + <pos_increase>)
	formattext textname = text qs(0x57a9f1f4) d = <star_power_gain_multiplier>
	createscreenelement {
		<default_props>
		text = <text>
		pos = <pos>
	}
	<pos> = (<pos> + <pos_increase>)
	formattext textname = text qs(0xbc96c9a5) d = <star_power_per_note_streak>
	createscreenelement {
		<default_props>
		text = <text>
		pos = <pos>
	}
	<pos> = (<pos> + <pos_increase>)
	formattext textname = text qs(0x5c37603c) d = <crowd_meter_start_bonus>
	createscreenelement {
		<default_props>
		text = <text>
		pos = <pos>
	}
	<pos> = (<pos> + <pos_increase>)
	formattext textname = text qs(0x54d7bb79) d = <miss_note_bonus_allowed>
	createscreenelement {
		<default_props>
		text = <text>
		pos = <pos>
	}
	<pos> = (<pos> + <pos_increase>)
	formattext textname = text qs(0x544b5142) d = <current_resurrection_lives>
	createscreenelement {
		<default_props>
		text = <text>
		pos = <pos>
	}
	<pos> = (<pos> + <pos_increase>)
	formattext textname = text qs(0x524fbe77) d = <multiplier_1>
	createscreenelement {
		<default_props>
		text = <text>
		pos = <pos>
	}
	<pos> = (<pos> + <pos_increase>)
	formattext textname = text qs(0x25d16c87) d = <multiplier_2>
	createscreenelement {
		<default_props>
		text = <text>
		pos = <pos>
	}
	<pos> = (<pos> + <pos_increase>)
	formattext textname = text qs(0xbe7420e8) d = <multiplier_3>
	createscreenelement {
		<default_props>
		text = <text>
		pos = <pos>
	}
	<pos> = (<pos> + <pos_increase>)
	formattext textname = text qs(0xcaecc967) d = <multiplier_4>
	createscreenelement {
		<default_props>
		text = <text>
		pos = <pos>
	}
	<pos> = (<pos> + <pos_increase>)
	formattext textname = text qs(0x51498508) d = <multiplier_5>
	createscreenelement {
		<default_props>
		text = <text>
		pos = <pos>
	}
	<pos> = (<pos> + <pos_increase>)
	formattext textname = text qs(0x26d757f8) d = <multiplier_6>
	createscreenelement {
		<default_props>
		text = <text>
		pos = <pos>
	}
	<pos> = (<pos> + <pos_increase>)
endscript
