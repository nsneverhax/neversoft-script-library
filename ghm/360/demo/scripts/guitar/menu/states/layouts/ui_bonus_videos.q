
script ui_create_bonus_videos 
	change \{rich_presence_context = presence_videos}
	killspawnedscript \{name = ui_destroy_bonus_videos_spawned}
	set_bink_heap_state \{state = big}
	createscreenelement {
		type = descinterface
		desc = 'videos'
		parent = root_window
		id = current_menu_anchor
		just = [center center]
		exclusive_device = ($primary_controller)
		tags = {
			current_preview = none
		}
	}
	if <id> :desc_resolvealias name = alias_vmenu
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
					generic_event_back
				}
			]}
		current_menu :obj_spawnscript \{highlight_motion}
		getarraysize ($bonus_videos)
		i = 0
		begin
		if NOT ui_bonus_videos_is_locked id = ($bonus_videos [<i>].id)
			if (($bonus_videos [<i>].id) = credits)
				add_menu_frontend_item {
					text = ($bonus_videos [<i>].text)
					choose_state = uistate_bonus_videos_credits
					focus_script = ui_bonus_videos_focus
					focus_params = {credits}
					unfocus_script = ui_bonus_videos_unfocus
				}
			else
				add_menu_frontend_item {
					text = ($bonus_videos [<i>].text)
					pad_choose_script = ui_bonus_videos_play_video
					pad_choose_params = {($bonus_videos [<i>])}
					focus_script = ui_bonus_videos_focus
					focus_params = {($bonus_videos [<i>])}
					unfocus_script = ui_bonus_videos_unfocus
				}
			endif
		else
			add_menu_frontend_item {
				text = qs(0x24a08263)
				pad_choose_script = nullscript
				pad_choose_sound = ui_bonus_videos_negative_sfx
				focus_script = ui_bonus_videos_focus
				focus_params = {($bonus_videos [<i>]) locked}
				unfocus_script = ui_bonus_videos_unfocus
				rgba = [110 100 90 175]
				not_focusable
			}
		endif
		<i> = (<i> + 1)
		repeat <array_size>
		getscreenelementdims id = <item_id>
		<height> = (<height> * <array_size>)
		current_menu :settags {total_height = <height>}
	endif
endscript

script ui_destroy_bonus_videos 
	killspawnedscript \{name = ui_bonus_video_preview}
	spawnscriptnow \{ui_destroy_bonus_videos_spawned}
	if screenelementexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
	clean_up_user_control_helpers
endscript

script ui_destroy_bonus_videos_spawned 
	if ($bink_heap_state = small)
		return
	endif
	killmovie \{textureslot = 1}
	waitforallmoviestofinish
	set_bink_heap_state \{state = small}
	menu_music_on
	spawnscriptnow \{skate8_sfx_backgrounds_new_area
		params = {
			bg_sfx_area = frontend_menu_music
		}}
endscript

script ui_bonus_videos_play_video \{movie = 'atvi'}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	current_menu :se_setprops \{block_events}
	if ui_bonus_videos_is_locked id = <id>
	else
		killspawnedscript \{name = ui_bonus_video_preview}
		destroyscreenelement \{id = preview_movie}
		waitforallmoviestofinish
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
		playmovieandwait noblack movie = <movie>
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
		spawnscript ui_bonus_video_preview params = <...>
	endif
	current_menu :se_setprops \{unblock_events}
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

script ui_bonus_videos_anim_in 
	menu_transition_in \{menu = current_menu_anchor}
endscript

script ui_bonus_videos_anim_out 
	menu_transition_out \{menu = current_menu_anchor}
endscript

script ui_bonus_videos_focus 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request
		checkwholecallstack}
	current_menu :se_setprops \{block_events}
	obj_getid
	gettags
	<objid> :se_getparentid
	current_menu :gettags \{total_height}
	getscreenelementposition id = <objid>
	scroll_perc = ((<screenelementpos>.(0.0, 1.0)) / (<total_height>))
	scroll_len = 370
	scroll_pos = (((<scroll_perc> * 370) * (0.0, 1.0)) + (1.0, 0.0))
	current_menu_anchor :se_setprops setlist_b_scrollthumb_pos = <scroll_pos>
	if current_menu_anchor :desc_resolvealias \{name = alias_highlight}
		wait \{2
			gameframe}
		getscreenelementdims id = <objid>
		scale = (((1.0, 0.0) * ((<width> / 205.0))) + (0.0, 1.0))
		getscreenelementposition id = <objid> summed
		<resolved_id> :se_setprops pos = {absolute <screenelementpos>} scale = <scale>
		<resolved_id> :se_waitprops
		getscreenelementposition id = <objid> summed
		<resolved_id> :se_setprops pos = {absolute (<screenelementpos> + (0.0, -10.0))} time = 0.05
		<resolved_id> :se_waitprops
		getscreenelementposition id = <objid> summed
		<resolved_id> :se_setprops pos = {absolute <screenelementpos>} scale = <scale> time = 0.05
		<resolved_id> :se_waitprops
	endif
	if NOT scriptisrunning \{ui_bonus_videos_play_video}
		spawnscriptnow ui_bonus_video_preview params = <...>
		current_menu :se_setprops \{unblock_events}
	endif
endscript

script ui_bonus_video_preview \{movie = 'atvi'}
	wait \{0.35000002
		second}
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	current_menu_anchor :gettags
	clean_up_user_control_helpers
	if ((gotparam credits) || (gotparam locked))
		destroyscreenelement \{id = preview_movie}
		waitforallmoviestofinish
		current_menu_anchor :se_setprops \{info_text = qs(0x00000000)}
		menu_music_on
		spawnscriptnow \{skate8_sfx_backgrounds_new_area
			params = {
				bg_sfx_area = frontend_menu_music
			}}
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100000}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
		current_menu_anchor :se_setprops \{video_placeholder_alpha = 1.0
			time = 0.1}
	elseif gotparam \{movie}
		menu_music_off
		spawnscriptnow \{bg_crowd_front_end_silence
			params = {
				immediate = 1
			}}
		add_user_control_helper \{text = qs(0x67fbc67f)
			button = green
			z = 100000}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
		if (<movie> = <current_preview>)
			if screenelementexists \{id = preview_movie}
				return
			endif
		endif
		if current_menu_anchor :desc_resolvealias \{name = alias_video_container}
			destroyscreenelement \{id = preview_movie}
			waitforallmoviestofinish
			formattext checksumname = movie_checksum '%m' m = <movie>
			current_menu_anchor :se_setprops \{info_text = qs(0x00000000)}
			if structurecontains structure = ($ui_song_extras_movies) <movie_checksum>
				current_menu_anchor :se_setprops info_text = ($ui_song_extras_movies.<movie_checksum>)
			endif
			set_bink_heap_state \{state = big}
			if gotparam \{locked}
				alpha = 0.1
			endif
			createscreenelement {
				type = movieelement
				parent = <resolved_id>
				id = preview_movie
				dims = (490.0, 275.0)
				just = [center center]
				pos_anchor = [center center]
				pos = (0.0, 0.0)
				textureslot = 1
				texturepri = 1000
				no_hold
				movie = <movie>
				alpha = <alpha>
			}
			current_menu_anchor :settags current_preview = <movie>
			begin
			if ismovieplaying \{textureslot = 1}
				break
			endif
			wait \{1
				gameframes}
			repeat
			current_menu_anchor :se_setprops \{video_placeholder_alpha = 0.0
				time = 0.1}
		endif
	endif
endscript

script ui_bonus_videos_unfocus 
endscript
