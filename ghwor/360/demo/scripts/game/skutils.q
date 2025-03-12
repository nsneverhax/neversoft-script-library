check_for_unplugged_controllers = 0
animlodinterleave2 = 12
animlodinterleave4 = 9
ps3_animlodinterleave2 = 20
ps3_animlodinterleave4 = 12
xenon_animlodinterleave2 = 20
xenon_animlodinterleave4 = 12

script autolaunch \{game_mode = quickplay}
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

script autolaunch_spawned_and_wait \{camera = 'none'
		camera_index = 0}
	begin
	if ($autolaunch_go = 1)
		break
	endif
	wait \{1
		gameframe}
	repeat
	if NOT gotparam \{no_setlist}
		playlist_switchtonextsong \{populate_list = 1}
	endif
	lockglobaltags \{forceoff}
	if gotparam \{level}
		change current_level = <level>
		startnow = 1
	endif
	if gotparam \{song}
		playlist_clear
		playlist_addsong song = <song>
		startnow = 1
	endif
	if gotparam \{song_list}
		playlist_clear
		playlist_addsongarray song_array = <song_list>
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
	if gotparam \{controller2}
		setplayerinfo 2 controller = <controller2>
		setplayerinfo 2 device = <controller2>
		threadsafesetglobalinteger global_name = primary_controller new_value = <controller2>
		threadsafesetglobalinteger \{global_name = primary_controller_assigned
			new_value = 1}
		startnow = 1
	endif
	if gotparam \{controller3}
		setplayerinfo 3 controller = <controller3>
		setplayerinfo 3 device = <controller3>
		threadsafesetglobalinteger global_name = primary_controller new_value = <controller3>
		threadsafesetglobalinteger \{global_name = primary_controller_assigned
			new_value = 1}
		startnow = 1
	endif
	if gotparam \{controller4}
		setplayerinfo 4 controller = <controller4>
		setplayerinfo 4 device = <controller4>
		threadsafesetglobalinteger global_name = primary_controller new_value = <controller4>
		threadsafesetglobalinteger \{global_name = primary_controller_assigned
			new_value = 1}
		startnow = 1
	endif
	if gotparam \{part}
		if (<part> != none)
			setplayerinfo 1 part = <part>
			startnow = 1
		endif
	endif
	if gotparam \{part2}
		if (<part2> != none)
			setplayerinfo 2 part = <part2>
			startnow = 1
		endif
	endif
	if gotparam \{part3}
		if (<part3> != none)
			setplayerinfo 3 part = <part3>
			startnow = 1
		endif
	endif
	if gotparam \{part4}
		if (<part4> != none)
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
	if gotparam \{game_mode}
		if (<game_mode> = p1_quickplay || <game_mode> = p2_quickplay || <game_mode> = p3_quickplay || <game_mode> = p4_quickplay)
			<game_mode> = quickplay
		endif
		change game_mode = <game_mode>
		startnow = 1
	endif
	if NOT gotparam \{num_players}
		num_players = 1
	endif
	if (<num_players> > 0)
		player = 1
		begin
		setplayerinfo <player> in_game = 1
		setplayerinfo <player> four_lane_highway = 0
		<player> = (<player> + 1)
		repeat <num_players>
	endif
	updatebandsplayerlist
	if ($game_mode = career)
		change \{g_net_leader_player_num = 1}
		if NOT gotparam \{chapter}
			<chapter> = quest_chapter_axel
		endif
		change current_chapter = <chapter>
		setplayerinfo 1 character_id = ($<chapter>.rocker_id)
	endif
	if gotparam \{competitive_goal}
		change game_mode = <competitive_goal>
		change competitive_rules = <competitive_goal_rules>
		gman_startgamemodegoal
		change \{g_net_leader_player_num = 1}
		startnow = 1
	elseif gotparam \{autolaunch_quickplay_challenges}
		change \{game_mode = quickplay}
		gman_quickstartgoal \{goal_struct = quickplay_info
			goal_name = quickplay}
		startnow = 1
		if gotparam \{target_challenge}
			gman_setdata goal = quickplay params = {targeted_challenge = <target_challenge> targeted_challenge_inst_config = <part>}
		endif
	endif
	if gotparam \{startnow}
		change autolaunch_startnow = <startnow>
	endif
	if (<camera> != 'none')
		spawnscriptnow debug_autolaunch_cameracut params = {camera = <camera> index = <camera_index> use_default = <camera_use_default>}
	endif
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
	return \{game_mode = quickplay}
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
	printscriptinfo \{qs(0x2313a464)}
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
		printscriptinfo \{qs(0x3ddc95e5)}
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
		pendingpakmanloads map = <map> block_scripts = 1 noparse = <noparse> slot = <slot> heap = <heap>
		if gotparam \{loaderror}
			return \{false}
		endif
		return \{true}
	endif
	begin
	if NOT (pendingpakmanloads map = <map> noparse = <noparse> slot = <slot> heap = <heap>)
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
		noparse = 0
		heap = heap_zones}
	setpakmancurrent map = <map> pak = <pak> pakname = <pakname> slot = <slot>
	if NOT blockpendingpakmanloads map = <map> block_scripts = <block_scripts> noparse = <noparse> slot = <slot> heap = <heap>
		return \{false}
	endif
	if (<map> = zones)
		debug_menu_set_visibility
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
