
script ui_create_options_cheats_new 
	menu_music_off
	CreateScreenElement \{parent = root_window
		id = cheatsinterface
		Type = descinterface
		desc = 'new_cheat'
		pos_anchor = [
			center
			top
		]
		just = [
			0.0
			-0.95
		]
		Scale = 1.1
		Pos = (0.0, 0.0)}
	get_local_player_num_from_controller controller_index = ($primary_controller)
	if cheatsinterface :desc_resolvealias \{Name = alias_key_bars}
		AssignAlias id = <resolved_id> alias = current_menu
		<pad_green> = pad_btn_bottom
		<pad_red> = pad_btn_right
		<pad_blue> = pad_btn_left
		<pad_yellow> = pad_btn_top
		if isps3
			if isdrumcontroller \{controller = $primary_controller}
				<pad_blue> = pad_btn_top
				<pad_yellow> = pad_btn_left
			elseif IsGuitarController \{controller = $primary_controller}
				GetEnterButtonAssignment
				if (<assignment> = circle)
					<pad_green> = pad_btn_right
					<pad_red> = pad_btn_bottom
				endif
			endif
		endif
		current_menu :se_setprops {
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
				Player = <local_player_num>
			}
			exclusive_device = ($primary_controller)
		}
	endif
	if cheatsinterface :desc_resolvealias \{Name = alias_volume_bars}
		AssignAlias id = <resolved_id> alias = bar_menu
	endif
	if cheatsinterface :desc_resolvealias \{Name = alias_cheat_tv_glow}
		<resolved_id> :obj_spawnscript ui_options_cheats_new_tv_glow
	endif
	if cheatsinterface :desc_resolvealias \{Name = alias_info_container}
		AssignAlias id = <resolved_id> alias = info_container
	endif
	add_gamertag_helper \{exclusive_device = $primary_controller}
	add_user_control_helper \{text = qs(0x3fc1c076)
		button = start
		z = 100000}
endscript

script ui_destroy_options_cheats_new 
	SpawnScriptNow \{menu_music_on}
	DestroyScreenElement \{id = cheatsinterface}
	generic_ui_destroy
endscript

script ui_options_cheats_new_back 
	LaunchEvent \{Type = unfocus
		target = current_menu}
	check_car_unlocks
	ui_options_cheats_new_reset_bars
	GetTags
	if GotParam \{save_on_exit}
		ui_memcard_autosave_all_players \{event = menu_back
			state = uistate_options}
	else
		generic_event_back
	endif
endscript

script ui_options_cheats_new_enter 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	se_setprops \{block_events}
	GetTags
	GetScreenElementChildren \{id = bar_menu}
	current_key = (<children> [<index>])
	SetArrayElement ArrayName = cheat_array index = <index> NewValue = <key>
	SetTags {cheat_array = <cheat_array>}
	GetScreenElementChildren \{id = current_menu}
	switch (<key>)
		case green
		<current_key> :se_setprops rgba = [38 229 38 255]
		<current_key> :se_setprops alpha = 1.0
		current_bar = (<children> [0])
		<current_bar> :se_setprops alpha = 1.0 time = 0.1
		<current_bar> :se_waitprops
		<current_bar> :se_setprops alpha = 0.0 time = 0.1
		case red
		<current_key> :se_setprops rgba = [210 19 19 255]
		<current_key> :se_setprops alpha = 1.0
		current_bar = (<children> [1])
		<current_bar> :se_setprops alpha = 1.0 time = 0.1
		<current_bar> :se_waitprops
		<current_bar> :se_setprops alpha = 0.0 time = 0.1
		case yellow
		<current_key> :se_setprops rgba = [248 248 57 255]
		<current_key> :se_setprops alpha = 1.0
		current_bar = (<children> [2])
		<current_bar> :se_setprops alpha = 1.0 time = 0.1
		<current_bar> :se_waitprops
		<current_bar> :se_setprops alpha = 0.0 time = 0.1
		case blue
		<current_key> :se_setprops rgba = [7 7 198 255]
		<current_key> :se_setprops alpha = 1.0
		current_bar = (<children> [3])
		<current_bar> :se_setprops alpha = 1.0 time = 0.1
		<current_bar> :se_waitprops
		<current_bar> :se_setprops alpha = 0.0 time = 0.1
		case CLEAR
		ui_options_cheats_new_reset_bars
		se_setprops \{unblock_events}
		return
	endswitch
	formatText TextName = channel_text qs(0xe6c6aea2) i = (<index> + 1)
	cheatsinterface :se_setprops channel_text = <channel_text>
	if (<index> >= 7)
		Wait \{0.25
			Seconds}
		ui_options_cheats_new_check_valid device_num = <device_num>
		if GotParam \{cheat}
			if NOT GotParam \{already_unlocked}
				SetTags \{save_on_exit = 1}
				cheatsinterface :se_setprops info_text = ((<cheat>.name_text) + qs(0x51b4ec34))
				cheat_sound = unlocked
			else
				cheatsinterface :se_setprops info_text = ((<cheat>.name_text) + qs(0xf80b24a4))
				cheat_sound = already_unlocked
			endif
		else
			cheatsinterface :se_setprops {
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
		obj_spawnscript ui_options_cheats_new_sound_events params = {Sound = down cheat = <cheat_sound>}
		info_container :se_setprops \{Pos = {
				(0.0, -100.0)
				relative
			}}
		info_container :se_waitprops
		info_container :se_setprops \{alpha = 1.0}
		info_container :se_setprops \{Pos = {
				(0.0, 100.0)
				relative
			}
			time = 0.1}
		info_container :se_waitprops
		obj_spawnscript ui_options_cheats_new_sound_events params = {Sound = shake cheat = <cheat_sound>}
		begin
		info_container :se_setprops \{Pos = {
				(0.0, 5.0)
				relative
			}
			time = 0.075}
		info_container :se_waitprops
		info_container :se_setprops \{Pos = {
				(0.0, -5.0)
				relative
			}
			time = 0.075}
		info_container :se_waitprops
		repeat 10
		obj_spawnscript ui_options_cheats_new_sound_events params = {Sound = up cheat = <cheat_sound>}
		info_container :se_setprops \{Pos = {
				(0.0, -100.0)
				relative
			}
			time = 0.1}
		info_container :se_waitprops
		info_container :se_setprops \{alpha = 0.0}
		info_container :se_setprops \{Pos = {
				(0.0, 100.0)
				relative
			}}
		ui_options_cheats_new_reset_bars
	else
		SetTags {index = (<index> + 1)}
	endif
	se_setprops \{unblock_events}
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
		array_Size = (<index> + 1)
		i = <index>
		begin
		current_key = (<children> [<i>])
		formatText TextName = channel_text qs(0xe6c6aea2) i = <i>
		current_menu :obj_spawnscript ui_options_cheats_new_sound_events params = {Sound = CLEAR key = (<cheat_array> [<i>])}
		<current_key> :se_setprops alpha = 0.0 time = 0.1
		cheatsinterface :se_setprops channel_text = <channel_text>
		<current_key> :se_waitprops
		i = (<i> - 1)
		repeat <array_Size>
		Wait \{0.1
			Seconds}
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
	if (<array_Size> > 0)
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
			formatText checksumName = cheat_checksum 'unlock_Cheat_%a' a = (<cheat>.Name)
			if GotParam <cheat_checksum>
				if ((<...>.<cheat_checksum>) = 0)
					AddParam structure_name = params Name = <cheat_checksum> value = 1
					set_user_option_cheat_index_state index = <i> controller = <device_num> cheat_state = 0
					formatText checksumName = cheat_idx 'cheat_index%a' a = <i>
					AddParam structure_name = params Name = <cheat_idx> value = 0
					SetGlobalTags user_options params = <params>
					cheat_set_playerinfo_or_global cheat_index = <i> state_index = 0 Player = <Player> unlock_it
					if StructureContains structure = ($guitar_hero_cheats [<i>]) options
						option_array = ($guitar_hero_cheats [<i>].options)
						option_struct = (<option_array> [0])
						exclude_option option_struct = <option_struct> Player = <Player> no_menu_update
					endif
					<found> = 1
				else
					<found> = 2
				endif
			endif
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	if (<found> = 1)
		return {cheat = <cheat>}
	endif
	if (<found> = 2)
		return {cheat = <cheat> already_unlocked}
	endif
	if NOT CD
		GetArraySize ($guitar_hero_debug_cheats)
		if (<array_Size> > 0)
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
			repeat <array_Size>
		endif
	endif
	GetArraySize ($guitar_hero_hidden_cheats)
	if (<array_Size> > 0)
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
			Change GlobalName = (($guitar_hero_hidden_cheats [<i>]).Global) NewValue = (($guitar_hero_hidden_cheats [<i>]).value)
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
endscript

script ui_options_cheats_new_tv_glow 
	begin
	se_setprops alpha = RandomFloat (0.15, 0.25) time = RandomFloat (0.025, 0.07)
	se_waitprops
	se_setprops alpha = 0.1 time = RandomFloat (0.025, 0.07)
	se_waitprops
	Wait \{1
		gameframe}
	repeat
endscript

script ui_options_cheats_new_sound_events 
	switch (<Sound>)
		case Input
		switch (<key>)
			case green
			SoundEvent \{event = menu_cheat_enter_green}
			case red
			SoundEvent \{event = menu_cheat_enter_red}
			case yellow
			SoundEvent \{event = menu_cheat_enter_yellow}
			case blue
			SoundEvent \{event = menu_cheat_enter_blue}
		endswitch
		case down
		switch (<cheat>)
			case unlocked
			SoundEvent \{event = ui_unlock_item_sfx}
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
		case CLEAR
		switch (<key>)
			case green
			PlaySound \{menu_entername_scroll_1
				vol = -1
				buss = Front_End}
			case red
			PlaySound \{menu_entername_scroll_1
				vol = -1
				buss = Front_End}
			case yellow
			PlaySound \{menu_entername_scroll_1
				vol = -1
				buss = Front_End}
			case blue
			PlaySound \{menu_entername_scroll_1
				vol = -1
				buss = Front_End}
		endswitch
		case quit
		generic_menu_pad_back_sound
	endswitch
endscript
