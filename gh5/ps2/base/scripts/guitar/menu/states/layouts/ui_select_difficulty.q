0xd09c05b6 = [
	{
		text = qs(0x74d6a0a0)
		icon = icon_difficulty_beginner
		0xb2c42979 = beginner
		double_kick = 0
	}
	{
		text = qs(0x8d657387)
		icon = icon_difficulty_easy
		0xb2c42979 = easy
		double_kick = 0
	}
	{
		text = qs(0x6ef11a01)
		icon = icon_difficulty_medium
		0xb2c42979 = medium
		double_kick = 0
	}
	{
		text = qs(0x51b06d2f)
		icon = icon_difficulty_hard
		0xb2c42979 = hard
		double_kick = 0
	}
	{
		text = qs(0x334908ac)
		icon = icon_difficulty_expert
		0xb2c42979 = expert
		double_kick = 0
	}
	{
		text = qs(0x7a19b5f7)
		icon = icon_difficulty_expert_plus
		0xb2c42979 = expert
		double_kick = 1
	}
]

script ui_create_select_difficulty 
	SpawnScriptNow ui_create_select_difficulty_spawned params = {<...>}
	0xd518ab19 \{video = menu}
endscript

script ui_destroy_select_difficulty 
	Change menu_flow_locked = ($menu_flow_locked + 1)
	generic_ui_destroy
	KillSpawnedScript \{Name = career_menu_jaw_anim}
	if ScreenElementExists \{id = difficultyinterface}
		SpawnScriptNow \{ui_destroy_select_difficulty_spawned}
	endif
	destroy_viewport_ui
	set_focus_color
	set_unfocus_color
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script ui_destroy_select_difficulty_spawned 
	Change menu_flow_locked = ($menu_flow_locked + 1)
	DestroyScreenElement \{id = difficultyinterface}
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script ui_setlist_scribbles 
	Wait \{1
		gameframes}
	props = [highlight_scribble_01_alpha highlight_scribble_02_alpha highlight_scribble_03_alpha]
	GetArraySize <props>
	<curhighlight> = 0
	begin
	<curhighlight> = (<curhighlight> + 1)
	if NOT (<curhighlight> < <array_Size>)
		<curhighlight> = 0
	endif
	<i> = 0
	begin
	if (<curhighlight> = <i>)
		AddParam Name = (<props> [<i>]) structure_name = alpha value = 1.0
	else
		AddParam Name = (<props> [<i>]) structure_name = alpha value = 0.0
	endif
	se_setprops <alpha>
	<i> = (<i> + 1)
	repeat <array_Size>
	Wait \{0.1
		Seconds}
	repeat
endscript

script ui_setlist_diff_focus 
	GetTags
	Wait \{1
		gameframes}
	GetScreenElementPosition id = {current_menu child = <index>} summed
	difficultyinterface :se_setprops highlight_pos = {absolute <screenelementpos>}
endscript

script ui_select_difficulty_back_setlist 
	generic_event_back
endscript
default_difficulty = [
	easy
	easy
	easy
	easy
	easy
	easy
	easy
	easy
]

script ui_create_select_difficulty_spawned \{show_drum_options = 0
		includes_double_kick = 0}
	Change menu_flow_locked = ($menu_flow_locked + 1)
	Change \{rich_presence_context = presence_menus}
	if NOT GotParam \{can_change_level}
		can_change_level = 1
	endif
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
	get_player_num_from_controller \{controller_index = $primary_controller}
	if (<player_num> < 0)
		player_num = 1
	endif
	getplayerinfo <player_num> part
	if (<part> = drum)
		<show_drum_options> = 1
		if (($current_song) != jamsession && ($current_song) != NULL)
			if StructureContains structure = ($permanent_songlist_props.($current_song)) double_kick
				if ($permanent_songlist_props.($current_song).double_kick = 1)
					<includes_double_kick> = 1
				endif
			endif
		endif
		gamemode_gettype
		if (<Type> = career)
			<includes_double_kick> = 1
		endif
	endif
	if (<show_drum_options> = 1)
		getplayerinfo <player_num> double_kick_drum
		if (<focus_index> = 4 && <double_kick_drum> = 1)
			<focus_index> = 5
		endif
	endif
	destroy_menu \{menu_id = difficultyinterface}
	if NOT ($game_mode = practice)
		SpawnScriptNow \{menu_music_fade
			params = {
				in
				time = 0.01
			}}
	endif
	clean_up_user_control_helpers
	getplayerinfo \{1
		part}
	if GotParam \{from_setlist}
		if NOT ($game_mode = practice)
			set_unfocus_color \{rgba = [
					255
					255
					255
					255
				]}
			set_focus_color \{rgba = [
					0
					0
					0
					255
				]}
			if (<show_drum_options> = 1 && <includes_double_kick> = 1)
				<popup_desc> = 'setlist_b_difficulty_desc_plus'
			else
				<popup_desc> = 'setlist_b_difficulty_desc'
			endif
			CreateScreenElement {
				parent = root_window
				id = difficultyinterface
				Type = descinterface
				desc = <popup_desc>
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
							generic_menu_up_or_down_sound
							params = {
								up
							}
						}
						{
							pad_down
							generic_menu_up_or_down_sound
							params = {
								down
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
						{pad_choose selected_difficulty params = {diff = (<diff_array> [<i>]) can_change_level = <can_change_level> double_kick = 0}}
					]
					tags = {index = <i>}
				}
				i = (<i> + 1)
				repeat 5
				if (<show_drum_options> = 1 && <includes_double_kick> = 1)
					SetScreenElementProps {
						id = {current_menu child = 5}
						event_handlers = [
							{focus retail_menu_focus}
							{focus ui_setlist_diff_focus}
							{unfocus retail_menu_unfocus}
							{pad_choose selected_difficulty params = {diff = (<diff_array> [4]) can_change_level = <can_change_level> double_kick = 1}}
						]
						tags = {index = 5}
					}
				endif
			endif
			difficultyinterface :se_setprops \{alpha = 1.0
				time = 0.25}
			difficultyinterface :obj_spawnscript \{highlight_motion
				params = {
					menu_id = difficultyinterface
				}}
			menu_finish
			Change menu_flow_locked = ($menu_flow_locked - 1)
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
	menu_create_script = make_menu_frontend
	add_item_script = add_menu_frontend_item
	<menu_create_script> {
		title = qs(0x9f281c76)
		item_scale = <item_scale>
		Pos = (15.0, 40.0)
	}
	if ($practice_enabled)
		current_menu :se_setprops \{event_handlers = [
				{
					pad_back
					menu_start_transition
				}
			]}
	endif
	if <desc_id> :desc_resolvealias Name = 0xa954edbf param = 0xa1309942
		<0xa1309942> :se_setprops Pos = (975.0, 335.0)
		<0xa1309942> :se_setprops dims = (685.04926, 675.0)
		<0xa1309942> :se_setprops alpha = 0.48000002
		<0xa1309942> :se_setprops rot_angle = -9.110001
		<0xa1309942> :se_setprops flip_v = true
		<0xa1309942> :se_setprops texture = genie_cat
	else

	endif
	if <desc_id> :desc_resolvealias Name = 0xd389b1ff param = 0xb9ea5094
		<0xb9ea5094> :se_setprops Pos = (975.0, 335.0)
		<0xb9ea5094> :se_setprops dims = (685.04926, 675.0)
		<0xb9ea5094> :se_setprops alpha = 0.6
		<0xb9ea5094> :se_setprops rot_angle = -9.110001
		<0xb9ea5094> :se_setprops texture = genie_cat
		<0xb9ea5094> :se_setprops flip_v = true
		<0xb9ea5094> :obj_spawnscript 0xd5b5a21b
	else

	endif
	0x4946edb7 = [0.0 0.0]
	i = 0
	GetArraySize ($0xd09c05b6)
	num_difficulty = <array_Size>
	max_width = 0
	array = []
	begin
	diff = (($0xd09c05b6) [<i>])
	if ((<diff>.double_kick) != 1 || (<show_drum_options> = 1 && <includes_double_kick> = 1))
		<add_item_script> {
			text = (<diff>.text)
			pad_choose_script = selected_difficulty
			pad_choose_params = {diff = (<diff>.0xb2c42979) double_kick = (<diff>.double_kick)}
			pos_anchor = <0x4946edb7>
		}
		GetScreenElementDims id = <item_container_id>
		if (<width> > <max_width>)
			max_width = <width>
		endif
		<item_container_id> :SetTags {diff_index = <i>}
		AddArrayElement array = <array> element = <item_container_id>
	endif
	i = (<i> + 1)
	repeat <num_difficulty>
	0xc2925056 = 25.0
	0x256005b2 = ((-1.0, 0.0) * ((<max_width> * 0.5) + <0xc2925056>))
	i = 0
	GetArraySize <array>
	num_difficulty = <array_Size>
	begin
	item_container_id = (<array> [<i>])
	<item_container_id> :GetSingleTag diff_index
	diff = (($0xd09c05b6) [<diff_index>])
	CreateScreenElement {
		Type = SpriteElement
		parent = <item_container_id>
		texture = (<diff>.icon)
		Pos = <0x256005b2>
		Scale = 0.5
		just = [right center]
	}
	i = (<i> + 1)
	repeat <num_difficulty>
	if (($game_mode != practice) && ($game_mode != p2_pro_faceoff) && ($0xc7e670d7 = 0))
		get_completed_percentage part = <part>
		formatText TextName = completed_songs_text qs(0x57ad7095) a = <completed_percentage>
		<add_item_script> {
			text = <completed_songs_text>
			rgba = [235 187 50 255]
			font = fontgrid_text_a8
			Scale = (0.5, 0.5)
			not_focusable
		}
	endif
	<desc_id> :Obj_SpawnScriptNow career_menu_jaw_anim
	menu_finish
	Change menu_flow_locked = ($menu_flow_locked - 1)
	LaunchEvent Type = focus target = current_menu data = {child_index = (<focus_index> + 1)}
	destroy_loading_screen
endscript

script select_difficulty_show_movie 
	if ($game_mode = gh4_p1_career)
		getplayerinfo \{1
			part}
		get_current_band_info
		bandname_id = <band_info>
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
			menu_music_fade \{out
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
			if StructureContains structure = ($<tier_global>) initial_movie
				menu_music_off
				KillMovie \{textureSlot = 0}
				i = 1
				get_movie_id_by_name movie = ($<tier_global>.initial_movie)
				begin
				getplayerinfo <i> controller
				get_savegame_from_controller controller = <controller>
				SetGlobalTags <id> params = {unlocked = 1} savegame = <savegame>
				i = (<i> + 1)
				repeat ($current_num_players)
				PlayMovieAndWait movie = ($<tier_global>.initial_movie) noblack
				SpawnScriptNow \{menu_music_on}
			endif
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
	if NOT is_song_downloaded \{song_checksum = thatwasjustyourlife}
		num_tiers = (<num_tiers> - 1)
	endif
	tier_num = 1
	begin
	formatText checksumName = tiername 'tier%d' d = <tier_num>
	go_through_songs = 1
	if StructureContains structure = ($<tier_global>.<tiername>) debug_gig
		go_through_songs = 0
	endif
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
		if StructureContains structure = ($<tier_global>.<tiername>) 0x29c8d5a6
			GetArraySize ($<tier_global>.<tiername>.0x29c8d5a6)
			song_index = 0
			begin
			song = ($<tier_global>.<tiername>.0x29c8d5a6 [<song_index>])
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
	endif
	tier_num = (<tier_num> + 1)
	repeat <num_tiers>
	completed_percentage = ((<completed_songs> / <total_songs>) * 100)
	if ((<completed_percentage> > 0.0) && (<completed_percentage> < 1.0))
		completed_percentage = 1.0
	endif
	CastToInteger \{completed_percentage}

	return completed_percentage = <completed_percentage>
endscript

script ui_select_difficulty_anim_in 
	if NOT GotParam \{from_setlist}
		menu_transition_in \{menu = current_menu_anchor}
	endif
endscript

script ui_select_difficulty_anim_out 
	if NOT GotParam \{from_setlist}
		menu_transition_out \{menu = current_menu_anchor}
	endif
endscript
