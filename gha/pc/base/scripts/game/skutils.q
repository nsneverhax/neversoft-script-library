check_for_unplugged_controllers = 0
animlodinterleave2 = 12
animlodinterleave4 = 9
ps3_animlodinterleave2 = 20
ps3_animlodinterleave4 = 12
xenon_animlodinterleave2 = 20
xenon_animlodinterleave4 = 12

script autolaunch 
	if gotparam \{level}
		change current_level = <level>
		startnow = 2
	endif
	if gotparam \{song}
		change current_song = <song>
		startnow = 1
	endif
	if gotparam \{difficulty}
		change current_difficulty = <difficulty>
		startnow = 1
	endif
	if gotparam \{difficulty2}
		change current_difficulty2 = <difficulty2>
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
		startnow = 1
	endif
	if gotparam \{controller2}
		change structurename = player2_status controller = <controller2>
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
	if gotparam \{game_mode}
		change game_mode = <game_mode>
		if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff)
			change \{current_num_players = 2}
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
	translate_gamemode
endscript

script change_level 
	script_assert \{"This is now gone..."}
endscript

script killelement3d 
	wait \{1
		gameframe}
	die
endscript

script setup_ped_speech \{inner_radius = 0.3
		speed = 0.5
		pad_choose_script = ped_speech_exit}
	if NOT iscreated <ped_id>
		scriptassert \{"tried to set up ped speech on an object that doesn't exist"}
	endif
	<ped_id> :obj_setinnerradius <inner_radius>
	cleareventhandler \{anyobjectinradius}
	cleareventhandler \{objectoutofradius}
	seteventhandler event = anyobjectinradius scr = ped_speech_got_trigger reponse = call_script params = <...>
endscript

script ped_speech_got_trigger \{set_script = seteventhandler
		set_script_scr = ped_speech_got_trigger}
	if NOT <colobjid> :islocalskater
		return
	endif
	if (($dont_create_speech_boxes = 1) || ($game_progress_block_triggers = 1) || ($sysnotify_wait_in_progress = 1))
		return
	endif
	cleareventhandler \{anyobjectinradius}
	if objectexists \{id = ped_speech_dialog}
		<should_destroy> = 0
		if skater :isinbail
			<should_destroy> = 1
		endif
		if skatercurrentscorepotgreaterthan \{0}
			<should_destroy> = 1
		endif
		if <colobjid> :doingtrick
			<should_destroy> = 1
		endif
		if NOT gman_canstartgoal
			<should_destroy> = 1
		endif
		if gotparam \{hide_in_goals}
			if gman_hasactivegoals
				<should_destroy> = 1
			endif
		endif
		if (<should_destroy> = 1)
			destroyscreenelement \{id = ped_speech_dialog}
		endif
		<set_script> event = anyobjectinradius scr = <set_script_scr> object = <ped_id> params = <...>
	else
		show_speech_box = 1
		if istrue \{$igc_playing}
			show_speech_box = 0
		endif
		if objectexists \{id = root_window}
			root_window :gettags
			if gotparam \{menu_state}
				if (<menu_state> = on)
					show_speech_box = 0
				endif
			endif
		endif
		if NOT gman_canstartgoal
			if NOT innetgame
				show_speech_box = 0
			endif
		endif
		if NOT <colobjid> :onground
			show_speech_box = 0
		endif
		if <colobjid> :isinbail
			show_speech_box = 0
		endif
		if <colobjid> :doingtrick
			show_speech_box = 0
		endif
		if skatercurrentscorepotgreaterthan \{0}
			show_speech_box = 0
		endif
		if gotparam \{hide_in_goals}
			if gman_hasactivegoals
				<show_speech_box> = 0
			endif
		endif
		if (<show_speech_box> = 1)
			if gotparam \{dont_allow_pause}
				kill_start_key_binding
			endif
			<ped_id> :obj_setouterradius <inner_radius>
			<set_script> event = objectoutofradius scr = ped_speech_refuse object = <ped_id> params = <...>
			if NOT gotparam \{accept_text}
				if NOT gotparam \{display_name}
					<display_name> = "Ped"
				endif
				formattext textname = accept_text "%s: \\me to talk." s = <display_name>
			endif
			if objectexists \{id = ped_speech_dialog}
				destroyscreenelement \{id = ped_speech_dialog}
			endif
			create_speech_box {
				anchor_id = ped_speech_dialog
				text = <accept_text>
				no_pad_choose
				no_pad_start
				pad_option_script = ped_speech_accept
				pad_option_params = <...>
				pos = (320.0, 400.0)
				z_priority = 5
			}
			ped_speech_dialog :obj_spawnscriptlater ped_speech_die_with_trigger params = {ped_id = <ped_id>}
		else
			<set_script> event = anyobjectinradius scr = <set_script_scr> object = <ped_id> params = <...>
		endif
	endif
endscript

script ped_speech_accept 
	if <colobjid> :isinbail
		return
	endif
	if <colobjid> :doingtrick
		return
	endif
	speech_box_exit
	if NOT objectexists id = <ped_id>
		return
	endif
	debounce \{x
		time = 0.5}
	if <colobjid> :onground
		if NOT skatercurrentscorepotgreaterthan \{0}
			wait \{5
				frame}
			if <colobjid> :onground
				ped_speech_accept2 <...>
			else
				if NOT <colobjid> :rightpressed
					if NOT <colobjid> :leftpressed
						if NOT <colobjid> :uppressed
							if NOT <colobjid> :downpressed
								ped_speech_accept2 <...>
							endif
						endif
					endif
				endif
			endif
		endif
	else
		if NOT <colobjid> :rightpressed
			if NOT <colobjid> :leftpressed
				if NOT <colobjid> :uppressed
					if NOT <colobjid> :downpressed
						ped_speech_accept2 <...>
					endif
				endif
			endif
		endif
	endif
endscript

script ped_speech_accept2 
	if NOT gotparam \{dont_deactivate_goals}
		if NOT gamemodeequals \{is_singlesession}
			if NOT gamemodeequals \{is_classic}
				gman_deactivateallgoals
			endif
		endif
	endif
	cleareventhandler \{anyobjectinradius}
	if screenelementexists \{id = ped_speech_dialog}
		destroyscreenelement \{id = ped_speech_dialog}
	endif
	if gotparam \{activation_script}
		<colobjid> :obj_spawnscriptlater <activation_script> params = {ped_id = <ped_id> <activation_script_params>}
	endif
	if gotparam \{text}
		create_speech_box <...> no_pad_start
	endif
endscript

script ped_speech_refuse 
	if gotparam \{intid}
		if gotparam \{outintid}
			if NOT (<outintid> = <intid>)
				return
			endif
		endif
	endif
	if gotparam \{hint_text}
		ped_utils_hint_dialog_refuse <...>
	endif
	cleareventhandler \{objectoutofradius}
	speech_box_exit \{anchor_id = ped_speech_dialog}
	ped_speech_reset <...>
	if gotparam \{dont_allow_pause}
		restore_start_key_binding
	endif
endscript

script ped_speech_reset 
	if gotparam \{outer_radius_script}
		<outer_radius_script> <outer_radius_params>
	endif
	if NOT gotparam \{no_repeat}
		setup_ped_speech <...>
	endif
endscript

script ped_speech_exit 
	unpauseskaters
	speech_box_exit
endscript

script ped_speech_die_with_trigger 
	if NOT gotparam \{ped_id}
		return
	endif
	begin
	if NOT iscreated <ped_id>
		launchevent \{type = speech_box_destroyed}
		die
		return
	endif
	wait \{1
		gameframes}
	repeat
endscript

script script_assert 
	printf \{"ASSERT MESSAGE:"}
	scriptassert <...>
endscript

script nullscript 
endscript

script dumpmetrics 
	getmetrics
	printf
	printf \{"Dumping Metrics Structure"}
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
	printf \{"+++ RESTORE START KEY"}
	setscreenelementprops \{id = root_window
		event_handlers = [
			{
				pad_start
				gh3_start_pressed
			}
		]
		replace_handlers}
endscript

script kill_start_key_binding 
	printf \{"--- KILL START KEY"}
	setscreenelementprops \{id = root_window
		event_handlers = [
			{
				pad_start
				null_script
			}
		]
		replace_handlers}
	if ($enable_view_goals_select_shortcut = 1)
		setscreenelementprops \{id = root_window
			event_handlers = [
				{
					pad_select
					null_script
				}
			]
			replace_handlers}
	endif
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
	set_hidebytype
	return \{true}
endscript

script refreshpakmancurrent 
	setpakmancurrentblock map = <map> pak = <pak> pakname = <pakname>
endscript

script zones_pakman_init 
	printf \{"Zones_PakMan_Init"}
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
	printf \{"Zones_PakMan_Init end"}
endscript

script zones_pakman_deinit 
	printf \{"Zones_PakMan_DeInit"}
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
	updatepakmanvisibility \{map = zones}
	printf \{"Zones_PakMan_DeInit end"}
endscript
