check_for_unplugged_controllers = 0
AnimLODInterleave2 = 12
AnimLODInterleave4 = 9
PS3_AnimLODInterleave2 = 20
PS3_AnimLODInterleave4 = 12
Xenon_AnimLODInterleave2 = 20
Xenon_AnimLODInterleave4 = 12

script autolaunch \{game_mode = p1_quickplay}
	Change \{autolaunch_go = 0}
	killspawnedscript \{name = autolaunch_spawned_and_wait}
	spawnscriptnow autolaunch_spawned_and_wait params = {<...>}
endscript
autolaunch_go = -1

script autolaunch_run 
	if (($autolaunch_go) = -1)
		return
	endif
	Change \{autolaunch_go = 1}
	begin
	if ($autolaunch_go = -1)
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script autolaunch_spawned_and_wait 
	begin
	if ($autolaunch_go = 1)
		break
	endif
	wait \{1
		gameframe}
	repeat
	LockGlobalTags \{forceoff}
	if GotParam \{level}
		Change current_level = <level>
		startnow = 1
	endif
	if GotParam \{song}
		GMan_SongFunc func = add_song_to_play_list params = {song = <song> version = <version>}
		startnow = 1
	endif
	if GotParam \{difficulty}
		SetPlayerInfo 1 difficulty = <difficulty>
		startnow = 1
	endif
	if GotParam \{difficulty2}
		SetPlayerInfo 2 difficulty = <difficulty2>
		startnow = 1
	endif
	if GotParam \{difficulty3}
		SetPlayerInfo 3 difficulty = <difficulty3>
		startnow = 1
	endif
	if GotParam \{difficulty4}
		SetPlayerInfo 4 difficulty = <difficulty4>
		startnow = 1
	endif
	if GotParam \{starttime}
		Change current_starttime = <starttime>
		startnow = 1
	endif
	if GotParam \{controller}
		SetPlayerInfo 1 controller = <controller>
		SetPlayerInfo 1 device = <controller>
		Change primary_controller = <controller>
		Change \{primary_controller_assigned = 1}
		startnow = 1
	else
		Change \{primary_controller = 0}
		Change \{primary_controller_assigned = 1}
	endif
	if GotParam \{controller2}
		SetPlayerInfo 2 controller = <controller2>
		SetPlayerInfo 2 device = <controller2>
		Change primary_controller = <controller2>
		Change \{primary_controller_assigned = 1}
		startnow = 1
	endif
	if GotParam \{controller3}
		SetPlayerInfo 3 controller = <controller3>
		SetPlayerInfo 3 device = <controller3>
		Change primary_controller = <controller3>
		Change \{primary_controller_assigned = 1}
		startnow = 1
	endif
	if GotParam \{controller4}
		SetPlayerInfo 4 controller = <controller4>
		SetPlayerInfo 4 device = <controller4>
		Change primary_controller = <controller4>
		Change \{primary_controller_assigned = 1}
		startnow = 1
	endif
	if GotParam \{part}
		SetPlayerInfo 1 part = <part>
		startnow = 1
	endif
	if GotParam \{part2}
		SetPlayerInfo 2 part = <part2>
		startnow = 1
	endif
	if GotParam \{part3}
		SetPlayerInfo 3 part = <part3>
		startnow = 1
	endif
	if GotParam \{part4}
		SetPlayerInfo 4 part = <part4>
		startnow = 1
	endif
	if GotParam \{game_mode}
		Change game_mode = <game_mode>
		startnow = 1
	endif
	i = 1
	begin
	UseFourLaneHighway player = <i> reset
	i = (<i> + 1)
	repeat 4
	if GotParam \{startnow}
		Change autolaunch_startnow = <startnow>
	endif
	GameMode_GetNumPlayers
	if (<num_players> > 0)
		player = 1
		begin
		SetPlayerInfo <player> in_game = 1
		<player> = (<player> + 1)
		repeat <num_players>
	endif
	UpdateBandsPlayerList
	Change \{autolaunch_go = -1}
endscript

script setup_4_player_bot 
	SetPlayerInfo \{1
		part = guitar}
	SetPlayerInfo \{2
		part = Drum}
	SetPlayerInfo \{3
		part = bass}
	SetPlayerInfo \{4
		part = vocals}
	SetPlayerInfo \{1
		bot_play = 1}
	SetPlayerInfo \{2
		bot_play = 1}
	SetPlayerInfo \{3
		bot_play = 1}
	SetPlayerInfo \{4
		bot_play = 1}
	return \{game_mode = p4_quickplay}
endscript

script change_level 
	script_assert \{qs(0xd5d70466)}
endscript

script KillElement3d 
	wait \{1
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
		PendingPakManLoads map = <map> block_scripts = 1 noparse = <noparse> Slot = <Slot>
		if GotParam \{loaderror}
			return \{false}
		endif
		return \{true}
	endif
	begin
	if NOT (PendingPakManLoads map = <map> noparse = <noparse> Slot = <Slot>)
		break
	endif
	wait \{1
		gameframe}
	repeat
	if GotParam \{loaderror}
		return \{false}
	endif
	return \{true}
endscript

script SetPakManCurrentBlock \{block_scripts = 0
		noparse = 0}
	SetPakManCurrent map = <map> pak = <pak> pakname = <pakname> Slot = <Slot>
	if NOT BlockPendingPakManLoads map = <map> block_scripts = <block_scripts> noparse = <noparse> Slot = <Slot>
		return \{false}
	endif
	if (<map> = zones)
		set_hidebytype
	endif
	return \{true}
endscript

script Zones_PakMan_Init 
	printf \{qs(0xd75fe338)}
	zone_name = <pak_name>
	zone_string_name = <pak_string_name>
	FormatText checksumname = sfx_zone_name '%z_sfx' z = <zone_string_name>
	FormatText checksumname = gfx_zone_name '%z_gfx' z = <zone_string_name>
	FormatText checksumname = lfx_zone_name '%z_lfx' z = <zone_string_name>
	FormatText checksumname = mfx_zone_name '%z_mfx' z = <zone_string_name>
	FormatText checksumname = array_name '%z_NodeArray' z = <zone_string_name>
	FormatText checksumname = sfx_array_name '%z_SFX_NodeArray' z = <zone_string_name>
	FormatText checksumname = gfx_array_name '%z_GFX_NodeArray' z = <zone_string_name>
	FormatText checksumname = lfx_array_name '%z_LFX_NodeArray' z = <zone_string_name>
	FormatText checksumname = mfx_array_name '%z_MFX_NodeArray' z = <zone_string_name>
	zone_init <...>
	FormatText checksumname = script_zone_init '%z_init' z = <zone_string_name>
	FormatText checksumname = script_zone_sfx_init '%z_sfx_init' z = <zone_string_name>
	FormatText checksumname = script_zone_gfx_init '%z_gfx_init' z = <zone_string_name>
	FormatText checksumname = script_zone_lfx_init '%z_lfx_init' z = <zone_string_name>
	FormatText checksumname = script_zone_mfx_init '%z_mfx_init' z = <zone_string_name>
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
	setup_zone_nobandcam
	printf \{qs(0xd94a3f05)}
endscript

script Zones_PakMan_DeInit 
	printf \{qs(0x8ba60592)}
	LightShow_DisableToneMap
	zone_name = <pak_name>
	zone_string_name = <pak_string_name>
	FormatText checksumname = sfx_zone_name '%z_sfx' z = <zone_string_name>
	FormatText checksumname = gfx_zone_name '%z_gfx' z = <zone_string_name>
	FormatText checksumname = lfx_zone_name '%z_lfx' z = <zone_string_name>
	FormatText checksumname = mfx_zone_name '%z_mfx' z = <zone_string_name>
	FormatText checksumname = array_name '%z_NodeArray' z = <zone_string_name>
	FormatText checksumname = sfx_array_name '%z_SFX_NodeArray' z = <zone_string_name>
	FormatText checksumname = gfx_array_name '%z_GFX_NodeArray' z = <zone_string_name>
	FormatText checksumname = lfx_array_name '%z_LFX_NodeArray' z = <zone_string_name>
	FormatText checksumname = mfx_array_name '%z_MFX_NodeArray' z = <zone_string_name>
	zone_deinit <...>
	FormatText checksumname = script_zone_deinit '%z_deinit' z = <zone_string_name>
	FormatText checksumname = script_zone_sfx_deinit '%z_sfx_deinit' z = <zone_string_name>
	FormatText checksumname = script_zone_gfx_deinit '%z_gfx_deinit' z = <zone_string_name>
	FormatText checksumname = script_zone_lfx_deinit '%z_lfx_deinit' z = <zone_string_name>
	FormatText checksumname = script_zone_mfx_deinit '%z_mfx_deinit' z = <zone_string_name>
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
	setup_zone_nobandcam
	printf \{qs(0x4dc93d77)}
endscript

script CompiledScriptTest 
	printf \{qs(0x750a2dd5)}
endscript
