special_event_last_time_stored = 0
special_event_total_expense_time = 0
special_event_hilite_color = [
	220
	20
	20
	255
]
g_sss_highlighted_index = 0
default_section_rgba = [
	64
	64
	64
	255
]
default_section_focus_rgba = [
	93
	30
	28
	255
]
0xf20a5276 = 0

script ui_init_select_song_section 
	disable_pause
	UnPauseGame
	Change \{0xf20a5276 = 0}
	if NOT ($game_mode = training)
		if GotParam \{from_in_game}
			Change \{practice_enabled = 1}
			Change came_to_practice_from = ($game_mode)
			if NOT ($current_progression_flag = None)
				Change came_to_practice_from_progression = ($current_progression_flag)
			endif
			getplayerinfo \{1
				character_id}
			if NOT (<character_id> = emptyguy)
				Change came_to_practice_character_id = <character_id>
				setplayerinfo \{1
					character_id = emptyguy}
			endif
			Change \{game_mode = training}
			StartRendering
		else
			Change \{came_to_practice_from = main_menu}
		endif
	endif
	Change \{current_num_players = 1}
	gamemode_updatenumplayers \{num_players = 1}
	menu_music_off
endscript

script ui_create_select_song_section 
	Change \{current_speedfactor = 1.0}
	if ($special_event_stage != 0)
		getspecialeventtimer
		Change special_event_last_time_stored = <time>
		Change \{special_event_total_expense_time = 0}
		Change \{practice_start_index = -1}
		Change \{practice_end_index = -1}
	endif
	load_songqpak song_name = ($current_song) async = 0
	CreateScreenElement \{parent = root_window
		Type = descinterface
		id = songsectiondesc
		desc = 'setlist_b_practice_sessions_desc'}
	focus2_script = ui_select_song_section_preview
	spawnsongpreview = 0
	if ($special_event_stage != 0)
		if ($current_special_event_num = 1 || $current_special_event_num = 2)
			if ($special_event_stage = 1 || $special_event_stage = 3)
				<focus2_script> = nullscript
				songsectiondesc :se_setprops \{message_text = qs(0x10b5a25c)}
				spawnsongpreview = 1
			endif
		endif
	endif
	if songsectiondesc :desc_resolvealias \{Name = alias_menu}
		AssignAlias id = <resolved_id> alias = current_menu
		current_menu :se_setprops {
			allow_wrap = FALSE
			exclusive_device = ($primary_controller)
			event_handlers = [
				{pad_up ui_select_song_section_play_sound params = {up}}
				{pad_down ui_select_song_section_play_sound params = {down}}
				{pad_back ui_select_song_section_back}
			]
			tags = {
				start_index = -1
				end_index = -1
			}
		}
		CreateScreenElement {
			parent = current_menu
			Type = descinterface
			desc = 'setlist_b_practice_sessions_item_desc'
			autosizedims = FALSE
			dims = (768.0, 45.0)
			section_text = qs(0xe1f4baaf)
			section_rgba = $default_section_rgba
			event_handlers = [
				{focus ui_select_song_section_focus_item}
				{focus <focus2_script>}
				{unfocus ui_select_song_section_unfocus_item}
				{pad_choose ui_select_song_section_choose_item}
			]
			tags = {playfullsong index = 0 strikeout_alpha = 0 default_rgba = $default_section_rgba}
		}
		if (<spawnsongpreview> = 1)
			<id> :obj_spawnscript ui_select_song_section_preview
		endif
		get_song_section_array
		getmarkerarraysize array = <song_section_array>
		marker_array_size = <array_Size>
		getplayerinfo \{1
			part}
		formatText \{checksumName = event_num
			'special_event%d'
			d = $current_special_event_num}
		formatText \{checksumName = challenge_num
			'challenge%d'
			d = $current_special_event_challenge_num}
		formatText checksumName = songs_ar '%p_songs' p = ($part_list_props.<part>.text_nl)
		if (<marker_array_size> > 0)
			i = 1
			begin
			GetRandomValue \{a = 1
				b = 2
				Name = rand_int
				integer}
			formatText checksumName = strikeout_texture 'strike_0%d' d = <rand_int>
			strikeout_alpha = 0
			if ($special_event_stage != 0)
				strikeout_alpha = 1
				GetArraySize ($special_events_challenges.<event_num>.<challenge_num>.<songs_ar> [$special_event_song_index].sections)
				special_index = 0
				begin
				section = ($special_events_challenges.<event_num>.<challenge_num>.<songs_ar> [$special_event_song_index].sections [<special_index>])
				if (<section> = (<i> -1))
					if NOT check_current_special_event_percentages section_to_check = <section> dont_count_unplayed_sections
						strikeout_alpha = 0
					endif
					break
				endif
				<special_index> = (<special_index> + 1)
				repeat <array_Size>
			endif
			shortenuistring {
				ui_string = (($<song_section_array> [(<i> - 1)]).marker)
				max_len = 50
			}
			<section_rgba> = $default_section_rgba
			if (<part> = vocals)
				if LocalizedStringEquals a = <short_ui_string> b = $vocal_marker_freeform
					<section_rgba> = $vocal_marker_freeform_rgba
				endif
				if LocalizedStringEquals a = <short_ui_string> b = $vocal_marker_hype
					<section_rgba> = $vocal_marker_hype_rgba
				endif
			endif
			CreateScreenElement {
				parent = current_menu
				Type = descinterface
				desc = 'setlist_b_practice_sessions_item_desc'
				autosizedims = FALSE
				dims = (760.0, 60.0)
				section_text = <short_ui_string>
				section_rgba = <section_rgba>
				event_handlers = [
					{focus ui_select_song_section_focus_item}
					{focus <focus2_script>}
					{unfocus ui_select_song_section_unfocus_item}
					{pad_choose ui_select_song_section_choose_item}
				]
				strikeout_texture = <strikeout_texture>
				strikeout_alpha = <strikeout_alpha>
				tags = {
					index = <i>
					strikeout_texture = <strikeout_texture>
					strikeout_alpha = <strikeout_alpha>
					default_rgba = <section_rgba>
				}
			}
			i = (<i> + 1)
			repeat <marker_array_size>
		endif
	endif
	if GotParam \{selected_index}
		GetScreenElementChildren \{id = current_menu}
		GetArraySize <children>
		ratio = (<selected_index> / (<marker_array_size> - 1.0))
		scroll_pos = ((358.0, -194.0) + ((0.0, 184.0) * <ratio>))
		songsectiondesc :se_setprops scroll_thumb_pos = <scroll_pos> time = <time>
	endif
	ui_select_song_section_preview \{index = 0
		noWait}
	menu_finish
	current_menu :SetTags \{lead_in = 0}
	current_menu :SetTags \{lead_out = 0}
	if 0x8658e568
		destroy_loading_screen
	endif
endscript

script ui_select_song_section_play_sound 
	get_song_section_array
	getmarkerarraysize array = <song_section_array>
	if GotParam \{up}
		Change g_sss_highlighted_index = ($g_sss_highlighted_index - 1)
		if ($g_sss_highlighted_index < 0)
			Change \{g_sss_highlighted_index = 0}
		else
			generic_menu_up_or_down_sound \{up}
		endif
	else
		Change g_sss_highlighted_index = ($g_sss_highlighted_index + 1)
		if ($g_sss_highlighted_index > (<array_Size> - 1))
			Change g_sss_highlighted_index = ($g_sss_highlighted_index - 1)
		else
			generic_menu_up_or_down_sound \{down}
		endif
	endif
endscript

script ui_destroy_select_song_section 
	KillSpawnedScript \{Name = practice_songpreview_monitor}
	KillSpawnedScript \{Name = practice_songpreview_fadeinandrepeat}
	if ($0xf20a5276 = 0)
		end_song
		Change \{0x9ce45dd2 = 0}
	endif
	DestroyScreenElement \{id = songsectiondesc}
	setsoundbussparams {leadvox_balance = {vol = ($default_BussSet.leadvox_balance.vol)}}
	setsoundbussparams {drums_balance = {vol = ($default_BussSet.drums_balance.vol)}}
	setsoundbussparams {leadgtr_balance = {vol = ($default_BussSet.leadgtr_balance.vol)}}
	setsoundbussparams {bass_balance = {vol = ($default_BussSet.bass_balance.vol)}}
	setsoundbussparams {rhythmgtr_balance = {vol = ($default_BussSet.rhythmgtr_balance.vol)}}
	setsoundbussparams {crowd_balance = {vol = ($default_BussSet.crowd_balance.vol)}}
	setsoundbussparams {crowdsingalong_balance = {vol = ($default_BussSet.crowdsingalong_balance.vol)}}
	setsoundbussparams {band_Balance = {vol = ($default_BussSet.band_Balance.vol)}}
	clean_up_user_control_helpers
endscript

script ui_deinit_select_song_section 
	hide_glitch \{num_frames = 20}
	SpawnScriptNow \{end_practice_song}
	unload_songqpak
endscript

script ui_select_song_section_focus_item \{time = 0.1}
	current_menu :GetTags
	GetTags
	my_strikeout_texture = <strikeout_texture>
	my_strikeout_alpha = <strikeout_alpha>
	highlight_alpha = 1.0
	strikeout_alpha = 0
	if ($special_event_stage != 0)
		if ($current_special_event_num = 1 || $current_special_event_num = 2)
			if ($special_event_stage = 1 || $special_event_stage = 3)
				highlight_alpha = 0.0
			endif
		endif
	endif
	GetScreenElementChildren \{id = current_menu}
	GetArraySize <children>
	children_array_size = <array_Size>
	if NOT (<start_index> = -1)
		i = <start_index>
		begin
		if ResolveScreenElementID id = {current_menu child = <i>}
			<resolved_id> :GetSingleTag strikeout_texture
			<resolved_id> :GetSingleTag strikeout_alpha
			<resolved_id> :GetSingleTag default_rgba
			if ((<i> >= <start_index>) && (<i> <= <index>))
				printf \{qs(0x40e2d6ec)}
				if (<i> = <start_index>)
					<resolved_id> :se_setprops {
						section_rgba = $default_section_focus_rgba
						highlight_rgba = [255 , 255 , 255 , 220]
						highlight_alpha = <highlight_alpha>
						strikeout_texture = <strikeout_texture>
						strikeout_alpha = <strikeout_alpha>
					}
				elseif NOT (<i> = <index>)
					printstruct {} i = <i> start_index = <start_index> index = <index> highlight_alpha = <highlight_alpha>
					<resolved_id> :se_setprops {
						section_rgba = $default_section_focus_rgba
						highlight_rgba = [255 255 255 160]
						highlight_alpha = <highlight_alpha>
						strikeout_texture = <strikeout_texture>
						strikeout_alpha = <strikeout_alpha>
					}
				endif
			else
				<resolved_id> :se_setprops {
					section_rgba = <default_rgba>
					highlight_rgba = [255 255 255 220]
					highlight_alpha = 0.0
					strikeout_texture = <strikeout_texture>
					strikeout_alpha = <strikeout_alpha>
				}
			endif
		endif
		i = (<i> + 1)
		repeat <children_array_size>
	endif
	if (<children_array_size> > 1.0)
		ratio = (<index> / (<children_array_size> - 1.0))
	else
		ratio = 0
	endif
	scroll_pos = ((358.0, -194.0) + ((0.0, 184.0) * <ratio>))
	songsectiondesc :se_setprops scroll_thumb_pos = <scroll_pos> time = <time>
	se_setprops {
		section_rgba = $default_section_focus_rgba
		highlight_rgba = [255 , 255 , 255 , 220]
		highlight_alpha = <highlight_alpha>
		strikeout_texture = <my_strikeout_texture>
		strikeout_alpha = <my_strikeout_alpha>
		time = 0.1
	}
endscript

script ui_select_song_section_unfocus_item 
	GetSingleTag \{default_rgba}
	se_setprops section_rgba = <default_rgba> highlight_alpha = 0.0 time = 0.1
endscript

script ui_select_song_section_choose_item 
	current_menu :GetTags
	GetTags
	if ($current_special_event_num = 1 || $current_special_event_num = 2)
		if ($special_event_stage = 1 || $special_event_stage = 3)
			get_song_end_time \{song = $current_song}
			CastToInteger \{total_end_time}
			Change special_event_total_expense_time = <total_end_time>
			setup_special_event
			get_song_section_array
			GetArraySize $<song_section_array>
			current_menu :SetTags \{start_index = 0}
			current_menu :SetTags end_index = <array_Size>
			current_menu :SetTags \{lead_in = 0}
			current_menu :SetTags \{lead_out = 0}
			params = {state = uistate_play_song}
			if GotParam \{playfullsong}
				params = {playfullsong state = uistate_play_song}
			endif
			current_menu :obj_spawnscript ui_select_song_section_set_times params = {<params>}
			return
		endif
	endif
	if GotParam \{playfullsong}
		current_menu :SetTags \{start_index = 0}
		current_menu :SetTags \{lead_in = 0}
		current_menu :SetTags \{lead_out = 0}
		params = {playfullsong}
		if ($special_event_stage != 0)
			params = {playfullsong state = uistate_play_song}
		endif
		current_menu :obj_spawnscript ui_select_song_section_set_times params = {<params>}
		return
	endif
	if (<start_index> = -1)
		generic_menu_up_or_down_sound
		current_menu :SetTags start_index = <index>
		if ($special_event_stage = 0)
			Change practice_start_index = <index>
			current_menu :SetTags start_index = <index>
		endif
	else
		current_menu :SetTags start_index = (<start_index> - 1)
		current_menu :SetTags end_index = <index>
		if ($special_event_stage = 0)
			current_menu :obj_spawnscript \{ui_select_song_section_set_times}
		else
			setup_special_event
			current_menu :obj_spawnscript \{ui_select_song_section_set_times
				params = {
					state = uistate_play_song
				}}
		endif
	endif
	songsectiondesc :se_setprops \{message_text = qs(0x3da2472b)}
	GetScreenElementChildren \{id = current_menu}
	GetArraySize <children>
	i = 0
	begin
	if (<i> >= <index>)
		break
	endif
	curr_item = (<children> [<i>])
	<curr_item> :se_setprops not_focusable
	i = (<i> + 1)
	repeat <array_Size>
endscript

script ui_select_song_section_back 
	current_menu :GetTags
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	0xaa404f44
	Wait \{0.5
		Seconds}
	begin
	if ($practice_songpreview_changing = 0)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if ($special_event_stage != 0)
		if ($current_special_event_num = 2)
			generic_event_back \{state = uistate_special_events}
			return
		endif
	endif
	if (<start_index> = -1)
		songunload
		begin
		GetContentFolderState
		if (<contentfolderstate> = free)
			break
		endif
		Wait \{1
			gameframe}
		repeat
		Change \{0xf20a5276 = 0}
		if ($came_to_practice_from != main_menu)
			Change \{practice_enabled = 0}
			Change game_mode = ($came_to_practice_from)
			if NOT ($came_to_practice_from_progression = None)
				Change current_progression_flag = ($came_to_practice_from_progression)
			endif
			if NOT ($came_to_practice_character_id = emptyguy)
				setplayerinfo 1 character_id = ($came_to_practice_character_id)
			endif
			Change \{current_num_players = 1}
			gamemode_updatenumplayers \{num_players = 1}
			unload_songqpak
			destroy_band
			generic_menu_pad_back_sound
			ui_event_wait_for_safe
			SpawnScriptNow \{return_to_quickplay_from_practice}
		else
			generic_event_back
		endif
	else
		generic_menu_up_or_down_sound
		Change \{special_event_total_expense_time = 0}
		Change \{practice_start_index = -1}
		Change \{practice_end_index = -1}
		refresh_practice_special_event_timer
		Change \{0xf20a5276 = 1}
		generic_event_refresh
	endif
endscript

script return_to_quickplay_from_practice 
	create_loading_screen
	ui_print_states
	ui_event_block \{event = menu_back
		data = {
			state = Uistate_gameplay
		}}
	if ui_event_exists_in_stack \{Name = 'practice_warning'}
		ui_event_block \{event = menu_back
			data = {
				state = uistate_practice_warning
			}}
		ui_event_block \{event = menu_back
			data = {
				state = Uistate_gameplay
			}}
	endif
	generic_event_replace state = uistate_play_song no_sound data = {selected_level = ($practice_return_venue) can_change_level = 0}
endscript

script ui_select_song_section_set_times \{state = uistate_practice_select_speed}
	se_setprops \{block_events}
	GetTags
	get_song_section_array
	getmarkerarraysize array = <song_section_array>
	if (<array_Size> > 0)
		Change practice_start_time = (($<song_section_array> [<start_index>]).time)
		Change practice_start_index = <start_index>
		if ((GotParam playfullsong) || (<end_index> >= <array_Size>))
			setup_gemarrays song_name = ($current_song) difficulty = ($player1_status.difficulty) player_status = player1_status
			get_song_end_time song = ($current_song) for_practice = 1
			Change practice_end_time = <total_end_time>
			Change practice_end_index = <array_Size>
		else
			Change practice_end_time = (($<song_section_array> [<end_index>]).time - 1)
			Change practice_end_index = <end_index>
		endif
		if GotParam \{playfullsong}
			if ($special_event_stage != 0)
				getplayerinfo \{1
					part}
				formatText \{checksumName = event_num
					'special_event%d'
					d = $current_special_event_num}
				formatText \{checksumName = challenge_num
					'challenge%d'
					d = $current_special_event_challenge_num}
				formatText checksumName = songs_ar '%p_songs' p = ($part_list_props.<part>.text_nl)
				set_gray_active_markers indices = ($special_events_challenges.<event_num>.<challenge_num>.<songs_ar> [$special_event_song_index].sections)
				set_alpha_out_markers indices = ($special_events_challenges.<event_num>.<challenge_num>.<songs_ar> [$special_event_song_index].sections)
			else
				resetnongraymarkers
			endif
		else
			if ($special_event_stage != 0)
				getplayerinfo \{1
					part}
				formatText \{checksumName = event_num
					'special_event%d'
					d = $current_special_event_num}
				formatText \{checksumName = challenge_num
					'challenge%d'
					d = $current_special_event_challenge_num}
				formatText checksumName = songs_ar '%p_songs' p = ($part_list_props.<part>.text_nl)
				resetnongraymarkers
				Change \{gray_gems = 1}
				GetArraySize ($special_events_challenges.<event_num>.<challenge_num>.<songs_ar> [$special_event_song_index].sections)
				section_index = 0
				begin
				check_index = ($special_events_challenges.<event_num>.<challenge_num>.<songs_ar> [$special_event_song_index].sections [<section_index>])
				if NOT check_current_special_event_percentages section_to_check = <check_index>
					set_gray_active_markers index = <check_index>
				endif
				<section_index> = (<section_index> + 1)
				repeat <array_Size>
				set_alpha_out_markers indices = ($special_events_challenges.<event_num>.<challenge_num>.<songs_ar> [$special_event_song_index].sections)
			else
				resetnongraymarkers
			endif
		endif
		Change practice_start_time = ($practice_start_time - <lead_in>)
		Change practice_end_time = ($practice_end_time + <lead_out>)
	else
		Change \{practice_start_time = 0}
		Change \{practice_end_time = 0}
		Change \{practice_start_index = 0}
		Change \{practice_end_index = 0}
	endif
	getplayerinfo \{1
		part}
	if (<part> = vocals)
		<state> = uistate_play_song
	endif
	if (<state> = uistate_play_song)
		create_loading_screen
		Wait \{0.75
			Seconds
			ignoreslomo}
	endif
	0xaa404f44
	generic_event_choose state = <state>
endscript

script ui_select_song_section_preview \{extras = 0}
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	if NOT GotParam \{noWait}
		Wait \{0.5
			Seconds}
	endif
	if IsObjectScript
		GetTags
	endif
	get_song_end_time song = ($current_song) for_practice = 1
	Change target_practice_songpreview = ($current_song)
	Change \{target_practice_songpreview_starttime = 0}
	Change target_practice_songpreview_endtime = <total_end_time>
	get_song_section_array
	getmarkerarraysize array = <song_section_array>
	if (<array_Size> > 0)
		if (<index> > 0)
			<index> = (<index> - 1)
			end_index = (<index> + 1)
			if (<end_index> >= <array_Size>)
				RemoveParameter \{end_index}
			endif
		endif
		start_time = (($<song_section_array> [<index>]).time)
		if NOT GotParam \{end_index}
			setup_gemarrays song_name = ($current_song) difficulty = ($player1_status.difficulty) player_status = player1_status
			end_time = <total_end_time>
		else
			end_time = (($<song_section_array> [<end_index>]).time + 750)
		endif
		if (<extras> = 1)
			end_time = <total_end_time>
		endif
		Change target_practice_songpreview = ($current_song)
		Change target_practice_songpreview_starttime = <start_time>
		Change target_practice_songpreview_endtime = <end_time>
	endif
	if NOT IsObjectScript
		Change \{force_practice_songpreview_restart = 1}
		spawnscript practice_songpreview_monitor params = {extras = <extras>}
	endif
endscript
practice_start_index = 0
practice_end_index = 0
target_practice_songpreview = None
target_practice_songpreview_starttime = 0
target_practice_songpreview_endtime = 0
force_practice_songpreview_restart = 0
practice_songpreview_changing = 0
current_practice_songpreview = None
current_practice_songpreview_starttime = 0
current_practice_songpreview_endtime = 0
0xa6fc4c6e = 0

script getmarkerarraysize 
	if GlobalExists Name = <array> Type = array
		GetArraySize $<array>
		if (<array_Size> > 0)
			if ($<array> [(<array_Size> - 1)].marker = qs(0x00167369))
				return array_Size = (<array_Size> - 1)
			else
				return array_Size = <array_Size>
			endif
		else
			return array_Size = <array_Size>
		endif
	else
		return \{array_Size = 0}
	endif
endscript
in_destroy_choose_practice_section_menu = 0
0x9ce45dd2 = 0

script practice_songpreview_monitor 
	setscriptcannotpause
	playing_song = 0
	begin
	skip_wait = 0
	if NOT ($current_practice_songpreview = $target_practice_songpreview &&
			$current_practice_songpreview_starttime = $target_practice_songpreview_starttime &&
			$force_practice_songpreview_restart = 0)
		song = ($target_practice_songpreview)
		starttime = ($target_practice_songpreview_starttime)
		endtime = ($target_practice_songpreview_endtime)
		KillSpawnedScript \{Name = practice_songpreview_fadeinandrepeat}
		if (<playing_song> = 1)
			if (<extras> = 1)
				setsoundbussparams {crowdsingalong_balance = {vol = (($default_BussSet.crowdsingalong_balance.vol) - 100)} time = 0.5}
				Wait \{0.5
					Second}
			else
				setsoundbussparams {leadvox_balance = {vol = (($default_BussSet.leadvox_balance.vol) - 100)} time = 0.5}
				setsoundbussparams {drums_balance = {vol = (($default_BussSet.drums_balance.vol) - 100)} time = 0.5}
				setsoundbussparams {leadgtr_balance = {vol = (($default_BussSet.leadgtr_balance.vol) - 100)} time = 0.5}
				setsoundbussparams {bass_balance = {vol = (($default_BussSet.bass_balance.vol) - 100)} time = 0.5}
				setsoundbussparams {rhythmgtr_balance = {vol = (($default_BussSet.rhythmgtr_balance.vol) - 100)} time = 0.5}
				setsoundbussparams {crowd_balance = {vol = (($default_BussSet.crowd_balance.vol) - 100)} time = 0.5}
				setsoundbussparams {crowdsingalong_balance = {vol = (($default_BussSet.crowdsingalong_balance.vol) - 100)} time = 0.5}
				setsoundbussparams {band_Balance = {vol = (($default_BussSet.band_Balance.vol) - 100)} time = 0.5}
				Wait \{0.5
					Second}
			endif
		endif
		Change \{practice_songpreview_changing = 1}
		if ($0x9ce45dd2 = 1)
			if NOT (<song> = $current_practice_songpreview)
				printf \{qs(0x95e5f543)}
				end_song
				playing_song = 0
				Change \{0x9ce45dd2 = 0}
			endif
		endif
		if ($shutdown_game_for_signin_change_flag = 0)
			if ($0x9ce45dd2 = 0)
				printf \{qs(0x0a6f7afb)}
				preload_song song_name = <song> starttime = <starttime> fadeintime = 1.0 0x922dc314 = true
				Change \{0x9ce45dd2 = 1}
				Change \{0xa6fc4c6e = 1}
			endif
			Change current_practice_songpreview = <song>
			Change \{force_practice_songpreview_restart = 0}
			Change current_practice_songpreview_starttime = <starttime>
			Change current_practice_songpreview_endtime = <endtime>
			Change \{practice_songpreview_changing = 0}
			if ($current_practice_songpreview = $target_practice_songpreview &&
					$current_practice_songpreview_starttime = $target_practice_songpreview_starttime &&
					$force_practice_songpreview_restart = 0)
				if ($0xa6fc4c6e = 1)
					destroy_loading_screen
					Change \{0xa6fc4c6e = 0}
				endif
				if (<extras> = 1)
					setsoundbussparams {crowdsingalong_balance = {vol = (($default_BussSet.crowdsingalong_balance.vol) - 100)} time = 1}
				else
					setsoundbussparams {leadvox_balance = {vol = (($default_BussSet.leadvox_balance.vol) - 9)} time = 1}
					setsoundbussparams {drums_balance = {vol = (($default_BussSet.drums_balance.vol) - 9)} time = 1}
					setsoundbussparams {leadgtr_balance = {vol = (($default_BussSet.leadgtr_balance.vol) - 9)} time = 1}
					setsoundbussparams {bass_balance = {vol = (($default_BussSet.bass_balance.vol) - 9)} time = 1}
					setsoundbussparams {rhythmgtr_balance = {vol = (($default_BussSet.rhythmgtr_balance.vol) - 9)} time = 1}
					setsoundbussparams {crowd_balance = {vol = (($default_BussSet.crowd_balance.vol) - 100)} time = 1}
					setsoundbussparams {crowdsingalong_balance = {vol = (($default_BussSet.crowdsingalong_balance.vol) - 100)} time = 1}
					setsoundbussparams {band_Balance = {vol = (($default_BussSet.band_Balance.vol) - 9)} time = 1}
				endif
				if ($0x9ce45dd2 = 1)
					if (<playing_song> = 0)
						begin_song
						<playing_song> = 1
					endif
					SpawnScriptNow SetSeekPosition_Song params = {position = <starttime>}
					0xaa404f44
				endif
				if IsObjectScript
					obj_spawnscript \{practice_songpreview_fadeinandrepeat}
				else
					SpawnScriptNow \{practice_songpreview_fadeinandrepeat}
				endif
			else
				skip_wait = 1
			endif
		endif
	endif
	if (<skip_wait> = 0)
		Wait \{1
			gameframe}
	endif
	repeat
endscript

script practice_songpreview_fadeinandrepeat 
	wait_time = 0
	begin
	current_wait_time = (($target_practice_songpreview_endtime - $target_practice_songpreview_starttime) / 1000.0)
	if (<wait_time> > <current_wait_time>)
		break
	endif
	Wait \{0.5
		Seconds}
	wait_time = (<wait_time> + 0.5)
	repeat
	Change \{force_practice_songpreview_restart = 1}
endscript

script destroy_practice_songpreview_spawned 
	setscriptcannotpause
	unpausespawnedscript \{practice_songpreview_monitor}
	begin
	if ($practice_songpreview_changing = 0)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	KillSpawnedScript \{Name = practice_songpreview_monitor}
	KillSpawnedScript \{Name = practice_songpreview_fadeinandrepeat}
	if NOT ($current_practice_songpreview = None)
		end_song
	endif
endscript

script refresh_practice_special_event_timer 
	if ($special_event_stage != 0)
		if ($practice_start_index != -1 && $practice_end_index != -1)
			get_song_section_array
			GetArraySize $<song_section_array>
			get_song_end_time \{song = $current_song}
			if ($practice_end_index < <array_Size>)
				end_time = ($<song_section_array> [$practice_end_index].time)
			else
				end_time = <total_end_time>
			endif
			start_time = ($<song_section_array> [$practice_start_index].time)
			diff_time = (<end_time> - <start_time>)
			Change special_event_total_expense_time = <diff_time>
		endif
		expense_time = ($special_event_total_expense_time / 1000)
		<expense_time> = ($special_event_last_time_stored - <expense_time>)
		if (<expense_time> < 0)
			<expense_time> = 0
		endif
		if ScreenElementExists \{id = header_time}
			format_time_from_seconds time = <expense_time>
			time_text = (qs(0xf5a7c0d1) + <time_formatted>)
			SetScreenElementProps id = header_time text = <time_text>
			GetScreenElementDims \{id = header_time}
			SetScreenElementProps id = time_remaining_bg dims = (<width> * (1.0, 0.0) + (15.0, 55.0))
		endif
	endif
endscript

script 0xaa404f44 
	begin
	if NOT ScriptIsRunning \{SetSeekPosition_Song}
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript
