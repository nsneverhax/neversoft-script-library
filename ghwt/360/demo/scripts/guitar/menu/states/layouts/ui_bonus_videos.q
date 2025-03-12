
script ui_create_bonus_videos 
	change \{rich_presence_context = presence_videos}
	make_generic_menu \{title = qs(0x884db659)
		scrolling}
	add_generic_menu_text_item {
		text = ($bonus_videos [0].text)
		choose_state = uistate_bonus_videos_credits
	}
	getarraysize ($bonus_videos)
	i = 1
	begin
	if NOT ui_bonus_videos_is_locked id = ($bonus_videos [<i>].id)
		if (($bonus_videos [<i>].id) = ghmetallica)
			movie = ($bonus_videos [<i>].movie)
			getterritory
			if gotparam \{territory}
				if NOT (<territory> = territory_us)
					movie = 'gh_metallica_noesrb'
				endif
			endif
			add_generic_menu_text_item {
				text = ($bonus_videos [<i>].text)
				pad_choose_script = ui_bonus_videos_play_video
				pad_choose_params = {($bonus_videos [<i>]) movie = <movie>}
			}
		else
			add_generic_menu_text_item {
				text = ($bonus_videos [<i>].text)
				pad_choose_script = ui_bonus_videos_play_video
				pad_choose_params = {($bonus_videos [<i>])}
			}
		endif
	else
		add_generic_menu_text_item \{text = qs(0x24a08263)
			pad_choose_script = ui_bonus_videos_negative_sfx}
	endif
	<i> = (<i> + 1)
	repeat (<array_size> - 1)
	menu_finish
endscript

script ui_destroy_bonus_videos 
	destroy_generic_menu
endscript

script ui_bonus_videos_play_video \{movie = 'atvi'}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
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
		menu_music_on
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
