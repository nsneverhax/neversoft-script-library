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
	gh_rocker_axel
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
		member0 = gh_rocker_axel
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
