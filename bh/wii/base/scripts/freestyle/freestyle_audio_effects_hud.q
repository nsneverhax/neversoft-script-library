freestyle_audio_effects_dpad_pos_righty = (-7.0, 1.0)
freestyle_audio_effects_text_pos_righty = (80.0, -2.0)
freestyle_audio_effects_lights_pos_righty = (128.0, 0.0)
freestyle_audio_effects_mii_pos_righty = (0.0, 0.0)
freestyle_audio_effects_dpad_pos_lefty = (-7.0, 1.0)
freestyle_audio_effects_text_pos_lefty = (-92.0, -2.0)
freestyle_audio_effects_lights_pos_lefty = (-128.0, 0.0)
freestyle_audio_effects_mii_pos_lefty = (0.0, 0.0)
freestyle_audio_effects_animation_offset = (0.0, 10.0)
freestyle_audio_effects_animation_frequency = 1.0

script freestyle_game_init_audio_effects_hud 
	RequireParams \{[
			Player
		]
		all}
	if ScreenElementExists \{id = freestyle_root}
		freestyle_get_position_on_highway_for_player Player = <Player>
		position = (<position> + (10.0, -300.0))
		formatText checksumName = desc_id 'freestyle_audio_effects_hud_%d' d = <Player>
		freestyle_set_player_param Player = <Player> param = audio_effects_hud_id value = <desc_id>
		CreateScreenElement {
			dims = (344.0, 144.0)
			parent = freestyle_hud
			id = <desc_id>
			Type = descinterface
			Pos = <position>
			desc = 'freestyle_audio_effects_hud'
			z_priority = 5
			font = fontgrid_text_a1
		}
		if (($freestyle_player_data [<Player>].lefty) = true)
			<desc_id> :se_setprops {
				mii_face_pos = (58.0, 0.0)
				text_pos = ($freestyle_audio_effects_text_pos_lefty)
				text_internal_just = [right center]
			}
		endif
		if NOT (($freestyle_player_data [<Player>].instrument) = drums)
			freestyle_update_audio_effects_hud_guitar Player = <Player>
		else
			freestyle_update_audio_effects_hud_drum Player = <Player>
		endif
		if (($freestyle_game_mode) = tutorial)
			<desc_id> :desc_resolvealias Name = alias_mii_face_container
			mii_index = ($freestyle_player_data [<Player>].mii_index)
			mii_database = ($freestyle_player_data [<Player>].mii_database)
			CreateScreenElement {
				Type = miiiconelement
				parent = <resolved_id>
				just = [center center]
				Pos = (32.0, 32.0)
				z_priority = 30
				mii_expression = Normal
				mii_bgcolor = $freestyle_mii_on_bg
				mii_dims = (256.0, 256.0)
				mii_index = <mii_index>
				mii_database = <mii_database>
				Scale = (0.3, 0.3)
				alpha = 1
			}
			device_num = ($freestyle_player_data [<Player>].controller)
			freestyle_spawn_controller_lights {
				parent = <id>
				Player = <Player>
				controller = <device_num>
				state = freestyle_player_intro_hud
			}
			formatText checksumName = light_id 'controller_lights_%i' i = <Player>
			if (($freestyle_player_data [<Player>].lefty) = FALSE)
				<light_id> :se_setprops {
					rot_angle = 90
					Pos = ($freestyle_audio_effects_lights_pos_righty)
				}
			else
				<light_id> :se_setprops {
					rot_angle = 90
					Pos = ($freestyle_audio_effects_lights_pos_lefty)
				}
			endif
		endif
	endif
endscript

script freestyle_game_audio_effects_hud_init_all 
	counter = 0
	begin
	if NOT ($freestyle_player_data [<counter>].player_type = ai)
		freestyle_game_init_audio_effects_hud Player = <counter>
	endif
	counter = (<counter> + 1)
	repeat ($freestyle_max_players)
endscript

script freestyle_update_audio_effects_hud_guitar 
	RequireParams \{[
			Player
		]
		all}
	if StructureContains structure = ($freestyle_player_data [<Player>]) audio_effects_hud_id
		freestyle_get_player_param Player = <Player> param = synth_effect
		freestyle_get_player_param Player = <Player> param = audio_effects_hud_id
	else
		return
	endif
	if NOT ScreenElementExists id = <audio_effects_hud_id>
		return
	endif
	switch (<synth_effect>)
		case echo
		text = qs(0x84adb4eb)
		button = `dpad-down`
		case wah_guitar
		case wah_bass
		text = qs(0x327739be)
		button = `dpad-left`
		case flange
		text = qs(0x7bcebeaf)
		button = `dpad-right`
		case None
		text = qs(0x19cfa723)
		button = `dpad-up`
		default
		ScriptAssert 'unhandled audio effect id %e' e = <effect_id>
		text = qs(0xb8932c1b)
		button = qs(0x33864e0b)
	endswitch
	<audio_effects_hud_id> :se_setprops {
		text = <text>
		button = <button>
	}
endscript

script freestyle_update_audio_effects_hud_drum 
	RequireParams \{[
			Player
		]
		all}
	if StructureContains structure = ($freestyle_player_data [<Player>]) audio_effects_hud_id
		freestyle_get_player_param Player = <Player> param = hat_mode
		freestyle_get_player_param Player = <Player> param = audio_effects_hud_id
	else
		return
	endif
	if NOT ScreenElementExists id = <audio_effects_hud_id>
		return
	endif
	switch (<hat_mode>)
		case hi_hat_open
		button = `dpad-down`
		text = qs(0x907fac94)
		case hi_hat_closed
		button = `dpad-up`
		text = qs(0x11b3ea96)
		case cowbell
		button = `dpad-right`
		text = ($freestyle_current_style_settings.cowbell_name)
		case ride
		button = `dpad-left`
		text = qs(0x0eeb7509)
	endswitch
	<audio_effects_hud_id> :se_setprops {
		text = <text>
		button = <button>
	}
endscript

script freestyle_animate_audio_effects_hud 
	RequireParams \{[
			Player
		]
		all}
	formatText checksumName = mii_face_id 'freestyle_mii_face_%i' i = <Player>
	formatText checksumName = light_id 'controller_lights_%i' i = <Player>
	freestyle_get_player_param Player = <Player> param = audio_effects_hud_id
	if ScreenElementExists id = <audio_effects_hud_id>
		<audio_effects_hud_id> :desc_resolvealias Name = alias_dpad_sprite
		dpad_id = <resolved_id>
		<audio_effects_hud_id> :desc_resolvealias Name = alias_text
		text_id = <resolved_id>
	endif
	begin
	if (($freestyle_player_data [<Player>].lefty) = FALSE)
		if ScreenElementExists id = <mii_face_id>
			<mii_face_id> :Obj_SpawnScriptNow freestyle_simple_position_tween params = {orig_pos = ($freestyle_audio_effects_mii_pos_righty) new_pos = (($freestyle_audio_effects_mii_pos_righty) + ($freestyle_audio_effects_animation_offset)) time = ($freestyle_audio_effects_animation_frequency)}
			Wait (($freestyle_audio_effects_animation_frequency) / 4) Seconds
		endif
		if ScreenElementExists id = <light_id>
			<light_id> :Obj_SpawnScriptNow freestyle_simple_position_tween params = {orig_pos = ($freestyle_audio_effects_lights_pos_righty) new_pos = (($freestyle_audio_effects_lights_pos_righty) + ($freestyle_audio_effects_animation_offset)) time = ($freestyle_audio_effects_animation_frequency)}
			Wait (($freestyle_audio_effects_animation_frequency) / 4) Seconds
		endif
		if ScreenElementExists id = <dpad_id>
			<dpad_id> :Obj_SpawnScriptNow freestyle_simple_position_tween params = {orig_pos = ($freestyle_audio_effects_dpad_pos_righty) new_pos = (($freestyle_audio_effects_dpad_pos_righty) + ($freestyle_audio_effects_animation_offset)) time = ($freestyle_audio_effects_animation_frequency)}
			Wait (($freestyle_audio_effects_animation_frequency) / 4) Seconds
		endif
		if ScreenElementExists id = <text_id>
			<text_id> :Obj_SpawnScriptNow freestyle_simple_position_tween params = {orig_pos = ($freestyle_audio_effects_text_pos_righty) new_pos = (($freestyle_audio_effects_text_pos_righty) + ($freestyle_audio_effects_animation_offset)) time = ($freestyle_audio_effects_animation_frequency)}
			Wait (($freestyle_audio_effects_animation_frequency) / 4) Seconds
		endif
	elseif (($freestyle_player_data [<Player>].lefty) = true)
		if ScreenElementExists id = <text_id>
			<text_id> :Obj_SpawnScriptNow freestyle_simple_position_tween params = {orig_pos = ($freestyle_audio_effects_text_pos_lefty) new_pos = (($freestyle_audio_effects_text_pos_lefty) + ($freestyle_audio_effects_animation_offset)) time = ($freestyle_audio_effects_animation_frequency)}
			Wait (($freestyle_audio_effects_animation_frequency) / 4) Seconds
		endif
		if ScreenElementExists id = <dpad_id>
			<dpad_id> :Obj_SpawnScriptNow freestyle_simple_position_tween params = {orig_pos = ($freestyle_audio_effects_dpad_pos_lefty) new_pos = (($freestyle_audio_effects_dpad_pos_lefty) + ($freestyle_audio_effects_animation_offset)) time = ($freestyle_audio_effects_animation_frequency)}
			Wait (($freestyle_audio_effects_animation_frequency) / 4) Seconds
		endif
		if ScreenElementExists id = <light_id>
			<light_id> :Obj_SpawnScriptNow freestyle_simple_position_tween params = {orig_pos = ($freestyle_audio_effects_lights_pos_lefty) new_pos = (($freestyle_audio_effects_lights_pos_lefty) + ($freestyle_audio_effects_animation_offset)) time = ($freestyle_audio_effects_animation_frequency)}
			Wait (($freestyle_audio_effects_animation_frequency) / 4) Seconds
		endif
		if ScreenElementExists id = <mii_face_id>
			<mii_face_id> :Obj_SpawnScriptNow freestyle_simple_position_tween params = {orig_pos = ($freestyle_audio_effects_mii_pos_lefty) new_pos = (($freestyle_audio_effects_mii_pos_lefty) + ($freestyle_audio_effects_animation_offset)) time = ($freestyle_audio_effects_animation_frequency)}
			Wait (($freestyle_audio_effects_animation_frequency) / 4) Seconds
		endif
	endif
	repeat
endscript

script freestyle_audio_effect_hud_reset_position 
	RequireParams \{[
			Player
		]
		all}
	formatText checksumName = mii_face_id 'freestyle_mii_face_%i' i = <Player>
	formatText checksumName = light_id 'controller_lights_%i' i = <Player>
	freestyle_get_player_param Player = <Player> param = audio_effects_hud_id
	if ScreenElementExists id = <audio_effects_hud_id>
		<audio_effects_hud_id> :desc_resolvealias Name = alias_dpad_sprite
		dpad_id = <resolved_id>
		<audio_effects_hud_id> :desc_resolvealias Name = alias_text
		text_id = <resolved_id>
	endif
	if (($freestyle_player_data [<Player>].lefty) = FALSE)
		if ScreenElementExists id = <mii_face_id>
			<mii_face_id> :se_setprops {
				Pos = ($freestyle_audio_effects_mii_pos_righty)
			}
		endif
		if ScreenElementExists id = <light_id>
			<light_id> :se_setprops {
				Pos = ($freestyle_audio_effects_lights_pos_righty)
			}
		endif
		if ScreenElementExists id = <dpad_id>
			<dpad_id> :se_setprops {
				Pos = ($freestyle_audio_effects_dpad_pos_righty)
			}
		endif
		if ScreenElementExists id = <text_id>
			<text_id> :se_setprops {
				Pos = ($freestyle_audio_effects_text_pos_righty)
			}
		endif
	elseif (($freestyle_player_data [<Player>].lefty) = true)
		if ScreenElementExists id = <mii_face_id>
			<mii_face_id> :se_setprops {
				Pos = ($freestyle_audio_effects_mii_pos_lefty)
			}
		endif
		if ScreenElementExists id = <light_id>
			<light_id> :se_setprops {
				Pos = ($freestyle_audio_effects_lights_pos_lefty)
			}
		endif
		if ScreenElementExists id = <dpad_id>
			<dpad_id> :se_setprops {
				Pos = ($freestyle_audio_effects_dpad_pos_lefty)
			}
		endif
		if ScreenElementExists id = <text_id>
			<text_id> :se_setprops {
				Pos = ($freestyle_audio_effects_text_pos_lefty)
			}
		endif
	endif
endscript

script freestyle_simple_position_tween 
	RequireParams \{[
			orig_pos
			new_pos
			time
		]
		all}
	Obj_GetID
	<objID> :se_setprops {
		Pos = <new_pos>
		time = (<time> / 2)
	}
	Wait (<time> / 2) Seconds
	<objID> :se_setprops {
		Pos = <orig_pos>
		time = (<time> / 2)
	}
endscript
