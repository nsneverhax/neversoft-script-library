replay_root_directory = 'AnimSaves/'
ve_save_to_devkit = 0
AnimSave_BaseAnimTree = {
	type = PoseExport
	id = SkaterPoseExport
	[
		{
			type = degenerateblend
			id = Blender
		}
	]
}
AnimSave_Branch_PlayAnim = {
	type = param_timer_type
	id = bodytimer
	speed = param_speed
	start = param_start
	end = param_end
	speed = param_speed
	anim = param_anim_skeleton
	[
		{
			type = animsavecamera
			anim = param_anim_camera
			camera = param_camera_object
			[
				{
					id = bodysource
					type = animsavesource
					anim_skeleton = param_anim_skeleton
					anim_object = param_anim_object
				}
			]
		}
	]
}
replay_currently_playing = 0
replay_current_name = 'default'
animexport_filter = 0
animexport_filter_pts_left = 5
animexport_filter_pts_right = 5
animexport_filter_order = 3
animexport_flip = 1
animexport_teleport = 1
animexport_event_list_size = 256

script PlayAnimSave name = 'default' exitscript = ReplayExit_Die clonefrom = skater viewport = 0
	if istrue $replay_currently_playing
		return
	endif
	skater :skeleton_getskeletonname
	if NOT gotparam ReplayActorName
		replay_create_actor clonefrom = <clonefrom> preferredid = ReplaySkater skeleton = <skeletonname> assetcontext = <assetcontext>
	endif
	assignalias id = <ReplayActorName> alias = ReplayActor
	<ReplayActorName> :settags {
		ReplayExitScript = <exitscript>
		ReplayExitParams = <exitparams>
		ReplayExitHide = <hide>
		Replay_Actor
		ReplayActorName = <ReplayActorName>
	}
	<ReplayActorName> :obj_spawnscriptnow play_replay_guts params = {
		name = <name>
		speed = <speed>
		start_percent = <start_percent>
		end_percent = <end_percent>
		play_camera = <play_camera>
		viewport = <viewport>
		user_camera = <user_camera>
		force_user_camera = <force_user_camera>
	}
	return {ReplayActorName = <ReplayActorName>}
endscript

script RecordSkaterAnim \{name = 'default'
		time = 5
		offline = 0
		cyclic = false}
	if skater :export_isrecording
		RecordSkaterAnimStop \{forced}
	else
		skater :record_start name = <name> time = <time> StopCallback = <StopCallback> PreExportScript = <PreExportScript> offline = <offline> cyclic = <cyclic>
	endif
endscript

script RecordSkaterAnimStop 
	skater :export_getduration
	if (<duration> > (($video_editor_minimum_clip_length) + 0.1))
		skater :export_stop
	else
		if gotparam \{forced}
			skater :export_stop
		endif
	endif
endscript

script replay_create_actor assetcontext = animexport
	if compositeobjectexists name = <preferredid>
		return ReplayActorName = <preferredid>
	endif
	if NOT compositeobjectexists name = <clonefrom>
		scriptassert "No object found to clone from!"
	endif
	skater :obj_getposition
	getuniquecompositeobjectid preferredid = <preferredid>
	ReplayActorName = <uniqueid>
	createcompositeobject {
		components = [
			{
				component = suspend
				neversuspend
			}
			{
				component = proximtrigger
				cube_length = 0.4
				trigger_checksum = ReplaySkater
				inactive
			}
			{
				component = sound
			}
			{
				component = skatersoundrecording
			}
			{
				component = animtree
				skeletonname = <skeletonname>
				defaultcommandtarget = Blender
			}
			{
				component = skeleton
			}
			{
				component = setdisplaymatrix
			}
			{
				component = model
				clonefrom = <clonefrom>
				usemodellights
			}
			{
				component = animexport
			}
		]
		params = {
			pos = (<pos> + (0.0, 0.0, -1.0))
			skeletonname = <skeleton>
			name = <ReplayActorName>
			assetcontext = <assetcontext>
		}
	}
	<ReplayActorName> :replay_init_tree
	<ReplayActorName> :obj_setboundingsphere ($ve_bounding_sphere_size)
	return ReplayActorName = <ReplayActorName>
endscript

script replay_init_tree 
	anim_uninittree
	anim_inittree \{tree = AnimSave_BaseAnimTree
		nodeiddeclaration = [
			Blender
			bodytimer
			bodyoverlay
			bodysource
			SkaterPoseExport
		]}
endscript

script replay_setup_anim user_camera = 0
	if NOT replay_generate_filenames name = <name>
		scriptassert 'generating names failed'
	endif
	if NOT cd
		if ($animsave_replay_params.offline = 1)
			manglechecksums a = 0 b = 0
			<cma_checksum> = <mangled_id>
		endif
	endif
	if (<user_camera> = 1)
		pushassetcontext context = animexport
		if gotparam force_user_camera
			user_cma_checksum = <force_user_camera>
		endif
		if isassetloaded name = <user_cma_checksum>
			cma_checksum = <user_cma_checksum>
		else
			printf 'No user cam to use'
		endif
		popassetcontext
	endif
	pushassetcontext context = animexport
	if NOT isassetloaded name = <ska_checksum>
		printf 'no ska'
		return false
	endif
	if NOT isassetloaded name = <oba_checksum>
		printf 'no oba'
		return false
	endif
	popassetcontext
	if gotparam play_camera
		if (<play_camera> = no_camera)
			manglechecksums a = 0 b = 0
			cma_checksum = <mangled_id>
		endif
	endif
	if gotparam end_percent
		if (<end_percent> > 0.9998999)
			end_percent = 1.0
		endif
		if (<end_percent> < 0.0001)
			end_percent = 0.0
		endif
	endif
	if gotparam start_percent
		if (<start_percent> > 0.9998999)
			start_percent = 1.0
		endif
		if (<start_percent> < 0.0001)
			start_percent = 0.0
		endif
	endif
	anim_command {
		command = degenerateblend_addbranch
		blendduration = 0.0
		params = {
			tree = $AnimSave_Branch_PlayAnim
			blendduration = 0.0
			params = {
				param_timer_type = play
				param_anim_skeleton = <ska_checksum>
				param_anim_object = <oba_checksum>
				param_anim_camera = <cma_checksum>
				param_start = <start_percent>
				param_end = <end_percent>
				param_speed = <speed>
				param_camera_object = <play_camera>
			}
		}
	}
	return true
endscript

script StopAnimSave 
	if compositeobjectexists \{ReplayActor}
		ReplayActor :anim_command \{target = bodytimer
			command = timer_force_waits_to_complete}
	endif
endscript

script play_replay_guts play_camera = skatercam0 viewport = 0
	change assertonmissingassets = 1
	<need_unload> = 0
	if NOT cd
		if ($animsave_replay_params.offline = 1)
			loadpak 'pak/animsaves/animsaves.pak'
			<need_unload> = 1
		endif
	endif
	printf "Starting replay anim: %s" s = <name>
	change replay_currently_playing = 1
	change replay_current_name = <name>
	replay_setup_anim {
		name = <name>
		start_percent = <start_percent>
		end_percent = <end_percent>
		speed = <speed>
		play_camera = <play_camera>
		user_camera = <user_camera>
		force_user_camera = <force_user_camera>
	}
	anim_updatepose
	wait 1 gameframes
	obj_setvisibility viewport = <viewport>
	anim_command target = bodytimer command = timer_wait
	printf "Finished replay anim!"
	if (<need_unload> = 1)
		unloadpak 'pak/animsaves/animsaves.pak'
		waitunloadpak
	endif
	change replay_currently_playing = 0
	replay_handle_exit_script
endscript

script replay_handle_exit_script 
	tag_array = [
		ReplayExitScript
		ReplayExitParams
		ReplayExitHide
		Replay_Actor
		ReplayActorName
	]
	getsetoftags <tag_array>
	removetags <tag_array>
	broadcastevent \{type = AnimSaveFinished}
	if gotparam \{ReplayExitScript}
		<ReplayExitScript> <ReplayExitParams> ReplayActorName = <ReplayActorName>
	endif
endscript

script ReplayExit_Die 
	printf \{"ReplayExit_Die"}
	die
endscript

script replay_generate_filenames 
	return_value = true
	if ischecksum <name>
		extendcrc <name> '_skeleton' out = ska_checksum
		extendcrc <name> '_object' out = oba_checksum
		extendcrc <name> '_camera' out = cma_checksum
		extendcrc <name> '_user_camera' out = user_cma_checksum
	else
		base_name = (($replay_root_directory) + <name>)
		string_names = {
			ska_name = (<base_name> + '_skeleton.ska')
			oba_name = (<base_name> + '_object.ska')
			cma_name = (<base_name> + '_camera.ska')
			user_cma_name = (<base_name> + '_user_camera.ska')
		}
		formattext checksumname = ska_checksum (<name> + '_skeleton')
		formattext checksumname = oba_checksum (<name> + '_object')
		formattext checksumname = cma_checksum (<name> + '_camera')
		formattext checksumname = user_cma_checksum (<name> + '_user_camera')
	endif
	return {
		ska_checksum = <ska_checksum>
		oba_checksum = <oba_checksum>
		cma_checksum = <cma_checksum>
		user_cma_checksum = <user_cma_checksum>
		<string_names>
		debug_memory_load = <debug_memory_load>
		<return_value>
	}
endscript

script replay_remove_asset 
	replay_generate_filenames name = <name>
	skater :export_removeasset <ska_checksum>
	skater :export_removeasset <oba_checksum>
	skater :export_removeasset <cma_checksum>
	skater :export_removeasset <user_cma_checksum>
endscript

script replay_remove_user_camera_asset 
	replay_generate_filenames name = <name>
	skater :export_removeasset <user_cma_name>
endscript

script replay_asset_exists 
	pushassetcontext \{context = animexport}
	formattext checksumname = ska_checksum (<name> + '_skeleton')
	if isassetloaded name = <ska_checksum>
		popassetcontext \{context = animexport}
		return \{true}
	endif
	popassetcontext \{context = animexport}
	return \{false}
endscript

script replay_camera_asset_exists 
	pushassetcontext \{context = animexport}
	formattext checksumname = cma_checksum (<name> + '_camera')
	if isassetloaded name = <cma_checksum>
		popassetcontext \{context = animexport}
		return \{true}
	endif
	popassetcontext \{context = animexport}
	return \{false}
endscript

script replay_rename_asset 
	replay_generate_filenames name = <new_name>
	new_ska_checksum = <ska_checksum>
	new_oba_checksum = <oba_checksum>
	new_cma_checksum = <cma_checksum>
	new_user_cma_checksum = <user_cma_checksum>
	replay_generate_filenames name = <name>
	pushassetcontext context = animexport
	RenameAsset id = <ska_checksum> new_id = <new_ska_checksum>
	RenameAsset id = <oba_checksum> new_id = <new_oba_checksum>
	RenameAsset id = <cma_checksum> new_id = <new_cma_checksum>
	if isassetloaded name = <user_cma_checksum>
		RenameAsset id = <user_cma_checksum> new_id = <new_user_cma_checksum>
	endif
	popassetcontext context = animexport
endscript

script replay_write_to_devkit 
	replay_generate_filenames name = <name>
	VideoEditorFunc write_clip_to_devkit name = <ska_name> asset = <ska_checksum>
	VideoEditorFunc write_clip_to_devkit name = <oba_name> asset = <oba_checksum>
	VideoEditorFunc write_clip_to_devkit name = <cma_name> asset = <cma_checksum>
	if isassetloaded name = <user_cma_checksum>
		VideoEditorFunc write_clip_to_devkit name = <user_cma_name> asset = <user_cma_checksum>
	endif
endscript

script replay_get_length 
	replay_generate_filenames name = <name>
	anim_getanimlength anim = <ska_checksum> assetcontext = animexport
	return length = <length>
endscript

script replay_load_devkit_anim 
	allowassetloading
	replay_generate_filenames name = <name>
	mempushcontext animexportdata
	pushassetcontext context = animexport
	if isassetloaded name = <ska_checksum>
		unloadanim name = <ska_name> descchecksum = <ska_checksum>
		unloadanim name = <oba_name> descchecksum = <oba_checksum>
		unloadanim name = <cma_name> descchecksum = <cma_checksum>
		unloadanim name = <user_cma_name> descchecksum = <user_cma_checksum>
	endif
	loadanim name = <ska_name> descchecksum = <ska_checksum>
	loadanim name = <oba_name> descchecksum = <oba_checksum>
	loadanim name = <cma_name> descchecksum = <cma_checksum>
	loadanim name = <user_cma_name> descchecksum = <user_cma_checksum>
	popassetcontext context = animexport
	mempopcontext
	allowassetloading off
endscript

script record_start record_camera = skatercam0 capture_update_interval = 1 cyclic = false
	if NOT isobjectscript
		scriptassert "need to run this on an object"
	endif
	if export_hasdata
		printf "Old replay found...."
		record_stop no_export
		return
	endif
	unpause
	<record_camera> :unpause
	change replay_current_name = <name>
	replay_generate_filenames name = <name>
	change animsave_replay_params = {($animsave_replay_params) offline = <offline>}
	skeleton_getskeletonname
	if gotparam StopCallback
		skater :settags ReplayPreExportScript = <PreExportScript>
		stop_callback = record_stop_immediate_export
		stop_callback_params = {video_clip_slot = <video_clip_slot> callback = <StopCallback> params = {<StopCallbackParams> name = <name>}}
	else
		stop_callback = record_stop
		stop_callback_params = {}
	endif
	export_setrecordcamera <record_camera>
	if gotparam rec_user_camera
		camera_filename = <user_cma_name>
	else
		camera_filename = <cma_name>
	endif
	GetFramesPerSecond
	record_params = {
		camera = {
			filename = <camera_filename>
			refchecksum = ReplayActorCamera
			capture_update_count = (<time> * <fps>)
			capture_update_interval = <capture_update_interval>
			export_rate = <fps>
			cyclic = <cyclic>
		}
		record_camera_name = <record_camera>
		stop_callback = <stop_callback>
		stop_callback_params = <stop_callback_params>
	}
	if NOT gotparam rec_user_camera
		record_params = {<record_params>
			object = {
				filename = <oba_name>
				refchecksum = ReplayActor
				capture_update_count = (<time> * <fps>)
				capture_update_interval = <capture_update_interval>
				export_rate = <fps>
				cyclic = <cyclic>
			}
			skeleton = {
				filename = <ska_name>
				refchecksum = <skeletonname>
				capture_update_count = (<time> * <fps>)
				capture_update_interval = <capture_update_interval>
				export_rate = <fps>
				cyclic = <cyclic>
			}
		}
	endif
	export_record <record_params>
	setscreenelementlock id = root_window off
	if NOT gotparam no_record_ui
		createscreenelement {
			parent = root_window
			id = record_anchor
			type = containerelement
			z_priority = 1000
		}
		if ($ui_gameplay_show_hud = 1)
			if NOT gman_getactivatedgoalid
				icon_pos = (135.0, 90.0)
				record_pos = (165.0, 94.0)
				time_pos = (1000.0, 94.0)
			else
				icon_pos = (135.0, 631.0)
				record_pos = (165.0, 635.0)
				time_pos = (1000.0, 635.0)
			endif
			createscreenelement {
				parent = record_anchor
				id = record_dot
				type = spriteelement
				texture = circle
				just = [left center]
				pos = <icon_pos>
				rgba = ($goal_generic_ui_scheme.main)
				scale = 1.75
			}
			createscreenelement {
				parent = record_anchor
				id = record_label
				type = textelement
				font = text_a1
				pos = <record_pos>
				just = [left center]
				scale = (1.0, 0.8)
				text = "Record"
				rgba = ($goal_generic_ui_scheme.main)
				shadow
				shadow_rgba = [0 0 0 255]
				shadow_offs = (2.0, 2.0)
			}
			createscreenelement {
				parent = record_anchor
				id = record_time
				type = textelement
				font = text_a1
				pos = <time_pos>
				just = [left center]
				scale = (1.0, 0.8)
				text = "00:00.00"
				rgba = [200 200 200 255]
				shadow
				shadow_rgba = [0 0 0 255]
				shadow_offs = (2.0, 2.0)
			}
			createscreenelement {
				parent = record_anchor
				id = record_time_icon
				type = spriteelement
				texture = overwrite_record
				pos = (<time_pos> + (-27.0, 50.0))
				just = [left center]
				alpha = 0.0
				scale = 0.75
			}
			if NOT gman_getactivatedgoalid
				createscreenelement {
					parent = record_anchor
					type = textelement
					font = text_a1
					pos = (1152.0, 635.0)
					just = [right center]
					scale = (0.9, 0.7)
					rgba = [200 200 200 255]
					text = "\\b8 stop recording"
					shadow
					shadow_rgba = [0 0 0 255]
					shadow_offs = (2.0, 2.0)
				}
			endif
			runscriptonscreenelement record_blink_dot id = record_dot
			obj_getid
			runscriptonscreenelement record_time_update id = record_time params = {
				track = <objid>
				cyclic = <cyclic>
				capture_update_interval = <capture_update_interval>
			}
		endif
	endif
endscript

script record_stop_immediate_export 
	printf 'record_stop_immediate_export'
	kill_panel_message_if_it_exists id = record_anchor
	if NOT export_hasdata
		export_clear
		<callback> {NoData <params>}
		return
	endif
	export_getduration
	if (<duration> < 0.2)
		export_clear
		<callback> {NoData <params>}
		return
	endif
	if skater :getsingletag ReplayPreExportScript
		<ReplayPreExportScript>
		skater :removetags [ReplayPreExportScript]
	endif
	export_save start_time = 0.0 end_time = <duration> video_clip_slot = <video_clip_slot>
	export_clear
	if scriptexists <callback>
		<callback> {<params> elapsed_duration = <elapsed_duration> duration = <duration>}
	endif
endscript
animsave_replay_params = {
	start_time = 0.0
	end_time = 1.0
	offline = 0
}

script record_stop 
	wait 5 gameframes
	if NOT export_hasdata
		printf "No anim export data?"
		return
	endif
	kill_panel_message_if_it_exists id = record_anchor
	if screenelementexists id = animsave_controls
		return
	endif
	kill_start_key_binding
	skater :pause
	skater :vibrate off
	obj_getid
	export_getduration
	if NOT gotparam no_export
		change animsave_replay_params = {($animsave_replay_params) start_time = 0.0 end_time = <duration>}
		spawnscriptlater animsave_replay_export params = {id = <objid>}
	endif
	structure_control_menu_create {
		vmenu_id = animsave_controls
		text = "AnimSave trim"
		callback = animsave_control_enforce_bounds
		structure = animsave_replay_params
		control_items = [
			{text = "Start" param = start_time min = 0.0 max = <duration> step = 0.01}
			{text = "End" param = end_time min = 0.0 max = <duration> step = 0.01}
		]
		choose_items = [
			{text = "Export, save and preview" pad_choose_script = animsave_replay_export pad_choose_params = {id = <objid>}}
			{text = "Preview without export" pad_choose_script = animsave_replay_go pad_choose_params = {id = <objid>}}
			{text = "" focusable = not_focusable}
			{text = "Exit and keep temp anim" pad_choose_script = animsave_control_exit pad_choose_params = {id = <objid>}}
			{text = "Exit and quit (can't undo!)" pad_choose_script = animsave_control_exit pad_choose_params = {id = <objid> quit}}
		]
		pad_back_script = nullscript
	}
endscript

script animsave_control_enforce_bounds 
	if (<start_time> > <end_time>)
		change animsave_replay_params = {($animsave_replay_params) start_time = <end_time>}
	else
		if (<end_time> < <start_time>)
			change animsave_replay_params = {($animsave_replay_params) end_time = <start_time>}
		endif
	endif
	structure_control_menu_refresh
endscript

script animsave_replay_export 
	<id> :export_save $animsave_replay_params
	if NOT cd
		if ($animsave_replay_params.offline = 1)
			formattext textname = command 'bindproj && animsaveconvert %s' s = $replay_current_name
			runremotescript {
				scriptname = runshellcommand
				params = {
					command = <command>
					async
				}
			}
			create_panel_message text = "Please Wait...make sure you're running QDebug" time = 5000
			block type = animsave_convert_finished
		endif
	endif
	PlayAnimSave name = ($replay_current_name)
endscript

script animsave_replay_go 
	PlayAnimSave name = ($replay_current_name)
endscript

script animsave_control_exit 
	if gotparam \{quit}
		<id> :export_clear
	endif
	skater :unpause
	destroyscreenelement \{id = current_menu}
	restore_start_key_binding
endscript

script record_blink_dot 
	begin
	domorph \{alpha = 1}
	wait \{0.4
		seconds}
	domorph \{alpha = 0}
	wait \{0.4
		seconds}
	repeat
endscript

script time_blink_icon 
	begin
	domorph \{alpha = 1
		time = 0.5}
	domorph \{alpha = 0
		time = 0.5}
	repeat
endscript

script record_time_update 
	begin
	if compositeobjectexists name = <track>
		if <track> :export_isrecording
			<track> :export_getduration
			if (<elapsed_duration> > 30.0)
				if NOT scriptisrunning time_blink_icon
					runscriptonscreenelement id = record_time_icon time_blink_icon
				endif
			endif
			mins = (<elapsed_duration> / 60.0)
			casttointeger mins
			elapsed_duration = (<elapsed_duration> - (<mins> * 60))
			secs = <elapsed_duration>
			casttointeger secs
			hs = ((<elapsed_duration> - <secs>) * 100.0)
			casttointeger hs
			if (<mins> > 99)
				mins = 99
				secs = 59
				hs = 99
			endif
			formattext textname = time "%a:%b.%c" a = <mins> b = <secs> c = <hs> integer_width = 2
			setprops text = <time>
		endif
	endif
	wait 1 gameframe
	repeat
endscript

script animsave_timestamp 
	if NOT innetgame
		skater :export_timestampevent event = <event>
	endif
endscript

script animsave_wait_for_playback 
	if ($replay_currently_playing = 1)
		begin
		printf \{'Waiting to end replay'}
		wait \{1
			gameframe}
		if ($replay_currently_playing = 0)
			break
		endif
		repeat
	endif
endscript
