intro_sequence_props = {
	song_title_pos = (255.0, 75.0)
	performed_by_pos = (255.0, 135.0)
	song_artist_pos = (255.0, 150.0)
	song_title_start_time = -6500
	song_title_fade_time = 550
	song_title_on_time = 1650
	highway_start_time = -2000
	highway_move_time = 2000
	button_ripple_start_time = -800
	button_ripple_per_button_time = 100
	hud_start_time = -400
	hud_move_time = 200
}
fastintro_sequence_props = {
	song_title_pos = (255.0, 75.0)
	performed_by_pos = (255.0, 135.0)
	song_artist_pos = (255.0, 150.0)
	song_title_start_time = -6700
	song_title_fade_time = 550
	song_title_on_time = 1650
	highway_start_time = -2000
	highway_move_time = 2000
	button_ripple_start_time = -800
	button_ripple_per_button_time = 100
	hud_start_time = -400
	hud_move_time = 200
}
practice_sequence_props = {
	song_title_pos = (255.0, 75.0)
	performed_by_pos = (255.0, 135.0)
	song_artist_pos = (255.0, 150.0)
	song_title_start_time = -6500
	song_title_fade_time = 550
	song_title_on_time = 1650
	highway_start_time = -4000
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
	killspawnedscript \{name = Loading_Screen_Crowd_Swell}
	killspawnedscript \{name = Crowd_Loading_Whistle}
	printstruct <...>
	start_drummer_cameras
	GetNumPlayersInGame \{on_screen}
	killspawnedscript \{name = GuitarEvent_SongFailed_Spawned}
	if GotParam \{FAST}
		Change \{current_intro = $fastintro_sequence_props}
	elseif GotParam \{practice}
		Change \{current_intro = $practice_sequence_props}
	else
		Change \{current_intro = $intro_sequence_props}
	endif
	show_song_info = 1
	if ($g_in_tutorial = 1)
		show_song_info = 0
	endif
	GameMode_GetType
	if ($calibrate_lag_enabled = 1)
		show_song_info = 0
	endif
	if (<show_song_info> = 1)
		spawnscriptnow \{intro_song_info
			id = intro_scripts}
	endif
	intro_check_for_celeb_intro_ui
	if NOT ($Cheat_PerformanceMode = 1 && $is_network_game = 0)
		spawnscriptnow \{intro_highway_move
			id = intro_highway_scripts}
	endif
	if (<num_players_shown> > 0)
		GetFirstPlayer \{on_screen}
		begin
		spawnscriptnow intro_buttonup_ripple params = <...> id = intro_scripts
		GetNextPlayer on_screen player = <player>
		repeat <num_players_shown>
	endif
	if (($tutorial_disable_hud = 0) && ($end_credits = 0))
		spawnscriptnow \{intro_hud_move
			id = intro_hud_scripts}
	endif
	BandManager_SetPlayingIntroAnims
endscript

script destroy_intro 
	killspawnedscript \{id = intro_scripts}
	killspawnedscript \{id = intro_highway_scripts}
	killspawnedscript \{id = intro_hud_scripts}
	killspawnedscript \{name = Song_Intro_Kick_SFX_Waiting}
	killspawnedscript \{name = Song_Intro_Highway_Up_SFX_Waiting}
	killspawnedscript \{name = move_highway_2d}
	killspawnedscript \{name = intro_buttonup_ripple}
	killspawnedscript \{name = intro_hud_move}
	DestroyScreenElement \{id = intro_container}
	GetNumPlayersInGame
	if (<num_players> > 0)
		GetFirstPlayer
		begin
		GetPlayerInfo <player> controller
		EnableInput controller = <controller>
		GetNextPlayer player = <player>
		repeat <num_players>
	endif
endscript

script intro_buttonup_ripple 
	GetPlayerInfo <player> controller
	EnableInput off controller = <controller>
	begin
	GetSongTimeMs
	if ($current_intro.button_ripple_start_time + $current_starttime < <time>)
		break
	endif
	wait \{1
		gameframe}
	repeat
	if ($current_intro.button_ripple_per_button_time = 0)
		EnableInput controller = <controller>
		return
	endif
	GameMode_GetType
	if (<type> = freeplay)
		if PlayerInfoEquals <player> freeplay_state = dropped
			EnableInput controller = <controller>
			return
		endif
	endif
	GetArraySize \{$gem_colors}
	all_vocals = 1
	GetNumPlayersInGame
	if (<num_players> > 0)
		GetFirstPlayer \{out = i}
		begin
		if PlayerInfoEquals <i> part = vocals
			all_vocals = 0
			break
		endif
		GetNextPlayer player = <i> out = i
		repeat <num_players>
	endif
	spawnscriptnow Highway_ripple_ui_sfx params = {<...>}
	spawnscriptnow \{After_Loading_Screen_Crowd_Setting}
	ExtendCrcPlayer button_up_pixel_array <player> out = pixel_array
	buttonup_count = 0
	begin
	wait ($current_intro.button_ripple_per_button_time / 1000.0) seconds
	array_count = 0
	begin
	Color = ($gem_colors [<array_count>])
	if (<array_count> = <buttonup_count>)
		SetArrayElement arrayName = <pixel_array> GlobalArray index = <array_count> newValue = $button_up_pixels
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
	buttonup_count = (<buttonup_count> + 1)
	repeat (<array_size> + 1)
	EnableInput controller = <controller>
endscript

script intro_song_info 
	begin
	GetSongTimeMs
	if ($current_intro.song_title_start_time + $current_starttime < <time>)
		break
	endif
	wait \{1
		gameframe}
	repeat
	if ($current_intro.song_title_on_time = 0)
		return
	endif
	GMan_SongTool_GetCurrentSong
	get_song_title song = <current_song>
	get_song_artist_text song = <current_song>
	get_song_artist song = <current_song>
	get_song_original_artist song = <current_song>
	if (<current_song> = jamsession)
		year = 2008
		if ui_event_exists_in_stack \{name = 'songlist'}
			GMan_SongFunc \{func = get_current_song_jam_index}
			GetArraySize ($jam_curr_directory_listing) param = directory_size
			if (<current_song_jam_index> > 0 && <current_song_jam_index> < <directory_size>)
				<year> = ($jam_curr_directory_listing [<current_song_jam_index>].year)
			endif
		elseif ui_event_exists_in_stack \{name = 'jam'}
			jam_struct = ($jamsession_songlist_props.jamsession)
			year = (<jam_struct>.year_num)
		endif
		if NOT GotParam \{song_artist}
			get_savegame_from_controller controller = ($primary_controller)
			song_artist = qs(0x98b69c18)
			if GotParam \{name}
				if (<name> != qs(0x03ac90f0))
					song_artist = <name>
				endif
			endif
			FormatText TextName = year_text qs(0x06d54ab3) d = <year>
			song_artist = (<song_artist> + <year_text>)
		endif
	endif
	if (<original_artist> = 1)
		CreateScreenElement {
			parent = root_window
			id = intro_container
			type = DescInterface
			desc = 'song_intro'
			alpha = 0
			intro_info_stacker_alpha = 1
			intro_cover_info_stacker_alpha = 0
			z_priority = 500
			intro_artist_text = <song_artist>
			intro_title_text = <song_title>
			intro_performed_text = <song_artist_text>
		}
	else
		get_cover_artist_text song = <current_song>
		get_covered_by_text song = <current_song>
		CreateScreenElement {
			parent = root_window
			id = intro_container
			type = DescInterface
			desc = 'song_intro'
			alpha = 0
			intro_info_stacker_alpha = 0
			intro_cover_info_stacker_alpha = 1
			z_priority = 500
			intro_artist_text = <song_artist>
			intro_title_text = <song_title>
			intro_performed_text = <song_artist_text>
			cover_intro_performed_text = <covered_by_text>
			cover_intro_artist_text = <cover_artist_text>
		}
	endif
	intro_container :SE_SetProps alpha = 1 time = ($current_intro.song_title_fade_time / 1000.0)
	intro_container :SE_WaitProps
	wait ($current_intro.song_title_on_time / 1000.0) seconds
	intro_container :SE_SetProps alpha = 0 time = ($current_intro.song_title_fade_time / 1000.0)
	intro_container :SE_WaitProps
	DestroyScreenElement \{id = intro_container}
endscript

script intro_highway_move 
	GameMode_GetType
	killspawnedscript \{name = OneShotsBetweenSongs}
	killspawnedscript \{name = SurgeBetweenSongs}
	begin
	GetSongTimeMs
	if ($current_intro.highway_start_time + $current_starttime < <time>)
		break
	endif
	wait \{1
		gameframe}
	repeat
	all_vocals = 1
	all_instrument = 1
	highway_up_sfx = guitar
	GetNumPlayersInGame
	if (<num_players> > 0)
		GetFirstPlayer
		begin
		skip_player = false
		if (<type> = freeplay)
			if PlayerInfoEquals <player> freeplay_state = dropped
				skip_player = true
			endif
		endif
		if (<skip_player> = false)
			if NOT PlayerInfoEquals <player> part = vocals
				all_vocals = 0
			else
				all_instrument = 0
			endif
		endif
		GetNextPlayer player = <player>
		repeat <num_players>
		if ((<all_vocals> = 0) && (<all_instrument> = 0))
			highway_up_sfx = both
		elseif (<all_vocals> = 0)
			highway_up_sfx = guitar
		elseif (<all_instrument> = 0)
			highway_up_sfx = vocal
		endif
	endif
	if ScriptExists \{Crowd_Swells_During_Stats_Screen}
		killspawnedscript \{name = Crowd_Swells_During_Stats_Screen}
	endif
	if IsSoundEventPlaying \{Surge_During_Stats_Screen}
		StopSoundEvent \{Surge_During_Stats_Screen
			fade_time = 1.5
			fade_type = linear}
	endif
	play_vocal_highway_sfx = 0
	switch <highway_up_sfx>
		case guitar
		spawnscriptnow \{Song_Intro_Highway_Up_SFX_Waiting}
		play_vocal_highway_sfx = 0
		case vocal
		play_vocal_highway_sfx = 1
		case both
		spawnscriptnow \{Song_Intro_Highway_Up_SFX_Waiting}
		play_vocal_highway_sfx = 1
		default
		printf \{channel = sfx
			qs(0x97b59f58)}
	endswitch
	GetNumPlayersInGame \{on_screen}
	if (<num_players_shown> > 0)
		GetFirstPlayer \{on_screen}
		begin
		skip_player = false
		if (<type> = freeplay)
			if PlayerInfoEquals <player> freeplay_state = dropped
				skip_player = true
			endif
		endif
		if (<skip_player> = false)
			spawnscriptnow vocals_highway_slide_in params = {delay = 90 player = <player> play_vocal_highway_sfx = <play_vocal_highway_sfx>}
		endif
		GetNextPlayer on_screen player = <player>
		repeat <num_players_shown>
	endif
	move_highway_camera_to_default
endscript

script intro_hud_move 
	begin
	GetSongTimeMs
	if ($current_intro.hud_start_time + $current_starttime < <time>)
		break
	endif
	wait \{1
		gameframe}
	repeat
	GetNumPlayersInGame \{on_screen}
	if (<num_players_shown> > 0)
		GetFirstPlayer \{on_screen}
		begin
		move_hud_to_default time = ($current_intro.hud_move_time / 1000.0)
		GetNextPlayer on_screen player = <player>
		repeat <num_players_shown>
	endif
	all_vocals = 1
	GetNumPlayersInGame
	if (<num_players> > 0)
		GetFirstPlayer
		begin
		if NOT PlayerInfoEquals <player> part = vocals
			all_vocals = 0
			break
		endif
		GetNextPlayer player = <player>
		repeat <num_players>
	endif
	spawnscriptnow \{Song_Intro_Kick_SFX_Waiting}
endscript

script intro_check_for_celeb_intro_ui 
	Transition_GetPrefix type = ($current_playing_transition)
	if (<celeb_intro> = 1)
		spawnscriptnow intro_celeb_ui params = {celeb_intro = <type_textnl>}
	endif
endscript

script intro_celeb_ui 
	OnExitRun \{cleanup_intro_celeb}
	switch <celeb_intro>
		case intro_levine
		<start_delay> = 5.1019998
		<Duration> = 3.0
		case intro_nodoubtAward
		<start_delay> = 4.0
		<Duration> = 5.0
		case intro_swiftCPark
		<start_delay> = 5.6
		<Duration> = 3.0
		default
		<start_delay> = 2.0
		<Duration> = 4.0
	endswitch
	wait <start_delay> seconds
	CreateScreenElement \{type = ContainerElement
		id = celeb_intro_ui_cont
		parent = root_window
		Pos = (0.0, 0.0)
		z_priority = 100}
	SetSearchAllAssetContexts
	CreateScreenElement \{parent = celeb_intro_ui_cont
		id = celeb_intro_ui
		type = DescInterface
		desc = 'celeb_intro'}
	celeb_intro_ui :SE_SetProps {
		FirstName_text = <FirstName>
	}
	if celeb_intro_ui :Desc_ResolveAlias \{name = alias_bling_anim}
		<resolved_id> :Obj_SpawnScript anim_bling_box
	endif
	SetSearchAllAssetContexts \{off}
	celeb_intro_ui :Desc_ResolveAlias \{name = alias_frame_anim}
	AssignAlias id = <resolved_id> alias = frame_anim
	frame_anim :SE_GetProps \{Pos}
	<frame_anim_pos> = <Pos>
	frame_anim :SE_SetProps \{Pos = (0.0, 300.0)}
	frame_anim :SE_WaitProps
	frame_anim :SE_SetProps \{Pos = (0.0, -60.0)
		time = 0.2
		motion = ease_in}
	frame_anim :SE_WaitProps
	frame_anim :SE_SetProps \{Pos = (0.0, 80.0)
		time = 0.2
		motion = ease_in}
	<time_between_bounces> = 0.5
	wait (<Duration> - <time_between_bounces>) seconds
	frame_anim :SE_WaitProps
	frame_anim :SE_SetProps \{Pos = (0.0, 80.0)}
	frame_anim :SE_WaitProps
	frame_anim :SE_SetProps \{Pos = (0.0, -20.0)
		time = 0.2
		motion = ease_in}
	frame_anim :SE_WaitProps
	frame_anim :SE_SetProps \{Pos = (0.0, 300.0)
		time = 0.1
		motion = ease_in}
	frame_anim :SE_WaitProps
	frame_anim :SE_SetProps \{alpha = 0
		time = 0.1}
	DestroyScreenElement \{id = celeb_intro_ui_cont}
endscript

script cleanup_intro_celeb 
	if ScreenElementExists \{id = celeb_intro_ui_cont}
		DestroyScreenElement \{id = celeb_intro_ui_cont}
	endif
endscript

script intro_celeb_ui_bounce 
	if celeb_intro_ui :Desc_ResolveAlias \{name = alias_frame_container
			param = celeb_frame_add_id}
		<celeb_frame_add_id> :Obj_SpawnScript ui_shakey params = {Pos = (637.0, 415.0)}
	else
		ScriptAssert \{'pdetrich'}
	endif
	if celeb_intro_ui :Desc_ResolveAlias \{name = alias_frame_container
			param = celeb_frame_add_id}
		<celeb_frame_add_id> :Obj_SpawnScript ui_shakey params = {Pos = (637.0, 415.0)}
	else
		ScriptAssert \{'pdetrich'}
	endif
endscript

script kill_intro_celeb_ui 
	if ScriptIsRunning \{intro_celeb_ui}
		if ScreenElementExists \{id = celeb_intro_ui_cont}
			DestroyScreenElement \{id = celeb_intro_ui_cont}
		endif
		killspawnedscript \{name = intro_celeb_ui}
	endif
endscript
