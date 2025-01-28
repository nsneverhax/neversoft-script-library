
script create_song_ended_menu \{Player = 1}
	if IsMoviePlaying \{TextureSlot = 1}
		PauseMovie \{TextureSlot = 1}
	endif
	disable_pause
	menu_font = fontgrid_title_gh3
	Menu_pos = (640.0, 415.0)
	completion = 0
	get_song_end_time Song = ($current_song)
	GetSongTimeMS
	if (<Time> < 0)
		Time = 0
	elseif (<Time> > <total_end_time>)
		Time = <total_end_time>
	endif
	if (<total_end_time> > 0)
		completion = (100 * <Time> / <total_end_time>)
	endif
	CastToInteger \{completion}
	get_difficulty_text_upper DIFFICULTY = ($current_difficulty)
	get_song_title Song = ($current_song)
	GetUpperCaseString <Song_Title>
	FormatText TextName = completion_text "%d" D = <completion>
	song_ended_off = (640.0, 217.0)
	song_name_off = (695.0, 460.0)
	Z = 10000.0
	offwhite = [223 223 223 255]
	new_menu scrollid = song_ended_scrolling_menu vmenuid = song_ended_vmenu use_backdrop = 0 Spacing = -55 Menu_pos = <Menu_pos> exclusive_device = ($last_start_pressed_device)
	create_pause_menu_frame Z = (<Z> - 10)
	SetScreenElementProps \{Id = song_ended_vmenu
		internal_just = [
			Center
			Center
		]}
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = song_ended_static_text_container
		internal_just = [
			Center
			Center
		]
		Pos = (0.0, 0.0)
		z_priority = 2}
	displaySprite PARENT = song_ended_static_text_container tex = Dialog_Title_BG flip_v Pos = (416.0, 100.0) Scale = (1.75, 1.75) Z = <Z>
	displaySprite PARENT = song_ended_static_text_container tex = Dialog_Title_BG Pos = (640.0, 100.0) Scale = (1.75, 1.75) Z = <Z>
	CreateScreenElement {
		Type = TextElement
		PARENT = song_ended_static_text_container
		font = <menu_font>
		Text = "SONG ENDED"
		just = [Center Center]
		Pos = {<song_ended_off> Relative}
		rgba = [223 223 223 255]
		Scale = 1.2
		z_priority = (<Z> + 0.1)
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	fit_text_in_rectangle Id = <Id> Dims = (285.0, 200.0) keep_ar = 1 only_if_larger_x = 1 start_x_scale = 1.2 start_y_scale = 1.2
	<song_title_scale> = 1.65
	<song_name_pos> = (640.0, 367.0)
	<completion_text_pos> = (640.0, 422.0)
	fill_song_title_and_completion_details <...> PARENT = song_ended_static_text_container
	Change \{menu_focus_color = [
			180
			50
			50
			255
		]}
	Change \{menu_unfocus_color = [
			0
			0
			0
			255
		]}
	text_scale = (0.9, 1.0)
	displaySprite PARENT = song_ended_static_text_container tex = White Pos = (492.0, 517.0) Scale = (75.0, 6.0) Z = (<Z> + 0.1) rgba = <offwhite>
	displaySprite PARENT = song_ended_static_text_container tex = Dialog_Frame_Joiner Pos = (480.0, 510.0) Rot_Angle = 5 Scale = (1.575, 1.5) Z = (<Z> + 0.2)
	displaySprite PARENT = song_ended_static_text_container tex = Dialog_Frame_Joiner Pos = (750.0, 514.0) flip_v Rot_Angle = -5 Scale = (1.575, 1.5) Z = (<Z> + 0.2)
	displaySprite Id = hi_right PARENT = song_ended_static_text_container tex = Dialog_Highlight Pos = (770.0, 533.0) Scale = (1.0, 1.0) Z = (<Z> + 0.3) just = [LEFT Center]
	displaySprite Id = hi_left PARENT = song_ended_static_text_container tex = Dialog_Highlight flip_v Pos = (500.0, 533.0) Scale = (1.0, 1.0) Z = (<Z> + 0.3) just = [RIGHT Center]
	displaySprite PARENT = song_ended_static_text_container tex = Dialog_BG Pos = (480.0, 450.0) Scale = (1.25, 1.25) Z = <Z>
	displaySprite PARENT = song_ended_static_text_container tex = Dialog_BG flip_h Pos = (480.0, 530.0) Scale = (1.25, 1.25) Z = <Z>
	CreateScreenElement \{Type = ContainerElement
		PARENT = song_ended_vmenu
		Dims = (0.0, 100.0)
		event_handlers = [
			{
				Focus
				menu_se_retry_highlight_focus
				Params = {
					Id = song_ended_retry_text
				}
			}
			{
				unfocus
				retail_menu_unfocus
				Params = {
					Id = song_ended_retry_text
				}
			}
			{
				pad_choose
				song_ended_menu_select_retry_song
			}
		]}
	CreateScreenElement {
		Type = TextElement
		PARENT = <Id>
		Id = song_ended_retry_text
		font = <menu_font>
		Text = "RETRY SONG"
		rgba = ($menu_unfocus_color)
		Scale = <text_scale>
		just = [Center Top]
		z_priority = (<Z> + 0.1)
	}
	GetScreenElementDims Id = <Id>
	fit_text_in_rectangle Id = <Id> only_if_larger_x = 1 Dims = ((220.0, 0.0) + <Height> * (0.0, 1.0))
	CreateScreenElement {
		Type = ContainerElement
		PARENT = song_ended_vmenu
		Dims = (0.0, 100.0)
		event_handlers = [
			{Focus menu_se_newsong_highlight_focus Params = {Id = song_ended_new_song_text}}
			{unfocus retail_menu_unfocus Params = {Id = song_ended_new_song_text}}
			{pad_choose song_ended_menu_select_new_song Params = {Player = <Player>}}
		]
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = <Id>
		Id = song_ended_new_song_text
		font = <menu_font>
		Text = "NEW SONG"
		rgba = ($menu_unfocus_color)
		Scale = <text_scale>
		just = [Center Top]
		z_priority = (<Z> + 0.1)
	}
	GetScreenElementDims Id = <Id>
	fit_text_in_rectangle Id = <Id> only_if_larger_x = 1 Dims = ((220.0, 0.0) + <Height> * (0.0, 1.0))
	CreateScreenElement \{Type = ContainerElement
		PARENT = song_ended_vmenu
		Dims = (0.0, 100.0)
		event_handlers = [
			{
				Focus
				menu_se_quit_highlight_focus
				Params = {
					Id = song_ended_main_menu_text
				}
			}
			{
				unfocus
				retail_menu_unfocus
				Params = {
					Id = song_ended_main_menu_text
				}
			}
			{
				pad_choose
				song_ended_menu_select_quit
			}
		]}
	CreateScreenElement {
		Type = TextElement
		PARENT = <Id>
		Id = song_ended_main_menu_text
		font = <menu_font>
		Text = "MAIN MENU"
		rgba = ($menu_unfocus_color)
		Scale = <text_scale>
		just = [Center Top]
		z_priority = (<Z> + 0.1)
	}
	GetScreenElementDims Id = <Id>
	fit_text_in_rectangle Id = <Id> only_if_larger_x = 1 Dims = ((220.0, 0.0) + <Height> * (0.0, 1.0))
endscript

script destroy_song_ended_menu 
	GH3_SFX_fail_song_stop_sounds
	if IsMoviePlaying \{TextureSlot = 1}
		ResumeMovie \{TextureSlot = 1}
	endif
	enable_pause
	destroy_menu \{menu_id = song_ended_scrolling_menu}
	destroy_pause_menu_frame
	destroy_menu \{menu_id = song_ended_static_text_container}
endscript

script song_ended_menu_select_retry_song 
	ui_flow_manager_respond_to_action \{action = select_retry}
	restart_song
endscript

script song_ended_menu_select_new_song 
	if GotParam \{Player}
		ui_flow_manager_respond_to_action action = select_new_song create_params = {Player = <Player>}
	else
		ui_flow_manager_respond_to_action \{action = select_new_song}
	endif
endscript

script song_ended_menu_select_quit 
	ui_flow_manager_respond_to_action \{action = select_quit}
endscript

script menu_se_retry_highlight_focus 
	retail_menu_focus Id = <Id>
	GetScreenElementDims Id = <Id>
	SetScreenElementProps Id = hi_left Pos = ((635.0, 480.0) - <width> * (0.5, 0.0)) flip_v
	SetScreenElementProps Id = hi_right Pos = ((645.0, 480.0) + <width> * (0.5, 0.0))
endscript

script menu_se_newsong_highlight_focus 
	retail_menu_focus Id = <Id>
	GetScreenElementDims Id = <Id>
	SetScreenElementProps Id = hi_left Pos = ((635.0, 530.0) - <width> * (0.5, 0.0)) flip_v
	SetScreenElementProps Id = hi_right Pos = ((645.0, 530.0) + <width> * (0.5, 0.0))
endscript

script menu_se_quit_highlight_focus 
	retail_menu_focus Id = <Id>
	GetScreenElementDims Id = <Id>
	SetScreenElementProps Id = hi_left Pos = ((635.0, 575.0) - <width> * (0.5, 0.0)) flip_v
	SetScreenElementProps Id = hi_right Pos = ((645.0, 575.0) + <width> * (0.5, 0.0))
endscript
