g_hud_2d_struct_used = {
}

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
	if ($end_credits = 1 || $Cheat_PerformanceMode = 1)
		return
	endif
	gamemode_gettype
	if ScreenElementExists \{id = hud_root}
		if ScreenElementExists \{id = hud_star_meter_id}
			<shown_pos> = (8.0, 75.0)
			<hidden_pos> = (8.0, 15.0)
			if (<Type> != career)
				if (<show> = 1)
					hud_star_meter_id :se_setprops streak_pos = <shown_pos> time = <time>
				elseif (<show> = 0)
					hud_star_meter_id :se_setprops streak_pos = <hidden_pos> time = <time>
				endif
			else
				if (<show> = 1)
					if hud_star_meter_id :desc_resolvealias \{Name = alias_streak
							param = id}
						<id> :se_setprops alpha = 1.0 time = 0.1
					endif
				elseif (<show> = 0)
					if hud_star_meter_id :desc_resolvealias \{Name = alias_streak
							param = id}
						<id> :se_setprops alpha = 0.0 time = 0.1
					endif
				endif
			endif
		endif
	endif
endscript
