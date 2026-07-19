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
crowd_base_viewport_texture = `tex/models/Real_Crowd/crowd_atlas0.dds`

script crowd_reset \{loading_transition = 0
		restarting = 0}
	if ($game_mode = tutorial)
		return
	endif
	if GetNodeFlag \{LS_ENCORE_POST}
		change \{current_crowd = 1.6666}
		change \{average_crowd = 1.6666}
	else
		change \{current_crowd = 1.0}
		change \{average_crowd = 1.0}
	endif
	change \{total_crowd = 0.0}
	change \{max_crowd = 0.0}
	change \{last_time_in_lead = 0.0}
	change \{last_time_in_lead_player = -1}
	if (<player> = 1)
		StopSoundEvent \{$CurrentlyPlayingOneShotSoundEvent}
		printscriptinfo \{qs("Crowd BG SOUNDS")}
		if ($current_playing_transition = loading)
			if NOT (GetNodeFlag LS_ENCORE_POST)
				Change_Crowd_Looping_SFX \{crowd_looping_state = neutral}
			endif
		elseif ($game_mode = training)
			BG_Crowd_Front_End_Silence \{immediate = 1}
		elseif ($end_credits = 1 ||
				GetNodeFlag LS_ENCORE_POST)
			if ScriptExists \{Loading_Screen_Crowd_Swell}
				KillSpawnedScript \{name = Loading_Screen_Crowd_Swell}
				SetSoundBussParams {Crowd_Beds = {vol = ($Default_BussSet.Crowd_Beds.vol)} time = 1}
			endif
			printf \{channel = sfx
				qs("\Lcrowd_reset LS_ENCORE_POST")}
			Change_Crowd_Looping_SFX \{crowd_looping_state = good}
		elseif (<restarting> = 1)
			printf \{channel = sfx
				qs("\LTHIS IS RIGHT, GOING INTO SONG AND TRANSITIONING CORRECTLY")}
			if ($boss_battle = 1)
				Change_Crowd_Looping_SFX \{crowd_looping_state = good}
			else
				Change_Crowd_Looping_SFX \{crowd_looping_state = neutral}
			endif
		else
			printf \{channel = sfx
				qs("\LNOT - crowd_reset LS_ENCORE_POST")}
			printf \{channel = sfx
				qs("\Lthe current transition is %s")
				s = $current_transition}
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
	GetBandIndexByPlayer player = ($<player_status>.player)
	band_id = ($band_ids [<band_index>])
	if GetNodeFlag \{LS_ENCORE_POST}
		if NOT ($game_mode = p2_battle)
			change structurename = <player_status> current_health = 1.6666
			change structurename = <band_id> current_health = 1.6666
		else
			change structurename = <player_status> current_health = 1.0
			change structurename = <band_id> current_health = 1.0
		endif
	else
		change structurename = <player_status> current_health = 1.0
		change structurename = <band_id> current_health = 1.0
	endif
	if ($game_mode = p2_battle && $battle_do_or_die = 1)
		change structurename = <player_status> current_health = ($<player_status>.save_health)
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
	change structurename = <player_status> current_health = <health>
	change current_crowd = <health>
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
	change crowd_model_array = $<crowd_models>
	GetArraySize $<crowd_models>
	base_style = imposter_rendering_quad_base
	if (<array_size> <= 6)
		if isXenon
			<base_style> = imposter_rendering_highres_quad_base
		endif
	endif
	CreateViewport {
		priority = ($base_resolve_priority)
		id = ($crowd_base_viewport_id)
		texture = ($crowd_base_viewport_texture)
		style = <base_style>
	}
	SetViewportProperties viewport = ($crowd_base_viewport_id) no_resolve_depthstencilbuffer = true clear_colorbuffer = false crowd_impostor = true
	crowd_bb_mesh_idx = 0
	begin
	bb_base_sector_name = ($<crowd_models> [<crowd_bb_mesh_idx>].bb_mesh_id)
	AddCrowdToVisibilityTest crowdnode = <bb_base_sector_name>
	<crowd_bb_mesh_idx> = (<crowd_bb_mesh_idx> + 1)
	repeat <array_size>
	array_count = 0
	begin
	pos = ((-500.0, -200.0, 0.0) + (0.0, -100.0, 0.0) * <array_count>)
	viewport = ($<crowd_models> [<array_count>].id)
	camera = ($<crowd_models> [<array_count>].camera)
	bb_sector_name = ($<crowd_models> [<array_count>].bb_mesh_id)
	if NOT StructureContains Structure = ($<crowd_models> [<array_count>]) remap_only
		MemPushContext \{BottomUpHeap}
		CreateFromStructure {
			pos = <pos>
			Quat = (0.0, 1.0, 0.0)
			Class = GameObject
			type = Ghost
			CreatedAtStart
			($<crowd_models> [<array_count>])
			SuspendDistance = 0
			lod_dist1 = 400
			lod_dist2 = 401
			profile = $Profile_Ped_Crowd_Obj
			lightgroup = Crowd
			interleave_animations
			object_type = Crowd
			ProfileColor = 49344
			profilebudget = 200
			use_jq
		}
		model_id = ($<crowd_models> [<array_count>].name)
		extra_model = 'Real_Crowd\\Crowd_HandL_Lighter.skin'
		<model_id> :AddGeom lhand_lighter Model = <extra_model> lightgroup = Crowd
		extra_model = 'Real_Crowd\\Crowd_HandL_Rock.skin'
		<model_id> :AddGeom lhand_rock Model = <extra_model> lightgroup = Crowd
		extra_model = 'Real_Crowd\\Crowd_HandL_Clap.skin'
		<model_id> :AddGeom lhand_clap Model = <extra_model> lightgroup = Crowd
		extra_model = 'Real_Crowd\\Crowd_HandL_Fist.skin'
		<model_id> :AddGeom lhand_fist Model = <extra_model> lightgroup = Crowd
		extra_model = 'Real_Crowd\\Crowd_HandR_Lighter.skin'
		<model_id> :AddGeom rhand_lighter Model = <extra_model> lightgroup = Crowd
		extra_model = 'Real_Crowd\\Crowd_HandR_Rock.skin'
		<model_id> :AddGeom rhand_rock Model = <extra_model> lightgroup = Crowd
		extra_model = 'Real_Crowd\\Crowd_HandR_Clap.skin'
		<model_id> :AddGeom rhand_clap Model = <extra_model> lightgroup = Crowd
		extra_model = 'Real_Crowd\\Crowd_HandR_Fist.skin'
		<model_id> :AddGeom rhand_fist Model = <extra_model> lightgroup = Crowd
		<model_id> :SwitchOffAtomic lhand_lighter
		<model_id> :SwitchOffAtomic lhand_rock
		<model_id> :SwitchOffAtomic lhand_fist
		<model_id> :SwitchOnAtomic lhand_clap
		<model_id> :SwitchOffAtomic rhand_lighter
		<model_id> :SwitchOffAtomic rhand_rock
		<model_id> :SwitchOffAtomic rhand_fist
		<model_id> :SwitchOnAtomic rhand_clap
		<model_id> :obj_setnoquadcull
		roty = 0
		if StructureContains Structure = ($<crowd_models> [<array_count>]) roty
			roty = ($<crowd_models> [<array_count>].roty)
		endif
		if ($Cheat_SnobCrowd = 1)
			roty = (<roty> + 180)
		endif
		if (<roty> = 0)
			apply_correction = 1
		else
			apply_correction = 0
			($<crowd_models> [<array_count>].name) :Obj_SetOrientation y = (180 + <roty>)
		endif
		if NOT (<bb_sector_name> = 0)
			ToggleIntraMeshSorting on = 1 ObjID = <bb_sector_name>
		endif
		MemPopContext \{BottomUpHeap}
		style = imposter_rendering
		if StructureContains Structure = ($<crowd_models> [<array_count>]) ViewportParams
			<style> = ($<crowd_models> [<array_count>].ViewportParams)
		endif
		if (<array_size> <= 6)
			if isXenon
				style = imposter_rendering_highres
				if StructureContains Structure = ($<crowd_models> [<array_count>]) HRViewportParams
					<style> = ($<crowd_models> [<array_count>].HRViewportParams)
				endif
			endif
		endif
		use_resource = 0x00000000
		if StructureContains Structure = ($<crowd_models> [<array_count>]) ResourceViewport
			<use_resource> = ($<crowd_models> [<array_count>].ResourceViewport)
		endif
		printstruct <...>
		CreateViewport {
			priority = ($base_resolve_priority + 1 + <array_count>)
			id = <viewport>
			texture = ($<crowd_models> [<array_count>].texture)
			style = <style>
			use_resource = <use_resource>
		}
		CreateCompositeObjectInstance {
			priority = $COIM_Priority_Permanent
			heap = generic
			Components = [
				{Component = camera}
			]
			params = {
				name = <camera>
				viewport = <viewport>
				object_type = Crowd
				ProfileColor = 12632064
				profilebudget = 10
				use_jq
				far_clip = 20
			}
		}
		SetActiveCamera viewport = <viewport> id = <camera>
		<camera> :SetHFov hfov = $crowd_ped_camera_fov
		if StructureContains Structure = ($<crowd_models> [<array_count>]) no_resolve_colorbuffer
			SetViewportProperties viewport = <viewport> no_resolve_colorbuffer = true no_resolve_depthstencilbuffer = true crowd_impostor = true
		else
			SetViewportProperties viewport = <viewport> no_resolve_depthstencilbuffer = true crowd_impostor = true
		endif
		AddCrowdModelCam camera = <camera> pos = <pos> viewport = <viewport> apply_correction = <apply_correction>
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
endscript

script update_crowd_model_cam 
	crowd_scaler = 25
	begin
	GetViewportCameraOrient \{viewport = bg_viewport}
	GetVectorComponents <at>
	Angle = (<x> * <crowd_scaler>)
	RotateVector vector = <at> ry = <Angle>
	at = <result_vector>
	RotateVector vector = <left> ry = <Angle>
	left = <result_vector>
	RotateVector vector = <up> ry = <Angle>
	up = <result_vector>
	posdir = (<model_pos> + (0.0, 1.0, 0.0) + (<at> * 3.5))
	<camera> :Obj_SetPosition position = <posdir>
	<camera> :Obj_SetOrientation dir = <at> Only handles upright cameras
	SetViewportCameraOrient viewport = <viewport> at = <at> left = <left> up = <up>
	<camera> :UnPause
	Wait \{1
		gameframe}
	repeat
endscript

script hide_crowd_models \{active = true}
	crowd_models = $crowd_model_array
	if (<crowd_models> = none)
		return
	endif
	GetArraySize <crowd_models>
	array_count = 0
	begin
	viewport = (<crowd_models> [<array_count>].id)
	ObjID = (<crowd_models> [<array_count>].name)
	if NOT StructureContains Structure = (<crowd_models> [<array_count>]) remap_only
		if (<active> = true)
			<ObjID> :hide
		else
			<ObjID> :unhide
		endif
	endif
	<array_count> = (<array_count> + 1)
	repeat <array_size>
endscript

script destroy_crowd_models 
	ClearCrowdModelCams
	ClearCrowdsFromVisibilityTest
	crowd_models = $crowd_model_array
	if (<crowd_models> = none)
		return
	endif
	GetArraySize <crowd_models>
	array_count = 0
	begin
	if NOT StructureContains Structure = (<crowd_models> [<array_count>]) remap_only
		KillSpawnedScript \{name = update_crowd_model_cam}
		if CompositeObjectExists name = (<crowd_models> [<array_count>].camera)
			(<crowd_models> [<array_count>].camera) :Die
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
	change \{crowd_model_array = none}
endscript

script set_crowd_hand \{Hand = left
		type = clap}
	Obj_GetID
	name = <ObjID>
	if (<Hand> = left)
		switch (<type>)
			case lighter
			part = lhand_lighter
			case Rock
			part = lhand_rock
			case clap
			part = lhand_clap
			case fist
			part = lhand_fist
		endswitch
		<name> :SwitchOffAtomic lhand_lighter
		<name> :SwitchOffAtomic lhand_rock
		<name> :SwitchOffAtomic lhand_clap
		<name> :SwitchOffAtomic lhand_fist
		<name> :SwitchOnAtomic <part>
	else
		switch (<type>)
			case lighter
			part = rhand_lighter
			case Rock
			part = rhand_rock
			case clap
			part = rhand_clap
			case fist
			part = rhand_fist
		endswitch
		<name> :SwitchOffAtomic rhand_lighter
		<name> :SwitchOffAtomic rhand_rock
		<name> :SwitchOffAtomic rhand_clap
		<name> :SwitchOffAtomic rhand_fist
		<name> :SwitchOnAtomic <part>
	endif
endscript

script Crowd_SetHand \{name = crowd1
		Hand = left
		type = clap}
	if CompositeObjectExists <name>
		<name> :set_crowd_hand Hand = <Hand> type = <type>
	endif
endscript

script Crowd_StartLighters 
	KillSpawnedScript \{name = crowd_monitor_performance}
	spawnscriptnow \{crowd_monitor_performance}
endscript

script crowd_monitor_performance 
	lighters_on = false
	begin
	get_skill_level
	if (<skill> != Bad)
		if (<lighters_on> = false)
			Crowd_AllSetHand \{Hand = right
				type = lighter}
			Crowd_AllPlayAnim \{Anim = special}
			lighters_on = true
			Crowd_ToggleLighters \{on}
		endif
	else
		if (<lighters_on> = true)
			Crowd_AllSetHand \{Hand = right
				type = clap}
			Crowd_AllPlayAnim \{Anim = Idle}
			lighters_on = false
			Crowd_ToggleLighters \{off}
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script Crowd_StopLighters 
	KillSpawnedScript \{name = crowd_monitor_performance}
	Crowd_AllSetHand \{Hand = right
		type = clap}
	Crowd_AllPlayAnim \{Anim = Idle}
	Crowd_ToggleLighters \{off}
endscript

script Crowd_AllSetHand 
	Crowd_SetHand name = crowd1 Hand = <Hand> type = <type>
	Crowd_SetHand name = crowd2 Hand = <Hand> type = <type>
	Crowd_SetHand name = crowd3 Hand = <Hand> type = <type>
	Crowd_SetHand name = crowd4 Hand = <Hand> type = <type>
	Crowd_SetHand name = crowd5 Hand = <Hand> type = <type>
	Crowd_SetHand name = crowd6 Hand = <Hand> type = <type>
	Crowd_SetHand name = crowd7 Hand = <Hand> type = <type>
	Crowd_SetHand name = crowd8 Hand = <Hand> type = <type>
endscript

script Crowd_AllPlayAnim 
	Wait \{1
		gameframe}
	Crowd_PlayAnim name = crowd1 Anim = <Anim>
	Wait \{1
		gameframe}
	Crowd_PlayAnim name = crowd2 Anim = <Anim>
	Wait \{1
		gameframe}
	Crowd_PlayAnim name = crowd3 Anim = <Anim>
	Wait \{1
		gameframe}
	Crowd_PlayAnim name = crowd4 Anim = <Anim>
	Wait \{1
		gameframe}
	Crowd_PlayAnim name = crowd5 Anim = <Anim>
	Wait \{1
		gameframe}
	Crowd_PlayAnim name = crowd6 Anim = <Anim>
	Wait \{1
		gameframe}
	Crowd_PlayAnim name = crowd7 Anim = <Anim>
	Wait \{1
		gameframe}
	Crowd_PlayAnim name = crowd8 Anim = <Anim>
endscript

script Crowd_PlayAnim \{name = crowd1
		Anim = Idle}
	if NOT CompositeObjectExists <name>
		return
	endif
	if StructureContains Structure = ($Crowd_Profiles) name = <name>
		anim_set = ($Crowd_Profiles.<name>.anim_set)
		<name> :Obj_KillSpawnedScript name = crowd_play_adjusting_random_anims
		<name> :Obj_SpawnScriptNow crowd_play_adjusting_random_anims params = {anim_set = <anim_set> Anim = <Anim>}
	else
		printf channel = Crowd qs("\Lanimset not found for %a......") a = <name>
	endif
endscript

script crowd_create_lighters 
	GetPakManCurrent \{map = zones}
	if (<pak> = z_artdeco)
		return
	endif
	GetPakManCurrentName \{map = zones}
	index = 0
	begin
	if (<index> < 10)
		FormatText checksumname = crowd_lighter '%s_LIGHTER_Geo0%a' s = <pakname> a = <index>
	else
		FormatText checksumname = crowd_lighter '%s_LIGHTER_Geo%a' s = <pakname> a = <index>
	endif
	if CompositeObjectExists name = <crowd_lighter>
		<crowd_lighter> :hide
	else
		if IsInNodeArray <crowd_lighter>
			if NOT IsCreated <crowd_lighter>
				create name = <crowd_lighter>
				if CompositeObjectExists name = <crowd_lighter>
					<crowd_lighter> :hide
				else
					printf qs("\Lfailed to create lighter object %a! ....") a = <crowd_lighter>
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
		FormatText checksumname = crowd_lighter '%s_LIGHTER_Geo0%a' s = <pakname> a = <index>
	else
		FormatText checksumname = crowd_lighter '%s_LIGHTER_Geo%a' s = <pakname> a = <index>
	endif
	if CompositeObjectExists name = <crowd_lighter>
		if GotParam \{on}
			<crowd_lighter> :unhide
		elseif GotParam \{off}
			<crowd_lighter> :hide
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
		if StructureContains Structure = ($stagediver_anims) name = <pak>
			anims = ($stagediver_anims.<pak>)
		else
			anims = ($stagediver_anims.`default`)
		endif
		GetArraySize <anims>
		GetRandomValue name = anim_index Integer a = 0 b = (<array_size> - 1)
		anim_name = (<anims> [<anim_index>])
		printf channel = Crowd qs("\LPlaying stagedive anim %a .....") a = <anim_name>
		<stagediver> :GameObj_PlayAnim Anim = <anim_name>
		<stagediver> :GameObj_WaitAnimFinished
		<stagediver> :hide
	else
		printf \{channel = Crowd
			qs("\LStagediver not found.........")}
	endif
endscript
