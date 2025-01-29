
script ui_init_win_song 
	SpawnScriptNow \{kill_gem_scroller}
endscript

script ui_create_win_song 
	set_focus_color
	set_unfocus_color
	CreateScreenElement \{parent = root_window
		id = myinterfaceelement
		Type = descinterface
		desc = 'win_song'}
	myinterfaceelement :desc_checkversion \{desired = 3
		assertif = mismatch}
	myinterfaceelement :se_getprops
	my_song = ($current_song)
	if NOT ($old_song = None)
		my_song = ($old_song)
		Change \{old_song = None}
	endif
	get_song_title song = <my_song>
	get_song_artist song = <my_song>
	get_difficulty_text difficulty = ($player1_status.difficulty)
	score = ($player1_status.score)
	CastToInteger \{score}
	formatText TextName = score_text qs(0x73307931) s = <score> DecimalPlaces = 0 usecommas
	myinterfaceelement :SetProps {
		song_name_text = <song_title>
		band_name_text = <song_artist>
		difficulty_text = <difficulty_text>
		score_text = <score_text>
	}
	if ($game_mode = p1_quickplay)
		menu_top_rockers_check_for_new_top_score \{nowrite = 1}
	endif
	stars = ($player1_status.stars)
	if (<stars> < 3)
		stars = 3
	endif
	ResolveScreenElementID \{id = {
			myinterfaceelement
			child = {
				win_container
				child = star_container
			}
		}}
	DestroyScreenElement id = <resolved_id> preserve_parent
	i = 0
	begin
	rgba2 = [200 200 200 255]
	rgba = [0 0 0 255]
	if (<i> >= <stars>)
		rgba2 = [64 64 64 255]
		rgba = [32 32 32 255]
	endif
	CreateScreenElement {
		Type = ContainerElement
		parent = <resolved_id>
		dims = (50.0, 50.0)
		just = [center center]
		child_anchor = [center center]
	}
	container = <id>
	rot_angle = RandomInteger (0.0, 360.0)
	CreateScreenElement {
		Type = SpriteElement
		parent = <container>
		texture = Song_Summary_Score_Star
		rot_angle = <rot_angle>
		rgba = <rgba>
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <container>
		texture = Song_Summary_Score_Star
		rot_angle = <rot_angle>
		Scale = 2.0
		rgba = <rgba2>
	}
	i = (<i> + 1)
	repeat 5
	i = 0
	p = 1
	begin
	ResolveScreenElementID id = {myinterfaceelement child = {win_container child = {note_streak_container child = <i>}}}
	if (<i> >= ($current_num_players))
		<resolved_id> :Die
	else
		<status> = ($0x2994109a [<p>])
		max_notes = ($<status>.max_notes)
		if (<max_notes> = 0)
			max_notes = 1.0
		endif
		formatText TextName = streak_text qs(0x73307931) s = ($<status>.best_run)
		if ($<status>.<part> = vocals)
			vocal_phrase_max_qual = $<status>.vocal_phrase_max_qual
			vocal_phrase_quality = $<status>.vocal_phrase_quality
			vocal_phrase_pct = 0
			if (<vocal_phrase_max_qual> > 0)
				vocal_phrase_pct = (((<vocal_phrase_quality>) / <vocal_phrase_max_qual>) * 100.0)
				formatText TextName = percent_text qs(0x49412198) p = <vocal_phrase_pct> DecimalPlaces = 0
			else
				<percent_text> = qs(0x4c1271a9)
			endif
		else
			formatText TextName = percent_text qs(0x49412198) p = ((($<status>.notes_hit) / (<max_notes> * 1.0)) * 100.0) DecimalPlaces = 0
		endif
		switch ($<status>.part)
			case guitar
			instrument_text = qs(0x11355666)
			case bass
			instrument_text = qs(0x4f551cbe)
			case drum
			instrument_text = qs(0xf3e03f27)
			case vocals
			instrument_text = qs(0x9fae80a8)
		endswitch
		SetScreenElementProps id = {<resolved_id> child = 0} text = <instrument_text>
		SetScreenElementProps id = {<resolved_id> child = 1} text = <streak_text>
		SetScreenElementProps id = {<resolved_id> child = 2} text = <percent_text>
		i = (<i> + 1)
	endif
	p = (<p> + 1)
	repeat 4
	ResolveScreenElementID \{id = {
			myinterfaceelement
			child = {
				win_container
				child = menu
			}
		}}
	continue_script = ui_win_song_career_continue
	gamemode_gettype
	if ((GotParam for_practice) || <Type> = quickplay)
		<continue_script> = ui_win_song_continue
	endif
	if ($game_mode = p2_pro_faceoff)
		<continue_script> = ui_win_song_continue
	endif
	if ($came_to_practice_from = main_menu)
		text = qs(0x3e482764)
	else
		if ($came_to_practice_from = gh4_p1_career)
			<text> = qs(0xb435bc8c)
		else
			<text> = qs(0x0a96ac96)
		endif
	endif
	CreateScreenElement {
		parent = <resolved_id>
		Type = TextElement
		font = fontgrid_text_a8
		text = <text>
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose <continue_script>}
		]
	}
	if (($is_network_game = 1) && ($net_new_matchmaking_ui_flag = 0))
		if NOT (IsHost)
			<id> :se_setprops not_focusable
		endif
	endif
	CreateScreenElement {
		parent = <resolved_id>
		Type = TextElement
		font = fontgrid_text_a8
		text = qs(0xcbd10828)
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose generic_event_choose params = {state = uistate_detailed_stats}}
		]
	}
	if ($is_network_game = 1)
		<id> :se_setprops not_focusable
	endif
	if GotParam \{for_practice}
		CreateScreenElement {
			parent = <resolved_id>
			Type = TextElement
			font = fontgrid_text_a8
			text = qs(0x0c711699)
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus retail_menu_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose practice_restart_song}
			]
		}
		CreateScreenElement {
			parent = <resolved_id>
			Type = TextElement
			font = fontgrid_text_a8
			text = qs(0x4a1f8323)
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus retail_menu_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose generic_event_back params = {state = uistate_practice_select_speed}}
			]
		}
		CreateScreenElement {
			parent = <resolved_id>
			Type = TextElement
			font = fontgrid_text_a8
			text = qs(0x07b66aa5)
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus retail_menu_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose generic_event_back params = {state = uistate_select_song_section}}
			]
		}
	else
		CreateScreenElement {
			parent = <resolved_id>
			Type = TextElement
			font = fontgrid_text_a8
			text = qs(0x0c711699)
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus retail_menu_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose restart_warning_select_restart}
			]
		}
		if ($is_network_game = 1)
			<id> :se_setprops not_focusable
		endif
	endif
	AssignAlias id = <resolved_id> alias = current_menu
	current_menu :obj_spawnscript \{menu_music_on}
	if ((($is_network_game = 1) && IsHost) || ($is_network_game = 0))
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100000
			all_buttons}
	endif
endscript

script ui_destroy_win_song 
	if ScreenElementExists \{id = myinterfaceelement}
		myinterfaceelement :Die
	endif
	clean_up_user_control_helpers
endscript

script ui_create_win_song_spawn 
	Wait \{1
		Seconds}
	create_newspaper_menu <...>
	LaunchEvent \{target = current_menu
		Type = focus}
endscript

script ui_win_song_continue 
	SpawnScriptNow ui_win_song_continue_spawned params = <...>
endscript

script ui_win_song_continue_spawned 
	if NOT CD
		ui_event_get_stack
		i = 0
		begin
		if ((<stack> [<i>].base_name) = 'debug')
			generic_event_back state = uistate_debug Player = <Player>
			return
		endif
		i = (<i> + 1)
		repeat <stack_size>
	endif
	ui_win_song_continue_next_menu
endscript

script ui_win_song_continue_next_menu 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if IsObjectScript
		se_setprops \{block_events}
	endif
	switch ($game_mode)
		case p1_quickplay
		case p2_quickplay
		case p3_quickplay
		case p4_quickplay
		if ($current_song = jamsession)
			if NOT GotParam \{no_sound}
				generic_menu_pad_choose_sound
			endif
			generic_menu_pad_choose_sound
			jam_ratesong_check_for_rating
		else
			if NOT GotParam \{no_sound}
				generic_menu_pad_choose_sound
			endif
			ui_memcard_autosave \{state = uistate_setlist
				data = {
					all_active_players = true
					0x6d221ff1
				}}
		endif
		case gh4_p1_career
		case gh4_p2_career
		case gh4_p3_career
		case gh4_p4_career
		ui_win_song_career_continue
		case p2_pro_faceoff
		generic_event_back \{state = uistate_setlist
			data = {
				no_jamsession
			}}
		case practice
		if ($came_to_practice_from = main_menu)
			generic_event_back \{state = uistate_setlist}
		else
			song_ended_menu_select_back_to_game
		endif
	endswitch
endscript

script ui_win_song_career_continue 
	SpawnScriptNow \{ui_win_song_career_continue_spawned}
endscript

script ui_win_song_career_continue_spawned 

	unlock_guitar = ($progression_unlocked_guitar)
	unlock_guitar2 = ($progression_unlocked_guitar2)
	if progression_should_show_credits
		0xd9ba0362 = 1
		progression_add_new_unlocks level = ($0x3225547a) stars = 0
	endif
	progression_get_new_unlocks
	GetArraySize <new_unlocks>
	if NOT CD
		if ($is_in_debug = 1)
			generic_event_back \{state = uistate_debug}
			return
		endif
	endif
	if NOT (<unlock_guitar2> = -1)
		generic_event_choose \{data = {
				state = uistate_unlock
				num_guitars_unlocked = 2
			}}
	elseif NOT (<unlock_guitar> = -1)
		generic_event_choose \{data = {
				state = uistate_unlock
				num_guitars_unlocked = 1
			}}
	elseif (<array_Size> > 0)
		generic_event_choose \{state = uistate_rewards}
	elseif GotParam \{0xd9ba0362}
		ui_memcard_autosave \{event = menu_change
			state = uistate_end_credits
			data = {
				all_active_players = true
				0x6d221ff1
			}}
	else
		if NOT ($current_gig_number = 0)
			if progression_set_new_song_in_gig_list
				Change \{gameplay_restart_song = 1}
				generic_menu_pad_choose_sound
				ui_memcard_autosave \{event = menu_back
					state = Uistate_gameplay
					data = {
						all_active_players = true
						0x6d221ff1
					}}
			else
				generic_menu_pad_choose_sound
				ui_memcard_autosave \{event = menu_back
					state = uistate_gig_posters
					data = {
						all_active_players = true
						0x6d221ff1
					}}
			endif
		else
			generic_menu_pad_choose_sound
			ui_memcard_autosave \{event = menu_back
				state = uistate_setlist
				data = {
					all_active_players = true
					0x6d221ff1
				}}
		endif
	endif
endscript

script 0x194e3e36 
	ui_memcard_autosave \{event = menu_change
		state = uistate_end_credits
		data = {
			all_active_players = true
			0x6d221ff1
		}}
endscript

script net_career_next_song 

	GetGlobalTags \{user_options}
	if progression_set_new_song_in_gig_list
		ui_memcard_autosave \{event = menu_back
			state = Uistate_gameplay
			data = {
				all_active_players = true
			}}
		Change \{gameplay_restart_song = 1}
		Change \{net_ready_to_start = 0}
		($default_loading_screen.create)
		load_and_sync_timing
	else

	endif
endscript
