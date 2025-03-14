check_for_unplugged_controllers = 0
animlodinterleave2 = 12
animlodinterleave4 = 9
ps3_animlodinterleave2 = 20
ps3_animlodinterleave4 = 12
xenon_animlodinterleave2 = 20
xenon_animlodinterleave4 = 12

script autolaunch 
	lockglobaltags \{forceoff}
	if gotparam \{level}
		change current_level = <level>
		startnow = 1
	endif
	if gotparam \{song}
		change current_song = <song>
		startnow = 1
	endif
	if gotparam \{difficulty}
		change structurename = player1_status difficulty = <difficulty>
		startnow = 1
	endif
	if gotparam \{difficulty2}
		change structurename = player2_status difficulty = <difficulty2>
		startnow = 1
	endif
	if gotparam \{difficulty3}
		change structurename = player3_status difficulty = <difficulty3>
		startnow = 1
	endif
	if gotparam \{difficulty4}
		change structurename = player4_status difficulty = <difficulty4>
		startnow = 1
	endif
	if gotparam \{starttime}
		change current_starttime = <starttime>
		startnow = 1
	endif
	if gotparam \{controller}
		change structurename = player1_status controller = <controller>
		change player1_device = <controller>
		change primary_controller = <controller>
		change \{primary_controller_assigned = 1}
		startnow = 1
	else
		change \{primary_controller = 0}
		change \{primary_controller_assigned = 1}
	endif
	if gotparam \{controller2}
		change structurename = player2_status controller = <controller2>
		change player2_device = <controller2>
		change primary_controller = <controller2>
		change \{primary_controller_assigned = 1}
		startnow = 1
	endif
	if gotparam \{controller3}
		change structurename = player3_status controller = <controller3>
		change player2_device = <controller3>
		change primary_controller = <controller3>
		change \{primary_controller_assigned = 1}
		startnow = 1
	endif
	if gotparam \{controller4}
		change structurename = player4_status controller = <controller4>
		change player2_device = <controller4>
		change primary_controller = <controller4>
		change \{primary_controller_assigned = 1}
		startnow = 1
	endif
	if gotparam \{part}
		change structurename = player1_status part = <part>
		startnow = 1
	endif
	if gotparam \{part2}
		change structurename = player2_status part = <part2>
		startnow = 1
	endif
	if gotparam \{part3}
		change structurename = player3_status part = <part3>
		startnow = 1
	endif
	if gotparam \{part4}
		change structurename = player4_status part = <part4>
		startnow = 1
	endif
	if gotparam \{game_mode}
		change game_mode = <game_mode>
		if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff)
			change \{current_num_players = 2}
		elseif ($game_mode = p3_quickplay)
			change \{current_num_players = 3}
		elseif ($game_mode = p4_quickplay)
			change \{current_num_players = 4}
		endif
		startnow = 1
	endif
	if gotparam \{startnow}
		setglobaltags \{progression
			params = {
				current_tier = 1
			}}
		setglobaltags \{progression
			params = {
				current_song_count = 0
			}}
		change autolaunch_startnow = <startnow>
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
	if ($use_worst_band = 1)
		setplayerinfo \{2
			double_kick_drum = 1}
		change \{force_fail_vignette_on = 1}
	endif
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
	if NOT gotparam \{nospam}
		printf \{qs(0x2313a464)}
	endif
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
		pendingpakmanloads map = <map> block_scripts = 1 noparse = <noparse>
		if gotparam \{loaderror}
			return \{false}
		endif
		return \{true}
	endif
	begin
	if NOT (pendingpakmanloads map = <map> noparse = <noparse>)
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
	setpakmancurrent map = <map> pak = <pak> pakname = <pakname>
	if NOT blockpendingpakmanloads map = <map> block_scripts = <block_scripts> noparse = <noparse>
		return \{false}
	endif
	getpakmancurrentname \{map = zones}
	if gotparam \{pakname}
		formattext checksumname = zone_setup '%s_setup' s = <pakname>
		if scriptexists <zone_setup>
			spawnscriptnow <zone_setup>
		endif
	endif
	return \{true}
endscript

script refreshpakmancurrent 
	setpakmancurrentblock map = <map> pak = <pak> pakname = <pakname>
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
	printf \{qs(0x4dc93d77)}
endscript
