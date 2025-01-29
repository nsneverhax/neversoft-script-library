
script net_setup_solo_hud 
	getarraysize \{$hud_screen_elements}
	array_entry = 0
	get_num_players_by_gamemode
	begin
	id = ($hud_screen_elements [<array_entry>].id)
	extendcrc <id> ($player2_status.text) out = id
	pos = ($hud_screen_elements [<array_entry>].pos)
	yoff = ($hud_screen_elements [<array_entry>].yoff)
	if (<num_players> = 2)
		px = (<pos>.(1.0, 0.0))
		py = (<pos>.(0.0, 1.0))
		px = (<px> * 0.4 + 640)
		py = (<py> - <yoff>)
		pos = (<px> * (1.0, 0.0) + <py> * (0.0, 1.0))
	endif
	createscreenelement {
		type = textelement
		parent = <hud_destroygroup>
		font = text_a6
		just = [left top]
		scale = 1.0
		rgba = [210 210 210 250]
		z_priority = 80.0
		($hud_screen_elements [<array_entry>])
		pos = <pos>
		id = <id>
	}
	array_entry = (<array_entry> + 1)
	repeat <array_size>
	reset_hud_text player_text = ($player2_status.text)
	if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff)
		change \{g_hud_2d_struct_used = net_faceoff_hud_2d_elements_solo}
	elseif ($game_mode = p2_battle || ($boss_battle = 1))
		change \{g_hud_2d_struct_used = net_battle_hud_2d_elements_solo}
	else
		change \{g_hud_2d_struct_used = career_hud_2d_elements}
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
	extendcrc \{hud_2d_container
		'p2'
		out = new_2d_container}
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
