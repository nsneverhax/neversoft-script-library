g_mm_base_menu_pos = (900.0, 375.0)
g_mm_menu_max_width = 220

script create_main_menu_backdrop 
	create_menu_backdrop \{texture = GH3_Main_Menu_BG}
	CreateScreenElement {
		Type = ContainerElement
		id = main_menu_text_container
		parent = root_window
		Pos = ($g_mm_base_menu_pos)
		just = [left top]
		z_priority = 3
	}
	CreateScreenElement \{Type = ContainerElement
		id = main_menu_bg_container
		parent = root_window
		Pos = (0.0, 0.0)
		z_priority = 3}
	CreateScreenElement \{Type = SpriteElement
		id = main_menu_godrays1
		parent = main_menu_bg_container
		texture = Main_Menu_BG2
		Pos = (400.0, 330.0)
		dims = (1280.0, 1280.0)
		just = [
			center
			center
		]
		z_priority = 1
		alpha = 0
		blend = add}
	RunScriptOnScreenElement id = <id> rotate_menu_element params = {time = 30 id = <id>}
	CreateScreenElement \{Type = SpriteElement
		id = main_menu_godrays2
		parent = main_menu_bg_container
		texture = Main_Menu_BG2
		Pos = (400.0, 330.0)
		dims = (1280.0, 1280.0)
		just = [
			center
			center
		]
		z_priority = 1
		alpha = 0
		blend = add
		flip_v}
	RunScriptOnScreenElement id = <id> rotate_menu_element params = {time = 60 id = <id>}
	CreateScreenElement \{Type = SpriteElement
		parent = main_menu_bg_container
		texture = Main_Menu_illustrations
		Pos = (20.0, -20.0)
		dims = (820.0, 770.0)
		just = [
			left
			top
		]
		z_priority = 2
		alpha = 0.9}
	CreateScreenElement \{Type = SpriteElement
		parent = main_menu_bg_container
		texture = main_menu_logo
		Pos = (900.0, 65.0)
		Scale = 1
		just = [
			center
			top
		]
		z_priority = 2}
endscript

script create_main_menu 
	resetscoreupdateready
	GetGlobalTags \{user_options}
	menu_audio_settings_update_guitar_volume vol = <guitar_volume>
	menu_audio_settings_update_band_volume vol = <band_volume>
	menu_audio_settings_update_sfx_volume vol = <sfx_volume>
	setsoundbussparams {Crowd = {vol = ($default_BussSet.Crowd.vol)}}
	create_main_menu_backdrop
	SetMenuAutoRepeatTimes \{(0.3, 0.05)}
	kill_start_key_binding
	UnPauseGame
	Change \{check_for_unplugged_controllers = 1}
	Change \{current_num_players = 1}
	Change structurename = player1_status controller = ($primary_controller)
	Change \{player_controls_valid = 0}
	disable_pause
	SpawnScriptNow \{menu_music_on}
	if ($is_demo_mode = 1)
		demo_mode_disable = {rgba = [128 128 128 255] not_focusable}
	else
		demo_mode_disable = {}
	endif
	DeRegisterAtoms
	RegisterAtoms \{Name = achievement
		$Achievement_Atoms}
	Change \{setlist_previous_tier = 1}
	Change \{setlist_previous_song = 0}
	Change \{setlist_previous_tab = tab_setlist}
	Change \{current_song = beyondbeautiful}
	Change \{end_credits = 0}
	Change \{battle_sudden_death = 0}
	Change \{structurename = player1_status
		character_id = Axel}
	Change \{structurename = player2_status
		character_id = Axel}
	safe_create_gh3_pause_menu
	new_menu {
		scrollid = main_menu_scrolling_menu
		vmenuid = vmenu_main_menu
		use_backdrop = 0
		menu_pos = ($g_mm_base_menu_pos)
		focus_color = dk_violet_red
		unfocus_color = md_violet_grey
	}
	Change \{rich_presence_context = presence_main_menu}
	<text_x_scale> = 1.0
	<text_y_scale> = 1.25
	text_params = {
		Type = TextElement
		font = fontgrid_title_gh3
		Scale = ((<text_x_scale> * (1.0, 0.0)) + (<text_y_scale> * (0.0, 1.0)))
		rgba = (($g_menu_colors).md_violet_grey)
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = (($g_menu_colors).Block)
		z_priority = 60
	}
	<menu_offset> = (0.0, 50.0)
	<hlbar_dims> = (240.0, 50.0)
	<be_dims> = (50.0, 50.0)
	<bel_pos> = ((((<hlbar_dims>.(-1.0, 0.0)) / 2) * (1.0, 0.0)) + (-25.0, 0.0))
	<ber_pos> = ((((<hlbar_dims>.(1.0, 0.0)) / 2) * (1.0, 0.0)) + (24.0, 0.0))
	mm_hilite_color = (($g_menu_colors).lt_plum)
	CreateScreenElement \{Type = ContainerElement
		id = main_menu_career
		parent = vmenu_main_menu
		event_handlers = [
			{
				focus
				main_menu_highlight
				params = {
					option = 'career'
				}
			}
			{
				unfocus
				main_menu_unhighlight
				params = {
					option = 'career'
				}
			}
			{
				pad_choose
				main_menu_select_career
			}
		]}
	CreateScreenElement {
		<text_params>
		parent = main_menu_career
		id = main_menu_career_text
		text = 'CAREER'
		rgba = (($g_menu_colors).brick)
	}
	GetScreenElementDims id = <id>
	fit_text_in_rectangle {
		id = <id>
		dims = ((<height> * (0.0, 1.0)) + (($g_mm_menu_max_width) * (1.0, 0.0)))
		only_if_larger_x = 1
		start_x_scale = <text_x_scale>
		start_y_scale = <text_y_scale>
	}
	CreateScreenElement \{Type = ContainerElement
		id = main_menu_career_hl
		Pos = (0.0, 12.0)
		parent = main_menu_career
		alpha = 0}
	CreateScreenElement {
		Type = SpriteElement
		id = main_menu_career_hlbar
		parent = main_menu_career_hl
		texture = hilite_bar_01
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <hlbar_dims>
	}
	CreateScreenElement {
		Type = SpriteElement
		id = main_menu_career_bel
		parent = main_menu_career_hl
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <be_dims>
		Pos = <bel_pos>
		flip_v
	}
	CreateScreenElement {
		Type = SpriteElement
		id = main_menu_career_ber
		parent = main_menu_career_hl
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <be_dims>
		Pos = <ber_pos>
	}
	DoScreenElementMorph \{id = main_menu_career_hl
		Scale = (1.0, 0.01)
		relative_scale}
	CreateScreenElement \{Type = ContainerElement
		id = main_menu_quickplay
		parent = vmenu_main_menu
		event_handlers = [
			{
				focus
				main_menu_highlight
				params = {
					option = 'quickplay'
				}
			}
			{
				unfocus
				main_menu_unhighlight
				params = {
					option = 'quickplay'
				}
			}
			{
				pad_choose
				main_menu_select_quickplay
			}
		]}
	CreateScreenElement {
		<text_params>
		parent = main_menu_quickplay
		id = main_menu_quickplay_text
		Pos = (<menu_offset>)
		text = 'QUICKPLAY'
	}
	GetScreenElementDims id = <id>
	fit_text_in_rectangle {
		id = <id>
		dims = ((<height> * (0.0, 1.0)) + (($g_mm_menu_max_width) * (1.0, 0.0)))
		only_if_larger_x = 1
		start_x_scale = <text_x_scale>
		start_y_scale = <text_y_scale>
	}
	CreateScreenElement {
		Type = ContainerElement
		id = main_menu_quickplay_hl
		parent = main_menu_career
		Pos = (<menu_offset> + (0.0, 11.0))
		alpha = 0
	}
	CreateScreenElement {
		Type = SpriteElement
		id = main_menu_quickplay_hlbar
		parent = main_menu_quickplay_hl
		texture = hilite_bar_01
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <hlbar_dims>
	}
	CreateScreenElement {
		Type = SpriteElement
		id = main_menu_quickplay_bel
		parent = main_menu_quickplay_hl
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <be_dims>
		Pos = <bel_pos>
		flip_v
	}
	CreateScreenElement {
		Type = SpriteElement
		id = main_menu_quickplay_ber
		parent = main_menu_quickplay_hl
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <be_dims>
		Pos = <ber_pos>
	}
	DoScreenElementMorph \{id = main_menu_quickplay_hl
		Scale = (1.0, 0.01)
		relative_scale}
	CreateScreenElement \{Type = ContainerElement
		id = main_menu_multiplayer
		parent = vmenu_main_menu
		event_handlers = [
			{
				focus
				main_menu_highlight
				params = {
					option = 'multiplayer'
				}
			}
			{
				unfocus
				main_menu_unhighlight
				params = {
					option = 'multiplayer'
				}
			}
			{
				pad_choose
				main_menu_select_multiplayer
			}
		]}
	CreateScreenElement {
		<text_params>
		parent = main_menu_multiplayer
		id = main_menu_multiplayer_text
		Pos = (<menu_offset> * 2)
		text = 'MULTIPLAYER'
	}
	GetScreenElementDims id = <id>
	fit_text_in_rectangle {
		id = <id>
		dims = ((<height> * (0.0, 1.0)) + (($g_mm_menu_max_width) * (1.0, 0.0)))
		only_if_larger_x = 1
		start_x_scale = <text_x_scale>
		start_y_scale = <text_y_scale>
	}
	CreateScreenElement {
		Type = ContainerElement
		id = main_menu_multiplayer_hl
		parent = main_menu_career
		Pos = ((<menu_offset> * 2) + (0.0, 11.0))
		alpha = 0
	}
	CreateScreenElement {
		Type = SpriteElement
		id = main_menu_multiplayer_hlbar
		parent = main_menu_multiplayer_hl
		texture = hilite_bar_01
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <hlbar_dims>
	}
	CreateScreenElement {
		Type = SpriteElement
		id = main_menu_multiplayer_bel
		parent = main_menu_multiplayer_hl
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <be_dims>
		Pos = <bel_pos>
		flip_v
	}
	CreateScreenElement {
		Type = SpriteElement
		id = main_menu_multiplayer_ber
		parent = main_menu_multiplayer_hl
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <be_dims>
		Pos = <ber_pos>
	}
	DoScreenElementMorph \{id = main_menu_multiplayer_hl
		Scale = (1.0, 0.01)
		relative_scale}
	CreateScreenElement {
		Type = ContainerElement
		id = main_menu_training
		parent = vmenu_main_menu
		event_handlers = [
			{focus main_menu_highlight params = {option = 'training'}}
			{unfocus main_menu_unhighlight params = {option = 'training'}}
			{pad_choose main_menu_select_training}
		]
		<demo_mode_disable>
	}
	CreateScreenElement {
		<text_params>
		parent = main_menu_training
		id = main_menu_training_text
		Pos = (<menu_offset> * 3)
		text = 'TRAINING'
	}
	GetScreenElementDims id = <id>
	fit_text_in_rectangle {
		id = <id>
		dims = ((<height> * (0.0, 1.0)) + (($g_mm_menu_max_width) * (1.0, 0.0)))
		only_if_larger_x = 1
		start_x_scale = <text_x_scale>
		start_y_scale = <text_y_scale>
	}
	CreateScreenElement {
		Type = ContainerElement
		id = main_menu_training_hl
		parent = main_menu_career
		Pos = ((<menu_offset> * 3) + (0.0, 11.0))
		alpha = 0
	}
	CreateScreenElement {
		Type = SpriteElement
		id = main_menu_training_hlbar
		parent = main_menu_training_hl
		texture = hilite_bar_01
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <hlbar_dims>
	}
	CreateScreenElement {
		Type = SpriteElement
		id = main_menu_training_bel
		parent = main_menu_training_hl
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <be_dims>
		Pos = <bel_pos>
		flip_v
	}
	CreateScreenElement {
		Type = SpriteElement
		id = main_menu_training_ber
		parent = main_menu_training_hl
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <be_dims>
		Pos = <ber_pos>
	}
	DoScreenElementMorph \{id = main_menu_training_hl
		Scale = (1.0, 0.01)
		relative_scale}
	CreateScreenElement \{Type = ContainerElement
		id = main_menu_options
		parent = vmenu_main_menu
		event_handlers = [
			{
				focus
				main_menu_highlight
				params = {
					option = 'options'
				}
			}
			{
				unfocus
				main_menu_unhighlight
				params = {
					option = 'options'
				}
			}
			{
				pad_choose
				main_menu_select_options
			}
		]}
	CreateScreenElement {
		<text_params>
		parent = main_menu_options
		id = main_menu_options_text
		Pos = (<menu_offset> * 4)
		text = 'OPTIONS'
	}
	GetScreenElementDims id = <id>
	fit_text_in_rectangle {
		id = <id>
		dims = ((<height> * (0.0, 1.0)) + (($g_mm_menu_max_width) * (1.0, 0.0)))
		only_if_larger_x = 1
		start_x_scale = <text_x_scale>
		start_y_scale = <text_y_scale>
	}
	CreateScreenElement {
		Type = ContainerElement
		id = main_menu_options_hl
		parent = main_menu_career
		Pos = ((<menu_offset> * 4) + (0.0, 11.0))
		alpha = 0
	}
	CreateScreenElement {
		Type = SpriteElement
		id = main_menu_options_hlbar
		parent = main_menu_options_hl
		texture = hilite_bar_01
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <hlbar_dims>
	}
	CreateScreenElement {
		Type = SpriteElement
		id = main_menu_options_bel
		parent = main_menu_options_hl
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <be_dims>
		Pos = <bel_pos>
		flip_v
	}
	CreateScreenElement {
		Type = SpriteElement
		id = main_menu_options_ber
		parent = main_menu_options_hl
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <be_dims>
		Pos = <ber_pos>
	}
	DoScreenElementMorph \{id = main_menu_options_hl
		Scale = (1.0, 0.01)
		relative_scale}
	if ($enable_button_cheats = 1)
		CreateScreenElement \{Type = ContainerElement
			id = main_menu_debug_menu
			parent = vmenu_main_menu
			event_handlers = [
				{
					focus
					main_menu_highlight
					params = {
						option = 'debug_menu'
					}
				}
				{
					unfocus
					main_menu_unhighlight
					params = {
						option = 'debug_menu'
					}
				}
				{
					pad_choose
					ui_flow_manager_respond_to_action
					params = {
						action = select_debug_menu
					}
				}
			]}
		CreateScreenElement {
			<text_params>
			Scale = (0.75, 0.75)
			parent = main_menu_debug_menu
			id = main_menu_debug_menu_text
			Pos = (<menu_offset> * 5)
			text = 'DEBUG MENU'
		}
	endif
	add_user_control_helper \{text = 'SELECT'
		button = green
		z = 100}
	add_user_control_helper \{text = 'UP/DOWN'
		button = strumbar
		z = 100}
	if NOT ($invite_controller = -1)
		Change \{invite_controller = -1}
		ui_flow_manager_respond_to_action \{action = select_xbox_live}
		fadetoblack \{OFF
			time = 0}
	else
		LaunchEvent \{Type = focus
			target = vmenu_main_menu}
	endif
endscript

script main_menu_highlight 
	<time> = 0
	<a> = 0.6
	formatText checksumName = text_id 'main_menu_%o_text' o = <option>
	SetScreenElementProps id = <text_id> no_shadow
	DoScreenElementMorph {
		id = <text_id>
		rgba = ($menu_focus_color)
		time = <time>
	}
	if NOT (<option> = 'debug_menu')
		formatText checksumName = hl_id 'main_menu_%o_HL' o = <option>
		DoScreenElementMorph id = <hl_id> alpha = <a> Scale = (1.0, 1.0) time = <time>
		RunScriptOnScreenElement id = <hl_id> wiggle_hilite params = {id = <hl_id>}
	endif
endscript

script main_menu_unhighlight 
	<time> = 0.6
	formatText checksumName = text_id 'main_menu_%o_text' o = <option>
	SetScreenElementProps id = <text_id> Shadow shadow_offs = (3.0, 3.0) shadow_rgba = (($g_menu_colors).black)
	DoScreenElementMorph {
		id = <text_id>
		rgba = ($menu_unfocus_color)
		time = (<time> / 4)
	}
	if NOT (<option> = 'debug_menu')
		formatText checksumName = hl_id 'main_menu_%o_HL' o = <option>
		DoScreenElementMorph id = <hl_id> alpha = 0.2 Scale = 1
		DoScreenElementMorph id = <hl_id> alpha = 0 Scale = 0.9 time = <time> motion = ease_out
	endif
endscript

script wiggle_hilite 
	if NOT ScreenElementExists id = <id>
		return
	endif
	<id> :DoMorph Pos = {(0.0, 2.0) relative} Scale = 1.02 time = 0.05
	<id> :DoMorph Pos = {(0.0, -3.0) relative} Scale = 0.97999996 time = 0.05
	<id> :DoMorph Pos = {(0.0, 1.0) relative} Scale = 1.0 time = 0.05
	return
endscript

script glow_new_downloads_text 
	begin
	if ScreenElementExists \{id = new_downloads_text_glow}
		new_downloads_text_glow :DoMorph alpha = 0 time = <time>
	endif
	if ScreenElementExists \{id = new_downloads_text_glow}
		new_downloads_text_glow :DoMorph alpha = 1 time = <time>
	endif
	repeat
endscript

script glow_menu_element \{On = 1
		OFF = 1
		tween = 1}
	if NOT ScreenElementExists id = <id>
		return
	endif
	Wait RandomRange (0.0, 5.0) Seconds
	begin
	<id> :DoMorph alpha = 1 time = <tween> motion = smooth
	Wait <On> Seconds
	<id> :DoMorph alpha = 0 time = <tween> motion = smooth
	Wait <OFF> Seconds
	repeat
endscript

script rotate_menu_element \{time = 30}
	if NOT ScreenElementExists id = <id>
		return
	endif
	rot_interval = (<time> / 4)
	Wait RandomRange (0.0, 2.0) Seconds
	clockwise = Random (@ 1 @ 0 )
	if (<clockwise> = 1)
		begin
		<id> :DoMorph alpha = 0 rot_angle = 0
		<id> :DoMorph rot_angle = 90 alpha = Random (@ 0.25 @ 0.5 )time = <rot_interval>
		<id> :DoMorph rot_angle = 180 alpha = Random (@ 1.0 @ 0.0 )time = <rot_interval>
		<id> :DoMorph rot_angle = 270 alpha = Random (@ 0.25 @ 0.5 )time = <rot_interval>
		<id> :DoMorph rot_angle = 359 alpha = 0 time = <rot_interval>
		repeat
	else
		begin
		<id> :DoMorph alpha = 0 rot_angle = 0
		<id> :DoMorph rot_angle = -90 alpha = Random (@ 0.25 @ 0.5 )time = <rot_interval>
		<id> :DoMorph rot_angle = -180 alpha = Random (@ 1.0 @ 0.0 )time = <rot_interval>
		<id> :DoMorph rot_angle = -270 alpha = Random (@ 0.25 @ 0.5 )time = <rot_interval>
		<id> :DoMorph rot_angle = -359 alpha = 0 time = <rot_interval>
		repeat
	endif
endscript

script destroy_main_menu 
	KillSpawnedScript \{Name = glow_new_downloads_text}
	clean_up_user_control_helpers
	destroy_menu \{menu_id = main_menu_scrolling_menu}
	destroy_menu \{menu_id = main_menu_text_container}
	destroy_menu_backdrop
	DestroyScreenElement \{id = main_menu_bg_container}
endscript

script main_menu_select_career 
	Change \{game_mode = p1_career}
	Change \{current_num_players = 1}
	Change \{structurename = player1_status
		part = guitar}
	Change \{structurename = player2_status
		part = guitar}
	ui_flow_manager_respond_to_action \{action = select_career}
endscript

script main_menu_select_quickplay 
	Change \{game_mode = p1_quickplay}
	Change \{current_num_players = 1}
	Change \{structurename = player1_status
		part = guitar}
	Change \{structurename = player2_status
		part = guitar}
	ui_flow_manager_respond_to_action \{action = select_quickplay}
endscript

script main_menu_select_multiplayer 
	Change \{game_mode = p2_faceoff}
	Change \{current_num_players = 2}
	Change \{structurename = player1_status
		part = guitar}
	Change \{structurename = player2_status
		part = guitar}
	ui_flow_manager_respond_to_action \{action = select_multiplayer}
endscript

script main_menu_select_training 
	Change \{game_mode = training}
	Change \{current_num_players = 1}
	Change \{came_to_practice_from = main_menu}
	Change \{structurename = player1_status
		part = guitar}
	Change \{structurename = player2_status
		part = guitar}
	ui_flow_manager_respond_to_action \{action = select_training}
endscript

script main_menu_select_xbox_live 
	ui_flow_manager_respond_to_action \{action = select_xbox_live}
endscript

script main_menu_select_options 
	ui_flow_manager_respond_to_action \{action = select_options}
endscript
