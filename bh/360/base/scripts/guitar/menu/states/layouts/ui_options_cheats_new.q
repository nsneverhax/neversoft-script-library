
script ui_create_options_cheats_new 
	Menu_Music_Off
	CreateScreenElement \{parent = root_window
		id = CheatsInterface
		type = DescInterface
		desc = 'new_cheat'}
	get_local_player_num_from_controller controller_index = ($primary_controller)
	if CheatsInterface :Desc_ResolveAlias \{name = alias_key_bars}
		AssignAlias id = <resolved_id> alias = current_menu
		<pad_green> = pad_btn_bottom
		<pad_red> = pad_btn_right
		<pad_blue> = pad_btn_left
		<pad_yellow> = pad_btn_top
		if IsPS3
			if isdrumcontroller \{controller = $primary_controller}
				<pad_blue> = pad_btn_top
				<pad_yellow> = pad_btn_left
			elseif isguitarcontroller \{controller = $primary_controller}
				GetEnterButtonAssignment
				if (<assignment> = circle)
					<pad_green> = pad_btn_right
					<pad_red> = pad_btn_bottom
				endif
			endif
		endif
		current_menu :SE_SetProps {
			event_handlers = [
				{pad_start ui_options_cheats_new_back}
				{<pad_green> ui_options_cheats_new_enter params = {key = green}}
				{<pad_red> ui_options_cheats_new_enter params = {key = red}}
				{<pad_blue> ui_options_cheats_new_enter params = {key = blue}}
				{<pad_yellow> ui_options_cheats_new_enter params = {key = yellow}}
				{<pad_green> ui_options_cheats_new_sound_events params = {Sound = Input key = green}}
				{<pad_red> ui_options_cheats_new_sound_events params = {Sound = Input key = red}}
				{<pad_blue> ui_options_cheats_new_sound_events params = {Sound = Input key = blue}}
				{<pad_yellow> ui_options_cheats_new_sound_events params = {Sound = Input key = yellow}}
			]
			tags = {
				index = 0
				cheat_array = [None None None None None None None None]
				player = <local_player_num>
			}
			exclusive_device = ($primary_controller)
		}
	endif
	if CheatsInterface :Desc_ResolveAlias \{name = alias_volume_bars}
		AssignAlias id = <resolved_id> alias = bar_menu
	endif
	if CheatsInterface :Desc_ResolveAlias \{name = alias_info_container}
		AssignAlias id = <resolved_id> alias = info_container
	endif
	add_gamertag_helper \{exclusive_device = $primary_controller}
	add_user_control_helper \{text = qs(0x3fc1c076)
		button = start
		z = 100000}
endscript

script ui_destroy_options_cheats_new 
	spawnscriptnow \{menu_music_on}
	DestroyScreenElement \{id = CheatsInterface}
	generic_ui_destroy
endscript

script ui_options_cheats_new_back 
	LaunchEvent \{type = unfocus
		target = current_menu}
	check_CAR_unlocks
	ui_options_cheats_new_reset_bars
	GetTags
	if GotParam \{save_on_exit}
		ui_memcard_autosave_all_players \{event = menu_back
			state = UIstate_options}
	else
		generic_event_back
	endif
endscript

script ui_options_cheats_new_enter 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	SE_SetProps \{block_events}
	GetTags
	GetScreenElementChildren \{id = bar_menu}
	current_key = (<children> [<index>])
	SetArrayElement arrayName = cheat_array index = <index> newValue = <key>
	SetTags {cheat_array = <cheat_array>}
	GetScreenElementChildren \{id = current_menu}
	switch (<key>)
		case green
		<current_key> :SE_SetProps rgba = [38 229 38 255]
		<current_key> :SE_SetProps alpha = 1.0
		current_bar = (<children> [0])
		<current_bar> :SE_SetProps alpha = 1.0 time = 0.1
		<current_bar> :SE_WaitProps
		<current_bar> :SE_SetProps alpha = 0.0 time = 0.1
		case red
		<current_key> :SE_SetProps rgba = [210 19 19 255]
		<current_key> :SE_SetProps alpha = 1.0
		current_bar = (<children> [1])
		<current_bar> :SE_SetProps alpha = 1.0 time = 0.1
		<current_bar> :SE_WaitProps
		<current_bar> :SE_SetProps alpha = 0.0 time = 0.1
		case yellow
		<current_key> :SE_SetProps rgba = [248 248 57 255]
		<current_key> :SE_SetProps alpha = 1.0
		current_bar = (<children> [2])
		<current_bar> :SE_SetProps alpha = 1.0 time = 0.1
		<current_bar> :SE_WaitProps
		<current_bar> :SE_SetProps alpha = 0.0 time = 0.1
		case blue
		<current_key> :SE_SetProps rgba = [7 7 198 255]
		<current_key> :SE_SetProps alpha = 1.0
		current_bar = (<children> [3])
		<current_bar> :SE_SetProps alpha = 1.0 time = 0.1
		<current_bar> :SE_WaitProps
		<current_bar> :SE_SetProps alpha = 0.0 time = 0.1
		case clear
		ui_options_cheats_new_reset_bars
		SE_SetProps \{unblock_events}
		return
	endswitch
	FormatText TextName = channel_text qs(0xe6c6aea2) i = (<index> + 1)
	CheatsInterface :SE_SetProps channel_text = <channel_text>
	if (<index> >= 7)
		wait \{0.25
			seconds}
		ui_options_cheats_new_check_valid device_num = <device_num>
		if GotParam \{cheat}
			if NOT GotParam \{already_unlocked}
				SetTags \{save_on_exit = 1}
				CheatsInterface :SE_SetProps info_text = ((<cheat>.name_text) + qs(0x51b4ec34))
				cheat_sound = unlocked
			else
				CheatsInterface :SE_SetProps info_text = ((<cheat>.name_text) + qs(0xf80b24a4))
				cheat_sound = already_unlocked
			endif
		else
			CheatsInterface :SE_SetProps {
				info_text = Random (
					@ qs(0xd5165560)
					@ qs(0xb7b07cb1)
					@ qs(0x990282d6)
					@ qs(0x588681b6)
					@ qs(0x1c9663a4)
					@ qs(0xa6469612)
					@ qs(0xb2e8b83e)
					@ qs(0x9d4540c1)
					@ qs(0x3708a2a8)
					@ qs(0xa96c5958)
					@ qs(0xb71e258b)
					@ qs(0x2b7db776)
					@ qs(0x394ad443)
					@ qs(0xc375fb96)
					@ qs(0x966b0b57)
					@ qs(0xcb743e45)
					@ qs(0x4ef0c271)
					@ qs(0x5f5565f1)
					@ qs(0x2205ba67)
					@ qs(0x87db78f7)
					@ qs(0x85abaa11)
					@ qs(0xb5fc3df3)
					@ qs(0x1fa10ae7)
					@ qs(0x668efb56)
					@ qs(0x39b54e6d)
					@ qs(0x97e40c7c)
					)
			}
			cheat_sound = incorrect
		endif
		Obj_SpawnScript ui_options_cheats_new_sound_events params = {Sound = down cheat = <cheat_sound>}
		info_container :SE_SetProps \{Pos = {
				(0.0, -100.0)
				relative
			}}
		info_container :SE_WaitProps
		info_container :SE_SetProps \{alpha = 1.0}
		info_container :SE_SetProps \{Pos = {
				(0.0, 100.0)
				relative
			}
			time = 0.1}
		info_container :SE_WaitProps
		Obj_SpawnScript ui_options_cheats_new_sound_events params = {Sound = shake cheat = <cheat_sound>}
		begin
		info_container :SE_SetProps \{Pos = {
				(0.0, 5.0)
				relative
			}
			time = 0.075}
		info_container :SE_WaitProps
		info_container :SE_SetProps \{Pos = {
				(0.0, -5.0)
				relative
			}
			time = 0.075}
		info_container :SE_WaitProps
		repeat 10
		Obj_SpawnScript ui_options_cheats_new_sound_events params = {Sound = up cheat = <cheat_sound>}
		info_container :SE_SetProps \{Pos = {
				(0.0, 100.0)
				relative
			}
			time = 0.1}
		info_container :SE_WaitProps
		info_container :SE_SetProps \{alpha = 0.0}
		info_container :SE_SetProps \{Pos = {
				(0.0, -100.0)
				relative
			}}
		ui_options_cheats_new_reset_bars
	else
		SetTags {index = (<index> + 1)}
	endif
	SE_SetProps \{unblock_events}
endscript

script ui_options_cheats_new_reset_bars 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	current_menu :GetTags
	if (<index> = 0)
		return
	endif
	if GetScreenElementChildren \{id = bar_menu}
		GetArraySize <children>
		array_size = (<index> + 1)
		i = <index>
		begin
		current_key = (<children> [<i>])
		FormatText TextName = channel_text qs(0xe6c6aea2) i = <i>
		current_menu :Obj_SpawnScript ui_options_cheats_new_sound_events params = {Sound = clear key = (<cheat_array> [<i>])}
		<current_key> :SE_SetProps alpha = 0.0 time = 0.1
		CheatsInterface :SE_SetProps channel_text = <channel_text>
		<current_key> :SE_WaitProps
		i = (<i> - 1)
		repeat <array_size>
		wait \{0.1
			seconds}
	endif
	current_menu :SetTags \{index = 0
		cheat_array = [
			None
			None
			None
			None
			None
			None
			None
			None
		]}
endscript

script ui_options_cheats_new_check_valid 
	current_menu :GetTags
	GetArraySize ($guitar_hero_cheats)
	GetGlobalTags \{user_options}
	<found> = 0
	if (<array_size> > 0)
		i = 0
		begin
		j = 0
		begin
		if NOT StructureContains structure = ($guitar_hero_cheats [<i>]) unlock_pattern
			break
		endif
		if NOT ((($guitar_hero_cheats [<i>]).unlock_pattern [<j>]) = (<cheat_array> [<j>]))
			break
		endif
		j = (<j> + 1)
		repeat 8
		if (<j> = 8)
			cheat = ($guitar_hero_cheats [<i>])
			FormatText checksumname = cheat_checksum 'unlock_Cheat_%a' a = (<cheat>.name)
			if GotParam <cheat_checksum>
				if ((<...>.<cheat_checksum>) = 0)
					AddParam structure_name = params name = <cheat_checksum> value = 1
					set_user_option_cheat_index_state index = <i> controller = <device_num> cheat_state = 0
					FormatText checksumname = cheat_idx 'cheat_index%a' a = <i>
					AddParam structure_name = params name = <cheat_idx> value = 0
					SetGlobalTags user_options params = <params>
					cheat_set_playerinfo_or_global cheat_index = <i> state_index = 0 player = <player> unlock_it
					if StructureContains structure = ($guitar_hero_cheats [<i>]) options
						option_array = ($guitar_hero_cheats [<i>].options)
						option_struct = (<option_array> [0])
						exclude_option option_struct = <option_struct> player = <player> no_menu_update
					endif
					<found> = 1
				else
					<found> = 2
				endif
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	if (<found> = 1)
		return {cheat = <cheat>}
	endif
	if (<found> = 2)
		return {cheat = <cheat> already_unlocked}
	endif
	if NOT CD
		GetArraySize ($guitar_hero_debug_cheats)
		if (<array_size> > 0)
			i = 0
			begin
			j = 0
			begin
			if NOT StructureContains structure = ($guitar_hero_debug_cheats [<i>]) unlock_pattern
				break
			endif
			if NOT ((($guitar_hero_debug_cheats [<i>]).unlock_pattern [<j>]) = (<cheat_array> [<j>]))
				break
			endif
			j = (<j> + 1)
			repeat 8
			if (<j> = 8)
				cheat = ($guitar_hero_debug_cheats [<i>])
				return {cheat = <cheat>}
			endif
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
	GetArraySize ($guitar_hero_hidden_cheats)
	if (<array_size> > 0)
		i = 0
		begin
		j = 0
		begin
		if NOT StructureContains structure = ($guitar_hero_hidden_cheats [<i>]) unlock_pattern
			break
		endif
		if NOT ((($guitar_hero_hidden_cheats [<i>]).unlock_pattern [<j>]) = (<cheat_array> [<j>]))
			break
		endif
		j = (<j> + 1)
		repeat 8
		if (<j> = 8)
			cheat = ($guitar_hero_hidden_cheats [<i>])
			Change globalname = (($guitar_hero_hidden_cheats [<i>]).Global) newValue = (($guitar_hero_hidden_cheats [<i>]).value)
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script ui_options_cheats_new_sound_events 
	switch (<Sound>)
		case Input
		switch (<key>)
			case green
			SoundEvent \{event = Menu_Cheat_Enter_Green}
			case red
			SoundEvent \{event = Menu_Cheat_Enter_Red}
			case yellow
			SoundEvent \{event = Menu_Cheat_Enter_Yellow}
			case blue
			SoundEvent \{event = Menu_Cheat_Enter_Blue}
		endswitch
		case down
		switch (<cheat>)
			case unlocked
			SoundEvent \{event = UI_Unlock_Item_SFX}
			case already_unlocked
			SoundEvent \{event = Menu_Warning_SFX}
			case incorrect
			SoundEvent \{event = Menu_Warning_SFX}
		endswitch
		case shake
		switch (<cheat>)
		endswitch
		case up
		switch (<cheat>)
		endswitch
		case clear
		switch (<key>)
			case green
			PlaySound \{Menu_EnterName_Scroll_1
				vol = -1
				buss = front_end}
			case red
			PlaySound \{Menu_EnterName_Scroll_1
				vol = -1
				buss = front_end}
			case yellow
			PlaySound \{Menu_EnterName_Scroll_1
				vol = -1
				buss = front_end}
			case blue
			PlaySound \{Menu_EnterName_Scroll_1
				vol = -1
				buss = front_end}
		endswitch
		case quit
		generic_menu_pad_back_sound
	endswitch
endscript
