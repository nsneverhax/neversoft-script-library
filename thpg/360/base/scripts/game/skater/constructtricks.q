
script cap_test_callback_begin_contact 
	setobjectcolor name = <node> color = 8421376
endscript

script cap_test_callback_end_contact 
	setobjectcolor name = <node> color = 8421505
endscript

script cap_test_selection_confirmed 
	groundcollisioncallback_getcurrentcontactnode
	printscriptinfo \{""}
	dump
endscript

script cap_allow_rigger_mode_entry 
	if ($cap_allow = 0)
		return false
	elseif NOT skaterprofile_isabilityactive ability = rigger_mode
		return false
	elseif export_isrecording
		return false
	elseif export_hasdata
		return false
	elseif insplitscreengame
		return false
	elseif ($goal_photo_in_target = true)
		return false
	elseif ($goal_photo_skater_adjusting_cam = 1)
		return false
	else
		if gman_getactivatedgoalid
			switch <activated_goal_id>
				case m_c2_localcomp
				case m_c2_compvert
				case m_cu
				case m_h2_boneless
				case m_h2_learncheck
				case m_h2_takefdr
				case m_h2_clearmuseums
				case m_h2_bossbattle
				case m_h3_bowlcomp
				case m_r2_breakin
				case m_impress_h2
				case m_photo_check_fdr
				case m_photo_check_bell
				case m_photo_check_monuments
				case m_photo_check_pb_bridge
				case m_film_push_love
				case m_film_push_harbor
				return false
			endswitch
		endif
	endif
	return true
endscript

script cap_is_valid_category_rigger \{do_goal_check = true}
	if NOT ($cap_mode = rigger)
		return \{false}
	endif
	if (<do_goal_check> = true)
		if gman_getactivatedgoalid
			switch <activated_goal_id>
				case m_r3_museums
				case m_r3_monuments
				case m_r3_harbor
				case m_r3_slums
				case m_r3_love
				case m_r3_bell
				return \{false}
			endswitch
		endif
	endif
	return \{true}
endscript

script cap_is_valid_category_wrench 
	if skater :skaterprofile_isabilityactive \{ability = rigger_wrench}
		if cap_is_valid_category_rigger \{do_goal_check = false}
			return \{true}
		endif
	endif
	return \{false}
endscript

script cap_is_valid_category_camera 
	if skater :skaterprofile_isabilityactive \{ability = rigger_camera}
		if gman_getactivatedgoalid
			switch <activated_goal_id>
				case m_c3_epicphoto1
				case m_c3_epicphoto3
				return \{true}
				default
				return \{false}
			endswitch
		elseif cap_is_valid_category_rigger
			return \{true}
		endif
	endif
	return \{false}
endscript

script cap_allow_grab_delete_camera 
	if gman_getactivatedgoalid
		if ((<constructtype> = special) && (<constructindex> = 0))
			switch <activated_goal_id>
				case m_c3_epicphoto1
				case m_c3_epicphoto3
				return \{true}
				default
				return \{false}
			endswitch
		endif
		return \{true}
	endif
	return \{true}
endscript

script cap_is_valid_category_crib 
	if NOT IsInCrib
		return \{false}
	endif
	if gman_getactivatedgoalid
		return \{false}
	endif
	return \{true}
endscript

script cap_is_valid_category_crib_game_pieces 
	if NOT IsInCrib
		return \{false}
	endif
	if gman_getactivatedgoalid
		return \{false}
	endif
	return \{true}
endscript

script cap_is_valid_category_goal 
	return \{false}
endscript

script cap_is_valid_category_net_goal_layout 
	if NOT ($cap_mode = GOAL_CREATION)
		return \{false}
	endif
	return \{true}
endscript

script cap_is_valid_rigger_piece_unlocked 
	if getglobalflag \{flag = $CHEAT_UNLOCKED_ALL_RIG_PIECES}
		return \{true}
	endif
	if careerfunc func = isriggerpieceavailable params = {name = ($ConstructionTypes.<category> [<index>].name)}
		return \{true}
	else
		return \{false}
	endif
endscript

script cap_is_valid_crib_piece_available 
	if getglobalflag \{flag = $CHEAT_UNLOCKED_ALL_CRIB_PIECES}
		return \{true}
	endif
	if checksumequals a = ($ConstructionTypes.<category> [<index>].name) b = crib_wrigley
		if getglobalflag \{flag = $CHEAT_UNLOCKED_WRIGLEYS_VENDING_MACHINE}
			return \{true}
		else
			return \{false}
		endif
	endif
	if careerfunc func = iscribpieceavailable params = {name = (($ConstructionTypes.<category> [<index>].name))}
		return \{true}
	endif
	return \{false}
endscript

script Enter_CAP_mode forced_categories = [] mode = rigger
	pauseskaters
	change cap_mode = <mode>
	if gotparam category
		SetCapCurrentCategory category = <category>
	endif
	getarraysize $cap_categories
	cap_get_category_index category = ($cap_current_category)
	starting_category_index = <index>
	change cap_forced_categories = <forced_categories>
	begin
	if cap_is_valid_category category = <starting_category_index>
		break
	endif
	starting_category_index = (<starting_category_index> + 1)
	if (<starting_category_index> = <array_size>)
		starting_category_index = 0
	endif
	repeat <array_size>
	if NOT cap_is_valid_category category = <starting_category_index>
		scriptassert 'No Valid Category'
	endif
	change cap_current_category = ($cap_categories [<starting_category_index>].name)
	change cap_current_category_index = <starting_category_index>
	getarraysize ($ConstructionTypes.($cap_current_category))
	starting_piece_type_index = ($cap_current_index)
	if (<starting_piece_type_index> >= <array_size>)
		starting_piece_type_index = 0
	endif
	begin
	if cap_is_valid_piece_type category = ($cap_current_category) index = <starting_piece_type_index>
		break
	endif
	starting_piece_type_index = (<starting_piece_type_index> + 1)
	if (<starting_piece_type_index> = <array_size>)
		starting_piece_type_index = 0
	endif
	repeat <array_size>
	if NOT cap_is_valid_piece_type category = ($cap_current_category) index = <starting_piece_type_index>
		scriptassert 'No Valid Piece in Category %s' s = ($cap_current_category)
	endif
	change cap_current_index = <starting_piece_type_index>
	Init_Cursor constructtype = ($cap_current_category) index = ($cap_current_index)
	cap_setup <...>
	if NOT walking
		goto StoppedState params = {no_init = 1}
	endif
endscript

script SetCapCurrentCategory 
	if gotparam \{category}
		cap_get_category_index category = <category>
	endif
	if gotparam \{index}
		change cap_current_category = ($cap_categories [<index>].name)
		change cap_current_category_index = <index>
	endif
endscript

script construct_new_object use_offsets = true index = 0
	printf "***************************NEW OBJECT CREATED****************************"
	choose_new_cap_object_name
	create_new_cap_object {
		<...>
		constructtype = <constructtype>
		constructindex = <index>
		name = <name>
	}
	return object_name = <name> camera_dist = <camera_dist>
endscript

script choose_new_cap_object_name 
	lastConstructedObjectIdx = $cap_last_constructed_index
	i = <lastConstructedObjectIdx>
	begin
	prev_i = <i>
	i = (<i> + 1)
	if (<i> = $cap_max_pieces_allowed)
		i = 0
	endif
	if (<i> = <lastConstructedObjectIdx>)
		newConstructedObjectIdx = <prev_i>
		break
	endif
	if NOT compositeobjectexists (RigConstructedObject + <i>)
		newConstructedObjectIdx = <i>
		break
	endif
	repeat
	name = (RigConstructedObject + <newConstructedObjectIdx>)
	if compositeobjectexists <name>
		<name> :die
	endif
	change cap_last_constructed_index = <newConstructedObjectIdx>
	return name = <name>
endscript

script create_new_cap_object 
	if NOT isarray ($ConstructionTypes.<constructtype>)
		return
	endif
	getarraysize ($ConstructionTypes.<constructtype>)
	if NOT (<constructindex> < <array_size>)
		return
	endif
	<construct_object> = (($ConstructionTypes.<constructtype>) [<constructindex>])
	if structurecontains structure = construct_object limit
		get_cap_count type = <constructtype> index = <constructindex>
		if (<count> >= (<construct_object>.limit))
			launchevent type = unfocus target = CAP_container
			wait 5 gameframes
			rigakit_cursor :disableplayerinput
			create_dialog_box {title = "Max reached!"
				text = "You have placed the max number allowed of this item. Delete a previous copy first."
				buttons = [{text = "ok" pad_choose_script = crib_ask_to_sell_item_done}
				]
				text_dims = (480.0, 0.0)
			}
			return
		endif
	endif
	if NOT gotparam restore
		if structurecontains structure = construct_object cost
			careerfunc func = GetCash
			if (<cash> < (<construct_object>.cost))
				launchevent type = unfocus target = CAP_container
				wait 5 gameframes
				rigakit_cursor :disableplayerinput
				soundevent event = Goal_UI_Negative_Text_Loud
				create_dialog_box {title = "Not enough cash!"
					text = "You don't have enough cash to buy this item. Sell something or go earn some money first."
					buttons = [{text = "ok" pad_choose_script = crib_ask_to_sell_item_done}
					]
					text_dims = (480.0, 0.0)
				}
				return
			endif
			careerfunc func = AddCash params = {cash = ((<construct_object>.cost) * -1)}
			careerfunc func = buycribitem params = {item = (<construct_object>.name)}
		endif
	endif
	state_structure = (<construct_object>.state)
	forward_offset = (<state_structure>.forward_offset)
	up_offset = (<state_structure>.up_offset)
	model = (<construct_object>.model)
	if NOT (<model> = 'none')
		model = (<model> + '.mdl')
	endif
	state_structure = (<construct_object>.state)
	if structurecontains structure = state_structure camera_dist
		<camera_dist> = (<state_structure>.camera_dist)
	else
		<camera_dist> = $cap_default_camera_dist
	endif
	collisionLayer = created_piece
	if gotparam use_offsets
		if (<use_offsets> = true)
			pos = (<pos> + <forward_offset> * <forward_direction> + <up_offset> * (0.0, 1.0, 0.0))
		endif
	endif
	if IsInCrib
		lightgroup = group1
	endif
	components = [
		{
			component = setdisplaymatrix
		}
		{component = collision
			collisionmode = <collisionmode>
			layer = <collisionLayer>
		}
		{component = model
			usemodellights
			lightgroup = <lightgroup>
		}
		{component = rig
			type = <constructtype>
			index = <constructindex>
		}
		{component = input
			player = 0
			dontusedpadasleftanalog
		}
	]
	if NOT structurecontains structure = construct_object NoNodeArray
		node_array_component_list = [{component = nodearray}]
		components = (<components> + <node_array_component_list>)
		if NOT structurecontains structure = construct_object norail
			dynamic_rail_component_list = [{component = dynarail}]
			components = (<components> + <dynamic_rail_component_list>)
		endif
	endif
	if structurecontains structure = construct_object components
		components = (<components> + <construct_object>.components)
	endif
	mempushcontext bottomupheap
	createcompositeobject {
		components = <components>
		params = {
			name = <name>
			pos = <pos>
			orientation = <quat>
			model = <model>
		}
	}
	mempopcontext
	<name> :settags dynamic_obstruction = true
	if gotparam extra_data
		<name> :settags extra_data = <extra_data>
	else
		if structurecontains structure = construct_object extra_data
			<name> :settags extra_data = (<construct_object>.extra_data)
		endif
	endif
	<name> :obj_setoutlinecolorindex index = 3
	CAP_Run_Callback_Script {
		object_id = <name>
		script_type = create_script
		params_type = create_script_params
		callback_details = <callback_details>
	}
	if structurecontains structure = construct_object fxType
		switch (<construct_object>.fxType)
			case PLAZA_FOUNTAIN
			<name> :obj_spawnscriptlater Z_Crib_Plaza_Fountain_FX
			case SMOKE_MACHINE
			safegetuniquecompositeobjectid objid = <name> preferredid = smokeMachineSmokeID
			createparticlesystem name = <uniqueid> objid = <name> params_script = $GP_Crib_SmokeMachine_Smoke01
			case TIKI_BAR
			safegetuniquecompositeobjectid objid = <name> preferredid = tikiBarFire01ID
			createparticlesystem name = <uniqueid> objid = <name> params_script = $GP_Crib_TikiBar_Fire01
			safegetuniquecompositeobjectid objid = <name> preferredid = tikiBarFire02ID
			createparticlesystem name = <uniqueid> objid = <name> params_script = $GP_Crib_TikiBar_Fire02
		endswitch
	endif
	broadcastevent type = cap_object_created data = {type = <constructtype> index = <constructindex> object_id = <name>}
	return camera_dist = <camera_dist>
endscript

script Init_Cursor 
	dump
	obj_getid
	obj_getposition
	CalculateConstructedObjectOrientation
	change cap_skater_id = <objid>
	Create_Cursor constructState = ground {<...> skater_id = <objid>}
	return object_name = <object_name> camera_dist = <camera_dist>
endscript

script CAP_Run_Callback_Script callback_details = {}
	if (<object_id> = null)
		return
	endif
	if (<object_id> = rigakit_cursor)
		piece_type = $cap_current_type
		piece_index = $cap_current_index
	else
		<object_id> :rak_getpiecetype
		<object_id> :rak_getpieceindex
	endif
	getarraysize ($ConstructionTypes.(<piece_type>))
	if (<piece_index> >= <array_size>)
		piece_index = (<array_size> - 1)
	endif
	callback_script = ((($ConstructionTypes.(<piece_type>)) [(<piece_index>)]).<script_type>)
	if NOT gotparam callback_script
		return
	endif
	callback_params = ((($ConstructionTypes.(<piece_type>)) [(<piece_index>)]).<params_type>)
	if NOT gotparam callback_params
		callback_params = {}
	endif
	runscriptonobject {
		id = <object_id>
		<callback_script>
		params = (<callback_params> + <callback_details>)
	}
endscript

script Create_Cursor use_offsets = true use_cap = true index = 0
	printf "***************************CURSOR CREATED****************************"
	name = rigakit_cursor
	if compositeobjectexists <name>
		CAP_Run_Callback_Script {
			object_id = <name>
			script_type = delete_cursor_script
			params_type = delete_cursor_script_params
			callback_details = {delete_cursor}
		}
		<name> :die
	endif
	<construct_object> = (($ConstructionTypes.<constructtype>) [<index>])
	model = (<construct_object>.model)
	if NOT (<model> = 'none')
		model = (<model> + '.mdl')
	endif
	cursor_col = (<construct_object>.collision)
	if NOT (<cursor_col> = 'none')
		cursor_col = (<cursor_col> + '.mdl')
	endif
	state_structure = (<construct_object>.state)
	forward_offset = (<state_structure>.forward_offset)
	up_offset = (<state_structure>.up_offset)
	if structurecontains structure = state_structure wall_only
		<wall_only> = (<state_structure>.wall_only)
	endif
	sounds = (<construct_object>.sounds)
	if NOT gotparam sounds
		sounds = CAP_Sliding_Sounds_Default
	endif
	force_to_ground = (<state_structure>.force_to_ground)
	if NOT gotparam force_to_ground
		force_to_ground = false
	endif
	camera_dist = (<state_structure>.camera_dist)
	if NOT gotparam camera_dist
		camera_dist = $cap_default_camera_dist
	endif
	if IsInCrib
		piece_radius = 0
		lightgroup = group1
	endif
	components = [
		{
			component = sound
		}
		{component = cap
			up_offset = <up_offset>
			collision = <cursor_col>
			force_to_ground = <force_to_ground>
			sounds = <sounds>
			height = <height>
			skater_id = <skater_id>
			piece_radius = <piece_radius>
			wall_only = <wall_only>
		}
		{component = input
			player = 0
			dontusedpadasleftanalog
		}
		{component = model
			usemodellights
			lightgroup = <lightgroup>
		}
		{component = proximtrigger
			trigger_checksum = cursor
		}
	]
	if NOT structurecontains structure = construct_object NoNodeArray
		node_array_component_list = [{component = nodearray}]
		components = (<components> + <node_array_component_list>)
	endif
	if structurecontains structure = construct_object cursor_components
		components = (<components> + <construct_object>.cursor_components)
	endif
	createcompositeobject {
		components = <components>
		params = {
			name = <name>
			pos = <pos>
			orientation = <quat>
			model = <model>
		}
	}
	<name> :obj_setoutlineflag on
	<name> :obj_setoutlinecolorindex index = 2
	change cap_current_object = <name>
	change cap_current_type = <constructtype>
	change cap_current_index = <index>
	CAP_Run_Callback_Script {
		object_id = <name>
		script_type = create_cursor_script
		params_type = create_cursor_script_params
		callback_details = {Create_Cursor}
	}
	broadcastevent type = cap_cursor_created data = {type = <constructtype> index = <index>}
	return object_name = <name> camera_dist = <camera_dist>
endscript

script cap_GetObjectCount 
	index = 0
	count = 0
	begin
	id = (RigConstructedObject + <index>)
	if compositeobjectexists <id>
		if gotparam \{type}
			<id> :rak_getpiecetype
			if (<piece_type> = <type>)
				count = (<count> + 1)
			endif
		else
			count = (<count> + 1)
		endif
	endif
	index = (<index> + 1)
	repeat ($cap_max_pieces_allowed)
	return object_count = <count>
endscript

script GetRemainingObjectCount 
	cap_GetObjectCount
	remaining = ($cap_max_pieces_allowed - <object_count>)
	return remaining_pieces = <remaining>
endscript

script Rig_A_Kit_Boost_QP 
	if invertair
		trigger_speed_boost \{multi = 10
			max_speed = 30}
	endif
endscript

script Rig_A_Kit_Boost_Kicker 
	if NOT walking
		trigger_speed_boost \{multi = 10
			max_speed = 30}
	endif
endscript

script Rig_A_Kit_Boost_Rail 
	printf \{" Boost Rail RIGAKIT start "}
	if onrail
		printf \{" Boost Rail RIGAKIT "}
		trigger_speed_boost \{multi = 10
			max_speed = 24}
	endif
endscript
