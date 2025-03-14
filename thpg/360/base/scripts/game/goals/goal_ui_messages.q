hud_message_stack_order_right = [
	goal_viewport_viewport_element
	goal_ui_counter0
	goal_ui_counter1
	goal_ui_counter2
	goal_ui_counter3
	goal_ui_alert
]
hud_message_stack_order_left = [
	ui_show_progress_bar_anchor
	goal_arrow_element_shim
	goal_ui_instruction
	goal_ui_instruction2
]

script goal_ui_display_message 
	spawnscriptnow hud_message params = {<...>} id = goal_ui_scripts
endscript

script ui_display_message 
	if ve_is_recording
		if (<type> = instruction_general)
			return
		endif
	endif
	if gotparam \{wait_time}
		if NOT (<wait_time> = 0.0)
			wait <wait_time> seconds ignoreslomo
		endif
	endif
	spawnscriptnow noqbid hud_message params = {<...>} id = goal_ui_scripts
endscript
hud_counter_ids = [
	goal_ui_counter0
	goal_ui_counter1
	goal_ui_counter2
	goal_ui_counter3
]
hud_counters_size = 4
hud_counter_bar_w = 100
hud_counter_bar_h = 14

script goal_create_counter separator = "of" hud_counter_caption = "collected" initial_count = 0 counter_index = 0 is_bar = 0 marker_array = [{number = 0 color = `default`}]
	if NOT cd
		getarraysize ($hud_counter_ids)
		if NOT (<array_size> = $hud_counters_size)
			softassert "There are %a HUD counters but $HUD_counters_size is %s!" a = <array_size> s = ($hud_counters_size)
		endif
	endif
	if (<is_bar> = 1)
		if NOT gotparam color
			<color> = greenlt
		endif
	endif
	spawnscriptnow {
		hud_message params = {
			type = counter
			meter_type = <meter_type>
			<...>
		}
		id = goal_ui_scripts
	}
endscript

script hud_message type = `default` text = " " color = `default` second_color = `default` time = 3000
	if ($ui_gameplay_show_hud = 0)
		return
	endif
	if NOT gman_getactivatedgoalid
		if getglobalflag flag = $no_display_trickstring
			return
		endif
	endif
	switch <color>
		case greenlt
		<rgba> = [0 225 0 255]
		case green
		<rgba> = ($goal_career_ui_scheme.main)
		case bluedk
		<rgba> = [80 120 180 255]
		case bluelt
		<rgba> = [40 200 200 255]
		case violet
		<rgba> = ($goal_rigger_ui_scheme.main)
		case amber
		<rgba> = [180 140 60 255]
		case orange
		<rgba> = ($goal_hardcore_ui_scheme.main)
		case red
		<rgba> = ($goal_generic_ui_scheme.main)
		case clear
		<rgba> = [0 0 0 0]
		default
		<rgba> = [180 180 180 255]
	endswitch
	switch <second_color>
		case greenlt
		<second_rgba> = [0 225 0 255]
		case green
		<second_rgba> = ($goal_career_ui_scheme.main)
		case bluedk
		<second_rgba> = [80 120 180 255]
		case bluelt
		<second_rgba> = [40 200 200 255]
		case violet
		<second_rgba> = ($goal_rigger_ui_scheme.main)
		case amber
		<second_rgba> = [180 140 60 255]
		case orange
		<second_rgba> = ($goal_hardcore_ui_scheme.main)
		case red
		<second_rgba> = ($goal_generic_ui_scheme.main)
		case clear
		<second_rgba> = [0 0 0 0]
		default
		<second_rgba> = [180 180 180 255]
	endswitch
	<padding> = (0.0, 15.0)
	switch <type>
		case alert_signpost
		getlowercasestring <text>
		<text> = <lowercasestring>
		<id> = ui_alert_signpost
		<style_script> = ui_alert_signpost_script
		<scale> = (0.6, 0.5)
		<pos> = (320.0, 85.0)
		<time> = 3
		font_spacing = 2
		if screenelementexists id = <id>
			return
		endif
		createscreenelement {
			id = <id>
			parent = player1_panel_container
			type = containerelement
			pos = <pos>
			scale = (0.75, 0.75)
			just = [center center]
		}
		<parent> = <id>
		createscreenelement {
			id = ui_alert_signpost_text
			parent = <parent>
			type = textelement
			text = <text>
			font = text_a1
			font_spacing = 3
			pos = (0.0, 0.0)
			scale = <scale>
			just = [center center]
			rgba = <rgba>
			shadow
			shadow_offs = (2.0, 2.0)
			shadow_rgba = [0 0 0 255]
		}
		<speech_text> = <id>
		getscreenelementdims id = <speech_text>
		new_width = (<width> * Random (@ 0.85 @ 0.95 @ 0.9 ))
		new_height = (<height> * ((2.2) * Random (@ 0.5 @ -0.5 @ -0.6 @ 0.6 )))
		dims = ((Random (@ (1.0, 0.0) @ (-1.0, 0.0) )* (<new_width> + 75)) + ((0.0, 0.6) * <new_height>))
		createscreenelement {
			parent = <parent>
			type = spriteelement
			texture = cap_whitenoise
			pos = (0.0, -2.0)
			dims = <dims>
			just = [center center]
			rgba = [220 220 220 220]
			z_priority = -50
			alpha = 0.5
		}
		new_width = (<width> * Random (@ 0.9 @ 0.95 ))
		new_height = (<height> * ((2.2) * Random (@ -1.05 @ -1 @ 1 )))
		dims = ((Random (@ (1.0, 0.0) @ (-1.0, 0.0) )* (<new_width> + 75)) + ((0.0, 0.6) * <new_height>))
		createscreenelement {
			parent = <parent>
			type = spriteelement
			texture = menu_highlight
			pos = (0.0, -2.0)
			dims = <dims>
			just = [center center]
			rgba = [0 0 0 255]
			alpha = 1
			rot_angle = RandomRange (-1.5, 1.0)
			z_priority = -51
			alpha = 0.5
		}
		new_width = (<width> * 0.9)
		new_height = (<height> * 2.5)
		dims = ((Random (@ (1.0, 0.0) @ (-1.0, 0.0) )* (<new_width> + 75)) + ((0.0, 0.6) * <new_height>))
		createscreenelement {
			parent = <parent>
			type = spriteelement
			texture = menu_highlight
			pos = (0.0, -2.0)
			dims = <dims>
			just = [center center]
			rgba = ($goal_generic_ui_scheme.main)
			rot_angle = RandomRange (1.0, -1.0)
			alpha = 1
			z_priority = -52
			alpha = 0.5
		}
		case alert
		<msg_parent> = ui_alert
		<style_script> = ui_alert_script
		<scale> = 0.5
		<pos> = (64.0, 280.0)
		<time> = 3
		if screenelementexists id = <msg_parent>
			<msg_parent> :ui_replace_message
		endif
		createscreenelement {
			id = <msg_parent>
			type = containerelement
			parent = player1_panel_container
			pos = <pos>
			scale = <scale>
		}
		createscreenelement {
			parent = <msg_parent>
			type = textblockelement
			text = <text>
			font = text_a1
			pos = (0.0, 0.0)
			just = [left center]
			dims = (500.0, 500.0)
			internal_just = [left center]
			rgba = <rgba>
			shadow
			shadow_offs = (2.0, 2.0)
			shadow_rgba = [20 10 0 200]
		}
		<text> = <id>
		if gotparam icon
			<text> :domorph pos = {(45.0, 0.0) relative}
			createscreenelement {
				type = spriteelement
				parent = <msg_parent>
				texture = <icon>
				dims = (40.0, 40.0)
				pos = (0.0, 0.0)
				just = [left center]
			}
		endif
		case counter
		if NOT gotparam counter_index
			<counter_index> = 0
		endif
		if NOT gotparam is_bar
			<is_bar> = 0
		endif
		formattext checksumname = element_id 'goal_ui_counter%i' i = <counter_index>
		<id> = <element_id>
		<scale> = 0.4
		<style_script> = goal_ui_counter_script
		<pos> = (515.0, 50.0)
		ui_kill_message_hack id = <id>
		<countertext> = ""
		if ((gotparam total_number) && (<is_bar> = 0))
			formattext textname = countertext "%b %c %d" b = <separator> c = <total_number> d = <hud_counter_caption>
		else
			countertext = <hud_counter_caption>
		endif
		ui_messages_check_position_right id = <id>
		createscreenelement {
			id = <id>
			type = containerelement
			parent = player1_panel_container
			pos = <pos>
			just = [center top]
			allow_expansion
			tags = {
				counter_info = {
					text = <countertext>
					number_collected = <initial_count>
					total_number = <total_number>
					is_bar = <is_bar>
					element_id = <element_id>
					rgba = <rgba>
					marker_array = <marker_array>
				}
			}
		}
		<container_id> = <id>
		if (<is_bar> = 1)
			<bar_pos_offset> = (0.0, 5.0)
			createscreenelement {
				local_id = bar_bg
				type = spriteelement
				parent = <container_id>
				texture = white
				pos = <bar_pos_offset>
				rgba = [0 0 0 128]
				dims = ($hud_counter_bar_w * (1.0, 0.0) + $hud_counter_bar_h * (0.0, 1.0) + (4.0, 4.0))
				just = [center center]
				z_priority = 0
			}
			<bar_fg_x> = ($hud_counter_bar_w * (0.5, 0.0))
			<total_number_float> = (<total_number> * 1.0)
			<dims_for_width> = ($hud_counter_bar_w * (<initial_count> / <total_number_float>))
			casttointeger dims_for_width
			createscreenelement {
				local_id = bar
				type = spriteelement
				parent = <container_id>
				texture = white
				pos = (<bar_pos_offset> - <bar_fg_x>)
				rgba = <rgba>
				dims = (((1.0, 0.0) * <dims_for_width>) + ($hud_counter_bar_h * (0.0, 1.0)))
				just = [left center]
				z_priority = 1
			}
			if gotparam marker_array
				createscreenelement {
					type = containerelement
					parent = <container_id>
					local_id = marker_container
					pos = (<bar_pos_offset> - <bar_fg_x>)
					dims = ($hud_counter_bar_h * (0.0, 1.0))
					just = [center center]
				}
				getarraysize marker_array
				<i> = 0
				begin
				switch ((<marker_array> [<i>]).color)
					case greenlt
					<marker_rgba> = [0 225 0 255]
					case green
					<marker_rgba> = ($goal_career_ui_scheme.main)
					case bluedk
					<marker_rgba> = [80 120 180 255]
					case bluelt
					<marker_rgba> = [40 200 200 255]
					case violet
					<marker_rgba> = ($goal_rigger_ui_scheme.main)
					case amber
					<marker_rgba> = [180 140 60 255]
					case orange
					<marker_rgba> = ($goal_hardcore_ui_scheme.main)
					case red
					<marker_rgba> = ($goal_generic_ui_scheme.main)
					default
					<marker_rgba> = [180 180 180 255]
				endswitch
				<total_number_float> = (<total_number> * 1.0)
				<dims_for_width> = ($hud_counter_bar_w * (((<marker_array> [<i>]).number) / <total_number_float>))
				casttointeger dims_for_width
				createscreenelement {
					type = spriteelement
					parent = {<container_id> child = marker_container}
					texture = white
					pos = ((1.0, 0.0) * <dims_for_width>)
					rgba = <marker_rgba>
					dims = ((3.0, 0.0) + ($hud_counter_bar_h * (0.0, 1.0)))
					just = [center top]
					z_priority = 2
				}
				<i> = (<i> + 1)
				repeat <array_size>
			endif
			<text_pos> = ($hud_counter_bar_h * (0.0, 1.0) + <bar_pos_offset>)
			if gotparam icon
				createscreenelement {
					type = spriteelement
					parent = <container_id>
					texture = <icon>
					pos = (<bar_pos_offset> - <bar_fg_x> - (16.0, 0.0))
					dims = (32.0, 32.0)
					just = [left center]
					z_priority = 7
				}
			endif
		else
			<text_pos> = (0.0, 0.0)
		endif
		createscreenelement {
			type = textblockelement
			parent = <container_id>
			local_id = text
			font = text_a1
			text = <countertext>
			just = [center top]
			pos = <text_pos>
			dims = (315.0, 0.0)
			allow_expansion
			scale = <scale>
			rgba = <rgba>
			z_priority = 10
			shadow
			shadow_offs = (2.0, 2.0)
			shadow_rgba = [20 10 0 200]
		}
		goal_update_counter counter_index = <counter_index>
		case instruction
		<msg_parent> = goal_ui_instruction
		<style_script> = goal_ui_instruction_script
		<scale> = 0.4
		<pos> = (130.0, 50.0)
		if screenelementexists id = <msg_parent>
			<msg_parent> :ui_replace_message
		endif
		ui_messages_check_position_left id = <msg_parent>
		no_fade = 1
		if NOT gotparam no_fade
			no_fade = 0
		endif
		createscreenelement {
			type = containerelement
			id = <msg_parent>
			parent = player1_panel_container
			not_focusable
			just = [center top]
			child_anchor = [center top]
			pos = <pos>
			dims = (315.0, 0.0)
			tags = {
				no_fade = <no_fade>
			}
		}
		<shadow_rgba> = [0 0 0 255]
		if (<color> = clear)
			<shadow_rgba> = [0 0 0 0]
		endif
		createscreenelement {
			local_id = text
			parent = <msg_parent>
			type = textblockelement
			text = <text>
			font = text_a1
			dims = (315.0, 0.0)
			allow_expansion
			scale = <scale>
			just = [center top]
			rgba = <rgba>
			shadow
			shadow_offs = (2.0, 2.0)
			shadow_rgba = <shadow_rgba>
			alpha = 0.0
		}
		getscreenelementdims id = <id>
		setscreenelementprops {
			id = <msg_parent>
			dims = (((1.0, 0.0) * <width>) + ((0.0, 1.0) * <height>))
		}
		<shadow_rgba> = [0 0 0 255]
		if (<second_color> = clear)
			<shadow_rgba> = [0 0 0 0]
		endif
		createscreenelement {
			local_id = text2
			parent = <msg_parent>
			type = textblockelement
			text = <text>
			font = text_a1
			dims = (315.0, 0.0)
			allow_expansion
			scale = <scale>
			just = [center top]
			rgba = <second_rgba>
			shadow
			shadow_offs = (2.0, 2.0)
			shadow_rgba = <shadow_rgba>
			alpha = 0.0
		}
		if gotparam icon
			icon_rgba = <rgba>
			icon_scale = 1.0
			pos_offset = (-70.0, 0.0)
			switch <icon>
				default
				icon_scale = 1.0
				icon_rgba = [255 255 255 255]
			endswitch
			createscreenelement {
				type = spriteelement
				local_id = icon_1
				parent = <msg_parent>
				texture = <icon>
				rot_angle = 15
				pos = (<pos> + <pos_offset>)
				scale = <icon_scale>
				alpha = 0.0
				just = [center center]
				rgba = <icon_rgba>
				z_priority = 1000
				tags = {
					scale = <icon_scale>
				}
			}
			createscreenelement {
				type = spriteelement
				local_id = icon_2
				parent = <msg_parent>
				texture = <icon>
				rot_angle = 15
				pos = (<pos> + <pos_offset>)
				scale = <icon_scale>
				alpha = 0.0
				just = [center center]
				rgba = <icon_rgba>
				z_priority = 1000
			}
		endif
		case instruction_general
		if NOT insplitscreengame
			if NOT innetgame
				<msg_parent> = goal_ui_instruction2
				<style_script> = goal_ui_instruction2_script
				<scale> = 0.4
				<pos> = (130.0, 50.0)
				if screenelementexists id = <msg_parent>
					<msg_parent> :ui_replace_message
				endif
				ui_messages_check_position_left id = <msg_parent>
				no_fade = 1
				if NOT gotparam no_fade
					no_fade = 0
				endif
				createscreenelement {
					type = containerelement
					id = <msg_parent>
					parent = player1_panel_container
					not_focusable
					just = [center top]
					child_anchor = [center top]
					pos = <pos>
					dims = (315.0, 0.0)
					tags = {
						no_fade = <no_fade>
					}
				}
				createscreenelement {
					local_id = text
					parent = <msg_parent>
					type = textblockelement
					text = <text>
					font = text_a1
					dims = (315.0, 0.0)
					allow_expansion
					scale = <scale>
					just = [center top]
					rgba = <rgba>
					shadow
					shadow_offs = (2.0, 2.0)
					shadow_rgba = [0 0 0 255]
					alpha = 0.0
				}
				getscreenelementdims id = <id>
				setscreenelementprops {
					id = <msg_parent>
					dims = (((1.0, 0.0) * <width>) + ((0.0, 1.0) * <height>))
				}
				createscreenelement {
					local_id = text2
					parent = <msg_parent>
					type = textblockelement
					text = <text>
					font = text_a1
					dims = (315.0, 0.0)
					allow_expansion
					scale = <scale>
					just = [center top]
					rgba = <second_rgba>
					shadow
					shadow_offs = (2.0, 2.0)
					shadow_rgba = [0 0 0 255]
					alpha = 0.0
				}
				if gotparam icon
					icon_rgba = <rgba>
					icon_scale = 1.0
					pos_offset = (-70.0, 0.0)
					switch <icon>
						default
						icon_scale = 1.0
						icon_rgba = [255 255 255 255]
					endswitch
					createscreenelement {
						type = spriteelement
						local_id = icon_1
						parent = <msg_parent>
						texture = <icon>
						rot_angle = 15
						pos = (<pos> + <pos_offset>)
						scale = <icon_scale>
						alpha = 0.0
						just = [center center]
						rgba = <icon_rgba>
						z_priority = 1000
						tags = {
							scale = <icon_scale>
						}
					}
					createscreenelement {
						type = spriteelement
						local_id = icon_2
						parent = <msg_parent>
						texture = <icon>
						rot_angle = 15
						pos = (<pos> + <pos_offset>)
						scale = <icon_scale>
						alpha = 0.0
						just = [center center]
						rgba = <icon_rgba>
						z_priority = 1000
					}
				endif
			endif
		endif
		case uberalert
		<id> = ui_alert_uber
		<style_script> = ui_alert_uber_script
		<scale> = (0.55, 0.5)
		<pos> = (320.0, 100.0)
		if gman_getactivatedgoalid
			gman_getgoaltype goal = <activated_goal_id>
			if ((<goal_type> = classic) || (<goal_type> = hawkman) || (<goal_type> = high_score_run))
				<pos> = (<pos> + (0.0, 30.0))
			endif
		endif
		if (<time> = 3000)
			<time> = 2
		else
		endif
		if screenelementexists id = <id>
			<id> :ui_replace_message
		endif
		createscreenelement {
			id = <id>
			parent = player1_panel_container
			type = textblockelement
			text = <text>
			font = text_a1
			font_spacing = 3
			just = [center center]
			pos = <pos>
			dims = (500.0, 0.0)
			allow_expansion
			scale = <scale>
			rgba = <rgba>
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [60 60 60 255]
			z_priority = -50
			alpha = 0.0
		}
		if gotparam has_background
			getscreenelementdims id = <id>
			uberheight = (<height> * 1.3)
			getscreenelementdims id = {<id> child = 0}
			uberwidth = (<width> * 1.3)
			if screenelementexists id = ui_alert_uber_background
				destroyscreenelement id = ui_alert_uber_background
			endif
			SkewAngleX = RandomRange (-2.0, 2.0)
		endif
		case alert_goal
		<msg_parent> = goal_ui_alert
		<style_script> = goal_ui_alert_script
		<pos> = (515.0, 50.0)
		<scale> = 0.4
		if screenelementexists id = <msg_parent>
			<msg_parent> :ui_replace_message
		endif
		createscreenelement {
			id = <msg_parent>
			type = containerelement
			parent = player1_panel_container
			pos = <pos>
			dims = (0.0, 0.0)
			just = [center top]
			allow_expansion
		}
		createscreenelement {
			parent = <msg_parent>
			type = textblockelement
			local_id = text
			text = <text>
			font = text_a1
			rgba = <rgba>
			just = [center top]
			scale = <scale>
			dims = (315.0, 0.0)
			allow_expansion
			shadow
			shadow_offs = (2.0, 2.0)
			shadow_rgba = [0 0 0 255]
		}
		createscreenelement {
			parent = <msg_parent>
			type = textblockelement
			local_id = second_text
			text = <text>
			font = text_a1
			rgba = <second_rgba>
			just = [center top]
			scale = <scale>
			dims = (315.0, 0.0)
			allow_expansion
			shadow
			shadow_offs = (2.0, 2.0)
			shadow_rgba = [0 0 0 255]
		}
		getscreenelementdims id = <id>
		setscreenelementprops id = <msg_parent> dims = (<height> * (0.0, 1.0))
		if screenelementexists id = goal_ui_alert_icon
			goal_ui_alert_icon :ui_replace_message
		endif
		if gotparam icon
			icon_rgba = <rgba>
			icon_scale = 1.0
			pos_offset = (0.0, 0.0)
			icon_rgba = ($goal_ui_scheme.main)
			icon_rot_angle = 0
			switch <icon>
				case hud_message_overspray
				<icon> = HUD_alert_excl_icon
				<icon_scale> = 0.6
				<pos_offset> = (-15.0, -5.0)
				icon_rgba = <rgba>
				icon_rot_angle = 15
				case icon_small_am
				<pos_offset> = (0.0, 0.0)
				icon_scale = 1.0
				addparams need_top
				case icon_small_pro
				<pos_offset> = (0.0, 0.0)
				icon_scale = 0.75
				addparams need_top
				case icon_small_sick
				<pos_offset> = (0.0, 0.0)
				icon_scale = 0.75
				addparams need_top
				default
				icon_scale = 1.0
				icon_rgba = [255 255 255 255]
			endswitch
			createscreenelement {
				type = spriteelement
				id = goal_ui_alert_icon
				parent = <msg_parent>
				texture = <icon>
				rot_angle = <icon_rot_angle>
				pos = ((-65.0, 5.0) + <pos_offset>)
				scale = <icon_scale>
				alpha = 0.0
				just = [center center]
				rgba = <icon_rgba>
				z_priority = 1000
				tags = {
					scale = <icon_scale>
				}
			}
			if gotparam need_top
				createscreenelement {
					type = spriteelement
					id = goal_ui_alert_icon_top
					parent = <msg_parent>
					texture = <icon>
					rot_angle = <icon_rot_angle>
					pos = ((-65.0, 5.0) + <pos_offset>)
					scale = (<icon_scale> * 0.5)
					alpha = 0.0
					just = [center center]
					rgba = [200 200 200 255]
					z_priority = 1001
					tags = {
						scale = <icon_scale>
					}
				}
			endif
			createscreenelement {
				type = spriteelement
				id = goal_ui_alert_icon2
				parent = <msg_parent>
				texture = <icon>
				rot_angle = <icon_rot_angle>
				pos = ((-65.0, 5.0) + <pos_offset>)
				scale = <icon_scale>
				alpha = 0.0
				just = [center center]
				rgba = <icon_rgba>
				z_priority = 1000
			}
		endif
		ui_messages_check_position_right id = <msg_parent>
		case dialog
		<msg_parent> = goal_ui_dialog
		<style_script> = goal_ui_dialog_script
		<scale> = 0.45000002
		<pos> = (320.0, 325.0)
		if screenelementexists id = <msg_parent>
			<msg_parent> :ui_replace_message
		endif
		createscreenelement {
			id = <msg_parent>
			parent = player1_panel_container
			type = textblockelement
			text = <text>
			font = text_a1
			rgba = <rgba>
			pos = <pos>
			just = [center top]
			scale = <scale>
			dims = (1000.0, 0.0)
			allow_expansion
			shadow
			shadow_offs = (2.0, 2.0)
			shadow_rgba = [0 0 0 255]
		}
		default
		softassert "hud_message called with unrecognized type '%t'" t = <type>
		return
	endswitch
	<id> = <msg_parent>
	ui_messages_check_all_positions
	if gotparam override_time
		time = <override_time>
	endif
	if NOT insplitscreengame
		if screenelementexists id = <id>
			runscriptonscreenelement id = <id> <style_script> params = {time = <time>}
		endif
	endif
endscript

script ui_replace_message 
	die
endscript

script ui_messages_check_all_positions 
	getarraysize \{$hud_message_stack_order_right}
	<i> = 0
	begin
	ui_messages_check_position_right id = ($hud_message_stack_order_right [<i>]) message_stack_index = <i>
	<i> = (<i> + 1)
	repeat <array_size>
	getarraysize \{$hud_message_stack_order_left}
	<i> = 0
	begin
	ui_messages_check_position_left id = ($hud_message_stack_order_left [<i>]) message_stack_index = <i>
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script ui_messages_check_position_right 
	requireparams [id] all
	<padding> = (0.0, 10.0)
	<basepos> = (515.0, 45.0)
	if (screenelementexists id = score_in_goal_container)
		getscreenelementprops id = score_in_goal_container
		if NOT (<alpha> = 0.0)
			<basepos> = (<basepos> + (0.0, 40.0))
			if screenelementexists id = ($hud_message_stack_order_right [0])
				<basepos> = (<basepos> + (0.0, 15.0))
			endif
			if gman_getactivatedgoalid
				gman_getgoaltype goal = <activated_goal_id>
				if ((<goal_type> = classic) || (<goal_type> = hawkman) || (<goal_type> = high_score_run))
					<basepos> = (<basepos> + (0.0, 10.0))
				endif
			endif
		endif
	endif
	if ((screenelementexists id = secondary_goal_timer) || (screenelementexists id = net_view_goals_searching_cont))
		<basepos> = (<basepos> + (0.0, 40.0))
	endif
	if gotparam message_stack_index
		<my_stack_index> = <message_stack_index>
	else
		getarraysize $hud_message_stack_order_right
		<i> = 0
		begin
		if checksumequals a = ($hud_message_stack_order_right [<i>]) b = <id>
			<my_stack_index> = <i>
			break
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	if NOT gotparam my_stack_index
		softassert "Couldn't find screen element %i for message stack" i = <id>
		return
	endif
	if (<my_stack_index> > 0)
		<i> = 0
		begin
		if screenelementexists id = ($hud_message_stack_order_right [<i>])
			getscreenelementdims id = ($hud_message_stack_order_right [<i>])
			<basepos> = (<basepos> + <padding> + ((0.0, 1.0) * <height>))
			if (<i> = 0)
				<basepos> = (<basepos> - (0.0, 60.0))
			endif
		endif
		<i> = (<i> + 1)
		repeat <my_stack_index>
		if screenelementexists id = <id>
			doscreenelementmorph id = <id> pos = <basepos> time = 0.1 anim = ease_out
		endif
	endif
	return pos = <basepos>
endscript

script ui_messages_check_position_left 
	requireparams [id] all
	<padding> = (0.0, 10.0)
	<basepos> = (130.0, 45.0)
	if gotparam message_stack_index
		<my_stack_index> = <message_stack_index>
	else
		getarraysize $hud_message_stack_order_left
		<i> = 0
		begin
		if checksumequals a = ($hud_message_stack_order_left [<i>]) b = <id>
			<my_stack_index> = <i>
			break
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	if NOT gotparam my_stack_index
		softassert "Couldn't find screen element %i for message stack" i = <id>
		return
	endif
	if (<my_stack_index> > 0)
		<i> = 0
		begin
		if screenelementexists id = ($hud_message_stack_order_left [<i>])
			getscreenelementdims id = ($hud_message_stack_order_left [<i>])
			<basepos> = (<basepos> + <padding> + ((0.0, 1.0) * <height>))
		endif
		<i> = (<i> + 1)
		repeat <my_stack_index>
		if screenelementexists id = <id>
			doscreenelementmorph id = <id> pos = <basepos> time = 0.1 anim = ease_out
		endif
	endif
	return pos = <basepos>
endscript

script goal_get_counter_info 
	requireparams [counter_index] all
	if ((<counter_index> >= $hud_counters_size) || (<counter_index> < 0))
		softassert "Specified invalid counter_index %i" i = <counter_index>
		return
	endif
	<counter_id> = ($hud_counter_ids [<counter_index>])
	if NOT screenelementexists id = <counter_id>
		printf "ERROR: counter_id %d doesn't exist" d = <counter_id>
		return
	endif
	<counter_id> :getsingletag counter_info
	return counter_info = <counter_info>
endscript

script goal_set_counter_info 
	requireparams \{[
			counter_index
			params
		]
		all}
	if NOT gotparam \{counter_info}
		goal_get_counter_info counter_index = <counter_index>
		if NOT gotparam \{counter_info}
			return
		endif
	endif
	<counter_id> = ($hud_counter_ids [(<counter_index>)])
	<counter_id> :settags counter_info = {
		<counter_info>
		<params>
	}
endscript

script goal_update_counter counter_index = 0
	goal_get_counter_info counter_index = <counter_index>
	if NOT gotparam counter_info
		return
	endif
	if NOT screenelementexists id = (<counter_info>.element_id)
		softassert "element_id %d doesn't exist" d = (<counter_info>.element_id)
		return
	endif
	if gotparam number_collected
		<num_collected> = <number_collected>
	endif
	if gotparam num_collected
		goal_set_counter_info counter_info = <counter_info> counter_index = <counter_index> params = {number_collected = <num_collected>}
		goal_get_counter_info counter_index = <counter_index>
	endif
	switch <update_color>
		case greenlt
		<update_rgba> = [0 225 0 255]
		case green
		<update_rgba> = ($goal_career_ui_scheme.main)
		case bluedk
		<update_rgba> = [80 120 180 255]
		case bluelt
		<update_rgba> = [40 200 200 255]
		case violet
		<update_rgba> = ($goal_rigger_ui_scheme.main)
		case amber
		<update_rgba> = [180 140 60 255]
		case orange
		<update_rgba> = ($goal_hardcore_ui_scheme.main)
		case red
		<update_rgba> = ($goal_generic_ui_scheme.main)
		default
		<update_rgba> = [180 180 180 255]
	endswitch
	runscriptonscreenelement id = (<counter_info>.element_id) goal_update_counter_spawned params = (<...>)
endscript

script goal_update_counter_spawned 
	setspawninstancelimits max = 1 management = kill_oldest
	if ((<counter_info>.is_bar) = 1)
		<total_number_float> = ((<counter_info>.total_number) * 1.0)
		<dims_for_width> = ($hud_counter_bar_w * ((<counter_info>.number_collected) / <total_number_float>))
		casttointeger dims_for_width
		getscreenelementdims id = {(<counter_info>.element_id) child = bar}
		if (<width> < <dims_for_width>)
			addparams increase
		endif
		if gotparam update_rgba
			doscreenelementmorph id = {(<counter_info>.element_id) child = bar} rgba = <update_rgba> time = 0.25
		endif
		<marker_array> = (<counter_info>.marker_array)
		getarraysize <marker_array>
		begin
		setscreenelementprops {
			id = {(<counter_info>.element_id) child = bar}
			dims = (((1.0, 0.0) * <width>) + ((0.0, 1.0) * $hud_counter_bar_h))
		}
		<i> = 0
		begin
		doscreenelementmorph {
			id = {(<counter_info>.element_id) child = {marker_container child = <i>}}
			alpha = 1.0
		}
		<x> = ($hud_counter_bar_w * (((<marker_array> [<i>]).number) / <total_number_float>))
		casttointeger x
		if (<width> >= <x>)
			switch ((<marker_array> [<i>]).color)
				case greenlt
				<bar_rgba> = [0 225 0 255]
				case green
				<bar_rgba> = ($goal_career_ui_scheme.main)
				case bluedk
				<bar_rgba> = [80 120 180 255]
				case bluelt
				<bar_rgba> = [40 200 200 255]
				case violet
				<bar_rgba> = ($goal_rigger_ui_scheme.main)
				case amber
				<bar_rgba> = [180 140 60 255]
				case orange
				<bar_rgba> = ($goal_hardcore_ui_scheme.main)
				case red
				<bar_rgba> = ($goal_generic_ui_scheme.main)
				default
				<bar_rgba> = [180 180 180 255]
			endswitch
		endif
		if (<width> > <x>)
			doscreenelementmorph {
				id = {(<counter_info>.element_id) child = {marker_container child = <i>}}
				alpha = 0.0
			}
		endif
		<i> = (<i> + 1)
		repeat <array_size>
		if gotparam increase
			<width> = (<width> + 1)
			if (<width> > <dims_for_width>)
				break
			endif
		else
			<width> = (<width> - 1)
			if (<width> < <dims_for_width>)
				break
			endif
		endif
		if NOT gotparam no_wait
			wait 1 gameframe
		endif
		repeat
		doscreenelementmorph id = {(<counter_info>.element_id) child = bar} rgba = <bar_rgba> time = 0.25
	else
		formattext textname = counter_complete "%a %b" a = (<counter_info>.number_collected) b = (<counter_info>.text)
		setscreenelementprops id = {(<counter_info>.element_id) child = text} text = <counter_complete>
	endif
	if screenelementexists id = {(<counter_info>.element_id) child = bar_bg}
		getscreenelementdims id = {(<counter_info>.element_id) child = bar_bg}
		<bar_h> = <height>
	else
		<bar_h> = 0
	endif
	getscreenelementdims id = {(<counter_info>.element_id) child = text}
	<height> = (<bar_h> + <height>)
	setscreenelementprops id = (<counter_info>.element_id) dims = ((0.0, 1.0) * <height> + (0.0, 10.0))
	if screenelementexists id = {(<counter_info>.element_id) child = bg}
		if screenelementexists id = {(<counter_info>.element_id) child = {bg child = bg}}
			destroyscreenelement id = {(<counter_info>.element_id) child = {bg child = bg}}
			destroyscreenelement id = {(<counter_info>.element_id) child = {bg child = shadow}}
		endif
	endif
	ui_messages_check_position_right id = (<counter_info>.element_id)
endscript

script ui_kill_all_messages instant = 0
	if screenelementexists id = goal_ui_instruction
		ui_kill_message_hack id = goal_ui_instruction
	endif
	if screenelementexists id = goal_ui_instruction2
		ui_kill_message_hack id = goal_ui_instruction2
	endif
	if screenelementexists id = goal_ui_alert_signpost
		ui_kill_message_hack id = goal_ui_alert_signpost
	endif
	if screenelementexists id = goal_ui_dialog
		ui_kill_message_hack id = goal_ui_dialog
	endif
	<i> = 0
	begin
	ui_kill_message_hack id = ($hud_counter_ids [<i>])
	<i> = (<i> + 1)
	repeat $hud_counters_size
	<wait_for_morph> = 0
	if screenelementexists id = goal_ui_alert
		doscreenelementmorph id = goal_ui_alert scale = (2.5, 0.0) alpha = 0 time = 0.1 anim = ease_in
		<wait_for_morph> = 1
	endif
	if screenelementexists id = goal_ui_alert_icon
		doscreenelementmorph id = goal_ui_alert_icon scale = (2.5, 0.0) alpha = 0 time = 0.1 anim = ease_in
		<wait_for_morph> = 1
	endif
	if screenelementexists id = ui_alert
		doscreenelementmorph id = ui_alert scale = (2.5, 0.0) alpha = 0 time = 0.1 anim = ease_in pos = (-300.0, 300.0)
		<wait_for_morph> = 1
	endif
	if screenelementexists id = ui_alert_uber
		doscreenelementmorph id = ui_alert_uber scale = (2.5, 0.0) alpha = 0 time = 0.1 anim = ease_in
		if screenelementexists id = ui_alert_uber_background
			doscreenelementmorph id = ui_alert_uber_background alpha = 0 time = 0.1 anim = ease_out
		endif
		<wait_for_morph> = 1
	endif
	if screenelementexists id = goal_ui_alert
		ui_kill_message_hack id = goal_ui_alert
	endif
	if screenelementexists id = goal_ui_alert_icon
		ui_kill_message_hack id = goal_ui_alert_icon
	endif
	if screenelementexists id = ui_alert
		ui_kill_message_hack id = ui_alert
	endif
endscript

script ui_kill_message_hack 
	if screenelementexists id = <id>
		destroyscreenelement id = <id>
	endif
endscript

script goal_ui_kill_all_messages 
	killspawnedscript \{id = goal_ui_scripts}
	spawnscriptnow noqbid ui_kill_all_messages params = {<...>}
	spawnscriptnow \{noqbid
		goal_destroy_counter}
endscript

script ui_kill_message 
	switch <type>
		case alert_signpost
		ui_kill_message_hack id = ui_alert_signpost
		case alert
		ui_kill_message_hack id = ui_alert
		case counter
		if NOT gotparam counter_index
			<counter_index> = 0
		endif
		ui_kill_message_hack id = ($hud_counter_ids [<counter_index>])
		case instruction
		ui_kill_message_hack id = goal_ui_instruction
		case instruction_general
		ui_kill_message_hack id = goal_ui_instruction2
		case alert_goal
		<i> = 0
		begin
		if screenelementexists id = ($hud_counter_ids [<i>])
			doscreenelementmorph {
				id = ($hud_counter_ids [<i>])
				alpha = 1.0
				time = 0.25
			}
		endif
		<i> = (<i> + 1)
		repeat $hud_counters_size
		ui_kill_message_hack id = goal_ui_alert
		ui_kill_message_hack id = goal_ui_alert_icon
		case uberalert
		ui_kill_message_hack id = ui_alert_uber
		ui_kill_message_hack id = ui_alert_uber_background
		case dialog
		ui_kill_message_hack id = goal_ui_dialog
		default
		softassert "ui_kill_message called with unrecognized type '%t'" t = <type>
		ui_kill_message_hack id = goal_ui_alert
	endswitch
	ui_messages_check_all_positions
endscript

script goal_ui_kill_message 
	spawnscriptnow ui_kill_message id = <type> params = {<...>}
endscript

script goal_destroy_counter 
	spawnscriptnow ui_kill_message params = {<...> type = counter}
endscript

script ui_alert_signpost_script \{time = 0}
	if NOT (<time> = 0)
		wait <time> seconds ignoreslomo
		ui_kill_message \{type = alert_signpost}
	endif
endscript

script ui_alert_script \{time = 0}
	if NOT (<time> = 0)
		wait <time> seconds ignoreslomo
		ui_kill_message \{type = alert}
	endif
endscript

script ui_alert_uber_script \{time = 1.0}
	getscreenelementprops \{id = ui_alert_uber}
	<uberscale> = <scale>
	domorph {
		id = ui_alert_uber
		alpha = 1.0
		scale = (<uberscale> * 1.2)
		time = 0.25
	}
	if NOT (<time> = 0)
		wait <time> seconds ignoreslomo
		domorph id = ui_alert_uber scale = (<uberscale>) alpha = 0 time = 0.25
		ui_kill_message \{type = uberalert}
	endif
endscript

script goal_ui_counter_script \{time = 0}
	if NOT (<time> = 0)
		wait <time> seconds ignoreslomo
		ui_kill_message \{type = counter}
	endif
endscript

script goal_ui_instruction_script time = 0
	gettags
	resolvescreenelementid id = {<id> child = icon_1}
	if screenelementexists id = <resolved_id>
		<resolved_id> :getsingletag scale
		doscreenelementmorph {
			id = <resolved_id>
			scale = (<scale> * 2.0)
		}
		doscreenelementmorph {
			id = <resolved_id>
			scale = <scale>
			alpha = 1.0
			time = 0.3
		}
		<resolved_id1> = <resolved_id>
		resolvescreenelementid id = {<id> child = icon_2}
		doscreenelementmorph {
			id = <resolved_id>
			alpha = 1.0
		}
		wait 0.3 seconds ignoreslomo
		doscreenelementmorph {
			id = <resolved_id>
			scale = (<scale> * 2.0)
			alpha = 0.0
			time = 0.3
		}
		wait 0.3 seconds ignoreslomo
	endif
	<id> :getsingletag no_fade
	if (<no_fade> = 0)
		doscreenelementmorph id = {<id> child = text} alpha = 1.0 time = 0.25
		wait 1.0 seconds ignoreslomo
		doscreenelementmorph {
			id = {<id> child = text2}
			alpha = 1.0
			time = 0.25
		}
		wait 0.25 seconds ignoreslomo
		doscreenelementmorph {
			id = {<id> child = text}
			alpha = 0.0
			time = 0.25
		}
		if gotparam resolved_id1
			doscreenelementmorph {
				id = <resolved_id1>
				scale = (<scale> * 0.5)
				alpha = 0.0
				time = 0.3
			}
		endif
	else
		doscreenelementmorph id = {<id> child = text} alpha = 1.0
	endif
	if NOT (<time> = 0)
		wait <time> seconds ignoreslomo
		domorph alpha = 0.0 time = 0.5
		ui_kill_message type = instruction
	endif
endscript

script goal_ui_instruction2_script time = 0
	gettags
	resolvescreenelementid id = {<id> child = icon_1}
	if screenelementexists id = <resolved_id>
		<resolved_id> :getsingletag scale
		doscreenelementmorph {
			id = <resolved_id>
			scale = (<scale> * 2.0)
		}
		doscreenelementmorph {
			id = <resolved_id>
			scale = <scale>
			alpha = 1.0
			time = 0.3
		}
		<resolved_id1> = <resolved_id>
		resolvescreenelementid id = {<id> child = icon_2}
		doscreenelementmorph {
			id = <resolved_id>
			alpha = 1.0
		}
		wait 0.3 seconds ignoreslomo
		doscreenelementmorph {
			id = <resolved_id>
			scale = (<scale> * 2.0)
			alpha = 0.0
			time = 0.3
		}
		wait 0.3 seconds ignoreslomo
	endif
	<id> :getsingletag no_fade
	if (<no_fade> = 0)
		doscreenelementmorph id = {<id> child = text} alpha = 1.0 time = 0.25
		wait 1.0 seconds ignoreslomo
		doscreenelementmorph {
			id = {<id> child = text2}
			alpha = 1.0
			time = 0.25
		}
		wait 0.25 seconds ignoreslomo
		doscreenelementmorph {
			id = {<id> child = text}
			alpha = 0.0
			time = 0.25
		}
		if gotparam resolved_id1
			doscreenelementmorph {
				id = <resolved_id1>
				scale = (<scale> * 0.5)
				alpha = 0.0
				time = 0.3
			}
		endif
	else
		doscreenelementmorph id = {<id> child = text} alpha = 1.0
	endif
	if NOT (<time> = 0)
		wait <time> seconds ignoreslomo
		ui_kill_message type = instruction_general
	endif
endscript

script goal_ui_alert_script time = 0
	gettags
	doscreenelementmorph {
		id = {<id> child = text}
		alpha = 0.0
		scale = 0.5
		relative_scale
	}
	doscreenelementmorph {
		id = {<id> child = second_text}
		alpha = 1.0
		scale = 2.0
		relative_scale
	}
	doscreenelementmorph {
		id = {<id> child = second_text}
		alpha = 0.0
		scale = 0.5
		time = 0.3
		relative_scale
	}
	wait 0.1 seconds ignoreslomo
	doscreenelementmorph {
		id = {<id> child = text}
		alpha = 1.0
		scale = 1.0
		time = 0.2
		relative_scale
	}
	if screenelementexists id = goal_ui_alert_icon
		goal_ui_alert_icon :getsingletag scale
		doscreenelementmorph {
			id = goal_ui_alert_icon
			scale = (<scale> * 2.0)
			alpha = 0.0
		}
		doscreenelementmorph {
			id = goal_ui_alert_icon
			scale = <scale>
			alpha = 1.0
			time = 0.3
		}
		if screenelementexists id = goal_ui_alert_icon_top
			doscreenelementmorph {
				id = goal_ui_alert_icon_top
				scale = <scale>
				alpha = 0.0
			}
			doscreenelementmorph {
				id = goal_ui_alert_icon_top
				scale = (<scale> * 0.5)
				alpha = 1.0
				time = 0.3
			}
		endif
		doscreenelementmorph {
			id = goal_ui_alert_icon2
			scale = <scale>
			alpha = 1.0
		}
		wait 0.3 seconds ignoreslomo
		doscreenelementmorph {
			id = goal_ui_alert_icon2
			scale = (<scale> * 2.0)
			alpha = 0.0
			time = 0.3
		}
		<time> = (<time> - 0.2)
	endif
	if NOT (<time> < 0)
		wait <time> seconds ignoreslomo
		ui_kill_message type = alert_goal
	endif
endscript

script goal_ui_dialog_script \{time = 0}
	if NOT (<time> = 0)
		wait <time> seconds ignoreslomo
		ui_kill_message \{type = dialog}
	endif
endscript

script Chalk_AnnounceStateUI chalk_announce_time = 2
	printf 'starting Chalk_AnnounceStateUI'
	if screenelementexists id = chalk_base_id
		destroyscreenelement id = chalk_base_id
	endif
	createscreenelement {
		type = containerelement
		parent = player1_panel_container
		id = chalk_base_id
		just = [left top]
		pos = (66.0, 340.0)
		alpha = 0
	}
	switch <chalk_announce>
		case announce
		ui_display_message type = alert_goal text = "SKILL CHALLENGE!" color = green icon = hud_message_overspray time = 5
		case announce_line
		ui_display_message type = alert_goal text = "LINE CHALLENGE!" color = green icon = hud_message_overspray time = 2
		case am_possible
		ui_display_message type = alert_goal text = "LAND IT FOR AM..." color = orange time = 3
		case am_achieved
		ui_display_message type = alert_goal text = "ACHIEVED AM" color = orange time = 3
		case am_success
		ui_display_message type = uberalert text = "SUCCESS!" color = green time = 3 has_background
		ui_display_message type = alert_goal text = "Grade: AM!" color = orange icon = icon_small_am time = 5
		case pro_possible
		ui_display_message type = alert_goal text = "LAND IT FOR PRO..." color = bluelt time = 5
		case pro_achieved
		ui_display_message type = alert_goal text = "ACHIEVED PRO" color = bluelt time = 3
		case pro_success
		ui_display_message type = uberalert text = "SUCCESS!" color = green time = 3 has_background
		ui_display_message type = alert_goal text = "Grade: PRO!" color = bluelt icon = icon_small_pro time = 5
		case sick_possible
		ui_display_message type = alert_goal text = "LAND IT FOR SICK..." color = amber time = 5
		case sick_achieved
		ui_display_message type = alert_goal text = "ACHIEVED SICK" color = amber time = 3
		case sick_success
		ui_display_message type = uberalert text = "SUCCESS!" color = green time = 3 has_background
		ui_display_message type = alert_goal text = "Grade: SICK!" color = amber icon = icon_small_sick time = 5
		case success_but_not_better_than_previous_grade
		ui_display_message type = instruction text = "You didn't beat your best grade. TRY AGAIN!" time = 3
		case success_but_already_achieved_sick
		ui_display_message type = instruction text = "SICK already achieved!" time = 3
		case success
		ui_display_message type = uberalert text = "SUCCESS!" color = green has_background
		case failed_prompt_retry
		ui_display_message type = uberalert text = "FAILED!" color = red has_background
		case failed
		default
		ui_display_message type = uberalert text = "FAILED!" color = red has_background
	endswitch
	if gotparam callback_script
		chalk_base_id :obj_spawnscriptnow {
			Chalk_AnnounceStateUI_Spawned
			params = {
				callback_script = <callback_script>
				callback_params = <callback_params>
			}
		}
	endif
endscript

script Chalk_AnnounceStateUI_CreateSimple 
	createscreenelement {
		type = spriteelement
		parent = chalk_base_id
		texture = HUD_bg_timer
		rgba = <bg_color>
		pos = (0.0, -4.0)
		just = [left top]
		scale = <bg_scale>
		z_priority = 0
	}
	createscreenelement {
		type = textelement
		parent = chalk_base_id
		id = chalk_announce_id
		font = text_a1
		text = <main_text>
		pos = (35.0, 0.0)
		just = [left top]
		scale = 0.5
		alpha = 1
		rgba = <text_color>
		shadow
		shadow_rgba = [64 64 64 255]
		shadow_offs = (1.0, 1.0)
	}
endscript

script Chalk_AnnounceStateUI_CreateGrade 
	createscreenelement {
		type = textelement
		parent = chalk_base_id
		font = text_a1
		text = <type_text>
		pos = (0.0, 0.0)
		just = [left top]
		scale = 0.5
		alpha = 1
		rgba = [220 220 180 255]
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (1.0, 1.0)
	}
	getscreenelementdims id = <id>
	<offset> = (<width> * (1.0, 0.0) + (10.0, 0.0))
	createscreenelement {
		type = containerelement
		parent = chalk_base_id
		pos = <offset>
	}
	<container_id> = <id>
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		texture = HUD_bg_timer
		rgba = <bg_color>
		pos = (0.0, -4.0)
		just = [left top]
		scale = (1.8, 0.5)
		z_priority = 0
	}
	if checksumequals a = <icon> b = icon_small_am
		<scale> = 0.67
	else
		<scale> = 0.33
	endif
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		pos = (5.0, 0.0)
		just = [left top]
		scale = <scale>
		texture = <icon>
	}
	createscreenelement {
		type = textelement
		parent = <container_id>
		font = text_a1
		text = <main_text>
		pos = (35.0, 0.0)
		just = [left top]
		scale = 0.5
		alpha = 1
		rgba = <text_color>
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (1.0, 1.0)
	}
endscript

script Chalk_AnnounceStateUI_Spawned 
	domorph \{alpha = 1
		time = 0.25}
	wait <chalk_announce_time> seconds ignoreslomo
	domorph \{alpha = 0
		time = 0.5}
	if gotparam \{callback_script}
		spawnscriptnow <callback_script> params = <callback_params>
	endif
	die
endscript
goal_dialog_box_active = 0

script goal_dialog_box 
	change goal_dialog_box_active = 1
	if gman_getactivatedgoalid
		gman_pausegoal goal = <activated_goal_id>
	endif
	pauseskaters
	skater :pausephysics
	create_dialog_box {
		title = <title>
		text = <text>
		buttons = [
			{
				text = "\\m0 Continue"
				pad_choose_script = goal_dialog_box_ok
			}
		]
		no_helper_text
	}
	startrendering
	block type = event_dialog_ok
	if gotparam activated_goal_id
		gman_unpausegoal goal = <activated_goal_id>
	endif
	change goal_dialog_box_active = 0
endscript

script goal_dialog_box_ok 
	dialog_box_exit
	unpauseskaters
	skater :unpausephysics
	broadcastevent \{type = event_dialog_ok}
endscript

script goal_ui_trick_stacker_num_remaining 
	gman_getdata goal = $trick_stacker_goal
	getarraysize <trick_list>
	<tricks_remaining> = (<array_size> - 1)
	formattext textname = num_text '%t' t = <tricks_remaining>
	if screenelementexists id = goal_ui_trick_stacker_remaining
		destroyscreenelement id = goal_ui_trick_stacker_remaining
	endif
	createscreenelement {
		id = goal_ui_trick_stacker_remaining
		parent = player1_panel_container
		type = textelement
		text = <num_text>
		font = text_a1
		pos = (500.0, 350.0)
		scale = 0.75
		just = [center center]
		shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [0 0 0 255]
		not_focusable
	}
	begin
	block anytypes = [
		{type = event_trick_stacker_hide_num_remaining}
		{type = event_trick_stacker_show_num_remaining}
		{type = event_add_trick_approved}
	]
	switch <event_type>
		case event_trick_stacker_hide_num_remaining
		goal_ui_trick_stacker_remaining :domorph alpha = 0
		case event_trick_stacker_show_num_remaining
		goal_ui_trick_stacker_remaining :domorph alpha = 1
		case event_add_trick_approved
		<tricks_remaining> = (<tricks_remaining> - 1)
		formattext textname = num_text '%t' t = <tricks_remaining>
		setscreenelementprops id = goal_ui_trick_stacker_remaining text = <num_text>
		if (<tricks_remaining> = 0)
			destroyscreenelement id = goal_ui_trick_stacker_remaining
			break
		endif
	endswitch
	repeat
endscript

script goal_ui_trick_stacker_update 
	<trick_stacker_slots> = 6
	formattext checksumname = element 'goal_ui_trick_stacker_%i' i = <id>
	formattext textname = element_text 'goal_ui_trick_stacker_%i' i = <id>
	switch <status>
		case add
		printf channel = ui '##### Add %e' e = <element_text>
		if NOT (<id> = 'crusher')
			goal_ui_trick_stacker_determine_pos
			<alpha> = 0
			<rot_angle> = -360
			<pointer_pos> = ((585.0, 0.0) + ((0.0, 1.0) * (<pos>.(0.0, 1.0))))
			doscreenelementmorph id = ui_pointer pos = <pointer_pos> time = 0.3 anim = ease_in
		else
			<pos> = (500.0, 35.0)
			<alpha> = 1
			<rot_angle> = 0
		endif
		createscreenelement {
			id = <element>
			parent = player1_panel_container
			type = textblockelement
			text = <trick_text>
			font = text_a1
			pos = (500.0, -50.0)
			dims = (315.0, 0.0)
			allow_expansion
			scale = 0.45000002
			just = [center center]
			rgba = <rgba>
			shadow
			shadow_offs = (2.0, 2.0)
			shadow_rgba = [0 0 0 255]
			not_focusable
			alpha = <alpha>
		}
		<element> :domorph pos = <pos> time = 0.5 rot_angle = <rot_angle> alpha = 1
		soundevent event = stacker_sfx_add_trick
		case pending
		printf channel = ui '##### Pending %e' e = <element_text>
		<element> :domorph alpha = 0.3
		case remove
		printf channel = ui '##### Remove %e' e = <element_text>
		doscreenelementmorph id = <element> scale = (2.5, 0.0) alpha = 0 time = 0.1 anim = ease_in
		wait 0.1 seconds ignoreslomo
		ui_kill_message_hack id = <element>
		broadcastevent type = event_trick_stacker_collapse_stack
		case restore
		printf channel = ui '##### Restore %e' e = <element_text>
		<element> :domorph alpha = 1.0
	endswitch
endscript

script goal_ui_trick_stacker_determine_pos base_pos = (500.0, 350.0)
	gman_getdata goal = $trick_stacker_goal
	getarraysize <trick_list>
	<pos> = <base_pos>
	<offset> = (0.0, -55.0)
	<current_id> = 0
	begin
	formattext checksumname = element 'goal_ui_trick_stacker_%i' i = <current_id>
	if screenelementexists id = <element>
		<pos> = (<pos> + <offset>)
	endif
	<current_id> = (<current_id> + 1)
	repeat <array_size>
	return pos = <pos>
endscript

script goal_ui_trick_stacker_collapse_stack base_pos = (500.0, 350.0)
	begin
	block type = event_trick_stacker_collapse_stack
	wait 5 gameframes
	gman_getdata goal = $trick_stacker_goal
	getarraysize <trick_list>
	<pos> = <base_pos>
	<offset> = (0.0, -55.0)
	<current_id> = 0
	printf channel = ui '----- goal_UI_trick_stacker_collapse_stack : processing...'
	begin
	formattext checksumname = element 'goal_ui_trick_stacker_%i' i = <current_id>
	if screenelementexists id = <element>
		printf channel = ui '----- moving element %i to pos %p' i = <current_id> p = <pos>
		doscreenelementmorph id = <element> pos = <pos> time = 0.1 anim = ease_in
		<pos> = (<pos> + <offset>)
	endif
	<current_id> = (<current_id> + 1)
	repeat <array_size>
	soundevent event = soundevent event = sk8_filmtricklandsfx
	broadcastevent type = event_trick_stacker_show_num_remaining
	<posy> = (<pos>.(0.0, 1.0))
	if (<posy> < 350)
		<pos> = (<pos> - <offset>)
	endif
	<pointer_pos> = ((585.0, 0.0) + ((0.0, 1.0) * (<pos>.(0.0, 1.0))))
	doscreenelementmorph id = ui_pointer pos = <pointer_pos>
	repeat
endscript

script goal_ui_trick_stacker_crush_stack base_pos = (500.0, 500.0)
	gman_getdata goal = $trick_stacker_goal
	getarraysize <trick_list>
	<current_id> = <array_size>
	doscreenelementmorph id = goal_ui_trick_stacker_crusher pos = <base_pos> time = 1 alpha = 1 anim = ease_out
	printf channel = ui '----- goal_UI_trick_stacker_drop_stack : processing...'
	begin
	formattext checksumname = element 'goal_ui_trick_stacker_%i' i = <current_id>
	formattext textname = element_text 'goal_ui_trick_stacker_%i' i = <current_id>
	if screenelementexists id = <element>
		printf channel = ui '%e crushed' e = <element_text>
		<pos> = (<base_pos> + ((1.0, 0.0) * (2 * (RandomRange (-50.0, 50.0)))))
		<spin> = (2 * (RandomRange (-360.0, 360.0)))
		doscreenelementmorph id = <element> pos = <pos> time = 1 rot_angle = <spin> alpha = 0 anim = ease_out
		wait 0.1 seconds ignoreslomo
	else
		printf channel = ui '%e does not exist' e = <element_text>
	endif
	<current_id> = (<current_id> - 1)
	repeat <array_size>
	broadcastevent type = event_drop_stack_complete
endscript

script goal_ui_trick_stacker_die 
	gman_getdata goal = $trick_stacker_goal
	getarraysize <trick_list>
	<current_id> = 0
	begin
	formattext checksumname = element 'goal_ui_trick_stacker_%i' i = <current_id>
	if screenelementexists id = <element>
		destroyscreenelement id = <element>
	endif
	<current_id> = (<current_id> + 1)
	repeat <array_size>
	if screenelementexists id = goal_ui_trick_stacker_crusher
		destroyscreenelement id = goal_ui_trick_stacker_crusher
	endif
	if screenelementexists id = mission_ui
		destroyscreenelement id = mission_ui
	endif
endscript

script goal_UI_trick_stacker_scale 
	if screenelementexists id = mission_ui
		destroyscreenelement id = mission_ui
	endif
	createscreenelement {
		id = mission_ui
		parent = player1_panel_container
		type = containerelement
		pos = (0.0, 0.0)
	}
	createscreenelement {
		id = UI_bg
		parent = mission_ui
		type = spriteelement
		pos = (590.0, 210.0)
		scale = 0.7
		texture = HUD_meter_scale_bg
		z_priority = 0
	}
	createscreenelement {
		id = UI_skull
		parent = mission_ui
		type = spriteelement
		pos = (590.0, 50.0)
		texture = HUD_meter_scale_skull
		z_priority = 2
	}
	createscreenelement {
		id = ui_pointer
		parent = mission_ui
		type = spriteelement
		pos = (585.0, 50.0)
		scale = 0.5
		texture = HUD_meter_scale_pointer
		z_priority = 1
	}
endscript

script goal_ui_announce_pending_grade 
	requireparams [goal grade mode] all
	if (<grade> = 0)
		if NOT checksumequals a = <mode> b = fail
			softassert 'Unexpectedly showing %m ui for grade = 0.' m = <mode>
		endif
	endif
	switch <mode>
		case fail
		goal_ui_display_message type = uberalert color = red text = "lost it!"
		case land_it
		formattext textname = announcemsg "land it for %s" s = ($goal_grade_text [<grade>])
		goal_ui_display_message type = uberalert color = green text = <announcemsg>
		case got_it
		formattext textname = announcemsg "got %s!" s = ($goal_grade_text [<grade>])
		goal_ui_display_message type = uberalert color = green text = <announcemsg>
		default
		softassert 'Unknown mode %m' m = <mode>
	endswitch
endscript

script goal_ui_alert_border 
	createscreenelement {
		type = containerelement
		parent = <parent>
		dims = (((1.0, 0.0) * <width>) + (<height> * (0.0, 1.0)))
		pos = <pos>
		just = [center top]
		scale = <scale>
	}
	<border_id> = <id>
	<temp_height> = (((<height> / 20) * 50) + 50)
	createscreenelement {
		type = spriteelement
		parent = <border_id>
		texture = HUD_alert_top
		pos = (0.0, 0.0)
		just = [right center]
		rgba = <rgba>
	}
	createscreenelement {
		type = spriteelement
		parent = <border_id>
		texture = HUD_alert_side
		rot_angle = -90
		pos = (-15.0, -2.0)
		just = [center top]
		dims = ((12.0, 0.0) + (0.0, 331.0))
		rgba = <rgba>
	}
	createscreenelement {
		type = spriteelement
		parent = <border_id>
		texture = HUD_alert_corner
		pos = (250.0, -6.0)
		just = [right top]
		rgba = <rgba>
	}
	createscreenelement {
		type = spriteelement
		parent = <border_id>
		texture = HUD_alert_side
		pos = (245.0, -2.0)
		just = [center top]
		dims = ((12.0, 0.0) + ((0.0, 1.0) * <temp_height>))
		rgba = <rgba>
	}
	createscreenelement {
		type = spriteelement
		parent = <border_id>
		texture = HUD_alert_corner
		rot_angle = 90
		pos = ((250.0, 0.0) + ((0.0, 1.0) * <temp_height>) + (-2.0, -6.0))
		just = [left top]
		rgba = <rgba>
	}
	createscreenelement {
		type = spriteelement
		parent = <border_id>
		texture = HUD_alert_side
		rot_angle = -90
		pos = ((250.0, 0.0) + ((0.0, 1.0) * <temp_height>) + (-12.0, 7.0))
		just = [center bottom]
		dims = ((12.0, 0.0) + (0.0, 432.0))
		rgba = <rgba>
	}
	createscreenelement {
		type = spriteelement
		parent = <border_id>
		texture = HUD_alert_corner
		rot_angle = 180
		pos = ((-100.0, 0.0) + ((0.0, 1.0) * <temp_height>) + (-2.0, -4.0))
		just = [right bottom]
		rgba = <rgba>
	}
	createscreenelement {
		type = spriteelement
		parent = <border_id>
		texture = HUD_alert_side
		pos = ((-100.0, 0.0) + ((0.0, 1.0) * <temp_height>) + (4.0, 0.0))
		just = [center bottom]
		dims = ((12.0, 0.0) + ((0.0, 1.0) * (<temp_height> - 100)))
		rgba = <rgba>
	}
	createscreenelement {
		type = spriteelement
		parent = <border_id>
		texture = HUD_alert_sideedge
		pos = ((-100.0, 0.0) + ((0.0, 1.0) * (<temp_height> - (<temp_height> - 100))) + (2.0, 0.0))
		just = [center bottom]
		dims = (16.0, 64.0)
		rgba = <rgba>
	}
endscript
