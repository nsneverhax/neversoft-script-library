
script smoothmenuscroll 
	GetSingleTag \{smooth_morph_time}
	setspawnedscriptnorepeatfor time = (<smooth_morph_time> + 0.05)
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	RequireParams \{[
			Dir
			isvertical
		]
		all}
	Obj_GetID
	if GotParam \{play_scroll_sound}
		if NOT (<play_scroll_sound> = 0)
			ui_sfx \{menustate = Generic
				uitype = scrolldown}
		endif
	endif
	if countscreenelementchildren id = <objID>
		LaunchEvent Type = unfocus target = <objID>
		Change \{generic_menu_block_input = 1}
		GetScreenElementDims id = <objID>
		if (<isvertical> = true)
			<shift> = ((<height> / <num_children>) * (0.0, 1.0))
		else
			<shift> = ((<width> / <num_children>) * (1.0, 0.0))
		endif
		if (<Dir> = -1)
			se_setprops Pos = {<shift> relative} time = <smooth_morph_time>
			se_waitprops
			menu_changeselection \{up}
			se_setprops Pos = {(<shift> * -1) relative} time = 0.0
			se_waitprops
		else
			se_setprops Pos = {(<shift> * -1) relative} time = <smooth_morph_time>
			se_waitprops
			menu_changeselection \{down}
			se_setprops Pos = {<shift> relative} time = 0.0
			se_waitprops
		endif
		Wait \{0.05
			Seconds}
		Change \{generic_menu_block_input = 0}
		LaunchEvent Type = focus target = <objID>
	endif
endscript
