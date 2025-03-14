focustrickstruct = {
	InOrder
	a = l3
	b = l3
	500
}
focus_mode_dir = forward
focus_mode_forced_on = 0
focus_mode_force_times_allowed = 0
focus_mode_allow_focus = 1

script EndSpecial 
	broadcastevent \{type = SkaterExitSpecialTrick}
	if (getglobalflag flag = $CHEAT_COOL_SPECIAL_TRICKS)
		pulse_blur \{start = 150
			end = 0
			time = 10}
		if NOT (getglobalflag flag = $cheat_unlimited_focus)
			setslomo \{1}
		endif
	endif
endscript

script killspecial 
	if NOT (getglobalflag flag = $cheat_unlimited_focus)
		really_kill_focus = 1
	endif
	if gotparam during_bail
		really_kill_focus = 1
		stopsoundevent Focus_Out_HighFreq
	endif
	if gotparam toggled
		really_kill_focus = 1
		stopsoundevent Focus_Out_HighFreq
	endif
	if gotparam forcekill
		really_kill_focus = 1
		stopsoundevent Focus_Out_HighFreq
	endif
	if ispumpactive
		return
	endif
	if gotparam really_kill_focus
		if isskaterfocused
			turn_off = 1
		else
			if gotparam force
				turn_off = 1
			endif
		endif
		if gotparam turn_off
			killspawnedscript id = SFX_SlowMo
			spawnscriptlater SK6_SFX_BulletTime_Out id = SFX_SlowMo_Return
			broadcastevent type = SkaterExitFocus
			focusoff
			spawnscriptlater EndBloom id = EndBloom_ScriptID
			if gotparam timelimit
				if NOT getglobalflag flag = $no_display_hud
					create_panel_message text = "Maximum focus time reached!" id = maxfocus style = focustimelimit_style just = [left center] pos = (128.0, 360.0)
				endif
				printf "time limit..........................."
			endif
		endif
		kill_blur
		if gotparam turn_off
			setslomo 1
		else
			if NOT gotparam during_bail
				setslomo 1
			endif
		endif
		change focus_mode_forced_on = 0
	endif
	clearskatercamoverride
endscript

script focustimelimitwarning 
	formattext textname = text "%i seconds focus remaining" i = <seconds>
	create_panel_message text = <text> id = maxfocus style = focustimelimit_style just = [left center] pos = (128.0, 360.0)
	if (<seconds> = 2)
		if NOT issoundeventplaying Focus_Out_HighFreq
			soundevent event = Focus_Out_HighFreq
		endif
	elseif (<seconds> = 1)
		if NOT issoundeventplaying Focus_Out_HighFreq
			soundevent event = sk9_Focus_Timer_1Second_Left
		endif
	endif
	soundevent event = sk9_Focus_Timer
endscript

script force_focus_mode_on 
	if ($focus_mode_forced_on = 0)
		skater :getfocustimesallowed
		change focus_mode_force_times_allowed = <focus_allowed>
		skater :setfocustimesallowed \{30}
		change \{focus_max_times_in_combo = 30}
		change \{focus_time_limit = 600.0}
		toggle_focus
		change \{focus_mode_forced_on = 1}
	endif
endscript

script force_focus_mode_off 
	if ($focus_mode_forced_on = 1)
		skater :setfocustimesallowed \{$focus_mode_force_times_allowed}
		change \{focus_max_times_in_combo = $focus_max_times_in_combo_default}
		change \{focus_time_limit = $focus_time_limit_default}
		skater :killspecial \{keep_decreasespecial}
		change \{focus_mode_forced_on = 0}
	endif
endscript

script toggle_focus 
	if NOT innetgame
		if NOT inmultiplayergame
			if ($focus_mode_allow_focus = 1)
				skater :toggle_focus2 \{dir = forward}
			endif
		endif
	endif
endscript

script toggle_focus_back 
	if NOT innetgame
		if NOT inmultiplayergame
			skater :toggle_focus2 \{dir = backward}
		endif
	endif
endscript

script toggle_focus2 slomo = 0.5 dir = forward
	if nailthetrick_isinnailthex
		return
	endif
	if isskaterfocused
		if NOT gotparam leveltrigger
			killspecial toggled
			return
		endif
	endif
	getfocustimeleft
	if (0 > <focus_time>)
		return
	endif
	if currentscorepotgreaterthan 0
		getfocustimesallowed
		if (<focus_allowed> > 0)
			setfocustimesallowed (<focus_allowed> - 1)
		else
			return
		endif
	endif
	focuson
	broadcastevent type = SkaterEnterFocus
	spawnscriptlater PulseBloom id = PulseBloom_ScriptId
	setslomo <slomo>
	killspawnedscript id = SFX_SlowMo_Return
	spawnscriptnow SK6_SFX_BulletTime_In id = SFX_SlowMo
	if gotparam leveltrigger
		return
	endif
	toggle_focus_exit dir = <dir> BIGDROP = <BIGDROP>
endscript

script toggle_focus_exit dir = forward
	if (<dir> = forward)
		if inair
			if gotparam BIGDROP
				if ($BIGDROP_CAM2 = 0)
					obj_killspawnedscript name = IGC_BigDrop_SkaterCam
					obj_spawnscriptnow IGC_BigDrop_SkaterCam
				else
					playigccam {
						name = BIGDROP
						controlscript = IGC_BigDrop
					}
				endif
			else
			endif
		else
			if onground
			endif
		endif
		change focus_mode_dir = forward
	else
		if inair
			setskatercamoverride heading = 3.1399999 tilt = 0.0 time = 0.0001 zoom = 1.0
		else
			setskatercamoverride heading = 3.1399999 tilt = 0.0 time = 0.0001 zoom = 0.9
			if onground
			endif
		endif
		change focus_mode_dir = backward
	endif
endscript
