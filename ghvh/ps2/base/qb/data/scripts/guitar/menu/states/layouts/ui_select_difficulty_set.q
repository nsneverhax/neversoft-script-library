
script 0x562339b2 
	SpawnScriptNow 0x874140e4 params = {<...>}
	0xd518ab19 \{video = menu}
endscript

script 0xaac07955 
	Change menu_flow_locked = ($menu_flow_locked + 1)
	generic_ui_destroy
	cleanup_frontend_bg
	if ScreenElementExists \{id = difficultyinterface}
		SpawnScriptNow \{0x574bcd95}
	endif
	destroy_viewport_ui
	set_focus_color
	set_unfocus_color
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script 0x574bcd95 
	Change menu_flow_locked = ($menu_flow_locked + 1)
	DestroyScreenElement \{id = difficultyinterface}
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script 0x6897f9b2 
	generic_event_back
endscript

script 0x874140e4 \{show_drum_options = 0
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
	get_player_num_from_controller controller_index = ($primary_controller)
	if (<player_num> >= 1)
		getplayerinfo <player_num> part
	else
		getplayerinfo \{1
			part}
	endif
	if (<part> = drum)
		<show_drum_options> = 1
		if (($current_song) != jamsession && ($current_song) != NULL)
			if ($permanent_songlist_props.($current_song).double_kick = 1)
				<includes_double_kick> = 1
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
	if NOT ($game_mode = training)
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
		if NOT ($game_mode = training)
			set_unfocus_color \{rgba = [
					0
					0
					0
					255
				]}
			set_focus_color \{rgba = [
					146
					7
					10
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
							0x6897f9b2
						}
					]}
				diff_array = [easy_rhythm easy medium hard expert]
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
			difficultyinterface :Obj_SpawnScriptNow \{ui_setlist_scribbles}
			menu_finish
			Change menu_flow_locked = ($menu_flow_locked - 1)
			LaunchEvent Type = focus target = current_menu data = {child_index = <focus_index>}
			return
		endif
	endif
	if ($game_mode = p1_career)
		get_diff_completion_text
		spacing_between = 25
	endif
	<complete_pos> = (0.0, 15.0)
	if (showbackstage_halfscreen)
		menu_create_script = make_generic_menu
		add_item_script = add_generic_menu_text_item
	else
		menu_create_script = make_menu_frontend
		add_item_script = add_menu_frontend_item
		create_frontend_bg
	endif
	<menu_create_script> {
		title = qs(0x9f281c76)
		spacing_between = -15
	}
	if ($practice_enabled)
		current_menu :se_setprops \{event_handlers = [
				{
					pad_back
					menu_start_transition
				}
			]}
	endif
	set_unfocus_color \{rgba = [
			0
			0
			0
			255
		]}
	set_focus_color \{rgba = [
			146
			7
			10
			255
		]}
	Scale = 1.5
	<add_item_script> {
		desc = 'career_difficulty_tape_01'
		text = qs(0x74d6a0a0)
		icon
		pad_choose_script = selected_difficulty
		pad_choose_params = {diff = easy_rhythm double_kick = 0}
	}
	<add_item_script> {
		desc = 'career_difficulty_tape_02'
		text = qs(0x8d657387)
		icon
		pad_choose_script = selected_difficulty
		pad_choose_params = {diff = easy double_kick = 0}
	}
	<add_item_script> {
		desc = 'career_difficulty_tape_03'
		text = qs(0x6ef11a01)
		icon
		pad_choose_script = selected_difficulty
		pad_choose_params = {diff = medium double_kick = 0}
	}
	<add_item_script> {
		desc = 'career_difficulty_tape_04'
		text = qs(0x51b06d2f)
		icon
		pad_choose_script = selected_difficulty
		pad_choose_params = {diff = hard double_kick = 0}
	}
	<add_item_script> {
		desc = 'career_difficulty_tape_05'
		text = qs(0x334908ac)
		icon
		pad_choose_script = selected_difficulty
		pad_choose_params = {diff = expert double_kick = 0}
	}
	if (<show_drum_options> = 1 && <includes_double_kick> = 1)
		<add_item_script> {
			desc = 'career_difficulty_tape_06'
			text = qs(0x7a19b5f7)
			icon
			pad_choose_script = selected_difficulty
			pad_choose_params = {diff = expert double_kick = 1}
		}
	endif
	if (($game_mode != training) && ($game_mode != p2_faceoff) && ($game_mode != p2_pro_faceoff) && ($game_mode != p2_battle))
		add_menu_frontend_spacer \{item_height = 25}
		get_completed_percentage part = <part>
		formatText TextName = completed_songs_text qs(0x4e8e1aee) a = <completed_percentage>
		<add_item_script> {
			text = <completed_songs_text>
			rgba = [235 235 235 255]
			font = fontgrid_text_a6
			internal_scale = 0.8
			not_focusable
		}
		<item_container_id> :se_setprops Shadow shadow_rgba = [146 7 10 255] shadow_offs = (2.0, 2.0)
	endif
	menu_finish
	Change menu_flow_locked = ($menu_flow_locked - 1)
	if NOT (showbackstage_halfscreen)
		focus_index = (<focus_index> + 1)
	endif
	LaunchEvent Type = focus target = current_menu data = {child_index = (<focus_index>)}
	destroy_loading_screen
endscript

script 0xa1067495 
	if NOT GotParam \{from_setlist}
		if (showbackstage_halfscreen)
			menu_transition_out \{menu = generic_menu
				anim_type = zoom_blur}
		else
			menu_transition_out \{menu = current_menu_anchor}
		endif
	endif
endscript
