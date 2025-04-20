
script cap_enable 
	change \{cap_allow = 1}
endscript

script cap_disable 
	change \{cap_allow = 0}
endscript

script cap_set_piece_limit 
	change cap_max_pieces_allowed = <limit>
endscript

script cap_get_category_index \{category = rails}
	getarraysize \{$cap_categories}
	index = 0
	begin
	if ($cap_categories [<index>].name = <category>)
		return index = <index>
	endif
	index = (<index> + 1)
	repeat <array_size>
	return \{index = -1}
endscript

script cap_get_piece_index 
	getarraysize ($ConstructionTypes.<category>)
	i = 0
	begin
	if ((($ConstructionTypes.<category>) [<i>].name) = <name>)
		return index = <i>
	endif
	i = (<i> + 1)
	repeat <array_size>
	return \{index = -1}
endscript

script cap_restore_pieces_available_to_profile_settings 
	CAP_RestoreEnabledCategories
endscript

script cap_set_pieces_available_without_effecting_profile_settings 
endscript

script cap_setup 
	kill_start_key_binding
	if NOT compositeobjectexists name = cap_camera
		createcompositeobject {
			components = [
				{component = capcamera
					cameratarget = <object_name>
					copycamera = skatercam0
					cameradist = <camera_dist>
					camerafocusupoffset = 1.0
					camerapitch = -30.0
				}
				{
					component = camera
				}
				{
					component = input
					player = 0
					dontusedpadasleftanalog
				}
			]
			params = {
				name = cap_camera
			}
		}
	endif
	setactivecamera id = cap_camera move
	skatercam0 :disableplayerinput
	disableplayerinput
	if screenelementexists id = in_game_episode_menu_anchor
		goal_in_game_episode_menu_exit
	endif
	if NOT innetgame
		gman_pauseallgoals
	endif
	cap_show_mod_spots
	cap_pause_trains on
	change cap_valid_array = []
	<array> = []
	getarraysize $cap_categories
	<i> = 0
	begin
	if cap_is_valid_category category = <i>
		addarrayelement array = <array> element = ($cap_categories [<i>])
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	change cap_valid_array = <array>
	getarraysize $cap_valid_array
	<array> = []
	begin
	addarrayelement array = <array> element = 0
	repeat <array_size>
	change cap_index_array = <array>
	cap_scroll_object constructtype = ($cap_current_category) force_index = 0
	GetGameMode
	if checksumequals a = <gamemode> b = net_nail
		net_horse_menu_create
	elseif checksumequals a = <gamemode> b = net_line
		net_horse_menu_create
	else
		cap_menu_setup
		runscriptonscreenelement cap_check_valid id = CAP_container
	endif
	cap_update_current_type_display
	change prev_up_offset = 0.7
	change cap_last_constructed_index = ($cap_max_pieces_allowed - 1)
	setoutlineshaderparams min = 0.08 max = 0.120000005 rate = 1.0 zscale = 0.001 filldist = 40 blendmode = 0
	cap_update_piece_count_display
	ntt_hide_panel_stuff
	goal_trigger_dialog_kill
	change cap_in_menu = 1
	broadcastevent type = cap_started
	speech_box_exit anchor_id = ped_speech_dialog
	setscreenelementprops {
		id = root_window
		event_handlers = [{pad_start cap_finish_by_pause}]
		replace_handlers
	}
endscript

script cap_finish 
	if NOT innetgame
		if NOT screenelementexists id = CAP_container
			return
		endif
	endif
	if ($cap_wrench_modding = true)
		return
	endif
	Destroy_MenuFx
	if NOT ($crib_after_cap_return_to_menu = no)
		addparams from_pausing
	endif
	cap_clear_grab
	debounce select time = 0.2
	if NOT ($cap_current_object = null)
		CAP_Run_Callback_Script {
			object_id = $cap_current_object
			script_type = delete_script
			params_type = delete_script_params
			callback_details = {finish}
		}
		($cap_current_object) :die
	endif
	change cap_current_object = null
	change cap_wrench_in_mod_proxim = false
	change cap_wrench_in_mod_proxim_script = null
	setactivecamera id = skatercam0
	skatercam0 :enableplayerinput
	player1 :enableplayerinput
	if compositeobjectexists cap_camera
		cap_camera :die
	endif
	if screenelementexists id = CAP_container
		destroyscreenelement id = CAP_container
	endif
	set_outline_shader_to_default
	soundevent event = generic_menu_pad_back_sfx
	change cap_place_one_off = 0
	killspawnedscript name = cap_start_snapping_to_node
	change cap_in_menu = 0
	ntt_show_panel_stuff
	if NOT gotparam from_pausing
		unpauseskaters
		cap_pause_trains off
	endif
	if NOT gotparam no_crib_stuff
		if gotparam from_pausing
			spawnscriptnow crib_handle_cap_finish params = {<...>}
		endif
	endif
	restore_start_key_binding
	gman_unpauseallgoals
	broadcastevent type = cap_finished
	cap_hide_mod_spots
	if NOT gotparam from_pausing
		if skater :walking
			if skater :walk_ground
				MakeSkaterGoto StopState
			endif
		endif
	endif
endscript

script cap_finish_by_pause 
	if scriptisrunning \{cap_wrench_modify_environment}
		return
	endif
	setscreenelementprops \{id = root_window
		event_handlers = [
			{
				pad_start
				nullscript
			}
		]
		replace_handlers}
	cap_finish
	setanalogstickactiveformenus \{1}
	wait \{2
		gameframes}
	runscriptonscreenelement id = root_window handle_start_pressed params = {<...>}
endscript

script cap_piece_placed 
	GetRemainingObjectCount
	if (<remaining_pieces> < 1)
		AddFlag place_failed
	endif
	construct_object = (($ConstructionTypes.($cap_current_type)) [$cap_current_index])
	if structurecontains structure = construct_object NotPlaceable
		AddFlag place_failed
		if NOT ($cap_current_object = null)
			CAP_Run_Callback_Script {
				object_id = $cap_current_object
				script_type = not_placeable_place_script
				params_type = not_placeable_place_script_params
				callback_details = {placed}
			}
		endif
	endif
	if gotparam place_failed
		if (($cap_current_type) = Wrench)
			return
		endif
		soundevent event = Goal_UI_Negative_Text
		return
	endif
	if cap_cursor_is_blank_camera_stand
		goal_photo_remove_default_camera replace_camera = 1
		return
	endif
	if NOT ($cap_current_object = null)
		if ($cap_current_object) :cap_isposvalid
			if NOT cap_rigger_goal_valid_position
				soundevent event = Goal_UI_Negative_Text
				return
			endif
			cap_clear_grab placed
			($cap_current_object) :obj_getposition
			($cap_current_object) :obj_getquat
			construct_new_object {
				index = ($cap_current_index)
				constructtype = ($cap_current_type)
				pos = <pos>
				quat = <quat>
				placed = false
				use_offsets = false
				use_cap = false
			}
			if (($cap_current_type) = rails)
				GridControl_SFX_SetDown_Block type = metal
			elseif (($cap_current_type) = verts)
				GridControl_SFX_SetDown_Block type = Wood
			elseif (($cap_current_type) = Ramps)
				GridControl_SFX_SetDown_Block type = Wood
			else
				GridControl_SFX_SetDown_Block type = metal
			endif
			cap_update_piece_count_display
			if ($cap_place_one_off = 1)
				cap_finish just_placed_object = <object_name>
			else
				if (($cap_current_type) = bling)
				endif
			endif
			cap_commit_changes
		else
			soundevent event = Goal_UI_Negative_Text
		endif
	endif
	cap_update_current_cost
endscript

script cap_rigger_goal_valid_position 
	if gman_getactivatedgoalid
		switch <activated_goal_id>
			case m_r1_buildkick
			if m_r1_buildkick_place_kicker_inquiry
				return \{true}
			else
				return \{false}
			endif
			case m_r1_buildqp
			if m_r1_buildqp_place_pieces_inquiry
				return \{true}
			else
				return \{false}
			endif
			default
			return \{true}
		endswitch
	endif
	return \{true}
endscript

script cap_commit_changes 
	flushdeadobjects
	if NOT innetgame
		if NOT gman_getactivatedgoalid
			if IsInCrib
				crib_save_settings
			else
				cap_save_career_settings
			endif
		endif
	endif
endscript

script cap_find_last_index 
	getarraysize \{$cap_valid_array}
	<i> = 0
	begin
	if (($cap_valid_array [<i>].name) = $cap_current_category)
		break
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	change cap_current_index = ($cap_index_array [<i>])
endscript

script cap_prev_type 
	setspawninstancelimits max = 1 management = ignore_spawn_request
	getanalogueinfo
	if NOT (<lefty> = 0.0)
		return
	endif
	getarraysize $cap_categories
	new_index = ($cap_current_category_index)
	begin
	new_index = (<new_index> - 1)
	if (<new_index> = -1)
		new_index = (<array_size> -1)
	endif
	if cap_is_valid_category category = <new_index>
		break
	endif
	if (<new_index> = $cap_current_category_index)
		break
	endif
	repeat
	if NOT (<new_index> = $cap_current_category_index)
		change cap_current_category_index = <new_index>
		change cap_current_category = ($cap_categories [<new_index>].name)
		cap_find_last_index
		cap_scroll_object constructtype = ($cap_current_category) force_index = ($cap_current_index)
		soundevent event = CAP_SFX_cat_scroll
		cap_update_current_type_display
		<i> = 0
		getarraysize $cap_valid_array
		begin
		if (($cap_categories [<new_index>].name) = ($cap_valid_array [<i>].name))
			break
		endif
		<i> = (<i> + 1)
		repeat <array_size>
		params = {index = <i>}
		if gotparam nowait
			params = {<params> nowait}
		endif
		runscriptonscreenelement rotate_to_index id = wheel params = {<params>}
	endif
	cap_update_current_cost
	wait 0.2 seconds ignoreslomo
endscript

script cap_next_type 
	setspawninstancelimits max = 1 management = ignore_spawn_request
	getanalogueinfo
	if NOT (<lefty> = 0.0)
		return
	endif
	getarraysize $cap_categories
	new_index = ($cap_current_category_index)
	begin
	new_index = (<new_index> + 1)
	if (<new_index> = <array_size>)
		new_index = 0
	endif
	if cap_is_valid_category category = <new_index>
		break
	endif
	if (<new_index> = $cap_current_category_index)
		break
	endif
	repeat
	if NOT (<new_index> = $cap_current_category_index)
		change cap_current_category_index = <new_index>
		change cap_current_category = ($cap_categories [<new_index>].name)
		cap_find_last_index
		cap_scroll_object constructtype = ($cap_current_category) force_index = ($cap_current_index)
		soundevent event = CAP_SFX_cat_scroll
		cap_update_current_type_display
		<i> = 0
		getarraysize $cap_valid_array
		begin
		if (($cap_categories [<new_index>].name) = ($cap_valid_array [<i>]).name)
			break
		endif
		<i> = (<i> + 1)
		repeat <array_size>
		params = {index = <i> reverse}
		if gotparam nowait
			params = {<params> nowait}
		endif
		runscriptonscreenelement rotate_to_index id = wheel params = {<params>}
	endif
	cap_update_current_cost
	wait 0.2 seconds ignoreslomo
endscript

script cap_next_piece 
	getanalogueinfo
	if NOT (<leftx> = 0.0)
		return
	endif
	cap_scroll_object constructtype = ($cap_current_category)
	soundevent \{event = CAP_SFX_item_scroll}
endscript

script cap_prev_piece 
	getanalogueinfo
	if NOT (<leftx> = 0.0)
		return
	endif
	cap_scroll_object constructtype = ($cap_current_category) backwards = true
	soundevent \{event = CAP_SFX_item_scroll}
endscript

script cap_scroll_object backwards = false
	constructTypeArray = ($ConstructionTypes.<constructtype>)
	getarraysize <constructTypeArray>
	num_types = <array_size>
	<forced_index_is_valid> = 0
	if gotparam force_index
		if cap_is_valid_piece_type category = <constructtype> index = <force_index>
			<forced_index_is_valid> = 1
		endif
	endif
	if istrue <forced_index_is_valid>
		new_index = <force_index>
	else
		if NOT ($cap_current_type = <constructtype>)
			initial_index = -1
		else
			initial_index = ($cap_current_index)
		endif
		new_index = <initial_index>
		begin
		if (<backwards> = false)
			new_index = (<new_index> + 1)
			if (<new_index> > (<num_types> -1))
				new_index = 0
			endif
		else
			new_index = (<new_index> -1)
			if (<new_index> < 0)
				new_index = (<num_types> -1)
			endif
		endif
		if (<new_index> = <initial_index>)
			return
		endif
		if cap_is_valid_piece_type category = <constructtype> index = <new_index>
			break
		endif
		repeat
	endif
	getarraysize $cap_valid_array
	<i> = 0
	begin
	if (($cap_valid_array [<i>].name) = $cap_current_category)
		break
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	<array> = $cap_index_array
	setarrayelement arrayname = array index = <i> newvalue = <new_index>
	change cap_index_array = <array>
	($cap_current_object) :obj_getposition
	($cap_current_object) :obj_getquat
	($cap_current_object) :cap_getheight
	<construct_object> = (($ConstructionTypes.<constructtype>) [<new_index>])
	state_structure = (<construct_object>.state)
	up_offset = (<state_structure>.up_offset)
	up_diff = (<up_offset> - ($prev_up_offset))
	<pos> = (<pos> + <up_diff> * (0.0, 1.0, 0.0))
	change prev_up_offset = <up_offset>
	CAP_Run_Callback_Script {
		object_id = $cap_current_object
		script_type = delete_script
		params_type = delete_script_params
		callback_details = {scroll}
	}
	($cap_current_object) :die
	change cap_current_object = null
	Create_Cursor {
		index = <new_index>
		constructtype = <constructtype>
		pos = <pos>
		quat = <quat>
		height = <height>
		use_offsets = false
		skater_id = $cap_skater_id
	}
	if objectexists id = cap_camera
		cap_camera :capcamera_settarget target = <object_name>
	endif
	cap_training_scroll_object
	cap_update_current_cost
endscript

script cap_is_valid_piece_type 
	is_valid_script = ($ConstructionTypes.<category> [<index>].is_valid_script)
	if NOT gotparam \{is_valid_script}
		return \{true}
	endif
	if <is_valid_script> category = <category> index = <index>
		return \{true}
	else
		return \{false}
	endif
endscript

script cap_is_valid_category 
	is_valid_script = ($cap_categories [<category>].is_valid_script)
	if gotparam is_valid_script
		if NOT <is_valid_script> category = <category>
			return false
		endif
	endif
	category_name = ($cap_categories [<category>].name)
	if structurecontains structure = $ConstructionTypes <category_name>
		category_array = ($ConstructionTypes.<category_name>)
	else
		category_array = []
	endif
	getarraysize $cap_forced_categories
	if NOT (<array_size> = 0)
		<i> = 0
		begin
		if (<category_name> = ($cap_forced_categories [<i>]))
			break
		endif
		<i> = (<i> + 1)
		repeat <array_size>
		if (<i> = <array_size>)
			return false
		endif
	endif
	getarraysize <category_array>
	if (<array_size> = 0)
		return false
	endif
	index = 0
	begin
	if cap_is_valid_piece_type category = <category_name> index = <index>
		return true
	endif
	index = (<index> + 1)
	repeat <array_size>
	return false
endscript

script cap_clear_grab 
	if NOT (($cap_grabbed_piece).constructtype = none)
		if NOT gotparam \{placed}
			choose_new_cap_object_name
			create_new_cap_object {
				($cap_grabbed_piece)
				name = <name>
			}
		endif
		change \{cap_grabbed_piece = {
				constructtype = none
			}}
	endif
endscript

script cap_grab_nearest_piece 
	if ($cap_mode = crib)
		printf 'CRIB placement doesnt allow grabbing'
		return
	endif
	if NOT ($cap_current_object = null)
		($cap_current_object) :obj_getposition
		FindNearestRigAKitPiece searchpos = <pos> maxdist = $cap_max_grab_dist
		constructindex = <index>
		if NOT (<id> = null)
			if objectexists id = <id>
				<id> :rak_getpiecetype
				if NOT cap_allow_grab_delete_camera constructtype = <constructtype> constructindex = <constructindex>
					soundevent event = Goal_UI_Negative_Text
					return
				endif
				if gman_getactivatedgoalid
					getarraysize $CAP_Bling_Object_Types
					<i> = 0
					begin
					if (<piece_type> = ($CAP_Bling_Object_Types [<i>]))
						return
					endif
					<i> = (<i> + 1)
					repeat <array_size>
				endif
				cap_clear_grab placed
				<id> :obj_getposition
				<id> :obj_getquat
				Create_Cursor {
					index = <constructindex>
					constructtype = <constructtype>
					pos = <pos>
					quat = <quat>
					use_offsets = false
					skater_id = $cap_skater_id
				}
				change cap_current_category = <constructtype>
				cap_get_category_index category = <constructtype>
				change cap_current_category_index = <index>
				change cap_current_index = <constructindex>
				change cap_grabbed_piece = {
					constructindex = <constructindex>
					constructtype = <constructtype>
					pos = <pos>
					quat = <quat>
					extra_data = <extra_data>
				}
				cap_camera :capcamera_settarget target = <object_name>
				if (($cap_current_type) = rails)
					GridControl_SFX_Pickup_Block type = metal
				elseif (($cap_current_type) = verts)
					GridControl_SFX_Pickup_Block type = Wood
				elseif (($cap_current_type) = Ramps)
					GridControl_SFX_Pickup_Block type = Wood
				else
					GridControl_SFX_Pickup_Block type = metal
				endif
				cap_delete_nearest_piece
				cap_update_piece_count_display
				<i> = 0
				getarraysize $cap_valid_array
				begin
				if (($cap_valid_array [<i>].name) = $cap_current_category)
					break
				endif
				<i> = (<i> + 1)
				repeat <array_size>
				runscriptonscreenelement rotate_to_index id = wheel params = {index = <i> nowait}
				broadcastevent type = cap_object_grabbed data = {type = <piece_type> index = <piece_index>}
			endif
		endif
	endif
	cap_update_current_cost
endscript

script cap_delete_nearest_piece 
	if NOT ($cap_current_object = null)
		($cap_current_object) :obj_getposition
		FindNearestRigAKitPiece searchpos = <pos> maxdist = $cap_max_grab_dist
		if NOT (<id> = null)
			if objectexists id = <id>
				if NOT cap_allow_grab_delete_camera constructtype = <constructtype> constructindex = <index>
					soundevent event = Goal_UI_Negative_Text
					return
				endif
				<id> :rak_getpiecetype
				getarraysize $CAP_Bling_Object_Types
				<i> = 0
				begin
				if (<piece_type> = ($CAP_Bling_Object_Types [<i>]))
					if gman_getactivatedgoalid
						return
					else
						crib_ask_to_sell_item id = <id>
					endif
					break
				endif
				<i> = (<i> + 1)
				repeat <array_size>
				if (<i> = <array_size>)
					cap_delete_this_object id = <id>
				endif
			endif
		endif
	endif
	cap_update_current_cost
endscript

script cap_delete_this_object 
	<id> :rak_getpiecetype
	<id> :rak_getpieceindex
	CAP_Run_Callback_Script {
		object_id = <id>
		script_type = delete_script
		params_type = delete_script_params
		callback_details = {delete}
	}
	printf "***************************CLOSEST OBJECT DELETED****************************"
	<id> :die
	cap_update_piece_count_display
	soundevent event = CAP_SFX_delete
	broadcastevent type = cap_object_deleted data = {type = <piece_type> index = <piece_index>}
	cap_commit_changes
	cap_update_current_cost
endscript

script cap_delete_all_pieces 
	i = 0
	begin
	name = (RigConstructedObject + <i>)
	if compositeobjectexists <name>
		printf "********************CompositeObjectExists************************"
		<name> :rak_getpiecetype
		<name> :rak_getpieceindex
		CAP_Run_Callback_Script {
			object_id = <name>
			script_type = delete_script
			params_type = delete_script_params
			callback_details = {delete_all}
		}
		if gotparam refund_cash
			crib_calc_refund_cost piece_index = <piece_index> piece_type = <piece_type>
			careerfunc func = AddCash params = {cash = <refund> refund = true}
		endif
		<name> :die
	endif
	i = (<i> + 1)
	repeat ($cap_max_pieces_allowed)
	cap_update_piece_count_display
	change cap_last_constructed_index = 0
	if gotparam commit
		cap_commit_changes
	endif
	cap_update_current_cost
endscript

script cap_restore_pieces_from_array 
	cap_delete_all_pieces
	flushdeadobjects
	getarraysize <array>
	if (<array_size> > 0)
		i = 0
		begin
		piece = (<array> [<i>])
		if innetgame
			if gotparam skip
				removeparameter skip
			endif
			net_should_skip_piece piece = <piece>
		endif
		if NOT gotparam skip
			choose_new_cap_object_name
			create_new_cap_object {
				pos = (<piece>.pos)
				quat = (<piece>.quat)
				constructtype = (<piece>.piece_type)
				constructindex = (<piece>.piece_index)
				name = <name>
				callback_details = <piece>
				extra_data = (<piece>.extra_data)
				restore = true
			}
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script cap_cursor_is_mod_tool 
	if ((($cap_current_type) = Wrench) && (($cap_current_index) = 0))
		return \{true}
	else
		return \{false}
	endif
endscript

script cap_cursor_is_blank_camera_stand 
	if ((($cap_current_type) = special) && (($cap_current_index) = 0))
		if (($cap_rigger_cam_id) = null)
			return \{false}
		else
			return \{true}
		endif
	else
		return \{false}
	endif
endscript

script cap_wrench_proxim_check 
	if NOT gotparam wrench_script
		softassert "Rigger Wrench Proxim script called without passing a wrench_script."
	endif
	if NOT gotparam created
		if NOT gotparam destroyed
			if gotparam inside
				if cap_cursor_is_mod_tool
					change cap_wrench_in_mod_proxim = true
					change cap_wrench_in_mod_proxim_script = <wrench_script>
					if gotparam sound_type
						change cap_wrench_mod_sound_type = <sound_type>
					endif
				endif
			else
				if (($cap_wrench_modding) = false)
					change cap_wrench_in_mod_proxim = false
					change cap_wrench_in_mod_proxim_script = null
					change cap_wrench_mod_sound_type = Concrete
				endif
			endif
		endif
	endif
endscript

script cap_wrench_modify_environment 
	<success> = false
	if (($cap_wrench_modding) = false)
		if (($cap_wrench_in_mod_proxim) = true)
			if NOT (($cap_wrench_in_mod_proxim_script) = null)
				if ((($cap_current_type) = Wrench) && (($cap_current_index) = 0))
					if cap_wrench_allow_modify
						change cap_wrench_modding = true
						rigakit_cursor :disableplayerinput
						kill_start_key_binding
						switch ($cap_wrench_mod_sound_type)
							case Wood
							soundevent event = sk9_Hammer_Wood
							case sign
							soundevent event = sk9_Hammer_CarHood IsItASign = sign
							case carhood
							soundevent event = sk9_Hammer_CarHood
							case Concrete
							soundevent event = sk9_Hammer_Concrete
							case MetalPole
							soundevent event = sk9_Hammer_SolidMetal
						endswitch
						rigakit_cursor :obj_getposition
						rigakit_cursor :obj_getquat
						rigakit_cursor :hide
						createcompositeobject {
							components = [
								{component = motion}
								{component = model}
							]
							params = {
								name = rigger_mod_piece
								model = 'GameObjects\\ModEnv_Hammer\\ModEnv_Hammer.mdl'
								pos = <pos>
								suspenddistance = 60
								lod_dist1 = 10
								lod_dist2 = 100
							}
						}
						rigger_mod_piece :obj_setorientation quat = quat
						rigger_mod_piece :obj_roty speed = 800
						wait 0.65000004 seconds
						rigger_mod_piece :die
						if iscreated rigakit_cursor
							rigakit_cursor :unhide
						endif
						careerfunc func = moddedspot params = {spot_script = $cap_wrench_in_mod_proxim_script}
						($cap_wrench_in_mod_proxim_script)
						<success> = true
						rigakit_cursor :enableplayerinput
						restore_start_key_binding
						change cap_wrench_modding = false
					endif
				endif
			endif
		endif
		if (<success> = false)
			soundevent event = Goal_UI_Negative_Text
		endif
	endif
endscript

script cap_wrench_allow_modify 
	<return_value> = true
	if gman_getactivatedgoalid
		if gman_getdata goal = <activated_goal_id> name = r3_player_has_already_modded_piece
			if (<r3_player_has_already_modded_piece> = true)
				<return_value> = false
			endif
		endif
	endif
	return <return_value>
endscript

script cap_update_piece_count_display 
	if NOT screenelementexists \{id = CAP_container}
		return
	endif
	GetRemainingObjectCount
	<limit> = $cap_max_pieces_allowed
	formattext textname = remaining_pieces_text "%a/%b pieces" a = (<limit> - <remaining_pieces>) b = <limit>
	setscreenelementprops {
		id = rigakit_pieces_remaining
		text = <remaining_pieces_text>
	}
endscript

script cap_update_current_type_display 
	return
	if screenelementexists id = rigakit_current_type
		destroyscreenelement id = rigakit_current_type
	endif
	if (($cap_current_category) = rails)
		formattext current_piece = "Rail - %a" a = $cap_current_index
	elseif (($cap_current_category) = Ramps)
		formattext current_piece = "Ramps - %a" a = $cap_current_index
	else
		formattext current_piece = "Verts - %a" a = $cap_current_index
	endif
	setscreenelementlock off id = root_window
	createscreenelement {
		type = textelement
		id = rigakit_current_type
		text = <current_piece>
		font = text_a1
		parent = root_window
		pos = (640.0, 580.0)
		scale = 1.0
		rgba = [200 200 200 255]
	}
endscript
cap_debug_names = 0

script cap_update_current_cost 
	if NOT screenelementexists id = CAP_crib_container
		return
	endif
	obj = (($ConstructionTypes.($cap_current_type)) [$cap_current_index])
	if (structurecontains structure = obj name = cost)
		doscreenelementmorph id = CAP_crib_container alpha = 1.0 time = 0.25
	else
		doscreenelementmorph id = CAP_crib_container alpha = 0.0 time = 0.25
	endif
	if screenelementexists id = rigakit_current_cash
		careerfunc func = GetCash
		formattext textname = text "$%c" c = <cash> usecommas
		if (<cash> > 9999)
			if screenelementexists id = CAP_current_cash_label
				destroyscreenelement id = CAP_current_cash_label
			endif
			if screenelementexists id = rigakit_current_cash
				destroyscreenelement id = rigakit_current_cash
				createscreenelement {
					type = textelement
					id = rigakit_current_cash
					text = <text>
					font = text_a1
					parent = CAP_current_cash
					just = [center center]
					pos = (0.0, 0.0)
					scale = (0.85, 0.7)
					rgba = [200 200 200 255]
					z_priority = 3
					shadow
					shadow_rgba = [0 0 0 255]
					shadow_offs = (2.0, 2.0)
				}
			endif
		else
			if NOT screenelementexists id = CAP_current_cash_label
				createscreenelement {
					type = textelement
					text = "cash:"
					font = text_a1
					parent = CAP_current_cash
					id = CAP_current_cash_label
					just = [left center]
					pos = (-85.0, 0.0)
					scale = (0.85, 0.7)
					rgba = [200 200 200 255]
					z_priority = 3
					shadow
					shadow_rgba = [0 0 0 255]
					shadow_offs = (2.0, 2.0)
				}
			endif
			if screenelementexists id = rigakit_current_cash
				destroyscreenelement id = rigakit_current_cash
				createscreenelement {
					type = textelement
					id = rigakit_current_cash
					text = <text>
					font = text_a1
					parent = CAP_current_cash
					just = [left center]
					pos = (10.0, 0.0)
					scale = (0.85, 0.7)
					rgba = [200 200 200 255]
					z_priority = 3
					shadow
					shadow_rgba = [0 0 0 255]
					shadow_offs = (2.0, 2.0)
				}
			endif
		endif
		removeparameter text
	endif
	if screenelementexists id = rigakit_piece_cost
		if NOT ($cap_current_object = null)
			if (structurecontains structure = obj name = cost)
				formattext textname = text "$%c" c = (<obj>.cost)
			endif
			setscreenelementprops {
				id = rigakit_piece_cost
				text = <text>
			}
			removeparameter text
		endif
	endif
	if screenelementexists id = rigakit_piece_limit
		if NOT ($cap_current_object = null)
			get_cap_count type = $cap_current_type index = $cap_current_index
			if (structurecontains structure = obj name = limit)
				formattext textname = text "%c/%l" c = <count> l = (<obj>.limit)
			endif
			setscreenelementprops {
				id = rigakit_piece_limit
				text = <text>
			}
			removeparameter text
		endif
	endif
	if ($cap_debug_names = 1)
		if NOT ($cap_current_object = null)
			if NOT screenelementexists id = rigakit_debug_name
				createscreenelement {
					type = textelement
					id = rigakit_debug_name
					text = "<unknown>"
					font = text_a1
					parent = CAP_container
					scale = (0.85, 0.7)
					rgba = [200 200 200 255]
					pos = (640.0, 600.0)
					z_priority = 11
					shadow
					shadow_rgba = [0 0 0 255]
					shadow_offs = (2.0, 2.0)
				}
			endif
			if (structurecontains structure = obj name = name_string)
				formattext textname = text "%m" m = (<obj>.name_string)
				setscreenelementprops {
					id = rigakit_debug_name
					text = <text>
				}
			endif
		endif
	endif
endscript

script cap_save_career_settings 
	if IsInCrib
		printf \{"tried to save crib pieces to career. bad dog!"}
		return
	endif
	WriteRigAKitPiecesToArray \{array_name = pieces}
	CAP_SaveRiggerSetup {
		rigger_career
		setup = {pieces = <pieces>}
	}
endscript

script cap_training_scroll_object 
	if gman_getactivatedgoalid
		if (<activated_goal_id> = m_r1_buildqp)
			gman_getcurrentcheckpoint goal = <activated_goal_id>
			if (<current_checkpoint> = chk0a)
				gman_getdata goal = m_r1_buildqp
				if (<inside_am_proxim_01> = 1)
					if NOT ((($cap_current_type) = <required_proxim_01_type>) && (($cap_current_index) = <required_proxim_01_index>))
						gman_setdata goal = m_r1_buildqp params = {inside_am_proxim_01 = 0 inside_am_proxim_01_wrong_object = 1}
						killspawnedscript name = m_r1_buildqp_wait_object_dropped
					endif
				elseif (<inside_am_proxim_01_wrong_object> = 1)
					if ((($cap_current_type) = <required_proxim_01_type>) && (($cap_current_index) = <required_proxim_01_index>))
						gman_setdata goal = m_r1_buildqp params = {inside_am_proxim_01 = 1 inside_am_proxim_01_wrong_object = 0}
						m_r1_buildqp_amconfig_plane01 :obj_getposition
						m_r1_buildqp_amconfig_plane01 :obj_getquat
						spawnscriptnow m_r1_buildqp_wait_object_dropped params = {ghost_object_pos = <pos> ghost_object_quat = <quat>}
					endif
				elseif (<inside_am_proxim_02> = 1)
					if NOT ((($cap_current_type) = <required_proxim_02_type>) && (($cap_current_index) = <required_proxim_02_index>))
						gman_setdata goal = m_r1_buildqp params = {inside_am_proxim_02 = 0 inside_am_proxim_02_wrong_object = 1}
						killspawnedscript name = m_r1_buildqp_wait_object_dropped
					endif
				elseif (<inside_am_proxim_02_wrong_object> = 1)
					if ((($cap_current_type) = <required_proxim_02_type>) && (($cap_current_index) = <required_proxim_02_index>))
						gman_setdata goal = m_r1_buildqp params = {inside_am_proxim_02 = 1 inside_am_proxim_02_wrong_object = 0}
						m_r1_buildqp_amconfig_plane02 :obj_getposition
						m_r1_buildqp_amconfig_plane02 :obj_getquat
						spawnscriptnow m_r1_buildqp_wait_object_dropped params = {ghost_object_pos = <pos> ghost_object_quat = <quat>}
					endif
				elseif (<inside_am_proxim_03> = 1)
					if NOT ((($cap_current_type) = <required_proxim_03_type>) && (($cap_current_index) = <required_proxim_03_index>))
						gman_setdata goal = m_r1_buildqp params = {inside_am_proxim_03 = 0 inside_am_proxim_03_wrong_object = 1}
						killspawnedscript name = m_r1_buildqp_wait_object_dropped
					endif
				elseif (<inside_am_proxim_03_wrong_object> = 1)
					if ((($cap_current_type) = <required_proxim_03_type>) && (($cap_current_index) = <required_proxim_03_index>))
						gman_setdata goal = m_r1_buildqp params = {inside_am_proxim_03 = 1 inside_am_proxim_03_wrong_object = 0}
						m_r1_buildqp_amconfig_plane03 :obj_getposition
						m_r1_buildqp_amconfig_plane03 :obj_getquat
						spawnscriptnow m_r1_buildqp_wait_object_dropped params = {ghost_object_pos = <pos> ghost_object_quat = <quat>}
					endif
				elseif (<inside_am_proxim_04> = 1)
					if NOT ((($cap_current_type) = <required_proxim_04_type>) && (($cap_current_index) = <required_proxim_04_index>))
						gman_setdata goal = m_r1_buildqp params = {inside_am_proxim_04 = 0 inside_am_proxim_04_wrong_object = 1}
						killspawnedscript name = m_r1_buildqp_wait_object_dropped
					endif
				elseif (<inside_am_proxim_04_wrong_object> = 1)
					if ((($cap_current_type) = <required_proxim_04_type>) && (($cap_current_index) = <required_proxim_04_index>))
						gman_setdata goal = m_r1_buildqp params = {inside_am_proxim_04 = 1 inside_am_proxim_04_wrong_object = 0}
						m_r1_buildqp_amconfig_plane04 :obj_getposition
						m_r1_buildqp_amconfig_plane04 :obj_getquat
						spawnscriptnow m_r1_buildqp_wait_object_dropped params = {ghost_object_pos = <pos> ghost_object_quat = <quat>}
					endif
				endif
			endif
		endif
	endif
endscript

script cap_set_to_default_category 
	change \{cap_current_category = $cap_default_category}
	cap_get_category_index \{category = $cap_current_category}
	change cap_current_category_index = <index>
	change cap_current_index = <index>
	cap_scroll_object constructtype = ($cap_current_category)
	cap_update_current_type_display
endscript

script cap_menu_setup 
	buttonscale = (0.85, 0.7)
	if screenelementexists id = CAP_container
		destroyscreenelement id = CAP_container
	endif
	createscreenelement {
		id = CAP_container
		parent = root_window
		type = containerelement
		event_handlers = $cap_ui_handlers
	}
	launchevent type = focus target = CAP_container
	<z_priority> = 0
	createscreenelement {
		type = containerelement
		parent = CAP_container
		id = CAP_piece_remaining_container
		pos = (215.0, 570.0)
	}
	createscreenelement {
		type = spriteelement
		parent = CAP_piece_remaining_container
		texture = cap_controlsbg
		just = [center center]
		pos = (0.0, -2.0)
		rgba = [0 0 0 120]
		dims = (250.0, 50.0)
		z_priority = <z_priority>
		Random (@ @ flip_v )
		Random (@ @ flip_h )
	}
	createscreenelement {
		type = textelement
		id = rigakit_pieces_remaining
		text = ""
		font = text_a1
		parent = CAP_piece_remaining_container
		scale = (0.85, 0.7)
		rgba = [200 200 200 255]
		z_priority = (<z_priority> + 3)
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
	}
	createscreenelement {
		type = containerelement
		id = cap_control_lower
		parent = CAP_container
		pos = (640.0, 600.0)
		dims = (0.0, 0.0)
	}
	createscreenelement {
		type = spriteelement
		parent = cap_control_lower
		id = cap_lower_bg
		texture = cap_controlsbg
		just = [center center]
		pos = (0.0, 40.0)
		rgba = [0 0 0 120]
		dims = (280.0, 80.0)
		alpha = 0.0
		z_priority = <z_priority>
		Random (@ @ flip_v )
		Random (@ @ flip_h )
	}
	createscreenelement {
		type = containerelement
		id = cap_control_lowest
		parent = cap_control_lower
		pos = (0.0, 40.0)
		dims = (0.0, 0.0)
	}
	createscreenelement {
		type = textelement
		id = rigakit_help
		text = ""
		font = text_a1
		parent = cap_control_lowest
		pos = (0.0, 0.0)
		scale = <buttonscale>
		rgba = [200 200 200 255]
		z_priority = (<z_priority> + 3)
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
	}
	createscreenelement {
		type = containerelement
		id = wheel_container
		parent = CAP_container
		pos = (10.0, 360.0)
		scale = 0.8
	}
	createscreenelement {
		type = spriteelement
		parent = wheel_container
		texture = cap_quartercircle
		just = [left bottom]
		pos = (0.0, 0.0)
		rgba = [0 0 0 120]
		scale = 2.0
	}
	createscreenelement {
		type = spriteelement
		parent = wheel_container
		texture = cap_quartercircle
		just = [left top]
		pos = (0.0, 0.0)
		rgba = [0 0 0 120]
		scale = 2.0
		flip_h
	}
	createscreenelement {
		type = spriteelement
		parent = wheel_container
		texture = cap_quartercircle
		just = [right bottom]
		pos = (0.0, 0.0)
		rgba = [0 0 0 120]
		scale = 2.0
		flip_v
	}
	createscreenelement {
		type = spriteelement
		parent = wheel_container
		texture = cap_quartercircle
		just = [right top]
		pos = (0.0, 0.0)
		rgba = [0 0 0 120]
		scale = 2.0
		flip_h
		flip_v
	}
	create_rotate_menu {
		container_id = wheel
		parent = wheel_container
		array = $cap_valid_array
		array_script = cap_wheel_init
		focus_script = cap_wheel_focus
		unfocus_script = cap_wheel_unfocus
	}
	getarraysize $cap_valid_array
	<i> = 0
	begin
	if (($cap_valid_array [<i>].name) = $cap_current_category)
		break
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	runscriptonscreenelement rotate_to_index id = wheel params = {index = <i> nowait}
	cap_update_current_type_display
	createscreenelement {
		type = windowelement
		id = cap_control_window
		parent = CAP_container
		dims = (512.0, 384.0)
		pos = (825.0, 325.0)
		tags = {
			bottom = 1
		}
	}
	createscreenelement {
		type = containerelement
		id = cap_control_top
		parent = CAP_container
		pos = (825.0, 220.0)
	}
	createscreenelement {
		type = spriteelement
		parent = cap_control_top
		texture = cap_blackswipe_h
		just = [left top]
		pos = (80.0, 8.0)
		rgba = ($goal_ui_scheme.main)
		dims = (400.0, 110.0)
		z_priority = <z_priority>
		alpha = 0.5
	}
	createscreenelement {
		type = spriteelement
		parent = cap_control_top
		texture = cap_whitenoise
		just = [left top]
		pos = (65.0, 0.0)
		rgba = [200 200 200 155]
		dims = (-400.0, -128.0)
		z_priority = (<z_priority> + 1)
		alpha = 0.5
		Random (@ @ flip_v )
		Random (@ @ flip_h )
	}
	createscreenelement {
		type = textelement
		parent = cap_control_top
		id = cap_exit_text
		font = text_a1
		text = "exit"
		rgba = [200 200 200 255]
		just = [right center]
		pos = (225.0, 35.0)
		scale = (0.85, 0.7)
		z_priority = (<z_priority> + 2)
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
	}
	createscreenelement {
		type = textelement
		parent = cap_control_top
		id = cap_exit_button
		font = text_a1
		text = "\\m2"
		just = [center center]
		pos = (290.0, 35.0)
		scale = <buttonscale>
		z_priority = (<z_priority> + 2)
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
	}
	createscreenelement {
		type = textelement
		parent = cap_control_top
		id = hide_text
		font = text_a1
		text = "hide"
		rgba = [200 200 200 255]
		just = [right center]
		pos = (225.0, 82.0)
		scale = (0.85, 0.7)
		z_priority = (<z_priority> + 2)
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
	}
	createscreenelement {
		type = textelement
		parent = cap_control_top
		font = text_a1
		text = "\\m8"
		just = [center center]
		pos = (290.0, 82.0)
		scale = <buttonscale>
		z_priority = (<z_priority> + 2)
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
	}
	createscreenelement {
		type = containerelement
		id = cap_control_bottom
		parent = cap_control_window
		pos = (0.0, 18.0)
	}
	createscreenelement {
		type = spriteelement
		parent = cap_control_bottom
		texture = cap_controlsbg
		just = [left top]
		pos = (78.0, -32.0)
		rgba = [0 0 0 120]
		dims = (420.0, 280.0)
		z_priority = (<z_priority> - 2)
		Random (@ @ flip_v )
		Random (@ @ flip_h )
	}
	createscreenelement {
		type = textelement
		parent = cap_control_bottom
		font = text_a1
		text = "move"
		rgba = [200 200 200 255]
		just = [right center]
		pos = (225.0, 25.0)
		scale = (0.85, 0.7)
		z_priority = (<z_priority> - 1)
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
	}
	createscreenelement {
		type = textelement
		parent = cap_control_bottom
		font = text_a1
		text = "\\bk"
		just = [center center]
		pos = (290.0, 25.0)
		scale = <buttonscale>
		z_priority = (<z_priority> - 1)
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
	}
	createscreenelement {
		type = textelement
		parent = cap_control_bottom
		font = text_a1
		text = "height"
		rgba = [200 200 200 255]
		just = [right center]
		pos = (225.0, 70.0)
		scale = (0.85, 0.7)
		z_priority = (<z_priority> - 1)
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
	}
	createscreenelement {
		type = textelement
		parent = cap_control_bottom
		font = text_a1
		text = "\\mn+\\bk"
		just = [center center]
		pos = (290.0, 70.0)
		scale = <buttonscale>
		z_priority = (<z_priority> - 1)
		rgba = [200 200 200 255]
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
	}
	createscreenelement {
		type = textelement
		parent = cap_control_bottom
		font = text_a1
		text = "rotate"
		rgba = [200 200 200 255]
		just = [right center]
		pos = (225.0, 115.0)
		scale = (0.85, 0.7)
		z_priority = (<z_priority> - 1)
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
	}
	createscreenelement {
		type = textelement
		parent = cap_control_bottom
		font = text_a1
		text = "\\mf \\mg"
		just = [center center]
		pos = (290.0, 115.0)
		scale = <buttonscale>
		z_priority = (<z_priority> - 1)
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
	}
	createscreenelement {
		type = textelement
		parent = cap_control_bottom
		font = text_a1
		text = "camera"
		rgba = [200 200 200 255]
		just = [right center]
		pos = (225.0, 160.0)
		scale = (0.85, 0.7)
		z_priority = (<z_priority> - 1)
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
	}
	createscreenelement {
		type = textelement
		parent = cap_control_bottom
		font = text_a1
		text = "\\bl"
		just = [center center]
		pos = (290.0, 160.0)
		scale = <buttonscale>
		z_priority = (<z_priority> - 1)
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
	}
	createscreenelement {
		type = textelement
		parent = cap_control_bottom
		font = text_a1
		text = "zoom"
		rgba = [200 200 200 255]
		just = [right center]
		pos = (225.0, 205.0)
		scale = (0.85, 0.7)
		z_priority = (<z_priority> - 1)
		shadow
		shadow_rgba = [0 0 0 200]
		shadow_offs = (2.0, 2.0)
	}
	createscreenelement {
		type = textelement
		parent = cap_control_bottom
		font = text_a1
		text = "\\ml+\\bl"
		just = [center center]
		pos = (290.0, 205.0)
		scale = <buttonscale>
		z_priority = (<z_priority> - 1)
		rgba = [200 200 200 255]
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
	}
	createscreenelement {
		type = containerelement
		id = CAP_crib_container
		parent = CAP_container
		pos = (0.0, 0.0)
		alpha = 0.0
	}
	createscreenelement {
		type = containerelement
		parent = CAP_crib_container
		id = CAP_current_cash
		pos = (1075.0, 100.0)
	}
	createscreenelement {
		type = spriteelement
		parent = CAP_current_cash
		texture = cap_controlsbg
		just = [center center]
		pos = (0.0, -2.0)
		rgba = [0 0 0 120]
		dims = (275.0, 50.0)
		z_priority = <z_priority>
		Random (@ @ flip_v )
		Random (@ @ flip_h )
	}
	createscreenelement {
		type = textelement
		text = "cash:"
		font = text_a1
		parent = CAP_current_cash
		id = CAP_current_cash_label
		just = [right center]
		pos = (-10.0, 0.0)
		scale = (0.85, 0.7)
		rgba = [200 200 200 255]
		z_priority = (<z_priority> + 3)
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
	}
	careerfunc func = GetCash
	formattext textname = text "$%c" c = <cash>
	createscreenelement {
		type = textelement
		id = rigakit_current_cash
		text = <text>
		font = text_a1
		parent = CAP_current_cash
		just = [left center]
		pos = (10.0, 0.0)
		scale = (0.85, 0.7)
		rgba = [200 200 200 255]
		z_priority = (<z_priority> + 3)
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
	}
	createscreenelement {
		type = containerelement
		parent = CAP_crib_container
		id = CAP_piece_cost
		pos = (1075.0, 150.0)
	}
	createscreenelement {
		type = spriteelement
		parent = CAP_piece_cost
		texture = cap_controlsbg
		just = [center center]
		pos = (0.0, -2.0)
		rgba = [0 0 0 120]
		dims = (275.0, 50.0)
		z_priority = <z_priority>
		Random (@ @ flip_v )
		Random (@ @ flip_h )
	}
	createscreenelement {
		type = textelement
		text = "cost:"
		font = text_a1
		parent = CAP_piece_cost
		just = [right center]
		pos = (-10.0, 0.0)
		scale = (0.85, 0.7)
		rgba = [200 200 200 255]
		z_priority = (<z_priority> + 3)
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
	}
	createscreenelement {
		type = textelement
		id = rigakit_piece_cost
		text = "$0"
		font = text_a1
		parent = CAP_piece_cost
		just = [left center]
		pos = (10.0, 0.0)
		scale = (0.85, 0.7)
		rgba = [200 200 200 255]
		z_priority = (<z_priority> + 3)
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
	}
	createscreenelement {
		type = containerelement
		parent = CAP_crib_container
		id = CAP_piece_limit
		pos = (1075.0, 200.0)
	}
	createscreenelement {
		type = spriteelement
		parent = CAP_piece_limit
		texture = cap_controlsbg
		just = [center center]
		pos = (0.0, -2.0)
		rgba = [0 0 0 120]
		dims = (275.0, 50.0)
		z_priority = <z_priority>
		Random (@ @ flip_v )
		Random (@ @ flip_h )
	}
	createscreenelement {
		type = textelement
		just = [right center]
		pos = (-10.0, 0.0)
		text = "limit:"
		font = text_a1
		parent = CAP_piece_limit
		scale = (0.85, 0.7)
		rgba = [200 200 200 255]
		z_priority = (<z_priority> + 3)
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
	}
	createscreenelement {
		type = textelement
		id = rigakit_piece_limit
		just = [left center]
		pos = (10.0, 0.0)
		text = "0/?"
		font = text_a1
		parent = CAP_piece_limit
		scale = (0.85, 0.7)
		rgba = [200 200 200 255]
		z_priority = (<z_priority> + 3)
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
	}
	cap_update_current_cost
endscript

script cap_wheel_init 
	<parent> = <id>
	switch <name>
		case rails
		<texture> = cap_iconrails
		case Ramps
		<texture> = cap_iconramps
		case verts
		<texture> = cap_iconquart
		case Wrench
		<texture> = cap_iconhammer
		case special
		<texture> = cap_iconcamera
		case Appliance
		<texture> = bling_appliance_item
		case Automobile
		<texture> = bling_auto_item
		case Electronics
		<texture> = bling_entertainment_item
		case Entertainment
		<texture> = bling_electronic_item
		case Furniture
		<texture> = bling_furniture_item
		case Game_Pieces
		<texture> = bling_gp_world_item
		case music
		<texture> = bling_music_item
		case Skate_Items_S
		<texture> = bling_skateitem_sm
		case Skate_Items_M
		<texture> = bling_skateitem_med
		case Skate_Items_L
		<texture> = bling_skateitem_lrg
		case Themes
		<texture> = bling_theme_item
		default
		<texture> = cap_iconmisc
	endswitch
	createscreenelement {
		type = spriteelement
		parent = <parent>
		local_id = circle
		texture = cap_piececircle
		just = [center center]
		pos = (-5.0, 0.0)
		scale = 1.0
		rot_angle = RandomRange (0.0, 360.0)
		z_priority = 9
		alpha = 0.5
	}
	createscreenelement {
		type = spriteelement
		parent = <parent>
		local_id = icon
		texture = <texture>
		rgba = [230 230 230 255]
		just = [center center]
		pos = (-5.0, 0.0)
		scale = 1.5
		z_priority = 10
	}
	createscreenelement {
		type = textelement
		parent = <parent>
		local_id = left_arrow
		font = text_a1
		text = "\\b6"
		just = [right center]
		pos = (-53.0, 4.0)
		scale = 0.7
		alpha = 0.0
		z_priority = 10
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
	}
	createscreenelement {
		type = textelement
		parent = <parent>
		local_id = right_arrow
		font = text_a1
		text = "\\b5"
		just = [left center]
		pos = (43.0, 4.0)
		scale = 0.7
		alpha = 0.0
		z_priority = 10
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
	}
endscript

script cap_wheel_focus time = 0.1
	if gotparam init
		time = 0.0
	endif
	doscreenelementmorph {
		id = <id>
		scale = 1.2
		time = <time>
	}
	setscreenelementprops {
		id = {<id> child = circle}
		rgba = ($goal_ui_scheme.main)
	}
	setscreenelementprops {
		id = {<id> child = icon}
		rgba = [230 230 230 255]
		scale = 1.7
	}
	doscreenelementmorph {
		id = {<id> child = left_arrow}
		alpha = 1.0
	}
	doscreenelementmorph {
		id = {<id> child = right_arrow}
		alpha = 1.0
	}
endscript

script cap_wheel_unfocus time = 0.1
	if gotparam init
		time = 0.0
	endif
	doscreenelementmorph {
		id = <id>
		scale = 0.7
		time = <time>
	}
	setscreenelementprops {
		id = {<id> child = circle}
		rgba = [70 70 70 180]
	}
	setscreenelementprops {
		id = {<id> child = icon}
		rgba = [230 230 230 100]
		scale = 1.6
	}
	doscreenelementmorph {
		id = {<id> child = left_arrow}
		alpha = 0.0
	}
	doscreenelementmorph {
		id = {<id> child = right_arrow}
		alpha = 0.0
	}
endscript

script cap_toggle_controls 
	if NOT screenelementexists id = cap_control_window
		return
	endif
	<time> = 0.2
	if gotparam force
		if (<force> = off)
			cap_control_window :settags bottom = 1
		else
			cap_control_window :settags bottom = 0
		endif
		<time> = 0.0
	endif
	cap_control_window :getsingletag bottom
	if (<bottom> = 0)
		cap_control_window :settags bottom = 1
		soundevent event = CAP_SFX_menu_show
		doscreenelementmorph {
			id = wheel_container
			pos = (10.0, 360.0)
			time = <time>
		}
		doscreenelementmorph {
			id = cap_control_window
			pos = (825.0, 325.0)
			time = <time>
		}
		doscreenelementmorph {
			id = cap_control_top
			pos = (825.0, 220.0)
			time = <time>
		}
		doscreenelementmorph {
			id = cap_control_lower
			pos = (640.0, 600.0)
			time = <time>
		}
		doscreenelementmorph {
			id = CAP_piece_remaining_container
			pos = (215.0, 570.0)
			time = <time>
		}
		if screenelementexists id = CAP_crib_container
			doscreenelementmorph {
				id = CAP_crib_container
				pos = (0.0, 0.0)
				time = <time>
			}
		endif
		wait (<time> * 1.5) seconds
		doscreenelementmorph {
			id = cap_control_bottom
			pos = (0.0, 18.0)
			time = <time>
		}
		setscreenelementprops {
			id = hide_text
			text = "hide"
		}
	else
		cap_control_window :settags bottom = 0
		soundevent event = CAP_SFX_menu_hide
		doscreenelementmorph {
			id = cap_control_bottom
			pos = (0.0, -300.0)
			time = <time>
		}
		wait (<time> * 1.5) seconds
		if screenelementexists id = CAP_crib_container
			doscreenelementmorph {
				id = CAP_crib_container
				pos = (0.0, -250.0)
				time = <time>
			}
		endif
		doscreenelementmorph {
			id = cap_control_lower
			pos = (640.0, 720.0)
			time = <time>
		}
		doscreenelementmorph {
			id = CAP_piece_remaining_container
			pos = (215.0, 900.0)
			time = <time>
		}
		doscreenelementmorph {
			id = wheel_container
			pos = (-250.0, 360.0)
			time = <time>
		}
		doscreenelementmorph {
			id = cap_control_window
			pos = (1337.0, 325.0)
			time = <time>
		}
		doscreenelementmorph {
			id = cap_control_top
			pos = (1337.0, 220.0)
			time = <time>
		}
	endif
	wait <time> seconds
endscript

script cap_check_valid 
	<limit> = $cap_max_pieces_allowed
	<text> = ""
	<prev_text> = ""
	<prev_width> = ""
	begin
	setscreenelementprops {
		id = root_window
		event_handlers = [{pad_start cap_finish_by_pause}]
		replace_handlers
	}
	if screenelementexists id = rigakit_help
		GetRemainingObjectCount
		if NOT ($cap_current_object = null)
			<text> = "\\m5 grab     \\bj snap     \\m1 delete"
			if cap_cursor_is_mod_tool
				<text> = "\\m5 grab     \\m1 delete"
				if ($cap_wrench_in_mod_proxim = true)
					<text> = ("\\m0 Mod It!     " + <text>)
				endif
			else
				if cap_cursor_is_blank_camera_stand
					<text> = ("\\m0 replace camera      " + <text>)
				else
					if ($cap_current_object) :cap_isposvalid
						if NOT (<remaining_pieces> = 0)
							if (<remaining_pieces> = <limit>)
								<text> = "\\m0 place"
							else
								<text> = ("\\m0 place     " + <text>)
							endif
						endif
					else
						if NOT (<remaining_pieces> = 0)
							if (<remaining_pieces> = <limit>)
								<text> = ""
							endif
						endif
					endif
				endif
			endif
			if NOT (<prev_text> = <text>)
				setscreenelementprops {
					id = rigakit_help
					text = <text>
				}
				<prev_text> = <text>
				getscreenelementdims id = rigakit_help
				<help_width> = <width>
				getscreenelementdims id = hide_text
				if (<width> > <help_width>)
					<help_width> = <width>
				endif
				if (<text> = "")
					doscreenelementmorph {
						id = cap_lower_bg
						alpha = 0.0
					}
				else
					doscreenelementmorph {
						id = cap_lower_bg
						alpha = 1.0
					}
				endif
				cap_control_window :getsingletag bottom
				if (<bottom> = 1)
					setscreenelementprops {
						id = cap_lower_bg
						dims = ((50.0, 60.0) + ((1.0, 0.0) * <help_width>))
					}
				endif
			endif
		endif
	endif
	wait 1 gameframes
	repeat
endscript

script cap_hide_controls 
	if screenelementexists \{id = cap_control_window}
		doscreenelementmorph \{id = cap_control_window
			alpha = 0.0}
	endif
	if screenelementexists \{id = cap_control_top}
		doscreenelementmorph \{id = cap_control_top
			alpha = 0.0}
	endif
endscript

script cap_show_controls 
	if screenelementexists \{id = cap_control_window}
		doscreenelementmorph \{id = cap_control_window
			alpha = 1.0}
	endif
	if screenelementexists \{id = cap_control_top}
		doscreenelementmorph \{id = cap_control_top
			alpha = 1.0}
	endif
endscript

script cap_hide_controls_top 
	if screenelementexists \{id = cap_control_top}
		doscreenelementmorph \{id = cap_control_top
			alpha = 0.0}
	endif
endscript

script cap_show_controls_top 
	if screenelementexists \{id = cap_control_top}
		doscreenelementmorph \{id = cap_control_top
			alpha = 1.0}
	endif
endscript

script cap_start_snapping_to_node 
	if (<delta> > 0.15)
		printf 'Snapping a long distance'
	endif
	killspawnedscript name = GridControl_SFX_Block_Slide
	if (<delta> > 0.1)
		if (($cap_current_type) = rails)
			GridControl_SFX_Snap type = metal
		elseif (($cap_current_type) = verts)
			GridControl_SFX_Snap type = Wood
		elseif (($cap_current_type) = Ramps)
			GridControl_SFX_Snap type = Wood
		else
			GridControl_SFX_Snap type = metal
		endif
	endif
endscript

script cap_show_mod_spots 
	if NOT AreNodeFlagsLocked
		if SkillTree_IsSkillLearned \{skill = Wrench}
			changenodeflag \{nodeflag_rig_tier1
				1}
			if SkillTree_IsSkillLearned \{skill = wrench_2}
				changenodeflag \{nodeflag_rig_tier2
					1}
				if SkillTree_IsSkillLearned \{skill = wrench_3}
					changenodeflag \{nodeflag_rig_tier3
						1}
				endif
			endif
		endif
		changenodeflag \{NODEFLAG_IN_CAP
			1}
	endif
endscript

script cap_hide_mod_spots 
	if NOT AreNodeFlagsLocked
		changenodeflag \{nodeflag_rig_tier1
			0}
		changenodeflag \{nodeflag_rig_tier2
			0}
		changenodeflag \{nodeflag_rig_tier3
			0}
		changenodeflag \{NODEFLAG_IN_CAP
			0}
	endif
endscript

script get_cap_count 
	if NOT gotparam type
		return
	endif
	if NOT gotparam index
		return
	endif
	i = 0
	count = 0
	begin
	name = (RigConstructedObject + <i>)
	if compositeobjectexists <name>
		<name> :rak_getpiecetype
		<name> :rak_getpieceindex
		if (<piece_type> = <type>)
			if (<piece_index> = <index>)
				count = (<count> + 1)
			endif
		endif
	endif
	i = (<i> + 1)
	repeat ($cap_max_pieces_allowed)
	return count = <count>
endscript
cap_train_list = [
	Z_bcity_train_01
	Z_bcity_train_02
	Z_Slums_train
	z_slums_train2
	Z_WP_Bridge_Train_01
	Z_WP_Bridge_Train_02
	Z_WP_Bridge_Train_03
	Z_WP_Bridge_Train_04
]

script cap_pause_trains 
	getarraysize \{$cap_train_list}
	i = 0
	begin
	id = ($cap_train_list [<i>])
	if objectexists id = <id>
		if gotparam \{on}
			<id> :pause
		else
			<id> :unpause
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
endscript
