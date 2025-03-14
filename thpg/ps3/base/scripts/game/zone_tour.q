
script zone_tour_begin 
	printf 'zone_tour_begin'
	formattext checksumname = zone_tour_data '%a_tour_data' a = <zone_string>
	if globalexists name = <zone_tour_data> type = array
		zone_tour_hold_skater
		getarraysize $<zone_tour_data>
		zone_tour_shot {
			data = $<zone_tour_data>
			cam_iter = 0
			cam_iter_end = <array_size>
		}
	else
		goal_ui_display_message text = "NO ZONE TOUR CREATED FOR THIS ZONE" type = uberalert color = red
	endif
endscript
zone_tour_sound_buss_set_active = 0

script zone_tour_shot 
	printf 'zone_tour_shot'
	requireparams [cam_iter cam_iter_end] all
	if (<cam_iter> >= <cam_iter_end>)
		zone_tour_end
		return
	endif
	<element> = (<data> [<cam_iter>])
	if structurecontains structure = <element> goal_id
		if gman_goalisinitialized goal = (<element>.goal_id)
			gman_getconstant goal = (<element>.goal_id) name = view_goals_title
		else
			zone_tour_shot {
				cam_iter = (<cam_iter> + 1)
				cam_iter_end = <cam_iter_end>
				data = <data>
			}
			return
		endif
	endif
	if NOT screenelementexists id = zone_tour_anchor
		createscreenelement {
			id = zone_tour_anchor
			type = containerelement
			parent = root_window
		}
	endif
	if screenelementexists id = zone_tour_pad_handler
		destroyscreenelement id = zone_tour_pad_handler
	endif
	createscreenelement {
		id = zone_tour_pad_handler
		type = containerelement
		parent = zone_tour_anchor
		event_handlers = [
			{pad_choose zone_tour_shot_kill params = {name = (<element>.name)}}
		]
	}
	runscriptonscreenelement id = zone_tour_pad_handler waitthenfocusscreenelement
	if structurecontains structure = <element> text
		zone_tour_create_text text = (<element>.text)
	else
		if gotparam view_goals_title
			zone_tour_create_text text = <view_goals_title>
		else
			zone_tour_kill_text
		endif
	endif
	if NOT (($zone_tour_sound_buss_set_active) = 1)
		pushsoundbussparams
		setsoundbussparams $Goal_Presentation_BussSet time = 0.1
		change zone_tour_sound_buss_set_active = 1
	endif
	soundevent event = skip_cam_sfx
	if structurecontains structure = <element> morphs
		<morphs> = (<element>.morphs)
		if (<cam_iter> > 0)
			<prev_element> = (<data> [(<cam_iter> - 1)])
			if structurecontains structure = <prev_element> morphs
				getarraysize (<prev_element>.morphs)
				if (<array_size> > 0)
					<prev_i> = (<array_size> - 1)
					begin
					<m> = (<prev_element>.morphs [<prev_i>])
					if structurecontains structure = <m> pos
						<last_pos> = (<m>.pos)
						<last_quat> = (<m>.quat)
						break
					endif
					<prev_i> = (<prev_i> - 1)
					repeat <array_size>
				endif
			endif
			if gotparam last_pos
				<last_morph> = [{pos = <last_pos> quat = <last_quat> time = 0}]
				<morphs> = (<last_morph> + <morphs>)
			endif
		endif
	endif
	playigccam {
		name = $igc_custom_camera_name
		controlscript = zone_tour_shot_morphs
		params = {morphs = <morphs>}
		exitscript = zone_tour_shot
		exitparams = {
			cam_iter = (<cam_iter> + 1)
			cam_iter_end = <cam_iter_end>
			data = <data>
		}
	}
endscript

script zone_tour_create_text 
	requireparams [text] all
	if NOT screenelementexists id = zone_tour_anchor
		createscreenelement {
			id = zone_tour_anchor
			type = containerelement
			parent = root_window
		}
	endif
	if NOT screenelementexists id = zone_tour_bg
		createscreenelement {
			type = spriteelement
			parent = zone_tour_anchor
			id = zone_tour_bg
			texture = white2
			rgba = [0 0 0 90]
			just = [left top]
			pos = (0.0, 550.0)
			dims = (1280.0, 170.0)
			alpha = 0.0
		}
		doscreenelementmorph {
			id = zone_tour_bg
			alpha = 1.0
			time = 0.2
		}
	endif
	if NOT screenelementexists id = zone_tour_text
		createscreenelement {
			type = textblockelement
			parent = zone_tour_anchor
			id = zone_tour_text
			text = <text>
			font = text_a1
			just = [center top]
			pos = (640.0, 500.0)
			dims = (1000.0, 300.0)
			rgba = [200 200 200 255]
			scale = (0.95, 0.75)
			spacing = 0
			shadow
			shadow_offs = (1.0, 1.0)
			shadow_rgba = [0 0 0 255]
			alpha = 0.0
		}
		doscreenelementmorph {
			id = zone_tour_text
			alpha = 1.0
			time = 0.2
		}
	else
		setscreenelementprops {
			id = zone_tour_text
			text = <text>
		}
	endif
endscript

script zone_tour_kill_text 
	if screenelementexists \{id = zone_tour_text}
		destroyscreenelement \{id = zone_tour_text}
	endif
	if screenelementexists \{id = zone_tour_bg}
		destroyscreenelement \{id = zone_tour_bg}
	endif
endscript

script zone_tour_shot_morphs 
	printf 'zone_tour_shot_morphs'
	if gotparam morphs
		getarraysize (<morphs>)
		<morph_count> = <array_size>
		<i> = 0
		if (<morph_count> > 0)
			begin
			printf 'zone tour: Playing IGC morph %i of %c' i = (<i> + 1) c = <morph_count>
			ccam_domorph {
				lockto = world
				fov = 72.0
				time = 0
				(<morphs> [<i>])
			}
			if structurecontains structure = (<morphs> [<i>]) time
				if ((<morphs> [<i>].time) > 0)
					ccam_waitmorph
				endif
			endif
			<i> = (<i> + 1)
			repeat <morph_count>
		endif
	endif
endscript

script zone_tour_shot_kill \{name = $igc_custom_camera_name}
	printf \{'zone_tour_shot_kill'}
	skater :input_debounce \{x}
	stopsoundevent \{skip_cam_sfx}
	killskatercamanim name = <name>
	if screenelementexists \{id = zone_tour_pad_handler}
		destroyscreenelement \{id = zone_tour_pad_handler}
	endif
endscript

script zone_tour_end 
	printf \{'zone_tour_end'}
	if screenelementexists \{id = zone_tour_anchor}
		destroyscreenelement \{id = zone_tour_anchor}
	endif
	zone_tour_shot_kill
	if (($zone_tour_sound_buss_set_active) = 1)
		change \{zone_tour_sound_buss_set_active = 0}
		popsoundbussparams
		soundevent \{event = Music_Pitch_Fixer_Logic}
	endif
	zone_tour_unhold_skater
endscript

script zone_tour_hold_skater 
	hide_all_hud_sprites
	pauseskaters
	skater :pausephysics
	skater :disableplayerinput
	kill_start_key_binding
endscript

script zone_tour_unhold_skater 
	show_all_hud_sprites
	unpauseskaters
	skater :unpausephysics
	skater :enableplayerinput
	restore_start_key_binding
endscript
