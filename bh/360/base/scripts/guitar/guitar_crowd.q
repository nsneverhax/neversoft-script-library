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
crowd_base_viewport_texture = `tex/models/Real_Crowd/crowd_atlas0.dds`
crowd_config_xenon = crowd_config_nojiggle_2x_1536_xenon
crowd_config_ps3 = crowd_config_nojiggle_1536_ps3
crowd_config_windx = crowd_config_nojiggle_1024

script crowd_reset \{loading_transition = 0
		restarting = 0}
	GameMode_GetType
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
	GetFirstPlayer \{out = first_player}
	if (<player> = <first_player>)
		StopSoundEvent \{$CurrentlyPlayingOneShotSoundEvent}
		printscriptinfo \{qs(0x9ce58cb5)}
		if ($current_playing_transition = loading)
			if NOT (GetNodeFlag LS_ENCORE_POST)
				Change_Crowd_Looping_SFX \{crowd_looping_state = neutral}
			endif
		elseif ($game_mode = practice)
		elseif ($end_credits = 1 ||
				GetNodeFlag LS_ENCORE_POST)
			if ScriptExists \{Loading_Screen_Crowd_Swell}
				killspawnedscript \{name = Loading_Screen_Crowd_Swell}
				SetSoundBussParams {Crowd_beds = {vol = ($default_BussSet.Crowd_beds.vol)} time = 1}
			endif
			printf \{channel = sfx
				qs(0xdf8347c3)}
			Change_Crowd_Looping_SFX \{crowd_looping_state = good}
		elseif (<restarting> = 1)
			printf \{channel = sfx
				qs(0x9c706ee8)}
			if ($calibrate_lag_enabled = 0)
				if NOT (<type> = freeplay)
					spawnscriptnow \{Skate8_SFX_Backgrounds_New_Area
						params = {
							BG_SFX_Area = $Current_Crowd_Looping_BG_Area_Neutral
							fadeintime = 10
							fadeintype = linear
							fadeouttime = 10
							fadeouttype = linear
						}}
				endif
			else
				spawnscriptnow \{Skate8_SFX_Backgrounds_New_Area
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
	GetPlayerInfo <player> Band
	SetPlayerInfo <player> current_health = <desired_health>
	SetBandInfo <Band> current_health = <desired_health>
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
	SetPlayerInfo <player> current_health = <health>
	Change current_crowd = <health>
endscript
base_resolve_priority = 7

script create_crowd_models 
	if ($disable_crowd = 1)
		return
	endif
	GetPakManCurrentName \{map = zones}
	FormatText checksumname = crowd_models '%s_crowd_models' s = <pakname>
	if NOT GlobalExists name = <crowd_models>
		return
	endif
	MemPushContext \{heap_crowd}
	SetSpecificRenderTargetHeap \{heap_crowd_vram}
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
	CreateViewport {
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
		clear_colorbuffer = false
		clear_depthstencilbuffer = false
		crowd_impostor = true
	}
	crowd_bb_mesh_idx = 0
	begin
	bb_base_sector_name = ($<crowd_models> [<crowd_bb_mesh_idx>].bb_mesh_id)
	AddCrowdToVisibilityTest CrowdNode = <bb_base_sector_name>
	<crowd_bb_mesh_idx> = (<crowd_bb_mesh_idx> + 1)
	repeat <array_size>
	array_count = 0
	begin
	Pos = ((-500.0, -200.0, 0.0) + (0.0, -100.0, 0.0) * <array_count>)
	viewport = ($<crowd_models> [<array_count>].id)
	Camera = ($<crowd_models> [<array_count>].Camera)
	bb_sector_name = ($<crowd_models> [<array_count>].bb_mesh_id)
	if NOT StructureContains structure = ($<crowd_models> [<array_count>]) remap_only
		if IsPS3
			MemPushContext \{BottomUpHeap}
		endif
		CreateFromStructure {
			Pos = <Pos>
			Quat = (0.0, 1.0, 0.0)
			Class = GameObject
			type = Ghost
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
		model_id = ($<crowd_models> [<array_count>].name)
		if (<pakname> = 'z_cabo')
			extra_model1 = 'Real_Crowd\\Crowd_HandL_Rock_Cabo.skin'
			extra_model2 = 'Real_Crowd\\Crowd_HandL_Clap_Cabo.skin'
			extra_model3 = 'Real_Crowd\\Crowd_HandL_Fist_Cabo.skin'
			extra_model4 = 'Real_Crowd\\Crowd_HandR_Rock_Cabo.skin'
			extra_model5 = 'Real_Crowd\\Crowd_HandR_Clap_Cabo.skin'
			extra_model6 = 'Real_Crowd\\Crowd_HandR_Fist_Cabo.skin'
		else
			extra_model1 = 'Real_Crowd\\Crowd_HandL_Rock.skin'
			extra_model2 = 'Real_Crowd\\Crowd_HandL_Clap.skin'
			extra_model3 = 'Real_Crowd\\Crowd_HandL_Fist.skin'
			extra_model4 = 'Real_Crowd\\Crowd_HandR_Rock.skin'
			extra_model5 = 'Real_Crowd\\Crowd_HandR_Clap.skin'
			extra_model6 = 'Real_Crowd\\Crowd_HandR_Fist.skin'
		endif
		<model_id> :AddGeom lhand_rock Model = <extra_model1> LightGroup = Crowd
		<model_id> :AddGeom lhand_clap Model = <extra_model2> LightGroup = Crowd
		<model_id> :AddGeom lhand_fist Model = <extra_model3> LightGroup = Crowd
		<model_id> :AddGeom rhand_rock Model = <extra_model4> LightGroup = Crowd
		<model_id> :AddGeom rhand_clap Model = <extra_model5> LightGroup = Crowd
		<model_id> :AddGeom rhand_fist Model = <extra_model6> LightGroup = Crowd
		<model_id> :SwitchOffAtomic lhand_rock
		<model_id> :SwitchOffAtomic lhand_fist
		<model_id> :SwitchOnAtomic lhand_clap
		<model_id> :SwitchOffAtomic rhand_rock
		<model_id> :SwitchOffAtomic rhand_fist
		<model_id> :SwitchOnAtomic rhand_clap
		<model_id> :Obj_SetNoQuadCull
		roty = 0
		if StructureContains structure = ($<crowd_models> [<array_count>]) roty
			roty = ($<crowd_models> [<array_count>].roty)
		endif
		if (<roty> = 0)
			apply_correction = 1
		else
			apply_correction = 0
			($<crowd_models> [<array_count>].name) :Obj_SetOrientation y = (180 + <roty>)
		endif
		if NOT (<bb_sector_name> = 0)
			ToggleIntraMeshSorting on = 1 objID = <bb_sector_name>
		endif
		if IsPS3
			MemPopContext \{BottomUpHeap}
		endif
		style = 0x00000000
		use_resource = 0x00000000
		if StructureContains structure = ($<crowd_models> [<array_count>]) ResourceViewport
			<use_resource> = ($<crowd_models> [<array_count>].ResourceViewport)
		endif
		printstruct <...>
		CreateViewport {
			Priority = ($base_resolve_priority + 1 + <array_count>)
			id = <viewport>
			texture = ($<crowd_models> [<array_count>].texture)
			style = ($<crowd_config>.ped_viewport_params [<array_count>].style)
			use_resource = <use_resource>
		}
		CreateCompositeObjectInstance {
			Priority = $COIM_Priority_Permanent
			heap = generic
			components = [
				{component = Camera}
			]
			params = {
				name = <Camera>
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
		<Camera> :SetHFov hfov = $crowd_ped_camera_fov
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
	SetSearchAllAssetContexts \{off}
	<array_count> = (<array_count> + 1)
	repeat <array_size>
	MemPopContext \{heap_crowd}
	SetSpecificRenderTargetHeap
endscript

script update_crowd_model_cam 
	crowd_scaler = 25
	begin
	GetViewportCameraOrient \{viewport = bg_viewport}
	GetVectorComponents <at>
	angle = (<x> * <crowd_scaler>)
	RotateVector vector = <at> ry = <angle>
	at = <result_vector>
	RotateVector vector = <left> ry = <angle>
	left = <result_vector>
	RotateVector vector = <up> ry = <angle>
	up = <result_vector>
	posdir = (<model_pos> + (0.0, 1.0, 0.0) + (<at> * 3.5))
	<Camera> :Obj_SetPosition position = <posdir>
	<Camera> :Obj_SetOrientation Dir = <at> only handles upright Cameras
	SetViewportCameraOrient viewport = <viewport> at = <at> left = <left> up = <up>
	<Camera> :UnPause
	wait \{1
		gameframe}
	repeat
endscript

script hide_crowd_models \{active = true}
	crowd_models = $crowd_model_array
	if (<crowd_models> = None)
		return
	endif
	GetArraySize <crowd_models>
	array_count = 0
	begin
	viewport = (<crowd_models> [<array_count>].id)
	objID = (<crowd_models> [<array_count>].name)
	if NOT StructureContains structure = (<crowd_models> [<array_count>]) remap_only
		if (<active> = true)
			<objID> :hide
		else
			<objID> :unhide
		endif
	endif
	<array_count> = (<array_count> + 1)
	repeat <array_size>
endscript

script Destroy_Crowd_Models 
	ClearCrowdModelCams
	ClearCrowdsFromVisibilityTest
	crowd_models = $crowd_model_array
	if (<crowd_models> = None)
		return
	endif
	GetArraySize <crowd_models>
	array_count = 0
	begin
	if NOT StructureContains structure = (<crowd_models> [<array_count>]) remap_only
		killspawnedscript \{name = update_crowd_model_cam}
		if CompositeObjectExists name = (<crowd_models> [<array_count>].Camera)
			(<crowd_models> [<array_count>].Camera) :Die
		endif
		if ScreenElementExists id = (<crowd_models> [<array_count>].id)
			SetSearchAllAssetContexts
			DestroyViewportTextureOverride id = (<crowd_models> [<array_count>].id)
			SetSearchAllAssetContexts \{off}
			DestroyScreenElement id = (<crowd_models> [<array_count>].id)
		endif
		SetSearchAllAssetContexts
		DestroyViewportTextureOverride id = (<crowd_models> [<array_count>].id)
		SetSearchAllAssetContexts \{off}
		DestroyViewport id = (<crowd_models> [<array_count>].id)
		if CompositeObjectExists name = (<crowd_models> [<array_count>].name)
			(<crowd_models> [<array_count>].name) :Die
		endif
	endif
	<array_count> = (<array_count> + 1)
	repeat <array_size>
	DestroyViewport id = ($crowd_base_viewport_id)
	Change \{crowd_model_array = None}
endscript

script set_crowd_hand \{hand = left
		type = clap}
	Obj_GetID
	name = <objID>
	if (<hand> = left)
		switch (<type>)
			case rock
			part = lhand_rock
			case clap
			part = lhand_clap
			case fist
			part = lhand_fist
		endswitch
		<name> :SwitchOffAtomic lhand_rock
		<name> :SwitchOffAtomic lhand_clap
		<name> :SwitchOffAtomic lhand_fist
		<name> :SwitchOnAtomic <part>
	else
		switch (<type>)
			case rock
			part = rhand_rock
			case clap
			part = rhand_clap
			case fist
			part = rhand_fist
		endswitch
		<name> :SwitchOffAtomic rhand_rock
		<name> :SwitchOffAtomic rhand_clap
		<name> :SwitchOffAtomic rhand_fist
		<name> :SwitchOnAtomic <part>
	endif
endscript

script Crowd_AllPlayAnim \{playonce = false}
	wait \{1
		gameframe}
	Crowd_PlayAnim name = crowd1 anim = <anim> playonce = <playonce>
	wait \{1
		gameframe}
	Crowd_PlayAnim name = crowd2 anim = <anim> playonce = <playonce>
	wait \{1
		gameframe}
	Crowd_PlayAnim name = crowd3 anim = <anim> playonce = <playonce>
	wait \{1
		gameframe}
	Crowd_PlayAnim name = crowd4 anim = <anim> playonce = <playonce>
	wait \{1
		gameframe}
	Crowd_PlayAnim name = crowd5 anim = <anim> playonce = <playonce>
	wait \{1
		gameframe}
	Crowd_PlayAnim name = crowd6 anim = <anim> playonce = <playonce>
	wait \{1
		gameframe}
	Crowd_PlayAnim name = crowd7 anim = <anim> playonce = <playonce>
	wait \{1
		gameframe}
	Crowd_PlayAnim name = crowd8 anim = <anim> playonce = <playonce>
endscript

script Crowd_PlayAnim \{name = crowd1
		anim = Idle
		playonce = false}
	if NOT CompositeObjectExists <name>
		return
	endif
	if StructureContains structure = ($Crowd_Profiles) name = <name>
		anim_set = ($Crowd_Profiles.<name>.anim_set)
		<name> :Obj_KillSpawnedScript name = crowd_play_adjusting_random_anims
		<name> :Obj_SpawnScriptNow crowd_play_adjusting_random_anims params = {anim_set = <anim_set> anim = <anim> playonce = <playonce>}
	else
		printf channel = Crowd qs(0x0dbcbc63) a = <name>
	endif
endscript

script Crowd_StageDiver_Hide \{index = 1}
	GetPakManCurrentName \{map = zones}
	FormatText checksumname = stagediver '%s_TRG_Ped_StageDive0%a' s = <pakname> a = <index>
	if CompositeObjectExists name = <stagediver>
		<stagediver> :hide
	endif
endscript

script Crowd_StageDiver_Jump \{index = 1}
	GetPakManCurrentName \{map = zones}
	FormatText checksumname = stagediver '%s_TRG_Ped_StageDive0%a' s = <pakname> a = <index>
	if CompositeObjectExists name = <stagediver>
		<stagediver> :unhide
		GetPakManCurrent \{map = zones}
		if StructureContains structure = ($stagediver_anims) name = <pak>
			Anims = ($stagediver_anims.<pak>)
		else
			Anims = ($stagediver_anims.Default)
		endif
		GetArraySize <Anims>
		GetRandomValue name = anim_index integer a = 0 b = (<array_size> - 1)
		anim_name = (<Anims> [<anim_index>])
		printf channel = Crowd qs(0xb75db1d6) a = <anim_name>
		<stagediver> :GameObj_PlayAnim anim = <anim_name>
		<stagediver> :GameObj_WaitAnimFinished
		<stagediver> :hide
	else
		printf \{channel = Crowd
			qs(0x7797b93e)}
	endif
endscript
