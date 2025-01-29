venues_requiring_visualizer = [
	z_cube
	z_visualizer
]
movie_viewport_created = 0

script create_movie_viewport 
	if ($movie_viewport_created = 0)
		if NOT musicstudio_mainobj :musicstudio_isinmusicstudio
			GetPakManCurrent \{map = zones}
			if (<pak> = z_cube)
				create_visualizer
			elseif (<pak> = z_visualizer)
				enable_fullscreen_visualizer
			endif
		endif
		Change \{movie_viewport_created = 1}
	endif
endscript

script destroy_movie_viewport 
	if ($movie_viewport_created = 1)
		if NOT musicstudio_mainobj :musicstudio_isinmusicstudio
			GetPakManCurrent \{map = zones}
			if (<pak> = z_cube)
				destroy_visualizer
			elseif (<pak> = z_visualizer)
				disable_fullscreen_visualizer
			endif
		endif
		Change \{movie_viewport_created = 0}
	endif
endscript

script create_visualizer_fx 
	GetPakManCurrent \{map = zones}
	if (<pak> = z_cube)
		mode = cube
		width = 512
		height = 512
	else
		mode = fullscreen
		width = 0
		height = 0
	endif
	if screenFX_FXInstanceExists viewport = <viewport> Name = av_test0
		ScreenFX_ClearFXInstances {viewport = <viewport> mode = <mode>}
	endif
	Wait \{1
		gameframe}
	ScreenFX_AddFXInstance {
		viewport = <viewport>
		Name = av_test0
		scefName = av_test0
		Type = audiovisualize
		On = 1
		primitives = $blank_preset
		mode = <mode>
		width = <width>
		height = <height>
	}
endscript
blank_preset = [
]
visualizer_viewport_params = {
	viewport = visualizer_viewport
	textureassets = [
		`tex\zones\z_cube\transwithalpha_01.png`
	]
	style = visualizer_rendering
	Name = visualizer_cam
}
current_visualizer = None
current_visualizer_2d = true

script create_visualizer 
	GetPakManCurrent \{map = zones}
	if NOT ArrayContains array = ($venues_requiring_visualizer) contains = <pak>
		destroy_visualizer
		return
	endif
	Change \{visualizer_events_enabled = true}
	visualizer = visualizer_viewport_params
	if NOT GlobalExists Name = <visualizer>
		return
	endif
	GetPakManCurrentName \{map = zones}
	formatText checksumName = fx_func 'create_visualizer_fx_2D_%s' s = <pakname>
	if ScriptExists <fx_func>
		<fx_func> viewport = bg_viewport
		Change current_visualizer = $<visualizer>
		Change \{current_visualizer_2d = true}
		return
	endif
	AddParams ($<visualizer>)
	formatText checksumName = texdict 'zones/%s/%t.tex' s = <pakname> t = <pakname>
	textureasset = (<textureassets> [0])
	Change current_visualizer = $<visualizer>
	Change \{current_visualizer_2d = FALSE}
	createviewport {
		Priority = 20
		id = <viewport>
		style = <style>
		use_lod_shader = true
		framerate = 60
		framemask = 3
	}
	formatText checksumName = fx_func 'create_visualizer_fx_%s' s = <pakname>
	if ScriptExists <fx_func>
		<fx_func> <...>
	else
		create_visualizer_fx <...>
	endif
	if (<pak> = z_cube)
		printf \{qs(0xe77df91d)}
		SetSearchAllAssetContexts
		CreateViewportTextureOverride {
			id = <viewport>
			viewportid = <viewport>
			texture = <textureasset>
			texdict = <texdict>
		}
		SetSearchAllAssetContexts \{OFF}
	endif
endscript

script destroy_visualizer 
	printf \{qs(0xee9d3d60)}
	visualizer = $current_visualizer
	if (<visualizer> = None)
		return
	endif
	GetPakManCurrent \{map = zones}
	if (<pak> = z_cube)
		mode = cube
	else
		mode = fullscreen
	endif
	if ($current_visualizer_2d = FALSE)
		AddParams (<visualizer>)
		KillCamAnim Name = <Name>
		if screenFX_FXInstanceExists viewport = <viewport> Name = av_test0
			ScreenFX_ClearFXInstances {viewport = <viewport> mode = <mode>}
		endif
		SetSearchAllAssetContexts
		DestroyViewportTextureOverride id = <viewport>
		SetSearchAllAssetContexts \{OFF}
		DestroyViewport id = <viewport>
	else
		viewport = bg_viewport
		if screenFX_FXInstanceExists viewport = <viewport> Name = av_test0
			ScreenFX_ClearFXInstances {viewport = <viewport> mode = <mode>}
		endif
	endif
	Change \{current_visualizer = None}
endscript
visualizer_current_bank = None

script select_visualizer_bank 
	Change \{visualizer_current_bank = None}
	playlist_getcurrentsong
	get_song_struct song = <current_song>
	if StructureContains structure = <song_struct> Name = genre
		genre = (<song_struct>.genre)
	else
		genre = rock
	endif
	bank_choices = []
	include_globals = true
	GetPakManCurrentName \{map = zones}
	formatText checksumName = venue_banks '%s_visualizer_banks' s = <pakname> AddToStringLookup = true
	if GlobalExists Name = <venue_banks> Type = structure
		if StructureContains structure = $<venue_banks> Name = include_global_banks
			include_globals = ($<venue_banks>.include_global_banks)
		endif
		if StructureContains structure = $<venue_banks> Name = <genre>
			bank_array = ($<venue_banks>.<genre>)
			GetArraySize <bank_array>
			if (<array_Size> > 0)
				index = 0
				begin
				next_choice = (<bank_array> [<index>])
				if NOT ArrayContains array = <bank_choices> contains = <next_choice>
					AddArrayElement array = <bank_choices> element = <next_choice>
					bank_choices = <array>
				endif
				index = (<index> + 1)
				repeat <array_Size>
			endif
		else
			include_globals = true
		endif
	else
	endif
	if (<include_globals> = true)
		if GlobalExists \{Name = global_visualizer_banks
				Type = structure}
			if StructureContains structure = $global_visualizer_banks Name = <genre>
				bank_array = ($global_visualizer_banks.<genre>)
			else
				bank_array = ($global_visualizer_banks.rock)
			endif
			GetArraySize <bank_array>
			if (<array_Size> > 0)
				index = 0
				begin
				next_choice = (<bank_array> [<index>])
				if NOT ArrayContains array = <bank_choices> contains = <next_choice>
					AddArrayElement array = <bank_choices> element = <next_choice>
					bank_choices = <array>
				endif
				index = (<index> + 1)
				repeat <array_Size>
			endif
		endif
	else
	endif
	GetArraySize <bank_choices>
	if (<array_Size> > 0)
		GetRandomValue Name = index integer a = 0 b = (<array_Size> -1)
		Change visualizer_current_bank = (<bank_choices> [<index>])
		GetPakManCurrent \{map = zones}
		if ArrayContains array = ($venues_requiring_visualizer) contains = <pak>
			visualizer_load_bank bank = ($visualizer_current_bank) Heap = quota_misc
		endif
	else
		ScriptAssert qs(0x946656bc) a = <genre> b = <pakname>
	endif
endscript
visualizer_events_enabled = true

script visualizer_event 
	if ($visualizer_events_enabled = FALSE)
		return
	endif
	if ($visualizer_current_bank = None)
		return
	endif
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_visualizer
		viewport = bg_viewport
		default
		viewport = visualizer_viewport
	endswitch
	if NOT ViewportExists id = <viewport>
		return
	endif
	if NOT GlobalExists \{Name = $visualizer_current_bank
			Type = structure}
		printf \{channel = visualizer
			qs(0xfe945df2)
			a = $visualizer_current_bank}
		return
	endif
	LightShow_GetParams
	current_bank = $visualizer_current_bank
	printf \{channel = visualizer
		qs(0xb59760e3)
		a = $visualizer_current_bank}
	printf 'mood = %a' a = <mood> channel = visualizer
	av_presets = ($<current_bank>.<mood>)
	if GotParam \{av_presets}
		GetArraySize <av_presets>
		i = RandomInteger (-1.0, 1.0)
		begin
		<i> = (<i> + 1)
		if (<i> >= <array_Size>)
			<i> = 0
		endif
		if IsArray (<av_presets> [<i>])
			create_avfx primitives = (<av_presets> [<i>]) viewport = <viewport>
		else
			create_avfx Profile = (<av_presets> [<i>]) viewport = <viewport>
		endif
		LightShow_WaitForNextEvent \{events = [
				snapshotchange
			]}
		repeat
	else
		printf qs(0xc93be3cb) a = <mood> b = $visualizer_current_bank donoresolve
	endif
endscript
current_bandname_viewport = None

script destroy_bandname_viewport 
endscript

script PauseFullScreenMovie 
	if IsMoviePlaying \{textureSlot = 0}
		PauseMovie \{textureSlot = 0}
	endif
endscript

script UnPauseFullScreenMovie 
	if IsMoviePlaying \{textureSlot = 0}
		ResumeMovie \{textureSlot = 0}
	endif
endscript
g_skip_remaining_movies = 0

script PlayMovieAndWait \{movie = 0x69696969
		hide_glitch_frames = 10}
	Change \{g_skip_remaining_movies = 0}
	menu_music_was_playing = $g_menu_music_on_flag
	audio_ui_menu_music_off
	if NotCD
		if ($show_movies = 0)
			return
		endif
	endif
	setscriptcannotpause
	halt_wii_notifications
	push_disable_wii_invites_menu
	destroy_wii_invites_menu
	pushunsafeforshutdown \{context = movie
		Type = checked}
	if NOT GotParam \{noblack}
		fadetoblack \{On
			time = 0
			alpha = 1.0
			z_priority = -10}
	endif
	hide_glitch num_frames = <hide_glitch_frames>
	setmovievi
	printf channel = clayton qs(0x23871deb) s = <movie>
	PlayMovie {
		textureSlot = 0
		TexturePri = 1000
		no_looping
		no_hold
		highpriority = true
		<...>
	}
	Wait \{2
		gameframes}
	if GotParam \{noskip}
		event_handlers = []
	else
		end_movie_params = {skip_remaining_movies play_back_sfx = 1}
		if InNetGame
			event_handlers = [
				{pad_start netendmovie params = <end_movie_params>}
				{pad_choose netendmovie params = <end_movie_params>}
			]
		else
			event_handlers = [
				{pad_start endmovie params = <end_movie_params>}
				{pad_choose endmovie params = <end_movie_params>}
			]
		endif
	endif
	CreateScreenElement {
		Type = ContainerElement
		parent = root_window
		id = movie_handler
		event_handlers = <event_handlers>
	}
	LaunchEvent \{Type = focus
		target = movie_handler}
	if NOT GotParam \{no_script_wait}
		waitformovie movie = <movie> hide_glitch_frames = <hide_glitch_frames> menu_music_was_playing = <menu_music_was_playing>
	endif
endscript

script waitformovie \{movie = 0x69696969
		hide_glitch_frames = 10}
	setscriptcannotpause
	begin
	if NOT IsMoviePlaying \{textureSlot = 0}
		break
	endif
	Wait \{1
		gameframes}
	repeat
	if (<hide_glitch_frames> > 0)
		hide_glitch num_frames = <hide_glitch_frames>
	endif
	endmovie
	begin
	if NOT ScreenElementExists \{id = movie_handler}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	resetmovievi
	audio_ui_menu_music_on
	if NOT GotParam \{noblack}
		printf channel = clayton qs(0x27e8073d) s = <movie>
		fadetoblack \{OFF
			time = 0}
	endif
	allow_wii_notifications
	pop_disable_wii_invites_menu
	popunsafeforshutdown \{context = movie
		Type = checked}
endscript

script waitformovie_endcredits 
	begin
	if NOT IsMoviePlaying \{textureSlot = 0}
		break
	endif
	if ($paused_for_hardware = 1)
		PauseFullScreenMovie
		begin
		if ($paused_for_hardware = 0)
			UnPauseFullScreenMovie
			break
		endif
		Wait \{1
			gameframes}
		repeat
	endif
	Wait \{1
		gameframes}
	repeat
	endmovie
	begin
	if NOT ScreenElementExists \{id = movie_handler}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	audio_ui_menu_music_on
	if NOT GotParam \{noblack}
		printf qs(0x27e8073d) s = <movie>
		fadetoblack \{OFF
			time = 0}
	endif
	allow_wii_notifications
	pop_disable_wii_invites_menu
	popunsafeforshutdown \{context = movie
		Type = checked}
endscript

script netendmovie 
	if InNetGame
		if IsHost
			SendStructure \{callback = endmovie
				data_to_send = {
					None
				}}
			endmovie <...>
		endif
	endif
endscript

script endmovie \{slot = 0
		play_back_sfx = 0}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if ScreenElementExists \{id = movie_handler}
		LaunchEvent \{Type = unfocus
			target = movie_handler}
	endif
	finalprintf \{'EndMovie called'}
	if IsMoviePlaying textureSlot = <slot>
		if (<play_back_sfx> = 1)
			ui_sfx \{menustate = Generic
				uitype = back}
		endif
		finalprintf \{'EndMovie calling KillMovie'}
		KillMovie textureSlot = <slot> <...>
		finalprintf \{'EndMovie done KillMovie'}
	endif
	if ScreenElementExists \{id = movie_handler}
		movie_handler :Die
	endif
endscript

script create_avfx 
	if NOT ViewportExists id = <viewport>
		return
	endif
	if GotParam \{Profile}
		if StructureContains structure = <Profile> primitives
			primitives = (<Profile>.primitives)
		else
			ScriptAssert \{'UNABLE TO FIND PRIMITIVES'}
		endif
	endif
	GetPakManCurrent \{map = zones}
	if (<pak> = z_cube)
		mode = cube
		width = 512
		height = 512
	else
		mode = fullscreen
		width = 0
		height = 0
	endif
	if NOT screenFX_FXInstanceExists viewport = <viewport> Name = av_test0
		ScreenFX_AddFXInstance viewport = <viewport> Name = av_test0 Type = audiovisualize On = 1 primitives = <primitives> mode = <mode> width = <width> height = <height>
	else
		ScreenFX_UpdateFXInstanceParams viewport = <viewport> Name = av_test0 Type = audiovisualize On = 1 primitives = <primitives> mode = <mode> width = <width> height = <height>
	endif
endscript
