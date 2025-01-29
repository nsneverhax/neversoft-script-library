
script net_setup_solo_hud 
	if ($game_mode = p2_career)
		change g_hud_2d_struct_used = career_hud_2d_elements
	elseif ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff)
		change g_hud_2d_struct_used = net_faceoff_hud_2d_elements_solo
	elseif ($game_mode = p2_battle || ($boss_battle = 1))
		change g_hud_2d_struct_used = net_battle_hud_2d_elements_solo
	else
		change g_hud_2d_struct_used = career_hud_2d_elements
	endif
	extendcrc hud_2d_container ($<player_status>.text) out = new_2d_container
	if NOT screenelementexists id = <new_2d_container>
		createscreenelement {
			type = containerelement
			parent = root_window
			pos = (0.0, 0.0)
			just = [left top]
			id = <new_2d_container>
			scale = (($g_hud_2d_struct_used).scale)
		}
	endif
	create_2d_hud_elements parent = <new_2d_container> player_text = ($<player_status>.text) elements_structure = $g_hud_2d_struct_used
	extendcrc hud_2d_container 'p2' out = new_2d_container
	if NOT screenelementexists id = <new_2d_container>
		createscreenelement {
			type = containerelement
			parent = root_window
			pos = (0.0, 0.0)
			just = [left top]
			id = <new_2d_container>
			scale = (($g_hud_2d_struct_used).scale)
		}
	endif
	create_2d_hud_elements parent = <new_2d_container> player_text = 'p2' elements_structure = $g_hud_2d_struct_used
endscript
