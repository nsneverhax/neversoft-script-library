ntt_score_message_offset_x = 280
ntt_score_message_offset_y = 140
ntt_score_offset_x = 0
ntt_icon_offset_x = -230
ntt_icon_offset_y = -3

script ntt_score_message_default 
	domorph \{alpha = 1.0
		scale = (1.4, 1.0)}
	domorph \{alpha = 1.0
		scale = (1.3, 0.9)
		time = 0.25}
endscript

script ntt_score_message_text 
	domorph \{alpha = 1.0
		scale = (1.2, 0.9)}
	domorph \{alpha = 1.0
		scale = (1.0, 0.7)
		time = 0.25}
endscript

script ntt_nailed_message_text 
	domorph \{alpha = 1.0
		scale = (1.4, 1.0)}
	domorph \{alpha = 1.0
		scale = (1.2, 0.9)
		time = 0.25}
	domorph \{alpha = 0.0
		scale = (1.2, 0.9)
		time = 2.0}
endscript

script ntt_score_style 
	domorph \{alpha = 1.0
		scale = (1.2, 0.9)}
endscript

script ntt_x_style 
	domorph \{alpha = 1.0
		scale = (1.2, 0.9)}
endscript

script ntt_distance_style 
	domorph \{alpha = 1.0
		scale = (1.2, 0.9)}
endscript

script ntt_icon_morph 
	domorph \{alpha = 1.0
		scale = 1.7}
	domorph \{alpha = 1.0
		scale = 1.5
		time = 0.5}
endscript
ntt_panel_distance_rgba_start = [
	255.0
	255.0
	255.0
	255.0
]
ntt_panel_distance_rgba_finish = [
	255.0
	0.0
	0.0
	255.0
]

script ntt_score_message_trucks_up 
	ntt_score_panel_message \{text = "trucks up bonus"
		texture = ntt_trucksup
		style = ntt_score_message_text}
endscript

script ntt_score_message_variety_trick 
	ntt_score_panel_message \{text = "variety bonus"
		texture = ntt_variety
		style = ntt_score_message_text}
endscript

script ntt_score_message_trick 
	ntt_score_panel_message \{text = ""}
endscript

script ntt_score_message_clean 
	ntt_score_panel_message \{text = "perfect flip!"
		texture = ntt_perfect
		style = ntt_score_message_text}
endscript

script ntt_score_message_body_rotation 
	getskaterid
	<objid> :nailthetrick_get180basedbodyspindegrees
	formattext textname = text "%a body spin" a = <spin_degrees>
	ntt_score_panel_message text = <text> texture = ntt_bodyspin style = ntt_score_message_text
endscript

script ntx_score_message_variety_mode 
	ntt_score_panel_message \{text = "mode variety"
		texture = ntt_perfect
		style = ntt_score_message_text}
endscript

script ntg_score_message_nailed 
	soundevent \{event = NTG_UI_Nailed_The_Grab_SFX}
	ntt_score_panel_message \{text = "nailed! +500"
		texture = ntt_nailed
		style = ntt_score_message_text}
endscript

script ntg_score_message_perfect_grab 
	ntt_score_panel_message \{text = "perfect grab!"
		texture = ntt_perfectgrab
		style = ntt_score_message_text}
endscript

script ntt_score_message_fingerflip 
	ntt_score_panel_message \{text = "finger flip"
		texture = ntt_fingerflip
		style = ntt_score_message_text}
endscript

script ntt_score_message_reflick 
	ntt_score_panel_message \{text = "advanced flip"
		texture = ntt_advflip
		style = ntt_score_message_text}
endscript

script ntt_score_message_fliptricktograb 
	ntt_score_panel_message \{text = "nice catch"
		texture = ntt_nicecatch
		style = ntt_score_message_text}
endscript

script ntt_score_message_grabtofliptrick 
	ntt_score_panel_message \{text = "transition"
		texture = ntt_transition
		style = ntt_score_message_text}
endscript

script ntt_score_message_grabtransfer 
	ntt_score_panel_message \{text = "grab transfer"
		texture = ntt_grabtrans
		style = ntt_score_message_text}
endscript

script ntm_score_message_landed 
	ntt_score_panel_message \{text = "nice landing!"
		texture = ntt_perfect
		style = ntt_score_message_text}
endscript

script ntm_score_message_ollie 
	ntt_score_panel_message \{text = "ollie"
		texture = ntt_perfect
		style = ntt_score_message_text}
endscript

script ntm_score_message_perfect_ollie 
	ntt_score_panel_message \{text = "perfect ollie"
		texture = ntt_perfect
		style = ntt_score_message_text}
endscript

script ntm_score_message_trucks_up 
	ntt_score_panel_message \{text = "trucks up bonus"
		texture = ntt_perfect
		style = ntt_score_message_text}
endscript

script ntm_score_message_fliptrick_ollie 
	ntt_score_panel_message \{text = "fliptrick ollie"
		texture = ntt_perfect
		style = ntt_score_message_text}
endscript

script hide_any_hud_display 
	if ($ui_gameplay_show_hud = 0)
		return \{true}
	endif
	if getglobalflag \{flag = $no_display_trickstring}
		return \{true}
	endif
	return \{false}
endscript

script ntt_score_panel_message {style = ntt_score_message_default
		pos = (105.0, 300.0)
		rgba = [220 , 220 , 220 , 255]
		just = [center center]
		id = ntt_score_panel_message_id
	}
	if hide_any_hud_display
		return
	endif
	<pos> = (<pos> && (2.0, 1.6))
	if ($nail_show_score_updates = 0)
		return
	endif
	ntt_clear_message id = <id>
	string_pos = (<pos> + ($ntt_score_message_offset_x * (1.0, 0.0)) + ($ntt_score_message_offset_y * (0.0, 1.0)))
	create_panel_message {
		text = <text>
		id = <id>
		pos = <string_pos>
		rgba = <rgba>
		style = <style>
		just = <just>
	}
	if gotparam texture
		create_nail_panel_icon texture = <texture> pos = <string_pos>
	endif
endscript

script ntt_score_message_score 
	style = ntt_score_style
	casttointeger \{base_score}
	formattext textname = text "%a" a = <base_score>
	ntt_score_panel_message {
		id = ntt_score_panel_score_id
		pos = ((275.0, 300.0) + $ntt_score_offset_x * (1.0, 0.0))
		text = <text>
		style = <style>
		just = [left center]
	}
endscript

script ntt_score_message_muliplier 
	formattext textname = text "%a" a = <multipliers> decimalplaces = 1
	ntt_score_panel_message {
		id = ntt_score_panel_multiplier_id
		pos = ((240.0, 300.0) + $ntt_score_offset_x * (1.0, 0.0))
		text = <text>
		just = [right center]
	}
	ntt_score_panel_message {
		id = ntt_score_panel_multiplier_x_id
		pos = ((250.0, 299.0) + $ntt_score_offset_x * (1.0, 0.0))
		text = "x"
		style = ntt_x_style
		rgba = [210 180 70 255]
		just = [left center]
	}
endscript

script nail_add_score_to_main_combo_score 
	if nailthetrick_wasscoreawarded
		return
	endif
	nailthetrick_setscoreawarded
	nailthetrick_getscore
	if nailthetrick_scorepotwaszero
		<multiplier> = (<multiplier> - 1.0)
	endif
	formattext textname = trick_text "\\c6nail The trick\\c0"
	formattext textname = extension_text " %a" a = <score_with_land_bonus>
	if (<base_score_with_land_bonus> > 0)
		settrickname <trick_text> name_extension = <extension_text>
		settrickscore <base_score>
		addtoscoremultiplier multiplier = <multiplier>
		display nomult
		nailthetrickscore_notifyscorehasbeendisplayed
	endif
	settags nail_last_score = <score_with_land_bonus>
endscript

script ntt_clear_message \{id = ntt_panel_main}
	kill_panel_message_if_it_exists id = <id>
endscript

script ntt_kill_panel 
	ntt_clear_message \{id = ntt_score_panel_message_id}
	ntt_clear_message \{id = ntt_score_panel_score_id}
	ntt_clear_message \{id = ntt_score_panel_multiplier_id}
	ntt_clear_message \{id = ntt_score_panel_multiplier_x_id}
	ntt_clear_message \{id = ntt_score_panel_distance_id}
	nailthetrick_clearpanel
	destroy_nail_panel_icon
endscript

script ntt_debug_message \{pos = (125.0, 300.0)
		id = ntt_debug_message
		time = 0}
	ntt_clear_message id = <id>
	if gotparam \{time}
		create_panel_message {text = <text> id = <id> pos = <pos> time = <time>}
	else
		create_panel_message {text = <text> id = <id> pos = <pos>}
	endif
endscript

script ntt_hide_if_exists 
	if screenelementexists id = <id>
		setscreenelementprops id = <id> hide
	endif
endscript

script ntt_hide_panel_stuff 
	if objectexists \{id = player1_panel_container}
		ntt_hide_if_exists \{id = trick_text_container}
		ntt_hide_if_exists \{id = the_score}
		ntt_hide_if_exists \{id = switch_nollie_container}
		ntt_hide_if_exists \{id = {
				goal_arrow_element
				child = text
			}}
		hide_compass_anchor
	endif
endscript

script ntt_unhide_if_exists 
	if screenelementexists id = <id>
		setscreenelementprops id = <id> unhide
	endif
endscript

script ntt_show_panel_stuff 
	if objectexists \{id = player1_panel_container}
		ntt_unhide_if_exists \{id = trick_text_container}
		ntt_unhide_if_exists \{id = the_score}
		ntt_unhide_if_exists \{id = switch_nollie_container}
		ntt_unhide_if_exists \{id = {
				goal_arrow_element
				child = text
			}}
		show_compass_anchor
	endif
endscript

script ntt_display_distance 
	if NOT istrue \{$ntt_show_panel_distance_on_goal}
		return
	endif
	formattext textname = text "%a feet" a = <Feet>
	ntt_score_panel_message {text = <text>
		style = ntt_distance_style
		pos = (210.0, 250.0)
		rgba = <rgba>
		just = [center center]
		id = ntt_score_panel_distance_id
	}
endscript

script destroy_nail_panel_icon \{id = nail_panel_icon}
	if screenelementexists id = <id>
		destroyscreenelement id = <id>
	endif
endscript

script create_nail_panel_icon id = nail_panel_icon
	destroy_nail_panel_icon
	string_pos = (<pos> + ($ntt_icon_offset_x * (1.0, 0.0)) + ($ntt_icon_offset_y * (0.0, 1.0)))
	createscreenelement {
		id = <id>
		parent = panel_message_layer
		type = spriteelement
		texture = <texture>
		scale = 2.0
		alpha = 1.0
		pos = <string_pos>
		just = [center center]
		rgba = [255 , 255 , 255 , 255]
	}
	runscriptonscreenelement id = <id> ntt_icon_morph params = <...>
endscript
