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
]
guitar_hero_cheats = [
	{
		Name = 'Line6Unlock'
		name_text = qs(0x4e3fdf61)
		var = cheat_line6unlock
		unlock_pattern = [
			green
			red
			yellow
			blue
			red
			yellow
			blue
			green
		]
		not_toggle
		options = [
			{
				text = qs(0x4e3fdf61)
				globals = [
					{
						Set = cheat_line6unlock
						value = 1
					}
				]
			}
		]
	}
	{
		Name = 'AlwaysSlide'
		name_text = qs(0x7e8961c8)
		var = cheat_alwaysslide
		unlock_pattern = [
			green
			green
			red
			red
			yellow
			red
			yellow
			blue
		]
		options = [
			{
				text = qs(0x9b86806b)
				globals = [
					{
						Set = cheat_alwaysslide
						value = 2
					}
				]
			}
			{
				text = qs(0x32785e87)
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
		Name = 'BestBuyKid'
		name_text = qs(0xe392cb41)
		var = cheat_bestbuykid
		unlock_pattern = [
			green
			red
			blue
			green
			red
			blue
			blue
			green
		]
		not_toggle
		options = [
			{
				text = qs(0xe392cb41)
				globals = [
					{
						Set = cheat_bestbuykid
						value = 1
					}
				]
			}
		]
	}
	{
		Name = 'EuroContestWinner'
		name_text = qs(0x6349ea29)
		var = cheat_eurocontestwinner
		unlock_pattern = [
			blue
			red
			blue
			blue
			yellow
			yellow
			yellow
			green
		]
		not_toggle
		options = [
			{
				text = qs(0x6349ea29)
				globals = [
					{
						Set = cheat_eurocontestwinner
						value = 1
					}
				]
			}
		]
	}
	{
		Name = 'Rina'
		name_text = qs(0x0d23599d)
		var = cheat_rina
		unlock_pattern = [
			blue
			red
			green
			green
			yellow
			yellow
			yellow
			green
		]
		not_toggle
		options = [
			{
				text = qs(0x0d23599d)
				globals = [
					{
						Set = cheat_rina
						value = 1
					}
				]
			}
		]
	}
	{
		Name = 'Aaron'
		name_text = qs(0x410a8eed)
		var = cheat_aaron
		unlock_pattern = [
			blue
			red
			yellow
			yellow
			yellow
			yellow
			yellow
			green
		]
		not_toggle
		options = [
			{
				text = qs(0x410a8eed)
				globals = [
					{
						Set = cheat_aaron
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
			red
			red
			blue
			yellow
			green
			green
			green
			yellow
		]
		options = [
			{
				text = qs(0x293b9eb2)
				globals = [
					{
						Set = cheat_airinstruments
						value = 2
					}
					{
						Set = airinstruments
						value = 2
					}
				]
			}
			{
				text = qs(0x2789e787)
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
			yellow
			yellow
			blue
			blue
			green
		]
		options = [
			{
				text = qs(0x03309005)
				globals = [
					{
						Set = cheat_invisiblecharacters
						value = 2
					}
					{
						Set = invisiblecharacters
						value = 2
					}
				]
			}
			{
				text = qs(0x6902dc9e)
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
			red
			blue
			green
			red
			red
		]
		options = [
			{
				text = qs(0x45800c86)
				globals = [
					{
						Set = Cheat_PerformanceMode
						value = 2
					}
				]
			}
			{
				text = qs(0x9da2af77)
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
		var = Cheat_Hyperspeed
		unlock_pattern = [
			green
			blue
			red
			yellow
			yellow
			red
			green
			green
		]
		options = [
			{
				text = qs(0x8175bdff)
				globals = [
					{
						Set = Cheat_Hyperspeed
						value = 1
					}
					{
						Set = hyperspeed_guitar
						value = 1.0
					}
				]
			}
			{
				text = qs(0x12b79e36)
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
				text = qs(0x399acdf5)
				globals = [
					{
						Set = Cheat_Hyperspeed
						value = 1
					}
					{
						Set = hyperspeed_guitar
						value = 0.83
					}
				]
			}
			{
				text = qs(0x2081fcb4)
				globals = [
					{
						Set = Cheat_Hyperspeed
						value = 1
					}
					{
						Set = hyperspeed_guitar
						value = 0.78
					}
				]
			}
			{
				text = qs(0x6fc06a73)
				globals = [
					{
						Set = Cheat_Hyperspeed
						value = 1
					}
					{
						Set = hyperspeed_guitar
						value = 0.72999996
					}
				]
			}
			{
				text = qs(0x7e0f3ef5)
				globals = [
					{
						Set = Cheat_Hyperspeed
						value = 1
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
		var = Cheat_Hyperspeed
		unlock_pattern = [
			green
			blue
			red
			yellow
			yellow
			red
			green
			green
		]
		options = [
			{
				text = qs(0x26ffe8cd)
				globals = [
					{
						Set = Cheat_Hyperspeed
						value = 1
					}
					{
						Set = hyperspeed_bass
						value = 1.0
					}
				]
			}
			{
				text = qs(0xe4c6c8b6)
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
				text = qs(0xcfeb9b75)
				globals = [
					{
						Set = Cheat_Hyperspeed
						value = 1
					}
					{
						Set = hyperspeed_bass
						value = 0.83
					}
				]
			}
			{
				text = qs(0xd6f0aa34)
				globals = [
					{
						Set = Cheat_Hyperspeed
						value = 1
					}
					{
						Set = hyperspeed_bass
						value = 0.78
					}
				]
			}
			{
				text = qs(0x99b13cf3)
				globals = [
					{
						Set = Cheat_Hyperspeed
						value = 1
					}
					{
						Set = hyperspeed_bass
						value = 0.72999996
					}
				]
			}
			{
				text = qs(0x80aa0db2)
				globals = [
					{
						Set = Cheat_Hyperspeed
						value = 1
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
		var = Cheat_Hyperspeed
		unlock_pattern = [
			green
			blue
			red
			yellow
			yellow
			red
			green
			green
		]
		options = [
			{
				text = qs(0x18d01d6e)
				globals = [
					{
						Set = Cheat_Hyperspeed
						value = 1
					}
					{
						Set = hyperspeed_drum
						value = 1.0
					}
				]
			}
			{
				text = qs(0xac3b1f20)
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
				text = qs(0x87164ce3)
				globals = [
					{
						Set = Cheat_Hyperspeed
						value = 1
					}
					{
						Set = hyperspeed_drum
						value = 0.83
					}
				]
			}
			{
				text = qs(0x9e0d7da2)
				globals = [
					{
						Set = Cheat_Hyperspeed
						value = 1
					}
					{
						Set = hyperspeed_drum
						value = 0.78
					}
				]
			}
			{
				text = qs(0xd14ceb65)
				globals = [
					{
						Set = Cheat_Hyperspeed
						value = 1
					}
					{
						Set = hyperspeed_drum
						value = 0.72999996
					}
				]
			}
			{
				text = qs(0xc857da24)
				globals = [
					{
						Set = Cheat_Hyperspeed
						value = 1
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
			red
			blue
			blue
			blue
			blue
			red
		]
		options = [
			{
				text = qs(0x916402ce)
				globals = [
					{
						Set = cheat_autokick
						value = 2
					}
				]
			}
			{
				text = qs(0xa680c44e)
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
		Name = 'UnlockQuickplay'
		name_text = qs(0xfa0402f0)
		var = cheat_unlockquickplay
		unlock_pattern = [
			blue
			blue
			red
			green
			green
			blue
			blue
			yellow
		]
		options = [
			{
				text = qs(0x68d7e35a)
				globals = [
					{
						Set = cheat_unlockquickplay
						value = 2
					}
				]
			}
			{
				text = qs(0x98d57fc0)
				globals = [
					{
						Set = cheat_unlockquickplay
						value = 1
					}
				]
			}
		]
	}
	{
		Name = 'UnlockATTBallpark'
		name_text = qs(0x58b2a81e)
		var = cheat_unlockattballpark
		unlock_pattern = [
			yellow
			green
			red
			red
			green
			blue
			red
			yellow
		]
		options = [
			{
				text = qs(0x931b8074)
				globals = [
					{
						Set = cheat_unlockattballpark
						value = 2
					}
				]
			}
			{
				text = qs(0x00d95717)
				globals = [
					{
						Set = cheat_unlockattballpark
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
				text = qs(0xbbc9152c)
				globals = [
					{
						Set = cheat_gemcolor
						value = 1
					}
					{
						Set = gem_set
						value = standard_gems
					}
				]
			}
			{
				text = qs(0x011aec59)
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
				text = qs(0x7b601734)
				globals = [
					{
						Set = cheat_gemcolor
						value = 1
					}
					{
						Set = gem_set
						value = stealth_gems
					}
				]
			}
			{
				text = qs(0xc958d676)
				globals = [
					{
						Set = cheat_gemcolor
						value = 1
					}
					{
						Set = gem_set
						value = eggs_n_bacon_gems
					}
				]
			}
			{
				text = qs(0x0d5a9c27)
				globals = [
					{
						Set = cheat_gemcolor
						value = 1
					}
					{
						Set = gem_set
						value = old_glory_gems
					}
				]
			}
			{
				text = qs(0x88a8d588)
				globals = [
					{
						Set = cheat_gemcolor
						value = 1
					}
					{
						Set = gem_set
						value = solid_gold_gems
					}
				]
			}
			{
				text = qs(0x8b527bb8)
				globals = [
					{
						Set = cheat_gemcolor
						value = 1
					}
					{
						Set = gem_set
						value = platinum_gems
					}
				]
			}
			{
				text = qs(0x18bcfb46)
				globals = [
					{
						Set = cheat_gemcolor
						value = 1
					}
					{
						Set = gem_set
						value = diabolic_gems
					}
				]
			}
			{
				text = qs(0x3d4f6c65)
				globals = [
					{
						Set = cheat_gemcolor
						value = 1
					}
					{
						Set = gem_set
						value = toxic_waste_gems
					}
				]
			}
			{
				text = qs(0x8e111a11)
				globals = [
					{
						Set = cheat_gemcolor
						value = 1
					}
					{
						Set = gem_set
						value = black_gems
					}
				]
			}
			{
				text = qs(0x2738dfe7)
				globals = [
					{
						Set = cheat_gemcolor
						value = 1
					}
					{
						Set = gem_set
						value = pastel_gems
					}
				]
			}
			{
				text = qs(0x0f77b9c2)
				globals = [
					{
						Set = cheat_gemcolor
						value = 1
					}
					{
						Set = gem_set
						value = dark_gems
					}
				]
			}
			{
				text = qs(0x252c5118)
				globals = [
					{
						Set = cheat_gemcolor
						value = 1
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
				text = qs(0x8aaa74d1)
				globals = [
					{
						Set = cheat_flamecolor
						value = 1
					}
					{
						Set = fx_set
						value = standard_fx
					}
				]
			}
			{
				text = qs(0x0fa5355c)
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
				text = qs(0xe0c7e869)
				globals = [
					{
						Set = cheat_flamecolor
						value = 1
					}
					{
						Set = fx_set
						value = stealth_fx
					}
				]
			}
			{
				text = qs(0x81ba1b96)
				globals = [
					{
						Set = cheat_flamecolor
						value = 1
					}
					{
						Set = fx_set
						value = eggs_n_bacon_fx
					}
				]
			}
			{
				text = qs(0x0c3e1f57)
				globals = [
					{
						Set = cheat_flamecolor
						value = 1
					}
					{
						Set = fx_set
						value = old_glory_fx
					}
				]
			}
			{
				text = qs(0x3aabac75)
				globals = [
					{
						Set = cheat_flamecolor
						value = 1
					}
					{
						Set = fx_set
						value = diabolic_fx
					}
				]
			}
			{
				text = qs(0xc395f715)
				globals = [
					{
						Set = cheat_flamecolor
						value = 1
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
				text = qs(0x5bf41d65)
				globals = [
					{
						Set = cheat_starcolor
						value = 1
					}
					{
						Set = star_set
						value = standard_stars
					}
				]
			}
			{
				text = qs(0x3d0376dd)
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
				text = qs(0x738d9601)
				globals = [
					{
						Set = cheat_vocalfireball
						value = 1
					}
				]
			}
			{
				text = qs(0x04e4f35f)
				globals = [
					{
						Set = cheat_vocalfireball
						value = 2
					}
				]
			}
		]
	}
]
guitar_hero_debug_cheats = [
	{
		Name = 'UnlockAll'
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
		Name = 'UnlockAllEverything'
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
ui_cheats_settings = {
}

script ui_create_options_cheats 
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
	make_menu_frontend \{screen = GUITARIST
		title = qs(0x3e3a98e6)
		item_scale = 1.75
		pad_back_script = ui_options_cheats_back}
	CreateScreenElement {
		Type = SpriteElement
		parent = <window_id>
		texture = Triangle
		Pos = (400.0, 110.0)
		rot_angle = -90
		just = [center center]
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <window_id>
		texture = Triangle
		Pos = (1050.0, 140.0)
		rot_angle = 90
		just = [center center]
	}
	add_menu_frontend_item \{text = qs(0xde232315)
		pad_choose_script = generic_event_choose
		pad_choose_params = {
			state = uistate_options_cheats_new
		}
		item_height = 50}
	<item_container_id> :se_getparentid
	<parent_id> :se_setprops {
		event_handlers = [
			{focus ui_options_cheats_update_helper}
		]
		tags = {
			unlocked = 1
			toggle = 0
		}
	}
	GetArraySize \{$guitar_hero_cheats}
	i = 0
	begin
	formatText checksumName = cheat_unlocked 'unlock_Cheat_%a' a = ($guitar_hero_cheats [<i>].Name)
	if GotParam <cheat_unlocked>
		<text> = qs(0xb8a0b6b7)
		unlocked = 0
		toggle = 1
		pad_choose_script = nullscript
		item_height = 50
		if ((<...>.<cheat_unlocked>) > 0)
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
			item_height = 100
			if StructureContains structure = ($guitar_hero_cheats [<i>]) not_toggle
				toggle = 0
				item_height = 50
			endif
			unlocked = 1
		endif
		add_menu_frontend_item {
			text = <text>
			pad_choose_script = <pad_choose_script>
			pad_choose_params = <pad_choose_params>
			item_height = <item_height>
		}
		<item_container_id> :se_getparentid
		<parent_id> :se_setprops {
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
	<item_container_id> :se_setprops {
		event_handlers = [
			{focus ui_options_cheats_update_helper}
		]
	}
	menu_finish
	if NOT comparestructs \{struct1 = $ui_cheats_settings
			struct2 = {
			}}
		current_menu :SetTags \{user_options = $ui_cheats_settings}
	else
		ui_options_set_settings
		current_menu :GetSingleTag \{user_options}
		Change ui_cheats_settings = <user_options>
	endif
endscript

script ui_destroy_options_cheats 
	generic_ui_destroy
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
	if (($cheat_alwaysslide = 1) || ($cheat_autokick = 1))
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
	se_setprops item_text = <text>
	exclude_option option_struct = <option_struct>
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
	<var> = ($guitar_hero_cheats [<idx>].var)
	Change GlobalName = <var> NewValue = 0
	<idx> = (<idx> + 1)
	repeat <array_Size>
endscript

script cheat_turnoffalllocked 
	GetArraySize \{$guitar_hero_cheats}
	<idx> = 0
	begin
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
		Change GlobalName = <var> NewValue = 0
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
				exclude_array = ($guitar_hero_cheats [<idx>].options)
				SetArrayElement ArrayName = guitar_hero_cheat_index globalarray index = <idx> NewValue = 0
				GetGlobalTags \{user_options}
				formatText checksumName = cheat_idx 'cheat_index%a' a = <idx>
				AddParam structure_name = params Name = <cheat_idx> value = 0
				SetGlobalTags user_options params = <params>
				exclude_struct = (<exclude_array> [0])
				if NOT GotParam \{no_menu_update}
					text = (<exclude_struct>.text)
					SetScreenElementProps id = {current_menu child = (<idx> + 1)} item_text = <text>
				endif
				globals = (<exclude_struct>.globals)
				cheat_set_globals globals = <globals>
			endif
			break
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
			if (<toggle> = 0)
				<green_text> = qs(0xc18d5e76)
			else
				<green_text> = qs(0xb92fa92b)
			endif
			add_user_control_helper text = <green_text> button = green z = 100000
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

script check_car_unlocks 
	get_savegame_from_controller controller = ($primary_controller)
	GetGlobalTags savegame = <savegame> user_options
	if (<unlock_cheat_bestbuykid> = 1)
		unlock_profile id = nickarnold savegame = <savegame>
	endif
	if (<unlock_cheat_eurocontestwinner> = 1)
		unlock_profile id = gh4_car_winner savegame = <savegame>
	endif
	if (<unlock_cheat_rina> = 1)
		unlock_profile id = rina savegame = <savegame>
	endif
	if (<unlock_cheat_aaron> = 1)
		unlock_profile id = `aaron	steele` savegame = <savegame>
	endif
endscript
