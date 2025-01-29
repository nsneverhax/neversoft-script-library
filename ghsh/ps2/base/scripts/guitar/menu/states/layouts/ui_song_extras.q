ui_song_extras_finished_load = 0
ui_song_extras_movies = {
}

script ui_create_song_extras 
	get_song_title song = <song>
	GetUpperCaseString <song_title>
	<song_title> = <UppercaseString>
	get_song_artist song = <song>
	GetUpperCaseString <song_artist>
	<song_artist> = <UppercaseString>
	formatText TextName = song_text qs(0x90e80fb9) a = <song_artist> t = <song_title>
	CreateScreenElement {
		Type = descinterface
		desc = 'Setlist_B_com'
		id = current_menu_anchor
		parent = root_window
		exclusive_device = ($primary_controller)
		song_title_text = <song_text>
		song_extras_alpha = 0
		song_details_alpha = 0
		song_lyrics_alpha = 0
		double_kick_alpha = <double_kick_alpha>
	}
	if current_menu_anchor :desc_resolvealias \{Name = alias_menu_items}
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
					ui_song_extras_exit
				}
			]}
		if NOT GotParam \{completed}
			completed = 0
		endif
		if check_if_metallifacts_exists song = <song>
			if (<completed> = 1)
				add_menu_frontend_item {
					text = qs(0x068bc9f6)
					pad_choose_script = ui_song_extras_choose_metallifacts
					pad_choose_params = {song = <song>}
					focus_script = ui_song_extras_focus
					unfocus_script = ui_song_extras_unfocus
				}
			else
				add_menu_frontend_item {
					text = qs(0x068bc9f6)
					rgba = ($menu_unfocus_color)
					not_focusable
				}
			endif
		endif
		add_menu_frontend_item {
			text = qs(0xb5e46821)
			pad_choose_script = ui_song_extras_choose_details
			pad_choose_params = {song = <song>}
			focus_script = ui_song_extras_focus
			unfocus_script = ui_song_extras_unfocus
		}
		if NOT StructureContains structure = ($permanent_songlist_props.<song>) doesnt_support_vocals
			add_menu_frontend_item {
				text = qs(0x5710d714)
				pad_choose_script = ui_song_extras_choose_lyrics
				pad_choose_params = {song = <song>}
				focus_script = ui_song_extras_focus
				unfocus_script = ui_song_extras_unfocus
			}
		endif
		if StructureContains structure = ($ui_song_extras_movies) <song>
			add_menu_frontend_item \{text = qs(0x00000000)
				internal_scale = (0.3, 0.3)
				not_focusable}
			add_menu_frontend_item {
				text = qs(0x1a23e703)
				pad_choose_script = ui_song_extras_choose_live_video
				pad_choose_params = {song = <song>}
				focus_script = ui_song_extras_focus
				unfocus_script = ui_song_extras_unfocus
			}
			add_menu_frontend_item {
				text = ($ui_song_extras_movies.<song>)
				internal_scale = (0.5, 0.5)
				internal_just = [center center]
				single_line = FALSE
				not_focusable
			}
		endif
		current_menu :obj_spawnscript \{highlight_motion}
	endif
	menu_finish
	if (<from> = setlist)
		menu_music_off
		Change \{ui_song_extras_finished_load = 0}
		current_menu_anchor :Obj_SpawnScriptNow ui_song_extras_anim_in params = {new_double_kick_pos = <double_kick_pos> song = <song>}
	elseif (<from> = song_details)
		current_menu_anchor :se_setprops \{skeleton_left_pos = {
				relative
				(0.0, -50.0)
			}}
		current_menu_anchor :se_setprops \{skeleton_right_pos = {
				relative
				(300.0, -50.0)
			}}
		current_menu_anchor :se_setprops \{song_extras_alpha = 1}
		current_menu_anchor :se_setprops double_kick_pos = <double_kick_pos>
		current_menu_anchor :se_setprops \{skeleton_right_pos = {
				relative
				(-300.0, 0.0)
			}
			time = 0.15
			motion = ease_in}
	else
		current_menu_anchor :se_setprops \{skeleton_left_pos = {
				relative
				(0.0, -50.0)
			}}
		current_menu_anchor :se_setprops \{skeleton_right_pos = {
				relative
				(0.0, -50.0)
			}}
		current_menu_anchor :se_setprops \{song_extras_alpha = 1}
		current_menu_anchor :se_setprops double_kick_pos = <double_kick_pos>
	endif
	current_menu :Obj_SpawnScriptNow \{song_extra_skull_a_anim}
	current_menu :Obj_SpawnScriptNow \{song_extra_skull_b_anim}
endscript

script ui_destroy_song_extras 
	if ScreenElementExists \{id = current_menu_anchor}
		DestroyScreenElement \{id = current_menu_anchor}
	endif
	clean_up_user_control_helpers
	KillSpawnedScript \{Name = song_extra_skull_a_anim}
	KillSpawnedScript \{Name = song_extra_skull_b_anim}
endscript

script ui_song_extras_focus 
	Obj_GetID
	GetTags
	if current_menu_anchor :desc_resolvealias \{Name = alias_highlight}
		Wait \{2
			gameframe}
		GetScreenElementDims id = <objID>
		Scale = (((1.0, 0.0) * (((<width> + 100.0) / 256.0))) + (0.0, 1.5))
		GetScreenElementPosition id = <objID> summed
		<resolved_id> :se_setprops Pos = {absolute <screenelementpos>} Scale = <Scale>
		<resolved_id> :se_waitprops
		GetScreenElementPosition id = <objID> summed
		<resolved_id> :se_setprops Pos = {absolute (<screenelementpos> + (0.0, -10.0))} time = 0.05
		<resolved_id> :se_waitprops
		GetScreenElementPosition id = <objID> summed
		<resolved_id> :se_setprops Pos = {absolute <screenelementpos>} Scale = <Scale> time = 0.05
		<resolved_id> :se_waitprops
	endif
endscript

script ui_song_extras_unfocus 
	0x8dbdaee4 \{'ui_song_extras_unfocus (noop)'}
endscript

script song_extra_skull_a_anim 
	current_menu_anchor :se_getprops \{setlist_submenu_skull_a_pos}
	<org_pos> = <setlist_submenu_skull_a_pos>
	<time> = Random (@ 0.02 @ 0.02 @ 0.07 @ 0.01 @ 0.05 )
	r = Random (@ 1.5 @ 2 @ 5 @ 1 @ 4 )
	begin
	current_menu_anchor :se_setprops \{setlist_submenu_skull_a_pos = (1.718863, -175.35)
		time = 0.01}
	current_menu_anchor :se_waitprops
	current_menu_anchor :se_setprops \{setlist_submenu_skull_a_pos = (-5.718863, -169.35)
		time = 0.02}
	current_menu_anchor :se_waitprops
	current_menu_anchor :se_setprops \{setlist_submenu_skull_a_pos = (2.718863, -169.35)
		time = 0.01}
	current_menu_anchor :se_waitprops
	current_menu_anchor :se_setprops \{setlist_submenu_skull_a_pos = (1.718863, -169.35)
		time = 0.03}
	current_menu_anchor :se_waitprops
	Wait <r> Seconds
	current_menu_anchor :se_setprops \{setlist_submenu_skull_a_rot_angle = 5
		time = 0.08}
	current_menu_anchor :se_waitprops
	Wait \{0.02}
	current_menu_anchor :se_setprops \{setlist_submenu_skull_a_pos = (1.718863, -169.35)}
	current_menu_anchor :se_waitprops
	current_menu_anchor :se_setprops \{setlist_submenu_skull_a_pos = (-5.718863, -169.35)}
	current_menu_anchor :se_waitprops
	current_menu_anchor :se_setprops \{setlist_submenu_skull_a_pos = (1.718863, -169.35)
		time = 0.01}
	current_menu_anchor :se_waitprops
	current_menu_anchor :se_setprops \{setlist_submenu_skull_a_pos = (-5.718863, -169.35)
		time = 0.02}
	current_menu_anchor :se_waitprops
	current_menu_anchor :se_setprops \{setlist_submenu_skull_a_pos = (2.718863, -169.35)
		time = 0.01}
	current_menu_anchor :se_waitprops
	current_menu_anchor :se_setprops \{setlist_submenu_skull_a_pos = (1.718863, -169.35)
		time = 0.01}
	current_menu_anchor :se_waitprops
	current_menu_anchor :se_setprops \{setlist_submenu_skull_a_pos = (1.718863, -169.35)
		time = 0.01}
	current_menu_anchor :se_waitprops
	current_menu_anchor :se_setprops \{setlist_submenu_skull_a_rot_angle = -2
		time = 0.01}
	current_menu_anchor :se_waitprops
	current_menu_anchor :se_setprops \{setlist_submenu_skull_a_rot_angle = 0
		time = 0.01}
	current_menu_anchor :se_waitprops
	<skip_first_section> = 0
	repeat
endscript

script song_extra_skull_b_anim 
	current_menu_anchor :se_getprops \{setlist_submenu_skull_b_rot_angle}
	current_menu_anchor :se_getprops \{setlist_submenu_skull_b_pos}
	<org_pos> = <setlist_submenu_skull_b_pos>
	<time> = Random (@ 0.02 @ 0.02 @ 0.07 @ 0.01 @ 0.05 )
	r = Random (@ 1.5 @ 2 @ 5 @ 1 @ 4 )
	begin
	current_menu_anchor :se_setprops \{setlist_submenu_skull_b_pos = (-1.2441, -175.35)
		time = 0.01}
	current_menu_anchor :se_waitprops
	current_menu_anchor :se_setprops \{setlist_submenu_skull_b_pos = (-6.2441, -175.35)
		time = 0.02}
	current_menu_anchor :se_waitprops
	current_menu_anchor :se_setprops \{setlist_submenu_skull_b_pos = (2.718863, -169.35)
		time = 0.01}
	current_menu_anchor :se_waitprops
	current_menu_anchor :se_setprops \{setlist_submenu_skull_b_pos = (1.718863, -169.35)
		time = 0.03}
	current_menu_anchor :se_waitprops
	Wait <r> Seconds
	current_menu_anchor :se_setprops \{setlist_submenu_skull_b_rot_angle = 5
		time = 0.08}
	current_menu_anchor :se_waitprops
	Wait \{0.015}
	current_menu_anchor :se_setprops \{setlist_submenu_skull_b_pos = (1.718863, -169.35)}
	current_menu_anchor :se_waitprops
	current_menu_anchor :se_setprops \{setlist_submenu_skull_b_pos = (-6.718863, -169.35)}
	current_menu_anchor :se_waitprops
	current_menu_anchor :se_setprops \{setlist_submenu_skull_b_pos = (1.718863, -169.35)
		time = 0.01}
	current_menu_anchor :se_waitprops
	current_menu_anchor :se_setprops \{setlist_submenu_skull_b_pos = (-5.718863, -169.35)
		time = 0.02}
	current_menu_anchor :se_waitprops
	current_menu_anchor :se_setprops \{setlist_submenu_skull_b_pos = (2.718863, -169.35)
		time = 0.01}
	current_menu_anchor :se_waitprops
	current_menu_anchor :se_setprops \{setlist_submenu_skull_b_pos = (1.718863, -169.35)
		time = 0.01}
	current_menu_anchor :se_waitprops
	current_menu_anchor :se_setprops \{setlist_submenu_skull_b_pos = (-1.2441, -175.35)
		time = 0.01}
	current_menu_anchor :se_waitprops
	current_menu_anchor :se_setprops \{setlist_submenu_skull_b_rot_angle = -2
		time = 0.01}
	current_menu_anchor :se_waitprops
	current_menu_anchor :se_setprops \{setlist_submenu_skull_b_rot_angle = 0
		time = 0.01}
	current_menu_anchor :se_waitprops
	repeat
endscript

script ui_song_extras_anim_in 
	0xf7e0f992 \{Wait}
	se_getprops \{song_title_pos}
	se_getprops \{double_kick_pos}
	se_setprops \{skeleton_left_pos = {
			relative
			(-300.0, 0.0)
		}}
	se_setprops \{skeleton_right_pos = {
			relative
			(300.0, 0.0)
		}}
	se_setprops \{song_title_pos = (622.388, 248.817)}
	se_setprops \{skeleton_left_pos = {
			relative
			(300.0, -50.0)
		}
		time = 0.15
		motion = ease_in}
	se_setprops \{skeleton_right_pos = {
			relative
			(-300.0, -50.0)
		}
		time = 0.15
		motion = ease_in}
	se_setprops song_title_pos = <song_title_pos> time = 0.1 motion = ease_in
	se_setprops \{song_extras_alpha = 1
		time = 0.1
		motion = ease_in}
	Wait \{0.1
		Seconds}
	ui_fx_set_blur \{amount = 1.0
		time = 0.0}
	Wait \{0.15
		Seconds}
	ui_fx_set_blur \{amount = 0.0
		time = 0.0}
	Wait \{0.1
		Seconds}
	ui_song_extras_load song = <song>
endscript

script ui_song_extras_anim_out 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	OnExitRun \{0xdf9f604d}
	0x10b35a47
	current_menu_anchor :se_getprops \{double_kick_alpha}
	current_menu_anchor :se_getprops \{double_kick_pos}
	if (<to> = setlist)
		generic_menu_pad_back_sound
		ui_song_extras_unload
		generic_event_back \{nosound}
	elseif (<to> = metallifacts)
		create_loading_screen \{destroy_state = 'metallifacts'}
		ui_song_extras_unload
		start_metallifacts song = <song>
	elseif (<to> = song_details)
		current_menu_anchor :se_setprops \{skeleton_right_pos = {
				relative
				(300.0, 0.0)
			}
			time = 0.15
			motion = ease_in}
		current_menu_anchor :se_waitprops
		generic_event_choose state = uistate_song_extras_details data = {song = <song> double_kick_alpha = <double_kick_alpha> double_kick_pos = <double_kick_pos>} no_sound
	elseif (<to> = movie)
		ui_song_extras_unload
		generic_event_choose state = uistate_song_extras_movie data = {song = <song>} no_sound
	endif
endscript

script ui_song_extras_choose_metallifacts 
	SpawnScriptNow ui_song_extras_anim_out params = {to = metallifacts <...>}
endscript

script ui_song_extras_choose_lyrics 
	current_menu_anchor :se_getprops \{double_kick_alpha}
	current_menu_anchor :se_getprops \{double_kick_pos}
	generic_event_choose state = uistate_song_extras_lyrics data = {song = <song> double_kick_alpha = <double_kick_alpha> double_kick_pos = <double_kick_pos>}
endscript

script ui_song_extras_choose_details 
	SpawnScriptNow ui_song_extras_anim_out params = {to = song_details <...>}
endscript

script ui_song_extras_exit 
	SpawnScriptNow ui_song_extras_anim_out params = {to = setlist <...>}
endscript

script ui_song_extras_load 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request
		checkwholecallstack}
	Change current_song = <song>
	load_songqpak song_name = <song> async = 0
	set_song_section_array \{Player = 1}
	0xb17a28cd \{condition = {
			0xdffcb66f
		}}
	Change \{force_practice_songpreview_restart = 1}
	SpawnScriptNow \{ui_select_song_section_preview
		params = {
			index = 1
			extras = 1
		}}
	begin
	if ScriptIsRunning \{practice_songpreview_monitor}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	0x928a98c9
	Wait \{1
		Seconds}
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = focus
			target = current_menu}
	endif
	Change \{ui_song_extras_finished_load = 1}
endscript

script ui_song_extras_unload 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request
		checkwholecallstack}
	begin
	if ($ui_song_extras_finished_load = 1)
		break
	endif
	WaitOneGameFrame
	repeat
	0xb20ce9b6
	destroy_practice_songpreview_spawned
	ui_destroy_select_song_section
	songunload
	unload_songqpak
endscript

script ui_song_extras_choose_live_video 
	SpawnScriptNow ui_song_extras_anim_out params = {to = movie <...>}
endscript
