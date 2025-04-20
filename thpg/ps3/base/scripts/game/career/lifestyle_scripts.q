strongest_lifestyle_spread = 0.1
strongest_lifestyle_minimum = 0.1
lifestyle_params = {
	career = {
		ui = $goal_career_ui_scheme
		display_name = "career"
		outline_idx = 1
	}
	hardcore = {
		ui = $goal_hardcore_ui_scheme
		display_name = "hardcore"
		outline_idx = 2
	}
	rigger = {
		ui = $goal_rigger_ui_scheme
		display_name = "rigger"
		outline_idx = 3
	}
	generic = {
		ui = $goal_generic_ui_scheme
		display_name = "street"
		outline_idx = 0
	}
}
goal_generic_ui_scheme = {
	lifestyle = generic
	main = [
		200
		70
		70
		255
	]
	text_color = '\\c2'
	screen_fx = Red_Menu_tod_manager
	icon_movie = 'icons_generic'
}
goal_career_ui_scheme = {
	$goal_generic_ui_scheme
	lifestyle = career
	main = [
		80
		180
		120
		255
	]
	text_color = '\\c4'
	screen_fx = Green_Menu_tod_manager
	icon_movie = 'icons_career'
}
goal_hardcore_ui_scheme = {
	$goal_generic_ui_scheme
	lifestyle = hardcore
	main = [
		200
		100
		40
		255
	]
	text_color = '\\c6'
	screen_fx = Orange_Menu_tod_manager
	icon_movie = 'icons_hardcore'
}
goal_rigger_ui_scheme = {
	$goal_generic_ui_scheme
	lifestyle = rigger
	main = [
		140
		100
		180
		255
	]
	text_color = '\\c7'
	screen_fx = Violet_Menu_tod_manager
	icon_movie = 'icons_rigger'
}
goal_ui_scheme = goal_generic_ui_scheme

script goal_ui_update_scheme 
	goal_ui_get_scheme lifestyle = <lifestyle>
	if NOT gotparam \{ui_scheme}
		scriptassert \{"goal_ui_get_scheme must return ui_scheme"}
	endif
	change goal_ui_scheme = <ui_scheme>
	construct_score_in_goal
endscript

script goal_ui_get_scheme 
	requireparams [lifestyle] all
	switch <lifestyle>
		case career
		<scheme> = goal_career_ui_scheme
		case rigger
		<scheme> = goal_rigger_ui_scheme
		case hardcore
		<scheme> = goal_hardcore_ui_scheme
		case none
		<scheme> = goal_generic_ui_scheme
		case generic
		<scheme> = goal_generic_ui_scheme
		default
		softassert "unknown lifestyle %s" s = <lifestyle>
		<scheme> = goal_generic_ui_scheme
	endswitch
	return ui_scheme = <scheme>
endscript

script menu_adjust_scheme 
	if gotparam left
		soundevent event = Pause_Menu_Scroll_LEFT_SFX
		switch ($goal_ui_scheme.lifestyle)
			case ($goal_generic_ui_scheme.lifestyle)
			goal_ui_update_scheme lifestyle = career
			<text> = "career"
			case ($goal_career_ui_scheme.lifestyle)
			goal_ui_update_scheme lifestyle = hardcore
			<text> = "hardcore"
			case ($goal_hardcore_ui_scheme.lifestyle)
			goal_ui_update_scheme lifestyle = rigger
			<text> = "rigger"
			case ($goal_rigger_ui_scheme.lifestyle)
			goal_ui_update_scheme lifestyle = generic
			<text> = "generic"
		endswitch
	else
		soundevent event = Pause_Menu_Scroll_RIGHT_SFX
		switch ($goal_ui_scheme.lifestyle)
			case ($goal_generic_ui_scheme.lifestyle)
			goal_ui_update_scheme lifestyle = rigger
			<text> = "rigger"
			case ($goal_career_ui_scheme.lifestyle)
			goal_ui_update_scheme lifestyle = generic
			<text> = "generic"
			case ($goal_hardcore_ui_scheme.lifestyle)
			goal_ui_update_scheme lifestyle = career
			<text> = "career"
			case ($goal_rigger_ui_scheme.lifestyle)
			goal_ui_update_scheme lifestyle = hardcore
			<text> = "hardcore"
		endswitch
	endif
	setscreenelementprops {
		id = {menu_screen_theme child = extra_text}
		text = <text>
	}
	create_pause_back <menu_params> title = "display"
endscript

script SetOutlineBasedOnLifestyle 
	if structurecontains structure = $lifestyle_params <lifestyle>
		if structurecontains structure = ($lifestyle_params.<lifestyle>) outline_idx
			obj_setoutlinecolorindex index = (($lifestyle_params.<lifestyle>).outline_idx)
		endif
	endif
endscript

script game_progress_get_lifestyle_weighting 
	<career_weight> = 0.0
	<hardcore_weight> = 0.0
	<rigger_weight> = 0.0
	<total_weight> = 0.0
	if NOT gotparam debug
		GMan_GetLifestyleStats
	endif
	<total_progression> = ((<career>.beaten_percent) + (<hardcore>.beaten_percent) + (<rigger>.beaten_percent))
	if (<total_progression> > 0)
		<career_weight> = ((<career>.beaten_percent) / <total_progression>)
		<hardcore_weight> = ((<hardcore>.beaten_percent) / <total_progression>)
		<rigger_weight> = ((<rigger>.beaten_percent) / <total_progression>)
	endif
	return {
		career_weight = <career_weight>
		hardcore_weight = <hardcore_weight>
		rigger_weight = <rigger_weight>
		total_progression = (<total_progression> / 3.0)
	}
endscript

script game_progress_get_lifestyle_ped_attract 
	game_progress_get_lifestyle_weighting
	if (<total_progression> < 0.1)
		<generic_weight> = (1.0 - <career_weight> - <hardcore_weight> - <rigger_weight>)
	else
		<generic_weight> = 0.0
	endif
	linearmap result = total_progression from = 0.25 to = 1.0 basedon = <total_progression> lowerbound = 0.0 upperbound = 0.8
	<total_weight> = (<generic_weight> + <career_weight> + <hardcore_weight> + <rigger_weight>)
	if ((<total_weight> > 1.01) || (<total_weight> < 0.98999995))
		printstruct <...>
		scriptassert "total_weight should be 1.0, is %t" t = <total_weight>
	endif
	return {
		generic_weight = <generic_weight>
		career_weight = <career_weight>
		hardcore_weight = <hardcore_weight>
		rigger_weight = <rigger_weight>
		total_progression = <total_progression>
	}
endscript

script debug_lifestyles 
	if screenelementexists id = debug_lifestyle_anchor
		destroyscreenelement id = debug_lifestyle_anchor
		return
	endif
	createscreenelement {
		id = debug_lifestyle_anchor
		type = vmenu
		parent = root_window
		pos = (1000.0, 100.0)
		just = [left top]
		internal_just = [left top]
	}
	text_params = {
		parent = debug_lifestyle_anchor
		type = textelement
		font = text_a1
		text = ""
		scale = 0.6
		just = [left top]
		shadow
		shadow_offs = (1.0, 1.0)
	}
	createscreenelement {
		<text_params>
		local_id = career_pct
	}
	createscreenelement {
		<text_params>
		local_id = hardcore_pct
	}
	createscreenelement {
		<text_params>
		local_id = rigger_pct
	}
	runscriptonscreenelement id = debug_lifestyle_anchor debug_refreshLifestyleStats
endscript

script debug_refreshLifestyleStats 
	begin
	GMan_GetLifestyleStats
	formattext textname = text "Career: %s \\%" s = (<career>.beaten_percent_str)
	setscreenelementprops id = {debug_lifestyle_anchor child = career_pct} text = <text>
	formattext textname = text "Hardcore: %s \\%" s = (<hardcore>.beaten_percent_str)
	setscreenelementprops id = {debug_lifestyle_anchor child = hardcore_pct} text = <text>
	formattext textname = text "Rigger: %s \\%" s = (<rigger>.beaten_percent_str)
	setscreenelementprops id = {debug_lifestyle_anchor child = rigger_pct} text = <text>
	wait 0.5 seconds
	repeat
endscript

script debug_show_goal_points parent = root_window
	debug_hide_goal_points
	createscreenelement {
		id = debug_goal_points_anchor
		type = vmenu
		parent = <parent>
		pos = (60.0, 30.0)
		z_priority = 100
		just = [left top]
		internal_just = [left top]
		padding_scale = 0.85
	}
	<goal_point_types> = [
		career
		hardcore
		rigger
		generic
		total
	]
	getarraysize <goal_point_types>
	if (<array_size> > 0)
		<i> = 0
		begin
		debug_show_goal_points_line type = (<goal_point_types> [<i>])
		<i> = (<i> + 1)
		repeat <array_size>
	endif
endscript

script debug_hide_goal_points 
	if screenelementexists \{id = debug_goal_points_anchor}
		destroyscreenelement \{id = debug_goal_points_anchor}
	endif
endscript

script debug_show_goal_points_line 
	careerfunc func = getgoalpoints params = {type = <type>}
	formattext textname = text "%t: %p" t = <type> p = <goal_points> dontassertforchecksums
	createscreenelement {
		parent = debug_goal_points_anchor
		type = textelement
		font = text_a1
		text = <text>
		scale = (0.6)
		shadow
		shadow_offs = (2.0, 2.0)
	}
endscript

script get_strongest_lifestyle 
	<lifestyles> = [
		career
		hardcore
		rigger
		generic
	]
	<largest_f> = 0.0
	<largest_f_name> = generic
	<second_best_f> = 0.0
	getarraysize <lifestyles>
	<i> = 0
	begin
	careerfunc func = getgoalpoints params = {type = (<lifestyles> [<i>])}
	if (<goal_points_factor> >= <largest_f>)
		<second_best_f> = <largest_f>
		<largest_f> = <goal_points_factor>
		<largest_f_name> = (<lifestyles> [<i>])
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	if NOT gotparam ignore_spread
		<spread> = (<largest_f> - <second_best_f>)
		if (<spread> < $strongest_lifestyle_spread)
			<largest_f_name> = generic
		endif
	else
		if (<largest_f_name> = generic)
			<largest_f_name> = career
		endif
	endif
	if (<largest_f> < $strongest_lifestyle_minimum)
		<largest_f_name> = generic
	endif
	return strongest_lifestyle = <largest_f_name>
endscript
