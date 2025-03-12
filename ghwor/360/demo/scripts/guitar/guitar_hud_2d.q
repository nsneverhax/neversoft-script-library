g_hud_2d_struct_used = {
}

script hud_fx_shake_se \{shake_container = null}
	move_up_and_down = 1
	if screenelementexists id = <shake_container>
		getscreenelementprops id = <shake_container>
		time_to_shake = 0.15
		if (<move_up_and_down> = 1)
			if screenelementexists id = <shake_container>
				legacydoscreenelementmorph id = <shake_container> pos = (<pos> - (0.0, 50.0)) scale = 1.5 rot_angle = 10 time = <time_to_shake> motion = ease_in
				wait <time_to_shake> seconds
			endif
			if screenelementexists id = <shake_container>
				legacydoscreenelementmorph id = <shake_container> pos = (<pos> + (0.0, 75.0)) scale = 0.5 rot_angle = -15 time = <time_to_shake> motion = ease_in
				wait <time_to_shake> seconds
			endif
			if screenelementexists id = <shake_container>
				legacydoscreenelementmorph id = <shake_container> pos = (<pos>) scale = 1.0 rot_angle = 0 time = <time_to_shake>
			endif
		else
			if screenelementexists id = <shake_container>
				legacydoscreenelementmorph id = <shake_container> pos = (<pos> - (50.0, 0.0)) scale = 1.5 rot_angle = 10 time = <time_to_shake> motion = ease_in
				wait <time_to_shake> seconds
			endif
			if screenelementexists id = <shake_container>
				legacydoscreenelementmorph id = <shake_container> pos = (<pos> + (75.0, 0.0)) scale = 0.5 rot_angle = -15 time = <time_to_shake> motion = ease_in
				wait <time_to_shake> seconds
			endif
			if screenelementexists id = <shake_container>
				legacydoscreenelementmorph id = <shake_container> pos = (<pos>) scale = 1.0 rot_angle = 0 time = <time_to_shake> motion = ease_out
			endif
		endif
	endif
endscript

script hud_activated_star_power \{player = 1
		time = 0.2}
	spawnscriptnow hud_activated_star_power_spawned params = {<...>}
endscript

script hud_activated_star_power_spawned 
	wait \{1
		gameframe}
	extendcrcplayer hud2d_score_flash <player> out = new_flash
	if screenelementexists id = <new_flash>
		legacydoscreenelementmorph id = <new_flash> alpha = 1 scale = 5 time = <time>
		wait <time> seconds
		if screenelementexists id = <new_flash>
			legacydoscreenelementmorph id = <new_flash> alpha = 0 scale = 1 time = (<time> / 2.0)
		endif
		updatenixie player = <player>
	endif
endscript

script starmeter_show_hide_notestreak \{time = 0.1
		show = 1}
	if ($end_credits = 1 || $cheat_performancemode = 1)
		return
	endif
	gamemode_gettype
	if screenelementexists \{id = hud_root}
		if screenelementexists \{id = hud_star_meter_id}
			<shown_pos> = (8.0, 75.0)
			<hidden_pos> = (8.0, 15.0)
			if (<type> != career)
				if (<show> = 1)
					hud_star_meter_id :se_setprops streak_pos = <shown_pos> time = <time>
				elseif (<show> = 0)
					hud_star_meter_id :se_setprops streak_pos = <hidden_pos> time = <time>
				endif
			else
				if (<show> = 1)
					if hud_star_meter_id :desc_resolvealias \{name = alias_streak
							param = id}
						<id> :se_setprops alpha = 1.0 time = 0.1
					endif
				elseif (<show> = 0)
					if hud_star_meter_id :desc_resolvealias \{name = alias_streak
							param = id}
						<id> :se_setprops alpha = 0.0 time = 0.1
					endif
				endif
			endif
		endif
	endif
endscript

script hud_fx_flash_se 
	<time> = 0.2
	obj_getid
	onexitrun hud_flash_red_band_done params = {id = <objid>}
	begin
	se_setprops alpha = 0 time = <time>
	se_waitprops
	se_setprops alpha = 1 time = <time>
	se_waitprops
	repeat
endscript

script hud_fx_flash_se_done 
	if screenelementexists id = <id>
		<id> :se_setprops alpha = 1
	endif
endscript
