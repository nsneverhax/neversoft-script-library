loading_screen_tips = [
	qs("Having trouble? Check out the tutorials.")
	qs("Having trouble? Check out the tutorials.")
	qs("Go to 'Rock Star Creator' to purchase new clothing and instruments with the money you earn.")
	qs("Go to 'Rock Star Creator' to purchase new clothing and instruments with the money you earn.")
	qs("Going into 'Practice' can help you nail those tricky solos.")
	qs("Going into 'Practice' can help you nail those tricky solos.")
	qs("Get your personal Guitar Hero stats on the web. Visit community.guitarhero.com to find out how!")
	qs("Link to your game stats, earn groupies, and form an online band at community.guitarhero.com!")
	qs("Want to play in a band but don't have any friends? Play online to hook up and jam!")
	qs("Who's a Guitar God? Check the leaderboards or go to community.guitarhero.com on the web.")
	qs("When in doubt, blame the singer's girlfriend.")
	qs("Don't hide those years of partying - adjust your rocker's age in the 'Rock Star Creator' 'Edit Face' menu.")
	qs("Is your bassist too loud? You can change the mix of instruments in the 'Set Audio' menu!")
	qs("Born as a lefty? No prob, just turn on lefty flip!")
	qs("Wanna create your own epic song? Check out the 'Music Studio' from the main menu!")
	qs("Unlocked a cool new piece of clothing? Go into the 'Rock Star Creator' to buy new stuff.")
	qs("If it's illegal to Rock and Roll, then throw my @#$ in jail!")
	qs("Head to 'GHTunes(SM)' to download new user created tracks to play in the game!")
]
loading_screen_tips_guitar = [
	qs("Try holding down the button before the note reaches the 'Strike Line'.")
	qs("For a long string of notes, try alternating the 'Strum Bar' up and down.")
	qs("You can look even cooler 'Tap Strumming' with the 'Neck Slider'.")
	qs("Use a combination of 'Tap Wah' and 'Whammy' to earn maximum cash.")
	qs("If you see a rope connecting notes it means you can use the 'Neck Slider' to 'Tap' or 'Slide'.")
	qs("Slide your hand on the 'Neck Slider' during long sustained notes to make a 'Wah' effect.")
	qs("It's cool to use both hands on the fret buttons during complex parts. It's even cooler to use your feet!")
]
loading_screen_tips_drum = [
	qs("If you're having trouble finding the beat, start with the kick and snare and then add in your other hand.")
	qs("If your foot starts cramping, try resting it on the kick pedal.")
	qs("Instead of wailing on the pads, try using softer hits. Using your wrists will give you more accuracy and speed.")
	qs("For fast repeated notes, try not to tense up.")
	qs("The silver topped notes are accents. Hit them harder for extra points.")
	qs("Start moving your hand before the note, so that you can hit it on time, and not late.")
	qs("Improvise! At the start of a song or when the 'Drum Highway' looks wavy. Play anything you want, there's no penalty")
]
loading_screen_tips_vocals = [
	qs("Deep voice? No problem. Sing the song in any octave and you will be scored the same.")
	qs("Tip: Move away from the mic to breathe.")
	qs("Feel free to freestyle your own lyrics as long as they're on-time and on-pitch.")
	qs("Just like a real rock singer, enunciation doesn't really matter. Pitch and timing are the most important things.")
	qs("Watch for glowing freeform sections - sing anything you want to the song's beat and pitch to earn bonus points.")
	qs("Bring the hype! When you see hands appear on the 'Vocal Highway', shout out to the crowd to boost your 'Rock Meter'!")
]
loading_screen_tips_bass = [
	qs("Have you seen that bar in the middle of the highway? That's an open strum. Hit it by strumming without holding buttons.")
	qs("Try holding down the button before the note reaches the 'Strike Line'.")
	qs("For a long string of notes, try alternating the 'Strum Bar' up and down.")
]
loading_screen_tips_band = [
	qs("You're all in this together. Once Star Power is ready, anybody in your band can activate it.")
	qs("Hitting note streaks together as a band will give the band a score bonus.")
	qs("If one of your bandmates is struggling they can pull from the Star Power meter to help themselves.")
	qs("When your highway edges glow brighter, you're on a note streak. If your bandmates join you, you'll score bonus points.")
]
loading_screen_tips_jam = [
	qs("In 'GHMix', 'Step Recording' is the easiest way to keep notes on beat.")
	qs("Play to the beat of your own drum. Plug your 'Guitar Hero Drum Controller' into the 'Music Studio' and jam away.")
	qs("You don't have to rip to play ripping solos. Try the 'Lead Machine'.")
	qs("Spit some rhymes with a 'Drum Machine' and 'Mic' in the 'Recording Studio'.")
	qs("When you've finished your masterpiece, select the 'Publish' option to send it up to 'GHTunes(SM)'!")
]
loading_screen_tips_leaderboard = [
	qs("Are you the best around? Is nothing gonna ever keep you down?")
	qs("Each song in the game has a leaderboard for each instrument, and for band play.")
	qs("Any time you download a new song you will be able to post a score onto that song's leaderboard.")
	qs("Get your personal Guitar Hero stats on the web. Visit community.guitarhero.com to find out how!")
]
loading_screen_destroy_state = 'none'

script create_loading_screen \{mode = play_song
		jam_mode = 0}
endscript

script create_loading_screen_spawned 
	SetScriptCannotPause
	stoprendering \{reason = loading_screen}
	loading_screen_container :GetTags
	KillAllMovies
	if NOT IsMovieInBuffer movie = <movie>
		FreeMovieBuffer buffer_slot = <buffer_slot>
		MemPushContext \{loadingscreen}
		AllocateMovieBuffer buffer_slot = <buffer_slot> movie = <movie_path>
		MemPopContext
		LoadMovieIntoBuffer buffer_slot = <buffer_slot> movie = <movie>
	endif
	PlayMovieFromBuffer {
		buffer_slot = <buffer_slot>
		TextureSlot = <TextureSlot>
		TexturePri = 100020
		no_hold
	}
	begin
	if IsMoviePlaying TextureSlot = <TextureSlot>
		hide_glitch
		startrendering \{reason = loading_screen}
		break
	endif
	printf \{qs("\Lcreate_loading_screen_spawned: waiting for movie to play")}
	Wait \{1
		gameframe
		ignoreslomo}
	repeat
	if ScreenElementExists \{id = loading_screen_container}
		loading_screen_container :SE_SetProps {
			loading_text = <loading_text>
			tip_text = <tip_text>
			loading_bg_alpha = 0.0
		}
	endif
	if ScreenElementExists \{id = BX_hideglitch_bg}
		DestroyScreenElement \{id = BX_hideglitch_bg}
	endif
endscript

script create_loading_screen_empty \{mode = play_song
		jam_mode = 0}
	printscriptinfo \{'create_loading_screen_empty'}
	mark_unsafe_for_shutdown
	disable_pause
	if ($is_changing_levels = 1)
		return
	endif
	change \{is_changing_levels = 1}
	if ($guitar_motion_enable_test = 1)
		return
	endif
	if ScreenElementExists \{id = loading_screen_container}
		return
	endif
	stoprendering \{reason = loading_screen}
	if GotParam \{destroy_state}
		change loading_screen_destroy_state = <destroy_state>
	else
		change \{loading_screen_destroy_state = 'none'}
	endif
endscript

script destroy_loading_screen \{force = 0}
	printscriptinfo \{'destroy_loading_screen'}
	if (<force> = 0)
		if NOT ($loading_screen_destroy_state = 'none')
			ui_event_get_top
			if NOT ($loading_screen_destroy_state = <base_name>)
				return
			endif
		endif
	endif
	if ScreenElementExists \{id = loading_screen_container}
		printf \{qs("\LHit")
			channel = movie}
		if NOT ScriptIsRunning \{destroy_loading_screen_spawned}
			loading_screen_container :obj_spawnscript destroy_loading_screen_spawned params = <...>
		endif
	else
		startrendering \{reason = loading_screen}
	endif
	Hideloadingscreen
	if ($playing_song = 0 || $end_credits = 1)
		change \{is_changing_levels = 0}
	endif
	mark_safe_for_shutdown
endscript

script destroy_loading_screen_spawned \{time = 0.1}
	GetTags
	stoprendering \{reason = loading_screen}
	SE_SetProps \{alpha = 0}
	if GotParam \{TextureSlot}
		if IsMoviePlaying TextureSlot = <TextureSlot>
			KillMovie TextureSlot = <TextureSlot>
		endif
	endif
	startrendering \{reason = loading_screen}
	Die
endscript

script refresh_screen 
	destroy_loading_screen
	begin
	if NOT ScreenElementExists \{id = loading_screen_container}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	create_loading_screen
endscript

script show_page_flip_loading_screen 
	spawnscriptnow show_page_flip_loading_screen_spawned params = <...>
endscript

script show_page_flip_loading_screen_spawned 
	KillAllMovies \{blocking}
	FreeMovieBuffer \{buffer_slot = 0}
	DisplayLoadingScreen \{'boot_copyright_BG_1'
		spin3d_texture = 'load_wheel'
		spin_x = 800
		spin_y = 554
		scale = 0.055
		Speed = -2}
endscript
