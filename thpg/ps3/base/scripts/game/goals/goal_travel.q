goal_travel_active = 0
goal_travel_screen_effects = [
]
goal_travel_reset_walk_flag = 0

script goal_travel_enter 
	printf \{'goal_travel_enter'}
	change \{goal_travel_active = 1}
	change \{Bails_Disabled = 1}
	change \{ntt_ragdoll_bails = 0}
	skater :disableturning
	hide_panel_stuff
	goal_kill_all_peds ignore_goal = <goal_id>
	if getglobalflag \{flag = $FLAG_EXPERT_MODE_NO_WALKING}
		change \{goal_travel_reset_walk_flag = 0}
	else
		setglobalflag \{flag = $FLAG_EXPERT_MODE_NO_WALKING}
		change \{goal_travel_reset_walk_flag = 1}
	endif
	spawnscriptlater goal_travel_enter_spawned params = {<...>}
endscript

script goal_travel_enter_spawned 
	wait 2 gameframes
	MakeSkaterGoto ongroundai
	if gotparam skaters
		getarraysize skaters
		if (<array_size> > 0)
			<index> = 0
			begin
			((<skaters> [<index>]).id) :agent_setinterest interest_type_id = interact waypoint = ((<skaters> [<index>]).waypoint) acquire_vis_loc = false
			((<skaters> [<index>]).id) :ai_giveorder name = Bv_FixedPathSkaterPed
			repeat <array_size>
		endif
	endif
	wait 2 gameframes
	MakeSkaterGoto ongroundai
endscript

script goal_travel_exit 
	printf 'goal_travel_exit'
	change goal_travel_active = 0
	change Bails_Disabled = 0
	change ntt_ragdoll_bails = 1
	skater :enableturning
	killskatercamanim all
	goal_travel_manage_effects
	show_panel_stuff
	goal_restore_all_peds ignore_goal = <goal_id>
	setslomo 1.0
	goal_presentation_description_kill_text
	if ($goal_travel_reset_walk_flag = 1)
		unsetglobalflag flag = $FLAG_EXPERT_MODE_NO_WALKING
		change goal_travel_reset_walk_flag = 0
	endif
	if (($goal_presentation_sound_buss_set_active) = 1)
		change goal_presentation_sound_buss_set_active = 0
		popsoundbussparams
	endif
endscript

script goal_travel_at_next_waypoint 
	printf 'goal_travel_at_next_waypoint'
	printstruct <...>
	if gotparam waypoint_script
		<waypoint_script> <waypoint_params> s
	endif
	if gotparam text
		goal_presentation_description_kill_text
		if NOT (<text> = "")
			goal_presentation_description_text text = <text>
		endif
	endif
	if gotparam effects
		goal_travel_manage_effects effects = <effects>
	endif
	if gotparam sound_event
		printf "GOT SOUND EVENT"
		if NOT (($goal_presentation_sound_buss_set_active) = 1)
			pushsoundbussparams
			setsoundbussparams $Generic_IGC_BussSet time = 0.1
			change goal_presentation_sound_buss_set_active = 1
		endif
		printf "PLAYING SOUND EVENT"
		soundevent event = <sound_event>
	endif
	spawnscriptlater goal_travel_move_to_next_waypoint params = {<...>}
endscript

script goal_travel_move_to_next_waypoint 
	printf 'goal_travel_tell_code_move_to_next'
	GMan_travelFunc goal = <goal_id> tool = <tool_id> func = move_to_next_waypoint
	if gotparam morph
		if skatercamanimfinished name = goal_travel_cam
			playigccam {
				name = goal_travel_cam
				controlscript = goal_travel_cam_control
				params = {
					event_data = {
						morph = <morph>
					}
				}
			}
		else
			launchevent {
				broadcast
				type = goal_travel_cam_new_morph
				data = {
					morph = <morph>
				}
			}
		endif
	endif
endscript

script goal_travel_cam_control 
	printf \{'goal_travel_cam_control'}
	begin
	ccam_domorph (<event_data>.morph)
	if structurecontains structure = (<event_data>.morph) orbit_speed
		ccam_orbit on speed = <orbit_speed>
	endif
	removecomponent \{event_data}
	block \{untilevent = goal_travel_cam_new_morph}
	repeat
endscript

script goal_travel_manage_effects 
	printf 'goal_travel_manage_effects'
	getarraysize $goal_travel_screen_effects
	if (<array_size> > 0)
		<index> = 0
		begin
		if screenfx_fxinstanceexists viewport = 0 name = ((($goal_travel_screen_effects) [<index>]).name)
			screenfx_removefxinstance viewport = 0 name = ((($goal_travel_screen_effects) [<index>]).name)
		endif
		<index> = (<index> + 1)
		repeat <array_size>
		change goal_travel_screen_effects = []
	endif
	if gotparam effects
		getarraysize effects
		if (<array_size> > 0)
			<index> = 0
			begin
			screenfx_addfxinstance (<effects> [<index>])
			<temp_array> = [{}]
			setarrayelement arrayname = temp_array index = 0 newvalue = (<effects> [<index>])
			change goal_travel_screen_effects = (($goal_travel_screen_effects) + <temp_array>)
			<index> = (<index> + 1)
			repeat <array_size>
		endif
	endif
endscript

script goal_travel_create_next_waypoint 
	printf 'goal_travel_create_next_waypoint'
	if gotparam previous_waypoint
		kill name = <previous_waypoint>
	endif
	create name = <waypoint>
	runscriptonobject {
		id = <waypoint>
		goal_travel_init_next_waypoint
		params = {
			goal_id = <goal_id>
			tool_id = <tool_id>
			waypoint = <waypoint>
			radius = <radius>
			waypoint_script = <waypoint_script>
			waypoint_params = <waypoint_params>
			morph = <morph>
			text = <text>
			effects = <effects>
			sound_event = <sound_event>
		}
	}
endscript

script goal_travel_init_next_waypoint radius = 2
	printf 'goal_travel_init_next_waypoint'
	obj_setinnerradius <radius>
	seteventhandler {
		event = anyobjectinradius
		scr = goal_travel_in_next_waypoint_radius
		response = switch_script
		params = {
			goal_id = <goal_id>
			tool_id = <tool_id>
			waypoint = <waypoint>
			radius = <radius>
			waypoint_script = <waypoint_script>
			waypoint_params = <waypoint_params>
			morph = <morph>
			text = <text>
			effects = <effects>
			sound_event = <sound_event>
		}
	}
endscript

script goal_travel_in_next_waypoint_radius 
	printf \{'goal_travel_in_next_waypoint_radius'}
	cleareventhandlergroup \{`default`}
	spawnscriptnow {
		goal_travel_at_next_waypoint
		params = {
			goal_id = <goal_id>
			tool_id = <tool_id>
			waypoint = <waypoint>
			radius = <radius>
			waypoint_script = <waypoint_script>
			waypoint_params = <waypoint_params>
			morph = <morph>
			text = <text>
			effects = <effects>
			sound_event = <sound_event>
		}
	}
endscript

script goal_travel_skater_state_changed 
	if (<stateevent> = SkaterEnterRail)
		MakeSkaterGoto \{ongroundai}
	endif
endscript

script goal_travel_print_effects 
	printf \{'goal_travel_print_effects'}
	<test> = ($goal_travel_screen_effects)
	printstruct <...>
endscript
