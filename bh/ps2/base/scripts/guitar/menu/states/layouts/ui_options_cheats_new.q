
script ui_create_options_cheats_new 
	menu_music_off
	CreateScreenElement \{parent = root_window
		id = cheatsinterface
		Type = descinterface
		desc = 'new_cheat'}
	if cheatsinterface :desc_resolvealias \{Name = alias_key_bars}
		AssignAlias id = <resolved_id> alias = current_menu
		<pad_green> = pad_R2
		<pad_red> = pad_btn_right
		<pad_blue> = pad_btn_bottom
		<pad_yellow> = pad_btn_top
		if isdrumcontroller \{controller = $primary_controller}
			<pad_green> = pad_btn_bottom
			<pad_blue> = pad_btn_left
		endif
		disable_pause
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
	ui_options_cheats_new_reset_bars
	generic_event_back
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
		ui_options_cheats_new_check_valid
		if GotParam \{cheat}
			if NOT GotParam \{already_unlocked}
				cheatsinterface :se_setprops info_text = ((<cheat>.name_text) + qs(0x51b4ec34))
				cheat_sound = unlocked
			else
				cheatsinterface :se_setprops info_text = ((<cheat>.name_text) + qs(0xf80b24a4))
				cheat_sound = already_unlocked
			endif
		else
			cheatsinterface :se_setprops {
				info_text = Random (
					@ qs(0x59bc54c6)
					@ qs(0x23c99803)
					@ qs(0x990282d6)
					@ qs(0x3e29aefc)
					@ qs(0xc232764c)
					@ qs(0x585fe6a2)
					@ qs(0xb2e8b83e)
					@ qs(0x7d8f46bb)
					@ qs(0xe2dde6cd)
					@ qs(0xbfbb839f)
					@ qs(0x75550725)
					@ qs(0x75a6fa78)
					@ qs(0x611c6866)
					@ qs(0x30a0a84e)
					@ qs(0x966b0b57)
					@ qs(0xcb743e45)
					@ qs(0x4ef0c271)
					@ qs(0x5f5565f1)
					@ qs(0x2205ba67)
					@ qs(0x8cc02678)
					@ qs(0x85abaa11)
					@ qs(0xb5fc3df3)
					@ qs(0x585af892)
					@ qs(0xb1966aaa)
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

script unlock_cheat 
	GetGlobalTags \{user_options}
	cheat = ($guitar_hero_cheats [<cheat_index>])
	formatText checksumName = cheat_checksum 'unlock_Cheat_%a' a = (<cheat>.Name)
	if GotParam <cheat_checksum>
		if ((<...>.<cheat_checksum>) = 0)
			AddParam structure_name = params Name = <cheat_checksum> value = 1
			SetArrayElement ArrayName = guitar_hero_cheat_index globalarray index = <cheat_index> NewValue = 0
			formatText checksumName = cheat_idx 'cheat_index%a' a = <cheat_index>
			AddParam structure_name = params Name = <cheat_idx> value = 0
			SetGlobalTags user_options params = <params>
			if StructureContains structure = <cheat> options
				option_array = (<cheat>.options)
				option_struct = (<option_array> [0])
				globals = (<option_struct>.globals)
				cheat_set_globals globals = <globals>
				exclude_option option_struct = <option_struct> no_menu_update
			endif
			if StructureContains structure = <cheat> unlock_script
				unlock_script = (<cheat>.unlock_script)
				<unlock_script>
			endif
			return {true cheat = <cheat>}
		else
			return {true cheat = <cheat> already_unlocked}
		endif
	endif
	return {FALSE cheat = <cheat>}
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
			RemoveParameter \{already_unlocked}
			if unlock_cheat cheat_index = <i>
				found = 1
				if GotParam \{already_unlocked}
					found = 2
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
	GetArraySize ($guitar_hero_hidden_cheats)
	if (<array_Size> > 0)
		i = 0
		begin
		j = 0
		begin
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
			SoundEvent \{event = enter_band_name_finish}
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
