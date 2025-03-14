unlockable_game_areas = {
	philly_downtown = {
		title = "Philly Downtown"
		bink = 'area_unlock_dt_philly'
		unlocked_nodeflags = [
			nodeflag_love_unlocked
		]
		locked_nodeflags = [
			nodeflag_love_kill_plane
		]
		zones = [
			z_love
			z_bell
		]
	}
	philly_fdr = {
		title = "Philly FDR"
		bink = 'area_unlock_FDR'
		unlocked_nodeflags = [
			nodeflag_z_fdr_attackers
		]
		locked_nodeflags = [
			nodeflag_lock_slums_fdr
		]
		zones = [
			z_fdr
		]
	}
	balt_lansdowne = {
		title = "Balt Lansdowne"
		bink = 'area_unlock_lansdowne'
		unlocked_nodeflags = [
			nodeflag_z_lansdowne_unlocked
		]
		locked_nodeflags = [
			nodeflag_z_lansdowne_locked
		]
		zones = [
			z_lansdowne
		]
	}
	dc_nasm = {
		title = "DC NASM"
		bink = 'area_unlock_airandspace'
		unlocked_nodeflags = [
			nodeflag_z_museum_int_unlocked
		]
		locked_nodeflags = [
			nodeflag_z_museum_int_doors_lock
		]
		zones = [
			z_museum_int
		]
	}
	philly_balt_bridge = {
		title = "Philly-Balt Bridge"
		bink = 'area_unlock_philly_balt_tunnel'
		unlocked_nodeflags = [
			nodeflag_pb_bridge_barge
		]
		locked_nodeflags = [
			nodeflag_pb_bridge_unlock
		]
		zones = [
			z_pb_bridge
			z_bcity
			z_harbor
		]
	}
	philly_dc_subway = {
		title = "Philly-DC Bridge"
		bink = 'area_unlock_dc_philly_subway'
		unlocked_nodeflags = [
			NODEFLAG_BELL_SUBWAY_UNLOCKED
		]
		locked_nodeflags = [
			nodeflag_bell_subway_lock
			nodeflag_unlock_wp_bridge
		]
		zones = [
			z_wp_bridge
			z_monuments
			z_museums
		]
	}
	balt_dc_bridge = {
		title = "Balt-DC Bridge"
		bink = 'area_unlock_balt_dc_bridge'
		unlocked_nodeflags = [
			nodeflag_bw_bridge_unlocked
		]
		locked_nodeflags = [
			nodeflag_bw_bridge_unlock_city
			nodeflag_bw_bridge_unlock_dc
		]
		zones = [
			z_bw_bridge
			z_monuments
			z_museums
		]
	}
}
unlockable_game_areas_list = [
	philly_downtown
	philly_fdr
	balt_lansdowne
	dc_nasm
	philly_balt_bridge
	philly_dc_subway
	balt_dc_bridge
]
impress_h1_game_areas_list = [
	philly_downtown
	philly_balt_bridge
	philly_dc_subway
	balt_dc_bridge
]

script unlock_game_area 
	set_game_area_locked_state game_area = <game_area> state = unlock
endscript

script unlock_all_game_areas 
	foreachin \{$unlockable_game_areas
		do = set_game_area_locked_iter
		pass_index
		params = {
			state = unlock
		}}
endscript

script lock_all_game_areas 
	foreachin \{$unlockable_game_areas
		do = set_game_area_locked_iter
		pass_index
		params = {
			state = lock
		}}
endscript

script are_all_game_areas_unlocked 
	getarraysize \{$unlockable_game_areas_list}
	<i> = 0
	begin
	get_game_area_locked_state game_area = ($unlockable_game_areas_list [<i>])
	if checksumequals a = <locked_state> b = locked
		return \{false}
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	return \{true}
endscript

script are_impress_h1_game_areas_unlocked 
	getarraysize \{$impress_h1_game_areas_list}
	<i> = 0
	begin
	get_game_area_locked_state game_area = ($impress_h1_game_areas_list [<i>])
	if checksumequals a = <locked_state> b = locked
		return \{false}
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	return \{true}
endscript

script set_game_area_locked_iter 
	set_game_area_locked_state game_area = <foreachin_name> state = <state>
endscript

script set_game_area_locked_state 
	requireparams [game_area state] all
	get_unlockable_game_area game_area = <game_area>
	if NOT gotparam unlocked_area
		return
	endif
	printf '-- game area %a - %u' a = <game_area> u = <state>
	switch <state>
		case unlock
		SetNodeFlags flags = (<unlocked_area>.locked_nodeflags) value = 0
		SetNodeFlags flags = (<unlocked_area>.unlocked_nodeflags) value = 1
		case lock
		SetNodeFlags flags = (<unlocked_area>.unlocked_nodeflags) value = 0
		SetNodeFlags flags = (<unlocked_area>.locked_nodeflags) value = 1
		default
		softassert 'unknown locked state %s' s = <state>
		return
	endswitch
	sk9_secret_area_unlock_check
endscript

script get_game_area_locked_state 
	requireparams [game_area] all
	get_unlockable_game_area game_area = <game_area>
	if NOT gotparam unlocked_area
		return
	endif
	<locked_state> = locked
	getarraysize (<unlocked_area>.locked_nodeflags)
	if (<array_size> > 0)
		if NOT getnodeflag (<unlocked_area>.locked_nodeflags [0])
			<locked_state> = unlocked
		endif
	else
		getarraysize (<unlocked_area>.unlocked_nodeflags)
		if (<array_size> > 0)
			if getnodeflag (<unlocked_area>.unlocked_nodeflags [0])
				<locked_state> = unlocked
			endif
		endif
	endif
	return locked_state = <locked_state>
endscript

script toggle_game_area_locked_state 
	get_game_area_locked_state game_area = <game_area>
	if (<locked_state> = unlocked)
		<change_state> = lock
		<locked_state> = locked
	else
		<change_state> = unlock
		<locked_state> = unlocked
	endif
	if isobjectscript
		obj_getid
		formattext textname = text "%a - %b" a = (($unlockable_game_areas.<game_area>).title) b = <locked_state> dontassertforchecksums
		getlowercasestring <text>
		<text> = <lowercasestring>
		setscreenelementprops id = {<objid> child = text} text = <text>
	endif
	set_game_area_locked_state game_area = <game_area> state = <change_state>
endscript

script get_unlockable_game_area 
	requireparams \{[
			game_area
		]
		all}
	if NOT structurecontains structure = $unlockable_game_areas <game_area>
		softassert 'Unknown game area %z' z = <game_area>
		return
	endif
	return unlocked_area = ($unlockable_game_areas.<game_area>)
endscript

script SetNodeFlags 
	requireparams \{[
			flags
			value
		]
		all}
	getarraysize <flags>
	if (<array_size> > 0)
		<flag_idx> = 0
		begin
		changenodeflag (<flags> [<flag_idx>]) <value>
		<flag_idx> = (<flag_idx> + 1)
		repeat <array_size>
	endif
endscript

script zone_unlock_menu_create 
	zone_unlock_menu_destroy
	make_cas_menu {
		menu_id = debug_menu
		vmenu_id = debug_vmenu
		title = "ZONE UNLOCK MENU"
		scrolling
		pad_back_script = generic_menu_pad_back
		pad_back_params = {callback = create_debug_options_menu}
		not_centered
		pausemenu
		width = 430
	}
	killskatercamanim all
	Destroy_MenuFx
	if ($all_levels_unlocked = 1)
		<unlocked> = "on"
	else
		<unlocked> = "off"
	endif
	add_cas_menu_item text = ("All Levels Unlocked: " + <unlocked>) pad_choose_script = cheats_menu_change_level_lock
	foreachin $unlockable_game_areas do = zone_unlock_menu_add_item pass_index
	cas_menu_finish
endscript

script zone_unlock_menu_add_item 
	get_game_area_locked_state game_area = <foreachin_name>
	formattext textname = text "%a - %b" a = <title> b = <locked_state> dontassertforchecksums
	add_cas_menu_item {
		text = <text>
		pad_choose_script = toggle_game_area_locked_state
		pad_choose_params = {game_area = <foreachin_name>}
	}
endscript

script zone_unlock_menu_destroy 
	if screenelementexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
	generic_ui_destroy
endscript
ui_game_area_unlocked_active = 0

script ui_game_area_unlocked pause = true
	if istrue $game_progress_debug_active
		return
	endif
	get_unlockable_game_area game_area = <game_area>
	if NOT gotparam unlocked_area
		return
	endif
	if NOT structurecontains structure = unlocked_area bink
		return
	endif
	begin
	if IsScreenClear
		break
	endif
	wait 2 gameframes
	repeat
	root_window :settags menu_state = on
	change ui_game_area_unlocked_active = 1
	if checksumequals a = <pause> b = true
		goal_presentation_pause
	endif
	fadetoblack on alpha = 1 time = 0.23 z_priority = -200
	wait 0.25 seconds ignoreslomo
	igc_temporarily_disable_rendering 2 gameframes
	killallmovies blocking
	soundevent event = sk9_new_zone_beep
	playmovie {
		movie = (<unlocked_area>.bink)
		textureslot = 0
		texturepri = -100
		start_frame = 0
		loop_start = 95
		loop_end = 125
	}
	spawnscriptnow goal_generic_video_pad_handler
	create_helper_text {
		helper_text_elements = [
			{text = "\\m0 continue"}
		]
	}
	begin
	if NOT ismovieplaying textureslot = 0
		stopsoundevent sk9_new_zone_beep
		break
	endif
	wait 1 gameframe
	repeat
	if screenelementexists id = helper_text_anchor
		destroyscreenelement id = helper_text_anchor
	endif
	if screenelementexists id = goal_generic_video_wait_anchor
		destroyscreenelement id = goal_generic_video_wait_anchor
	endif
	fadetoblack off time = 0.25 no_wait
	change ui_game_area_unlocked_active = 0
	root_window :settags menu_state = off
	if checksumequals a = <pause> b = true
		goal_presentation_unpause
	endif
endscript
