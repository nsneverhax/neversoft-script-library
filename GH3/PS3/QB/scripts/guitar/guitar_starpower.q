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
	Change StructureName = <player_status> star_power_amount = 0.0
	Change StructureName = <player_status> star_power_sequence = 0
	Change StructureName = <player_status> star_power_note_count = 0
	Change StructureName = <player_status> star_power_used = 0
	Change StructureName = <player_status> current_star_array_entry = 0
endscript

script increase_star_power \{Amount = 10.0
		player_status = player1_status}
	if ($game_mode = p2_career || $game_mode = p2_coop)
		Printf \{"giving star power to both players"}
		increase_star_power_guts Amount = <Amount> player_status = player1_status
		increase_star_power_guts Amount = <Amount> player_status = player2_status
	else
		increase_star_power_guts Amount = <Amount> player_status = <player_status>
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
	Change StructureName = <player_status> star_power_amount = ($<player_status>.star_power_amount + <Amount>)
	if ($<player_status>.star_power_amount > 100)
		Change StructureName = <player_status> star_power_amount = 100
	endif
	if (<old_amount> < 50.0)
		if ($<player_status>.star_power_amount >= 50.0)
			SpawnScriptNow show_star_power_ready Params = {player_status = <player_status>}
		endif
	endif
endscript
star_power_ready_on_p1 = 0
star_power_ready_on_p2 = 0

script show_star_power_ready 
	if ($Cheat_PerformanceMode = 1)
		return
	endif
	if ($game_mode = p2_career || $game_mode = p2_coop)
		<player_status> = player1_status
	endif
	SoundEvent \{Event = Star_Power_Ready_SFX}
	SpawnScriptNow rock_meter_star_power_on Params = {player_status = <player_status>}
	FormatText ChecksumName = player_container 'HUD_Note_Streak_Combo%d' D = ($<player_status>.Player)
	begin
	if NOT ScreenElementExists Id = <player_container>
		break
	endif
	Wait \{1
		GameFrame}
	repeat
	if ($<player_status>.Player = 1)
		if ($star_power_ready_on_p1 = 1)
			return
		else
			Change \{star_power_ready_on_p1 = 1}
		endif
	else
		if ($star_power_ready_on_p2 = 1)
			return
		else
			Change \{star_power_ready_on_p2 = 1}
		endif
	endif
	if ($<player_status>.star_power_used = 1)
		return
	endif
	ExtendCRC star_power_ready_text ($<player_status>.Text) out = Id
	if (($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff))
		if ($<player_status>.Player = 1)
			original_pos = (($hud_screen_elements [0].Pos) - (225.0, 50.0))
		else
			original_pos = (($hud_screen_elements [0].Pos) + (225.0, -50.0))
		endif
		base_scale = 0.8
		scale_big_mult = 1.2
	else
		if ($game_mode = p2_career || $game_mode = p2_coop)
			original_pos = (($hud_screen_elements [0].Pos) - (0.0, 60.0))
		else
			original_pos = (($hud_screen_elements [0].Pos) - (0.0, 20.0))
		endif
		base_scale = 1.2
		scale_big_mult = 1.5
	endif
	if ScreenElementExists Id = <Id>
		<Id> :DoMorph Pos = <original_pos> Scale = 4 rgba = [190 225 255 250] Alpha = 0 Rot_Angle = 3
	endif
	ExtendCRC hud_destroygroup_window ($<player_status>.Text) out = hud_destroygroup
	SpawnScriptNow hud_lightning_alert Params = {Player = ($<player_status>.Player) alert_id = <Id> player_container = <hud_destroygroup>}
	if ScreenElementExists Id = <Id>
		<Id> :DoMorph Pos = <original_pos> Scale = <base_scale> Alpha = 1 Time = 0.3 Rot_Angle = -3 Motion = ease_in
	endif
	if ScreenElementExists Id = <Id>
		<Id> :DoMorph Pos = <original_pos> Scale = (<base_scale> * <scale_big_mult>) Time = 0.3 Rot_Angle = 4 Motion = ease_out
	endif
	if ScreenElementExists Id = <Id>
		<Id> :DoMorph Pos = <original_pos> Scale = <base_scale> Time = 0.3 Rot_Angle = -5 rgba = [145 215 235 250] Motion = ease_in
	endif
	rotation = 10
	begin
	<rotation> = (<rotation> * -0.7)
	if ScreenElementExists Id = <Id>
		<Id> :DoMorph Pos = <original_pos> Rot_Angle = <rotation> Alpha = 1 Time = 0.08 Motion = ease_out
	endif
	repeat 12
	if ScreenElementExists Id = <Id>
		<Id> :DoMorph Pos = <original_pos> Rot_Angle = 0 Motion = ease_out
	endif
	if ScreenElementExists Id = <Id>
		<Id> :DoMorph Pos = (<original_pos> - (0.0, 230.0)) Scale = (<base_scale> * 0.5) Alpha = 0 Time = 0.3 Motion = ease_in
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
			$is_attract_mode = 1 || $showing_raise_axe = 1 || $Cheat_PerformanceMode = 1 || $playing_song = 0)
		return
	endif
	Change \{showing_raise_axe = 1}
	ExtendCRC coop_raise_axe ($<player_status>.Text) out = Id
	ExtendCRC coop_raise_axe_cont ($<player_status>.Text) out = id_cont
	if ($<player_status>.Player = 1)
		original_pos = (($hud_screen_elements [10].Pos) - (225.0, 60.0))
		original_pos_cont = (($hud_screen_elements [10].Pos) - (225.0, 30.0))
	else
		original_pos = (($hud_screen_elements [10].Pos) + (225.0, -60.0))
		original_pos_cont = (($hud_screen_elements [10].Pos) + (225.0, -30.0))
	endif
	base_scale = 0.7
	base_scale_cont = 1
	if ScreenElementExists Id = <Id>
		DoScreenElementMorph {
			Id = <Id>
			Pos = <original_pos>
			Scale = 0
			Alpha = 1
		}
	endif
	if ScreenElementExists Id = <id_cont>
		DoScreenElementMorph {
			Id = <id_cont>
			Pos = <original_pos_cont>
			Scale = 0
			Alpha = 1
		}
	endif
	if ScreenElementExists Id = <Id>
		DoScreenElementMorph Id = <Id> Scale = <base_scale> Time = 0.2
	endif
	if ScreenElementExists Id = <id_cont>
		DoScreenElementMorph Id = <id_cont> Scale = <base_scale_cont> Time = 0.2
	endif
	Wait \{0.2
		Seconds}
	if NOT ScreenElementExists Id = <Id>
		Change \{showing_raise_axe = 0}
		return
	endif
	rotation = 4
	begin
	<rotation> = (<rotation> * -1)
	if ScreenElementExists Id = <Id>
		DoScreenElementMorph {
			Id = <Id>
			Rot_Angle = <rotation>
			Time = 0.1
		}
	endif
	if ScreenElementExists Id = <id_cont>
		DoScreenElementMorph {
			Id = <id_cont>
			Rot_Angle = <rotation>
			Time = 0.1
		}
	endif
	Wait \{0.13
		Seconds}
	if NOT ScreenElementExists Id = <Id>
		Change \{showing_raise_axe = 0}
		return
	endif
	repeat 8
	if ScreenElementExists Id = <Id>
		DoScreenElementMorph Id = <Id> Rot_Angle = 0
	endif
	if ScreenElementExists Id = <id_cont>
		DoScreenElementMorph Id = <id_cont> Rot_Angle = 0
	endif
	if ScreenElementExists Id = <Id>
		DoScreenElementMorph {
			Id = <Id>
			Pos = (<original_pos> - (0.0, 400.0))
			Scale = (<base_scale> * 0.5)
			Time = 0.35000002
		}
	endif
	if ScreenElementExists Id = <id_cont>
		DoScreenElementMorph {
			Id = <id_cont>
			Pos = (<original_pos_cont> - (0.0, 400.0))
			Scale = (<base_scale_cont> * 0.5)
			Time = 0.35000002
		}
	endif
	Change \{showing_raise_axe = 0}
endscript

script star_power_hit_note 
	increase_star_power Amount = $star_power_hit_note_score player_status = <player_status>
	Change StructureName = <player_status> star_power_note_count = ($<player_status>.star_power_note_count + 1)
	Change StructureName = <player_status> star_power_sequence = ($<player_status>.star_power_sequence + 1)
	BroadCastEvent Type = star_hit_note Data = {Song = <Song> array_entry = <array_entry> player_status = <player_status>}
	Printf "star note hit: %s required %r" S = ($<player_status>.star_power_sequence) R = <sequence_count>
	if (<sequence_count> = $<player_status>.star_power_sequence)
		if ($<player_status>.star_power_sequence > $star_power_sequence_min)
			if ($<player_status>.star_power_used = 0)
				Printf \{Channel = training
					"broadcasting star power bonus!!!!!!!!!!!"}
				BroadCastEvent Type = star_sequence_bonus Data = {Song = <Song> array_entry = <array_entry>}
				increase_star_power Amount = $star_power_sequence_bonus player_status = <player_status>
			endif
		endif
	endif
endscript

script reset_star_sequence 
	Change StructureName = <player_status> star_power_sequence = 0
	Change StructureName = <player_status> star_power_note_count = 0
endscript

script star_power_miss_note 
	Change StructureName = <player_status> star_power_sequence = 0
	LaunchGemEvent Event = star_miss_note Player = <Player>
	ExtendCRC star_miss_note <player_Text> out = Id
	BroadCastEvent Type = <Id> Data = {Song = <Song> array_entry = <array_entry>}
endscript

script star_power_whammy 
	if ($<player_status>.star_power_used = 1)
		return
	endif
	last_x = 0
	last_y = 0
	dir_x = 1
	dir_y = 1
	First = 1
	whammy_on = 0
	whammy_star_on = 0
	whammy_star_off = 0
	ExtendCRC star_whammy_on <player_Text> out = Id
	BroadCastEvent Type = <Id> Data = {pattern = <pattern> Time = <Time> Guitar_Stream = <Guitar_Stream> Song = <Song> array_entry = <array_entry> Player = <Player> player_status = <player_status> player_Text = <player_Text>}
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
		ExtendCRC star_whammy_off <player_Text> out = Id
		BroadCastEvent Type = <Id> Data = {pattern = <pattern> Time = <Time> Guitar_Stream = <Guitar_Stream> Song = <Song> array_entry = <array_entry> Player = <Player> player_status = <player_status> player_Text = <player_Text> FINISHED = 0}
		break
	endif
	if (<boss> = 0)
		if GuitarGetAnalogueInfo controller = ($<player_status>.controller)
			if IsGuitarController controller = ($<player_status>.controller)
				<px> = ((<RightX> - $<player_status>.resting_whammy_position) / (1.0 - $<player_status>.resting_whammy_position))
				if (<px> < 0)
					<px> = 0
				endif
				if (<First> = 1)
					<last_x> = <px>
					<First> = 0
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
					<py> = <Lefty>
				else
					if (<rightlength> > 0)
						<px> = <RightX>
						<py> = <RightY>
					endif
				endif
				if (<First> = 1)
					<last_x> = <px>
					<last_y> = <py>
					<First> = 0
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
					increase_star_power Amount = ($star_power_whammy_add_coop * <beat_ratio>) player_status = <player_status>
				else
					increase_star_power Amount = ($star_power_whammy_add * <beat_ratio>) player_status = <player_status>
				endif
				whammy_on = (<whammy_on> - 1)
				if (<do_blue_whammys> = 1)
					if (<whammy_star_on> = 5)
						GetArraySize \{$gem_colors}
						gem_count = 0
						begin
						if ((<pattern> && $button_values [<gem_count>]) = $button_values [<gem_count>])
							FormatText ChecksumName = whammy_id '%c_%i_whammybar_p%p' C = ($gem_colors_text [<gem_count>]) I = <array_entry> P = ($<player_status>.Player) AddToStringLookup = TRUE
							if ScreenElementExists Id = <whammy_id>
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
							FormatText ChecksumName = whammy_id '%c_%i_whammybar_p%p' C = ($gem_colors_text [<gem_count>]) I = <array_entry> P = ($<player_status>.Player) AddToStringLookup = TRUE
							if ScreenElementExists Id = <whammy_id>
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
	endif
	<Time> = (<Time> - ($current_deltatime * 1000))
	if (<Time> <= 0)
		ExtendCRC star_whammy_off <player_Text> out = Id
		BroadCastEvent Type = <Id> Data = {pattern = <pattern> Time = <Time> Guitar_Stream = <Guitar_Stream> Song = <Song> array_entry = <array_entry> Player = <Player> player_status = <player_status> player_Text = <player_Text> FINISHED = 1}
		break
	endif
	Wait \{1
		GameFrame}
	repeat
endscript

script reset_star_array 
	get_song_struct Song = <song_name>
	if (($<player_status>.part) = RHYTHM)
		<part> = 'rhythm_'
	else
		<part> = ''
	endif
	if ($game_mode = p2_career || $game_mode = p2_coop ||
			($game_mode = training && ($<player_status>.part = RHYTHM)))
		if StructureContains Structure = <song_struct> use_coop_notetracks
			if (($<player_status>.part) = RHYTHM)
				<part> = 'rhythmcoop_'
			else
				<part> = 'guitarcoop_'
			endif
		endif
	endif
	get_song_prefix Song = <song_name>
	get_difficulty_text_nl DIFFICULTY = <DIFFICULTY>
	if ($game_mode = p2_battle ||
			$boss_battle = 1)
		FormatText ChecksumName = Song '%s_%p%d_starbattlemode' S = <song_prefix> P = <part> D = <difficulty_text_nl> AddToStringLookup
		Change StructureName = <player_status> sp_phrases_total = 0
	else
		FormatText ChecksumName = Song '%s_%p%d_star' S = <song_prefix> P = <part> D = <difficulty_text_nl> AddToStringLookup
	endif
	Change StructureName = <player_status> current_song_star_array = <Song>
	Change StructureName = <player_status> current_star_array_entry = 0
endscript

script is_star_note \{Time = 0}
	star_array = ($<player_status>.current_song_star_array)
	GetArraySize $<star_array>
	if (<array_Size> = 0)
		return \{FALSE
			star_count = 0}
	endif
	star_start = ($<star_array> [($<player_status>.current_star_array_entry)] [0])
	star_end = (($<star_array> [($<player_status>.current_star_array_entry)] [1]) + <star_start>)
	star_count = ($<star_array> [($<player_status>.current_star_array_entry)] [2])
	if (<Time> >= <star_start>)
		if (<Time> <= <star_end>)
			return TRUE star_count = <star_count>
		endif
	endif
	if (<Time> > <star_end>)
		if ($<player_status>.current_star_array_entry < (<array_Size> - 1))
			Change StructureName = <player_status> current_star_array_entry = ($<player_status>.current_star_array_entry + 1)
		endif
	endif
	return FALSE star_count = <star_count>
endscript

script Do_StarPower_StageFX 
	switch (<player_status>.character_id)
		case CASEY
		SpawnScriptLater Do_StarPower_ShotgunFX Id = <scriptID> Params = {<...>}
		case JOHNNY
		SpawnScriptLater Do_StarPower_FlameThrowerFX Id = <scriptID> Params = {<...>}
		case JUDY
		SpawnScriptLater Do_StarPower_HeartsFX Id = <scriptID> Params = {<...>}
		case LARS
		case RIPPER
		case SATAN
		SpawnScriptLater Do_StarPower_BatFX Id = <scriptID> Params = {<...>}
		case MIDORI
		SpawnScriptLater Do_StarPower_ButterfliesFX Id = <scriptID> Params = {<...>}
		case XAVIER
		SpawnScriptLater Do_StarPower_PeaceFX Id = <scriptID> Params = {<...>}
		default
		SpawnScriptLater Do_StarPower_TeslaFX Id = <scriptID> Params = {<...>}
	endswitch
endscript
spCaseyShoot = 0

script Do_StarPower_ShotgunFX 
	begin
	if ($spCaseyShoot = 1)
		FormatText ChecksumName = shotgunID '%p_StarPower_ShotgunFXShotgunID' P = <player_Text>
		SafeGetUniqueCompositeObjectID ObjID = (<player_status>.band_Member) PreferredId = <shotgunID>
		CreateParticleSystem Name = <UniqueId> ObjID = (<player_status>.band_Member) Bone = BONE_GUITAR_NECK params_Script = $GP_StarPower_Shotgun01
		FormatText ChecksumName = smokeID '%p_StarPower_ShotgunFXSmokeID' P = <player_Text>
		SafeGetUniqueCompositeObjectID ObjID = (<player_status>.band_Member) PreferredId = <smokeID>
		CreateParticleSystem Name = <UniqueId> ObjID = (<player_status>.band_Member) Bone = BONE_GUITAR_NECK params_Script = $GP_StarPower_ShotgunSmoke01
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
	(<player_status>.band_Member) :Obj_GetBonePosition Bone = BONE_PELVIS
	bonePos = (<X> * (1.0, 0.0, 0.0) + <Y> * (0.0, 1.0, 0.0) + <Z> * (0.0, 0.0, 1.0))
	FormatText ChecksumName = anarchy01ID '%p_StarPower_FlameThrowerFXAnarchy01ID' P = <player_Text>
	CreateParticleSystem Name = <anarchy01ID> ObjID = (<player_status>.band_Member) Bone = BONE_PELVIS params_Script = $GP_StarPower_FlameThrowerAnarchy01
	Wait \{1
		GameFrame}
	begin
	if ($spJohnnyFlamesOn = 1)
		FormatText ChecksumName = flameThrowerID '%p_StarPower_FlameThrowerFXFlameThrowerID' P = <player_Text>
		CreateParticleSystem Name = <flameThrowerID> ObjID = (<player_status>.band_Member) Bone = BONE_GUITAR_NECK params_Script = {$GP_StarPower_FlameThrower01 LifeTime = $spJohnnyFlamesDur}
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
	(<player_status>.band_Member) :Obj_GetBonePosition Bone = BONE_PELVIS
	bonePos = (<X> * (1.0, 0.0, 0.0) + <Y> * (0.0, 1.0, 0.0) + <Z> * (0.0, 0.0, 1.0))
	GetUniqueCompositeObjectID \{PreferredId = heartsPoofID01}
	CreateParticleSystem Name = <UniqueId> Pos = <bonePos> params_Script = $GP_StarPower_HeartsPoof01
	Wait \{1
		GameFrame}
	FormatText ChecksumName = heartsID '%p_StarPower_HeartsFXHeartsID' P = <player_Text>
	CreateParticleSystem Name = <heartsID> ObjID = (<player_status>.band_Member) Bone = BONE_PELVIS params_Script = $GP_StarPower_Hearts01
	Wait \{1
		GameFrame}
	FormatText ChecksumName = swirlID '%p_StarPower_HeartsFXSwirlID' P = <player_Text>
	CreateParticleSystem Name = <swirlID> ObjID = (<player_status>.band_Member) Bone = BONE_PELVIS params_Script = $GP_StarPower_HeartsSwirl01
	FormatText ChecksumName = windID '%p_StarPower_HeartsFXWindID' P = <player_Text>
	EngineWind Create = {
		Name = <windID>
		Type = TWIST
		Pos = <bonePos>
		Velocity = (0.0, 0.2, 0.0)
		SPEED = 8
		tangentWeight = 0.4
		Range = 7
		attenuation = INV_DISTANCE
		Time = 0
	}
	begin
	(<player_status>.band_Member) :Obj_GetBonePosition Bone = BONE_PELVIS
	bonePos = (<X> * (1.0, 0.0, 0.0) + <Y> * (0.0, 1.0, 0.0) + <Z> * (0.0, 0.0, 1.0))
	EngineWind modify = {
		Name = <windID>
		Pos = <bonePos>
	}
	Wait \{0.05
		Seconds}
	repeat
endscript

script Do_StarPower_BatFX 
	(<player_status>.band_Member) :Obj_GetBonePosition Bone = BONE_PELVIS
	bonePos = (<X> * (1.0, 0.0, 0.0) + <Y> * (0.0, 1.0, 0.0) + <Z> * (0.0, 0.0, 1.0))
	GetUniqueCompositeObjectID \{PreferredId = batPoofID01}
	CreateParticleSystem Name = <UniqueId> Pos = <bonePos> params_Script = $GP_StarPower_BatsPoof01
	Wait \{1
		GameFrame}
	FormatText ChecksumName = batID '%p_StarPower_BatFXBatID' P = <player_Text>
	CreateParticleSystem Name = <batID> ObjID = (<player_status>.band_Member) Bone = BONE_PELVIS params_Script = $GP_StarPower_Bats01
	Wait \{1
		GameFrame}
	FormatText ChecksumName = swirlID '%p_StarPower_BatFXSwirlID' P = <player_Text>
	CreateParticleSystem Name = <swirlID> ObjID = (<player_status>.band_Member) Bone = BONE_PELVIS params_Script = $GP_StarPower_BatsSwirl01
	FormatText ChecksumName = windID '%p_StarPower_BatFXWindID' P = <player_Text>
	EngineWind Create = {
		Name = <windID>
		Type = TWIST
		Pos = <bonePos>
		Velocity = (0.0, 0.2, 0.0)
		SPEED = 8
		tangentWeight = 0.4
		Range = 7
		attenuation = INV_DISTANCE
		Time = 0
	}
	begin
	(<player_status>.band_Member) :Obj_GetBonePosition Bone = BONE_PELVIS
	bonePos = (<X> * (1.0, 0.0, 0.0) + <Y> * (0.0, 1.0, 0.0) + <Z> * (0.0, 0.0, 1.0))
	EngineWind modify = {
		Name = <windID>
		Pos = <bonePos>
	}
	Wait \{0.05
		Seconds}
	repeat
endscript

script Do_StarPower_ButterfliesFX 
	(<player_status>.band_Member) :Obj_GetBonePosition Bone = BONE_PELVIS
	bonePos = (<X> * (1.0, 0.0, 0.0) + <Y> * (0.0, 1.0, 0.0) + <Z> * (0.0, 0.0, 1.0))
	GetUniqueCompositeObjectID \{PreferredId = ButterfliesPoofID01}
	CreateParticleSystem Name = <UniqueId> Pos = <bonePos> params_Script = $GP_StarPower_ButterfliesPoof01
	Wait \{1
		GameFrame}
	FormatText ChecksumName = butterfliesID '%p_StarPower_ButterfliesFXButterfliesID01' P = <player_Text>
	CreateParticleSystem Name = <butterfliesID> ObjID = (<player_status>.band_Member) Bone = BONE_PELVIS params_Script = $GP_StarPower_Butterflies01
	Wait \{1
		GameFrame}
	FormatText ChecksumName = butterfliesID '%p_StarPower_ButterfliesFXButterfliesID02' P = <player_Text>
	CreateParticleSystem Name = <butterfliesID> ObjID = (<player_status>.band_Member) Bone = BONE_PELVIS params_Script = $GP_StarPower_Butterflies01
	Wait \{1
		GameFrame}
	FormatText ChecksumName = swirlID '%p_StarPower_ButterfliesFXSwirlID' P = <player_Text>
	CreateParticleSystem Name = <swirlID> ObjID = (<player_status>.band_Member) Bone = BONE_PELVIS params_Script = $GP_StarPower_ButterfliesSwirl01
	FormatText ChecksumName = windID '%p_StarPower_ButterfliesFXWindID' P = <player_Text>
	EngineWind Create = {
		Name = <windID>
		Type = TWIST
		Pos = <bonePos>
		Velocity = (0.0, 0.1, 0.0)
		SPEED = 6
		tangentWeight = 0.4
		Range = 7
		attenuation = INV_DISTANCE
		Time = 0
	}
	begin
	(<player_status>.band_Member) :Obj_GetBonePosition Bone = BONE_PELVIS
	bonePos = (<X> * (1.0, 0.0, 0.0) + <Y> * (0.0, 1.0, 0.0) + <Z> * (0.0, 0.0, 1.0))
	EngineWind modify = {
		Name = <windID>
		Pos = <bonePos>
	}
	Wait \{0.05
		Seconds}
	repeat
endscript

script Do_StarPower_PeaceFX 
	(<player_status>.band_Member) :Obj_GetBonePosition Bone = BONE_PELVIS
	bonePos = (<X> * (1.0, 0.0, 0.0) + <Y> * (0.0, 1.0, 0.0) + <Z> * (0.0, 0.0, 1.0))
	GetUniqueCompositeObjectID \{PreferredId = peacePoofID01}
	CreateParticleSystem Name = <UniqueId> Pos = <bonePos> params_Script = $GP_StarPower_PeacePoof01
	Wait \{1
		GameFrame}
	FormatText ChecksumName = peaceID '%p_StarPower_PeaceFXPeaceID' P = <player_Text>
	CreateParticleSystem Name = <peaceID> ObjID = (<player_status>.band_Member) Bone = BONE_PELVIS params_Script = $GP_StarPower_Peace01
	Wait \{1
		GameFrame}
	FormatText ChecksumName = swirlID '%p_StarPower_PeaceFXSwirlID' P = <player_Text>
	CreateParticleSystem Name = <swirlID> ObjID = (<player_status>.band_Member) Bone = BONE_PELVIS params_Script = $GP_StarPower_PeaceSwirl01
	FormatText ChecksumName = windID '%p_StarPower_PeaceFXWindID' P = <player_Text>
	EngineWind Create = {
		Name = <windID>
		Type = TWIST
		Pos = <bonePos>
		Velocity = (0.0, 0.1, 0.0)
		SPEED = 4
		tangentWeight = 0.4
		Range = 7
		attenuation = INV_DISTANCE
		Time = 0
	}
	begin
	(<player_status>.band_Member) :Obj_GetBonePosition Bone = BONE_PELVIS
	bonePos = (<X> * (1.0, 0.0, 0.0) + <Y> * (0.0, 1.0, 0.0) + <Z> * (0.0, 0.0, 1.0))
	EngineWind modify = {
		Name = <windID>
		Pos = <bonePos>
	}
	Wait \{0.05
		Seconds}
	repeat
endscript

script Do_StarPower_TeslaFX 
	GetPakManCurrent \{map = Zones}
	switch <pak>
		case Z_ArtDeco
		zonePrefix = 'Z_ArtDeco_GFX_TRG_TeslaNode_'
		case Z_Budokan
		zonePrefix = 'Z_Budokan_GFX_TRG_TeslaNode_'
		case Z_Dive
		zonePrefix = 'Z_Dive_GFX_TRG_TeslaNode_'
		case Z_Hell
		zonePrefix = 'Z_Hell_GFX_TRG_TeslaNode_'
		case Z_Party
		zonePrefix = 'Z_Party_GFX_TRG_TeslaNode_'
		case Z_Prison
		zonePrefix = 'Z_Prison_GFX_TRG_TeslaNode_'
		case Z_Video
		zonePrefix = 'Z_Video_GFX_TRG_TeslaNode_'
		case Z_Wikker
		zonePrefix = 'Z_Wikker_GFX_TRG_TeslaNode_'
		default
		return
	endswitch
	I = 1
	begin
	if (RandomRange (0.0, 1.0) = 0)
		Bone = BONE_GUITAR_FRET_POS
	else
		Bone = BONE_GUITAR_STRUM_POS
	endif
	FormatText ChecksumName = scriptID '%p_StarPower_TeslaFX%i' P = <player_Text> I = <I>
	FormatText ChecksumName = teslaFXID '%p_StarPower_TeslaFXID%i' P = <player_Text> I = <I>
	SpawnScriptLater Create_StarPower_TeslaFX Id = <scriptID> Params = {
		<...>
		zonePrefix = <zonePrefix>
		teslaFXID = <teslaFXID>
		Bone = <Bone>
		nodeNum = RandomRange (1.0, 10.0)
	}
	I = (<I> + 1)
	repeat RandomRange (2.0, 4.0)
	begin
	Wait RandomRange (0.1, 1.0) Seconds
	I = RandomRange (1.0, 4.0)
	FormatText ChecksumName = scriptID '%p_StarPower_TeslaFX%i' P = <player_Text> I = <I>
	FormatText ChecksumName = teslaFXID '%p_StarPower_TeslaFXID%i' P = <player_Text> I = <I>
	KillSpawnedScript Id = <scriptID>
	DeleteTeslaEffectObject Name = <teslaFXID>
	if (<I> = 1 || <I> = 2 || RandomRange (0.0, 1.0) = 1)
		if (RandomRange (0.0, 1.0) = 0)
			Bone = BONE_GUITAR_FRET_POS
		else
			Bone = BONE_GUITAR_STRUM_POS
		endif
		SpawnScriptLater Create_StarPower_TeslaFX Id = <scriptID> Params = {
			<...>
			zonePrefix = <zonePrefix>
			teslaFXID = <teslaFXID>
			Bone = <Bone>
			nodeNum = RandomRange (1.0, 10.0)
		}
	endif
	repeat
endscript

script Create_StarPower_TeslaFX 
	(<player_status>.band_Member) :Obj_GetBonePosition Bone = <Bone>
	bonePos = (<X> * (1.0, 0.0, 0.0) + <Y> * (0.0, 1.0, 0.0) + <Z> * (0.0, 0.0, 1.0))
	FormatText ChecksumName = teslaNodeID '%z%n' Z = <zonePrefix> N = <nodeNum>
	GetNode <teslaNodeID>
	GetDistance posA = <bonePos> PosB = (<node>.Pos)
	CreateTeslaEffectObject Name = <teslaFXID> Start = <bonePos> End = (<node>.Pos) width = (0.15 * <dist_AToB>) lightWidth = (0.4 / <dist_AToB>) fadeOut = 0.8 Color = (0.2, 0.3, 1.0)
	Wait \{1
		GameFrame}
	GetUniqueCompositeObjectID \{PreferredId = teslaSparksFX01}
	CreateParticleSystem Name = <UniqueId> Pos = (<node>.Pos) groupID = starPowerFX params_Script = $GP_StarPower_TeslaSparks01
	oldEndPos = (<node>.Pos)
	begin
	Wait \{1
		Frame}
	(<player_status>.band_Member) :Obj_GetBonePosition Bone = <Bone>
	bonePos = (<X> * (1.0, 0.0, 0.0) + <Y> * (0.0, 1.0, 0.0) + <Z> * (0.0, 0.0, 1.0))
	newEndPos = (<oldEndPos> + RandomRange (-0.1, 0.1) * (1.0, 0.0, 0.0) + RandomRange (-0.1, 0.1) * (0.0, 0.0, 1.0))
	GetDistance posA = <bonePos> PosB = <newEndPos>
	SetTeslaEffectObject Name = <teslaFXID> Start = <bonePos> End = <newEndPos> width = (0.15 * <dist_AToB>) lightWidth = (0.4 / <dist_AToB>)
	oldEndPos = <newEndPos>
	repeat
endscript

script Kill_StarPower_StageFX \{IfEmpty = 1}
	FormatText ChecksumName = scriptID '%p_StarPower_StageFX' P = <player_Text>
	KillSpawnedScript Id = <scriptID>
	switch (<player_status>.character_id)
		case CASEY
		Change \{spCaseyShoot = 0}
		case JOHNNY
		FormatText ChecksumName = flameThrowerID '%p_StarPower_FlameThrowerFXFlameThrowerID' P = <player_Text>
		MangleChecksums A = <flameThrowerID> B = (<player_status>.band_Member) P = <player_Text>
		if IsCreated <mangled_ID>
			<mangled_ID> :EmitRate RATE = 0
			<mangled_ID> :Destroy IfEmpty = <IfEmpty>
		endif
		FormatText ChecksumName = anarchy01ID '%p_StarPower_FlameThrowerFXAnarchy01ID' P = <player_Text>
		MangleChecksums A = <anarchy01ID> B = (<player_status>.band_Member)
		if IsCreated <mangled_ID>
			<mangled_ID> :EmitRate RATE = 0
			<mangled_ID> :Destroy IfEmpty = <IfEmpty>
		endif
		Change \{spJohnnyFlamesOn = 0}
		case JUDY
		FormatText ChecksumName = heartsID '%p_StarPower_HeartsFXHeartsID' P = <player_Text>
		MangleChecksums A = <heartsID> B = (<player_status>.band_Member)
		if IsCreated <mangled_ID>
			<mangled_ID> :EmitRate RATE = 0
			<mangled_ID> :Destroy IfEmpty = <IfEmpty>
		endif
		FormatText ChecksumName = swirlID '%p_StarPower_HeartsFXSwirlID' P = <player_Text>
		MangleChecksums A = <swirlID> B = (<player_status>.band_Member)
		if IsCreated <mangled_ID>
			<mangled_ID> :EmitRate RATE = 0
			<mangled_ID> :Destroy IfEmpty = <IfEmpty>
		endif
		FormatText ChecksumName = windID '%p_StarPower_HeartsFXWindID' P = <player_Text>
		EngineWind Remove <windID>
		case LARS
		case RIPPER
		case SATAN
		FormatText ChecksumName = batID '%p_StarPower_BatFXBatID' P = <player_Text>
		MangleChecksums A = <batID> B = (<player_status>.band_Member)
		if IsCreated <mangled_ID>
			<mangled_ID> :EmitRate RATE = 0
			<mangled_ID> :Destroy IfEmpty = <IfEmpty>
		endif
		FormatText ChecksumName = swirlID '%p_StarPower_BatFXSwirlID' P = <player_Text>
		MangleChecksums A = <swirlID> B = (<player_status>.band_Member)
		if IsCreated <mangled_ID>
			<mangled_ID> :EmitRate RATE = 0
			<mangled_ID> :Destroy IfEmpty = <IfEmpty>
		endif
		FormatText ChecksumName = windID '%p_StarPower_BatFXWindID' P = <player_Text>
		EngineWind Remove <windID>
		case MIDORI
		FormatText ChecksumName = butterfliesID '%p_StarPower_ButterfliesFXButterfliesID01' P = <player_Text>
		MangleChecksums A = <butterfliesID> B = (<player_status>.band_Member)
		if IsCreated <mangled_ID>
			<mangled_ID> :EmitRate RATE = 0
			<mangled_ID> :Destroy IfEmpty = <IfEmpty>
		endif
		FormatText ChecksumName = butterfliesID '%p_StarPower_ButterfliesFXButterfliesID02' P = <player_Text>
		MangleChecksums A = <butterfliesID> B = (<player_status>.band_Member)
		if IsCreated <mangled_ID>
			<mangled_ID> :EmitRate RATE = 0
			<mangled_ID> :Destroy IfEmpty = <IfEmpty>
		endif
		FormatText ChecksumName = swirlID '%p_StarPower_ButterfliesFXSwirlID' P = <player_Text>
		MangleChecksums A = <swirlID> B = (<player_status>.band_Member)
		if IsCreated <mangled_ID>
			<mangled_ID> :EmitRate RATE = 0
			<mangled_ID> :Destroy IfEmpty = <IfEmpty>
		endif
		FormatText ChecksumName = windID '%p_StarPower_ButterfliesFXWindID' P = <player_Text>
		EngineWind Remove <windID>
		case XAVIER
		FormatText ChecksumName = peaceID '%p_StarPower_PeaceFXPeaceID' P = <player_Text>
		MangleChecksums A = <peaceID> B = (<player_status>.band_Member)
		if IsCreated <mangled_ID>
			<mangled_ID> :EmitRate RATE = 0
			<mangled_ID> :Destroy IfEmpty = <IfEmpty>
		endif
		FormatText ChecksumName = swirlID '%p_StarPower_PeaceFXSwirlID' P = <player_Text>
		MangleChecksums A = <swirlID> B = (<player_status>.band_Member)
		if IsCreated <mangled_ID>
			<mangled_ID> :EmitRate RATE = 0
			<mangled_ID> :Destroy IfEmpty = <IfEmpty>
		endif
		FormatText ChecksumName = windID '%p_StarPower_PeaceFXWindID' P = <player_Text>
		EngineWind Remove <windID>
		default
		if (<IfEmpty> = 0)
			DestroyParticlesByGroupID \{groupID = starPowerFX}
		endif
		I = 1
		begin
		FormatText ChecksumName = scriptID '%p_StarPower_TeslaFX%i' P = <player_Text> I = <I>
		FormatText ChecksumName = teslaFXID '%p_StarPower_TeslaFXID%i' P = <player_Text> I = <I>
		KillSpawnedScript Id = <scriptID>
		DeleteTeslaEffectObject Name = <teslaFXID>
		I = (<I> + 1)
		repeat 4
	endswitch
endscript
using_starpower_camera = FALSE

script Do_StarPower_Camera 
	if ($using_starpower_camera = TRUE || $using_walk_camera = TRUE)
		return
	endif
	Change \{using_starpower_camera = TRUE}
	Wait \{1
		GameFrame}
	Change \{CameraCuts_AllowNoteScripts = FALSE}
	CameraCuts_SetArrayPrefix \{prefix = 'cameras_starpower'
		changetime = 2500
		Length = 7000}
	Wait \{7
		Seconds}
	CameraCuts_SetArrayPrefix \{prefix = 'cameras'}
	Change \{CameraCuts_AllowNoteScripts = TRUE}
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
	Change \{CameraCuts_AllowNoteScripts = TRUE}
	Change \{using_starpower_camera = FALSE}
endscript
