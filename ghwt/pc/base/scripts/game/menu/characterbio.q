
script add_character_bio 
	if screenelementexists \{id = character_bio}
		update_character_bio title = <title> bio = <bio> name = <name>
	else
		createscreenelement {
			type = descinterface
			parent = root_window
			desc = 'character_bio'
			id = character_bio
			character_bio_name_material = sys_fontgrid_title_a2_sys_fontgrid_title_a2
			character_bio_name_text = <name>
			character_bio_bio_text = <bio>
			character_bio_title_text = <title>
			character_bio_control_pos = {(0.0, -1000.0) relative}
		}
		spawnscriptnow \{animate_character_bio}
	endif
endscript

script destroy_character_bio 
	if screenelementexists \{id = character_bio}
		destroyscreenelement \{id = character_bio}
	endif
endscript

script animate_character_bio 
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	if screenelementexists \{id = character_bio}
		character_bio :se_setprops \{character_bio_control_pos = {
				(0.0, 1030.0)
				relative
			}
			time = 0.2
			anim = gentle}
	else
		return
	endif
	wait \{0.22
		second}
	if screenelementexists \{id = character_bio}
		character_bio :se_setprops \{character_bio_control_pos = {
				(0.0, -30.0)
				relative
			}
			time = 0.1
			anim = gentle}
	else
		return
	endif
	animate_character_bio_wiggle id = <id>
endscript

script animate_character_bio_wiggle 
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	if (RandomInteger (0.0, 1.0) = 1)
		swing_direction = 1
	else
		swing_direction = -1
	endif
	swing_direction = (<swing_direction> * RandomFloat (0.3, 1.0))
	if screenelementexists \{id = character_bio}
		character_bio :se_setprops character_bio_control_rot_angle = (<swing_direction> * 2) anim = gentle time = 0.15
	else
		return
	endif
	wait \{0.2
		second}
	if screenelementexists \{id = character_bio}
		character_bio :se_setprops character_bio_control_rot_angle = (<swing_direction> * -1.5) anim = gentle time = 0.275
	else
		return
	endif
	wait \{0.35000002
		second}
	if screenelementexists \{id = character_bio}
		character_bio :se_setprops character_bio_control_rot_angle = (<swing_direction> * 0.5) anim = gentle time = 0.2
	else
		return
	endif
	wait \{0.25
		second}
	if screenelementexists \{id = character_bio}
		character_bio :se_setprops character_bio_control_rot_angle = (<swing_direction> * -0.25) anim = gentle time = 0.15
	else
		return
	endif
	wait \{0.2
		second}
	if screenelementexists \{id = character_bio}
		character_bio :se_setprops \{character_bio_control_rot_angle = 0
			anim = gentle
			time = 0.1}
	else
		return
	endif
endscript

script update_character_bio 
	if screenelementexists \{id = character_bio}
		character_bio :se_setprops character_bio_title_text = <title>
	endif
	if screenelementexists \{id = character_bio}
		character_bio :se_setprops character_bio_name_text = <name>
	endif
	if screenelementexists \{id = character_bio}
		character_bio :se_setprops character_bio_bio_text = <bio>
	endif
	animate_character_bio_wiggle
endscript
