
script bossbattle_startup 
endscript

script bossbattle_flash_highway 
	printf \{'!!!!!!!!!!!!! Flash Highway !!!!!!!!!!!!!!!!'}
	killspawnedscript \{name = bb_flash_highway}
	spawnscriptnow \{bb_flash_highway}
endscript

script bb_flash_highway 
	doflash \{duration = 1
		skater = 0
		start_r = 255
		start_g = 0
		start_b = 0
		start_a = 600
		end_r = 255
		end_g = 0
		end_b = 0
		end_a = 25}
endscript

script bossbattle_pitchdown 
	<pitchtweak> = 0.0
	begin
	begin
	setsoundbusseffects effect = {effect = fastpitchshift name = guitar1pitchshift pitch = (1.0 - <pitchtweak>)}
	<pitchtweak> = (<pitchtweak> + 0.05)
	wait \{7
		frames}
	repeat 15
	begin
	setsoundbusseffects effect = {effect = fastpitchshift name = guitar1pitchshift pitch = (1.0 - <pitchtweak>)}
	<pitchtweak> = (<pitchtweak> -0.05)
	wait \{7
		frames}
	repeat 15
	repeat 3
	setsoundbusseffects \{effect = {
			effect = fastpitchshift
			name = guitar1pitchshift
			pitch = 1
		}}
endscript

script bossbattle_pitchdown_short 
	<pitchtweak> = 0.0
	begin
	begin
	setsoundbusseffects effect = {effect = fastpitchshift name = guitar1pitchshift pitch = (1.0 - <pitchtweak>)}
	<pitchtweak> = (<pitchtweak> + 0.05)
	wait \{5
		frames}
	repeat 15
	begin
	setsoundbusseffects effect = {effect = fastpitchshift name = guitar1pitchshift pitch = (1.0 - <pitchtweak>)}
	<pitchtweak> = (<pitchtweak> -0.05)
	wait \{5
		frames}
	repeat 15
	repeat 2
	setsoundbusseffects \{effect = {
			effect = fastpitchshift
			name = guitar1pitchshift
			pitch = 1
		}}
endscript

script bossbattle_camerashake 
	printf \{'!!!!!!!!!!!!!!!! BossBattle_CameraShake !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'}
endscript
