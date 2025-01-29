igc_custom_camera_name = custom_igc_cam

script PlayIGCCamScene 
	hide_all_hud_sprites
	PlayIGCCam {
		Name = $igc_custom_camera_name
		<...>
		exitscript = show_all_hud_sprites
		allow_pause = 1
	}
endscript

script PlayIGCCamSceneWithHUD 
	PlayIGCCam {
		<...>
		allow_pause = 1
	}
endscript

script freeze_skater_for_cinematic 
	skater :SwitchOffAtomic \{Board}
	skater :PausePhysics
	skater :Pause
	skater :DisablePlayerInput
	skater :SkaterLoopingSound_TurnOff
endscript

script unfreeze_skater_after_cinematic 
	skater :UnPausePhysics
	skater :EnablePlayerInput
	skater :Unpause
	skater :Input_Debounce \{X}
	if NOT skater :walking
		skater :SkaterLoopingSound_TurnOn
	endif
endscript

script fadetoblack \{time = 0.5
		alpha = 0.5
		z_priority = 9000
		rgba = [
			0
			0
			0
			255
		]
		Scale = (600.0, 400.0)
		texture = black
		id = screenfader
		Pos = (320.0, 240.0)
		parent = root_window}
	if GotParam \{On}
		if NOT ScreenElementExists id = <id>
			SetScreenElementLock OFF id = <parent>
			if NOT GotParam \{create_script}
				CreateScreenElement {
					Type = SpriteElement
					parent = <parent>
					id = <id>
					texture = <texture>
					Pos = <Pos>
					rgba = <rgba>
					just = [center center]
					Scale = <Scale>
					alpha = 0
					z_priority = <z_priority>
					no_zwrite
				}
			else
				<create_script>
			endif
		else
			TerminateObjectsScripts id = <id>
			<id> :RemoveTags [waiting_to_die]
		endif
		DoScreenElementMorph id = <id> time = <time> alpha = <alpha>
	endif
	if GotParam \{OFF}
		if ScreenElementExists id = <id>
			DoScreenElementMorph id = <id> time = <time> alpha = 0
			if GotParam \{no_wait}
				RunScriptOnScreenElement id = <id> fadetoblack_wait_and_die params = {time = <time>}
			else
				<id> :SetTags waiting_to_die
				if (<time> > 0.0)

					Wait <time> Seconds
				endif
				if ScreenElementExists id = <id>
					if <id> :GetSingleTag waiting_to_die
						DestroyScreenElement id = <id>
					endif
				endif
			endif
		endif
	endif
endscript

script fadetoblack_wait_and_die 
	if GotParam \{time}
		Wait <time> Seconds
	endif
	Die
endscript

script igc_fadeout \{time = 0.75}
	fadetoblack On alpha = 1.0 time = <time>
	Wait (<time> + 0.1) Seconds
endscript

script igc_fadeout_fast 
	fadetoblack \{On
		alpha = 1.0
		time = 0.0}
endscript

script igc_fadein_fast 
	fadetoblack \{OFF
		time = 0.0}
endscript

script igc_fadein \{time = 0.75}
	fadetoblack OFF time = <time> no_wait
endscript
