videophone_recieving_priority_message = 0
enable_videophone_shortcut = 1
videophone_scheme = {
	highlight_text_color = [
		7
		35
		70
		255
	]
	highlight_icon_color = [
		7
		35
		70
		140
	]
	new_text_color = [
		255
		255
		255
		255
	]
	new_icon_color = [
		200
		200
		200
		255
	]
	old_text_color = [
		200
		200
		200
		255
	]
	old_icon_color = [
		200
		200
		200
		255
	]
}
videophone_soundbuss_active = 0

script ui_create_videophone 
	printf 'UI: ui_create_videophone'
	create_pause_back title = "" nobg notitle width = 500 noNoise
	Do_MenuFx fxparam = ($goal_ui_scheme.screen_fx)
	igc_immediately_start_rendering
	pause_menu_fmv_kill
	if screenelementexists id = pausemenu_icon_movie
		destroyscreenelement id = pausemenu_icon_movie
	endif
	if ($videophone_recieving_priority_message > 0)
		change videophone_recieving_priority_message = 0
	endif
	kill_start_key_binding
	loadpak 'pak/videophone/videophone.pak' heap = scratch
	if NOT screenelementexists id = current_menu_anchor
		if NOT innetgame
			pausegame
		endif
		gman_pauseallgoals
		hide_all_hud_items
	endif
	killspawnedscript name = temporarilydisableinput
	spawnscriptlater temporarilydisableinput params = {time = 1.5 seconds}
	pausemusic 1
	build_videophone
	printpushpopdebuginfo push name = "ui_create_videophone"
	pushsoundbussparams
	change videophone_soundbuss_active = 1
	if ($global_user_sfx_number = 0)
		setsoundbussparams $default_bussset time = 0.5
	else
		setsoundbussparams $Generic_IGC_BussSet time = 0.25
	endif
	if isps3
		CutscenePauseMusicAndPlaylistTimer
	endif
	if gotparam priority
		spawnscriptnow videophone_priority_msg params = {firstmessage = <firstmessage>}
	else
		videophone_main_create
	endif
endscript

script videophone_priority_msg 
	printf '--- videophone_priority_msg'
	printstruct <...>
	do_actual_pause
	kill_start_key_binding
	if NOT gotparam firstmessage
		soundevent event = sk9_sfx_incomingbeeper
	endif
	wait 0.5 seconds
	Pager_GetMessageCount
	first_message_num = (<pagermessagecount> - 1)
	msg_counter = <first_message_num>
	if NOT gotparam firstmessage
		current_priority = 0
		current_msg = -1
		begin
		if NOT Pager_IsMessageCleared message_num = <msg_counter>
			if Pager_IsNewMessage message_num = <msg_counter>
				Pager_GetMessage message_num = <msg_counter>
				if structurecontains structure = <pagermessage> priority_message
					if ((<pagermessage>.priority_message) > <current_priority>)
						current_priority = (<pagermessage>.priority_message)
						current_msg = <msg_counter>
						printstruct <...>
					endif
				endif
			endif
		endif
		if (<msg_counter> = 0)
			break
		endif
		msg_counter = (<msg_counter> -1)
		repeat
		if (<current_msg> = -1)
			script_assert "Couldn't find priority message to show!"
			<current_msg> = <first_message_num>
			Pager_GetMessage message_num = <msg_counter>
		endif
		Pager_GetMessage message_num = <current_msg>
		the_message = <pagermessage>
	else
		current_msg = <msg_counter>
		Pager_GetMessage message_num = <msg_counter>
		the_message = <pagermessage>
	endif
	videophone_root :settags priority = priority
	videophone_show_message msg_num = <current_msg> <the_message> menu_index = <current_msg>
endscript

script videophone_has_unread_priority_message 
	printf '--- videophone_has_unread_priority_message'
	has_priority_message = 0
	Pager_GetMessageCount
	msg_counter = (<pagermessagecount> - 1)
	if (<pagermessagecount> > 0)
		begin
		if NOT Pager_IsMessageCleared message_num = <msg_counter>
			if Pager_IsNewMessage message_num = <msg_counter>
				Pager_GetMessage message_num = <msg_counter>
				if structurecontains structure = <pagermessage> priority_message
					has_priority_message = 1
					break
				endif
			endif
		endif
		if (<msg_counter> = 0)
			break
		endif
		<msg_counter> = (<msg_counter> - 1)
		repeat
	endif
	return has_priority_message = <has_priority_message>
endscript

script scale_element_to_size 
	if NOT gotparam id
		printf 'Did not pass in id to scale_element_to_size! Returning'
		return
	endif
	getscreenelementdims id = <id>
	orig_height = <height>
	orig_width = <width>
	if NOT gotparam target_width
		target_width = <orig_width>
	endif
	if NOT gotparam target_height
		target_height = <orig_height>
	endif
	xscale = (<target_width> / (<orig_width> * 1.0))
	yscale = (<target_height> / (<orig_height> * 1.0))
	doscreenelementmorph {
		id = <id>
		scale = (<xscale> * (1.0, 0.0) + <yscale> * (0.0, 1.0))
		time = 0
	}
endscript

script videophone_main_create 
	if screenelementexists id = videophone_screen_cont
		destroyscreenelement id = videophone_screen_cont
	endif
	change show_pausemenu_phone = 0
	videophone_root :gettags
	vmenu_id = videophone_vmenu
	createscreenelement {
		type = containerelement
		id = videophone_screen_cont
		pos = <screenPos>
		parent = videophone_root
		just = [top left]
	}
	assignalias id = <id> alias = current_menu_anchor
	createscreenelement {
		type = spriteelement
		id = ph_main_bg
		parent = current_menu_anchor
		texture = m_interface_bg
		pos = (0.0, 0.0)
		just = [top left]
	}
	createscreenelement {
		type = spriteelement
		id = ph_status_bar
		parent = current_menu_anchor
		texture = m_fluff_bar
		pos = (0.0, 0.0)
		just = [top left]
	}
	createscreenelement {
		type = spriteelement
		id = ph_scroll_bar_bg
		parent = current_menu_anchor
		texture = ph_scroll_bar
		pos = (0.0, 0.0)
		just = [top left]
	}
	scale_element_to_size id = ph_status_bar target_width = (<screenDims>.(1.0, 0.0))
	getscreenelementdims id = ph_status_bar
	ph_status_bar_height = <height>
	ph_status_bar_width = <width>
	scale_element_to_size id = ph_scroll_bar_bg target_height = (<screenDims>.(0.0, 1.0) - <ph_status_bar_height>)
	getscreenelementdims id = ph_scroll_bar_bg
	ph_scroll_bar_height = <height>
	ph_scroll_bar_width = <width>
	main_screen_width = (<screenDims>.(1.0, 0.0) - <ph_scroll_bar_width>)
	main_screen_height = (<screenDims>.(0.0, 1.0) - <ph_status_bar_height>)
	scale_element_to_size {
		id = ph_main_bg
		target_height = <main_screen_height>
		target_width = <main_screen_width>
	}
	setscreenelementprops id = ph_scroll_bar_bg pos = (0.0, 0.0)
	getscreenelementposition id = ph_scroll_bar_bg
	getscreenelementdims id = ph_scroll_bar_bg
	ph_scroll_bar_pos = <screenelementpos>
	ph_scroll_bar_width = <width>
	setscreenelementprops {
		id = ph_main_bg
		pos = (<ph_scroll_bar_pos> + (1.0, 0.0) * <ph_scroll_bar_width>)
	}
	setscreenelementprops {
		id = ph_status_bar
		pos = (<ph_scroll_bar_pos> + (0.0, 1.0) * <ph_scroll_bar_height>)
	}
	createscreenelement {
		type = vscrollingmenu
		id = videophone_scrolling_menu
		parent = videophone_screen_cont
		dims = (200.0, 340.0)
		pos = (102.0, 190.0)
	}
	assignalias id = <id> alias = current_scrolling_menu
	createscreenelement {
		type = vmenu
		id = <vmenu_id>
		parent = videophone_scrolling_menu
	}
	assignalias id = <vmenu_id> alias = current_menu
	videophone_root :getsingletag priority
	if gotparam priority
		exit_script = videophone_exit_to_gameplay
		printf "asdsdsadgsdfgafdgsdfgsdfgafgsdfg"
	else
		exit_script = ui_change_state
		state = UIstate_view_status
	endif
	setscreenelementprops {
		id = current_menu
		event_handlers = [
			{pad_back videophone_pad_back_sound}
			{pad_back <exit_script> params = {state = <state>}}
			{pad_up videophone_menu_up_or_down_sound params = {up = 1}}
			{pad_down videophone_menu_up_or_down_sound params = {down = 2}}
		]
	}
	videophone_screen_cont :settags screen_width = <main_screen_width> screen_height = <main_screen_height>
	arrow_offset = 38
	getscreenelementprops id = ph_scroll_bar_bg
	getscreenelementdims id = ph_scroll_bar_bg
	ph_scroll_bar_height = <height>
	ph_scroll_bar_pos = <pos>
	createscreenelement {
		type = spriteelement
		parent = videophone_screen_cont
		id = videophone_scroll_nub
		texture = ph_scroll_nub
		just = [left top]
		alpha = 0
	}
	getscreenelementdims id = videophone_scroll_nub
	ph_nub_height = <height>
	scroll_bar_length = (<ph_scroll_bar_height> - <arrow_offset> * 2)
	scroll_initial_pos = (<ph_scroll_bar_pos> + <arrow_offset> * (0.0, 1.0))
	setscreenelementprops {
		id = videophone_scroll_nub
		pos = <scroll_initial_pos>
	}
	videophone_screen_cont :settags scroll_bar_length = <scroll_bar_length>
	videophone_screen_cont :settags scroll_initial_pos = <scroll_initial_pos>
	videophone_screen_cont :settags num_items = 0
	if gotparam priority
		create_helper_text {
			helper_text_elements = [{text = "\\m1 BACK TO GAME"}
				{text = "\\m0 ACCEPT"}
			]
			parent = root_window
		}
	else
		create_helper_text {
			helper_text_elements = [{text = "\\m1 BACK"}
				{text = "\\m0 ACCEPT"}
			]
			parent = root_window
		}
	endif
	if Pager_GetMessageCount
		counter = (<pagermessagecount> - 1)
		begin
		if NOT Pager_IsMessageCleared message_num = <counter>
			Pager_GetMessage message_num = <counter>
			formattext textname = message_title "%n - %m" n = (<pagermessage>.from) m = (<pagermessage>.message)
			videophone_add_item {
				pagermessage = <pagermessage>
				msg_num = <counter>
				tag_loc = videophone_screen_cont
				tag_grid_x = <counter>
			}
		endif
		counter = (<counter> - 1)
		repeat <pagermessagecount>
	else
		create_helper_text {
			helper_text_elements = [{text = "\\m1 BACK"}]
			parent = root_window
		}
	endif
	videophone_root :getsingletag current_sound_event
	if gotparam current_sound_event
		if issoundeventplaying <current_sound_event>
			stopsoundevent <current_sound_event>
		endif
	endif
	if NOT gotparam no_focus
		spawnscriptlater videophone_menu_wait_and_focus
	endif
endscript

script videophone_exit_to_gameplay 
	change \{videophone_recieving_priority_message = 0}
	do_actual_unpause
	ui_change_state \{state = uistate_gameplay}
endscript

script videophone_add_item 
	if NOT gotparam pagermessage
		printf 'Did not get a pager message!!!'
		return
	endif
	if NOT gotparam tag_loc
		printf 'Did not get tag_loc!!!'
		return
	endif
	<tag_loc> :getsingletag num_items
	num_items = (<num_items> + 1)
	<tag_loc> :settags num_items = <num_items>
	if structurecontains structure = <pagermessage> movie
		printf 'video message'
		message_icon = ph_movieicon
	else
		if structurecontains structure = <pagermessage> slides
			if structurecontains structure = (<pagermessage>.slides [0]) icon
				printf 'picture message'
				message_icon = ph_pictureicon
			else
				printf 'text message'
				message_icon = ph_mailicon
			endif
		endif
	endif
	if Pager_IsNewMessage message_num = <msg_num>
		<text_color> = ($videophone_scheme.new_text_color)
		<icon_color> = ($videophone_scheme.new_icon_color)
	else
		<text_color> = ($videophone_scheme.old_text_color)
		<icon_color> = ($videophone_scheme.old_icon_color)
	endif
	videophone_screen_cont :getsingletag screen_width
	parent = current_menu
	createscreenelement {
		type = containerelement
		parent = <parent>
		just = [top left]
		dims = (20.0, 80.0)
		scale = 0.75
	}
	cont_id = <id>
	<cont_id> :settags item_num = <num_items>
	createscreenelement {
		type = spriteelement
		texture = title_bar
		parent = <cont_id>
	}
	doscreenelementmorph id = <id> scale = (2.8, 2.5) pos = (220.0, 20.0)
	createscreenelement {
		local_id = highlight_bar
		type = spriteelement
		texture = m_highlight_bar
		parent = <cont_id>
		alpha = 0
	}
	doscreenelementmorph id = <id> scale = (2.8, 2.5) pos = (220.0, 20.0)
	createscreenelement {
		local_id = icon
		type = spriteelement
		texture = <message_icon>
		rgba = <icon_color>
		parent = <cont_id>
		pos = (70.0, 0.0)
	}
	formattext textname = message_title "%n\\n%m" n = (<pagermessage>.from) m = (<pagermessage>.message)
	createscreenelement {
		local_id = text
		type = textblockelement
		parent = <cont_id>
		font = text_a1
		text = <message_title>
		rgba = <text_color>
		scale = 0.8
		just = [left center]
		internal_just = [left top]
		z_priority = 20
		pos = (100.0, 20.0)
		dims = (700.0, 0.0)
		allow_expansion
	}
	getscreenelementchildren id = <id>
	getarraysize <children>
	if (<array_size> = 2)
		getscreenelementdims id = (<children> [1])
		if (<width> > 373)
			<scale> = ((373.0 / <width>) * (0.8, 0.8))
			doscreenelementmorph id = <id> time = 0 scale = <scale>
		endif
	endif
	setscreenelementprops {
		id = <cont_id>
		event_handlers = [
			{pad_choose videophone_pad_choose_sound}
			{pad_choose videophone_show_message params = {msg_num = <msg_num> <pagermessage> menu_index = <tag_grid_x>}}
			{focus videophone_menu_item_focus params = {id = <cont_id> msg_num = <msg_num>}}
			{unfocus videophone_menu_item_unfocus params = {id = <cont_id> msg_num = <msg_num>}}
		]
	}
	if gotparam tag_grid_x
		<cont_id> :settags tag_grid_x = <tag_grid_x>
	endif
	setscreenelementlock id = <parent> on
	setscreenelementlock id = <parent> off
endscript

script videophone_menu_wait_and_focus 
	printf '--- videophone_menu_wait_and_focus'
	setscreenelementlock id = current_menu_anchor off
	wait 2 gameframes
	setscreenelementlock id = current_menu_anchor off
	begin
	if screenelementexists id = videophone_vmenu
		videophone_root :getsingletag menu_index
		launchevent type = focus target = videophone_vmenu data = {grid_index = <menu_index>}
		break
	else
		wait 1 gameframe
	endif
	repeat
	printf 'videophone_menu_wait_and_focus: done'
endscript

script videophone_menu_item_focus 
	setscreenelementprops id = {<id> child = text} rgba = ($videophone_scheme.highlight_text_color)
	setscreenelementprops id = {<id> child = icon} rgba = ($videophone_scheme.highlight_icon_color)
	doscreenelementmorph id = {<id> child = highlight_bar} alpha = 1
	if screenelementexists id = videophone_scroll_nub
		current_menu_anchor :getsingletag scroll_bar_length
		current_menu_anchor :getsingletag num_items
		current_menu_anchor :getsingletag scroll_initial_pos
		<id> :getsingletag item_num
		if (<num_items> < 9)
			doscreenelementmorph {
				id = videophone_scroll_nub
				alpha = 0
			}
		else
			doscreenelementmorph {
				id = videophone_scroll_nub
				pos = (((<scroll_bar_length> / <num_items>) * (<item_num> -1)) * (0.0, 1.0) + <scroll_initial_pos>)
				time = 0
				alpha = 1
			}
		endif
	endif
	<id> :obj_spawnscript videophone_menu_item_flash
endscript

script videophone_menu_item_flash 
	obj_getid
	begin
	doscreenelementmorph {
		id = {<objid> child = highlight_bar}
		alpha = 1
		time = 0.5
		anim = gentle
	}
	doscreenelementmorph {
		id = {<objid> child = text}
		alpha = 1
		time = 0.5
		anim = ease_in
	}
	doscreenelementmorph {
		id = {<objid> child = icon}
		alpha = 1
		time = 0.5
		anim = ease_in
	}
	wait 0.5 second
	doscreenelementmorph {
		id = {<objid> child = highlight_bar}
		alpha = 0.25
		time = 0.5
		anim = gentle
	}
	doscreenelementmorph {
		id = {<objid> child = text}
		alpha = 0.6
		time = 0.5
		anim = ease_out
	}
	doscreenelementmorph {
		id = {<objid> child = icon}
		alpha = 0.6
		time = 0.5
		anim = ease_out
	}
	wait 0.5 second
	repeat
endscript

script videophone_menu_item_unfocus 
	killspawnedscript name = videophone_menu_item_flash
	if Pager_IsNewMessage message_num = <msg_num>
		<text_color> = ($videophone_scheme.new_text_color)
		<icon_color> = ($videophone_scheme.new_icon_color)
	else
		<text_color> = ($videophone_scheme.old_text_color)
		<icon_color> = ($videophone_scheme.old_icon_color)
	endif
	doscreenelementmorph id = {<id> child = text} rgba = <text_color> alpha = 1
	doscreenelementmorph id = {<id> child = icon} rgba = <icon_color> alpha = 1
	doscreenelementmorph id = {<id> child = highlight_bar} alpha = 0 time = 0
endscript

script videophone_back_to_menu 
	printf '--- videophone_back_to_menu'
	if NOT screenelementexists id = videophone_root
		return
	endif
	videophone_root :getsingletag did_movie_buss
	if gotparam did_movie_buss
		if (<did_movie_buss> = 1)
			videophone_root :settags did_movie_buss = 0
			printpushpopdebuginfo pop name = "videophone_back_to_menu"
			popsoundbussparams
		endif
	endif
	killspawnedscript name = videophone_wait_for_movie
	if NOT screenelementexists id = videophone_root
		return
	endif
	if NOT gotparam button_pressed
		if videophone_root :getsingletag priority
			videophone_has_unread_priority_message
			if (<has_priority_message> > 0)
				videophone_priority_msg
				return
			endif
		endif
	endif
	videophone_main_create
endscript

script videophone_show_message 
	printf '---- videophone_show_message'
	if NOT screenelementexists id = videophone_root
		return
	endif
	if gotparam menu_index
		videophone_root :settags menu_index = <menu_index>
	endif
	Pager_MarkMessageRead message_num = <msg_num>
	if gotparam audio
		spawnscriptnow videophone_play_audio params = <...>
	elseif gotparam slides
		printf '**** GotParam <dialog>'
		spawnscriptnow videophone_show_message_dialog params = <...>
	else
		spawnscriptnow videophone_show_movie params = <...>
	endif
endscript

script videophone_play_audio 
	setspawninstancelimits max = 1 management = ignore_spawn_request
	videophone_main_create no_focus
	if screenelementexists id = videophone_screen_conts
		destroyscreenelement id = videophone_screen_conts
	endif
	videophone_root :gettags
	createscreenelement {
		type = containerelement
		id = videophone_screen_conts
		dims = <screenDims>
		pos = (500.0, 520.0)
		parent = videophone_root
		just = [center center]
		z_priority = 100
	}
	create_helper_text {
		helper_text_elements = [
			{text = "\\m1 BACK"}
			{text = "\\m0 CONTINUE"}
		]
		parent = root_window
	}
	get_strongest_lifestyle
	switch <strongest_lifestyle>
		case career
		if gotparam career_audio
			playsound <career_audio> vol = 400 buss = MS_Phonecalls
			<audio> = <career_audio>
		else
			playsound <audio> vol = 400 buss = MS_Phonecalls
		endif
		case rigger
		if gotparam rigger_audio
			playsound <rigger_audio> vol = 400 buss = MS_Phonecalls
			<audio> = <rigger_audio>
		else
			playsound <audio> vol = 400 buss = MS_Phonecalls
		endif
		case hardcore
		if gotparam hardcore_audio
			playsound <hardcore_audio> vol = 400 buss = MS_Phonecalls
			<audio> = <hardcore_audio>
		else
			playsound <audio> vol = 400 buss = MS_Phonecalls
		endif
		default
		playsound <audio> vol = 400 buss = MS_Phonecalls
	endswitch
	setscreenelementprops {
		id = videophone_screen_conts
		event_handlers = [
			{pad_choose videophone_pad_choose_sound}
			{pad_choose videophone_stop_audio params = <...>}
			{pad_back videophone_pad_back_sound}
			{pad_back videophone_stop_audio params = {<...> button_pressed}}
		]
		replace_handlers
	}
	wait 1 gameframes
	if screenelementexists id = videophone_screen_conts
		launchevent type = focus target = videophone_screen_conts
	endif
	begin
	if NOT issoundplaying <audio>
		break
	endif
	wait 1 gameframes
	repeat
	spawnscriptnow videophone_stop_audio params = <...>
endscript

script videophone_stop_audio 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	killspawnedscript \{name = videophone_play_audio}
	stopsound <audio>
	removeparameter \{audio}
	videophone_back_to_menu <...>
	if screenelementexists \{id = videophone_screen_conts}
		destroyscreenelement \{id = videophone_screen_conts}
	endif
endscript

script videophone_show_message_dialog 
	printf '---- videophone_show_message_dialog'
	if screenelementexists id = videophone_screen_cont
		destroyscreenelement id = videophone_screen_cont
	endif
	videophone_root :gettags
	createscreenelement {
		type = containerelement
		id = videophone_screen_cont
		dims = <screenDims>
		pos = (500.0, 520.0)
		parent = videophone_root
		just = [center center]
		z_priority = 100
	}
	createscreenelement {
		type = spriteelement
		parent = videophone_screen_cont
		texture = black
		scale = (10000.0, 10000.0)
		z_priority = 99
	}
	getarraysize <slides>
	if (<array_size> = 0)
		printf 'Slides array size is zero!!!!'
	else
		parent = videophone_screen_cont
		<parent> :settags slide_num = 0
		videophone_show_slide <...>
		setscreenelementprops {
			id = <parent>
			event_handlers = [
				{pad_choose videophone_pad_choose_sound}
				{pad_choose videophone_next_slide_or_continue params = <...>}
				{pad_back videophone_pad_back_sound}
				{pad_back videophone_back_to_menu params = {button_pressed}}
			]
		}
		launchevent type = focus target = videophone_screen_cont
		create_helper_text {
			helper_text_elements = [
				{text = "\\m1 BACK"}
				{text = "\\m0 CONTINUE"}
			]
			parent = root_window
		}
	endif
	wait 2 gameframes
endscript

script videophone_show_slide zoom = mid
	printf '--- videophone_show_slide'
	if issoundeventplaying sk9_sfx_incomingbeeper
		setsoundparams motorola_phone1 vol = 12
	endif
	<parent> :gettags slide_num
	<parent> :obj_killspawnedscript name = videophone_message_wait
	<parent> :obj_killspawnedscript name = videophone_wait_for_movie
	if screenelementexists id = videophone_movie
		destroyscreenelement id = videophone_movie
	endif
	slide_struct = (<slides> [<slide_num>])
	if structurecontains structure = <slide_struct> zoom
		zoom = (<slide_struct>.zoom)
	else
		zoom = <zoom>
	endif
	if screenelementexists id = the_icon
		destroyscreenelement id = the_icon
	endif
	if screenelementexists id = videophone_dialog
		destroyscreenelement id = videophone_dialog
	endif
	if structurecontains structure = <slide_struct> movie
		if structurecontains structure = <slide_struct> icon
			printstruct <slide_struct>
			script_assert "Videophone should not show a slide and a movie at the same time, please fix the above struture"
		endif
		if NOT structurecontains structure = <slide_struct> scale
			if checksumequals a = <zoom> b = full
				movie_scale = (765.0, 460.0)
			else
				movie_scale = (765.0, 460.0)
			endif
		else
			movie_scale = (<slide_struct>.scale)
		endif
		if NOT structurecontains structure = <slide_struct> pos
			if checksumequals a = <zoom> b = full
				movie_pos = (14.0, 14.0)
			else
				movie_pos = (60.0, 10.0)
			endif
		else
			movie_scale = (<slide_struct>.pos)
		endif
		<selected_movie> = (<slide_struct>.movie)
		if ((structurecontains structure = <slide_struct> career_movie) || (structurecontains structure = <slide_struct> hardcore_movie) || (structurecontains structure = <slide_struct> rigger_movie))
			get_strongest_lifestyle
			switch <strongest_lifestyle>
				case career
				<selected_movie> = (<slide_struct>.career_movie)
				case hardcore
				<selected_movie> = (<slide_struct>.hardcore_movie)
				case rigger
				<selected_movie> = (<slide_struct>.rigger_movie)
			endswitch
		endif
		if structurecontains structure = <slide_struct> no_music
			videophone_root :settags did_movie_buss = 1
			printpushpopdebuginfo push name = "videophone_show_slide"
			pushsoundbussparams
			setsoundbussparams Cell_Phone_FMV_BussSet time = 0.5
		endif
		createscreenelement {
			type = movieelement
			id = videophone_movie
			local_id = sponsor_vid
			pos = <movie_pos>
			scale = <movie_scale>
			parent = <parent>
			movie = <selected_movie>
			textureslot = 1
			no_hold
			no_looping
			just = [top left]
		}
		runscriptonscreenelement id = <parent> videophone_wait_for_movie params = {<...> callback = videophone_next_slide_or_continue}
	else
		if structurecontains structure = <slide_struct> time
			time = (<slide_struct>.time)
		endif
		runscriptonscreenelement id = <parent> videophone_message_wait params = {time = <time> <...>}
	endif
	if structurecontains structure = <slide_struct> icon
		if NOT screenelementexists id = the_icon
			createscreenelement {
				type = spriteelement
				id = the_icon
				parent = <parent>
				just = [top left]
				scale = 1.0
				alpha = 1
			}
		endif
		if structurecontains structure = <slide_struct> icon_scale
			icon_scale = (<slide_struct>.icon_scale)
		else
			icon_scale = 1
		endif
		printf 'icon scale is %s' s = <icon_scale>
		setscreenelementprops {
			id = the_icon
			texture = (<slide_struct>.icon)
			alpha = 1
		}
		doscreenelementmorph {
			id = the_icon
			scale = <icon_scale>
			time = 0
		}
		getscreenelementdims id = the_icon
		doscreenelementmorph {
			id = the_icon
			pos = ((<screenDims>.(0.0, 1.0) / 2 - <height> / 2) * (0.0, 1.0) + (<screenDims>.(1.0, 0.0) / 2 - <width> / 2) * (1.0, 0.0))
			time = 0
		}
		getscreenelementdims id = the_icon
	endif
	if structurecontains structure = (<slides> [<slide_num>]) dialog
		if NOT screenelementexists id = videophone_dialog
			createscreenelement {
				id = videophone_dialog
				type = textblockelement
				parent = <parent>
				font = text_a1
				scale = 0.7
				just = [top left]
				rgba = [128 128 128 255]
				dims = (650.0, 250.0)
			}
		endif
		setscreenelementprops {
			id = videophone_dialog
			text = (<slide_struct>.dialog)
		}
		getscreenelementdims id = videophone_dialog
		doscreenelementmorph {
			id = videophone_dialog
			pos = ((<screenDims>.(0.0, 1.0) / 2 - <height> / 2) * (0.0, 1.0) + (<screenDims>.(1.0, 0.0) / 2 - <width> / 2) * (1.0, 0.0) + (0.0, 100.0))
			just = [top left]
			time = 0
		}
	endif
	if structurecontains structure = (<slide_struct>) audio
		playsound (<slide_struct>.audio) vol = 100 buss = `default`
	endif
	if structurecontains structure = <slide_struct> sound_event
		soundevent event = (<slide_struct>.sound_event)
		videophone_root :settags current_sound_event = (<slide_struct>.sound_event)
	endif
	<parent> :settags slide_num = (<slide_num> + 1)
endscript

script videophone_next_slide_or_continue 
	printf '---- videophone_next_slide_or_continue'
	videophone_root :getsingletag did_movie_buss
	if gotparam did_movie_buss
		if (<did_movie_buss> = 1)
			videophone_root :settags did_movie_buss = 0
			printpushpopdebuginfo pop name = "videophone_next_slide_or_continue"
			popsoundbussparams
		endif
	endif
	<parent> :getsingletag slide_num
	<parent> :getsingletag array_size
	if (<array_size> > <slide_num>)
		if ((<array_size> - 1) = <slide_num>)
			last_slide = last_slide
		endif
		videophone_show_slide <...>
		<parent> :settags slide_num = (<slide_num> + 1)
	else
		if gotparam movie
			printf 'Movies are no longer supported... please use the movie param in the slide structure'
		endif
		videophone_back_to_menu
	endif
endscript

script videophone_message_wait \{time = 2.75}
	wait <time> seconds
	printf \{'---- videophone_message_wait'}
	videophone_next_slide_or_continue <...>
endscript

script videophone_show_movie 
	printf '---- videophone_show_movie'
	if screenelementexists id = videophone_screen_cont
		destroyscreenelement id = videophone_screen_cont
	endif
	videophone_root :gettags
	createscreenelement {
		type = containerelement
		id = videophone_screen_cont
		dims = <screenDims>
		pos = <screenPos>
		parent = videophone_root
		just = [top left]
	}
	parent = videophone_screen_cont
	createscreenelement {
		type = movieelement
		id = videophone_movie
		local_id = sponsor_vid
		pos = (14.0, 14.0)
		parent = <parent>
		movie = <movie>
		textureslot = 1
		no_hold
		scale = (450.0, 300.0)
		no_looping
		just = [top left]
	}
	create_helper_text {
		helper_text_elements = [
			{text = "\\m1 Back"}
		]
		parent = root_window
		no_bar
	}
	setscreenelementprops {
		id = videophone_screen_cont
		event_handlers = [
			{pad_back videophone_pad_back_sound}
			{pad_back videophone_back_to_menu params = {button_pressed}}
		]
	}
	launchevent type = focus target = videophone_screen_cont
	spawnscript videophone_wait_for_movie
endscript

script videophone_wait_for_movie 
	printf \{'--- videophone_wait_for_movie'}
	wait \{10
		frames}
	begin
	if ismovieplaying \{textureslot = 1}
		printf \{'movie playing....'}
		wait \{10
			frames}
	else
		break
	endif
	repeat
	wait \{1
		second}
	if gotparam \{callback}
		spawnscriptnow <callback> params = {<...>}
	else
		spawnscriptnow \{videophone_back_to_menu}
	endif
endscript

script ui_destroy_videophone 
	printf 'UI: ui_destroy_videophone'
	unloadpak 'pak/videophone/videophone.pak'
	killspawnedscript name = videophone_menu_wait_and_focus
	killspawnedscript name = videophone_priority_msg
	if screenelementexists id = videophone_root
		videophone_root :getsingletag priority
		destroyscreenelement id = videophone_root
	endif
	if screenelementexists id = helper_text_anchor
		destroyscreenelement id = helper_text_anchor
	endif
	destroy_pause_back
	killskatercamanim name = ui_pausemenu_cam
	if isps3
		CutsceneUnPauseMusicAndPlaylistTimer
	endif
	printpushpopdebuginfo pop name = "ui_destroy_videophone"
	if ($videophone_soundbuss_active = 1)
		popsoundbussparams
	endif
	change videophone_soundbuss_active = 0
	pausemusic 0
	waitunloadpak 'pak/videophone/videophone.pak' block
	restore_start_key_binding
	broadcastevent type = videophone_menu_end
endscript

script ui_destroy_videophone_priority 
	ui_destroy_videophone
	if screenelementexists \{id = helper_text_anchor}
		destroyscreenelement \{id = helper_text_anchor}
	endif
	restore_start_key_binding
endscript

script build_videophone dims = (1280.0, 960.0) scale = 1.0 pos = (800.0, 10.0)
	pos = (-175.0, -250.0)
	createscreenelement {
		type = containerelement
		id = videophone_root
		dims = <dims>
		pos = <pos>
		scale = <scale>
		parent = root_window
		just = [top left]
	}
	createscreenelement {
		type = spriteelement
		parent = videophone_root
		texture = motorola_whole_phone
		pos = (0.0, 0.0)
		just = [left top]
	}
	getscreenelementdims id = <id>
	screenDims = (290.0, 380.0)
	screenPos = (370.0, 370.0)
	videophone_root :settags screenDims = <screenDims> screenPos = <screenPos>
endscript

script videophone_create_notification_swatch 
	printf \{'--- videophone_create_notification_swatch'}
	soundevent \{event = SK6_SFX_IncomingBeeper}
	spawnscriptnow \{videophone_wait_and_display_notification}
endscript

script videophone_wait_and_display_notification 
	ui_display_message \{type = alert
		color = amber
		text = "Check da Phone"
		override_time = 10}
endscript

script videophone_notify_user 
	printf \{'--- videophone_notify_user'}
	videophone_create_notification_swatch
endscript
