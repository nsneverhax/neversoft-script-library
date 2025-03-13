
script setup_sprites 
	screenelementsysteminit
	setup_main_button_event_mappings
	createscreenelement \{type = containerelement
		parent = root_window
		id = hud_window
		pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	setup_pause
endscript
hide_hud_elements = 0
hud_screen_elements = [
	{
		id = star_power_ready_text
		text = qs(0x8ba36464)
		pos = (640.0, 230.0)
		alpha = 0
		just = [
			center
			top
		]
		yoff = 0
		shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
	}
	{
		id = double_notes_text
		text = qs(0xc9e18c30)
		pos = (640.0, 300.0)
		scale = 0.7
		just = [
			center
			top
		]
		yoff = 0
	}
	{
		id = mine_attack_text
		text = qs(0x7845a306)
		pos = (640.0, 300.0)
		scale = 0.7
		just = [
			center
			top
		]
		yoff = 0
	}
	{
		id = difficulty_up_text
		text = qs(0x036cf8e4)
		pos = (640.0, 300.0)
		scale = 0.7
		just = [
			center
			top
		]
		yoff = 0
	}
	{
		id = lefty_notes_text
		text = qs(0x12a7e0d7)
		pos = (640.0, 300.0)
		scale = 0.7
		just = [
			center
			top
		]
		yoff = 0
	}
	{
		id = broken_string_text
		text = qs(0xa8804886)
		pos = (640.0, 300.0)
		scale = 0.7
		just = [
			center
			top
		]
		yoff = 0
	}
	{
		id = whammy_attack_text
		text = qs(0x19d5c1c6)
		pos = (640.0, 300.0)
		scale = 0.7
		just = [
			center
			top
		]
		yoff = 0
	}
	{
		id = lightning_text
		text = qs(0x5943e745)
		pos = (640.0, 300.0)
		scale = 0.7
		just = [
			center
			top
		]
		yoff = 0
	}
	{
		id = steal_text
		text = qs(0xd00a7383)
		pos = (640.0, 300.0)
		scale = 0.7
		just = [
			center
			top
		]
		yoff = 0
	}
	{
		id = steal1_text
		text = qs(0x6d9d4fac)
		pos = (640.0, 300.0)
		scale = 0.7
		just = [
			center
			top
		]
		yoff = 0
	}
	{
		id = steal2_text
		text = qs(0x300eea49)
		pos = (640.0, 300.0)
		scale = 0.7
		just = [
			center
			top
		]
		yoff = 0
	}
	{
		id = special_event_timer
		text = qs(0x03ac90f0)
		pos = (640.0, 280.0)
		scale = 1
		just = [
			center
			top
		]
	}
	{
		id = special_event_question_mark
		text = qs(0xe6f8c73c)
		pos = (640.0, 250.0)
		scale = 10
		just = [
			center
			top
		]
	}
	{
		id = special_event_recording_text
		text = qs(0x06dd362d)
		pos = (640.0, 220.0)
		scale = 1.5
		rgba = [
			220
			20
			20
			255
		]
		just = [
			center
			top
		]
	}
	{
		id = special_event_missed_note_text
		text = qs(0x03ac90f0)
		pos = (640.0, 180.0)
		scale = 1.2
		rgba = [
			220
			20
			20
			255
		]
		just = [
			center
			top
		]
	}
]

script setup_hud 
	printf \{qs(0xdb07cbad)}
	extendcrc hud_destroygroup_window <player_text> out = hud_destroygroup
	createscreenelement {
		type = containerelement
		parent = hud_window
		id = <hud_destroygroup>
		pos = (0.0, 0.0)
		just = [left top]
	}
	getarraysize \{$hud_screen_elements}
	array_entry = 0
	gamemode_getnumplayersshown
	begin
	id = ($hud_screen_elements [<array_entry>].id)
	extendcrc <id> <player_text> out = id
	pos = ($hud_screen_elements [<array_entry>].pos)
	yoff = ($hud_screen_elements [<array_entry>].yoff)
	if (<num_players_shown> = 2)
		px = (<pos>.(1.0, 0.0))
		py = (<pos>.(0.0, 1.0))
		px = (<px> * 0.4 + (<player> - 1) * 640)
		py = (<py> - <yoff>)
		pos = (<px> * (1.0, 0.0) + <py> * (0.0, 1.0))
	elseif (<num_players_shown> = 3)
		px = (<pos>.(1.0, 0.0))
		py = (<pos>.(0.0, 1.0))
		px = (<px> * 0.4 + (<player> - 1) * 640)
		py = (<py> - <yoff>)
		pos = (<px> * (1.0, 0.0) + <py> * (0.0, 1.0))
	elseif (<num_players_shown> = 4)
		px = (<pos>.(1.0, 0.0))
		py = (<pos>.(0.0, 1.0))
		px = (<px> * 0.4 + (<player> - 1) * 640)
		py = (<py> - <yoff>)
		pos = (<px> * (1.0, 0.0) + <py> * (0.0, 1.0))
	endif
	createscreenelement {
		type = textelement
		parent = <hud_destroygroup>
		font = fontgrid_title_a1
		just = [left top]
		scale = 1.0
		rgba = [210 210 210 250]
		z_priority = 80.0
		($hud_screen_elements [<array_entry>])
		pos = <pos>
		id = <id>
	}
	array_entry = (<array_entry> + 1)
	repeat <array_size>
	if (($<player_status>.is_local_client) && ($<player_status>.highway_layout = solo_highway))
		net_setup_solo_hud player_status = <player_status> hud_destroygroup = <hud_destroygroup> player = <player>
	else
		update_hud_layout
		extendcrc hud_2d_container <player_text> out = new_2d_container
		if NOT screenelementexists id = <new_2d_container>
			createscreenelement {
				type = containerelement
				parent = root_window
				pos = (0.0, 0.0)
				just = [left top]
				id = <new_2d_container>
				scale = (($g_hud_2d_struct_used).scale)
			}
		endif
		create_2d_hud_elements parent = <new_2d_container> player_text = <player_text> elements_structure = $g_hud_2d_struct_used
		if ($hide_hud_elements = 1)
			setscreenelementprops id = <new_2d_container> hide
		endif
	endif
	if ($display_debug_input = 1)
		extendcrc input_text <player_text> out = input_id
		createscreenelement {
			type = textelement
			parent = <hud_destroygroup>
			font = debug
			just = [left top]
			scale = 1.0
			rgba = [210 210 210 250]
			z_priority = 100.0
			text = qs(0x8c30363c)
			pos = (64.0, 64.0)
			id = <input_id>
		}
	endif
	reset_hud_text player_text = <player_text>
	if ($force_fail_vignette_on = 1)
		band_failing_vingette_on
	endif
endscript

script setup_band_hud \{force_layout = 0}
	if (<force_layout> = 0)
		update_hud_layout
	endif
	if structurecontains \{structure = $g_hud_2d_struct_used
			desc_interface}
		createscreenelement {
			parent = root_window
			id = hud_root
			type = descinterface
			desc = ($g_hud_2d_struct_used.desc_interface)
			pos = (0.0, 0.0)
			z_priority = 0
			alpha = 0
		}
		if NOT resolvescreenelementid \{id = {
					hud_root
					child = 0
				}
				param = hud_container}
			requireparams \{[
					hud_container
				]
				all}
			return
		endif
		gamemode_gettype
		if NOT (<type> = faceoff || <type> = pro_faceoff)
			if hud_root :desc_resolvealias \{name = alias_faceoff_meter
					param = faceoff_meter}
				<faceoff_meter> :die
			endif
		else
			if hud_root :desc_resolvealias \{name = alias_band_meter
					param = band_meter}
				<band_meter> :die
			endif
		endif
		if (<type> = training)
			if hud_root :desc_resolvealias \{name = alias_band_meter
					param = band_meter}
				<band_meter> :die
			endif
		endif
		if ($boss_battle = 1)
			if hud_root :desc_resolvealias \{name = alias_faceoff_meter
					param = faceoff_meter}
				<faceoff_meter> :die
			endif
			if hud_root :desc_resolvealias \{name = alias_band_meter
					param = band_meter}
				<band_meter> :die
			endif
		else
			if hud_root :desc_resolvealias \{name = alias_boss_meter
					param = boss_meter}
				<boss_meter> :die
			endif
		endif
		if (<type> = faceoff || <type> = pro_faceoff || $boss_battle = 1)
			if hud_root :desc_resolvealias \{name = alias_g1_side_meter
					param = g1_side_meter}
				<g1_side_meter> :die
			endif
			if hud_root :desc_resolvealias \{name = alias_g2_side_meter
					param = g2_side_meter}
				<g2_side_meter> :die
			endif
		endif
		gamemode_getnumplayersshown
		<player_idx> = 1
		begin
		getplayerinfo <player_idx> hud_parent
		if screenelementexists \{id = hud_root}
			if hud_root :desc_resolvealias name = <hud_parent> param = parent_id
				if screenelementexists id = {<parent_id> child = player_meter}
					hud_attach_widget_player_multiplier parent_id = {<parent_id> child = player_meter} player = <player_idx>
					resolvescreenelementid id = [
						{id = <parent_id>}
						{local_id = player_meter}
					]
					if <resolved_id> :desc_resolvealias name = alias_player_multiplier param = player_multiplier
						if NOT (gamemode_isbandbattle)
							if (<type> = faceoff || <type> = pro_faceoff || $boss_battle = 1)
								<player_multiplier> :die
							endif
						endif
					endif
				else
				endif
				if screenelementexists id = {<parent_id> child = star_power}
					hud_attach_widget_player_star_power parent_id = {<parent_id> child = star_power} player = <player_idx>
				elseif screenelementexists id = {<parent_id> child = vocal_multiplier_star}
					hud_attach_widget_player_star_power parent_id = {<parent_id> child = vocal_multiplier_star} player = <player_idx>
				endif
				if screenelementexists id = {<parent_id> child = band_side_meter}
					hud_attach_widget_player_health parent_id = {<parent_id> child = band_side_meter} player = <player_idx>
				elseif screenelementexists id = {<parent_id> child = band_top_meter}
					hud_attach_widget_player_health vocals = 1 parent_id = {<parent_id> child = band_top_meter} player = <player_idx>
				endif
				if screenelementexists id = {<parent_id> child = gamertag}
					if ($is_network_game = 1)
						resolvescreenelementid id = [
							{id = <parent_id>}
							{local_id = gamertag}
						]
						getplayerinfo \{1
							team}
						yellow_team = <team>
						getplayerinfo <player_idx> team
						gamertag_color = $player_slot_team1
						if (<team> != <yellow_team>)
							<gamertag_color> = $player_slot_team2
						endif
						getplayerinfo <player_idx> gamertag
						<resolved_id> :se_setprops {
							gamertag_name_text = ($<gamertag>)
							gamertag_bg_rgba = <gamertag_color>
						}
						if isxenon
							getplayerinfo <player_idx> is_local_client
							getplayerinfo <player_idx> net_id_first
							getplayerinfo <player_idx> net_id_second
							getplayerinfo <player_idx> controller
							getplayerinfo <player_idx> bot_play
							xuid = [0 0]
							setarrayelement arrayname = xuid index = 0 newvalue = (<net_id_first>)
							setarrayelement arrayname = xuid index = 1 newvalue = (<net_id_second>)
							if (<is_local_client> = 0)
								<resolved_id> :obj_spawnscriptlater update_headset_status params = {obj_id = <resolved_id> uid = <xuid>}
							elseif (<bot_play> = 0)
								if NOT netsessionfunc func = xenonisguest params = {controller_index = (<controller>)}
									<resolved_id> :obj_spawnscriptlater update_headset_status params = {obj_id = <resolved_id> uid = <xuid>}
								endif
							endif
						else
							<resolved_id> :se_setprops headset_icon_alpha = 0
						endif
						setscreenelementprops id = {<parent_id> child = gamertag} alpha = 1.0
					else
						destroyscreenelement id = {<parent_id> child = gamertag}
					endif
				endif
			else
				softassert 'HUD %d is missing %p' p = <hud_parent> d = ($g_hud_2d_struct_used.desc_interface)
			endif
		endif
		<player_idx> = (<player_idx> + 1)
		repeat <num_players_shown>
		if hud_root :desc_resolvealias \{name = alias_band_meter
				param = band_meter}
			hud_attach_widget_band_meter parent = <band_meter>
		endif
		if (<type> = faceoff || <type> = pro_faceoff)
			if hud_root :desc_resolvealias \{name = alias_faceoff_meter
					param = faceoff_meter}
				hud_attach_widget_band_faceoff_meter parent_id = <faceoff_meter>
			endif
		endif
		if ($boss_battle = 1)
			if hud_root :desc_resolvealias \{name = alias_boss_meter
					param = boss_meter}
				hud_attach_widget_band_faceoff_meter parent_id = <boss_meter>
			endif
		endif
		hud_hide_optional_vocals \{desc_id = hud_root}
		if ($hide_hud_elements = 1 || $cheat_performancemode = 1)
			hud_root :se_setprops \{hide}
		endif
	else
		if ($is_network_game = 1 && $game_mode = p2_battle)
			gamemode_getnumplayersshown
			<player_idx> = 1
			begin
			formattext checksumname = parent_id 'HUD2D_rock_containerp%d' d = <player_idx>
			if screenelementexists id = <parent_id>
				formattext checksumname = id 'GamerTag_%d' d = <player_idx>
				if (<player_idx> = 1)
					pos = (65.0, 315.0)
				else
					pos = (-215.0, 315.0)
				endif
				createscreenelement {
					parent = <parent_id>
					id = <id>
					type = descinterface
					desc = 'hud_gamertag'
					dims = (280.0, 80.0)
					scale = (1.4, 1.4)
					pos = <pos>
				}
				getplayerinfo <player_idx> team
				gamertag_color = $player_slot_team1
				if (<team> = 1)
					<gamertag_color> = $player_slot_team2
				endif
				formattext checksumname = gamertag 'gamertag_%d' d = (<player_idx> - 1)
				<id> :se_setprops {
					gamertag_name_text = ($<gamertag>)
					gamertag_bg_rgba = <gamertag_color>
				}
				if isxenon
					getplayerinfo <player_idx> is_local_client
					getplayerinfo <player_idx> net_id_first
					getplayerinfo <player_idx> net_id_second
					getplayerinfo <player_idx> controller
					getplayerinfo <player_idx> bot_play
					xuid = [0 0]
					setarrayelement arrayname = xuid index = 0 newvalue = (<net_id_first>)
					setarrayelement arrayname = xuid index = 1 newvalue = (<net_id_second>)
					if (<is_local_client> = 0)
						<id> :obj_spawnscriptlater update_headset_status params = {obj_id = <id> uid = <xuid>}
					elseif (<bot_play> = 0)
						if NOT netsessionfunc func = xenonisguest params = {controller_index = (<controller>)}
							<id> :obj_spawnscriptlater update_headset_status params = {obj_id = <id> uid = <xuid>}
						endif
					endif
				else
					<id> :se_setprops headset_icon_alpha = 0
				endif
			endif
			<player_idx> = (<player_idx> + 1)
			repeat <num_players_shown>
		endif
	endif
	vocals_get_num_vocalists_onscreen
	if (<num_vocalists_shown> <= 0)
		change \{sysnotify_ingame_position = topright}
	elseif (<num_vocalists_shown> = 1)
		gamemode_getnumplayersshown
		if (<num_players_shown> = 1)
			change \{sysnotify_ingame_position = topright}
		else
			change \{sysnotify_ingame_position = centerright}
		endif
	else
		change \{sysnotify_ingame_position = centerright}
	endif
	setsystemnotificationposition pos = ($sysnotify_ingame_position)
endscript
g_debug_hud_layout = 0

script debug_create_next_hud_layout 
	change g_debug_hud_layout = ($g_debug_hud_layout + 1)
	getarraysize \{$debug_hud_layouts_list}
	if ($g_debug_hud_layout >= <array_size>)
		change \{g_debug_hud_layout = 0}
	endif
	<layout_info> = ($debug_hud_layouts_list [$g_debug_hud_layout])
	change game_mode = (<layout_info>.gamemode)
	gamemode_getnumplayersshown
	<p> = 1
	begin
	setplayerinfo <p> part = (<layout_info>.parts [<p> -1])
	setplayerinfo <p> hud_parent = (<layout_info>.aliases [<p> -1])
	<p> = (<p> + 1)
	repeat <num_players_shown>
	formattext checksumname = layout_checksum '%s' s = (<layout_info>.layout)
	change g_hud_2d_struct_used = $<layout_checksum>
	formattext textname = layout_text qs(0x261cb979) s = (<layout_info>.layout)
	create_panel_message z_priority = 10000 id = debug_hud_layout_text text = <layout_text> pos = (640.0, 360.0) rgba = [255 255 0 255]
	debug_refresh_hud
	begin
	pausegame
	wait \{1
		gameframes}
	repeat
endscript

script debug_refresh_hud 
	destroy_band_hud
	setup_band_hud \{force_layout = 1}
	hud_root :se_setprops \{alpha = 1}
endscript

script count_players_by_part 
	requireparams \{[
			part
		]
		all}
	<player> = 1
	<players_by_part> = 0
	gamemode_getnumplayersshown
	begin
	if playerinfoequals <player> part = <part>
		<players_by_part> = (<players_by_part> + 1)
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
	return players_by_part = <players_by_part>
endscript

script get_player_by_part 
	requireparams \{[
			part
		]
		all}
	<player> = 1
	begin
	if playerinfoequals <player> part = <part>
		return player_part = <player>
	endif
	<player> = (<player> + 1)
	repeat $current_num_players
	return \{player_part = -1}
endscript

script update_hud_layout 
	<desired_layout> = null
	if ($game_mode = p2_battle)
		<desired_layout> = battle_hud_2d_elements
	else
		count_players_by_part \{part = guitar}
		<num_guitar> = <players_by_part>
		count_players_by_part \{part = drum}
		<num_drum> = <players_by_part>
		count_players_by_part \{part = vocals}
		<num_vocals> = <players_by_part>
		count_players_by_part \{part = bass}
		<num_bass> = <players_by_part>
		<num_guitar> = (<num_guitar> + <num_bass>)
		gamemode_getnumplayersshown
		switch <num_players_shown>
			case 4
			<desired_layout> = hud_3g1v
			case 3
			if (<num_vocals> = 1 && <num_guitar> = 1 && <num_drum> = 1)
				<desired_layout> = hud_2g1v
			elseif (<num_vocals> = 1 && <num_guitar> = 2)
				<desired_layout> = hud_2g1v
			elseif (<num_guitar> = 2 && <num_drum> = 1)
				<desired_layout> = hud_3g1v
			endif
			case 2
			if (<num_guitar> = 2)
				<desired_layout> = hud_2g
			elseif (<num_drum> = 2)
				<desired_layout> = hud_2g
			elseif (<num_guitar> = 1 && <num_drum> = 1)
				<desired_layout> = hud_2g
			elseif (<num_vocals> = 1 && <num_guitar> = 1)
				<desired_layout> = hud_1g1v
			elseif (<num_vocals> = 1 && <num_drum> = 1)
				<desired_layout> = hud_1g1v
			elseif (<num_vocals> = 2)
				<desired_layout> = hud_2v
			endif
			case 1
			if (<num_guitar> = 1)
				<desired_layout> = hud_1g
			elseif (<num_drum> = 1)
				<desired_layout> = hud_1g
			elseif (<num_vocals> = 1)
				<desired_layout> = hud_1v
			endif
		endswitch
	endif
	printf 'HUD layout: %s' s = <desired_layout> donotresolve
	if globalexists name = <desired_layout>
		change g_hud_2d_struct_used = $<desired_layout>
	else
		printstruct <...>
		softassert 'Unknown hud layout %s' s = <desired_layout>
		change \{g_hud_2d_struct_used = $hud_3g1v}
	endif
endscript

script destroy_hud 
	requireparams \{[
			player_text
			player
		]
		all}
	extendcrc hud_destroygroup_window <player_text> out = hud_destroygroup
	if screenelementexists id = <hud_destroygroup>
		destroyscreenelement id = <hud_destroygroup>
	endif
	formattext checksumname = new_2d_container 'HUD_2D_Container%p' p = <player_text>
	if screenelementexists id = <new_2d_container>
		destroyscreenelement id = <new_2d_container>
	endif
	formattext checksumname = player_container 'HUD_Note_Streak_Combo%d' d = <player>
	destroy_menu menu_id = <player_container>
endscript

script destroy_band_hud 
	detachhudwidget \{all}
	if screenelementexists \{id = hud_root}
		destroyscreenelement \{id = hud_root}
	endif
	change sysnotify_ingame_position = ($sysnotify_menus_position)
	setsystemnotificationposition pos = ($sysnotify_ingame_position)
endscript

script show_hud 
	if screenelementexists \{id = hud_destroygroup_windowp1}
		legacydoscreenelementmorph \{id = hud_destroygroup_windowp1
			alpha = 1}
	endif
	if screenelementexists \{id = hud_root}
		setscreenelementprops \{id = hud_root
			alpha = 1}
	endif
endscript

script hide_hud 
	if NOT cd
		if ($alternate_viewer_hud_behavior = 1)
			return
		endif
	endif
	if screenelementexists \{id = hud_destroygroup_windowp1}
		legacydoscreenelementmorph \{id = hud_destroygroup_windowp1
			alpha = 0}
	endif
	if screenelementexists \{id = hud_root}
		setscreenelementprops \{id = hud_root
			alpha = 0}
	endif
endscript

script reset_hud_text 
	requireparams \{[
			player_text
		]
		all}
	getarraysize \{$hud_screen_elements}
	<i> = 0
	begin
	name = ($hud_screen_elements [<i>].id)
	extendcrc <name> <player_text> out = name
	setscreenelementprops id = <name> alpha = 0
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script reset_hud 
	reset_hud_text player_text = <player_text>
	if ($game_mode = p2_battle)
		destroy_battle_alert_frames
		create_battle_alert_frames
	endif
endscript

script move_hud_to_default \{time = 0.01}
	spawnscriptnow move_2d_elements_to_default params = {morph_time = <time>}
endscript

script move_2d_elements_to_default 
	move_time = (<morph_time> * 1000.0)
	getsongtimems
	initial_time = (<time> * 1.0)
	begin
	getsongtimems
	delta = ((<time> - <initial_time>) / (<move_time>))
	if (<delta> > 1.0)
		delta = 1.0
	endif
	morph_2d_hud_elements <...>
	if (<delta> = 1.0)
		break
	endif
	wait \{1
		gameframe}
	repeat
	if screenelementexists \{id = hud_root}
		hud_root :se_setprops \{alpha = 1
			time = 0.25}
	endif
	off_set_drop = (0.0, 0.0)
	off_set = (50.0, 0.0)
	if ($game_mode = p2_faceoff)
		off_set_drop = (0.0, 50.0)
	endif
	rot = -5
	time_to_move = 0.1
	morph_2d_hud_elements <...>
	wait \{0.1
		seconds}
	<off_set> = (-25.0, 0.0)
	if ($game_mode = p2_faceoff)
		<off_set_drop> = (0.0, -25.0)
	endif
	<rot> = 5
	<time_to_move> = 0.125
	morph_2d_hud_elements <...>
	wait \{0.125
		seconds}
	<rot> = 0
	<off_set_drop> = (0.0, 0.0)
	<off_set> = (0.0, 0.0)
	<time_to_move> = 0.1
	morph_2d_hud_elements <...>
	if ($is_network_game = 1)
		if ($game_mode = p2_battle)
			if screenelementexists \{id = gamertag_1}
				gamertag_1 :obj_spawnscript \{net_battle_fade_gamertag
					params = {
						alpha = 0.0
					}}
			endif
			if screenelementexists \{id = gamertag_2}
				gamertag_2 :obj_spawnscript \{net_battle_fade_gamertag
					params = {
						alpha = 0.5
					}}
			endif
		else
			if structurecontains \{structure = $g_hud_2d_struct_used
					desc_interface}
				gamemode_getnumplayersshown
				player = 1
				begin
				getplayerinfo <player> hud_parent
				if screenelementexists \{id = hud_root}
					if hud_root :desc_resolvealias name = <hud_parent> param = parent_id
						if screenelementexists id = {<parent_id> child = gamertag}
							resolvescreenelementid param = obj_id id = [
								{id = <parent_id>}
								{local_id = gamertag}
							]
							resolvescreenelementid param = container_id id = [
								{id = <parent_id>}
								{local_id = gamertag}
								{local_id = gamertag}
							]
							getplayerinfo <player> is_local_client
							if (<is_local_client> = 1)
								<obj_id> :obj_spawnscript fadeout_local_gamertags params = {obj_id = <obj_id> gamertag_id = <container_id> alpha = 0}
							else
								<obj_id> :obj_spawnscript fadeout_local_gamertags params = {obj_id = <obj_id> gamertag_id = <container_id> alpha = 0.5}
							endif
						endif
					endif
				endif
				<player> = (<player> + 1)
				repeat <num_players_shown>
			endif
		endif
	endif
endscript

script net_battle_fade_gamertag \{alpha = 0.0}
	obj_getid
	<objid> :se_setprops gamertag_alpha = <alpha> time = 1.5
	se_waitprops
endscript

script fadeout_local_gamertags 
	<gamertag_id> :se_setprops alpha = <alpha> time = 1.5
	wait \{1.0
		seconds}
	if (<alpha> = 0)
		if screenelementexists id = <obj_id>
			<obj_id> :die
		endif
	endif
endscript

script morph_2d_hud_elements \{off_set = (0.0, 0.0)
		off_set_drop = (0.0, 0.0)
		time_to_move = 0
		rot = 0
		hud_version = gh3}
	<hud_version> = ($g_hud_2d_struct_used.hud_version)
	if (<hud_version> = gh3)
		if ($current_num_players > 1)
			if ($game_mode = p2_career || $game_mode = p2_coop || $game_mode = p2_quickplay || $game_mode = p3_quickplay || $game_mode = p4_quickplay)
				intro_rock_pos = offscreen_rock_pos
				intro_score_pos = offscreen_score_pos
				new_rock_pos = rock_pos
				new_score_pos = score_pos
			else
				if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || ($boss_battle = 1))
					new_rock_pos = rock_pos
					intro_rock_pos = offscreen_rock_pos
				else
					new_rock_pos = rock_pos_p1
					intro_rock_pos = offscreen_rock_pos_p1
				endif
				new_score_pos = score_pos_p1
				intro_score_pos = offscreen_score_pos_p1
			endif
		elseif ($player1_status.highway_layout = solo_highway)
			if ($game_mode = p2_battle)
				new_rock_pos = rock_pos_p1
				intro_rock_pos = offscreen_rock_pos_p1
			else
				new_rock_pos = rock_pos
				new_score_pos = score_pos
				intro_rock_pos = offscreen_rock_pos
				intro_score_pos = offscreen_score_pos
			endif
		else
			new_rock_pos = rock_pos
			new_score_pos = score_pos
			intro_rock_pos = offscreen_rock_pos
			intro_score_pos = offscreen_score_pos
		endif
		final_rock_pos = (($g_hud_2d_struct_used).<new_rock_pos>)
		final_score_pos = (($g_hud_2d_struct_used).<new_score_pos>)
		getdisplaysettings
		if (<widescreen> = false)
			if NOT ($game_mode = p2_battle)
				<final_score_pos> = (<final_score_pos> + (($g_hud_2d_struct_used).offset4by3_score))
			endif
			<final_rock_pos> = (<final_rock_pos> + (($g_hud_2d_struct_used).offset4by3_rock))
		endif
		move_rock_pos = ((1.0 - <delta>) * (($g_hud_2d_struct_used).<intro_rock_pos>) + (<delta> * (<final_rock_pos> - <off_set> - <off_set_drop>)))
		if NOT ($cheat_performancemode = 1)
			if NOT ($end_credits = 1)
				if NOT ($game_mode = training)
					extendcrc \{hud2d_rock_container
						'p1'
						out = new_container}
					if screenelementexists id = <new_container>
						setscreenelementprops id = <new_container> pos = <move_rock_pos> time = <time_to_move> rot_angle = <rot>
					endif
				endif
				extendcrc \{hud2d_score_container
					'p1'
					out = new_container}
				if screenelementexists id = <new_container>
					move_score_pos = ((1.0 - <delta>) * (($g_hud_2d_struct_used).<intro_score_pos>) + (<delta> * (<final_score_pos> + <off_set>)))
					setscreenelementprops id = <new_container> pos = <move_score_pos> time = <time_to_move>
				endif
			endif
			if NOT ($devil_finish = 1)
				extendcrc \{hud2d_rock_container
					'p2'
					out = new_container}
				if screenelementexists id = <new_container>
					move_rock_pos_p2 = ((1.0 - <delta>) * (($g_hud_2d_struct_used).offscreen_rock_pos_p2) + (<delta> * ((($g_hud_2d_struct_used).rock_pos_p2) + <off_set> + <off_set_drop>)))
					setscreenelementprops id = <new_container> pos = <move_rock_pos_p2> time = <time_to_move> rot_angle = <rot>
				endif
				extendcrc \{hud2d_score_container
					'p2'
					out = new_container}
				if screenelementexists id = <new_container>
					move_score_pos_p2 = ((1.0 - <delta>) * (($g_hud_2d_struct_used).offscreen_score_pos_p2) + (<delta> * ((($g_hud_2d_struct_used).score_pos_p2) + <off_set>)))
					setscreenelementprops id = <new_container> pos = <move_score_pos_p2> time = <time_to_move>
				endif
			endif
		endif
	endif
	morph_gamertags <...>
endscript

script split_text_into_array_elements \{text = qs(0x6df5a0fe)
		text_pos = (0.0, 0.0)
		space_between = (0.0, 0.0)
		flags = {
		}}
	stringtochararray string = <text>
	getarraysize <char_array>
	if NOT gotparam \{parent}
		parent = root_window
	endif
	if gotparam \{id}
		createscreenelement {
			type = containerelement
			parent = <parent>
			pos = (0.0, 0.0)
			id = <id>
		}
	else
		createscreenelement {
			type = containerelement
			parent = <parent>
			pos = (0.0, 0.0)
		}
	endif
	parent_container = <id>
	fit_scale = 1.0
	if gotparam \{fit_dims}
		createscreenelement {
			type = textelement
			parent = <parent_container>
			text = <text>
			font = fontgrid_text_a3
			scale = (<flags>.scale)
		}
		getscreenelementdims id = <id>
		stringlength string = <text>
		avg_width = (<width> / <str_len>)
		fit_scale = (<fit_dims>.(1.0, 0.0) / (<str_len> * <avg_width>))
		<space_between> = (<space_between> * <fit_scale>)
		destroy_menu menu_id = <id>
	endif
	if gotparam \{centered}
		half_width = ((<array_size> - 1) * (<space_between>.(1.0, 0.0)) * 0.5)
		<text_pos> = (<text_pos> - <half_width> * (1.0, 0.0))
	endif
	i = 0
	begin
	createscreenelement {
		type = textelement
		parent = <parent_container>
		pos = <text_pos>
		text = (<char_array> [<i>])
		<flags>
		scale = (<flags>.scale * <fit_scale>)
		alpha = (<flags>.alpha)
	}
	createscreenelement {
		type = textelement
		parent = <parent_container>
		text = (<char_array> [<i>])
		<flags>
		z_priority = (<flags>.z_priority - 1)
		rgba = [0 0 0 255]
		just = [center center]
		pos = <text_pos>
		alpha = (<flags>.alpha)
		scale = (<flags>.scale * (1.3, 1.2) * <fit_scale>)
	}
	<text_pos> = (<text_pos> + <space_between>)
	<i> = (<i> + 1)
	repeat <array_size>
	return container_id = <parent_container>
endscript

script jiggle_text_array_elements \{explode = 0}
	saved_id = <id>
	if NOT screenelementexists id = <id>
		return
	endif
	getscreenelementchildren id = <id>
	getarraysize \{children}
	i = 0
	begin
	if screenelementexists id = (<children> [<i>])
		getscreenelementprops id = (<children> [<i>])
		(<children> [<i>]) :settags pos = <pos> scale = <scale>
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	getstarttime
	last_time = <starttime>
	begin
	getstarttime
	if ((<starttime> - <last_time>) >= <wait_time>)
		break
	else
		i = 0
		begin
		if screenelementexists id = (<children> [<i>])
			(<children> [<i>]) :gettags
			getrandomvalue \{a = -10
				b = 10
				name = rand_x}
			getrandomvalue \{a = -10
				b = -10
				name = rand_y}
			getrandomvalue \{a = 0
				b = 3
				name = rand_rot}
			getrandomvalue \{a = 0.7
				b = 1.3
				name = rand_scale}
			rand_pos = (<rand_x> * (1.0, 0.0) + <rand_y> * (0.0, 1.0))
			setscreenelementprops id = (<children> [<i>]) pos = (<pos> + <rand_pos>) rot_angle = <rand_rot> scale = <rand_scale> relative_scale
		endif
		<i> = (<i> + 1)
		repeat <array_size>
		wait \{0.075
			seconds}
		<i> = 0
		begin
		if screenelementexists id = (<children> [<i>])
			(<children> [<i>]) :gettags
			setscreenelementprops id = (<children> [<i>]) pos = <pos> rot_angle = <rand_rot> scale = <scale>
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	wait \{1
		gameframe}
	repeat
	if (<explode> = 1)
		<id> = <saved_id>
		explode_text_array_elements <...>
	endif
endscript

script explode_text_array_elements 
	if NOT screenelementexists id = <id>
		return
	endif
	if NOT getscreenelementchildren id = <id>
		return
	endif
	getarraysize \{children}
	i = 0
	explode_dir = 1
	if (<array_size> < 2)
		return
	endif
	begin
	if screenelementexists id = (<children> [<i>])
		switch (<explode_dir>)
			case 1
			getrandomvalue \{a = -2000
				b = 0
				name = rand_x}
			getrandomvalue \{a = -2000
				b = -200
				name = rand_y}
			case 2
			getrandomvalue \{a = 1280
				b = 3280
				name = rand_x}
			getrandomvalue \{a = -2000
				b = -200
				name = rand_y}
			case 3
			getrandomvalue \{a = 1280
				b = 3280
				name = rand_x}
			getrandomvalue \{a = 920
				b = 2720
				name = rand_y}
			case 4
			getrandomvalue \{a = -2000
				b = 0
				name = rand_x}
			getrandomvalue \{a = 920
				b = 2720
				name = rand_y}
		endswitch
		<explode_dir> = (<explode_dir> + 1)
		if (<explode_dir> > 4)
			<explode_dir> = 1
		endif
		getrandomvalue \{a = 0
			b = 180
			name = rand_rot}
		rand_pos = (<rand_x> * (1.0, 0.0) + <rand_y> * (0.0, 1.0))
		setscreenelementprops id = (<children> [<i>]) pos = <rand_pos> rot_angle = <rand_rot> time = <time> motion = ease_out
	endif
	<i> = (<i> + 1)
	if screenelementexists id = (<children> [<i>])
		setscreenelementprops id = (<children> [<i>]) pos = <rand_pos> rot_angle = <rand_rot> time = <time>
	endif
	<i> = (<i> + 1)
	repeat (<array_size> / 2)
endscript
force_fail_vignette_on = 0

script create_band_failing_vingette 
	if NOT screenelementexists \{id = vingette_of_failure}
		createscreenelement \{id = vingette_of_failure
			parent = root_window
			type = descinterface
			desc = 'band_fail_vignette'
			z_priority = 25
			pos = (0.0, 0.0)
			root_alpha = 0}
		vingette_of_failure :obj_spawnscriptnow \{band_failing_vingette_pulse}
	endif
endscript

script band_failing_vingette_on 
	create_band_failing_vingette
	vingette_of_failure :se_setprops \{root_alpha = 1.0
		time = 0.5}
endscript

script band_failing_vingette_pulse 
	begin
	se_setprops \{outline_rgba = [
			128
			0
			0
			255
		]
		time = 0.5}
	se_waitprops
	se_setprops \{outline_rgba = [
			0
			0
			0
			255
		]
		time = 0.5}
	se_waitprops
	repeat
endscript

script band_failing_vingette_off 
	if ($force_fail_vignette_on = 1)
		return
	endif
	create_band_failing_vingette
	vingette_of_failure :se_setprops \{root_alpha = 0.0
		time = 0.5}
endscript

script destroy_band_failing_vingette 
	destroyscreenelement \{id = vingette_of_failure}
endscript
