
script create_UI_frame \{frame_dims = (300.0, 500.0)
		check_side_swap = 1
		center_pos = (640.0, 360.0)
		parent = root_window
		frame_rgba = [
			255
			255
			255
			255
		]
		fill_rgba = [
			0
			0
			0
			255
		]
		z_priority = 100
		offset_top = 32
		offset_side = 32
		min_fill_pad_width = 73
		min_fill_pad_height = 129
		tex_param = 'simple'
		suffix = 0}
	FormatText checksumname = cont_id 'frame_container_%i' i = <suffix>
	if ScreenElementExists id = <cont_id>
		DestroyScreenElement id = <cont_id>
	endif
	FormatText checksumname = ui_frame_corner_TL 'frame_%t_corner_TL' t = <tex_param>
	FormatText checksumname = ui_frame_corner_TL_fill 'frame_%t_corner_TL_fill' t = <tex_param>
	FormatText checksumname = ui_frame_side_T 'frame_%t_side_T' t = <tex_param>
	FormatText checksumname = ui_frame_side_T_fill 'frame_%t_side_T_fill' t = <tex_param>
	FormatText checksumname = ui_frame_side_L 'frame_%t_side_L' t = <tex_param>
	FormatText checksumname = ui_frame_side_L_fill 'frame_%t_side_L_fill' t = <tex_param>
	FormatText checksumname = frame_corner_TL 'frame_corner_TL_%s' s = <suffix>
	FormatText checksumname = frame_corner_TR 'frame_corner_TR_%s' s = <suffix>
	FormatText checksumname = frame_corner_BL 'frame_corner_BL_%s' s = <suffix>
	FormatText checksumname = frame_corner_BR 'frame_corner_BR_%s' s = <suffix>
	FormatText checksumname = frame_corner_TL_fill 'frame_corner_TL_fill_%s' s = <suffix>
	FormatText checksumname = frame_corner_TR_fill 'frame_corner_TR_fill_%s' s = <suffix>
	FormatText checksumname = frame_corner_BL_fill 'frame_corner_BL_fill_%s' s = <suffix>
	FormatText checksumname = frame_corner_BR_fill 'frame_corner_BR_fill_%s' s = <suffix>
	FormatText checksumname = frame_fill_center 'frame_fill_center_%s' s = <suffix>
	<need_swap> = 0
	CreateScreenElement {
		type = ContainerElement
		parent = <parent>
		id = <cont_id>
		just = [center center]
		Pos = <center_pos>
		z_priority = <z_priority>
		child_anchor = [center center]
	}
	CreateScreenElement {
		type = SpriteElement
		parent = <cont_id>
		texture = <ui_frame_corner_TL>
		id = <frame_corner_TL>
		just = [right bottom]
		Pos = (0.0, 0.0)
		rgba = <frame_rgba>
		z_priority = <z_priority>
	}
	CreateScreenElement {
		type = SpriteElement
		parent = <cont_id>
		texture = <ui_frame_corner_TL_fill>
		id = <frame_corner_TL_fill>
		just = [right bottom]
		Pos = (0.0, 0.0)
		rgba = <fill_rgba>
		z_priority = (<z_priority> - 1)
	}
	CreateScreenElement {
		type = SpriteElement
		parent = <cont_id>
		texture = <ui_frame_corner_TL>
		id = <frame_corner_TR>
		just = [left bottom]
		Pos = (0.0, 0.0)
		rgba = <frame_rgba>
		z_priority = <z_priority>
		flip_v
	}
	CreateScreenElement {
		type = SpriteElement
		parent = <cont_id>
		texture = <ui_frame_corner_TL_fill>
		id = <frame_corner_TR_fill>
		just = [left bottom]
		Pos = (0.0, 0.0)
		rgba = <fill_rgba>
		z_priority = (<z_priority> - 1)
		flip_v
	}
	CreateScreenElement {
		type = SpriteElement
		parent = <cont_id>
		texture = <ui_frame_corner_TL>
		id = <frame_corner_BL>
		just = [right top]
		Pos = (0.0, 0.0)
		rgba = <frame_rgba>
		z_priority = <z_priority>
		flip_h
	}
	CreateScreenElement {
		type = SpriteElement
		parent = <cont_id>
		texture = <ui_frame_corner_TL_fill>
		id = <frame_corner_BL_fill>
		just = [right top]
		Pos = (0.0, 0.0)
		rgba = <fill_rgba>
		z_priority = (<z_priority> - 1)
		flip_h
	}
	CreateScreenElement {
		type = SpriteElement
		parent = <cont_id>
		texture = <ui_frame_corner_TL>
		id = <frame_corner_BR>
		just = [left top]
		Pos = (0.0, 0.0)
		rgba = <frame_rgba>
		z_priority = <z_priority>
		flip_v
		flip_h
	}
	CreateScreenElement {
		type = SpriteElement
		parent = <cont_id>
		texture = <ui_frame_corner_TL_fill>
		id = <frame_corner_BR_fill>
		just = [left top]
		Pos = (0.0, 0.0)
		rgba = <fill_rgba>
		z_priority = (<z_priority> - 1)
		flip_v
		flip_h
	}
	GetScreenElementDims id = <id>
	min_width = (<width> * 2.0)
	min_height = (<height> * 2.0)
	frame_width = (<frame_dims>.(1.0, 0.0))
	frame_height = (<frame_dims>.(0.0, 1.0))
	if (<frame_width> < <min_width>)
		<frame_width> = <min_width>
	endif
	if (<frame_height> < <min_height>)
		<frame_height> = <min_height>
	endif
	CastToInteger \{frame_width}
	Mod a = <frame_width> b = 2
	if NOT (<Mod> = 0)
		<frame_width> = (<frame_width> + 1)
	endif
	CastToInteger \{frame_height}
	Mod a = <frame_height> b = 2
	if NOT (<Mod> = 0)
		<frame_height> = (<frame_height> + 1)
	endif
	pos_top = (<offset_top> * (0.0, -1.0))
	pos_bottom = (<offset_top> * (0.0, 1.0))
	width_tops = ((<frame_width> / 2.0) - (<min_width> / 2.0))
	pos_left = (<offset_side> * (-1.0, 0.0))
	pos_right = (<offset_side> * (1.0, 0.0))
	height_side = ((<frame_height> / 2.0) - (<min_height> / 2.0))
	CreateScreenElement {
		type = SpriteElement
		parent = <cont_id>
		id = <frame_fill_center>
		texture = white
		just = [center center]
		Pos = (0.0, 0.0)
		rgba = <fill_rgba>
		z_priority = (<z_priority> - 1)
	}
	if ((<frame_dims>.(1.0, 0.0)) > (<min_width>))
		<frame_corner_TL> :SetProps Pos = (<width_tops> * (-1.0, 0.0))
		<frame_corner_TR> :SetProps Pos = (<width_tops> * (1.0, 0.0))
		<frame_corner_BL> :SetProps Pos = (<width_tops> * (-1.0, 0.0))
		<frame_corner_BR> :SetProps Pos = (<width_tops> * (1.0, 0.0))
		if IsPS3
			<frame_corner_TL_fill> :SetProps Pos = ((<width_tops> * (-1.0, 0.0)) + (0.0, -0.5))
			<frame_corner_TR_fill> :SetProps Pos = ((<width_tops> * (1.0, 0.0)) + (-0.5, -0.5))
			<frame_corner_BL_fill> :SetProps Pos = ((<width_tops> * (-1.0, 0.0)) + (0.0, 0.5))
			<frame_corner_BR_fill> :SetProps Pos = ((<width_tops> * (1.0, 0.0)) + (-0.5, 0.5))
		else
			<frame_corner_TL_fill> :SetProps Pos = ((<width_tops> * (-1.0, 0.0)) - (0.5, 0.5))
			<frame_corner_TR_fill> :SetProps Pos = ((<width_tops> * (1.0, 0.0)) - (0.5, 0.5))
			<frame_corner_BL_fill> :SetProps Pos = ((<width_tops> * (-1.0, 0.0)) - (0.5, 0.5))
			<frame_corner_BR_fill> :SetProps Pos = ((<width_tops> * (1.0, 0.0)) - (0.5, 0.5))
		endif
		CreateScreenElement {
			type = SpriteElement
			parent = <cont_id>
			texture = <ui_frame_side_T>
			just = [right bottom]
			Pos = (0.0, 0.0)
			rgba = <frame_rgba>
			z_priority = <z_priority>
		}
		scale_element_to_size id = <id> target_width = <width_tops>
		<id> :SetProps Pos = (<pos_top> + (<height_side> * (0.0, -1.0)))
		CreateScreenElement {
			type = SpriteElement
			parent = <cont_id>
			texture = <ui_frame_side_T_fill>
			just = [right bottom]
			Pos = (0.0, 0.0)
			rgba = <fill_rgba>
			z_priority = (<z_priority> - 1)
		}
		scale_element_to_size id = <id> target_width = <width_tops>
		<id> :SetProps Pos = (<pos_top> + (<height_side> * (0.0, -1.0)))
		CreateScreenElement {
			type = SpriteElement
			parent = <cont_id>
			texture = <ui_frame_side_T>
			just = [left bottom]
			Pos = (0.0, 0.0)
			rgba = <frame_rgba>
			z_priority = <z_priority>
			flip_v
		}
		scale_element_to_size id = <id> target_width = <width_tops>
		<id> :SetProps Pos = (<pos_top> + (<height_side> * (0.0, -1.0)))
		CreateScreenElement {
			type = SpriteElement
			parent = <cont_id>
			texture = <ui_frame_side_T_fill>
			just = [left bottom]
			Pos = (0.0, 0.0)
			rgba = <fill_rgba>
			z_priority = (<z_priority> - 1)
			flip_v
		}
		scale_element_to_size id = <id> target_width = <width_tops>
		<id> :SetProps Pos = (<pos_top> + (<height_side> * (0.0, -1.0)))
		CreateScreenElement {
			type = SpriteElement
			parent = <cont_id>
			texture = <ui_frame_side_T>
			just = [right top]
			Pos = <pos_bottom>
			rgba = <frame_rgba>
			z_priority = <z_priority>
			flip_h
		}
		scale_element_to_size id = <id> target_width = <width_tops>
		<id> :SetProps Pos = ((-1 * <pos_top>) + (<height_side> * (0.0, 1.0)))
		CreateScreenElement {
			type = SpriteElement
			parent = <cont_id>
			texture = <ui_frame_side_T_fill>
			just = [right top]
			Pos = <pos_bottom>
			rgba = <fill_rgba>
			z_priority = (<z_priority> - 1)
			flip_h
		}
		scale_element_to_size id = <id> target_width = <width_tops>
		<id> :SetProps Pos = ((-1 * <pos_top>) + (<height_side> * (0.0, 1.0)))
		CreateScreenElement {
			type = SpriteElement
			parent = <cont_id>
			texture = <ui_frame_side_T>
			just = [left top]
			Pos = <pos_bottom>
			rgba = <frame_rgba>
			z_priority = <z_priority>
			flip_v
			flip_h
		}
		scale_element_to_size id = <id> target_width = <width_tops>
		<id> :SetProps Pos = ((-1 * <pos_top>) + (<height_side> * (0.0, 1.0)))
		CreateScreenElement {
			type = SpriteElement
			parent = <cont_id>
			texture = <ui_frame_side_T_fill>
			just = [left top]
			Pos = <pos_bottom>
			rgba = <fill_rgba>
			z_priority = (<z_priority> - 1)
			flip_v
			flip_h
		}
		scale_element_to_size id = <id> target_width = <width_tops>
		<id> :SetProps Pos = ((-1 * <pos_top>) + (<height_side> * (0.0, 1.0)))
	endif
	if ((<frame_dims>.(0.0, 1.0)) > (<min_height>))
		GetScreenElementProps id = <frame_corner_TL>
		X_TL = (<Pos>.(1.0, 0.0))
		GetScreenElementProps id = <frame_corner_TR>
		X_TR = (<Pos>.(1.0, 0.0))
		GetScreenElementProps id = <frame_corner_BL>
		X_BL = (<Pos>.(1.0, 0.0))
		GetScreenElementProps id = <frame_corner_BR>
		X_BR = (<Pos>.(1.0, 0.0))
		<frame_corner_TL> :SetProps Pos = (<height_side> * (0.0, -1.0) + (<X_TL> * (1.0, 0.0)))
		<frame_corner_TR> :SetProps Pos = (<height_side> * (0.0, -1.0) + (<X_TR> * (1.0, 0.0)))
		<frame_corner_BL> :SetProps Pos = (<height_side> * (0.0, 1.0) + (<X_BL> * (1.0, 0.0)))
		<frame_corner_BR> :SetProps Pos = (<height_side> * (0.0, 1.0) + (<X_BR> * (1.0, 0.0)))
		if IsPS3
			<frame_corner_TL_fill> :SetProps Pos = ((<height_side> * (0.0, -1.0) + (<X_TL> * (1.0, 0.0))) + (0.0, -0.5))
			<frame_corner_TR_fill> :SetProps Pos = ((<height_side> * (0.0, -1.0) + (<X_TR> * (1.0, 0.0))) + (-0.5, -0.5))
			<frame_corner_BL_fill> :SetProps Pos = ((<height_side> * (0.0, 1.0) + (<X_BL> * (1.0, 0.0))) + (0.0, 0.5))
			<frame_corner_BR_fill> :SetProps Pos = ((<height_side> * (0.0, 1.0) + (<X_BR> * (1.0, 0.0))) + (-0.5, 0.5))
		else
			<frame_corner_TL_fill> :SetProps Pos = ((<height_side> * (0.0, -1.0) + (<X_TL> * (1.0, 0.0))) - (0.5, 0.5))
			<frame_corner_TR_fill> :SetProps Pos = ((<height_side> * (0.0, -1.0) + (<X_TR> * (1.0, 0.0))) - (0.5, 0.5))
			<frame_corner_BL_fill> :SetProps Pos = ((<height_side> * (0.0, 1.0) + (<X_BL> * (1.0, 0.0))) - (0.5, 0.5))
			<frame_corner_BR_fill> :SetProps Pos = ((<height_side> * (0.0, 1.0) + (<X_BR> * (1.0, 0.0))) - (0.5, 0.5))
		endif
		CreateScreenElement {
			type = SpriteElement
			parent = <cont_id>
			texture = <ui_frame_side_L>
			just = [right bottom]
			Pos = <pos_left>
			rgba = <frame_rgba>
			z_priority = <z_priority>
		}
		scale_element_to_size id = <id> target_height = <height_side>
		<id> :SetProps Pos = (<pos_left> - (<width_tops> * (1.0, 0.0)))
		CreateScreenElement {
			type = SpriteElement
			parent = <cont_id>
			texture = <ui_frame_side_L_fill>
			just = [right bottom]
			Pos = <pos_left>
			rgba = <fill_rgba>
			z_priority = (<z_priority> - 1)
		}
		scale_element_to_size id = <id> target_height = <height_side>
		<id> :SetProps Pos = (<pos_left> - (<width_tops> * (1.0, 0.0)))
		CreateScreenElement {
			type = SpriteElement
			parent = <cont_id>
			texture = <ui_frame_side_L>
			just = [left bottom]
			Pos = <pos_left>
			rgba = <frame_rgba>
			z_priority = <z_priority>
			flip_v
		}
		scale_element_to_size id = <id> target_height = <height_side>
		<id> :SetProps Pos = ((-1 * <pos_left>) + (<width_tops> * (1.0, 0.0)))
		CreateScreenElement {
			type = SpriteElement
			parent = <cont_id>
			texture = <ui_frame_side_L_fill>
			just = [left bottom]
			Pos = <pos_left>
			rgba = <fill_rgba>
			z_priority = (<z_priority> - 1)
			flip_v
		}
		scale_element_to_size id = <id> target_height = <height_side>
		<id> :SetProps Pos = ((-1 * <pos_left>) + (<width_tops> * (1.0, 0.0)))
		CreateScreenElement {
			type = SpriteElement
			parent = <cont_id>
			texture = <ui_frame_side_L>
			just = [right top]
			Pos = <pos_right>
			rgba = <frame_rgba>
			z_priority = <z_priority>
			flip_h
		}
		scale_element_to_size id = <id> target_height = <height_side>
		<id> :SetProps Pos = (<pos_left> + (<width_tops> * (-1.0, 0.0)))
		CreateScreenElement {
			type = SpriteElement
			parent = <cont_id>
			texture = <ui_frame_side_L_fill>
			just = [right top]
			Pos = <pos_right>
			rgba = <fill_rgba>
			z_priority = (<z_priority> - 1)
			flip_h
		}
		scale_element_to_size id = <id> target_height = <height_side>
		<id> :SetProps Pos = (<pos_left> + (<width_tops> * (-1.0, 0.0)))
		CreateScreenElement {
			type = SpriteElement
			parent = <cont_id>
			texture = <ui_frame_side_L>
			just = [left top]
			Pos = <pos_right>
			rgba = <frame_rgba>
			z_priority = <z_priority>
			flip_v
			flip_h
		}
		scale_element_to_size id = <id> target_height = <height_side>
		<id> :SetProps Pos = ((-1 * <pos_left>) + (<width_tops> * (1.0, 0.0)))
		CreateScreenElement {
			type = SpriteElement
			parent = <cont_id>
			texture = <ui_frame_side_L_fill>
			just = [left top]
			Pos = <pos_right>
			rgba = <fill_rgba>
			z_priority = (<z_priority> - 1)
			flip_v
			flip_h
		}
		scale_element_to_size id = <id> target_height = <height_side>
		<id> :SetProps Pos = ((-1 * <pos_left>) + (<width_tops> * (1.0, 0.0)))
	endif
	if (((<frame_dims>.(0.0, 1.0)) > (<min_height>)) && ((<frame_dims>.(1.0, 0.0)) > (<min_width>)))
		fill_center_width = ((<width_tops> * 2.0) + (<offset_side> * 2.0))
		fill_center_height = ((<height_side> * 2) + (<offset_top> * 2))
		scale_element_to_size id = <frame_fill_center> target_width = <fill_center_width> target_height = <fill_center_height>
	elseif (((<frame_dims>.(0.0, 1.0)) > (<min_height>)) && ((<frame_dims>.(1.0, 0.0)) <= (<min_width>)))
		fill_center_height = ((<height_side> * 2) + (<offset_top> * 2))
		fill_center_width = ((<min_width> - <min_fill_pad_width>) - 1)
		scale_element_to_size id = <frame_fill_center> target_width = <fill_center_width> target_height = <fill_center_height>
	elseif (((<frame_dims>.(0.0, 1.0)) <= (<min_height>)) && ((<frame_dims>.(1.0, 0.0)) > (<min_width>)))
		fill_center_width = ((<width_tops> * 2.0) + (<offset_side> * 2.0))
		fill_center_height = ((<min_height> - <min_fill_pad_height>) - 1)
		scale_element_to_size id = <frame_fill_center> target_width = <fill_center_width> target_height = <fill_center_height>
	else
		fill_center_width = ((<min_width> - <min_fill_pad_width>) - 1)
		fill_center_height = ((<min_height> - <min_fill_pad_height>) - 1)
		scale_element_to_size id = <frame_fill_center> target_width = <fill_center_width> target_height = <fill_center_height>
		GetScreenElementProps id = <frame_corner_TL>
		X_TL = (<Pos>.(1.0, 1.0))
		GetScreenElementProps id = <frame_corner_TR>
		X_TR = (<Pos>.(1.0, 1.0))
		GetScreenElementProps id = <frame_corner_BL>
		X_BL = (<Pos>.(1.0, 1.0))
		GetScreenElementProps id = <frame_corner_BR>
		X_BR = (<Pos>.(1.0, 1.0))
		if IsPS3
			<frame_corner_TL_fill> :SetProps Pos = ((<X_TL> * (1.0, 0.0)) + (0.0, -0.5))
			<frame_corner_TR_fill> :SetProps Pos = ((<X_TR> * (1.0, 0.0)) + (-0.5, -0.5))
			<frame_corner_BL_fill> :SetProps Pos = ((<X_BL> * (1.0, 0.0)) + (0.0, 0.5))
			<frame_corner_BR_fill> :SetProps Pos = ((<X_BR> * (1.0, 0.0)) + (-0.5, 0.5))
		else
			<frame_corner_TL_fill> :SetProps Pos = ((<X_TL> * (1.0, 0.0)) - (0.5, 0.5))
			<frame_corner_TR_fill> :SetProps Pos = ((<X_TR> * (1.0, 0.0)) - (0.5, 0.5))
			<frame_corner_BL_fill> :SetProps Pos = ((<X_BL> * (1.0, 0.0)) - (0.5, 0.5))
			<frame_corner_BR_fill> :SetProps Pos = ((<X_BR> * (1.0, 0.0)) - (0.5, 0.5))
		endif
	endif
	if (<need_swap>)
		wait \{2
			seconds}
		<cont_id> :SetProps rot_angle = 90 time = 5
	endif
	return id = <cont_id>
endscript

script do_ui_frame_morph {
		start_dims = (0.0, 0.0)
		end_dims = (300.0, 500.0)
		start_pos = (0.0, 0.0)
		end_pos = (640.0, 360.0)
		frame_rgba = (($g_menu_colors).frame_rgba)
		fill_rgba = (($g_menu_colors).fill_rgba)
		frames = 10
		parent = root_window
		z_priority = 0
		suffix = 0
	}
	<float_frames> = (<frames> * 1.0)
	<x_dims_diff> = (((<end_dims>.(1.0, 0.0)) - (<start_dims>.(1.0, 0.0))) / <float_frames>)
	<y_dims_diff> = (((<end_dims>.(0.0, 1.0)) - (<start_dims>.(0.0, 1.0))) / <float_frames>)
	<x_pos_diff> = (((<end_pos>.(1.0, 0.0)) - (<start_pos>.(1.0, 0.0))) / <float_frames>)
	<y_pos_diff> = (((<end_pos>.(0.0, 1.0)) - (<start_pos>.(0.0, 1.0))) / <float_frames>)
	<i> = 1
	begin
	frame_dims = (<start_dims> + (((<x_dims_diff> * (1.0, 0.0)) + (<y_dims_diff> * (0.0, 1.0))) * <i>))
	center_pos = (<start_pos> + (((<x_pos_diff> * (1.0, 0.0)) + (<y_pos_diff> * (0.0, 1.0))) * <i>))
	create_UI_frame {
		parent = <parent>
		frame_dims = <frame_dims>
		center_pos = <center_pos>
		frame_rgba = <frame_rgba>
		fill_rgba = <fill_rgba>
		z_priority = <z_priority>
		suffix = <suffix>
	}
	<i> = (<i> + 1)
	wait \{1
		frame}
	repeat <frames>
endscript

script random_ui_frame_morph_test 
	<start_dims> = (280.0, 600.0)
	<start_pos> = (640.0, 200.0)
	begin
	GetRandomValue \{name = frames
		a = 60
		b = 240
		integer}
	GetRandomValue \{name = rand_x_dims
		a = 256
		b = 600
		integer}
	GetRandomValue \{name = rand_y_dims
		a = 256
		b = 600
		integer}
	GetRandomValue \{name = rand_x_pos
		a = 340
		b = 940
		integer}
	GetRandomValue \{name = rand_y_pos
		a = 180
		b = 580
		integer}
	if (<rand_x_dims> > <rand_y_dims>)
		<temp> = <rand_x_dims>
		<rand_x_dims> = <rand_y_dims>
		<rand_y_dims> = <temp>
	endif
	<end_dims> = ((<rand_x_dims> * (1.0, 0.0)) + (<rand_y_dims> * (0.0, 1.0)))
	<end_pos> = ((<rand_x_pos> * (1.0, 0.0)) + (<rand_y_pos> * (0.0, 1.0)))
	do_ui_frame_morph {
		start_dims = <start_dims>
		end_dims = <end_dims>
		start_pos = <start_pos>
		end_pos = <end_pos>
		frames = <frames>
	}
	wait \{1
		frame}
	<start_dims> = <end_dims>
	<start_pos> = <end_pos>
	repeat
endscript

script create_wide_ui_frame 
	if ScreenElementExists \{id = dummy_white}
		DestroyScreenElement \{id = dummy_white}
	endif
	CreateScreenElement {
		type = SpriteElement
		id = dummy_white
		parent = root_window
		just = [left top]
		Pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		texture = white
		rgba = (($g_menu_colors).white)
		z_priority = 0
	}
	create_UI_frame {
		frame_dims = (700.0, 300.0)
		frame_rgba = (($g_menu_colors).frame_rgba)
		fill_rgba = (($g_menu_colors).fill_rgba)
	}
endscript

script create_gamertag_frame \{parent = root_window
		text_width = 100
		text_height = 50
		rgba = [
			0
			0
			0
			70
		]
		player = 1
		Pos = (0.0, 0.0)
		z = 0}
	vfudge = -2
	dims = ((<text_width> * (1.0, 0.0)) + (<text_height> * (0.0, 1.0)))
	if (<player> = 1)
		offset = ((<text_width> * (0.5, 0.0)) + (<text_height> * (0.0, 0.5)) + (<vfudge> * (0.0, 1.0)))
	else
		offset = ((<text_width> * (-0.5, 0.0)) + (<text_height> * (0.0, 0.5)) + (<vfudge> * (0.0, 1.0)))
	endif
	CreateScreenElement {
		type = ContainerElement
		parent = <parent>
		Pos = ((0.0, 0.0) + <Pos> + <offset>)
		z_priority = <z>
	}
	gamerframe_container = <id>
	CreateScreenElement {
		type = SpriteElement
		parent = <gamerframe_container>
		texture = control_pill_body
		Pos = (0.0, 0.0)
		just = [center center]
		dims = <dims>
		rgba = <rgba>
	}
	CreateScreenElement {
		type = SpriteElement
		parent = <gamerframe_container>
		texture = control_pill_end
		Pos = ((0.0, 0.0) + (<text_width> * (0.5, 0.0)))
		just = [left center]
		dims = ((16.0, 0.0) + (<text_height> * (0.0, 1.0)))
		rgba = <rgba>
	}
	CreateScreenElement {
		type = SpriteElement
		parent = <gamerframe_container>
		texture = control_pill_end
		Pos = ((0.0, 0.0) - (<text_width> * (0.5, 0.0)))
		just = [right center]
		dims = ((16.0, 0.0) + (<text_height> * (0.0, 1.0)))
		rgba = <rgba>
		flip_v
	}
endscript
