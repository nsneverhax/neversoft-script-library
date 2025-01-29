guitar_hero_cheat_index = [
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
]
guitar_hero_cheats = [
	{
		Name = 'ContestWinner1'
		name_text = qs(0xbd5d7861)
		var = cheat_contestwinner1
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
		not_toggle
	}
	{
		Name = 'AlwaysSlide'
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
				text = qs(0xb0a6c949)
				globals = [
					{
						Set = cheat_alwaysslide
						value = 0
					}
				]
			}
			{
				text = qs(0x45f3600e)
				globals = [
					{
						Set = cheat_alwaysslide
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
				text = qs(0xd86c0764)
				globals = [
					{
						Set = cheat_airinstruments
						value = 0
					}
					{
						Set = airinstruments
						value = 0
					}
				]
			}
			{
				text = qs(0x8f98f190)
				exclude = [
					cheat_invisiblecharacters
				]
				globals = [
					{
						Set = cheat_airinstruments
						value = 1
					}
					{
						Set = airinstruments
						value = 1
					}
				]
			}
		]
	}
	{
		Name = 'InvisibleCharacters'
		name_text = qs(0xd16f0703)
		var = cheat_invisiblecharacters
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
				text = qs(0xebdc4b50)
				globals = [
					{
						Set = cheat_invisiblecharacters
						value = 0
					}
					{
						Set = invisiblecharacters
						value = 0
					}
				]
			}
			{
				text = qs(0xb833b268)
				exclude = [
					cheat_airinstruments
				]
				globals = [
					{
						Set = cheat_invisiblecharacters
						value = 1
					}
					{
						Set = invisiblecharacters
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
				text = qs(0x1f7c38b9)
				globals = [
					{
						Set = Cheat_PerformanceMode
						value = 0
					}
				]
			}
			{
				text = qs(0xcf593eeb)
				globals = [
					{
						Set = Cheat_PerformanceMode
						value = 1
					}
				]
			}
		]
	}
	{
		Name = 'Hyperspeed'
		name_text = qs(0x8968c474)
		part = guitar
		var = Cheat_Hyperspeed
		options = [
			{
				text = qs(0x80864530)
				globals = [
					{
						Set = Cheat_Hyperspeed
						value = 0
					}
					{
						Set = hyperspeed_guitar
						value = 1.0
					}
				]
			}
			{
				text = qs(0xedb32e6a)
				globals = [
					{
						Set = Cheat_Hyperspeed
						value = 1
					}
					{
						Set = hyperspeed_guitar
						value = 0.88
					}
				]
			}
			{
				text = qs(0xc69e7da9)
				globals = [
					{
						Set = Cheat_Hyperspeed
						value = 2
					}
					{
						Set = hyperspeed_guitar
						value = 0.83
					}
				]
			}
			{
				text = qs(0xdf854ce8)
				globals = [
					{
						Set = Cheat_Hyperspeed
						value = 3
					}
					{
						Set = hyperspeed_guitar
						value = 0.78
					}
				]
			}
			{
				text = qs(0x90c4da2f)
				globals = [
					{
						Set = Cheat_Hyperspeed
						value = 4
					}
					{
						Set = hyperspeed_guitar
						value = 0.72999996
					}
				]
			}
			{
				text = qs(0x89dfeb6e)
				globals = [
					{
						Set = Cheat_Hyperspeed
						value = 5
					}
					{
						Set = hyperspeed_guitar
						value = 0.68
					}
				]
			}
		]
	}
	{
		Name = 'Hyperspeed'
		name_text = qs(0x8968c474)
		part = bass
		var = Cheat_Hyperspeed
		options = [
			{
				text = qs(0x4b5681b0)
				globals = [
					{
						Set = Cheat_Hyperspeed
						value = 0
					}
					{
						Set = hyperspeed_bass
						value = 1.0
					}
				]
			}
			{
				text = qs(0x4a397b58)
				globals = [
					{
						Set = Cheat_Hyperspeed
						value = 1
					}
					{
						Set = hyperspeed_bass
						value = 0.88
					}
				]
			}
			{
				text = qs(0x6114289b)
				globals = [
					{
						Set = Cheat_Hyperspeed
						value = 2
					}
					{
						Set = hyperspeed_bass
						value = 0.83
					}
				]
			}
			{
				text = qs(0x780f19da)
				globals = [
					{
						Set = Cheat_Hyperspeed
						value = 3
					}
					{
						Set = hyperspeed_bass
						value = 0.78
					}
				]
			}
			{
				text = qs(0x374e8f1d)
				globals = [
					{
						Set = Cheat_Hyperspeed
						value = 4
					}
					{
						Set = hyperspeed_bass
						value = 0.72999996
					}
				]
			}
			{
				text = qs(0x2e55be5c)
				globals = [
					{
						Set = Cheat_Hyperspeed
						value = 5
					}
					{
						Set = hyperspeed_bass
						value = 0.68
					}
				]
			}
		]
	}
	{
		Name = 'Hyperspeed'
		name_text = qs(0x8968c474)
		part = drum
		var = Cheat_Hyperspeed
		options = [
			{
				text = qs(0xcd54061b)
				globals = [
					{
						Set = Cheat_Hyperspeed
						value = 0
					}
					{
						Set = hyperspeed_drum
						value = 1.0
					}
				]
			}
			{
				text = qs(0x74168efb)
				globals = [
					{
						Set = Cheat_Hyperspeed
						value = 1
					}
					{
						Set = hyperspeed_drum
						value = 0.88
					}
				]
			}
			{
				text = qs(0x5f3bdd38)
				globals = [
					{
						Set = Cheat_Hyperspeed
						value = 2
					}
					{
						Set = hyperspeed_drum
						value = 0.83
					}
				]
			}
			{
				text = qs(0x4620ec79)
				globals = [
					{
						Set = Cheat_Hyperspeed
						value = 3
					}
					{
						Set = hyperspeed_drum
						value = 0.78
					}
				]
			}
			{
				text = qs(0x09617abe)
				globals = [
					{
						Set = Cheat_Hyperspeed
						value = 4
					}
					{
						Set = hyperspeed_drum
						value = 0.72999996
					}
				]
			}
			{
				text = qs(0x107a4bff)
				globals = [
					{
						Set = Cheat_Hyperspeed
						value = 5
					}
					{
						Set = hyperspeed_drum
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
				text = qs(0x245e5380)
				globals = [
					{
						Set = cheat_autokick
						value = 0
					}
				]
			}
			{
				text = qs(0xedb840ca)
				globals = [
					{
						Set = cheat_autokick
						value = 1
					}
				]
			}
		]
	}
	{
		Name = 'GemColor'
		name_text = qs(0xcf42ec40)
		var = cheat_gemcolor
		unlock_pattern = [
			blue
			red
			red
			green
			red
			green
			red
			yellow
		]
		options = [
			{
				text = qs(0x58ffd51f)
				globals = [
					{
						Set = cheat_gemcolor
						value = 0
					}
					{
						Set = gem_set
						value = standard_gems
					}
				]
			}
			{
				text = qs(0x44095183)
				globals = [
					{
						Set = cheat_gemcolor
						value = 1
					}
					{
						Set = gem_set
						value = pink_gems
					}
				]
			}
			{
				text = qs(0x146f5382)
				globals = [
					{
						Set = cheat_gemcolor
						value = 2
					}
					{
						Set = gem_set
						value = stealth_gems
					}
				]
			}
			{
				text = qs(0x6d1051a3)
				globals = [
					{
						Set = cheat_gemcolor
						value = 3
					}
					{
						Set = gem_set
						value = eggs_n_bacon_gems
					}
				]
			}
			{
				text = qs(0x1845c87b)
				globals = [
					{
						Set = cheat_gemcolor
						value = 4
					}
					{
						Set = gem_set
						value = old_glory_gems
					}
				]
			}
			{
				text = qs(0xf2a04722)
				globals = [
					{
						Set = cheat_gemcolor
						value = 5
					}
					{
						Set = gem_set
						value = solid_gold_gems
					}
				]
			}
			{
				text = qs(0x487c9800)
				globals = [
					{
						Set = cheat_gemcolor
						value = 6
					}
					{
						Set = gem_set
						value = platinum_gems
					}
				]
			}
			{
				text = qs(0xdb9218fe)
				globals = [
					{
						Set = cheat_gemcolor
						value = 7
					}
					{
						Set = gem_set
						value = diabolic_gems
					}
				]
			}
			{
				text = qs(0x77a6b066)
				globals = [
					{
						Set = cheat_gemcolor
						value = 8
					}
					{
						Set = gem_set
						value = toxic_waste_gems
					}
				]
			}
			{
				text = qs(0x4016bda6)
				globals = [
					{
						Set = cheat_gemcolor
						value = 9
					}
					{
						Set = gem_set
						value = black_gems
					}
				]
			}
			{
				text = qs(0xc40e1fd4)
				globals = [
					{
						Set = cheat_gemcolor
						value = 10
					}
					{
						Set = gem_set
						value = pastel_gems
					}
				]
			}
			{
				text = qs(0x4a640418)
				globals = [
					{
						Set = cheat_gemcolor
						value = 11
					}
					{
						Set = gem_set
						value = dark_gems
					}
				]
			}
			{
				text = qs(0x4a2315ae)
				globals = [
					{
						Set = cheat_gemcolor
						value = 12
					}
					{
						Set = gem_set
						value = outline_gems
					}
				]
			}
		]
	}
	{
		Name = 'FlameColor'
		name_text = qs(0x10374bab)
		var = cheat_flamecolor
		unlock_pattern = [
			green
			red
			green
			blue
			red
			red
			yellow
			blue
		]
		options = [
			{
				text = qs(0xda874595)
				globals = [
					{
						Set = cheat_flamecolor
						value = 0
					}
					{
						Set = fx_set
						value = standard_fx
					}
				]
			}
			{
				text = qs(0x7e96999a)
				globals = [
					{
						Set = cheat_flamecolor
						value = 1
					}
					{
						Set = fx_set
						value = pink_fx
					}
				]
			}
			{
				text = qs(0x250c327f)
				globals = [
					{
						Set = cheat_flamecolor
						value = 2
					}
					{
						Set = fx_set
						value = stealth_fx
					}
				]
			}
			{
				text = qs(0x93cacad3)
				globals = [
					{
						Set = cheat_flamecolor
						value = 3
					}
					{
						Set = fx_set
						value = eggs_n_bacon_fx
					}
				]
			}
			{
				text = qs(0x3a529f48)
				globals = [
					{
						Set = cheat_flamecolor
						value = 4
					}
					{
						Set = fx_set
						value = old_glory_fx
					}
				]
			}
			{
				text = qs(0x4035e7a3)
				globals = [
					{
						Set = cheat_flamecolor
						value = 5
					}
					{
						Set = fx_set
						value = diabolic_fx
					}
				]
			}
			{
				text = qs(0x2c281a6e)
				globals = [
					{
						Set = cheat_flamecolor
						value = 6
					}
					{
						Set = fx_set
						value = toxic_waste_fx
					}
				]
			}
		]
	}
	{
		Name = 'StarColor'
		name_text = qs(0xfd29bb1e)
		var = cheat_starcolor
		unlock_pattern = [
			red
			red
			yellow
			red
			blue
			red
			red
			blue
		]
		options = [
			{
				text = qs(0x017cec58)
				globals = [
					{
						Set = cheat_starcolor
						value = 0
					}
					{
						Set = star_set
						value = standard_stars
					}
				]
			}
			{
				text = qs(0x64b0088e)
				globals = [
					{
						Set = cheat_starcolor
						value = 1
					}
					{
						Set = star_set
						value = gold_stars
					}
				]
			}
		]
	}
	{
		Name = 'VocalFireball'
		name_text = qs(0x456e742b)
		var = cheat_vocalfireball
		unlock_pattern = [
			red
			green
			green
			yellow
			blue
			green
			yellow
			green
		]
		options = [
			{
				text = qs(0x83ad7a92)
				globals = [
					{
						Set = cheat_vocalfireball
						value = 0
					}
				]
			}
			{
				text = qs(0xd807e01b)
				globals = [
					{
						Set = cheat_vocalfireball
						value = 2
					}
				]
			}
		]
	}
	{
		Name = 'Invincible'
		name_text = qs(0x6eb81461)
		var = cheat_invincible
		options = [
			{
				text = qs(0x7166a1e5)
				globals = [
					{
						Set = cheat_invincible
						value = 0
					}
				]
			}
			{
				text = qs(0xe16720af)
				globals = [
					{
						Set = cheat_invincible
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
				text = qs(0x098bc07b)
				globals = [
					{
						Set = cheat_hudfreemode
						value = 0
					}
				]
			}
			{
				text = qs(0x9c1c512b)
				globals = [
					{
						Set = cheat_hudfreemode
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
				text = qs(0xc4ed37e1)
				globals = [
					{
						Set = cheat_allhopos
						value = 0
					}
				]
			}
			{
				text = qs(0x66fc8010)
				globals = [
					{
						Set = cheat_allhopos
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
				text = qs(0x27636825)
				globals = [
					{
						Set = cheat_freedrum
						value = 0
					}
				]
			}
			{
				text = qs(0x8aa92890)
				globals = [
					{
						Set = cheat_freedrum
						value = 1
					}
				]
			}
		]
	}
	{
		Name = 'UnlockAllCharacters'
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
		not_toggle
	}
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
		Global = cheat_superuser
		value = 1
	}
]

script ui_options_cheats_screen_anim 
endscript
ui_cheats_settings = {
}
ui_cheats_do_anim = 0

script ui_create_options_cheats 
	GetArraySize ($guitar_hero_cheats)
	GetGlobalTags \{user_options}
	SetArrayElement ArrayName = guitar_hero_cheat_index globalarray index = 0 NewValue = <cheat_index0>
	SetArrayElement ArrayName = guitar_hero_cheat_index globalarray index = 1 NewValue = <cheat_index1>
	SetArrayElement ArrayName = guitar_hero_cheat_index globalarray index = 2 NewValue = <cheat_index2>
	SetArrayElement ArrayName = guitar_hero_cheat_index globalarray index = 3 NewValue = <cheat_index3>
	SetArrayElement ArrayName = guitar_hero_cheat_index globalarray index = 4 NewValue = <cheat_index4>
	SetArrayElement ArrayName = guitar_hero_cheat_index globalarray index = 5 NewValue = <cheat_index5>
	SetArrayElement ArrayName = guitar_hero_cheat_index globalarray index = 6 NewValue = <cheat_index6>
	SetArrayElement ArrayName = guitar_hero_cheat_index globalarray index = 7 NewValue = <cheat_index7>
	SetArrayElement ArrayName = guitar_hero_cheat_index globalarray index = 8 NewValue = <cheat_index8>
	SetArrayElement ArrayName = guitar_hero_cheat_index globalarray index = 9 NewValue = <cheat_index9>
	SetArrayElement ArrayName = guitar_hero_cheat_index globalarray index = 10 NewValue = <cheat_index10>
	SetArrayElement ArrayName = guitar_hero_cheat_index globalarray index = 11 NewValue = <cheat_index11>
	SetArrayElement ArrayName = guitar_hero_cheat_index globalarray index = 12 NewValue = <cheat_index12>
	SetArrayElement ArrayName = guitar_hero_cheat_index globalarray index = 13 NewValue = <cheat_index13>
	SetArrayElement ArrayName = guitar_hero_cheat_index globalarray index = 14 NewValue = <cheat_index14>
	SetArrayElement ArrayName = guitar_hero_cheat_index globalarray index = 15 NewValue = <cheat_index15>
	SetArrayElement ArrayName = guitar_hero_cheat_index globalarray index = 16 NewValue = <cheat_index16>
	SetArrayElement ArrayName = guitar_hero_cheat_index globalarray index = 17 NewValue = <cheat_index17>
	SetArrayElement ArrayName = guitar_hero_cheat_index globalarray index = 18 NewValue = <cheat_index18>
	SetArrayElement ArrayName = guitar_hero_cheat_index globalarray index = 19 NewValue = <cheat_index19>
	SetArrayElement ArrayName = guitar_hero_cheat_index globalarray index = 20 NewValue = <cheat_index20>
	CreateScreenElement {
		parent = root_window
		id = cheatsinterface
		Type = descinterface
		desc = 'select_cheat'
		pos_anchor = [left top]
		Pos = (0.0, 0.0)
		new_cheat_alpha = 0.0
		exclusive_device = ($primary_controller)
	}
	if cheatsinterface :desc_resolvealias \{Name = alias_menu}
		AssignAlias id = <resolved_id> alias = current_menu
		current_menu :se_setprops \{event_handlers = [
				{
					pad_back
					ui_options_cheats_back
				}
				{
					pad_up
					generic_menu_up_or_down_sound
					params = {
						up
					}
				}
				{
					pad_down
					generic_menu_up_or_down_sound
					params = {
						down
					}
				}
			]}
		current_menu :SetTags color_scheme = ($0xe28faff4)
	endif
	cheatsinterface :obj_spawnscript \{highlight_motion
		params = {
			menu_id = cheatsinterface
		}}
	if NOT 0x60adecd1
		add_generic_menu_text_item \{text = qs(0xde232315)
			pad_choose_script = generic_event_choose
			pad_choose_params = {
				state = uistate_options_cheats_new
			}
			focus_script = ui_options_cheats_focus
			unfocus_script = ui_options_cheats_unfocus}
		<item_container_id> :se_getparentid
		<item_container_id> :se_setprops {
			event_handlers = [
				{focus ui_options_cheats_update_helper}
			]
			tags = {
				unlocked = 1
				toggle = 0
				index = -1
			}
		}
	endif
	GetArraySize \{$guitar_hero_cheats}
	i = 0
	begin
	formatText checksumName = cheat_unlocked 'unlock_Cheat_%a' a = ($guitar_hero_cheats [<i>].Name)
	if GotParam <cheat_unlocked>
		<text> = qs(0xb8a0b6b7)
		unlocked = 0
		toggle = 1
		pad_choose_script = ui_bonus_videos_negative_sfx
		item_height = 50
		if ((<...>.<cheat_unlocked>) > 0)
			if StructureContains structure = ($guitar_hero_cheats [<i>]) options
				Name = ($guitar_hero_cheats [<i>].Name)
				var = ($guitar_hero_cheats [<i>].var)
				cheat_index = ($guitar_hero_cheat_index [<i>])
				option_struct = ($guitar_hero_cheats [<i>].options [<cheat_index>])
				text = (<option_struct>.text)
				pad_choose_params = {}
				if StructureContains structure = ($guitar_hero_cheats [<i>]) pad_choose_script
					pad_choose_script = ($guitar_hero_cheats [<i>].pad_choose_script)
					if StructureContains structure = ($guitar_hero_cheats [<i>]) pad_choose_params
						pad_choose_params = ($guitar_hero_cheats [<i>].pad_choose_params)
					endif
				else
					pad_choose_script = ui_options_cheat_toggle
				endif
			else
				pad_choose_script = ($guitar_hero_cheats [<i>].unlock_script)
				text = ($guitar_hero_cheats [<i>].name_text)
			endif
			item_height = 100
			if StructureContains structure = ($guitar_hero_cheats [<i>]) not_toggle
				toggle = 0
				item_height = 50
			endif
			unlocked = 1
		endif
		add_generic_menu_text_item {
			text = <text>
			pad_choose_script = <pad_choose_script>
			pad_choose_params = <pad_choose_params>
			focus_script = ui_options_cheats_focus
			unfocus_script = ui_options_cheats_unfocus
		}
		<item_container_id> :se_getparentid
		<item_container_id> :se_setprops {
			event_handlers = [
				{focus ui_options_cheats_update_helper}
			]
			tags = {
				Name = <Name>
				var = <var>
				index = <i>
				unlocked = <unlocked>
				toggle = <toggle>
			}
		}
	endif
	i = (<i> + 1)
	repeat <array_Size>
	menu_finish
	cheatsinterface :SetTags array_Size = (<i>)
	if NOT comparestructs \{struct1 = $ui_cheats_settings
			struct2 = {
			}}
		current_menu :SetTags \{user_options = $ui_cheats_settings}
	else
		ui_options_set_settings
		current_menu :GetSingleTag \{user_options}
		Change ui_cheats_settings = <user_options>
	endif
	cheatsinterface :Obj_SpawnScriptNow \{ui_options_cheats_screen_anim}
endscript

script ui_destroy_options_cheats 
	DestroyScreenElement \{id = cheatsinterface}
	generic_ui_destroy
	KillSpawnedScript \{Name = ui_options_cheats_screen_anim}
endscript

script ui_deinit_options_cheats 
	Change \{ui_cheats_settings = {
		}}
	check_car_unlocks
endscript

script ui_options_cheats_back 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if is_ui_event_running
		return
	endif

	Change \{ui_cheats_do_anim = 0}
	menu_start_transition
	if (($cheat_alwaysslide = 1) || ($cheat_autokick = 1) || ($cheat_freedrum = 1) || ($cheat_allhopos = 1) || ($cheat_invincible = 1))
		generic_event_choose \{state = uistate_options_cheats_warning}
	else
		ui_options_check_settings
	endif
endscript

script ui_options_cheat_toggle 
	GetTags
	cheat_index = ($guitar_hero_cheat_index [<index>])
	<cheat_index> = (<cheat_index> + 1)
	option_array = ($guitar_hero_cheats [<index>].options)
	GetArraySize <option_array>
	if (<cheat_index> >= <array_Size>)
		<cheat_index> = 0
	endif
	SetArrayElement ArrayName = guitar_hero_cheat_index globalarray index = <index> NewValue = <cheat_index>
	GetGlobalTags \{user_options}
	formatText checksumName = cheat_idx 'cheat_index%a' a = <index>
	AddParam structure_name = params Name = <cheat_idx> value = <cheat_index>
	SetGlobalTags user_options params = <params>
	option_struct = (<option_array> [<cheat_index>])
	globals = (<option_struct>.globals)
	cheat_set_globals globals = <globals>
	text = (<option_struct>.text)
	se_setprops generic_menu_smenu_textitem_text_text = <text>
	exclude_option option_struct = <option_struct>
	refresh_autokick_cheat
endscript

script cheat_set_globals 
	GetGlobalTags \{user_options}
	GetArraySize <globals>
	<idx> = 0
	begin
	<entry> = (<globals> [<idx>])
	<Set> = (<entry>.Set)
	if StructureContains structure = <entry> value
		<set_value> = (<entry>.value)
	elseif StructureContains structure = <entry> Global
		<Global> = (<entry>.Global)
		<value> = ($<Global>)
		if StructureContains structure = <entry> Scale
			<Scale> = (<entry>.Scale)
			<set_value> = (<value> * <Scale>)
		else
			<set_value> = <value>
		endif
	endif
	if GotParam <Set>
		AddParam structure_name = params Name = <Set> value = <set_value>
	else
		Change GlobalName = <Set> NewValue = <set_value>
	endif
	<idx> = (<idx> + 1)
	repeat <array_Size>
	if GotParam \{params}
		SetGlobalTags user_options params = <params>
	endif
endscript

script cheat_turnoffall 
	GetArraySize \{$guitar_hero_cheats}
	<idx> = 0
	begin
	RemoveParameter \{var}
	<var> = ($guitar_hero_cheats [<idx>].var)
	GetGlobalTags \{user_options}
	formatText checksumName = cheat_idx 'cheat_index%a' a = <idx>
	AddParam structure_name = params Name = <cheat_idx> value = 0
	SetGlobalTags user_options params = <params>
	if GotParam \{var}
		Change GlobalName = <var> NewValue = 0
	endif
	<idx> = (<idx> + 1)
	repeat <array_Size>
endscript

script cheat_turnoffalllocked 
	GetArraySize \{$guitar_hero_cheats}
	<idx> = 0
	begin
	RemoveParameter \{var}
	<var> = ($guitar_hero_cheats [<idx>].var)
	savegame = 0
	unlocked = 0
	begin
	GetGlobalTags savegame = <savegame> user_options
	formatText checksumName = cheat_idx 'cheat_index%a' a = <idx>
	if NOT (<...>.<cheat_idx> = 0)
		unlocked = 1
	endif
	savegame = (<savegame> + 1)
	repeat 4
	if (<unlocked> = 0)
		if GotParam \{var}
			Change GlobalName = <var> NewValue = 0
		endif
	endif
	<idx> = (<idx> + 1)
	repeat <array_Size>
endscript

script exclude_option 
	if StructureContains structure = <option_struct> exclude
		<exclude_array> = (<option_struct>.exclude)
		<exclude_index> = 0
		GetArraySize <exclude_array>
		<exclude_array_size> = <array_Size>
		GetGlobalTags \{user_options}
		GetScreenElementChildren \{id = current_menu}
		(<children> [0]) :GetSingleTag index
		0x72e81093 = (0 - <index>)
		begin
		<exclude> = (<exclude_array> [<exclude_index>])
		GetArraySize \{$guitar_hero_cheats}
		<idx> = 0
		begin
		RemoveParameter \{var}
		<var> = ($guitar_hero_cheats [<idx>].var)
		if GotParam \{var}
			if (<var> = <exclude>)
				<Name> = ($guitar_hero_cheats [<idx>].Name)
				formatText checksumName = cheat_checksum 'unlock_Cheat_%a' a = <Name>
				if NOT ((<...>.<cheat_checksum>) = 0)
					exclude_array = ($guitar_hero_cheats [<idx>].options)
					SetArrayElement ArrayName = guitar_hero_cheat_index globalarray index = <idx> NewValue = 0
					GetGlobalTags \{user_options}
					formatText checksumName = cheat_idx 'cheat_index%a' a = <idx>
					AddParam structure_name = params Name = <cheat_idx> value = 0
					SetGlobalTags user_options params = <params>
					exclude_struct = (<exclude_array> [0])
					if NOT GotParam \{no_menu_update}
						text = (<exclude_struct>.text)
						SetScreenElementProps id = {current_menu child = (<idx> + <0x72e81093>)} generic_menu_smenu_textitem_text_text = <text>
					endif
					globals = (<exclude_struct>.globals)
					cheat_set_globals globals = <globals>
				endif
				break
			endif
		endif
		<idx> = (<idx> + 1)
		repeat <array_Size>
		<exclude_index> = (<exclude_index> + 1)
		repeat <exclude_array_size>
	endif
endscript

script ui_options_cheats_update_helper 
	GetTags
	clean_up_user_control_helpers
	add_gamertag_helper \{exclusive_device = $primary_controller}
	if GotParam \{unlocked}
		if (<unlocked> = 1)
			if (<index> = -1)
				add_user_control_helper \{text = qs(0xc18d5e76)
					button = green
					z = 100000}
			elseif (<toggle> = 1)
				add_user_control_helper \{text = qs(0xb92fa92b)
					button = green
					z = 100000}
			endif
			add_user_control_helper \{text = qs(0xaf4d5dd2)
				button = red
				z = 100000}
		else
			add_user_control_helper \{text = qs(0xaf4d5dd2)
				button = red
				z = 100000}
		endif
	else
		menu_finish
	endif
endscript

script 0x60adecd1 
	GetArraySize ($guitar_hero_cheats)
	cheat_index = 0
	begin
	cheat = ($guitar_hero_cheats [<cheat_index>])
	formatText checksumName = cheat_checksum 'unlock_Cheat_%a' a = (<cheat>.Name)
	GetGlobalTags user_options param = <cheat_checksum>
	if NOT GotParam <cheat_checksum>
		return \{FALSE}
	endif
	if NOT ((<...>.<cheat_checksum>) > 0)
		return \{FALSE}
	endif
	cheat_index = (<cheat_index> + 1)
	repeat <array_Size>
	return \{true}
endscript

script check_car_unlocks 
	get_savegame_from_controller controller = ($primary_controller)
	GetGlobalTags savegame = <savegame> user_options param = unlock_cheat_contestwinner1
	if GotParam \{unlock_cheat_contestwinner1}
		if (<unlock_cheat_contestwinner1> = 1)

			unlock_profile id = 0x6eb102a0 savegame = <savegame>
		endif
	endif
	GetGlobalTags savegame = <savegame> user_options param = unlock_cheat_unlockallcharacters
	if GotParam \{unlock_cheat_unlockallcharacters}
		if (<unlock_cheat_unlockallcharacters> = 1)

			0x2ac7c388 savegame = <savegame>
		endif
	endif
endscript

script disable_because_of_cheats 
	disable = 0
	count_players_by_part \{part = drum}
	if (<players_by_part> > 0)
		if ($cheat_autokick = 1 || $cheat_freedrum = 1)
			disable = 1
		endif
	endif
	count_players_by_part \{part = guitar}
	gtrs_cnt = <players_by_part>
	count_players_by_part \{part = bass}
	gtrs_cnt = (<players_by_part> + <gtrs_cnt>)
	if (<gtrs_cnt> > 0)
		if ($cheat_alwaysslide = 1 || $cheat_allhopos = 1)
			disable = 1
		endif
	endif
	if ($cheat_invincible = 1)
		disable = 1
	endif
	return cheat_disable = <disable>
endscript

script ui_options_cheats_focus 
	focus_generic_menu_text_item
	GetSingleTag \{index}
	if (<index> < 0)
		Change \{ui_cheats_do_anim = 1}
	else
		Change \{ui_cheats_do_anim = 0}
	endif
	cheatsinterface :GetSingleTag \{array_Size}
	cheatsinterface :se_setprops scrollthumb_pos = (((((<index> + 1.0) / <array_Size>) * 320.0) * (0.0, 1.0))) time = 0.05
endscript

script ui_options_cheats_unfocus 
	unfocus_generic_menu_text_item
endscript

script ui_options_cheats_anim_out 
endscript

script 0xef9fe431 
	count_players_by_part \{part = drum}
	if ($cheat_freedrum = 1 && <players_by_part> > 0)
		Change \{cheat_freedrum = 0}
		GetArraySize \{$guitar_hero_cheats}
		i = 0
		begin
		if ($guitar_hero_cheats [<i>].Name = 'FreeDrum')
			SetArrayElement ArrayName = guitar_hero_cheat_index globalarray index = <i> NewValue = 0
			GetGlobalTags \{user_options}
			formatText checksumName = cheat_idx 'cheat_index%a' a = <i>
			AddParam structure_name = params Name = <cheat_idx> value = 0
			SetGlobalTags user_options params = <params>
			return
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
endscript
