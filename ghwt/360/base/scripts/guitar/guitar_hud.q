
script setup_sprites 
	ScreenElementSystemInit
	setup_main_button_event_mappings
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = hud_window
		Pos = (0.0, 0.0)
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
		Pos = (640.0, 230.0)
		alpha = 0
		just = [
			center
			top
		]
		yoff = 0
		Shadow
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
		Pos = (640.0, 300.0)
		Scale = 0.7
		just = [
			center
			top
		]
		yoff = 0
	}
	{
		id = mine_attack_text
		text = qs(0x7845a306)
		Pos = (640.0, 300.0)
		Scale = 0.7
		just = [
			center
			top
		]
		yoff = 0
	}
	{
		id = difficulty_up_text
		text = qs(0x036cf8e4)
		Pos = (640.0, 300.0)
		Scale = 0.7
		just = [
			center
			top
		]
		yoff = 0
	}
	{
		id = lefty_notes_text
		text = qs(0x12a7e0d7)
		Pos = (640.0, 300.0)
		Scale = 0.7
		just = [
			center
			top
		]
		yoff = 0
	}
	{
		id = broken_string_text
		text = qs(0xa8804886)
		Pos = (640.0, 300.0)
		Scale = 0.7
		just = [
			center
			top
		]
		yoff = 0
	}
	{
		id = whammy_attack_text
		text = qs(0x19d5c1c6)
		Pos = (640.0, 300.0)
		Scale = 0.7
		just = [
			center
			top
		]
		yoff = 0
	}
	{
		id = lightning_text
		text = qs(0x5943e745)
		Pos = (640.0, 300.0)
		Scale = 0.7
		just = [
			center
			top
		]
		yoff = 0
	}
	{
		id = steal_text
		text = qs(0xd00a7383)
		Pos = (640.0, 300.0)
		Scale = 0.7
		just = [
			center
			top
		]
		yoff = 0
	}
	{
		id = steal1_text
		text = qs(0x6d9d4fac)
		Pos = (640.0, 300.0)
		Scale = 0.7
		just = [
			center
			top
		]
		yoff = 0
	}
	{
		id = steal2_text
		text = qs(0x300eea49)
		Pos = (640.0, 300.0)
		Scale = 0.7
		just = [
			center
			top
		]
		yoff = 0
	}
	{
		id = special_event_timer
		text = qs(0x03ac90f0)
		Pos = (640.0, 280.0)
		Scale = 1
		just = [
			center
			top
		]
	}
	{
		id = special_event_question_mark
		text = qs(0xe6f8c73c)
		Pos = (640.0, 250.0)
		Scale = 10
		just = [
			center
			top
		]
	}
	{
		id = special_event_recording_text
		text = qs(0x06dd362d)
		Pos = (640.0, 220.0)
		Scale = 1.5
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
		Pos = (640.0, 180.0)
		Scale = 1.2
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
	ExtendCrc hud_destroygroup_window <player_text> out = hud_destroygroup
	CreateScreenElement {
		Type = ContainerElement
		parent = hud_window
		id = <hud_destroygroup>
		Pos = (0.0, 0.0)
		just = [left top]
	}
	GetArraySize \{$hud_screen_elements}
	array_entry = 0
	gamemode_getnumplayersshown
	begin
	id = ($hud_screen_elements [<array_entry>].id)
	ExtendCrc <id> <player_text> out = id
	Pos = ($hud_screen_elements [<array_entry>].Pos)
	yoff = ($hud_screen_elements [<array_entry>].yoff)
	if (<num_players_shown> = 2)
		px = (<Pos>.(1.0, 0.0))
		py = (<Pos>.(0.0, 1.0))
		px = (<px> * 0.4 + (<Player> - 1) * 640)
		py = (<py> - <yoff>)
		Pos = (<px> * (1.0, 0.0) + <py> * (0.0, 1.0))
	elseif (<num_players_shown> = 3)
		px = (<Pos>.(1.0, 0.0))
		py = (<Pos>.(0.0, 1.0))
		px = (<px> * 0.4 + (<Player> - 1) * 640)
		py = (<py> - <yoff>)
		Pos = (<px> * (1.0, 0.0) + <py> * (0.0, 1.0))
	elseif (<num_players_shown> = 4)
		px = (<Pos>.(1.0, 0.0))
		py = (<Pos>.(0.0, 1.0))
		px = (<px> * 0.4 + (<Player> - 1) * 640)
		py = (<py> - <yoff>)
		Pos = (<px> * (1.0, 0.0) + <py> * (0.0, 1.0))
	endif
	CreateScreenElement {
		Type = TextElement
		parent = <hud_destroygroup>
		font = fontgrid_text_a6
		just = [left top]
		Scale = 1.0
		rgba = [210 210 210 250]
		z_priority = 80.0
		($hud_screen_elements [<array_entry>])
		Pos = <Pos>
		id = <id>
	}
	array_entry = (<array_entry> + 1)
	repeat <array_Size>
	if (($<player_status>.is_local_client) && ($<player_status>.highway_layout = solo_highway))
		net_setup_solo_hud player_status = <player_status> hud_destroygroup = <hud_destroygroup> Player = <Player>
	else
		update_hud_layout
		ExtendCrc HUD_2D_Container <player_text> out = new_2d_container
		if NOT ScreenElementExists id = <new_2d_container>
			CreateScreenElement {
				Type = ContainerElement
				parent = root_window
				Pos = (0.0, 0.0)
				just = [left top]
				id = <new_2d_container>
				Scale = (($g_hud_2d_struct_used).Scale)
			}
		endif
		create_2d_hud_elements parent = <new_2d_container> player_text = <player_text> elements_structure = $g_hud_2d_struct_used
		if ($hide_hud_elements = 1)
			SetScreenElementProps id = <new_2d_container> Hide
		endif
	endif
	if ($display_debug_input = 1)
		ExtendCrc input_text <player_text> out = input_id
		CreateScreenElement {
			Type = TextElement
			parent = <hud_destroygroup>
			font = debug
			just = [left top]
			Scale = 1.0
			rgba = [210 210 210 250]
			z_priority = 100.0
			text = qs(0x8c30363c)
			Pos = (64.0, 64.0)
			id = <input_id>
		}
	endif
	reset_hud_text player_text = <player_text>
endscript

script setup_band_hud \{force_layout = 0}
	if (<force_layout> = 0)
		update_hud_layout
	endif
	if StructureContains \{structure = $g_hud_2d_struct_used
			desc_interface}
		CreateScreenElement {
			parent = root_window
			id = hud_root
			Type = descinterface
			desc = ($g_hud_2d_struct_used.desc_interface)
			Pos = (0.0, 0.0)
			z_priority = 0
			alpha = 0
		}
		if NOT ResolveScreenElementID \{id = {
					hud_root
					child = 0
				}
				param = hud_container}
			RequireParams \{[
					hud_container
				]
				all}
			return
		endif
		gamemode_gettype
		if NOT (<Type> = faceoff || <Type> = pro_faceoff)
			if hud_root :desc_resolvealias \{Name = alias_faceoff_meter
					param = faceoff_meter}
				<faceoff_meter> :Die
			endif
		else
			if hud_root :desc_resolvealias \{Name = alias_band_meter
					param = band_meter}
				<band_meter> :Die
			endif
		endif
		if (<Type> = training)
			if hud_root :desc_resolvealias \{Name = alias_band_meter
					param = band_meter}
				<band_meter> :Die
			endif
		endif
		if ($boss_battle = 1)
			if hud_root :desc_resolvealias \{Name = alias_faceoff_meter
					param = faceoff_meter}
				<faceoff_meter> :Die
			endif
			if hud_root :desc_resolvealias \{Name = alias_band_meter
					param = band_meter}
				<band_meter> :Die
			endif
		else
			if hud_root :desc_resolvealias \{Name = alias_boss_meter
					param = boss_meter}
				<boss_meter> :Die
			endif
		endif
		gamemode_getnumplayersshown
		<player_idx> = 1
		begin
		getplayerinfo <player_idx> hud_parent
		if ScreenElementExists \{id = hud_root}
			if hud_root :desc_resolvealias Name = <hud_parent> param = parent_id
				if ScreenElementExists id = {<parent_id> child = player_meter}
					hud_attach_widget_player_multiplier parent_id = {<parent_id> child = player_meter} Player = <player_idx>
					ResolveScreenElementID id = [
						{id = <parent_id>}
						{local_id = player_meter}
					]
					if <resolved_id> :desc_resolvealias Name = alias_player_multiplier param = player_multiplier
						if NOT (gamemode_isbandbattle)
							if (<Type> = faceoff || <Type> = pro_faceoff || $boss_battle = 1)
								<player_multiplier> :Die
							endif
						endif
					endif
				else
				endif
				if ScreenElementExists id = {<parent_id> child = star_Power}
					hud_attach_widget_player_star_power parent_id = {<parent_id> child = star_Power} Player = <player_idx>
				elseif ScreenElementExists id = {<parent_id> child = vocal_multiplier_star}
					hud_attach_widget_player_star_power parent_id = {<parent_id> child = vocal_multiplier_star} Player = <player_idx>
				endif
				if ScreenElementExists id = {<parent_id> child = gamertag}
					if ($is_network_game = 1)
						ResolveScreenElementID id = [
							{id = <parent_id>}
							{local_id = gamertag}
						]
						getplayerinfo \{1
							team}
						yellow_team = <team>
						getplayerinfo <player_idx> team
						gamertag_color = $online_player_slot_bg_team1
						if (<team> != <yellow_team>)
							<gamertag_color> = $online_player_slot_bg_team2
						endif
						getplayerinfo <player_idx> gamertag
						<resolved_id> :se_setprops {
							gamertag_name_text = ($<gamertag>)
							gamertag_bg_rgba = <gamertag_color>
						}
						if isXenon
							getplayerinfo <player_idx> is_local_client
							getplayerinfo <player_idx> net_id_first
							getplayerinfo <player_idx> net_id_second
							getplayerinfo <player_idx> controller
							getplayerinfo <player_idx> bot_play
							xuid = [0 0]
							SetArrayElement ArrayName = xuid index = 0 NewValue = (<net_id_first>)
							SetArrayElement ArrayName = xuid index = 1 NewValue = (<net_id_second>)
							if (<is_local_client> = 0)
								<resolved_id> :Obj_SpawnScriptLater update_headset_status params = {obj_id = <resolved_id> uid = <xuid>}
							elseif (<bot_play> = 0)
								if NOT NetSessionFunc func = xenonisguest params = {controller_index = (<controller>)}
									<resolved_id> :Obj_SpawnScriptLater update_headset_status params = {obj_id = <resolved_id> uid = <xuid>}
								endif
							endif
						endif
						SetScreenElementProps id = {<parent_id> child = gamertag} alpha = 1.0
					else
						DestroyScreenElement id = {<parent_id> child = gamertag}
					endif
				endif
			else
				SoftAssert 'HUD %d is missing %p' p = <hud_parent> d = ($g_hud_2d_struct_used.desc_interface)
			endif
		endif
		<player_idx> = (<player_idx> + 1)
		repeat <num_players_shown>
		if hud_root :desc_resolvealias \{Name = alias_band_meter
				param = band_meter}
			hud_attach_widget_band_meter parent = <band_meter>
		endif
		if (<Type> = faceoff || <Type> = pro_faceoff)
			if hud_root :desc_resolvealias \{Name = alias_faceoff_meter
					param = faceoff_meter}
				hud_attach_widget_band_faceoff_meter parent_id = <faceoff_meter>
			endif
		endif
		if ($boss_battle = 1)
			if hud_root :desc_resolvealias \{Name = alias_boss_meter
					param = boss_meter}
				hud_attach_widget_band_faceoff_meter parent_id = <boss_meter>
			endif
		endif
		hud_hide_optional_vocals \{desc_id = hud_root}
		if ($hide_hud_elements = 1 || $Cheat_PerformanceMode = 1)
			hud_root :se_setprops \{Hide}
		endif
	else
		if ($is_network_game = 1 && $game_mode = p2_battle)
			gamemode_getnumplayersshown
			<player_idx> = 1
			begin
			formatText checksumName = parent_id 'HUD2D_rock_containerp%d' d = <player_idx>
			if ScreenElementExists id = <parent_id>
				formatText checksumName = id 'GamerTag_%d' d = <player_idx>
				if (<player_idx> = 1)
					Pos = (65.0, 315.0)
				else
					Pos = (-215.0, 315.0)
				endif
				CreateScreenElement {
					parent = <parent_id>
					id = <id>
					Type = descinterface
					desc = 'hud_gamertag'
					dims = (280.0, 80.0)
					Scale = (1.4, 1.4)
					Pos = <Pos>
				}
				getplayerinfo <player_idx> team
				gamertag_color = $online_player_slot_bg_team1
				if (<team> = 1)
					<gamertag_color> = $online_player_slot_bg_team2
				endif
				formatText checksumName = gamertag 'gamertag_%d' d = (<player_idx> - 1)
				<id> :se_setprops {
					gamertag_name_text = ($<gamertag>)
					gamertag_bg_rgba = <gamertag_color>
				}
				if isXenon
					getplayerinfo <player_idx> is_local_client
					getplayerinfo <player_idx> net_id_first
					getplayerinfo <player_idx> net_id_second
					getplayerinfo <player_idx> controller
					getplayerinfo <player_idx> bot_play
					xuid = [0 0]
					SetArrayElement ArrayName = xuid index = 0 NewValue = (<net_id_first>)
					SetArrayElement ArrayName = xuid index = 1 NewValue = (<net_id_second>)
					if (<is_local_client> = 0)
						<id> :Obj_SpawnScriptLater update_headset_status params = {obj_id = <id> uid = <xuid>}
					elseif (<bot_play> = 0)
						if NOT NetSessionFunc func = xenonisguest params = {controller_index = (<controller>)}
							<id> :Obj_SpawnScriptLater update_headset_status params = {obj_id = <id> uid = <xuid>}
						endif
					endif
				endif
			endif
			<player_idx> = (<player_idx> + 1)
			repeat <num_players_shown>
		endif
	endif
	vocals_get_num_vocalists_onscreen
	if (<num_vocalists_shown> <= 0)
		Change \{sysnotify_ingame_position = topright}
	elseif (<num_vocalists_shown> = 1)
		gamemode_getnumplayersshown
		if (<num_players_shown> = 1)
			Change \{sysnotify_ingame_position = topright}
		else
			Change \{sysnotify_ingame_position = centerright}
		endif
	else
		Change \{sysnotify_ingame_position = centerright}
	endif
	setsystemnotificationposition Pos = ($sysnotify_ingame_position)
endscript
g_debug_hud_layout = 0

script debug_create_next_hud_layout 
	Change g_debug_hud_layout = ($g_debug_hud_layout + 1)
	GetArraySize \{$debug_hud_layouts_list}
	if ($g_debug_hud_layout >= <array_Size>)
		Change \{g_debug_hud_layout = 0}
	endif
	<layout_info> = ($debug_hud_layouts_list [$g_debug_hud_layout])
	Change game_mode = (<layout_info>.gamemode)
	gamemode_getnumplayersshown
	<p> = 1
	begin
	setplayerinfo <p> part = (<layout_info>.parts [<p> -1])
	setplayerinfo <p> hud_parent = (<layout_info>.aliases [<p> -1])
	<p> = (<p> + 1)
	repeat <num_players_shown>
	formatText checksumName = layout_checksum '%s' s = (<layout_info>.layout)
	Change g_hud_2d_struct_used = $<layout_checksum>
	formatText TextName = layout_text qs(0x261cb979) s = (<layout_info>.layout)
	create_panel_message z_priority = 10000 id = debug_hud_layout_text text = <layout_text> Pos = (640.0, 360.0) rgba = [255 255 0 255]
	debug_refresh_hud
	begin
	PauseGame
	Wait \{1
		gameframes}
	repeat
endscript

script debug_refresh_hud 
	destroy_band_hud
	setup_band_hud \{force_layout = 1}
	hud_root :se_setprops \{alpha = 1}
endscript

script count_players_by_part 
	RequireParams \{[
			part
		]
		all}
	<Player> = 1
	<players_by_part> = 0
	gamemode_getnumplayersshown
	begin
	if playerinfoequals <Player> part = <part>
		<players_by_part> = (<players_by_part> + 1)
	endif
	<Player> = (<Player> + 1)
	repeat <num_players_shown>
	return players_by_part = <players_by_part>
endscript

script get_player_by_part 
	RequireParams \{[
			part
		]
		all}
	<Player> = 1
	begin
	if playerinfoequals <Player> part = <part>
		return player_part = <Player>
	endif
	<Player> = (<Player> + 1)
	repeat $current_num_players
	return \{player_part = -1}
endscript

script update_hud_layout 
	<desired_layout> = NULL
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
	if GlobalExists Name = <desired_layout>
		Change g_hud_2d_struct_used = $<desired_layout>
	else
		printstruct <...>
		SoftAssert 'Unknown hud layout %s' s = <desired_layout>
		Change \{g_hud_2d_struct_used = $hud_3g1v}
	endif
endscript

script destroy_hud 
	RequireParams \{[
			player_text
			Player
		]
		all}
	ExtendCrc hud_destroygroup_window <player_text> out = hud_destroygroup
	if ScreenElementExists id = <hud_destroygroup>
		DestroyScreenElement id = <hud_destroygroup>
	endif
	formatText checksumName = new_2d_container 'HUD_2D_Container%p' p = <player_text>
	if ScreenElementExists id = <new_2d_container>
		DestroyScreenElement id = <new_2d_container>
	endif
	formatText checksumName = player_container 'HUD_Note_Streak_Combo%d' d = <Player>
	destroy_menu menu_id = <player_container>
endscript

script destroy_band_hud 
	detachhudwidget \{all}
	if ScreenElementExists \{id = hud_root}
		DestroyScreenElement \{id = hud_root}
	endif
	Change sysnotify_ingame_position = ($sysnotify_menus_position)
	setsystemnotificationposition Pos = ($sysnotify_ingame_position)
endscript

script show_hud 
	if ScreenElementExists \{id = hud_destroygroup_windowp1}
		legacydoscreenelementmorph \{id = hud_destroygroup_windowp1
			alpha = 1}
	endif
	if ScreenElementExists \{id = hud_root}
		SetScreenElementProps \{id = hud_root
			alpha = 1}
	endif
endscript

script hide_hud 
	if ScreenElementExists \{id = hud_destroygroup_windowp1}
		legacydoscreenelementmorph \{id = hud_destroygroup_windowp1
			alpha = 0}
	endif
	if ScreenElementExists \{id = hud_root}
		SetScreenElementProps \{id = hud_root
			alpha = 0}
	endif
endscript

script reset_hud_text 
	RequireParams \{[
			player_text
		]
		all}
	GetArraySize \{$hud_screen_elements}
	<i> = 0
	begin
	Name = ($hud_screen_elements [<i>].id)
	ExtendCrc <Name> <player_text> out = Name
	SetScreenElementProps id = <Name> alpha = 0
	<i> = (<i> + 1)
	repeat <array_Size>
endscript

script reset_hud 
	reset_hud_text player_text = <player_text>
	if ($game_mode = p2_battle)
		destroy_battle_alert_frames
		create_battle_alert_frames
	endif
endscript

script move_hud_to_default \{time = 0.01}
	SpawnScriptNow move_2d_elements_to_default params = {morph_time = <time>}
endscript

script move_2d_elements_to_default 
	move_time = (<morph_time> * 1000.0)
	GetSongTimeMs
	initial_time = (<time> * 1.0)
	begin
	GetSongTimeMs
	delta = ((<time> - <initial_time>) / (<move_time>))
	if (<delta> > 1.0)
		delta = 1.0
	endif
	morph_2d_hud_elements <...>
	if (<delta> = 1.0)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if ScreenElementExists \{id = hud_root}
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
	Wait \{0.1
		Seconds}
	<off_set> = (-25.0, 0.0)
	if ($game_mode = p2_faceoff)
		<off_set_drop> = (0.0, -25.0)
	endif
	<rot> = 5
	<time_to_move> = 0.125
	morph_2d_hud_elements <...>
	Wait \{0.125
		Seconds}
	<rot> = 0
	<off_set_drop> = (0.0, 0.0)
	<off_set> = (0.0, 0.0)
	<time_to_move> = 0.1
	morph_2d_hud_elements <...>
	if ($is_network_game = 1)
		if StructureContains \{structure = $g_hud_2d_struct_used
				desc_interface}
			gamemode_getnumplayersshown
			Player = 1
			begin
			getplayerinfo <Player> hud_parent
			if ScreenElementExists \{id = hud_root}
				if hud_root :desc_resolvealias Name = <hud_parent> param = parent_id
					if ScreenElementExists id = {<parent_id> child = gamertag}
						ResolveScreenElementID param = obj_id id = [
							{id = <parent_id>}
							{local_id = gamertag}
						]
						ResolveScreenElementID param = container_id id = [
							{id = <parent_id>}
							{local_id = gamertag}
							{local_id = gamertag}
						]
						getplayerinfo <Player> is_local_client
						if (<is_local_client> = 1)
							<obj_id> :obj_spawnscript fadeout_local_gamertags params = {obj_id = <obj_id> gamertag_id = <container_id> alpha = 0}
						else
							<obj_id> :obj_spawnscript fadeout_local_gamertags params = {obj_id = <obj_id> gamertag_id = <container_id> alpha = 0.5}
						endif
					endif
				endif
			endif
			<Player> = (<Player> + 1)
			repeat <num_players_shown>
		endif
	endif
endscript

script fadeout_local_gamertags 
	<gamertag_id> :se_setprops alpha = <alpha> time = 1.5
	Wait \{1.0
		Seconds}
	if (<alpha> = 0)
		if ScreenElementExists id = <obj_id>
			<obj_id> :Die
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
		GetDisplaySettings
		if (<widescreen> = FALSE)
			if NOT ($game_mode = p2_battle)
				<final_score_pos> = (<final_score_pos> + (($g_hud_2d_struct_used).offset4by3_score))
			endif
			<final_rock_pos> = (<final_rock_pos> + (($g_hud_2d_struct_used).offset4by3_rock))
		endif
		move_rock_pos = ((1.0 - <delta>) * (($g_hud_2d_struct_used).<intro_rock_pos>) + (<delta> * (<final_rock_pos> - <off_set> - <off_set_drop>)))
		if NOT ($Cheat_PerformanceMode = 1)
			if NOT ($end_credits = 1)
				if NOT ($game_mode = training)
					ExtendCrc \{HUD2D_rock_container
						'p1'
						out = new_container}
					if ScreenElementExists id = <new_container>
						SetScreenElementProps id = <new_container> Pos = <move_rock_pos> time = <time_to_move> rot_angle = <rot>
					endif
				endif
				ExtendCrc \{HUD2D_score_container
					'p1'
					out = new_container}
				if ScreenElementExists id = <new_container>
					move_score_pos = ((1.0 - <delta>) * (($g_hud_2d_struct_used).<intro_score_pos>) + (<delta> * (<final_score_pos> + <off_set>)))
					SetScreenElementProps id = <new_container> Pos = <move_score_pos> time = <time_to_move>
				endif
			endif
			if NOT ($devil_finish = 1)
				ExtendCrc \{HUD2D_rock_container
					'p2'
					out = new_container}
				if ScreenElementExists id = <new_container>
					move_rock_pos_p2 = ((1.0 - <delta>) * (($g_hud_2d_struct_used).offscreen_rock_pos_p2) + (<delta> * ((($g_hud_2d_struct_used).rock_pos_p2) + <off_set> + <off_set_drop>)))
					SetScreenElementProps id = <new_container> Pos = <move_rock_pos_p2> time = <time_to_move> rot_angle = <rot>
				endif
				ExtendCrc \{HUD2D_score_container
					'p2'
					out = new_container}
				if ScreenElementExists id = <new_container>
					move_score_pos_p2 = ((1.0 - <delta>) * (($g_hud_2d_struct_used).offscreen_score_pos_p2) + (<delta> * ((($g_hud_2d_struct_used).score_pos_p2) + <off_set>)))
					SetScreenElementProps id = <new_container> Pos = <move_score_pos_p2> time = <time_to_move>
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
	StringToCharArray string = <text>
	GetArraySize <char_array>
	if NOT GotParam \{parent}
		parent = root_window
	endif
	if GotParam \{id}
		CreateScreenElement {
			Type = ContainerElement
			parent = <parent>
			Pos = (0.0, 0.0)
			id = <id>
		}
	else
		CreateScreenElement {
			Type = ContainerElement
			parent = <parent>
			Pos = (0.0, 0.0)
		}
	endif
	parent_container = <id>
	fit_scale = 1.0
	if GotParam \{fit_dims}
		CreateScreenElement {
			Type = TextElement
			parent = <parent_container>
			text = <text>
			font = fontgrid_text_a3
			Scale = (<flags>.Scale)
		}
		GetScreenElementDims id = <id>
		StringLength string = <text>
		avg_width = (<width> / <str_len>)
		fit_scale = (<fit_dims>.(1.0, 0.0) / (<str_len> * <avg_width>))
		<space_between> = (<space_between> * <fit_scale>)
		destroy_menu menu_id = <id>
	endif
	if GotParam \{centered}
		half_width = ((<array_Size> - 1) * (<space_between>.(1.0, 0.0)) * 0.5)
		<text_pos> = (<text_pos> - <half_width> * (1.0, 0.0))
	endif
	i = 0
	begin
	CreateScreenElement {
		Type = TextElement
		parent = <parent_container>
		Pos = <text_pos>
		text = (<char_array> [<i>])
		<flags>
		Scale = (<flags>.Scale * <fit_scale>)
		alpha = (<flags>.alpha)
	}
	CreateScreenElement {
		Type = TextElement
		parent = <parent_container>
		text = (<char_array> [<i>])
		<flags>
		z_priority = (<flags>.z_priority - 1)
		rgba = [0 0 0 255]
		just = [center center]
		Pos = <text_pos>
		alpha = (<flags>.alpha)
		Scale = (<flags>.Scale * (1.3, 1.2) * <fit_scale>)
	}
	<text_pos> = (<text_pos> + <space_between>)
	<i> = (<i> + 1)
	repeat <array_Size>
	return container_id = <parent_container>
endscript

script jiggle_text_array_elements \{explode = 0}
	saved_id = <id>
	if NOT ScreenElementExists id = <id>
		return
	endif
	GetScreenElementChildren id = <id>
	GetArraySize \{children}
	i = 0
	begin
	if ScreenElementExists id = (<children> [<i>])
		GetScreenElementProps id = (<children> [<i>])
		(<children> [<i>]) :SetTags Pos = <Pos> Scale = <Scale>
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	GetStartTime
	last_time = <starttime>
	begin
	GetStartTime
	if ((<starttime> - <last_time>) >= <wait_time>)
		break
	else
		i = 0
		begin
		if ScreenElementExists id = (<children> [<i>])
			(<children> [<i>]) :GetTags
			GetRandomValue \{a = -10
				b = 10
				Name = rand_x}
			GetRandomValue \{a = -10
				b = -10
				Name = rand_y}
			GetRandomValue \{a = 0
				b = 3
				Name = rand_rot}
			GetRandomValue \{a = 0.7
				b = 1.3
				Name = rand_scale}
			rand_pos = (<rand_x> * (1.0, 0.0) + <rand_y> * (0.0, 1.0))
			SetScreenElementProps id = (<children> [<i>]) Pos = (<Pos> + <rand_pos>) rot_angle = <rand_rot> Scale = <rand_scale> relative_scale
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
		Wait \{0.075
			Seconds}
		<i> = 0
		begin
		if ScreenElementExists id = (<children> [<i>])
			(<children> [<i>]) :GetTags
			SetScreenElementProps id = (<children> [<i>]) Pos = <Pos> rot_angle = <rand_rot> Scale = <Scale>
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	Wait \{1
		gameframe}
	repeat
	if (<explode> = 1)
		<id> = <saved_id>
		explode_text_array_elements <...>
	endif
endscript

script explode_text_array_elements 
	if NOT ScreenElementExists id = <id>
		return
	endif
	if NOT GetScreenElementChildren id = <id>
		return
	endif
	GetArraySize \{children}
	i = 0
	explode_dir = 1
	if (<array_Size> < 2)
		return
	endif
	begin
	if ScreenElementExists id = (<children> [<i>])
		switch (<explode_dir>)
			case 1
			GetRandomValue \{a = -2000
				b = 0
				Name = rand_x}
			GetRandomValue \{a = -2000
				b = -200
				Name = rand_y}
			case 2
			GetRandomValue \{a = 1280
				b = 3280
				Name = rand_x}
			GetRandomValue \{a = -2000
				b = -200
				Name = rand_y}
			case 3
			GetRandomValue \{a = 1280
				b = 3280
				Name = rand_x}
			GetRandomValue \{a = 920
				b = 2720
				Name = rand_y}
			case 4
			GetRandomValue \{a = -2000
				b = 0
				Name = rand_x}
			GetRandomValue \{a = 920
				b = 2720
				Name = rand_y}
		endswitch
		<explode_dir> = (<explode_dir> + 1)
		if (<explode_dir> > 4)
			<explode_dir> = 1
		endif
		GetRandomValue \{a = 0
			b = 180
			Name = rand_rot}
		rand_pos = (<rand_x> * (1.0, 0.0) + <rand_y> * (0.0, 1.0))
		SetScreenElementProps id = (<children> [<i>]) Pos = <rand_pos> rot_angle = <rand_rot> time = <time> motion = ease_out
	endif
	<i> = (<i> + 1)
	if ScreenElementExists id = (<children> [<i>])
		SetScreenElementProps id = (<children> [<i>]) Pos = <rand_pos> rot_angle = <rand_rot> time = <time>
	endif
	<i> = (<i> + 1)
	repeat (<array_Size> / 2)
endscript
