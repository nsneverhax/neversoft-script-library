g_flash_red_going_p1 = 0
g_flash_red_going_p2 = 0
g_hud_2d_struct_used = career_hud_2d_elements

script create_2d_hud_elements \{player_text = 'p1'}
	change \{g_flash_red_going_p1 = 0}
	change \{g_flash_red_going_p2 = 0}
	change \{old_animate_bulbs_star_power_p1 = 0.0}
	change \{old_animate_bulbs_star_power_p2 = 0.0}
	getarraysize (($g_hud_2d_struct_used).elements)
	parent_scale = (($g_hud_2d_struct_used).scale)
	old_parent = <parent>
	parent_z = (($g_hud_2d_struct_used).z)
	i = 0
	begin
	just = [left top]
	myscale = 1.0
	zoff = 0.0
	rot = 0.0
	alpha = 1
	pos_off = (0.0, 0.0)
	addparams (($g_hud_2d_struct_used).elements [<i>])
	element_struct = (($g_hud_2d_struct_used).elements [<i>])
	if structurecontains structure = <element_struct> parent_container
		if structurecontains structure = <element_struct> element_parent
			extendcrc <element_parent> <player_text> out = container_parent
			if NOT screenelementexists id = <container_parent>
				extendcrc <element_parent> 'p1' out = container_parent
			endif
		else
			container_parent = <old_parent>
		endif
		container_pos = (0.0, 0.0)
		if structurecontains structure = <element_struct> pos_type
			<container_pos> = (($g_hud_2d_struct_used).<pos_type>)
			if (<player_text> = 'p2')
				extendcrc <pos_type> '_p2' out = new_pos_type
				<container_pos> = (($g_hud_2d_struct_used).<new_pos_type>)
			else
				if ($current_num_players = 2)
					extendcrc <pos_type> '_p1' out = new_pos_type
					<container_pos> = (($g_hud_2d_struct_used).<new_pos_type>)
				endif
			endif
		endif
		if structurecontains structure = <element_struct> note_streak_bar
			if structurecontains structure = ($g_hud_2d_struct_used) offscreen_note_streak_bar_off
				<container_pos> = (<container_pos> + (($g_hud_2d_struct_used).offscreen_note_streak_bar_off))
			else
				if (<player_text> = 'p1')
					<container_pos> = (<container_pos> + (($g_hud_2d_struct_used).offscreen_note_streak_bar_off_p1))
				else
					<container_pos> = (<container_pos> + (($g_hud_2d_struct_used).offscreen_note_streak_bar_off_p2))
				endif
			endif
		endif
		<container_pos> = (<container_pos> + <pos_off>)
		extendcrc <element_id> <player_text> out = new_id
		<create_it> = 1
		if structurecontains structure = <element_struct> create_once
			extendcrc <element_id> 'p1' out = p1_id
			if screenelementexists id = <p1_id>
				<create_it> = 0
			endif
		endif
		if ((structurecontains structure = <element_struct> rot_p2) && (<player_text> = 'p2'))
			<rot> = <rot_p2>
		endif
		if (<create_it>)
			createscreenelement {
				type = containerelement
				parent = <container_parent>
				id = <new_id>
				pos = <container_pos>
				rot_angle = <rot>
				z_priority = <z_off>
			}
		endif
		parent = <new_id>
	endif
	if structurecontains structure = <element_struct> container
		if NOT structurecontains structure = <element_struct> parent_container
			extendcrc <element_id> <player_text> out = new_id
			extendcrc <element_parent> <player_text> out = myparent
			if structurecontains structure = <element_struct> small_bulb
				scaled_dims = (<element_dims> * (($g_hud_2d_struct_used).small_bulb_scale))
			else
				scaled_dims = (<element_dims> * (($g_hud_2d_struct_used).big_bulb_scale))
			endif
			if ((structurecontains structure = <element_struct> pos_off_p2) && (<player_text> = 'p2'))
				<pos_off> = <pos_off_p2>
			endif
			<create_it> = 1
			if structurecontains structure = <element_struct> create_once
				extendcrc <element_id> 'p1' out = p1_id
				if screenelementexists id = <p1_id>
					<create_it> = 0
				endif
			endif
			if (<create_it>)
				createscreenelement {
					type = spriteelement
					parent = <myparent>
					id = <new_id>
					texture = <texture>
					pos = <pos_off>
					just = <just>
					rgba = [255 255 255 255]
					rot_angle = <rot>
					z_priority = <zoff>
					alpha = <alpha>
					dims = <scaled_dims>
				}
				<new_id> :settags morph = 0
				<new_id> :settags index = <i>
				<parent> = <id>
				<rot> = 0.0
				<pos> = (0.0, 0.0)
				if structurecontains structure = <element_struct> initial_pos
					if ((structurecontains structure = <element_struct> initial_pos_p2) && (<player_text> = 'p2'))
						setscreenelementprops id = <new_id> pos = <initial_pos_p2>
						<new_id> :settags final_pos = <pos_off_p2>
						<new_id> :settags initial_pos = <initial_pos_p2>
						<new_id> :settags morph = 1
					else
						setscreenelementprops id = <new_id> pos = <initial_pos>
						<new_id> :settags final_pos = <pos_off>
						<new_id> :settags initial_pos = <initial_pos>
						<new_id> :settags morph = 1
					endif
				endif
			endif
		endif
	else
		if NOT structurecontains structure = <element_struct> parent_container
			extendcrc <element_id> <player_text> out = new_id
			if structurecontains structure = <element_struct> initial_pos
				<pos_off> = <initial_pos>
			endif
			if structurecontains structure = <element_struct> battle_pos
				if (<player_text> = 'p2')
					<container_pos> = (($g_hud_2d_struct_used).rock_pos_p2)
					extendcrc <pos_type> '_p2' out = new_pos_type
					<pos_off> = ((($g_hud_2d_struct_used).<new_pos_type>))
				else
					<container_pos> = (($g_hud_2d_struct_used).rock_pos_p1)
					extendcrc <pos_type> '_p1' out = new_pos_type
					<pos_off> = ((($g_hud_2d_struct_used).<new_pos_type>))
				endif
			endif
			extendcrc <element_parent> <player_text> out = myparent
			flags = {}
			if structurecontains structure = <element_struct> flags
				if structurecontains structure = (<element_struct>.flags) flip_v
					if structurecontains structure = (<element_struct>.flags) p1
						if (<player_text> = 'p1')
							<flags> = flip_v
						endif
					endif
				endif
				if structurecontains structure = (<element_struct>.flags) flip_h
					if structurecontains structure = (<element_struct>.flags) p1
						if (<player_text> = 'p1')
							<flags> = flip_h
						endif
					endif
					if structurecontains structure = (<element_struct>.flags) p2
						if (<player_text> = 'p2')
							<flags> = flip_h
						endif
					endif
				endif
			endif
			mydims = {}
			if structurecontains structure = <element_struct> dims
				<mydims> = <dims>
			endif
			<create_it> = 1
			if structurecontains structure = <element_struct> create_once
				extendcrc <element_id> 'p1' out = p1_id
				if screenelementexists id = <p1_id>
					<create_it> = 0
				endif
			endif
			if ((structurecontains structure = <element_struct> initial_pos_p2) && (<player_text> = 'p2'))
				<pos_off> = <initial_pos_p2>
			elseif ((structurecontains structure = <element_struct> pos_off_p2) && (<player_text> = 'p2'))
				<pos_off> = <pos_off_p2>
			endif
			my_rgba = [255 255 255 255]
			if (structurecontains structure = <element_struct> rgba)
				<my_rgba> = <rgba>
			endif
			if (<create_it>)
				createscreenelement {
					type = spriteelement
					parent = <myparent>
					id = <new_id>
					texture = <texture>
					pos = <pos_off>
					rgba = <my_rgba>
					just = <just>
					z_priority = <zoff>
					alpha = <alpha>
					<flags>
					rot_angle = <rot>
					dims = <mydims>
				}
			endif
			if structurecontains structure = <element_struct> scale
				if (<create_it>)
					getscreenelementdims id = <new_id>
					new_width = (<width> * <scale>)
					new_height = (<height> * <scale>)
					setscreenelementprops id = <new_id> dims = (((1.0, 0.0) * <new_width>) + ((0.0, 1.0) * <new_height>))
				endif
			endif
		endif
	endif
	if structurecontains structure = <element_struct> tube
		extendcrc <new_id> 'tube' out = new_child_id
		<zoff> = (<tube>.zoff)
		<alpha> = (<tube>.alpha)
		extendcrc <element_parent> <player_text> out = myparent
		if structurecontains structure = <element_struct> small_bulb
			scaled_dims = (<tube>.element_dims * (($g_hud_2d_struct_used).small_bulb_scale))
		else
			scaled_dims = (<tube>.element_dims * (($g_hud_2d_struct_used).big_bulb_scale))
		endif
		if screenelementexists id = <myparent>
			createscreenelement {
				type = spriteelement
				parent = <myparent>
				id = <new_child_id>
				texture = (<tube>.texture)
				pos = (<pos_off> + (<tube>.pos_off))
				rgba = [255 255 255 255]
				dims = <scaled_dims>
				just = [center bottom]
				z_priority = <zoff>
				alpha = <alpha>
			}
			<parent> = <id>
			<new_child_id> :settags morph = 0
			<new_child_id> :settags old_dims = <element_dims>
			if structurecontains structure = <element_struct> initial_pos
				setscreenelementprops id = <new_child_id> pos = (<initial_pos> + (<tube>.pos_off))
				<new_child_id> :settags {
					final_pos = (<pos_off> + (<tube>.pos_off))
					initial_pos = (<initial_pos> + (<tube>.pos_off))
					morph = 1
				}
			endif
		endif
	endif
	if structurecontains structure = <element_struct> full
		extendcrc <new_id> 'full' out = new_child_id
		<zoff> = (<full>.zoff)
		<alpha> = (<full>.alpha)
		extendcrc <element_parent> <player_text> out = myparent
		if structurecontains structure = <element_struct> small_bulb
			scaled_dims = (<element_dims> * (($g_hud_2d_struct_used).small_bulb_scale))
		else
			scaled_dims = (<element_dims> * (($g_hud_2d_struct_used).big_bulb_scale))
		endif
		if screenelementexists id = <myparent>
			createscreenelement {
				type = spriteelement
				parent = <myparent>
				id = <new_child_id>
				texture = (<full>.texture)
				pos = <pos_off>
				rgba = [255 255 255 255]
				dims = <scaled_dims>
				just = <just>
				z_priority = <zoff>
				alpha = <alpha>
			}
			<new_child_id> :settags morph = 0
			if structurecontains structure = <element_struct> initial_pos
				setscreenelementprops id = <new_child_id> pos = <initial_pos>
				<new_child_id> :settags final_pos = <pos_off>
				<new_child_id> :settags initial_pos = <initial_pos>
				<new_child_id> :settags morph = 1
			endif
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	if NOT ($game_mode = p2_battle || $boss_battle = 1)
		extendcrc hud2d_score_text <player_text> out = new_id
		extendcrc hud2d_score_container <player_text> out = new_score_container
		score_text_pos = (222.0, 70.0)
		if ($game_mode = p2_career || $game_mode = p2_coop)
			<score_text_pos> = (226.0, 85.0)
		endif
		if screenelementexists id = <new_score_container>
			displaytext {
				parent = <new_score_container>
				id = <new_id>
				font = num_a9
				pos = <score_text_pos>
				z = 20
				scale = (1.1, 1.1)
				just = [right right]
				rgba = [255 255 255 255]
			}
			setscreenelementprops id = <id> font_spacing = 5
		endif
		i = 1
		begin
		formattext checksumname = note_streak_text_id 'HUD2D_Note_Streak_Text_%d' d = <i>
		extendcrc <note_streak_text_id> <player_text> out = new_id
		extendcrc hud2d_note_container <player_text> out = new_note_container
		if screenelementexists id = <new_note_container>
			if (<i> = 1)
				rgba = [15 15 70 200]
			else
				rgba = [230 230 230 200]
			endif
			displaytext {
				parent = <new_note_container>
				id = <new_id>
				font = num_a7
				text = "0"
				pos = ((222.0, 78.0) + (<i> * (-37.0, 0.0)))
				z = 25
				just = [center center]
				rgba = <rgba>
				noshadow
			}
			<id> :settags intial_pos = ((222.0, 78.0) + (<i> * (-37.0, 0.0)))
		endif
		<i> = (<i> + 1)
		repeat 4
	endif
endscript

script rock_meter_star_power_on 
	if ($game_mode = p2_career)
		<player_status> = player1_status
	endif
	formattext textname = player_text 'p%d' d = ($<player_status>.player)
	spawnscriptnow rock_back_and_forth_star_meter params = {player_status = <player_status> player_text = <player_text>}
	spawnscriptnow pulsate_all_star_power_bulbs params = {player_status = <player_status> player_text = <player_text>}
	i = 1
	begin
	formattext checksumname = id 'HUD2D_rock_tube_%d' d = <i>
	extendcrc <id> <player_text> out = parent_id
	if screenelementexists id = <parent_id>
		<parent_id> :gettags
		if (<morph> = 1)
			doscreenelementmorph id = <parent_id> pos = <final_pos> time = 0.4
		endif
		extendcrc <parent_id> 'tube' out = child_id
		<child_id> :gettags
		setscreenelementprops id = <child_id> texture = (($g_hud_2d_struct_used).elements [<index>].tube.star_texture)
		if (<morph> = 1)
			doscreenelementmorph id = <child_id> pos = <final_pos> time = 0.4
		endif
		extendcrc <parent_id> 'full' out = child_id
		<child_id> :gettags
		setscreenelementprops id = <child_id> texture = (($g_hud_2d_struct_used).elements [<index>].full.star_texture)
		if (<morph> = 1)
			doscreenelementmorph id = <child_id> pos = <final_pos> time = 0.4
			wait \{0.2
				seconds}
		endif
	endif
	<i> = (<i> + 1)
	repeat 6
endscript

script kill_pulsate_star_power_bulbs 
	killspawnedscript \{name = pulsate_all_star_power_bulbs}
	killspawnedscript \{name = pulsate_star_power_bulb}
	killspawnedscript \{name = pulsate_big_glow}
	killpulsatestarpowerbulbs player = <player>
endscript

script pulsate_star_power_bulb 
	begin
	alpha_time = Random (@ 0.1 @*2 0.5 )
	if screenelementexists id = <bulb_checksum>
		extendcrc <bulb_checksum> 'tube' out = child_id
		doscreenelementmorph id = <child_id> alpha = 0.3 time = <alpha_time> motion = ease_in
		extendcrc <bulb_checksum> 'full' out = child_id
		doscreenelementmorph id = <child_id> alpha = 0.3 time = <alpha_time> motion = ease_in
	endif
	wait <alpha_time> seconds
	alpha_time = Random (@ 0.1 @*2 0.5 )
	if screenelementexists id = <bulb_checksum>
		extendcrc <bulb_checksum> 'tube' out = child_id
		<child_id> :gettags
		doscreenelementmorph id = <child_id> alpha = <old_alpha> time = <alpha_time> motion = ease_out
		extendcrc <bulb_checksum> 'full' out = child_id
		<child_id> :gettags
		doscreenelementmorph id = <child_id> alpha = <old_alpha> time = <alpha_time> motion = ease_out
	endif
	wait <alpha_time> seconds
	repeat
endscript

script pulsate_big_glow 
	extendcrc hud2d_rock_glow <player_text> out = parent_id
	if NOT screenelementexists id = <parent_id>
		return
	endif
	begin
	<parent_id> :domorph alpha = 0 rgba = [95 205 255 255] time = 1 motion = ease_in
	<parent_id> :domorph alpha = 1 rgba = [255 255 255 255] time = 1 motion = ease_out
	repeat
endscript

script pulsate_all_star_power_bulbs 
	<i> = 1
	begin
	formattext checksumname = id 'HUD2D_rock_tube_%d' d = <i>
	extendcrc <id> <player_text> out = parent_id
	if screenelementexists id = <parent_id>
		spawnscriptnow pulsate_star_power_bulb params = {bulb_checksum = <parent_id>}
	endif
	<i> = (<i> + 1)
	repeat 6
	extendcrc hud2d_rock_glow <player_text> out = parent_id
	if screenelementexists id = <parent_id>
		runscriptonscreenelement id = <parent_id> pulsate_big_glow params = {<...>}
	endif
endscript

script rock_back_and_forth_star_meter 
	move_up_and_down = 1
	if ($game_mode = p1_career || $game_mode = p1_quickplay || $game_mode = p2_career || $game_mode = p2_coop)
		extendcrc hud2d_rock_container <player_text> out = shake_container
	elseif ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff)
		extendcrc hud2d_score_container <player_text> out = shake_container
		<move_up_and_down> = 0
	endif
	if screenelementexists id = <shake_container>
		getscreenelementprops id = <shake_container>
		time_to_shake = 0.15
		if (<move_up_and_down> = 1)
			if screenelementexists id = <shake_container>
				doscreenelementmorph id = <shake_container> pos = (<pos> - (0.0, 50.0)) scale = 1.5 rot_angle = 10 time = <time_to_shake> motion = ease_in
				wait <time_to_shake> seconds
			endif
			if screenelementexists id = <shake_container>
				doscreenelementmorph id = <shake_container> pos = (<pos> + (0.0, 75.0)) scale = 0.5 rot_angle = -15 time = <time_to_shake> motion = ease_in
				wait <time_to_shake> seconds
			endif
			if screenelementexists id = <shake_container>
				doscreenelementmorph id = <shake_container> pos = (<pos>) scale = 1.0 rot_angle = 0 time = <time_to_shake>
			endif
		else
			if screenelementexists id = <shake_container>
				doscreenelementmorph id = <shake_container> pos = (<pos> - (50.0, 0.0)) scale = 1.5 rot_angle = 10 time = <time_to_shake> motion = ease_in
				wait <time_to_shake> seconds
			endif
			if screenelementexists id = <shake_container>
				doscreenelementmorph id = <shake_container> pos = (<pos> + (75.0, 0.0)) scale = 0.5 rot_angle = -15 time = <time_to_shake> motion = ease_in
				wait <time_to_shake> seconds
			endif
			if screenelementexists id = <shake_container>
				doscreenelementmorph id = <shake_container> pos = (<pos>) scale = 1.0 rot_angle = 0 time = <time_to_shake> motion = ease_out
			endif
		endif
	endif
endscript

script rock_meter_star_power_off \{player_text = 'p1'}
	if ($game_mode = p2_battle || $boss_battle = 1)
		return
	endif
	j = 6
	begin
	formattext checksumname = id 'HUD2D_rock_tube_%d' d = <j>
	extendcrc <id> <player_text> out = parent_id
	if screenelementexists id = <parent_id>
		<parent_id> :gettags
		if (<morph> = 1)
			if screenelementexists id = <parent_id>
				doscreenelementmorph id = <parent_id> pos = (<final_pos> + <final_pos> * 0.1) time = 0.1
			endif
			wait \{0.1
				seconds}
			if screenelementexists id = <parent_id>
				doscreenelementmorph id = <parent_id> pos = <initial_pos> time = 0.4
			endif
			wait \{0.1
				seconds}
		endif
		extendcrc <parent_id> 'tube' out = child_id
		if screenelementexists id = <child_id>
			<child_id> :gettags
			setscreenelementprops id = <child_id> texture = (($g_hud_2d_struct_used).elements [<index>].tube.texture)
			if (<morph>)
				setscreenelementprops id = <child_id> pos = <initial_pos>
			endif
		endif
		extendcrc <parent_id> 'full' out = child_id
		if screenelementexists id = <child_id>
			<child_id> :gettags
			setscreenelementprops id = <child_id> texture = (($g_hud_2d_struct_used).elements [<index>].full.texture)
			if (<morph>)
				setscreenelementprops id = <child_id> pos = <initial_pos>
			endif
		endif
	endif
	<j> = (<j> -1)
	repeat 6
endscript

script hud_activated_star_power \{player = 1
		time = 0.2}
	spawnscriptnow hud_activated_star_power_spawned params = {<...>}
endscript

script hud_activated_star_power_spawned 
	wait \{1
		gameframe}
	if (<player> = 1)
		player_text = 'p1'
	elseif (<player> = 2)
		player_text = 'p2'
	else
		return
	endif
	spawnscriptnow kill_pulsate_star_power_bulbs params = {player = <player>}
	extendcrc hud2d_score_flash <player_text> out = new_flash
	if screenelementexists id = <new_flash>
		doscreenelementmorph id = <new_flash> alpha = 1 scale = 5 time = <time>
		wait <time> seconds
		if screenelementexists id = <new_flash>
			doscreenelementmorph id = <new_flash> alpha = 0 scale = 1 time = (<time> / 2.0)
		endif
		updatenixie player = <player>
	endif
endscript

script hud_move_note_scorebar \{player = 1
		time = 0.5
		in = 1}
	if ($game_mode = p2_battle || $boss_battle = 1 || $end_credits = 1 || $cheat_performancemode = 1)
		return
	endif
	if (($game_mode = p2_career || $game_mode = p2_coop) && (<player> = 2))
		return
	endif
	if NOT structurecontains structure = ($g_hud_2d_struct_used) offscreen_note_streak_bar_off
		if NOT structurecontains structure = ($g_hud_2d_struct_used) offscreen_note_streak_bar_off_p1
			return
		endif
	endif
	morph_miss_off = (0.0, 60.0)
	ease_off = (0.0, 10.0)
	count_off = offscreen_note_streak_bar_off
	if (<player> = 1)
		player_text = 'p1'
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
	elseif (<player> = 2)
		player_text = 'p2'
		count_pos = counter_pos_p2
		morph_miss_off = (-60.0, 0.0)
		ease_off = (-10.0, 0.0)
		count_off = offscreen_note_streak_bar_off_p2
	else
		return
	endif
	if (<in> = 1)
		extendcrc hud2d_note_container <player_text> out = new_container
		if screenelementexists id = <new_container>
			doscreenelementmorph id = <new_container> pos = ((($g_hud_2d_struct_used).<count_pos>) - <morph_miss_off>) time = <time> motion = ease_out
			wait <time> seconds
			if screenelementexists id = <new_container>
				doscreenelementmorph id = <new_container> pos = (($g_hud_2d_struct_used).<count_pos>) time = (<time> / 3) motion = ease_in
				<new_container> :domorph pos = {<ease_off> relative} time = 0.1 motion = ease_out
				<new_container> :domorph pos = {(<ease_off> * -1) relative} time = 0.1 motion = ease_in
			endif
		endif
	else
		extendcrc hud2d_note_container <player_text> out = new_container
		if screenelementexists id = <new_container>
			if ($game_mode = p1_career || $game_mode = p2_career || $game_mode = p1_quickplay || $game_mode = p2_coop)
				doscreenelementmorph id = <new_container> pos = ((($g_hud_2d_struct_used).<count_pos>) - <morph_miss_off>) time = (<time> / 2.0) motion = ease_out
			else
				doscreenelementmorph id = <new_container> pos = ((($g_hud_2d_struct_used).<count_pos>) + <morph_miss_off>) time = (<time> / 2.0) motion = ease_in
			endif
			wait <time> seconds
			if screenelementexists id = <new_container>
				doscreenelementmorph id = <new_container> pos = ((($g_hud_2d_struct_used).<count_pos>) + (($g_hud_2d_struct_used).<count_off>)) time = <time>
			endif
		endif
	endif
endscript
old_animate_bulbs_star_power_p1 = 0.0
old_animate_bulbs_star_power_p2 = 0.0

script hud_flash_red_bg_p1 \{time = 0.2}
	if ($g_flash_red_going_p1 = 1)
		return
	else
		change \{g_flash_red_going_p1 = 1}
	endif
	if ($game_mode = p2_career || $game_mode = p2_coop)
		extendcrc \{hud2d_rock_lights_red
			'p1'
			out = new_bg}
		<time> = 0.15
	else
		extendcrc \{hud2d_rock_bg_red
			'p1'
			out = new_bg}
	endif
	begin
	if ($game_mode = p2_career || $game_mode = p2_coop)
		if screenelementexists id = <new_bg>
			doscreenelementmorph id = <new_bg> rgba = [0 0 0 255] time = <time>
			wait <time> seconds
		endif
		if screenelementexists id = <new_bg>
			doscreenelementmorph id = <new_bg> rgba = [225 225 225 255] time = <time>
		endif
		wait <time> seconds
	else
		if screenelementexists id = <new_bg>
			doscreenelementmorph id = <new_bg> rgba = [0 0 0 255] time = <time>
			wait <time> seconds
		endif
		if screenelementexists id = <new_bg>
			doscreenelementmorph id = <new_bg> rgba = [225 225 225 255] time = <time>
			wait <time> seconds
		endif
		if screenelementexists id = <new_bg>
			doscreenelementmorph id = <new_bg> rgba = [0 0 0 255] time = <time>
			wait <time> seconds
		endif
		if screenelementexists id = <new_bg>
			doscreenelementmorph id = <new_bg> rgba = [225 225 225 255] time = <time>
		endif
		wait (<time> * 2.5) seconds
	endif
	repeat
endscript

script hud_flash_red_bg_p2 \{time = 0.2}
	if ($g_flash_red_going_p2 = 1)
		return
	else
		change \{g_flash_red_going_p2 = 1}
	endif
	extendcrc \{hud2d_rock_bg_red
		'p2'
		out = new_bg}
	begin
	if screenelementexists id = <new_bg>
		doscreenelementmorph id = <new_bg> rgba = [0 0 0 255] time = <time>
		wait <time> seconds
	endif
	if screenelementexists id = <new_bg>
		doscreenelementmorph id = <new_bg> rgba = [225 225 225 255] time = <time>
		wait <time> seconds
	endif
	if screenelementexists id = <new_bg>
		doscreenelementmorph id = <new_bg> rgba = [0 0 0 255] time = <time>
		wait <time> seconds
	endif
	if screenelementexists id = <new_bg>
		doscreenelementmorph id = <new_bg> rgba = [225 225 225 255] time = <time>
	endif
	wait (<time> * 2.5) seconds
	repeat
endscript

script hud_flash_red_bg_kill \{player = 1}
	if (<player> = 1)
		if ($g_flash_red_going_p1 = 0)
			return
		endif
		player_text = 'p1'
	elseif (<player> = 2)
		if ($g_flash_red_going_p2 = 0)
			return
		endif
		player_text = 'p2'
	else
		return
	endif
	extendcrc hud2d_rock_bg_red <player_text> out = new_bg
	if screenelementexists id = <new_bg>
		setscreenelementprops id = <new_bg> rgba = [225 225 225 255]
		if (<player> = 1)
			killspawnedscript \{name = hud_flash_red_bg_p1}
		else
			killspawnedscript \{name = hud_flash_red_bg_p2}
		endif
	endif
	if (<player> = 1)
		change \{g_flash_red_going_p1 = 0}
	else
		change \{g_flash_red_going_p2 = 0}
	endif
endscript

script two_message_test 
	spawnscriptnow \{hud_show_note_streak_combo
		params = {
			player = 1
		}}
	spawnscriptnow \{show_star_power_ready
		params = {
			player_status = player1_status
		}}
	spawnscriptnow \{hud_show_note_streak_combo
		params = {
			player = 2
		}}
	spawnscriptnow \{show_star_power_ready
		params = {
			player_status = player2_status
		}}
endscript

script hud_show_note_streak_combo \{player = 1
		combo = 0}
	if ($end_credits = 1 || $cheat_performancemode = 1)
		return
	endif
	if ($game_mode = p2_career || $game_mode = p2_coop)
		<player> = 1
	endif
	begin
	if (<player> = 1)
		if ($star_power_ready_on_p1 = 0)
			break
		endif
	else
		if ($star_power_ready_on_p2 = 0)
			break
		endif
	endif
	wait \{1
		gameframe}
	repeat
	formattext checksumname = player_container 'HUD_Note_Streak_Combo%d' d = <player>
	if screenelementexists id = <player_container>
		return
	endif
	if (<player> = 1)
		player_status = player1_status
	else
		player_status = player2_status
	endif
	extendcrc hud_destroygroup_window ($<player_status>.text) out = hud_destroygroup
	createscreenelement {
		type = containerelement
		parent = <hud_destroygroup>
		id = <player_container>
	}
	base_scale = 0.8
	s = 0.8
	if (<player> = 1)
		if issingleplayergame
			pos = (640.0, 211.0)
			<base_scale> = 1.0
			spawnscriptnow gh_sfx_note_streak_singleplayer params = {combo = <combo>}
		elseif ($game_mode = p2_career)
			pos = (640.0, 170.0)
			<base_scale> = 1.0
			spawnscriptnow gh_sfx_note_streak_p1 params = {combo = <combo>}
		elseif ($is_network_game && $game_mode = p2_coop)
			pos = (640.0, 170.0)
			<base_scale> = 1.0
			spawnscriptnow gh_sfx_note_streak_p1 params = {combo = <combo>}
		else
			<s> = 0.35000002
			pos = (415.0, 170.0)
			spawnscriptnow gh_sfx_note_streak_p1 params = {combo = <combo>}
		endif
	else
		if ($game_mode = p2_career)
			pos = (640.0, 170.0)
			<base_scale> = 1.0
			spawnscriptnow gh_sfx_note_streak_p2 params = {combo = <combo>}
		elseif ($is_network_game && $game_mode = p2_coop)
			pos = (640.0, 170.0)
			<base_scale> = 1.0
			spawnscriptnow gh_sfx_note_streak_p2 params = {combo = <combo>}
		else
			<s> = 0.35000002
			pos = (865.0, 170.0)
			spawnscriptnow gh_sfx_note_streak_p2 params = {combo = <combo>}
		endif
	endif
	formattext textname = text "%d Note Streak!" d = <combo>
	formattext checksumname = note_streak_alert 'note_streak_alert_%d' d = <player>
	createscreenelement {
		type = textelement
		id = <note_streak_alert>
		parent = <player_container>
		font = text_a6
		text = <text>
		rgba = [223 223 223 255]
		pos = <pos>
		scale = (<base_scale> * 3)
		just = [center top]
		z_priority = 50
		alpha = 0
		shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [0 0 0 255]
	}
	<id> :domorph scale = <base_scale> time = 0.2 alpha = 1 motion = ease_in
	if NOT screenelementexists id = <id>
		destroy_menu menu_id = <player_container>
		return
	endif
	spawnscriptnow hud_glowburst_alert params = {player_status = <player_status>}
	color0 = [245 255 120 255]
	color1 = [245 255 160 255]
	if screenelementexists id = <id>
		<id> :domorph scale = (<base_scale> + <s>) time = 0.4 rgba = <color1> rot_angle = 3 motion = ease_out
	endif
	if screenelementexists id = <id>
		<id> :domorph scale = <base_scale> time = 0.4 rgba = <color0> rot_angle = 2 motion = ease_in
	endif
	if screenelementexists id = <id>
		<id> :domorph scale = (<base_scale> + (<s> / 1.5)) time = 0.3 rgba = <color1> rot_angle = -2 motion = ease_out
	endif
	if screenelementexists id = <id>
		<id> :domorph scale = <base_scale> time = 0.3 rgba = <color0> rot_angle = -1 motion = ease_in
	endif
	if screenelementexists id = <id>
		<id> :domorph scale = (<base_scale> + (<s> / 2.0)) time = 0.2 rgba = <color1> rot_angle = 2 motion = ease_out
	endif
	if screenelementexists id = <id>
		<id> :domorph scale = <base_scale> time = 0.2 rgba = <color0> rot_angle = 1 motion = ease_in
	endif
	if screenelementexists id = <id>
		<id> :domorph scale = (<base_scale> + (<s> / 2.5)) time = 0.1 rgba = <color1> rot_angle = -1 motion = ease_out
	endif
	if screenelementexists id = <id>
		<id> :domorph scale = <base_scale> time = 0.1 rgba = <color0> rot_angle = 1 motion = ease_in
	endif
	if screenelementexists id = <id>
		<id> :domorph rot_angle = 0 scale = <base_scale> motion = gentle
	endif
	if screenelementexists id = <id>
		<id> :domorph pos = (<pos> - (0.0, 230.0)) scale = (<base_scale> * 0.8) time = 0.35000002 motion = ease_in
	endif
	destroy_menu menu_id = <player_container>
endscript

script hud_lightning_alert 
	if NOT screenelementexists id = <alert_id>
		return
	endif
	formattext checksumname = hud_lightning_01 'HUD_lightning_01_%d' d = <player>
	formattext checksumname = hud_lightning_03 'HUD_lightning_03_%d' d = <player>
	formattext checksumname = hud_lightning_05 'HUD_lightning_05_%d' d = <player>
	formattext checksumname = hud_lightning_07 'HUD_lightning_07_%d' d = <player>
	getscreenelementprops id = <alert_id>
	lightning_pos = (<pos> - (0.0, 20.0))
	lightning_dims = (800.0, 100.0)
	lightning_time = 0.2
	if screenelementexists id = <hud_lightning_01>
		destroyscreenelement id = <hud_lightning_01>
	endif
	createscreenelement {
		type = spriteelement
		id = <hud_lightning_01>
		texture = hud_lightning_01
		parent = <player_container>
		pos = <lightning_pos>
		dims = <lightning_dims>
		just = [center top]
		z_priority = 45
		alpha = 0
	}
	if screenelementexists id = <hud_lightning_03>
		destroyscreenelement id = <hud_lightning_03>
	endif
	createscreenelement {
		type = spriteelement
		id = <hud_lightning_03>
		texture = hud_lightning_03
		parent = <player_container>
		pos = <lightning_pos>
		dims = <lightning_dims>
		just = [center top]
		z_priority = 45
		alpha = 0
	}
	if screenelementexists id = <hud_lightning_05>
		destroyscreenelement id = <hud_lightning_05>
	endif
	createscreenelement {
		type = spriteelement
		id = <hud_lightning_05>
		texture = hud_lightning_05
		parent = <player_container>
		pos = <lightning_pos>
		dims = <lightning_dims>
		just = [center top]
		z_priority = 45
		alpha = 0
	}
	if screenelementexists id = <hud_lightning_07>
		destroyscreenelement id = <hud_lightning_07>
	endif
	createscreenelement {
		type = spriteelement
		id = <hud_lightning_07>
		texture = hud_lightning_07
		parent = <player_container>
		pos = <lightning_pos>
		dims = <lightning_dims>
		just = [center top]
		z_priority = 45
		alpha = 0
	}
	if screenelementexists id = <hud_lightning_01>
		doscreenelementmorph id = <hud_lightning_01> alpha = 1 time = <lightning_time>
		wait <lightning_time> seconds
	endif
	if screenelementexists id = <hud_lightning_01>
		doscreenelementmorph id = <hud_lightning_01> alpha = 0 time = <lightning_time>
		if screenelementexists id = <hud_lightning_03>
			doscreenelementmorph id = <hud_lightning_03> alpha = 1 time = <lightning_time>
		endif
		wait <lightning_time> seconds
	endif
	if screenelementexists id = <hud_lightning_03>
		doscreenelementmorph id = <hud_lightning_03> alpha = 0 time = <lightning_time>
		if screenelementexists id = <hud_lightning_05>
			doscreenelementmorph id = <hud_lightning_05> alpha = 1 time = <lightning_time>
		endif
		wait <lightning_time> seconds
	endif
	if screenelementexists id = <hud_lightning_05>
		doscreenelementmorph id = <hud_lightning_05> alpha = 0 time = <lightning_time>
		if screenelementexists id = <hud_lightning_07>
			doscreenelementmorph id = <hud_lightning_07> alpha = 1 time = <lightning_time>
		endif
		wait <lightning_time> seconds
	endif
	if screenelementexists id = <hud_lightning_07>
		doscreenelementmorph id = <hud_lightning_07> alpha = 0 time = <lightning_time>
		wait <lightning_time> seconds
	endif
	if screenelementexists id = <hud_lightning_01>
		destroyscreenelement id = <hud_lightning_01>
	endif
	if screenelementexists id = <hud_lightning_03>
		destroyscreenelement id = <hud_lightning_03>
	endif
	if screenelementexists id = <hud_lightning_05>
		destroyscreenelement id = <hud_lightning_05>
	endif
	if screenelementexists id = <hud_lightning_07>
		destroyscreenelement id = <hud_lightning_07>
	endif
endscript

script hud_glowburst_alert \{player_status = player1_status}
	formattext checksumname = star_power_ready_glow 'star_power_ready_glow_%d' d = ($<player_status>.player)
	extendcrc hud_destroygroup_window ($<player_status>.text) out = hud_destroygroup
	if screenelementexists id = <star_power_ready_glow>
		destroyscreenelement id = <star_power_ready_glow>
	endif
	if (($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff))
		if (($<player_status>.player) = 1)
			original_pos = (($hud_screen_elements [0].pos) - (225.0, 37.0))
		else
			original_pos = (($hud_screen_elements [0].pos) + (225.0, -37.0))
		endif
		base_scale = (7.5, 0.5)
		scale2 = (10.0, 2.5)
		scale3 = (7.5, 0.25)
		scale4 = (40.0, 0.0)
	else
		if ($game_mode = p2_career || $game_mode = p2_coop)
			original_pos = (($hud_screen_elements [0].pos) - (0.0, 36.0))
		else
			original_pos = (($hud_screen_elements [0].pos) + (0.0, 7.0))
		endif
		base_scale = (15.0, 1.0)
		scale2 = (20.0, 5.0)
		scale3 = (15.0, 0.5)
		scale4 = (80.0, 0.0)
	endif
	if screenelementexists id = <hud_destroygroup>
		createscreenelement {
			type = spriteelement
			id = <star_power_ready_glow>
			parent = <hud_destroygroup>
			texture = char_select_hilite1
			just = [center center]
			pos = <original_pos>
			rgba = [245 255 200 255]
			scale = <base_scale>
			alpha = 1
			z_priority = 50
		}
	endif
	if screenelementexists id = <star_power_ready_glow>
		<star_power_ready_glow> :domorph scale = <scale2> alpha = 0.5 motion = ease_out time = 0.1
	endif
	if screenelementexists id = <star_power_ready_glow>
		<star_power_ready_glow> :domorph scale = <scale3> alpha = 0.5 rgba = [245 255 160 255] motion = ease_out time = 0.1
	endif
	if screenelementexists id = <star_power_ready_glow>
		<star_power_ready_glow> :domorph scale = <scale4> alpha = 0 motion = ease_in time = 0.8
	endif
	if screenelementexists id = <star_power_ready_glow>
		destroyscreenelement id = <star_power_ready_glow>
	endif
endscript

script hud_flip_note_streak_num 
	formattext checksumname = id 'HUD2D_Note_Streak_Text_%dp%i' d = <dial_num> i = <player>
	if NOT screenelementexists id = <id>
		return
	endif
	<id> :gettags
	getscreenelementprops id = <id>
	basepos = <pos>
	doscreenelementmorph id = <id> pos = (<basepos> + (0.0, 10.0)) alpha = 0
	doscreenelementmorph id = <id> pos = <intial_pos> alpha = 1 time = 0.1
endscript
