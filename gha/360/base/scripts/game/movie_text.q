
script playsubtitledmovie 
	if NOT GotParam \{subbedmovie}
		printf \{"PlaySubtitledMovie: Requires the SubbedMovie param, see movie_text.q for an example of the structure."
			channel = UI}
		return
	endif
	if ScreenElementExists \{id = play_subtitled_movie_container}
		printf \{"PlaySubtitledMovie: Script is already running, call KillSubtitledMovie first."
			channel = UI}
		return
	endif
	if NOT (StructureContains structure = subbedmovie Name = movie_params)
		printf \{"PlaySubtitledMovie: Script Requires the SubbedMovie param to contain a movie_params."
			channel = UI}
		return
	endif
	if NOT (StructureContains structure = subbedmovie Name = events)
		printf \{"PlaySubtitledMovie: Script Requires the SubbedMovie param to contain an array of event."
			channel = UI}
		return
	endif
	<container_params> = {}
	<helper_params> = {}
	<skip_helper_params> = {}
	<exit_param> = {}
	if (StructureContains structure = subbedmovie Name = container_params)
		<container_params> = (<subbedmovie>.container_params)
	endif
	if (StructureContains structure = subbedmovie Name = helper_params)
		<helper_params> = (<subbedmovie>.helper_params)
	endif
	if (StructureContains structure = subbedmovie Name = skip_helper_params)
		<skip_helper_params> = (<subbedmovie>.skip_helper_params)
	endif
	if (StructureContains structure = subbedmovie Name = exit_Script)
		<exit_params> = {exit_Script = (<subbedmovie>.exit_Script)}
		if (StructureContains structure = subbedmovie Name = exit_script_params)
			<exit_params> = {<exit_params> exit_script_params = (<subbedmovie>.exit_script_params)}
		endif
	endif
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = play_subtitled_movie_main_container
		dims = (1280.0, 702.0)
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	if NOT (StructureContains structure = subbedmovie Name = no_skip)
		SetScreenElementProps {
			id = play_subtitled_movie_main_container
			event_handlers = [
				{pad_back nullscript}
				{pad_choose killsubtitledmovie params = {<exit_params>}}
			]
		}
		CreateScreenElement {
			rgba = [128 128 128 255]
			text = "skip movie \\m0"
			just = [right center]
			Pos = (1150.0, 620.0)
			alpha = 1.0
			Scale = (0.8, 0.8)
			<skip_helper_params>
			Type = TextElement
			parent = play_subtitled_movie_main_container
			id = play_subtitled_skip_helper
			font = text_a1
			z_priority = 1010
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
		}
	endif
	LaunchEvent \{Type = focus
		target = play_subtitled_movie_main_container}
	CreateScreenElement {
		<container_params>
		Type = ContainerElement
		parent = play_subtitled_movie_main_container
		id = play_subtitled_movie_container
	}
	printf \{"PlaySubtitledMovie: Container Element has been created."
		channel = UI}
	CreateScreenElement {
		text = "press \\m1 to continue"
		just = [center center]
		alpha = 0.0
		Scale = (0.8, 0.8)
		<helper_params>
		Type = TextElement
		parent = play_subtitled_movie_container
		id = play_subtitled_movie_helper
		font = text_a1
		z_priority = 1010
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	printf \{"PlaySubtitledMovie: Helper Text Element has been created."
		channel = UI}
	<default_create_element> = {}
	<default_fade_in_params> = {}
	<default_fade_out_params> = {}
	if (StructureContains structure = subbedmovie Name = default_create_element)
		<default_create_element> = (<subbedmovie>.default_create_element)
	endif
	if (StructureContains structure = subbedmovie Name = default_fade_in_params)
		<default_fade_in_params> = (<subbedmovie>.default_fade_in_params)
	endif
	if (StructureContains structure = subbedmovie Name = default_fade_out_params)
		<default_fade_out_params> = (<subbedmovie>.default_fade_out_params)
	endif
	PushSoundBussParams
	if (StructureContains structure = subbedmovie Name = no_music)
		EnableUserMusic \{disable}
		setsoundbussparams \{$no_music_at_all_bussset
			time = 0.3}
	endif
	printf \{"PlaySubtitledMovie: Launching SubtitleMovie..."
		channel = UI}
	RunScriptOnScreenElement id = play_subtitled_movie_container subtitlemovie params = {
		movie_params = (<subbedmovie>.movie_params)
		events = (<subbedmovie>.events)
		default_create_element = <default_create_element>
		default_fade_in_params = <default_fade_in_params>
		default_fade_out_params = <default_fade_out_params>
		exit_params = <exit_params>
	}
endscript

script killsubtitledmovie \{exit_Script = nullscript
		exit_params = {
		}}
	SpawnScriptNow <exit_Script> params = <exit_params>
	if ScreenElementExists \{id = play_subtitled_movie_main_container}
		EnableUserMusic
		PopSoundBussParams
		DestroyScreenElement \{id = play_subtitled_movie_main_container}
		LaunchEvent \{broadcast
			Type = subtitled_movie_killed}
		printf \{"KillSubtitledMovie: Subtitled movie has been destroyed."
			channel = UI}
	else
		printf \{"KillSubtitledMovie: There is no subtitled movie playing."
			channel = UI}
	endif
endscript

script subtitlemovie_presstocontinue 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	LaunchEvent \{broadcast
		Type = movie_text_press_to_continue}
endscript

script subtitlemovie 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	printf \{"SubtitleMovie: Script has spawned."
		channel = UI}
	killallmovies \{blocking}
	<movie> = (<movie_params>.movie)
	if (StructureContains structure = movie_params Name = movie_ps3)
		if isps3
			<movie> = (<movie_params>.movie_ps3)
			if (StructureContains structure = movie_params Name = movie_ps3x)
				GetEnterButtonAssignment
				if (<assignment> = circle)
					<movie> = (<movie_params>.movie_ps3x)
				endif
			endif
		endif
	endif
	CreateScreenElement {
		Scale = (1280.0, 720.0)
		<movie_params>
		movie = <movie>
		Type = movieelement
		parent = play_subtitled_movie_container
		id = play_subtitled_movie
		textureSlot = 0
		z_priority = 1000
		start_frame = (<movie_params>.start_frame)
		loop_start = (<movie_params>.start_frame)
		loop_end = (<movie_params>.end_frame)
	}
	RemoveParameter \{movie}
	RemoveParameter \{movie_params}
	Wait \{1
		gameframes}
	begin
	if (IsMoviePlaying textureSlot = 0)
		printf \{"SubtitleMovie: Movie element has started playing."
			channel = UI}
		break
	endif
	Wait \{1
		gameframes}
	repeat
	GetNextArrayElement <events>
	begin
	if NOT GotParam \{element}
		printf \{"SubtitleMovie: All events have completed, breaking out of loop."
			channel = UI}
		break
	endif
	if NOT IsMoviePlaying \{textureSlot = 0}
		printf \{"SubtitleMovie: WARNING: Move unexpectedly ended, breaking out."
			channel = UI}
		killsubtitledmovie <exit_params>
		return
	endif
	getmovieframe \{textureSlot = 0}
	printf "SubtitleMovie: Current Movie Element Frame: %f" f = <Frame> channel = UI
	if (<Frame> >= (<element>.Frame))
		printf "SubtitleMovie: Current Event Frame: %f" f = (<element>.Frame) channel = UI
		if (StructureContains structure = element Name = destroy_element)
			if GotParam \{curr_element}
				<fade_out_params> = {}
				if (StructureContains structure = element Name = fade_out_params)
					<fade_out_params> = (<element>.fade_out_params)
				endif
				RunScriptOnScreenElement id = <curr_element> destroysubtitledmovieelement params = {
					default_fade_out_params = <default_fade_out_params>
					fade_out_params = <fade_out_params>
				}
				RemoveParameter \{curr_element}
			endif
		endif
		if (StructureContains structure = element Name = create_element)
			if GotParam \{curr_element}
				RunScriptOnScreenElement id = <curr_element> destroysubtitledmovieelement
			endif
			<create_element> = (<element>.create_element)
			if (StructureContains structure = element Name = create_element_ps3)
				if isps3
					<create_element> = (<element>.create_element_ps3)
				endif
			endif
			CreateScreenElement {
				<default_create_element>
				<create_element>
				parent = play_subtitled_movie_container
				z_priority = 1005
			}
			RemoveParameter \{create_element}
			printf \{"SubtitleMovie: Element has been created."
				channel = UI}
			<curr_element> = <id>
			if (StructureContains structure = element Name = fade_in_params)
				DoScreenElementMorph {
					<default_fade_in_params>
					(<element>.fade_in_params)
					id = <curr_element>
				}
			endif
		endif
		if (StructureContains structure = element Name = event_script)
			event_script_params = {}
			if (StructureContains structure = element Name = event_script_params)
				event_script_params = (<element>.event_script_params)
			endif
			RunScriptOnScreenElement id = play_subtitled_movie_container (<element>.event_script) params = <event_script_params>
		endif
		if (StructureContains structure = element Name = wait_for_input)
			PauseMovie \{textureSlot = 0}
			printf \{"SubtitleMovie: Movie element has paused playback."
				channel = UI}
			DoScreenElementMorph \{id = play_subtitled_movie_helper
				alpha = 1.0
				time = 0.5}
			SetScreenElementProps \{id = play_subtitled_movie_main_container
				event_handlers = [
					{
						pad_back
						subtitlemovie_presstocontinue
					}
				]
				replace_handlers}
			Block \{Type = movie_text_press_to_continue}
			printf \{"SubtitleMovie: Input has been recieved."
				channel = UI}
			DoScreenElementMorph \{id = play_subtitled_movie_helper
				alpha = 0.0
				time = 0.5}
			SetScreenElementProps \{id = play_subtitled_movie_main_container
				event_handlers = [
					{
						pad_back
						nullscript
					}
				]
				replace_handlers}
			ResumeMovie \{textureSlot = 0}
			printf \{"SubtitleMovie: Movie element has resumed playback."
				channel = UI}
		endif
		if (StructureContains structure = element Name = wait_time)
			PauseMovie \{textureSlot = 0}
			printf \{"SubtitleMovie: Movie element has paused playback."
				channel = UI}
			Wait (<element>.wait_time) Seconds ignoreslomo
			printf "SubtitleMovie: Movie element has waited %s seconds." s = (<element>.wait_time) channel = UI
			ResumeMovie \{textureSlot = 0}
			printf \{"SubtitleMovie: Movie element has resumed playback."
				channel = UI}
		endif
		RemoveParameter \{element}
		GetNextArrayElement <events>
	endif
	Wait \{1
		gameframe}
	repeat
	waitformovieloop \{textureSlot = 0}
	printf \{"SubtitleMovie: Movie element has finished playing."
		channel = UI}
	PauseMovie \{textureSlot = 0}
	printf \{"SubtitleMovie: Movie element has paused playback."
		channel = UI}
	killsubtitledmovie <exit_params>
endscript

script destroysubtitledmovieelement \{fade_out_params = {
		}}
	DoMorph {
		<default_fade_out_params>
		<fade_out_params>
	}
	Die
	printf \{"SubtitleMovie: Element has been destroyed."
		channel = UI}
endscript
