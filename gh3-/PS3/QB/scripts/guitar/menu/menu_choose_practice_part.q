menu_choose_practice_part_font = fontgrid_title_gh3

script create_choose_practice_part_menu 
	Printf \{"create_choose_practice_part_menu"}
	SpawnScriptNow \{Menu_Music_On}
	kill_start_key_binding
	set_focus_color rgba = ($default_menu_focus_color)
	set_unfocus_color rgba = ($default_menu_unfocus_color)
	Menu_pos = (845.0, 258.0)
	CreateScreenElement \{Type = ContainerElement
		Id = cpp_container
		PARENT = root_window
		just = [
			LEFT
			Top
		]
		Pos = (0.0, 0.0)}
	new_menu scrollid = cpp_scroll vmenuid = cpp_vmenu Menu_pos = <Menu_pos> Spacing = -45
	create_menu_backdrop \{texture = Venue_BG}
	CreateScreenElement \{Type = SpriteElement
		PARENT = cpp_container
		texture = Venue_Overlay
		Pos = (640.0, 360.0)
		Dims = (1280.0, 720.0)
		just = [
			Center
			Center
		]
		z_priority = 99}
	displaySprite \{PARENT = cpp_container
		tex = Practice_Poster_3
		Pos = (186.0, 15.0)
		Dims = (672.0, 672.0)
		Rot_Angle = -2
		Z = 1}
	displaySprite \{PARENT = cpp_container
		tex = Toprockers_Tape_2
		Pos = (500.0, 650.0)
		Z = 3
		Rot_Angle = -12
		flip_v}
	displaySprite \{PARENT = cpp_container
		tex = Toprockers_Tape_1
		Pos = (565.0, -95.0)
		Z = 3
		Rot_Angle = 80}
	displaySprite \{PARENT = cpp_container
		tex = Toprockers_Tape_2
		Pos = (500.0, -85.0)
		Z = 3
		Rot_Angle = 80}
	displaySprite \{PARENT = cpp_container
		tex = Toprockers_Tape_2
		Pos = (435.0, -75.0)
		Z = 3
		Rot_Angle = 78}
	CreateScreenElement {
		Type = TextBlockElement
		PARENT = cpp_container
		Id = header
		Text = "PRACTICE PART"
		Pos = (360.0, 70.0)
		Dims = (100.0, 300.0)
		Scale = 1.5
		just = [LEFT Top]
		internal_just = [LEFT Top]
		line_spacing = 0.62
		rgba = [35 100 130 255]
		font = ($menu_choose_practice_part_font)
		Z = 2
		Rot_Angle = -2
	}
	GetScreenElementChildren Id = <Id>
	GetArraySize (<children>)
	I = 0
	begin
	GetScreenElementDims Id = (<children> [<I>])
	width_to_check_for = 225
	if (<I> = 1)
		<width_to_check_for> = 120
	endif
	if (<width> > <width_to_check_for>)
		fit_text_in_rectangle Id = (<children> [<I>]) Dims = (<width_to_check_for> * (1.0, 0.0) + <Height> * (0.0, 1.0))
	endif
	<I> = (<I> + 1)
	repeat <array_Size>
	displaySprite \{PARENT = cpp_container
		tex = Dialog_BG
		Pos = (680.0, 256.0)
		Dims = (332.0, 70.0)
		Z = 2}
	displaySprite \{PARENT = cpp_container
		tex = Dialog_BG
		flip_h
		Pos = (680.0, 326.0)
		Dims = (332.0, 70.0)
		Z = 2}
	displaySprite \{Id = cpp_hi_left
		PARENT = cpp_container
		tex = Dialog_Highlight
		flip_v
		Pos = (720.0, 325.0)
		Z = 5
		just = [
			RIGHT
			Center
		]}
	displaySprite \{Id = cpp_hi_right
		PARENT = cpp_container
		tex = Dialog_Highlight
		Pos = (910.0, 325.0)
		Z = 5
		just = [
			LEFT
			Center
		]}
	guitar_or_lead_text = "GUITAR"
	bass_or_rhythm_text = "BASS"
	get_song_rhythm_track Song = ($current_song)
	if (<rhythm_track> = 1)
		<guitar_or_lead_text> = "LEAD"
		<bass_or_rhythm_text> = "RHYTHM"
	endif
	set_focus_color \{rgba = [
			130
			0
			0
			250
		]}
	set_unfocus_color \{rgba = [
			0
			0
			0
			255
		]}
	CreateScreenElement \{Type = ContainerElement
		Id = cpp_guitar
		PARENT = cpp_vmenu
		event_handlers = [
			{
				Focus
				retail_menu_focus
				Params = {
					Id = guitar_text
				}
			}
			{
				Focus
				menu_choose_practice_part_highlighter
				Params = {
					text_id = guitar_text
					GUITAR
				}
			}
			{
				unfocus
				retail_menu_unfocus
				Params = {
					Id = guitar_text
				}
			}
			{
				pad_choose
				practicemenu_select_part
				Params = {
					part = GUITAR
				}
			}
			{
				pad_back
				practicemenu_go_back
			}
		]
		Dims = (100.0, 100.0)}
	CreateScreenElement {
		Type = TextElement
		font = ($menu_choose_practice_part_font)
		PARENT = cpp_guitar
		Id = guitar_text
		Text = <guitar_or_lead_text>
		Scale = (1.0, 0.0, 1.0)
		rgba = ($menu_unfocus_color)
		font_spacing = 0
		z_priority = 5
		just = [Center Center]
	}
	GetScreenElementDims Id = <Id>
	if (<width> > 250)
		fit_text_in_rectangle Id = <Id> Dims = ((250.0, 0.0) + <Height> * (0.0, 1.0))
	endif
	CreateScreenElement \{Type = ContainerElement
		Id = cpp_bass
		PARENT = cpp_vmenu
		event_handlers = [
			{
				Focus
				retail_menu_focus
				Params = {
					Id = bass_text
				}
			}
			{
				Focus
				menu_choose_practice_part_highlighter
				Params = {
					text_id = bass_text
					BASS
				}
			}
			{
				unfocus
				retail_menu_unfocus
				Params = {
					Id = bass_text
				}
			}
			{
				pad_choose
				practicemenu_select_part
				Params = {
					part = RHYTHM
				}
			}
			{
				pad_back
				practicemenu_go_back
			}
		]
		Dims = (100.0, 100.0)}
	CreateScreenElement {
		Type = TextElement
		font = ($menu_choose_practice_part_font)
		PARENT = cpp_bass
		Id = bass_text
		Text = <bass_or_rhythm_text>
		Scale = (1.0, 0.0, 1.0)
		rgba = ($menu_unfocus_color)
		font_spacing = 0
		z_priority = 5
		just = [Center Center]
	}
	GetScreenElementDims Id = <Id>
	if (<width> > 250)
		fit_text_in_rectangle Id = <Id> Dims = ((250.0, 0.0) + <Height> * (0.0, 1.0))
	endif
	Change \{user_control_pill_text_color = [
			0
			0
			0
			255
		]}
	Change \{user_control_pill_color = [
			180
			180
			180
			255
		]}
	add_user_control_helper \{Text = "SELECT"
		button = Green
		Z = 100}
	add_user_control_helper \{Text = "BACK"
		button = RED
		Z = 100}
	add_user_control_helper \{Text = "UP/DOWN"
		button = Strumbar
		Z = 100}
endscript

script menu_choose_practice_part_highlighter 
	GetScreenElementDims Id = <text_id>
	y_off = (0.0, 0.0)
	if GotParam \{BASS}
		<y_off> = (0.0, 60.0)
	endif
	new_pos_l = ((840.0, 295.0) + <y_off> - <width> * (0.5, 0.0))
	new_pos_r = ((850.0, 295.0) + <y_off> + <width> * (0.5, 0.0))
	if GotParam \{GUITAR}
		SetScreenElementProps Id = cpp_hi_left Pos = <new_pos_l> preserve_flip
		SetScreenElementProps Id = cpp_hi_right Pos = <new_pos_r>
	elseif GotParam \{BASS}
		SetScreenElementProps Id = cpp_hi_left Pos = <new_pos_l> preserve_flip
		SetScreenElementProps Id = cpp_hi_right Pos = <new_pos_r>
	endif
endscript

script destroy_choose_practice_part_menu 
	destroy_pause_menu_frame
	restore_start_key_binding
	destroy_menu_backdrop
	destroy_menu \{menu_id = cpp_scroll}
	destroy_menu \{menu_id = cpp_container}
	clean_up_user_control_helpers
	set_focus_color rgba = ($default_menu_focus_color)
	set_unfocus_color rgba = ($default_menu_unfocus_color)
endscript

script practicemenu_select_part 
	Change StructureName = player1_status part = <part>
	ui_flow_manager_respond_to_action \{action = Continue}
endscript

script practicemenu_go_back 
	ui_flow_manager_respond_to_action \{action = go_back}
endscript
