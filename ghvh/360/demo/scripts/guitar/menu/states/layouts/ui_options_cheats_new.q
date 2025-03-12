
script ui_create_options_cheats_new 
	menu_music_off
	ui_fx_set_blur \{amount = 0.0
		time = 0.0}
	createscreenelement \{parent = root_window
		id = cheatsinterface
		type = descinterface
		desc = 'new_cheat'
		pos_anchor = [
			left
			top
		]
		pos = (0.0, 0.0)
		cheat_alpha = 0.0
		cheat_snake_r_pos = (75.0, 0.0)
		cheat_snake_l_pos = (-75.0, 0.0)
		title_pos = (0.0, 140.0)}
	assignalias \{id = cheatsinterface
		alias = current_menu}
	<pad_green> = pad_btn_bottom
	<pad_red> = pad_btn_right
	<pad_blue> = pad_btn_left
	<pad_yellow> = pad_btn_top
	if isps3
		if isdrumcontroller \{controller = $primary_controller}
			<pad_blue> = pad_btn_top
			<pad_yellow> = pad_btn_left
		endif
		getenterbuttonassignment
		if (<assignment> = circle)
			<pad_green> = pad_btn_right
			<pad_red> = pad_btn_bottom
		endif
	endif
	current_menu :se_setprops {
		event_handlers = [
			{pad_start ui_options_cheats_new_back}
			{<pad_green> ui_options_cheats_new_enter params = {key = green}}
			{<pad_red> ui_options_cheats_new_enter params = {key = red}}
			{<pad_blue> ui_options_cheats_new_enter params = {key = blue}}
			{<pad_yellow> ui_options_cheats_new_enter params = {key = yellow}}
			{<pad_green> ui_options_cheats_new_sound_events params = {sound = input key = green}}
			{<pad_red> ui_options_cheats_new_sound_events params = {sound = input key = red}}
			{<pad_blue> ui_options_cheats_new_sound_events params = {sound = input key = blue}}
			{<pad_yellow> ui_options_cheats_new_sound_events params = {sound = input key = yellow}}
		]
		tags = {
			index = 0
			cheat_array = [none none none none none none none none]
		}
		exclusive_device = ($primary_controller)
		info_text = qs(0x03ac90f0)
	}
	if current_menu :desc_resolvealias \{name = alias_color_bars}
		assignalias id = <resolved_id> alias = bar_menu
		getscreenelementchildren \{id = bar_menu}
		if gotparam \{children}
			getarraysize <children>
			if (<array_size> > 0)
				i = 0
				begin
				curr_bar = (<children> [<i>])
				<curr_bar> :se_setprops alpha = 0
				<curr_bar> :obj_spawnscript highlight_motion params = {menu_id = <curr_bar>}
				i = (<i> + 1)
				repeat <array_size>
			endif
		endif
	endif
	add_gamertag_helper \{exclusive_device = $primary_controller}
	add_user_control_helper \{text = qs(0x3fc1c076)
		button = start
		z = 100000}
endscript

script ui_destroy_options_cheats_new 
	spawnscriptnow \{menu_music_on}
	destroyscreenelement \{id = current_menu}
	generic_ui_destroy
endscript

script ui_options_cheats_new_back 
	launchevent \{type = unfocus
		target = current_menu}
	ui_options_cheats_new_reset_bars
	generic_event_back
endscript

script ui_options_cheats_new_enter 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	se_setprops \{block_events}
	gettags
	getscreenelementchildren \{id = bar_menu}
	current_key = (<children> [<index>])
	setarrayelement arrayname = cheat_array index = <index> newvalue = <key>
	settags {cheat_array = <cheat_array>}
	getscreenelementchildren \{id = current_menu}
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
		case clear
		ui_options_cheats_new_reset_bars
		se_setprops \{unblock_events}
		return
	endswitch
	if (<index> >= 7)
		wait \{0.25
			seconds}
		current_menu :se_setprops \{info_alpha = 0.0}
		ui_options_cheats_new_check_valid
		if gotparam \{cheat}
			if NOT gotparam \{already_unlocked}
				current_menu :se_setprops info_text = ((<cheat>.name_text) + qs(0x51b4ec34))
				cheat_sound = unlocked
			else
				current_menu :se_setprops info_text = ((<cheat>.name_text) + qs(0xf80b24a4))
				cheat_sound = already_unlocked
			endif
		else
			current_menu :se_setprops {
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
		current_menu :se_setprops \{info_alpha = 1.0
			time = 0.1}
		current_menu :se_waitprops
		obj_spawnscript ui_options_cheats_new_sound_events params = {sound = complete cheat = <cheat_sound>}
		obj_spawnscript \{ui_options_cheats_move_text}
		ui_options_cheats_new_reset_bars
	else
		settags {index = (<index> + 1)}
	endif
	se_setprops \{unblock_events}
endscript

script ui_options_cheats_move_text 
	current_menu :se_setprops \{info_pos = (0.0, 55.0)}
endscript

script ui_options_cheats_new_reset_bars 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	current_menu :gettags
	if (<index> = 0)
		return
	endif
	if getscreenelementchildren \{id = bar_menu}
		wait \{0.1
			seconds}
		getarraysize <children>
		array_size = (<index> + 1)
		i = <index>
		begin
		current_key = (<children> [<i>])
		current_menu :obj_spawnscript ui_options_cheats_new_sound_events params = {sound = clear key = (<cheat_array> [<i>])}
		<current_key> :se_setprops alpha = 0.0 time = 0.1
		<current_key> :se_waitprops
		i = (<i> - 1)
		repeat <array_size>
		wait \{0.1
			seconds}
	endif
	current_menu :se_setprops \{info_alpha = 0.0
		time = 0.1}
	current_menu :settags \{index = 0
		cheat_array = [
			none
			none
			none
			none
			none
			none
			none
			none
		]}
endscript

script ui_options_cheats_new_check_valid 
	current_menu :gettags
	getarraysize ($guitar_hero_cheats)
	getglobaltags \{user_options}
	<found> = 0
	if (<array_size> > 0)
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
			formattext checksumname = cheat_checksum 'unlock_Cheat_%a' a = (<cheat>.name)
			if gotparam <cheat_checksum>
				if ((<...>.<cheat_checksum>) = 0)
					addparam structure_name = params name = <cheat_checksum> value = 1
					setarrayelement arrayname = guitar_hero_cheat_index globalarray index = <i> newvalue = 0
					formattext checksumname = cheat_idx 'cheat_index%a' a = <i>
					addparam structure_name = params name = <cheat_idx> value = 0
					setglobaltags user_options params = <params>
					option_array = ($guitar_hero_cheats [<i>].options)
					option_struct = (<option_array> [0])
					globals = (<option_struct>.globals)
					cheat_set_globals globals = <globals>
					exclude_option option_struct = <option_struct> no_menu_update
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
	if NOT cd
		getarraysize ($guitar_hero_debug_cheats)
		if (<array_size> > 0)
			i = 0
			begin
			j = 0
			begin
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
	getarraysize ($guitar_hero_hidden_cheats)
	if (<array_size> > 0)
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
			change globalname = (($guitar_hero_hidden_cheats [<i>]).global) newvalue = (($guitar_hero_hidden_cheats [<i>]).value)
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script ui_options_cheats_new_sound_events 
	switch (<sound>)
		case input
		switch (<key>)
			case green
			soundevent \{event = menu_cheat_enter_green}
			case red
			soundevent \{event = menu_cheat_enter_red}
			case yellow
			soundevent \{event = menu_cheat_enter_yellow}
			case blue
			soundevent \{event = menu_cheat_enter_blue}
		endswitch
		case complete
		switch (<cheat>)
			case unlocked
			soundevent \{event = enter_band_name_finish}
			case already_unlocked
			soundevent \{event = menu_warning_sfx}
			case incorrect
			soundevent \{event = menu_warning_sfx}
		endswitch
		case clear
		switch (<key>)
			case green
			playsound \{menu_entername_scroll_1
				vol = -1
				buss = front_end}
			case red
			playsound \{menu_entername_scroll_2
				vol = -1
				buss = front_end}
			case yellow
			playsound \{menu_entername_scroll_3
				vol = -1
				buss = front_end}
			case blue
			playsound \{menu_entername_scroll_1
				vol = -1
				buss = front_end}
		endswitch
		case quit
		generic_menu_pad_back_sound
	endswitch
endscript

script ui_options_cheats_new_anim_out 
	if screenelementexists \{id = cheatsinterface}
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

script unlockvanhalenaltbandcheat 
	getglobaltags \{user_options}
	setglobaltags \{user_options
		params = {
			cheat_index0 = 0
			unlock_cheat_zombband = 1
		}}
	cheat = ($guitar_hero_cheats [0])
	setarrayelement \{arrayname = guitar_hero_cheat_index
		globalarray
		index = 0
		newvalue = 1}
	change \{cheat_altband = 0}
endscript
