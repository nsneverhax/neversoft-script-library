g_flash_red_going_p1 = 0
g_flash_red_going_p2 = 0
g_hud_2d_struct_used = career_hud_2d_elements

script create_2d_hud_elements player_text = 'p1'
	change g_flash_red_going_p1 = 0
	change g_flash_red_going_p2 = 0
	change old_animate_bulbs_star_power_p1 = 0.0
	change old_animate_bulbs_star_power_p2 = 0.0
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
			<container_pos> = (<container_pos> + (($g_hud_2d_struct_used).offscreen_note_streak_bar_off))
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
		setscreenelementprops id = <child_id> texture = (($g_hud_2d_struct_used).elements [<index>].tube.star_texture)
		<child_id> :gettags
		if (<morph> = 1)
			doscreenelementmorph id = <child_id> pos = <final_pos> time = 0.4
		endif
		extendcrc <parent_id> 'full' out = child_id
		setscreenelementprops id = <child_id> texture = (($g_hud_2d_struct_used).elements [<index>].full.star_texture)
		<child_id> :gettags
		if (<morph> = 1)
			doscreenelementmorph id = <child_id> pos = <final_pos> time = 0.4
			wait 0.2 seconds
		endif
	endif
	<i> = (<i> + 1)
	repeat 6
endscript

script kill_pulsate_star_power_bulbs 
	killspawnedscript name = pulsate_all_star_power_bulbs
	killspawnedscript name = pulsate_star_power_bulb
	killspawnedscript name = pulsate_big_glow
	old_alpha = 1
	i = 1
	begin
	formattext checksumname = id 'HUD2D_rock_tube_%d' d = <i>
	extendcrc <id> <player_text> out = parent_id
	if screenelementexists id = <parent_id>
		extendcrc <parent_id> 'tube' out = child_id
		<child_id> :gettags
		setscreenelementprops id = <child_id> alpha = <old_alpha>
		extendcrc <parent_id> 'full' out = child_id
		<child_id> :gettags
		setscreenelementprops id = <child_id> alpha = <old_alpha>
	endif
	<i> = (<i> + 1)
	repeat 6
	extendcrc hud2d_rock_glow <player_text> out = parent_id
	if screenelementexists id = <parent_id>
		setscreenelementprops id = <parent_id> alpha = 0
	endif
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
	<parent_id> :domorph alpha = 0 time = 1 motion = ease_in
	<parent_id> :domorph alpha = 1 time = 1 motion = ease_out
	repeat
endscript

script pulsate_all_star_power_bulbs 
	i = 1
	begin
	formattext checksumname = id 'HUD2D_rock_tube_%d' d = <i>
	extendcrc <id> <player_text> out = parent_id
	if screenelementexists id = <parent_id>
		extendcrc <parent_id> 'tube' out = child_id
		getscreenelementprops id = <child_id>
		<child_id> :settags old_alpha = <alpha>
		extendcrc <parent_id> 'full' out = child_id
		getscreenelementprops id = <child_id>
		<child_id> :settags old_alpha = <alpha>
	endif
	<i> = (<i> + 1)
	repeat 6
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
		printf "RUNNING SCREEN ELEMENT MEGAPULSE!!"
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
				doscreenelementmorph id = <shake_container> pos = (<pos> - (0.0, 50.0)) scale = 1.5 rot_angle = 10 time = <time_to_shake>
				wait <time_to_shake> seconds
			endif
			if screenelementexists id = <shake_container>
				doscreenelementmorph id = <shake_container> pos = (<pos> + (0.0, 75.0)) scale = 0.5 rot_angle = -15 time = <time_to_shake>
				wait <time_to_shake> seconds
			endif
			if screenelementexists id = <shake_container>
				doscreenelementmorph id = <shake_container> pos = (<pos>) scale = 1.0 rot_angle = 0 time = <time_to_shake>
			endif
		else
			if screenelementexists id = <shake_container>
				doscreenelementmorph id = <shake_container> pos = (<pos> - (50.0, 0.0)) scale = 1.5 rot_angle = 10 time = <time_to_shake>
				wait <time_to_shake> seconds
			endif
			if screenelementexists id = <shake_container>
				doscreenelementmorph id = <shake_container> pos = (<pos> + (75.0, 0.0)) scale = 0.5 rot_angle = -15 time = <time_to_shake>
				wait <time_to_shake> seconds
			endif
			if screenelementexists id = <shake_container>
				doscreenelementmorph id = <shake_container> pos = (<pos>) scale = 1.0 rot_angle = 0 time = <time_to_shake>
			endif
		endif
	endif
endscript

script rock_meter_star_power_off player_text = 'p1'
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
			wait 0.1 seconds
			if screenelementexists id = <parent_id>
				doscreenelementmorph id = <parent_id> pos = <initial_pos> time = 0.4
			endif
			wait 0.1 seconds
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

script hud_activated_star_power player = 1 time = 0.2
	if (<player> = 1)
		player_text = 'p1'
		current_run = ($player1_status.current_run)
		star_power = ($player1_status.star_power_used)
	elseif (<player> = 2)
		player_text = 'p2'
		current_run = ($player2_status.current_run)
		star_power = ($player2_status.star_power_used)
	else
		return
	endif
	spawnscriptnow kill_pulsate_star_power_bulbs params = {player_text = <player_text>}
	extendcrc hud2d_score_flash <player_text> out = new_flash
	if screenelementexists id = <new_flash>
		doscreenelementmorph id = <new_flash> alpha = 1 scale = 5 time = <time>
		wait <time> seconds
		if screenelementexists id = <new_flash>
			doscreenelementmorph id = <new_flash> alpha = 0 scale = 1 time = (<time> / 2.0)
		endif
		0xb9fcfeb7 player_text = <player_text> current_run = <current_run> star_power = <star_power>
	endif
endscript

script 0xb9fcfeb7 
	mults = [1 2 3 4 6 8]
	multiplier = 4
	if (<current_run> < 10)
		<multiplier> = 1
	elseif (<current_run> < 20)
		<multiplier> = 2
	elseif (<current_run> < 30)
		<multiplier> = 3
	endif
	if NOT (<star_power> = 0)
		<multiplier> = (<multiplier> * 2)
	endif
	i = 0
	begin
	if (<multiplier> = (<mults> [<i>]))
		if (<star_power> = 0)
			formattext checksumname = nixie 'HUD2D_score_nixie_%da%s' d = (<mults> [<i>]) s = <player_text>
			if screenelementexists id = <nixie>
				setscreenelementprops id = <nixie> alpha = 1
			endif
		else
			formattext checksumname = nixie 'HUD2D_score_nixie_%db%s' d = (<mults> [<i>]) s = <player_text>
			if screenelementexists id = <nixie>
				setscreenelementprops id = <nixie> alpha = 1
			endif
		endif
	else
		if NOT (<i> = 0 || <i> = 2)
			formattext checksumname = nixie 'HUD2D_score_nixie_%db%s' d = (<mults> [<i>]) s = <player_text>
			if screenelementexists id = <nixie>
				setscreenelementprops id = <nixie> alpha = 0
			endif
		endif
		if NOT (<i> = 4 || <i> = 5)
			formattext checksumname = nixie 'HUD2D_score_nixie_%da%s' d = (<mults> [<i>]) s = <player_text>
			if screenelementexists id = <nixie>
				setscreenelementprops id = <nixie> alpha = 0
			endif
		endif
	endif
	<i> = (<i> + 1)
	repeat 6
endscript

script hud_move_note_scorebar player = 1 time = 0.5 in = 1
	if ($game_mode = p2_battle || $boss_battle = 1 || $end_credits = 1)
		return
	endif
	if (($game_mode = p2_career || $game_mode = p2_coop) && (<player> = 2))
		return
	endif
	if NOT structurecontains structure = ($g_hud_2d_struct_used) offscreen_note_streak_bar_off
		return
	endif
	if (<player> = 1)
		player_text = 'p1'
		if ($game_mode = p2_career || $game_mode = p2_coop)
			count_pos = counter_pos
		else
			if ($current_num_players = 2)
				count_pos = counter_pos_p1
			else
				count_pos = counter_pos
			endif
		endif
	elseif (<player> = 2)
		player_text = 'p2'
		count_pos = counter_pos_p2
	else
		return
	endif
	if (<in> = 1)
		extendcrc hud2d_note_container <player_text> out = new_container
		if screenelementexists id = <new_container>
			doscreenelementmorph id = <new_container> pos = ((($g_hud_2d_struct_used).<count_pos>) - (0.0, 60.0)) time = <time> motion = ease_out
			wait <time> seconds
			if screenelementexists id = <new_container>
				doscreenelementmorph id = <new_container> pos = (($g_hud_2d_struct_used).<count_pos>) time = (<time> / 3) motion = ease_in
				<new_container> :domorph pos = {(0.0, 10.0) relative} time = 0.1 motion = ease_out
				<new_container> :domorph pos = {(0.0, -10.0) relative} time = 0.1 motion = ease_in
			endif
		endif
	else
		extendcrc hud2d_note_container <player_text> out = new_container
		if screenelementexists id = <new_container>
			if ($game_mode = p1_career || $game_mode = p2_career || $game_mode = p1_quickplay || $game_mode = p2_coop)
				doscreenelementmorph id = <new_container> pos = ((($g_hud_2d_struct_used).<count_pos>) - (0.0, 60.0)) time = (<time> / 2.0) motion = ease_out
			else
				doscreenelementmorph id = <new_container> pos = ((($g_hud_2d_struct_used).<count_pos>) + (0.0, 60.0)) time = (<time> / 2.0) motion = ease_in
			endif
			wait <time> seconds
			if screenelementexists id = <new_container>
				doscreenelementmorph id = <new_container> pos = ((($g_hud_2d_struct_used).<count_pos>) + ($g_hud_2d_struct_used).offscreen_note_streak_bar_off) time = <time>
			endif
		endif
	endif
endscript
old_animate_bulbs_star_power_p1 = 0.0
old_animate_bulbs_star_power_p2 = 0.0

script 0x4bf7efaf player = 1 star_power = 0.0 amount_per_bulb = 0.0 time = 0.2
	if ($game_mode = p2_battle || $boss_battle = 1)
		return
	endif
	if NOT gotparam 0x2ab06202
		if (<player> = 1)
			if ($old_animate_bulbs_star_power_p1 > <star_power>)
				return
			endif
		else
			if ($old_animate_bulbs_star_power_p2 > <star_power>)
				return
			endif
		endif
	endif
	if (<player> = 1)
		change old_animate_bulbs_star_power_p1 = <star_power>
	else
		change old_animate_bulbs_star_power_p2 = <star_power>
	endif
	if (<player> = 1)
		player_text = 'p1'
	elseif (<player> = 2)
		player_text = 'p2'
	else
		return
	endif
	i = 1
	begin
	formattext checksumname = id 'HUD2D_rock_tube_%d' d = <i>
	extendcrc <id> <player_text> out = parent_id
	extendcrc <parent_id> 'tube' out = 0x575177f5
	extendcrc <parent_id> 'full' out = 0x65280bf9
	if NOT screenelementexists id = <0x575177f5>
		return
	endif
	if (<star_power> >= <amount_per_bulb>)
		setscreenelementprops id = <0x575177f5> scale = (((($g_hud_2d_struct_used).small_bulb_scale) * (0.8, 0.0)) + (0.0, 3.0)) time = <time>
		doscreenelementmorph id = <0x65280bf9> alpha = 1 time = <time>
		<0x65280bf9> :settags old_alpha = 1
	else
		scale = (3.0 * (<star_power> / <amount_per_bulb>))
		0xf9b98420 = (<scale> / 3.0)
		if gotparam 0x2ab06202
			doscreenelementmorph id = <0x575177f5> scale = (((($g_hud_2d_struct_used).small_bulb_scale) * (0.8, 0.0)) + (<scale> * (0.0, 1.0)))
			doscreenelementmorph id = <0x65280bf9> alpha = <0xf9b98420>
		else
			doscreenelementmorph id = <0x575177f5> scale = (((($g_hud_2d_struct_used).small_bulb_scale) * (0.8, 0.0)) + (<scale> * (0.0, 1.0))) time = <time>
			doscreenelementmorph id = <0x65280bf9> alpha = <0xf9b98420> time = <time>
			<0x65280bf9> :settags old_alpha = <0xf9b98420>
		endif
	endif
	<star_power> = (<star_power> - <amount_per_bulb>)
	if (<star_power> < 0.0)
		<star_power> = 0.0
	endif
	<i> = (<i> + 1)
	repeat 6
endscript

script hud_flash_red_bg_p1 time = 0.2
	if ($g_flash_red_going_p1 = 1)
		return
	else
		change g_flash_red_going_p1 = 1
	endif
	if ($game_mode = p2_career || $game_mode = p2_coop)
		extendcrc hud2d_rock_lights_red 'p1' out = new_bg
		<time> = 0.15
	else
		extendcrc hud2d_rock_bg_red 'p1' out = new_bg
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

script hud_flash_red_bg_p2 time = 0.2
	if ($g_flash_red_going_p2 = 1)
		return
	else
		change g_flash_red_going_p2 = 1
	endif
	extendcrc hud2d_rock_bg_red 'p2' out = new_bg
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

script hud_flash_red_bg_kill player = 1
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
			killspawnedscript name = hud_flash_red_bg_p1
		else
			killspawnedscript name = hud_flash_red_bg_p2
		endif
	endif
	if (<player> = 1)
		change g_flash_red_going_p1 = 0
	else
		change g_flash_red_going_p2 = 0
	endif
endscript
