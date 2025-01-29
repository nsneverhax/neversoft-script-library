
script playsubtitledmovie 
	if NOT gotparam \{subbedmovie}
		printf \{"PlaySubtitledMovie: Requires the SubbedMovie param, see movie_text.q for an example of the structure."
			channel = ui}
		return
	endif
	if screenelementexists \{id = play_subtitled_movie_container}
		printf \{"PlaySubtitledMovie: Script is already running, call KillSubtitledMovie first."
			channel = ui}
		return
	endif
	if NOT (structurecontains structure = subbedmovie name = movie_params)
		printf \{"PlaySubtitledMovie: Script Requires the SubbedMovie param to contain a movie_params."
			channel = ui}
		return
	endif
	if NOT (structurecontains structure = subbedmovie name = events)
		printf \{"PlaySubtitledMovie: Script Requires the SubbedMovie param to contain an array of event."
			channel = ui}
		return
	endif
	<container_params> = {}
	<helper_params> = {}
	<skip_helper_params> = {}
	<exit_param> = {}
	if (structurecontains structure = subbedmovie name = container_params)
		<container_params> = (<subbedmovie>.container_params)
	endif
	if (structurecontains structure = subbedmovie name = helper_params)
		<helper_params> = (<subbedmovie>.helper_params)
	endif
	if (structurecontains structure = subbedmovie name = skip_helper_params)
		<skip_helper_params> = (<subbedmovie>.skip_helper_params)
	endif
	if (structurecontains structure = subbedmovie name = exit_script)
		<exit_params> = {exit_script = (<subbedmovie>.exit_script)}
		if (structurecontains structure = subbedmovie name = exit_script_params)
			<exit_params> = {<exit_params> exit_script_params = (<subbedmovie>.exit_script_params)}
		endif
	endif
	createscreenelement \{type = containerelement
		parent = root_window
		id = play_subtitled_movie_main_container
		dims = (1280.0, 702.0)
		pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	if NOT (structurecontains structure = subbedmovie name = no_skip)
		setscreenelementprops {
			id = play_subtitled_movie_main_container
			event_handlers = [
				{pad_back nullscript}
				{pad_choose killsubtitledmovie params = {<exit_params>}}
			]
		}
		createscreenelement {
			rgba = [128 128 128 255]
			text = "skip movie \\m0"
			just = [right center]
			pos = (1150.0, 620.0)
			alpha = 1.0
			scale = (0.8, 0.8)
			<skip_helper_params>
			type = textelement
			parent = play_subtitled_movie_main_container
			id = play_subtitled_skip_helper
			font = text_a1
			z_priority = 1010
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
		}
	endif
	launchevent \{type = focus
		target = play_subtitled_movie_main_container}
	createscreenelement {
		<container_params>
		type = containerelement
		parent = play_subtitled_movie_main_container
		id = play_subtitled_movie_container
	}
	printf \{"PlaySubtitledMovie: Container Element has been created."
		channel = ui}
	createscreenelement {
		text = "press \\m1 to continue"
		just = [center center]
		alpha = 0.0
		scale = (0.8, 0.8)
		<helper_params>
		type = textelement
		parent = play_subtitled_movie_container
		id = play_subtitled_movie_helper
		font = text_a1
		z_priority = 1010
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	printf \{"PlaySubtitledMovie: Helper Text Element has been created."
		channel = ui}
	<default_create_element> = {}
	<default_fade_in_params> = {}
	<default_fade_out_params> = {}
	if (structurecontains structure = subbedmovie name = default_create_element)
		<default_create_element> = (<subbedmovie>.default_create_element)
	endif
	if (structurecontains structure = subbedmovie name = default_fade_in_params)
		<default_fade_in_params> = (<subbedmovie>.default_fade_in_params)
	endif
	if (structurecontains structure = subbedmovie name = default_fade_out_params)
		<default_fade_out_params> = (<subbedmovie>.default_fade_out_params)
	endif
	pushsoundbussparams
	if (structurecontains structure = subbedmovie name = no_music)
		enableusermusic \{disable}
		setsoundbussparams \{$no_music_at_all_bussset
			time = 0.3}
	endif
	printf \{"PlaySubtitledMovie: Launching SubtitleMovie..."
		channel = ui}
	runscriptonscreenelement id = play_subtitled_movie_container subtitlemovie params = {
		movie_params = (<subbedmovie>.movie_params)
		events = (<subbedmovie>.events)
		default_create_element = <default_create_element>
		default_fade_in_params = <default_fade_in_params>
		default_fade_out_params = <default_fade_out_params>
		exit_params = <exit_params>
	}
endscript

script killsubtitledmovie \{exit_script = nullscript
		exit_params = {
		}}
	spawnscriptnow <exit_script> params = <exit_params>
	if screenelementexists \{id = play_subtitled_movie_main_container}
		enableusermusic
		popsoundbussparams
		destroyscreenelement \{id = play_subtitled_movie_main_container}
		launchevent \{broadcast
			type = subtitled_movie_killed}
		printf \{"KillSubtitledMovie: Subtitled movie has been destroyed."
			channel = ui}
	else
		printf \{"KillSubtitledMovie: There is no subtitled movie playing."
			channel = ui}
	endif
endscript

script subtitlemovie_presstocontinue 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	launchevent \{broadcast
		type = movie_text_press_to_continue}
endscript

script subtitlemovie 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	printf \{"SubtitleMovie: Script has spawned."
		channel = ui}
	killallmovies \{blocking}
	<movie> = (<movie_params>.movie)
	if (structurecontains structure = movie_params name = movie_ps3)
		if isps3
			<movie> = (<movie_params>.movie_ps3)
			if (structurecontains structure = movie_params name = movie_ps3x)
				getenterbuttonassignment
				if (<assignment> = circle)
					<movie> = (<movie_params>.movie_ps3x)
				endif
			endif
		endif
	endif
	createscreenelement {
		scale = (1280.0, 720.0)
		<movie_params>
		movie = <movie>
		type = movieelement
		parent = play_subtitled_movie_container
		id = play_subtitled_movie
		textureslot = 0
		z_priority = 1000
		start_frame = (<movie_params>.start_frame)
		loop_start = (<movie_params>.start_frame)
		loop_end = (<movie_params>.end_frame)
	}
	removeparameter \{movie}
	removeparameter \{movie_params}
	wait \{1
		gameframes}
	begin
	if (ismovieplaying textureslot = 0)
		printf \{"SubtitleMovie: Movie element has started playing."
			channel = ui}
		break
	endif
	wait \{1
		gameframes}
	repeat
	getnextarrayelement <events>
	begin
	if NOT gotparam \{element}
		printf \{"SubtitleMovie: All events have completed, breaking out of loop."
			channel = ui}
		break
	endif
	if NOT ismovieplaying \{textureslot = 0}
		printf \{"SubtitleMovie: WARNING: Move unexpectedly ended, breaking out."
			channel = ui}
		killsubtitledmovie <exit_params>
		return
	endif
	getmovieframe \{textureslot = 0}
	printf "SubtitleMovie: Current Movie Element Frame: %f" f = <frame> channel = ui
	if (<frame> >= (<element>.frame))
		printf "SubtitleMovie: Current Event Frame: %f" f = (<element>.frame) channel = ui
		if (structurecontains structure = element name = destroy_element)
			if gotparam \{curr_element}
				<fade_out_params> = {}
				if (structurecontains structure = element name = fade_out_params)
					<fade_out_params> = (<element>.fade_out_params)
				endif
				runscriptonscreenelement id = <curr_element> destroysubtitledmovieelement params = {
					default_fade_out_params = <default_fade_out_params>
					fade_out_params = <fade_out_params>
				}
				removeparameter \{curr_element}
			endif
		endif
		if (structurecontains structure = element name = create_element)
			if gotparam \{curr_element}
				runscriptonscreenelement id = <curr_element> destroysubtitledmovieelement
			endif
			<create_element> = (<element>.create_element)
			if (structurecontains structure = element name = create_element_ps3)
				if isps3
					<create_element> = (<element>.create_element_ps3)
				endif
			endif
			createscreenelement {
				<default_create_element>
				<create_element>
				parent = play_subtitled_movie_container
				z_priority = 1005
			}
			removeparameter \{create_element}
			printf \{"SubtitleMovie: Element has been created."
				channel = ui}
			<curr_element> = <id>
			if (structurecontains structure = element name = fade_in_params)
				doscreenelementmorph {
					<default_fade_in_params>
					(<element>.fade_in_params)
					id = <curr_element>
				}
			endif
		endif
		if (structurecontains structure = element name = event_script)
			event_script_params = {}
			if (structurecontains structure = element name = event_script_params)
				event_script_params = (<element>.event_script_params)
			endif
			runscriptonscreenelement id = play_subtitled_movie_container (<element>.event_script) params = <event_script_params>
		endif
		if (structurecontains structure = element name = wait_for_input)
			pausemovie \{textureslot = 0}
			printf \{"SubtitleMovie: Movie element has paused playback."
				channel = ui}
			doscreenelementmorph \{id = play_subtitled_movie_helper
				alpha = 1.0
				time = 0.5}
			setscreenelementprops \{id = play_subtitled_movie_main_container
				event_handlers = [
					{
						pad_back
						subtitlemovie_presstocontinue
					}
				]
				replace_handlers}
			block \{type = movie_text_press_to_continue}
			printf \{"SubtitleMovie: Input has been recieved."
				channel = ui}
			doscreenelementmorph \{id = play_subtitled_movie_helper
				alpha = 0.0
				time = 0.5}
			setscreenelementprops \{id = play_subtitled_movie_main_container
				event_handlers = [
					{
						pad_back
						nullscript
					}
				]
				replace_handlers}
			resumemovie \{textureslot = 0}
			printf \{"SubtitleMovie: Movie element has resumed playback."
				channel = ui}
		endif
		if (structurecontains structure = element name = wait_time)
			pausemovie \{textureslot = 0}
			printf \{"SubtitleMovie: Movie element has paused playback."
				channel = ui}
			wait (<element>.wait_time) seconds ignoreslomo
			printf "SubtitleMovie: Movie element has waited %s seconds." s = (<element>.wait_time) channel = ui
			resumemovie \{textureslot = 0}
			printf \{"SubtitleMovie: Movie element has resumed playback."
				channel = ui}
		endif
		removeparameter \{element}
		getnextarrayelement <events>
	endif
	wait \{1
		gameframe}
	repeat
	waitformovieloop \{textureslot = 0}
	printf \{"SubtitleMovie: Movie element has finished playing."
		channel = ui}
	pausemovie \{textureslot = 0}
	printf \{"SubtitleMovie: Movie element has paused playback."
		channel = ui}
	killsubtitledmovie <exit_params>
endscript

script destroysubtitledmovieelement \{fade_out_params = {
		}}
	domorph {
		<default_fade_out_params>
		<fade_out_params>
	}
	die
	printf \{"SubtitleMovie: Element has been destroyed."
		channel = ui}
endscript
