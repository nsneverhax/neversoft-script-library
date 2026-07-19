BX_HighlightStars_FocusWaitTime = 1
BX_HighlightStars_WidthOffset = 0

script BX_CreateHighlightStars \{parent = root_window
		left_star_alpha = 1.0
		right_star_alpha = 1.0
		focusWaitTime = 1
		width_offset = 0
		stars_id = HighlightStars}
	if NOT ScreenElementExists id = <stars_id>
		printf channel = HighlightStars qs("\LCreating %s.") s = <stars_id>
		CreateScreenElement {
			type = DescInterface
			id = <stars_id>
			parent = <parent>
			desc = 'BX_Highlight'
			just = [center center]
			Highlight_star_rot_angle = 0.0
		}
		<id> :Obj_SpawnScriptNow BX_AnimateHighlightStars
	endif
	<stars_id> :SE_SetProps {
		pos = {absolute (-1000.0, -1000.0)}
		z_priority = 100000
		alpha = 0.0
		Highlight_star_1_texture = Highlight_star
		Highlight_star_2_texture = Highlight_star
		Highlight_star_1_alpha = <left_star_alpha>
		Highlight_star_2_alpha = <right_star_alpha>
		Highlight_star_scale = (1.0, 1.0)
		vide_dims = (100.0, 32.0)
	}
	change BX_HighlightStars_FocusWaitTime = (<focusWaitTime>)
	change BX_HighlightStars_WidthOffset = (<width_offset>)
endscript

script BX_AnimateHighlightStars 
	SetScriptCannotPause
	Angle = 0.0
	begin
	if (<Angle> > 360.0)
		<Angle> = (<Angle> - 360.0)
		SE_SetProps Highlight_star_rot_angle = <Angle>
	else
		<Angle> = (<Angle> + 36.0)
		SE_SetProps Highlight_star_rot_angle = <Angle> time = 0.1 ignoreslomo
		Wait \{0.1
			second
			ignoreslomo}
	endif
	repeat
endscript

script BX_FocusHighlightStarsOn \{Highlight_star_1_alpha = 1
		Highlight_star_2_alpha = 1
		stars_id = HighlightStars}
	RequireParams \{[
			ObjID
		]
		all}
	SetSpawnInstanceLimits \{max = 1
		management = kill_oldest}
	if ScreenElementExists id = <stars_id>
		Wait \{$BX_HighlightStars_FocusWaitTime
			gameframe}
		change \{BX_HighlightStars_FocusWaitTime = 1}
		GetScreenElementDims id = <ObjID>
		vide_dims = ((1.0, 0.0) * <width>)
		GetScreenElementPosition id = <ObjID> absolute
		x = ((<screenelementpos> [0]) + <width> / 2.0)
		y = ((<screenelementpos> [1]) + <Height> / 2.0)
		pos = (((1.0, 0.0) * <x>) + ((0.0, 1.0) * <y>))
		if GotParam \{offset}
			<pos> = (<pos> + <offset>)
		endif
		scale = ((<Height> / 64.0) * 0.75)
		<scale> = ((1.0, 1.0) * <scale>)
		GetScreenElementZPriority id = <ObjID>
		if ScreenElementExists id = <stars_id>
			<stars_id> :SE_SetProps {
				pos = {absolute <pos>}
				vide_dims = <vide_dims>
				Highlight_star_scale = <scale>
				alpha = 1.0
				z_priority = <z_priority>
				Highlight_star_1_alpha = <Highlight_star_1_alpha>
				Highlight_star_2_alpha = <Highlight_star_2_alpha>
			}
		endif
	else
		printf \{channel = HighlightStars
			qs("\LHighlightStars do not exist.")}
	endif
endscript

script BX_FocusHighlightStarsOn_GenericMenu \{Highlight_star_1_alpha = 1
		Highlight_star_2_alpha = 1
		stars_id = HighlightStars}
	RequireParams \{[
			ObjID
		]
		all}
	if ScreenElementExists id = <stars_id>
		Wait \{$BX_HighlightStars_FocusWaitTime
			gameframe}
		change \{BX_HighlightStars_FocusWaitTime = 1}
		offset = (0.0, 0.0)
		<ObjID> :SE_GetProps
		if GotParam \{generic_menu_smenu_textitem_text_dims}
			text_width = (<generic_menu_smenu_textitem_text_dims> [0])
			GetScreenElementDims id = <ObjID>
			<offset> = ((<width> / 2 - <text_width> / 2) * (1.0, 0.0))
			<width> = <text_width>
			Height = (<generic_menu_smenu_textitem_text_dims> [1])
		else
			GetScreenElementDims id = <ObjID>
		endif
		vide_dims = ((1.0, 0.0) * <width>)
		<vide_dims> = (<vide_dims> + ($BX_HighlightStars_WidthOffset * (1.0, 0.0)))
		GetScreenElementPosition id = <ObjID> absolute
		x = ((<screenelementpos> [0]) + <width> / 2.0)
		y = ((<screenelementpos> [1]) + <Height> / 2.0)
		pos = (((1.0, 0.0) * <x>) + ((0.0, 1.0) * <y>))
		pos = (<pos> + <offset>)
		scale = ((<Height> / 64.0) * 0.75)
		<scale> = ((1.0, 1.0) * <scale>)
		if ScreenElementExists id = <stars_id>
			<stars_id> :SE_SetProps {
				pos = {absolute <pos>}
				vide_dims = <vide_dims>
				Highlight_star_scale = <scale>
				alpha = 1.0
				z_priority = (<z_priority> + 100)
				Highlight_star_1_alpha = <Highlight_star_1_alpha>
				Highlight_star_2_alpha = <Highlight_star_2_alpha>
			}
		endif
	else
		printf \{channel = HighlightStars
			qs("\LHighlightStars do not exist.")}
	endif
endscript
