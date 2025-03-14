
script Interact_PlayWeightedAnimAndBlock num_repeats = 1
	begin
	getarraysize weighted_anims
	<index> = 0
	<total_weight> = 0
	begin
	<total_weight> = (<total_weight> + (<weighted_anims> [<index>].weight))
	<index> = (<index> + 1)
	repeat <array_size>
	getrandomvalue name = value integer a = 0 b = <total_weight>
	<index> = -1
	<total_weight> = 0
	begin
	<index> = (<index> + 1)
	<total_weight> = (<total_weight> + (<weighted_anims> [<index>].weight))
	if (<total_weight> > <value>)
		break
	endif
	repeat <array_size>
	Interact_PlayAnimAndBlock (<weighted_anims> [<index>])
	repeat <num_repeats>
endscript

script Interact_MoveTo path_segment = false
	interact_getcurnode
	if (<cur_node> = invalid_node_name)
		behavior_printallhierarchies
		printf "Interact node is invalid in Interact_MoveTo - see above for hierarchy"
		return
	endif
	if (<path_segment> = true)
		ai_giveorder name = Bv_InteractNode_MoveTo params = {<...> movement_desc = {arrival_distance = 0.8 stop_distance = 0.0 <movement_desc>} offset_movement_desc = {arrival_distance = 0.8 stop_distance = 0.8 <movement_desc>}}
	else
		ai_giveorder name = Bv_InteractNode_MoveTo params = {<...> movement_desc = {arrival_distance = 0.3 stop_distance = 0.2 <movement_desc>} offset_movement_desc = {arrival_distance = 0.8 stop_distance = 0.8 <movement_desc>}}
	endif
endscript

script Interact_MoveToAndBlock path_segment = false
	interact_getcurnode
	if (<cur_node> = invalid_node_name)
		behavior_printallhierarchies
		printf "Interact node is invalid in Interact_MoveTo - see above for hierarchy"
		return
	endif
	if NOT gotparam lock
		printstruct <...>
		softassert "Interact_MoveTo cannot find parameter 'lock'"
	endif
	if NOT gotparam align
		printstruct <...>
		softassert "Interact_MoveTo cannot find parameter 'align'"
	endif
	if (<path_segment> = true)
		ai_giveorder name = Bv_InteractNode_MoveTo params = {<...> movement_desc = {arrival_distance = 1.0 stop_distance = 0.0 <movement_desc>} offset_movement_desc = {arrival_distance = 0.8 stop_distance = 0.8 <movement_desc>}}
	else
		ai_giveorder name = Bv_InteractNode_MoveTo params = {<...> movement_desc = {arrival_distance = 0.3 stop_distance = 0.2 <movement_desc>} offset_movement_desc = {arrival_distance = 0.8 stop_distance = 0.8 <movement_desc>}}
	endif
	blockuntilevent anytypes = [path_blocked Move_Finished]
	switch <type>
		case path_blocked
		printf "Anim script is aborting! Path is blocked."
		eventcache_add event_id = AnimScript_Finished
		block
		case Move_Finished
		if ((<lock> = true) || (<lock> = arrival_only))
			if (<path_segment> = true)
				ai_giveorder name = Bv_InteractNode_SlideTo params = {align = <align> speed = 3.0 path_segment = true traverse_all = true
					movement_desc = {arrival_distance = 0.6 stop_distance = 0.0 <movement_desc>}
					finished_event_id = SlideToAndAlign_Finished}
			else
				ai_giveorder name = Bv_InteractNode_SlideTo params = {align = <align> speed = 3.0 path_segment = false traverse_all = true
					movement_desc = {arrival_distance = 0.3 stop_distance = 0.2 <movement_desc>}}
			endif
			blockuntilevent anytypes = [slide_blocked SlideToAndAlign_Finished SlideTo_Finished]
			if (<type> = slide_blocked)
				printf "Anim script is aborting! Slide path is blocked."
				eventcache_add event_id = AnimScript_Finished
				block
			endif
			if (<lock> = arrival_only)
				ai_giveorder name = bv_blank
			endif
		else
			if (<align> = true)
				if NOT (<path_segment> = true)
					ai_giveorder name = Bv_InteractNode_AlignTo
					blockuntilevent anytypes = [AlignTo_Finished]
				endif
			endif
		endif
	endswitch
endscript

script Interact_PlayAnim reaction_state = normal
	if NOT gotparam blend_period
		if NOT gotparam blend_in_period
			blend_period = 0.0
		endif
	endif
	eventcache_add event_id = Set_Reaction_State event_data = {state = <reaction_state>}
	if gotparam exit_anim
		eventcache_add event_id = Set_Exit_Anim event_data = {anim = <exit_anim>}
	else
		eventcache_add event_id = Clear_Exit_Anim
	endif
	settags lastanim = <anim>
	obj_getassetcontext
	if NOT anim_animexists anim = <anim> asset_context = <asset_context>
		getsingletag scene_name
		interact_getcurnode
		printf "===================="
		printf "FAILED TO FIND ANIMATION IN AN ANIM SCRIPT"
		printf "IMPORTANT DEBUG INFORMATION FOLLOWS:"
		printf "******"
		printf "Anim: %a" a = <anim>
		printf "Ped Asset Context: %a" a = <asset_context>
		printf "Current Interaction Node: %a" a = <cur_node>
		if gotparam scene_name
			printf "Scene Name: %a" a = <scene_name>
			getpakmancurrent map = scenes
			printf "Current Scene Pak: %a" a = <pak>
		else
			printf "Not Part of a Scene."
		endif
		printf "===================="
		softassert "Failed to find anim %a in an anim script.  See output above assert for more info." a = <anim>
	endif
	if interact_isusingstartnode
		if NOT getsingletag first_anim_finished
			if gotparam blend_period
				<blend_out_period> = <blend_period>
				removeparameter blend_period
			endif
			<blend_in_period> = 0.0
			settags first_anim_finished = 1
		endif
	endif
	agent_playcustomanim {anim = <anim>
		blend_period = <blend_period>
		blend_in_period = <blend_in_period>
		blend_out_period = <blend_out_period>
		start_frame_factor = <start_frame_factor>
		pause_movement = <pause_movement>
		motion_extract = <motion_extract>
		finished_event_id = AnimScriptAnim_Finished
		interrupt_event_id = AnimScriptAnim_Interrupted
		play_mode = <play_mode>}
endscript

script Interact_PlayAnimAndBlock \{return_to_node = false}
	Interact_PlayAnim <...>
	blockuntilevent \{type = AnimScriptAnim_Finished}
	if (<return_to_node> = true)
		ai_giveorder \{name = Bv_InteractNode_SlideTo
			params = {
				align = true
				traverse_all = true
			}}
		blockuntilevent \{anytypes = [
				slide_blocked
				SlideToAndAlign_Finished
			]}
	endif
endscript

script Interact_DummyEnablePush 
	Navigation_SceneResumeMovement
	locator_setfootprint \{$nav_dummy_pushable}
	ai_giveorder \{replacement = AmbientDistanceWatch
		name = Bv_GenEvents_Distance
		params = {
			interest_type_id = interact
			greater_than = BecomeAmbient
			distance = 0.4
		}}
endscript

script Interact_DummyDisablePush 
	Navigation_ScenePauseMovement
	locator_setfootprint \{$nav_dummy}
	ai_giveorder \{replacement = AmbientDistanceWatch
		name = bv_blank}
endscript

script Interact_EnterSkaterScene 
	locator_settraveler \{traveler = TERRAIN_SKATER_URGENT}
	aligntoground_setenabled \{false}
	navcollision_enablecollidewalls \{off}
	Navigation_DisableAvoidance
	Navigation_GetSteeringObjId
	obj_getid
	if NOT (<objid> = <steering_obj_id>)
		<steering_obj_id> :aligntoground_setenabled false
		<steering_obj_id> :Navigation_PauseStickToGround
	endif
endscript

script Interact_ExitSkaterScene 
	locator_settraveler \{traveler = terrain_skater_trivial}
	aligntoground_setenabled \{true}
	navcollision_enablecollidewalls \{on}
	Navigation_EnableAvoidance
	Navigation_GetSteeringObjId
	obj_getid
	if NOT (<objid> = <steering_obj_id>)
		<steering_obj_id> :aligntoground_setenabled true
		<steering_obj_id> :Navigation_ResumeStickToGround
	endif
endscript
