guitar_hero_cheats = [
	{
		name = 'ContestWinner1'
		name_text = qs(0xbd5d7861)
		var = cheat_contestwinner1
		exclue_from_menu = 1
		unlock_pattern = [
			blue
			blue
			red
			yellow
			red
			yellow
			blue
			blue
		]
	}
	{
		name = 'AlwaysSlide'
		name_text = qs(0x7e8961c8)
		var = cheat_alwaysslide
		unlock_pattern = [
			yellow
			green
			yellow
			yellow
			yellow
			red
			blue
			red
		]
		options = [
			{
				text = qs(0x86ea6a05)
				globals = [
					{
						set = cheat_alwaysslide
						location = playerinfo
						value = 0
					}
				]
			}
			{
				text = qs(0x73bb988d)
				globals = [
					{
						set = cheat_alwaysslide
						location = playerinfo
						value = 1
					}
				]
			}
		]
	}
	{
		name = 'AirInstruments'
		name_text = qs(0x9de16fb4)
		var = cheat_airinstruments
		save_persistent_state
		unlock_pattern = [
			blue
			yellow
			blue
			red
			red
			yellow
			green
			yellow
		]
		options = [
			{
				text = qs(0x922dee7d)
				globals = [
					{
						set = cheat_airinstruments
						location = global
						value = 0
					}
				]
			}
			{
				text = qs(0xa75536b7)
				globals = [
					{
						set = cheat_airinstruments
						location = global
						value = 1
					}
				]
			}
		]
	}
	{
		name = 'InvisibleCharacters'
		name_text = qs(0xd16f0703)
		var = cheat_invisiblecharacters
		save_persistent_state
		unlock_pattern = [
			green
			red
			yellow
			green
			yellow
			blue
			yellow
			green
		]
		options = [
			{
				text = qs(0x75518f7e)
				globals = [
					{
						set = cheat_invisiblecharacters
						location = global
						value = 0
					}
				]
			}
			{
				text = qs(0x8a1b804e)
				globals = [
					{
						set = cheat_invisiblecharacters
						location = global
						value = 1
					}
				]
			}
		]
	}
	{
		name = 'PerformanceMode'
		name_text = qs(0x8aa50be2)
		var = cheat_performancemode
		save_persistent_state
		unlock_pattern = [
			yellow
			yellow
			blue
			green
			blue
			red
			red
			red
		]
		options = [
			{
				text = qs(0xee7e88b7)
				globals = [
					{
						set = cheat_performancemode
						location = global
						value = 0
					}
				]
			}
			{
				text = qs(0x4bb6076b)
				exclude = [
					cheat_focusmode
				]
				globals = [
					{
						set = cheat_performancemode
						location = global
						value = 1
					}
				]
			}
		]
	}
	{
		name = 'Hyperspeed'
		name_text = qs(0x8968c474)
		var = cheat_hyperspeed
		save_persistent_state
		options = [
			{
				text = qs(0xb9ffd402)
				globals = [
					{
						set = cheat_hyperspeed
						location = playerinfo
						value = 0
					}
					{
						set = cheat_hyperspeed_value
						location = playerinfo
						value = 1.0
					}
				]
			}
			{
				text = qs(0x27f94f8e)
				globals = [
					{
						set = cheat_hyperspeed
						location = playerinfo
						value = 1
					}
					{
						set = cheat_hyperspeed_value
						location = playerinfo
						value = 0.88
					}
				]
			}
			{
				text = qs(0x0cd41c4d)
				globals = [
					{
						set = cheat_hyperspeed
						location = playerinfo
						value = 2
					}
					{
						set = cheat_hyperspeed_value
						location = playerinfo
						value = 0.83
					}
				]
			}
			{
				text = qs(0x15cf2d0c)
				globals = [
					{
						set = cheat_hyperspeed
						location = playerinfo
						value = 3
					}
					{
						set = cheat_hyperspeed_value
						location = playerinfo
						value = 0.78
					}
				]
			}
			{
				text = qs(0x5a8ebbcb)
				globals = [
					{
						set = cheat_hyperspeed
						location = playerinfo
						value = 4
					}
					{
						set = cheat_hyperspeed_value
						location = playerinfo
						value = 0.72999996
					}
				]
			}
			{
				text = qs(0x43958a8a)
				globals = [
					{
						set = cheat_hyperspeed
						location = playerinfo
						value = 5
					}
					{
						set = cheat_hyperspeed_value
						location = playerinfo
						value = 0.68
					}
				]
			}
		]
	}
	{
		name = 'AutoKick'
		name_text = qs(0x8aba6894)
		var = cheat_autokick
		unlock_pattern = [
			yellow
			green
			yellow
			blue
			blue
			red
			blue
			red
		]
		options = [
			{
				text = qs(0x11e8d81c)
				globals = [
					{
						set = cheat_autokick
						location = playerinfo
						value = 0
					}
				]
			}
			{
				text = qs(0x783c6468)
				globals = [
					{
						set = cheat_autokick
						location = playerinfo
						value = 1
					}
				]
			}
		]
	}
	{
		name = 'Invincible'
		name_text = qs(0x38ea0a05)
		var = cheat_invincible
		options = [
			{
				text = qs(0xe52d7538)
				globals = [
					{
						set = cheat_invincible
						location = global
						value = 0
					}
				]
			}
			{
				text = qs(0x61422eb3)
				globals = [
					{
						set = cheat_invincible
						location = global
						value = 1
					}
				]
			}
		]
	}
	{
		name = 'FocusMode'
		name_text = qs(0x784bfac2)
		var = cheat_focusmode
		save_persistent_state
		unlock_pattern = [
			yellow
			yellow
			green
			green
			red
			red
			blue
			blue
		]
		options = [
			{
				text = qs(0x8ce8dc7a)
				globals = [
					{
						set = cheat_focusmode
						location = global
						value = 0
					}
				]
			}
			{
				text = qs(0x06701c4e)
				exclude = [
					cheat_performancemode
				]
				globals = [
					{
						set = cheat_focusmode
						location = global
						value = 1
					}
				]
			}
		]
	}
	{
		name = 'HUDFreeMode'
		name_text = qs(0xf006f58f)
		var = cheat_hudfreemode
		save_persistent_state
		unlock_pattern = [
			green
			red
			green
			red
			yellow
			blue
			green
			red
		]
		options = [
			{
				text = qs(0x07cb4fb2)
				globals = [
					{
						set = cheat_hudfreemode
						location = global
						value = 0
					}
				]
			}
			{
				text = qs(0xff25e9cb)
				globals = [
					{
						set = cheat_hudfreemode
						location = global
						value = 1
					}
				]
			}
		]
	}
	{
		name = 'allHOPOs'
		name_text = qs(0x2954aa2e)
		var = cheat_allhopos
		unlock_pattern = [
			red
			green
			blue
			green
			blue
			green
			red
			green
		]
		options = [
			{
				text = qs(0xf15bbc7d)
				globals = [
					{
						set = cheat_allhopos
						location = playerinfo
						value = 0
					}
				]
			}
			{
				text = qs(0xf378a4b2)
				globals = [
					{
						set = cheat_allhopos
						location = playerinfo
						value = 1
					}
				]
			}
		]
	}
	{
		name = 'FreeDrum'
		name_text = qs(0x2d0883b3)
		var = cheat_freedrum
		options = [
			{
				text = qs(0xe14cbf66)
				globals = [
					{
						set = cheat_freedrum
						location = playerinfo
						value = 0
					}
				]
			}
			{
				text = qs(0x5d3fad47)
				globals = [
					{
						set = cheat_freedrum
						location = playerinfo
						value = 1
					}
				]
			}
		]
	}
	{
		name = 'UnlockAllCharacters'
		name_text = qs(0x8359f1ec)
		var = cheat_unlockallcharacters
		unlock_pattern = [
			blue
			yellow
			green
			yellow
			red
			green
			red
			yellow
		]
	}
]
guitar_hero_debug_cheats = [
	{
		name = 'UnlockAll'
		name_text = qs(0xa2947ec6)
		var = cheat_unlockall
		unlock_pattern = [
			green
			green
			green
			green
			green
			green
			green
			yellow
		]
	}
	{
		name = 'UnlockAllEverything'
		name_text = qs(0x98a7826c)
		var = cheat_unlockall_everything
		unlock_pattern = [
			green
			green
			green
			green
			green
			green
			green
			red
		]
	}
]
guitar_hero_hidden_cheats = [
	{
		name = 'SuperUser'
		name_text = qs(0x93a6ae81)
		var = cheat_superuser
		unlock_pattern = [
			green
			blue
			red
			yellow
			yellow
			red
			blue
			green
		]
	}
]
ui_cheats_settings = {
}

script ui_options_cheat_toggle 
	requireparams \{[
			player
			device_num
		]
		all}
	if NOT gotparam \{index}
		gettags
	endif
	get_user_option_cheat_index_state index = <index> controller = <device_num>
	<cheat_state> = (<cheat_state> + 1)
	if NOT structurecontains structure = ($guitar_hero_cheats [<index>]) options
		return
	endif
	option_array = ($guitar_hero_cheats [<index>].options)
	getarraysize <option_array>
	if (<cheat_state> >= <array_size>)
		<cheat_state> = 0
	endif
	set_user_option_cheat_index_state index = <index> controller = <device_num> cheat_state = <cheat_state>
	cheat_set_playerinfo_or_global cheat_index = <index> state_index = <cheat_state> player = <player>
	option_struct = (<option_array> [<cheat_state>])
	if NOT gotparam \{for_band_lobby}
		if screenelementexists \{id = menurow_txt_item_text}
			text = (<option_struct>.text)
			se_setprops menurow_txt_item_text = <text>
		endif
	endif
	exclude_option option_struct = <option_struct> player = <player> device_num = <device_num>
	return cheat_state = <cheat_state>
endscript

script cheat_set_playerinfo_or_global 
	requireparams \{[
			cheat_index
			state_index
			player
		]
		all}
	current_cheat = ($guitar_hero_cheats [<cheat_index>])
	if gotparam \{unlock_it}
		formattext checksumname = tags_checksum 'unlock_Cheat_%a' a = (<current_cheat>.name)
		addparam structure_name = tag_params name = <tags_checksum> value = 1
		setglobaltags user_options params = <tag_params> savegame = <savegame>
	endif
	if NOT structurecontains structure = <current_cheat> options
		return
	endif
	options = (<current_cheat>.options)
	globals = ((<options> [<state_index>]).globals)
	getarraysize <globals>
	i = 0
	begin
	current_var = (<globals> [<i>])
	addparam structure_name = info_params name = (<current_var>.set) value = (<current_var>.value)
	if (((<current_var>).location) = playerinfo)
		setplayerinfo <player> <info_params>
		removeparameter \{info_params}
	elseif (((<current_var>).location) = global)
		if globalexists name = (<current_var>.set)
			change globalname = (<current_var>.set) newvalue = (<current_var>.value)
		else
			printscriptinfo \{'cheat_set_playerinfo_or_global'}
			printf qs(0xa0d71a8d) n = (<current_var>.set)
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
endscript

script cheat_turnoffall 
	getarraysize \{$guitar_hero_cheats}
	num_cheats = <array_size>
	getmaxplayers
	i = 0
	begin
	player = 1
	begin
	cheat_set_playerinfo_or_global cheat_index = <i> state_index = 0 player = <player>
	player = (<player> + 1)
	repeat <max_players>
	i = (<i> + 1)
	repeat <num_cheats>
endscript

script cheat_turnoffalllocked 
	getarraysize \{$guitar_hero_cheats}
	num_cheats = <array_size>
	getmaxplayers
	i = 0
	begin
	cheat_name = ($guitar_hero_cheats [<i>].name)
	unlocked = 0
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		begin
		unlocked = 0
		getplayerinfo <player> is_local_client
		if (<is_local_client> = 1)
			getplayerinfo <player> controller
			getsavegamefromcontroller controller = <controller>
			formattext checksumname = unlock_tag_crc 'unlock_Cheat_%a' a = <cheat_name>
			getglobaltags savegame = <savegame> user_options
			if gotparam <unlock_tag_crc>
				if (<...>.<unlock_tag_crc> = 1)
					unlocked = 1
					break
				endif
			endif
		endif
		getnextplayer player = <player> local
		repeat <num_players>
	endif
	getnumplayersingame \{local}
	if (<num_players> > 0)
		if (<unlocked> = 0)
			getfirstplayer \{local}
			begin
			cheat_set_playerinfo_or_global cheat_index = <i> state_index = 0 player = <player>
			getnextplayer player = <player> local
			repeat <num_players>
		endif
	endif
	i = (<i> + 1)
	repeat <num_cheats>
endscript

script exclude_option 
	if structurecontains structure = <option_struct> exclude
		<exclude_array> = (<option_struct>.exclude)
		<exclude_index> = 0
		getarraysize <exclude_array>
		<exclude_array_size> = <array_size>
		getglobaltags \{user_options}
		begin
		<exclude> = (<exclude_array> [<exclude_index>])
		getarraysize \{$guitar_hero_cheats}
		<idx> = 0
		begin
		<var> = ($guitar_hero_cheats [<idx>].var)
		if (<var> = <exclude>)
			<name> = ($guitar_hero_cheats [<idx>].name)
			formattext checksumname = cheat_checksum 'unlock_Cheat_%a' a = <name>
			if NOT ((<...>.<cheat_checksum>) = 0)
				if structurecontains structure = ($guitar_hero_cheats [<idx>]) options
					exclude_array = ($guitar_hero_cheats [<idx>].options)
					set_user_option_cheat_index_state index = <idx> controller = <device_num> cheat_state = 0
					getglobaltags \{user_options}
					formattext checksumname = cheat_idx 'cheat_index%a' a = <idx>
					addparam structure_name = params name = <cheat_idx> value = 0
					setglobaltags user_options params = <params>
					exclude_struct = (<exclude_array> [0])
					if NOT gotparam \{no_menu_update}
						text = (<exclude_struct>.text)
						if screenelementexists id = {current_menu child = (<idx> + 1)}
							setscreenelementprops id = {current_menu child = (<idx> + 1)} item_text = <text>
						endif
					endif
					cheat_set_playerinfo_or_global cheat_index = <idx> state_index = 0 player = <player>
				endif
			endif
			break
		endif
		<idx> = (<idx> + 1)
		repeat <array_size>
		<exclude_index> = (<exclude_index> + 1)
		repeat <exclude_array_size>
	endif
endscript

script check_car_unlocks controller = ($primary_controller)
	get_savegame_from_controller controller = <controller>
	getglobaltags savegame = <savegame> user_options param = unlock_cheat_contestwinner1
	if gotparam \{unlock_cheat_contestwinner1}
		if (<unlock_cheat_contestwinner1> = 1)
			printf \{'UNLOCKING CONTEST WINNER'
				channel = jrdebug}
			unlock_profile id = 0x26ab6f0d savegame = <savegame>
		endif
	endif
	getglobaltags savegame = <savegame> user_options param = unlock_cheat_unlockallcharacters
	if gotparam \{unlock_cheat_unlockallcharacters}
		if (<unlock_cheat_unlockallcharacters> = 1)
			printf \{'UNLOCKING ALL CHARACTERS'
				channel = jrdebug}
			0x2ac7c388 savegame = <savegame>
		endif
	endif
endscript

script toggle_cheat_bl 
	getplayerinfo <player> part
	i = 0
	getarraysize ($guitar_hero_cheats)
	begin
	continue = 0
	if structurecontains structure = ($guitar_hero_cheats [<i>]) part
		if (<part> = ($guitar_hero_cheats [<i>].part))
			continue = 1
		endif
	else
		continue = 1
	endif
	if (<continue> = 1 && ($guitar_hero_cheats [<i>].name) = <name>)
		break
	endif
	i = (<i> + 1)
	repeat <array_size>
	ui_options_cheat_toggle index = <i> player = <player> device_num = <device_num> for_band_lobby
	if (<cheat_state> = 0)
		soundevent \{event = box_uncheck_sfx}
	else
		cheat_name = ($guitar_hero_cheats [<i>].var)
		if (<cheat_name> = cheat_alwaysslide || <cheat_name> = cheat_allhopos || <cheat_name> = cheat_freedrum || <cheat_name> = cheat_invincible || <cheat_name> = cheat_autokick)
			band_lobby_flash_ticker_msg \{msg_checksum = cheat_warning
				time = 22}
		endif
		soundevent \{event = box_check_sfx}
	endif
	if (<name> = 'Hyperspeed')
		getplayerinfo <player> cheat_hyperspeed_value
		save_progression_instrument_user_option part = <part> controller = <device_num> option = 'hyperspeed' new_value = <cheat_hyperspeed_value>
	endif
	obj_getid
	<objid> :se_getparentid
	if getscreenelementchildren id = <parent_id>
		getarraysize <children>
		if (<array_size> > 0)
			i = 0
			begin
			0xe85ffd6c id = (<children> [<i>])
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
	band_lobby_set_dirty_save_flag player = <player> flag = 1
endscript

script set_progression_cheat_unlocked 
	requireparams \{[
			cheat_name
			savegame
			player
		]
		all}
	getarraysize ($guitar_hero_cheats)
	cheat_index = -1
	index = 0
	begin
	if (<cheat_name> = (($guitar_hero_cheats [<index>]).var))
		cheat_index = <index>
		break
	endif
	index = (<index> + 1)
	repeat <array_size>
	if (<cheat_index> = -1)
		softassert qs(0x479566e1) a = <cheat_checksum>
	endif
	cheat_name_string = (($guitar_hero_cheats [<cheat_index>]).name)
	formattext checksumname = cheat_checksum 'unlock_Cheat_%a' a = <cheat_name_string>
	getglobaltags user_options savegame = <savegame>
	if gotparam <cheat_checksum>
		if ((<...>.<cheat_checksum>) = 0)
			addparam structure_name = params name = <cheat_checksum> value = 1
			setglobaltags user_options params = <params> savegame = <savegame>
			cheat_set_playerinfo_or_global cheat_index = <cheat_index> state_index = 0 player = <player> unlock_it
			formattext checksumname = cheat_idx 'cheat_index%a' a = <cheat_index>
			off_value = 0
			addparam structure_name = new_params name = <cheat_idx> value = <off_value>
			setglobaltags user_options savegame = <savegame> params = <new_params>
		endif
	else
		softassert qs(0x02248fe7) a = <cheat_checksum>
	endif
endscript

script load_saved_extras_states_for_player 
	requireparams \{[
			player
			controller
			leader
		]
		all}
	getarraysize ($guitar_hero_cheats)
	i = 0
	begin
	cheat_struct = ($guitar_hero_cheats [<i>])
	if structurecontains structure = <cheat_struct> save_persistent_state
		if (isxenon)
			if islocallysignedin controller = <controller>
				getsavegamefromcontroller controller = <controller>
				get_user_option_cheat_index_state index = <i> controller = 0 savegame = <savegame>
			else
				getplayerinfo <leader> controller
				get_user_option_cheat_index_state index = <i> controller = <controller>
			endif
		else
			get_user_option_cheat_index_state index = <i> controller = <controller>
		endif
		cheat_set_playerinfo_or_global cheat_index = <i> state_index = <cheat_state> player = <player>
	else
		if NOT gotparam \{dont_reset_cheats}
			set_user_option_cheat_index_state index = <i> controller = <controller> cheat_state = 0
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
	getsavegamefromcontroller controller = <controller>
	getglobaltags user_options savegame = <savegame>
endscript

script isbandcheating 
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		if ($cheat_invincible = 1)
			return \{true}
		endif
		getfirstplayer \{on_screen}
		begin
		getplayerinfo <player> part
		getplayerinfo <player> cheat_allhopos
		getplayerinfo <player> cheat_alwaysslide
		getplayerinfo <player> cheat_autokick
		getplayerinfo <player> cheat_freedrum
		if (<part> = drum)
			if (<cheat_autokick> = 1 || <cheat_freedrum> = 1)
				printf \{qs(0xab913fe5)}
				return \{true}
			endif
		endif
		if (<part> = guitar || <part> = bass)
			if (<cheat_allhopos> = 1 || <cheat_alwaysslide> = 1)
				printf \{qs(0xab913fe5)}
				return \{true}
			endif
		endif
		getnextplayer on_screen player = <player>
		repeat <num_players_shown>
	endif
	return \{false}
endscript

script debug_unlock_all_cheats controller = ($primary_controller)
	get_savegame_from_controller controller = <controller>
	setglobaltags savegame = <savegame> user_options params = {
		unlock_cheat_contestwinner1 = 1
		unlock_cheat_alwaysslide = 1
		unlock_cheat_airinstruments = 1
		unlock_cheat_invisiblecharacters = 1
		unlock_cheat_performancemode = 1
		unlock_cheat_hyperspeed = 1
		unlock_cheat_autokick = 1
		unlock_cheat_freedrum = 1
		unlock_cheat_unlockallcharacters = 1
		unlock_cheat_invincible = 1
		unlock_cheat_allhopos = 1
		unlock_cheat_focusmode = 1
		unlock_cheat_hudfreemode = 1
	}
endscript
