whammywibble0 = [
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
]
whammywibble1 = [
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
	1.0
]

script star_power_reset 
	change structurename = <player_status> star_power_amount = 0.0
	change structurename = <player_status> star_power_sequence = 0
	change structurename = <player_status> star_power_note_count = 0
	change structurename = <player_status> star_power_used = 0
	change structurename = <player_status> current_star_array_entry = 0
endscript

script increase_star_power \{amount = 10.0
		player_status = player1_status}
	if ($game_mode = p2_career || $game_mode = p2_coop)
		printf \{"giving star power to both players"}
		increase_star_power_guts amount = <amount> player_status = player1_status
		increase_star_power_guts amount = <amount> player_status = player2_status
	else
		increase_star_power_guts amount = <amount> player_status = <player_status>
	endif
endscript

script increase_star_power_guts 
	if ($game_mode = p2_battle ||
			$boss_battle = 1)
		return
	endif
	if ($<player_status>.star_power_used = 1)
		return
	endif
	old_amount = ($<player_status>.star_power_amount)
	change structurename = <player_status> star_power_amount = ($<player_status>.star_power_amount + <amount>)
	if ($<player_status>.star_power_amount > 100)
		change structurename = <player_status> star_power_amount = 100
	endif
	if (<old_amount> < 50.0)
		if ($<player_status>.star_power_amount >= 50.0)
			spawnscriptnow show_star_power_ready params = {player_status = <player_status>}
		endif
	endif
endscript

script show_star_power_ready 
	if ($<player_status>.star_power_used = 1 ||
			$is_attract_mode = 1)
		return
	endif
	soundevent event = star_power_ready_sfx
	spawnscriptnow rock_meter_star_power_on params = {player_status = <player_status>}
	extendcrc star_power_ready_text ($<player_status>.text) out = id
	if (($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff) || ($game_mode = p2_coop) || ($game_mode = p2_career))
		if ($<player_status>.player = 1)
			original_pos = (($hud_screen_elements [0].pos) - (225.0, -70.0))
		else
			original_pos = (($hud_screen_elements [0].pos) + (225.0, 70.0))
		endif
		base_scale = 0.8
	else
		original_pos = ($hud_screen_elements [0].pos)
		base_scale = 1.0
	endif
	doscreenelementmorph {
		id = <id>
		pos = <original_pos>
		scale = 0
		alpha = 1
	}
	doscreenelementmorph id = <id> scale = <base_scale> time = 0.2
	wait 0.2 seconds
	rotation = 4
	begin
	<rotation> = (<rotation> * -1)
	doscreenelementmorph {
		id = <id>
		rot_angle = <rotation>
		time = 0.1
	}
	wait 0.13 seconds
	repeat 8
	doscreenelementmorph id = <id> rot_angle = 0
	doscreenelementmorph {
		id = <id>
		pos = (<original_pos> - (0.0, 400.0))
		scale = (<base_scale> * 0.5)
		time = 0.35000002
	}
endscript
showing_raise_axe = 0

script show_coop_raise_axe_for_starpower 
	if ($<player_status>.star_power_used = 1 ||
			$is_attract_mode = 1 || $showing_raise_axe = 1)
		return
	endif
	change showing_raise_axe = 1
	extendcrc coop_raise_axe ($<player_status>.text) out = id
	if ($<player_status>.player = 1)
		original_pos = (($hud_screen_elements [10].pos) - (225.0, 70.0))
	else
		original_pos = (($hud_screen_elements [10].pos) + (225.0, -70.0))
	endif
	base_scale = 0.8
	doscreenelementmorph {
		id = <id>
		pos = <original_pos>
		scale = 0
		alpha = 1
	}
	doscreenelementmorph id = <id> scale = <base_scale> time = 0.2
	wait 0.2 seconds
	if NOT screenelementexists id = <id>
		change showing_raise_axe = 0
		return
	endif
	rotation = 4
	begin
	<rotation> = (<rotation> * -1)
	doscreenelementmorph {
		id = <id>
		rot_angle = <rotation>
		time = 0.1
	}
	wait 0.13 seconds
	if NOT screenelementexists id = <id>
		change showing_raise_axe = 0
		return
	endif
	repeat 8
	doscreenelementmorph id = <id> rot_angle = 0
	doscreenelementmorph {
		id = <id>
		pos = (<original_pos> - (0.0, 400.0))
		scale = (<base_scale> * 0.5)
		time = 0.35000002
	}
	change showing_raise_axe = 0
endscript

script star_power_hit_note 
	increase_star_power amount = $star_power_hit_note_score player_status = <player_status>
	change structurename = <player_status> star_power_note_count = ($<player_status>.star_power_note_count + 1)
	change structurename = <player_status> star_power_sequence = ($<player_status>.star_power_sequence + 1)
	broadcastevent type = star_hit_note data = {song = <song> array_entry = <array_entry> player_status = <player_status>}
	printf "star note hit: %s required %r" s = ($<player_status>.star_power_sequence) r = <sequence_count>
	if (<sequence_count> = $<player_status>.star_power_sequence)
		if ($<player_status>.star_power_sequence > $star_power_sequence_min)
			if ($<player_status>.star_power_used = 0)
				printf channel = training "broadcasting star power bonus!!!!!!!!!!!"
				broadcastevent type = star_sequence_bonus data = {song = <song> array_entry = <array_entry>}
				increase_star_power amount = $star_power_sequence_bonus player_status = <player_status>
			endif
		endif
	endif
endscript

script reset_star_sequence 
	change structurename = <player_status> star_power_sequence = 0
	change structurename = <player_status> star_power_note_count = 0
endscript

script star_power_miss_note 
	change structurename = <player_status> star_power_sequence = 0
	launchgemevent event = star_miss_note player = <player>
	extendcrc star_miss_note <player_text> out = id
	broadcastevent type = <id> data = {song = <song> array_entry = <array_entry>}
endscript

script star_power_whammy 
	if ($<player_status>.star_power_used = 1)
		return
	endif
	last_x = 0
	last_y = 0
	dir_x = 1
	dir_y = 1
	first = 1
	whammy_on = 0
	whammy_star_on = 0
	whammy_star_off = 0
	extendcrc star_whammy_on <player_text> out = id
	broadcastevent type = <id> data = {pattern = <pattern> time = <time> guitar_stream = <guitar_stream> song = <song> array_entry = <array_entry> player = <player> player_status = <player_status> player_text = <player_text>}
	begin
	if (($<player_status>.whammy_on) = 0)
		extendcrc star_whammy_off <player_text> out = id
		broadcastevent type = <id> data = {pattern = <pattern> time = <time> guitar_stream = <guitar_stream> song = <song> array_entry = <array_entry> player = <player> player_status = <player_status> player_text = <player_text> finished = 0}
		break
	endif
	guitargetanalogueinfo controller = ($<player_status>.controller)
	<px> = 0
	<py> = 0
	if (<leftlength> > 0)
		<px> = <leftx>
		<py> = <lefty>
	else
		if (<rightlength> > 0)
			<px> = <rightx>
			<py> = <righty>
		endif
	endif
	if (<first> = 1)
		<last_x> = <px>
		<last_y> = <py>
		<first> = 0
	endif
	<xdiff> = (<px> - <last_x>)
	if (<xdiff> < 0)
		<xdiff> = (0.0 - <xdiff>)
	endif
	<ydiff> = (<py> - <last_y>)
	if (<ydiff> < 0)
		<ydiff> = (0.0 - <ydiff>)
	endif
	if (<xdiff> > 0.03)
		<whammy_on> = 5
	endif
	if (<ydiff> > 0.03)
		<whammy_on> = 5
	endif
	if (<whammy_on> > 0)
		<whammy_star_off> = 0
		<whammy_star_on> = (<whammy_star_on> + 1)
		beat_time = ($<player_status>.playline_song_beat_time / 1000.0)
		beat_ratio = ($current_deltatime / <beat_time>)
		if ($game_mode = p2_career || $game_mode = p2_coop)
			increase_star_power amount = ($star_power_whammy_add_coop * <beat_ratio>) player_status = <player_status>
		else
			increase_star_power amount = ($star_power_whammy_add * <beat_ratio>) player_status = <player_status>
		endif
		whammy_on = (<whammy_on> - 1)
		if (<last> = 1)
			if (<whammy_star_on> = 5)
				getarraysize $gem_colors
				gem_count = 0
				begin
				if ((<pattern> && $button_values [<gem_count>]) = $button_values [<gem_count>])
					formattext checksumname = whammy_id '%c_%i_whammybar_p%p' c = ($gem_colors_text [<gem_count>]) i = <array_entry> p = ($<player_status>.player) addtostringlookup = true
					if screenelementexists id = <whammy_id>
						bar_name = (<whammy_id> + 1)
						makestarwhammy name = <bar_name> player = ($<player_status>.player)
					endif
				endif
				gem_count = (<gem_count> + 1)
				repeat <array_size>
			endif
		endif
	else
		<whammy_star_on> = 0
		<whammy_star_off> = (<whammy_star_off> + 1)
		if (<last> = 1)
			if (<whammy_star_off> = 5)
				getarraysize $gem_colors
				gem_count = 0
				begin
				if ((<pattern> && $button_values [<gem_count>]) = $button_values [<gem_count>])
					formattext checksumname = whammy_id '%c_%i_whammybar_p%p' c = ($gem_colors_text [<gem_count>]) i = <array_entry> p = ($<player_status>.player) addtostringlookup = true
					if screenelementexists id = <whammy_id>
						bar_name = (<whammy_id> + 1)
						makenormalwhammy name = <bar_name> player = ($<player_status>.player)
					endif
				endif
				gem_count = (<gem_count> + 1)
				repeat <array_size>
			endif
		endif
	endif
	<last_x> = <px>
	<last_y> = <py>
	<time> = (<time> - ($current_deltatime * 1000))
	if (<time> <= 0)
		extendcrc star_whammy_off <player_text> out = id
		broadcastevent type = <id> data = {pattern = <pattern> time = <time> guitar_stream = <guitar_stream> song = <song> array_entry = <array_entry> player = <player> player_status = <player_status> player_text = <player_text> finished = 1}
		break
	endif
	wait 1 gameframe
	repeat
endscript

script reset_star_array 
	get_song_struct song = <song_name>
	if (($<player_status>.part) = rhythm)
		<part> = 'rhythm_'
	else
		<part> = ''
	endif
	if ($game_mode = p2_career || $game_mode = p2_coop)
		if structurecontains structurename = <song_struct> use_coop_notetracks
			if (($<player_status>.part) = rhythm)
				<part> = 'rhythmcoop_'
			else
				<part> = 'guitarcoop_'
			endif
		endif
	endif
	get_song_prefix song = <song_name>
	get_difficulty_text_nl difficulty = <difficulty>
	if ($game_mode = p2_battle ||
			$boss_battle = 1)
		formattext checksumname = song '%s_%p%d_starbattlemode' s = <song_prefix> p = <part> d = <difficulty_text_nl> addtostringlookup
		change structurename = <player_status> sp_phrases_total = 0
	else
		formattext checksumname = song '%s_%p%d_star' s = <song_prefix> p = <part> d = <difficulty_text_nl> addtostringlookup
	endif
	change structurename = <player_status> current_song_star_array = <song>
	change structurename = <player_status> current_star_array_entry = 0
endscript

script is_star_note time = 0
	star_array = ($<player_status>.current_song_star_array)
	getarraysize $<star_array>
	if (<array_size> = 0)
		return false star_count = 0
	endif
	star_start = ($<star_array> [($<player_status>.current_star_array_entry)] [0])
	star_end = (($<star_array> [($<player_status>.current_star_array_entry)] [1]) + <star_start>)
	star_count = ($<star_array> [($<player_status>.current_star_array_entry)] [2])
	if (<time> >= <star_start>)
		if (<time> <= <star_end>)
			return true star_count = <star_count>
		endif
	endif
	if (<time> > <star_end>)
		if ($<player_status>.current_star_array_entry < (<array_size> - 1))
			change structurename = <player_status> current_star_array_entry = ($<player_status>.current_star_array_entry + 1)
		endif
	endif
	return false star_count = <star_count>
endscript

script do_starpower_stagefx 
	switch (<player_status>.character_id)
		case johnny
		spawnscriptlater do_starpower_flamethrowerfx id = <scriptid> params = {<...>}
		case judy
		spawnscriptlater do_starpower_heartsfx id = <scriptid> params = {<...>}
		case lars
		spawnscriptlater do_starpower_batfx id = <scriptid> params = {<...>}
		case midori
		spawnscriptlater do_starpower_butterfliesfx id = <scriptid> params = {<...>}
		case xavier
		spawnscriptlater do_starpower_peacefx id = <scriptid> params = {<...>}
		default
		spawnscriptlater do_starpower_teslafx id = <scriptid> params = {<...>}
	endswitch
endscript

script do_starpower_shotgunfx 
	begin
	formattext checksumname = shotgunid '%p_StarPower_ShotgunFXShotgunID' p = <player_text>
	safegetuniquecompositeobjectid objid = (<player_status>.band_member) preferredid = <shotgunid>
	createparticlesystem name = <uniqueid> objid = (<player_status>.band_member) bone = bone_guitar_neck params_script = $gp_starpower_shotgun01
	formattext checksumname = smokeid '%p_StarPower_ShotgunFXSmokeID' p = <player_text>
	safegetuniquecompositeobjectid objid = (<player_status>.band_member) preferredid = <smokeid>
	createparticlesystem name = <uniqueid> objid = (<player_status>.band_member) bone = bone_guitar_neck params_script = $gp_starpower_shotgunsmoke01
	wait RandomRange (1.0, 2.0) seconds
	repeat
endscript

script do_starpower_flamethrowerfx 
	(<player_status>.band_member) :obj_getboneposition bone = bone_pelvis
	bonepos = (<x> * (1.0, 0.0, 0.0) + <y> * (0.0, 1.0, 0.0) + <z> * (0.0, 0.0, 1.0))
	formattext checksumname = anarchy01id '%p_StarPower_FlameThrowerFXAnarchy01ID' p = <player_text>
	createparticlesystem name = <anarchy01id> objid = (<player_status>.band_member) bone = bone_pelvis params_script = $gp_starpower_flamethroweranarchy01
endscript

script do_starpower_heartsfx 
	(<player_status>.band_member) :obj_getboneposition bone = bone_pelvis
	bonepos = (<x> * (1.0, 0.0, 0.0) + <y> * (0.0, 1.0, 0.0) + <z> * (0.0, 0.0, 1.0))
	getuniquecompositeobjectid preferredid = heartspoofid01
	createparticlesystem name = <uniqueid> pos = <bonepos> params_script = $gp_starpower_heartspoof01
	formattext checksumname = heartsid '%p_StarPower_HeartsFXHeartsID' p = <player_text>
	createparticlesystem name = <heartsid> objid = (<player_status>.band_member) bone = bone_pelvis params_script = $gp_starpower_hearts01
	formattext checksumname = swirlid '%p_StarPower_HeartsFXSwirlID' p = <player_text>
	createparticlesystem name = <swirlid> objid = (<player_status>.band_member) bone = bone_pelvis params_script = $gp_starpower_heartsswirl01
	formattext checksumname = windid '%p_StarPower_HeartsFXWindID' p = <player_text>
	enginewind create = {
		name = <windid>
		type = twist
		pos = <bonepos>
		velocity = (0.0, 0.2, 0.0)
		speed = 8
		tangentweight = 0.4
		range = 7
		attenuation = inv_distance
		time = 0
	}
	begin
	(<player_status>.band_member) :obj_getboneposition bone = bone_pelvis
	bonepos = (<x> * (1.0, 0.0, 0.0) + <y> * (0.0, 1.0, 0.0) + <z> * (0.0, 0.0, 1.0))
	enginewind modify = {
		name = <windid>
		pos = <bonepos>
	}
	wait 0.05 seconds
	repeat
endscript

script do_starpower_batfx 
	(<player_status>.band_member) :obj_getboneposition bone = bone_pelvis
	bonepos = (<x> * (1.0, 0.0, 0.0) + <y> * (0.0, 1.0, 0.0) + <z> * (0.0, 0.0, 1.0))
	getuniquecompositeobjectid preferredid = batpoofid01
	createparticlesystem name = <uniqueid> pos = <bonepos> params_script = $gp_starpower_batspoof01
	formattext checksumname = batid '%p_StarPower_BatFXBatID' p = <player_text>
	createparticlesystem name = <batid> objid = (<player_status>.band_member) bone = bone_pelvis params_script = $gp_starpower_bats01
	formattext checksumname = swirlid '%p_StarPower_BatFXSwirlID' p = <player_text>
	createparticlesystem name = <swirlid> objid = (<player_status>.band_member) bone = bone_pelvis params_script = $gp_starpower_batsswirl01
	formattext checksumname = windid '%p_StarPower_BatFXWindID' p = <player_text>
	enginewind create = {
		name = <windid>
		type = twist
		pos = <bonepos>
		velocity = (0.0, 0.2, 0.0)
		speed = 8
		tangentweight = 0.4
		range = 7
		attenuation = inv_distance
		time = 0
	}
	begin
	(<player_status>.band_member) :obj_getboneposition bone = bone_pelvis
	bonepos = (<x> * (1.0, 0.0, 0.0) + <y> * (0.0, 1.0, 0.0) + <z> * (0.0, 0.0, 1.0))
	enginewind modify = {
		name = <windid>
		pos = <bonepos>
	}
	wait 0.05 seconds
	repeat
endscript

script do_starpower_butterfliesfx 
	(<player_status>.band_member) :obj_getboneposition bone = bone_pelvis
	bonepos = (<x> * (1.0, 0.0, 0.0) + <y> * (0.0, 1.0, 0.0) + <z> * (0.0, 0.0, 1.0))
	getuniquecompositeobjectid preferredid = butterfliespoofid01
	createparticlesystem name = <uniqueid> pos = <bonepos> params_script = $gp_starpower_butterfliespoof01
	formattext checksumname = butterfliesid '%p_StarPower_ButterfliesFXButterfliesID01' p = <player_text>
	createparticlesystem name = <butterfliesid> objid = (<player_status>.band_member) bone = bone_pelvis params_script = $gp_starpower_butterflies01
	formattext checksumname = butterfliesid '%p_StarPower_ButterfliesFXButterfliesID02' p = <player_text>
	createparticlesystem name = <butterfliesid> objid = (<player_status>.band_member) bone = bone_pelvis params_script = $gp_starpower_butterflies01
	formattext checksumname = swirlid '%p_StarPower_ButterfliesFXSwirlID' p = <player_text>
	createparticlesystem name = <swirlid> objid = (<player_status>.band_member) bone = bone_pelvis params_script = $gp_starpower_butterfliesswirl01
	formattext checksumname = windid '%p_StarPower_ButterfliesFXWindID' p = <player_text>
	enginewind create = {
		name = <windid>
		type = twist
		pos = <bonepos>
		velocity = (0.0, 0.1, 0.0)
		speed = 6
		tangentweight = 0.4
		range = 7
		attenuation = inv_distance
		time = 0
	}
	begin
	(<player_status>.band_member) :obj_getboneposition bone = bone_pelvis
	bonepos = (<x> * (1.0, 0.0, 0.0) + <y> * (0.0, 1.0, 0.0) + <z> * (0.0, 0.0, 1.0))
	enginewind modify = {
		name = <windid>
		pos = <bonepos>
	}
	wait 0.05 seconds
	repeat
endscript

script do_starpower_peacefx 
	(<player_status>.band_member) :obj_getboneposition bone = bone_pelvis
	bonepos = (<x> * (1.0, 0.0, 0.0) + <y> * (0.0, 1.0, 0.0) + <z> * (0.0, 0.0, 1.0))
	getuniquecompositeobjectid preferredid = peacepoofid01
	createparticlesystem name = <uniqueid> pos = <bonepos> params_script = $gp_starpower_peacepoof01
	formattext checksumname = peaceid '%p_StarPower_PeaceFXPeaceID' p = <player_text>
	createparticlesystem name = <peaceid> objid = (<player_status>.band_member) bone = bone_pelvis params_script = $gp_starpower_peace01
	formattext checksumname = swirlid '%p_StarPower_PeaceFXSwirlID' p = <player_text>
	createparticlesystem name = <swirlid> objid = (<player_status>.band_member) bone = bone_pelvis params_script = $gp_starpower_peaceswirl01
	formattext checksumname = windid '%p_StarPower_PeaceFXWindID' p = <player_text>
	enginewind create = {
		name = <windid>
		type = twist
		pos = <bonepos>
		velocity = (0.0, 0.1, 0.0)
		speed = 4
		tangentweight = 0.4
		range = 7
		attenuation = inv_distance
		time = 0
	}
	begin
	(<player_status>.band_member) :obj_getboneposition bone = bone_pelvis
	bonepos = (<x> * (1.0, 0.0, 0.0) + <y> * (0.0, 1.0, 0.0) + <z> * (0.0, 0.0, 1.0))
	enginewind modify = {
		name = <windid>
		pos = <bonepos>
	}
	wait 0.05 seconds
	repeat
endscript

script do_starpower_teslafx 
	getpakmancurrent map = zones
	switch <pak>
		case z_artdeco
		zoneprefix = 'Z_ArtDeco_GFX_TRG_TeslaNode_'
		case z_budokan
		zoneprefix = 'Z_Budokan_GFX_TRG_TeslaNode_'
		case z_dive
		zoneprefix = 'Z_Dive_GFX_TRG_TeslaNode_'
		case z_hell
		zoneprefix = 'Z_Hell_GFX_TRG_TeslaNode_'
		case z_party
		zoneprefix = 'Z_Party_GFX_TRG_TeslaNode_'
		case z_prison
		zoneprefix = 'Z_Prison_GFX_TRG_TeslaNode_'
		case z_video
		zoneprefix = 'Z_Video_GFX_TRG_TeslaNode_'
		case z_wikker
		zoneprefix = 'Z_Wikker_GFX_TRG_TeslaNode_'
		default
		return
	endswitch
	i = 1
	begin
	if (RandomRange (0.0, 1.0) = 0)
		bone = bone_guitar_fret_pos
	else
		bone = bone_guitar_strum_pos
	endif
	formattext checksumname = scriptid '%p_StarPower_TeslaFX%i' p = <player_text> i = <i>
	formattext checksumname = teslafxid '%p_StarPower_TeslaFXID%i' p = <player_text> i = <i>
	spawnscriptlater create_starpower_teslafx id = <scriptid> params = {
		<...>
		zoneprefix = <zoneprefix>
		teslafxid = <teslafxid>
		bone = <bone>
		nodenum = RandomRange (1.0, 10.0)
	}
	i = (<i> + 1)
	repeat RandomRange (2.0, 4.0)
	begin
	wait RandomRange (0.1, 1.0) seconds
	i = RandomRange (1.0, 4.0)
	formattext checksumname = scriptid '%p_StarPower_TeslaFX%i' p = <player_text> i = <i>
	formattext checksumname = teslafxid '%p_StarPower_TeslaFXID%i' p = <player_text> i = <i>
	killspawnedscript id = <scriptid>
	deleteteslaeffectobject name = <teslafxid>
	if (<i> = 1 || <i> = 2 || RandomRange (0.0, 1.0) = 1)
		if (RandomRange (0.0, 1.0) = 0)
			bone = bone_guitar_fret_pos
		else
			bone = bone_guitar_strum_pos
		endif
		spawnscriptlater create_starpower_teslafx id = <scriptid> params = {
			<...>
			zoneprefix = <zoneprefix>
			teslafxid = <teslafxid>
			bone = <bone>
			nodenum = RandomRange (1.0, 10.0)
		}
	endif
	repeat
endscript

script create_starpower_teslafx 
	(<player_status>.band_member) :obj_getboneposition bone = <bone>
	bonepos = (<x> * (1.0, 0.0, 0.0) + <y> * (0.0, 1.0, 0.0) + <z> * (0.0, 0.0, 1.0))
	formattext checksumname = teslanodeid '%z%n' z = <zoneprefix> n = <nodenum>
	getnode <teslanodeid>
	getdistance posa = <bonepos> posb = (<node>.pos)
	createteslaeffectobject name = <teslafxid> start = <bonepos> end = (<node>.pos) width = (0.15 * <dist_atob>) lightwidth = (0.4 / <dist_atob>) fadeout = 0.8 color = (0.2, 0.3, 1.0)
	getuniquecompositeobjectid preferredid = teslasparksfx01
	createparticlesystem name = <uniqueid> pos = (<node>.pos) params_script = $gp_starpower_teslasparks01
	oldendpos = (<node>.pos)
	begin
	wait 1 frame
	newendpos = (<oldendpos> + RandomRange (-0.1, 0.1) * (1.0, 0.0, 0.0) + RandomRange (-0.1, 0.1) * (0.0, 0.0, 1.0))
	getdistance posa = <bonepos> posb = <newendpos>
	setteslaeffectobject name = <teslafxid> start = <bonepos> end = <newendpos> width = (0.15 * <dist_atob>) lightwidth = (0.4 / <dist_atob>)
	oldendpos = <newendpos>
	repeat
endscript

script kill_starpower_stagefx 
	formattext checksumname = scriptid '%p_StarPower_StageFX' p = <player_text>
	killspawnedscript id = <scriptid>
	switch (<player_status>.character_id)
		case johnny
		formattext checksumname = flamethrowerid '%p_StarPower_FlameThrowerFXFlameThrowerID' p = <player_text>
		manglechecksums a = <flamethrowerid> b = (<player_status>.band_member) p = <player_text>
		if iscreated <mangled_id>
			<mangled_id> :emitrate rate = 0
			<mangled_id> :destroy ifempty = 1
		endif
		formattext checksumname = anarchy01id '%p_StarPower_FlameThrowerFXAnarchy01ID' p = <player_text>
		manglechecksums a = <anarchy01id> b = (<player_status>.band_member)
		if iscreated <mangled_id>
			<mangled_id> :emitrate rate = 0
			<mangled_id> :destroy ifempty = 1
		endif
		case judy
		formattext checksumname = heartsid '%p_StarPower_HeartsFXHeartsID' p = <player_text>
		manglechecksums a = <heartsid> b = (<player_status>.band_member)
		if iscreated <mangled_id>
			<mangled_id> :emitrate rate = 0
			<mangled_id> :destroy ifempty = 1
		endif
		formattext checksumname = swirlid '%p_StarPower_HeartsFXSwirlID' p = <player_text>
		manglechecksums a = <swirlid> b = (<player_status>.band_member)
		if iscreated <mangled_id>
			<mangled_id> :emitrate rate = 0
			<mangled_id> :destroy ifempty = 1
		endif
		formattext checksumname = windid '%p_StarPower_HeartsFXWindID' p = <player_text>
		enginewind remove <windid>
		case lars
		formattext checksumname = batid '%p_StarPower_BatFXBatID' p = <player_text>
		manglechecksums a = <batid> b = (<player_status>.band_member)
		if iscreated <mangled_id>
			<mangled_id> :emitrate rate = 0
			<mangled_id> :destroy ifempty = 1
		endif
		formattext checksumname = swirlid '%p_StarPower_BatFXSwirlID' p = <player_text>
		manglechecksums a = <swirlid> b = (<player_status>.band_member)
		if iscreated <mangled_id>
			<mangled_id> :emitrate rate = 0
			<mangled_id> :destroy ifempty = 1
		endif
		formattext checksumname = windid '%p_StarPower_BatFXWindID' p = <player_text>
		enginewind remove <windid>
		case midori
		formattext checksumname = butterfliesid '%p_StarPower_ButterfliesFXButterfliesID01' p = <player_text>
		manglechecksums a = <butterfliesid> b = (<player_status>.band_member)
		if iscreated <mangled_id>
			<mangled_id> :emitrate rate = 0
			<mangled_id> :destroy ifempty = 1
		endif
		formattext checksumname = butterfliesid '%p_StarPower_ButterfliesFXButterfliesID02' p = <player_text>
		manglechecksums a = <butterfliesid> b = (<player_status>.band_member)
		if iscreated <mangled_id>
			<mangled_id> :emitrate rate = 0
			<mangled_id> :destroy ifempty = 1
		endif
		formattext checksumname = swirlid '%p_StarPower_ButterfliesFXSwirlID' p = <player_text>
		manglechecksums a = <swirlid> b = (<player_status>.band_member)
		if iscreated <mangled_id>
			<mangled_id> :emitrate rate = 0
			<mangled_id> :destroy ifempty = 1
		endif
		formattext checksumname = windid '%p_StarPower_ButterfliesFXWindID' p = <player_text>
		enginewind remove <windid>
		case xavier
		formattext checksumname = peaceid '%p_StarPower_PeaceFXPeaceID' p = <player_text>
		manglechecksums a = <peaceid> b = (<player_status>.band_member)
		if iscreated <mangled_id>
			<mangled_id> :emitrate rate = 0
			<mangled_id> :destroy ifempty = 1
		endif
		formattext checksumname = swirlid '%p_StarPower_PeaceFXSwirlID' p = <player_text>
		manglechecksums a = <swirlid> b = (<player_status>.band_member)
		if iscreated <mangled_id>
			<mangled_id> :emitrate rate = 0
			<mangled_id> :destroy ifempty = 1
		endif
		formattext checksumname = windid '%p_StarPower_PeaceFXWindID' p = <player_text>
		enginewind remove <windid>
		default
		i = 1
		begin
		formattext checksumname = scriptid '%p_StarPower_TeslaFX%i' p = <player_text> i = <i>
		formattext checksumname = teslafxid '%p_StarPower_TeslaFXID%i' p = <player_text> i = <i>
		killspawnedscript id = <scriptid>
		deleteteslaeffectobject name = <teslafxid>
		i = (<i> + 1)
		repeat 4
	endswitch
endscript

script do_starpower_camera 
	printf \{channel = camera
		"creating starpower camera........."}
	change \{cameracuts_allownotescripts = false}
	cameracuts_setarrayprefix \{prefix = 'cameras_starpower'}
	wait \{7
		seconds}
	cameracuts_setarrayprefix \{prefix = 'cameras'}
	change \{cameracuts_allownotescripts = true}
endscript

script kill_starpower_camera \{changecamera = 1}
	printf \{channel = camera
		"killing starpower camera........."}
	killspawnedscript \{name = do_starpower_camera}
	if (<changecamera> = 1)
		cameracuts_setarrayprefix \{prefix = 'cameras'}
	endif
	change \{cameracuts_allownotescripts = true}
endscript
