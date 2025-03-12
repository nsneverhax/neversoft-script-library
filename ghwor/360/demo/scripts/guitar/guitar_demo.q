g_kiosk_demo = 0
g_in_demo_marketing_sequence = 0
g_terminate_demo_marketing_sequence = 0
g_demo_default_band_name = qs(0x561873ca)
g_demo_cas_profile_lists = [
	preset_musician_profiles_ghrockers
	preset_musician_profiles_locked
	g_dummy_bandlogo_profile
]
g_demo_cas_profiles = [
	gh_rocker_johnny
	gh_rocker_johnnynapalm_band_001
	gh_rocker_johnnynapalm_band_002
	gh_rocker_johnnynapalm_band_003
	gh_rocker_johnny_2
	gh_rocker_johnnynapalm2_band_001
	gh_rocker_johnnynapalm2_band_002
	gh_rocker_johnnynapalm2_band_003
	bandlogo
]
g_dummy_bandlogo_profile = [
	{
		name = bandlogo
		appearance = {
			cas_band_logo = {
				desc_id = cas_band_logo_id
			}
		}
	}
]
g_demo_band = [
	{
		member0 = gh_rocker_johnny
		member1 = gh_rocker_johnny
		member2 = gh_rocker_johnny
		member3 = gh_rocker_johnny
	}
]
g_demo_venue_load = load_z_punkstage
g_demo_gh_zones = {
	z_punkstage = {
		name = 'z_PunkStage'
		$common_gh_zone_params
	}
}
g_demo_outro_images = [
	'demo_outro_01'
	'demo_outro_02'
	'demo_outro_03'
]
0x75f92ee5 = [
	7000
	11000
	7000
]

script get_demo_image_name 
	if french
		append = 'f'
	elseif italian
		append = 'i'
	elseif german
		append = 'g'
	elseif spanish
		append = 's'
	else
		append = 'e'
	endif
	formattext textname = image_name '%p_%a' p = <prefix> a = <append>
	return image_name = <image_name>
endscript

script do_demo_outro 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	printf \{qs(0x2a04b7d5)}
	wait_for_safe_shutdown
	printf \{qs(0x7e5d73b7)}
	disable_pause
	stoprendering
	shutdown_game_for_signin_change \{signin_change = 0}
	0x8fe60540
	change \{g_in_demo_marketing_sequence = 1}
	demoquit
endscript

script 0x8fe60540 
	change \{g_in_demo_marketing_sequence = 1}
	launchevent \{type = unfocus
		target = root_window}
	pausegame
	startrendering
	splashscreens = ($g_demo_outro_images)
	0xfe8bbca0 = ($0x75f92ee5)
	getarraysize <splashscreens>
	if (<array_size> > 0)
		i = 0
		begin
		get_demo_image_name prefix = (<splashscreens> [<i>])
		displayloadingscreen <image_name>
		wait \{3
			seconds}
		gettruestarttime
		begin
		gettrueelapsedtime starttime = <starttime>
		if (<elapsedtime> >= (<0xfe8bbca0> [<i>]) && $paused_for_hardware = 0)
			break
		endif
		if ($g_terminate_demo_marketing_sequence != 0)
			break
		endif
		if controllerpressed \{x}
			break
		endif
		wait \{1
			gameframe}
		repeat
		if ($g_terminate_demo_marketing_sequence != 0)
			break
		endif
		displayloadingscreen \{freeze}
		hideloadingscreen
		i = (<i> + 1)
		repeat <array_size>
	endif
	change \{g_in_demo_marketing_sequence = 0}
endscript

script demo_timeout_check 
	requireparams \{[
			func
		]
		all}
	setscriptcannotpause
	timeout = 0
	begin
	i = 0
	begin
	if controllerpressed up <i>
		printf \{'Timeout restarted : UP'}
		timeout = 0
	endif
	if controllerpressed down <i>
		printf \{'Timeout restarted : DOWN'}
		timeout = 0
	endif
	if controllerpressed x <i>
		printf \{'Timeout restarted : X'}
		timeout = 0
	endif
	if controllerpressed circle <i>
		printf \{'Timeout restarted : CIRCLE'}
		timeout = 0
	endif
	if controllerpressed square <i>
		printf \{'Timeout restarted : SQUARE'}
		timeout = 0
	endif
	if controllerpressed triangle <i>
		printf \{'Timeout restarted : TRIANGLE'}
		timeout = 0
	endif
	if controllerpressed r1 <i>
		printf \{'Timeout restarted : R1'}
		timeout = 0
	endif
	if controllerpressed l1 <i>
		printf \{'Timeout restarted : L1'}
		timeout = 0
	endif
	i = (<i> + 1)
	repeat 4
	wait \{1
		gameframe}
	timeout = (<timeout> + 1)
	if (<timeout> > (60 * ($freeplay_time_before_automatic_dropout)))
		<func> <func_params>
		return
	endif
	repeat
endscript
