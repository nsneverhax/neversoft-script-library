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
crowd_ped_camera_fov = 21
crowd_rotate_param = 25.0
crowd_base_viewport_id = crowd_base_viewport
crowd_base_viewport_texture = `tex/models/real_crowd/crowd_atlas0.dds`
crowd_config_xenon = crowd_config_nojiggle_2x_1536_xenon
crowd_config_ps3 = crowd_config_nojiggle_1536_ps3
crowd_config_windx = crowd_config_nojiggle_1024

script crowd_reset \{loading_transition = 0
		restarting = 0}
	if ($game_mode = tutorial)
		return
	endif
	desired_health = 1.0
	if GetNodeFlag \{LS_ENCORE_POST}
		if is_encore_song
			desired_health = 1.6666
		endif
	endif
	Change current_crowd = <desired_health>
	Change average_crowd = <desired_health>
	Change \{total_crowd = 0.0}
	Change \{max_crowd = 0.0}
	Change \{last_time_in_lead = 0.0}
	Change \{last_time_in_lead_player = -1}
	getfirstplayer \{out = first_player}
	if (<Player> = <first_player>)
		StopSoundEvent \{$CurrentlyPlayingOneShotSoundEvent}
		printscriptinfo \{qs(0x9ce58cb5)}
		if ($current_playing_transition = loading)
			if NOT (GetNodeFlag LS_ENCORE_POST)
				Change_Crowd_Looping_SFX \{crowd_looping_state = neutral}
			endif
		elseif ($game_mode = practice)
		elseif ($end_credits = 1 ||
				GetNodeFlag LS_ENCORE_POST)
			if ScriptExists \{loading_screen_crowd_swell}
				KillSpawnedScript \{Name = loading_screen_crowd_swell}
				setsoundbussparams {Crowd_Beds = {vol = ($default_BussSet.Crowd_Beds.vol)} time = 1}
			endif
			printf \{channel = sfx
				qs(0xdf8347c3)}
			Change_Crowd_Looping_SFX \{crowd_looping_state = good}
		elseif (<restarting> = 1)
			printf \{channel = sfx
				qs(0x9c706ee8)}
			if ($calibrate_lag_enabled = 0)
				SpawnScriptNow \{Skate8_SFX_Backgrounds_New_Area
					params = {
						BG_SFX_Area = $current_crowd_looping_bg_area_neutral
						fadeintime = 10
						fadeintype = linear
						fadeouttime = 10
						fadeouttype = linear
					}}
			else
				SpawnScriptNow \{Skate8_SFX_Backgrounds_New_Area
					params = {
						BG_SFX_Area = FrontEnd
						fadeintime = 10
						fadeintype = linear
						fadeouttime = 10
						fadeouttype = linear
					}}
			endif
		else
			printf \{channel = sfx
				qs(0xfadf17f2)}
			printf \{channel = sfx
				qs(0x1e7f8be6)
				s = $current_transition}
			Change_Crowd_Looping_SFX crowd_looping_state = neutral loading_transition = <loading_transition> restarting = <restarting>
		endif
	endif
	getplayerinfo <Player> Band
	setplayerinfo <Player> current_health = <desired_health>
	setbandinfo <Band> current_health = <desired_health>
	CrowdReset
endscript

script forcescore 
	switch $debug_forcescore
		case poor
		health = ($health_poor_medium / 2)
		case medium
		health = (($health_poor_medium + $health_medium_good) / 2)
		case good
		health = (($health_medium_good + $health_scale) / 2)
		default
		health = ($health_poor_medium / 2)
	endswitch
	setplayerinfo <Player> current_health = <health>
	Change current_crowd = <health>
endscript
base_resolve_priority = 7

script create_crowd_models 
	if ($disable_crowd = 1)
		return
	endif
	GetPakManCurrentName \{map = zones}
	formatText checksumName = crowd_models '%s_crowd_models' s = <pakname>
	if NOT GlobalExists Name = <crowd_models>
		return
	endif
	MemPushContext \{heap_crowd}
	setspecificrendertargetheap \{heap_crowd_vram}
	Change crowd_model_array = $<crowd_models>
	GetArraySize $<crowd_models>
	GetPlatform
	if (<Platform> = Xenon)
		crowd_config = $crowd_config_xenon
	elseif (<Platform> = windx)
		crowd_config = $crowd_config_windx
	elseif (<Platform> = PS3)
		crowd_config = $crowd_config_ps3
	else
		ScriptAssert \{qs(0x34a7da06)}
	endif
	base_style = ($<crowd_config>.base_viewport_params.style)
	createviewport {
		Priority = ($base_resolve_priority)
		id = ($crowd_base_viewport_id)
		texture = ($crowd_base_viewport_texture)
		style = <base_style>
	}
	SetViewportProperties {
		viewport = ($crowd_base_viewport_id)
		no_resolve_colorbuffer = ($<crowd_config>.base_viewport_params.no_resolve_color_buffer)
		resolve_invalidated = ($<crowd_config>.base_viewport_params.resolve_invalidated)
		no_resolve_depthstencilbuffer = true
		clear_colorbuffer = FALSE
		clear_depthstencilbuffer = FALSE
		crowd_impostor = true
	}
	crowd_bb_mesh_idx = 0
	begin
	bb_base_sector_name = ($<crowd_models> [<crowd_bb_mesh_idx>].bb_mesh_id)
	addcrowdtovisibilitytest crowdnode = <bb_base_sector_name>
	<crowd_bb_mesh_idx> = (<crowd_bb_mesh_idx> + 1)
	repeat <array_Size>
	array_count = 0
	begin
	Pos = ((-500.0, -200.0, 0.0) + (0.0, -100.0, 0.0) * <array_count>)
	viewport = ($<crowd_models> [<array_count>].id)
	Camera = ($<crowd_models> [<array_count>].Camera)
	bb_sector_name = ($<crowd_models> [<array_count>].bb_mesh_id)
	if NOT StructureContains structure = ($<crowd_models> [<array_count>]) remap_only
		if isps3
			MemPushContext \{BottomUpHeap}
		endif
		CreateFromStructure {
			Pos = <Pos>
			Quat = (0.0, 1.0, 0.0)
			Class = GameObject
			Type = Ghost
			CreatedAtStart
			($<crowd_models> [<array_count>])
			SuspendDistance = 0
			lod_dist1 = 400
			lod_dist2 = 401
			Profile = $Profile_Ped_Crowd_Obj
			LightGroup = Crowd
			interleave_animations
			object_type = Crowd
			ProfileColor = 49344
			profilebudget = 200
			use_jq
		}
		model_id = ($<crowd_models> [<array_count>].Name)
		extra_model = 'Real_Crowd\\Crowd_HandL_Rock.skin'
		<model_id> :AddGeom lhand_rock Model = <extra_model> LightGroup = Crowd
		extra_model = 'Real_Crowd\\Crowd_HandL_Clap.skin'
		<model_id> :AddGeom lhand_clap Model = <extra_model> LightGroup = Crowd
		extra_model = 'Real_Crowd\\Crowd_HandL_Fist.skin'
		<model_id> :AddGeom lhand_fist Model = <extra_model> LightGroup = Crowd
		extra_model = 'Real_Crowd\\Crowd_HandR_Rock.skin'
		<model_id> :AddGeom rhand_rock Model = <extra_model> LightGroup = Crowd
		extra_model = 'Real_Crowd\\Crowd_HandR_Clap.skin'
		<model_id> :AddGeom rhand_clap Model = <extra_model> LightGroup = Crowd
		extra_model = 'Real_Crowd\\Crowd_HandR_Fist.skin'
		<model_id> :AddGeom rhand_fist Model = <extra_model> LightGroup = Crowd
		<model_id> :SwitchOffAtomic lhand_rock
		<model_id> :SwitchOffAtomic lhand_fist
		<model_id> :SwitchOnAtomic lhand_clap
		<model_id> :SwitchOffAtomic rhand_rock
		<model_id> :SwitchOffAtomic rhand_fist
		<model_id> :SwitchOnAtomic rhand_clap
		<model_id> :obj_setnoquadcull
		roty = 0
		if StructureContains structure = ($<crowd_models> [<array_count>]) roty
			roty = ($<crowd_models> [<array_count>].roty)
		endif
		if (<roty> = 0)
			apply_correction = 1
		else
			apply_correction = 0
			($<crowd_models> [<array_count>].Name) :Obj_SetOrientation y = (180 + <roty>)
		endif
		if NOT (<bb_sector_name> = 0)
			toggleintrameshsorting On = 1 objID = <bb_sector_name>
		endif
		if isps3
			MemPopContext \{BottomUpHeap}
		endif
		style = 0x00000000
		use_resource = 0x00000000
		if StructureContains structure = ($<crowd_models> [<array_count>]) resourceviewport
			<use_resource> = ($<crowd_models> [<array_count>].resourceviewport)
		endif
		printstruct <...>
		createviewport {
			Priority = ($base_resolve_priority + 1 + <array_count>)
			id = <viewport>
			texture = ($<crowd_models> [<array_count>].texture)
			style = ($<crowd_config>.ped_viewport_params [<array_count>].style)
			use_resource = <use_resource>
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
		jiggle = ($<crowd_config>.jiggle)
		if (<jiggle> != 0)
			jiggle_index = ($<crowd_config>.index [<array_count>])
		else
			jiggle_index = 0
		endif
		no_resolve_colorbuffer = ($<crowd_config>.ped_viewport_params [<array_count>].no_resolve_color_buffer)
		SetActiveCamera viewport = <viewport> id = <Camera>
		<Camera> :SetHFOV hfov = $crowd_ped_camera_fov
		SetViewportProperties viewport = <viewport> no_resolve_colorbuffer = <no_resolve_colorbuffer> no_resolve_depthstencilbuffer = true crowd_impostor = true jiggle_rendering = <jiggle> jiggle_count = <jiggle_index>
		AddCrowdModelCam Camera = <Camera> Pos = <Pos> viewport = <viewport> apply_correction = <apply_correction>
	endif
	SetSearchAllAssetContexts
	CreateViewportTextureOverride {
		id = <viewport>
		viewportid = <viewport>
		texture = ($<crowd_models> [<array_count>].textureasset)
		texdict = ($<crowd_models> [<array_count>].texdict)
	}
	SetSearchAllAssetContexts \{OFF}
	<array_count> = (<array_count> + 1)
	repeat <array_Size>
	MemPopContext \{heap_crowd}
	setspecificrendertargetheap
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
	crowd_models = $crowd_model_array
	if (<crowd_models> = None)
		return
	endif
	GetArraySize <crowd_models>
	array_count = 0
	begin
	viewport = (<crowd_models> [<array_count>].id)
	objID = (<crowd_models> [<array_count>].Name)
	if NOT StructureContains structure = (<crowd_models> [<array_count>]) remap_only
		if (<Active> = true)
			<objID> :Hide
		else
			<objID> :unhide
		endif
	endif
	<array_count> = (<array_count> + 1)
	repeat <array_Size>
endscript

script destroy_crowd_models 
	ClearCrowdModelCams
	clearcrowdsfromvisibilitytest
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
		SetSearchAllAssetContexts
		DestroyViewportTextureOverride id = (<crowd_models> [<array_count>].id)
		SetSearchAllAssetContexts \{OFF}
		DestroyViewport id = (<crowd_models> [<array_count>].id)
		if CompositeObjectExists Name = (<crowd_models> [<array_count>].Name)
			(<crowd_models> [<array_count>].Name) :Die
		endif
	endif
	<array_count> = (<array_count> + 1)
	repeat <array_Size>
	DestroyViewport id = ($crowd_base_viewport_id)
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
	Wait \{1
		gameframe}
	Crowd_PlayAnim Name = crowd1 anim = <anim> playonce = <playonce>
	Wait \{1
		gameframe}
	Crowd_PlayAnim Name = crowd2 anim = <anim> playonce = <playonce>
	Wait \{1
		gameframe}
	Crowd_PlayAnim Name = crowd3 anim = <anim> playonce = <playonce>
	Wait \{1
		gameframe}
	Crowd_PlayAnim Name = crowd4 anim = <anim> playonce = <playonce>
	Wait \{1
		gameframe}
	Crowd_PlayAnim Name = crowd5 anim = <anim> playonce = <playonce>
	Wait \{1
		gameframe}
	Crowd_PlayAnim Name = crowd6 anim = <anim> playonce = <playonce>
	Wait \{1
		gameframe}
	Crowd_PlayAnim Name = crowd7 anim = <anim> playonce = <playonce>
	Wait \{1
		gameframe}
	Crowd_PlayAnim Name = crowd8 anim = <anim> playonce = <playonce>
endscript

script Crowd_PlayAnim \{Name = crowd1
		anim = Idle
		playonce = FALSE}
	if NOT CompositeObjectExists <Name>
		return
	endif
	if StructureContains structure = ($Crowd_Profiles) Name = <Name>
		anim_set = ($Crowd_Profiles.<Name>.anim_set)
		<Name> :Obj_KillSpawnedScript Name = crowd_play_adjusting_random_anims
		<Name> :Obj_SpawnScriptNow crowd_play_adjusting_random_anims params = {anim_set = <anim_set> anim = <anim> playonce = <playonce>}
	else
		printf channel = Crowd qs(0x0dbcbc63) a = <Name>
	endif
endscript

script Crowd_StageDiver_Hide \{index = 1}
	GetPakManCurrentName \{map = zones}
	formatText checksumName = stagediver '%s_TRG_Ped_StageDive0%a' s = <pakname> a = <index>
	if CompositeObjectExists Name = <stagediver>
		<stagediver> :Hide
	endif
endscript

script Crowd_StageDiver_Jump \{index = 1}
	GetPakManCurrentName \{map = zones}
	formatText checksumName = stagediver '%s_TRG_Ped_StageDive0%a' s = <pakname> a = <index>
	if CompositeObjectExists Name = <stagediver>
		<stagediver> :unhide
		GetPakManCurrent \{map = zones}
		if StructureContains structure = ($stagediver_anims) Name = <pak>
			anims = ($stagediver_anims.<pak>)
		else
			anims = ($stagediver_anims.Default)
		endif
		GetArraySize <anims>
		GetRandomValue Name = anim_index integer a = 0 b = (<array_Size> - 1)
		anim_name = (<anims> [<anim_index>])
		printf channel = Crowd qs(0xb75db1d6) a = <anim_name>
		<stagediver> :GameObj_PlayAnim anim = <anim_name>
		<stagediver> :GameObj_WaitAnimFinished
		<stagediver> :Hide
	else
		printf \{channel = Crowd
			qs(0x7797b93e)}
	endif
endscript
