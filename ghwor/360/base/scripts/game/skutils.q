check_for_unplugged_controllers = 0
AnimLODInterleave2 = 12
AnimLODInterleave4 = 9
PS3_AnimLODInterleave2 = 20
PS3_AnimLODInterleave4 = 12
Xenon_AnimLODInterleave2 = 20
Xenon_AnimLODInterleave4 = 12

script autolaunch \{game_mode = quickplay}
	Change \{autolaunch_go = 0}
	KillSpawnedScript \{Name = autolaunch_spawned_and_wait}
	SpawnScriptNow autolaunch_spawned_and_wait params = {<...>}
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
	Wait \{1
		gameframe}
	repeat
endscript

script autolaunch_spawned_and_wait \{Camera = 'none'
		camera_index = 0}
	begin
	if ($autolaunch_go = 1)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if NOT GotParam \{no_setlist}
		playlist_switchtonextsong \{populate_list = 1}
	endif
	lockglobaltags \{forceoff}
	if GotParam \{level}
		Change current_level = <level>
		startnow = 1
	endif
	if GotParam \{song}
		playlist_clear
		playlist_addsong song = <song>
		startnow = 1
	endif
	if GotParam \{song_list}
		playlist_clear
		playlist_addsongarray song_array = <song_list>
		startnow = 1
	endif
	if GotParam \{difficulty}
		setplayerinfo 1 difficulty = <difficulty>
		startnow = 1
	endif
	if GotParam \{difficulty2}
		setplayerinfo 2 difficulty = <difficulty2>
		startnow = 1
	endif
	if GotParam \{difficulty3}
		setplayerinfo 3 difficulty = <difficulty3>
		startnow = 1
	endif
	if GotParam \{difficulty4}
		setplayerinfo 4 difficulty = <difficulty4>
		startnow = 1
	endif
	if GotParam \{starttime}
		Change current_starttime = <starttime>
		startnow = 1
	endif
	if GotParam \{controller}
		setplayerinfo 1 controller = <controller>
		setplayerinfo 1 device = <controller>
		threadsafesetglobalinteger global_name = primary_controller new_value = <controller>
		threadsafesetglobalinteger \{global_name = primary_controller_assigned
			new_value = 1}
		startnow = 1
	else
		threadsafesetglobalinteger \{global_name = primary_controller
			new_value = 0}
		threadsafesetglobalinteger \{global_name = primary_controller_assigned
			new_value = 1}
	endif
	if GotParam \{controller2}
		setplayerinfo 2 controller = <controller2>
		setplayerinfo 2 device = <controller2>
		threadsafesetglobalinteger global_name = primary_controller new_value = <controller2>
		threadsafesetglobalinteger \{global_name = primary_controller_assigned
			new_value = 1}
		startnow = 1
	endif
	if GotParam \{controller3}
		setplayerinfo 3 controller = <controller3>
		setplayerinfo 3 device = <controller3>
		threadsafesetglobalinteger global_name = primary_controller new_value = <controller3>
		threadsafesetglobalinteger \{global_name = primary_controller_assigned
			new_value = 1}
		startnow = 1
	endif
	if GotParam \{controller4}
		setplayerinfo 4 controller = <controller4>
		setplayerinfo 4 device = <controller4>
		threadsafesetglobalinteger global_name = primary_controller new_value = <controller4>
		threadsafesetglobalinteger \{global_name = primary_controller_assigned
			new_value = 1}
		startnow = 1
	endif
	if GotParam \{part}
		if (<part> != None)
			setplayerinfo 1 part = <part>
			startnow = 1
		endif
	endif
	if GotParam \{part2}
		if (<part2> != None)
			setplayerinfo 2 part = <part2>
			startnow = 1
		endif
	endif
	if GotParam \{part3}
		if (<part3> != None)
			setplayerinfo 3 part = <part3>
			startnow = 1
		endif
	endif
	if GotParam \{part4}
		if (<part4> != None)
			setplayerinfo 4 part = <part4>
			startnow = 1
		endif
	endif
	getplayerinfo \{1
		part}
	setplayerinfo 1 stored_part = <part>
	getplayerinfo \{2
		part}
	setplayerinfo 2 stored_part = <part>
	getplayerinfo \{3
		part}
	setplayerinfo 3 stored_part = <part>
	getplayerinfo \{4
		part}
	setplayerinfo 4 stored_part = <part>
	if GotParam \{game_mode}
		if (<game_mode> = p1_quickplay || <game_mode> = p2_quickplay || <game_mode> = p3_quickplay || <game_mode> = p4_quickplay)
			<game_mode> = quickplay
		endif
		Change game_mode = <game_mode>
		startnow = 1
	endif
	if NOT GotParam \{num_players}
		num_players = 1
	endif
	if (<num_players> > 0)
		Player = 1
		begin
		setplayerinfo <Player> in_game = 1
		setplayerinfo <Player> four_lane_highway = 0
		<Player> = (<Player> + 1)
		repeat <num_players>
	endif
	updatebandsplayerlist
	if ($game_mode = career)
		Change \{g_net_leader_player_num = 1}
		if NOT GotParam \{chapter}
			<chapter> = quest_chapter_axel
		endif
		Change current_chapter = <chapter>
		setplayerinfo 1 character_id = ($<chapter>.rocker_id)
	endif
	if GotParam \{competitive_goal}
		Change game_mode = <competitive_goal>
		Change competitive_rules = <competitive_goal_rules>
		gman_startgamemodegoal
		Change \{g_net_leader_player_num = 1}
		startnow = 1
	elseif GotParam \{autolaunch_quickplay_challenges}
		Change \{game_mode = quickplay}
		gman_quickstartgoal \{goal_struct = quickplay_info
			goal_name = quickplay}
		startnow = 1
		if GotParam \{target_challenge}
			gman_setdata goal = quickplay params = {targeted_challenge = <target_challenge> targeted_challenge_inst_config = <part>}
		endif
	endif
	if GotParam \{startnow}
		Change autolaunch_startnow = <startnow>
	endif
	if (<Camera> != 'none')
		SpawnScriptNow debug_autolaunch_cameracut params = {Camera = <Camera> index = <camera_index> use_default = <camera_use_default>}
	endif
	Change \{autolaunch_go = -1}
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
	return \{game_mode = quickplay}
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
	printscriptinfo \{qs(0x2313a464)}
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
		printscriptinfo \{qs(0x3ddc95e5)}
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
		PendingPakManLoads map = <map> block_scripts = 1 noparse = <noparse> slot = <slot> Heap = <Heap>
		if GotParam \{loaderror}
			return \{FALSE}
		endif
		return \{true}
	endif
	begin
	if NOT (PendingPakManLoads map = <map> noparse = <noparse> slot = <slot> Heap = <Heap>)
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
		noparse = 0
		Heap = heap_zones}
	SetPakManCurrent map = <map> pak = <pak> pakname = <pakname> slot = <slot>
	if NOT BlockPendingPakManLoads map = <map> block_scripts = <block_scripts> noparse = <noparse> slot = <slot> Heap = <Heap>
		return \{FALSE}
	endif
	if (<map> = zones)
		debug_menu_set_visibility
	endif
	return \{true}
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
	setup_zone_nobandcam
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
	setup_zone_nobandcam
	printf \{qs(0x4dc93d77)}
endscript

script compiledscripttest 
	printf \{qs(0x750a2dd5)}
endscript
