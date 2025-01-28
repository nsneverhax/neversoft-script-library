g_flash_red_going_p1 = 0
g_flash_red_going_p2 = 0
g_hud_2d_struct_used = career_hud_2d_elements

script create_2d_hud_elements \{player_Text = 'p1'}
	Change \{g_flash_red_going_p1 = 0}
	Change \{g_flash_red_going_p2 = 0}
	Change \{old_animate_bulbs_star_power_p1 = 0.0}
	Change \{old_animate_bulbs_star_power_p2 = 0.0}
	GetArraySize (($g_hud_2d_struct_used).Elements)
	parent_scale = (($g_hud_2d_struct_used).Scale)
	old_parent = <PARENT>
	parent_z = (($g_hud_2d_struct_used).Z)
	I = 0
	begin
	just = [LEFT Top]
	myscale = 1.0
	zoff = 0.0
	rot = 0.0
	Alpha = 1
	pos_off = (0.0, 0.0)
	AddParams (($g_hud_2d_struct_used).Elements [<I>])
	element_struct = (($g_hud_2d_struct_used).Elements [<I>])
	if StructureContains Structure = <element_struct> parent_container
		if StructureContains Structure = <element_struct> element_parent
			ExtendCRC <element_parent> <player_Text> out = container_parent
			if NOT ScreenElementExists Id = <container_parent>
				ExtendCRC <element_parent> 'p1' out = container_parent
			endif
		else
			container_parent = <old_parent>
		endif
		Container_pos = (0.0, 0.0)
		if StructureContains Structure = <element_struct> pos_type
			<Container_pos> = (($g_hud_2d_struct_used).<pos_type>)
			if (<player_Text> = 'p2')
				ExtendCRC <pos_type> '_p2' out = new_pos_type
				<Container_pos> = (($g_hud_2d_struct_used).<new_pos_type>)
			else
				if ($current_num_players = 2)
					ExtendCRC <pos_type> '_p1' out = new_pos_type
					<Container_pos> = (($g_hud_2d_struct_used).<new_pos_type>)
				endif
			endif
		endif
		if StructureContains Structure = <element_struct> note_streak_bar
			if StructureContains Structure = ($g_hud_2d_struct_used) offscreen_note_streak_bar_off
				<Container_pos> = (<Container_pos> + (($g_hud_2d_struct_used).offscreen_note_streak_bar_off))
			else
				if (<player_Text> = 'p1')
					<Container_pos> = (<Container_pos> + (($g_hud_2d_struct_used).offscreen_note_streak_bar_off_p1))
				else
					<Container_pos> = (<Container_pos> + (($g_hud_2d_struct_used).offscreen_note_streak_bar_off_p2))
				endif
			endif
		endif
		<Container_pos> = (<Container_pos> + <pos_off>)
		ExtendCRC <element_id> <player_Text> out = new_id
		<create_it> = 1
		if StructureContains Structure = <element_struct> create_once
			ExtendCRC <element_id> 'p1' out = p1_id
			if ScreenElementExists Id = <p1_id>
				<create_it> = 0
			endif
		endif
		if ((StructureContains Structure = <element_struct> rot_p2) && (<player_Text> = 'p2'))
			<rot> = <rot_p2>
		endif
		if (<create_it>)
			CreateScreenElement {
				Type = ContainerElement
				PARENT = <container_parent>
				Id = <new_id>
				Pos = <Container_pos>
				Rot_Angle = <rot>
				z_priority = <z_off>
			}
		endif
		PARENT = <new_id>
	endif
	if StructureContains Structure = <element_struct> Container
		if NOT StructureContains Structure = <element_struct> parent_container
			ExtendCRC <element_id> <player_Text> out = new_id
			ExtendCRC <element_parent> <player_Text> out = myparent
			if StructureContains Structure = <element_struct> small_bulb
				scaled_dims = (<element_dims> * (($g_hud_2d_struct_used).small_bulb_scale))
			else
				scaled_dims = (<element_dims> * (($g_hud_2d_struct_used).big_bulb_scale))
			endif
			if ((StructureContains Structure = <element_struct> pos_off_p2) && (<player_Text> = 'p2'))
				<pos_off> = <pos_off_p2>
			endif
			<create_it> = 1
			if StructureContains Structure = <element_struct> create_once
				ExtendCRC <element_id> 'p1' out = p1_id
				if ScreenElementExists Id = <p1_id>
					<create_it> = 0
				endif
			endif
			if (<create_it>)
				CreateScreenElement {
					Type = SpriteElement
					PARENT = <myparent>
					Id = <new_id>
					texture = <texture>
					Pos = <pos_off>
					just = <just>
					rgba = [255 255 255 255]
					Rot_Angle = <rot>
					z_priority = <zoff>
					Alpha = <Alpha>
					Dims = <scaled_dims>
				}
				<new_id> :SetTags morph = 0
				<new_id> :SetTags Index = <I>
				<PARENT> = <Id>
				<rot> = 0.0
				<Pos> = (0.0, 0.0)
				if StructureContains Structure = <element_struct> initial_pos
					if ((StructureContains Structure = <element_struct> initial_pos_p2) && (<player_Text> = 'p2'))
						SetScreenElementProps Id = <new_id> Pos = <initial_pos_p2>
						<new_id> :SetTags final_pos = <pos_off_p2>
						<new_id> :SetTags initial_pos = <initial_pos_p2>
						<new_id> :SetTags morph = 1
					else
						SetScreenElementProps Id = <new_id> Pos = <initial_pos>
						<new_id> :SetTags final_pos = <pos_off>
						<new_id> :SetTags initial_pos = <initial_pos>
						<new_id> :SetTags morph = 1
					endif
				endif
			endif
		endif
	else
		if NOT StructureContains Structure = <element_struct> parent_container
			ExtendCRC <element_id> <player_Text> out = new_id
			if StructureContains Structure = <element_struct> initial_pos
				<pos_off> = <initial_pos>
			endif
			if StructureContains Structure = <element_struct> battle_pos
				if (<player_Text> = 'p2')
					<Container_pos> = (($g_hud_2d_struct_used).rock_pos_p2)
					ExtendCRC <pos_type> '_p2' out = new_pos_type
					<pos_off> = ((($g_hud_2d_struct_used).<new_pos_type>))
				else
					<Container_pos> = (($g_hud_2d_struct_used).rock_pos_p1)
					ExtendCRC <pos_type> '_p1' out = new_pos_type
					<pos_off> = ((($g_hud_2d_struct_used).<new_pos_type>))
				endif
			endif
			ExtendCRC <element_parent> <player_Text> out = myparent
			flags = {}
			if StructureContains Structure = <element_struct> flags
				if StructureContains Structure = (<element_struct>.flags) flip_v
					if StructureContains Structure = (<element_struct>.flags) P1
						if (<player_Text> = 'p1')
							<flags> = flip_v
						endif
					endif
				endif
				if StructureContains Structure = (<element_struct>.flags) flip_h
					if StructureContains Structure = (<element_struct>.flags) P1
						if (<player_Text> = 'p1')
							<flags> = flip_h
						endif
					endif
					if StructureContains Structure = (<element_struct>.flags) P2
						if (<player_Text> = 'p2')
							<flags> = flip_h
						endif
					endif
				endif
			endif
			mydims = {}
			if StructureContains Structure = <element_struct> Dims
				<mydims> = <Dims>
			endif
			<create_it> = 1
			if StructureContains Structure = <element_struct> create_once
				ExtendCRC <element_id> 'p1' out = p1_id
				if ScreenElementExists Id = <p1_id>
					<create_it> = 0
				endif
			endif
			if ((StructureContains Structure = <element_struct> initial_pos_p2) && (<player_Text> = 'p2'))
				<pos_off> = <initial_pos_p2>
			elseif ((StructureContains Structure = <element_struct> pos_off_p2) && (<player_Text> = 'p2'))
				<pos_off> = <pos_off_p2>
			endif
			my_rgba = [255 255 255 255]
			if (StructureContains Structure = <element_struct> rgba)
				<my_rgba> = <rgba>
			endif
			if (<create_it>)
				CreateScreenElement {
					Type = SpriteElement
					PARENT = <myparent>
					Id = <new_id>
					texture = <texture>
					Pos = <pos_off>
					rgba = <my_rgba>
					just = <just>
					z_priority = <zoff>
					Alpha = <Alpha>
					<flags>
					Rot_Angle = <rot>
					Dims = <mydims>
				}
			endif
			if StructureContains Structure = <element_struct> Scale
				if (<create_it>)
					GetScreenElementDims Id = <new_id>
					new_width = (<width> * <Scale>)
					new_height = (<Height> * <Scale>)
					SetScreenElementProps Id = <new_id> Dims = (((1.0, 0.0) * <new_width>) + ((0.0, 1.0) * <new_height>))
				endif
			endif
		endif
	endif
	if StructureContains Structure = <element_struct> tube
		ExtendCRC <new_id> 'tube' out = new_child_id
		<zoff> = (<tube>.zoff)
		<Alpha> = (<tube>.Alpha)
		ExtendCRC <element_parent> <player_Text> out = myparent
		if StructureContains Structure = <element_struct> small_bulb
			scaled_dims = (<tube>.element_dims * (($g_hud_2d_struct_used).small_bulb_scale))
		else
			scaled_dims = (<tube>.element_dims * (($g_hud_2d_struct_used).big_bulb_scale))
		endif
		if ScreenElementExists Id = <myparent>
			CreateScreenElement {
				Type = SpriteElement
				PARENT = <myparent>
				Id = <new_child_id>
				texture = (<tube>.texture)
				Pos = (<pos_off> + (<tube>.pos_off))
				rgba = [255 255 255 255]
				Dims = <scaled_dims>
				just = [Center Bottom]
				z_priority = <zoff>
				Alpha = <Alpha>
			}
			<PARENT> = <Id>
			<new_child_id> :SetTags morph = 0
			<new_child_id> :SetTags old_dims = <element_dims>
			if StructureContains Structure = <element_struct> initial_pos
				SetScreenElementProps Id = <new_child_id> Pos = (<initial_pos> + (<tube>.pos_off))
				<new_child_id> :SetTags {
					final_pos = (<pos_off> + (<tube>.pos_off))
					initial_pos = (<initial_pos> + (<tube>.pos_off))
					morph = 1
				}
			endif
		endif
	endif
	if StructureContains Structure = <element_struct> FULL
		ExtendCRC <new_id> 'full' out = new_child_id
		<zoff> = (<FULL>.zoff)
		<Alpha> = (<FULL>.Alpha)
		ExtendCRC <element_parent> <player_Text> out = myparent
		if StructureContains Structure = <element_struct> small_bulb
			scaled_dims = (<element_dims> * (($g_hud_2d_struct_used).small_bulb_scale))
		else
			scaled_dims = (<element_dims> * (($g_hud_2d_struct_used).big_bulb_scale))
		endif
		if ScreenElementExists Id = <myparent>
			CreateScreenElement {
				Type = SpriteElement
				PARENT = <myparent>
				Id = <new_child_id>
				texture = (<FULL>.texture)
				Pos = <pos_off>
				rgba = [255 255 255 255]
				Dims = <scaled_dims>
				just = <just>
				z_priority = <zoff>
				Alpha = <Alpha>
			}
			<new_child_id> :SetTags morph = 0
			if StructureContains Structure = <element_struct> initial_pos
				SetScreenElementProps Id = <new_child_id> Pos = <initial_pos>
				<new_child_id> :SetTags final_pos = <pos_off>
				<new_child_id> :SetTags initial_pos = <initial_pos>
				<new_child_id> :SetTags morph = 1
			endif
		endif
	endif
	<I> = (<I> + 1)
	repeat <array_Size>
	if NOT ($game_mode = p2_battle || $boss_battle = 1)
		ExtendCRC HUD2D_Score_Text <player_Text> out = new_id
		ExtendCRC HUD2D_score_container <player_Text> out = new_score_container
		score_text_pos = (222.0, 70.0)
		if ($game_mode = p2_career || $game_mode = p2_coop)
			<score_text_pos> = (226.0, 85.0)
		endif
		if ScreenElementExists Id = <new_score_container>
			displayText {
				PARENT = <new_score_container>
				Id = <new_id>
				font = num_a9
				Pos = <score_text_pos>
				Z = 20
				Scale = (1.1, 1.1)
				just = [RIGHT RIGHT]
				rgba = [255 255 255 255]
			}
			SetScreenElementProps Id = <Id> font_spacing = 5
		endif
		I = 1
		begin
		FormatText ChecksumName = note_streak_text_id 'HUD2D_Note_Streak_Text_%d' D = <I>
		ExtendCRC <note_streak_text_id> <player_Text> out = new_id
		ExtendCRC HUD2D_note_container <player_Text> out = new_note_container
		if ScreenElementExists Id = <new_note_container>
			if (<I> = 1)
				rgba = [15 15 70 200]
			else
				rgba = [230 230 230 200]
			endif
			displayText {
				PARENT = <new_note_container>
				Id = <new_id>
				font = num_a7
				Text = "0"
				Pos = ((222.0, 78.0) + (<I> * (-37.0, 0.0)))
				Z = 25
				just = [Center Center]
				rgba = <rgba>
				noshadow
			}
			<Id> :SetTags intial_pos = ((222.0, 78.0) + (<I> * (-37.0, 0.0)))
		endif
		<I> = (<I> + 1)
		repeat 4
	endif
endscript

script rock_meter_star_power_on 
	if ($game_mode = p2_career)
		<player_status> = player1_status
	endif
	FormatText TextName = player_Text 'p%d' D = ($<player_status>.Player)
	SpawnScriptNow rock_back_and_forth_star_meter Params = {player_status = <player_status> player_Text = <player_Text>}
	FormatText ChecksumName = player_spawned_scriptid 'player_spawned_scriptid_p%d' D = ($<player_status>.Player)
	SpawnScriptNow {
		pulsate_all_star_power_bulbs Params = {Player = ($<player_status>.Player) player_status = <player_status> player_Text = <player_Text>}
		Id = <player_spawned_scriptid>
	}
	I = 1
	begin
	FormatText ChecksumName = Id 'HUD2D_rock_tube_%d' D = <I>
	ExtendCRC <Id> <player_Text> out = parent_id
	if ScreenElementExists Id = <parent_id>
		<parent_id> :GetTags
		if (<morph> = 1)
			DoScreenElementMorph Id = <parent_id> Pos = <final_pos> Time = 0.4
		endif
		ExtendCRC <parent_id> 'tube' out = child_id
		<child_id> :GetTags
		SetScreenElementProps Id = <child_id> texture = (($g_hud_2d_struct_used).Elements [<Index>].tube.star_texture)
		if (<morph> = 1)
			DoScreenElementMorph Id = <child_id> Pos = <final_pos> Time = 0.4
		endif
		ExtendCRC <parent_id> 'full' out = child_id
		<child_id> :GetTags
		SetScreenElementProps Id = <child_id> texture = (($g_hud_2d_struct_used).Elements [<Index>].FULL.star_texture)
		if (<morph> = 1)
			DoScreenElementMorph Id = <child_id> Pos = <final_pos> Time = 0.4
			Wait \{0.2
				Seconds}
		endif
	endif
	<I> = (<I> + 1)
	repeat 6
endscript

script kill_pulsate_star_power_bulbs 
	FormatText ChecksumName = player_spawned_scriptid 'player_spawned_scriptid_p%d' D = <Player>
	KillSpawnedScript Id = <player_spawned_scriptid>
	KillPulsateStarPowerBulbs Player = <Player>
endscript

script pulsate_star_power_bulb 
	begin
	alpha_time = Random (@ 0.1 @*2 0.5 )
	if ScreenElementExists Id = <bulb_checksum>
		ExtendCRC <bulb_checksum> 'tube' out = child_id
		DoScreenElementMorph Id = <child_id> Alpha = 0.3 Time = <alpha_time> Motion = ease_in
		ExtendCRC <bulb_checksum> 'full' out = child_id
		DoScreenElementMorph Id = <child_id> Alpha = 0.3 Time = <alpha_time> Motion = ease_in
	endif
	Wait <alpha_time> Seconds
	alpha_time = Random (@ 0.1 @*2 0.5 )
	if ScreenElementExists Id = <bulb_checksum>
		ExtendCRC <bulb_checksum> 'tube' out = child_id
		<child_id> :GetTags
		DoScreenElementMorph Id = <child_id> Alpha = <old_alpha> Time = <alpha_time> Motion = ease_out
		ExtendCRC <bulb_checksum> 'full' out = child_id
		<child_id> :GetTags
		DoScreenElementMorph Id = <child_id> Alpha = <old_alpha> Time = <alpha_time> Motion = ease_out
	endif
	Wait <alpha_time> Seconds
	repeat
endscript

script pulsate_big_glow 
	ExtendCRC HUD2D_rock_glow <player_Text> out = parent_id
	if NOT ScreenElementExists Id = <parent_id>
		return
	endif
	begin
	if NOT ScreenElementExists Id = <parent_id>
		return
	endif
	<parent_id> :DoMorph Alpha = 0 rgba = [95 205 255 255] Time = 1 Motion = ease_in
	if NOT ScreenElementExists Id = <parent_id>
		return
	endif
	<parent_id> :DoMorph Alpha = 1 rgba = [255 255 255 255] Time = 1 Motion = ease_out
	repeat
endscript

script pulsate_all_star_power_bulbs 
	<I> = 1
	begin
	FormatText ChecksumName = Id 'HUD2D_rock_tube_%d' D = <I>
	ExtendCRC <Id> <player_Text> out = parent_id
	if ScreenElementExists Id = <parent_id>
		FormatText ChecksumName = player_spawned_scriptid 'player_spawned_scriptid_p%d' D = <Player>
		SpawnScriptNow {
			pulsate_star_power_bulb Params = {bulb_checksum = <parent_id>}
			Id = <player_spawned_scriptid>
		}
	endif
	<I> = (<I> + 1)
	repeat 6
	ExtendCRC HUD2D_rock_glow <player_Text> out = parent_id
	if ScreenElementExists Id = <parent_id>
		FormatText ChecksumName = player_spawned_scriptid 'player_spawned_scriptid_p%d' D = <Player>
		SpawnScriptNow {
			pulsate_big_glow Params = {<...>}
			Id = <player_spawned_scriptid>
		}
	endif
endscript

script rock_back_and_forth_star_meter 
	move_up_and_down = 1
	if ($game_mode = p1_career || $game_mode = p1_quickplay || $game_mode = p2_career || $game_mode = p2_coop)
		ExtendCRC HUD2D_rock_container <player_Text> out = shake_container
	elseif ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff)
		ExtendCRC HUD2D_score_container <player_Text> out = shake_container
		<move_up_and_down> = 0
	endif
	if ScreenElementExists Id = <shake_container>
		GetScreenElementProps Id = <shake_container>
		time_to_shake = 0.15
		if (<move_up_and_down> = 1)
			if ScreenElementExists Id = <shake_container>
				DoScreenElementMorph Id = <shake_container> Pos = (<Pos> - (0.0, 50.0)) Scale = 1.5 Rot_Angle = 10 Time = <time_to_shake> Motion = ease_in
				Wait <time_to_shake> Seconds
			endif
			if ScreenElementExists Id = <shake_container>
				DoScreenElementMorph Id = <shake_container> Pos = (<Pos> + (0.0, 75.0)) Scale = 0.5 Rot_Angle = -15 Time = <time_to_shake> Motion = ease_in
				Wait <time_to_shake> Seconds
			endif
			if ScreenElementExists Id = <shake_container>
				DoScreenElementMorph Id = <shake_container> Pos = (<Pos>) Scale = 1.0 Rot_Angle = 0 Time = <time_to_shake>
			endif
		else
			if ScreenElementExists Id = <shake_container>
				DoScreenElementMorph Id = <shake_container> Pos = (<Pos> - (50.0, 0.0)) Scale = 1.5 Rot_Angle = 10 Time = <time_to_shake> Motion = ease_in
				Wait <time_to_shake> Seconds
			endif
			if ScreenElementExists Id = <shake_container>
				DoScreenElementMorph Id = <shake_container> Pos = (<Pos> + (75.0, 0.0)) Scale = 0.5 Rot_Angle = -15 Time = <time_to_shake> Motion = ease_in
				Wait <time_to_shake> Seconds
			endif
			if ScreenElementExists Id = <shake_container>
				DoScreenElementMorph Id = <shake_container> Pos = (<Pos>) Scale = 1.0 Rot_Angle = 0 Time = <time_to_shake> Motion = ease_out
			endif
		endif
	endif
endscript

script rock_meter_star_power_off \{player_Text = 'p1'}
	if ($game_mode = p2_battle || $boss_battle = 1)
		return
	endif
	J = 6
	begin
	FormatText ChecksumName = Id 'HUD2D_rock_tube_%d' D = <J>
	ExtendCRC <Id> <player_Text> out = parent_id
	if ScreenElementExists Id = <parent_id>
		<parent_id> :GetTags
		if (<morph> = 1)
			if ScreenElementExists Id = <parent_id>
				DoScreenElementMorph Id = <parent_id> Pos = (<final_pos> + <final_pos> * 0.1) Time = 0.1
			endif
			Wait \{0.1
				Seconds}
			if ScreenElementExists Id = <parent_id>
				DoScreenElementMorph Id = <parent_id> Pos = <initial_pos> Time = 0.4
			endif
			Wait \{0.1
				Seconds}
		endif
		ExtendCRC <parent_id> 'tube' out = child_id
		if ScreenElementExists Id = <child_id>
			<child_id> :GetTags
			SetScreenElementProps Id = <child_id> texture = (($g_hud_2d_struct_used).Elements [<Index>].tube.texture)
			if (<morph>)
				SetScreenElementProps Id = <child_id> Pos = <initial_pos>
			endif
		endif
		ExtendCRC <parent_id> 'full' out = child_id
		if ScreenElementExists Id = <child_id>
			<child_id> :GetTags
			SetScreenElementProps Id = <child_id> texture = (($g_hud_2d_struct_used).Elements [<Index>].FULL.texture)
			if (<morph>)
				SetScreenElementProps Id = <child_id> Pos = <initial_pos>
			endif
		endif
	endif
	<J> = (<J> -1)
	repeat 6
endscript

script hud_activated_star_power \{Player = 1
		Time = 0.2}
	SpawnScriptNow hud_activated_star_power_spawned Params = {<...>}
endscript

script hud_activated_star_power_spawned 
	Wait \{1
		GameFrame}
	if (<Player> = 1)
		player_Text = 'p1'
	elseif (<Player> = 2)
		player_Text = 'p2'
	else
		return
	endif
	SpawnScriptNow kill_pulsate_star_power_bulbs Params = {Player = <Player>}
	ExtendCRC HUD2D_score_flash <player_Text> out = new_flash
	if ScreenElementExists Id = <new_flash>
		DoScreenElementMorph Id = <new_flash> Alpha = 1 Scale = 5 Time = <Time>
		Wait <Time> Seconds
		if ScreenElementExists Id = <new_flash>
			DoScreenElementMorph Id = <new_flash> Alpha = 0 Scale = 1 Time = (<Time> / 2.0)
		endif
		UpdateNixie Player = <Player>
	endif
endscript

script hud_move_note_scorebar \{Player = 1
		Time = 0.5
		In = 1}
	if ($game_mode = p2_battle || $boss_battle = 1 || $end_credits = 1 || $Cheat_PerformanceMode = 1)
		return
	endif
	if (($game_mode = p2_career || $game_mode = p2_coop) && (<Player> = 2))
		return
	endif
	if NOT StructureContains Structure = ($g_hud_2d_struct_used) offscreen_note_streak_bar_off
		if NOT StructureContains Structure = ($g_hud_2d_struct_used) offscreen_note_streak_bar_off_p1
			return
		endif
	endif
	morph_miss_off = (0.0, 60.0)
	ease_off = (0.0, 10.0)
	count_off = offscreen_note_streak_bar_off
	if (<Player> = 1)
		player_Text = 'p1'
		if ($game_mode = p2_career || $game_mode = p2_coop)
			count_pos = counter_pos
		else
			if ($current_num_players = 2)
				count_pos = counter_pos_p1
				morph_miss_off = (60.0, 0.0)
				ease_off = (10.0, 0.0)
				count_off = offscreen_note_streak_bar_off_p1
			else
				count_pos = counter_pos
			endif
		endif
	elseif (<Player> = 2)
		player_Text = 'p2'
		count_pos = counter_pos_p2
		morph_miss_off = (-60.0, 0.0)
		ease_off = (-10.0, 0.0)
		count_off = offscreen_note_streak_bar_off_p2
	else
		return
	endif
	if (<In> = 1)
		ExtendCRC HUD2D_note_container <player_Text> out = new_container
		if ScreenElementExists Id = <new_container>
			DoScreenElementMorph Id = <new_container> Pos = ((($g_hud_2d_struct_used).<count_pos>) - <morph_miss_off>) Time = <Time> Motion = ease_out
			Wait <Time> Seconds
			if ScreenElementExists Id = <new_container>
				DoScreenElementMorph Id = <new_container> Pos = (($g_hud_2d_struct_used).<count_pos>) Time = (<Time> / 3) Motion = ease_in
				<new_container> :DoMorph Pos = {<ease_off> Relative} Time = 0.1 Motion = ease_out
				<new_container> :DoMorph Pos = {(<ease_off> * -1) Relative} Time = 0.1 Motion = ease_in
			endif
		endif
	else
		ExtendCRC HUD2D_note_container <player_Text> out = new_container
		if ScreenElementExists Id = <new_container>
			if ($game_mode = p1_career || $game_mode = p2_career || $game_mode = p1_quickplay || $game_mode = p2_coop)
				DoScreenElementMorph Id = <new_container> Pos = ((($g_hud_2d_struct_used).<count_pos>) - <morph_miss_off>) Time = (<Time> / 2.0) Motion = ease_out
			else
				DoScreenElementMorph Id = <new_container> Pos = ((($g_hud_2d_struct_used).<count_pos>) + <morph_miss_off>) Time = (<Time> / 2.0) Motion = ease_in
			endif
			Wait <Time> Seconds
			if ScreenElementExists Id = <new_container>
				DoScreenElementMorph Id = <new_container> Pos = ((($g_hud_2d_struct_used).<count_pos>) + (($g_hud_2d_struct_used).<count_off>)) Time = <Time>
			endif
		endif
	endif
endscript
old_animate_bulbs_star_power_p1 = 0.0
old_animate_bulbs_star_power_p2 = 0.0

script hud_flash_red_bg_p1 \{Time = 0.2}
	if ($g_flash_red_going_p1 = 1)
		return
	else
		Change \{g_flash_red_going_p1 = 1}
	endif
	if ($game_mode = p2_career || $game_mode = p2_coop)
		ExtendCRC \{HUD2D_rock_lights_red
			'p1'
			out = new_bg}
		<Time> = 0.15
	else
		ExtendCRC \{HUD2D_rock_BG_red
			'p1'
			out = new_bg}
	endif
	begin
	if ($game_mode = p2_career || $game_mode = p2_coop)
		if ScreenElementExists Id = <new_bg>
			DoScreenElementMorph Id = <new_bg> rgba = [0 0 0 255] Time = <Time>
			Wait <Time> Seconds
		endif
		if ScreenElementExists Id = <new_bg>
			DoScreenElementMorph Id = <new_bg> rgba = [225 225 225 255] Time = <Time>
		endif
		Wait <Time> Seconds
	else
		if ScreenElementExists Id = <new_bg>
			DoScreenElementMorph Id = <new_bg> rgba = [0 0 0 255] Time = <Time>
			Wait <Time> Seconds
		endif
		if ScreenElementExists Id = <new_bg>
			DoScreenElementMorph Id = <new_bg> rgba = [225 225 225 255] Time = <Time>
			Wait <Time> Seconds
		endif
		if ScreenElementExists Id = <new_bg>
			DoScreenElementMorph Id = <new_bg> rgba = [0 0 0 255] Time = <Time>
			Wait <Time> Seconds
		endif
		if ScreenElementExists Id = <new_bg>
			DoScreenElementMorph Id = <new_bg> rgba = [225 225 225 255] Time = <Time>
		endif
		Wait (<Time> * 2.5) Seconds
	endif
	repeat
endscript

script hud_flash_red_bg_p2 \{Time = 0.2}
	if ($g_flash_red_going_p2 = 1)
		return
	else
		Change \{g_flash_red_going_p2 = 1}
	endif
	ExtendCRC \{HUD2D_rock_BG_red
		'p2'
		out = new_bg}
	begin
	if ScreenElementExists Id = <new_bg>
		DoScreenElementMorph Id = <new_bg> rgba = [0 0 0 255] Time = <Time>
		Wait <Time> Seconds
	endif
	if ScreenElementExists Id = <new_bg>
		DoScreenElementMorph Id = <new_bg> rgba = [225 225 225 255] Time = <Time>
		Wait <Time> Seconds
	endif
	if ScreenElementExists Id = <new_bg>
		DoScreenElementMorph Id = <new_bg> rgba = [0 0 0 255] Time = <Time>
		Wait <Time> Seconds
	endif
	if ScreenElementExists Id = <new_bg>
		DoScreenElementMorph Id = <new_bg> rgba = [225 225 225 255] Time = <Time>
	endif
	Wait (<Time> * 2.5) Seconds
	repeat
endscript

script hud_flash_red_bg_kill \{Player = 1}
	if (<Player> = 1)
		if ($g_flash_red_going_p1 = 0)
			return
		endif
		player_Text = 'p1'
	elseif (<Player> = 2)
		if ($g_flash_red_going_p2 = 0)
			return
		endif
		player_Text = 'p2'
	else
		return
	endif
	ExtendCRC HUD2D_rock_BG_red <player_Text> out = new_bg
	if ScreenElementExists Id = <new_bg>
		SetScreenElementProps Id = <new_bg> rgba = [225 225 225 255]
		if (<Player> = 1)
			KillSpawnedScript \{Name = hud_flash_red_bg_p1}
		else
			KillSpawnedScript \{Name = hud_flash_red_bg_p2}
		endif
	endif
	if (<Player> = 1)
		Change \{g_flash_red_going_p1 = 0}
	else
		Change \{g_flash_red_going_p2 = 0}
	endif
endscript

script two_message_test 
	SpawnScriptNow \{hud_show_note_streak_combo
		Params = {
			Player = 1
		}}
	SpawnScriptNow \{show_star_power_ready
		Params = {
			player_status = player1_status
		}}
	SpawnScriptNow \{hud_show_note_streak_combo
		Params = {
			Player = 2
		}}
	SpawnScriptNow \{show_star_power_ready
		Params = {
			player_status = player2_status
		}}
endscript

script hud_show_note_streak_combo \{Player = 1
		Combo = 0}
	if ($end_credits = 1 || $Cheat_PerformanceMode = 1)
		return
	endif
	if ($game_mode = p2_career || $game_mode = p2_coop)
		<Player> = 1
	endif
	begin
	if (<Player> = 1)
		if ($star_power_ready_on_p1 = 0)
			break
		endif
	else
		if ($star_power_ready_on_p2 = 0)
			break
		endif
	endif
	Wait \{1
		GameFrame}
	repeat
	FormatText ChecksumName = player_container 'HUD_Note_Streak_Combo%d' D = <Player>
	if ScreenElementExists Id = <player_container>
		return
	endif
	if (<Player> = 1)
		player_status = player1_status
	else
		player_status = player2_status
	endif
	ExtendCRC hud_destroygroup_window ($<player_status>.Text) out = hud_destroygroup
	CreateScreenElement {
		Type = ContainerElement
		PARENT = <hud_destroygroup>
		Id = <player_container>
	}
	base_scale = 0.8
	S = 0.8
	if (<Player> = 1)
		if IsSinglePlayerGame
			Pos = (640.0, 211.0)
			<base_scale> = 1.0
			SpawnScriptNow GH_SFX_Note_Streak_SinglePlayer Params = {Combo = <Combo>}
		elseif ($game_mode = p2_career)
			Pos = (640.0, 170.0)
			<base_scale> = 1.0
			SpawnScriptNow GH_SFX_Note_Streak_P1 Params = {Combo = <Combo>}
		elseif ($is_network_game && $game_mode = p2_coop)
			Pos = (640.0, 170.0)
			<base_scale> = 1.0
			SpawnScriptNow GH_SFX_Note_Streak_P1 Params = {Combo = <Combo>}
		else
			<S> = 0.35000002
			Pos = (415.0, 170.0)
			SpawnScriptNow GH_SFX_Note_Streak_P1 Params = {Combo = <Combo>}
		endif
	else
		if ($game_mode = p2_career)
			Pos = (640.0, 170.0)
			<base_scale> = 1.0
			SpawnScriptNow GH_SFX_Note_Streak_P2 Params = {Combo = <Combo>}
		elseif ($is_network_game && $game_mode = p2_coop)
			Pos = (640.0, 170.0)
			<base_scale> = 1.0
			SpawnScriptNow GH_SFX_Note_Streak_P2 Params = {Combo = <Combo>}
		else
			<S> = 0.35000002
			Pos = (865.0, 170.0)
			SpawnScriptNow GH_SFX_Note_Streak_P2 Params = {Combo = <Combo>}
		endif
	endif
	FormatText TextName = Text "%d Note Streak!" D = <Combo>
	FormatText ChecksumName = note_streak_alert 'note_streak_alert_%d' D = <Player>
	CreateScreenElement {
		Type = TextElement
		Id = <note_streak_alert>
		PARENT = <player_container>
		font = text_a6
		Text = <Text>
		rgba = [223 223 223 255]
		Pos = <Pos>
		Scale = (<base_scale> * 3)
		just = [Center Top]
		z_priority = 50
		Alpha = 0
		Shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [0 0 0 255]
	}
	<Id> :DoMorph Scale = <base_scale> Time = 0.2 Alpha = 1 Motion = ease_in
	if NOT ScreenElementExists Id = <Id>
		destroy_menu menu_id = <player_container>
		return
	endif
	SpawnScriptNow hud_glowburst_alert Params = {player_status = <player_status>}
	color0 = [245 255 120 255]
	color1 = [245 255 160 255]
	if ScreenElementExists Id = <Id>
		<Id> :DoMorph Scale = (<base_scale> + <S>) Time = 0.4 rgba = <color1> Rot_Angle = 3 Motion = ease_out
	endif
	if ScreenElementExists Id = <Id>
		<Id> :DoMorph Scale = <base_scale> Time = 0.4 rgba = <color0> Rot_Angle = 2 Motion = ease_in
	endif
	if ScreenElementExists Id = <Id>
		<Id> :DoMorph Scale = (<base_scale> + (<S> / 1.5)) Time = 0.3 rgba = <color1> Rot_Angle = -2 Motion = ease_out
	endif
	if ScreenElementExists Id = <Id>
		<Id> :DoMorph Scale = <base_scale> Time = 0.3 rgba = <color0> Rot_Angle = -1 Motion = ease_in
	endif
	if ScreenElementExists Id = <Id>
		<Id> :DoMorph Scale = (<base_scale> + (<S> / 2.0)) Time = 0.2 rgba = <color1> Rot_Angle = 2 Motion = ease_out
	endif
	if ScreenElementExists Id = <Id>
		<Id> :DoMorph Scale = <base_scale> Time = 0.2 rgba = <color0> Rot_Angle = 1 Motion = ease_in
	endif
	if ScreenElementExists Id = <Id>
		<Id> :DoMorph Scale = (<base_scale> + (<S> / 2.5)) Time = 0.1 rgba = <color1> Rot_Angle = -1 Motion = ease_out
	endif
	if ScreenElementExists Id = <Id>
		<Id> :DoMorph Scale = <base_scale> Time = 0.1 rgba = <color0> Rot_Angle = 1 Motion = ease_in
	endif
	if ScreenElementExists Id = <Id>
		<Id> :DoMorph Rot_Angle = 0 Scale = <base_scale> Motion = gentle
	endif
	if ScreenElementExists Id = <Id>
		<Id> :DoMorph Pos = (<Pos> - (0.0, 230.0)) Scale = (<base_scale> * 0.8) Time = 0.35000002 Motion = ease_in
	endif
	destroy_menu menu_id = <player_container>
endscript

script hud_lightning_alert 
	if NOT ScreenElementExists Id = <alert_id>
		return
	endif
	FormatText ChecksumName = HUD_lightning_01 'HUD_lightning_01_%d' D = <Player>
	FormatText ChecksumName = HUD_lightning_03 'HUD_lightning_03_%d' D = <Player>
	FormatText ChecksumName = HUD_lightning_05 'HUD_lightning_05_%d' D = <Player>
	FormatText ChecksumName = HUD_lightning_07 'HUD_lightning_07_%d' D = <Player>
	GetScreenElementProps Id = <alert_id>
	lightning_pos = (<Pos> - (0.0, 20.0))
	lightning_dims = (800.0, 100.0)
	lightning_time = 0.2
	if ScreenElementExists Id = <HUD_lightning_01>
		DestroyScreenElement Id = <HUD_lightning_01>
	endif
	CreateScreenElement {
		Type = SpriteElement
		Id = <HUD_lightning_01>
		texture = HUD_lightning_01
		PARENT = <player_container>
		Pos = <lightning_pos>
		Dims = <lightning_dims>
		just = [Center Top]
		z_priority = 45
		Alpha = 0
	}
	if ScreenElementExists Id = <HUD_lightning_03>
		DestroyScreenElement Id = <HUD_lightning_03>
	endif
	CreateScreenElement {
		Type = SpriteElement
		Id = <HUD_lightning_03>
		texture = HUD_lightning_03
		PARENT = <player_container>
		Pos = <lightning_pos>
		Dims = <lightning_dims>
		just = [Center Top]
		z_priority = 45
		Alpha = 0
	}
	if ScreenElementExists Id = <HUD_lightning_05>
		DestroyScreenElement Id = <HUD_lightning_05>
	endif
	CreateScreenElement {
		Type = SpriteElement
		Id = <HUD_lightning_05>
		texture = HUD_lightning_05
		PARENT = <player_container>
		Pos = <lightning_pos>
		Dims = <lightning_dims>
		just = [Center Top]
		z_priority = 45
		Alpha = 0
	}
	if ScreenElementExists Id = <HUD_lightning_07>
		DestroyScreenElement Id = <HUD_lightning_07>
	endif
	CreateScreenElement {
		Type = SpriteElement
		Id = <HUD_lightning_07>
		texture = HUD_lightning_07
		PARENT = <player_container>
		Pos = <lightning_pos>
		Dims = <lightning_dims>
		just = [Center Top]
		z_priority = 45
		Alpha = 0
	}
	if ScreenElementExists Id = <HUD_lightning_01>
		DoScreenElementMorph Id = <HUD_lightning_01> Alpha = 1 Time = <lightning_time>
		Wait <lightning_time> Seconds
	endif
	if ScreenElementExists Id = <HUD_lightning_01>
		DoScreenElementMorph Id = <HUD_lightning_01> Alpha = 0 Time = <lightning_time>
		if ScreenElementExists Id = <HUD_lightning_03>
			DoScreenElementMorph Id = <HUD_lightning_03> Alpha = 1 Time = <lightning_time>
		endif
		Wait <lightning_time> Seconds
	endif
	if ScreenElementExists Id = <HUD_lightning_03>
		DoScreenElementMorph Id = <HUD_lightning_03> Alpha = 0 Time = <lightning_time>
		if ScreenElementExists Id = <HUD_lightning_05>
			DoScreenElementMorph Id = <HUD_lightning_05> Alpha = 1 Time = <lightning_time>
		endif
		Wait <lightning_time> Seconds
	endif
	if ScreenElementExists Id = <HUD_lightning_05>
		DoScreenElementMorph Id = <HUD_lightning_05> Alpha = 0 Time = <lightning_time>
		if ScreenElementExists Id = <HUD_lightning_07>
			DoScreenElementMorph Id = <HUD_lightning_07> Alpha = 1 Time = <lightning_time>
		endif
		Wait <lightning_time> Seconds
	endif
	if ScreenElementExists Id = <HUD_lightning_07>
		DoScreenElementMorph Id = <HUD_lightning_07> Alpha = 0 Time = <lightning_time>
		Wait <lightning_time> Seconds
	endif
	if ScreenElementExists Id = <HUD_lightning_01>
		DestroyScreenElement Id = <HUD_lightning_01>
	endif
	if ScreenElementExists Id = <HUD_lightning_03>
		DestroyScreenElement Id = <HUD_lightning_03>
	endif
	if ScreenElementExists Id = <HUD_lightning_05>
		DestroyScreenElement Id = <HUD_lightning_05>
	endif
	if ScreenElementExists Id = <HUD_lightning_07>
		DestroyScreenElement Id = <HUD_lightning_07>
	endif
endscript

script hud_glowburst_alert \{player_status = player1_status}
	FormatText ChecksumName = star_power_ready_glow 'star_power_ready_glow_%d' D = ($<player_status>.Player)
	ExtendCRC hud_destroygroup_window ($<player_status>.Text) out = hud_destroygroup
	if ScreenElementExists Id = <star_power_ready_glow>
		DestroyScreenElement Id = <star_power_ready_glow>
	endif
	if (($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff))
		if (($<player_status>.Player) = 1)
			original_pos = (($hud_screen_elements [0].Pos) - (225.0, 37.0))
		else
			original_pos = (($hud_screen_elements [0].Pos) + (225.0, -37.0))
		endif
		base_scale = (7.5, 0.5)
		Scale2 = (10.0, 2.5)
		scale3 = (7.5, 0.25)
		scale4 = (40.0, 0.0)
	else
		if ($game_mode = p2_career || $game_mode = p2_coop)
			original_pos = (($hud_screen_elements [0].Pos) - (0.0, 36.0))
		else
			original_pos = (($hud_screen_elements [0].Pos) + (0.0, 7.0))
		endif
		base_scale = (15.0, 1.0)
		Scale2 = (20.0, 5.0)
		scale3 = (15.0, 0.5)
		scale4 = (80.0, 0.0)
	endif
	if ScreenElementExists Id = <hud_destroygroup>
		CreateScreenElement {
			Type = SpriteElement
			Id = <star_power_ready_glow>
			PARENT = <hud_destroygroup>
			texture = Char_Select_Hilite1
			just = [Center Center]
			Pos = <original_pos>
			rgba = [245 255 200 255]
			Scale = <base_scale>
			Alpha = 1
			z_priority = 50
		}
	endif
	if ScreenElementExists Id = <star_power_ready_glow>
		<star_power_ready_glow> :DoMorph Scale = <Scale2> Alpha = 0.5 Motion = ease_out Time = 0.1
	endif
	if ScreenElementExists Id = <star_power_ready_glow>
		<star_power_ready_glow> :DoMorph Scale = <scale3> Alpha = 0.5 rgba = [245 255 160 255] Motion = ease_out Time = 0.1
	endif
	if ScreenElementExists Id = <star_power_ready_glow>
		<star_power_ready_glow> :DoMorph Scale = <scale4> Alpha = 0 Motion = ease_in Time = 0.8
	endif
	if ScreenElementExists Id = <star_power_ready_glow>
		DestroyScreenElement Id = <star_power_ready_glow>
	endif
endscript

script hud_flip_note_streak_num 
	FormatText ChecksumName = Id 'HUD2D_Note_Streak_Text_%dp%i' D = <dial_num> I = <Player>
	if NOT ScreenElementExists Id = <Id>
		return
	endif
	<Id> :GetTags
	GetScreenElementProps Id = <Id>
	basePos = <Pos>
	DoScreenElementMorph Id = <Id> Pos = (<basePos> + (0.0, 10.0)) Alpha = 0
	DoScreenElementMorph Id = <Id> Pos = <intial_pos> Alpha = 1 Time = 0.1
endscript
