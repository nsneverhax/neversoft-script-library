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
			Name = multiplier_1
			value = 0
		}
		{
			Name = multiplier_2
			value = 0
		}
		{
			Name = multiplier_3
			value = 0
		}
		{
			Name = multiplier_4
			value = 0
		}
		{
			Name = multiplier_5
			value = 5
		}
		{
			Name = multiplier_6
			value = 0
		}
	]
	level2 = [
		{
			Name = multiplier_1
			value = 0
		}
		{
			Name = multiplier_2
			value = 0
		}
		{
			Name = multiplier_3
			value = 0
		}
		{
			Name = multiplier_4
			value = 0
		}
		{
			Name = multiplier_5
			value = 5
		}
		{
			Name = multiplier_6
			value = 6
		}
	]
}
g_scoring_star_power_per_note_streak = {
	set_all_players = 1
	level1 = [
		{
			Name = star_power_per_note_streak
			value = 5.0
		}
	]
	level2 = [
		{
			Name = star_power_per_note_streak
			value = 10.0
		}
	]
}
g_scoring_crowd_meter_start_bonus = {
	set_all_players = 1
	level1 = [
		{
			Name = crowd_meter_start_bonus
			value = 1.3349999
		}
	]
	level2 = [
		{
			Name = crowd_meter_start_bonus
			value = 2.0
		}
	]
}
g_scoring_miss_note_bonus = {
	set_all_players = 1
	level1 = [
		{
			Name = miss_note_bonus_allowed
			value = 1
		}
		{
			Name = miss_note_bonus_ms
			value = 3000
		}
	]
	level2 = [
		{
			Name = miss_note_bonus_allowed
			value = 2
		}
		{
			Name = miss_note_bonus_ms
			value = 1000
		}
	]
}
g_scoring_star_power_gain_multiplier = {
	set_all_players = 1
	level1 = [
		{
			Name = star_power_gain_multiplier
			value = 1.0
		}
	]
	level2 = [
		{
			Name = star_power_gain_multiplier
			value = 3.0
		}
	]
}
g_scoring_resurrection = {
	Band = 1
	level1 = [
		{
			Name = current_resurrection_lives
			value = 0
		}
	]
	level2 = [
		{
			Name = current_resurrection_lives
			value = 0
		}
	]
	band_level1 = [
		{
			Name = max_resurrection_lives
			value = 2
		}
	]
	band_level2 = [
		{
			Name = max_resurrection_lives
			value = 5
		}
	]
}
g_scoring_min_multiplier = {
	set_all_players = 1
	level1 = [
		{
			Name = min_multiplier
			value = 1
		}
	]
	level2 = [
		{
			Name = min_multiplier
			value = 1
		}
		{
			Name = multiplier_speed
			value = 1
		}
	]
}
g_scoring_star_power_multiplier = {
	set_all_players = 1
	level1 = [
		{
			Name = star_power_multiplier
			value = 1
		}
	]
	level2 = [
		{
			Name = star_power_multiplier
			value = 4
		}
	]
}
g_scoring_demigod = {
}

script set_scoring_attributes_to_band \{Band = 1
		GlobalName = g_default_band_scoring}
	setbandinfo <Band> max_resurrection_lives = ($<GlobalName>.max_resurrection_lives)
	setbandinfo <Band> crowd_meter_bonus_stars = 0
	setbandinfo <Band> mult_timer_bonus_stars = 0
	setbandinfo <Band> current_resurrection_lives = 0
	setbandinfo <Band> used_resurrection_lives = 0
endscript

script set_scoring_attributes_to_player \{Player = !i1768515945
		GlobalName = g_default_scoring}
	setplayerinfo <Player> gem_score = ($<GlobalName>.gem_score)
	setplayerinfo <Player> gem_hopo_score = ($<GlobalName>.gem_hopo_score)
	setplayerinfo <Player> gem_chord_score = ($<GlobalName>.gem_chord_score)
	setplayerinfo <Player> gem_chord_hopo_score = ($<GlobalName>.gem_chord_hopo_score)
	setplayerinfo <Player> gem_tap_score = ($<GlobalName>.gem_tap_score)
	setplayerinfo <Player> sustain_beat_score = ($<GlobalName>.sustain_beat_score)
	setplayerinfo <Player> multiplier_speed = ($<GlobalName>.multiplier_speed)
	setplayerinfo <Player> min_multiplier = ($<GlobalName>.min_multiplier)
	setplayerinfo <Player> star_power_multiplier = ($<GlobalName>.star_power_multiplier)
	setplayerinfo <Player> star_power_gain_multiplier = ($<GlobalName>.star_power_gain_multiplier)
	setplayerinfo <Player> star_power_per_note_streak = ($<GlobalName>.star_power_per_note_streak)
	setplayerinfo <Player> crowd_meter_start_bonus = ($<GlobalName>.crowd_meter_start_bonus)
	setplayerinfo <Player> miss_note_bonus_allowed = ($<GlobalName>.miss_note_bonus_allowed)
	setplayerinfo <Player> miss_note_bonus_ms = ($<GlobalName>.miss_note_bonus_ms)
	setplayerinfo <Player> current_resurrection_lives = ($<GlobalName>.current_resurrection_lives)
	setplayerinfo <Player> multiplier_1 = ($<GlobalName>.multiplier_1)
	setplayerinfo <Player> multiplier_2 = ($<GlobalName>.multiplier_2)
	setplayerinfo <Player> multiplier_3 = ($<GlobalName>.multiplier_3)
	setplayerinfo <Player> multiplier_4 = ($<GlobalName>.multiplier_4)
	setplayerinfo <Player> multiplier_5 = ($<GlobalName>.multiplier_5)
	setplayerinfo <Player> multiplier_6 = ($<GlobalName>.multiplier_6)
endscript
g_debug_scoring_attribute_level = 0

script add_character_scoring_attributes_to_player \{Player = !i1768515945
		character_id = None
		power_global = None}
	if ($g_debug_scoring_attribute_level > 0)
		setplayerinfo <Player> score_attribute_level = ($g_debug_scoring_attribute_level)
	endif
	if NOT GotParam \{level}
		getplayerinfo <Player> score_attribute_level
	else
		score_attribute_level = <level>
	endif
	if (<power_global> = None)
		if (<character_id> = None)
			getplayerinfo <Player> character_id
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
	add_scoring_attributes_to_player Player = <Player> GlobalName = <global_struct> level = <score_attribute_level>
endscript

script add_scoring_attributes_to_player \{Player = !i1768515945
		GlobalName = !q1768515945
		level = 1}
	this_player = <Player>
	gamemode_gettype
	formatText checksumName = levelchecksum 'level%d' d = <level>
	formatText checksumName = bandlevelchecksum 'band_level%d' d = <level>
	set_all_players = 0
	if StructureContains structure = ($<GlobalName>) set_all_players
		set_all_players = 1
	endif
	set_band = 0
	if StructureContains structure = ($<GlobalName>) Band
		set_band = 1
	endif
	<level_array> = ($<GlobalName>.<levelchecksum>)
	<level_index> = 0
	GetArraySize <level_array>
	begin
	<attrib_name> = (<level_array> [<level_index>].Name)
	<attrib_value> = (<level_array> [<level_index>].value)
	getplayerinfo <this_player> <attrib_name>
	<scoring_attrib> = {}
	AddParam structure_name = scoring_attrib Name = <attrib_name> value = ((<...>.<attrib_name>) + <attrib_value>)
	if (<set_all_players> = 1)
		getnumplayersingame \{local}
		if (<num_players> > 0)
			getfirstplayer \{local}
			begin
			if (<Type> = career)
				setplayerinfo <Player> score_attribute_level = <level>
			endif
			setplayerinfo <Player> <scoring_attrib>
			getnextplayer Player = <Player> local
			repeat <num_players>
		endif
	else
		setplayerinfo <this_player> <scoring_attrib>
	endif
	if (<set_band> = 1)
		getplayerinfo <this_player> Band
		setbandinfo <Band> <scoring_attrib>
	endif
	if (<attrib_name> = miss_note_bonus_allowed)
		getplayerinfo <this_player> Band
		getbandinfo <Band> <attrib_name>
		<scoring_attrib> = {}
		AddParam structure_name = scoring_attrib Name = <attrib_name> value = ((<...>.<attrib_name>) + <attrib_value>)
		setbandinfo <Band> <scoring_attrib>
	endif
	<level_index> = (<level_index> + 1)
	repeat <array_Size>
	if StructureContains structure = ($<GlobalName>) <bandlevelchecksum>
		getplayerinfo <this_player> Band
		this_band = <Band>
		<level_array> = ($<GlobalName>.<bandlevelchecksum>)
		<level_index> = 0
		GetArraySize <level_array>
		begin
		<attrib_name> = (<level_array> [<level_index>].Name)
		<attrib_value> = (<level_array> [<level_index>].value)
		getbandinfo <this_player> <attrib_name>
		<scoring_attrib> = {}
		AddParam structure_name = scoring_attrib Name = <attrib_name> value = ((<...>.<attrib_name>) + <attrib_value>)
		setbandinfo <this_band> <scoring_attrib>
		<level_index> = (<level_index> + 1)
		repeat <array_Size>
	endif
endscript

script print_player_scoring_info \{Player = !i1768515945}
	getplayerinfo <Player> score_attribute_level
	getplayerinfo <Player> gem_score
	getplayerinfo <Player> gem_hopo_score
	getplayerinfo <Player> gem_chord_score
	getplayerinfo <Player> gem_chord_hopo_score
	getplayerinfo <Player> gem_tap_score
	getplayerinfo <Player> sustain_beat_score
	getplayerinfo <Player> multiplier_speed
	getplayerinfo <Player> min_multiplier
	getplayerinfo <Player> star_power_multiplier
	getplayerinfo <Player> star_power_gain_multiplier
	getplayerinfo <Player> star_power_per_note_streak
	getplayerinfo <Player> crowd_meter_start_bonus
	getplayerinfo <Player> miss_note_bonus_allowed
	getplayerinfo <Player> miss_note_bonus_ms
	getplayerinfo <Player> current_resurrection_lives
	getplayerinfo <Player> multiplier_1
	getplayerinfo <Player> multiplier_2
	getplayerinfo <Player> multiplier_3
	getplayerinfo <Player> multiplier_4
	getplayerinfo <Player> multiplier_5
	getplayerinfo <Player> multiplier_6
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
	GetArraySize <debug_globals>
	<num_debugs> = <array_Size>
	gamemode_gettype
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		getplayerinfo <Player> Band
		set_scoring_attributes_to_band Band = <Band>
		begin
		set_scoring_attributes_to_player Player = <Player>
		getnextplayer Player = <Player> local
		repeat <num_players>
	endif
	if (<num_players> > 0)
		if (<Type> = career)
			Player = ($g_net_leader_player_num)
			if console_is_net_career_client
				band_leader_savegame = -1
			else
				if (<Player> < 1)
					getfirstplayer \{local}
				endif
				getplayerinfo <Player> controller
				getsavegamefromcontroller controller = <controller>
				band_leader_savegame = <savegame>
			endif
			getfirstplayer \{local}
			<using_debug> = 0
			<idx> = 0
			begin
			formatText checksumName = sa_global (<debug_globals> [<idx>]) d = <Player>
			if ($<sa_global> > 0)
				add_scoring_attributes_to_player Player = <Player> level = ($<sa_global>) GlobalName = (<debug_names> [<idx>])
				<using_debug> = 1
			endif
			<idx> = (<idx> + 1)
			repeat <num_debugs>
			if (<using_debug> = 0)
				<add_all_powers> = 0
				if quest_progression_is_chapter_finale
					setplayerinfo <Player> score_attribute_level = 2
					if quest_progression_check_for_demigod_playing
						<add_all_powers> = 1
					else
						add_character_scoring_attributes_to_player Player = <Player> character_id = ($rockerband_gh_rocker_demigod.power_rocker)
						add_character_scoring_attributes_to_player Player = <Player> character_id = ($rockerband_gh_rocker_demigod.power_male1)
						add_character_scoring_attributes_to_player Player = <Player> character_id = ($rockerband_gh_rocker_demigod.power_male2)
						add_character_scoring_attributes_to_player Player = <Player> character_id = ($rockerband_gh_rocker_demigod.power_female1)
					endif
				elseif quest_progression_is_chapter_rush
					setplayerinfo <Player> score_attribute_level = 2
					add_character_scoring_attributes_to_player Player = <Player> character_id = ($rockerband_tier2complete.power_rocker)
					add_character_scoring_attributes_to_player Player = <Player> character_id = ($rockerband_tier2complete.power_male1)
					add_character_scoring_attributes_to_player Player = <Player> character_id = ($rockerband_tier2complete.power_male2)
					add_character_scoring_attributes_to_player Player = <Player> character_id = ($rockerband_tier2complete.power_female1)
				elseif quest_progression_is_chapter_credits
					<add_all_powers> = 1
				elseif quest_progression_check_domination_unlocked savegame = <band_leader_savegame>
					<add_all_powers> = 1
				else
					current_chapter = ($current_chapter)
					<hero_info_global> = ($<current_chapter>.hero_info)
					power = ($<hero_info_global>.power_global)
					add_character_scoring_attributes_to_player Player = <Player> power_global = <power>
				endif
				if (<add_all_powers> = 1)
					setplayerinfo <Player> score_attribute_level = 2
					add_character_scoring_attributes_to_player Player = <Player> character_id = gh_rocker_austin_tejas
					add_character_scoring_attributes_to_player Player = <Player> character_id = gh_rocker_echo_tesla
					add_character_scoring_attributes_to_player Player = <Player> character_id = gh_rocker_johnny
					add_character_scoring_attributes_to_player Player = <Player> character_id = gh_rocker_axel
					add_character_scoring_attributes_to_player Player = <Player> character_id = gh_rocker_judy
					add_character_scoring_attributes_to_player Player = <Player> character_id = gh_rocker_pandora
					add_character_scoring_attributes_to_player Player = <Player> character_id = gh_rocker_lars
					add_character_scoring_attributes_to_player Player = <Player> character_id = gh_rocker_casey
				endif
			endif
		elseif (<Type> = quickplay)
			if ($autotest_on = 1)
				getfirstplayer \{local}
				autotest_powers = ($g_autotest_career_powers)
				GetArraySize <autotest_powers> param = num_autotest_powers
				if (<num_autotest_powers> > 0)
					<power_index> = 0
					begin
					current_power = (<autotest_powers> [<power_index>])
					if (<current_power>.level != 0)
						add_character_scoring_attributes_to_player Player = <Player> level = (<current_power>.level) character_id = (<current_power>.power)
					endif
					<power_index> = (<power_index> + 1)
					repeat <num_autotest_powers>
				endif
			endif
			if gman_ispowerscoreenabled
				gman_getdata \{goal = quickplay
					Name = powers_enabled}
				getfirstplayer \{local}
				GetArraySize \{powers_enabled}
				if (<array_Size> > 0)
					<cnt> = 0
					begin
					<power_info> = ((<powers_enabled> [<cnt>]).power_info)
					<level_info> = ((<powers_enabled> [<cnt>]).level)
					add_character_scoring_attributes_to_player Player = <Player> power_global = ($<power_info>.power_global) level = <level_info>
					<cnt> = (<cnt> + 1)
					repeat <array_Size>
				endif
			endif
		endif
	endif
endscript

script debug_show_scoring_attributes \{parent = !q1768515945
		Player = !i1768515945}
	if NOT ScreenElementExists id = <parent>
		return
	endif
	getplayerinfo <Player> score_attribute_level
	getplayerinfo <Player> multiplier_speed
	getplayerinfo <Player> min_multiplier
	getplayerinfo <Player> star_power_multiplier
	getplayerinfo <Player> star_power_gain_multiplier
	getplayerinfo <Player> star_power_per_note_streak
	getplayerinfo <Player> crowd_meter_start_bonus
	getplayerinfo <Player> miss_note_bonus_allowed
	getplayerinfo <Player> miss_note_bonus_ms
	getplayerinfo <Player> current_resurrection_lives
	getplayerinfo <Player> multiplier_1
	getplayerinfo <Player> multiplier_2
	getplayerinfo <Player> multiplier_3
	getplayerinfo <Player> multiplier_4
	getplayerinfo <Player> multiplier_5
	getplayerinfo <Player> multiplier_6
	<default_props> = {Type = TextElement parent = <parent> font = fontgrid_title_a1 Scale = 0.2 just = [left top]}
	<Pos> = (-500.0, -100.0)
	<pos_increase> = (0.0, 20.0)
	CreateScreenElement {
		<default_props>
		text = qs(0x168007dc)
		Pos = <Pos>
		rgba = [200 10 10 255]
	}
	<Pos> = (<Pos> + <pos_increase>)
	formatText TextName = text qs(0xca762e35) d = <score_attribute_level>
	CreateScreenElement {
		<default_props>
		text = <text>
		Pos = <Pos>
	}
	<Pos> = (<Pos> + <pos_increase>)
	formatText TextName = text qs(0x5e066daa) d = <min_multiplier>
	CreateScreenElement {
		<default_props>
		text = <text>
		Pos = <Pos>
	}
	<Pos> = (<Pos> + <pos_increase>)
	formatText TextName = text qs(0x71e0604a) d = <star_power_multiplier>
	CreateScreenElement {
		<default_props>
		text = <text>
		Pos = <Pos>
	}
	<Pos> = (<Pos> + <pos_increase>)
	formatText TextName = text qs(0x57a9f1f4) d = <star_power_gain_multiplier>
	CreateScreenElement {
		<default_props>
		text = <text>
		Pos = <Pos>
	}
	<Pos> = (<Pos> + <pos_increase>)
	formatText TextName = text qs(0xbc96c9a5) d = <star_power_per_note_streak>
	CreateScreenElement {
		<default_props>
		text = <text>
		Pos = <Pos>
	}
	<Pos> = (<Pos> + <pos_increase>)
	formatText TextName = text qs(0x5c37603c) d = <crowd_meter_start_bonus>
	CreateScreenElement {
		<default_props>
		text = <text>
		Pos = <Pos>
	}
	<Pos> = (<Pos> + <pos_increase>)
	formatText TextName = text qs(0x54d7bb79) d = <miss_note_bonus_allowed>
	CreateScreenElement {
		<default_props>
		text = <text>
		Pos = <Pos>
	}
	<Pos> = (<Pos> + <pos_increase>)
	formatText TextName = text qs(0x544b5142) d = <current_resurrection_lives>
	CreateScreenElement {
		<default_props>
		text = <text>
		Pos = <Pos>
	}
	<Pos> = (<Pos> + <pos_increase>)
	formatText TextName = text qs(0x524fbe77) d = <multiplier_1>
	CreateScreenElement {
		<default_props>
		text = <text>
		Pos = <Pos>
	}
	<Pos> = (<Pos> + <pos_increase>)
	formatText TextName = text qs(0x25d16c87) d = <multiplier_2>
	CreateScreenElement {
		<default_props>
		text = <text>
		Pos = <Pos>
	}
	<Pos> = (<Pos> + <pos_increase>)
	formatText TextName = text qs(0xbe7420e8) d = <multiplier_3>
	CreateScreenElement {
		<default_props>
		text = <text>
		Pos = <Pos>
	}
	<Pos> = (<Pos> + <pos_increase>)
	formatText TextName = text qs(0xcaecc967) d = <multiplier_4>
	CreateScreenElement {
		<default_props>
		text = <text>
		Pos = <Pos>
	}
	<Pos> = (<Pos> + <pos_increase>)
	formatText TextName = text qs(0x51498508) d = <multiplier_5>
	CreateScreenElement {
		<default_props>
		text = <text>
		Pos = <Pos>
	}
	<Pos> = (<Pos> + <pos_increase>)
	formatText TextName = text qs(0x26d757f8) d = <multiplier_6>
	CreateScreenElement {
		<default_props>
		text = <text>
		Pos = <Pos>
	}
	<Pos> = (<Pos> + <pos_increase>)
endscript
