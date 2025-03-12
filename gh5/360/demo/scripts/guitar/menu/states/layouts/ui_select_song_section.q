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
song_section_preview_ready = 1

script ui_create_select_song_section \{from_in_game = 0}
	if gotparam \{data}
		if structurecontains structure = <data> from_in_game
			from_in_game = (<data>.from_in_game)
		endif
	endif
	pad_back_script = ui_select_song_section_back
	disable_pause
	if (<from_in_game> = 1)
		startrendering
	else
		unpausegame
	endif
	if NOT ($game_mode = practice)
		if (<from_in_game> = 0)
			change \{came_to_practice_from = main_menu}
		endif
	endif
	gamemode_updatenumplayers \{num_players = 1}
	menu_music_off
	change \{current_speedfactor = 1.0}
	createscreenelement {
		parent = root_window
		type = descinterface
		id = songsectiondesc
		desc = 'select_song_section_desc'
		tags = {monitor_spawned = 0 from_in_game = <from_in_game>}
		z_priority = 10000
	}
	if songsectiondesc :desc_resolvealias \{name = alias_menu_bg_add
			param = practice_menu_bg_id}
		<practice_menu_bg_id> :obj_spawnscript ui_shakey
	else
		scriptassert \{'pdetrich'}
	endif
	if songsectiondesc :desc_resolvealias \{name = alias_menu_bg_add
			param = practice_menu_bg_id}
		<practice_menu_bg_id> :obj_spawnscript ui_frazzmatazz
	else
		scriptassert \{'pdetrich'}
	endif
	change \{song_section_preview_ready = 0}
	songsectiondesc :obj_spawnscript \{ui_select_song_section_wait_for_preview}
	focus2_script = ui_select_song_section_preview
	spawnsongpreview = 0
	if songsectiondesc :desc_resolvealias \{name = alias_menu}
		assignalias id = <resolved_id> alias = current_menu
		current_menu :se_setprops {
			allow_wrap = false
			exclusive_device = ($primary_controller)
			event_handlers = [
				{pad_up ui_select_song_section_play_sound params = {up}}
				{pad_down ui_select_song_section_play_sound params = {down}}
				{pad_back <pad_back_script>}
			]
			tags = {
				start_index = -1
				end_index = -1
				max_entries = 0
			}
		}
		createscreenelement {
			parent = current_menu
			type = descinterface
			desc = 'select_song_section_item_desc'
			autosizedims = false
			dims = (600.0, 40.0)
			section_text = qs(0xe1f4baaf)
			section_rgba = $default_section_rgba
			event_handlers = [
				{focus ui_select_song_section_focus_item}
				{focus <focus2_script>}
				{unfocus ui_select_song_section_unfocus_item}
				{pad_choose ui_select_song_section_choose_item params = {from_in_game = <from_in_game>}}
			]
			tags = {playfullsong index = 0 focus_index = 0 strikeout_alpha = 0 default_rgba = $default_section_rgba}
		}
		get_song_section_array
		getarraysize <song_section_array>
		marker_array_size = <array_size>
		getfirstplayer
		getplayerinfo <player> part
		if (<marker_array_size> > 0)
			i = 1
			focus_idx = 1
			begin
			shortenuistring {
				ui_string = ((<song_section_array> [(<i> - 1)]).marker)
				max_len = 50
			}
			if (<short_ui_string> != qs(0x00167369))
				<section_rgba> = $default_section_rgba
				if (<part> = vocals)
					if localizedstringequals a = <short_ui_string> b = $vocal_marker_freeform
						<section_rgba> = $vocal_marker_freeform_rgba
					endif
				endif
				if (<short_ui_string> = qs(0x03ac90f0))
					short_ui_string = qs(0x4db2ad32)
					section_rgba = [64 64 255 255]
				endif
				createscreenelement {
					parent = current_menu
					type = descinterface
					desc = 'select_song_section_item_desc'
					autosizedims = false
					dims = (600.0, 40.0)
					section_text = <short_ui_string>
					section_rgba = <section_rgba>
					event_handlers = [
						{focus ui_select_song_section_focus_item}
						{focus <focus2_script>}
						{unfocus ui_select_song_section_unfocus_item}
						{pad_choose ui_select_song_section_choose_item params = {from_in_game = <from_in_game>}}
					]
					tags = {
						index = <i>
						focus_index = <focus_idx>
						default_rgba = <section_rgba>
					}
				}
				focus_idx = (<focus_idx> + 1)
			endif
			i = (<i> + 1)
			repeat <marker_array_size>
		endif
		current_menu :settags max_entries = <focus_idx>
	endif
	if gotparam \{selected_index}
		getscreenelementchildren \{id = current_menu}
		getarraysize <children>
		ratio = (<selected_index> / (<marker_array_size> - 1.0))
		scroll_pos = ((358.0, -194.0) + ((0.0, 184.0) * <ratio>))
		songsectiondesc :se_setprops scroll_thumb_pos = <scroll_pos> time = <time>
	endif
	songsectiondesc :obj_spawnscript \{ui_select_song_section_preview
		params = {
			index = 0
			nowait
		}}
	menu_finish <menu_finish_params>
	current_menu :settags \{lead_in = 0}
	current_menu :settags \{lead_out = 0}
	ui_select_song_section_setup_helpers
endscript

script ui_select_song_section_setup_helpers 
	songsectiondesc :gettags
	current_menu :gettags
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green}
	gamemode_gettype
	if (<type> != career)
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red}
	endif
endscript

script ui_select_song_section_play_sound 
	current_menu :gettags
	if gotparam \{up}
		if ($g_sss_highlighted_index - 1 >= 0)
			change g_sss_highlighted_index = ($g_sss_highlighted_index - 1)
			generic_menu_up_or_down_sound \{up}
		endif
	else
		if ($g_sss_highlighted_index + 1 < <max_entries>)
			change g_sss_highlighted_index = ($g_sss_highlighted_index + 1)
			generic_menu_up_or_down_sound \{down}
		endif
	endif
endscript

script ui_destroy_select_song_section 
	spawnscriptnow \{destroy_practice_songpreview_spawned
		params = {
			unloadsong
		}}
	destroyscreenelement \{id = songsectiondesc}
	setsoundbussparams {vocals_balance = {vol = ($default_bussset.vocals_balance.vol)}}
	setsoundbussparams {drums_balance = {vol = ($default_bussset.drums_balance.vol)}}
	setsoundbussparams {guitar_balance = {vol = ($default_bussset.guitar_balance.vol)}}
	setsoundbussparams {bass_balance = {vol = ($default_bussset.bass_balance.vol)}}
	setsoundbussparams {rhythmgtr_balance = {vol = ($default_bussset.rhythmgtr_balance.vol)}}
	setsoundbussparams {crowd_balance = {vol = ($default_bussset.crowd_balance.vol)}}
	setsoundbussparams {crowdsingalong_balance = {vol = ($default_bussset.crowdsingalong_balance.vol)}}
	setsoundbussparams {band_balance = {vol = ($default_bussset.band_balance.vol)}}
	clean_up_user_control_helpers
endscript

script ui_deinit_select_song_section 
endscript

script ui_select_song_section_focus_item \{time = 0.1}
	current_menu :gettags
	gettags
	my_strikeout_texture = <strikeout_texture>
	my_strikeout_alpha = <strikeout_alpha>
	highlight_alpha = 1.0
	strikeout_alpha = 0
	getscreenelementchildren \{id = current_menu}
	getarraysize <children>
	children_array_size = <array_size>
	if NOT (<start_index> = -1)
		i = <start_index>
		begin
		if resolvescreenelementid id = {current_menu child = <i>}
			<resolved_id> :getsingletag strikeout_texture
			<resolved_id> :getsingletag strikeout_alpha
			<resolved_id> :getsingletag default_rgba
			if ((<i> >= <start_index>) && (<i> <= <focus_index>))
				if (<i> = <start_index>)
					<resolved_id> :se_setprops {
						section_rgba = $default_section_focus_rgba
						highlight_rgba = [255 , 255 , 255 , 220]
						highlight_alpha = <highlight_alpha>
						strikeout_texture = <strikeout_texture>
						strikeout_alpha = <strikeout_alpha>
					}
				elseif NOT (<i> = <focus_index>)
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
	if (<children_array_size> > 1)
		ratio = (<focus_index> / (<children_array_size> - 1.0))
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
	getsingletag \{default_rgba}
	se_setprops section_rgba = <default_rgba> highlight_alpha = 0.0 time = 0.1
endscript

script ui_select_song_section_choose_item 
	se_setprops \{block_events}
	current_menu :gettags
	gettags
	if gotparam \{playfullsong}
		current_menu :settags \{start_index = 0}
		current_menu :settags \{lead_in = 0}
		current_menu :settags \{lead_out = 0}
		current_menu :obj_spawnscript ui_select_song_section_set_times params = {playfullsong from_in_game = <from_in_game>}
		return
	endif
	if (<start_index> = -1)
		generic_menu_up_or_down_sound
		current_menu :settags start_index = <focus_index>
		change practice_start_index = <focus_index>
		current_menu :settags start_index = <focus_index>
	else
		current_menu :settags start_index = (<start_index> - 1)
		current_menu :settags end_index = <index>
		current_menu :obj_spawnscript ui_select_song_section_set_times params = {from_in_game = <from_in_game>}
	endif
	songsectiondesc :se_setprops \{message_text = qs(0x3da2472b)}
	getscreenelementchildren \{id = current_menu}
	getarraysize <children>
	songsectiondesc :se_setprops \{practice_head2_text = qs(0x3da2472b)}
	i = 0
	begin
	if (<i> >= <focus_index>)
		break
	endif
	curr_item = (<children> [<i>])
	<curr_item> :se_setprops not_focusable
	i = (<i> + 1)
	repeat <array_size>
	ui_select_song_section_setup_helpers
	se_setprops \{unblock_events}
endscript

script ui_select_song_section_back 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	se_setprops \{block_events}
	current_menu :gettags
	songsectiondesc :gettags
	if ui_event_exists_in_stack \{name = 'song_breakdown'}
		from_in_game = 0
	endif
	if (<start_index> = -1)
		if (<from_in_game> = 1)
			gamemode_gettype
			if (<type> != career)
				se_setprops \{block_events}
				generic_menu_pad_choose_sound
				if NOT ui_event_exists_in_stack \{name = 'select_practice_difficulty'}
					create_loading_screen
				endif
				songunload
				destroy_practice_songpreview_spawned
				if ui_event_exists_in_stack \{name = 'select_practice_difficulty'}
					generic_event_back \{state = uistate_select_practice_difficulty}
				else
					gamemode_gettype
					if (<type> = practice)
						practice_restart_song
					else
						change \{gameplay_restart_song = 1}
						generic_event_back \{state = uistate_gameplay}
					endif
				endif
			endif
		else
			generic_menu_pad_back_sound
			songunload
			songaudioplayerdeinit
			destroy_practice_songpreview_spawned
			generic_event_back \{nosound}
		endif
	else
		songunload
		songaudioplayerdeinit
		generic_menu_up_or_down_sound
		change \{practice_start_index = -1}
		change \{practice_end_index = -1}
		generic_event_refresh
	endif
	se_setprops \{unblock_events}
endscript

script return_to_quickplay_from_practice 
	reset_practice_mode
	change \{gameplay_restart_song = 1}
	generic_event_back \{state = uistate_gameplay}
endscript

script ui_select_song_section_set_times \{state = uistate_practice_select_speed}
	se_setprops \{block_events}
	gettags
	kill_practice_scripts
	getfirstplayer
	practice_kill_gem_scroller player = <player>
	get_song_section_array
	getarraysize <song_section_array>
	if (<array_size> > 0)
		change practice_start_time = ((<song_section_array> [<start_index>]).time)
		change practice_start_index = <start_index>
		if ((gotparam playfullsong) || (<end_index> >= <array_size>))
			getfirstplayer
			getplayerinfo <player> difficulty
			gman_songtool_getcurrentsong
			setup_gemarrays song_name = <current_song> difficulty = <difficulty> player = 1
			songfilemanager func = get_song_end_time song_name = <current_song>
			change practice_end_time = <total_end_time>
			change practice_end_index = <array_size>
		else
			change practice_end_time = ((<song_section_array> [<end_index>]).time - 1)
			change practice_end_index = <end_index>
		endif
		resetnongraymarkers
		change practice_start_time = ($practice_start_time - <lead_in>)
		change practice_end_time = ($practice_end_time + <lead_out>)
	else
		change \{practice_start_time = 0}
		change \{practice_end_time = 0}
		change \{practice_start_index = 0}
		change \{practice_end_index = 0}
	endif
	songunload
	generic_menu_pad_choose_sound
	destroy_practice_songpreview_spawned
	getfirstplayer
	getplayerinfo <player> part
	if (<part> = vocals)
		ui_event \{event = menu_change
			state = uistate_practice_select_looping}
	else
		ui_event event = menu_change state = <state>
	endif
endscript

script ui_select_song_section_wait_for_preview 
	change \{song_section_preview_ready = 0}
	if scriptisrunning \{practice_songpreview_monitor}
		unpausespawnedscript \{practice_songpreview_monitor}
		begin
		if ($practice_songpreview_changing = 0)
			break
		endif
		wait \{1
			gameframe}
		repeat
		killspawnedscript \{name = practice_songpreview_monitor}
		killspawnedscript \{name = practice_songpreview_fadeinandrepeat}
		if NOT ($current_practice_songpreview = none)
			end_song
			songunload
			change \{current_practice_songpreview = none}
		endif
	endif
	change \{song_section_preview_ready = 1}
endscript

script ui_select_song_section_preview 
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	if NOT gotparam \{nowait}
		wait \{0.5
			seconds}
	endif
	if isobjectscript
		gettags
	endif
	begin
	if ($song_section_preview_ready = 1)
		break
	endif
	wait \{1
		gameframe}
	repeat
	get_song_section_array
	getarraysize <song_section_array>
	if (<array_size> > 0)
		if (<index> > 0)
			<index> = (<index> - 1)
			end_index = (<index> + 1)
			if (<end_index> >= <array_size>)
				removeparameter \{end_index}
			endif
		endif
		start_time = ((<song_section_array> [<index>]).time)
		gman_songtool_getcurrentsong
		if NOT gotparam \{end_index}
			getfirstplayer
			getplayerinfo <player> difficulty
			setup_gemarrays song_name = <current_song> difficulty = <difficulty> player = 1
			songfilemanager func = get_song_end_time song_name = <current_song>
			end_time = <total_end_time>
		else
			end_time = ((<song_section_array> [<end_index>]).time + 750)
		endif
		change target_practice_songpreview = <current_song>
		change target_practice_songpreview_starttime = <start_time>
		change target_practice_songpreview_endtime = <end_time>
	endif
	songsectiondesc :gettags
	if (<monitor_spawned> = 0)
		change \{force_practice_songpreview_restart = 1}
		spawnscript \{practice_songpreview_monitor}
		songsectiondesc :settags \{monitor_spawned = 1}
	endif
endscript
practice_start_index = 0
practice_end_index = 0
target_practice_songpreview = none
target_practice_songpreview_starttime = 0
target_practice_songpreview_endtime = 0
force_practice_songpreview_restart = 0
practice_songpreview_changing = 0
current_practice_songpreview = none
current_practice_songpreview_starttime = 0
current_practice_songpreview_endtime = 0

script getmarkerarraysize 
	marker_size = 0
	marker_index = 0
	if globalexists name = <array> type = array
		getarraysize $<array>
	else
		getarraysize <array>
	endif
	if (<array_size> > 0)
		begin
		if globalexists name = <array> type = array
			marker = ($<array> [<marker_index>].marker)
		else
			marker = (<array> [<marker_index>].marker)
		endif
		if (<marker> != qs(0x00167369))
			marker_size = (<marker_size> + 1)
		endif
		marker_index = (<marker_index> + 1)
		repeat <array_size>
	endif
	return array_size = <marker_size>
endscript
in_destroy_choose_practice_section_menu = 0

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
		killspawnedscript \{name = practice_songpreview_fadeinandrepeat}
		if (<playing_song> = 1)
			setsoundbussparams {vocals_balance = {vol = (($default_bussset.vocals_balance.vol) - 100)} time = 0.5}
			setsoundbussparams {drums_balance = {vol = (($default_bussset.drums_balance.vol) - 100)} time = 0.5}
			setsoundbussparams {guitar_balance = {vol = (($default_bussset.guitar_balance.vol) - 100)} time = 0.5}
			setsoundbussparams {bass_balance = {vol = (($default_bussset.bass_balance.vol) - 100)} time = 0.5}
			setsoundbussparams {rhythmgtr_balance = {vol = (($default_bussset.rhythmgtr_balance.vol) - 100)} time = 0.5}
			setsoundbussparams {crowd_balance = {vol = (($default_bussset.crowd_balance.vol) - 100)} time = 0.5}
			setsoundbussparams {crowdsingalong_balance = {vol = (($default_bussset.crowdsingalong_balance.vol) - 100)} time = 0.5}
			setsoundbussparams {band_balance = {vol = (($default_bussset.band_balance.vol) - 100)} time = 0.5}
			wait \{0.5
				second}
		else
			setsoundbussparams {vocals_balance = {vol = (($default_bussset.vocals_balance.vol) - 100)} time = 0}
			setsoundbussparams {drums_balance = {vol = (($default_bussset.drums_balance.vol) - 100)} time = 0}
			setsoundbussparams {guitar_balance = {vol = (($default_bussset.guitar_balance.vol) - 100)} time = 0}
			setsoundbussparams {bass_balance = {vol = (($default_bussset.bass_balance.vol) - 100)} time = 0}
			setsoundbussparams {rhythmgtr_balance = {vol = (($default_bussset.rhythmgtr_balance.vol) - 100)} time = 0}
			setsoundbussparams {crowd_balance = {vol = (($default_bussset.crowd_balance.vol) - 100)} time = 0}
			setsoundbussparams {crowdsingalong_balance = {vol = (($default_bussset.crowdsingalong_balance.vol) - 100)} time = 0}
			setsoundbussparams {band_balance = {vol = (($default_bussset.band_balance.vol) - 100)} time = 0}
		endif
		change \{practice_songpreview_changing = 1}
		end_song
		playing_song = 0
		if ($shutdown_game_for_signin_change_flag = 0)
			deinitsongaudiosystem
			initsongaudiosystem
			preload_song song_name = <song> starttime = <starttime> fadeintime = 1.0
			change current_practice_songpreview = <song>
			change \{force_practice_songpreview_restart = 0}
			change current_practice_songpreview_starttime = <starttime>
			change current_practice_songpreview_endtime = <endtime>
			change \{practice_songpreview_changing = 0}
			if ($current_practice_songpreview = $target_practice_songpreview &&
					$current_practice_songpreview_starttime = $target_practice_songpreview_starttime &&
					$force_practice_songpreview_restart = 0)
				setsoundbussparams {vocals_balance = {vol = (($default_bussset.vocals_balance.vol) - 7)} time = 0.5}
				setsoundbussparams {drums_balance = {vol = (($default_bussset.drums_balance.vol) - 7)} time = 0.5}
				setsoundbussparams {guitar_balance = {vol = (($default_bussset.guitar_balance.vol) - 7)} time = 0.5}
				setsoundbussparams {bass_balance = {vol = (($default_bussset.bass_balance.vol) - 7)} time = 0.5}
				setsoundbussparams {rhythmgtr_balance = {vol = (($default_bussset.rhythmgtr_balance.vol) - 7)} time = 0.5}
				setsoundbussparams {crowd_balance = {vol = (($default_bussset.crowd_balance.vol) - 100)} time = 0.5}
				setsoundbussparams {crowdsingalong_balance = {vol = (($default_bussset.crowdsingalong_balance.vol) - 100)} time = 0.5}
				setsoundbussparams {band_balance = {vol = (($default_bussset.band_balance.vol) - 7)} time = 0.5}
				begin_song
				playing_song = 1
				if isobjectscript
					obj_spawnscript \{practice_songpreview_fadeinandrepeat}
				else
					spawnscriptnow \{practice_songpreview_fadeinandrepeat}
				endif
			else
				skip_wait = 1
			endif
		endif
	endif
	if (<skip_wait> = 0)
		wait \{1
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
	wait \{0.5
		seconds}
	wait_time = (<wait_time> + 0.5)
	repeat
	change \{force_practice_songpreview_restart = 1}
endscript

script destroy_practice_songpreview_spawned 
	setscriptcannotpause
	if gotparam \{unloadsong}
		songunload
	endif
	killspawnedscript \{name = ui_select_song_section_preview}
	if scriptisrunning \{practice_songpreview_monitor}
		unpausespawnedscript \{practice_songpreview_monitor}
		begin
		if ($practice_songpreview_changing = 0)
			break
		endif
		wait \{1
			gameframe}
		repeat
		killspawnedscript \{name = practice_songpreview_monitor}
		killspawnedscript \{name = practice_songpreview_fadeinandrepeat}
		if NOT ($current_practice_songpreview = none)
			end_song
			change \{current_practice_songpreview = none}
		endif
	endif
endscript
