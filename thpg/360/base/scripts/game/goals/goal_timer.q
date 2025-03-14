
script goal_timer_create_timer 
	if screenelementexists id = <screen_element_id>
		destroyscreenelement id = <screen_element_id>
	endif
	if gotparam dont_show_on_enter
		<alpha> = 0.0
	else
		<alpha> = 1.0
	endif
	<container_id> = <screen_element_id>
	if gman_getactivatedgoalid
		gman_getgoaltype goal = <activated_goal_id>
		if ((<goal_type> = classic) || (<goal_type> = hawkman) || (<goal_type> = high_score_run))
			isArcade = 1
		endif
	endif
	switch <screen_element_style>
		case boundary
		if NOT gotparam isArcade
			goal_timer_build_timer_element {
				container_id = <screen_element_id>
				pos = (640.0, 80.0)
				text_rgba = [200 70 55 255]
				text_scale = 0.75
				bg_rgba = [0 0 0 255]
				bg_scale = (-0.28, -3.4)
				alpha = <alpha>
				run_script = goal_timer_boundary_flash
				run_script2 = goal_timer_drop
				bg_offset = (0.0, -2.0)
				z_priority = 5
				bg_scale = (0.9, 1.0)
			}
		else
			goal_arcadetimer_build_timer_element {
				container_id = <screen_element_id>
				pos = (643.0, 100.0)
				text_rgba = [220 220 180 255]
				text_scale = (1.0, 0.8)
				alpha = <alpha>
				run_script = goal_timer_boundary_flash
				run_script2 = goal_timer_drop
				bg_offset = (-3.0, -4.0)
				z_priority = 5
				bg_scale = (0.7, 0.8)
			}
		endif
		case film
		goal_timer_build_timer_element {
			container_id = <screen_element_id>
			pos = (1110.0, 540.0)
			text_rgba = [230 230 230 255]
			text_scale = 1.8
			bg_rgba = ($goal_generic_ui_scheme.main)
			alpha = <alpha>
			bg_scale = (1.3, 1.4)
			bg_offset = (0.0, -2.0)
			z_priority = 10
		}
		case Secondary_Timer
		goal_timer_build_timer_element {
			container_id = <screen_element_id>
			pos = (1040.0, 80.0)
			text_rgba = [230 230 230 255]
			text_scale = 1.5
			bg_rgba = ($goal_generic_ui_scheme.main)
			bg_scale = (1.1, 1.2)
			alpha = <alpha>
			bg_offset = (0.0, -2.0)
			z_priority = 10
		}
		assignalias id = <screen_element_id> alias = secondary_goal_timer
		ui_messages_check_all_positions
		case Arcade_Timer
		goal_arcadetimer_build_timer_element {
			container_id = <screen_element_id>
			pos = (640.0, 80.0)
			text_rgba = [220 220 180 255]
			text_scale = (1.8, 1.6)
			bg_rgba = [60 170 255 100]
			bg_scale = (1.0, 0.9)
			alpha = <alpha>
			bg_offset = (0.0, -4.0)
			z_priority = 10
		}
		default
		goal_timer_build_timer_element {
			container_id = <screen_element_id>
			pos = (640.0, 80.0)
			text_rgba = [230 230 230 255]
			text_scale = 1.8
			bg_rgba = ($goal_generic_ui_scheme.main)
			alpha = <alpha>
			bg_scale = (1.3, 1.4)
			bg_offset = (0.0, -2.0)
			z_priority = 10
		}
	endswitch
	hide_compass_anchor
endscript

script goal_timer_build_timer_element 
	createscreenelement {
		type = containerelement
		id = <container_id>
		parent = the_time
		just = [center center]
		pos = <pos>
		alpha = <alpha>
	}
	createscreenelement {
		type = textelement
		parent = <container_id>
		local_id = timer_text
		font = fontstrip_numbers_mono_sk8
		scale = <text_scale>
		just = [center center]
		pos = (0.0, -3.0)
		rgba = <text_rgba>
		font_spacing = 3
		shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [10 10 10 255]
		z_priority = (<z_priority> + 1)
	}
	if gotparam run_script
		runscriptonscreenelement id = <id> <run_script>
	endif
	createscreenelement {
		type = containerelement
		local_id = timer_bg
		parent = <container_id>
		pos = (<bg_offset> + (0.0, -4.0))
		rot_angle = <bg_rot>
		just = [center center]
		scale = <bg_scale>
		texture = HUD_timer_strip
		z_priority = <z_priority>
		alpha = 1.0
	}
	<bg_container> = <id>
	createscreenelement {
		parent = <bg_container>
		type = spriteelement
		texture = cap_whitenoise
		scale = (((0.5, 0.0) * Random (@ 0.85 @ 0.95 @ 0.9 @ -0.85 @ -0.95 @ 0.9 )) + ((0.0, 1.0) * Random (@ 0.5 @ -0.5 @ -0.6 @ 0.6 )))
		just = [center center]
		rgba = [220 220 220 220]
		z_priority = (<z_priority> - 1)
		alpha = 0.5
	}
	createscreenelement {
		parent = <bg_container>
		type = spriteelement
		texture = menu_highlight
		scale = (((0.5, 0.0) * Random (@ 1 @ 1.05 @ 0.95 )) + ((0.0, 1.0) * Random (@ -1.05 @ -1 @ 1 )))
		just = [center center]
		rgba = [0 0 0 255]
		alpha = 1
		rot_angle = RandomRange (-1.5, 1.0)
		z_priority = (<z_priority> - 2)
		alpha = 0.5
	}
	createscreenelement {
		parent = <bg_container>
		type = spriteelement
		texture = menu_highlight
		scale = (-0.45000002, 1.0)
		just = [center center]
		rgba = ($goal_ui_scheme.main)
		rot_angle = RandomRange (1.0, -1.0)
		alpha = 1
		z_priority = (<z_priority> - 3)
		alpha = 0.5
	}
	if gotparam run_script2
		runscriptonscreenelement id = <container_id> <run_script2>
	endif
endscript

script goal_arcadetimer_build_timer_element bg_scale = (1.0, 1.0) bg_offset = (0.0, 0.0)
	createscreenelement {
		type = containerelement
		id = <container_id>
		parent = the_time
		just = [center center]
		pos = <pos>
		alpha = <alpha>
	}
	createscreenelement {
		type = textelement
		parent = <container_id>
		local_id = timer_text
		font = fontstrip_numbers_mono_sk8
		scale = <text_scale>
		just = [center center]
		pos = (-10.0, 0.0)
		rgba = <text_rgba>
		font_spacing = 3
		shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [30 30 80 255]
		z_priority = (<z_priority> + 2)
	}
	if gotparam run_script
		runscriptonscreenelement id = <id> <run_script>
	endif
	createscreenelement {
		type = containerelement
		parent = <container_id>
		pos = <bg_offset>
		just = [center center]
		child_anchor = [center center]
		scale = <bg_scale>
	}
	width = 128
	height = 64
	goal_arcade_menu_bg {
		parent = <id>
		local_id = bg
		width = <width>
		height = <height>
		bg_rgba = [60 170 255 100]
	}
	goal_arcade_menu_bg {
		parent = <id>
		local_id = shadow
		width = <width>
		height = <height>
		z_priority = 7
		pos = (2.0, 2.0)
		fg_rgba = [0 0 0 255]
		nobg
	}
	if gotparam run_script2
		runscriptonscreenelement id = <container_id> <run_script2>
	endif
endscript

script goal_timer_destroy_timer 
	if screenelementexists id = <screen_element_id>
		destroyscreenelement id = <screen_element_id>
	endif
	show_compass_anchor
endscript

script goal_timer_update 
	if screenelementexists id = {<id> child = timer_text}
		setscreenelementprops id = {<id> child = timer_text} text = <text>
	endif
endscript

script goal_timer_drop 
	getprops
	<start_pos> = <pos>
	<move> = 1
	begin
	getprops
	if (<alpha> = 1.0)
		if (<move> = 1)
			domorph pos = (<start_pos> + (0.0, 37.0)) time = 0.120000005
			<move> = 0
		endif
	else
		domorph pos = <start_pos>
		<move> = 1
	endif
	wait \{1
		gameframes}
	repeat
endscript

script goal_timer_boundary_flash 
	wait \{0.120000005
		seconds}
	begin
	domorph \{alpha = 0.25
		time = 0.075}
	wait \{0.075
		seconds}
	domorph \{alpha = 0
		time = 0.025
		scale = 1}
	wait \{0.025
		seconds}
	domorph \{alpha = 0.75
		time = 0.025
		scale = 1.15}
	wait \{0.025
		seconds}
	domorph \{alpha = 1
		time = 0.075
		scale = 1.3}
	wait \{0.075
		seconds}
	repeat
endscript
