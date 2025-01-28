check_for_unplugged_controllers = 0
AnimLODInterleave2 = 12
AnimLODInterleave4 = 9
PS3_AnimLODInterleave2 = 20
PS3_AnimLODInterleave4 = 12
Xenon_AnimLODInterleave2 = 20
Xenon_AnimLODInterleave4 = 12

script autolaunch 
	if GotParam \{Level}
		Change current_level = <Level>
		startnow = 2
	endif
	if GotParam \{Song}
		Change current_song = <Song>
		startnow = 1
	endif
	if GotParam \{DIFFICULTY}
		Change current_difficulty = <DIFFICULTY>
		startnow = 1
	endif
	if GotParam \{difficulty2}
		Change current_difficulty2 = <difficulty2>
		startnow = 1
	endif
	if GotParam \{StartTime}
		Change current_starttime = <StartTime>
		startnow = 1
	endif
	if GotParam \{controller}
		Change StructureName = player1_status controller = <controller>
		Change player1_device = <controller>
		Change primary_controller = <controller>
		startnow = 1
	endif
	if GotParam \{controller2}
		Change StructureName = player2_status controller = <controller2>
		startnow = 1
	endif
	if GotParam \{game_mode}
		Change game_mode = <game_mode>
		if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff)
			Change \{current_num_players = 2}
		endif
		startnow = 1
	endif
	if GotParam \{startnow}
		SetGlobalTags \{Progression
			Params = {
				current_tier = 1
			}}
		SetGlobalTags \{Progression
			Params = {
				current_song_count = 0
			}}
		Change autolaunch_startnow = <startnow>
	endif
	translate_gamemode
endscript

script change_level 
	Script_Assert \{"This is now gone..."}
endscript

script KillElement3d 
	Wait \{1
		GameFrame}
	DIE
endscript

script setup_ped_speech \{Inner_Radius = 0.3
		SPEED = 0.5
		pad_choose_script = ped_speech_exit}
	if NOT IsCreated <ped_id>
		ScriptAssert \{"tried to set up ped speech on an object that doesn't exist"}
	endif
	<ped_id> :Obj_SetInnerRadius <Inner_Radius>
	ClearEventHandler \{AnyObjectInRadius}
	ClearEventHandler \{ObjectOutOfRadius}
	SetEventHandler Event = AnyObjectInRadius Scr = ped_speech_got_trigger reponse = call_script Params = <...>
endscript

script ped_speech_got_trigger \{set_script = SetEventHandler
		set_script_scr = ped_speech_got_trigger}
	if NOT <colObjId> :IsLocalSkater
		return
	endif
	if (($dont_create_speech_boxes = 1) || ($game_progress_block_triggers = 1) || ($sysnotify_wait_in_progress = 1))
		return
	endif
	ClearEventHandler \{AnyObjectInRadius}
	if ObjectExists \{Id = ped_speech_dialog}
		<should_destroy> = 0
		if Skater :IsInBail
			<should_destroy> = 1
		endif
		if SkaterCurrentScorePotGreaterThan \{0}
			<should_destroy> = 1
		endif
		if <colObjId> :DoingTrick
			<should_destroy> = 1
		endif
		if NOT GMan_CanStartGoal
			<should_destroy> = 1
		endif
		if GotParam \{hide_in_goals}
			if GMan_HasActiveGoals
				<should_destroy> = 1
			endif
		endif
		if (<should_destroy> = 1)
			DestroyScreenElement \{Id = ped_speech_dialog}
		endif
		<set_script> Event = AnyObjectInRadius Scr = <set_script_scr> Object = <ped_id> Params = <...>
	else
		show_speech_box = 1
		if IsTrue \{$igc_playing}
			show_speech_box = 0
		endif
		if ObjectExists \{Id = root_window}
			root_window :GetTags
			if GotParam \{menu_state}
				if (<menu_state> = ON)
					show_speech_box = 0
				endif
			endif
		endif
		if NOT GMan_CanStartGoal
			if NOT InNetGame
				show_speech_box = 0
			endif
		endif
		if NOT <colObjId> :OnGround
			show_speech_box = 0
		endif
		if <colObjId> :IsInBail
			show_speech_box = 0
		endif
		if <colObjId> :DoingTrick
			show_speech_box = 0
		endif
		if SkaterCurrentScorePotGreaterThan \{0}
			show_speech_box = 0
		endif
		if GotParam \{hide_in_goals}
			if GMan_HasActiveGoals
				<show_speech_box> = 0
			endif
		endif
		if (<show_speech_box> = 1)
			if GotParam \{dont_allow_pause}
				kill_start_key_binding
			endif
			<ped_id> :Obj_SetOuterRadius <Inner_Radius>
			<set_script> Event = ObjectOutOfRadius Scr = ped_speech_refuse Object = <ped_id> Params = <...>
			if NOT GotParam \{accept_text}
				if NOT GotParam \{display_name}
					<display_name> = "Ped"
				endif
				FormatText TextName = accept_text "%s: \\me to talk." S = <display_name>
			endif
			if ObjectExists \{Id = ped_speech_dialog}
				DestroyScreenElement \{Id = ped_speech_dialog}
			endif
			create_speech_box {
				anchor_id = ped_speech_dialog
				Text = <accept_text>
				no_pad_choose
				no_pad_start
				pad_option_script = ped_speech_accept
				pad_option_params = <...>
				Pos = (320.0, 400.0)
				z_priority = 5
			}
			ped_speech_dialog :Obj_SpawnScriptLater ped_speech_die_with_trigger Params = {ped_id = <ped_id>}
		else
			<set_script> Event = AnyObjectInRadius Scr = <set_script_scr> Object = <ped_id> Params = <...>
		endif
	endif
endscript

script ped_speech_accept 
	if <colObjId> :IsInBail
		return
	endif
	if <colObjId> :DoingTrick
		return
	endif
	speech_box_exit
	if NOT ObjectExists Id = <ped_id>
		return
	endif
	DeBounce \{X
		Time = 0.5}
	if <colObjId> :OnGround
		if NOT SkaterCurrentScorePotGreaterThan \{0}
			Wait \{5
				Frame}
			if <colObjId> :OnGround
				ped_speech_accept2 <...>
			else
				if NOT <colObjId> :RightPressed
					if NOT <colObjId> :LeftPressed
						if NOT <colObjId> :UpPressed
							if NOT <colObjId> :DownPressed
								ped_speech_accept2 <...>
							endif
						endif
					endif
				endif
			endif
		endif
	else
		if NOT <colObjId> :RightPressed
			if NOT <colObjId> :LeftPressed
				if NOT <colObjId> :UpPressed
					if NOT <colObjId> :DownPressed
						ped_speech_accept2 <...>
					endif
				endif
			endif
		endif
	endif
endscript

script ped_speech_accept2 
	if NOT GotParam \{dont_deactivate_goals}
		if NOT GameModeEquals \{Is_SingleSession}
			if NOT GameModeEquals \{is_classic}
				GMan_DeactivateAllGoals
			endif
		endif
	endif
	ClearEventHandler \{AnyObjectInRadius}
	if ScreenElementExists \{Id = ped_speech_dialog}
		DestroyScreenElement \{Id = ped_speech_dialog}
	endif
	if GotParam \{activation_script}
		<colObjId> :Obj_SpawnScriptLater <activation_script> Params = {ped_id = <ped_id> <activation_script_params>}
	endif
	if GotParam \{Text}
		create_speech_box <...> no_pad_start
	endif
endscript

script ped_speech_refuse 
	if GotParam \{intId}
		if GotParam \{outIntId}
			if NOT (<outIntId> = <intId>)
				return
			endif
		endif
	endif
	if GotParam \{hint_text}
		ped_utils_hint_dialog_refuse <...>
	endif
	ClearEventHandler \{ObjectOutOfRadius}
	speech_box_exit \{anchor_id = ped_speech_dialog}
	ped_speech_reset <...>
	if GotParam \{dont_allow_pause}
		restore_start_key_binding
	endif
endscript

script ped_speech_reset 
	if GotParam \{outer_radius_script}
		<outer_radius_script> <outer_radius_params>
	endif
	if NOT GotParam \{no_repeat}
		setup_ped_speech <...>
	endif
endscript

script ped_speech_exit 
	UnPauseSkaters
	speech_box_exit
endscript

script ped_speech_die_with_trigger 
	if NOT GotParam \{ped_id}
		return
	endif
	begin
	if NOT IsCreated <ped_id>
		LaunchEvent \{Type = speech_box_destroyed}
		DIE
		return
	endif
	Wait \{1
		GameFrames}
	repeat
endscript

script Script_Assert 
	Printf \{"ASSERT MESSAGE:"}
	ScriptAssert <...>
endscript

script NullScript 
endscript

script DumpMetrics 
	GetMetrics
	Printf
	Printf \{"Dumping Metrics Structure"}
	PrintStruct <...>
endscript
dummy_metrics_struct = {
	mainscene = 0
	skyscene = 0
	metrics = 0
	Sectors = 0
	ColSectors = 0
	Verts = 0
	BasePolys = 0
	TextureMemory = 0
}

script Restore_skater_camera 
endscript

script GetSkaterCam 
	camera_object = skatercam0
	if InSplitScreenGame
		if IsObjectScript
			Obj_GetID
			if NOT CheckSumEquals A = <ObjID> B = 0
				camera_object = skatercam1
			endif
		endif
	endif
	return skatercam = <camera_object>
endscript

script SetSkaterCamOverride 
	GetSkaterCam
	<skatercam> :SC_SetSkaterCamOverride <...>
endscript

script ClearSkaterCamOverride 
	GetSkaterCam
	<skatercam> :SC_ClearSkaterCamOverride <...>
endscript

script empty_script 
endscript

script restore_start_key_binding 
	Printf \{"+++ RESTORE START KEY"}
	SetScreenElementProps \{Id = root_window
		event_handlers = [
			{
				pad_start
				gh3_start_pressed
			}
		]
		Replace_Handlers}
endscript

script kill_start_key_binding 
	Printf \{"--- KILL START KEY"}
	SetScreenElementProps \{Id = root_window
		event_handlers = [
			{
				pad_start
				null_script
			}
		]
		Replace_Handlers}
	if ($enable_view_goals_select_shortcut = 1)
		SetScreenElementProps \{Id = root_window
			event_handlers = [
				{
					pad_select
					null_script
				}
			]
			Replace_Handlers}
	endif
endscript

script BlockPendingPakManLoads \{map = All
		block_scripts = 0
		noparse = 0}
	if (<block_scripts> = 1)
		PendingPakManLoads map = <map> block_scripts = 1 noparse = <noparse>
		if GotParam \{loaderror}
			return \{FALSE}
		endif
		return \{TRUE}
	endif
	begin
	if NOT (PendingPakManLoads map = <map> noparse = <noparse>)
		break
	endif
	Wait \{1
		GameFrame}
	repeat
	if GotParam \{loaderror}
		return \{FALSE}
	endif
	return \{TRUE}
endscript

script SetPakManCurrentBlock \{block_scripts = 0
		noparse = 0}
	SetPakManCurrent map = <map> pak = <pak> pakname = <pakname>
	if NOT BlockPendingPakManLoads map = <map> block_scripts = <block_scripts> noparse = <noparse>
		return \{FALSE}
	endif
	GetPakManCurrentName \{map = Zones}
	if GotParam \{pakname}
		FormatText ChecksumName = zone_setup '%s_setup' S = <pakname>
		if ScriptExists <zone_setup>
			SpawnScriptNow <zone_setup>
		endif
	endif
	set_hidebytype
	return \{TRUE}
endscript

script RefreshPakManCurrent 
	SetPakManCurrentBlock map = <map> pak = <pak> pakname = <pakname>
endscript

script Zones_PakMan_Init 
	Printf \{"Zones_PakMan_Init"}
	zone_name = <pak_name>
	zone_string_name = <pak_string_name>
	FormatText ChecksumName = sfx_zone_name '%z_sfx' Z = <zone_string_name>
	FormatText ChecksumName = gfx_zone_name '%z_gfx' Z = <zone_string_name>
	FormatText ChecksumName = lfx_zone_name '%z_lfx' Z = <zone_string_name>
	FormatText ChecksumName = mfx_zone_name '%z_mfx' Z = <zone_string_name>
	FormatText ChecksumName = array_Name '%z_NodeArray' Z = <zone_string_name>
	FormatText ChecksumName = sfx_array_name '%z_SFX_NodeArray' Z = <zone_string_name>
	FormatText ChecksumName = gfx_array_name '%z_GFX_NodeArray' Z = <zone_string_name>
	FormatText ChecksumName = lfx_array_name '%z_LFX_NodeArray' Z = <zone_string_name>
	FormatText ChecksumName = mfx_array_name '%z_MFX_NodeArray' Z = <zone_string_name>
	zone_init <...>
	FormatText ChecksumName = script_zone_init '%z_init' Z = <zone_string_name>
	FormatText ChecksumName = script_zone_sfx_init '%z_sfx_init' Z = <zone_string_name>
	FormatText ChecksumName = script_zone_gfx_init '%z_gfx_init' Z = <zone_string_name>
	FormatText ChecksumName = script_zone_lfx_init '%z_lfx_init' Z = <zone_string_name>
	FormatText ChecksumName = script_zone_mfx_init '%z_mfx_init' Z = <zone_string_name>
	if ScriptExists <script_zone_init>
		<script_zone_init>
	endif
	if ScriptExists <script_zone_sfx_init>
		<script_zone_sfx_init>
	endif
	if ScriptExists <script_zone_gfx_init>
		<script_zone_gfx_init>
	endif
	if ScriptExists <script_zone_lfx_init>
		<script_zone_lfx_init>
	endif
	if ScriptExists <script_zone_mfx_init>
		<script_zone_mfx_init>
	endif
	UpdatePakManVisibility \{map = Zones}
	Printf \{"Zones_PakMan_Init end"}
endscript

script Zones_PakMan_DeInit 
	Printf \{"Zones_PakMan_DeInit"}
	zone_name = <pak_name>
	zone_string_name = <pak_string_name>
	FormatText ChecksumName = sfx_zone_name '%z_sfx' Z = <zone_string_name>
	FormatText ChecksumName = gfx_zone_name '%z_gfx' Z = <zone_string_name>
	FormatText ChecksumName = lfx_zone_name '%z_lfx' Z = <zone_string_name>
	FormatText ChecksumName = mfx_zone_name '%z_mfx' Z = <zone_string_name>
	FormatText ChecksumName = array_Name '%z_NodeArray' Z = <zone_string_name>
	FormatText ChecksumName = sfx_array_name '%z_SFX_NodeArray' Z = <zone_string_name>
	FormatText ChecksumName = gfx_array_name '%z_GFX_NodeArray' Z = <zone_string_name>
	FormatText ChecksumName = lfx_array_name '%z_LFX_NodeArray' Z = <zone_string_name>
	FormatText ChecksumName = mfx_array_name '%z_MFX_NodeArray' Z = <zone_string_name>
	zone_deinit <...>
	FormatText ChecksumName = script_zone_deinit '%z_deinit' Z = <zone_string_name>
	FormatText ChecksumName = script_zone_sfx_deinit '%z_sfx_deinit' Z = <zone_string_name>
	FormatText ChecksumName = script_zone_gfx_deinit '%z_gfx_deinit' Z = <zone_string_name>
	FormatText ChecksumName = script_zone_lfx_deinit '%z_lfx_deinit' Z = <zone_string_name>
	FormatText ChecksumName = script_zone_mfx_deinit '%z_mfx_deinit' Z = <zone_string_name>
	if ScriptExists <script_zone_deinit>
		<script_zone_deinit>
	endif
	if ScriptExists <script_zone_sfx_deinit>
		<script_zone_sfx_deinit>
	endif
	if ScriptExists <script_zone_gfx_deinit>
		<script_zone_gfx_deinit>
	endif
	if ScriptExists <script_zone_lfx_deinit>
		<script_zone_lfx_deinit>
	endif
	if ScriptExists <script_zone_mfx_deinit>
		<script_zone_mfx_deinit>
	endif
	DestroyParticlesByGroupID \{groupID = zoneParticles}
	DestroyZoneEntities zone_name = <zone_name> zone_string_name = <zone_string_name>
	UpdatePakManVisibility \{map = Zones}
	Printf \{"Zones_PakMan_DeInit end"}
endscript
