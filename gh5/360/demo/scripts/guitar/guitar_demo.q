kiosk_demo = 0
0x9cf507d8 = 0
0xafe8873e = 0
0x70d1fd85 = [
	'demo_outro_01'
	'demo_outro_02'
	'demo_outro_03'
	'demo_outro_04'
]

script get_demo_image_name 
	getterritory
	if (<territory> = territory_us)
		if french
			append = 'frecan'
		else
			append = 'e'
		endif
	else
		if french
			append = 'f'
		elseif italian
			append = 'i'
		elseif german
			append = 'g'
		elseif spanish
			append = 's'
		else
			append = 'b'
		endif
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
	launchevent \{type = unfocus
		target = root_window}
	pausegame
	change \{0x9cf507d8 = 1}
	startrendering
	splashscreens = $0x70d1fd85
	getarraysize <splashscreens>
	i = 0
	begin
	get_demo_image_name prefix = (<splashscreens> [<i>])
	displayloadingscreen <image_name>
	wait \{3
		seconds}
	gettruestarttime
	begin
	gettrueelapsedtime starttime = <starttime>
	if (<elapsedtime> >= 7000)
		break
	endif
	if ($0xafe8873e != 0)
		break
	endif
	if controllerpressed \{x}
		break
	endif
	wait \{1
		gameframe}
	repeat
	if ($0xafe8873e != 0)
		break
	endif
	displayloadingscreen \{freeze}
	hideloadingscreen
	i = (<i> + 1)
	repeat <array_size>
	demoquit
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
