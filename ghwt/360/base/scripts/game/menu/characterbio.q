
script add_character_bio 
	if ScreenElementExists \{id = character_bio}
		update_character_bio title = <title> bio = <bio> Name = <Name>
	else
		CreateScreenElement {
			Type = descinterface
			parent = root_window
			desc = 'character_bio'
			id = character_bio
			character_bio_name_material = sys_fontgrid_title_a2_sys_fontgrid_title_a2
			character_bio_name_text = <Name>
			character_bio_bio_text = <bio>
			character_bio_title_text = <title>
			character_bio_control_pos = {(0.0, -1000.0) relative}
		}
		SpawnScriptNow \{animate_character_bio}
	endif
endscript

script destroy_character_bio 
	if ScreenElementExists \{id = character_bio}
		DestroyScreenElement \{id = character_bio}
	endif
endscript

script animate_character_bio 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	if ScreenElementExists \{id = character_bio}
		character_bio :se_setprops \{character_bio_control_pos = {
				(0.0, 1030.0)
				relative
			}
			time = 0.2
			anim = gentle}
	else
		return
	endif
	Wait \{0.22
		Second}
	if ScreenElementExists \{id = character_bio}
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
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	if (RandomInteger (0.0, 1.0) = 1)
		swing_direction = 1
	else
		swing_direction = -1
	endif
	swing_direction = (<swing_direction> * RandomFloat (0.3, 1.0))
	if ScreenElementExists \{id = character_bio}
		character_bio :se_setprops character_bio_control_rot_angle = (<swing_direction> * 2) anim = gentle time = 0.15
	else
		return
	endif
	Wait \{0.2
		Second}
	if ScreenElementExists \{id = character_bio}
		character_bio :se_setprops character_bio_control_rot_angle = (<swing_direction> * -1.5) anim = gentle time = 0.275
	else
		return
	endif
	Wait \{0.35000002
		Second}
	if ScreenElementExists \{id = character_bio}
		character_bio :se_setprops character_bio_control_rot_angle = (<swing_direction> * 0.5) anim = gentle time = 0.2
	else
		return
	endif
	Wait \{0.25
		Second}
	if ScreenElementExists \{id = character_bio}
		character_bio :se_setprops character_bio_control_rot_angle = (<swing_direction> * -0.25) anim = gentle time = 0.15
	else
		return
	endif
	Wait \{0.2
		Second}
	if ScreenElementExists \{id = character_bio}
		character_bio :se_setprops \{character_bio_control_rot_angle = 0
			anim = gentle
			time = 0.1}
	else
		return
	endif
endscript

script update_character_bio 
	if ScreenElementExists \{id = character_bio}
		character_bio :se_setprops character_bio_title_text = <title>
	endif
	if ScreenElementExists \{id = character_bio}
		character_bio :se_setprops character_bio_name_text = <Name>
	endif
	if ScreenElementExists \{id = character_bio}
		character_bio :se_setprops character_bio_bio_text = <bio>
	endif
	animate_character_bio_wiggle
endscript
