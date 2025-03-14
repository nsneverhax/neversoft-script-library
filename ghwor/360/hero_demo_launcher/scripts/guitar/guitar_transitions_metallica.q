
script careerintro_transition_ecstacyofgold 
	onexitrun \{careerintro_transition_ecstacyofgold_destroy}
	soundevent \{event = ecstacyofgold}
	begin
	if NOT issoundeventplaying \{ecstacyofgold}
		break
	endif
	wait \{10
		gameframes}
	repeat
endscript

script careerintro_transition_ecstacyofgold_destroy 
	stopsoundevent \{ecstacyofgold}
endscript

script careerintro_transition_titlecard 
	onexitrun \{careerintro_transition_titlecard_destroy}
	createscreenelement \{type = descinterface
		parent = root_window
		id = careerintro
		desc = 'titlecard'
		logo_alpha = 0.0
		alpha_0 = 0.0
		alpha_1 = 0.0
		alpha_2 = 0.0}
	careerintro :se_setprops \{alpha_0 = 1.0
		time = 1.0}
	careerintro :se_waitprops
	wait \{4.0
		seconds
		ignoreslomo}
	careerintro :se_setprops \{alpha_0 = 0.0
		time = 1.0}
	careerintro :se_waitprops
	wait \{1.0
		seconds
		ignoreslomo}
	careerintro :se_setprops \{alpha_1 = 1.0
		time = 1.0}
	careerintro :se_waitprops
	wait \{5.0
		seconds
		ignoreslomo}
	careerintro :se_setprops \{alpha_1 = 0.0
		time = 1.0}
	careerintro :se_waitprops
	wait \{2.5
		seconds
		ignoreslomo}
	careerintro :se_setprops \{alpha_2 = 1.0
		time = 0.5}
	careerintro :se_waitprops
	wait \{4.0
		seconds
		ignoreslomo}
	careerintro :se_setprops \{alpha_2 = 0.0
		time = 1.0}
	careerintro :se_waitprops
	wait \{16.5
		seconds
		ignoreslomo}
	careerintro :se_setprops \{logo_alpha = 1.0
		time = 1.0}
	careerintro :se_waitprops
	wait \{5.0
		seconds
		ignoreslomo}
	careerintro :se_setprops \{logo_alpha = 0.0
		time = 1.0}
	careerintro :se_waitprops
endscript

script careerintro_transition_titlecard_destroy 
	if screenelementexists \{id = careerintro}
		destroyscreenelement \{id = careerintro}
	endif
endscript

script careerintro_transition_resetslomo 
	onexitrun \{setslomo_intro}
	begin
	if ($transition_playing = false)
		enable_pause
		break
	endif
	wait \{1
		gameframe
		ignoreslomo}
	repeat
endscript

script careerintro_ignore 
	change \{default_careerintro_transition = {
			time = 5000
			scripttable = [
			]
		}}
	change \{common_careerintro_transition = {
			scripttable = [
				{
					time = 0
					scr = start_preloaded_celeb_intro_stream
				}
				{
					time = 0
					scr = transition_stoprendering
				}
				{
					time = 0
					scr = crowd_allplayanim
					params = {
						anim = idle
					}
				}
				{
					time = 0
					scr = transition_cameracut
					params = {
						changenow
					}
				}
				{
					time = 0
					scr = play_intro
					params = {
					}
				}
				{
					time = 0
					scr = play_intro_anims
					params = {
					}
				}
				{
					time = 100
					scr = transition_startrendering
				}
			]
			endwithdefaultcamera
			syncwithnotecameras
		}}
endscript

script z_forum_camera_encore_cleanup 
	safekill \{nodename = z_forum_trg_geo_blacktruck}
endscript

script should_play_long_venue_intro 
	getpakmancurrent \{map = zones}
	getglobaltags \{venue_intro_flags}
	if structurecontains structure = <...> <pak>
		<venue_flag> = (<...>.<pak>)
		if (<venue_flag> = 1)
			printf \{qs(0x85a3eba3)}
			return \{false}
		endif
	endif
	printf \{qs(0xc78ea90b)}
	addparam name = <pak> value = 1 structure_name = newvalue
	setglobaltags venue_intro_flags params = <newvalue>
	return \{true}
endscript

script wait_for_careeritnro 
	setscriptcannotpause
	gamemode_gettype
	begin
	removeparameter \{not_done}
	if (<type> = career)
		if NOT progression_check_intro_complete
			if ($transition_playing = true)
				if ($current_playing_transition = careerintro)
					not_done = 1
				endif
			endif
		endif
	endif
	if NOT gotparam \{not_done}
		return
	endif
	wait \{1
		gameframes}
	repeat
endscript
metallica_intro_vo_data = {
	random_frequency = 0.1
	exclude_venues = [
		z_icecave
		z_soundcheck
		z_soundcheck2
		z_studio
		z_studio2
	]
	exclude_songs = [
		nothingelsematters
	]
	random_sets = [
		{
			rhythm_anim_name = vo_james_generic_03
		}
		{
			rhythm_anim_name = vo_james_generic_05
		}
		{
			rhythm_anim_name = vo_james_generic_08
		}
		{
			rhythm_anim_name = vo_james_generic_13
		}
		{
			rhythm_anim_name = vo_james_generic_09
		}
		{
			rhythm_anim_name = vo_james_generic_06
		}
		{
			rhythm_anim_name = vo_james_generic_04
		}
		{
			rhythm_anim_name = vo_james_generic_16
		}
		{
			rhythm_anim_name = vo_james_generic_02
		}
		{
			rhythm_anim_name = vo_james_generic_07
		}
		{
			rhythm_anim_name = vo_james_generic_10
		}
		{
			rhythm_anim_name = vo_james_generic_11
		}
		{
			rhythm_anim_name = vo_james_generic_12
		}
		{
			rhythm_anim_name = vo_james_generic_14
		}
		{
			rhythm_anim_name = vo_james_generic_15
		}
		{
			rhythm_anim_name = vo_james_generic_17
		}
		{
			rhythm_anim_name = vo_james_generic_19
		}
		{
			rhythm_anim_name = vo_james_encore_02
		}
		{
			rhythm_anim_name = vo_james_generic_18
		}
		{
			rhythm_anim_name = vo_james_generic_20
		}
	]
	song_specific_sets = {
		disposeableheroes = {
			rhythm_anim_name = vo_james_song_01
		}
		hitthelights = {
			rhythm_anim_name = vo_james_song_02
		}
		kingnothing = {
			rhythm_anim_name = vo_james_song_05
		}
		whiplash = {
			rhythm_anim_name = vo_james_song_06
		}
	}
}
