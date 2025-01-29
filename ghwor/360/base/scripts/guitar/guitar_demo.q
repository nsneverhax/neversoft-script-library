g_kiosk_demo = 0
g_in_demo_marketing_sequence = 0
g_terminate_demo_marketing_sequence = 0
g_demo_default_band_name = qs(0x561873ca)
g_demo_cas_profile_lists = [
	preset_musician_profiles_ghrockers
	g_dummy_bandlogo_profile
]
g_demo_cas_profiles = [
	gh_rocker_casey
	gh_rocker_izzy
	gh_rocker_pandora
	gh_rocker_judy
	gh_rocker_johnny
	bandlogo
]
g_dummy_bandlogo_profile = [
	{
		Name = bandlogo
		appearance = {
			cas_band_logo = {
				desc_id = cas_band_logo_id
			}
		}
	}
]
g_demo_band = [
	{
		member0 = gh_rocker_izzy
		member1 = gh_rocker_pandora
		member2 = gh_rocker_judy
		member3 = gh_rocker_johnny
	}
]
g_demo_venue_load = load_z_norway
g_demo_gh_zones = {
	z_norway = {
		Name = 'z_norway'
		$common_gh_zone_params
	}
}
g_demo_outro_images = [
]

script get_demo_image_name 
	getterritory
	if (<territory> = territory_us)
		if French
			append = 'frecan'
		else
			append = 'e'
		endif
	else
		if French
			append = 'f'
		elseif Italian
			append = 'i'
		elseif German
			append = 'g'
		elseif Spanish
			append = 's'
		else
			append = 'b'
		endif
	endif
	formatText TextName = image_name '%p_%a' p = <prefix> a = <append>
	return image_name = <image_name>
endscript

script do_demo_outro 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	printf \{qs(0x2a04b7d5)}
	wait_for_safe_shutdown
	printf \{qs(0x7e5d73b7)}
	disable_pause
	StopRendering
	shutdown_game_for_signin_change \{signin_change = 0}
	LaunchEvent \{Type = unfocus
		target = root_window}
	PauseGame
	Change \{g_in_demo_marketing_sequence = 1}
	StartRendering
	splashscreens = ($g_demo_outro_images)
	GetArraySize <splashscreens>
	if (<array_Size> > 0)
		i = 0
		begin
		get_demo_image_name prefix = (<splashscreens> [<i>])
		DisplayLoadingScreen <image_name>
		Wait \{3
			Seconds}
		GetTrueStartTime
		begin
		GetTrueElapsedTime starttime = <starttime>
		if (<ElapsedTime> >= 7000)
			break
		endif
		if ($g_terminate_demo_marketing_sequence != 0)
			break
		endif
		if ControllerPressed \{X}
			break
		endif
		Wait \{1
			gameframe}
		repeat
		if ($g_terminate_demo_marketing_sequence != 0)
			break
		endif
		DisplayLoadingScreen \{freeze}
		HideLoadingScreen
		i = (<i> + 1)
		repeat <array_Size>
	endif
	demoquit
endscript

script demo_timeout_check 
	RequireParams \{[
			func
		]
		all}
	setscriptcannotpause
	timeout = 0
	begin
	i = 0
	begin
	if ControllerPressed up <i>
		printf \{'Timeout restarted : UP'}
		timeout = 0
	endif
	if ControllerPressed down <i>
		printf \{'Timeout restarted : DOWN'}
		timeout = 0
	endif
	if ControllerPressed X <i>
		printf \{'Timeout restarted : X'}
		timeout = 0
	endif
	if ControllerPressed circle <i>
		printf \{'Timeout restarted : CIRCLE'}
		timeout = 0
	endif
	if ControllerPressed Square <i>
		printf \{'Timeout restarted : SQUARE'}
		timeout = 0
	endif
	if ControllerPressed Triangle <i>
		printf \{'Timeout restarted : TRIANGLE'}
		timeout = 0
	endif
	if ControllerPressed R1 <i>
		printf \{'Timeout restarted : R1'}
		timeout = 0
	endif
	if ControllerPressed L1 <i>
		printf \{'Timeout restarted : L1'}
		timeout = 0
	endif
	i = (<i> + 1)
	repeat 4
	Wait \{1
		gameframe}
	timeout = (<timeout> + 1)
	if (<timeout> > (60 * ($freeplay_time_before_automatic_dropout)))
		<func> <func_params>
		return
	endif
	repeat
endscript
