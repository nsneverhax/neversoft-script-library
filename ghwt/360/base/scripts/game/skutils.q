check_for_unplugged_controllers = 0
AnimLODInterleave2 = 12
AnimLODInterleave4 = 9
PS3_AnimLODInterleave2 = 20
PS3_AnimLODInterleave4 = 12
Xenon_AnimLODInterleave2 = 20
Xenon_AnimLODInterleave4 = 12

script autolaunch 
	lockglobaltags \{forceoff}
	if GotParam \{level}
		Change current_level = <level>
		startnow = 1
	endif
	if GotParam \{song}
		Change current_song = <song>
		startnow = 1
	endif
	if GotParam \{difficulty}
		Change structurename = player1_status difficulty = <difficulty>
		startnow = 1
	endif
	if GotParam \{difficulty2}
		Change structurename = player2_status difficulty = <difficulty2>
		startnow = 1
	endif
	if GotParam \{difficulty3}
		Change structurename = player3_status difficulty = <difficulty3>
		startnow = 1
	endif
	if GotParam \{difficulty4}
		Change structurename = player4_status difficulty = <difficulty4>
		startnow = 1
	endif
	if GotParam \{starttime}
		Change current_starttime = <starttime>
		startnow = 1
	endif
	if GotParam \{controller}
		Change structurename = player1_status controller = <controller>
		Change player1_device = <controller>
		Change primary_controller = <controller>
		Change \{primary_controller_assigned = 1}
		startnow = 1
	else
		Change \{primary_controller = 0}
		Change \{primary_controller_assigned = 1}
	endif
	if GotParam \{controller2}
		Change structurename = player2_status controller = <controller2>
		Change player2_device = <controller2>
		Change primary_controller = <controller2>
		Change \{primary_controller_assigned = 1}
		startnow = 1
	endif
	if GotParam \{controller3}
		Change structurename = player3_status controller = <controller3>
		Change player2_device = <controller3>
		Change primary_controller = <controller3>
		Change \{primary_controller_assigned = 1}
		startnow = 1
	endif
	if GotParam \{controller4}
		Change structurename = player4_status controller = <controller4>
		Change player2_device = <controller4>
		Change primary_controller = <controller4>
		Change \{primary_controller_assigned = 1}
		startnow = 1
	endif
	if GotParam \{part}
		Change structurename = player1_status part = <part>
		startnow = 1
	endif
	if GotParam \{part2}
		Change structurename = player2_status part = <part2>
		startnow = 1
	endif
	if GotParam \{part3}
		Change structurename = player3_status part = <part3>
		startnow = 1
	endif
	if GotParam \{part4}
		Change structurename = player4_status part = <part4>
		startnow = 1
	endif
	if GotParam \{game_mode}
		Change game_mode = <game_mode>
		if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff)
			Change \{current_num_players = 2}
		elseif ($game_mode = p3_quickplay)
			Change \{current_num_players = 3}
		elseif ($game_mode = p4_quickplay)
			Change \{current_num_players = 4}
		endif
		startnow = 1
	endif
	if GotParam \{startnow}
		SetGlobalTags \{Progression
			params = {
				current_tier = 1
			}}
		SetGlobalTags \{Progression
			params = {
				current_song_count = 0
			}}
		Change autolaunch_startnow = <startnow>
	endif
	progression_cashmilestonesclear
	translate_gamemode
endscript

script setup_4_player_bot 
	setplayerinfo \{1
		part = guitar}
	setplayerinfo \{2
		part = drum}
	setplayerinfo \{3
		part = bass}
	setplayerinfo \{4
		part = vocals}
	setplayerinfo \{1
		bot_play = 1}
	setplayerinfo \{2
		bot_play = 1}
	setplayerinfo \{3
		bot_play = 1}
	setplayerinfo \{4
		bot_play = 1}
	return \{game_mode = p4_quickplay}
endscript

script change_level 
	script_assert \{qs(0xd5d70466)}
endscript

script KillElement3d 
	Wait \{1
		gameframe}
	Die
endscript

script script_assert 
	printf \{qs(0x8b930894)}
	ScriptAssert <...>
endscript

script nullscript 
endscript

script DumpMetrics 
	GetMetrics
	printf
	printf \{qs(0xff1d69af)}
	printstruct <...>
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
			if NOT checksumequals a = <objID> b = 0
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
	printf \{qs(0x2313a464)}
	SetScreenElementProps \{id = root_window
		event_handlers = [
			{
				pad_start
				handle_pause_event
			}
		]
		replace_handlers}
endscript

script kill_start_key_binding 
	if NOT GotParam \{nospam}
		printf \{qs(0x3ddc95e5)}
	endif
	SetScreenElementProps \{id = root_window
		event_handlers = [
			{
				pad_start
				null_script
			}
		]
		replace_handlers}
endscript

script BlockPendingPakManLoads \{map = all
		block_scripts = 0
		noparse = 0}
	if (<block_scripts> = 1)
		PendingPakManLoads map = <map> block_scripts = 1 noparse = <noparse>
		if GotParam \{loaderror}
			return \{FALSE}
		endif
		return \{true}
	endif
	begin
	if NOT (PendingPakManLoads map = <map> noparse = <noparse>)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if GotParam \{loaderror}
		return \{FALSE}
	endif
	return \{true}
endscript

script SetPakManCurrentBlock \{block_scripts = 0
		noparse = 0}
	SetPakManCurrent map = <map> pak = <pak> pakname = <pakname>
	if NOT BlockPendingPakManLoads map = <map> block_scripts = <block_scripts> noparse = <noparse>
		return \{FALSE}
	endif
	GetPakManCurrentName \{map = zones}
	if GotParam \{pakname}
		formatText checksumName = zone_setup '%s_setup' s = <pakname>
		if ScriptExists <zone_setup>
			SpawnScriptNow <zone_setup>
		endif
	endif
	set_hidebytype
	return \{true}
endscript

script RefreshPakManCurrent 
	SetPakManCurrentBlock map = <map> pak = <pak> pakname = <pakname>
endscript

script Zones_PakMan_Init 
	printf \{qs(0xd75fe338)}
	zone_name = <pak_name>
	zone_string_name = <pak_string_name>
	formatText checksumName = sfx_zone_name '%z_sfx' z = <zone_string_name>
	formatText checksumName = gfx_zone_name '%z_gfx' z = <zone_string_name>
	formatText checksumName = lfx_zone_name '%z_lfx' z = <zone_string_name>
	formatText checksumName = mfx_zone_name '%z_mfx' z = <zone_string_name>
	formatText checksumName = array_name '%z_NodeArray' z = <zone_string_name>
	formatText checksumName = sfx_array_name '%z_SFX_NodeArray' z = <zone_string_name>
	formatText checksumName = gfx_array_name '%z_GFX_NodeArray' z = <zone_string_name>
	formatText checksumName = lfx_array_name '%z_LFX_NodeArray' z = <zone_string_name>
	formatText checksumName = mfx_array_name '%z_MFX_NodeArray' z = <zone_string_name>
	zone_init <...>
	formatText checksumName = script_zone_init '%z_init' z = <zone_string_name>
	formatText checksumName = script_zone_sfx_init '%z_sfx_init' z = <zone_string_name>
	formatText checksumName = script_zone_gfx_init '%z_gfx_init' z = <zone_string_name>
	formatText checksumName = script_zone_lfx_init '%z_lfx_init' z = <zone_string_name>
	formatText checksumName = script_zone_mfx_init '%z_mfx_init' z = <zone_string_name>
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
	UpdatePakManVisibility \{map = zones}
	printf \{qs(0xd94a3f05)}
endscript

script Zones_PakMan_DeInit 
	printf \{qs(0x8ba60592)}
	zone_name = <pak_name>
	zone_string_name = <pak_string_name>
	formatText checksumName = sfx_zone_name '%z_sfx' z = <zone_string_name>
	formatText checksumName = gfx_zone_name '%z_gfx' z = <zone_string_name>
	formatText checksumName = lfx_zone_name '%z_lfx' z = <zone_string_name>
	formatText checksumName = mfx_zone_name '%z_mfx' z = <zone_string_name>
	formatText checksumName = array_name '%z_NodeArray' z = <zone_string_name>
	formatText checksumName = sfx_array_name '%z_SFX_NodeArray' z = <zone_string_name>
	formatText checksumName = gfx_array_name '%z_GFX_NodeArray' z = <zone_string_name>
	formatText checksumName = lfx_array_name '%z_LFX_NodeArray' z = <zone_string_name>
	formatText checksumName = mfx_array_name '%z_MFX_NodeArray' z = <zone_string_name>
	zone_deinit <...>
	formatText checksumName = script_zone_deinit '%z_deinit' z = <zone_string_name>
	formatText checksumName = script_zone_sfx_deinit '%z_sfx_deinit' z = <zone_string_name>
	formatText checksumName = script_zone_gfx_deinit '%z_gfx_deinit' z = <zone_string_name>
	formatText checksumName = script_zone_lfx_deinit '%z_lfx_deinit' z = <zone_string_name>
	formatText checksumName = script_zone_mfx_deinit '%z_mfx_deinit' z = <zone_string_name>
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
	DestroyParticlesByGroupID \{groupID = zoneparticles}
	DestroyZoneEntities zone_name = <zone_name> zone_string_name = <zone_string_name>
	ResetWaypoints pak_name = <pak_name>
	ResetWaypoints pak_name = <gfx_zone_name>
	ResetWaypoints pak_name = <sfx_zone_name>
	ResetWaypoints pak_name = <lfx_zone_name>
	UpdatePakManVisibility \{map = zones}
	printf \{qs(0x4dc93d77)}
endscript
