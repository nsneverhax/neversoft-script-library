
script net_setup_solo_hud 
	GetArraySize \{$hud_screen_elements}
	array_entry = 0
	GetNumPlayersInGame
	begin
	id = ($hud_screen_elements [<array_entry>].id)
	ExtendCrcPlayer <id> 2 out = id
	Pos = ($hud_screen_elements [<array_entry>].Pos)
	yoff = ($hud_screen_elements [<array_entry>].yoff)
	if (<num_players> = 2)
		px = (<Pos>.(1.0, 0.0))
		py = (<Pos>.(0.0, 1.0))
		px = (<px> * 0.4 + 640)
		py = (<py> - <yoff>)
		Pos = (<px> * (1.0, 0.0) + <py> * (0.0, 1.0))
	endif
	CreateScreenElement {
		type = TextElement
		parent = <hud_destroygroup>
		font = fontgrid_text_A1
		just = [left top]
		scale = 1.0
		rgba = [210 210 210 250]
		z_priority = 80.0
		($hud_screen_elements [<array_entry>])
		Pos = <Pos>
		id = <id>
	}
	array_entry = (<array_entry> + 1)
	repeat <array_size>
	reset_hud_text \{player = 2}
	if ($game_mode = gh4_p2_career)
		Change \{g_hud_2d_struct_used = $career_hud_2d_elements}
	elseif ($game_mode = p2_pro_faceoff)
		Change \{g_hud_2d_struct_used = $net_faceoff_hud_2d_elements_solo}
	else
		Change \{g_hud_2d_struct_used = $career_hud_2d_elements}
	endif
	ExtendCrcPlayer HUD_2D_Container <player> out = new_2d_container
	if NOT ScreenElementExists id = <new_2d_container>
		CreateScreenElement {
			type = ContainerElement
			parent = root_window
			Pos = (0.0, 0.0)
			just = [left top]
			id = <new_2d_container>
			scale = (($g_hud_2d_struct_used).scale)
		}
	endif
	create_2d_hud_elements parent = <new_2d_container> player = <player> elements_structure = $g_hud_2d_struct_used
	ExtendCrc \{HUD_2D_Container
		'p2'
		out = new_2d_container}
	if NOT ScreenElementExists id = <new_2d_container>
		CreateScreenElement {
			type = ContainerElement
			parent = root_window
			Pos = (0.0, 0.0)
			just = [left top]
			id = <new_2d_container>
			scale = (($g_hud_2d_struct_used).scale)
		}
	endif
	create_2d_hud_elements parent = <new_2d_container> player = 2 elements_structure = $g_hud_2d_struct_used
endscript
