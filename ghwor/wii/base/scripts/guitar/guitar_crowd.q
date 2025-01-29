current_crowd = 1.0
average_crowd = 1.0
total_crowd = 0.0
max_crowd = 0.0
crowd_scale = 2.0
health_scale = 2.0
crowd_debug_mode = 0
viewercam_nofail = 0
crowd_ped_camera_dist = 3.5
crowd_ped_camera_height = 1.07
crowd_ped_camera_fov = 19
crowd_base_viewport_id = crowd_base_viewport
crowd_base_viewport_texture = `tex/zones/Demo/tw_billboard01.dds`
g_crowd_audio_anim_cues_enabled = 0

script crowd_reset \{loading_transition = 0
		restarting = 0}
	if ($game_mode = tutorial)
		return
	endif
	desired_health = 1.0
	Change current_crowd = <desired_health>
	Change average_crowd = <desired_health>
	Change \{total_crowd = 0.0}
	Change \{max_crowd = 0.0}
	getfirstplayer \{out = first_player}
	if (<Player> = <first_player>)
		StopSoundEvent \{$CurrentlyPlayingOneShotSoundEvent}
		if ($current_playing_transition = loading)
			if NOT (GetNodeFlag LS_ENCORE_POST)
			endif
		elseif ($game_mode = practice)
		elseif ($end_credits = 1 ||
				GetNodeFlag LS_ENCORE_POST)
			if ScriptExists \{audio_crowd_play_loading_screen_swell}
				KillSpawnedScript \{Name = audio_crowd_play_loading_screen_swell}
				setsoundbussparams {Crowd_Beds = {vol = ($default_BussSet.Crowd_Beds.vol)} time = 1}
			endif
		elseif (<restarting> = 1)
			if ($calibrate_lag_enabled = 0)
				SpawnScriptNow \{sfx_backgrounds_new_area
					params = {
						BG_SFX_Area = $g_current_crowd_looping_bg_area_neutral
						fadeintime = 10
						fadeintype = linear
						fadeouttime = 10
						fadeouttype = linear
					}}
			else
				SpawnScriptNow \{sfx_backgrounds_new_area
					params = {
						BG_SFX_Area = FrontEnd
						fadeintime = 10
						fadeintype = linear
						fadeouttime = 10
						fadeouttype = linear
					}}
			endif
		else
		endif
	endif
	getplayerinfo <Player> Band
	setplayerinfo <Player> current_health = <desired_health>
	setbandinfo <Band> current_health = <desired_health>
	CrowdReset
	playlist_getcurrentsong
	get_song_prefix song = <current_song>
	formatText checksumName = scriptevents '%s_scriptevents' s = <song_prefix> AddToStringLookup = true
	Change \{g_crowd_audio_anim_cues_enabled = 1}
	if songglobalexists Name = <scriptevents>
		if checkscriptevents Name = <scriptevents> event = change_crowd_state
			KillSpawnedScript \{Name = crowd_playanim_spawned}
			Change \{g_crowd_audio_anim_cues_enabled = 0}
		endif
	endif
endscript
base_resolve_priority = 7

script create_crowd_models 
	if ($disable_crowd = 1)
		return
	endif
	GetPakManCurrentName \{map = zones}
	formatText checksumName = crowd_models '%s_crowd_models' s = <pakname>
	printf qs(0xe646bdf6) s = <pakname>
	if NOT GlobalExists Name = <crowd_models>
		return
	endif
	Change crowd_model_array = $<crowd_models>
	GetArraySize $<crowd_models>
	array_count = 0
	begin
	Pos = ((-500.0, -200.0, 0.0) + (0.0, -100.0, 0.0) * <array_count>)
	viewport = ($<crowd_models> [<array_count>].id)
	Camera = ($<crowd_models> [<array_count>].Camera)
	bb_sector_name = ($<crowd_models> [<array_count>].bb_mesh_id)
	if NOT StructureContains structure = ($<crowd_models> [<array_count>]) remap_only
		MemPushContext \{BottomUpHeap}
		CreateFromStructure {
			spouse = <viewport>
			Pos = <Pos>
			Quat = (0.0, 1.0, 0.0)
			Class = GameObject
			Type = Ghost
			CreatedAtStart
			Profile = $Profile_Ped_Crowd_Obj
			($<crowd_models> [<array_count>])
			SuspendDistance = 0
			lod_dist1 = 400
			lod_dist2 = 401
			LightGroup = Crowd
			interleave_animations
			object_type = Crowd
			ProfileColor = 49344
			profilebudget = 200
			use_jq
			viewports = [all]
		}
		model_id = ($<crowd_models> [<array_count>].Name)
		extra_model = 'Real_Crowd\\Crowd_HandL_Lighter.skin'
		<model_id> :AddGeom lhand_lighter Model = <extra_model> LightGroup = Crowd spouse = <viewport>
		extra_model = 'Real_Crowd\\Crowd_HandL_Rock.skin'
		<model_id> :AddGeom lhand_rock Model = <extra_model> LightGroup = Crowd spouse = <viewport>
		extra_model = 'Real_Crowd\\Crowd_HandL_Clap.skin'
		<model_id> :AddGeom lhand_clap Model = <extra_model> LightGroup = Crowd spouse = <viewport>
		extra_model = 'Real_Crowd\\Crowd_HandR_Lighter.skin'
		<model_id> :AddGeom rhand_lighter Model = <extra_model> LightGroup = Crowd spouse = <viewport>
		extra_model = 'Real_Crowd\\Crowd_HandR_Rock.skin'
		<model_id> :AddGeom rhand_rock Model = <extra_model> LightGroup = Crowd spouse = <viewport>
		extra_model = 'Real_Crowd\\Crowd_HandR_Clap.skin'
		<model_id> :AddGeom rhand_clap Model = <extra_model> LightGroup = Crowd spouse = <viewport>
		extra_model = 'Real_Crowd\\Crowd_HandR_Fist.skin'
		<model_id> :AddGeom rhand_fist Model = <extra_model> LightGroup = Crowd spouse = <viewport>
		<model_id> :SwitchOffAtomic lhand_lighter
		<model_id> :SwitchOffAtomic lhand_rock
		<model_id> :SwitchOnAtomic lhand_clap
		<model_id> :SwitchOffAtomic rhand_lighter
		<model_id> :SwitchOffAtomic rhand_rock
		<model_id> :SwitchOffAtomic rhand_fist
		<model_id> :SwitchOnAtomic rhand_clap
		if StructureContains structure = ($<crowd_models> [<array_count>]) roty
			($<crowd_models> [<array_count>].Name) :Obj_SetOrientation y = ($<crowd_models> [<array_count>].roty)
			apply_correction = 0
		else
			apply_correction = 1
		endif
		MemPopContext \{BottomUpHeap}
		style = imposter_rendering
		if (<array_Size> <= 6)
			if isXenon
				style = imposter_rendering_highres
			endif
		endif
		CreateScreenElement {
			parent = root_window
			just = [center center]
			Type = ViewportElement
			id = <viewport>
			texture = ($<crowd_models> [<array_count>].texture)
			Pos = (2000.0, 200.0)
			dims = (64.0, 64.0)
			alpha = 1
			style = <style>
		}
		CreateCompositeObjectInstance {
			Priority = $COIM_Priority_Permanent
			Heap = Generic
			components = [
				{component = Camera}
			]
			params = {
				Name = <Camera>
				viewport = <viewport>
				object_type = Crowd
				ProfileColor = 12632064
				profilebudget = 10
				use_jq
				far_clip = 20
			}
		}
		SetActiveCamera viewport = <viewport> id = <Camera>
		<Camera> :SetHFOV hfov = $crowd_ped_camera_fov
		SetViewportProperties viewport = <viewport> no_resolve_depthstencilbuffer = true
		AddCrowdModelCam Camera = <Camera> Pos = <Pos> viewport = <viewport> apply_correction = <apply_correction>
	endif
	SetSearchAllAssetContexts
	CreateViewportTextureOverride {
		id = <viewport>
		viewportid = <viewport>
		model_id = ($<crowd_models> [<array_count>].Name)
		texture = ($<crowd_models> [<array_count>].textureasset)
		texdict = ($<crowd_models> [<array_count>].texdict)
	}
	SetSearchAllAssetContexts \{OFF}
	GetPlatform
	if (<Platform> = PS2 || <Platform> = ngc)
		SetViewportProperties viewport = <viewport> Priority = 10.0
	endif
	<model_id> :anim_enable
	<array_count> = (<array_count> + 1)
	repeat <array_Size>
	printf \{qs(0x5311b18f)}
endscript

script update_crowd_model_cam 
	crowd_scaler = 25
	begin
	GetViewportCameraOrient \{viewport = bg_viewport}
	GetVectorComponents <at>
	angle = (<X> * <crowd_scaler>)
	RotateVector vector = <at> ry = <angle>
	at = <result_vector>
	RotateVector vector = <left> ry = <angle>
	left = <result_vector>
	RotateVector vector = <up> ry = <angle>
	up = <result_vector>
	posdir = (<model_pos> + (0.0, 1.0, 0.0) + (<at> * 3.5))
	<Camera> :Obj_SetPosition position = <posdir>
	<Camera> :Obj_SetOrientation Dir = <at> Only handles upright cameras
	SetViewportCameraOrient viewport = <viewport> at = <at> left = <left> up = <up>
	<Camera> :Unpause
	Wait \{1
		gameframe}
	repeat
endscript

script hide_crowd_models \{Active = true}
	if GotParam \{from_scriptevent}
		wait_for_next_odd_frame
		Wait \{5
			gameframes}
	endif
	crowd_models = $crowd_model_array
	if (<crowd_models> != None)
		GetArraySize <crowd_models>
		array_count = 0
		begin
		viewport = (<crowd_models> [<array_count>].id)
		objID = (<crowd_models> [<array_count>].Name)
		if ObjectExists id = <objID>
			if NOT StructureContains structure = (<crowd_models> [<array_count>]) remap_only
				if (<Active> = true)
					<objID> :Hide
				else
					<objID> :unhide
				endif
			endif
		endif
		<array_count> = (<array_count> + 1)
		repeat <array_Size>
	endif
endscript

script destroy_crowd_models 
	ClearCrowdModelCams
	destroycrowd3d
	crowd_models = $crowd_model_array
	if (<crowd_models> = None)
		return
	endif
	GetArraySize <crowd_models>
	array_count = 0
	begin
	if NOT StructureContains structure = (<crowd_models> [<array_count>]) remap_only
		KillSpawnedScript \{Name = update_crowd_model_cam}
		if CompositeObjectExists Name = (<crowd_models> [<array_count>].Camera)
			(<crowd_models> [<array_count>].Camera) :Die
		endif
		if ScreenElementExists id = (<crowd_models> [<array_count>].id)
			SetSearchAllAssetContexts
			DestroyViewportTextureOverride id = (<crowd_models> [<array_count>].id)
			SetSearchAllAssetContexts \{OFF}
			DestroyScreenElement id = (<crowd_models> [<array_count>].id)
		endif
		if CompositeObjectExists Name = (<crowd_models> [<array_count>].Name)
			(<crowd_models> [<array_count>].Name) :Die
		endif
	endif
	<array_count> = (<array_count> + 1)
	repeat <array_Size>
	Change \{crowd_model_array = None}
endscript

script set_crowd_hand \{hand = left
		Type = clap}
	Obj_GetID
	Name = <objID>
	if (<hand> = left)
		switch (<Type>)
			case rock
			part = lhand_rock
			case clap
			part = lhand_clap
			case fist
			part = lhand_fist
		endswitch
		<Name> :SwitchOffAtomic lhand_rock
		<Name> :SwitchOffAtomic lhand_clap
		<Name> :SwitchOffAtomic lhand_fist
		<Name> :SwitchOnAtomic <part>
	else
		switch (<Type>)
			case rock
			part = rhand_rock
			case clap
			part = rhand_clap
			case fist
			part = rhand_fist
		endswitch
		<Name> :SwitchOffAtomic rhand_rock
		<Name> :SwitchOffAtomic rhand_clap
		<Name> :SwitchOffAtomic rhand_fist
		<Name> :SwitchOnAtomic <part>
	endif
endscript

script Crowd_AllPlayAnim \{playonce = FALSE}
	if ($g_crowd_audio_anim_cues_enabled = 0)
		return
	endif
	if CompositeObjectExists \{crowd3d_model1}
		Name = crowd3d_model1
	else
		if CompositeObjectExists \{crowd1}
			Name = crowd1
		else
			return
		endif
	endif
	<Name> :Obj_KillSpawnedScript Name = crowd_playanim_spawned
	<Name> :Obj_SpawnScriptNow crowd_playanim_spawned params = {anim = <anim> playonce = <playonce>}
endscript

script crowd_playanim_spawned \{playonce = FALSE}
	enable_swell = 1
	switch <anim>
		case swellsh
		peak_time = 2.5
		fade_time = 6.5
		case swellmd
		peak_time = 4.0
		fade_time = 8.0
		case swelllg
		peak_time = 0.5
		fade_time = 7.0
		case Idle
		enable_swell = 0
		change_crowd_state \{new_state = mellow}
		Wait \{5
			Seconds}
	endswitch
	if (<enable_swell> = 1)
		hero_get_skill_level_cfunc
		switch <skill>
			case bad
			change_crowd_state \{new_state = mellow}
			Wait (<peak_time> / 2) Seconds
			change_crowd_state \{new_state = interested}
			Wait (<peak_time> / 2) Seconds
			Wait (<fade_time> / 2) Seconds
			change_crowd_state \{new_state = mellow}
			Wait (<fade_time> / 2) Seconds
			case Normal
			change_crowd_state \{new_state = interested}
			Wait (<peak_time> / 2) Seconds
			change_crowd_state \{new_state = stoked}
			Wait (<peak_time> / 2) Seconds
			Wait (<fade_time> / 2) Seconds
			change_crowd_state \{new_state = interested}
			Wait (<fade_time> / 2) Seconds
			case good
			change_crowd_state \{new_state = stoked}
			Wait (<peak_time> / 2) Seconds
			change_crowd_state \{new_state = insane}
			Wait (<peak_time> / 2) Seconds
			Wait (<fade_time> / 2) Seconds
			change_crowd_state \{new_state = stoked}
			Wait (<fade_time> / 2) Seconds
		endswitch
	endif
	begin
	hero_get_skill_level_cfunc
	switch <skill>
		case bad
		change_crowd_state \{new_state = mellow}
		case Normal
		change_crowd_state \{new_state = interested}
		case good
		change_crowd_state \{new_state = stoked}
	endswitch
	Wait \{4
		Seconds}
	repeat
endscript

script Crowd_StageDiver_Hide \{index = 1}
	GetPakManCurrentName \{map = zones}
	formatText checksumName = stagediver '%s_TRG_Ped_StageDive0%a' s = <pakname> a = <index>
	if CompositeObjectExists Name = <stagediver>
		<stagediver> :Hide
	endif
endscript
crowd3d_static_tree = {
	id = Body
	Type = DegenerateBlend
}

script destroycrowd3d 
	<crowd_models> = [
		crowd3d_model1
		crowd3d_model1_anim1
		crowd3d_model1_anim2
		crowd3d_model1_anim3
		crowd3d_model1_anim4
		crowd3d_model2
		crowd3d_model2_anim1
		crowd3d_model2_anim2
		crowd3d_model2_anim3
		crowd3d_model2_anim4
		crowd3d_model3
		crowd3d_model3_anim1
		crowd3d_model3_anim2
		crowd3d_model3_anim3
		crowd3d_model3_anim4
		crowd3d_model4
		crowd3d_model4_anim1
		crowd3d_model4_anim2
		crowd3d_model4_anim3
		crowd3d_model4_anim4
	]
	GetArraySize <crowd_models>
	i = 0
	begin
	<Name> = (<crowd_models> [<i>])
	if CompositeObjectExists Name = <Name>
		<Name> :Die
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	Change \{crowd_3d_model_array = None}
endscript
