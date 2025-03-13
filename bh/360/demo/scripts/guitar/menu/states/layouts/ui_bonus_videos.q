
script ui_create_bonus_videos 
	change \{rich_presence_context = presence_videos}
	createscreenelement \{parent = root_window
		id = videos
		type = descinterface
		desc = 'options_menu'
		title_text = qs(0x9560fb22)}
	if NOT videos :desc_resolvealias \{name = 0xa39f6109}
		softassert \{qs(0xb547c6cd)}
		return
	endif
	assignalias id = <resolved_id> alias = current_menu
	current_menu :settags \{smooth_morph_time = 0.1}
	current_menu :se_setprops {
		event_handlers = [
			{pad_up 0x0c5f870a params = {desc_id = videos up}}
			{pad_up smoothmenuscroll params = {dir = -1 isvertical = true play_scroll_sound = 1}}
			{pad_down 0x0c5f870a params = {desc_id = videos down}}
			{pad_down smoothmenuscroll params = {dir = 1 isvertical = true play_scroll_sound = 1}}
			{pad_left 0x0c5f870a params = {desc_id = videos up}}
			{pad_left smoothmenuscroll params = {dir = -1 isvertical = true play_scroll_sound = 1}}
			{pad_right 0x0c5f870a params = {desc_id = videos down}}
			{pad_right smoothmenuscroll params = {dir = 1 isvertical = true play_scroll_sound = 1}}
			{pad_back generic_event_back}
		]
		exclusive_device = ($primary_controller)
	}
	add_generic_barrel_menu_text_item {
		text = ($bonus_videos [0].text)
		choose_state = uistate_bonus_videos_credits
		parent = current_menu
	}
	getarraysize ($bonus_videos)
	i = 1
	begin
	if NOT ui_bonus_videos_is_locked id = ($bonus_videos [<i>].id)
		movie = ($bonus_videos [<i>].movie)
		getterritory
		if gotparam \{territory}
			if NOT (<territory> = territory_us)
				if structurecontains structure = ($bonus_videos [<i>]) movienoesrb
					movie = ($bonus_videos [<i>].movienoesrb)
				endif
			else
			endif
		endif
		add_generic_barrel_menu_text_item {
			text = ($bonus_videos [<i>].text)
			pad_choose_script = ui_bonus_videos_play_video_if_not_playing
			pad_choose_params = {movie = <movie>}
			parent = current_menu
		}
	else
		add_generic_barrel_menu_text_item \{text = qs(0x24a08263)
			pad_choose_script = ui_bonus_videos_negative_sfx
			parent = current_menu}
	endif
	<i> = (<i> + 1)
	repeat (<array_size> - 1)
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	launchevent type = focus target = current_menu data = {child_index = <selected_index>}
endscript

script ui_destroy_bonus_videos 
	clean_up_user_control_helpers
	destroyscreenelement \{id = videos}
endscript

script ui_bonus_videos_play_video_if_not_playing \{movie = 'atvi'}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	if NOT scriptisrunning \{ui_bonus_videos_play_video}
		ui_bonus_videos_play_video movie = <movie>
	endif
endscript

script ui_bonus_videos_play_video \{movie = 'atvi'}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	launchevent \{type = unfocus
		target = current_menu}
	current_menu :se_setprops \{block_events}
	if ui_bonus_videos_is_locked id = <id>
	else
		menu_music_off
		spawnscriptnow \{bg_crowd_front_end_silence
			params = {
				immediate = 1
			}}
		fadetoblack \{on
			alpha = 1.0
			time = 0
			z_priority = 200}
		clean_up_user_control_helpers
		netsessionfunc \{func = removeallcontrollers}
		destroy_song_and_musicstudio_heaps \{do_unloads}
		setbinkheap \{heap_cas_cache}
		playmovieandwait noblack movie = <movie>
		setbinkheap \{heap_bink}
		create_song_and_musicstudio_heaps
		if ($invite_controller = -1)
			netsessionfunc func = addcontrollers params = {controller = ($primary_controller)}
		else
			netsessionfunc func = addcontrollers params = {controller = ($invite_controller)}
		endif
		menu_finish
		fadetoblack \{off
			time = 0}
		spawnscriptnow \{skate8_sfx_backgrounds_new_area
			params = {
				bg_sfx_area = frontend_menu_music
			}}
		menu_music_on
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100000}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
	endif
	current_menu :se_setprops \{unblock_events}
	launchevent \{type = focus
		target = current_menu}
endscript

script ui_bonus_videos_is_locked 
	getarraysize ($bonus_videos)
	i = 0
	begin
	if gotparam \{id}
		if (<id> = ($bonus_videos [<i>].id))
			getglobaltags ($bonus_videos [<i>].id)
			if (<unlocked> = 0)
				return \{true}
			else
				return \{false}
			endif
		endif
	elseif gotparam \{movie}
		if (<movie> = ($bonus_videos [<i>].movie))
			getglobaltags ($bonus_videos [<i>].id)
			if (<unlocked> = 0)
				return \{true}
			else
				return \{false}
			endif
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	return \{false}
endscript

script get_movie_id_by_name 
	getarraysize ($bonus_videos)
	i = 0
	begin
	if (($bonus_videos [<i>].movie) = <movie>)
		return id = ($bonus_videos [<i>].id)
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	scriptassert \{qs(0xbb136b8e)}
endscript

script ui_bonus_videos_negative_sfx 
	soundevent \{event = ui_sfx_negative_select}
endscript
