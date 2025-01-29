bx_highlightstars_focuswaittime = 1
bx_highlightstars_widthoffset = 0

script bx_createhighlightstars \{parent = root_window
		left_star_alpha = 1.0
		right_star_alpha = 1.0
		focuswaittime = 1
		width_offset = 0
		stars_id = highlightstars}
	if NOT ScreenElementExists id = <stars_id>
		printf channel = highlightstars qs(0x090d3ed5) s = <stars_id>
		CreateScreenElement {
			Type = descinterface
			id = <stars_id>
			parent = <parent>
			desc = 'BX_Highlight'
			just = [center center]
			highlight_star_rot_angle = 0.0
		}
		<id> :Obj_SpawnScriptNow bx_animatehighlightstars
	endif
	<stars_id> :se_setprops {
		Pos = {absolute (-1000.0, -1000.0)}
		z_priority = 100000
		alpha = 0.0
		highlight_star_1_texture = highlight_star
		highlight_star_2_texture = highlight_star
		highlight_star_1_alpha = <left_star_alpha>
		highlight_star_2_alpha = <right_star_alpha>
		highlight_star_scale = (1.0, 1.0)
		vide_dims = (100.0, 32.0)
	}
	Change bx_highlightstars_focuswaittime = (<focuswaittime>)
	Change bx_highlightstars_widthoffset = (<width_offset>)
endscript

script bx_animatehighlightstars 
	setscriptcannotpause
	angle = 0.0
	begin
	if (<angle> > 360.0)
		<angle> = (<angle> - 360.0)
		se_setprops highlight_star_rot_angle = <angle>
	else
		<angle> = (<angle> + 36.0)
		se_setprops highlight_star_rot_angle = <angle> time = 0.1 ignoreslomo
		Wait \{0.1
			Second
			ignoreslomo}
	endif
	repeat
endscript

script bx_focushighlightstarson \{highlight_star_1_alpha = 1
		highlight_star_2_alpha = 1
		stars_id = highlightstars}
	RequireParams \{[
			objID
		]
		all}
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	if ScreenElementExists id = <stars_id>
		Wait \{$bx_highlightstars_focuswaittime
			gameframe}
		Change \{bx_highlightstars_focuswaittime = 1}
		GetScreenElementDims id = <objID>
		vide_dims = ((1.0, 0.0) * <width>)
		GetScreenElementPosition id = <objID> absolute
		X = ((<screenelementpos> [0]) + <width> / 2.0)
		y = ((<screenelementpos> [1]) + <height> / 2.0)
		Pos = (((1.0, 0.0) * <X>) + ((0.0, 1.0) * <y>))
		if GotParam \{offset}
			<Pos> = (<Pos> + <offset>)
		endif
		Scale = ((<height> / 64.0) * 0.75)
		<Scale> = ((1.0, 1.0) * <Scale>)
		getscreenelementzpriority id = <objID>
		if ScreenElementExists id = <stars_id>
			<stars_id> :se_setprops {
				Pos = {absolute <Pos>}
				vide_dims = <vide_dims>
				highlight_star_scale = <Scale>
				alpha = 1.0
				z_priority = <z_priority>
				highlight_star_1_alpha = <highlight_star_1_alpha>
				highlight_star_2_alpha = <highlight_star_2_alpha>
			}
		endif
	else
		printf \{channel = highlightstars
			qs(0x2766416a)}
	endif
endscript

script bx_focushighlightstarson_genericmenu \{highlight_star_1_alpha = 1
		highlight_star_2_alpha = 1
		stars_id = highlightstars}
	RequireParams \{[
			objID
		]
		all}
	if ScreenElementExists id = <stars_id>
		Wait \{$bx_highlightstars_focuswaittime
			gameframe}
		Change \{bx_highlightstars_focuswaittime = 1}
		offset = (0.0, 0.0)
		<objID> :se_getprops
		if GotParam \{generic_menu_smenu_textitem_text_dims}
			text_width = (<generic_menu_smenu_textitem_text_dims> [0])
			GetScreenElementDims id = <objID>
			<offset> = ((<width> / 2 - <text_width> / 2) * (1.0, 0.0))
			<width> = <text_width>
			height = (<generic_menu_smenu_textitem_text_dims> [1])
		else
			GetScreenElementDims id = <objID>
		endif
		vide_dims = ((1.0, 0.0) * <width>)
		<vide_dims> = (<vide_dims> + ($bx_highlightstars_widthoffset * (1.0, 0.0)))
		GetScreenElementPosition id = <objID> absolute
		X = ((<screenelementpos> [0]) + <width> / 2.0)
		y = ((<screenelementpos> [1]) + <height> / 2.0)
		Pos = (((1.0, 0.0) * <X>) + ((0.0, 1.0) * <y>))
		Pos = (<Pos> + <offset>)
		Scale = ((<height> / 64.0) * 0.75)
		<Scale> = ((1.0, 1.0) * <Scale>)
		if ScreenElementExists id = <stars_id>
			<stars_id> :se_setprops {
				Pos = {absolute <Pos>}
				vide_dims = <vide_dims>
				highlight_star_scale = <Scale>
				alpha = 1.0
				z_priority = (<z_priority> + 100)
				highlight_star_1_alpha = <highlight_star_1_alpha>
				highlight_star_2_alpha = <highlight_star_2_alpha>
			}
		endif
	else
		printf \{channel = highlightstars
			qs(0x2766416a)}
	endif
endscript
