check_for_unplugged_controllers = 0
animlodinterleave2 = 12
animlodinterleave4 = 9
ps3_animlodinterleave2 = 20
ps3_animlodinterleave4 = 12
xenon_animlodinterleave2 = 20
xenon_animlodinterleave4 = 12

script autolaunch \{game_mode = p1_quickplay}
	change \{autolaunch_go = 0}
	killspawnedscript \{name = autolaunch_spawned_and_wait}
	spawnscriptnow autolaunch_spawned_and_wait params = {<...>}
endscript
autolaunch_go = -1

script autolaunch_run 
	if (($autolaunch_go) = -1)
		return
	endif
	change \{autolaunch_go = 1}
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
	lockglobaltags \{forceoff}
	if gotparam \{level}
		change current_level = <level>
		startnow = 1
	endif
	if gotparam \{song}
		gman_songfunc func = add_song_to_play_list params = {song = <song> version = <version>}
		startnow = 1
	endif
	if gotparam \{difficulty}
		setplayerinfo 1 difficulty = <difficulty>
		startnow = 1
	endif
	if gotparam \{difficulty2}
		setplayerinfo 2 difficulty = <difficulty2>
		startnow = 1
	endif
	if gotparam \{difficulty3}
		setplayerinfo 3 difficulty = <difficulty3>
		startnow = 1
	endif
	if gotparam \{difficulty4}
		setplayerinfo 4 difficulty = <difficulty4>
		startnow = 1
	endif
	if gotparam \{starttime}
		change current_starttime = <starttime>
		startnow = 1
	endif
	if gotparam \{controller}
		setplayerinfo 1 controller = <controller>
		setplayerinfo 1 device = <controller>
		change primary_controller = <controller>
		change \{primary_controller_assigned = 1}
		startnow = 1
	else
		change \{primary_controller = 0}
		change \{primary_controller_assigned = 1}
	endif
	if gotparam \{controller2}
		setplayerinfo 2 controller = <controller2>
		setplayerinfo 2 device = <controller2>
		change primary_controller = <controller2>
		change \{primary_controller_assigned = 1}
		startnow = 1
	endif
	if gotparam \{controller3}
		setplayerinfo 3 controller = <controller3>
		setplayerinfo 3 device = <controller3>
		change primary_controller = <controller3>
		change \{primary_controller_assigned = 1}
		startnow = 1
	endif
	if gotparam \{controller4}
		setplayerinfo 4 controller = <controller4>
		setplayerinfo 4 device = <controller4>
		change primary_controller = <controller4>
		change \{primary_controller_assigned = 1}
		startnow = 1
	endif
	if gotparam \{part}
		setplayerinfo 1 part = <part>
		startnow = 1
	endif
	if gotparam \{part2}
		setplayerinfo 2 part = <part2>
		startnow = 1
	endif
	if gotparam \{part3}
		setplayerinfo 3 part = <part3>
		startnow = 1
	endif
	if gotparam \{part4}
		setplayerinfo 4 part = <part4>
		startnow = 1
	endif
	if gotparam \{game_mode}
		change game_mode = <game_mode>
		startnow = 1
	endif
	if gotparam \{startnow}
		change autolaunch_startnow = <startnow>
	endif
	gamemode_getnumplayers
	if (<num_players> > 0)
		player = 1
		begin
		setplayerinfo <player> in_game = 1
		<player> = (<player> + 1)
		repeat <num_players>
	endif
	updatebandsplayerlist
	change \{autolaunch_go = -1}
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

script killelement3d 
	wait \{1
		gameframe}
	die
endscript

script script_assert 
	printf \{qs(0x8b930894)}
	scriptassert <...>
endscript

script nullscript 
endscript

script dumpmetrics 
	getmetrics
	printf
	printf \{qs(0xff1d69af)}
	printstruct <...>
endscript
dummy_metrics_struct = {
	mainscene = 0
	skyscene = 0
	metrics = 0
	sectors = 0
	colsectors = 0
	verts = 0
	basepolys = 0
	texturememory = 0
}

script restore_skater_camera 
endscript

script getskatercam 
	camera_object = skatercam0
	if insplitscreengame
		if isobjectscript
			obj_getid
			if NOT checksumequals a = <objid> b = 0
				camera_object = skatercam1
			endif
		endif
	endif
	return skatercam = <camera_object>
endscript

script setskatercamoverride 
	getskatercam
	<skatercam> :sc_setskatercamoverride <...>
endscript

script clearskatercamoverride 
	getskatercam
	<skatercam> :sc_clearskatercamoverride <...>
endscript

script empty_script 
endscript

script restore_start_key_binding 
	printf \{qs(0x2313a464)}
	setscreenelementprops \{id = root_window
		event_handlers = [
			{
				pad_start
				handle_pause_event
			}
		]
		replace_handlers}
endscript

script kill_start_key_binding 
	if NOT gotparam \{nospam}
		printf \{qs(0x3ddc95e5)}
	endif
	setscreenelementprops \{id = root_window
		event_handlers = [
			{
				pad_start
				null_script
			}
		]
		replace_handlers}
endscript

script blockpendingpakmanloads \{map = all
		block_scripts = 0
		noparse = 0}
	if (<block_scripts> = 1)
		pendingpakmanloads map = <map> block_scripts = 1 noparse = <noparse> slot = <slot>
		if gotparam \{loaderror}
			return \{false}
		endif
		return \{true}
	endif
	begin
	if NOT (pendingpakmanloads map = <map> noparse = <noparse> slot = <slot>)
		break
	endif
	wait \{1
		gameframe}
	repeat
	if gotparam \{loaderror}
		return \{false}
	endif
	return \{true}
endscript

script setpakmancurrentblock \{block_scripts = 0
		noparse = 0}
	setpakmancurrent map = <map> pak = <pak> pakname = <pakname> slot = <slot>
	if NOT blockpendingpakmanloads map = <map> block_scripts = <block_scripts> noparse = <noparse> slot = <slot>
		return \{false}
	endif
	if (<map> = zones)
		set_hidebytype
	endif
	return \{true}
endscript

script zones_pakman_init 
	printf \{qs(0xd75fe338)}
	zone_name = <pak_name>
	zone_string_name = <pak_string_name>
	formattext checksumname = sfx_zone_name '%z_sfx' z = <zone_string_name>
	formattext checksumname = gfx_zone_name '%z_gfx' z = <zone_string_name>
	formattext checksumname = lfx_zone_name '%z_lfx' z = <zone_string_name>
	formattext checksumname = mfx_zone_name '%z_mfx' z = <zone_string_name>
	formattext checksumname = array_name '%z_NodeArray' z = <zone_string_name>
	formattext checksumname = sfx_array_name '%z_SFX_NodeArray' z = <zone_string_name>
	formattext checksumname = gfx_array_name '%z_GFX_NodeArray' z = <zone_string_name>
	formattext checksumname = lfx_array_name '%z_LFX_NodeArray' z = <zone_string_name>
	formattext checksumname = mfx_array_name '%z_MFX_NodeArray' z = <zone_string_name>
	zone_init <...>
	formattext checksumname = script_zone_init '%z_init' z = <zone_string_name>
	formattext checksumname = script_zone_sfx_init '%z_sfx_init' z = <zone_string_name>
	formattext checksumname = script_zone_gfx_init '%z_gfx_init' z = <zone_string_name>
	formattext checksumname = script_zone_lfx_init '%z_lfx_init' z = <zone_string_name>
	formattext checksumname = script_zone_mfx_init '%z_mfx_init' z = <zone_string_name>
	if scriptexists <script_zone_init>
		<script_zone_init>
	endif
	if scriptexists <script_zone_sfx_init>
		<script_zone_sfx_init>
	endif
	if scriptexists <script_zone_gfx_init>
		<script_zone_gfx_init>
	endif
	if scriptexists <script_zone_lfx_init>
		<script_zone_lfx_init>
	endif
	if scriptexists <script_zone_mfx_init>
		<script_zone_mfx_init>
	endif
	updatepakmanvisibility \{map = zones}
	setup_zone_nobandcam
	printf \{qs(0xd94a3f05)}
endscript

script zones_pakman_deinit 
	printf \{qs(0x8ba60592)}
	zone_name = <pak_name>
	zone_string_name = <pak_string_name>
	formattext checksumname = sfx_zone_name '%z_sfx' z = <zone_string_name>
	formattext checksumname = gfx_zone_name '%z_gfx' z = <zone_string_name>
	formattext checksumname = lfx_zone_name '%z_lfx' z = <zone_string_name>
	formattext checksumname = mfx_zone_name '%z_mfx' z = <zone_string_name>
	formattext checksumname = array_name '%z_NodeArray' z = <zone_string_name>
	formattext checksumname = sfx_array_name '%z_SFX_NodeArray' z = <zone_string_name>
	formattext checksumname = gfx_array_name '%z_GFX_NodeArray' z = <zone_string_name>
	formattext checksumname = lfx_array_name '%z_LFX_NodeArray' z = <zone_string_name>
	formattext checksumname = mfx_array_name '%z_MFX_NodeArray' z = <zone_string_name>
	zone_deinit <...>
	formattext checksumname = script_zone_deinit '%z_deinit' z = <zone_string_name>
	formattext checksumname = script_zone_sfx_deinit '%z_sfx_deinit' z = <zone_string_name>
	formattext checksumname = script_zone_gfx_deinit '%z_gfx_deinit' z = <zone_string_name>
	formattext checksumname = script_zone_lfx_deinit '%z_lfx_deinit' z = <zone_string_name>
	formattext checksumname = script_zone_mfx_deinit '%z_mfx_deinit' z = <zone_string_name>
	if scriptexists <script_zone_deinit>
		<script_zone_deinit>
	endif
	if scriptexists <script_zone_sfx_deinit>
		<script_zone_sfx_deinit>
	endif
	if scriptexists <script_zone_gfx_deinit>
		<script_zone_gfx_deinit>
	endif
	if scriptexists <script_zone_lfx_deinit>
		<script_zone_lfx_deinit>
	endif
	if scriptexists <script_zone_mfx_deinit>
		<script_zone_mfx_deinit>
	endif
	destroyparticlesbygroupid \{groupid = zoneparticles}
	destroyzoneentities zone_name = <zone_name> zone_string_name = <zone_string_name>
	resetwaypoints pak_name = <pak_name>
	resetwaypoints pak_name = <gfx_zone_name>
	resetwaypoints pak_name = <sfx_zone_name>
	resetwaypoints pak_name = <lfx_zone_name>
	updatepakmanvisibility \{map = zones}
	setup_zone_nobandcam
	printf \{qs(0x4dc93d77)}
endscript

script compiledscripttest 
	printf \{qs(0x750a2dd5)}
endscript
