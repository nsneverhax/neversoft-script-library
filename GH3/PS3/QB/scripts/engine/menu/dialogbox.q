
script create_snazzy_dialog_box \{Title = "Title"
		Text = "Default text"
		anchor_id = dialog_box_anchor
		vmenu_id = dialog_box_vmenu
		container_id = dialog_box_container
		title_font = text_A1
		font = text_A1
		text_font = text_A1
		Pos = (320.0, 230.0)
		just = [
			Center
			Top
		]
		Scale = 0.8
		line_spacing = 1
		title_scale = 0.7
		text_scale = 0.6
		text_dims = (530.0, 0.0)
		exclusive_device = -1
		pos_tweak = (0.0, -50.0)
		Bg_rgba = [
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
	if ScreenElementExists Id = <anchor_id>
		dialog_box_exit anchor_id = <anchor_id>
	endif
	if NOT InNetGame
		if NOT InFrontEnd
		endif
	endif
	SetScreenElementLock \{Id = root_window
		OFF}
	CreateScreenElement {
		Type = ContainerElement
		PARENT = root_window
		Id = <anchor_id>
		Dims = (640.0, 480.0)
		Pos = <Pos>
		just = [Center Center]
		z_priority = <z_priority>
		Priority = <Priority>
		exclusive_device = <exclusive_device>
	}
	CreateScreenElement {
		Type = ContainerElement
		Id = <container_id>
		PARENT = <anchor_id>
		Dims = (640.0, 480.0)
		Pos = <Pos>
		just = [Center Center]
		z_priority = <z_priority>
		Priority = <Priority>
	}
	CreateScreenElement {
		Type = ContainerElement
		PARENT = <anchor_id>
		Dims = (640.0, 480.0)
		Pos = (320.0, 240.0)
		just = [Center Center]
		z_priority = <z_priority>
	}
	<bg_anchor_id> = <Id>
	if GotParam \{from_cas}
		make_cas_bg_elements PARENT = <bg_anchor_id>
	else
		if InFrontEnd
			if NOT GotParam \{no_bg}
			endif
		endif
	endif
	if GotParam \{forced_pos}
		Pos = <forced_pos>
	endif
	CreateScreenElement {
		Type = VMenu
		PARENT = <container_id>
		Id = <vmenu_id>
		Pos = <Pos>
		just = [Center Top]
		internal_just = [Center Top]
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
						PARENT = <bg_anchor_id>
						$generic_dialog_helper_text3
						Bg_rgba = <helper_text_bg_rgba>
						z_priority = <z_priority>
					}
				else
					create_helper_text {anchor_id = <helper_text_anchor_id>
						PARENT = <bg_anchor_id>
						$generic_helper_text
						Bg_rgba = <helper_text_bg_rgba>
						z_priority = <z_priority>
					}
				endif
			else
				if (<array_Size> = 1)
					create_helper_text {anchor_id = <helper_text_anchor_id>
						PARENT = <bg_anchor_id>
						$generic_dialog_helper_text
						Bg_rgba = <helper_text_bg_rgba>
						z_priority = <z_priority>
					}
				else
					create_helper_text {anchor_id = <helper_text_anchor_id>
						PARENT = <bg_anchor_id>
						$generic_dialog_helper_text2
						Bg_rgba = <helper_text_bg_rgba>
						z_priority = <z_priority>
					}
				endif
			endif
		endif
	endif
	CreateScreenElement {
		Type = TextElement
		PARENT = <vmenu_id>
		local_id = dbox_title
		font = <title_font>
		Text = <Title>
		just = [Center Top]
		rgba = <title_rgba>
		Scale = <title_scale>
		z_priority = <z_priority>
		NOT_FOCUSABLE
		padding_scale = 0.55
	}
	<title_id> = <Id>
	GetScreenElementDims Id = <title_id>
	if GotParam \{use_goalmenu_bg}
		Bg_rgba = [20 30 40 80]
		CreateScreenElement {
			Type = SpriteElement
			PARENT = {<vmenu_id> child = dbox_title}
			texture = dialog_frame
			just = [Center Top]
			Pos = (85.0, -20.0)
			rgba = [0 10 20 255]
			Scale = (2.125, 1.0)
			z_priority = (<z_priority> -1)
			flip_v
		}
		CreateScreenElement {
			Type = SpriteElement
			PARENT = {<vmenu_id> child = dbox_title}
			texture = dialog_middle
			just = [Center Top]
			Pos = (85.0, 10.0)
			rgba = [0 10 20 255]
			Scale = (2.125, 1.5)
			z_priority = (<z_priority> -1)
			flip_v
		}
		CreateScreenElement {
			Type = SpriteElement
			PARENT = {<vmenu_id> child = dbox_title}
			texture = dialog_frame_b
			just = [Center Top]
			Pos = (85.0, 30.0)
			rgba = [0 10 20 255]
			Scale = (2.125, 1.0)
			z_priority = (<z_priority> -1)
			flip_v
		}
		CreateScreenElement {
			Type = SpriteElement
			PARENT = {<vmenu_id> child = dbox_title}
			texture = menu_selection_white_02
			just = [Center Top]
			Pos = (85.0, 50.0)
			rgba = [5 15 25 70]
			Scale = (1.5, 1.0)
			z_priority = (<z_priority> -1)
		}
		CreateScreenElement {
			Type = SpriteElement
			PARENT = {<vmenu_id> child = dbox_title}
			texture = dialog_frame_b
			just = [Center Top]
			Pos = (85.0, 103.0)
			rgba = [5 15 25 100]
			Scale = (2.125, 0.25)
			z_priority = (<z_priority> -1)
		}
	endif
	CreateScreenElement {
		Type = TextBlockElement
		PARENT = <vmenu_id>
		font = <text_font>
		Text = <Text>
		just = [Center Top]
		Dims = <text_dims>
		rgba = <text_rgba>
		Scale = <text_scale>
		line_spacing = <line_spacing>
		allow_expansion
		NOT_FOCUSABLE
		padding_scale = 0.65000004
	}
	<text_id> = <Id>
	GetScreenElementDims Id = <text_id>
	if GotParam \{buttons}
		CreateScreenElement {
			Type = ContainerElement
			PARENT = <vmenu_id>
			Dims = (<text_dims> + (50.0, 40.0))
			NOT_FOCUSABLE
		}
	endif
	if GotParam \{logo}
		CreateScreenElement {
			Type = ContainerElement
			PARENT = <vmenu_id>
			just = [Center Center]
			Dims = (0.0, 88.0)
		}
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <Id>
			texture = <logo>
			just = [Center Top]
			rgba = [100 100 100 255]
			Scale = ((1.4, 1.3) * 1.4)
		}
		no_icon = no_icon
	endif
	if GotParam \{pad_back_script}
		SetScreenElementProps {
			Id = <vmenu_id>
			event_handlers = [{pad_back <pad_back_script> Params = <pad_back_params>}]
			Replace_Handlers
		}
	endif
	SetScreenElementLock Id = <vmenu_id> ON
	SetScreenElementLock Id = <vmenu_id> OFF
	GetScreenElementDims Id = <vmenu_id>
	section_width = ((<width> / 100.0) + 0.0)
	if GotParam \{buttons}
		ForEachIn <buttons> do = create_dialog_button Params = {
			font = <font>
			PARENT = <vmenu_id>
			z_priority = (<z_priority> + 4)
			width = <section_width>
			pad_focus_script = <pad_focus_script>
			destroy_on_event = <destroy_on_event>
		}
		GetArraySize <buttons>
		if (<array_Size> > 1)
			SetScreenElementProps {
				Id = <vmenu_id>
				event_handlers = [
					{pad_up generic_menu_up_or_down_sound Params = {UP}}
					{pad_down generic_menu_up_or_down_sound Params = {DOWN}}
				]
			}
		endif
	endif
	if GotParam \{sub_logo}
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <vmenu_id>
			texture = <sub_logo>
			just = [Center Center]
			rgba = [128 128 128 88]
			Scale = (1.25, 1.0)
			NOT_FOCUSABLE
		}
		no_icon = no_icon
	endif
	SetScreenElementLock Id = <vmenu_id> ON
	SetScreenElementLock Id = <vmenu_id> OFF
	GetScreenElementDims Id = <vmenu_id>
	section_width = ((<width> / 100.0) + 0.0)
	section_height = 32
	num_parts = (((<Height> * 1.0) / (<section_height> * 1.0)) -1.0)
	if NOT GotParam \{forced_pos}
		centered_pos = ((320.0, 0.0) + ((0.0, 1.0) * (480 - <Height>) / 2) + <pos_tweak>)
		SetScreenElementProps Id = <vmenu_id> Pos = <centered_pos>
	else
		centered_pos = <forced_pos>
	endif
	<bg_x_scale> = 1.2
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <anchor_id>
		Pos = <centered_pos>
		just = [Center Bottom]
		texture = dialog_frame
		Scale = ((1.0, 0.0) * <bg_x_scale> + (0.0, 1.0))
		rgba = <Bg_rgba>
		z_priority = 38
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <anchor_id>
		texture = dialog_middle
		Pos = (<centered_pos> - (0.0, 16.0))
		Scale = (((1.0, 0.0) * <bg_x_scale>) + (0.0, 1.0) * (<Height> / 16.0))
		just = [Center Top]
		rgba = <Bg_rgba>
		z_priority = 38
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <anchor_id>
		Pos = (<centered_pos> + (0.0, 1.0) * (<Height>) + (0.0, 15.0))
		just = [Center Bottom]
		texture = dialog_frame_b
		Scale = ((1.0, 0.0) * <bg_x_scale> + (0.0, 1.0))
		rgba = <Bg_rgba>
		z_priority = 38
	}
	kill_start_key_binding
	if ObjectExists \{Id = no_button}
		LaunchEvent Type = Focus Target = <vmenu_id> Data = {child_id = no_button}
	else
		LaunchEvent Type = Focus Target = <vmenu_id>
	endif
	if GotParam \{delay_input}
		RunScriptOnScreenElement Id = <anchor_id> dialog_box_delay_input Params = {delay_input_time = <delay_input_time>}
	endif
	if NOT GotParam \{no_animate}
		if GotParam \{style}
			RunScriptOnScreenElement Id = <anchor_id> <style> Params = <...>
		else
			if NOT GotParam \{full_animate}
				RunScriptOnScreenElement Id = <container_id> animate_dialog_box_in Params = <...>
			else
				RunScriptOnScreenElement Id = <anchor_id> animate_dialog_box_in Params = <...>
			endif
		endif
	endif
	if ObjectExists \{Id = current_menu_anchor}
		LaunchEvent \{Type = unfocus
			Target = current_menu_anchor}
	endif
	if ObjectExists \{Id = current_menu}
		LaunchEvent \{Type = unfocus
			Target = current_menu}
	endif
endscript

script special_dialog_style 
	GetScreenElementDims Id = <vmenu_id>
	GetScreenElementPosition Id = <vmenu_id>
	CreateScreenElement {
		Type = SpriteElement
		PARENT = dialog_box_container
		Id = left_star
		Pos = (<ScreenELementPos> + (40.0, 12.0))
		texture = PA_goals
		Scale = 1.8
		flip_v
		rgba = [128 128 128 128]
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = dialog_box_container
		Id = right_star
		Pos = ((1.0, 0.0) * <width> + <ScreenELementPos> + (-30.0, 12.0))
		texture = PA_goals
		Scale = 1.8
		flip_v
		Rot_Angle = -10
		rgba = [100 100 100 255]
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = dialog_box_container
		Id = flash3
		Pos = ((1.0, 0.0) * <width> + <ScreenELementPos> + (-275.0, 130.0))
		texture = spec_B_M
		Scale = (7.3, 6.0)
		flip_v
		rgba = [126 2 84 58]
		z_priority = 11
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = dialog_box_container
		Id = topline
		Pos = ((1.0, 0.0) * <width> + <ScreenELementPos> + (-275.0, 22.0))
		texture = white2
		Scale = (60.0, 0.2)
		flip_v
		rgba = [13 121 4 128]
		z_priority = 11
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = dialog_box_container
		Id = topline2
		Pos = ((1.0, 0.0) * <width> + <ScreenELementPos> + (-275.0, -5.0))
		texture = white2
		Scale = (60.0, 0.2)
		flip_v
		rgba = [13 121 4 128]
		z_priority = 11
	}
	RunScriptOnScreenElement \{Id = left_star
		spin_star
		Params = {
			Dir = cw
		}}
	RunScriptOnScreenElement \{Id = right_star
		spin_star
		Params = {
			Dir = ccw
		}}
	<title_id> :Obj_SpawnScriptLater pulse_dialog_title Params = {Id = <title_id>}
	RunScriptOnScreenElement Id = dialog_box_container animate_special_dialog_box_in Params = <...>
endscript

script animate_special_dialog_box_in 
	DoMorph \{Pos = (1000.0, 260.0)
		Alpha = 0
		Time = 0
		Scale = 0
		Rot_Angle = -220}
	DoMorph \{Pos = (320.0, 260.0)
		Alpha = 1
		Time = 0.3
		Scale = 1.0
		Rot_Angle = 0}
endscript

script spin_star \{Dir = cw}
	do_random_effect
endscript

script burst_star 
	DoMorph \{Time = 0
		Scale = 0
		Alpha = 0}
	DoMorph \{Time = 0.4
		Scale = (7.5, 3.8)
		Alpha = 0.6}
endscript

script pulse_dialog_title 
	begin
	if ObjectExists Id = <Id>
		DoScreenElementMorph Id = <Id> Time = 0.2 Scale = (1.8, 2.0) rgba = [13 121 4 128]
		Wait \{0.2
			Seconds}
	else
		break
	endif
	if ObjectExists Id = <Id>
		DoScreenElementMorph Id = <Id> Time = 0.2 Scale = (1.5, 1.5) rgba = [13 121 4 128]
		Wait \{0.2
			Seconds}
	else
		break
	endif
	repeat
endscript

script theme_dialog_background \{PARENT = current_menu_anchor
		width = 1
		Pos = (320.0, 120.0)
		num_parts = 2
		top_height = 1}
	if ScreenElementExists \{Id = dialog_box_bg_vmenu}
		DestroyScreenElement \{Id = dialog_box_bg_vmenu}
	endif
	dialog_bg_rgba = [30 30 35 216]
	SetScreenElementLock Id = <PARENT> OFF
	CreateScreenElement {
		Type = VMenu
		PARENT = <PARENT>
		Id = dialog_box_bg_vmenu
		font = text_A1
		just = [LEFT Top]
		Pos = <Pos>
		padding_scale = 1
		internal_scale = 1
		internal_just = [Center Center]
	}
	middle_parts = <num_parts>
	CastToInteger \{middle_parts}
	partial_scale = (<num_parts> - <middle_parts>)
	Printf "partial_scale = %p" P = <partial_scale>
	build_theme_dialog_top PARENT = dialog_box_bg_vmenu width = <width> dialog_bg_rgba = <dialog_bg_rgba> z_priority = <z_priority> Height = <top_height>
	if (<middle_parts> > 0)
		begin
		build_theme_dialog_middle PARENT = dialog_box_bg_vmenu width = <width> dialog_bg_rgba = <dialog_bg_rgba> z_priority = <z_priority>
		repeat <middle_parts>
	endif
	build_theme_dialog_middle PARENT = dialog_box_bg_vmenu width = <width> dialog_bg_rgba = <dialog_bg_rgba> scale_height = <partial_scale> z_priority = <z_priority>
	build_theme_dialog_bottom PARENT = dialog_box_bg_vmenu width = <width> dialog_bg_rgba = <dialog_bg_rgba> scale_height = <partial_scale> z_priority = <z_priority> no_icon = <no_icon> add_loading_anim = <add_loading_anim>
endscript

script build_theme_dialog_top 
	CreateScreenElement {
		Type = ContainerElement
		Dims = (0.0, 32.0)
		PARENT = <PARENT>
	}
	anchor_id = <Id>
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <anchor_id>
		texture = snaz_T_M
		Pos = (0.0, 0.0)
		just = [Center Top]
		rgba = <dialog_bg_rgba>
		Scale = ((1.0, 0.0) * <width> + (0.0, 1.0) * <Height>)
		z_priority = <z_priority>
	}
	<top_height> = <Height>
	GetScreenElementDims Id = <Id>
	right_pos = ((0.5, 0.0) * <width>)
	left_pos = ((-0.5, 0.0) * <width>)
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <anchor_id>
		texture = snaz_T_L
		Pos = <left_pos>
		just = [RIGHT Top]
		rgba = <dialog_bg_rgba>
		Scale = ((1.0, 0.0) + (0.0, 1.0) * <top_height>)
		z_priority = <z_priority>
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <anchor_id>
		texture = snaz_T_R
		Pos = <right_pos>
		just = [LEFT Top]
		rgba = <dialog_bg_rgba>
		Scale = ((1.0, 0.0) + (0.0, 1.0) * <top_height>)
		z_priority = <z_priority>
	}
endscript

script build_theme_dialog_middle \{scale_height = 1}
	CreateScreenElement {
		Type = ContainerElement
		PARENT = <PARENT>
		Dims = (0.0, 32.0)
	}
	anchor_id = <Id>
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <anchor_id>
		texture = snaz_M_M
		Pos = (0.0, 0.0)
		just = [Center Top]
		rgba = <dialog_bg_rgba>
		Scale = ((1.0, 0.0) * <width> + <scale_height> * (0.0, 1.0))
		z_priority = <z_priority>
	}
	GetScreenElementDims Id = <Id>
	right_pos = ((0.5, 0.0) * <width>)
	left_pos = ((-0.5, 0.0) * <width>)
	side_scale = ((1.0, 0.0) * 1 + <scale_height> * (0.0, 1.0))
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <anchor_id>
		texture = snaz_M_L
		Pos = <left_pos>
		just = [RIGHT Top]
		rgba = <dialog_bg_rgba>
		Scale = <side_scale>
		z_priority = <z_priority>
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <anchor_id>
		texture = snaz_M_R
		Pos = <right_pos>
		just = [LEFT Top]
		rgba = <dialog_bg_rgba>
		Scale = <side_scale>
		z_priority = <z_priority>
	}
endscript

script build_theme_dialog_bottom 
	CreateScreenElement {
		Type = ContainerElement
		PARENT = <PARENT>
		Dims = (0.0, 32.0)
	}
	anchor_id = <Id>
	Pos = ((0.0, -1.0) * (32 - (<scale_height> * 32)))
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <anchor_id>
		texture = snaz_B_M
		Pos = <Pos>
		just = [Center Top]
		rgba = <dialog_bg_rgba>
		Scale = ((1.0, 0.0) * <width> + (0.0, 1.0))
		z_priority = <z_priority>
	}
	GetScreenElementDims Id = <Id>
	right_pos = ((0.5, 0.0) * <width> + <Pos>)
	left_pos = ((-0.5, 0.0) * <width> + <Pos>)
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <anchor_id>
		texture = snaz_B_L
		Pos = <left_pos>
		just = [RIGHT Top]
		rgba = <dialog_bg_rgba>
		Scale = (1.0, 1.0)
		z_priority = <z_priority>
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <anchor_id>
		texture = snaz_B_R
		Pos = <right_pos>
		just = [LEFT Top]
		rgba = <dialog_bg_rgba>
		Scale = (1.0, 1.0)
		z_priority = <z_priority>
	}
	if NOT GotParam \{no_icon}
		FormatText ChecksumName = theme_icon '%i_snaz_icon' I = (THEME_PREFIXES [$current_theme_prefix])
		if GotParam \{add_loading_anim}
			loading_color = [128 123 20 255]
		else
			<loading_color> = [90 90 90 70]
		endif
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <anchor_id>
			texture = <theme_icon>
			Pos = ((0.0, 10.0) + <Pos>)
			just = [Center Center]
			rgba = <loading_color>
			Scale = (1.3, 1.3)
			z_priority = (<z_priority> + 1)
			Alpha = 0.7
		}
		if GotParam \{add_loading_anim}
			RunScriptOnScreenElement Id = <Id> spin_dialog_icon
		endif
	endif
endscript

script spin_dialog_icon 
	<Rot_Angle> = 0
	begin
	DoMorph Rot_Angle = <Rot_Angle>
	<Rot_Angle> = (<Rot_Angle> + 6)
	if (<Rot_Angle> > 360)
		<Rot_Angle> = (<Rot_Angle> - 360)
	endif
	Wait \{1
		GameFrames}
	repeat
endscript

script create_error_box \{delay_input_time = 1000}
	create_dialog_box <...> error_box
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
		font = text_A1
		PARENT = dialog_box_vmenu
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
	SetScreenElementLock \{Id = root_window
		OFF}
	SetScreenElementLock Id = <PARENT> OFF
	if NOT GotParam \{ignore_default_option}
		if (<Text> = "No")
			Id = no_button
		endif
	endif
	if (<destroy_on_event> = 1)
		<pad_choose_params> = {callBack_Script = <pad_choose_script> callback_params = <pad_choose_params>}
		<pad_choose_script> = button_choose_script
	else
	endif
	CreateScreenElement {
		Type = ContainerElement
		PARENT = <PARENT>
		Id = <Id>
		Dims = <button_dims>
		just = [Center Center]
		event_handlers =
		[
			{Focus <focus_script> Params = <focus_params>}
			{unfocus <unfocus_script> Params = <unfocus_params>}
			{pad_choose generic_menu_pad_choose_sound}
			{pad_start generic_menu_pad_choose_sound}
			{pad_choose <pad_choose_script> Params = <pad_choose_params>}
			{pad_start <pad_choose_script> Params = <pad_choose_params>}
		]
		<NOT_FOCUSABLE>
	}
	anchor_id = <Id>
	CreateScreenElement {
		Type = TextElement
		PARENT = <anchor_id>
		Pos = (0.0, 0.0)
		font = <font>
		Text = <Text>
		just = [Center Center]
		Scale = <button_text_scale>
		rgba = <text_color>
		z_priority = <z_priority>
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <anchor_id>
		texture = menu_selection_white_01
		Scale = (0.6, 0.5)
		rgba = [86 88 90 155]
		z_priority = (<z_priority> -1)
		local_id = Highlight_Bar
		Alpha = 0
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
	DeBounce \{X
		Time = 0.3}
	if ObjectExists Id = <anchor_id>
		DestroyScreenElement Id = <anchor_id>
	endif
	if NOT GotParam \{dont_focus}
		if ObjectExists \{Id = current_menu_anchor}
			LaunchEvent \{Type = Focus
				Target = current_menu_anchor}
		endif
	endif
endscript

script dialog_box_exit \{anchor_id = dialog_box_anchor}
	destroy_dialog_box <...>
	if NOT GotParam \{dont_restore_input}
		SetButtonEventMappings \{unblock_menu_input}
	endif
	DeBounce \{X
		Time = 0.3}
	if ObjectExists Id = <anchor_id>
		DestroyScreenElement Id = <anchor_id>
	endif
	if NOT GotParam \{no_pad_start}
		if NOT InFrontEnd
			restore_start_key_binding
		endif
	endif
endscript

script dialog_box_delay_input \{delay_input_time = 2000}
	TemporarilyDisableInput Time = <delay_input_time>
endscript
dont_create_speech_boxes = 0

script create_speech_box 
	KillSpawnedScript \{Id = create_speech_box_guts}
	SpawnScriptNow create_speech_box_guts Params = {<...>}
endscript

script create_speech_box_guts \{Pos = (640.0, 560.0)
		Bg_rgba = [
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
		PARENT = root_window
		bg_x_scale = 1.12
		pause_input_time = 1000}
	font = text_A1
	if ObjectExists Id = <anchor_id>
		DestroyScreenElement Id = <anchor_id>
	endif
	SetScreenElementLock \{Id = root_window
		OFF}
	CreateScreenElement {
		Type = ContainerElement
		PARENT = <PARENT>
		Id = <anchor_id>
		Pos = <Pos>
		just = [Center Bottom]
		Scale = <Scale>
		z_priority = <z_priority>
	}
	if NOT GotParam \{no_pad_choose}
		SetScreenElementProps {
			Id = <anchor_id>
			event_handlers = [{pad_choose speech_box_input_debounce}
				{pad_choose <pad_choose_script> Params = <pad_choose_params>}]
			Replace_Handlers
		}
	endif
	if GotParam \{pad_back_script}
		SetScreenElementProps {
			Id = <anchor_id>
			event_handlers = [{pad_back speech_box_input_debounce}
				{pad_back <pad_back_script> Params = <pad_back_params>}]
			Replace_Handlers
		}
	endif
	if GotParam \{pad_option_script}
		SetScreenElementProps {
			Id = <anchor_id>
			event_handlers = [
				{pad_option <pad_option_script> Params = <pad_option_params>}]
			Replace_Handlers
		}
	endif
	if GotParam \{pad_option2_script}
		SetScreenElementProps {
			Id = <anchor_id>
			event_handlers = [{pad_option2 speech_box_input_debounce}
				{pad_option2 <pad_option2_script> Params = <pad_option2_params>}]
			Replace_Handlers
		}
	endif
	if GotParam \{pad_up_script}
		SetScreenElementProps {
			Id = <anchor_id>
			event_handlers = [{pad_up <pad_up_script> Params = <pad_up_params>}]
			Replace_Handlers
		}
	endif
	if GotParam \{pad_down_script}
		SetScreenElementProps {
			Id = <anchor_id>
			event_handlers = [{pad_down <pad_down_script> Params = <pad_down_params>}]
			Replace_Handlers
		}
	endif
	if GotParam \{pad_left_script}
		SetScreenElementProps {
			Id = <anchor_id>
			event_handlers = [{PAD_LEFT <pad_left_script> Params = <pad_left_params>}]
			Replace_Handlers
		}
	endif
	if GotParam \{pad_right_script}
		SetScreenElementProps {
			Id = <anchor_id>
			event_handlers = [{pad_right <pad_right_script> Params = <pad_right_params>}]
			Replace_Handlers
		}
	endif
	if NOT GotParam \{no_pad_start}
		SetScreenElementProps {
			Id = root_window
			event_handlers = [{pad_start <pad_choose_script> Params = <pad_choose_params>}]
			Replace_Handlers
		}
	endif
	CreateScreenElement {
		Type = TextBlockElement
		PARENT = <anchor_id>
		font = <font>
		Dims = (540.0, 0.0)
		just = [Center Bottom]
		Text = <Text>
		rgba = <text_rgba>
		Scale = (0.5, 1.05)
		allow_expansion
	}
	<speech_text> = <Id>
	GetScreenElementDims Id = <speech_text>
	speech_text_height = <Height>
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <anchor_id>
		just = [Center Top]
		texture = dialog_frame_b
		Scale = ((1.0, 0.0) * <bg_x_scale> + (0.0, 1.0))
		rgba = <Bg_rgba>
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <anchor_id>
		Pos = ((0.0, -1.0) * <speech_text_height>)
		just = [Center Bottom]
		texture = dialog_frame
		Scale = ((1.0, 0.0) * <bg_x_scale> + (0.0, 1.0))
		rgba = <Bg_rgba>
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <anchor_id>
		texture = dialog_middle
		Scale = (((1.0, 0.0) * <bg_x_scale>) + ((0.0, 1.0) * (<speech_text_height> / 16.0)))
		just = [Center Bottom]
		rgba = <Bg_rgba>
	}
	GetScreenElementProps Id = <Id>
	pos_top = (<Pos> [1])
	if GotParam \{style}
		RunScriptOnScreenElement Id = <anchor_id> <style> Params = <...>
	endif
	LaunchEvent Type = Focus Target = <anchor_id>
	if GotParam \{pause_input}
		SpawnScriptLater TemporarilyDisableInput Params = {Time = <pause_input_time>}
	endif
endscript

script speech_box_exit \{anchor_id = speech_box_anchor}
	if ObjectExists Id = <anchor_id>
		DestroyScreenElement Id = <anchor_id>
	endif
	DeBounce \{X
		Time = 0.3}
	DeBounce \{CIRCLE
		Time = 0.3}
	if NOT GotParam \{no_pad_start}
		restore_start_key_binding
	endif
	LaunchEvent \{Type = speech_box_destroyed}
endscript

script speech_box_input_debounce 
	DeBounce \{X
		Time = 0.3
		CLEAR = 1}
	DeBounce \{CIRCLE
		Time = 0.3
		CLEAR = 1}
	DeBounce \{SQUARE
		Time = 0.3
		CLEAR = 1}
	DeBounce \{TRIANGLE
		Time = 0.3
		CLEAR = 1}
endscript

script speech_box_style 
	RunScriptOnScreenElement Id = <speech_text> hide_speech_text Params = <...>
	DoMorph \{Time = 0
		Scale = (1.0, 1.0)
		Alpha = 1}
	Wait \{4
		Frame}
	DoMorph \{Time = 0.2
		Scale = (1.0, 1.0)
		Alpha = 1}
	RunScriptOnScreenElement Id = <speech_text> speech_box_style_scale_text Params = <...>
endscript

script hide_speech_text 
	DoMorph \{Time = 0
		Scale = 0}
endscript

script speech_box_style_scale_text 
	Wait \{0.05
		Second}
	DoMorph \{Time = 0
		Scale = (1.0, 1.0)
		Alpha = 0}
	DoMorph \{Time = 0.5
		Scale = (1.0, 1.0)
		Alpha = 1}
	LaunchEvent Type = Focus Target = <anchor_id>
endscript

script animate_dialog_box_in 
	if GotParam \{full_animate}
		SetScreenElementProps {
			Id = <bg_anchor_id>
			Hide
		}
	endif
	if NOT GotParam \{delay_input}
		<bg_anchor_id> :Obj_SpawnScriptLater dialog_box_delay_input Params = {delay_input_time = 300}
	endif
	DoMorph \{Time = 0
		Scale = (0.0, 0.0)
		Alpha = 0.1}
	DoMorph \{Time = 0.15
		Scale = (1.0, 0.0)
		Alpha = 0.4}
	DoMorph \{Time = 0.15
		Scale = (1.0, 1.0)
		Alpha = 1.0}
	if GotParam \{full_animate}
		SetScreenElementProps {
			Id = <bg_anchor_id>
			UnHide
		}
	endif
endscript

script create_test_dialog 
	if ScreenElementExists \{Id = current_menu_anchor}
		DestroyScreenElement \{Id = current_menu_anchor}
	endif
	create_dialog_box \{pad_back_script = create_test_menu
		buttons = [
			{
				font = text_A1
				Text = "No"
				pad_choose_script = create_test_menu
			}
			{
				font = text_A1
				Text = "Yes"
				pad_choose_script = null_script
			}
		]}
endscript

script dialog_box_accept 
	dialog_box_exit
	LaunchEvent \{Type = message_accept}
endscript
