check_for_unplugged_controllers = 0
AnimLODInterleave2 = 12
AnimLODInterleave4 = 9
PS3_AnimLODInterleave2 = 20
PS3_AnimLODInterleave4 = 12
Xenon_AnimLODInterleave2 = 20
Xenon_AnimLODInterleave4 = 12

script autolaunch \{game_mode = p1_quickplay}
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
endscript

script autolaunch_spawned_and_wait 
	begin
	if ($autolaunch_go = 1)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	lockglobaltags \{OFF}
	if GotParam \{level}
		Change \{debug_level_load = 1}
		Change debug_current_level = <level>
		Change current_level = <level>
		startnow = 1
	endif
	if GotParam \{song}
		begin
		gman_songfunc func = add_song_to_play_list params = {song = <song> version = <version>}
		repeat 10
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
		Change primary_controller = <controller>
		Change \{primary_controller_assigned = 1}
		startnow = 1
	else
		Change \{primary_controller = 0}
		Change \{primary_controller_assigned = 1}
	endif
	if GotParam \{controller2}
		setplayerinfo 2 controller = <controller2>
		setplayerinfo 2 device = <controller2>
		Change primary_controller = <controller2>
		Change \{primary_controller_assigned = 1}
		startnow = 1
	endif
	if GotParam \{controller3}
		setplayerinfo 3 controller = <controller3>
		setplayerinfo 3 device = <controller3>
		Change primary_controller = <controller3>
		Change \{primary_controller_assigned = 1}
		startnow = 1
	endif
	if GotParam \{controller4}
		setplayerinfo 4 controller = <controller4>
		setplayerinfo 4 device = <controller4>
		Change primary_controller = <controller4>
		Change \{primary_controller_assigned = 1}
		startnow = 1
	endif
	if GotParam \{part}
		setplayerinfo 1 part = <part>
		startnow = 1
	endif
	if GotParam \{part2}
		setplayerinfo 2 part = <part2>
		startnow = 1
	endif
	if GotParam \{part3}
		setplayerinfo 3 part = <part3>
		startnow = 1
	endif
	if GotParam \{part4}
		setplayerinfo 4 part = <part4>
		startnow = 1
	endif
	if GotParam \{bot_play}
		setplayerinfo \{1
			bot_play = 1}
		startnow = 1
	endif
	if GotParam \{bot_play2}
		setplayerinfo \{2
			bot_play = 1}
		startnow = 1
	endif
	if GotParam \{bot_play3}
		setplayerinfo \{3
			bot_play = 1}
		startnow = 1
	endif
	if GotParam \{bot_play4}
		setplayerinfo \{4
			bot_play = 1}
		startnow = 1
	endif
	if GotParam \{character}
		setplayerinfo 1 character_id = <character>
		setplayerinfo \{1
			character_savegame = -1}
		startnow = 1
	endif
	if GotParam \{character2}
		setplayerinfo 2 character_id = <character2>
		setplayerinfo \{2
			character_savegame = -1}
		startnow = 1
	endif
	if GotParam \{character3}
		setplayerinfo 3 character_id = <character3>
		setplayerinfo \{3
			character_savegame = -1}
		startnow = 1
	endif
	if GotParam \{character4}
		setplayerinfo 4 character_id = <character4>
		setplayerinfo \{4
			character_savegame = -1}
		startnow = 1
	endif
	if GotParam \{band_member}
		setplayerinfo 1 band_member = <band_member>
		startnow = 1
	endif
	if GotParam \{band_member2}
		setplayerinfo 2 band_member = <band_member2>
		startnow = 1
	endif
	if GotParam \{band_member3}
		setplayerinfo 3 band_member = <band_member3>
		startnow = 1
	endif
	if GotParam \{band_member4}
		setplayerinfo 4 band_member = <band_member4>
		startnow = 1
	endif
	if GotParam \{game_mode}
		Change game_mode = <game_mode>
		startnow = 1
	endif
	if GotParam \{startnow}
		Change autolaunch_startnow = <startnow>
		Change \{skip_signin = 1}
		Change \{skip_autoload = 1}
		Change \{skip_boot_menu = 1}
	endif
	if GotParam \{force_encore}
		Change \{debug_encore = 1}
	endif
	gamemode_getnumplayers
	if (<num_players> > 0)
		Player = 1
		begin
		setplayerinfo <Player> in_game = 1
		<Player> = (<Player> + 1)
		repeat <num_players>
	endif
	updatebandsplayerlist
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
	return \{game_mode = p4_quickplay}
endscript

script debug_trigger_star_power \{Player = 1
		player_text = 'p1'}
	begin
	getplayerinfo <Player> playline_song_measure_time
	if NOT ((<playline_song_measure_time>) = 0)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	charge_star_power
	Change \{star_power_drain_rate = 0}
	star_power_activate_and_drain Player = <Player>
endscript

script change_level 
	script_assert \{qs(0xd5d70466)}
endscript

script KillElement3d 
	ScriptAssert \{'KillElement3d: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script script_assert 
	printf \{qs(0x8b930894)}
	ScriptAssert <...>
endscript

script nullscript 
endscript

script DumpMetrics 
	ScriptAssert \{'DumpMetrics: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
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
	ScriptAssert \{'SetSkaterCamOverride: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script ClearSkaterCamOverride 
	ScriptAssert \{'ClearSkaterCamOverride: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
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
	WaitOneGameFrame
	repeat
	if GotParam \{loaderror}
		return \{FALSE}
	endif
	return \{true}
endscript

script SetPakManCurrentBlock \{block_scripts = 0
		noparse = 0}
	printf qs(0x0750b984) d = <pak>
	SetPakManCurrent map = <map> pak = <pak> pakname = <pakname>
	if NOT BlockPendingPakManLoads map = <map> block_scripts = <block_scripts> noparse = <noparse>
		printf \{qs(0x40db9cc6)}
		return \{FALSE}
	endif
	GetPakManCurrentName \{map = zones}
	if GotParam \{pakname}
		clearmasterbloom
		formatText checksumName = zone_setup '%s_setup' s = <pakname>
		if ScriptExists <zone_setup>
			<zone_setup>
		endif
	endif
	set_hidebytype
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
	printf \{qs(0xd94a3f05)}
endscript

script Zones_PakMan_DeInit 
	printf \{qs(0x8ba60592)}
	Change \{profiling_gpu = FALSE}
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
