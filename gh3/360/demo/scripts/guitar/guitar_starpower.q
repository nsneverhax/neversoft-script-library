WhammyWibble0 = [
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
WhammyWibble1 = [
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
	Change structurename = <player_status> star_power_amount = 0.0
	Change structurename = <player_status> star_power_sequence = 0
	Change structurename = <player_status> star_power_note_count = 0
	Change structurename = <player_status> star_power_used = 0
	Change structurename = <player_status> current_star_array_entry = 0
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
	Change structurename = <player_status> star_power_amount = ($<player_status>.star_power_amount + <amount>)
	if ($<player_status>.star_power_amount > 100)
		Change structurename = <player_status> star_power_amount = 100
	endif
	if (<old_amount> < 50.0)
		if ($<player_status>.star_power_amount >= 50.0)
			SpawnScriptNow show_star_power_ready params = {player_status = <player_status>}
		endif
	endif
endscript
star_power_ready_on_p1 = 0
star_power_ready_on_p2 = 0

script show_star_power_ready 
	if ($Cheat_PerformanceMode = 1)
		return
	endif
	formatText checksumName = player_container 'HUD_Note_Streak_Combo%d' d = ($<player_status>.Player)
	begin
	if NOT ScreenElementExists id = <player_container>
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if ($<player_status>.Player = 1)
		Change \{star_power_ready_on_p1 = 1}
	else
		Change \{star_power_ready_on_p2 = 1}
	endif
	if ($<player_status>.star_power_used = 1)
		return
	endif
	SoundEvent \{event = Star_Power_Ready_SFX}
	SpawnScriptNow rock_meter_star_power_on params = {player_status = <player_status>}
	ExtendCrc star_power_ready_text ($<player_status>.text) out = id
	if (($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff))
		if ($<player_status>.Player = 1)
			original_pos = (($hud_screen_elements [0].Pos) - (225.0, 50.0))
		else
			original_pos = (($hud_screen_elements [0].Pos) + (225.0, -50.0))
		endif
		base_scale = 0.8
	else
		if ($game_mode = p2_career || $game_mode = p2_coop)
			original_pos = (($hud_screen_elements [0].Pos) - (0.0, 60.0))
		else
			original_pos = (($hud_screen_elements [0].Pos) - (0.0, 20.0))
		endif
		base_scale = 1.2
	endif
	if ScreenElementExists id = <id>
		<id> :DoMorph Pos = <original_pos> Scale = 4 rgba = [190 225 255 250] alpha = 0 rot_angle = 3
	endif
	ExtendCrc hud_destroygroup_window ($<player_status>.text) out = hud_destroygroup
	SpawnScriptNow hud_lightning_alert params = {Player = ($<player_status>.Player) alert_id = <id> player_container = <hud_destroygroup>}
	if ScreenElementExists id = <id>
		<id> :DoMorph Pos = <original_pos> Scale = <base_scale> alpha = 1 time = 0.3 rot_angle = -3 motion = ease_in
	endif
	if ScreenElementExists id = <id>
		<id> :DoMorph Pos = <original_pos> Scale = (<base_scale> * 1.5) time = 0.3 rot_angle = 4 motion = ease_out
	endif
	if ScreenElementExists id = <id>
		<id> :DoMorph Pos = <original_pos> Scale = <base_scale> time = 0.3 rot_angle = -5 rgba = [145 215 235 250] motion = ease_in
	endif
	rotation = 10
	begin
	<rotation> = (<rotation> * -0.7)
	if ScreenElementExists id = <id>
		<id> :DoMorph Pos = <original_pos> rot_angle = <rotation> alpha = 1 time = 0.08 motion = ease_out
	endif
	repeat 12
	if ScreenElementExists id = <id>
		<id> :DoMorph Pos = <original_pos> rot_angle = 0 motion = ease_out
	endif
	if ScreenElementExists id = <id>
		<id> :DoMorph Pos = (<original_pos> - (0.0, 230.0)) Scale = (<base_scale> * 0.5) alpha = 0 time = 0.3 motion = ease_in
	endif
	if ($<player_status>.Player = 1)
		Change \{star_power_ready_on_p1 = 0}
	else
		Change \{star_power_ready_on_p2 = 0}
	endif
endscript
showing_raise_axe = 0

script show_coop_raise_axe_for_starpower 
	if ($<player_status>.star_power_used = 1 ||
			$is_attract_mode = 1 || $showing_raise_axe = 1 || $Cheat_PerformanceMode = 1)
		return
	endif
	Change \{showing_raise_axe = 1}
	ExtendCrc coop_raise_axe ($<player_status>.text) out = id
	ExtendCrc coop_raise_axe_cont ($<player_status>.text) out = id_cont
	if ($<player_status>.Player = 1)
		original_pos = (($hud_screen_elements [10].Pos) - (225.0, 60.0))
		original_pos_cont = (($hud_screen_elements [10].Pos) - (225.0, 30.0))
	else
		original_pos = (($hud_screen_elements [10].Pos) + (225.0, -60.0))
		original_pos_cont = (($hud_screen_elements [10].Pos) + (225.0, -30.0))
	endif
	base_scale = 0.7
	base_scale_cont = 1
	DoScreenElementMorph {
		id = <id>
		Pos = <original_pos>
		Scale = 0
		alpha = 1
	}
	DoScreenElementMorph {
		id = <id_cont>
		Pos = <original_pos_cont>
		Scale = 0
		alpha = 1
	}
	DoScreenElementMorph id = <id> Scale = <base_scale> time = 0.2
	DoScreenElementMorph id = <id_cont> Scale = <base_scale_cont> time = 0.2
	Wait \{0.2
		Seconds}
	if NOT ScreenElementExists id = <id>
		Change \{showing_raise_axe = 0}
		return
	endif
	rotation = 4
	begin
	<rotation> = (<rotation> * -1)
	DoScreenElementMorph {
		id = <id>
		rot_angle = <rotation>
		time = 0.1
	}
	DoScreenElementMorph {
		id = <id_cont>
		rot_angle = <rotation>
		time = 0.1
	}
	Wait \{0.13
		Seconds}
	if NOT ScreenElementExists id = <id>
		Change \{showing_raise_axe = 0}
		return
	endif
	repeat 8
	DoScreenElementMorph id = <id> rot_angle = 0
	DoScreenElementMorph id = <id_cont> rot_angle = 0
	DoScreenElementMorph {
		id = <id>
		Pos = (<original_pos> - (0.0, 400.0))
		Scale = (<base_scale> * 0.5)
		time = 0.35000002
	}
	DoScreenElementMorph {
		id = <id_cont>
		Pos = (<original_pos_cont> - (0.0, 400.0))
		Scale = (<base_scale_cont> * 0.5)
		time = 0.35000002
	}
	Change \{showing_raise_axe = 0}
endscript

script star_power_hit_note 
	increase_star_power amount = $star_power_hit_note_score player_status = <player_status>
	Change structurename = <player_status> star_power_note_count = ($<player_status>.star_power_note_count + 1)
	Change structurename = <player_status> star_power_sequence = ($<player_status>.star_power_sequence + 1)
	broadcastevent Type = star_hit_note data = {song = <song> array_entry = <array_entry> player_status = <player_status>}
	printf "star note hit: %s required %r" s = ($<player_status>.star_power_sequence) r = <sequence_count>
	if (<sequence_count> = $<player_status>.star_power_sequence)
		if ($<player_status>.star_power_sequence > $star_power_sequence_min)
			if ($<player_status>.star_power_used = 0)
				printf \{channel = training
					"broadcasting star power bonus!!!!!!!!!!!"}
				broadcastevent Type = star_sequence_bonus data = {song = <song> array_entry = <array_entry>}
				increase_star_power amount = $star_power_sequence_bonus player_status = <player_status>
			endif
		endif
	endif
endscript

script reset_star_sequence 
	Change structurename = <player_status> star_power_sequence = 0
	Change structurename = <player_status> star_power_note_count = 0
endscript

script star_power_miss_note 
	Change structurename = <player_status> star_power_sequence = 0
	LaunchGemEvent event = star_miss_note Player = <Player>
	ExtendCrc star_miss_note <player_text> out = id
	broadcastevent Type = <id> data = {song = <song> array_entry = <array_entry>}
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
	ExtendCrc star_whammy_on <player_text> out = id
	broadcastevent Type = <id> data = {pattern = <pattern> time = <time> guitar_stream = <guitar_stream> song = <song> array_entry = <array_entry> Player = <Player> player_status = <player_status> player_text = <player_text>}
	<boss> = 0
	if ($boss_battle = 1)
		if (($<player_status>.Player) = 2)
			<boss> = 1
		endif
	endif
	<do_blue_whammys> = 1
	if ($game_mode = p2_battle || $boss_battle = 1)
		<do_blue_whammys> = 0
	endif
	begin
	if (($<player_status>.whammy_on) = 0)
		ExtendCrc star_whammy_off <player_text> out = id
		broadcastevent Type = <id> data = {pattern = <pattern> time = <time> guitar_stream = <guitar_stream> song = <song> array_entry = <array_entry> Player = <Player> player_status = <player_status> player_text = <player_text> finished = 0}
		break
	endif
	if (<boss> = 0)
		GuitarGetAnalogueInfo controller = ($<player_status>.controller)
		if IsGuitarController controller = ($<player_status>.controller)
			<px> = ((<rightx> - $<player_status>.resting_whammy_position) / (1.0 - $<player_status>.resting_whammy_position))
			if (<px> < 0)
				<px> = 0
			endif
			if (<first> = 1)
				<last_x> = <px>
				<first> = 0
			endif
			<xdiff> = (<px> - <last_x>)
			if (<xdiff> < 0)
				<xdiff> = (0.0 - <xdiff>)
			endif
			if (<xdiff> > 0.03)
				<whammy_on> = 5
			endif
		else
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
			if (<do_blue_whammys> = 1)
				if (<whammy_star_on> = 5)
					GetArraySize \{$gem_colors}
					gem_count = 0
					begin
					if ((<pattern> && $button_values [<gem_count>]) = $button_values [<gem_count>])
						formatText checksumName = whammy_id '%c_%i_whammybar_p%p' c = ($gem_colors_text [<gem_count>]) i = <array_entry> p = ($<player_status>.Player) AddToStringLookup = true
						if ScreenElementExists id = <whammy_id>
							bar_name = (<whammy_id> + 1)
							MakeStarWhammy Name = <bar_name> Player = ($<player_status>.Player)
						endif
					endif
					gem_count = (<gem_count> + 1)
					repeat <array_Size>
				endif
			endif
		else
			<whammy_star_on> = 0
			<whammy_star_off> = (<whammy_star_off> + 1)
			if (<do_blue_whammys> = 1)
				if (<whammy_star_off> = 5)
					GetArraySize \{$gem_colors}
					gem_count = 0
					begin
					if ((<pattern> && $button_values [<gem_count>]) = $button_values [<gem_count>])
						formatText checksumName = whammy_id '%c_%i_whammybar_p%p' c = ($gem_colors_text [<gem_count>]) i = <array_entry> p = ($<player_status>.Player) AddToStringLookup = true
						if ScreenElementExists id = <whammy_id>
							bar_name = (<whammy_id> + 1)
							MakeNormalWhammy Name = <bar_name> Player = ($<player_status>.Player)
						endif
					endif
					gem_count = (<gem_count> + 1)
					repeat <array_Size>
				endif
			endif
		endif
		<last_x> = <px>
		<last_y> = <py>
	endif
	<time> = (<time> - ($current_deltatime * 1000))
	if (<time> <= 0)
		ExtendCrc star_whammy_off <player_text> out = id
		broadcastevent Type = <id> data = {pattern = <pattern> time = <time> guitar_stream = <guitar_stream> song = <song> array_entry = <array_entry> Player = <Player> player_status = <player_status> player_text = <player_text> finished = 1}
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script reset_star_array 
	get_song_struct song = <song_name>
	if (($<player_status>.part) = rhythm)
		<part> = 'rhythm_'
	else
		<part> = ''
	endif
	if ($game_mode = p2_career || $game_mode = p2_coop ||
			($game_mode = training && ($<player_status>.part = rhythm)))
		if StructureContains structure = <song_struct> use_coop_notetracks
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
		formatText checksumName = song '%s_%p%d_starbattlemode' s = <song_prefix> p = <part> d = <difficulty_text_nl> AddToStringLookup
		Change structurename = <player_status> sp_phrases_total = 0
	else
		formatText checksumName = song '%s_%p%d_star' s = <song_prefix> p = <part> d = <difficulty_text_nl> AddToStringLookup
	endif
	Change structurename = <player_status> current_song_star_array = <song>
	Change structurename = <player_status> current_star_array_entry = 0
endscript

script is_star_note \{time = 0}
	star_array = ($<player_status>.current_song_star_array)
	GetArraySize $<star_array>
	if (<array_Size> = 0)
		return \{FALSE
			star_count = 0}
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
		if ($<player_status>.current_star_array_entry < (<array_Size> - 1))
			Change structurename = <player_status> current_star_array_entry = ($<player_status>.current_star_array_entry + 1)
		endif
	endif
	return FALSE star_count = <star_count>
endscript

script Do_StarPower_StageFX 
	switch (<player_status>.character_id)
		case Casey
		SpawnScriptLater Do_StarPower_ShotgunFX id = <scriptID> params = {<...>}
		case Johnny
		SpawnScriptLater Do_StarPower_FlameThrowerFX id = <scriptID> params = {<...>}
		case Judy
		SpawnScriptLater Do_StarPower_HeartsFX id = <scriptID> params = {<...>}
		case Lars
		case Ripper
		case Satan
		SpawnScriptLater Do_StarPower_BatFX id = <scriptID> params = {<...>}
		case Midori
		SpawnScriptLater Do_StarPower_ButterfliesFX id = <scriptID> params = {<...>}
		case Xavier
		SpawnScriptLater Do_StarPower_PeaceFX id = <scriptID> params = {<...>}
		default
		SpawnScriptLater Do_StarPower_TeslaFX id = <scriptID> params = {<...>}
	endswitch
endscript
spCaseyShoot = 0

script Do_StarPower_ShotgunFX 
	begin
	if ($spCaseyShoot = 1)
		formatText checksumName = shotgunID '%p_StarPower_ShotgunFXShotgunID' p = <player_text>
		SafeGetUniqueCompositeObjectID objID = (<player_status>.band_member) preferredID = <shotgunID>
		CreateParticleSystem Name = <uniqueID> objID = (<player_status>.band_member) bone = bone_guitar_neck params_Script = $GP_StarPower_Shotgun01
		formatText checksumName = smokeID '%p_StarPower_ShotgunFXSmokeID' p = <player_text>
		SafeGetUniqueCompositeObjectID objID = (<player_status>.band_member) preferredID = <smokeID>
		CreateParticleSystem Name = <uniqueID> objID = (<player_status>.band_member) bone = bone_guitar_neck params_Script = $GP_StarPower_ShotgunSmoke01
		Change \{spCaseyShoot = 0}
	endif
	Wait \{1
		Frame}
	repeat
endscript

script StarPower_ShootShotGun 
	Change \{spCaseyShoot = 1}
endscript
spJohnnyFlamesOn = 0
spJohnnyFlamesDur = 0

script Do_StarPower_FlameThrowerFX 
	(<player_status>.band_member) :Obj_GetBonePosition bone = BONE_PELVIS
	bonePos = (<X> * (1.0, 0.0, 0.0) + <y> * (0.0, 1.0, 0.0) + <z> * (0.0, 0.0, 1.0))
	formatText checksumName = anarchy01ID '%p_StarPower_FlameThrowerFXAnarchy01ID' p = <player_text>
	CreateParticleSystem Name = <anarchy01ID> objID = (<player_status>.band_member) bone = BONE_PELVIS params_Script = $GP_StarPower_FlameThrowerAnarchy01
	Wait \{1
		gameframe}
	begin
	if ($spJohnnyFlamesOn = 1)
		formatText checksumName = flameThrowerID '%p_StarPower_FlameThrowerFXFlameThrowerID' p = <player_text>
		CreateParticleSystem Name = <flameThrowerID> objID = (<player_status>.band_member) bone = bone_guitar_neck params_Script = {$GP_StarPower_FlameThrower01 LifeTime = $spJohnnyFlamesDur}
		Change \{spJohnnyFlamesOn = 0}
		break
	endif
	Wait \{1
		Frame}
	repeat
endscript

script StarPower_FlameThrowerFlames 
	Change spJohnnyFlamesDur = <emitDur>
	Change \{spJohnnyFlamesOn = 1}
endscript

script Do_StarPower_HeartsFX 
	(<player_status>.band_member) :Obj_GetBonePosition bone = BONE_PELVIS
	bonePos = (<X> * (1.0, 0.0, 0.0) + <y> * (0.0, 1.0, 0.0) + <z> * (0.0, 0.0, 1.0))
	GetUniqueCompositeobjectID \{preferredID = heartsPoofID01}
	CreateParticleSystem Name = <uniqueID> Pos = <bonePos> params_Script = $GP_StarPower_HeartsPoof01
	Wait \{1
		gameframe}
	formatText checksumName = heartsID '%p_StarPower_HeartsFXHeartsID' p = <player_text>
	CreateParticleSystem Name = <heartsID> objID = (<player_status>.band_member) bone = BONE_PELVIS params_Script = $GP_StarPower_Hearts01
	Wait \{1
		gameframe}
	formatText checksumName = swirlID '%p_StarPower_HeartsFXSwirlID' p = <player_text>
	CreateParticleSystem Name = <swirlID> objID = (<player_status>.band_member) bone = BONE_PELVIS params_Script = $GP_StarPower_HeartsSwirl01
	formatText checksumName = windID '%p_StarPower_HeartsFXWindID' p = <player_text>
	EngineWind create = {
		Name = <windID>
		Type = TWIST
		Pos = <bonePos>
		velocity = (0.0, 0.2, 0.0)
		speed = 8
		tangentWeight = 0.4
		Range = 7
		attenuation = INV_DISTANCE
		time = 0
	}
	begin
	(<player_status>.band_member) :Obj_GetBonePosition bone = BONE_PELVIS
	bonePos = (<X> * (1.0, 0.0, 0.0) + <y> * (0.0, 1.0, 0.0) + <z> * (0.0, 0.0, 1.0))
	EngineWind modify = {
		Name = <windID>
		Pos = <bonePos>
	}
	Wait \{0.05
		Seconds}
	repeat
endscript

script Do_StarPower_BatFX 
	(<player_status>.band_member) :Obj_GetBonePosition bone = BONE_PELVIS
	bonePos = (<X> * (1.0, 0.0, 0.0) + <y> * (0.0, 1.0, 0.0) + <z> * (0.0, 0.0, 1.0))
	GetUniqueCompositeobjectID \{preferredID = batPoofID01}
	CreateParticleSystem Name = <uniqueID> Pos = <bonePos> params_Script = $GP_StarPower_BatsPoof01
	Wait \{1
		gameframe}
	formatText checksumName = batID '%p_StarPower_BatFXBatID' p = <player_text>
	CreateParticleSystem Name = <batID> objID = (<player_status>.band_member) bone = BONE_PELVIS params_Script = $GP_StarPower_Bats01
	Wait \{1
		gameframe}
	formatText checksumName = swirlID '%p_StarPower_BatFXSwirlID' p = <player_text>
	CreateParticleSystem Name = <swirlID> objID = (<player_status>.band_member) bone = BONE_PELVIS params_Script = $GP_StarPower_BatsSwirl01
	formatText checksumName = windID '%p_StarPower_BatFXWindID' p = <player_text>
	EngineWind create = {
		Name = <windID>
		Type = TWIST
		Pos = <bonePos>
		velocity = (0.0, 0.2, 0.0)
		speed = 8
		tangentWeight = 0.4
		Range = 7
		attenuation = INV_DISTANCE
		time = 0
	}
	begin
	(<player_status>.band_member) :Obj_GetBonePosition bone = BONE_PELVIS
	bonePos = (<X> * (1.0, 0.0, 0.0) + <y> * (0.0, 1.0, 0.0) + <z> * (0.0, 0.0, 1.0))
	EngineWind modify = {
		Name = <windID>
		Pos = <bonePos>
	}
	Wait \{0.05
		Seconds}
	repeat
endscript

script Do_StarPower_ButterfliesFX 
	(<player_status>.band_member) :Obj_GetBonePosition bone = BONE_PELVIS
	bonePos = (<X> * (1.0, 0.0, 0.0) + <y> * (0.0, 1.0, 0.0) + <z> * (0.0, 0.0, 1.0))
	GetUniqueCompositeobjectID \{preferredID = ButterfliesPoofID01}
	CreateParticleSystem Name = <uniqueID> Pos = <bonePos> params_Script = $GP_StarPower_ButterfliesPoof01
	Wait \{1
		gameframe}
	formatText checksumName = butterfliesID '%p_StarPower_ButterfliesFXButterfliesID01' p = <player_text>
	CreateParticleSystem Name = <butterfliesID> objID = (<player_status>.band_member) bone = BONE_PELVIS params_Script = $GP_StarPower_Butterflies01
	Wait \{1
		gameframe}
	formatText checksumName = butterfliesID '%p_StarPower_ButterfliesFXButterfliesID02' p = <player_text>
	CreateParticleSystem Name = <butterfliesID> objID = (<player_status>.band_member) bone = BONE_PELVIS params_Script = $GP_StarPower_Butterflies01
	Wait \{1
		gameframe}
	formatText checksumName = swirlID '%p_StarPower_ButterfliesFXSwirlID' p = <player_text>
	CreateParticleSystem Name = <swirlID> objID = (<player_status>.band_member) bone = BONE_PELVIS params_Script = $GP_StarPower_ButterfliesSwirl01
	formatText checksumName = windID '%p_StarPower_ButterfliesFXWindID' p = <player_text>
	EngineWind create = {
		Name = <windID>
		Type = TWIST
		Pos = <bonePos>
		velocity = (0.0, 0.1, 0.0)
		speed = 6
		tangentWeight = 0.4
		Range = 7
		attenuation = INV_DISTANCE
		time = 0
	}
	begin
	(<player_status>.band_member) :Obj_GetBonePosition bone = BONE_PELVIS
	bonePos = (<X> * (1.0, 0.0, 0.0) + <y> * (0.0, 1.0, 0.0) + <z> * (0.0, 0.0, 1.0))
	EngineWind modify = {
		Name = <windID>
		Pos = <bonePos>
	}
	Wait \{0.05
		Seconds}
	repeat
endscript

script Do_StarPower_PeaceFX 
	(<player_status>.band_member) :Obj_GetBonePosition bone = BONE_PELVIS
	bonePos = (<X> * (1.0, 0.0, 0.0) + <y> * (0.0, 1.0, 0.0) + <z> * (0.0, 0.0, 1.0))
	GetUniqueCompositeobjectID \{preferredID = peacePoofID01}
	CreateParticleSystem Name = <uniqueID> Pos = <bonePos> params_Script = $GP_StarPower_PeacePoof01
	Wait \{1
		gameframe}
	formatText checksumName = peaceID '%p_StarPower_PeaceFXPeaceID' p = <player_text>
	CreateParticleSystem Name = <peaceID> objID = (<player_status>.band_member) bone = BONE_PELVIS params_Script = $GP_StarPower_Peace01
	Wait \{1
		gameframe}
	formatText checksumName = swirlID '%p_StarPower_PeaceFXSwirlID' p = <player_text>
	CreateParticleSystem Name = <swirlID> objID = (<player_status>.band_member) bone = BONE_PELVIS params_Script = $GP_StarPower_PeaceSwirl01
	formatText checksumName = windID '%p_StarPower_PeaceFXWindID' p = <player_text>
	EngineWind create = {
		Name = <windID>
		Type = TWIST
		Pos = <bonePos>
		velocity = (0.0, 0.1, 0.0)
		speed = 4
		tangentWeight = 0.4
		Range = 7
		attenuation = INV_DISTANCE
		time = 0
	}
	begin
	(<player_status>.band_member) :Obj_GetBonePosition bone = BONE_PELVIS
	bonePos = (<X> * (1.0, 0.0, 0.0) + <y> * (0.0, 1.0, 0.0) + <z> * (0.0, 0.0, 1.0))
	EngineWind modify = {
		Name = <windID>
		Pos = <bonePos>
	}
	Wait \{0.05
		Seconds}
	repeat
endscript

script Do_StarPower_TeslaFX 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_artdeco
		zonePrefix = 'Z_ArtDeco_GFX_TRG_TeslaNode_'
		case z_budokan
		zonePrefix = 'Z_Budokan_GFX_TRG_TeslaNode_'
		case z_dive
		zonePrefix = 'Z_Dive_GFX_TRG_TeslaNode_'
		case z_hell
		zonePrefix = 'Z_Hell_GFX_TRG_TeslaNode_'
		case z_party
		zonePrefix = 'Z_Party_GFX_TRG_TeslaNode_'
		case z_prison
		zonePrefix = 'Z_Prison_GFX_TRG_TeslaNode_'
		case z_video
		zonePrefix = 'Z_Video_GFX_TRG_TeslaNode_'
		case z_wikker
		zonePrefix = 'Z_Wikker_GFX_TRG_TeslaNode_'
		default
		return
	endswitch
	i = 1
	begin
	if (RandomRange (0.0, 1.0) = 0)
		bone = BONE_GUITAR_FRET_POS
	else
		bone = BONE_GUITAR_STRUM_POS
	endif
	formatText checksumName = scriptID '%p_StarPower_TeslaFX%i' p = <player_text> i = <i>
	formatText checksumName = teslaFXID '%p_StarPower_TeslaFXID%i' p = <player_text> i = <i>
	SpawnScriptLater Create_StarPower_TeslaFX id = <scriptID> params = {
		<...>
		zonePrefix = <zonePrefix>
		teslaFXID = <teslaFXID>
		bone = <bone>
		nodeNum = RandomRange (1.0, 10.0)
	}
	i = (<i> + 1)
	repeat RandomRange (2.0, 4.0)
	begin
	Wait RandomRange (0.1, 1.0) Seconds
	i = RandomRange (1.0, 4.0)
	formatText checksumName = scriptID '%p_StarPower_TeslaFX%i' p = <player_text> i = <i>
	formatText checksumName = teslaFXID '%p_StarPower_TeslaFXID%i' p = <player_text> i = <i>
	KillSpawnedScript id = <scriptID>
	DeleteTeslaEffectObject Name = <teslaFXID>
	if (<i> = 1 || <i> = 2 || RandomRange (0.0, 1.0) = 1)
		if (RandomRange (0.0, 1.0) = 0)
			bone = BONE_GUITAR_FRET_POS
		else
			bone = BONE_GUITAR_STRUM_POS
		endif
		SpawnScriptLater Create_StarPower_TeslaFX id = <scriptID> params = {
			<...>
			zonePrefix = <zonePrefix>
			teslaFXID = <teslaFXID>
			bone = <bone>
			nodeNum = RandomRange (1.0, 10.0)
		}
	endif
	repeat
endscript

script Create_StarPower_TeslaFX 
	(<player_status>.band_member) :Obj_GetBonePosition bone = <bone>
	bonePos = (<X> * (1.0, 0.0, 0.0) + <y> * (0.0, 1.0, 0.0) + <z> * (0.0, 0.0, 1.0))
	formatText checksumName = teslaNodeID '%z%n' z = <zonePrefix> n = <nodeNum>
	GetNode <teslaNodeID>
	GetDistance posA = <bonePos> posB = (<node>.Pos)
	CreateTeslaEffectObject Name = <teslaFXID> start = <bonePos> end = (<node>.Pos) width = (0.15 * <dist_AToB>) lightWidth = (0.4 / <dist_AToB>) fadeOut = 0.8 Color = (0.2, 0.3, 1.0)
	Wait \{1
		gameframe}
	GetUniqueCompositeobjectID \{preferredID = teslaSparksFX01}
	CreateParticleSystem Name = <uniqueID> Pos = (<node>.Pos) groupID = starPowerFX params_Script = $GP_StarPower_TeslaSparks01
	oldEndPos = (<node>.Pos)
	begin
	Wait \{1
		Frame}
	(<player_status>.band_member) :Obj_GetBonePosition bone = <bone>
	bonePos = (<X> * (1.0, 0.0, 0.0) + <y> * (0.0, 1.0, 0.0) + <z> * (0.0, 0.0, 1.0))
	newEndPos = (<oldEndPos> + RandomRange (-0.1, 0.1) * (1.0, 0.0, 0.0) + RandomRange (-0.1, 0.1) * (0.0, 0.0, 1.0))
	GetDistance posA = <bonePos> posB = <newEndPos>
	SetTeslaEffectObject Name = <teslaFXID> start = <bonePos> end = <newEndPos> width = (0.15 * <dist_AToB>) lightWidth = (0.4 / <dist_AToB>)
	oldEndPos = <newEndPos>
	repeat
endscript

script Kill_StarPower_StageFX \{ifEmpty = 1}
	formatText checksumName = scriptID '%p_StarPower_StageFX' p = <player_text>
	KillSpawnedScript id = <scriptID>
	switch (<player_status>.character_id)
		case Casey
		Change \{spCaseyShoot = 0}
		case Johnny
		formatText checksumName = flameThrowerID '%p_StarPower_FlameThrowerFXFlameThrowerID' p = <player_text>
		MangleChecksums a = <flameThrowerID> b = (<player_status>.band_member) p = <player_text>
		if IsCreated <mangled_ID>
			<mangled_ID> :EmitRate rate = 0
			<mangled_ID> :Destroy ifEmpty = <ifEmpty>
		endif
		formatText checksumName = anarchy01ID '%p_StarPower_FlameThrowerFXAnarchy01ID' p = <player_text>
		MangleChecksums a = <anarchy01ID> b = (<player_status>.band_member)
		if IsCreated <mangled_ID>
			<mangled_ID> :EmitRate rate = 0
			<mangled_ID> :Destroy ifEmpty = <ifEmpty>
		endif
		Change \{spJohnnyFlamesOn = 0}
		case Judy
		formatText checksumName = heartsID '%p_StarPower_HeartsFXHeartsID' p = <player_text>
		MangleChecksums a = <heartsID> b = (<player_status>.band_member)
		if IsCreated <mangled_ID>
			<mangled_ID> :EmitRate rate = 0
			<mangled_ID> :Destroy ifEmpty = <ifEmpty>
		endif
		formatText checksumName = swirlID '%p_StarPower_HeartsFXSwirlID' p = <player_text>
		MangleChecksums a = <swirlID> b = (<player_status>.band_member)
		if IsCreated <mangled_ID>
			<mangled_ID> :EmitRate rate = 0
			<mangled_ID> :Destroy ifEmpty = <ifEmpty>
		endif
		formatText checksumName = windID '%p_StarPower_HeartsFXWindID' p = <player_text>
		EngineWind remove <windID>
		case Lars
		case Ripper
		case Satan
		formatText checksumName = batID '%p_StarPower_BatFXBatID' p = <player_text>
		MangleChecksums a = <batID> b = (<player_status>.band_member)
		if IsCreated <mangled_ID>
			<mangled_ID> :EmitRate rate = 0
			<mangled_ID> :Destroy ifEmpty = <ifEmpty>
		endif
		formatText checksumName = swirlID '%p_StarPower_BatFXSwirlID' p = <player_text>
		MangleChecksums a = <swirlID> b = (<player_status>.band_member)
		if IsCreated <mangled_ID>
			<mangled_ID> :EmitRate rate = 0
			<mangled_ID> :Destroy ifEmpty = <ifEmpty>
		endif
		formatText checksumName = windID '%p_StarPower_BatFXWindID' p = <player_text>
		EngineWind remove <windID>
		case Midori
		formatText checksumName = butterfliesID '%p_StarPower_ButterfliesFXButterfliesID01' p = <player_text>
		MangleChecksums a = <butterfliesID> b = (<player_status>.band_member)
		if IsCreated <mangled_ID>
			<mangled_ID> :EmitRate rate = 0
			<mangled_ID> :Destroy ifEmpty = <ifEmpty>
		endif
		formatText checksumName = butterfliesID '%p_StarPower_ButterfliesFXButterfliesID02' p = <player_text>
		MangleChecksums a = <butterfliesID> b = (<player_status>.band_member)
		if IsCreated <mangled_ID>
			<mangled_ID> :EmitRate rate = 0
			<mangled_ID> :Destroy ifEmpty = <ifEmpty>
		endif
		formatText checksumName = swirlID '%p_StarPower_ButterfliesFXSwirlID' p = <player_text>
		MangleChecksums a = <swirlID> b = (<player_status>.band_member)
		if IsCreated <mangled_ID>
			<mangled_ID> :EmitRate rate = 0
			<mangled_ID> :Destroy ifEmpty = <ifEmpty>
		endif
		formatText checksumName = windID '%p_StarPower_ButterfliesFXWindID' p = <player_text>
		EngineWind remove <windID>
		case Xavier
		formatText checksumName = peaceID '%p_StarPower_PeaceFXPeaceID' p = <player_text>
		MangleChecksums a = <peaceID> b = (<player_status>.band_member)
		if IsCreated <mangled_ID>
			<mangled_ID> :EmitRate rate = 0
			<mangled_ID> :Destroy ifEmpty = <ifEmpty>
		endif
		formatText checksumName = swirlID '%p_StarPower_PeaceFXSwirlID' p = <player_text>
		MangleChecksums a = <swirlID> b = (<player_status>.band_member)
		if IsCreated <mangled_ID>
			<mangled_ID> :EmitRate rate = 0
			<mangled_ID> :Destroy ifEmpty = <ifEmpty>
		endif
		formatText checksumName = windID '%p_StarPower_PeaceFXWindID' p = <player_text>
		EngineWind remove <windID>
		default
		if (<ifEmpty> = 0)
			DestroyParticlesByGroupID \{groupID = starPowerFX}
		endif
		i = 1
		begin
		formatText checksumName = scriptID '%p_StarPower_TeslaFX%i' p = <player_text> i = <i>
		formatText checksumName = teslaFXID '%p_StarPower_TeslaFXID%i' p = <player_text> i = <i>
		KillSpawnedScript id = <scriptID>
		DeleteTeslaEffectObject Name = <teslaFXID>
		i = (<i> + 1)
		repeat 4
	endswitch
endscript
using_starpower_camera = FALSE

script Do_StarPower_Camera 
	if ($using_starpower_camera = true || $using_walk_camera = true)
		return
	endif
	Change \{using_starpower_camera = true}
	Wait \{1
		gameframe}
	Change \{CameraCuts_AllowNoteScripts = FALSE}
	CameraCuts_SetArrayPrefix \{prefix = 'cameras_starpower'
		changetime = 2500
		length = 7000}
	Wait \{7
		Seconds}
	CameraCuts_SetArrayPrefix \{prefix = 'cameras'}
	Change \{CameraCuts_AllowNoteScripts = true}
	Change \{using_starpower_camera = FALSE}
endscript

script Kill_StarPower_Camera \{changecamera = 1}
	if ($using_starpower_camera = FALSE)
		return
	endif
	KillSpawnedScript \{Name = Do_StarPower_Camera}
	if (<changecamera> = 1)
		CameraCuts_SetArrayPrefix \{prefix = 'cameras'}
	endif
	Change \{CameraCuts_AllowNoteScripts = true}
	Change \{using_starpower_camera = FALSE}
endscript
