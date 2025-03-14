ui_endrankings_active = 0
ui_endrankings_colors = {
	bg_color = [
		30
		20
		10
		110
	]
	title_bg_rgba = [
		65
		20
		30
		90
	]
	title_rgba = [
		100
		90
		80
		250
	]
	title_flourish_rgba = [
		100
		90
		80
		50
	]
	sponsor_bg = [
		90
		70
		50
		70
	]
	highlight_rgba = [
		65
		20
		30
		255
	]
	highlight_text_rgba = [
		110
		110
		110
		255
	]
}

script ui_endrankings_create 
	change \{ui_endrankings_active = 1}
	update_ranking
	createscreenelement \{id = endrankings_events
		type = containerelement
		parent = root_window}
	spawnscriptnow \{ui_endrankings_create_spawned
		id = ui_endrankings}
endscript

script ui_endrankings_destroy 
	printf \{"ui_endrankings_destroy"}
	printpushpopdebuginfo \{pop
		name = "ui_endrankings_destroy"}
	popsoundbussparams
	enableusermusic
	generic_ui_destroy
	killspawnedscript \{id = ui_endrankings}
	destroyscreenelement \{id = endrankings_events}
	change \{ui_endrankings_active = 0}
endscript

script ui_endrankings_create_spawned 
	printpushpopdebuginfo \{push
		name = "ui_endrankings_create_spawned"}
	pushsoundbussparams
	if ($global_user_sfx_number = 0)
		setsoundbussparams \{$default_bussset
			time = 0.5}
	else
		enableusermusic \{disable}
		setsoundbussparams \{$no_music_at_all_bussset
			time = 0.5}
	endif
	ui_endrankings_show_rankings
	wait \{5
		seconds}
	generic_ui_destroy
	ui_endrankings_show_records
endscript

script ui_endrankings_show_rankings 
	ui_endrankings_create_menu title = "TONY HAWK'S PROJECT 8"
	doscreenelementmorph id = current_menu_anchor scale = 1.2 pos = (-65.0, -20.0)
	cas_menu_finish {
		no_focus
		dont_scale_bg
		helper_text = {helper_text_elements = [{text = ""}]}
	}
	<i> = 0
	begin
	GetSpecificRanking rank = (<i> + 1)
	ui_endrankings_add_ranking data = <rank_data> index = <i> tag_grid_x = (<i> + 1)
	<i> = (<i> + 1)
	wait 0.7 seconds
	repeat 8
endscript

script ui_endrankings_add_record 
	add_cas_menu_item {
		text = <text>
		text_offset = (-70.0, 0.0)
		extra_text = <value_text>
		extras_offset = (100.0, 0.0)
	}
endscript

script ui_endrankings_show_records 
	ui_endrankings_create_menu \{title = "YOUR ACCOMPLISHMENTS"}
	cas_menu_finish \{no_focus
		dont_scale_bg
		helper_text = {
			helper_text_elements = [
				{
					text = ""
				}
			]
		}}
	launchevent \{type = focus
		target = endrankings_events}
endscript

script ui_endrankings_add_ranking 
	<player_highlight> = 0
	if ((<data>.name) = "You")
		<tag_grid_x> = 1
		<player_highlight> = 1
	endif
	if (<player_highlight> = 1)
		GetCurrentSkaterProfileIndex
		GetSingleSkaterProfileInfo player = <currentskaterprofileindex> display_name
		formattext textname = my_text "%a. %b" a = (<index> + 1) b = <display_name>
	else
		formattext textname = my_text "%a. %b" a = (<index> + 1) b = (<data>.name)
	endif
	<children> = [
		{null}
		{null}
	]
	<i> = 0
	if (<index> < 8)
		if (<index> = 0)
			<texture> = star_sick
		else
			if (<index> < 4)
				<texture> = star_pro
			else
				<texture> = star_am
			endif
		endif
		setarrayelement arrayname = children index = <i> newvalue = {
			type = spriteelement
			texture = <texture>
			scale = (0.5, 0.55)
			pos = (-80.0, -3.0)
			alpha = 1
			rgba = [128 128 128 255]
		}
		<i> = (<i> + 1)
	endif
	if (<player_highlight> = 1)
		<bg_rgba> = ($ui_endrankings_colors.highlight_rgba)
		<rgba> = ($ui_endrankings_colors.highlight_text_rgba)
		setarrayelement arrayname = children index = <i> newvalue = {
			type = spriteelement
			texture = menu_bracket_star
			scale = (0.5, 0.55)
			pos = (-110.0, -3.0)
			alpha = 1
			rgba = [128 128 128 255]
		}
	endif
	add_cas_menu_item {
		text = <my_text>
		children = <children>
		tag_grid_x = <tag_grid_x>
		bg_rgba = <bg_rgba>
		rgba = <rgba>
	}
endscript

script ui_endrankings_create_menu {
		title = "TONY HAWK'S PROJECT 8"
		title_pos = (164.0, 52.0)
		title_bg_pos = (0.0, -2.0)
		title_bg_scale = (1.7, 1.0)
	}
	make_cas_menu {
		no_bg
		pos = (300.0, 100.0)
		menu_bg_scale = (1.3, 1.8)
		bar_dims = (320.0, 32.0)
		highlight_dims = (320.0, 32.0)
		mask_scale = (1.0, 1.0)
		mask_rot_angle = 5
		mask_pos = (245.0, 80.0)
		dont_allow_wrap = dont_allow_wrap
	}
	createscreenelement {
		type = containerelement
		parent = current_menu_anchor
		local_id = title_container
		just = [left center]
		pos = <title_pos>
		rot_angle = -3
	}
	<title_anchor_id> = <id>
	createscreenelement {
		type = textelement
		parent = <title_anchor_id>
		local_id = title
		font = text_a1
		text = <title>
		rgba = ($ui_endrankings_colors.title_rgba)
		scale = 0.6
		just = [left center]
		internal_just = [left center]
		font_spacing = 2
		z_priority = 3
	}
	createscreenelement {
		type = containerelement
		parent = <title_anchor_id>
		local_id = title_bg
		pos = <title_bg_pos>
		scale = <title_bg_scale>
		just = [left center]
		z_priority = 0
	}
	<title_bg_id> = <id>
	createscreenelement {
		type = spriteelement
		parent = <title_bg_id>
		texture = flourish_bg
		pos = (-30.0, 0.0)
		just = [left center]
		scale = (0.4, 0.7)
		z_priority = -5
		rgba = ($ui_endrankings_colors.title_flourish_rgba)
	}
	createscreenelement {
		type = spriteelement
		parent = <title_bg_id>
		texture = GO_fail
		just = [left center]
		scale = (0.9, 0.8)
		z_priority = 0
		rgba = ($ui_endrankings_colors.title_bg_rgba)
	}
	createscreenelement {
		parent = current_menu_anchor
		local_id = endrankings_bg
		type = spriteelement
		rgba = ($ui_endrankings_colors.bg_color)
		pos = (320.0, 220.0)
		scale = (1.2, 1.65)
		texture = pause_classic_goaltextblotch
		just = [center center]
		rot_angle = 180
		z_priority = -2
	}
endscript

script ui_endrankings_exit_dialog 
	dialog_box_exit
	do_actual_unpause
endscript

script wait_for_endrankings 
	wait \{1
		gameframe}
	begin
	if ($ui_endrankings_active = 0)
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script ui_prepare_endgame_flow 
	kill_start_key_binding
	pauseskaters
	do_actual_pause
	hide_all_hud_items
endscript

script ui_finish_endgame_flow 
	show_all_hud_items
	do_actual_unpause
	unpauseskaters
	restore_start_key_binding
endscript
