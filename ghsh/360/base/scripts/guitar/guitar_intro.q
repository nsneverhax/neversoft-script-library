intro_sequence_props = {
	song_title_pos = (255.0, 75.0)
	performed_by_pos = (255.0, 135.0)
	song_artist_pos = (255.0, 150.0)
	song_title_start_time = -6500
	song_title_fade_time = 700
	song_title_on_time = 3000
	highway_start_time = -2000
	highway_move_time = 2000
	button_ripple_start_time = -800
	button_ripple_per_button_time = 100
	hud_start_time = 0
	hud_move_time = 200
}
fastintro_sequence_props = {
	song_title_pos = (255.0, 75.0)
	performed_by_pos = (255.0, 135.0)
	song_artist_pos = (255.0, 150.0)
	song_title_start_time = -6700
	song_title_fade_time = 700
	song_title_on_time = 3000
	highway_start_time = -2000
	highway_move_time = 2000
	button_ripple_start_time = -800
	button_ripple_per_button_time = 100
	hud_start_time = 0
	hud_move_time = 200
}
practice_sequence_props = {
	song_title_pos = (255.0, 75.0)
	performed_by_pos = (255.0, 135.0)
	song_artist_pos = (255.0, 150.0)
	song_title_start_time = -6500
	song_title_fade_time = 700
	song_title_on_time = 3000
	highway_start_time = -3000
	highway_move_time = 2000
	button_ripple_start_time = -1800
	button_ripple_per_button_time = 100
	hud_start_time = -1400
	hud_move_time = 200
}
immediate_sequence_props = {
	song_title_pos = (255.0, 75.0)
	performed_by_pos = (255.0, 135.0)
	song_artist_pos = (255.0, 150.0)
	song_title_start_time = 0
	song_title_fade_time = 700
	song_title_on_time = 0
	highway_start_time = 0
	highway_move_time = 0
	button_ripple_start_time = 0
	button_ripple_per_button_time = 0
	hud_start_time = 0
	hud_move_time = 0
}
current_intro = $fast_intro_sequence_props

script play_intro 
	calculate_clapping_lag
	KillSpawnedScript \{Name = loading_screen_crowd_swell}
	KillSpawnedScript \{Name = crowd_loading_whistle}
	printstruct <...>
	start_drummer_cameras
	gamemode_getnumplayersshown
	if ($show_boss_helper_screen = 1)
		Player = 1
		begin
		formatText checksumName = player_status 'player%i_status' i = <Player>
		EnableInput OFF controller = ($<player_status>.controller)
		Player = (<Player> + 1)
		repeat <num_players_shown>
		intro_check_for_celeb_intro_ui
		return
	endif
	if ($is_attract_mode = 1)
		disable_bg_viewport
		return
	endif
	if ScreenElementExists \{id = metallifacts_container}
		disable_bg_viewport
		return
	endif
	KillSpawnedScript \{Name = GuitarEvent_SongFailed_Spawned}
	if GotParam \{FAST}
		Change \{current_intro = $fastintro_sequence_props}
	elseif GotParam \{practice}
		Change \{current_intro = $practice_sequence_props}
	else
		Change \{current_intro = $intro_sequence_props}
	endif
	if ($g_in_tutorial = 0)
		SpawnScriptNow \{intro_song_info
			id = intro_scripts}
	endif
	intro_check_for_celeb_intro_ui
	if NOT ($Cheat_PerformanceMode = 1 && $is_network_game = 0)
		SpawnScriptNow \{intro_highway_move
			id = intro_scripts}
	endif
	Player = 1
	begin
	formatText checksumName = player_status 'player%i_status' i = <Player>
	formatText TextName = player_text 'p%i' i = <Player>
	SpawnScriptNow intro_buttonup_ripple params = <...> id = intro_scripts
	Player = (<Player> + 1)
	repeat <num_players_shown>
	if (($tutorial_disable_hud = 0) && ($end_credits = 0))
		SpawnScriptNow \{intro_hud_move
			id = intro_scripts}
	endif
	bandmanager_setplayingintroanims
endscript

script destroy_intro 
	KillSpawnedScript \{id = intro_scripts}
	KillSpawnedScript \{Name = Song_Intro_Kick_SFX_Waiting}
	KillSpawnedScript \{Name = Song_Intro_Highway_Up_SFX_Waiting}
	KillSpawnedScript \{Name = move_highway_2d}
	KillSpawnedScript \{Name = intro_buttonup_ripple}
	KillSpawnedScript \{Name = intro_hud_move}
	DestroyScreenElement \{id = intro_container}
	Player = 1
	begin
	formatText checksumName = player_status 'player%i_status' i = <Player> AddToStringLookup
	EnableInput controller = ($<player_status>.controller)
	Player = (<Player> + 1)
	repeat $current_num_players
endscript

script intro_buttonup_ripple 
	EnableInput OFF controller = ($<player_status>.controller)
	begin
	GetSongTimeMs
	if ($current_intro.button_ripple_start_time + $current_starttime < <time>)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if ($current_intro.button_ripple_per_button_time = 0)
		EnableInput controller = ($<player_status>.controller)
		return
	endif
	GetArraySize \{$gem_colors}
	all_vocals = 1
	Player = 1
	begin
	formatText checksumName = current_player_status 'player%i_status' i = <Player> AddToStringLookup
	if NOT ($<current_player_status>.part = vocals)
		all_vocals = 0
		break
	endif
	Player = (<Player> + 1)
	repeat $current_num_players
	if (<all_vocals> = 0)
		SoundEvent \{event = Notes_Ripple_Up_SFX}
	endif
	ExtendCrc button_up_pixel_array ($<player_status>.text) out = pixel_array
	buttonup_count = 0
	begin
	Wait ($current_intro.button_ripple_per_button_time / 1000.0) Seconds
	array_count = 0
	begin
	Color = ($gem_colors [<array_count>])
	if (<array_count> = <buttonup_count>)
		SetArrayElement ArrayName = <pixel_array> globalarray index = <array_count> NewValue = $button_up_pixels
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	buttonup_count = (<buttonup_count> + 1)
	repeat (<array_Size> + 1)
	EnableInput controller = ($<player_status>.controller)
endscript

script intro_song_info 
	begin
	GetSongTimeMs
	if ($current_intro.song_title_start_time + $current_starttime < <time>)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if ($current_intro.song_title_on_time = 0)
		return
	endif
	if ($transition_playing = true)
		if ($current_playing_transition = careerintro)
			return
		endif
	endif
	get_song_title song = ($current_song)
	get_song_artist_text song = ($current_song)
	get_song_artist song = ($current_song)
	if ($current_song = jamsession)
		year = 2008
		if ui_event_exists_in_stack \{Name = 'setlist'}
			jam_directory_index = ($temp_jamsession_song_list [($quickplay_song_list_current)])
			GetArraySize ($jam_curr_directory_listing) param = directory_size
			if (<jam_directory_index> > 0 && <jam_directory_index> < <directory_size>)
				<year> = ($jam_curr_directory_listing [<jam_directory_index>].year)
			endif
		elseif ui_event_exists_in_stack \{Name = 'jam'}
			jam_struct = ($jamsession_songlist_props.jamsession)
			year = (<jam_struct>.year_num)
		endif
		if NOT GotParam \{song_artist}
			get_savegame_from_controller controller = ($primary_controller)
			get_current_band_info
			GetGlobalTags savegame = <savegame> <band_info>
			song_artist = qs(0x98b69c18)
			if GotParam \{Name}
				if (<Name> != qs(0x03ac90f0))
					song_artist = <Name>
				endif
			endif
			formatText TextName = year_text qs(0x06d54ab3) d = <year>
			song_artist = (<song_artist> + <year_text>)
		endif
	endif
	CreateScreenElement {
		parent = root_window
		id = intro_container
		Type = descinterface
		desc = 'song_intro'
		alpha = 0
		z_priority = 500
		intro_artist_text = <song_artist>
		intro_title_text = <song_title>
		intro_performed_text = <song_artist_text>
	}
	intro_container :se_setprops alpha = 1 time = ($current_intro.song_title_fade_time / 1000.0)
	intro_container :se_waitprops
	Wait ($current_intro.song_title_on_time / 1000.0) Seconds
	intro_container :se_setprops alpha = 0 time = ($current_intro.song_title_fade_time / 1000.0)
	intro_container :se_waitprops
	DestroyScreenElement \{id = intro_container}
endscript

script intro_highway_move 
	KillSpawnedScript \{Name = oneshotsbetweensongs}
	KillSpawnedScript \{Name = surgebetweensongs}
	begin
	GetSongTimeMs
	if ($current_intro.highway_start_time + $current_starttime < <time>)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	all_vocals = 1
	Player = 1
	begin
	formatText checksumName = player_status 'player%i_status' i = <Player> AddToStringLookup
	if NOT ($<player_status>.part = vocals)
		all_vocals = 0
		break
	endif
	Player = (<Player> + 1)
	repeat $current_num_players
	if (<all_vocals> = 0)
		SpawnScriptNow \{Song_Intro_Highway_Up_SFX_Waiting}
	else
		SpawnScriptNow \{song_intro_highway_up_vocals_sfx_waiting}
	endif
	gamemode_getnumplayersshown
	Player = 1
	begin
	formatText checksumName = player_status 'player%i_status' i = <Player> AddToStringLookup
	formatText TextName = player_text 'p%i' i = <Player> AddToStringLookup
	SpawnScriptNow vocals_highway_slide_in params = {delay = 150 Player = <Player>}
	move_highway_camera_to_default <...> time = ($current_intro.highway_move_time / 1000.0)
	Player = (<Player> + 1)
	repeat <num_players_shown>
endscript

script intro_hud_move 
	begin
	GetSongTimeMs
	if ($current_intro.hud_start_time + $current_starttime < <time>)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	gamemode_getnumplayersshown
	Player = 1
	begin
	formatText checksumName = player_status 'player%i_status' i = <Player> AddToStringLookup
	formatText TextName = player_text 'p%i' i = <Player> AddToStringLookup
	move_hud_to_default time = ($current_intro.hud_move_time / 1000.0)
	Player = (<Player> + 1)
	repeat <num_players_shown>
	if ($game_mode = p2_battle && $battle_do_or_die = 1)
		restore_saved_powerups
	endif
	all_vocals = 1
	Player = 1
	begin
	formatText checksumName = player_status 'player%i_status' i = <Player> AddToStringLookup
	if NOT ($<player_status>.part = vocals)
		all_vocals = 0
		break
	endif
	Player = (<Player> + 1)
	repeat $current_num_players
	SpawnScriptNow \{Song_Intro_Kick_SFX_Waiting}
endscript

script intro_check_for_celeb_intro_ui 
	transition_getprefix Type = ($current_playing_transition)
	if (<celeb_intro> = 1)
		SpawnScriptNow intro_celeb_ui params = {celeb_intro = <type_textnl>}
	endif
endscript

script intro_celeb_ui 
	switch ($current_playing_transition)
		case intro_lemmy
		<start_delay> = 2.0
		<Duration> = 4.0
		case intro_kingdiamond
		<start_delay> = 2.0
		<Duration> = 4.0
		default
		ScriptAssert qs(0x58b8b629) s = ($current_playing_transition)
	endswitch
	formatText TextName = desc 'celeb_%c' c = <celeb_intro>
	Wait <start_delay> Seconds
	CreateScreenElement \{Type = ContainerElement
		id = celeb_intro_ui_cont
		parent = root_window
		Pos = (0.0, 0.0)
		z_priority = 100}
	SetSearchAllAssetContexts
	CreateScreenElement {
		parent = celeb_intro_ui_cont
		id = celeb_intro_ui
		Type = descinterface
		desc = <desc>
	}
	SetSearchAllAssetContexts \{OFF}
	celeb_intro_ui :desc_resolvealias \{Name = alias_celeb_intro_banner}
	AssignAlias id = <resolved_id> alias = celeb_intro_banner
	celeb_intro_banner :se_setprops \{alpha = 0.0}
	celeb_intro_banner :se_getprops \{Pos}
	<banner_pos> = <Pos>
	celeb_intro_ui :desc_resolvealias \{Name = alias_celeb_intro_alltherest}
	AssignAlias id = <resolved_id> alias = celeb_intro_alltherest
	celeb_intro_alltherest :se_setprops \{alpha = 0.0}
	celeb_intro_alltherest :se_getprops \{Pos}
	<alltherest_pos> = <Pos>
	<time_between_bounces> = 0.1
	celeb_intro_banner :Obj_SpawnScriptNow intro_celeb_ui_bounce params = {id = celeb_intro_banner starting_pos = <banner_pos>}
	Wait <time_between_bounces> Seconds
	celeb_intro_alltherest :Obj_SpawnScriptNow intro_celeb_ui_bounce params = {id = celeb_intro_alltherest starting_pos = <alltherest_pos>}
	Wait (<Duration> - <time_between_bounces>) Seconds
	SoundEvent \{event = boss_logo_second_part}
	<zoom_out_time> = 0.04
	celeb_intro_alltherest :se_setprops Scale = 3.0 alpha = 0.0 Pos = (<alltherest_pos> + (0.0, 300.0)) time = <zoom_out_time>
	Wait \{0.1
		Seconds}
	celeb_intro_banner :se_setprops Scale = 3.0 alpha = 0.0 Pos = (<banner_pos> + (0.0, 300.0)) time = <zoom_out_time>
	celeb_intro_banner :se_waitprops
	DestroyScreenElement \{id = celeb_intro_ui_cont}
endscript

script intro_celeb_ui_bounce 
	<zoom_in_time> = 0.05
	<first_bounce_time> = 0.02
	<settle_in_time> = 0.01
	<id> :se_setprops Scale = 3.0 Pos = (<starting_pos> + (0.0, 200.0))
	<id> :se_setprops Scale = 0.8 alpha = 1.0 Pos = (<starting_pos>) motion = ease_in time = <zoom_in_time>
	<id> :se_waitprops
	<id> :se_setprops Scale = 0.9 Pos = (<starting_pos> + (0.0, 5.0)) moion = ease_out time = <first_bounce_time>
	<id> :se_waitprops
	<id> :se_setprops Scale = 0.8 Pos = (<starting_pos>) motion = ease_in time = <settle_in_time>
endscript

script kill_intro_celeb_ui 
	if ScriptIsRunning \{wait_and_show_boss_helper_after_intro}
		KillSpawnedScript \{Name = wait_and_show_boss_helper_after_intro}
	endif
	if ScriptIsRunning \{intro_celeb_ui}
		if ScreenElementExists \{id = celeb_intro_ui_cont}
			DestroyScreenElement \{id = celeb_intro_ui_cont}
		endif
		KillSpawnedScript \{Name = intro_celeb_ui}
	endif
endscript
