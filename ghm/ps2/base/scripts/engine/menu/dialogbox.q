
script create_snazzy_dialog_box \{title = qs(0x904123d5)
		text = qs(0xa271135e)
		anchor_id = dialog_box_anchor
		vmenu_id = dialog_box_vmenu
		container_id = dialog_box_container
		title_font = text_a1
		font = text_a1
		text_font = text_a1
		Pos = (320.0, 230.0)
		just = [
			center
			top
		]
		Scale = 0.8
		line_spacing = 1
		title_scale = 0.7
		text_scale = 0.6
		text_dims = (530.0, 0.0)
		exclusive_device = -1
		pos_tweak = (0.0, -50.0)
		bg_rgba = [
			8
			15
			24
			170
		]
		title_rgba = [
			90
			90
			70
			255
		]
		text_rgba = [
			90
			70
			50
			255
		]
		bg_scale = 1
		hmenu_pos = (0.0, 50.0)
		z_priority = 40
		no_bg
		destroy_on_event = 1}
	if ScreenElementExists id = <anchor_id>
		dialog_box_exit anchor_id = <anchor_id>
	endif
	if NOT InNetGame
		if NOT InFrontend
		endif
	endif
	SetScreenElementLock \{id = root_window
		OFF}
	CreateScreenElement {
		Type = ContainerElement
		parent = root_window
		id = <anchor_id>
		dims = (640.0, 480.0)
		Pos = <Pos>
		just = [center center]
		z_priority = <z_priority>
		Priority = <Priority>
		exclusive_device = <exclusive_device>
	}
	CreateScreenElement {
		Type = ContainerElement
		id = <container_id>
		parent = <anchor_id>
		dims = (640.0, 480.0)
		Pos = <Pos>
		just = [center center]
		z_priority = <z_priority>
		Priority = <Priority>
	}
	CreateScreenElement {
		Type = ContainerElement
		parent = <anchor_id>
		dims = (640.0, 480.0)
		Pos = (320.0, 240.0)
		just = [center center]
		z_priority = <z_priority>
	}
	<bg_anchor_id> = <id>
	if GotParam \{from_cas}
		make_cas_bg_elements parent = <bg_anchor_id>
	else
		if InFrontend
			if NOT GotParam \{no_bg}
			endif
		endif
	endif
	if GotParam \{forced_pos}
		Pos = <forced_pos>
	endif
	CreateScreenElement {
		Type = VMenu
		parent = <container_id>
		id = <vmenu_id>
		Pos = <Pos>
		just = [center top]
		internal_just = [center top]
		Scale = <Scale>
		z_priority = <z_priority>
		padding_scale = 0.8
		exclusive_device = <exclusive_device>
	}
	if NOT GotParam \{no_helper_text}
		if GotParam \{buttons}
			GetArraySize <buttons>
			if GotParam \{pad_back_script}
				if (<array_Size> = 1)
					create_helper_text {anchor_id = <helper_text_anchor_id>
						parent = <bg_anchor_id>
						$generic_dialog_helper_text3
						bg_rgba = <helper_text_bg_rgba>
						z_priority = <z_priority>
					}
				else
					create_helper_text {anchor_id = <helper_text_anchor_id>
						parent = <bg_anchor_id>
						$generic_helper_text
						bg_rgba = <helper_text_bg_rgba>
						z_priority = <z_priority>
					}
				endif
			else
				if (<array_Size> = 1)
					create_helper_text {anchor_id = <helper_text_anchor_id>
						parent = <bg_anchor_id>
						$generic_dialog_helper_text
						bg_rgba = <helper_text_bg_rgba>
						z_priority = <z_priority>
					}
				else
					create_helper_text {anchor_id = <helper_text_anchor_id>
						parent = <bg_anchor_id>
						$generic_dialog_helper_text2
						bg_rgba = <helper_text_bg_rgba>
						z_priority = <z_priority>
					}
				endif
			endif
		endif
	endif
	CreateScreenElement {
		Type = TextElement
		parent = <vmenu_id>
		local_id = dbox_title
		font = <title_font>
		text = <title>
		just = [center top]
		rgba = <title_rgba>
		Scale = <title_scale>
		z_priority = <z_priority>
		not_focusable
		padding_scale = 0.55
	}
	<title_id> = <id>
	GetScreenElementDims id = <title_id>
	if GotParam \{use_goalmenu_bg}
		bg_rgba = [20 30 40 80]
		CreateScreenElement {
			Type = SpriteElement
			parent = {<vmenu_id> child = dbox_title}
			texture = dialog_frame
			just = [center top]
			Pos = (85.0, -20.0)
			rgba = [0 10 20 255]
			Scale = (2.125, 1.0)
			z_priority = (<z_priority> -1)
			flip_v
		}
		CreateScreenElement {
			Type = SpriteElement
			parent = {<vmenu_id> child = dbox_title}
			texture = dialog_middle
			just = [center top]
			Pos = (85.0, 10.0)
			rgba = [0 10 20 255]
			Scale = (2.125, 1.5)
			z_priority = (<z_priority> -1)
			flip_v
		}
		CreateScreenElement {
			Type = SpriteElement
			parent = {<vmenu_id> child = dbox_title}
			texture = dialog_frame_b
			just = [center top]
			Pos = (85.0, 30.0)
			rgba = [0 10 20 255]
			Scale = (2.125, 1.0)
			z_priority = (<z_priority> -1)
			flip_v
		}
		CreateScreenElement {
			Type = SpriteElement
			parent = {<vmenu_id> child = dbox_title}
			texture = menu_selection_white_02
			just = [center top]
			Pos = (85.0, 50.0)
			rgba = [5 15 25 70]
			Scale = (1.5, 1.0)
			z_priority = (<z_priority> -1)
		}
		CreateScreenElement {
			Type = SpriteElement
			parent = {<vmenu_id> child = dbox_title}
			texture = dialog_frame_b
			just = [center top]
			Pos = (85.0, 103.0)
			rgba = [5 15 25 100]
			Scale = (2.125, 0.25)
			z_priority = (<z_priority> -1)
		}
	endif
	CreateScreenElement {
		Type = TextBlockElement
		parent = <vmenu_id>
		font = <text_font>
		text = <text>
		just = [center top]
		dims = <text_dims>
		rgba = <text_rgba>
		Scale = <text_scale>
		line_spacing = <line_spacing>
		allow_expansion
		not_focusable
		padding_scale = 0.65000004
	}
	<text_id> = <id>
	GetScreenElementDims id = <text_id>
	if GotParam \{buttons}
		CreateScreenElement {
			Type = ContainerElement
			parent = <vmenu_id>
			dims = (<text_dims> + (50.0, 40.0))
			not_focusable
		}
	endif
	if GotParam \{logo}
		CreateScreenElement {
			Type = ContainerElement
			parent = <vmenu_id>
			just = [center center]
			dims = (0.0, 88.0)
		}
		CreateScreenElement {
			Type = SpriteElement
			parent = <id>
			texture = <logo>
			just = [center top]
			rgba = [100 100 100 255]
			Scale = ((1.4, 1.3) * 1.4)
		}
		no_icon = no_icon
	endif
	if GotParam \{pad_back_script}
		SetScreenElementProps {
			id = <vmenu_id>
			event_handlers = [{pad_back <pad_back_script> params = <pad_back_params>}]
			replace_handlers
		}
	endif
	SetScreenElementLock id = <vmenu_id> On
	SetScreenElementLock id = <vmenu_id> OFF
	GetScreenElementDims id = <vmenu_id>
	section_width = ((<width> / 100.0) + 0.0)
	if GotParam \{buttons}
		ForEachIn <buttons> do = create_dialog_button params = {
			font = <font>
			parent = <vmenu_id>
			z_priority = (<z_priority> + 4)
			width = <section_width>
			pad_focus_script = <pad_focus_script>
			destroy_on_event = <destroy_on_event>
		}
		GetArraySize <buttons>
		if (<array_Size> > 1)
			SetScreenElementProps {
				id = <vmenu_id>
				event_handlers = [
					{pad_up generic_menu_up_or_down_sound params = {up}}
					{pad_down generic_menu_up_or_down_sound params = {down}}
				]
			}
		endif
	endif
	if GotParam \{sub_logo}
		CreateScreenElement {
			Type = SpriteElement
			parent = <vmenu_id>
			texture = <sub_logo>
			just = [center center]
			rgba = [128 128 128 88]
			Scale = (1.25, 1.0)
			not_focusable
		}
		no_icon = no_icon
	endif
	SetScreenElementLock id = <vmenu_id> On
	SetScreenElementLock id = <vmenu_id> OFF
	GetScreenElementDims id = <vmenu_id>
	section_width = ((<width> / 100.0) + 0.0)
	section_height = 32
	num_parts = (((<height> * 1.0) / (<section_height> * 1.0)) -1.0)
	if NOT GotParam \{forced_pos}
		centered_pos = ((320.0, 0.0) + ((0.0, 1.0) * (480 - <height>) / 2) + <pos_tweak>)
		SetScreenElementProps id = <vmenu_id> Pos = <centered_pos>
	else
		centered_pos = <forced_pos>
	endif
	<bg_x_scale> = 1.2
	CreateScreenElement {
		Type = SpriteElement
		parent = <anchor_id>
		Pos = <centered_pos>
		just = [center bottom]
		texture = dialog_frame
		Scale = ((1.0, 0.0) * <bg_x_scale> + (0.0, 1.0))
		rgba = <bg_rgba>
		z_priority = 38
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <anchor_id>
		texture = dialog_middle
		Pos = (<centered_pos> - (0.0, 16.0))
		Scale = (((1.0, 0.0) * <bg_x_scale>) + (0.0, 1.0) * (<height> / 16.0))
		just = [center top]
		rgba = <bg_rgba>
		z_priority = 38
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <anchor_id>
		Pos = (<centered_pos> + (0.0, 1.0) * (<height>) + (0.0, 15.0))
		just = [center bottom]
		texture = dialog_frame_b
		Scale = ((1.0, 0.0) * <bg_x_scale> + (0.0, 1.0))
		rgba = <bg_rgba>
		z_priority = 38
	}
	kill_start_key_binding
	if ObjectExists \{id = no_button}
		LaunchEvent Type = focus target = <vmenu_id> data = {child_id = no_button}
	else
		LaunchEvent Type = focus target = <vmenu_id>
	endif
	if GotParam \{delay_input}
		RunScriptOnScreenElement id = <anchor_id> dialog_box_delay_input params = {delay_input_time = <delay_input_time>}
	endif
	if NOT GotParam \{no_animate}
		if GotParam \{style}
			RunScriptOnScreenElement id = <anchor_id> <style> params = <...>
		else
			if NOT GotParam \{full_animate}
				RunScriptOnScreenElement id = <container_id> animate_dialog_box_in params = <...>
			else
				RunScriptOnScreenElement id = <anchor_id> animate_dialog_box_in params = <...>
			endif
		endif
	endif
	if ObjectExists \{id = current_menu_anchor}
		LaunchEvent \{Type = unfocus
			target = current_menu_anchor}
	endif
	if ObjectExists \{id = current_menu}
		LaunchEvent \{Type = unfocus
			target = current_menu}
	endif
endscript

script create_dialog_box 
	create_snazzy_dialog_box <...>
endscript

script button_choose_script 
	destroy_dialog_box
	<callBack_Script> <callback_params>
endscript

script create_dialog_button \{focus_script = main_theme_focus
		focus_params = {
			highlighted_text_rgba = [
				0
				20
				30
				255
			]
		}
		unfocus_script = main_theme_unfocus
		unfocus_params = {
			text_rgba = [
				80
				90
				100
				255
			]
		}
		pad_choose_script = destroy_dialog_box
		font = text_a1
		parent = dialog_box_vmenu
		width = 3
		z_priority = 14
		button_text_scale = 0.5
		button_dims = (0.0, 30.0)
		text_color = [
			80
			90
			100
			255
		]
		destroy_on_event = 1}
	SetScreenElementLock \{id = root_window
		OFF}
	SetScreenElementLock id = <parent> OFF
	if NOT GotParam \{ignore_default_option}
		if (<text> = qs(0x7960546e))
			id = no_button
		endif
	endif
	if (<destroy_on_event> = 1)
		<pad_choose_params> = {callBack_Script = <pad_choose_script> callback_params = <pad_choose_params>}
		<pad_choose_script> = button_choose_script
	else
	endif
	CreateScreenElement {
		Type = ContainerElement
		parent = <parent>
		id = <id>
		dims = <button_dims>
		just = [center center]
		event_handlers =
		[
			{focus <focus_script> params = <focus_params>}
			{unfocus <unfocus_script> params = <unfocus_params>}
			{pad_choose generic_menu_pad_choose_sound}
			{pad_start generic_menu_pad_choose_sound}
			{pad_choose <pad_choose_script> params = <pad_choose_params>}
			{pad_start <pad_choose_script> params = <pad_choose_params>}
		]
		<not_focusable>
	}
	anchor_id = <id>
	CreateScreenElement {
		Type = TextElement
		parent = <anchor_id>
		Pos = (0.0, 0.0)
		font = <font>
		text = <text>
		just = [center center]
		Scale = <button_text_scale>
		rgba = <text_color>
		z_priority = <z_priority>
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <anchor_id>
		texture = menu_selection_white_01
		Scale = (0.6, 0.5)
		rgba = [86 88 90 155]
		z_priority = (<z_priority> -1)
		local_id = highlight_bar
		alpha = 0
		Random (@ flip_h @ flip_v @ )
	}
	highlight_angle = 0
	bar_scale = ((<width> + 2) * (0.5, 0.0) + (0.0, 0.7))
	highlight_angle = (<highlight_angle> / (<bar_scale>.(1.0, 0.0)))
endscript

script destroy_dialog_box \{anchor_id = dialog_box_anchor}
	if NOT GotParam \{dont_restore_input}
		SetButtonEventMappings \{unblock_menu_input}
	endif
	Debounce \{X
		time = 0.3}
	if ObjectExists id = <anchor_id>
		DestroyScreenElement id = <anchor_id>
	endif
	if NOT GotParam \{dont_focus}
		if ObjectExists \{id = current_menu_anchor}
			LaunchEvent \{Type = focus
				target = current_menu_anchor}
		endif
	endif
endscript

script dialog_box_exit \{anchor_id = dialog_box_anchor}
	destroy_dialog_box <...>
	if NOT GotParam \{dont_restore_input}
		SetButtonEventMappings \{unblock_menu_input}
	endif
	Debounce \{X
		time = 0.3}
	if ObjectExists id = <anchor_id>
		DestroyScreenElement id = <anchor_id>
	endif
	if NOT GotParam \{no_pad_start}
		if NOT InFrontend
			restore_start_key_binding
		endif
	endif
endscript

script dialog_box_delay_input \{delay_input_time = 2000}
	TemporarilyDisableInput time = <delay_input_time>
endscript
dont_create_speech_boxes = 0

script create_speech_box 
	KillSpawnedScript \{id = create_speech_box_guts}
	SpawnScriptNow create_speech_box_guts params = {<...>}
endscript

script create_speech_box_guts \{Pos = (640.0, 560.0)
		bg_rgba = [
			8
			15
			24
			50
		]
		text_rgba = [
			100
			90
			80
			255
		]
		anchor_id = speech_box_anchor
		Scale = (1.7, 0.71999997)
		pad_choose_script = speech_box_exit
		pad_choose_params = {
		}
		parent = root_window
		bg_x_scale = 1.12
		pause_input_time = 1000}
	font = text_a1
	if ObjectExists id = <anchor_id>
		DestroyScreenElement id = <anchor_id>
	endif
	SetScreenElementLock \{id = root_window
		OFF}
	CreateScreenElement {
		Type = ContainerElement
		parent = <parent>
		id = <anchor_id>
		Pos = <Pos>
		just = [center bottom]
		Scale = <Scale>
		z_priority = <z_priority>
	}
	if NOT GotParam \{no_pad_choose}
		SetScreenElementProps {
			id = <anchor_id>
			event_handlers = [{pad_choose speech_box_input_debounce}
				{pad_choose <pad_choose_script> params = <pad_choose_params>}]
			replace_handlers
		}
	endif
	if GotParam \{pad_back_script}
		SetScreenElementProps {
			id = <anchor_id>
			event_handlers = [{pad_back speech_box_input_debounce}
				{pad_back <pad_back_script> params = <pad_back_params>}]
			replace_handlers
		}
	endif
	if GotParam \{pad_option_script}
		SetScreenElementProps {
			id = <anchor_id>
			event_handlers = [
				{pad_option <pad_option_script> params = <pad_option_params>}]
			replace_handlers
		}
	endif
	if GotParam \{pad_option2_script}
		SetScreenElementProps {
			id = <anchor_id>
			event_handlers = [{pad_option2 speech_box_input_debounce}
				{pad_option2 <pad_option2_script> params = <pad_option2_params>}]
			replace_handlers
		}
	endif
	if GotParam \{pad_up_script}
		SetScreenElementProps {
			id = <anchor_id>
			event_handlers = [{pad_up <pad_up_script> params = <pad_up_params>}]
			replace_handlers
		}
	endif
	if GotParam \{pad_down_script}
		SetScreenElementProps {
			id = <anchor_id>
			event_handlers = [{pad_down <pad_down_script> params = <pad_down_params>}]
			replace_handlers
		}
	endif
	if GotParam \{pad_left_script}
		SetScreenElementProps {
			id = <anchor_id>
			event_handlers = [{pad_left <pad_left_script> params = <pad_left_params>}]
			replace_handlers
		}
	endif
	if GotParam \{pad_right_script}
		SetScreenElementProps {
			id = <anchor_id>
			event_handlers = [{pad_right <pad_right_script> params = <pad_right_params>}]
			replace_handlers
		}
	endif
	if NOT GotParam \{no_pad_start}
		SetScreenElementProps {
			id = root_window
			event_handlers = [{pad_start <pad_choose_script> params = <pad_choose_params>}]
			replace_handlers
		}
	endif
	CreateScreenElement {
		Type = TextBlockElement
		parent = <anchor_id>
		font = <font>
		dims = (540.0, 0.0)
		just = [center bottom]
		text = <text>
		rgba = <text_rgba>
		Scale = (0.5, 1.05)
		allow_expansion
	}
	<speech_text> = <id>
	GetScreenElementDims id = <speech_text>
	speech_text_height = <height>
	CreateScreenElement {
		Type = SpriteElement
		parent = <anchor_id>
		just = [center top]
		texture = dialog_frame_b
		Scale = ((1.0, 0.0) * <bg_x_scale> + (0.0, 1.0))
		rgba = <bg_rgba>
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <anchor_id>
		Pos = ((0.0, -1.0) * <speech_text_height>)
		just = [center bottom]
		texture = dialog_frame
		Scale = ((1.0, 0.0) * <bg_x_scale> + (0.0, 1.0))
		rgba = <bg_rgba>
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <anchor_id>
		texture = dialog_middle
		Scale = (((1.0, 0.0) * <bg_x_scale>) + ((0.0, 1.0) * (<speech_text_height> / 16.0)))
		just = [center bottom]
		rgba = <bg_rgba>
	}
	GetScreenElementProps id = <id>
	pos_top = (<Pos> [1])
	if GotParam \{style}
		RunScriptOnScreenElement id = <anchor_id> <style> params = <...>
	endif
	LaunchEvent Type = focus target = <anchor_id>
	if GotParam \{pause_input}
		SpawnScriptLater TemporarilyDisableInput params = {time = <pause_input_time>}
	endif
endscript

script speech_box_exit \{anchor_id = speech_box_anchor}
	if ObjectExists id = <anchor_id>
		DestroyScreenElement id = <anchor_id>
	endif
	Debounce \{X
		time = 0.3}
	Debounce \{circle
		time = 0.3}
	if NOT GotParam \{no_pad_start}
		restore_start_key_binding
	endif
	LaunchEvent \{Type = speech_box_destroyed}
endscript

script speech_box_input_debounce 
	Debounce \{X
		time = 0.3
		CLEAR = 1}
	Debounce \{circle
		time = 0.3
		CLEAR = 1}
	Debounce \{Square
		time = 0.3
		CLEAR = 1}
	Debounce \{Triangle
		time = 0.3
		CLEAR = 1}
endscript

script hide_speech_text 
	legacydomorph \{time = 0
		Scale = 0}
endscript

script speech_box_style_scale_text 
	Wait \{0.05
		Second}
	legacydomorph \{time = 0
		Scale = (1.0, 1.0)
		alpha = 0}
	legacydomorph \{time = 0.5
		Scale = (1.0, 1.0)
		alpha = 1}
	LaunchEvent Type = focus target = <anchor_id>
endscript

script animate_dialog_box_in 
	if GotParam \{full_animate}
		SetScreenElementProps {
			id = <bg_anchor_id>
			Hide
		}
	endif
	if NOT GotParam \{delay_input}
		<bg_anchor_id> :Obj_SpawnScriptLater dialog_box_delay_input params = {delay_input_time = 300}
	endif
	legacydomorph \{time = 0
		Scale = (0.0, 0.0)
		alpha = 0.1}
	legacydomorph \{time = 0.15
		Scale = (1.0, 0.0)
		alpha = 0.4}
	legacydomorph \{time = 0.15
		Scale = (1.0, 1.0)
		alpha = 1.0}
	if GotParam \{full_animate}
		SetScreenElementProps {
			id = <bg_anchor_id>
			unhide
		}
	endif
endscript

script create_test_dialog 
	if ScreenElementExists \{id = current_menu_anchor}
		DestroyScreenElement \{id = current_menu_anchor}
	endif
	create_dialog_box \{pad_back_script = create_test_menu
		buttons = [
			{
				font = text_a1
				text = qs(0x7960546e)
				pad_choose_script = create_test_menu
			}
			{
				font = text_a1
				text = qs(0xe20452d6)
				pad_choose_script = null_script
			}
		]}
endscript
