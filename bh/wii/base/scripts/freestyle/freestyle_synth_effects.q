freestyle_synth_effects = [
]
freestyle_reverb_props = {
}

script freestyle_setup_reverb 
	if StructureContains structure = ($freestyle_reverb_props) disable_reverb
		disableglobalreverb
	else
		enableglobalreverb \{$freestyle_reverb_props}
	endif
endscript

script freestyle_create_synth_effects 
	i = 0
	GetArraySize \{$freestyle_synth_effects}
	begin
	createsyntheffect ($freestyle_synth_effects [<i>])
	<i> = (<i> + 1)
	repeat <array_Size>
	Player = 0
	begin
	freestyle_set_player_param Player = <Player> param = synth_effect value = None
	<Player> = (<Player> + 1)
	repeat $freestyle_max_players
endscript

script freestyle_change_synth_effect 
	RequireParams \{[
			Player
			effect_id
		]
		all}
	old_effect_id = ($freestyle_player_data [<Player>].synth_effect)
	if (<old_effect_id> != <effect_id>)
		if (<old_effect_id> != None)
			printf 'Detaching effect %a from player %b' a = <old_effect_id> b = <Player>
			detachsyntheffect Player = <Player> effect_id = <old_effect_id>
		endif
		if (<effect_id> != None)
			printf 'Attaching effect %a to player %b' a = <effect_id> b = <Player>
			attachsyntheffect Player = <Player> effect_id = <effect_id>
		endif
		setstructureparam array_name = freestyle_player_data array_index = <Player> param = synth_effect value = <effect_id>
		freestyle_hint_notify_audio_effect_changed Player = <Player>
		freestyle_update_audio_effects_hud_guitar Player = <Player>
	endif
endscript

script freestyle_setup_synth_effects_by_style 
	Change freestyle_synth_effects = ($freestyle_current_style_settings.synth_effects)
	Change freestyle_reverb_props = ($freestyle_current_style_settings.reverb_props)
endscript

script freestyle_set_synth_effect_by_direction 
	RequireParams \{[
			Player
			direction
		]
		all}
	freestyle_get_player_param Player = <Player> param = instrument
	switch (<direction>)
		case up
		effect_id = None
		case right
		effect_id = flange
		case down
		effect_id = echo
		case left
		if (<instrument> = bass)
			effect_id = wah_bass
		else
			effect_id = wah_guitar
		endif
		default
		ScriptAssert 'unhandled direction %d' d = <direction>
		effect_id = None
	endswitch
	freestyle_change_synth_effect Player = <Player> effect_id = <effect_id>
endscript
