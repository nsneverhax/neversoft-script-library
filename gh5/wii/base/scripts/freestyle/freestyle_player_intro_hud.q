
script freestyle_game_create_player_intro 
	RequireParams \{[
			Player
		]
		all}
	freestyle_get_position_on_highway_for_player Player = <Player>
	position = (<position> + (640.0, 460.0))
	formatText checksumName = container_id 'freestyle_intro_player_container_%d' d = <Player>
	CreateScreenElement {
		dims = (400.0, 400.0)
		parent = freestyle_root
		id = <container_id>
		Type = ContainerElement
		just = [center center]
		Pos = <position>
		z_priority = 5
		preserve_local_orientation = FALSE
	}
	formatText checksumName = mii_face_id 'freestyle_mii_face_%i' i = <Player>
	mii_index = ($freestyle_player_data [<Player>].mii_index)
	mii_database = ($freestyle_player_data [<Player>].mii_database)
	CreateScreenElement {
		id = <mii_face_id>
		Type = miiiconelement
		parent = <container_id>
		pos_anchor = [center center]
		just = [center center]
		Pos = (0.0, 0.0)
		z_priority = 30
		mii_expression = Normal
		mii_bgcolor = $freestyle_mii_on_bg
		mii_dims = (256.0, 256.0)
		mii_index = <mii_index>
		mii_database = <mii_database>
	}
	formatText checksumName = mii_backing_id 'mii_backing_%i' i = <Player>
	CreateScreenElement {
		Type = SpriteElement
		id = <mii_backing_id>
		texture = black_circle_gradient
		parent = <container_id>
		pos_anchor = [center center]
		just = [center center]
		Pos = (0.0, 0.0)
		z_priority = 28
		dims = (256.0, 256.0)
	}
	<mii_face_id> :Obj_SpawnScriptNow freestyle_hud_pop_graphic_in
	Wait \{0.2
		Seconds}
	if (<mii_database> = randomdb)
		mii_name = qs(0x03ac90f0)
	else
		getmiiname index = <mii_index> database = <mii_database>
	endif
	formatText checksumName = mii_name_id 'freestyle_mii_name_%i' i = <Player>
	CreateScreenElement {
		Type = TextBlockElement
		parent = <container_id>
		Pos = (0.0, 128.0)
		dims = (256.0, 64.0)
		text = <mii_name>
		id = <mii_name_id>
		font = fontgrid_title_a1
		z_priority = 31
		pos_anchor = [center center]
		just = [center center]
		internal_just = [center center]
		internal_scale = (0.5, 0.5)
		fit_width = `scale	each	line	if	larger`
		fit_height = `scale	down	if	larger`
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	<mii_name_id> :Obj_SpawnScriptNow freestyle_hud_fall_graphic_in params = {Scale = 4}
	Wait \{0.2
		Seconds}
	device_num = ($freestyle_player_data [<Player>].controller)
	freestyle_spawn_controller_lights {
		parent = <container_id>
		Player = <Player>
		controller = <device_num>
		state = freestyle_player_intro_hud
	}
	Wait \{0.2
		Seconds}
	instrument = ($freestyle_player_data [<Player>].instrument)
	switch <instrument>
		case guitar
		instrument_text = qs(0xaecdfaea)
		case drums
		instrument_text = qs(0x40351ace)
		case bass
		instrument_text = qs(0x1fe7d0f9)
	endswitch
	if (($freestyle_player_data [<Player>].mii_database) = randomdb)
		Pos = (0.0, 160.0)
	else
		Pos = (0.0, 192.0)
	endif
	formatText checksumName = instrument_name_id 'freestyle_instrument_name_%i' i = <Player>
	CreateScreenElement {
		Type = TextElement
		parent = <container_id>
		Pos = <Pos>
		dims = (256.0, 64.0)
		text = <instrument_text>
		id = <instrument_name_id>
		font = fontgrid_title_a1
		z_priority = 31
		pos_anchor = [center center]
		just = [center center]
		internal_just = [center center]
		internal_scale = (0.5, 0.5)
		fit_width = `scale	each	line	if	larger`
		fit_height = `scale	down	if	larger`
		use_shadow = true
	}
	<instrument_name_id> :Obj_SpawnScriptNow freestyle_hud_fall_graphic_in params = {Scale = 4}
endscript

script freestyle_game_player_intro_remove_text 
	if NOT ($freestyle_game_mode = tutorial)
		counter = 0
		begin
		if NOT ($freestyle_player_data [<counter>].player_type = ai)
			formatText checksumName = mii_name_id 'freestyle_mii_name_%i' i = <counter>
			formatText checksumName = instrument_name_id 'freestyle_instrument_name_%i' i = <counter>
			formatText checksumName = light_id 'controller_lights_%i' i = <counter>
			if ScreenElementExists id = <mii_name_id>
				<mii_name_id> :Obj_SpawnScriptNow freestyle_hud_fall_graphic_out params = {Scale = 1 Destroy}
			endif
			if ScreenElementExists id = <instrument_name_id>
				<instrument_name_id> :Obj_SpawnScriptNow freestyle_hud_fall_graphic_out params = {Scale = 1 Destroy}
			endif
			if NOT (($freestyle_player_data [<counter>].mii_database) = randomdb)
				<light_id> :se_setprops {
					Pos = (0.0, 128.0)
					time = 0.2
				}
			endif
			formatText checksumName = mii_backing_id 'mii_backing_%i' i = <counter>
			<mii_backing_id> :se_setprops {
				alpha = 0
				time = 0.2
			}
			Wait \{0.2
				Seconds}
			DestroyScreenElement id = <mii_backing_id>
		endif
		counter = (<counter> + 1)
		repeat ($freestyle_max_players)
	endif
endscript

script freestyle_game_player_intro_finish_anim 
	if NOT ($freestyle_game_mode = tutorial)
		counter = 0
		begin
		if NOT ($freestyle_player_data [<counter>].player_type = ai)
			formatText checksumName = mii_face_id 'freestyle_mii_face_%i' i = <counter>
			formatText checksumName = container_id 'freestyle_intro_player_container_%d' d = <counter>
			formatText checksumName = light_id 'controller_lights_%i' i = <counter>
			audio_effects_hud_id = ($freestyle_player_data [<counter>].audio_effects_hud_id)
			if <audio_effects_hud_id> :desc_resolvealias Name = alias_mii_face_container
				if ScreenElementExists id = <mii_face_id>
					GetScreenElementPosition id = <resolved_id> absolute
					screenelementpos = (<screenelementpos> + (32.0, 32.0))
					if (($freestyle_player_data [<counter>].lefty) = FALSE)
						<light_id> :se_setprops {
							rot_angle = 90
							Pos = ($freestyle_audio_effects_lights_pos_righty)
							time = 0.5
						}
					elseif (($freestyle_player_data [<counter>].lefty) = true)
						<light_id> :se_setprops {
							rot_angle = 90
							Pos = ($freestyle_audio_effects_lights_pos_lefty)
							time = 0.5
						}
					endif
					Wait \{0.5
						Seconds}
					<container_id> :se_setprops {
						Pos = <screenelementpos>
						Scale = (0.3, 0.3)
						time = 0.5
					}
				endif
			endif
		endif
		Wait \{0.5
			Seconds}
		counter = (<counter> + 1)
		repeat ($freestyle_max_players)
	endif
endscript

script freestyle_game_init_player_intros 
	if NOT ($freestyle_game_mode = tutorial)
		getmetronomelengthofbeat
		time = ((<length_of_beat> * ($freestyle_intro_countdown_beats) * 2) / 1000)
		Wait \{3.5
			Seconds}
		counter = 0
		begin
		if NOT ($freestyle_player_data [<counter>].player_type = ai)
			SpawnScriptNow freestyle_game_create_player_intro params = {Player = <counter> time = <time>}
		endif
		Wait \{0.5
			Seconds}
		counter = (<counter> + 1)
		repeat ($freestyle_max_players)
	endif
endscript

script freestyle_game_deinit_player_intros 
	KillSpawnedScript \{Name = freestyle_game_create_player_intro}
endscript
