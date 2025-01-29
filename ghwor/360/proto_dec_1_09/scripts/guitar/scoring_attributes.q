0xa3159be3 = 1.3339999
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
	0x03e6e6e2 = 0
}
g_scoring_max_multiplier = {
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
	level1 = [
		{
			Name = star_power_per_note_streak
			value = 6.0
		}
	]
	level2 = [
		{
			Name = star_power_per_note_streak
			value = 12.0
		}
	]
}
g_scoring_crowd_meter_start_bonus = {
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
	level1 = [
		{
			Name = 0x03e6e6e2
			value = 1
		}
	]
	level2 = [
		{
			Name = 0x03e6e6e2
			value = 2
		}
	]
}
g_scoring_min_multiplier = {
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
	level1 = [
		{
			Name = star_power_multiplier
			value = 1
		}
	]
	level2 = [
		{
			Name = star_power_multiplier
			value = 3
		}
	]
}
g_scoring_demigod = {
}

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
	setplayerinfo <Player> 0x03e6e6e2 = ($<GlobalName>.0x03e6e6e2)
	setplayerinfo <Player> multiplier_1 = ($<GlobalName>.multiplier_1)
	setplayerinfo <Player> multiplier_2 = ($<GlobalName>.multiplier_2)
	setplayerinfo <Player> multiplier_3 = ($<GlobalName>.multiplier_3)
	setplayerinfo <Player> multiplier_4 = ($<GlobalName>.multiplier_4)
	setplayerinfo <Player> multiplier_5 = ($<GlobalName>.multiplier_5)
	setplayerinfo <Player> multiplier_6 = ($<GlobalName>.multiplier_6)
endscript

script add_character_scoring_attributes_to_player \{Player = !i1768515945}
	getplayerinfo <Player> score_attribute_level
	getplayerinfo <Player> character_id
	switch (<character_id>)
		case gh_rocker_newmale
		<global_struct> = ($newmale_hero_info.power_global)
		case gh_rocker_2009
		<global_struct> = ($newfemale_hero_info.power_global)
		case gh_rocker_johnny
		<global_struct> = ($johnny_hero_info.power_global)
		case gh_rocker_axel
		<global_struct> = ($axel_hero_info.power_global)
		case gh_rocker_judy
		<global_struct> = ($judy_hero_info.power_global)
		case gh_rocker_pandora
		<global_struct> = ($pandora_hero_info.power_global)
		case gh_rocker_lars
		<global_struct> = ($lars_hero_info.power_global)
		case gh_rocker_casey
		<global_struct> = ($casey_hero_info.power_global)
		default
		return
	endswitch
	add_scoring_attributes_to_player Player = <Player> GlobalName = <global_struct> level = <score_attribute_level>
endscript

script add_scoring_attributes_to_player \{Player = !i1768515945
		GlobalName = !q1768515945
		level = 1}
	formatText checksumName = levelchecksum 'level%d' d = <level>
	<level_array> = ($<GlobalName>.<levelchecksum>)
	<level_index> = 0
	GetArraySize <level_array>
	begin
	<attrib_name> = (<level_array> [<level_index>].Name)
	<attrib_value> = (<level_array> [<level_index>].value)
	getplayerinfo <Player> <attrib_name>
	<scoring_attrib> = {}
	AddParam structure_name = scoring_attrib Name = <attrib_name> value = ((<...>.<attrib_name>) + <attrib_value>)
	setplayerinfo <Player> <scoring_attrib>
	if (<attrib_name> = miss_note_bonus_allowed)
		getplayerinfo <Player> Band
		getbandinfo <Band> <attrib_name>
		<scoring_attrib> = {}
		AddParam structure_name = scoring_attrib Name = <attrib_name> value = ((<...>.<attrib_name>) + <attrib_value>)
		setbandinfo <Band> <scoring_attrib>
	endif
	<level_index> = (<level_index> + 1)
	repeat <array_Size>
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
	getplayerinfo <Player> 0x03e6e6e2
	getplayerinfo <Player> multiplier_1
	getplayerinfo <Player> multiplier_2
	getplayerinfo <Player> multiplier_3
	getplayerinfo <Player> multiplier_4
	getplayerinfo <Player> multiplier_5
	getplayerinfo <Player> multiplier_6
	printstruct <...>
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
		begin
		set_scoring_attributes_to_player Player = <Player>
		if (<Type> = career)
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
				add_character_scoring_attributes_to_player Player = <Player>
			endif
		endif
		getnextplayer Player = <Player> local
		repeat <num_players>
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
	getplayerinfo <Player> 0x03e6e6e2
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
	formatText TextName = text qs(0x544b5142) d = <0x03e6e6e2>
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
