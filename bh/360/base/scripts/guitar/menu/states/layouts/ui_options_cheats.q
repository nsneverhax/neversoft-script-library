guitar_hero_cheats = [
	{
		name = 'ContestWinner1'
		name_text = qs(0xbd5d7861)
		var = Cheat_ContestWinner1
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
		var = Cheat_AlwaysSlide
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
						Set = Cheat_AlwaysSlide
						location = playerinfo
						value = 0
					}
				]
			}
			{
				text = qs(0x73bb988d)
				globals = [
					{
						Set = Cheat_AlwaysSlide
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
		var = Cheat_AirInstruments
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
						Set = Cheat_AirInstruments
						location = Global
						value = 0
					}
				]
			}
			{
				text = qs(0xa75536b7)
				globals = [
					{
						Set = Cheat_AirInstruments
						location = Global
						value = 1
					}
				]
			}
		]
	}
	{
		name = 'InvisibleCharacters'
		name_text = qs(0xd16f0703)
		var = Cheat_InvisibleCharacters
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
						Set = Cheat_InvisibleCharacters
						location = Global
						value = 0
					}
				]
			}
			{
				text = qs(0x8a1b804e)
				globals = [
					{
						Set = Cheat_InvisibleCharacters
						location = Global
						value = 1
					}
				]
			}
		]
	}
	{
		name = 'PerformanceMode'
		name_text = qs(0x8aa50be2)
		var = Cheat_PerformanceMode
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
						Set = Cheat_PerformanceMode
						location = Global
						value = 0
					}
				]
			}
			{
				text = qs(0x4bb6076b)
				exclude = [
					Cheat_FocusMode
				]
				globals = [
					{
						Set = Cheat_PerformanceMode
						location = Global
						value = 1
					}
				]
			}
		]
	}
	{
		name = 'Hyperspeed'
		name_text = qs(0x8968c474)
		var = Cheat_Hyperspeed
		save_persistent_state
		options = [
			{
				text = qs(0xb9ffd402)
				globals = [
					{
						Set = Cheat_Hyperspeed
						location = playerinfo
						value = 0
					}
					{
						Set = Cheat_HyperSpeed_Value
						location = playerinfo
						value = 1.0
					}
				]
			}
			{
				text = qs(0x27f94f8e)
				globals = [
					{
						Set = Cheat_Hyperspeed
						location = playerinfo
						value = 1
					}
					{
						Set = Cheat_HyperSpeed_Value
						location = playerinfo
						value = 0.88
					}
				]
			}
			{
				text = qs(0x0cd41c4d)
				globals = [
					{
						Set = Cheat_Hyperspeed
						location = playerinfo
						value = 2
					}
					{
						Set = Cheat_HyperSpeed_Value
						location = playerinfo
						value = 0.83
					}
				]
			}
			{
				text = qs(0x15cf2d0c)
				globals = [
					{
						Set = Cheat_Hyperspeed
						location = playerinfo
						value = 3
					}
					{
						Set = Cheat_HyperSpeed_Value
						location = playerinfo
						value = 0.78
					}
				]
			}
			{
				text = qs(0x5a8ebbcb)
				globals = [
					{
						Set = Cheat_Hyperspeed
						location = playerinfo
						value = 4
					}
					{
						Set = Cheat_HyperSpeed_Value
						location = playerinfo
						value = 0.72999996
					}
				]
			}
			{
				text = qs(0x43958a8a)
				globals = [
					{
						Set = Cheat_Hyperspeed
						location = playerinfo
						value = 5
					}
					{
						Set = Cheat_HyperSpeed_Value
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
		var = Cheat_AutoKick
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
						Set = Cheat_AutoKick
						location = playerinfo
						value = 0
					}
				]
			}
			{
				text = qs(0x783c6468)
				globals = [
					{
						Set = Cheat_AutoKick
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
		var = Cheat_Invincible
		options = [
			{
				text = qs(0xe52d7538)
				globals = [
					{
						Set = Cheat_Invincible
						location = Global
						value = 0
					}
				]
			}
			{
				text = qs(0x61422eb3)
				globals = [
					{
						Set = Cheat_Invincible
						location = Global
						value = 1
					}
				]
			}
		]
	}
	{
		name = 'FocusMode'
		name_text = qs(0x784bfac2)
		var = Cheat_FocusMode
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
						Set = Cheat_FocusMode
						location = Global
						value = 0
					}
				]
			}
			{
				text = qs(0x06701c4e)
				exclude = [
					Cheat_PerformanceMode
				]
				globals = [
					{
						Set = Cheat_FocusMode
						location = Global
						value = 1
					}
				]
			}
		]
	}
	{
		name = 'HUDFreeMode'
		name_text = qs(0xf006f58f)
		var = Cheat_HUDFreeMode
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
						Set = Cheat_HUDFreeMode
						location = Global
						value = 0
					}
				]
			}
			{
				text = qs(0xff25e9cb)
				globals = [
					{
						Set = Cheat_HUDFreeMode
						location = Global
						value = 1
					}
				]
			}
		]
	}
	{
		name = 'allHOPOs'
		name_text = qs(0x2954aa2e)
		var = Cheat_allHOPOs
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
						Set = Cheat_allHOPOs
						location = playerinfo
						value = 0
					}
				]
			}
			{
				text = qs(0xf378a4b2)
				globals = [
					{
						Set = Cheat_allHOPOs
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
		var = Cheat_FreeDrum
		options = [
			{
				text = qs(0xe14cbf66)
				globals = [
					{
						Set = Cheat_FreeDrum
						location = playerinfo
						value = 0
					}
				]
			}
			{
				text = qs(0x5d3fad47)
				globals = [
					{
						Set = Cheat_FreeDrum
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
		var = Cheat_UnlockAllCharacters
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
		var = Cheat_UnlockAll
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
		var = Cheat_UnlockAll_Everything
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
		var = Cheat_SuperUser
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
	RequireParams \{[
			player
			device_num
		]
		all}
	if NOT GotParam \{index}
		GetTags
	endif
	get_user_option_cheat_index_state index = <index> controller = <device_num>
	<cheat_state> = (<cheat_state> + 1)
	if NOT StructureContains structure = ($guitar_hero_cheats [<index>]) options
		return
	endif
	option_array = ($guitar_hero_cheats [<index>].options)
	GetArraySize <option_array>
	if (<cheat_state> >= <array_size>)
		<cheat_state> = 0
	endif
	set_user_option_cheat_index_state index = <index> controller = <device_num> cheat_state = <cheat_state>
	cheat_set_playerinfo_or_global cheat_index = <index> state_index = <cheat_state> player = <player>
	option_struct = (<option_array> [<cheat_state>])
	if NOT GotParam \{for_band_lobby}
		if ScreenElementExists \{id = menurow_txt_item_text}
			text = (<option_struct>.text)
			SE_SetProps menurow_txt_item_text = <text>
		endif
	endif
	exclude_option option_struct = <option_struct> player = <player> device_num = <device_num>
	return cheat_state = <cheat_state>
endscript

script cheat_set_playerinfo_or_global 
	RequireParams \{[
			cheat_index
			state_index
			player
		]
		all}
	current_cheat = ($guitar_hero_cheats [<cheat_index>])
	if GotParam \{unlock_it}
		FormatText checksumname = tags_checksum 'unlock_Cheat_%a' a = (<current_cheat>.name)
		AddParam structure_name = tag_params name = <tags_checksum> value = 1
		SetGlobalTags user_options params = <tag_params> savegame = <savegame>
	endif
	if NOT StructureContains structure = <current_cheat> options
		return
	endif
	options = (<current_cheat>.options)
	globals = ((<options> [<state_index>]).globals)
	GetArraySize <globals>
	i = 0
	begin
	current_var = (<globals> [<i>])
	AddParam structure_name = info_params name = (<current_var>.Set) value = (<current_var>.value)
	if (((<current_var>).location) = playerinfo)
		SetPlayerInfo <player> <info_params>
		RemoveParameter \{info_params}
	elseif (((<current_var>).location) = Global)
		if GlobalExists name = (<current_var>.Set)
			Change globalname = (<current_var>.Set) newValue = (<current_var>.value)
		else
			printscriptinfo \{'cheat_set_playerinfo_or_global'}
			printf qs(0xa0d71a8d) n = (<current_var>.Set)
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
endscript

script cheat_turnoffall 
	GetArraySize \{$guitar_hero_cheats}
	num_cheats = <array_size>
	GetMaxPlayers
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
	GetArraySize \{$guitar_hero_cheats}
	num_cheats = <array_size>
	GetMaxPlayers
	i = 0
	begin
	cheat_name = ($guitar_hero_cheats [<i>].name)
	unlocked = 0
	GetNumPlayersInGame \{local}
	if (<num_players> > 0)
		GetFirstPlayer \{local}
		begin
		unlocked = 0
		GetPlayerInfo <player> is_local_client
		if (<is_local_client> = 1)
			GetPlayerInfo <player> controller
			GetSavegameFromController controller = <controller>
			FormatText checksumname = unlock_tag_crc 'unlock_Cheat_%a' a = <cheat_name>
			GetGlobalTags savegame = <savegame> user_options
			if GotParam <unlock_tag_crc>
				if (<...>.<unlock_tag_crc> = 1)
					unlocked = 1
					break
				endif
			endif
		endif
		GetNextPlayer player = <player> local
		repeat <num_players>
	endif
	GetNumPlayersInGame \{local}
	if (<num_players> > 0)
		if (<unlocked> = 0)
			GetFirstPlayer \{local}
			begin
			cheat_set_playerinfo_or_global cheat_index = <i> state_index = 0 player = <player>
			GetNextPlayer player = <player> local
			repeat <num_players>
		endif
	endif
	i = (<i> + 1)
	repeat <num_cheats>
endscript

script exclude_option 
	if StructureContains structure = <option_struct> exclude
		<exclude_array> = (<option_struct>.exclude)
		<exclude_index> = 0
		GetArraySize <exclude_array>
		<exclude_array_size> = <array_size>
		GetGlobalTags \{user_options}
		begin
		<exclude> = (<exclude_array> [<exclude_index>])
		GetArraySize \{$guitar_hero_cheats}
		<idx> = 0
		begin
		<var> = ($guitar_hero_cheats [<idx>].var)
		if (<var> = <exclude>)
			<name> = ($guitar_hero_cheats [<idx>].name)
			FormatText checksumname = cheat_checksum 'unlock_Cheat_%a' a = <name>
			if NOT ((<...>.<cheat_checksum>) = 0)
				if StructureContains structure = ($guitar_hero_cheats [<idx>]) options
					exclude_array = ($guitar_hero_cheats [<idx>].options)
					set_user_option_cheat_index_state index = <idx> controller = <device_num> cheat_state = 0
					GetGlobalTags \{user_options}
					FormatText checksumname = cheat_idx 'cheat_index%a' a = <idx>
					AddParam structure_name = params name = <cheat_idx> value = 0
					SetGlobalTags user_options params = <params>
					exclude_struct = (<exclude_array> [0])
					if NOT GotParam \{no_menu_update}
						text = (<exclude_struct>.text)
						if ScreenElementExists id = {current_menu child = (<idx> + 1)}
							SetScreenElementProps id = {current_menu child = (<idx> + 1)} item_text = <text>
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

script check_CAR_unlocks controller = ($primary_controller)
	get_savegame_from_controller controller = <controller>
	GetGlobalTags savegame = <savegame> user_options param = unlock_Cheat_ContestWinner1
	if GotParam \{unlock_Cheat_ContestWinner1}
		if (<unlock_Cheat_ContestWinner1> = 1)
			printf \{'UNLOCKING CONTEST WINNER'
				channel = jrdebug}
			unlock_profile id = GH_Rocker_VBot savegame = <savegame>
		endif
	endif
	GetGlobalTags savegame = <savegame> user_options param = unlock_Cheat_UnlockAllCharacters
	if GotParam \{unlock_Cheat_UnlockAllCharacters}
		if (<unlock_Cheat_UnlockAllCharacters> = 1)
			printf \{'UNLOCKING ALL CHARACTERS'
				channel = jrdebug}
			unlock_all_profiles_no_vbot savegame = <savegame>
		endif
	endif
endscript

script toggle_cheat_bl 
	GetPlayerInfo <player> part
	i = 0
	GetArraySize ($guitar_hero_cheats)
	begin
	continue = 0
	if StructureContains structure = ($guitar_hero_cheats [<i>]) part
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
		SoundEvent \{event = Box_UnCheck_SFX}
	else
		cheat_name = ($guitar_hero_cheats [<i>].var)
		if (<cheat_name> = Cheat_AlwaysSlide || <cheat_name> = Cheat_allHOPOs || <cheat_name> = Cheat_FreeDrum || <cheat_name> = Cheat_Invincible || <cheat_name> = Cheat_AutoKick)
			band_lobby_flash_ticker_msg \{msg_checksum = cheat_warning
				time = 22}
		endif
		SoundEvent \{event = Box_Check_SFX}
	endif
	if (<name> = 'Hyperspeed')
		GetPlayerInfo <player> Cheat_HyperSpeed_Value
		save_progression_instrument_user_option part = <part> controller = <device_num> option = 'hyperspeed' new_value = <Cheat_HyperSpeed_Value>
	endif
	Obj_GetID
	<objID> :SE_GetParentID
	if GetScreenElementChildren id = <parent_id>
		GetArraySize <children>
		if (<array_size> > 0)
			i = 0
			begin
			band_lobby_refresh_cheat_menu_text id = (<children> [<i>])
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
	band_lobby_set_dirty_save_flag player = <player> flag = 1
endscript

script set_progression_cheat_unlocked 
	RequireParams \{[
			cheat_name
			savegame
			player
		]
		all}
	GetArraySize ($guitar_hero_cheats)
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
	FormatText checksumname = cheat_checksum 'unlock_Cheat_%a' a = <cheat_name_string>
	GetGlobalTags user_options savegame = <savegame>
	if GotParam <cheat_checksum>
		if ((<...>.<cheat_checksum>) = 0)
			AddParam structure_name = params name = <cheat_checksum> value = 1
			SetGlobalTags user_options params = <params> savegame = <savegame>
			cheat_set_playerinfo_or_global cheat_index = <cheat_index> state_index = 0 player = <player> unlock_it
			FormatText checksumname = cheat_idx 'cheat_index%a' a = <cheat_index>
			off_value = 0
			AddParam structure_name = new_params name = <cheat_idx> value = <off_value>
			SetGlobalTags user_options savegame = <savegame> params = <new_params>
		endif
	else
		softassert qs(0x02248fe7) a = <cheat_checksum>
	endif
endscript

script load_saved_extras_states_for_player 
	RequireParams \{[
			player
			controller
			leader
		]
		all}
	GetArraySize ($guitar_hero_cheats)
	i = 0
	begin
	cheat_struct = ($guitar_hero_cheats [<i>])
	if StructureContains structure = <cheat_struct> save_persistent_state
		if (isXenon)
			if IsLocallySignedIn controller = <controller>
				GetSavegameFromController controller = <controller>
				get_user_option_cheat_index_state index = <i> controller = 0 savegame = <savegame>
			else
				GetPlayerInfo <leader> controller
				get_user_option_cheat_index_state index = <i> controller = <controller>
			endif
		else
			get_user_option_cheat_index_state index = <i> controller = <controller>
		endif
		cheat_set_playerinfo_or_global cheat_index = <i> state_index = <cheat_state> player = <player>
	else
		if NOT GotParam \{dont_reset_cheats}
			set_user_option_cheat_index_state index = <i> controller = <controller> cheat_state = 0
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
	GetSavegameFromController controller = <controller>
	GetGlobalTags user_options savegame = <savegame>
endscript

script IsBandCheating 
	GetNumPlayersInGame \{on_screen}
	if (<num_players_shown> > 0)
		if ($Cheat_Invincible = 1)
			return \{true}
		endif
		GetFirstPlayer \{on_screen}
		begin
		GetPlayerInfo <player> part
		GetPlayerInfo <player> Cheat_allHOPOs
		GetPlayerInfo <player> Cheat_AlwaysSlide
		GetPlayerInfo <player> Cheat_AutoKick
		GetPlayerInfo <player> Cheat_FreeDrum
		if (<part> = Drum)
			if (<Cheat_AutoKick> = 1 || <Cheat_FreeDrum> = 1)
				printf \{qs(0xab913fe5)}
				return \{true}
			endif
		endif
		if (<part> = guitar || <part> = bass)
			if (<Cheat_allHOPOs> = 1 || <Cheat_AlwaysSlide> = 1)
				printf \{qs(0xab913fe5)}
				return \{true}
			endif
		endif
		GetNextPlayer on_screen player = <player>
		repeat <num_players_shown>
	endif
	return \{false}
endscript

script debug_unlock_all_cheats controller = ($primary_controller)
	get_savegame_from_controller controller = <controller>
	SetGlobalTags savegame = <savegame> user_options params = {
		unlock_Cheat_ContestWinner1 = 1
		unlock_Cheat_AlwaysSlide = 1
		unlock_Cheat_AirInstruments = 1
		unlock_Cheat_InvisibleCharacters = 1
		unlock_Cheat_PerformanceMode = 1
		unlock_Cheat_Hyperspeed = 1
		unlock_Cheat_AutoKick = 1
		unlock_Cheat_FreeDrum = 1
		unlock_Cheat_UnlockAllCharacters = 1
		unlock_Cheat_Invincible = 1
		unlock_Cheat_allHOPOs = 1
		unlock_Cheat_FocusMode = 1
		unlock_Cheat_HUDFreeMode = 1
	}
endscript
