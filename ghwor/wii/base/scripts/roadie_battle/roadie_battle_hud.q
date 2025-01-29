roadie_battle_intro_start_time_ms = -2000
roadie_battle_intro_display_time_secs = 5.0
roadie_battle_message_display_time_secs = 3.0
roadie_battle_spin_meter_tick_count = 24
roadie_battle_highway_hud_ids = [
	{
	}
	{
	}
	{
	}
	{
	}
]
roadie_battle_visible_highway_hud_objects = [
	None
	None
	None
	None
]
roadie_battle_wipe_active = [
	{
	}
	{
	}
	{
	}
	{
	}
]

script roadie_battle_hud_kill_spawned_scripts 
	KillSpawnedScript \{Name = roadie_battle_intro_hud_script}
endscript

script roadie_battle_create_hud 
	roadie_battle_reposition_core_hud
	get_num_non_vocals_players_onscreen
	getnumplayersingame
	getfirstplayer
	begin
	<player_index> = (<Player> - 1)
	get_highway_hud_root_id Player = <Player>
	get_non_vocalist_player_number Player = <Player>
	get_highway_pos_and_scale num_non_vocals_players = <num_non_vocals_players> non_vocalist_player = <non_vocalist_player> Player = <Player>
	extendcrcplayer roadie_battle_highway_hud <Player> out = hud_id
	setstructureparam array_name = roadie_battle_highway_hud_ids array_index = <player_index> param = root value = <hud_id>
	SetArrayElement {
		globalarray
		ArrayName = roadie_battle_visible_highway_hud_objects
		index = <player_index>
		NewValue = None
	}
	if (<num_non_vocals_players> = 1)
		<Pos> = (0.0, -160.0)
	else
		<Pos> = (0.0, -80.0)
	endif
	CreateScreenElement {
		id = <hud_id>
		Type = ContainerElement
		parent = <highway_hud_root>
		Pos = <Pos>
		Scale = <hw_x_scale>
		z_priority = 6
		pos_anchor = [center center]
		just = [center center]
	}
	roadie_battle_create_mod_huds {
		Player = <Player>
		parent = <hud_id>
		buff_scale = <Scale>
		attack_scale = <Scale>
	}
	if roadie_battle_find_roadie_for_player Player = <Player>
		roadie_battle_hud_create_intro_object {
			Player = <Player>
			roadie = <roadie>
			parent = <hud_id>
		}
		roadie_battle_hud_create_spin_meter {
			Player = <Player>
			roadie = <roadie>
		}
	endif
	if ($roadie_battle_mode = competitive)
		roadie_battle_hud_create_song_meter Player = <Player>
	endif
	getnextplayer Player = <Player>
	repeat <num_players>
endscript

script roadie_battle_create_mod_huds \{Player = !i1768515945
		parent = !q1768515945
		buff_scale = 0x69696969
		attack_scale = 0x69696969}
	extendcrcplayer roadie_battle_buff_hud <Player> out = buff_hud_id
	extendcrcplayer roadie_battle_repair_hud <Player> out = repair_hud_id
	extendcrcplayer roadie_battle_attack_hud <Player> out = attack_hud_id
	get_num_non_vocals_players_onscreen
	switch <num_non_vocals_players>
		case 1
		<hud_pos> = (0.0, 15.0)
		<hud_scale> = 1.0
		case 2
		<hud_pos> = (0.0, -20.0)
		<hud_scale> = 0.9
		case 3
		<hud_pos> = (0.0, 5.0)
		<hud_scale> = 0.8
		case 4
		<hud_pos> = (0.0, 10.0)
		<hud_scale> = 0.7
		default
		<hud_pos> = (0.0, 0.0)
		<hud_scale> = 1.0
	endswitch
	CreateScreenElement {
		id = <buff_hud_id>
		Type = descinterface
		desc = 'roadie_battle_buff_hud'
		parent = <parent>
		Pos = <hud_pos>
		Scale = <hud_scale>
		pos_anchor = [center center]
		just = [center center]
		alpha = 0
		message_internal_scale = <buff_scale>
	}
	CreateScreenElement {
		id = <repair_hud_id>
		Type = descinterface
		desc = 'roadie_battle_buff_hud'
		parent = <parent>
		Pos = <hud_pos>
		Scale = <hud_scale>
		pos_anchor = [center center]
		just = [center center]
		alpha = 0
		message_internal_scale = <buff_scale>
	}
	CreateScreenElement {
		id = <attack_hud_id>
		Type = descinterface
		desc = 'roadie_battle_attack_hud'
		parent = <parent>
		Pos = <hud_pos>
		Scale = <hud_scale>
		pos_anchor = [center center]
		just = [center center]
		alpha = 0
		message_internal_scale = <attack_scale>
	}
	extendcrcplayer roadie_battle_fx_hud <Player> out = fx_hud_id
	<player_index> = (<Player> - 1)
	setstructureparam array_name = roadie_battle_highway_hud_ids array_index = <player_index> param = buff_hud value = <buff_hud_id>
	setstructureparam array_name = roadie_battle_highway_hud_ids array_index = <player_index> param = repair_hud value = <repair_hud_id>
	setstructureparam array_name = roadie_battle_highway_hud_ids array_index = <player_index> param = attack_hud value = <attack_hud_id>
	setstructureparam array_name = roadie_battle_highway_hud_ids array_index = <player_index> param = fx_hud value = <fx_hud_id>
	setstructureparam array_name = roadie_battle_wipe_active array_index = <player_index> param = Attack value = 0
	setstructureparam array_name = roadie_battle_wipe_active array_index = <player_index> param = repair value = 0
	<attack_hud_id> :Obj_SpawnScriptNow roadie_battle_animate_attack_hud params = {Player = <Player>}
endscript

script roadie_battle_hud_buff_message \{Player = !i1768515945
		roadie = !i1768515945
		message = 0x69696969
		equipment_icon = !q1768515945}
	roadie_battle_hide_visible_highway_hud_object Player = <Player>
	<player_index> = (<Player> - 1)
	<hud_id> = ($roadie_battle_highway_hud_ids [<player_index>].buff_hud)
	<hud_id> :Obj_SpawnScriptNow {
		roadie_battle_hud_buff_message_spawned
		params = {
			Player = <Player>
			roadie = <roadie>
			message = <message>
			equipment_icon = <equipment_icon>
		}
	}
endscript

script roadie_battle_hud_buff_message_spawned \{Player = !i1768515945
		roadie = !i1768515945
		message = 0x69696969
		equipment_icon = !q1768515945}
	roadie_battle_get_roadie_info roadie = <roadie> param = avatar
	formatText checksumName = roadie_texture 'roadie_shield_%c' c = (<avatar> + 1)
	se_setprops {
		message_text = <message>
		equipment_icon_texture = <equipment_icon>
		roadie_icon_texture = <roadie_texture>
		roadie_icon_scale = (-1.0, 1.0)
	}
	se_setprops \{roadie_icon_scale = (1.0, 1.0)
		time = 0.4}
	Obj_GetID
	SpawnScriptNow roadie_battle_buff_gfx params = {hud_id = <objID> Player = <Player>}
	roadie_battle_highway_hud_do_fade {
		Player = <Player>
		display_time_secs = $roadie_battle_message_display_time_secs
	}
	roadie_battle_highway_destroy_hud_fx Player = <Player>
endscript

script roadie_battle_hud_attack_message \{Player = !i1768515945
		roadie = -1
		message = 0x69696969
		equipment_icon = !q1768515945}
	roadie_battle_hide_visible_highway_hud_object Player = <Player>
	<player_index> = (<Player> - 1)
	<hud_id> = ($roadie_battle_highway_hud_ids [<player_index>].attack_hud)
	<hud_id> :Obj_SpawnScriptNow {
		roadie_battle_hud_attack_message_spawned
		params = {
			Player = <Player>
			message = <message>
			equipment_icon = <equipment_icon>
		}
	}
endscript

script roadie_battle_hud_attack_message_spawned \{Player = !i1768515945
		message = 0x69696969
		equipment_icon = !q1768515945}
	se_setprops {
		message_text = <message>
		equipment_icon_texture = <equipment_icon>
		imp_icon_texture = attack_intro_imp
	}
	SoundEvent \{event = rb_curse}
	SpawnScriptNow {
		roadie_battle_highway_wipe
		params = {
			Player = <Player>
			edge_color = [255 145 145 200]
			trail_color = [225 25 25 200]
			function = Attack
		}
	}
	roadie_battle_highway_hud_do_fade {
		Player = <Player>
		display_time_secs = $roadie_battle_message_display_time_secs
	}
endscript

script roadie_battle_animate_attack_hud \{Player = !i1768515945}
	<impdragon_id> = ($roadie_battle_highway_hud_ids [(<Player> - 1)].attack_hud)
	<u> = RandomInteger (0.0, 3.0)
	<v> = RandomInteger (0.0, 3.0)
	<start_frame> = ((1.0, 0.0) * <u> + (0.0, 1.0) * <v>)
	CreateScreenElement {
		Type = SpriteElement
		parent = <impdragon_id>
		texture = rb_highway_fire
		Pos = (-60.0, -72.0)
		just = [center , center]
		pos_anchor = [center , center]
		blend = add
		rot_angle = 0
		use_animated_uvs = true
		top_down_v
		frame_length = 0.033
		num_uv_frames = (4.0, 4.0)
		current_frames = <start_frame>
		Scale = 0.5
		z_priority = -5
		loop_animated_uvs = true
		alpha = 0
	}
	<id> :se_setprops alpha = 0.6 time = 0.5
	<u> = RandomInteger (0.0, 3.0)
	<v> = RandomInteger (0.0, 3.0)
	<start_frame> = ((1.0, 0.0) * <u> + (0.0, 1.0) * <v>)
	CreateScreenElement {
		Type = SpriteElement
		parent = <impdragon_id>
		texture = rb_highway_fire
		Pos = (-5.0, -72.0)
		just = [center , center]
		pos_anchor = [center , center]
		blend = add
		rot_angle = 0
		use_animated_uvs = true
		top_down_v
		frame_length = 0.033
		num_uv_frames = (4.0, 4.0)
		current_frames = <start_frame>
		Scale = 0.45000002
		z_priority = -5
		loop_animated_uvs = true
		alpha = 0
	}
	<id> :se_setprops alpha = 0.55 time = 0.5
	<u> = RandomInteger (0.0, 3.0)
	<v> = RandomInteger (0.0, 3.0)
	<start_frame> = ((1.0, 0.0) * <u> + (0.0, 1.0) * <v>)
	CreateScreenElement {
		Type = SpriteElement
		parent = <impdragon_id>
		texture = rb_highway_fire
		Pos = (45.0, -74.0)
		just = [center , center]
		pos_anchor = [center , center]
		blend = add
		rot_angle = 0
		use_animated_uvs = true
		top_down_v
		frame_length = 0.033
		num_uv_frames = (4.0, 4.0)
		current_frames = <start_frame>
		Scale = 0.4
		z_priority = -5
		loop_animated_uvs = true
		alpha = 0
	}
	<id> :se_setprops alpha = 0.5 time = 0.5
	<u> = RandomInteger (0.0, 3.0)
	<v> = RandomInteger (0.0, 3.0)
	<start_frame> = ((1.0, 0.0) * <u> + (0.0, 1.0) * <v>)
	CreateScreenElement {
		Type = SpriteElement
		parent = <impdragon_id>
		texture = rb_highway_fire
		Pos = (80.0, -60.0)
		just = [center , center]
		pos_anchor = [center , center]
		blend = add
		rot_angle = 0
		use_animated_uvs = true
		top_down_v
		frame_length = 0.033
		num_uv_frames = (4.0, 4.0)
		current_frames = <start_frame>
		Scale = 0.35000002
		z_priority = -5
		loop_animated_uvs = true
		alpha = 0
	}
	<id> :se_setprops alpha = 0.45000002 time = 0.5
	<u> = RandomInteger (0.0, 3.0)
	<v> = RandomInteger (0.0, 3.0)
	<start_frame> = ((1.0, 0.0) * <u> + (0.0, 1.0) * <v>)
	CreateScreenElement {
		Type = SpriteElement
		parent = <impdragon_id>
		texture = rb_highway_fire
		Pos = (112.0, -50.0)
		just = [center , center]
		pos_anchor = [center , center]
		blend = add
		rot_angle = 6
		use_animated_uvs = true
		top_down_v
		frame_length = 0.033
		num_uv_frames = (4.0, 4.0)
		current_frames = <start_frame>
		Scale = 0.35000002
		z_priority = -5
		loop_animated_uvs = true
		alpha = 0
	}
	<id> :se_setprops alpha = 0.4 time = 0.5
endscript

script roadie_battle_hud_repair_message \{Player = !i1768515945
		roadie = !i1768515945
		message = 0x69696969
		equipment_icon = !q1768515945}
	roadie_battle_hide_visible_highway_hud_object Player = <Player>
	<player_index> = (<Player> - 1)
	<hud_id> = ($roadie_battle_highway_hud_ids [<player_index>].repair_hud)
	<hud_id> :Obj_SpawnScriptNow {
		roadie_battle_hud_repair_message_spawned
		params = {
			Player = <Player>
			roadie = <roadie>
			message = <message>
			equipment_icon = <equipment_icon>
		}
	}
endscript

script roadie_battle_hud_repair_message_spawned \{Player = !i1768515945
		roadie = !i1768515945
		message = 0x69696969
		equipment_icon = !q1768515945}
	roadie_battle_get_roadie_info roadie = <roadie> param = avatar
	formatText checksumName = roadie_texture 'roadie_shield_%c' c = (<avatar> + 1)
	se_setprops {
		message_text = <message>
		equipment_icon_texture = <equipment_icon>
		roadie_icon_texture = <roadie_texture>
		roadie_icon_scale = (-1.0, 1.0)
	}
	se_setprops \{roadie_icon_scale = (1.0, 1.0)
		time = 0.4}
	Obj_SpawnScriptNow roadie_battle_hud_starburst params = {Player = <Player>}
	SpawnScriptNow {
		roadie_battle_highway_wipe
		params = {
			Player = <Player>
			edge_color = [255 255 255 255]
			trail_color = [255 255 255 128]
			function = repair
		}
	}
	roadie_battle_highway_hud_do_fade {
		Player = <Player>
		display_time_secs = $roadie_battle_message_display_time_secs
	}
	roadie_battle_highway_destroy_hud_fx Player = <Player>
endscript

script roadie_battle_highway_hud_do_fade \{Player = !i1768515945
		display_time_secs = !f1768515945}
	Obj_GetID
	<player_index> = (<Player> - 1)
	SetArrayElement {
		globalarray
		ArrayName = roadie_battle_visible_highway_hud_objects
		index = <player_index>
		NewValue = <objID>
	}
	se_setprops \{alpha = 1
		time = 0.25}
	se_waitprops
	Wait <display_time_secs> Seconds
	se_setprops \{alpha = 0
		time = 0.25}
	se_waitprops
	SetArrayElement {
		globalarray
		ArrayName = roadie_battle_visible_highway_hud_objects
		index = <player_index>
		NewValue = None
	}
endscript

script roadie_battle_buff_gfx \{hud_id = !q1768515945
		Player = !i1768515945}
	SoundEvent \{event = rb_buff}
	roadie_battle_highway_rail_sparkles Player = <Player>
	<hud_id> :Obj_SpawnScriptNow roadie_battle_hud_starburst params = {Player = <Player>}
endscript

script roadie_battle_highway_rail_sparkles \{Player = !i1768515945}
	extendcrcplayer sidebar_container_right <Player> out = sidebar_right_container
	extendcrcplayer sidebar_container_left <Player> out = sidebar_left_container
	getnumplayersingame
	switch (<num_players>)
		case 1
		<x_start> = -10
		<y_start> = -50
		<x_end> = 2
		<y_end> = -480
		<scale_start> = 0.4
		<scale_end> = 0.2
		case 2
		<x_start> = -10
		<y_start> = -50
		<x_end> = -2
		<y_end> = -400
		<scale_start> = 0.35000002
		<scale_end> = 0.15
		case 3
		<x_start> = -10
		<y_start> = -50
		<x_end> = -3
		<y_end> = -370
		<scale_start> = 0.3
		<scale_end> = 0.1
		case 4
		<x_start> = -10
		<y_start> = -50
		<x_end> = -3
		<y_end> = -360
		<scale_start> = 0.25
		<scale_end> = 0.05
	endswitch
	<time> = 0.5
	<frame_time> = 0.01
	setpaircomponents pos_start_left X = <x_start> y = <y_start>
	setpaircomponents pos_end_left X = <x_end> y = <y_end>
	setpaircomponents pos_start_right X = (0 - <x_start>) y = <y_start>
	setpaircomponents pos_end_right X = (0 - <x_end>) y = <y_end>
	setpaircomponents pos_start_left2 X = (<x_start> + 10) y = (<y_start> + 40)
	setpaircomponents pos_end_left2 X = (<x_end> + 10) y = (<y_end> + 40)
	setpaircomponents pos_start_right2 X = (0 - (<x_start> - 10)) y = (<y_start> + 40)
	setpaircomponents pos_end_right2 X = (0 - (<x_end> - 10)) y = (<y_end> + 40)
	CreateScreenElement {
		Type = SpriteElement
		texture = boost_intro_sparklerailanim
		parent = <sidebar_left_container>
		Pos = <pos_start_left>
		blend = add
		z_priority = 10
		Scale = <scale_start>
		use_animated_uvs = true
		top_down_v
		frame_length = <frame_time>
		num_uv_frames = (4.0, 4.0)
		loop_animated_uvs = true
		rot_angle = 10
	}
	<sparkle_left> = <id>
	CreateScreenElement {
		Type = SpriteElement
		texture = boost_intro_sparklerailanim
		parent = <sidebar_left_container>
		Pos = <pos_start_left2>
		blend = add
		z_priority = 10
		Scale = <scale_start>
		use_animated_uvs = true
		top_down_v
		frame_length = <frame_time>
		num_uv_frames = (4.0, 4.0)
		loop_animated_uvs = true
		rot_angle = 10
	}
	<sparkle_left2> = <id>
	CreateScreenElement {
		Type = SpriteElement
		texture = boost_intro_sideglow
		parent = <sidebar_left_container>
		Pos = <pos_start_left>
		blend = add
		z_priority = 12
		Scale = (2.5, 2.0)
	}
	<glow_left> = <id>
	CreateScreenElement {
		Type = SpriteElement
		texture = boost_intro_sparklerailanim
		parent = <sidebar_right_container>
		Pos = <pos_start_right>
		blend = add
		z_priority = 10
		Scale = <scale_start>
		use_animated_uvs = true
		top_down_v
		frame_length = <frame_time>
		num_uv_frames = (4.0, 4.0)
		loop_animated_uvs = true
		rot_angle = -10
	}
	<sparkle_right> = <id>
	CreateScreenElement {
		Type = SpriteElement
		texture = boost_intro_sparklerailanim
		parent = <sidebar_right_container>
		Pos = <pos_start_right2>
		blend = add
		z_priority = 10
		Scale = <scale_start>
		use_animated_uvs = true
		top_down_v
		frame_length = <frame_time>
		num_uv_frames = (4.0, 4.0)
		loop_animated_uvs = true
		rot_angle = -10
	}
	<sparkle_right2> = <id>
	CreateScreenElement {
		Type = SpriteElement
		texture = boost_intro_sideglow
		parent = <sidebar_right_container>
		Pos = <pos_start_right>
		blend = add
		z_priority = 12
		Scale = (2.5, 2.0)
	}
	<glow_right> = <id>
	<pos_table> = ($highway_pos_table [(<Player> - 1)])
	<height> = (<pos_table>.highway_height)
	<pos_c> = ((0.0, 0.7) * <height>)
	extendcrcplayer fretbar_container <Player> out = cont
	CreateScreenElement {
		Type = SpriteElement
		parent = <cont>
		material = mat_sidebar_glow_02
		rgba = [255 255 255 255]
		Pos = <pos_c>
		Scale = (4.0, 2.5)
		blend = add
		just = [center top]
		z_priority = 3.6
		alpha = 0
	}
	<glow_center> = <id>
	<sparkle_left> :se_setprops Pos = <pos_end_left> Scale = <scale_end> time = <time>
	<sparkle_right> :se_setprops Pos = <pos_end_right> Scale = <scale_end> time = <time>
	<sparkle_left2> :se_setprops Pos = <pos_end_left2> Scale = <scale_end> time = <time>
	<sparkle_right2> :se_setprops Pos = <pos_end_right2> Scale = <scale_end> time = <time>
	<glow_left> :se_setprops Pos = <pos_end_left> Scale = (1.0, 0.5) time = <time>
	<glow_right> :se_setprops Pos = <pos_end_right> Scale = (1.0, 0.5) time = <time>
	<glow_center> :se_setprops alpha = 0.4 Scale = (8.0, 2.4)
	<glow_center> :se_setprops Scale = (20.0, 4.0) time = <time>
	<sparkle_left> :se_waitprops
	DestroyScreenElement id = <glow_left>
	DestroyScreenElement id = <glow_right>
	DestroyScreenElement id = <sparkle_left>
	DestroyScreenElement id = <sparkle_right>
	DestroyScreenElement id = <sparkle_left2>
	DestroyScreenElement id = <sparkle_right2>
	<glow_center> :Obj_SpawnScriptNow roadie_battle_highway_rail_sparkles_fade params = {parent = <glow_center>}
endscript

script roadie_battle_highway_rail_sparkles_fade \{parent = !q1768515945}
	<parent> :se_setprops alpha = 0 time = 1.0
	<parent> :se_waitprops
	DestroyScreenElement id = <parent>
endscript

script roadie_battle_hud_starburst \{Player = !i1768515945}
	roadie_battle_highway_destroy_hud_fx Player = <Player>
	desc_resolvealias \{Name = alias_sparkles}
	<container_id> = <resolved_id>
	<player_index> = (<Player> - 1)
	<sparkle_hud_id> = ($roadie_battle_highway_hud_ids [<player_index>].fx_hud)
	CreateScreenElement {
		Type = ContainerElement
		parent = <container_id>
		id = <sparkle_hud_id>
		Pos = (-180.0, 0.0)
		pos_anchor = [center , center]
	}
	<id> :Obj_SpawnScriptNow roadie_battle_hud_starburst_spawned
endscript

script roadie_battle_hud_starburst_spawned 
	<num_groups> = 6
	<num_per_group> = 6
	<x_ratio> = 2.0
	<y_ratio> = 1.0
	Obj_GetID
	begin
	begin
	<rot_start> = RandomFloat (-360.0, 360.0)
	<rot_end> = RandomFloat (-720.0, 720.0)
	<radius_start> = RandomFloat (0.0, 20.0)
	<radius_end> = (<radius_start> + RandomFloat (80.0, 160.0))
	<time> = RandomFloat (0.75, 1.5)
	<Scale> = RandomFloat (1.2, 1.8)
	<angle> = RandomFloat (0.0, 360.0)
	cos <angle>
	sin <angle>
	setpaircomponents {
		pos_start
		X = (<cos> * <radius_start> * <x_ratio>)
		y = (<sin> * <radius_start> * <y_ratio>)
	}
	setpaircomponents {
		pos_end
		X = (<cos> * <radius_end> * <x_ratio>)
		y = (<sin> * <radius_end> * <y_ratio>)
	}
	CreateScreenElement {
		Type = SpriteElement
		texture = boost_singlesparkle
		parent = <objID>
		Pos = <pos_start>
		rot_angle = <rot_start>
		Scale = <Scale>
		alpha = 1.0
		blend = add
		z_priority = -5
	}
	<id> :se_setprops Pos = <pos_end> rot = <rot_end> alpha = 0.0 time = <time>
	repeat <num_per_group>
	WaitOneGameFrame
	repeat <num_groups>
endscript

script roadie_battle_highway_destroy_hud_fx \{Player = !i1768515945}
	<sparkle_hud_id> = ($roadie_battle_highway_hud_ids [(<Player> - 1)].fx_hud)
	if ScreenElementExists id = <sparkle_hud_id>
		DestroyScreenElement id = <sparkle_hud_id>
	endif
endscript

script roadie_battle_start_intro_hud 
	SpawnScriptNow \{roadie_battle_intro_hud_script}
endscript

script roadie_battle_intro_hud_script 
	begin
	GetSongTimeMs
	if (<time> >= $roadie_battle_intro_start_time_ms)
		break
	endif
	WaitOneGameFrame
	repeat
	getnumplayersingame
	getfirstplayer
	begin
	if roadie_battle_find_roadie_for_player Player = <Player>
		roadie_battle_show_intro_hud Player = <Player> roadie = <roadie>
	endif
	getnextplayer Player = <Player>
	repeat <num_players>
endscript

script roadie_battle_hud_create_intro_object \{Player = !i1768515945
		roadie = !i1768515945
		parent = !q1768515945}
	extendcrcplayer roadie_battle_intro_hud <Player> out = hud_id
	<player_index> = (<Player> - 1)
	setstructureparam array_name = roadie_battle_highway_hud_ids array_index = <player_index> param = Intro value = <hud_id>
	getplayerinfo <Player> controller
	getplayerinfo <Player> part
	switch (<part>)
		case guitar
		<instrument_texture> = mixer_icon_guitar
		case bass
		<instrument_texture> = mixer_icon_bass
		case drum
		<instrument_texture> = mixer_icon_drums
		default
		ScriptAssert 'unhandled instrument %i' i = <part>
	endswitch
	CreateScreenElement {
		id = <hud_id>
		Type = descinterface
		desc = 'roadie_battle_intro_hud'
		parent = <parent>
		Pos = (-25.0, 0.0)
		pos_anchor = [center center]
		just = [center center]
		instrument_icon_texture = <instrument_texture>
		alpha = 0
	}
	<hud_id> :desc_resolvealias Name = alias_light_parent
	spawn_controller_lights {
		parent = <resolved_id>
		Pos = (0.0, 0.0)
		Scale = 1.0
		controller = <controller>
		pos_anchor = [center center]
	}
endscript

script roadie_battle_show_intro_hud \{Player = !i1768515945
		roadie = !i1768515945}
	roadie_battle_hide_visible_highway_hud_object Player = <Player>
	<player_index> = (<Player> - 1)
	<hud_id> = ($roadie_battle_highway_hud_ids [<player_index>].Intro)
	<hud_id> :Obj_SpawnScriptNow {
		roadie_battle_highway_hud_do_fade
		params = {
			Player = <Player>
			display_time_secs = $roadie_battle_intro_display_time_secs
		}
	}
endscript

script roadie_battle_hide_visible_highway_hud_object \{Player = !i1768515945}
	<player_index> = (<Player> - 1)
	<visible_highway_hud_object> = ($roadie_battle_visible_highway_hud_objects [<player_index>])
	if (<visible_highway_hud_object> != None)
		<visible_highway_hud_object> :obj_killallspawnedscripts
		<visible_highway_hud_object> :se_setprops alpha = 0
		roadie_battle_highway_destroy_hud_fx Player = <Player>
		SetArrayElement {
			globalarray
			ArrayName = roadie_battle_visible_highway_hud_objects
			index = <player_index>
			NewValue = None
		}
	endif
endscript

script roadie_battle_reposition_core_hud 
	switch ($roadie_battle_mode)
		case coop
		getnumplayersingame
		if (<num_players> > 1)
			hud_star_meter_id :se_setprops \{Pos = (950.0, -50.0)}
		endif
		switch (<num_players>)
			case 1
			<Pos> = (-175.0, 95.0)
			case 2
			<Pos> = (-155.0, 95.0)
			case 3
			<Pos> = (-125.0, 95.0)
			case 4
			<Pos> = (-105.0, 95.0)
		endswitch
		getfirstplayer
		begin
		get_highway_hud_root_id Player = <Player>
		<highway_hud_root> :desc_resolvealias Name = alias_challenge_alert_menu param = alert_menu
		<alert_menu> :se_setprops Pos = <Pos>
		getnextplayer Player = <Player>
		repeat <num_players>
		case competitive
		getnumplayersingame
		getfirstplayer
		begin
		get_highway_hud_root_id Player = <Player>
		<highway_hud_root> :se_setprops player_meter_pos = (0.0, -300.0)
		getnextplayer Player = <Player>
		repeat <num_players>
	endswitch
endscript

script roadie_battle_hud_create_spin_meter \{roadie = !i1768515945
		Player = !i1768515945}
	formatText checksumName = sidebar_left_container 'sidebar_container_leftp%p' p = <Player>
	formatText checksumName = spin_meter_id 'roadie_battle_spin_meter_p%p' p = <Player>
	roadie_battle_get_roadie_info roadie = <roadie> param = avatar
	formatText checksumName = roadie_texture 'Spin_Meter_R%r' r = (<avatar> + 1)
	get_num_non_vocals_players_onscreen
	switch (<num_non_vocals_players>)
		case 1
		<spin_meter_scale> = 1.0
		<spin_meter_pos> = (-60.0, -269.0)
		case 2
		<spin_meter_scale> = 0.9
		<spin_meter_pos> = (-55.0, -213.0)
		case 3
		<spin_meter_scale> = 0.7
		<spin_meter_pos> = (-41.0, -220.0)
		case 4
		<spin_meter_scale> = 0.65000004
		<spin_meter_pos> = (-34.0, -200.0)
	endswitch
	CreateScreenElement {
		id = <spin_meter_id>
		Type = descinterface
		desc = 'roadie_battle_spin_meter'
		parent = <sidebar_left_container>
		Pos = <spin_meter_pos>
		pos_anchor = [center center]
		just = [center center]
		rot_angle = (0 - $sidebar_angle [(<Player> - 1)])
		z_priority = -10
		Scale = <spin_meter_scale>
		roadie_sprite_texture = <roadie_texture>
	}
	<spin_meter_id> :desc_resolvealias Name = alias_fill_container param = fill_container_id
	<angle_delta> = (360.0 / $roadie_battle_spin_meter_tick_count)
	<angle> = 0.0
	begin
	CreateScreenElement {
		Type = SpriteElement
		parent = <fill_container_id>
		texture = spin_meter_fill
		Pos = (0.0, 0.0)
		just = [center , center]
		pos_anchor = [center , center]
		rot_angle = <angle>
		alpha = 0
	}
	<angle> = (<angle> + <angle_delta>)
	repeat $roadie_battle_spin_meter_tick_count
	<player_index> = (<Player> - 1)
	setstructureparam array_name = roadie_battle_highway_hud_ids array_index = <player_index> param = spin_meter value = <spin_meter_id>
	setstructureparam array_name = roadie_battle_highway_hud_ids array_index = <player_index> param = spin_meter_fill value = <fill_container_id>
endscript

script roadie_battle_hud_update_spin_meter \{roadie = !i1768515945
		Player = !i1768515945}
	<player_index> = (<Player> - 1)
	<spin_meter_fill_id> = ($roadie_battle_highway_hud_ids [<player_index>].spin_meter_fill)
	<current_charge> = ($roadie_infos [<roadie>].current_charge)
	<charge_to_fill> = ($roadie_infos [<roadie>].charge_to_fill)
	<ticks_filled> = ((<current_charge> * $roadie_battle_spin_meter_tick_count) / <charge_to_fill>)
	GetScreenElementChildren id = <spin_meter_fill_id>
	<tick> = 0
	begin
	if (<tick> <= <ticks_filled>)
		(<children> [<tick>]) :se_setprops alpha = 1
	else
		(<children> [<tick>]) :se_setprops alpha = 0
	endif
	<tick> = (<tick> + 1)
	repeat $roadie_battle_spin_meter_tick_count
endscript

script roadie_battle_hud_start_spin_added_effect \{roadie = !i1768515945
		Player = !i1768515945
		bonus_spin = 0x00000038}
	if (<bonus_spin> = true)
		<text> = qs(0xb5c3c183)
	else
		<text> = qs(0x33083558)
	endif
	<player_index> = (<Player> - 1)
	<spin_meter_fill_id> = ($roadie_battle_highway_hud_ids [<player_index>].spin_meter_fill)
	<spin_meter_fill_id> :Obj_SpawnScriptNow roadie_battle_hud_spin_added_effect
	CreateScreenElement {
		Type = TextBlockElement
		parent = <spin_meter_fill_id>
		dims = (100.0, 100.0)
		pos_anchor = [center center]
		fit_width = `scale	each	line	to	fit`
		fit_height = `scale	down	if	larger`
		font = fontgrid_text_a1
		rgba = [230 230 30 255]
		text = <text>
		just = [center center]
		internal_just = [center center]
		z_priority = 50
	}
	<id> :Obj_SpawnScriptNow roadie_battle_hud_spin_added_text_animate
endscript

script roadie_battle_hud_spin_added_effect 
	Obj_GetID
	CreateScreenElement {
		Type = SpriteElement
		parent = <objID>
		texture = spin_meter_arrows
		Pos = (0.0, 0.0)
		just = [center , center]
		pos_anchor = [center , center]
		alpha = 0.75
		Scale = 0.5
		z_priority = 6
	}
	<arrow_id> = <id>
	CreateScreenElement {
		Type = SpriteElement
		parent = <objID>
		texture = spin_meter_glow
		Pos = (0.0, 0.0)
		just = [center , center]
		pos_anchor = [center , center]
		alpha = 0
		Scale = 1.5
		z_priority = 5
	}
	<glow_id> = <id>
	<total_arrow_time> = 0.75
	<fade_out_point> = 0.75
	<fade_out_wait> = (<total_arrow_time> * <fade_out_point>)
	<fade_out_time> = (<total_arrow_time> - <fade_out_wait>)
	<glow_id> :se_setprops alpha = 1.0 time = <total_arrow_time>
	<arrow_id> :se_setprops rot_angle = -720 Scale = 2.0 time = <total_arrow_time>
	Wait <fade_out_wait> Seconds
	<glow_id> :se_setprops alpha = 0.0 time = <fade_out_time>
	<arrow_id> :se_setprops alpha = 0.0 time = <fade_out_time>
	<arrow_id> :se_waitprops
	<glow_id> :se_setprops alpha = 1.0 time = 0.125
	Wait \{0.25
		Seconds}
	<glow_id> :se_setprops alpha = 0.0 time = 0.125
	<glow_id> :se_waitprops
	DestroyScreenElement id = <arrow_id>
	DestroyScreenElement id = <glow_id>
endscript

script roadie_battle_hud_spin_added_text_animate 
	<text_start_pos> = (0.0, -55.0)
	<text_levitate_offset> = (0.0, -50.0)
	<text_time> = 1.5
	<fade_out_point> = 0.75
	<fade_out_wait> = (<text_time> * <fade_out_point>)
	<fade_out_time> = (<text_time> - <fade_out_wait>)
	se_setprops Pos = <text_start_pos>
	se_setprops Pos = (<text_start_pos> + <text_levitate_offset>) time = <text_time>
	Wait <fade_out_wait> Seconds
	se_setprops alpha = 0 time = <fade_out_time>
	se_waitprops
	Die
endscript

script roadie_battle_highway_wipe \{Player = !i1768515945
		edge_color = !a1768515945
		trail_color = !a1768515945
		function = 0x00000048}
	<player_index> = (<Player> - 1)
	if ((<function> = Attack) && ($roadie_battle_wipe_active [<player_index>].Attack = 1))
		return
	elseif ((<function> = repair) && ($roadie_battle_wipe_active [<player_index>].repair = 1))
		return
	endif
	<pos_table> = ($highway_pos_table [<player_index>])
	<height> = (<pos_table>.highway_height)
	if (<function> = Attack)
		<sweep_time> = 0.2
		<fade_mod> = 6
		<end_color> = [255 255 255 255]
	else
		<sweep_time> = 0.15
		<fade_mod> = 3
		<end_color> = <trail_color>
	endif
	<fade_time> = 0.25
	<z> = 3.6
	<pos_table> = ($highway_pos_table [(<Player> - 1)])
	<height> = (<pos_table>.highway_height)
	<pos_c> = ((0.0, 0.7) * <height>)
	getnumplayersingame
	if (<num_players> = 1)
		<pos_l> = (((0.0, -1.4) * <height>) + (50.0, -80.0))
		<pos_r> = (((0.0, -1.4) * <height>) + (-50.0, -80.0))
		<pos_l2> = (((0.0, -1.4) * <height>) + (40.0, -80.0))
		<pos_r2> = (((0.0, -1.4) * <height>) + (-40.0, -80.0))
		<endpos_l> = ((0.0, -1.4) * <height> + (10.0, 0.0))
		<endpos_l2> = ((0.0, -1.4) * <height>)
		<endpos_r> = ((0.0, -1.4) * <height> + (-10.0, 0.0))
		<endpos_r2> = ((0.0, -1.4) * <height>)
		<Scale> = (0.0, 4.0)
		<scale2> = (4.0, 2.5)
		<rot_l> = -25
		<rot_r> = 25
		<fade_angle_l> = -20
		<fade_angle_r> = 20
		<endrot_l> = 2
		<endrot_r> = -2
	elseif (<num_players> = 2)
		<pos_l> = (((0.0, -1.4) * <height>) + (50.0, -80.0))
		<pos_r> = (((0.0, -1.4) * <height>) + (-50.0, -80.0))
		<pos_l2> = (((0.0, -1.4) * <height>) + (40.0, -80.0))
		<pos_r2> = (((0.0, -1.4) * <height>) + (-40.0, -80.0))
		<endpos_l> = ((0.0, -1.4) * <height> + (10.0, 0.0))
		<endpos_l2> = ((0.0, -1.4) * <height>)
		<endpos_r> = ((0.0, -1.4) * <height> + (-10.0, 0.0))
		<endpos_r2> = ((0.0, -1.4) * <height>)
		<Scale> = (0.0, 4.0)
		<scale2> = (4.0, 2.5)
		<rot_l> = -25
		<rot_r> = 25
		<fade_angle_l> = -20
		<fade_angle_r> = 20
		<endrot_l> = 2
		<endrot_r> = -2
	elseif (<num_players> = 3)
		<pos_l> = (((0.0, -1.4) * <height>) + (50.0, -60.0))
		<pos_r> = (((0.0, -1.4) * <height>) + (-50.0, -60.0))
		<pos_l2> = (((0.0, -1.4) * <height>) + (40.0, -80.0))
		<pos_r2> = (((0.0, -1.4) * <height>) + (-40.0, -80.0))
		<endpos_l> = ((0.0, -1.4) * <height> + (10.0, 0.0))
		<endpos_l2> = ((0.0, -1.4) * <height>)
		<endpos_r> = ((0.0, -1.4) * <height> + (-10.0, 0.0))
		<endpos_r2> = ((0.0, -1.4) * <height>)
		<Scale> = (0.0, 0.5)
		<scale2> = (2.0, 0.5)
		<rot_l> = -25
		<rot_r> = 25
		<fade_angle_l> = -20
		<fade_angle_r> = 20
		<endrot_l> = 2
		<endrot_r> = -2
	else
		<pos_l> = (((0.0, -1.4) * <height>) + (50.0, -40.0))
		<pos_r> = (((0.0, -1.4) * <height>) + (-50.0, -40.0))
		<pos_l2> = (((0.0, -1.4) * <height>) + (40.0, -80.0))
		<pos_r2> = (((0.0, -1.4) * <height>) + (-40.0, -80.0))
		<endpos_l> = ((0.0, -1.4) * <height> + (10.0, 0.0))
		<endpos_l2> = ((0.0, -1.4) * <height>)
		<endpos_r> = ((0.0, -1.4) * <height> + (-10.0, 0.0))
		<endpos_r2> = ((0.0, -1.4) * <height>)
		<Scale> = (0.0, 0.5)
		<scale2> = (2.0, 0.5)
		<rot_l> = -25
		<rot_r> = 25
		<fade_angle_l> = -20
		<fade_angle_r> = 20
		<endrot_l> = 2
		<endrot_r> = -2
	endif
	extendcrcplayer sidebar_container_left <Player> out = cont
	CreateScreenElement {
		Type = SpriteElement
		parent = <cont>
		material = mat_sidebar_glow_02
		rgba = <edge_color>
		Pos = <pos_l>
		Scale = <Scale>
		rot_angle = <rot_l>
		blend = add
		just = [center top]
		z_priority = <z>
		alpha = 0
	}
	<namel> = <id>
	CreateScreenElement {
		Type = SpriteElement
		parent = <cont>
		material = mat_sidebar_glow_02
		rgba = <trail_color>
		Pos = <pos_l2>
		Scale = <Scale>
		rot_angle = <rot_l>
		blend = add
		just = [center top]
		z_priority = <z>
		alpha = 0
	}
	<namel2> = <id>
	extendcrcplayer sidebar_container_right <Player> out = cont
	CreateScreenElement {
		Type = SpriteElement
		parent = <cont>
		material = mat_sidebar_glow_02
		rgba = <edge_color>
		Pos = <pos_r>
		Scale = <Scale>
		rot_angle = <rot_r>
		blend = add
		just = [center top]
		z_priority = <z>
		alpha = 0
	}
	<namer> = <id>
	CreateScreenElement {
		Type = SpriteElement
		parent = <cont>
		material = mat_sidebar_glow_02
		rgba = <trail_color>
		Pos = <pos_r2>
		Scale = <Scale>
		rot_angle = <rot_r>
		blend = add
		just = [center top]
		z_priority = <z>
		alpha = 0
	}
	<namer2> = <id>
	extendcrcplayer fretbar_container <Player> out = cont
	CreateScreenElement {
		Type = SpriteElement
		parent = <cont>
		material = mat_sidebar_glow_02
		rgba = <trail_color>
		Pos = <pos_c>
		Scale = <scale2>
		blend = add
		just = [center top]
		z_priority = <z>
		alpha = 0
	}
	<namec> = <id>
	<namel> :se_setprops rot = <fade_angle_l> alpha = 1 Scale = (3.0, 4.0) time = <fade_time>
	<namel2> :se_setprops rot = <fade_angle_l> alpha = 1 Scale = (0.5, 4.0) time = <fade_time>
	<namer> :se_setprops rot = <fade_angle_r> alpha = 1 Scale = (3.0, 4.0) time = <fade_time>
	<namer2> :se_setprops rot = <fade_angle_r> alpha = 1 Scale = (0.5, 4.0) time = <fade_time>
	<namec> :se_setprops alpha = 1 Scale = (8.0, 2.4) time = <fade_time>
	Wait <fade_time> Seconds
	if (<function> = Attack)
		roadie_battle_nowbar_burn Player = <Player> sweep_time = <sweep_time>
	endif
	<namel> :se_setprops Pos = <endpos_l> rot_angle = <endrot_l> time = <sweep_time>
	<namel2> :se_setprops Pos = <endpos_l2> rot_angle = <endrot_l> time = <sweep_time>
	<namer> :se_setprops Pos = <endpos_r> rot_angle = <endrot_r> time = <sweep_time>
	<namer2> :se_setprops Pos = <endpos_r2> rot_angle = <endrot_r> time = <sweep_time>
	<namec> :se_setprops Scale = (20.0, 4.0) time = <sweep_time>
	Wait <sweep_time> Seconds
	<namel> :se_setprops rgba = <end_color>
	<namel2> :se_setprops rgba = <end_color>
	<namer> :se_setprops rgba = <end_color>
	<namer2> :se_setprops rgba = <end_color>
	if (<function> = Attack)
		roadie_battle_shake_highway Player = <Player>
		getplayerinfo <Player> controller
		activatestarpowerpulse Player = <controller> num = 1 length = 25 Strength = 5 Priority = 100
	endif
	<namel> :se_setprops alpha = 0 Pos = <endpos_l2> time = <fade_time>
	<namel2> :se_setprops alpha = 0 time = <fade_time>
	<namer> :se_setprops alpha = 0 Pos = <endpos_r2> time = <fade_time>
	<namer2> :se_setprops alpha = 0 time = <fade_time>
	<namec> :se_setprops alpha = 0 time = (<fade_time> * <fade_mod>)
	if (<function> = repair)
		SpawnScriptNow roadie_battle_repair_rail_sparkles params = {Player = <Player>}
	endif
	Wait <fade_time> Seconds
	DestroyScreenElement id = <namel>
	DestroyScreenElement id = <namel2>
	DestroyScreenElement id = <namer>
	DestroyScreenElement id = <namer2>
	<namec> :se_waitprops
	DestroyScreenElement id = <namec>
	if (<function> = Attack)
		setstructureparam array_name = roadie_battle_wipe_active array_index = <player_index> param = Attack value = 0
	elseif (<function> = repair)
		setstructureparam array_name = roadie_battle_wipe_active array_index = <player_index> param = repair value = 0
	endif
endscript

script roadie_battle_repair_rail_sparkles \{Player = !i1768515945}
	extendcrcplayer sidebar_container_left <Player> out = cont_l
	CreateScreenElement {
		Type = ContainerElement
		parent = <cont_l>
	}
	<parent_l> = <id>
	extendcrcplayer sidebar_container_right <Player> out = cont_r
	CreateScreenElement {
		Type = ContainerElement
		parent = <cont_r>
	}
	<parent_r> = <id>
	getnumplayersingame
	if (<num_players> = 1)
		<x_start> = -10.0
		<y_start> = -50.0
		<x_offset> = 10.0
		<y_offset> = -470.0
		<scale_start> = 0.35000002
		<scale_offset> = -0.1
		<num_sparkles> = 8
	elseif (<num_players> = 2)
		<x_start> = -10.0
		<y_start> = -50.0
		<x_offset> = 10.0
		<y_offset> = -470.0
		<scale_start> = 0.35000002
		<scale_offset> = -0.1
		<num_sparkles> = 8
	elseif (<num_players> = 2)
		<x_start> = -10.0
		<y_start> = -50.0
		<x_offset> = 10.0
		<y_offset> = -470.0
		<scale_start> = 0.35000002
		<scale_offset> = -0.1
		<num_sparkles> = 8
	elseif (<num_players> = 3)
		<x_start> = -10.0
		<y_start> = -50.0
		<x_offset> = 10.0
		<y_offset> = -350.0
		<scale_start> = 0.35000002
		<scale_offset> = -0.1
		<num_sparkles> = 8
	elseif (<num_players> = 4)
		<x_start> = -10.0
		<y_start> = -50.0
		<x_offset> = 10.0
		<y_offset> = -320.0
		<scale_start> = 0.35000002
		<scale_offset> = -0.1
		<num_sparkles> = 8
	endif
	<num_uv_frames> = (4.0, 4.0)
	<num_frames> = (<num_uv_frames> [0] * <num_uv_frames> [1])
	<fade_frames> = 4
	<frame_time> = 0.05
	<i> = 0.0
	begin
	<t> = (<i> / <num_sparkles>)
	<x_left> = (<x_start> + (<x_offset> * <t>))
	<x_right> = (0 - <x_left>)
	<y> = (<y_start> + (<y_offset> * <t>))
	<Scale> = (<scale_start> + (<scale_offset> * <t>))
	setpaircomponents pos_left X = <x_left> y = <y>
	setpaircomponents pos_right X = <x_right> y = <y>
	<u> = RandomFloat (0.0, 3.0)
	<v> = RandomFloat (0.0, 3.0)
	setpaircomponents uv X = <u> y = <v>
	CreateScreenElement {
		Type = SpriteElement
		texture = boost_intro_sparklerailanim
		parent = <parent_l>
		Pos = <pos_left>
		blend = add
		z_priority = 12.3
		Scale = <Scale>
		use_animated_uvs = true
		top_down_v
		current_frames = <uv>
		frame_length = <frame_time>
		num_uv_frames = <num_uv_frames>
		loop_animated_uvs = true
	}
	<u> = RandomFloat (0.0, 3.0)
	<v> = RandomFloat (0.0, 3.0)
	setpaircomponents uv X = <u> y = <v>
	CreateScreenElement {
		Type = SpriteElement
		texture = boost_intro_sparklerailanim
		parent = <parent_r>
		Pos = <pos_right>
		blend = add
		z_priority = 12.3
		Scale = <Scale>
		use_animated_uvs = true
		top_down_v
		current_frames = <uv>
		frame_length = <frame_time>
		num_uv_frames = (4.0, 4.0)
		loop_animated_uvs = true
	}
	<i> = (<i> + 1.0)
	repeat <num_sparkles>
	<run_time> = ((<num_frames> - <fade_frames> + 1) * <frame_time>)
	Wait <run_time> Seconds
	<fade_time> = (<fade_frames> * <frame_time>)
	<parent_l> :se_setprops alpha = 0 time = <fade_time>
	<parent_r> :se_setprops alpha = 0 time = <fade_time>
	Wait <fade_time> Seconds
	DestroyScreenElement id = <parent_l>
	DestroyScreenElement id = <parent_r>
endscript

script roadie_battle_nowbar_burn \{Player = !i1768515945
		sweep_time = !f1768515945}
	<delay_factor> = [
		0.45000002
		0.21000001
		0.0
		0.21000001
		0.45000002
	]
	<offsets> = [
		(1.0, -12.0)
		(0.0, -12.0)
		(0.0, -12.0)
		(0.0, -12.0)
		(-1.0, -12.0)
	]
	<gem_index> = 0
	begin
	<offset> = (<offsets> [<gem_index>])
	Color = ($gem_colors [<gem_index>])
	<color_string> = (($button_up_models [(<Player> -1)]).<Color>.name_string)
	formatText checksumName = name_mid '%s_midp%p' s = <color_string> p = <Player> AddToStringLookup = true
	CreateScreenElement {
		Type = ContainerElement
		parent = <name_mid>
		Pos = <offset>
		pos_anchor = [center bottom]
	}
	<delay> = (<sweep_time> * (<delay_factor> [<gem_index>]))
	<id> :Obj_SpawnScriptNow {
		roadie_battle_notecatcher_burn
		params = {
			gem_index = <gem_index>
			initial_delay = <delay>
		}
	}
	<gem_index> = (<gem_index> + 1)
	repeat 5
endscript

script roadie_battle_notecatcher_burn \{gem_index = !i1768515945
		initial_delay = !f1768515945}
	Wait <initial_delay> Seconds
	Obj_GetID
	<g1_start_color> = [255 255 255 255]
	<g2_start_color> = [255 255 100 255]
	<end_color> = [255 50 50 255]
	<g1_scale> = (0.4, 0.25)
	<g2_scale> = (0.7, 0.4)
	<g1_glow_time> = 0.4
	<g2_glow_time> = 0.2
	<g1_fade_time> = 0.4
	<g2_fade_time> = 0.4
	CreateScreenElement {
		Type = SpriteElement
		texture = boost_glow
		parent = <objID>
		Scale = <g1_scale>
		rgba = <g1_start_color>
		blend = add
		alpha = 1
		z_priority = 5
	}
	<g1_id> = <id>
	<max_smoke_time> = 1.0
	if ($roadie_battle_lod = 0)
		<objID> :Obj_SpawnScriptNow roadie_battle_notecatcher_smoke params = {max_time = <max_smoke_time>}
	endif
	<g1_id> :se_setprops rgba = <end_color> time = <g1_glow_time>
	Wait \{0.1
		Seconds}
	CreateScreenElement {
		Type = SpriteElement
		texture = boost_glow
		parent = <objID>
		Scale = <g2_scale>
		rgba = <g2_start_color>
		blend = add
		alpha = 1
		z_priority = 5
	}
	<g2_id> = <id>
	<g2_id> :se_setprops rgba = <end_color> time = <g2_glow_time>
	<g2_id> :se_waitprops
	<g2_id> :se_setprops alpha = 0 time = <g2_fade_time>
	<g1_id> :se_waitprops
	<g1_id> :se_setprops alpha = 0 time = <g1_fade_time>
	<g1_id> :se_waitprops
	<additional_delay> = (<max_smoke_time> - <g1_fade_time> - <g1_glow_time>)
	if (<additional_delay> > 0)
		Wait <additional_delay> Seconds
	endif
	Die
endscript

script roadie_battle_notecatcher_smoke \{max_time = !f1768515945}
	Obj_GetID
	<num_smokes> = 5
	begin
	<start_delay> = (<max_time> * RandomFloat (0.0, 0.3))
	<LifeTime> = (<max_time> * RandomFloat (0.5, 0.7))
	CreateScreenElement {
		Type = SpriteElement
		texture = rb_highway_smoke2
		parent = <objID>
		alpha = 0
		z_priority = 5
	}
	<id> :Obj_SpawnScriptNow {
		roadie_battle_notecatcher_smoke_spawned
		params = {
			start_delay = <start_delay>
			LifeTime = <LifeTime>
		}
	}
	repeat <num_smokes>
endscript

script roadie_battle_notecatcher_smoke_spawned \{start_delay = !f1768515945
		LifeTime = !f1768515945}
	<pos_x> = RandomFloat (-5.0, 5.0)
	<pos_y> = RandomFloat (0.0, -50.0)
	setpaircomponents Pos X = <pos_x> y = <pos_y>
	<start_scale> = RandomFloat (0.1, 0.3)
	<start_alpha> = RandomFloat (0.5, 0.7)
	<start_rot> = RandomInteger (0.0, 360.0)
	<up_x> = RandomFloat (-10.0, 10.0)
	<up_y> = RandomFloat (-40.0, -200.0)
	setpaircomponents pos_up X = (<pos_x> + <up_x>) y = (<pos_y> + <up_y>)
	<end_rot> = RandomInteger (0.0, 360.0)
	<end_scale> = RandomFloat (0.4, 0.7)
	<time> = (<LifeTime> * RandomFloat (0.5, 1.0))
	Wait <start_delay> Seconds
	se_setprops {
		Pos = <Pos>
		Scale = <start_scale>
		rot_angle = <start_rot>
		alpha = <start_alpha>
	}
	se_setprops {
		Pos = <pos_up>
		Scale = <end_scale>
		rot_angle = <end_rot>
		alpha = 0
		motion = ease_out
		time = <LifeTime>
	}
	se_waitprops
	Die
endscript

script roadie_battle_hud_create_song_meter \{Player = !i1768515945}
	get_highway_hud_root_id Player = <Player>
	if NOT <highway_hud_root> :desc_resolvealias Name = alias_player_meter param = hud_player_meter
		ScriptAssert \{'could not resolve alias_player_meter'}
	endif
	CreateScreenElement {
		Type = descinterface
		desc = 'roadie_battle_song_meter'
		parent = <hud_player_meter>
		Pos = (42.0, 65.0)
		pos_anchor = [center center]
		just = [center center]
		z_priority = 10
	}
	hud_setup_progress_meter meter_id = <id>
endscript
