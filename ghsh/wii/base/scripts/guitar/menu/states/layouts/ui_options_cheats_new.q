
script ui_create_options_cheats_new 
	menu_music_off
	ui_fx_set_blur \{amount = 0.0
		time = 0.0}
	CreateScreenElement \{parent = root_window
		id = cheatsinterface
		Type = descinterface
		desc = 'new_cheat'
		pos_anchor = [
			left
			top
		]
		Pos = (0.0, 0.0)
		cheat_alpha = 0.0
		cheat_snake_r_pos = (75.0, 0.0)
		cheat_snake_l_pos = (-75.0, 0.0)
		title_pos = (0.0, 140.0)}
	cheatsinterface :Obj_SpawnScriptNow \{bg_swap}
	AssignAlias \{id = cheatsinterface
		alias = current_menu}
	current_menu :se_setprops {
		event_handlers = [
			{pad_start ui_options_cheats_new_back}
			{pad_option ui_options_cheats_new_enter params = {key = blue}}
			{pad_back ui_options_cheats_new_enter params = {key = red}}
			{pad_choose ui_options_cheats_new_enter params = {key = green}}
			{pad_option2 ui_options_cheats_new_enter params = {key = yellow}}
			{pad_option ui_options_cheats_new_sound_events params = {Sound = Input key = blue}}
			{pad_back ui_options_cheats_new_sound_events params = {Sound = Input key = red}}
			{pad_choose ui_options_cheats_new_sound_events params = {Sound = Input key = green}}
			{pad_option2 ui_options_cheats_new_sound_events params = {Sound = Input key = yellow}}
		]
		tags = {
			index = 0
			cheat_array = [None None None None None None None None]
		}
		exclusive_device = ($primary_controller)
		info_text = qs(0x03ac90f0)
	}
	if current_menu :desc_resolvealias \{Name = alias_color_bars}
		AssignAlias id = <resolved_id> alias = bar_menu
		GetScreenElementChildren \{id = bar_menu}
		if GotParam \{children}
			GetArraySize <children>
			if (<array_Size> > 0)
				i = 0
				begin
				curr_bar = (<children> [<i>])
				<curr_bar> :se_setprops alpha = 0.5 cheat_highlight_rgba = (($g_menu_colors).menu_gold)
				i = (<i> + 1)
				repeat <array_Size>
			endif
		endif
	endif
	ui_options_cheats_move_text
	add_user_control_helper \{text = qs(0x3fc1c076)
		button = start
		z = 100000}
endscript

script ui_destroy_options_cheats_new 
	SpawnScriptNow \{menu_music_on}
	DestroyScreenElement \{id = current_menu}
	generic_ui_destroy
endscript

script ui_options_cheats_new_back 
	LaunchEvent \{Type = unfocus
		target = current_menu}
	ui_options_cheats_new_reset_bars
	current_menu :se_setprops \{new_cheat_alpha = 0.0
		time = 0.1}
	Wait \{0.1
		Second}
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
		<current_key> :se_setprops cheat_highlight_rgba = [38 229 38 255]
		<current_key> :se_setprops alpha = 1.0 time = 0.1
		case red
		<current_key> :se_setprops cheat_highlight_rgba = [210 19 19 255]
		<current_key> :se_setprops alpha = 1.0 time = 0.1
		case yellow
		<current_key> :se_setprops cheat_highlight_rgba = [248 248 57 255]
		<current_key> :se_setprops alpha = 1.0 time = 0.1
		case blue
		<current_key> :se_setprops cheat_highlight_rgba = [7 7 198 255]
		<current_key> :se_setprops alpha = 1.0 time = 0.1
		case CLEAR
		ui_options_cheats_new_reset_bars
		se_setprops \{unblock_events}
		return
	endswitch
	if (<index> >= 7)
		Wait \{0.25
			Seconds}
		current_menu :se_setprops \{info_alpha = 0.0}
		ui_options_cheats_new_check_valid
		if GotParam \{cheat}
			if NOT GotParam \{already_unlocked}
				current_menu :se_setprops info_text = ((<cheat>.name_text) + qs(0x51b4ec34))
				cheat_sound = unlocked
			else
				current_menu :se_setprops info_text = ((<cheat>.name_text) + qs(0xf80b24a4))
				cheat_sound = already_unlocked
			endif
		else
			current_menu :se_setprops {
				info_text = Random (
					@ qs(0x402989f7)
					@ qs(0x80e1db66)
					@ qs(0x35bdd337)
					@ qs(0x9bb241c4)
					@ qs(0xe51890c5)
					@ qs(0xfb77a5c7)
					@ qs(0x7a959d69)
					@ qs(0xdea705de)
					@ qs(0xd34d45eb)
					@ qs(0x2158b5ad)
					@ qs(0x44c5a403)
					@ qs(0x4436595e)
					@ qs(0x46368eef)
					@ qs(0x953b4776)
					@ qs(0x29eb3439)
					@ qs(0x67cb6fa4)
					@ qs(0x850bc567)
					@ qs(0x045c6a81)
					@ qs(0x2205ba67)
					@ qs(0xbe146813)
					@ qs(0x3b557db8)
					@ qs(0x4c2ee56b)
					@ qs(0xe6a42f3b)
					@ qs(0x140d8592)
					@ qs(0xb5b40e8b)
					@ qs(0xe97f6112)
					)
			}
			cheat_sound = incorrect
		endif
		current_menu :se_setprops \{info_alpha = 1.0
			time = 0.1}
		current_menu :se_waitprops
		obj_spawnscript ui_options_cheats_new_sound_events params = {Sound = complete cheat = <cheat_sound>}
		obj_spawnscript \{ui_options_cheats_move_text}
		ui_options_cheats_new_reset_bars
	else
		SetTags {index = (<index> + 1)}
	endif
	se_setprops \{unblock_events}
endscript

script ui_options_cheats_move_text 
	current_menu :se_setprops \{info_pos = (0.0, 75.0)}
endscript

script ui_options_cheats_new_reset_bars 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	current_menu :GetTags
	if (<index> = 0)
		return
	endif
	if GetScreenElementChildren \{id = bar_menu}
		Wait \{0.1
			Seconds}
		GetArraySize <children>
		array_Size = (<index> + 1)
		i = <index>
		begin
		current_key = (<children> [<i>])
		current_menu :obj_spawnscript ui_options_cheats_new_sound_events params = {Sound = CLEAR key = (<cheat_array> [<i>])}
		<current_key> :se_setprops alpha = 0.5 cheat_highlight_rgba = (($g_menu_colors).menu_gold) time = 0.1
		<current_key> :se_waitprops
		i = (<i> - 1)
		repeat <array_Size>
		Wait \{0.1
			Seconds}
	endif
	current_menu :se_setprops \{info_alpha = 0.0
		time = 0.1}
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
					SetArrayElement ArrayName = guitar_hero_cheat_index globalarray index = <i> NewValue = 0
					formatText checksumName = cheat_idx 'cheat_index%a' a = <i>
					AddParam structure_name = params Name = <cheat_idx> value = 0
					SetGlobalTags user_options params = <params>
					if StructureContains structure = ($guitar_hero_cheats [<i>]) options
						option_array = ($guitar_hero_cheats [<i>].options)
						option_struct = (<option_array> [0])
						globals = (<option_struct>.globals)
						cheat_set_globals globals = <globals>
						exclude_option option_struct = <option_struct> no_menu_update
					endif
					if StructureContains structure = ($guitar_hero_cheats [<i>]) unlock_script
						unlock_script = ($guitar_hero_cheats [<i>].unlock_script)
						<unlock_script>
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
		case complete
		switch (<cheat>)
			case unlocked
			SoundEvent \{event = enter_band_name_finish}
			case already_unlocked
			SoundEvent \{event = Menu_Warning_SFX}
			case incorrect
			SoundEvent \{event = Menu_Warning_SFX}
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

script ui_options_cheats_new_anim_out 
	if ScreenElementExists \{id = cheatsinterface}
		menu_complete_transition
		cheatsinterface :se_setprops \{cheat_snake_r_pos = (150.0, 0.0)
			cheat_snake_l_pos = (-150.0, 0.0)
			cheat_alpha = 1.0
			new_cheat_alpha = 0.0
			title_pos = (0.0, 72.0)
			time = 0.1}
		cheatsinterface :se_waitprops
		menu_start_transition
	endif
endscript
