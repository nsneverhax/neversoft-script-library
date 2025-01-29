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

script crowd_reset 
	if ($game_mode = tutorial)
		return
	endif
	if GetNodeFlag \{LS_ENCORE_POST}
		Change \{current_crowd = 1.6666}
		Change \{average_crowd = 1.6666}
	else
		Change \{current_crowd = 1.0}
		Change \{average_crowd = 1.0}
	endif
	Change \{total_crowd = 0.0}
	Change \{max_crowd = 0.0}
	Change \{last_time_in_lead = 0.0}
	Change \{last_time_in_lead_player = -1}
	getfirstplayer \{out = first_player}
	if (<Player> = <first_player>)
		StopSoundEvent \{$CurrentlyPlayingOneShotSoundEvent}
		if ($game_mode = practice)
			BG_Crowd_Front_End_Silence \{immediate = 1}
		elseif ($end_credits = 1 ||
				GetNodeFlag LS_ENCORE_POST)
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
	setbandinfo <Band> current_health = 1.0
	setplayerinfo <Player> current_health = 1.0
	CrowdReset
endscript

script forcescore 
	ScriptAssert \{'forcescore: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
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
			object_type = Crowd
			ProfileColor = 49344
			profilebudget = 200
			use_jq
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
	<array_count> = (<array_count> + 1)
	repeat <array_Size>
	printf \{qs(0x5311b18f)}
endscript

script create_mii_crowd_models 
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
	GetArraySize ($z_freestyle_skins.male)
	male_num = <array_Size>
	GetArraySize ($z_freestyle_skins.female)
	female_num = <array_Size>
	GetRandomValue Name = male_index a = 0 b = (<male_num> -1) integer
	GetRandomValue Name = female_index a = 0 b = (<female_num> -1) integer
	GetArraySize $<crowd_models>
	crowd_size = <array_Size>
	array_count = 0
	begin
	Profile = ($preset_mii_guitarist_profile)
	if NOT get_key_from_appearance key = Skeleton appearance = (<Profile>.appearance)
		ScriptAssert \{'Missing skeleton in appearance'}
	endif
	Pos = ((-500.0, -200.0, 0.0) + (0.0, -100.0, 0.0) * <array_count>)
	crowd_member = ($<crowd_models> [<array_count>])
	viewport = (<crowd_member>.id)
	Camera = (<crowd_member>.Camera)
	bb_sector_name = (<crowd_member>.bb_mesh_id)
	if NOT StructureContains structure = <crowd_member> remap_only
		MemPushContext \{BottomUpHeap}
		freestyle_choose_random_mii_params
		freestyle_add_used_mii index = <mii_index> database = <mii_database>
		model_id = (<crowd_member>.Name)
		if miiisfemale index = <mii_index> database = <mii_database>
			skin = (($z_freestyle_skins.female) [<female_index>])
			female_index = (<female_index> + 1)
			if (<female_index> >= <female_num>)
				female_index = 0
			endif
		else
			skin = (($z_freestyle_skins.male) [<male_index>])
			male_index = (<male_index> + 1)
			if (<male_index> >= <male_num>)
				male_index = 0
			endif
		endif
		setstructureparam struct_name = crowd_member param = Model value = <skin>
		CreateFromStructure {
			spouse = <viewport>
			Pos = <Pos>
			Quat = (0.0, 1.0, 0.0)
			Class = GameObject
			Type = Ghost
			CreatedAtStart
			Name = <model_id>
			mii_crowd
			Profile = <Profile>
			<crowd_member>
			SuspendDistance = 0
			lod_dist1 = 400
			lod_dist2 = 401
			LightGroup = Crowd
			object_type = Crowd
			ProfileColor = 49344
			profilebudget = 200
			use_jq
			components = [
				{
					component = Skeleton
					skeletonname = <Skeleton>
					allow_reset
				}
				{
					component = SetDisplayMatrix
				}
				{
					component = AnimTree
					skeletonname = <Skeleton>
				}
				{
					component = motion
				}
				{
					component = modelbuilder
				}
				{
					component = miihead
					attach_bone = bone_head
					mii_index = <mii_index>
					mii_database = <mii_database>
					mii_expressions = [blink]
					mii_resolution = 64
					spouse = <viewport>
				}
			]
		}
		get_body_checksum_from_appearance appearance = (<Profile>.appearance)
		<model_id> :SetTags asset_heap = <asset_heap>
		<model_id> :SetTags body_checksum = <body_checksum>
		<model_id> :SetTags is_female = <is_female>
		generatechecksumfromstruct struct = (<Profile>.appearance)
		<model_id> :SetTags appearance_checksum = <structure_checksum>
		<model_id> :SetTags geom_heap = <asset_heap>
		node_ids = $nondrummer_anim_node_ids
		desired_tree = mii_crowd_static_tree
		<model_id> :Anim_InitTree {
			Tree = $<desired_tree>
			NodeIdDeclaration = <node_ids>
		}
		if StructureContains structure = <crowd_member> roty
			<crowd_member> :Obj_SetOrientation y = (<crowd_member>.roty)
			apply_correction = 0
		else
			apply_correction = 1
		endif
		MemPopContext \{BottomUpHeap}
		style = imposter_rendering
		CreateScreenElement {
			parent = root_window
			just = [center center]
			Type = ViewportElement
			id = <viewport>
			texture = (<crowd_member>.texture)
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
		model_id = <model_id>
		texture = (<crowd_member>.textureasset)
		texdict = (<crowd_member>.texdict)
	}
	SetSearchAllAssetContexts \{OFF}
	GetPlatform
	if (<Platform> = PS2 || <Platform> = ngc)
		SetViewportProperties viewport = <viewport> Priority = 10.0
	endif
	<array_count> = (<array_count> + 1)
	mii_index = (<mii_index> + 1)
	repeat <crowd_size>
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
	WaitOneGameFrame
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
			case lighter
			part = lhand_lighter
			case rock
			part = lhand_rock
			case clap
			part = lhand_clap
			case fist
			return
			default
			return
		endswitch
		<Name> :SwitchOffAtomic lhand_lighter
		<Name> :SwitchOffAtomic lhand_rock
		<Name> :SwitchOffAtomic lhand_clap
		<Name> :SwitchOffAtomic lhand_fist
		<Name> :SwitchOnAtomic <part>
	else
		switch (<Type>)
			case lighter
			part = rhand_lighter
			case rock
			part = rhand_rock
			case clap
			part = rhand_clap
			case fist
			part = rhand_fist
			default
			return
		endswitch
		<Name> :SwitchOffAtomic rhand_lighter
		<Name> :SwitchOffAtomic rhand_rock
		<Name> :SwitchOffAtomic rhand_clap
		<Name> :SwitchOffAtomic rhand_fist
		<Name> :SwitchOnAtomic <part>
	endif
endscript

script Crowd_SetHand \{Name = crowd1
		hand = left
		Type = clap}
	if CompositeObjectExists <Name>
		<Name> :set_crowd_hand hand = <hand> Type = <Type>
	endif
endscript

script Crowd_StartLighters 
	ScriptAssert \{'Crowd_StartLighters: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script crowd_monitor_performance 
	lighters_on = FALSE
	begin
	get_skill_level
	if (<skill> != bad)
		if (<lighters_on> = FALSE)
			Crowd_AllSetHand \{hand = right
				Type = lighter}
			Crowd_AllPlayAnim \{anim = special}
			lighters_on = true
			Crowd_ToggleLighters \{On}
		endif
	else
		if (<lighters_on> = true)
			Crowd_AllSetHand \{hand = right
				Type = clap}
			Crowd_AllPlayAnim \{anim = Idle}
			lighters_on = FALSE
			Crowd_ToggleLighters \{OFF}
		endif
	endif
	WaitOneGameFrame
	repeat
endscript

script Crowd_StopLighters 
	ScriptAssert \{'Crowd_StopLighters: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script Crowd_AllSetHand 
	Crowd_SetHand Name = crowd1 hand = <hand> Type = <Type>
	Crowd_SetHand Name = crowd2 hand = <hand> Type = <Type>
	Crowd_SetHand Name = crowd3 hand = <hand> Type = <Type>
	Crowd_SetHand Name = crowd4 hand = <hand> Type = <Type>
endscript

script Crowd_AllPlayAnim \{playonce = FALSE}
	WaitOneGameFrame
	Crowd_PlayAnim Name = crowd1 anim = <anim> playonce = <playonce>
	WaitOneGameFrame
	Crowd_PlayAnim Name = crowd2 anim = <anim> playonce = <playonce>
	WaitOneGameFrame
	Crowd_PlayAnim Name = crowd3 anim = <anim> playonce = <playonce>
	WaitOneGameFrame
	Crowd_PlayAnim Name = crowd4 anim = <anim> playonce = <playonce>
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

script Crowd_Create_Lighters 
	GetPakManCurrent \{map = zones}
	if (<pak> = z_artdeco)
		return
	endif
	GetPakManCurrentName \{map = zones}
	index = 0
	begin
	if (<index> < 10)
		formatText checksumName = crowd_lighter '%s_LIGHTER_Geo0%a' s = <pakname> a = <index>
	else
		formatText checksumName = crowd_lighter '%s_LIGHTER_Geo%a' s = <pakname> a = <index>
	endif
	if CompositeObjectExists Name = <crowd_lighter>
		<crowd_lighter> :Hide
	else
		if IsInNodeArray <crowd_lighter>
			if NOT IsCreated <crowd_lighter>
				create Name = <crowd_lighter>
				if CompositeObjectExists Name = <crowd_lighter>
					<crowd_lighter> :Hide
				else
					printf qs(0x6df8d6bc) a = <crowd_lighter>
				endif
			else
			endif
		else
		endif
	endif
	index = (<index> + 1)
	if (<index> = 15)
		break
	endif
	repeat
endscript

script Crowd_ToggleLighters 
	GetPakManCurrentName \{map = zones}
	index = 0
	begin
	if (<index> < 10)
		formatText checksumName = crowd_lighter '%s_LIGHTER_Geo0%a' s = <pakname> a = <index>
	else
		formatText checksumName = crowd_lighter '%s_LIGHTER_Geo%a' s = <pakname> a = <index>
	endif
	if CompositeObjectExists Name = <crowd_lighter>
		if GotParam \{On}
			<crowd_lighter> :unhide
		elseif GotParam \{OFF}
			<crowd_lighter> :Hide
		endif
	endif
	index = (<index> + 1)
	if (<index> = 15)
		break
	endif
	repeat
endscript

script Crowd_StageDiver_Hide \{index = 1}
	GetPakManCurrentName \{map = zones}
	formatText checksumName = stagediver '%s_TRG_Ped_StageDive0%a' s = <pakname> a = <index>
	if CompositeObjectExists Name = <stagediver>
		<stagediver> :Hide
	endif
endscript

script Crowd_StageDiver_Jump \{index = 1}
	ScriptAssert \{'Crowd_StageDiver_Jump: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript
