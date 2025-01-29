freestyle_highway_gem_masks = [
	65536
	4096
	256
	16
	1
	1048576
]
freestyle_highway_gem_names = [
	green
	red
	yellow
	blue
	orange
	white
]
freestyle_highway_button_names = [
	qs(0x996060a6)
	qs(0xaed586b2)
	qs(0x4d215f79)
	qs(0xe41794e3)
	qs(0x51b9eaae)
	qs(0xd3a272f7)
]
freestyle_suggested_colors = [
	'orange'
	'blue'
	'green'
]
freestyle_show_small_fretbars = 0
freestyle_beat_division = 0.5
freestyle_highway_speed = 0.8
freestyle_whammy_suggested_on = 1
fcn_nowbar_base = [
]
fcn_nowbar_up = [
]
fcn_nowbar_down = [
]
fcn_nowbar_flash = [
]
fcn_guitar_hit = [
]
fcn_gem_creation = [
]
fcn_gem_drum_creation = [
]
fcn_solo_sidebar_left = [
]
fcn_solo_sidebar_right = [
]
fcn_solo_container_left = [
	solo_containerl_p1
	solo_containerl_p2
	solo_containerl_p3
]
fcn_solo_container_right = [
	solo_containerr_p1
	solo_containerr_p2
	solo_containerr_p3
]
fcn_star_cont_left = [
	starpower_container_leftp1
	starpower_container_leftp2
	starpower_container_leftp3
]
fcn_star_cont_right = [
	starpower_container_rightp1
	starpower_container_rightp2
	starpower_container_rightp3
]
fcn_sidebar_cont_left = [
	sidebar_container_leftp1
	sidebar_container_leftp2
	sidebar_container_leftp3
]
fcn_sidebar_cont_right = [
	sidebar_container_rightp1
	sidebar_container_rightp2
	sidebar_container_rightp3
]
fcn_gem_cont = [
	gem_containerp1
	gem_containerp2
	gem_containerp3
]

script freestyle_setup_highway \{Player = 1
		starttime = 0
		practice_intro = 0
		training_mode = 0
		endtime = 99999999
		devil_finish_restart = 0
		end_credits_restart = 0
		loading_transition = 0
		show_lower = true}
	Change \{playing_song = 1}
	mark_unsafe_for_shutdown
	menu_music_off \{setflag = 1}
	if (<show_lower> = true)
		hide_lower = FALSE
	else
		hide_lower = true
	endif
	setup_hud <...>
	generate_pos_table Player = <Player>
	SetScreenElementLock \{id = root_window
		OFF}
	get_num_non_vocals_players_onscreen
	get_non_vocalist_player_number Player = <Player>
	formatText checksumName = freestyle_highway_name 'freestyle_highway_containerp%p' p = <Player> AddToStringLookup = true
	formatText checksumName = freestyle_highway_base 'freestyle_highway_base_p%p' p = <Player> AddToStringLookup = true
	freestyle_get_highway_index Player = (<Player> -1)
	freestyle_get_human_player_count
	get_highway_pos_and_scale num_non_vocals_players = <human_freestyle_players> non_vocalist_player = <index> Player = <Player>
	<Pos> = (<Pos> + $highway_guitarfreestyle.highway_offset)
	if (($freestyle_game_mode) = tutorial)
		Pos = (($highway_guitarfreestyle.tutorial_highway_pos) + ($highway_guitarfreestyle.highway_offset))
		Scale = (1.0, 1.0)
	endif
	CreateScreenElement {
		Type = ContainerElement
		id = <freestyle_highway_base>
		parent = freestyle_hud
		rgba = [255 255 255 255]
		Pos = <Pos>
		dims = (1280.0, 720.0)
		just = [left top]
	}
	CreateScreenElement {
		Type = ContainerElement
		id = <freestyle_highway_name>
		parent = <freestyle_highway_base>
		Pos = (0.0, 360.0)
		dims = (1280.0, 720.0)
		Scale = <Scale>
	}
	container_id = ($fcn_gem_cont [(<Player> -1)])
	CreateScreenElement {
		Type = ContainerElement
		id = <container_id>
		parent = <freestyle_highway_name>
		Pos = (0.0, 0.0)
		just = [center bottom]
		z_priority = 0
	}
	formatText checksumName = gem_notes_id 'gem_notes_containerp%p' p = <Player> AddToStringLookup = true
	CreateScreenElement {
		Type = ContainerElement
		parent = <container_id>
		id = <gem_notes_id>
		Pos = (640.0, 0.0)
		just = [center center]
	}
	formatText checksumName = fretbar_id 'fretbar_containerp%p' p = <Player> AddToStringLookup = true
	CreateScreenElement {
		Type = ContainerElement
		parent = <container_id>
		id = <fretbar_id>
		Pos = (640.0, 0.0)
		just = [center center]
	}
	pos_table = ($highway_pos_table [(<Player> -1)])
	hpos = (640.0, 0.0)
	hDims = ((<pos_table>.highway_top_width) * (1.0, 0.0))
	if (<show_lower> = true)
		formatText checksumName = highway_name 'Highway_2Dp%p' p = <Player> AddToStringLookup = true
		CreateScreenElement {
			Type = SpriteElement
			id = <highway_name>
			parent = <container_id>
			texture = freestylehighwaybg
			clonematerial = <highway_material>
			Pos = <hpos>
			dims = <hDims>
			just = [center bottom]
			z_priority = 0.1
			highway_player = <Player>
			highway_speed = 0.5
		}
	endif
	setplayerinfo <Player> scroll_time = 3.5
	Change \{freestyle_show_small_fretbars = 0}
	Change \{freestyle_beat_division = 0.5}
	getplayerinfo <Player> scroll_time
	highway_speed = (0.0 - ((<pos_table>.gHighwayTiling) / (<scroll_time> - $destroy_time)))
	Set2DHighwaySpeed speed = <highway_speed> id = <highway_name> Player = <Player>
	Change freestyle_highway_speed = <highway_speed>
	fe = ((<pos_table>.highway_playline) - (<pos_table>.highway_height))
	fs = (<fe> + (<pos_table>.highway_fade))
	now_scale = (((<pos_table>.nowbar_scale_x) * (1.0, 0.0)) + ((<pos_table>.nowbar_scale_y) * (0.0, 1.0)))
	if (<show_lower> = true)
		lpos = (($sidebar_x [(<Player> -1)] * (1.0, 0.0)) + ($sidebar_y [(<Player> -1)] * (0.0, 1.0)) + (640.0, 0.0))
		langle = ($sidebar_angle [(<Player> -1)])
		rpos = ((((0.0 - $sidebar_x [(<Player> -1)]) + 0.0) * (1.0, 0.0)) + ($sidebar_y [(<Player> -1)] * (0.0, 1.0)) + (640.0, 0.0))
		rangle = (0.0 - ($sidebar_angle [(<Player> -1)]))
		Scale = (((<pos_table>.sidebar_x_scale) * (1.0, 0.0)) + ((<pos_table>.sidebar_y_scale) * (0.0, 1.0)))
		rscale = (((0 - (<pos_table>.sidebar_x_scale)) * (1.0, 0.0)) + ((<pos_table>.sidebar_y_scale) * (0.0, 1.0)))
		cont = ($fcn_sidebar_cont_left [(<Player> -1)])
		CreateScreenElement {
			Type = ContainerElement
			id = <cont>
			parent = <container_id>
			Pos = <lpos>
			rot_angle = <langle>
			just = [center bottom]
			z_priority = 3
		}
		formatText checksumName = Name 'sidebar_leftp%p' p = <Player> AddToStringLookup = true
		CreateScreenElement {
			Type = SpriteElement
			id = <Name>
			parent = <cont>
			material = sys_sidebar2D_sys_sidebar2D
			rgba = [255 255 255 255]
			Pos = (0.0, 0.0)
			Scale = <Scale>
			just = [center bottom]
			z_priority = 3
		}
		cont = ($fcn_sidebar_cont_right [(<Player> -1)])
		CreateScreenElement {
			Type = ContainerElement
			id = <cont>
			parent = <container_id>
			Pos = <rpos>
			rot_angle = <rangle>
			just = [center bottom]
			z_priority = 3
		}
		formatText checksumName = Name 'sidebar_rightp%p' p = <Player> AddToStringLookup = true
		CreateScreenElement {
			Type = SpriteElement
			id = <Name>
			parent = <cont>
			material = sys_sidebar2D_sys_sidebar2D
			rgba = [255 255 255 255]
			Pos = (0.0, 0.0)
			Scale = <rscale>
			just = [center bottom]
			z_priority = 3
		}
		Set2DHighwayFade start = <fs> end = <fe> id = <Name> Player = <Player>
		freestyle_starpower <...>
	endif
	instrument = ($freestyle_player_data [(<Player> -1)].instrument)
	if NOT (<instrument> = drums)
		offset_list = [0 , 1 , 2 , 3 , 4 , 5]
	else
		offset_list = [1 , 2 , 3 , 4 , 0 , 5]
	endif
	pos_table = $highway_guitarfreestyle
	highway_top = (<pos_table>.highway_playline - <pos_table>.highway_height)
	highway_bot = (<pos_table>.highway_playline)
	playline_y = (<pos_table>.nowbar_pos_y)
	width_factor = (((<playline_y> - <highway_top>) / (<highway_bot> - <highway_top>)) * <pos_table>.widthOffsetFactor)
	width_playline = (<pos_table>.highway_top_width + (<pos_table>.highway_top_width * <width_factor>))
	offset = (<width_playline> / 5.0)
	centerpos = ((639.0, 0.0) + (<playline_y> * (0.0, 1.0)))
	base_offset = ($highway_guitarfreestyle.nowbar_base_offset)
	base_pos = (<centerpos> + <base_offset>)
	formatText checksumName = nowbar_base 'nowbar_basep%p' p = <Player>
	CreateScreenElement {
		Type = SpriteElement
		id = <nowbar_base>
		parent = <container_id>
		material = freestylenowbarbase
		rgba = [255 255 255 255]
		Pos = <base_pos>
		Scale = ($highway_guitarfreestyle.nowbar_base_scale)
		just = [center bottom]
		z_priority = 3.6
	}
	formatText checksumName = nowbar_beat_container 'nowbar_beat_containerp%p' p = <Player>
	CreateScreenElement {
		Type = ContainerElement
		id = <nowbar_beat_container>
		parent = <container_id>
		Pos = <base_pos>
		Scale = ($highway_guitarfreestyle.nowbar_base_scale)
		just = [center bottom]
		internal_just = [center bottom]
	}
	formatText checksumName = nowbar_beat_container_weak 'nowbar_beat_container_weakp%p' p = <Player>
	CreateScreenElement {
		Type = ContainerElement
		id = <nowbar_beat_container_weak>
		parent = <container_id>
		Pos = <base_pos>
		Scale = ($highway_guitarfreestyle.nowbar_base_scale)
		just = [center bottom]
		internal_just = [center bottom]
	}
	color_num = 0
	begin
	color_text = ($freestyle_suggested_colors [<color_num>])
	if (<color_text> = 'blue')
		<beat_alpha> = 1.0
	else
		<beat_alpha> = 0.0
	endif
	<flip_x> = ($highway_guitarfreestyle.nowbar_beat_offset.(1.0, 0.0))
	<flip_y> = ($highway_guitarfreestyle.nowbar_beat_offset.(0.0, 1.0))
	<flipped_pos> = (((-1.0, 0.0) * <flip_x>) + ((0.0, 1.0) * <flip_y>))
	formatText checksumName = beat_piece_left 'beaticon_left_%c_p%p' c = <color_text> p = <Player>
	formatText checksumName = beat_material 'FreestyleBeatIcon%c' c = <color_text>
	CreateScreenElement {
		Type = SpriteElement
		id = <beat_piece_left>
		parent = <nowbar_beat_container>
		material = <beat_material>
		rgba = [255 255 255 255]
		Pos = <flipped_pos>
		just = [center bottom]
		alpha = <beat_alpha>
		blend = add
		flip_v
		z_priority = 3.7
	}
	formatText checksumName = beat_piece_right 'beaticon_right_%c_p%p' c = <color_text> p = <Player>
	CreateScreenElement {
		Type = SpriteElement
		id = <beat_piece_right>
		parent = <nowbar_beat_container>
		material = <beat_material>
		rgba = [255 255 255 255]
		Pos = ($highway_guitarfreestyle.nowbar_beat_offset)
		just = [center bottom]
		alpha = <beat_alpha>
		blend = add
		z_priority = 3.7
	}
	formatText checksumName = beat_piece_left 'beaticonweak_left_%c_p%p' c = <color_text> p = <Player>
	formatText checksumName = beat_material 'FreestyleBeatIconWeak%c' c = <color_text>
	CreateScreenElement {
		Type = SpriteElement
		id = <beat_piece_left>
		parent = <nowbar_beat_container_weak>
		material = <beat_material>
		rgba = [255 255 255 255]
		Pos = <flipped_pos>
		just = [center bottom]
		alpha = <beat_alpha>
		blend = add
		flip_v
		z_priority = 3.7
	}
	formatText checksumName = beat_piece_right 'beaticonweak_right_%c_p%p' c = <color_text> p = <Player>
	CreateScreenElement {
		Type = SpriteElement
		id = <beat_piece_right>
		parent = <nowbar_beat_container_weak>
		material = <beat_material>
		rgba = [255 255 255 255]
		Pos = ($highway_guitarfreestyle.nowbar_beat_offset)
		just = [center bottom]
		alpha = <beat_alpha>
		blend = add
		z_priority = 3.7
	}
	<color_num> = (<color_num> + 1)
	repeat 3
	nowbar_base_array = [None None None None None None]
	nowbar_up_array = [None None None None None None]
	nowbar_down_array = [None None None None None None]
	nowbar_flash_array = [None None None None None None]
	GetArraySize \{$gem_colors}
	array_count = 0
	begin
	<button_index> = (<offset_list> [<array_count>])
	Color = ($gem_colors [<button_index>])
	if StructureContains structure = (($button_up_models [(<Player> -1)]).<Color>) Name = Name
		if (<Color> = white)
			<offset> = 0
		endif
		<Pos> = (<centerpos> + ((<offset> * (<array_count> -2)) * (1.0, 0.0)))
		<color_string> = ($gem_colors_text [<button_index>])
		formatText checksumName = name_base '%s_basep%p' s = <color_string> p = <Player> AddToStringLookup = true
		formatText checksumName = name_string '%s_stringp%p' s = <color_string> p = <Player> AddToStringLookup = true
		formatText checksumName = name_up '%s_upp%p' s = <color_string> p = <Player> AddToStringLookup = true
		formatText checksumName = name_down '%s_downp%p' s = <color_string> p = <Player> AddToStringLookup = true
		formatText checksumName = name_flash '%s_flashp%p' s = <color_string> p = <Player> AddToStringLookup = true
		SetArrayElement ArrayName = nowbar_base_array index = <button_index> NewValue = <name_base>
		SetArrayElement ArrayName = nowbar_up_array index = <button_index> NewValue = <name_up>
		SetArrayElement ArrayName = nowbar_down_array index = <button_index> NewValue = <name_down>
		SetArrayElement ArrayName = nowbar_flash_array index = <button_index> NewValue = <name_flash>
		if NOT (<instrument> = drums)
			formatText checksumName = mat_up 'FreestyleNoteCatcher%sOff' s = <color_string> AddToStringLookup = true
			formatText checksumName = mat_down 'FreestyleNoteCatcher%sOn' s = <color_string> AddToStringLookup = true
		else
			formatText checksumName = mat_up 'FreestyleNoteCatcherDrums%sOff' s = <color_string> AddToStringLookup = true
			formatText checksumName = mat_down 'FreestyleNoteCatcherDrums%sOn' s = <color_string> AddToStringLookup = true
		endif
		CreateScreenElement {
			Type = ContainerElement
			id = <name_base>
			parent = <container_id>
			Pos = <Pos>
			just = [center bottom]
			internal_just = [center bottom]
			Scale = <now_scale>
		}
		CreateScreenElement {
			Type = ContainerElement
			id = <name_flash>
			parent = <name_base>
			Pos = (0.0, 0.0)
			z_priority = 3.3
		}
		if NOT (<Color> = white)
			CreateScreenElement {
				Type = SpriteElement
				id = <name_up>
				parent = <name_base>
				material = <mat_up>
				rgba = [255 255 255 255]
				Pos = (0.0, 0.0)
				just = [center bottom]
				z_priority = 3.9
			}
			CreateScreenElement {
				Type = SpriteElement
				id = <name_down>
				parent = <name_base>
				material = <mat_down>
				rgba = [255 255 255 255]
				Pos = (0.0, 0.0)
				just = [center bottom]
				z_priority = 3.9
				Hide
			}
			if ((<show_lower> = true) && (<array_count> < <array_Size>))
				string_pos2d = ((($button_up_models [(<Player> -1)]).<Color>.pos_2d) + ((-12.0 + (6.0 * <array_count>)) * (1.0, 0.0)))
				<string_scale> = (((<pos_table>.string_scale_x) * (1.0, 0.0)) + ((<pos_table>.string_scale_y) * (0.0, 1.0)))
				<string_pos2d> = (<string_pos2d> + (640.0, 40.0))
				CreateScreenElement {
					Type = SpriteElement
					id = <name_string>
					parent = <container_id>
					material = sys_String01_sys_String01
					rgba = [200 200 200 200]
					Scale = <string_scale>
					rot_angle = (($button_models [(<Player> -1)]).<Color>.angle)
					Pos = <string_pos2d>
					just = [center bottom]
					z_priority = 2
				}
			endif
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	SetArrayElement ArrayName = fcn_nowbar_base index = (<Player> -1) NewValue = <nowbar_base_array> globalarray
	SetArrayElement ArrayName = fcn_nowbar_up index = (<Player> -1) NewValue = <nowbar_up_array> globalarray
	SetArrayElement ArrayName = fcn_nowbar_down index = (<Player> -1) NewValue = <nowbar_down_array> globalarray
	SetArrayElement ArrayName = fcn_nowbar_flash index = (<Player> -1) NewValue = <nowbar_flash_array> globalarray
	setup_highway_move <...>
	create_highway_prepass <...>
	SetScreenElementLock \{id = root_window
		On}
	setslomo \{$current_speedfactor}
	mark_safe_for_shutdown
	resetwhammycachedrows
	printf \{qs(0x898f16b5)}
endscript

script freestyle_starpower 
	contl = ($fcn_star_cont_left [(<Player> -1)])
	contr = ($fcn_star_cont_right [(<Player> -1)])
	CreateScreenElement {
		Type = ContainerElement
		id = <contl>
		parent = <container_id>
		Pos = <lpos>
		rot_angle = <langle>
		z_priority = 3
	}
	CreateScreenElement {
		Type = ContainerElement
		id = <contr>
		parent = <container_id>
		Pos = <rpos>
		rot_angle = <rangle>
		z_priority = 3
	}
	solocontl = ($fcn_solo_container_left [(<Player> -1)])
	solocontr = ($fcn_solo_container_right [(<Player> -1)])
	CreateScreenElement {
		Type = ContainerElement
		id = <solocontl>
		parent = <contl>
		alpha = 0
		Scale = (1.0, 0.1)
	}
	CreateScreenElement {
		Type = ContainerElement
		id = <solocontr>
		parent = <contr>
		alpha = 0
		Scale = (1.0, 0.1)
	}
	sidebar_left_array = []
	sidebar_right_array = []
	color_num = 0
	solo_materials = [solo_sidebar_orange solo_sidebar_blue solo_sidebar_green]
	begin
	color_text = ($freestyle_suggested_colors [<color_num>])
	s_scale_x = (<Scale>.(1.0, 0.0) * <pos_table>.solo_side_x_scale)
	s_scale_y = (<Scale>.(0.0, 1.0) * <pos_table>.solo_side_y_scale)
	s_scale = ((<s_scale_x> * (1.0, 0.0)) + (<s_scale_y> * (0.0, 1.0)))
	l_pos = (<pos_table>.solo_side_x_offset * (-1.0, 0.0))
	formatText checksumName = Name 'sidebar_solo_left_%c_p%p' c = <color_text> p = <Player> AddToStringLookup = true
	AddArrayElement array = <sidebar_left_array> element = <Name>
	sidebar_left_array = <array>
	if (<color_num> = 1)
		show_or_hide = unhide
	else
		show_or_hide = Hide
	endif
	CreateScreenElement {
		Type = SpriteElement
		id = <Name>
		parent = <solocontl>
		material = (<solo_materials> [<color_num>])
		rgba = [255 255 255 255]
		blend = add
		Pos = <l_pos>
		Scale = <s_scale>
		just = [center bottom]
		z_priority = 2.9
		<show_or_hide>
	}
	s_scale_x = (<rscale>.(1.0, 0.0) * <pos_table>.solo_side_x_scale)
	s_scale_y = (<rscale>.(0.0, 1.0) * <pos_table>.solo_side_y_scale)
	s_scale = ((<s_scale_x> * (1.0, 0.0)) + (<s_scale_y> * (0.0, 1.0)))
	r_pos = (<pos_table>.solo_side_x_offset * (1.0, 0.0))
	formatText checksumName = Name 'sidebar_solo_right_%c_p%p' c = <color_text> p = <Player> AddToStringLookup = true
	AddArrayElement array = <sidebar_right_array> element = <Name>
	sidebar_right_array = <array>
	CreateScreenElement {
		Type = SpriteElement
		id = <Name>
		parent = <solocontr>
		material = (<solo_materials> [<color_num>])
		rgba = [255 255 255 255]
		blend = add
		Pos = <r_pos>
		Scale = <s_scale>
		just = [center bottom]
		z_priority = 2.9
		<show_or_hide>
	}
	<color_num> = (<color_num> + 1)
	repeat 3
	SetArrayElement ArrayName = fcn_solo_sidebar_left index = (<Player> -1) NewValue = <sidebar_left_array> globalarray
	SetArrayElement ArrayName = fcn_solo_sidebar_right index = (<Player> -1) NewValue = <sidebar_right_array> globalarray
endscript

script freestyle_solo_tilt 
	i = 0
	begin
	namel = ($fcn_solo_sidebar_left [(<Player> -1)] [<i>])
	namer = ($fcn_solo_sidebar_right [(<Player> -1)] [<i>])
	if (<i> = <tilt>)
		<namel> :se_setprops unhide
		<namer> :se_setprops unhide
	else
		<namel> :se_setprops Hide
		<namer> :se_setprops Hide
	endif
	i = (<i> + 1)
	repeat 3
endscript

script freestyle_start_gem_scroller \{starttime = 0
		practice_intro = 0
		training_mode = 0
		endtime = 99999999}
	mark_unsafe_for_shutdown
	setplayerinfo \{1
		interactive = 1}
	setplayerinfo \{2
		interactive = 1}
	setplayerinfo \{3
		interactive = 1}
	setplayerinfo \{4
		interactive = 1}
	SpawnScriptNow freestyle_gem_scroller params = {<...>}
	yield \{'ss freestyle_gem_scroller'}
	mark_safe_for_shutdown
endscript

script freestyle_gem_scroller \{Player = 1
		training_mode = 0
		difficulty = easy}
	setup_gemarrays song_name = <song_name> difficulty = <difficulty> Player = <Player>
	formatText checksumName = input_array 'input_arrayp%p' p = <Player>
	InputArrayCreate Name = <input_array>
	formatText checksumName = input_array 'input_arrayp%p' p = <Player>
	get_song_prefix song = <song_name>
	formatText checksumName = guitar_stream '%s_guitar' s = <song_prefix> AddToStringLookup
	getplayerinfo <Player> server_id
	createplayerserver id = <server_id> Player = <Player>
	getplayerinfo <Player> controller
	getplayerinfo <Player> scroll_time
	addplayerserverinput {id = <server_id>
		Player = <Player>
		controller = <controller>
		difficulty = <difficulty>
		guitar_stream = <guitar_stream>
		time_offset = 0
		song_name = ($freestyle_song)
	}
	addplayerserverhighway id = <server_id> Player = <Player> show_lower = <show_lower> fill_input_offset = 0
	show_fretbars = true
	freestyle_find_player_param param = gh_player value = <Player>
	if (<index> >= 0)
		if ($freestyle_player_data [<index>].beat_lines = FALSE)
			printf 'Player index %a turned off fretbars from options. No fretbar iterator created.' a = <index>
			show_fretbars = FALSE
		endif
	endif
	if (<show_fretbars> = true)
		addplayerserverfretbariterator {
			fretbar_id = createfretbar
			id = <server_id>
			song_name = <song_name>
			difficulty = <difficulty>
			time_offset = (((<scroll_time> - $destroy_time) * 1000.0))
			fretbar_function = Create2DFretbar
			skipleadin = (<scroll_time> * 1000.0)
			Player = <Player>
		}
	endif
endscript

script freestyle_spawn_gems_on_highway \{highway_player = 1
		accent = FALSE
		play_spawn_anim = 0
		gem_type = played
		length = 0.0
		is_drum = FALSE}
	RequireParams \{[
			event_mask
			marker
		]
		all}
	gem = 0
	begin
	gem_mask = ($freestyle_highway_gem_masks [<gem>])
	if (<gem_mask> && <event_mask>)
		if NOT (<gem_type> = None)
			GetSongTimeMs
			createindependent2dgem {
				Player = <highway_player>
				Color = ($freestyle_highway_gem_names [<gem>])
				marker = <marker>
				time = <time>
				length = <length>
				accent = <accent>
				gem_type = <gem_type>
			}
		endif
		if (<play_spawn_anim> = 1)
			element_id = ($fcn_guitar_hit [(<highway_player> -1)] [<gem>])
			if (ScreenElementExists id = <element_id>)
				restart_animation id = <element_id>
			else
				SpawnScriptLater freestyle_guitar_hit_animation params = {note = <gem> Player = <highway_player> is_drum = <is_drum>}
			endif
		endif
	endif
	<gem> = (<gem> + 1)
	repeat $freestyle_gem_color_count
endscript

script freestyle_reset_whammy \{event_mask = 0}
	gem = 0
	begin
	gem_mask = ($freestyle_highway_gem_masks [<gem>])
	if (<gem_mask> && <event_mask>)
		resetwhammy Player = <Player> Color = ($freestyle_highway_gem_names [<gem>])
	endif
	<gem> = (<gem> + 1)
	repeat $freestyle_gem_color_count
endscript

script freestyle_update_notes 
	button = 0
	if (<pattern_held> = -1)
		begin
		name_up = ($fcn_nowbar_up [(<Player> -1)] [<button>])
		name_down = ($fcn_nowbar_down [(<Player> -1)] [<button>])
		SetScreenElementProps id = <name_up> unhide
		SetScreenElementProps id = <name_down> Hide
		<button> = (<button> + 1)
		repeat 5
	else
		begin
		button_mask = ($freestyle_highway_gem_masks [<button>])
		name_up = ($fcn_nowbar_up [(<Player> -1)] [<button>])
		name_down = ($fcn_nowbar_down [(<Player> -1)] [<button>])
		if (<button_mask> && <pattern_held>)
			SetScreenElementProps id = <name_up> Hide
			SetScreenElementProps id = <name_down> unhide
		else
			SetScreenElementProps id = <name_up> unhide
			SetScreenElementProps id = <name_down> Hide
		endif
		<button> = (<button> + 1)
		repeat 5
	endif
endscript

script freestyle_update_single_note \{state = Released}
	RequireParams \{[
			button_index
			highway_player
		]
		all}
	name_up = ($fcn_nowbar_up [(<highway_player> -1)] [<button_index>])
	name_down = ($fcn_nowbar_down [(<highway_player> -1)] [<button_index>])
	if NOT (<state> = Released)
		SetScreenElementProps id = <name_up> Hide
		SetScreenElementProps id = <name_down> unhide
	else
		SetScreenElementProps id = <name_up> unhide
		SetScreenElementProps id = <name_down> Hide
	endif
endscript

script freestyle_guitar_hit_animation \{note = -1}
	parent_id = ($fcn_nowbar_flash [(<Player> -1)] [<note>])
	element_id = ($fcn_guitar_hit [(<Player> -1)] [<note>])
	if (<note> = 5)
		if (<is_drum> = true)
			material = freestylegemcreationdrumpurple
			num_uv_frames = (1.0, 4.0)
			Scale = ($highway_guitarfreestyle.purple_note_scale * 2)
		else
			material = freestylegemcreationpurple
			num_uv_frames = (2.0, 8.0)
			Scale = ($highway_guitarfreestyle.purple_note_scale)
		endif
		CreateScreenElement {
			Type = SpriteElement
			id = <element_id>
			parent = <parent_id>
			material = <material>
			blend = add
			use_animated_uvs = true
			top_down_v
			frame_length = 0.01
			num_uv_frames = <num_uv_frames>
			rgba = [255 255 255 255]
			z_priority = 3.4
			loop_animated_uvs = FALSE
			Scale = <Scale>
			just = [center bottom]
		}
	else
		if (<is_drum> = true)
			element_texture = ($fcn_gem_drum_creation [<note>])
			num_uv_frames = (2.0, 2.0)
			Scale = 1.2
		else
			element_texture = ($fcn_gem_creation [<note>])
			num_uv_frames = (4.0, 4.0)
			Scale = 0.6
		endif
		CreateScreenElement {
			Type = SpriteElement
			id = <element_id>
			parent = <parent_id>
			material = <element_texture>
			blend = add
			use_animated_uvs = true
			top_down_v
			frame_length = 0.01
			num_uv_frames = <num_uv_frames>
			rgba = [255 255 255 255]
			z_priority = 4.0
			loop_animated_uvs = FALSE
			Scale = <Scale>
			just = [center bottom]
		}
	endif
	wait_for_animation id = <element_id>
	if (ScreenElementExists id = <element_id>)
		DestroyScreenElement id = <element_id>
	endif
endscript

script freestyle_update_handedness \{Player = 1}
	index = (<Player> - 1)
	if (($freestyle_player_data [<index>].lefty) = true)
		Flip = -1
	else
		Flip = 1
	endif
	bool_to_int int_name = lefty_int bool_value = ($freestyle_player_data [<index>].lefty)
	setplayerinfo <Player> lefty_flip = <lefty_int>
	setplayerinfo <Player> lefthanded_gems = <lefty_int>
	setplayerinfo <Player> lefthanded_button_ups = <lefty_int>
	setplayerinfo <Player> lefthanded_gems_flip_save = <lefty_int>
	setplayerinfo <Player> lefthanded_button_ups_flip_save = <lefty_int>
	pos_table = $highway_guitarfreestyle
	now_scale = (((<pos_table>.nowbar_scale_x) * (1.0, 0.0)) + ((<pos_table>.nowbar_scale_y) * (0.0, 1.0)))
	if NOT (($freestyle_player_data [<index>].instrument) = drums)
		offset_list = [0 , 1 , 2 , 3 , 4 , 5]
	else
		offset_list = [1 , 2 , 3 , 4 , 0 , 5]
		<Flip> = 1
	endif
	GetArraySize \{$gem_colors}
	array_count = 0
	begin
	<button_index> = (<offset_list> [<array_count>])
	Color = ($gem_colors [<button_index>])
	highway_top = (<pos_table>.highway_playline - <pos_table>.highway_height)
	highway_bot = (<pos_table>.highway_playline)
	playline_y = (<pos_table>.nowbar_pos_y)
	width_factor = (((<playline_y> - <highway_top>) / (<highway_bot> - <highway_top>)) * <pos_table>.widthOffsetFactor)
	width_playline = (<pos_table>.highway_top_width + (<pos_table>.highway_top_width * <width_factor>))
	offset = (<width_playline> / 5.0)
	centerpos = ((639.0, 0.0) + (<playline_y> * (0.0, 1.0)))
	if (<Color> = white)
		<offset> = 0
	endif
	<Pos> = (<centerpos> + ((<offset> * ((<array_count> -2) * <Flip>)) * (1.0, 0.0)))
	name_base = ($fcn_nowbar_base [(<Player> -1)] [<button_index>])
	name_up = ($fcn_nowbar_up [(<Player> -1)] [<button_index>])
	name_down = ($fcn_nowbar_down [(<Player> -1)] [<button_index>])
	SetScreenElementProps id = <name_base> Pos = <Pos> Scale = <now_scale>
	if NOT (<Color> = white)
		SetScreenElementProps id = <name_up> flip_v = ($freestyle_player_data [<index>].lefty)
		SetScreenElementProps id = <name_down> flip_v = ($freestyle_player_data [<index>].lefty)
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
endscript

script freestyle_starpower_on 
	RequireParams \{[
			Player
		]
		all}
	if ($freestyle_player_data [<Player>].player_type = human)
		activatestarpowerpulse Player = ($freestyle_player_data [<Player>].controller) num = 1 length = 40 Strength = 8 Priority = 100
	endif
endscript

script freestyle_starpower_off 
	RequireParams \{[
			Player
		]
		all}
endscript

script freestyle_cleanup_highway 
	KillSpawnedScript \{Name = freestyle_update_highway_scroll_speed}
	KillSpawnedScript \{Name = freestyle_gem_scroller}
	KillSpawnedScript \{Name = freestyle_guitar_hit_animation}
	KillSpawnedScript \{Name = freestyle_highway_move_spawned}
	KillSpawnedScript \{Name = create_freestyle_solo_effect}
	KillSpawnedScript \{Name = kill_freestyle_solo_effect}
	freestyle_kill_metronome_spawns
endscript

script freestyle_save_nowbar_offsets 
	Player = 0
	begin
	if ($freestyle_player_data [<Player>].has_highway = true)
		highway_player = ($freestyle_player_data [<Player>].highway_player)
		calculatefreestylehighwaynowbaroffsetms Player = <highway_player>
		setstructureparam {
			array_name = freestyle_player_data
			array_index = <Player>
			param = nowbar_offset
			value = <now_bar_offset>
		}
	endif
	<Player> = (<Player> + 1)
	repeat $freestyle_max_players
endscript

script freestyle_create_highways 
	reset_song_time
	Change \{g_hud_2d_struct_used = $career_hud_2d_elements}
	Player = 0
	Change \{fcn_nowbar_base = [
			[
			]
			[
			]
			[
			]
		]}
	Change \{fcn_nowbar_up = [
			[
			]
			[
			]
			[
			]
		]}
	Change \{fcn_nowbar_down = [
			[
			]
			[
			]
			[
			]
		]}
	Change \{fcn_nowbar_flash = [
			[
			]
			[
			]
			[
			]
		]}
	Change \{fcn_guitar_hit = [
			[
			]
			[
			]
			[
			]
		]}
	Change \{fcn_solo_sidebar_left = [
			[
			]
			[
			]
			[
			]
		]}
	Change \{fcn_solo_sidebar_right = [
			[
			]
			[
			]
			[
			]
		]}
	begin
	highway_player = ($freestyle_player_data [<Player>].highway_player)
	has_highway = ($freestyle_player_data [<Player>].has_highway)
	if (<has_highway> = true)
		if NOT ($freestyle_player_data [<Player>].instrument = drums)
			lower_half = true
		else
			lower_half = FALSE
		endif
		freestyle_setup_highway Player = <highway_player> show_lower = <lower_half>
		reset_score Player = <highway_player>
		freestyle_start_gem_scroller song_name = ($freestyle_song) difficulty = easy difficulty2 = easy device_num = 0 Player = <highway_player> show_lower = <lower_half>
		SpawnScriptNow button_checker params = {Player = <highway_player>}
		gem = 0
		array = []
		begin
		formatText checksumName = element_id 'freestyle_guitar_hit_%ap%p' a = <gem> p = <highway_player> AddToStringLookup = true
		AddArrayElement array = <array> element = <element_id>
		gem = (<gem> + 1)
		repeat $freestyle_gem_color_count
		SetArrayElement ArrayName = fcn_guitar_hit index = <Player> NewValue = <array> globalarray
	endif
	<Player> = (<Player> + 1)
	repeat $freestyle_max_players
	gem = 0
	array = []
	begin
	formatText checksumName = element_texture 'FreestyleGemCreation%a' a = ($gem_colors_text [<gem>]) AddToStringLookup = true
	AddArrayElement array = <array> element = <element_texture>
	gem = (<gem> + 1)
	repeat $freestyle_gem_color_count
	Change fcn_gem_creation = <array>
	gem = 0
	array = []
	begin
	formatText checksumName = element_texture 'FreestyleGemCreationDrum%a' a = ($gem_colors_text [<gem>]) AddToStringLookup = true
	AddArrayElement array = <array> element = <element_texture>
	gem = (<gem> + 1)
	repeat $freestyle_gem_color_count
	Change fcn_gem_drum_creation = <array>
	freestyle_save_nowbar_offsets
endscript

script freestyle_update_handedness_all_players 
	Player = 0
	begin
	highway_player = ($freestyle_player_data [<Player>].highway_player)
	has_highway = ($freestyle_player_data [<Player>].has_highway)
	if (<has_highway> = true)
		freestyle_update_handedness Player = <highway_player>
	endif
	<Player> = (<Player> + 1)
	repeat $freestyle_max_players
endscript

script freestyle_highway_move 
	RequireParams \{[
			time
		]
		all}
	if GotParam \{pos_to}
		if GotParam \{pos_from}
			ScriptAssert \{'Do not pass pos_to AND pos_from! Only one or the other.'}
		endif
	elseif GotParam \{pos_from}
	else
		ScriptAssert \{'Must specify either pos_to OR pos_from.'}
	endif
	SpawnScriptNow freestyle_highway_move_spawned params = {<...>}
endscript

script freestyle_highway_move_spawned 
	i = 0
	begin
	if ($freestyle_player_data [<i>].has_highway = true)
		highway_player = ($freestyle_player_data [<i>].highway_player)
		formatText checksumName = freestyle_highway_base 'freestyle_highway_base_p%p' p = <highway_player>
		if GotParam \{pos_to}
			<freestyle_highway_base> :se_setprops Pos = {<pos_to> relative} time = <time>
		else
			reverse_pos = ((0.0, 0.0) - <pos_from>)
			<freestyle_highway_base> :se_setprops Pos = {<pos_from> relative}
			<freestyle_highway_base> :se_setprops Pos = {<reverse_pos> relative} time = <time>
		endif
	endif
	i = (<i> + 1)
	repeat $freestyle_max_players
	if GotParam \{end_func}
		if NOT GotParam \{end_params}
			end_params = {}
		endif
		Wait <time> Seconds
		<end_func> <end_params>
	endif
endscript
fcn_solo_names = [
	{
		left = sidebar_left_sprushp1
		right = sidebar_right_sprushp1
		center1 = sidebar_center_sprushp1
		center2 = sidebar_center2_sprushp1
	}
	{
		left = sidebar_left_sprushp2
		right = sidebar_right_sprushp2
		center1 = sidebar_center_sprushp2
		center2 = sidebar_center2_sprushp2
	}
	{
		left = sidebar_left_sprushp3
		right = sidebar_right_sprushp3
		center1 = sidebar_center_sprushp3
		center2 = sidebar_center2_sprushp3
	}
]

script create_freestyle_solo_effect 
	pos_index = (<Player> - 1)
	pos_table = ($highway_pos_table [<pos_index>])
	height = (<pos_table>.highway_height)
	cont = ($fcn_sidebar_cont_left [(<Player> -1)])
	namel = ($fcn_solo_names [(<Player> -1)].left)
	DestroyScreenElement id = <namel>
	CreateScreenElement {
		Type = SpriteElement
		id = <namel>
		parent = <cont>
		texture = sp_glow_rush01
		rgba = [255 255 255 255]
		Pos = (10.0, 64.0)
		Scale = (1.5, 1.5)
		rot_angle = 0
		just = [center center]
		z_priority = 12.1
	}
	cont = ($fcn_sidebar_cont_right [(<Player> -1)])
	namer = ($fcn_solo_names [(<Player> -1)].right)
	DestroyScreenElement id = <namer>
	CreateScreenElement {
		Type = SpriteElement
		id = <namer>
		parent = <cont>
		material = sp_glow_rush01
		rgba = [255 255 255 255]
		Pos = (-10.0, 64.0)
		rot_angle = 0
		Scale = (-1.5, 1.5)
		just = [center center]
		z_priority = 12.1
	}
	container_id = ($fcn_gem_cont [(<Player> -1)])
	namec = ($fcn_solo_names [(<Player> -1)].center1)
	DestroyScreenElement id = <namec>
	CreateScreenElement {
		Type = SpriteElement
		id = <namec>
		parent = <container_id>
		texture = mat_sidebar_glow_01
		rgba = [255 255 255 128]
		Pos = (640.0, 1300.0)
		rot_angle = 0
		Scale = (8.0, 3.5)
		just = [center bottom]
		z_priority = 1.1
	}
	namec2 = ($fcn_solo_names [(<Player> -1)].center2)
	DestroyScreenElement id = <namec2>
	CreateScreenElement {
		Type = SpriteElement
		id = <namec2>
		parent = <container_id>
		texture = mat_sidebar_glow_01
		rgba = [255 255 255 128]
		Pos = (640.0, 760.0)
		rot_angle = 90
		Scale = (2.0, 3.5)
		just = [center center]
		z_priority = 1.1
	}
	Pos = ((0.0, 1.0) * <height>)
	<namel> :se_setprops Pos = {(0.0, -460.0) relative} Scale = (1.0, 1.0) time = 0.5
	<namer> :se_setprops Pos = {(0.0, -460.0) relative} Scale = (-1.0, 1.0) time = 0.5
	<namec> :se_setprops Pos = {(0.0, -590.0) relative} Scale = (4.0, 2.5) time = 0.5
	<namec2> :se_setprops Pos = {(0.0, -400.0) relative} Scale = (2.0, 1.0) time = 0.5
	Wait \{0.5
		Seconds}
	if ScreenElementExists id = <namel>
		<namel> :se_setprops rgba = [255 255 255 0] time = 0.5
	endif
	if ScreenElementExists id = <namer>
		<namer> :se_setprops rgba = [255 255 255 0] time = 0.5
	endif
	if ScreenElementExists id = <namec>
		<namec> :se_setprops rgba = [255 255 255 64] time = 0.5
	endif
	if ScreenElementExists id = <namec2>
		<namec2> :se_setprops rgba = [255 255 255 0] time = 0.5
	endif
endscript

script kill_freestyle_solo_effect 
	DestroyScreenElement id = ($fcn_solo_names [(<Player> -1)].left)
	DestroyScreenElement id = ($fcn_solo_names [(<Player> -1)].right)
	DestroyScreenElement id = ($fcn_solo_names [(<Player> -1)].center1)
	DestroyScreenElement id = ($fcn_solo_names [(<Player> -1)].center2)
endscript
