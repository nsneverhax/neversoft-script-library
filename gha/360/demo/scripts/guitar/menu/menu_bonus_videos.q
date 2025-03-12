
script create_bonus_videos_menu \{came_from_movie = 0}
	kill_start_key_binding
	if (<came_from_movie> = 1)
		spawnscriptnow \{menu_music_on}
	endif
	change \{bv_id_index = 0}
	create_menu_backdrop \{texture = venue_bg}
	createscreenelement \{type = containerelement
		parent = root_window
		id = bv_container
		pos = (0.0, 0.0)}
	displaysprite \{parent = bv_container
		tex = options_videos_poster
		just = [
			center
			center
		]
		pos = (640.0, 320.0)
		dims = (850.0, 850.0)
		rot_angle = 3
		z = 51}
	displaysprite \{parent = bv_container
		tex = white
		rgba = [
			220
			100
			100
			255
		]
		just = [
			center
			center
		]
		pos = (640.0, 360.0)
		dims = (700.0, 700.0)
		rot_angle = 3}
	displaysprite {
		parent = bv_container
		id = bv_hilite
		tex = white
		rgba = [105 130 85 255]
		just = [center top]
		pos = ($bv_hilite_array [0])
		dims = (700.0, 40.0)
		rot_angle = 4
		z = 49
	}
	displaysprite \{parent = bv_container
		tex = toprockers_tape_1
		pos = (250.0, 130.0)
		rot_angle = 75
		dims = (192.0, 96.0)
		z = 100}
	displaysprite \{parent = bv_container
		tex = toprockers_tape_1
		rgba = [
			0
			0
			0
			128
		]
		pos = (255.0, 135.0)
		rot_angle = 75
		dims = (192.0, 96.0)
		z = 99}
	displaysprite \{parent = bv_container
		tex = toprockers_tape_2
		pos = (1070.0, 270.0)
		rot_angle = 75
		dims = (192.0, 96.0)
		z = 100
		flip_v}
	displaysprite \{parent = bv_container
		tex = toprockers_tape_1
		rgba = [
			0
			0
			0
			128
		]
		pos = (1075.0, 275.0)
		rot_angle = 75
		dims = (192.0, 96.0)
		z = 99
		flip_v}
	createscreenelement \{type = spriteelement
		parent = bv_container
		texture = controller_2p_arrow
		pos = (640.0, 450.0)
		just = [
			center
			center
		]
		dims = (32.0, 64.0)
		id = venue_down_arrow
		z_priority = 99
		alpha = 1
		flip_h
		flip_v}
	createscreenelement \{type = spriteelement
		parent = bv_container
		texture = controller_2p_arrow
		pos = (640.0, 450.0)
		just = [
			center
			center
		]
		dims = (40.0, 72.0)
		id = venue_down_arrow2
		z_priority = 99
		rgba = [
			0
			0
			0
			255
		]
		alpha = 1
		flip_h
		flip_v}
	createscreenelement \{type = spriteelement
		parent = bv_container
		texture = controller_2p_arrow
		pos = (640.0, 170.0)
		just = [
			center
			center
		]
		dims = (32.0, 64.0)
		id = venue_up_arrow
		z_priority = 99
		alpha = 0}
	createscreenelement \{type = spriteelement
		parent = bv_container
		texture = controller_2p_arrow
		pos = (640.0, 170.0)
		just = [
			center
			center
		]
		dims = (40.0, 72.0)
		id = venue_up_arrow2
		z_priority = 99
		rgba = [
			0
			0
			0
			255
		]
		alpha = 0}
	pos = ($bv_hilite_pos)
	i = 0
	begin
	formattext checksumname = text_id 'bv_text_%d' d = <i>
	displaytext {
		parent = bv_container
		id = <text_id>
		font = text_a3
		text = ($bv_text_array [<i>].text)
		rgba = [255 245 225 255]
		z = 50
		rot = 4
		just = [left top]
		pos = <pos>
		scale = 1.2
		noshadow
	}
	getscreenelementdims id = <text_id>
	setscreenelementprops id = <text_id> scale = 1.25
	fit_text_in_rectangle id = <text_id> only_if_larger_x = 1 dims = ((270.0, 0.0) + <height> * (0.0, 1.25)) start_x_scale = 1.2
	<pos> = (<pos> + (-2.0, 40.0))
	if (<i> >= 1)
		if bv_should_gray_out_selection text = ($bv_text_array [<i>].text)
			setscreenelementprops id = <text_id> rgba = [140 55 60 255]
		else
			setscreenelementprops id = <text_id> rgba = [255 245 225 255]
		endif
	endif
	<i> = (<i> + 1)
	repeat 5
	event_handlers = [
		{pad_up bonus_videos_scroll_up}
		{pad_down bonus_videos_scroll_down}
		{pad_back bonus_videos_go_back}
	]
	new_menu {
		scrollid = mbv_scroll
		vmenuid = mbv_vmenu
		menu_pos = (480.0, 130.0)
		text_left
		spacing = -12
		rot_angle = 1
		no_wrap
		event_handlers = <event_handlers>
		no_focus = 1
	}
	text_params = {parent = mbv_vmenu type = textelement font = text_a3 rgba = [255 245 225 255] z_priority = -50 rot_angle = 3 scale = 1.2}
	createscreenelement {
		<text_params>
		id = video_option_id_0
		event_handlers = [
			{pad_choose ui_flow_manager_respond_to_action params = {text = ($bv_text_array [0].text) action = select_credits}}
		]
	}
	getarraysize ($bv_text_array)
	change bv_max_videos = <array_size>
	i = 1
	begin
	formattext checksumname = video_option_id 'video_option_id_%i' i = <i>
	createscreenelement {
		<text_params>
		id = <video_option_id>
		event_handlers = [
			{pad_choose menu_bonus_videos_play_video params = {text = ($bv_text_array [<i>].text) movie = ($bv_text_array [<i>].movie)}}
		]
	}
	<i> = (<i> + 1)
	repeat (<array_size> - 1)
	launchevent \{type = focus
		target = mbv_vmenu}
	scroll_count = ($bv_index)
	change \{bv_index = 0}
	i = 0
	if (<scroll_count> > 0)
		begin
		launchevent \{type = pad_down
			target = mbv_vmenu}
		<i> = (<i> + 1)
		repeat <scroll_count>
	endif
	add_user_control_helper \{text = "SELECT"
		button = green
		z = 100}
	add_user_control_helper \{text = "BACK"
		button = red
		z = 100}
	add_user_control_helper \{text = "UP/DOWN"
		button = strumbar
		z = 100}
endscript

script replace_video_option_handlers 
	getarraysize ($bv_text_array)
	i = 0
	begin
	formattext checksumname = video_option_id 'video_option_id_%i' i = <i>
	setscreenelementprops id = <video_option_id> event_handlers = [] replace_handlers
	<i> = (<i> + 1)
	repeat (<array_size>)
endscript

script destroy_bonus_videos_menu 
	clean_up_user_control_helpers
	destroy_menu \{menu_id = bv_container}
	destroy_menu_backdrop
	destroy_menu \{menu_id = mbv_scroll}
endscript

script bonus_videos_go_back 
	if ($transitions_locked = 0)
		launchevent \{type = unfocus
			target = mbv_vmenu}
	endif
	menu_flow_go_back
endscript
bv_text_array = [
	{
		text = "CREDITS"
	}
	{
		text = "GETTING TOGETHER"
		id = ao_long_1
		movie = 'AO_long_1'
	}
	{
		text = "FIRST TASTE"
		id = ao_long_2
		movie = 'AO_long_2'
	}
	{
		text = "THE RETURN"
		id = ao_long_3
		movie = 'AO_long_3'
	}
	{
		text = "SUPERSTARS"
		id = ao_long_4
		movie = 'AO_long_4'
	}
	{
		text = "AMERICAN BAND"
		id = ao_long_5
		movie = 'AO_long_5'
	}
	{
		text = "LEGENDS"
		id = ao_long_6
		movie = 'AO_long_6'
	}
	{
		text = "WHAT'S NEXT?"
		id = ao_long_7
		movie = 'AO_long_7'
	}
	{
		text = "CAREER 1"
		id = ao_short_1
		movie = 'AO_short_1'
	}
	{
		text = "CAREER 2"
		id = ao_short_2
		movie = 'AO_short_2'
	}
	{
		text = "CAREER 3"
		id = ao_short_3
		movie = 'AO_short_3'
	}
	{
		text = "CAREER 4"
		id = ao_short_4
		movie = 'AO_short_4'
	}
	{
		text = "CAREER 5"
		id = ao_short_5
		movie = 'AO_short_5'
	}
	{
		text = "CAREER 6"
		id = ao_short_6
		movie = 'AO_short_6'
	}
	{
		text = "CAREER END"
		id = singleplayer_end
		movie = 'singleplayer_end'
	}
	{
		text = "ACTIVISION"
		id = atvi
		movie = 'atvi'
	}
	{
		text = "RED OCTANE"
		id = ro_logo
		movie = 'ro_logo'
	}
	{
		text = "NEVERSOFT"
		id = ns_logo
		movie = 'ns_logo'
	}
	{
		text = "INTRO"
		id = intro
		movie = 'intro'
	}
]
bv_hilite_array = [
	(640.0, 207.0)
	(640.0, 247.0)
	(640.0, 287.0)
	(640.0, 327.0)
	(640.0, 367.0)
]
bv_index = 0
bv_id_index = 0
bv_hilite_pos = (455.0, 190.0)
bv_max_videos = 6

script bv_unlock_intro_videos 
	setglobaltags ($bv_text_array [15].id) params = {unlocked = 1}
	setglobaltags ($bv_text_array [16].id) params = {unlocked = 1}
	setglobaltags ($bv_text_array [17].id) params = {unlocked = 1}
	setglobaltags ($bv_text_array [18].id) params = {unlocked = 1}
endscript

script bv_find_first_career_movie_index 
	getarraysize \{$bv_text_array}
	<i> = 0
	begin
	if ($bv_text_array [<i>].text = "CAREER 1")
		return index = <i>
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	scriptassert \{"Index not found in bv_find_first_career_movie_index"}
endscript

script bv_should_gray_out_selection 
	getplatform
	if NOT english
		if (<platform> = ps2 || <platform> = ps3)
			return \{false}
		endif
	endif
	getarraysize ($bonus_videos)
	bonus_size = <array_size>
	getarraysize ($bv_text_array)
	i = 1
	begin
	if gotparam \{text}
		if (<text> = ($bv_text_array [<i>].text))
			getglobaltags ($bv_text_array [<i>].id)
			if (<unlocked> = 0)
				return \{true}
			else
				return \{false}
			endif
		endif
	elseif gotparam \{movie}
		if (<movie> = ($bv_text_array [<i>].movie))
			getglobaltags ($bv_text_array [<i>].id)
			if (<unlocked> = 0)
				return \{true}
			else
				return \{false}
			endif
		endif
	endif
	<i> = (<i> + 1)
	repeat (<array_size> - 1)
	return \{false}
endscript

script get_movie_id_by_name 
	getarraysize ($bv_text_array)
	i = 5
	begin
	if (($bv_text_array [<i>].movie) = <movie>)
		return id = ($bv_text_array [<i>].id)
	endif
	<i> = (<i> + 1)
	repeat (<array_size> - 5)
	printstruct <...>
	scriptassert \{"Movie not found in get_movie_id_by_name!"}
endscript

script bonus_videos_scroll_down \{quick = 0}
	formattext checksumname = video_text_id 'bv_text_%d' d = ($bv_id_index)
	make_sound = 1
	if ($bv_id_index < 4)
		change bv_id_index = ($bv_id_index + 1)
		setscreenelementprops id = bv_hilite pos = ($bv_hilite_array [$bv_id_index])
		change bv_index = ($bv_index + 1)
	else
		setscreenelementprops \{id = venue_up_arrow
			alpha = 1}
		setscreenelementprops \{id = venue_up_arrow2
			alpha = 1}
		if ($bv_index < ($bv_max_videos - 1))
			change bv_index = ($bv_index + 1)
			if ($bv_index = ($bv_max_videos - 1))
				setscreenelementprops \{id = venue_down_arrow
					alpha = 0
					flip_h}
				setscreenelementprops \{id = venue_down_arrow2
					alpha = 0
					flip_h}
			endif
			i = 0
			begin
			getuppercasestring ($bv_text_array [($bv_index - <i>)].text)
			formattext checksumname = video_text_id 'bv_text_%d' d = (4 - <i>)
			setscreenelementprops id = <video_text_id> text = <uppercasestring>
			getscreenelementdims id = <video_text_id>
			setscreenelementprops id = <video_text_id> scale = 1.25
			fit_text_in_rectangle id = <video_text_id> only_if_larger_x = 1 dims = ((270.0, 0.0) + <height> * (0.0, 1.25)) start_x_scale = 1.25
			if bv_should_gray_out_selection text = <uppercasestring>
				setscreenelementprops id = <video_text_id> rgba = [140 55 60 255]
			else
				setscreenelementprops id = <video_text_id> rgba = [255 245 225 255]
			endif
			<i> = (<i> + 1)
			repeat 5
		else
			<make_sound> = 0
		endif
	endif
	if (<make_sound> = 1)
		if (<quick> = 0)
			generic_menu_up_or_down_sound \{down}
		endif
	endif
endscript

script bonus_videos_scroll_up 
	make_sound = 1
	formattext checksumname = video_text_id 'bv_text_%d' d = ($bv_id_index)
	if ($bv_id_index > 0)
		change bv_id_index = ($bv_id_index -1)
		setscreenelementprops id = bv_hilite pos = ($bv_hilite_array [$bv_id_index])
		change bv_index = ($bv_index -1)
	else
		setscreenelementprops \{id = venue_down_arrow
			alpha = 1
			flip_h
			flip_v}
		setscreenelementprops \{id = venue_down_arrow2
			alpha = 1
			flip_h
			flip_v}
		if ($bv_index > 0)
			change bv_index = ($bv_index -1)
			if ($bv_index = 0)
				setscreenelementprops \{id = venue_up_arrow
					alpha = 0}
				setscreenelementprops \{id = venue_up_arrow2
					alpha = 0}
			endif
			i = 0
			begin
			getuppercasestring ($bv_text_array [($bv_index + <i>)].text)
			formattext checksumname = video_text_id 'bv_text_%d' d = <i>
			setscreenelementprops id = <video_text_id> text = <uppercasestring>
			getscreenelementdims id = <video_text_id>
			setscreenelementprops id = <video_text_id> scale = 1.25
			fit_text_in_rectangle id = <video_text_id> only_if_larger_x = 1 dims = ((270.0, 0.0) + <height> * (0.0, 1.25)) start_x_scale = 1.25
			if bv_should_gray_out_selection text = <uppercasestring>
				setscreenelementprops id = <video_text_id> rgba = [140 55 60 255]
			else
				setscreenelementprops id = <video_text_id> rgba = [255 245 225 255]
			endif
			<i> = (<i> + 1)
			repeat 5
		else
			<make_sound> = 0
		endif
	endif
	if (<make_sound> = 1)
		generic_menu_up_or_down_sound \{up}
	endif
endscript

script bv_morph_hilite \{time = 0.01}
	bv_hilite :domorph pos = (<pos> - (0.0, 20.0)) scale = (1.0, 0.25) time = <time> relative_scale
	bv_hilite :domorph pos = (<pos>) scale = 1 time = <time> relative_scale
endscript

script menu_bonus_videos_play_video \{movie = 'atvi'}
	if bv_should_gray_out_selection text = <text>
	else
		launchevent \{type = unfocus
			target = mbv_vmenu}
		menu_music_off
		playmovieandwait movie = <movie>
		spawnscriptnow \{menu_music_on}
		launchevent \{type = focus
			target = mbv_vmenu}
	endif
endscript

script shutdown_options_video_monitor 
	killspawnedscript \{name = options_video_monitor}
	killspawnedscript \{name = playmovieandwait}
	killmovie \{textureslot = 0}
	killmovie \{textureslot = 1}
	fadetoblack \{off
		time = 0}
endscript
