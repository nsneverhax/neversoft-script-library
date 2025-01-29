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
crowd_base_viewport_id = crowd_base_viewport
crowd_base_viewport_texture = `tex/models/real_crowd/crowd_atlas0.dds`

script crowd_reset \{loading_transition = 0
		restarting = 0}
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
	if (<Player> = 1)
		StopSoundEvent \{$CurrentlyPlayingOneShotSoundEvent}

		if ($current_playing_transition = loading)
			if NOT (GetNodeFlag LS_ENCORE_POST)
				Change_Crowd_Looping_SFX \{crowd_looping_state = neutral}
			endif
		elseif ($game_mode = training)
			BG_Crowd_Front_End_Silence \{immediate = 1}
		elseif ($end_credits = 1 ||
				GetNodeFlag LS_ENCORE_POST)
			if ScriptExists \{loading_screen_crowd_swell}
				KillSpawnedScript \{Name = loading_screen_crowd_swell}
				setsoundbussparams {Crowd_Beds = {vol = ($default_BussSet.Crowd_Beds.vol)} time = 1}
			endif

			Change_Crowd_Looping_SFX \{crowd_looping_state = good}
		elseif (<restarting> = 1)

			if ($boss_battle = 1)
				Change_Crowd_Looping_SFX \{crowd_looping_state = good}
			else
				Change_Crowd_Looping_SFX \{crowd_looping_state = neutral}
			endif
		else


			if (($current_transition = intro_zakk) || ($current_transition = intro_ted))
				Change_Crowd_Looping_SFX crowd_looping_state = good loading_transition = <loading_transition> restarting = <restarting>
			else
				if NOT ($is_attract_mode = 1)
					if ($is_metallifacts = 1)
						Change_Crowd_Looping_SFX crowd_looping_state = good loading_transition = <loading_transition> restarting = <restarting>
					else
						Change_Crowd_Looping_SFX crowd_looping_state = neutral loading_transition = <loading_transition> restarting = <restarting>
					endif
				else
					Change_Crowd_Looping_SFX crowd_looping_state = good loading_transition = <loading_transition> restarting = <restarting>
				endif
			endif
		endif
	endif
	getbandindexbyplayer Player = ($<player_status>.Player)
	band_id = ($band_ids [<band_index>])
	if GetNodeFlag \{LS_ENCORE_POST}
		if NOT ($game_mode = p2_battle)
			Change structurename = <player_status> current_health = 1.6666
			Change structurename = <band_id> current_health = 1.6666
		else
			Change structurename = <player_status> current_health = 1.0
			Change structurename = <band_id> current_health = 1.0
		endif
	else
		Change structurename = <player_status> current_health = 1.0
		Change structurename = <band_id> current_health = 1.0
	endif
	if ($game_mode = p2_battle && $battle_do_or_die = 1)
		Change structurename = <player_status> current_health = ($<player_status>.save_health)
	endif
	if NOT ($game_mode = p2_battle)
		Change structurename = <player_status> current_health = 1.0
	endif
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
	Change structurename = <player_status> current_health = <health>
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
		extra_model = 'Real_Crowd\\Crowd_HandL_Lighter.skin'
		<model_id> :AddGeom lhand_lighter Model = <extra_model> LightGroup = Crowd spouse = <viewport>
		extra_model = 'Real_Crowd\\Crowd_HandL_Rock.skin'
		<model_id> :AddGeom lhand_rock Model = <extra_model> LightGroup = Crowd spouse = <viewport>
		extra_model = 'Real_Crowd\\Crowd_HandL_Clap.skin'
		<model_id> :AddGeom lhand_clap Model = <extra_model> LightGroup = Crowd spouse = <viewport>
		extra_model = 'Real_Crowd\\Crowd_HandL_Fist.skin'
		<model_id> :AddGeom lhand_fist Model = <extra_model> LightGroup = Crowd spouse = <viewport>
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
		<model_id> :SwitchOffAtomic lhand_fist
		<model_id> :SwitchOnAtomic lhand_clap
		<model_id> :SwitchOffAtomic rhand_lighter
		<model_id> :SwitchOffAtomic rhand_rock
		<model_id> :SwitchOffAtomic rhand_fist
		<model_id> :SwitchOnAtomic rhand_clap
		roty = 0
		if StructureContains structure = ($<crowd_models> [<array_count>]) roty
			roty = ($<crowd_models> [<array_count>].roty)
		endif
		if ($cheat_snobcrowd = 1)
			roty = (<roty> + 180)
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
		MemPopContext \{BottomUpHeap}
		style = imposter_rendering
		if StructureContains structure = ($<crowd_models> [<array_count>]) viewportparams
			<style> = ($<crowd_models> [<array_count>].viewportparams)
		endif
		use_resource = 0x00000000
		if StructureContains structure = ($<crowd_models> [<array_count>]) resourceviewport
			<use_resource> = ($<crowd_models> [<array_count>].resourceviewport)
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
		if StructureContains structure = ($<crowd_models> [<array_count>]) no_resolve_colorbuffer
			SetViewportProperties viewport = <viewport> no_resolve_colorbuffer = true no_resolve_depthstencilbuffer = true crowd_impostor = true
		else
			SetViewportProperties viewport = <viewport> no_resolve_depthstencilbuffer = true crowd_impostor = true
		endif
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
			case lighter
			part = lhand_lighter
			case rock
			part = lhand_rock
			case clap
			part = lhand_clap
			case fist
			part = lhand_fist
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
	KillSpawnedScript \{Name = crowd_monitor_performance}
	SpawnScriptNow \{crowd_monitor_performance}
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
	KillSpawnedScript \{Name = crowd_monitor_performance}
	Crowd_AllSetHand \{hand = right
		Type = clap}
	Crowd_AllPlayAnim \{anim = Idle}
	Crowd_ToggleLighters \{OFF}
endscript

script Crowd_AllSetHand 
	Crowd_SetHand Name = crowd1 hand = <hand> Type = <Type>
	Crowd_SetHand Name = crowd2 hand = <hand> Type = <Type>
	Crowd_SetHand Name = crowd3 hand = <hand> Type = <Type>
	Crowd_SetHand Name = crowd4 hand = <hand> Type = <Type>
	Crowd_SetHand Name = crowd5 hand = <hand> Type = <Type>
	Crowd_SetHand Name = crowd6 hand = <hand> Type = <Type>
	Crowd_SetHand Name = crowd7 hand = <hand> Type = <Type>
	Crowd_SetHand Name = crowd8 hand = <hand> Type = <Type>
endscript

script Crowd_AllPlayAnim 
	WaitOneGameFrame
	Crowd_PlayAnim Name = crowd1 anim = <anim>
	WaitOneGameFrame
	Crowd_PlayAnim Name = crowd2 anim = <anim>
	WaitOneGameFrame
	Crowd_PlayAnim Name = crowd3 anim = <anim>
	WaitOneGameFrame
	Crowd_PlayAnim Name = crowd4 anim = <anim>
	WaitOneGameFrame
	Crowd_PlayAnim Name = crowd5 anim = <anim>
	WaitOneGameFrame
	Crowd_PlayAnim Name = crowd6 anim = <anim>
	WaitOneGameFrame
	Crowd_PlayAnim Name = crowd7 anim = <anim>
	WaitOneGameFrame
	Crowd_PlayAnim Name = crowd8 anim = <anim>
endscript

script Crowd_PlayAnim \{Name = crowd1
		anim = Idle}
	if NOT CompositeObjectExists <Name>
		return
	endif
	if StructureContains structure = ($Crowd_Profiles) Name = <Name>
		anim_set = ($Crowd_Profiles.<Name>.anim_set)
		<Name> :Obj_KillSpawnedScript Name = crowd_play_adjusting_random_anims
		<Name> :Obj_SpawnScriptNow crowd_play_adjusting_random_anims params = {anim_set = <anim_set> anim = <anim>}
	else

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

		<stagediver> :GameObj_PlayAnim anim = <anim_name>
		<stagediver> :GameObj_WaitAnimFinished
		<stagediver> :Hide
	else

	endif
endscript
