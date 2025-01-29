g_flash_red_going_p1 = 0
g_flash_red_going_p2 = 0
g_flash_red_going_p3 = 0
g_flash_red_going_p4 = 0
g_hud_2d_struct_used = {
}

script create_2d_hud_elements \{Player = 1}
	Change \{g_flash_red_going_p1 = 0}
	Change \{g_flash_red_going_p2 = 0}
	Change \{old_animate_bulbs_star_power_p1 = 0.0}
	Change \{old_animate_bulbs_star_power_p2 = 0.0}
	if StructureContains \{structure = $g_hud_2d_struct_used
			elements}
		GetArraySize (($g_hud_2d_struct_used).elements)
		parent_scale = (($g_hud_2d_struct_used).Scale)
		old_parent = <parent>
		if NOT (<array_Size> = 0)
			i = 0
			begin
			just = [left top]
			zoff = 0.0
			rot = 0.0
			alpha = 1
			pos_off = (0.0, 0.0)
			AddParams (($g_hud_2d_struct_used).elements [<i>])
			element_struct = (($g_hud_2d_struct_used).elements [<i>])
			if StructureContains structure = <element_struct> parent_container
				if StructureContains structure = <element_struct> element_parent
					extendcrcplayer <element_parent> <Player> out = container_parent
					if NOT ScreenElementExists id = <container_parent>
						ExtendCrc <element_parent> 'p1' out = container_parent
					endif
				else
					container_parent = <old_parent>
				endif
				container_pos = (0.0, 0.0)
				getnumplayersingame
				if StructureContains structure = <element_struct> pos_type
					<container_pos> = (($g_hud_2d_struct_used).<pos_type>)
					if (<Player> = 2)
						ExtendCrc <pos_type> '_p2' out = new_pos_type
						<container_pos> = (($g_hud_2d_struct_used).<new_pos_type>)
					elseif (<Player> = 3)
						ExtendCrc <pos_type> '_p3' out = new_pos_type
						<container_pos> = (($g_hud_2d_struct_used).<new_pos_type>)
					elseif (<Player> = 4)
						ExtendCrc <pos_type> '_p4' out = new_pos_type
						<container_pos> = (($g_hud_2d_struct_used).<new_pos_type>)
					elseif NOT (<num_players> = 1)
						ExtendCrc <pos_type> '_p1' out = new_pos_type
						<container_pos> = (($g_hud_2d_struct_used).<new_pos_type>)
					endif
				endif
				if StructureContains structure = <element_struct> note_streak_bar
					if StructureContains structure = ($g_hud_2d_struct_used) offscreen_note_streak_bar_off
						<container_pos> = (<container_pos> + (($g_hud_2d_struct_used).offscreen_note_streak_bar_off))
					else
						if (<Player> = 1)
							<container_pos> = (<container_pos> + (($g_hud_2d_struct_used).offscreen_note_streak_bar_off_p1))
						elseif (<Player> = 2)
							<container_pos> = (<container_pos> + (($g_hud_2d_struct_used).offscreen_note_streak_bar_off_p2))
						elseif (<Player> = 3)
							<container_pos> = (<container_pos> + (($g_hud_2d_struct_used).offscreen_note_streak_bar_off_p3))
						elseif (<Player> = 4)
							<container_pos> = (<container_pos> + (($g_hud_2d_struct_used).offscreen_note_streak_bar_off_p4))
						endif
					endif
				endif
				<container_pos> = (<container_pos> + <pos_off>)
				extendcrcplayer <element_id> <Player> out = new_id
				<create_it> = 1
				if StructureContains structure = <element_struct> create_once
					ExtendCrc <element_id> 'p1' out = p1_id
					if ScreenElementExists id = <p1_id>
						<create_it> = 0
					endif
				endif
				if ((StructureContains structure = <element_struct> rot_p2) && (<Player> = 2))
					<rot> = <rot_p2>
				endif
				if (<create_it>)
					CreateScreenElement {
						Type = ContainerElement
						parent = <container_parent>
						id = <new_id>
						Pos = <container_pos>
						rot_angle = <rot>
						z_priority = <z_off>
					}
				endif
				parent = <new_id>
			endif
			if StructureContains structure = <element_struct> container
				if NOT StructureContains structure = <element_struct> parent_container
					extendcrcplayer <element_id> <Player> out = new_id
					extendcrcplayer <element_parent> <Player> out = myParent
					if StructureContains structure = <element_struct> small_bulb
						scaled_dims = (<element_dims> * (($g_hud_2d_struct_used).small_bulb_scale))
					else
						scaled_dims = (<element_dims> * (($g_hud_2d_struct_used).big_bulb_scale))
					endif
					if ((StructureContains structure = <element_struct> pos_off_p2) && (<Player> = 2))
						<pos_off> = <pos_off_p2>
					endif
					<create_it> = 1
					if StructureContains structure = <element_struct> create_once
						ExtendCrc <element_id> 'p1' out = p1_id
						if ScreenElementExists id = <p1_id>
							<create_it> = 0
						endif
					endif
					if (<create_it>)
						CreateScreenElement {
							Type = SpriteElement
							parent = <myParent>
							id = <new_id>
							texture = <texture>
							Pos = <pos_off>
							just = <just>
							rgba = [255 255 255 255]
							rot_angle = <rot>
							z_priority = <zoff>
							alpha = <alpha>
							dims = <scaled_dims>
						}
						<new_id> :SetTags morph = 0 index = <i>
						<parent> = <id>
						<rot> = 0.0
						<Pos> = (0.0, 0.0)
						if StructureContains structure = <element_struct> initial_pos
							if ((StructureContains structure = <element_struct> initial_pos_p2) && (<Player> = 2))
								SetScreenElementProps id = <new_id> Pos = <initial_pos_p2>
								<new_id> :SetTags final_pos = <pos_off_p2> initial_pos = <initial_pos_p2> morph = 1
							else
								SetScreenElementProps id = <new_id> Pos = <initial_pos>
								<new_id> :SetTags final_pos = <pos_off> initial_pos = <initial_pos> morph = 1
							endif
						endif
					endif
				endif
			else
				if NOT StructureContains structure = <element_struct> parent_container
					extendcrcplayer <element_id> <Player> out = new_id
					if StructureContains structure = <element_struct> initial_pos
						<pos_off> = <initial_pos>
					endif
					if StructureContains structure = <element_struct> battle_pos
						if (<Player> = 4)
							<container_pos> = (($g_hud_2d_struct_used).rock_pos_p4)
							ExtendCrc <pos_type> '_p4' out = new_pos_type
							<pos_off> = ((($g_hud_2d_struct_used).<new_pos_type>))
						elseif (<Player> = 3)
							<container_pos> = (($g_hud_2d_struct_used).rock_pos_p3)
							ExtendCrc <pos_type> '_p3' out = new_pos_type
							<pos_off> = ((($g_hud_2d_struct_used).<new_pos_type>))
						elseif (<Player> = 2)
							<container_pos> = (($g_hud_2d_struct_used).rock_pos_p2)
							ExtendCrc <pos_type> '_p2' out = new_pos_type
							<pos_off> = ((($g_hud_2d_struct_used).<new_pos_type>))
						else
							<container_pos> = (($g_hud_2d_struct_used).rock_pos_p1)
							ExtendCrc <pos_type> '_p1' out = new_pos_type
							<pos_off> = ((($g_hud_2d_struct_used).<new_pos_type>))
						endif
					endif
					extendcrcplayer <element_parent> <Player> out = myParent
					flags = {}
					if StructureContains structure = <element_struct> flags
						if StructureContains structure = (<element_struct>.flags) flip_v
							if StructureContains structure = (<element_struct>.flags) p1
								if (<Player> = 1)
									<flags> = flip_v
								endif
							endif
						endif
						if StructureContains structure = (<element_struct>.flags) flip_h
							if StructureContains structure = (<element_struct>.flags) p1
								if (<Player> = 1)
									<flags> = flip_h
								endif
							endif
							if StructureContains structure = (<element_struct>.flags) p2
								if (<Player> = 2)
									<flags> = flip_h
								endif
							endif
						endif
					endif
					mydims = {}
					if StructureContains structure = <element_struct> dims
						<mydims> = <dims>
					endif
					<create_it> = 1
					if StructureContains structure = <element_struct> create_once
						ExtendCrc <element_id> 'p1' out = p1_id
						if ScreenElementExists id = <p1_id>
							<create_it> = 0
						endif
					endif
					if ((StructureContains structure = <element_struct> initial_pos_p2) && (<Player> = 2))
						<pos_off> = <initial_pos_p2>
					elseif ((StructureContains structure = <element_struct> pos_off_p2) && (<Player> = 2))
						<pos_off> = <pos_off_p2>
					endif
					my_rgba = [255 255 255 255]
					if (StructureContains structure = <element_struct> rgba)
						<my_rgba> = <rgba>
					endif
					if (<create_it>)
						CreateScreenElement {
							Type = SpriteElement
							parent = <myParent>
							id = <new_id>
							texture = <texture>
							Pos = <pos_off>
							rgba = <my_rgba>
							just = <just>
							z_priority = <zoff>
							alpha = <alpha>
							<flags>
							rot_angle = <rot>
							dims = <mydims>
						}
					endif
					if StructureContains structure = <element_struct> Scale
						if (<create_it>)
							GetScreenElementDims id = <new_id>
							new_width = (<width> * <Scale>)
							new_height = (<height> * <Scale>)
							SetScreenElementProps id = <new_id> dims = (((1.0, 0.0) * <new_width>) + ((0.0, 1.0) * <new_height>))
						endif
					endif
				endif
			endif
			if StructureContains structure = <element_struct> tube
				ExtendCrc <new_id> 'tube' out = new_child_id
				<zoff> = (<tube>.zoff)
				<alpha> = (<tube>.alpha)
				extendcrcplayer <element_parent> <Player> out = myParent
				if StructureContains structure = <element_struct> small_bulb
					scaled_dims = (<tube>.element_dims * (($g_hud_2d_struct_used).small_bulb_scale))
				else
					scaled_dims = (<tube>.element_dims * (($g_hud_2d_struct_used).big_bulb_scale))
				endif
				if ScreenElementExists id = <myParent>
					CreateScreenElement {
						Type = SpriteElement
						parent = <myParent>
						id = <new_child_id>
						texture = (<tube>.texture)
						Pos = (<pos_off> + (<tube>.pos_off))
						rgba = [255 255 255 255]
						dims = <scaled_dims>
						just = [center bottom]
						z_priority = <zoff>
						alpha = <alpha>
					}
					<parent> = <id>
					<new_child_id> :SetTags morph = 0 old_dims = <element_dims>
					if StructureContains structure = <element_struct> initial_pos
						SetScreenElementProps id = <new_child_id> Pos = (<initial_pos> + (<tube>.pos_off))
						<new_child_id> :SetTags {
							final_pos = (<pos_off> + (<tube>.pos_off))
							initial_pos = (<initial_pos> + (<tube>.pos_off))
							morph = 1
						}
					endif
				endif
			endif
			if StructureContains structure = <element_struct> full
				ExtendCrc <new_id> 'full' out = new_child_id
				<zoff> = (<full>.zoff)
				<alpha> = (<full>.alpha)
				extendcrcplayer <element_parent> <Player> out = myParent
				if StructureContains structure = <element_struct> small_bulb
					scaled_dims = (<element_dims> * (($g_hud_2d_struct_used).small_bulb_scale))
				else
					scaled_dims = (<element_dims> * (($g_hud_2d_struct_used).big_bulb_scale))
				endif
				if ScreenElementExists id = <myParent>
					CreateScreenElement {
						Type = SpriteElement
						parent = <myParent>
						id = <new_child_id>
						texture = (<full>.texture)
						Pos = <pos_off>
						rgba = [255 255 255 255]
						dims = <scaled_dims>
						just = <just>
						z_priority = <zoff>
						alpha = <alpha>
					}
					<new_child_id> :SetTags morph = 0
					if StructureContains structure = <element_struct> initial_pos
						SetScreenElementProps id = <new_child_id> Pos = <initial_pos>
						<new_child_id> :SetTags final_pos = <pos_off> initial_pos = <initial_pos> morph = 1
					endif
				endif
			endif
			<i> = (<i> + 1)
			repeat <array_Size>
		endif
	endif
	extendcrcplayer HUD2D_Score_Text <Player> out = new_id
	extendcrcplayer HUD2D_score_container <Player> out = new_score_container
	score_text_pos = (222.0, 70.0)
	if ($game_mode = gh4_p2_career || $game_mode = p2_coop || $game_mode = p2_quickplay)
		<score_text_pos> = (226.0, 85.0)
	endif
	if ScreenElementExists id = <new_score_container>
		displayText {
			parent = <new_score_container>
			id = <new_id>
			font = fontgrid_numeral_a1
			Pos = <score_text_pos>
			z = 20
			Scale = (1.1, 1.1)
			just = [right right]
			rgba = [255 255 255 255]
		}
		SetScreenElementProps id = <id> font_spacing = 5
	endif
	i = 1
	begin
	formatText checksumName = note_streak_text_id 'HUD2D_Note_Streak_Text_%d' d = <i>
	extendcrcplayer <note_streak_text_id> <Player> out = new_id
	extendcrcplayer HUD2D_note_container <Player> out = new_note_container
	if ScreenElementExists id = <new_note_container>
		if (<i> = 1)
			rgba = [15 15 70 200]
			note_text_spacing = (-35.0, 0.0)
		else
			rgba = [230 230 230 200]
			note_text_spacing = (-37.0, 0.0)
		endif
		displayText {
			parent = <new_note_container>
			id = <new_id>
			font = fontgrid_numeral_a1
			text = qs(0x3bf547a6)
			Pos = ((222.0, 78.0) + (<i> * <note_text_spacing>))
			z = 25
			just = [center center]
			rgba = <rgba>
			noshadow
		}
		<id> :SetTags intial_pos = ((222.0, 78.0) + (<i> * <note_text_spacing>))
	endif
	<i> = (<i> + 1)
	repeat 4
endscript

script rock_meter_star_power_on 
	SpawnScriptNow rock_back_and_forth_star_meter params = {Player = <Player>}
	formatText checksumName = player_spawned_scriptid 'player_spawned_scriptid_p%d' d = <Player>
	SpawnScriptNow {
		pulsate_all_star_power_bulbs params = {Player = <Player>}
		id = <player_spawned_scriptid>
	}
	i = 1
	begin
	formatText checksumName = id 'HUD2D_rock_tube_%d' d = <i>
	extendcrcplayer <id> <Player> out = parent_id
	if ScreenElementExists id = <parent_id>
		<parent_id> :GetTags
		if (<morph> = 1)
			SetScreenElementProps id = <parent_id> Pos = <final_pos> time = 0.4
		endif
		ExtendCrc <parent_id> 'tube' out = child_id
		<child_id> :GetTags
		SetScreenElementProps id = <child_id> texture = (($g_hud_2d_struct_used).elements [<index>].tube.star_texture)
		if (<morph> = 1)
			SetScreenElementProps id = <child_id> Pos = <final_pos> time = 0.4
		endif
		ExtendCrc <parent_id> 'full' out = child_id
		<child_id> :GetTags
		SetScreenElementProps id = <child_id> texture = (($g_hud_2d_struct_used).elements [<index>].full.star_texture)
		if (<morph> = 1)
			SetScreenElementProps id = <child_id> Pos = <final_pos> time = 0.4
			Wait \{0.2
				Seconds}
		endif
	endif
	<i> = (<i> + 1)
	repeat 6
endscript

script kill_pulsate_star_power_bulbs 
	formatText checksumName = player_spawned_scriptid 'player_spawned_scriptid_p%d' d = <Player>
	KillSpawnedScript id = <player_spawned_scriptid>
	KillPulsateStarPowerBulbs Player = <Player>
endscript

script pulsate_star_power_bulb 
	begin
	alpha_time = Random (@ 0.1 @*2 0.5 )
	if ScreenElementExists id = <bulb_checksum>
		ExtendCrc <bulb_checksum> 'tube' out = child_id
		legacydoscreenelementmorph id = <child_id> alpha = 0.3 time = <alpha_time> motion = ease_in
		ExtendCrc <bulb_checksum> 'full' out = child_id
		legacydoscreenelementmorph id = <child_id> alpha = 0.3 time = <alpha_time> motion = ease_in
	endif
	Wait <alpha_time> Seconds
	alpha_time = Random (@ 0.1 @*2 0.5 )
	if ScreenElementExists id = <bulb_checksum>
		ExtendCrc <bulb_checksum> 'tube' out = child_id
		<child_id> :GetTags
		legacydoscreenelementmorph id = <child_id> alpha = <old_alpha> time = <alpha_time> motion = ease_out
		ExtendCrc <bulb_checksum> 'full' out = child_id
		<child_id> :GetTags
		legacydoscreenelementmorph id = <child_id> alpha = <old_alpha> time = <alpha_time> motion = ease_out
	endif
	Wait <alpha_time> Seconds
	repeat
endscript

script pulsate_big_glow 
	extendcrcplayer HUD2D_rock_glow <Player> out = parent_id
	if NOT ScreenElementExists id = <parent_id>
		return
	endif
	begin
	if NOT ScreenElementExists id = <parent_id>
		return
	endif
	<parent_id> :legacydomorph alpha = 0 rgba = [95 205 255 255] time = 1 motion = ease_in
	if NOT ScreenElementExists id = <parent_id>
		return
	endif
	<parent_id> :legacydomorph alpha = 1 rgba = [255 255 255 255] time = 1 motion = ease_out
	repeat
endscript

script pulsate_all_star_power_bulbs 
	<i> = 1
	begin
	formatText checksumName = id 'HUD2D_rock_tube_%d' d = <i>
	extendcrcplayer <id> <Player> out = parent_id
	if ScreenElementExists id = <parent_id>
		formatText checksumName = player_spawned_scriptid 'player_spawned_scriptid_p%d' d = <Player>
		SpawnScriptNow {
			pulsate_star_power_bulb params = {bulb_checksum = <parent_id>}
			id = <player_spawned_scriptid>
		}
	endif
	<i> = (<i> + 1)
	repeat 6
	extendcrcplayer HUD2D_rock_glow <Player> out = parent_id
	if ScreenElementExists id = <parent_id>
		formatText checksumName = player_spawned_scriptid 'player_spawned_scriptid_p%d' d = <Player>
		SpawnScriptNow {
			pulsate_big_glow params = {<...>}
			id = <player_spawned_scriptid>
		}
	endif
endscript

script rock_back_and_forth_star_meter 
	move_up_and_down = 1
	if ($game_mode = gh4_p1_career || $game_mode = p1_quickplay || $game_mode = p2_quickplay || $game_mode = gh4_p2_career || $game_mode = p2_coop)
		extendcrcplayer HUD2D_rock_container <Player> out = shake_container
	elseif ($game_mode = p2_pro_faceoff)
		extendcrcplayer HUD2D_score_container <Player> out = shake_container
		<move_up_and_down> = 0
	endif
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

script rock_meter_star_power_off \{Player = 1}
	j = 6
	begin
	formatText checksumName = id 'HUD2D_rock_tube_%d' d = <j>
	extendcrcplayer <id> <Player> out = parent_id
	if ScreenElementExists id = <parent_id>
		<parent_id> :GetTags
		if (<morph> = 1)
			if ScreenElementExists id = <parent_id>
				legacydoscreenelementmorph id = <parent_id> Pos = (<final_pos> + <final_pos> * 0.1) time = 0.1
			endif
			Wait \{0.1
				Seconds}
			if ScreenElementExists id = <parent_id>
				legacydoscreenelementmorph id = <parent_id> Pos = <initial_pos> time = 0.4
			endif
			Wait \{0.1
				Seconds}
		endif
		ExtendCrc <parent_id> 'tube' out = child_id
		if ScreenElementExists id = <child_id>
			<child_id> :GetTags
			SetScreenElementProps id = <child_id> texture = (($g_hud_2d_struct_used).elements [<index>].tube.texture)
			if (<morph>)
				SetScreenElementProps id = <child_id> Pos = <initial_pos>
			endif
		endif
		ExtendCrc <parent_id> 'full' out = child_id
		if ScreenElementExists id = <child_id>
			<child_id> :GetTags
			SetScreenElementProps id = <child_id> texture = (($g_hud_2d_struct_used).elements [<index>].full.texture)
			if (<morph>)
				SetScreenElementProps id = <child_id> Pos = <initial_pos>
			endif
		endif
	endif
	<j> = (<j> -1)
	repeat 6
endscript

script hud_activated_star_power \{Player = 1
		time = 0.2}
	SpawnScriptNow hud_activated_star_power_spawned params = {<...>}
endscript

script hud_activated_star_power_spawned 
	Wait \{1
		gameframe}
	SpawnScriptNow kill_pulsate_star_power_bulbs params = {Player = <Player>}
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

script hud_move_note_scorebar \{Player = 1
		time = 0.5
		in = 1}
	if ($end_credits = 1 || $Cheat_PerformanceMode = 1)
		return
	endif
	if (($game_mode = gh4_p2_career || $game_mode = p2_coop || $game_mode = p2_quickplay) && (<Player> = 2))
		return
	endif
	if NOT StructureContains structure = ($g_hud_2d_struct_used) offscreen_note_streak_bar_off
		if NOT StructureContains structure = ($g_hud_2d_struct_used) offscreen_note_streak_bar_off_p1
			return
		endif
	endif
	morph_miss_off = (0.0, 60.0)
	ease_off = (0.0, 10.0)
	count_off = offscreen_note_streak_bar_off
	getnumplayersingame
	if (<Player> = 1)
		if ($game_mode = gh4_p2_career || $game_mode = p2_coop || $game_mode = p2_quickplay)
			count_pos = counter_pos
		elseif (<num_players> > 1)
			count_pos = counter_pos_p1
			morph_miss_off = (60.0, 0.0)
			ease_off = (10.0, 0.0)
			count_off = offscreen_note_streak_bar_off_p1
		else
			count_pos = counter_pos
		endif
	elseif (<Player> = 2)
		count_pos = counter_pos_p2
		morph_miss_off = (-60.0, 0.0)
		ease_off = (-10.0, 0.0)
		count_off = offscreen_note_streak_bar_off_p2
	elseif (<Player> = 3)
		count_pos = counter_pos_p3
		morph_miss_off = (-60.0, 0.0)
		ease_off = (-10.0, 0.0)
		count_off = offscreen_note_streak_bar_off_p3
	elseif (<Player> = 4)
		count_pos = counter_pos_p4
		morph_miss_off = (-60.0, 0.0)
		ease_off = (-10.0, 0.0)
		count_off = offscreen_note_streak_bar_off_p4
	else
		return
	endif
	if (<in> = 1)
		extendcrcplayer HUD2D_note_container <Player> out = new_container
		if ScreenElementExists id = <new_container>
			legacydoscreenelementmorph id = <new_container> Pos = ((($g_hud_2d_struct_used).<count_pos>) - <morph_miss_off>) time = <time> motion = ease_out
			Wait <time> Seconds
			if ScreenElementExists id = <new_container>
				legacydoscreenelementmorph id = <new_container> Pos = (($g_hud_2d_struct_used).<count_pos>) time = (<time> / 3) motion = ease_in
				<new_container> :legacydomorph Pos = {<ease_off> relative} time = 0.1 motion = ease_out
				<new_container> :legacydomorph Pos = {(<ease_off> * -1) relative} time = 0.1 motion = ease_in
			endif
		endif
	else
		extendcrcplayer HUD2D_note_container <Player> out = new_container
		if ScreenElementExists id = <new_container>
			if ($game_mode = gh4_p1_career || $game_mode = gh4_p2_career || $game_mode = p1_quickplay || $game_mode = p2_quickplay || $game_mode = p2_coop)
				legacydoscreenelementmorph id = <new_container> Pos = ((($g_hud_2d_struct_used).<count_pos>) - <morph_miss_off>) time = (<time> / 2.0) motion = ease_out
			else
				legacydoscreenelementmorph id = <new_container> Pos = ((($g_hud_2d_struct_used).<count_pos>) + <morph_miss_off>) time = (<time> / 2.0) motion = ease_in
			endif
			Wait <time> Seconds
			if ScreenElementExists id = <new_container>
				legacydoscreenelementmorph id = <new_container> Pos = ((($g_hud_2d_struct_used).<count_pos>) + (($g_hud_2d_struct_used).<count_off>)) time = <time>
			endif
		endif
	endif
endscript
old_animate_bulbs_star_power_p1 = 0.0
old_animate_bulbs_star_power_p2 = 0.0
old_animate_bulbs_star_power_p3 = 0.0
old_animate_bulbs_star_power_p4 = 0.0

script hud_flash_red_band 
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

script hud_flash_red_band_done 
	if ScreenElementExists id = <id>
		<id> :se_setprops alpha = 1
	endif
endscript

script hud_lightning_alert 
	if playerinfoequals Player = <Player> part = vocals
		vocals_lightning_alert Player = <Player>
		return
	endif
	if NOT ScreenElementExists id = <alert_id>
		return
	endif
	formatText checksumName = streak_lightning_01 'HUD_lightning_01_%d' d = <Player>
	formatText checksumName = streak_lightning_03 'HUD_lightning_03_%d' d = <Player>
	formatText checksumName = streak_lightning_05 'HUD_lightning_05_%d' d = <Player>
	formatText checksumName = streak_lightning_07 'HUD_lightning_07_%d' d = <Player>
	GetScreenElementProps id = <alert_id>
	lightning_pos = (<Pos> - (0.0, 20.0))
	lightning_dims = (800.0, 100.0)
	lightning_time = 0.2
	if ScreenElementExists id = <streak_lightning_01>
		DestroyScreenElement id = <streak_lightning_01>
	endif
	CreateScreenElement {
		Type = SpriteElement
		id = <streak_lightning_01>
		texture = streak_lightning_01
		parent = <player_container>
		Pos = <lightning_pos>
		dims = <lightning_dims>
		just = [center top]
		z_priority = 45
		alpha = 0
	}
	if ScreenElementExists id = <streak_lightning_03>
		DestroyScreenElement id = <streak_lightning_03>
	endif
	CreateScreenElement {
		Type = SpriteElement
		id = <streak_lightning_03>
		texture = streak_lightning_03
		parent = <player_container>
		Pos = <lightning_pos>
		dims = <lightning_dims>
		just = [center top]
		z_priority = 45
		alpha = 0
	}
	if ScreenElementExists id = <streak_lightning_05>
		DestroyScreenElement id = <streak_lightning_05>
	endif
	CreateScreenElement {
		Type = SpriteElement
		id = <streak_lightning_05>
		texture = streak_lightning_05
		parent = <player_container>
		Pos = <lightning_pos>
		dims = <lightning_dims>
		just = [center top]
		z_priority = 45
		alpha = 0
	}
	if ScreenElementExists id = <streak_lightning_07>
		DestroyScreenElement id = <streak_lightning_07>
	endif
	CreateScreenElement {
		Type = SpriteElement
		id = <streak_lightning_07>
		texture = streak_lightning_07
		parent = <player_container>
		Pos = <lightning_pos>
		dims = <lightning_dims>
		just = [center top]
		z_priority = 45
		alpha = 0
	}
	if ScreenElementExists id = <streak_lightning_01>
		legacydoscreenelementmorph id = <streak_lightning_01> alpha = 1 time = <lightning_time>
		Wait <lightning_time> Seconds
	endif
	if ScreenElementExists id = <streak_lightning_01>
		legacydoscreenelementmorph id = <streak_lightning_01> alpha = 0 time = <lightning_time>
		if ScreenElementExists id = <streak_lightning_03>
			legacydoscreenelementmorph id = <streak_lightning_03> alpha = 1 time = <lightning_time>
		endif
		Wait <lightning_time> Seconds
	endif
	if ScreenElementExists id = <streak_lightning_03>
		legacydoscreenelementmorph id = <streak_lightning_03> alpha = 0 time = <lightning_time>
		if ScreenElementExists id = <streak_lightning_05>
			legacydoscreenelementmorph id = <streak_lightning_05> alpha = 1 time = <lightning_time>
		endif
		Wait <lightning_time> Seconds
	endif
	if ScreenElementExists id = <streak_lightning_05>
		legacydoscreenelementmorph id = <streak_lightning_05> alpha = 0 time = <lightning_time>
		if ScreenElementExists id = <streak_lightning_07>
			legacydoscreenelementmorph id = <streak_lightning_07> alpha = 1 time = <lightning_time>
		endif
		Wait <lightning_time> Seconds
	endif
	if ScreenElementExists id = <streak_lightning_07>
		legacydoscreenelementmorph id = <streak_lightning_07> alpha = 0 time = <lightning_time>
		Wait <lightning_time> Seconds
	endif
	if ScreenElementExists id = <streak_lightning_01>
		DestroyScreenElement id = <streak_lightning_01>
	endif
	if ScreenElementExists id = <streak_lightning_03>
		DestroyScreenElement id = <streak_lightning_03>
	endif
	if ScreenElementExists id = <streak_lightning_05>
		DestroyScreenElement id = <streak_lightning_05>
	endif
	if ScreenElementExists id = <streak_lightning_07>
		DestroyScreenElement id = <streak_lightning_07>
	endif
endscript

script hud_glowburst_alert \{Player = 1}
	formatText checksumName = hud_star_power_ready_glow 'star_power_ready_glow_%d' d = <Player>
	extendcrcplayer hud_destroygroup_window <Player> out = hud_destroygroup
	if ScreenElementExists id = <hud_star_power_ready_glow>
		DestroyScreenElement id = <hud_star_power_ready_glow>
	endif
	if ($game_mode = p2_pro_faceoff)
		if (<Player> = 1)
			original_pos = (($hud_screen_elements [0].Pos) - (225.0, 37.0))
		else
			original_pos = (($hud_screen_elements [0].Pos) + (225.0, -37.0))
		endif
		base_scale = (7.5, 0.5)
		scale2 = (10.0, 2.5)
		scale3 = (7.5, 0.25)
		scale4 = (40.0, 0.0)
	else
		if ($game_mode = gh4_p2_career || $game_mode = p2_coop || $game_mode = p2_quickplay)
			original_pos = (($hud_screen_elements [0].Pos) - (0.0, 36.0))
		else
			original_pos = (($hud_screen_elements [0].Pos) + (0.0, 7.0))
		endif
		base_scale = (15.0, 1.0)
		scale2 = (20.0, 5.0)
		scale3 = (15.0, 0.5)
		scale4 = (80.0, 0.0)
	endif
	if ScreenElementExists id = <hud_destroygroup>
		CreateScreenElement {
			Type = SpriteElement
			id = <hud_star_power_ready_glow>
			parent = <hud_destroygroup>
			texture = hud_star_power_ready_glow
			just = [center center]
			Pos = <original_pos>
			rgba = [245 255 200 255]
			Scale = <base_scale>
			alpha = 1
			z_priority = 50
		}
	endif
	if ScreenElementExists id = <hud_star_power_ready_glow>
		<hud_star_power_ready_glow> :legacydomorph Scale = <scale2> alpha = 0.5 motion = ease_out time = 0.1
	endif
	if ScreenElementExists id = <hud_star_power_ready_glow>
		<hud_star_power_ready_glow> :legacydomorph Scale = <scale3> alpha = 0.5 rgba = [245 255 160 255] motion = ease_out time = 0.1
	endif
	if ScreenElementExists id = <hud_star_power_ready_glow>
		<hud_star_power_ready_glow> :legacydomorph Scale = <scale4> alpha = 0 motion = ease_in time = 0.8
	endif
	if ScreenElementExists id = <hud_star_power_ready_glow>
		DestroyScreenElement id = <hud_star_power_ready_glow>
	endif
endscript

script hud_flip_note_streak_num 
	repeat_num = <dial_num>
	begin
	formatText checksumName = id 'HUD2D_Note_Streak_Text_%dp%i' d = <dial_num> i = <Player>
	if NOT ScreenElementExists id = <id>
		return
	endif
	<id> :GetTags
	GetScreenElementProps id = <id>
	basePos = <Pos>
	SetScreenElementProps id = <id> Pos = (<basePos> + (0.0, 10.0)) alpha = 0
	SetScreenElementProps id = <id> Pos = <intial_pos> alpha = 1 time = 0.1
	<dial_num> = (<dial_num> - 1)
	repeat <repeat_num>
endscript

script hud_hide_optional_vocals 
	vocals_get_num_vocalists
	if (<num_vocalists> = 0)
		if hud_root :desc_resolvealias \{Name = alias_v1
				param = vocals_id}
			<vocals_id> :se_setprops Hide
		endif
	endif
endscript

script hud_show_drumfill_score 
	getnumplayersingame
	if (<num_players> = 1)
		formatText TextName = text qs(0x9b704576) d = <score>
		hud_create_message Player = <Player> text = <text>
	endif
endscript

script hud_show_drumsolo_score 
	formatText TextName = text qs(0x8e2da9b3) d = <score>
	hud_create_message Player = <Player> text = <text>
endscript

script hud_show_drumfill_challenge 
	hud_create_message Player = <Player> text = qs(0x200e0af0)
endscript

script hud_move_flame_container \{Pos = (0.0, 0.0)
		Scale = (1.0, 1.0)
		time = 0.3
		highway_num = 1}
	get_highway_hud_root_id Player = <highway_num>
	if <highway_hud_root> :desc_resolvealias Name = alias_hud_message_fire param = flame_container
		<flame_container> :desc_resolvealias Name = alias_flame_container param = flame_id
	endif
	if GotParam \{flame_id}
		if ScreenElementExists id = <flame_id>
			if GotParam \{notestreak}
				SetScreenElementProps {
					id = {<flame_id> child = 0}
					alpha = 1
				}
				SetScreenElementProps {
					id = {<flame_id> child = 1}
					alpha = 0
				}
			elseif GotParam \{starpower}
				SetScreenElementProps {
					id = {<flame_id> child = 1}
					alpha = 1
				}
				SetScreenElementProps {
					id = {<flame_id> child = 0}
					alpha = 0
				}
			endif
			SetScreenElementProps {
				id = <flame_id>
				Pos = <Pos>
				Scale = <Scale>
				time = <time>
			}
		endif
	endif
endscript
