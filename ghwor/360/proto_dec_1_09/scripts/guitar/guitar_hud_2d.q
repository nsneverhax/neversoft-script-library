g_hud_2d_struct_used = {
}

script hud_fx_shake_se \{shake_container = NULL}
	move_up_and_down = 1
	if ScreenElementExists id = <shake_container>
		GetScreenElementProps id = <shake_container>
		time_to_shake = 0.15
		if (<move_up_and_down> = 1)
			if ScreenElementExists id = <shake_container>
				legacydoscreenelementmorph id = <shake_container> Pos = (<Pos> - (0.0, 50.0)) Scale = 1.5 rot_angle = 10 time = <time_to_shake> motion = ease_in
				Wait <time_to_shake> Seconds
			endif
			if ScreenElementExists id = <shake_container>
				legacydoscreenelementmorph id = <shake_container> Pos = (<Pos> + (0.0, 75.0)) Scale = 0.5 rot_angle = -15 time = <time_to_shake> motion = ease_in
				Wait <time_to_shake> Seconds
			endif
			if ScreenElementExists id = <shake_container>
				legacydoscreenelementmorph id = <shake_container> Pos = (<Pos>) Scale = 1.0 rot_angle = 0 time = <time_to_shake>
			endif
		else
			if ScreenElementExists id = <shake_container>
				legacydoscreenelementmorph id = <shake_container> Pos = (<Pos> - (50.0, 0.0)) Scale = 1.5 rot_angle = 10 time = <time_to_shake> motion = ease_in
				Wait <time_to_shake> Seconds
			endif
			if ScreenElementExists id = <shake_container>
				legacydoscreenelementmorph id = <shake_container> Pos = (<Pos> + (75.0, 0.0)) Scale = 0.5 rot_angle = -15 time = <time_to_shake> motion = ease_in
				Wait <time_to_shake> Seconds
			endif
			if ScreenElementExists id = <shake_container>
				legacydoscreenelementmorph id = <shake_container> Pos = (<Pos>) Scale = 1.0 rot_angle = 0 time = <time_to_shake> motion = ease_out
			endif
		endif
	endif
endscript

script hud_activated_star_power \{Player = 1
		time = 0.2}
	SpawnScriptNow hud_activated_star_power_spawned params = {<...>}
endscript

script hud_activated_star_power_spawned 
	Wait \{1
		gameframe}
	extendcrcplayer HUD2D_score_flash <Player> out = new_flash
	if ScreenElementExists id = <new_flash>
		legacydoscreenelementmorph id = <new_flash> alpha = 1 Scale = 5 time = <time>
		Wait <time> Seconds
		if ScreenElementExists id = <new_flash>
			legacydoscreenelementmorph id = <new_flash> alpha = 0 Scale = 1 time = (<time> / 2.0)
		endif
		UpdateNixie Player = <Player>
	endif
endscript

script starmeter_show_hide_notestreak \{time = 0.1
		show = 1}
	getnumplayersingame
	if (<num_players> != 1)
		return
	endif
	if ($end_credits = 1 || $Cheat_PerformanceMode = 1)
		return
	endif
	if ScreenElementExists \{id = hud_root}
		if hud_root :desc_resolvealias \{Name = alias_hud_meter_star
				param = star_meter_id}
			<shown_pos> = (8.0, 75.0)
			<hidden_pos> = (8.0, 15.0)
			if (<show> = 1)
				<star_meter_id> :se_setprops streak_pos = <shown_pos> time = <time>
			elseif (<show> = 0)
				<star_meter_id> :se_setprops streak_pos = <hidden_pos> time = <time>
			endif
		endif
	endif
endscript

script hud_fx_flash_se 
	<time> = 0.2
	Obj_GetID
	OnExitRun hud_flash_red_band_done params = {id = <objID>}
	begin
	se_setprops alpha = 0 time = <time>
	se_waitprops
	se_setprops alpha = 1 time = <time>
	se_waitprops
	repeat
endscript

script hud_fx_flash_se_done 
	if ScreenElementExists id = <id>
		<id> :se_setprops alpha = 1
	endif
endscript
