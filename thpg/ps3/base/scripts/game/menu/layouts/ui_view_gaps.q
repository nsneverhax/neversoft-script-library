
script ui_create_view_gaps 
	printf "UI: ui_create_view_gaps"
	make_cas_menu {
		title = "GAPS"
		pausemenu
		PauseMap
		back_state = UIstate_view_missions
		scrolling
	}
	add_cas_menu_item {
		text = "Philadelphia"
		cas_heading
	}
	add_cas_menu_item {
		text = "Inner-city Philly"
		pad_choose_script = ui_create_view_gap_list
		pad_choose_params = {text = "Inner-city Philly" zone = z_slums}
	}
	add_cas_menu_item {
		text = "Love Park"
		pad_choose_script = ui_create_view_gap_list
		pad_choose_params = {text = "Love Park" zone = z_love}
	}
	add_cas_menu_item {
		text = "Downtown Philly"
		pad_choose_script = ui_create_view_gap_list
		pad_choose_params = {text = "Downtown Philly" zone = z_bell}
	}
	add_cas_menu_item {
		text = "FDR Skatepark"
		pad_choose_script = ui_create_view_gap_list
		pad_choose_params = {text = "FDR Skatepark" zone = z_fdr}
	}
	add_cas_menu_item {
		text = "Bay Bridge-Tunnel"
		pad_choose_script = ui_create_view_gap_list
		pad_choose_params = {text = "Bay Bridge-Tunnel" zone = z_pb_bridge}
	}
	add_cas_menu_item {
		text = "Baltimore"
		cas_heading
	}
	add_cas_menu_item {
		text = "Downtown Baltimore"
		pad_choose_script = ui_create_view_gap_list
		pad_choose_params = {text = "Downtown Baltimore" zone = z_bcity}
	}
	add_cas_menu_item {
		text = "Baltimore Inner Harbor"
		pad_choose_script = ui_create_view_gap_list
		pad_choose_params = {text = "Baltimore Inner Harbor" zone = z_harbor}
	}
	add_cas_menu_item {
		text = "Lansdowne"
		pad_choose_script = ui_create_view_gap_list
		pad_choose_params = {text = "Lansdowne" zone = z_lansdowne}
	}
	add_cas_menu_item {
		text = "Harbor Bridge"
		pad_choose_script = ui_create_view_gap_list
		pad_choose_params = {text = "Harbor Bridge" zone = z_bw_bridge}
	}
	add_cas_menu_item {
		text = "Washington DC"
		cas_heading
	}
	add_cas_menu_item {
		text = "National Mall"
		pad_choose_script = ui_create_view_gap_list
		pad_choose_params = {text = "National Mall" zone = z_museums}
	}
	add_cas_menu_item {
		text = "Freedom Plaza"
		pad_choose_script = ui_create_view_gap_list
		pad_choose_params = {text = "Freedom Plaza" zone = z_monuments}
	}
	add_cas_menu_item {
		text = "Air and Space Museum"
		pad_choose_script = ui_create_view_gap_list
		pad_choose_params = {text = "Air and Space Museum" zone = z_museum_int}
	}
	add_cas_menu_item {
		text = "Metro"
		pad_choose_script = ui_create_view_gap_list
		pad_choose_params = {text = "Metro" zone = z_wp_bridge}
	}
	launchevent type = focus target = pause_map
	killMapIcons parent = pause_map
	if NOT IsInCrib
		GetSkaterPosition
		if (gotparam x)
			<posx> = (<x> + 512)
			<posz> = (<z> + 512)
			calculateProportional pos = (((1.0, 0.0) * <posx>) + ((0.0, 1.0) * <posz>)) dims = (1024.0, 1024.0)
			if skater :inair
				skater :getlastgroundheading
				heading = <last_heading>
			else
				skater :getheading
			endif
			addMapIcon {
				parent = pause_map
				icon_create_script = UI_map_player_create
				icon_create_params = {texture = player_cursor rgba = ($goal_ui_scheme.main) rot_angle = (<heading> - 180)}
				icon_focus_script = UI_map_player_focus
				icon_unfocus_script = UI_map_icon_unfocus
				pos = <pro_pos>
				local_id = skater
			}
			runscriptonscreenelement id = pause_map moveMapToIcon params = {parent = pause_map local_id = skater time = 0.0 zoom = 1.4}
		endif
	endif
	cas_menu_finish {
		helper_text = {
			helper_text_elements = [
				{text = "\\m1 BACK"}
				{text = "\\m0 accept"}
				{text = "\\mj+\\bl ZOOM MAP"}
			]
		}
	}
endscript

script ui_create_view_gap_list 
	if NOT ((gotparam text) || (gotparam zone))
		ui_create_view_gaps
		return
	endif
	CreateGapList zone = <zone>
	getarraysize <gaplist>
	make_cas_menu {
		title = <text>
		pausemenu
		PauseMap
		pad_back_script = ui_create_view_gaps
		scrolling
	}
	launchevent type = focus target = pause_map
	killMapIcons parent = pause_map
	if NOT IsInCrib
		GetSkaterPosition
		if (gotparam x)
			<posx> = (<x> + 512)
			<posz> = (<z> + 512)
			calculateProportional pos = (((1.0, 0.0) * <posx>) + ((0.0, 1.0) * <posz>)) dims = (1024.0, 1024.0)
			if skater :inair
				skater :getlastgroundheading
				heading = <last_heading>
			else
				skater :getheading
			endif
			addMapIcon {
				parent = pause_map
				icon_create_script = UI_map_player_create
				icon_create_params = {texture = player_cursor rgba = ($goal_ui_scheme.main) rot_angle = (<heading> - 180)}
				icon_focus_script = UI_map_player_focus
				icon_unfocus_script = UI_map_icon_unfocus
				pos = <pro_pos>
				local_id = skater
			}
		endif
	endif
	createscreenelement {
		type = containerelement
		id = gaps_info_container
		parent = main_menu_anchor
		pos = (900.0, 525.0)
		just = [center top]
		child_anchor = [left center]
		dims = (400.0, 100.0)
		z_priority = 100
		alpha = 0.0
	}
	createscreenelement {
		type = spriteelement
		parent = gaps_info_container
		texture = white
		dims = (400.0, 100.0)
		pos = (0.0, 0.0)
		just = [left center]
		alpha = 0.5
		rgba = [0 0 0 255]
		z_priority = 99
	}
	createscreenelement {
		type = textelement
		parent = gaps_info_container
		font = text_a1
		text = "times cleared:"
		pos = (15.0, -20.0)
		just = [left center]
		rgba = [200 200 200 255]
		scale = (0.8, 0.7)
	}
	createscreenelement {
		type = textelement
		parent = gaps_info_container
		font = text_a1
		text = "gap score:"
		pos = (15.0, 20.0)
		just = [left center]
		rgba = [200 200 200 255]
		scale = (0.8, 0.7)
	}
	createscreenelement {
		type = textelement
		parent = gaps_info_container
		id = gaps_info_tries
		font = text_a1
		text = ""
		pos = (385.0, -20.0)
		just = [right center]
		rgba = [200 200 200 255]
		scale = (0.8, 0.7)
	}
	createscreenelement {
		type = textelement
		parent = gaps_info_container
		id = gaps_info_score
		font = text_a1
		text = ""
		pos = (385.0, 20.0)
		just = [right center]
		rgba = [200 200 200 255]
		scale = (0.8, 0.7)
	}
	<i> = 0
	begin
	gap_menu_add_item (<gaplist> [<i>])
	<i> = (<i> + 1)
	repeat <array_size>
	doscreenelementmorph id = gaps_info_container alpha = 1.0 time = 0.5
	cas_menu_finish {
		helper_text = {
			helper_text_elements = [
				{text = "\\m1 BACK"}
				{text = "\\mj+\\bl ZOOM MAP"}
			]
		}
	}
endscript

script ui_destroy_view_gaps 
	printf \{"UI: ui_destroy_view_gaps"}
	generic_ui_destroy
endscript

script gap_menu_add_item choose_script = nullscript
	if (<times> < 1)
		rgba = [64 64 64 255]
	endif
	formattext textname = times_text "%d" d = <times> usecommas
	formattext textname = score_text "%d" d = <gap_score> usecommas
	add_cas_menu_item {
		text = <gap_name>
		additional_focus_script = ui_view_gaps_focus
		additional_focus_params = {<...>}
		additional_unfocus_script = ui_view_gaps_unfocus
		additional_unfocus_params = {<...>}
		text_width = 160
		rgba = <rgba>
	}
	if (<times> > 0)
		if gotparam mappos
			<posx> = ((<mappos> [0]) + 512)
			<posz> = ((<mappos> [1]) + 512)
			calculateProportional pos = (((1.0, 0.0) * <posx>) + ((0.0, 1.0) * <posz>)) dims = (1024.0, 1024.0)
			formattext checksumname = gap_check '%c' c = <gap_number>
			if (screenelementexists id = pause_map)
				addMapIcon {
					parent = pause_map
					icon_create_script = UI_map_icon_create
					icon_create_params = {texture = HUD_alert_excl_icon glow_texture = HUD_alert_icon_glow rgba = [70 192 255 255]}
					icon_focus_script = UI_map_icon_focus
					icon_unfocus_script = UI_map_icon_unfocus
					pos = <pro_pos>
					scale = 0.5
					local_id = <gap_check>
				}
			endif
		endif
	endif
endscript

script ui_view_gaps_focus 
	formattext checksumname = gap_check '%c' c = <gap_number>
	if (<times> > 0)
		if (screenelementexists id = pause_map)
			runscriptonscreenelement id = pause_map moveMapToIcon params = {parent = pause_map local_id = <gap_check> time = 0.5 zoom = 1.5}
		endif
	endif
	setscreenelementprops id = gaps_info_tries text = ""
	setscreenelementprops id = gaps_info_score text = ""
	setscreenelementprops id = gaps_info_tries text = <times_text>
	setscreenelementprops id = gaps_info_score text = <score_text>
endscript

script ui_view_gaps_unfocus 
endscript

script view_gaps_update_help_text 
	switch <options>
		case gap
		create_helper_text {
			parent = current_menu_anchor
			helper_pos = (318.0, 426.0)
			helper_text_elements = [{text = "\\m1 BACK"}
			]
		}
		case done
		create_helper_text {
			parent = current_menu_anchor
			helper_pos = (318.0, 426.0)
			helper_text_elements = [{text = "\\m1 BACK"}
				{text = "\\m0 ACCEPT"}
			]
		}
	endswitch
endscript
