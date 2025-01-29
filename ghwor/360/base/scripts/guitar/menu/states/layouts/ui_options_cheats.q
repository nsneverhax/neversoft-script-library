guitar_hero_cheats = [
	{
		Name = 'AlwaysSlide'
		name_text = qs(0xcdd9697c)
		var = cheat_alwaysslide
		unlock_pattern = [
			blue
			green
			green
			red
			red
			yellow
			blue
			yellow
		]
		options = [
			{
				text = qs(0x494dd991)
				globals = [
					{
						Set = cheat_alwaysslide
						location = playerinfo
						value = 0
					}
				]
			}
			{
				text = qs(0xe2a6ca9d)
				globals = [
					{
						Set = cheat_alwaysslide
						location = playerinfo
						value = 1
					}
				]
			}
		]
	}
	{
		Name = 'AirInstruments'
		name_text = qs(0x9de16fb4)
		var = cheat_airinstruments
		save_persistent_state
		unlock_pattern = [
			yellow
			red
			red
			blue
			yellow
			green
			green
			green
		]
		options = [
			{
				text = qs(0x922dee7d)
				globals = [
					{
						Set = cheat_airinstruments
						location = Global
						value = 0
					}
				]
			}
			{
				text = qs(0xa75536b7)
				globals = [
					{
						Set = cheat_airinstruments
						location = Global
						value = 1
					}
				]
			}
		]
	}
	{
		Name = 'InvisibleCharacters'
		name_text = qs(0x24df1998)
		var = cheat_invisiblecharacters
		save_persistent_state
		unlock_pattern = [
			green
			green
			red
			yellow
			yellow
			yellow
			blue
			blue
		]
		options = [
			{
				text = qs(0x75518f7e)
				globals = [
					{
						Set = cheat_invisiblecharacters
						location = Global
						value = 0
					}
				]
			}
			{
				text = qs(0x8a1b804e)
				globals = [
					{
						Set = cheat_invisiblecharacters
						location = Global
						value = 1
					}
				]
			}
		]
	}
	{
		Name = 'PerformanceMode'
		name_text = qs(0x8aa50be2)
		var = Cheat_PerformanceMode
		save_persistent_state
		unlock_pattern = [
			red
			yellow
			yellow
			blue
			red
			blue
			green
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
		Name = 'SoundCheckMode'
		name_text = qs(0x4f5909d9)
		var = cheat_soundcheckmode
		save_persistent_state
		options = [
			{
				text = qs(0xb9e14844)
				globals = [
					{
						Set = options_cheats_set_soundcheck
						get = options_cheats_get_cheat_soundcheck
						location = function
						value = 0
					}
				]
			}
			{
				text = qs(0x5c372eff)
				globals = [
					{
						Set = options_cheats_set_soundcheck
						get = options_cheats_get_cheat_soundcheck
						location = function
						value = 1
					}
				]
			}
		]
	}
	{
		Name = 'Hyperspeed'
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
						Set = cheat_hyperspeed_value
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
						Set = cheat_hyperspeed_value
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
						Set = cheat_hyperspeed_value
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
						Set = cheat_hyperspeed_value
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
						Set = cheat_hyperspeed_value
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
						Set = cheat_hyperspeed_value
						location = playerinfo
						value = 0.68
					}
				]
			}
		]
	}
	{
		Name = 'AutoKick'
		name_text = qs(0x8aba6894)
		var = cheat_autokick
		options = [
			{
				text = qs(0x11e8d81c)
				globals = [
					{
						Set = cheat_autokick
						location = playerinfo
						value = 0
					}
				]
			}
			{
				text = qs(0x783c6468)
				globals = [
					{
						Set = cheat_autokick
						location = playerinfo
						value = 1
					}
				]
			}
		]
	}
	{
		Name = 'Invincible'
		name_text = qs(0x38ea0a05)
		var = cheat_invincible
		options = [
			{
				text = qs(0xe52d7538)
				globals = [
					{
						Set = cheat_invincible
						location = Global
						value = 0
					}
				]
			}
			{
				text = qs(0x61422eb3)
				globals = [
					{
						Set = cheat_invincible
						location = Global
						value = 1
					}
				]
			}
		]
	}
	{
		Name = 'FocusMode'
		name_text = qs(0x784bfac2)
		var = cheat_focusmode
		save_persistent_state
		unlock_pattern = [
			green
			yellow
			green
			red
			green
			yellow
			blue
			green
		]
		options = [
			{
				text = qs(0x8ce8dc7a)
				globals = [
					{
						Set = cheat_focusmode
						location = Global
						value = 0
					}
				]
			}
			{
				text = qs(0x06701c4e)
				globals = [
					{
						Set = cheat_focusmode
						location = Global
						value = 1
					}
				]
			}
		]
	}
	{
		Name = 'HUDFreeMode'
		name_text = qs(0xf006f58f)
		var = cheat_hudfreemode
		save_persistent_state
		unlock_pattern = [
			green
			green
			red
			green
			green
			yellow
			green
			green
		]
		options = [
			{
				text = qs(0x07cb4fb2)
				globals = [
					{
						Set = cheat_hudfreemode
						location = Global
						value = 0
					}
				]
			}
			{
				text = qs(0xff25e9cb)
				globals = [
					{
						Set = cheat_hudfreemode
						location = Global
						value = 1
					}
				]
			}
		]
	}
	{
		Name = 'allHOPOs'
		name_text = qs(0x5b7a903c)
		var = cheat_allhopos
		unlock_pattern = [
			green
			green
			green
			blue
			green
			green
			green
			yellow
		]
		options = [
			{
				text = qs(0xf15bbc7d)
				globals = [
					{
						Set = cheat_allhopos
						location = playerinfo
						value = 0
					}
				]
			}
			{
				text = qs(0xf378a4b2)
				globals = [
					{
						Set = cheat_allhopos
						location = playerinfo
						value = 1
					}
				]
			}
		]
	}
	{
		Name = 'FreeDrum'
		name_text = qs(0x2d0883b3)
		var = cheat_freedrum
		options = [
			{
				text = qs(0xe14cbf66)
				globals = [
					{
						Set = cheat_freedrum
						location = playerinfo
						value = 0
					}
				]
			}
			{
				text = qs(0x5d3fad47)
				globals = [
					{
						Set = cheat_freedrum
						location = playerinfo
						value = 1
					}
				]
			}
		]
	}
	{
		Name = 'UnlockAllCharacters'
		name_text = qs(0x6cb49717)
		var = cheat_unlockallcharacters
		unlock_pattern = [
			blue
			green
			green
			red
			green
			red
			yellow
			blue
		]
	}
	{
		Name = 'UnlockAllVenues'
		name_text = qs(0xb42477a9)
		var = cheat_unlockallvenues
		unlock_pattern = [
			red
			blue
			blue
			red
			red
			blue
			blue
			red
		]
	}
	{
		Name = 'AbsolutelyNothing'
		name_text = qs(0x5feed6d6)
		var = cheat_absolutelynothing
		unlock_pattern = [
			green
			green
			green
			green
			green
			green
			green
			green
		]
	}
	{
		Name = 'SoloHighway'
		name_text = qs(0x8fe517ca)
		var = solo_highway_mode
		save_persistent_state
		options = [
			{
				text = qs(0xfb0a7c43)
				globals = [
					{
						Set = solo_highway_mode
						location = playerinfo
						value = 0
					}
				]
			}
			{
				text = qs(0xbe727549)
				globals = [
					{
						Set = solo_highway_mode
						location = playerinfo
						value = 1
					}
				]
			}
		]
	}
	{
		Name = 'ColorShuffle'
		name_text = qs(0x1b5e5c86)
		var = cheat_colorshuffle
		save_persistent_state
		unlock_pattern = [
			blue
			green
			blue
			red
			yellow
			green
			red
			yellow
		]
		options = [
			{
				text = qs(0xa4bdd991)
				globals = [
					{
						Set = cheat_colorshuffle
						location = playerinfo
						value = 0
					}
				]
			}
			{
				text = qs(0xd3b0013a)
				globals = [
					{
						Set = cheat_colorshuffle
						location = playerinfo
						value = 1
					}
				]
			}
		]
	}
	{
		Name = 'MirrorGems'
		name_text = qs(0x21cbc4ed)
		var = cheat_mirrorgems
		unlock_pattern = [
			blue
			red
			yellow
			green
			green
			yellow
			red
			blue
		]
		options = [
			{
				text = qs(0xd0e3cedd)
				globals = [
					{
						Set = cheat_mirrorgems
						location = playerinfo
						value = 0
					}
				]
			}
			{
				text = qs(0xc376a879)
				globals = [
					{
						Set = cheat_mirrorgems
						location = playerinfo
						value = 1
					}
				]
			}
		]
	}
	{
		Name = 'RandomGems'
		name_text = qs(0x849a0c09)
		var = cheat_randomgems
		unlock_pattern = [
			blue
			blue
			red
			blue
			green
			green
			red
			green
		]
		options = [
			{
				text = qs(0x6de1b635)
				globals = [
					{
						Set = cheat_randomgems
						location = playerinfo
						value = 0
					}
				]
			}
			{
				text = qs(0x99e34e4a)
				globals = [
					{
						Set = cheat_randomgems
						location = playerinfo
						value = 1
					}
				]
			}
		]
	}
]
guitar_hero_debug_cheats = [
]
guitar_hero_hidden_cheats = [
	{
		Name = 'SuperUser'
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

script ui_options_cheat_toggle 
	RequireParams \{[
			Player
			device_num
		]
		all}
	cheat_state = 0
	if NOT GotParam \{index}
		GetTags
	endif
	if NOT StructureContains structure = ($guitar_hero_cheats [<index>]) options
		return
	endif
	cheat_options = (($guitar_hero_cheats [<index>]).options)
	cheat_location = (((<cheat_options> [0]).globals [0]).location)
	cheat_variable = (((<cheat_options> [0]).globals [0]).Set)
	if (<cheat_location> = playerinfo)
		getplayerinfo <Player> <cheat_variable>
		cheat_state = (<...>.<cheat_variable>)
	elseif (<cheat_location> = Global)
		cheat_state = ($<cheat_variable>)
	endif
	if (<cheat_location> = function)
		cheat_get = (((<cheat_options> [0]).globals [0]).get)
		cheat_set = (((<cheat_options> [0]).globals [0]).Set)
		get_savegame_from_controller controller = <device_num>
		<cheat_get> savegame = <savegame>
		if (<cheat_state> = 0)
			<cheat_set> value = 1
			cheat_state = 1
		else
			<cheat_set> value = 0
			cheat_state = 0
		endif
	else
		<cheat_state> = (<cheat_state> + 1)
	endif
	option_array = ($guitar_hero_cheats [<index>].options)
	GetArraySize <option_array>
	if (<cheat_state> >= <array_Size>)
		<cheat_state> = 0
	endif
	set_user_option_cheat_index_state index = <index> controller = <device_num> cheat_state = <cheat_state>
	cheat_set_playerinfo_or_global cheat_index = <index> state_index = <cheat_state> Player = <Player>
	option_struct = (<option_array> [<cheat_state>])
	if NOT GotParam \{for_band_lobby}
		if ScreenElementExists \{id = menurow_txt_item_text}
			text = (<option_struct>.text)
			se_setprops menurow_txt_item_text = <text>
		endif
	endif
	exclude_option option_struct = <option_struct> Player = <Player> device_num = <device_num>
	return cheat_state = <cheat_state>
endscript

script cheat_set_playerinfo_or_global \{cheat_index = -1
		cheat_name = ''
		state_index = !i1768515945
		Player = !i1768515945}
	if (<cheat_index> < 0)
		GetArraySize ($guitar_hero_cheats)
		cheat_index = -1
		index = 0
		begin
		if (<cheat_name> = (($guitar_hero_cheats [<index>]).var))
			cheat_index = <index>
			break
		endif
		index = (<index> + 1)
		repeat <array_Size>
	endif
	current_cheat = ($guitar_hero_cheats [<cheat_index>])
	if GotParam \{unlock_it}
		formatText checksumName = tags_checksum 'unlock_Cheat_%a' a = (<current_cheat>.Name)
		AddParam structure_name = tag_params Name = <tags_checksum> value = 1
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
	AddParam structure_name = info_params Name = (<current_var>.Set) value = (<current_var>.value)
	if (((<current_var>).location) = playerinfo)
		setplayerinfo <Player> <info_params>
		RemoveParameter \{info_params}
	elseif (((<current_var>).location) = Global)
		if GlobalExists Name = (<current_var>.Set)
			Change GlobalName = (<current_var>.Set) NewValue = (<current_var>.value)
		else
			printscriptinfo \{'cheat_set_playerinfo_or_global'}
			printf qs(0xa0d71a8d) n = (<current_var>.Set)
		endif
	elseif ((<current_var>.location) = function)
		(<current_var>.Set) value = (<current_var>.value)
	endif
	i = (<i> + 1)
	repeat <array_Size>
endscript

script cheat_turnoffall 
	GetArraySize \{$guitar_hero_cheats}
	num_cheats = <array_Size>
	getmaxplayers
	i = 0
	begin
	Player = 1
	begin
	cheat_set_playerinfo_or_global cheat_index = <i> state_index = 0 Player = <Player>
	Player = (<Player> + 1)
	repeat <max_players>
	i = (<i> + 1)
	repeat <num_cheats>
endscript

script cheat_turnoffalllocked 
	GetArraySize \{$guitar_hero_cheats}
	num_cheats = <array_Size>
	getmaxplayers
	i = 0
	begin
	cheat_name = ($guitar_hero_cheats [<i>].Name)
	unlocked = 0
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		begin
		unlocked = 0
		getplayerinfo <Player> is_local_client
		if (<is_local_client> = 1)
			getplayerinfo <Player> controller
			getsavegamefromcontroller controller = <controller>
			formatText checksumName = unlock_tag_crc 'unlock_Cheat_%a' a = <cheat_name>
			GetGlobalTags savegame = <savegame> user_options
			if GotParam <unlock_tag_crc>
				if (<...>.<unlock_tag_crc> = 1)
					unlocked = 1
					break
				endif
			endif
		endif
		getnextplayer Player = <Player> local
		repeat <num_players>
	endif
	getnumplayersingame \{local}
	if (<num_players> > 0)
		if (<unlocked> = 0)
			getfirstplayer \{local}
			begin
			cheat_set_playerinfo_or_global cheat_index = <i> state_index = 0 Player = <Player>
			getnextplayer Player = <Player> local
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
		<exclude_array_size> = <array_Size>
		GetGlobalTags \{user_options}
		begin
		<exclude> = (<exclude_array> [<exclude_index>])
		GetArraySize \{$guitar_hero_cheats}
		<idx> = 0
		begin
		<var> = ($guitar_hero_cheats [<idx>].var)
		if (<var> = <exclude>)
			<Name> = ($guitar_hero_cheats [<idx>].Name)
			formatText checksumName = cheat_checksum 'unlock_Cheat_%a' a = <Name>
			if NOT ((<...>.<cheat_checksum>) = 0)
				if StructureContains structure = ($guitar_hero_cheats [<idx>]) options
					exclude_array = ($guitar_hero_cheats [<idx>].options)
					set_user_option_cheat_index_state index = <idx> controller = <device_num> cheat_state = 0
					GetGlobalTags \{user_options}
					formatText checksumName = cheat_idx 'cheat_index%a' a = <idx>
					AddParam structure_name = params Name = <cheat_idx> value = 0
					SetGlobalTags user_options params = <params>
					exclude_struct = (<exclude_array> [0])
					if NOT GotParam \{no_menu_update}
						text = (<exclude_struct>.text)
						if ScreenElementExists id = {current_menu child = (<idx> + 1)}
							SetScreenElementProps id = {current_menu child = (<idx> + 1)} item_text = <text>
						endif
					endif
					cheat_set_playerinfo_or_global cheat_index = <idx> state_index = 0 Player = <Player>
				endif
			endif
			break
		endif
		<idx> = (<idx> + 1)
		repeat <array_Size>
		<exclude_index> = (<exclude_index> + 1)
		repeat <exclude_array_size>
	endif
endscript

script check_car_unlocks controller = ($primary_controller)
	get_savegame_from_controller controller = <controller>
	GetGlobalTags savegame = <savegame> user_options param = unlock_cheat_unlockallcharacters
	if GotParam \{unlock_cheat_unlockallcharacters}
		if (<unlock_cheat_unlockallcharacters> = 1)
			unlock_all_profiles savegame = <savegame>
		endif
	endif
endscript

script check_venue_unlocks controller = ($primary_controller)
	get_savegame_from_controller controller = <controller>
	GetGlobalTags savegame = <savegame> user_options param = unlock_cheat_unlockallvenues
	if GotParam \{unlock_cheat_unlockallvenues}
		if (<unlock_cheat_unlockallvenues> = 1)
			unlock_all_venues savegame = <savegame>
		endif
	endif
endscript

script unlock_all_venues 
	get_LevelZoneArray_size
	if (<array_Size> > 0)
		index = 0
		begin
		get_LevelZoneArray_checksum index = <index>
		globaltag_unlock_venue venue = <level_checksum> savegame = <savegame>
		index = (<index> + 1)
		repeat <array_Size>
	endif
endscript

script toggle_cheat_bl 
	if ($game_mode = freeplay)
		lockglobaltags \{freeplay_check_off}
	endif
	getplayerinfo <Player> part
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
	if (<continue> = 1 && ($guitar_hero_cheats [<i>].Name) = <Name>)
		break
	endif
	i = (<i> + 1)
	repeat <array_Size>
	if ($game_mode = freeplay)
		ui_options_cheat_toggle index = <i> Player = <Player> device_num = <device_num>
	else
		ui_options_cheat_toggle index = <i> Player = <Player> device_num = <device_num> for_band_lobby
	endif
	if (<cheat_state> = 0)
		audio_ui_band_lobby_sfx_logic Player = <Player> toggleoff
	else
		cheat_name = ($guitar_hero_cheats [<i>].var)
		if (<cheat_name> = cheat_alwaysslide || <cheat_name> = cheat_allhopos || <cheat_name> = cheat_freedrum || <cheat_name> = cheat_invincible || <cheat_name> = cheat_autokick || <cheat_name> = cheat_mirrorgems || <cheat_name> = cheat_randomgems)
			band_lobby_update_ticker \{msg_checksum = cheat_warning
				msg_count = 3}
		endif
		audio_ui_band_lobby_sfx_logic Player = <Player> toggleon
	endif
	if (<Name> = 'Hyperspeed')
		getplayerinfo <Player> cheat_hyperspeed_value
		save_progression_instrument_user_option part = <part> controller = <device_num> option = 'hyperspeed' new_value = <cheat_hyperspeed_value>
	endif
	if ($game_mode = freeplay)
		refresh_freeplay_menu Player = <Player> menu_state = extras focus_idx = <focus_idx>
	else
		Obj_GetID
		band_lobby_refresh_menu_text id = <objID> extra_params = {Name = <Name>}
		band_lobby_set_dirty_save_flag Player = <Player> flag = 1
	endif
	if ($game_mode = freeplay)
		lockglobaltags \{freeplay_check_on}
	endif
endscript

script set_progression_cheat_unlocked 
	RequireParams \{[
			cheat_name
			savegame
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
	repeat <array_Size>
	if (<cheat_index> = -1)
		SoftAssert qs(0x479566e1) a = <cheat_checksum>
	endif
	cheat_name_string = (($guitar_hero_cheats [<cheat_index>]).Name)
	formatText checksumName = cheat_checksum 'unlock_Cheat_%a' a = <cheat_name_string>
	GetGlobalTags user_options savegame = <savegame>
	if GotParam <cheat_checksum>
		if ((<...>.<cheat_checksum>) = 0)
			AddParam structure_name = params Name = <cheat_checksum> value = 1
			SetGlobalTags user_options params = <params> savegame = <savegame>
			original_savegame = <savegame>
			getfirstplayer \{local
				out = Player}
			getnumplayersingame \{local}
			begin
			get_savegame_from_player Player = <Player>
			if (<original_savegame> = <savegame>)
				break
			endif
			getnextplayer Player = <Player> local out = Player
			repeat <num_players>
			savegame = <original_savegame>
			cheat_set_playerinfo_or_global cheat_index = <cheat_index> state_index = 0 Player = <Player> unlock_it
			formatText checksumName = cheat_idx 'cheat_index%a' a = <cheat_index>
			off_value = 0
			AddParam structure_name = new_params Name = <cheat_idx> value = <off_value>
			SetGlobalTags user_options savegame = <savegame> params = <new_params>
		endif
	else
		SoftAssert qs(0x02248fe7) a = <cheat_checksum>
	endif
endscript

script is_cheat_unlocked \{cheat_name = !q1768515945
		savegame = !i1768515945}
	GetArraySize ($guitar_hero_cheats)
	cheat_index = -1
	index = 0
	begin
	if (<cheat_name> = (($guitar_hero_cheats [<index>]).var))
		cheat_index = <index>
		break
	endif
	index = (<index> + 1)
	repeat <array_Size>
	if (<cheat_index> = -1)
		SoftAssert qs(0x479566e1) a = <cheat_checksum>
	endif
	cheat_name_string = (($guitar_hero_cheats [<cheat_index>]).Name)
	formatText checksumName = cheat_checksum 'unlock_Cheat_%a' a = <cheat_name_string>
	GetGlobalTags user_options savegame = <savegame>
	if GotParam <cheat_checksum>
		if ((<...>.<cheat_checksum>) = 1)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script load_saved_extras_states_for_player 
	RequireParams \{[
			Player
			controller
			leader
		]
		all}
	GetArraySize ($guitar_hero_cheats)
	i = 0
	begin
	cheat_struct = ($guitar_hero_cheats [<i>])
	if StructureContains structure = <cheat_struct> save_persistent_state
		if (isxenonorwindx)
			if islocallysignedin controller = <controller>
				getsavegamefromcontroller controller = <controller>
				get_user_option_cheat_index_state index = <i> controller = 0 savegame = <savegame>
			else
				getplayerinfo <leader> controller out = leader_controller
				get_user_option_cheat_index_state index = <i> controller = <leader_controller>
				dont_set_cheat_state = 1
			endif
		else
			get_user_option_cheat_index_state index = <i> controller = <controller>
		endif
		if NOT GotParam \{dont_set_cheat_state}
			cheat_set_playerinfo_or_global cheat_index = <i> state_index = <cheat_state> Player = <Player>
		endif
		RemoveParameter \{dont_set_cheat_state}
	else
		if NOT GotParam \{dont_reset_cheats}
			set_user_option_cheat_index_state index = <i> controller = <controller> cheat_state = 0
		endif
	endif
	i = (<i> + 1)
	repeat <array_Size>
	getsavegamefromcontroller controller = <controller>
	GetGlobalTags user_options savegame = <savegame>
endscript

script isbandcheating 
	if NOT InNetGame
		getnumplayersingame \{on_screen}
		if (<num_players_shown> > 0)
			if ($cheat_invincible = 1)
				return \{true}
			endif
			gamemode_gettype
			if (($pause_abuse_detected) = 1 && <Type> = quickplay)
				return \{true}
			endif
			getfirstplayer \{on_screen}
			begin
			getplayerinfo <Player> part
			getplayerinfo <Player> cheat_allhopos
			getplayerinfo <Player> cheat_alwaysslide
			getplayerinfo <Player> cheat_autokick
			getplayerinfo <Player> cheat_freedrum
			getplayerinfo <Player> cheat_mirrorgems
			getplayerinfo <Player> cheat_randomgems
			if (<part> = drum)
				if (<cheat_autokick> = 1 || <cheat_freedrum> = 1 || <cheat_mirrorgems> = 1 || <cheat_randomgems> = 1)
					printf \{qs(0xab913fe5)}
					return \{true}
				endif
			endif
			if (<part> = guitar || <part> = bass)
				if (<cheat_allhopos> = 1 || <cheat_alwaysslide> = 1 || <cheat_mirrorgems> = 1 || <cheat_randomgems> = 1)
					printf \{qs(0xab913fe5)}
					return \{true}
				endif
			endif
			getnextplayer on_screen Player = <Player>
			repeat <num_players_shown>
		endif
	endif
	return \{FALSE}
endscript

script options_cheats_set_soundcheck \{value = !i1768515945}
	if NOT GlobalExists \{Name = cheat_soundcheckmode}
		return
	endif
	Change cheat_soundcheckmode = <value>
	if ($cheat_soundcheckmode = 1)
		hide_crowd_models \{Active = true}
	else
		hide_crowd_models \{Active = FALSE}
	endif
endscript

script options_cheats_get_cheat_soundcheck \{savegame = !i1768515945}
	<i> = 0
	GetArraySize ($guitar_hero_cheats)
	begin
	if (($guitar_hero_cheats [<i>].Name) = 'SoundCheckMode')
		break
	endif
	i = (<i> + 1)
	repeat <array_Size>
	formatText checksumName = cheatindexname 'cheat_index%d' d = <i> AddToStringLookup = true
	GetGlobalTags user_options savegame = <savegame> param = <cheatindexname>
	<cheat_state> = (<...>.<cheatindexname>)
	cheat_state = ($guitar_hero_cheats [<i>].options [<cheat_state>].globals [0].value)
	return soundcheck = <cheat_state> cheat_state = <cheat_state>
endscript

script debug_unlock_all_cheats controller = ($primary_controller)
	get_savegame_from_controller controller = <controller>
	SetGlobalTags savegame = <savegame> user_options params = {
		unlock_cheat_alwaysslide = 1
		unlock_cheat_airinstruments = 1
		unlock_cheat_invisiblecharacters = 1
		unlock_Cheat_PerformanceMode = 1
		unlock_cheat_soundcheckmode = 1
		unlock_Cheat_Hyperspeed = 1
		unlock_cheat_autokick = 1
		unlock_cheat_freedrum = 1
		unlock_cheat_unlockallcharacters = 1
		unlock_cheat_invincible = 1
		unlock_cheat_allhopos = 1
		unlock_cheat_focusmode = 1
		unlock_cheat_hudfreemode = 1
		unlock_cheat_unlockallvenues = 1
		unlock_cheat_mirrorgems = 1
		unlock_cheat_randomgems = 1
		unlock_cheat_colorshuffle = 1
	}
endscript
