mainmenu_dropdown_triggered = 0

script ui_create_mainmenu_play 
	KillSpawnedScript \{Name = mainmenu_freeplay_timer_pause}
	KillSpawnedScript \{Name = mainmenu_freeplay_timer}
	SpawnScriptNow \{audio_ui_menu_music_on
		params = {
			Unpause
		}}
	Change \{respond_to_signin_changed = 1}
	uistack_createboundscreenelement \{parent = root_window
		id = mainmenu_play_id
		Type = descinterface
		desc = 'mainmenu'
		tags = {
		}
		event_handlers = [
			{
				pad_back
				mainmenu_play_back
			}
		]
		menu_header_cont_alpha = 1.0
		menu_header_text_text = qs(0xffb0c002)}
	attempt_to_add_friend_feed \{parent_id = mainmenu_play_id
		menu = main_generic}
	mainmenu_setup_physics_elements \{screen_id = mainmenu_play_id}
	uistack_spawnboundscriptnow \{fg_objects_1
		params = {
			desc_id = mainmenu_play_id
		}}
	uistack_spawnboundscriptnow \{ampzilla_anim
		params = {
			desc_id = mainmenu_play_id
		}}
	uistack_spawnboundscriptnow \{anim_clouds
		params = {
			desc_id = mainmenu_play_id
		}}
	<career_text> = qs(0x84e59cef)
	if quest_progression_check_domination_unlocked savegame = ($primary_controller)
		<career_text> = qs(0x8eb60e8f)
	elseif has_completed_forced_career_flow device_num = ($primary_controller)
		<career_text> = qs(0x30cf5c1f)
	endif
	<career_helper_text> = ($g_mainmenu_text.career.helper_text)
	<local_mainmenu_text> = ($g_mainmenu_text)
	appendstruct {
		struct = local_mainmenu_text
		Field = career
		params = {
			menu_item_text = <career_text>
			helper_text = <career_helper_text>
		}
	}
	Change g_mainmenu_text = <local_mainmenu_text>
	mainmenu_setup_option {
		choose_script = main_menu_select_career
		choose_params = {
			lobby_mode = career
		}
		back_script = mainmenu_play_back
		menu_item_text = ($g_mainmenu_text.career.menu_item_text)
	}
	mainmenu_setup_option {
		choose_script = main_menu_select_quickplay
		back_script = mainmenu_play_back
		menu_item_text = ($g_mainmenu_text.quickplay.menu_item_text)
	}
	mainmenu_setup_option {
		choose_script = main_menu_select_roadie_battle
		back_script = mainmenu_play_back
		menu_item = roadie_battle
		menu_item_text = ($g_mainmenu_text.roadie_battle.menu_item_text)
	}
	<rb_menu_element> = <mainmenu_item_id>
	mainmenu_setup_option {
		choose_script = main_menu_select_freeplay
		back_script = mainmenu_play_back
		menu_item_text = ($g_mainmenu_text.party_play.menu_item_text)
	}
	mainmenu_setup_option {
		choose_script = main_menu_select_training
		back_script = mainmenu_play_back
		menu_item_text = ($g_mainmenu_text.training.menu_item_text)
	}
	mainmenu_setup_option {
		choose_script = main_menu_select_band_lobby
		choose_params = {
			lobby_mode = vs
		}
		back_script = mainmenu_play_back
		menu_item_text = ($g_mainmenu_text.competitive.menu_item_text)
	}
	main_menu_finalize
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000
		all_buttons}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000
		all_buttons}
	add_user_control_helper \{text = qs(0x8a778398)
		button = yellow
		z = 100000
		all_buttons}
	if GotParam \{focus_training}
		selected_index = 4
	endif
	LaunchEvent Type = focus target = current_menu data = {child_index = <selected_index>}
	StartRendering
	SpawnScriptNow \{reset_mainmenu_camera}
	lightshow_notingameplay_setmood \{mood = band_lobby}
	if ($mainmenu_dropdown_triggered = 0)
		LoadPak \{'pak\\roadie_battle\\roadie_battle_mainmenu_dropdown.pak'
			Heap = quota_misc}
		CreateScreenElement \{Type = descinterface
			id = roadie_dropdown_id
			desc = 'roadie_battle_dropdown'
			parent = mainmenu_play_id
			Pos = (0.0, 0.0)
			alpha = 1.0}
		Wait \{1
			Seconds}
		<choice> = RandomInteger (0.0, 100.0)
		if (<choice> < 50)
			<id> :Obj_SpawnScriptNow rb_animate_male_basket params = {parent = <id> menu_element = <rb_menu_element>}
		else
			<id> :Obj_SpawnScriptNow rb_animate_female_basket params = {parent = <id> menu_element = <rb_menu_element>}
		endif
	endif
	Wait \{1
		gameframe}
	current_menu :se_setprops \{event_handlers = [
			{
				pad_option2
				main_menu_select_freeplay
			}
		]}
endscript

script roadie_dropdown_fake_ff \{parent = !q1768515945
		menu_element = !q1768515945}
	friends_feed_desc_id :se_setprops \{alpha = 0}
	CreateScreenElement {
		Type = ContainerElement
		parent = <parent>
		Pos = (376.0, 590.0)
		alpha = 1.0
	}
	<message_parent> = <id>
	CreateScreenElement {
		Type = SpriteElement
		just = [center , center]
		pos_anchor = [center , center]
		texture = friendsfeed_bord
		parent = <message_parent>
		Pos = (4.0, 8.0)
		z_priority = 100
		Scale = (2.2, 2.4)
	}
	CreateScreenElement {
		Type = SpriteElement
		just = [center , center]
		pos_anchor = [center , center]
		texture = ff_bg_item
		parent = <message_parent>
		Pos = (0.0, 0.0)
		z_priority = 101
		Scale = (1.9499999, 2.0)
	}
	CreateScreenElement {
		Type = SpriteElement
		just = [center , center]
		pos_anchor = [center , center]
		texture = ff_icon_ds
		parent = <message_parent>
		Pos = (-202.0, -3.0)
		Scale = 0.65000004
		z_priority = 102
	}
	<icon_id> = <id>
	CreateScreenElement {
		Type = SpriteElement
		just = [center , center]
		pos_anchor = [center , center]
		texture = friendsfeed_bord_icon
		parent = <message_parent>
		Pos = (-202.0, -3.0)
		Scale = 1.5
		z_priority = 103
	}
	<border_id> = <id>
	CreateScreenElement {
		Type = TextBlockElement
		just = [center , center]
		pos_anchor = [center , center]
		text = qs(0x9b738197)
		parent = <message_parent>
		Pos = (-10.0, -6.0)
		z_priority = 104
		rgba = [216 181 117 255]
		font = fontgrid_text_a1
		single_line = FALSE
		fit_width = wrap
		fit_height = `scale	down	if	larger`
		scale_mode = proportional
		internal_just = [left center]
		internal_scale = (0.4, 0.4)
		alpha = 1
		dims = (320.0, 62.0)
		font_spacing = 1
		line_spacing = 1.0
	}
	<message_id> = <id>
	CreateScreenElement {
		Type = ContainerElement
		parent = <menu_element>
		Pos = (0.0, 0.0)
		alpha = 1.0
	}
	<sparkle_id> = <id>
	<new_pos> = (30.0, 30.0)
	<new_rot> = 0
	begin
	<u> = RandomInteger (0.0, 3.0)
	<v> = RandomInteger (0.0, 3.0)
	setpaircomponents start_frame X = <u> y = <v>
	CreateScreenElement {
		Type = SpriteElement
		just = [center , center]
		pos_anchor = [center , center]
		texture = boost_intro_sparkleanim
		parent = <sparkle_id>
		Pos = <new_pos>
		blend = add
		z_priority = 50
		Scale = 0.25
		rgba = [255 255 255 255]
		use_animated_uvs = true
		top_down_v
		frame_length = 0.01
		num_uv_frames = (4.0, 4.0)
		loop_animated_uvs = true
		current_frames = <start_frame>
		alpha = 0.9
		rot_angle = <new_rot>
	}
	<new_pos> = (<new_pos> + (45.0, 0.0))
	<new_rot> = (<new_rot> + 45)
	repeat 9
	CreateScreenElement {
		Type = SpriteElement
		just = [center , center]
		pos_anchor = [center , center]
		texture = boost_glow
		parent = <sparkle_id>
		dims = (128.0, 128.0)
		Pos = (200.0, 32.0)
		blend = add
		z_priority = 50
		Scale = (1.25, 0.25)
		rgba = [255 62 32 255]
		use_animated_uvs = true
		alpha = 0.9
	}
	<glow_id> = <id>
	<glow_id> :se_setprops alpha = 0.75
	WaitOneGameFrame
	<glow_id> :se_setprops Scale = (3.0, 0.47) alpha = 0.3 time = 0.25
	<glow_id> :se_waitprops
	<glow_id> :se_setprops Scale = (4.5, 0.8) alpha = 0 time = 2.25
	<sparkle_id> :se_setprops alpha = 0 time = 2.25
	<glow_id> :se_waitprops
	DestroyScreenElement id = <sparkle_id>
	Wait \{4
		Seconds}
	<icon_id> :se_setprops alpha = 0 time = 1.0
	<border_id> :se_setprops alpha = 0 time = 1.0
	<message_id> :se_setprops alpha = 0 time = 1.0
	<icon_id> :se_waitprops
	DestroyScreenElement id = <message_parent>
	friends_feed_desc_id :se_setprops \{alpha = 1}
endscript

script rb_animate_male_basket \{parent = !q1768515945
		menu_element = !q1768515945}
	ResolveScreenElementID id = {<parent> child = {root_container child = dropdown_1_container}}
	<container_id> = <resolved_id>
	<container_id> :se_setprops alpha = 1
	SoundEvent \{event = rb_mainmenupopup_maleroadies}
	<container_id> :se_setprops Pos = (0.0, 160.0) time = 0.4
	<container_id> :se_waitprops
	<container_id> :se_setprops Pos = {relative (1.0, 1.0)} time = 0.015999999
	<container_id> :se_waitprops
	<container_id> :se_setprops Pos = {relative (-1.0, -1.0)} time = 0.015999999
	<container_id> :se_waitprops
	<container_id> :se_setprops Pos = (0.0, 320.0) time = 0.3
	<container_id> :se_waitprops
	<container_id> :se_setprops Pos = (0.0, 475.0) time = 0.15
	<container_id> :se_waitprops
	<container_id> :se_setprops Pos = (0.0, 485.0) time = 0.05
	<container_id> :se_waitprops
	<container_id> :se_setprops Pos = (0.0, 495.0) time = 0.05
	<container_id> :se_waitprops
	<container_id> :se_setprops Pos = (0.0, 460.0) time = 0.15
	<container_id> :se_waitprops
	<container_id> :se_setprops Pos = (0.0, 480.0) time = 0.2
	<container_id> :se_waitprops
	<container_id> :se_setprops Pos = (0.0, 470.0) time = 0.1
	<container_id> :se_waitprops
	<container_id> :se_setprops Pos = (0.0, 478.0) time = 0.15
	<container_id> :se_waitprops
	<container_id> :se_setprops Pos = (0.0, 473.0) time = 0.1
	<container_id> :se_waitprops
	<container_id> :se_setprops Pos = (0.0, 475.0) time = 0.1
	<container_id> :se_waitprops
	CreateScreenElement {
		Type = ContainerElement
		parent = <container_id>
		Pos = (200.0, 80.0)
		alpha = 1.0
	}
	<id> :Obj_SpawnScriptNow rb_animate_male_sparkles params = {parent_id = <id>}
	roadie_dropdown_fake_ff parent = <parent> menu_element = <menu_element>
	Wait \{1
		Seconds}
	<container_id> :Obj_KillSpawnedScript Name = rb_animate_sway
	<container_id> :se_setprops Pos = (0.0, 0.0) time = 0.5
	<container_id> :se_waitprops
	if ScreenElementExists id = <parent>
		DestroyScreenElement id = <parent>
	endif
endscript

script rb_animate_female_basket \{parent = !q1768515945
		menu_element = !q1768515945}
	ResolveScreenElementID id = {<parent> child = {root_container child = dropdown_2_container}}
	<container_id> = <resolved_id>
	<container_id> :se_setprops alpha = 1
	ResolveScreenElementID id = {<container_id> child = {lift child = liftarm}}
	<child_id> = <resolved_id>
	SoundEvent \{event = rb_mainmenupopup_femaleroadies}
	<child_id> :se_setprops rot_angle = 40 time = 2.4
	<container_id> :se_setprops Pos = (-40.0, -10.0) time = 0.3
	<container_id> :se_waitprops
	<container_id> :se_setprops Pos = (-85.0, -25.0) time = 0.3
	<container_id> :se_waitprops
	<container_id> :se_setprops Pos = (-110.0, -45.0) time = 0.3
	<container_id> :se_waitprops
	<container_id> :se_setprops Pos = (-140.0, -70.0) time = 0.3
	<container_id> :se_waitprops
	<container_id> :se_setprops Pos = (-143.0, -75.0) time = 0.06
	<child_id> :se_setprops Pos = {relative (1.0, 2.0)} time = 0.06
	<container_id> :se_waitprops
	<container_id> :se_setprops Pos = (-143.0, -74.0) time = 0.06
	<child_id> :se_setprops Pos = {relative (-1.0, -2.0)} time = 0.06
	<container_id> :se_waitprops
	<container_id> :se_setprops Pos = (-160.0, -100.0) time = 0.24000001
	<container_id> :se_waitprops
	<container_id> :se_setprops Pos = (-175.0, -120.0) time = 0.3
	<container_id> :se_waitprops
	<container_id> :se_setprops Pos = (-190.0, -140.0) time = 0.3
	<container_id> :se_waitprops
	<container_id> :se_setprops Pos = (-200.0, -150.0) time = 0.3
	<container_id> :se_waitprops
	<container_id> :se_setprops Pos = {relative (-1.0, 2.0)} time = 0.03
	<child_id> :se_setprops Pos = {relative (0.0, -1.0)} time = 0.03
	<container_id> :se_waitprops
	<container_id> :se_setprops Pos = {relative (2.0, -4.0)} time = 0.03
	<child_id> :se_setprops Pos = {relative (-1.0, 2.0)} time = 0.03
	<container_id> :se_waitprops
	<container_id> :se_setprops Pos = {relative (0.0, 6.0)} time = 0.03
	<child_id> :se_setprops Pos = {relative (0.0, -3.0)} time = 0.03
	<container_id> :se_waitprops
	<container_id> :se_setprops Pos = {relative (-1.0, -4.0)} time = 0.03
	<child_id> :se_setprops Pos = {relative (1.0, 2.0)} time = 0.03
	<container_id> :se_waitprops
	CreateScreenElement {
		Type = ContainerElement
		id = roadie_sparkles_cont
		parent = <container_id>
		Pos = (1320.0, 450.0)
		alpha = 1.0
	}
	<id> :Obj_SpawnScriptNow rb_animate_female_sparkles params = {parent_id = <id>}
	roadie_dropdown_fake_ff parent = <parent> menu_element = <menu_element>
	Wait \{1
		Seconds}
	<container_id> :se_setprops Pos = (50.0, 50.0) time = 0.5
	<child_id> :se_setprops rot_angle = 0 time = 0.5
	<container_id> :se_waitprops
	if ScreenElementExists id = <parent>
		DestroyScreenElement id = <parent>
	endif
endscript

script rb_animate_male_sparkles \{parent_id = !q1768515945}
	<new_pos> = (-20.0, 10.0)
	<new_rot> = 0
	begin
	<u> = RandomInteger (0.0, 3.0)
	<v> = RandomInteger (0.0, 3.0)
	setpaircomponents start_frame X = <u> y = <v>
	CreateScreenElement {
		Type = SpriteElement
		just = [center , center]
		pos_anchor = [center , center]
		texture = boost_intro_sparkleanim
		parent = <parent_id>
		Pos = <new_pos>
		blend = add
		z_priority = 9999
		Scale = 0.3
		rgba = [255 255 255 255]
		use_animated_uvs = true
		top_down_v
		frame_length = 0.01
		num_uv_frames = (4.0, 4.0)
		loop_animated_uvs = true
		current_frames = <start_frame>
		alpha = 0.9
		rot_angle = <new_rot>
	}
	<new_pos> = (<new_pos> + (50.0, -5.0))
	<new_rot> = (<new_rot> + 45)
	repeat 6
	CreateScreenElement {
		Type = SpriteElement
		parent = <parent_id>
		texture = attack_amp_sparksanim
		Pos = (-60.0, -10.0)
		just = [center center]
		pos_anchor = [center center]
		Scale = 0.35000002
		flip_v
		alpha = 1
		rot_angle = -60
		blend = add
		use_animated_uvs = true
		top_down_v
		frame_length = 0.02
		num_uv_frames = (4.0, 4.0)
		z_priority = 9999
		loop_animated_uvs = FALSE
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <parent_id>
		texture = attack_amp_sparksanim
		Pos = (290.0, 10.0)
		just = [center center]
		pos_anchor = [center center]
		Scale = 0.4
		flip_v
		alpha = 1
		rot_angle = 120
		blend = add
		use_animated_uvs = true
		top_down_v
		frame_length = 0.02
		num_uv_frames = (4.0, 4.0)
		z_priority = 9999
		loop_animated_uvs = FALSE
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <parent_id>
		texture = attack_amp_sparksanim
		Pos = (100.0, -50.0)
		just = [center center]
		pos_anchor = [center center]
		Scale = 0.25
		flip_v
		alpha = 1
		rot_angle = -20
		blend = add
		use_animated_uvs = true
		top_down_v
		frame_length = 0.02
		num_uv_frames = (4.0, 4.0)
		z_priority = 9999
		loop_animated_uvs = FALSE
	}
	Wait \{0.5
		Seconds}
	<parent_id> :se_setprops alpha = 0 time = 1.0
	<parent_id> :Obj_SpawnScriptNow rb_destroy_when_completed_animating
endscript

script rb_animate_female_sparkles \{parent_id = !q1768515945}
	<new_pos> = (0.0, 5.0)
	<new_rot> = 0
	begin
	<u> = RandomInteger (0.0, 3.0)
	<v> = RandomInteger (0.0, 3.0)
	setpaircomponents start_frame X = <u> y = <v>
	CreateScreenElement {
		Type = SpriteElement
		just = [center , center]
		pos_anchor = [center , center]
		texture = boost_intro_sparkleanim
		parent = <parent_id>
		Pos = <new_pos>
		blend = add
		z_priority = 9999
		Scale = 0.3
		rgba = [255 255 255 255]
		use_animated_uvs = true
		top_down_v
		frame_length = 0.01
		num_uv_frames = (4.0, 4.0)
		loop_animated_uvs = true
		current_frames = <start_frame>
		alpha = 0.9
		rot_angle = <new_rot>
	}
	<new_pos> = (<new_pos> + (60.0, 0.0))
	<new_rot> = (<new_rot> + 45)
	repeat 3
	CreateScreenElement {
		Type = SpriteElement
		parent = <parent_id>
		texture = attack_amp_sparksanim
		Pos = (-60.0, 0.0)
		just = [center center]
		pos_anchor = [center center]
		Scale = 0.25
		flip_v
		alpha = 1
		rot_angle = -80
		blend = add
		use_animated_uvs = true
		top_down_v
		frame_length = 0.02
		num_uv_frames = (4.0, 4.0)
		z_priority = 9999
		loop_animated_uvs = FALSE
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <parent_id>
		texture = attack_amp_sparksanim
		Pos = (140.0, -20.0)
		just = [center center]
		pos_anchor = [center center]
		Scale = 0.35000002
		flip_v
		alpha = 1
		rot_angle = 20
		blend = add
		use_animated_uvs = true
		top_down_v
		frame_length = 0.02
		num_uv_frames = (4.0, 4.0)
		z_priority = 9999
		loop_animated_uvs = FALSE
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <parent_id>
		texture = attack_amp_sparksanim
		Pos = (70.0, 60.0)
		just = [center center]
		pos_anchor = [center center]
		Scale = 0.25
		flip_v
		alpha = 1
		rot_angle = 150
		blend = add
		use_animated_uvs = true
		top_down_v
		frame_length = 0.02
		num_uv_frames = (4.0, 4.0)
		z_priority = 9999
		loop_animated_uvs = FALSE
	}
	Wait \{0.5
		Seconds}
	<parent_id> :se_setprops alpha = 0 time = 1.0
	<parent_id> :Obj_SpawnScriptNow rb_destroy_when_completed_animating
endscript

script ui_destroy_mainmenu_play 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = mainmenu_play_id}
		DestroyScreenElement \{id = mainmenu_play_id}
	endif
	if ($mainmenu_dropdown_triggered = 0)
		Change \{mainmenu_dropdown_triggered = 1}
		UnLoadPak \{'pak\\roadie_battle\\roadie_battle_mainmenu_dropdown.pak'
			Heap = quota_misc}
	endif
endscript

script main_menu_select_quickplay \{device_num = !i1768515945}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	LaunchEvent \{Type = unfocus
		target = current_menu}
	mainmenu_animate \{id = mainmenu_play_id
		block_events = 1}
	ui_event_add_params \{play_anim_out = 0}
	get_savegame_from_controller controller = <device_num>
	GetGlobalTags savegame = <savegame> user_options param = quickplay_did_first_time_in
	if (<quickplay_did_first_time_in> = 1)
		main_menu_select_band_lobby {lobby_mode = quickplay device_num = <device_num> animate_ui = 0}
	else
		set_primary_controller device_num = <device_num> state = uistate_character_selection optional_signin = 1 data = {device_num = <device_num>}
	endif
endscript

script mainmenu_play_back 
	ui_sfx \{menustate = Generic
		uitype = back}
	generic_event_back
endscript

script ui_mainmenu_play_anim_out \{play_anim_out = 1}
	if (<play_anim_out> = 0)
		ui_event_add_params \{play_anim_out = 1}
	else
		mainmenu_animate \{id = mainmenu_play_id}
	endif
endscript
