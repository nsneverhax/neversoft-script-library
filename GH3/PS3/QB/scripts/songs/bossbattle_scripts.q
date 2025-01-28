
script bossbattle_startup 
endscript

script BossBattle_Flash_Highway 
	Printf \{'!!!!!!!!!!!!! Flash Highway !!!!!!!!!!!!!!!!'}
	KillSpawnedScript \{Name = bb_flash_highway}
	SpawnScriptNow \{bb_flash_highway}
endscript

script bb_flash_highway 
	DoFlash \{Duration = 1
		Skater = 0
		start_r = 255
		start_g = 0
		start_b = 0
		start_a = 600
		end_r = 255
		end_g = 0
		end_b = 0
		end_a = 25}
endscript

script BossBattle_PitchDown 
	<pitchtweak> = 0.0
	begin
	begin
	SetSoundBussEffects Effect = {Effect = FastPitchShift Name = Guitar1PitchShift Pitch = (1.0 - <pitchtweak>)}
	<pitchtweak> = (<pitchtweak> + 0.05)
	Wait \{7
		frames}
	repeat 15
	begin
	SetSoundBussEffects Effect = {Effect = FastPitchShift Name = Guitar1PitchShift Pitch = (1.0 - <pitchtweak>)}
	<pitchtweak> = (<pitchtweak> -0.05)
	Wait \{7
		frames}
	repeat 15
	repeat 3
	SetSoundBussEffects \{Effect = {
			Effect = FastPitchShift
			Name = Guitar1PitchShift
			Pitch = 1
		}}
endscript

script BossBattle_PitchDown_Short 
	<pitchtweak> = 0.0
	begin
	begin
	SetSoundBussEffects Effect = {Effect = FastPitchShift Name = Guitar1PitchShift Pitch = (1.0 - <pitchtweak>)}
	<pitchtweak> = (<pitchtweak> + 0.05)
	Wait \{5
		frames}
	repeat 15
	begin
	SetSoundBussEffects Effect = {Effect = FastPitchShift Name = Guitar1PitchShift Pitch = (1.0 - <pitchtweak>)}
	<pitchtweak> = (<pitchtweak> -0.05)
	Wait \{5
		frames}
	repeat 15
	repeat 2
	SetSoundBussEffects \{Effect = {
			Effect = FastPitchShift
			Name = Guitar1PitchShift
			Pitch = 1
		}}
endscript

script BossBattle_CameraShake 
	Printf \{'!!!!!!!!!!!!!!!! BossBattle_CameraShake !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'}
endscript
