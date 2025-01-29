wii_bar_graph_bar_dims = (500.0, 40.0)
wii_bar_graph_bar_bg_color = [
	255
	255
	255
	255
]
wii_bar_graph_text_padding = 5
wii_bar_graph_text_offset = (0.0, -2.0)
wii_bar_graph_bar_spacing = 5
wii_bar_graph_bar_peak_dims = (5.0, 25.0)
wii_bar_graph_text_column_width = 75
wii_bar_graph_column_current_point = 0.45000002
wii_bar_graph_column_peak_point = 0.65000004
wii_bar_graph_column_total_point = 0.85
wii_bar_graph_heading_color = [
	255
	255
	255
	255
]
wii_bar_graph_bar_count = 0

script wii_bar_graph_create \{alpha = 1.0
		z = 5000
		units = None
		start_bar = 0}
	RequireParams \{[
			bar_params
		]
		all}
	wii_bar_graph_destroy
	CreateScreenElement {
		Type = ContainerElement
		id = bar_graph
		parent = root_window
		Pos = (0.0, 0.0)
		just = [left top]
		internal_just = [left top]
		z_priority = <z>
	}
	if NOT GotParam \{bar_count}
		GetArraySize <bar_params>
		bar_count = <array_Size>
	endif
	total_height = ((<bar_count> * $wii_bar_graph_bar_dims [1]) + ((<bar_count> - 1) * $wii_bar_graph_bar_spacing))
	current_y = (360 - (<total_height> / 2))
	bar = <start_bar>
	CreateScreenElement {
		Type = SpriteElement
		parent = bar_graph
		texture = white
		dims = (520.0, 590.0)
		just = [center center]
		rgba = [32 32 32 192]
		Pos = (640.0, 330.0)
		z_priority = <z>
	}
	begin
	bar_pos = (640.0, 0.0)
	setpaircomponents bar_pos y = <current_y>
	formatText checksumName = bar_id 'bar_%b' b = <bar>
	wii_bar_graph_create_bar bar_id = <bar_id> Pos = <bar_pos> alpha = <alpha> units = <units> (<bar_params> [<bar>])
	<current_y> = (<current_y> + $wii_bar_graph_bar_dims [1] + $wii_bar_graph_bar_spacing)
	<bar> = (<bar> + 1)
	repeat <bar_count>
	heading_pos = (640.0, 0.0)
	setpaircomponents {
		heading_pos
		y = (360 - (<total_height> / 2) - $wii_bar_graph_bar_spacing - ($wii_bar_graph_bar_dims [1] / 2))
	}
	CreateScreenElement {
		Type = ContainerElement
		id = bar_graph_headings
		parent = bar_graph
		Pos = <heading_pos>
		just = [center center]
		internal_just = [center center]
	}
	wii_bar_graph_create_column_text {
		parent_id = bar_graph_headings
		text = qs(0x5004318b)
		font = title_a1
		Point = $wii_bar_graph_column_current_point
		Color = $wii_bar_graph_heading_color
		y_pos = <heading_y>
	}
	wii_bar_graph_create_column_text {
		parent_id = bar_graph_headings
		text = qs(0x034b08bc)
		font = title_a1
		Point = $wii_bar_graph_column_peak_point
		Color = $wii_bar_graph_heading_color
		y_pos = <heading_y>
	}
	wii_bar_graph_create_column_text {
		parent_id = bar_graph_headings
		text = qs(0xbeeaa53a)
		font = title_a1
		Point = $wii_bar_graph_column_total_point
		Color = $wii_bar_graph_heading_color
		y_pos = <heading_y>
	}
endscript

script wii_bar_graph_destroy 
	if ScreenElementExists \{id = bar_graph}
		DestroyScreenElement \{id = bar_graph}
	endif
	Change \{wii_bar_graph_bar_count = 0}
endscript

script wii_bar_graph_create_bar 
	RequireParams \{[
			bar_id
			Pos
			current
			total
			alpha
			units
		]
		all}
	margin = (<total> * 0.05)
	if (<current> > <total>)
		fill_color = [128 0 0 255]
	else
		if ((<current> + <margin>) > <total>)
			fill_color = [128 128 0 255]
		else
			fill_color = [0 128 0 255]
		endif
	endif
	if (<peak> > <total>)
		text_color = [255 0 0 255]
	else
		if ((<peak> + <margin>) > <total>)
			text_color = [255 255 0 255]
		else
			text_color = [0 255 0 255]
		endif
	endif
	CreateScreenElement {
		Type = ContainerElement
		id = <bar_id>
		parent = bar_graph
		Pos = <Pos>
		just = [center center]
		internal_just = [center center]
	}
	if (<total> = 0)
		bar_width = 0
	else
		bar_width = ((<current> / (<total> * 1.0)) * $wii_bar_graph_bar_dims [0])
	endif
	bar_dims = (0.0, 0.0)
	bar_pos = (0.0, 0.0)
	setpaircomponents bar_dims X = <bar_width> y = ($wii_bar_graph_bar_dims [1] / 2)
	setpaircomponents bar_pos X = ($wii_bar_graph_bar_dims [0] / -2)
	CreateScreenElement {
		Type = SpriteElement
		local_id = fill
		parent = <bar_id>
		Pos = <bar_pos>
		just = [left top]
		texture = white
		dims = <bar_dims>
		rgba = <fill_color>
		relative_z_priority = 5
		alpha = <alpha>
	}
	if GotParam \{over}
		if (<over> > 0)
			if (<total> = 0)
				bar_over_width = 0
			else
				bar_over_width = ((<over> / (<total> * 1.0)) * $wii_bar_graph_bar_dims [0])
			endif
			bar_over_dims = (0.0, 0.0)
			bar_over_pos = (0.0, 0.0)
			setpaircomponents bar_over_dims X = <bar_over_width> y = ($wii_bar_graph_bar_dims [1] / 2)
			setpaircomponents bar_over_pos X = ($wii_bar_graph_bar_dims [0] / 2)
			CreateScreenElement {
				Type = SpriteElement
				local_id = over
				parent = <bar_id>
				Pos = <bar_over_pos>
				just = [left top]
				texture = white
				dims = <bar_over_dims>
				rgba = [128 0 128 255]
				relative_z_priority = 5
				alpha = <alpha>
			}
			<current> = (<current> + 1)
		endif
	endif
	if GotParam \{text}
		text_dims = (0.0, 0.0)
		text_pos = (0.0, 0.0)
		setpaircomponents {
			text_dims
			X = ($wii_bar_graph_bar_dims [0] - ($wii_bar_graph_text_padding * 2))
			y = ($wii_bar_graph_bar_dims [1] / 2)
		}
		setpaircomponents text_pos X = ((<text_dims> [0] / -2))
		<text_pos> = (<text_pos> + $wii_bar_graph_text_offset)
		CreateScreenElement {
			Type = TextBlockElement
			local_id = text
			parent = <bar_id>
			text = <text>
			just = [left bottom]
			internal_just = [left center]
			Pos = <text_pos>
			rgba = <text_color>
			dims = <text_dims>
			font = title_a1
			relative_z_priority = 5
			fit_width = `scale	each	line	if	larger`
			fit_height = `scale	to	fit`
			scale_mode = proportional
			text_case = Original
		}
	endif
	if GotParam \{peak}
		if (<total> = 0)
			peak_offset = 0
		else
			peak_offset = ((<peak> / (<total> * 1.0)) * $wii_bar_graph_bar_dims [0])
		endif
		peak_x = (($wii_bar_graph_bar_dims [0] / -2) + <peak_offset>)
		if (<peak_x> > 600)
			<peak_x> = 600
		endif
		peak_pos = (0.0, 0.0)
		setpaircomponents peak_pos X = <peak_x> y = ($wii_bar_graph_bar_dims [1] / 4)
		CreateScreenElement {
			Type = SpriteElement
			local_id = peak
			parent = <bar_id>
			Pos = <peak_pos>
			just = [center center]
			texture = white
			dims = $wii_bar_graph_bar_peak_dims
			rgba = <text_color>
			relative_z_priority = 10
			alpha = <alpha>
		}
	endif
	wii_bar_graph_format_number units = <units> number = <current>
	wii_bar_graph_create_column_text {
		parent_id = <bar_id>
		text = <formatted_number>
		font = text_a1
		Point = $wii_bar_graph_column_current_point
		Color = <text_color>
	}
	if GotParam \{peak}
		wii_bar_graph_format_number units = <units> number = <peak>
		wii_bar_graph_create_column_text {
			parent_id = <bar_id>
			text = <formatted_number>
			font = text_a1
			Point = $wii_bar_graph_column_peak_point
			Color = <text_color>
		}
	endif
	wii_bar_graph_format_number units = <units> number = <total>
	wii_bar_graph_create_column_text {
		parent_id = <bar_id>
		text = <formatted_number>
		font = text_a1
		Point = $wii_bar_graph_column_total_point
		Color = ($wii_bar_graph_heading_color)
	}
	Change wii_bar_graph_bar_count = ($wii_bar_graph_bar_count + 1)
endscript

script wii_bar_graph_format_number 
	RequireParams \{[
			number
			units
		]
		all}
	switch (<units>)
		case kb
		formatText qs(0x0619b4c0) TextName = formatted_number a = (<number> / 1024)
		default
		formatText qs(0x0bc409e2) TextName = formatted_number a = (<number>)
	endswitch
	return formatted_number = <formatted_number>
endscript

script wii_bar_graph_create_column_text 
	RequireParams \{[
			parent_id
			text
			Point
			Color
		]
		all}
	column_dims = (0.0, 0.0)
	column_pos = (0.0, 0.0)
	setpaircomponents {
		column_dims
		X = ($wii_bar_graph_text_column_width)
		y = ($wii_bar_graph_bar_dims [1] / 2)
	}
	setpaircomponents {
		column_pos
		X = (($wii_bar_graph_bar_dims [0] / -2) + ($wii_bar_graph_bar_dims [0] * <Point>))
	}
	<column_pos> = (<column_pos> + $wii_bar_graph_text_offset)
	CreateScreenElement {
		Type = TextBlockElement
		local_id = text
		parent = <parent_id>
		text = <text>
		just = [left bottom]
		internal_just = [left center]
		Pos = <column_pos>
		rgba = <Color>
		dims = <column_dims>
		font = title_a1
		relative_z_priority = 5
		fit_width = `scale	each	line	if	larger`
		fit_height = `scale	to	fit`
		scale_mode = proportional
		text_case = Original
	}
endscript
