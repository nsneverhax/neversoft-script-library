
script create_bonus_videos_menu \{came_from_movie = 0}
	kill_start_key_binding
	if (<came_from_movie> = 1)
		killspawnedscript \{name = scrolling_list_queue_next_item}
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
		dims = (700.0, 42.0)
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
		scale = 1
		noshadow
	}
	getscreenelementdims id = <text_id>
	setscreenelementprops id = <text_id> scale = 1.16
	fit_text_in_rectangle id = <text_id> only_if_larger_x = 1 dims = ((350.0, 0.0) + <height> * (0.0, 1.16))
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
		event_handlers = [
			{pad_choose ui_flow_manager_respond_to_action params = {text = ($bv_text_array [0].text) action = select_credits}}
		]
	}
	createscreenelement {
		<text_params>
		event_handlers = [
			{pad_choose menu_bonus_videos_play_video params = {text = ($bv_text_array [1].text) movie = 'sexpistols'}}
		]
	}
	createscreenelement {
		<text_params>
		event_handlers = [
			{pad_choose menu_bonus_videos_play_video params = {text = ($bv_text_array [2].text) movie = 'brettmichaels'}}
		]
	}
	createscreenelement {
		<text_params>
		event_handlers = [
			{pad_choose menu_bonus_videos_play_video params = {text = ($bv_text_array [3].text) movie = 'slash'}}
		]
	}
	createscreenelement {
		<text_params>
		event_handlers = [
			{pad_choose menu_bonus_videos_play_video params = {text = ($bv_text_array [4].text) movie = 'tommorello'}}
		]
	}
	getarraysize ($bv_text_array)
	change bv_max_videos = <array_size>
	i = 5
	begin
	createscreenelement {
		<text_params>
		event_handlers = [
			{pad_choose menu_bonus_videos_play_video params = {text = ($bv_text_array [<i>].text) movie = ($bv_text_array [<i>].movie)}}
		]
	}
	<i> = (<i> + 1)
	repeat (<array_size> - 5)
	setglobaltags ($bv_text_array [5].id) params = {unlocked = 1}
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
	add_user_control_helper \{text = 'SELECT'
		button = green
		z = 100}
	add_user_control_helper \{text = 'BACK'
		button = red
		z = 100}
	add_user_control_helper \{text = 'UP/DOWN'
		button = strumbar
		z = 100}
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
		text = 'CREDITS'
	}
	{
		text = 'SEX PISTOLS'
		id = sexpistols
	}
	{
		text = 'BRET MICHAELS'
		id = brettmichaels
	}
	{
		text = 'SLASH'
		id = slash
	}
	{
		text = 'TOM MORELLO'
		id = tommorello
	}
	{
		text = 'INTRO'
		id = intro
		movie = 'intro'
	}
	{
		text = 'CAREER 01'
		id = singleplayer_01
		movie = 'singleplayer_01'
	}
	{
		text = 'CAREER 02'
		id = singleplayer_02
		movie = 'singleplayer_02'
	}
	{
		text = 'CAREER 03'
		id = singleplayer_03
		movie = 'singleplayer_03'
	}
	{
		text = 'CAREER 04'
		id = singleplayer_04
		movie = 'singleplayer_04'
	}
	{
		text = 'CAREER 05'
		id = singleplayer_05
		movie = 'singleplayer_05'
	}
	{
		text = 'CAREER 06'
		id = singleplayer_06
		movie = 'singleplayer_06'
	}
	{
		text = 'CAREER 07'
		id = singleplayer_07
		movie = 'singleplayer_07'
	}
	{
		text = 'CAREER 08'
		id = singleplayer_08
		movie = 'singleplayer_08'
	}
	{
		text = 'CAREER END'
		id = singleplayer_end
		movie = 'singleplayer_end'
	}
	{
		text = 'COOP CAREER 01'
		id = coop_01
		movie = 'coop_01'
	}
	{
		text = 'COOP CAREER 02'
		id = coop_02
		movie = 'coop_02'
	}
	{
		text = 'COOP CAREER 03'
		id = coop_03
		movie = 'coop_03'
	}
	{
		text = 'COOP CAREER 04'
		id = coop_04
		movie = 'coop_04'
	}
	{
		text = 'COOP CAREER 05'
		id = coop_05
		movie = 'coop_05'
	}
	{
		text = 'COOP CAREER 06'
		id = coop_06
		movie = 'coop_06'
	}
]
bv_hilite_array = [
	(640.0, 203.0)
	(640.0, 243.0)
	(640.0, 283.0)
	(640.0, 323.0)
	(640.0, 363.0)
]
bv_index = 0
bv_id_index = 0
bv_hilite_pos = (455.0, 184.0)
bv_max_videos = 6

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

	scriptassert \{'Movie not found in get_movie_id_by_name!'}
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
			setscreenelementprops id = <video_text_id> scale = 1.16
			fit_text_in_rectangle id = <video_text_id> only_if_larger_x = 1 dims = ((350.0, 0.0) + <height> * (0.0, 1.16))
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
			setscreenelementprops id = <video_text_id> scale = 1.16
			fit_text_in_rectangle id = <video_text_id> only_if_larger_x = 1 dims = ((350.0, 0.0) + <height> * (0.0, 1.16))
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
