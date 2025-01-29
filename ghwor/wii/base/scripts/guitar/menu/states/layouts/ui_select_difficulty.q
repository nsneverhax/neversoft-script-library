
script ui_create_select_difficulty 
	SpawnScriptNow select_difficulty_show_movie params = {<...>}
endscript

script ui_destroy_select_difficulty 
	generic_ui_destroy
	if ScreenElementExists \{id = difficultyinterface}
		SpawnScriptNow \{ui_destroy_select_difficulty_spawned}
	endif
	destroy_viewport_ui
	set_focus_color
	set_unfocus_color
endscript

script ui_destroy_select_difficulty_spawned 
	DestroyScreenElement \{id = difficultyinterface}
endscript

script ui_setlist_diff_focus 
	GetTags
	difficultyinterface :se_setprops highlight_pos = ((20.0, -83.0) + ((0.0, 44.5) * <index>)) time = 0.05
endscript

script ui_select_difficulty_back_setlist 
	generic_event_back
endscript

script ui_create_select_difficulty_spawned 
	if NOT ($game_mode = practice)
		SpawnScriptNow \{audio_ui_fade_menu_music
			params = {
				in
				time = 0.01
			}}
	endif
	if NOT GotParam \{can_change_level}
		can_change_level = 1
	endif
	clean_up_user_control_helpers
	difficulty = ($default_difficulty [$primary_controller])
	focus_index = 0
	if GotParam \{difficulty}
		switch (<difficulty>)
			case easy
			focus_index = 1
			case medium
			focus_index = 2
			case hard
			focus_index = 3
			case expert
			focus_index = 4
		endswitch
	endif
	getplayerinfo \{1
		part}
	if GotParam \{from_setlist}
		if NOT ($game_mode = practice)
			if ScreenElementExists \{id = difficultyinterface}
				ui_destroy_select_difficulty_spawned
			endif
			set_unfocus_color \{Color = dark_red5}
			set_focus_color \{Color = orange}
			CreateScreenElement {
				parent = root_window
				id = difficultyinterface
				Type = descinterface
				desc = 'setlist_b_difficulty_desc'
				Pos = (0.0, 0.0)
				z_priority = 100
				alpha = 0.0
				exclusive_device = ($primary_controller)
			}
			if difficultyinterface :desc_resolvealias \{Name = alias_menu}
				AssignAlias id = <resolved_id> alias = current_menu
				current_menu :se_setprops \{event_handlers = [
						{
							pad_up
							ui_sfx
							params = {
								menustate = Generic
								uitype = scrollup
							}
						}
						{
							pad_down
							ui_sfx
							params = {
								menustate = Generic
								uitype = scrolldown
							}
						}
						{
							pad_back
							ui_select_difficulty_back_setlist
						}
					]}
				diff_array = [beginner easy medium hard expert]
				i = 0
				begin
				SetScreenElementProps {
					id = {current_menu child = <i>}
					event_handlers = [
						{focus retail_menu_focus}
						{focus ui_setlist_diff_focus}
						{unfocus retail_menu_unfocus}
						{pad_choose selected_difficulty params = {diff = (<diff_array> [<i>]) can_change_level = <can_change_level>}}
					]
					tags = {index = <i>}
				}
				i = (<i> + 1)
				repeat 5
			endif
			difficultyinterface :se_setprops \{alpha = 1.0
				time = 0.25}
			menu_finish
			LaunchEvent Type = focus target = current_menu data = {child_index = <focus_index>}
			return
		endif
	endif
	if ($game_mode = gh4_p1_career)
		get_diff_completion_text
		spacing_between = 25
	endif
	item_scale = 1.5
	<complete_pos> = (0.0, 15.0)
	if ($game_mode = practice)
		menu_create_script = make_generic_menu
		add_item_script = add_generic_menu_text_item
	else
		menu_create_script = make_generic_menu
		add_item_script = add_generic_menu_text_item
	endif
	<menu_create_script> {
		title = qs(0x9f281c76)
		item_scale = <item_scale>
	}
	current_menu :se_setprops \{Pos = {
			(60.0, 0.0)
			relative
		}}
	Scale = 1.5
	<add_item_script> {
		text = qs(0x74d6a0a0)
		pad_choose_script = selected_difficulty
		pad_choose_params = {diff = beginner}
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <item_container_id>
		texture = icon_difficulty_beginner
		Pos = (-25.0, 25.0) Scale = 0.6
	}
	<add_item_script> {
		text = qs(0x8d657387)
		pad_choose_script = selected_difficulty
		pad_choose_params = {diff = easy}
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <item_container_id>
		texture = icon_difficulty_easy
		Pos = (-25.0, 25.0) Scale = 0.6
	}
	<add_item_script> {
		text = qs(0x6ef11a01)
		pad_choose_script = selected_difficulty
		pad_choose_params = {diff = medium}
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <item_container_id>
		texture = icon_difficulty_medium
		Pos = (-25.0, 25.0) Scale = 0.6
	}
	<add_item_script> {
		text = qs(0x51b06d2f)
		pad_choose_script = selected_difficulty
		pad_choose_params = {diff = hard}
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <item_container_id>
		texture = icon_difficulty_hard
		Pos = (-25.0, 25.0) Scale = 0.6
	}
	<add_item_script> {
		text = qs(0x334908ac)
		pad_choose_script = selected_difficulty
		pad_choose_params = {diff = expert}
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <item_container_id>
		texture = icon_difficulty_expert
		Pos = (-25.0, 25.0) Scale = 0.6
	}
	if (($game_mode != practice) && ($game_mode != p2_pro_faceoff))
		get_completed_percentage part = <part>
		formatText TextName = completed_songs_text qs(0x4e8e1aee) a = <completed_percentage>
		CreateScreenElement \{Type = ContainerElement
			parent = current_menu
			id = difficulty_menu_container
			dims = (300.0, 60.0)
			just = [
				center
				center
			]
			not_focusable}
		CreateScreenElement {
			Type = TextBlockElement
			parent = difficulty_menu_container
			dims = (300.0, 60.0)
			just = [center center]
			rgba = [90 132 112 255]
			text = <completed_songs_text>
			font = fontgrid_text_a1
			single_line = FALSE
			fit_width = `scale	each	line	if	larger`
			fit_height = `scale	down	if	larger`
			scale_mode = proportional
			internal_just = [center center]
			internal_scale = (0.8, 0.8)
			font_spacing = -1
			Pos = (150.0, 40.0)
		}
	endif
	menu_finish
	LaunchEvent Type = focus target = current_menu data = {child_index = <focus_index>}
endscript

script select_difficulty_show_movie 
	if ($game_mode = gh4_p1_career)
		getfirstplayer
		getplayerinfo <Player> part
		formatText checksumName = bandname_id 'band%i_info' i = ($current_band_profile)
		formatText checksumName = first_time_played_part 'first_instrument_career_%s' s = ($instrument_list.<part>.text_nl)
		GetGlobalTags <bandname_id> param = <first_time_played_part>
		if ((<...>.<first_time_played_part>) = 0)
			switch (<part>)
				case guitar
				card_text = qs(0x3b4ed016)
				case bass
				card_text = qs(0x631c643d)
				case drum
				card_text = qs(0x3cceae0a)
				case vocals
				card_text = qs(0xcad0be81)
			endswitch
			CreateScreenElement \{Type = SpriteElement
				parent = root_window
				id = instrument_movie_bg
				texture = white
				rgba = [
					0
					0
					0
					255
				]
				Pos = (640.0, 360.0)
				dims = (1280.0, 720.0)
				just = [
					center
					center
				]
				z_priority = 100}
			CreateScreenElement {
				Type = TextBlockElement
				parent = instrument_movie_bg
				text = <card_text>
				font = ($test_menu_font)
				Scale = 1.2
				dims = (600.0, 400.0)
				rgba = [200 200 200 255]
				Pos = (640.0, 400.0)
				just = [center center]
				internal_just = [center center]
				z_priority = 101
			}
			audio_ui_fade_menu_music \{out
				time = 2}
			Wait \{1
				Seconds}
			fadetoblack \{On
				alpha = 1.0
				time = 1
				z_priority = 999}
			Wait \{1
				Seconds}
			destroy_menu \{menu_id = instrument_movie_bg}
			formatText checksumName = progression_flag 'Career_%s' s = ($instrument_list.<part>.text_nl)
			Change current_progression_flag = (<progression_flag>)
			get_progression_globals game_mode = ($game_mode) ($current_progression_flag)
			switch (<part>)
				case guitar
				SetGlobalTags <bandname_id> params = {first_instrument_career_guitar = 1}
				case bass
				SetGlobalTags <bandname_id> params = {first_instrument_career_bass = 1}
				case drum
				SetGlobalTags <bandname_id> params = {first_instrument_career_drum = 1}
				case vocals
				SetGlobalTags <bandname_id> params = {first_instrument_career_vocals = 1}
			endswitch
			fadetoblack \{OFF
				time = 0.5
				no_wait}
		endif
	endif
	SpawnScriptNow ui_create_select_difficulty_spawned params = {<...>}
endscript

script get_completed_percentage 
	RequireParams \{[
			part
		]
		all}
	progression_flag = career_guitar
	switch (<part>)
		case bass
		progression_flag = career_bass
		case drum
		progression_flag = career_drum
		case vocals
		progression_flag = career_vocals
		case Band
		progression_flag = career_band
	endswitch
	get_progression_globals (<progression_flag>)
	total_songs = 0.0
	completed_songs = 0.0
	num_tiers = ($<tier_global>.num_tiers)
	tier_num = 1
	begin
	formatText checksumName = tiername 'tier%d' d = <tier_num>
	go_through_songs = 1
	if StructureContains structure = ($<tier_global>.<tiername>) createagig
		go_through_songs = 0
	endif
	if (<go_through_songs> = 1)
		GetArraySize ($<tier_global>.<tiername>.songs)
		song_index = 0
		begin
		song = ($<tier_global>.<tiername>.songs [<song_index>])
		diff_index = 0
		begin
		format_globaltag_song_checksum part = ($<tier_global>.part) song = <song> difficulty_index = <diff_index>
		GetGlobalTags <song_checksum> params = stars
		if (<stars> > 2)
			completed_songs = (<completed_songs> + 1)
			break
		endif
		diff_index = (<diff_index> + 1)
		repeat 5
		total_songs = (<total_songs> + 1)
		song_index = (<song_index> + 1)
		repeat <array_Size>
	endif
	tier_num = (<tier_num> + 1)
	repeat <num_tiers>
	completed_percentage = ((<completed_songs> / <total_songs>) * 100)
	CastToInteger \{completed_percentage}
	printf 'completed_songs = %a, total_songs = %b' a = <completed_songs> b = <total_songs>
	return completed_percentage = <completed_percentage>
endscript
