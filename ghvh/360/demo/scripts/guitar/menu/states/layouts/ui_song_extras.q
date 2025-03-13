ui_song_extras_finished_load = 0

script ui_create_song_extras 
	get_song_title song = <song>
	getuppercasestring <song_title>
	<song_title> = <uppercasestring>
	get_song_artist song = <song>
	getuppercasestring <song_artist>
	<song_artist> = <uppercasestring>
	formattext textname = song_text qs(0x90e80fb9) a = <song_artist> t = <song_title>
	get_all_exclusive_devices
	createscreenelement {
		type = descinterface
		desc = 'Setlist_B_com'
		id = current_menu_anchor
		parent = root_window
		exclusive_device = <exclusive_device>
		song_title_text = <song_text>
		song_extras_alpha = 1
		song_details_alpha = 0
		song_lyrics_alpha = 0
		double_kick_alpha = <double_kick_alpha>
	}
	if <id> :desc_resolvealias name = alias_menu_items
		assignalias id = <resolved_id> alias = current_menu
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
		if check_if_metallifacts_exists song = <song>
			if (<completed> = 1)
				add_menu_frontend_item {
					text = qs(0xb5fd7477)
					pad_choose_script = ui_song_extras_choose_metallifacts
					pad_choose_params = {song = <song>}
				}
			else
				add_menu_frontend_item {
					text = qs(0xb5fd7477)
					rgba = (($g_menu_colors).menu_disabled)
					not_focusable
				}
			endif
		endif
		if NOT structurecontains structure = ($permanent_songlist_props.<song>) guitar_only
			add_menu_frontend_item {
				text = qs(0x5710d714)
				pad_choose_script = ui_song_extras_choose_lyrics
				pad_choose_params = {song = <song>}
			}
		endif
		current_menu :obj_spawnscript \{highlight_motion}
	endif
	menu_finish
	if (<from> = setlist)
		menu_music_off
		change \{ui_song_extras_finished_load = 0}
		current_menu_anchor :obj_spawnscriptnow ui_song_extras_anim_in params = {new_double_kick_pos = <double_kick_pos> song = <song>}
		spawnscriptnow ui_song_extras_wait_and_load params = {song = <song>}
	elseif (<from> = song_details)
		current_menu_anchor :se_setprops \{song_extras_alpha = 1}
		current_menu_anchor :se_setprops double_kick_pos = <double_kick_pos>
		current_menu_anchor :se_setprops \{skeleton_right_pos = {
				relative
				(-300.0, 0.0)
			}
			time = 0.15
			motion = ease_in}
	else
		current_menu_anchor :se_setprops \{song_extras_alpha = 1}
		current_menu_anchor :se_setprops double_kick_pos = <double_kick_pos>
	endif
endscript

script ui_destroy_song_extras 
	if screenelementexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
	clean_up_user_control_helpers
endscript

script ui_deinit_song_extras 
	spawnscriptnow \{ui_song_extras_unload}
	menu_music_on
endscript

script ui_song_extras_anim_in 
	setbuttoneventmappings \{block_menu_input}
	menu_transition_in \{menu = current_menu_anchor
		anim_type = zoom_blur}
	setbuttoneventmappings \{unblock_menu_input}
endscript

script ui_song_extras_wait_and_load 
	begin
	if NOT scriptisrunning \{ui_song_extras_anim_in}
		break
	endif
	wait \{1
		gameframe}
	repeat
	ui_song_extras_load song = <song>
endscript

script ui_song_extras_anim_out 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request
		checkwholecallstack}
	current_menu_anchor :se_getprops \{double_kick_alpha}
	current_menu_anchor :se_getprops \{double_kick_pos}
	if (<to> = setlist)
		generic_menu_pad_back_sound
		ui_song_extras_unload
		generic_event_back \{nosound}
	elseif (<to> = metallifacts)
		ui_song_extras_unload
		start_metallifacts song = <song>
	elseif (<to> = song_details)
		generic_event_choose state = uistate_song_extras_details data = {song = <song> double_kick_alpha = <double_kick_alpha> double_kick_pos = <double_kick_pos>}
	elseif (<to> = movie)
		ui_song_extras_unload
		generic_event_choose state = uistate_song_extras_movie data = {song = <song>}
	endif
endscript

script ui_song_extras_choose_metallifacts 
	if ($ui_song_extras_finished_load = 0)
		return
	endif
	spawnscriptnow ui_song_extras_anim_out params = {to = metallifacts <...>}
	change \{is_metallifacts = 1}
endscript

script ui_song_extras_choose_lyrics 
	if ($ui_song_extras_finished_load = 0)
		return
	endif
	current_menu_anchor :se_getprops \{double_kick_alpha}
	current_menu_anchor :se_getprops \{double_kick_pos}
	generic_event_choose state = uistate_song_extras_lyrics data = {song = <song> double_kick_alpha = <double_kick_alpha> double_kick_pos = <double_kick_pos>}
endscript

script ui_song_extras_choose_details 
	if ($ui_song_extras_finished_load = 0)
		return
	endif
	spawnscriptnow ui_song_extras_anim_out params = {to = song_details <...>}
endscript

script ui_song_extras_exit 
	if ($ui_song_extras_finished_load = 0)
		return
	endif
	spawnscriptnow ui_song_extras_anim_out params = {to = setlist <...>}
endscript

script ui_song_extras_load 
	setscriptcannotpause
	finalprintf \{qs(0xd9e18907)}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request
		checkwholecallstack}
	change current_song = <song>
	load_songqpak song_name = <song> async = 0
	set_song_section_array \{player = 1}
	spawnscriptnow \{destroy_setlist_songpreview_monitor}
	wait_for_songpreview_monitor
	change \{force_practice_songpreview_restart = 1}
	spawnscriptnow \{ui_select_song_section_preview
		params = {
			index = 1
			extras = 1
		}}
	block \{type = song_started}
	change \{ui_song_extras_finished_load = 1}
endscript

script ui_song_extras_unload 
	setscriptcannotpause
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request
		checkwholecallstack}
	count = 0
	begin
	if ($ui_song_extras_finished_load = 1)
		break
	endif
	wait \{1
		gameframe}
	<count> = (<count> + 1)
	if (<count> > 300)
		finalprintf \{qs(0x68044cac)}
		killspawnedscript \{name = ui_song_extras_load}
		break
	endif
	repeat
	spawnscriptnow \{destroy_setlist_songpreview_monitor}
	finalprintf \{qs(0xc6e3d7ef)}
	wait_for_songpreview_monitor
	destroy_practice_songpreview_spawned
	ui_destroy_select_song_section
	songunload
	unload_songqpak
endscript

script ui_song_extras_choose_live_video 
	if ($ui_song_extras_finished_load = 0)
		return
	endif
	spawnscriptnow ui_song_extras_anim_out params = {to = movie <...>}
endscript
