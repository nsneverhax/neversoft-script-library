force_mainmenu_signin = 0
GameBox_Props = [
	{
		alpha = 0
		scale = (2.0, 2.0)
		pos = (420.0, 50.0)
		z = 50
	}
	{
		alpha = 1
		scale = (1.0, 1.0)
		pos = (183.5, 6.0)
		z = 49
	}
	{
		alpha = 1
		scale = (0.85, 0.85)
		pos = (53.5, 6.0)
		z = 48
	}
	{
		alpha = 1
		scale = (0.7, 0.7)
		pos = (-34.5, 4.5)
		z = 47
	}
	{
		alpha = 1
		scale = (0.55, 0.55)
		pos = (-75.5, 3.0)
		z = 46
	}
	{
		alpha = 0
		scale = (0.55, 0.55)
		pos = (-320.0, 3.0)
		z = 45
	}
]

script create_main_menu 
	change \{respond_to_signin_changed = 0}
	frontend_load_soundcheck
	clear_exclusive_devices
	setmenuautorepeattimes \{(0.3, 0.05)}
	disable_pause
	unpausegame
	change \{current_num_players = 1}
	change structurename = player1_status controller = ($primary_controller)
	disable_pause
	change \{current_song = $startup_song}
	change \{rich_presence_context = presence_menus}
	change \{player1_device = 0}
	change \{player2_device = 1}
	change \{player3_device = 2}
	change \{player4_device = 3}
	killmovie \{textureslot = 1}
	spawnscriptnow \{menu_music_fade
		params = {
			in
			time = 0.01
		}}
endscript

script create_main_menu_elements 
	if NOT ($invite_controller = -1)
		return
	endif
	if screenelementexists \{id = current_menu_anchor}
		current_menu_anchor :die
	endif
	createscreenelement \{type = descinterface
		id = current_menu_anchor
		parent = root_window
		desc = 'main_menu_layout'
		just = [
			center
			center
		]
		tags = {
			current_preview = none
		}}
	current_menu_anchor :obj_spawnscriptnow \{Background_Swap}
	if current_menu_anchor :desc_resolvealias \{name = alias_Game_Scrolling_Menu}
		assignalias id = <resolved_id> alias = scrolling_menu
		scrolling_menu :se_setprops \{top_selection = true}
	endif
	if current_menu_anchor :desc_resolvealias \{name = alias_Game_Menu}
		assignalias id = <resolved_id> alias = current_menu
		current_menu :se_setprops \{event_handlers = [
				{
					pad_up
					GameBox_Animation
					params = {
						direction = right
					}
				}
				{
					pad_down
					GameBox_Animation
					params = {
						direction = left
					}
				}
				{
					pad_left
					GameBox_Animation
					params = {
						direction = right
					}
				}
				{
					pad_right
					GameBox_Animation
					params = {
						direction = left
					}
				}
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
					pad_left
					generic_menu_up_or_down_sound
					params = {
						down
					}
				}
				{
					pad_right
					generic_menu_up_or_down_sound
					params = {
						up
					}
				}
				{
					pad_up
					BX_Video_Attract_Reset
				}
				{
					pad_down
					BX_Video_Attract_Reset
				}
				{
					pad_left
					BX_Video_Attract_Reset
				}
				{
					pad_right
					BX_Video_Attract_Reset
				}
			]}
		current_menu_anchor :desc_resolvealias \{name = alias_Anim_Container}
		assignalias id = <resolved_id> alias = Anim_Container
		getscreenelementchildren \{id = Anim_Container}
		acc = <children>
		BX_SetLauncherGamesArray
		getarraysize \{$Launcher_Games_Array}
		i = $game_array_offset
		begin
		if (<i> >= <array_size>)
			i = (<i> - <array_size>)
		endif
		if (<i> < 0)
			i = 0
		endif
		if (<i> < <array_size>)
			break
		endif
		repeat
		num_loop = <array_size>
		if (<num_loop> < 4)
			num_loop = 4
		endif
		begin
		curr_game = (($Launcher_Games_Array) [<i>])
		if ((($<curr_game>).ContentType) = movie)
			event_handlers = [
				{focus mainmenu_item_focus}
				{unfocus mainmenu_item_unfocus}
				{pad_choose BX_play_video params = {curr_game = <curr_game>}}
			]
		else
			event_handlers = [
				{focus mainmenu_item_focus}
				{unfocus mainmenu_item_unfocus}
				{pad_choose BX_start_demo}
			]
		endif
		createscreenelement {
			type = descinterface
			parent = current_menu
			desc = 'GameBox_Item'
			dims = (293.0, 415.0)
			z_priority = 10
			scale = (1.0, 1.0)
			event_handlers = <event_handlers>
			tags = {
				curr_game = <curr_game>
			}
		}
		curr_gamebox = (<acc> [<i>])
		<curr_gamebox> :se_setprops {
			GameBox_rgba = (($g_menu_colors).GameBox_greyed_out)
		}
		i = (<i> + 1)
		if (<i> = <array_size>)
			i = 0
		endif
		repeat <num_loop>
	endif
	getarraysize \{$Launcher_Games_Array}
	i = $game_array_offset
	begin
	if (<i> >= <array_size>)
		i = (<i> - <array_size>)
	endif
	if (<i> < 0)
		i = 0
	endif
	if (<i> < <array_size>)
		break
	endif
	repeat
	j = 0
	num_loop = <array_size>
	if (<num_loop> < 4)
		num_loop = 4
	endif
	begin
	curr_game = (($Launcher_Games_Array) [<i>])
	curr_gamebox = (<acc> [<j>])
	<curr_gamebox> :se_setprops {
		GameBox_texture = (($<curr_game>).GameBox)
	}
	i = (<i> - 1)
	if (<i> < 0)
		i = (<array_size> - 1)
	endif
	j = (<j> + 1)
	repeat <num_loop>
	current_menu_anchor :desc_resolvealias \{name = alias_Anim_Container}
	getscreenelementchildren id = <resolved_id>
	focussed_gamebox = (<children> [($focussed_child)])
	<focussed_gamebox> :obj_spawnscriptnow GameBox_Glow_Anim
	if ($BX_Attract_Enabled = 1)
		runscriptonscreenelement \{BX_Video_Attract_Wait
			id = current_menu}
		runscriptonscreenelement \{BX_Video_Attract_Input
			id = current_menu}
	endif
endscript

script mainmenu_item_focus 
	se_getparentid
	<parent_id> :gettags
	getarraysize \{$Launcher_Games_Array}
	i = $game_array_offset
	begin
	if (<i> >= <array_size>)
		i = (<i> - <array_size>)
	endif
	if (<i> < 0)
		i = 0
	endif
	if (<i> < <array_size>)
		break
	endif
	repeat
	arrayIndex = (<tag_selected_index> + <i>)
	begin
	if (<arrayIndex> >= <array_size>)
		arrayIndex = (<arrayIndex> - <array_size>)
	endif
	if (<arrayIndex> < 0)
		arrayIndex = 0
	endif
	if (<arrayIndex> < <array_size>)
		break
	endif
	repeat
	num_loop = <array_size>
	if (<num_loop> < 4)
		num_loop = 4
	endif
	curr_game = (($Launcher_Games_Array) [<arrayIndex>])
	getarraysize (($<curr_game>).songs)
	if (<array_size> > 4)
		num_songs = 4
	else
		num_songs = <array_size>
	endif
	text_props = {}
	i = 1
	begin
	formattext checksumname = song_text 'Song_%a_text' a = <i>
	formattext checksumname = artist_text 'Artist_%b_text' b = <i>
	if (<i> <= <num_songs>)
		addparam structure_name = text_props name = <song_text> value = (($<curr_game>).songs [(<i> -1)])
		addparam structure_name = text_props name = <artist_text> value = (($<curr_game>).artists [(<i> -1)])
	else
		addparam structure_name = text_props name = <song_text> value = qs(0x00000000)
		addparam structure_name = text_props name = <artist_text> value = qs(0x00000000)
	endif
	<i> = (<i> + 1)
	repeat <num_loop>
	current_menu_anchor :se_setprops <text_props>
	current_menu_anchor :se_setprops {
		game_title_text = (($<curr_game>).GameDescription)
	}
	spawnscriptnow BX_video_preview params = {curr_game = <curr_game>}
	spawnscriptnow BX_update_helper_pills params = {curr_game = <curr_game>}
endscript

script mainmenu_item_unfocus 
	se_getparentid
	<parent_id> :gettags
endscript

script BX_update_helper_pills 
	requireparams \{[
			curr_game
		]
		all}
	clean_up_user_control_helpers
	if ((($<curr_game>).ContentType) = movie)
		add_user_control_helper \{text = qs(0x4ff85c08)
			button = green
			z = 10
			all_buttons
			override_body_alpha_to = 0}
	elseif ((($<curr_game>).ContentType) = demo)
		add_user_control_helper \{text = qs(0xcdaa4ea8)
			button = green
			z = 10
			all_buttons
			override_body_alpha_to = 0}
	endif
endscript
Index_Offset = 0
anim_time = 0.2
focussed_child = 0

script GameBox_Animation 
	requireparams \{[
			direction
		]
		all}
	setbuttoneventmappings \{block_menu_input}
	current_menu_anchor :desc_resolvealias \{name = alias_Anim_Container}
	assignalias id = <resolved_id> alias = Anim_Container
	getscreenelementchildren \{id = Anim_Container}
	acc = <children>
	getarraysize <acc>
	ACCAS = <array_size>
	getarraysize \{$Launcher_Games_Array}
	GAAR = <array_size>
	current_menu :gettags
	getarraysize \{$Launcher_Games_Array}
	tag_selected_index = (<tag_selected_index> + $game_array_offset)
	begin
	if (<tag_selected_index> >= <array_size>)
		tag_selected_index = (<tag_selected_index> - <array_size>)
	endif
	if (<tag_selected_index> < 0)
		tag_selected_index = 0
	endif
	if (<tag_selected_index> < <array_size>)
		break
	endif
	repeat
	if (<direction> = left)
		if NOT (($focussed_child) = 0)
			change focussed_child = ($focussed_child - 1)
		else
			change focussed_child = (<ACCAS> - 1)
		endif
		gamma = ((<ACCAS> - 1) - ($Index_Offset))
		if NOT (($Index_Offset) = (<ACCAS> - 1))
			change Index_Offset = (($Index_Offset) + 1)
		else
			change \{Index_Offset = 0}
		endif
		if NOT (<tag_selected_index> = (<GAAR> - 1))
			GameBox_Index = (<tag_selected_index> + 1)
		else
			GameBox_Index = 0
		endif
		curr_game = ($Launcher_Games_Array [<GameBox_Index>])
		curr_gamebox = (<acc> [<gamma>])
		<curr_gamebox> :se_setprops {
			GameBox_texture = (($<curr_game>).GameBox)
		}
	elseif (<direction> = right)
		if NOT (($focussed_child) = (<ACCAS> - 1))
			change focussed_child = ($focussed_child + 1)
		else
			change \{focussed_child = 0}
		endif
		if NOT (($Index_Offset) = 0)
			change Index_Offset = (($Index_Offset) - 1)
		else
			change Index_Offset = (<ACCAS> - 1)
		endif
		gamma = ((<ACCAS> - (($Index_Offset) + 1)) + 4)
		if (<gamma> > (<ACCAS> - 1))
			gamma = (<gamma> - <ACCAS>)
		endif
		GameBox_Index = (<tag_selected_index> - 4)
		if (<GameBox_Index> < 0)
			GameBox_Index = (<GameBox_Index> + 4)
		endif
		curr_game = ($Launcher_Games_Array [<GameBox_Index>])
		curr_gamebox = (<acc> [<gamma>])
		<curr_gamebox> :se_setprops {
			GameBox_texture = (($<curr_game>).GameBox)
		}
	endif
	i = 0
	begin
	delta = (($Index_Offset) + <i>)
	if (<delta> > (<ACCAS> - 1))
		delta = (<delta> - <ACCAS>)
	endif
	if NOT (<delta> = (<ACCAS> - 1))
		anim_props = ($GameBox_Props [(<delta> + 1)])
	else
		anim_props = ($GameBox_Props [0])
	endif
	curr_gamebox = (<acc> [<i>])
	if NOT (<i> = ($focussed_child))
		<curr_gamebox> :se_setprops {
			time = ($anim_time)
			anim = linear
			pos = (<anim_props>.pos)
			alpha = (<anim_props>.alpha)
			scale = (<anim_props>.scale)
			z_priority = (<anim_props>.z)
			GameBox_rgba = (($g_menu_colors).GameBox_greyed_out)
			GameBox_Glow_alpha = 0
		}
	else
		<curr_gamebox> :se_setprops {
			time = ($anim_time)
			anim = linear
			pos = (<anim_props>.pos)
			alpha = (<anim_props>.alpha)
			scale = (<anim_props>.scale)
			z_priority = (<anim_props>.z)
			GameBox_rgba = (($g_menu_colors).GameBox_focussed)
			GameBox_Glow_alpha = 0.8
		}
	endif
	i = (<i> + 1)
	repeat <ACCAS>
	if scriptisrunning \{GameBox_Glow_Anim}
		killspawnedscript \{name = GameBox_Glow_Anim}
	endif
	wait (($anim_time) * 0.75) second
	focussed_gamebox = (<acc> [($focussed_child)])
	<focussed_gamebox> :obj_spawnscriptnow GameBox_Glow_Anim
	setbuttoneventmappings \{unblock_menu_input}
endscript

script Background_Swap 
	begin
	se_setprops \{time = 0.55
		Background_2_alpha = 1
		Background_3_alpha = 0}
	wait \{0.6
		seconds}
	se_setprops \{time = 0.55
		Background_2_alpha = 0
		Background_3_alpha = 1}
	wait \{0.6
		seconds}
	se_setprops \{time = 0.55
		Background_2_alpha = 0
		Background_3_alpha = 0}
	wait \{0.6
		seconds}
	repeat
endscript

script GameBox_Glow_Anim 
	wait ($anim_time) second
	se_setprops {
		GameBox_rgba = (($g_menu_colors).GameBox_focussed)
		GameBox_Glow_alpha = 0.7
	}
	begin
	se_setprops \{GameBox_Glow_alpha = 0.5
		time = 0.55}
	wait \{0.8
		seconds}
	se_setprops \{GameBox_Glow_alpha = 0.8
		time = 0.25}
	wait \{0.8
		seconds}
	repeat
endscript
Video_Attract_Must_Pause = 0
Current_Attract = 0

script BX_Video_Attract_Wait 
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	wait_time = ($BX_Default_Attract_Time)
	begin
	cur_time = <wait_time>
	begin
	printf qs(0xc2723725) i = <cur_time> channel = DEMOLAUNCHER
	if (<cur_time> = 0)
		printf \{qs(0x9f12cd2b)
			channel = DEMOLAUNCHER}
		waitformovieloop \{textureslot = 1}
		obj_killspawnedscript \{name = BX_Video_Attract_Input}
		break
	endif
	wait \{1
		second
		ignoreslomo}
	if ($Video_Attract_Must_Pause = 0)
		cur_time = (<cur_time> - 1)
	else
		cur_time = <wait_time>
	endif
	repeat
	current_menu :gettags
	getarraysize \{$Launcher_Games_Array}
	currentIndex = (<tag_selected_index> + $game_array_offset)
	begin
	if (<currentIndex> >= <array_size>)
		currentIndex = (<currentIndex> - <array_size>)
	endif
	if (<currentIndex> < 0)
		currentIndex = 0
	endif
	if (<currentIndex> < <array_size>)
		break
	endif
	repeat
	i = (<currentIndex> + 1)
	change \{BX_Attract_Interrupted = 0}
	change \{BX_In_Attract_Mode = 1}
	begin
	if (<i> >= <array_size>)
		i = 0
	endif
	current = (($Launcher_Games_Array) [<i>])
	printf qs(0x8f5ce990) s = <current> channel = DEMOLAUNCHER
	change Current_Attract = <i>
	if NOT screenelementexists \{id = BX_Black_Screen}
		createscreenelement \{type = spriteelement
			parent = root_window
			id = BX_Black_Screen
			desc = 'GameBox_Item'
			dims = (1600.0, 1200.0)
			pos = (-200.0, -100.0)
			just = [
				left
				top
			]
			rgba = [
				0
				0
				0
				255
			]
			z_priority = 500}
	endif
	BX_play_video curr_game = <current>
	if ($BX_Attract_Interrupted = 1)
		change \{BX_In_Attract_Mode = 0}
		change \{BX_Attract_Interrupted = 0}
		destroyscreenelement \{id = BX_Black_Screen}
		curr_game = (($Launcher_Games_Array) [<currentIndex>])
		spawnscriptnow BX_video_preview params = {curr_game = <curr_game>}
		break
	endif
	i = (<i> + 1)
	wait \{2
		seconds}
	repeat
	repeat
endscript

script BX_Video_Attract_Input \{button1 = {
		}
		button2 = {
		}}
	wait \{30
		gameframes}
	get_handlers_for_all_buttons \{event_script = BX_Video_Attract_Reset}
	begin
	removeparameter \{makes}
	removeparameter \{device_num}
	setprops event_handlers = <event_handlers> replace_handlers
	wait \{1
		gameframe}
	repeat
endscript

script BX_Video_Attract_Reset 
	if ($BX_Attract_Enabled = 1)
		killspawnedscript \{name = BX_Video_Attract_Wait}
		printf \{qs(0xd6010d61)
			channel = DEMOLAUNCHER}
		wait \{30
			gameframes}
		begin
		if NOT scriptisrunning \{BX_Video_Attract_Wait}
			runscriptonscreenelement \{BX_Video_Attract_Wait
				id = current_menu}
			break
		endif
		wait \{1
			gameframe}
		repeat
	endif
endscript

script BX_Get_Localized_Video_Rating 
	requireparams \{[
			game_struct
		]
		all}
	MovieToPlay = none
	IsEuropeBuild
	if (<is_europe_build>)
		getlocale
		if ((<locale> != locale_united_kingdom) && (<locale> != locale_germany))
			MovieToPlay = ((<game_struct>).PEGI)
		endif
	else
		MovieToPlay = ((<game_struct>).esrb)
	endif
	return MovieToPlay = <MovieToPlay>
endscript

script BX_Get_Localized_Video 
	requireparams \{[
			game_struct
		]
		all}
	MovieToPlay = ((<game_struct>).GameVideo)
	if french
		if structurecontains \{structure = game_struct
				GameVideoF}
			MovieToPlay = ((<game_struct>).GameVideoF)
		endif
	elseif italian
		if structurecontains \{structure = game_struct
				GameVideoI}
			MovieToPlay = ((<game_struct>).GameVideoI)
		endif
	elseif german
		if structurecontains \{structure = game_struct
				GameVideoG}
			MovieToPlay = ((<game_struct>).GameVideoG)
		endif
	elseif spanish
		if structurecontains \{structure = game_struct
				GameVideoS}
			MovieToPlay = ((<game_struct>).GameVideoS)
		endif
	endif
	return MovieToPlay = <MovieToPlay>
endscript

script BX_video_preview 
	requireparams \{[
			curr_game
		]
		all}
	BX_Get_Localized_Video_Rating game_struct = ($<curr_game>)
	if (<MovieToPlay> != none)
		wait \{0.35000002
			second}
		spawnscriptnow BX_video_preview_rating params = {curr_game = <curr_game>}
		wait \{4
			second}
		killspawnedscript \{name = BX_video_preview_rating}
		destroyscreenelement \{id = preview_movie}
		waitforallmoviestofinish
	endif
	wait \{0.35000002
		second}
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	current_menu_anchor :gettags
	if gotparam \{curr_game}
		menu_music_off
		spawnscriptnow \{bg_crowd_front_end_silence
			params = {
				immediate = 1
			}}
		if ((($<curr_game>).GameVideo) = <current_preview>)
			if screenelementexists \{id = preview_movie}
				return
			endif
		endif
		if current_menu_anchor :desc_resolvealias \{name = alias_video_container}
			destroyscreenelement \{id = preview_movie}
			waitforallmoviestofinish
			set_bink_heap_state \{state = big}
			BX_Get_Localized_Video game_struct = ($<curr_game>)
			createscreenelement {
				type = movieelement
				parent = <resolved_id>
				id = preview_movie
				dims = (627.0, 399.0)
				just = [center center]
				pos_anchor = [center center]
				pos = (0.0, 0.0)
				textureslot = 1
				texturepri = 4
				no_hold
				movie = <MovieToPlay>
				alpha = <alpha>
			}
			current_menu_anchor :settags current_preview = (($<curr_game>).GameVideo)
			begin
			if ismovieplaying \{textureslot = 1}
				break
			endif
			wait \{1
				gameframes}
			repeat
			current_menu_anchor :se_setprops \{video_placeholder_alpha = 0.0
				time = 0.1}
		else
			printf \{qs(0xb0a4d5ff)
				channel = DEMOLAUNCHER}
		endif
	endif
endscript

script BX_video_preview_rating 
	requireparams \{[
			curr_game
		]
		all}
	wait \{0.35000002
		second}
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	current_menu_anchor :gettags
	if gotparam \{curr_game}
		menu_music_off
		spawnscriptnow \{bg_crowd_front_end_silence
			params = {
				immediate = 1
			}}
		if ((($<curr_game>).GameVideo) = <current_preview>)
			if screenelementexists \{id = preview_movie}
				return
			endif
		endif
		if current_menu_anchor :desc_resolvealias \{name = alias_video_container}
			destroyscreenelement \{id = preview_movie}
			waitforallmoviestofinish
			set_bink_heap_state \{state = big}
			BX_Get_Localized_Video_Rating game_struct = ($<curr_game>)
			if (<MovieToPlay> != none)
				createscreenelement {
					type = movieelement
					parent = <resolved_id>
					id = preview_movie
					dims = (627.0, 399.0)
					just = [center center]
					pos_anchor = [center center]
					pos = (0.0, 0.0)
					textureslot = 1
					texturepri = 4
					no_hold
					movie = <MovieToPlay>
					alpha = <alpha>
				}
				current_menu_anchor :settags current_preview = (($<curr_game>).GameVideo)
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
			waitforallmoviestofinish
		else
			printf \{qs(0xb0a4d5ff)
				channel = DEMOLAUNCHER}
		endif
	endif
endscript

script BX_play_video 
	requireparams \{[
			curr_game
		]
		all}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	current_menu :se_setprops \{block_events}
	killspawnedscript \{name = BX_video_preview}
	change \{Video_Attract_Must_Pause = 1}
	destroyscreenelement \{id = preview_movie}
	waitforallmoviestofinish
	spawnscriptnow \{bg_crowd_front_end_silence
		params = {
			immediate = 1
		}}
	fadetoblack \{on
		alpha = 1.0
		time = 0
		z_priority = 200}
	clean_up_user_control_helpers
	printf qs(0x1d540dc1) a = <curr_game> b = (($<curr_game>).ContentType) channel = DEMOLAUNCHER
	netsessionfunc \{func = removeallcontrollers}
	BX_Get_Localized_Video_Rating game_struct = ($<curr_game>)
	if (<MovieToPlay> != none)
		playmovieandwait noblack movie = <MovieToPlay>
	endif
	wait \{0.35000002
		second}
	BX_Get_Localized_Video game_struct = ($<curr_game>)
	playmovieandwait noblack movie = <MovieToPlay>
	clean_up_user_control_helpers
	destroyscreenelement \{id = helper_pills_movie_background}
	netsessionfunc func = addcontrollers params = {controller = ($primary_controller)}
	spawnscriptnow BX_update_helper_pills params = {curr_game = <curr_game>}
	fadetoblack \{off
		time = 0.2}
	change \{Video_Attract_Must_Pause = 0}
	if (($BX_In_Attract_Mode) = 0)
		spawnscript BX_video_preview params = <...>
	endif
	current_menu :se_setprops \{unblock_events}
endscript

script BX_start_demo_attract 
	current = (($Launcher_Games_Array) [$Current_Attract])
	if ((($<current>).ContentType) = demo)
		DEMOLAUNCHER = (($<current>).DemoExec)
		demo_index = (($<current>).demo_index)
		do_launch_game_demo demo_title = <DEMOLAUNCHER> demo_index = <demo_index>
	endif
endscript

script BX_start_demo 
	gettags
	DEMOLAUNCHER = (($<curr_game>).DemoExec)
	demo_index = (($<curr_game>).demo_index)
	do_launch_game_demo demo_title = <DEMOLAUNCHER> demo_index = <demo_index>
endscript

script destroy_main_menu 
	generic_ui_destroy
	destroy_viewport_ui
endscript

script do_launch_game_demo \{demo_timeout = 0}
	if CanLaunchGameDemo demo_title = <demo_title> demo_index = <demo_index>
		printf \{qs(0xbf2b954f)}
		if screenelementexists \{id = gh4_1_demo_mainmenu}
			destroyscreenelement \{id = gh4_1_demo_mainmenu}
		endif
		wait_for_safe_shutdown
		disable_pause
		IsEuropeBuild
		if (<is_europe_build>)
			legalscreen_name = 'boot_legal'
			change \{bx_game_title = 'Greatest Hits'}
			change \{bx_short_game_title = 'GH'}
		else
			legalscreen_name = 'boot_legal_NA'
			change \{bx_game_title = 'Smash Hits'}
			change \{bx_short_game_title = 'SH'}
		endif
		displayloadingscreen <legalscreen_name> spin3d_texture = 'load_wheel' spin_x = 640 spin_y = 575 scale = 0.05 localized
		stoprendering
		begin
		if NOT scriptisrunning \{BX_video_preview}
			break
		endif
		printf \{channel = DEMOLAUNCHER
			qs(0x40079dff)}
		wait \{1
			gameframe}
		repeat
		if ($bink_heap_state != small)
			killallmovies
			waitforallmoviestofinish
			set_bink_heap_state \{state = small}
		endif
		shutdown_game_for_signin_change \{signin_change = 0}
		startrendering
		printf channel = DEMOLAUNCHER qs(0xe8082576) a = <demo_title> b = <demo_index> c = $g_demo_timeout
		LaunchGameDemo demo_title = <demo_title> demo_timeout = $g_demo_timeout demo_index = <demo_index>
	endif
endscript

script pop_in_new_downloads_notifier \{time = 0.5}
endscript

script main_menu_select_generic 
	if screenelementexists \{id = current_menu}
		launchevent \{type = unfocus
			target = current_menu}
	endif
	generic_event_choose state = <state> data = <data>
endscript

script set_primary_controller \{event = menu_change}
	requireparams \{[
			device_num
		]
		all}
	if screenelementexists \{id = current_menu}
		launchevent \{type = unfocus
			target = current_menu}
	endif
	if ((gotparam force) || ($force_mainmenu_signin = 1))
		change \{primary_controller = -1}
		change \{last_start_pressed_device = -1}
		change \{force_mainmenu_signin = 0}
	endif
	change \{respond_to_signin_changed = 1}
	change \{signin_jam_mode = 0}
	if ($current_num_players = 1)
		if (<device_num> > -1)
			setplayerinfo 1 controller = <device_num>
		endif
	endif
	if gotparam \{jam}
		if ($jam_view_cam_created = 1)
			scriptassert \{'logic error, this value should be zero here'}
		endif
		change \{signin_jam_mode = 1}
		generic_event_choose event = <event> state = uistate_signin data = {device_num = <device_num> allow_back = 1 new_state = <state> new_data = <data> jam = 1 require_live = <require_live>}
	else
		if gotparam \{require_live}
			force = 1
		elseif gotparam \{leaderboards}
			force = 1
		endif
		change primary_controller = <device_num>
		change last_start_pressed_device = <device_num>
		refresh_autokick_cheat
		restore_globals_from_global_tags
		generic_event_choose event = <event> state = <state> data = <data> no_sound = <no_sound>
		return
		get_savegame_from_controller controller = <device_num>
		if NOT is_autosave_on savegame = <savegame>
			change primary_controller = <device_num>
			change last_start_pressed_device = <device_num>
			refresh_autokick_cheat
			restore_globals_from_global_tags
			generic_event_choose event = <event> state = <state> data = <data> no_sound = <no_sound>
			return
		endif
	endif
endscript
force_pak_caching = 0
disable_pak_caching = 0

script frontend_load_soundcheck \{async = 1}
	printscriptinfo \{'frontend_load_soundcheck'}
	if getpakmancurrent \{map = zones}
		printf 'frontend_load_soundcheck : %s is loaded' s = <pak> donotresolve
		if NOT (<pak> = z_soundcheck)
			load_soundcheck = 1
		endif
		if NOT gotparam \{load_soundcheck}
			if NOT istextureloaded \{id = main_menu_skull}
				load_soundcheck = 1
			endif
		endif
	endif
	if NOT frontend_anim_paks_are_loaded
		load_anims = 1
	endif
	if ((gotparam load_soundcheck) || (gotparam load_anims))
		needs_loading_screen = 1
		if pakfilesarecached
			needs_loading_screen = 0
			if NOT frontend_anim_paks_are_loaded
				needs_loading_screen = 1
			endif
		endif
		if gotparam \{loadingscreen}
			if (<needs_loading_screen> = 1)
				create_loading_screen
			else
				hide_glitch \{num_frames = 3}
			endif
		endif
		if NOT isps3 \{testkit}
			if NOT pakfilesarecached
				if ((cd) || ($force_pak_caching = 1))
					if ($disable_pak_caching = 0)
						if cachepakfiles
							block \{untilevent = cache_pak_files_loaded}
						endif
					endif
				endif
			endif
		endif
		if gotparam \{load_soundcheck}
			if pakfilesarecached
				setpakmancurrentblock \{map = zones
					pak = z_soundcheck
					block_scripts = 1}
			else
				setpakmancurrentblock map = zones pak = z_soundcheck block_scripts = (<async> - 1)
			endif
		endif
		if gotparam \{load_anims}
			load_frontend_anim_paks \{async = 1}
		endif
		if NOT gotparam \{gigboard}
			hide_glitch \{num_frames = 30}
		endif
		if gotparam \{loadingscreen}
			if (<needs_loading_screen> = 1)
				destroy_loading_screen
			endif
		endif
	endif
endscript

script reset_character_ids 
	printf \{'reset_character_ids'}
	change \{structurename = player1_status
		character_id = judy}
	change \{structurename = player2_status
		character_id = judy}
	change \{structurename = player3_status
		character_id = judy}
	change \{structurename = player4_status
		character_id = judy}
	change \{structurename = player5_status
		character_id = judy}
	change \{structurename = player6_status
		character_id = judy}
	change \{structurename = player7_status
		character_id = judy}
	change \{structurename = player8_status
		character_id = judy}
endscript
game_array_offset = 0
g_demo_timeout = 0

script set_start_title 
	if (<demo_timeout> >= 0)
		change g_demo_timeout = <demo_timeout>
	endif
	printf channel = DEMOLAUNCHER qs(0x49da2c48) d = <demo_timeout>
	BX_SetLauncherGamesArray
	getarraysize \{$Launcher_Games_Array}
	if gotparam \{demo_index}
		if (<demo_index> < <array_size>)
			printf channel = DEMOLAUNCHER qs(0xcfdb755a) d = <demo_index>
			change game_array_offset = <demo_index>
		else
			printf channel = DEMOLAUNCHER qs(0xd4480ed5) d = <demo_index> a = <array_size>
		endif
	endif
endscript
