freestyle_camera_types = [
	guitar_orbit
	guitar_zoom
	Guitar_CloseUp
	guitar_stage
	drums_orbit
	drums_zoom
	drums_closeup
	drums_stage
	bass_orbit
	bass_zoom
	bass_closeup
	bass_stage
	band_zoom
	band_wide
	band_stage
	band_orbit
	Intro
	outro
	menu
	tutorial
]
freestyle_filter_fx = [
	0
	1
	2
	9
	12
	13
	16
	42
	47
	51
	32
	22
]
freestyle_light_types = [
	red
	orange
	yellow
	green
	blue
	Purple
	blackout
	flare
	pyro
	strobe
	Intro
	outro
	tutorial
]
freestyle_spark_positions = [
	(1.546979, -0.21328902, 0.695842)
	(-7.031253, -0.65115505, 3.333598)
	(5.10278, -0.65115505, 3.50706)
	(-3.5445967, -0.21328902, 0.703654)
	(-1.119946, -0.6735461, 4.948049)
]
freestyle_auto_stage_show = FALSE
freestyle_stage_manager_name = qs(0x03ac90f0)
freestyle_stage_manager_ds = FALSE
freestyle_original_stage_manager_type = ai

script freestyle_enable_auto_stage_show 
	Change \{freestyle_auto_stage_show = true}
	freestyle_trigger_screenfx_event \{filter_index = 0}
endscript

script freestyle_disable_auto_stage_show 
	Change \{freestyle_auto_stage_show = FALSE}
endscript

script freestyle_trigger_camera_event 
	RequireParams \{[
			camera_type_index
			camera_index
		]}
	freestyle_get_camera_type_by_index camera_type_index = <camera_type_index>
	freestyle_change_camera camera_type = <camera_type> camera_index = <camera_index>
endscript

script freestyle_trigger_light_event 
	RequireParams \{[
			light_type_index
			light_index
		]
		all}
	freestyle_get_light_type_by_index light_type_index = <light_type_index>
	freestyle_play_specific_light light_type = <light_type> light_index = <light_index>
endscript

script freestyle_trigger_screenfx_event 
	RequireParams \{[
			filter_index
		]
		all}
	GetArraySize \{$freestyle_filter_fx}
	if ((<filter_index> >= 0) && (<filter_index> < <array_Size>))
		mode = ($freestyle_filter_fx [<filter_index>])
		setpostprocessmode mode = <mode>
	else
		ScriptAssert 'invalid filter index %i' i = <filter_index>
	endif
	freestylerecordscreenfxevent filter_index = <filter_index>
endscript

script freestyle_get_camera_type_by_index 
	RequireParams \{[
			camera_type_index
		]
		all}
	GetArraySize \{$freestyle_camera_types}
	camera_type = None
	if ((<camera_type_index> >= 0) && (<camera_type_index> < <array_Size>))
		<camera_type> = ($freestyle_camera_types [<camera_type_index>])
	else
		ScriptAssert 'invalid camera type index %i' i = <camera_type_index>
	endif
	return camera_type = <camera_type>
endscript

script freestyle_find_camera_type_index 
	RequireParams \{[
			camera_type
		]
		all}
	GetArraySize \{$freestyle_camera_types}
	camera_type_index = -1
	index = 0
	begin
	if ($freestyle_camera_types [<index>] = <camera_type>)
		<camera_type_index> = <index>
		break
	endif
	<index> = (<index> + 1)
	repeat <array_Size>
	if (<camera_type_index> = -1)
		ScriptAssert 'unable to find index of camera type %c' c = <camera_type>
	endif
	return camera_type_index = <camera_type_index>
endscript

script freestyle_get_light_type_by_index 
	RequireParams \{[
			light_type_index
		]
		all}
	GetArraySize \{$freestyle_light_types}
	light_type = None
	if ((<light_type_index> >= 0) && (<light_type_index> < <array_Size>))
		<light_type> = ($freestyle_light_types [<light_type_index>])
	else
		ScriptAssert 'invalid light type index %i' i = <light_type_index>
	endif
	return light_type = <light_type>
endscript

script freestyle_find_light_type_index 
	RequireParams \{[
			light_type
		]
		all}
	GetArraySize \{$freestyle_light_types}
	light_type_index = -1
	index = 0
	begin
	if ($freestyle_light_types [<index>] = <light_type>)
		<light_type_index> = <index>
		break
	endif
	<index> = (<index> + 1)
	repeat <array_Size>
	if (<light_type_index> = -1)
		ScriptAssert 'unable to find index of light type %c' c = <light_type>
	endif
	return light_type_index = <light_type_index>
endscript

script freestyle_handle_one_measure_before_solo_end 
	Player = 0
	solo_count = 0
	begin
	if ($freestyle_player_data [<Player>].soloing = true)
		<solo_count> = (<solo_count> + 1)
	endif
	<Player> = (<Player> + 1)
	repeat $freestyle_max_players
	if ((<solo_count> = $freestyle_player_count) && ($freestyle_player_count > 1))
		freestyle_play_band_lights
	endif
endscript

script freestyle_handle_one_beat_before_solo_end 
	Player = 0
	solo_count = 0
	begin
	if ($freestyle_player_data [<Player>].soloing = true)
		<solo_count> = (<solo_count> + 1)
	endif
	<Player> = (<Player> + 1)
	repeat $freestyle_max_players
	if ((<solo_count> < $freestyle_player_count) || ($freestyle_player_count = 1))
		freestyle_play_solo_lights
	endif
endscript

script freestyle_start_pyro 
	GetUniqueCompositeobjectID \{preferredID = freestyle_pyro}
	CreateParticleSystem Name = <uniqueID> Pos = (0.035020802, 6.21265, -2.73485) params_Script = $gp_fx_freestyle_topsparks_waterfall_01 groupID = zoneparticles
	GetArraySize \{$freestyle_spark_positions}
	pyro = 0
	begin
	GetUniqueCompositeobjectID \{preferredID = freestyle_pyro}
	CreateParticleSystem Name = <uniqueID> Pos = ($freestyle_spark_positions [<pyro>]) params_Script = $gp_fx_freestyle_floorgerb_long_sparks_03 groupID = zoneparticles
	GetUniqueCompositeobjectID \{preferredID = freestyle_pyro}
	CreateParticleSystem Name = <uniqueID> Pos = ($freestyle_spark_positions [<pyro>]) params_Script = $gp_fx_freestyle_floorgerb_long_sparks_04 groupID = zoneparticles
	GetUniqueCompositeobjectID \{preferredID = freestyle_pyro}
	CreateParticleSystem Name = <uniqueID> Pos = ($freestyle_spark_positions [<pyro>]) params_Script = $gp_fx_freestyle_floorgerb_smallflashes_01 groupID = zoneparticles
	GetUniqueCompositeobjectID \{preferredID = freestyle_pyro}
	CreateParticleSystem Name = <uniqueID> Pos = ($freestyle_spark_positions [<pyro>]) params_Script = $gp_fx_freestyle_floorgerb_long_smoke_02 groupID = zoneparticles
	<pyro> = (<pyro> + 1)
	repeat <array_Size>
endscript

script freestyle_stop_pyro 
	DestroyParticlesByGroupID \{groupID = zoneparticles
		ifEmpty = 1}
endscript

script freestyle_start_tutorial_stage_show 
	freestyle_choose_next_camera_index \{camera_type = tutorial}
	freestyle_change_camera camera_type = tutorial camera_index = <chosen_index>
	freestyle_choose_next_light_index \{light_type = tutorial}
	freestyle_play_specific_light light_type = tutorial light_index = <next_light_index>
endscript
