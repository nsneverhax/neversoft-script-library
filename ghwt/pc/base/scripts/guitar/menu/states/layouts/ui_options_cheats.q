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
		name = 'Line6Unlock'
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
						set = cheat_line6unlock
						value = 1
					}
				]
			}
		]
	}
	{
		name = 'AlwaysSlide'
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
						set = cheat_alwaysslide
						value = 2
					}
				]
			}
			{
				text = qs(0x32785e87)
				globals = [
					{
						set = cheat_alwaysslide
						value = 1
					}
				]
			}
		]
	}
	{
		name = 'BestBuyKid'
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
						set = cheat_bestbuykid
						value = 1
					}
				]
			}
		]
	}
	{
		name = 'EuroContestWinner'
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
						set = cheat_eurocontestwinner
						value = 1
					}
				]
			}
		]
	}
	{
		name = 'Rina'
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
						set = cheat_rina
						value = 1
					}
				]
			}
		]
	}
	{
		name = 'Aaron'
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
						set = cheat_aaron
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
						set = cheat_airinstruments
						value = 2
					}
					{
						set = airinstruments
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
						set = cheat_airinstruments
						value = 1
					}
					{
						set = airinstruments
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
						set = cheat_invisiblecharacters
						value = 2
					}
					{
						set = invisiblecharacters
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
						set = cheat_invisiblecharacters
						value = 1
					}
					{
						set = invisiblecharacters
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
						set = cheat_performancemode
						value = 2
					}
				]
			}
			{
				text = qs(0x9da2af77)
				globals = [
					{
						set = cheat_performancemode
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
						set = cheat_hyperspeed
						value = 1
					}
					{
						set = hyperspeed_guitar
						value = 1.0
					}
				]
			}
			{
				text = qs(0x12b79e36)
				globals = [
					{
						set = cheat_hyperspeed
						value = 1
					}
					{
						set = hyperspeed_guitar
						value = 0.88
					}
				]
			}
			{
				text = qs(0x399acdf5)
				globals = [
					{
						set = cheat_hyperspeed
						value = 1
					}
					{
						set = hyperspeed_guitar
						value = 0.83
					}
				]
			}
			{
				text = qs(0x2081fcb4)
				globals = [
					{
						set = cheat_hyperspeed
						value = 1
					}
					{
						set = hyperspeed_guitar
						value = 0.78
					}
				]
			}
			{
				text = qs(0x6fc06a73)
				globals = [
					{
						set = cheat_hyperspeed
						value = 1
					}
					{
						set = hyperspeed_guitar
						value = 0.72999996
					}
				]
			}
			{
				text = qs(0x7e0f3ef5)
				globals = [
					{
						set = cheat_hyperspeed
						value = 1
					}
					{
						set = hyperspeed_guitar
						value = 0.68
					}
				]
			}
		]
	}
	{
		name = 'Hyperspeed'
		name_text = qs(0x8968c474)
		var = cheat_hyperspeed
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
						set = cheat_hyperspeed
						value = 1
					}
					{
						set = hyperspeed_bass
						value = 1.0
					}
				]
			}
			{
				text = qs(0xe4c6c8b6)
				globals = [
					{
						set = cheat_hyperspeed
						value = 1
					}
					{
						set = hyperspeed_bass
						value = 0.88
					}
				]
			}
			{
				text = qs(0xcfeb9b75)
				globals = [
					{
						set = cheat_hyperspeed
						value = 1
					}
					{
						set = hyperspeed_bass
						value = 0.83
					}
				]
			}
			{
				text = qs(0xd6f0aa34)
				globals = [
					{
						set = cheat_hyperspeed
						value = 1
					}
					{
						set = hyperspeed_bass
						value = 0.78
					}
				]
			}
			{
				text = qs(0x99b13cf3)
				globals = [
					{
						set = cheat_hyperspeed
						value = 1
					}
					{
						set = hyperspeed_bass
						value = 0.72999996
					}
				]
			}
			{
				text = qs(0x80aa0db2)
				globals = [
					{
						set = cheat_hyperspeed
						value = 1
					}
					{
						set = hyperspeed_bass
						value = 0.68
					}
				]
			}
		]
	}
	{
		name = 'Hyperspeed'
		name_text = qs(0x8968c474)
		var = cheat_hyperspeed
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
						set = cheat_hyperspeed
						value = 1
					}
					{
						set = hyperspeed_drum
						value = 1.0
					}
				]
			}
			{
				text = qs(0xac3b1f20)
				globals = [
					{
						set = cheat_hyperspeed
						value = 1
					}
					{
						set = hyperspeed_drum
						value = 0.88
					}
				]
			}
			{
				text = qs(0x87164ce3)
				globals = [
					{
						set = cheat_hyperspeed
						value = 1
					}
					{
						set = hyperspeed_drum
						value = 0.83
					}
				]
			}
			{
				text = qs(0x9e0d7da2)
				globals = [
					{
						set = cheat_hyperspeed
						value = 1
					}
					{
						set = hyperspeed_drum
						value = 0.78
					}
				]
			}
			{
				text = qs(0xd14ceb65)
				globals = [
					{
						set = cheat_hyperspeed
						value = 1
					}
					{
						set = hyperspeed_drum
						value = 0.72999996
					}
				]
			}
			{
				text = qs(0xc857da24)
				globals = [
					{
						set = cheat_hyperspeed
						value = 1
					}
					{
						set = hyperspeed_drum
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
						set = cheat_autokick
						value = 2
					}
				]
			}
			{
				text = qs(0xa680c44e)
				globals = [
					{
						set = cheat_autokick
						value = 1
					}
				]
			}
		]
	}
	{
		name = 'UnlockQuickplay'
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
						set = cheat_unlockquickplay
						value = 2
					}
				]
			}
			{
				text = qs(0x98d57fc0)
				globals = [
					{
						set = cheat_unlockquickplay
						value = 1
					}
				]
			}
		]
	}
	{
		name = 'UnlockATTBallpark'
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
						set = cheat_unlockattballpark
						value = 2
					}
				]
			}
			{
				text = qs(0x00d95717)
				globals = [
					{
						set = cheat_unlockattballpark
						value = 1
					}
				]
			}
		]
	}
	{
		name = 'GemColor'
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
						set = cheat_gemcolor
						value = 1
					}
					{
						set = gem_set
						value = standard_gems
					}
				]
			}
			{
				text = qs(0x011aec59)
				globals = [
					{
						set = cheat_gemcolor
						value = 1
					}
					{
						set = gem_set
						value = pink_gems
					}
				]
			}
			{
				text = qs(0x7b601734)
				globals = [
					{
						set = cheat_gemcolor
						value = 1
					}
					{
						set = gem_set
						value = stealth_gems
					}
				]
			}
			{
				text = qs(0xc958d676)
				globals = [
					{
						set = cheat_gemcolor
						value = 1
					}
					{
						set = gem_set
						value = eggs_n_bacon_gems
					}
				]
			}
			{
				text = qs(0x0d5a9c27)
				globals = [
					{
						set = cheat_gemcolor
						value = 1
					}
					{
						set = gem_set
						value = old_glory_gems
					}
				]
			}
			{
				text = qs(0x88a8d588)
				globals = [
					{
						set = cheat_gemcolor
						value = 1
					}
					{
						set = gem_set
						value = solid_gold_gems
					}
				]
			}
			{
				text = qs(0x8b527bb8)
				globals = [
					{
						set = cheat_gemcolor
						value = 1
					}
					{
						set = gem_set
						value = platinum_gems
					}
				]
			}
			{
				text = qs(0x18bcfb46)
				globals = [
					{
						set = cheat_gemcolor
						value = 1
					}
					{
						set = gem_set
						value = diabolic_gems
					}
				]
			}
			{
				text = qs(0x3d4f6c65)
				globals = [
					{
						set = cheat_gemcolor
						value = 1
					}
					{
						set = gem_set
						value = toxic_waste_gems
					}
				]
			}
			{
				text = qs(0x8e111a11)
				globals = [
					{
						set = cheat_gemcolor
						value = 1
					}
					{
						set = gem_set
						value = black_gems
					}
				]
			}
			{
				text = qs(0x2738dfe7)
				globals = [
					{
						set = cheat_gemcolor
						value = 1
					}
					{
						set = gem_set
						value = pastel_gems
					}
				]
			}
			{
				text = qs(0x0f77b9c2)
				globals = [
					{
						set = cheat_gemcolor
						value = 1
					}
					{
						set = gem_set
						value = dark_gems
					}
				]
			}
			{
				text = qs(0x252c5118)
				globals = [
					{
						set = cheat_gemcolor
						value = 1
					}
					{
						set = gem_set
						value = outline_gems
					}
				]
			}
		]
	}
	{
		name = 'FlameColor'
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
						set = cheat_flamecolor
						value = 1
					}
					{
						set = fx_set
						value = standard_fx
					}
				]
			}
			{
				text = qs(0x0fa5355c)
				globals = [
					{
						set = cheat_flamecolor
						value = 1
					}
					{
						set = fx_set
						value = pink_fx
					}
				]
			}
			{
				text = qs(0xe0c7e869)
				globals = [
					{
						set = cheat_flamecolor
						value = 1
					}
					{
						set = fx_set
						value = stealth_fx
					}
				]
			}
			{
				text = qs(0x81ba1b96)
				globals = [
					{
						set = cheat_flamecolor
						value = 1
					}
					{
						set = fx_set
						value = eggs_n_bacon_fx
					}
				]
			}
			{
				text = qs(0x0c3e1f57)
				globals = [
					{
						set = cheat_flamecolor
						value = 1
					}
					{
						set = fx_set
						value = old_glory_fx
					}
				]
			}
			{
				text = qs(0x3aabac75)
				globals = [
					{
						set = cheat_flamecolor
						value = 1
					}
					{
						set = fx_set
						value = diabolic_fx
					}
				]
			}
			{
				text = qs(0xc395f715)
				globals = [
					{
						set = cheat_flamecolor
						value = 1
					}
					{
						set = fx_set
						value = toxic_waste_fx
					}
				]
			}
		]
	}
	{
		name = 'StarColor'
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
						set = cheat_starcolor
						value = 1
					}
					{
						set = star_set
						value = standard_stars
					}
				]
			}
			{
				text = qs(0x3d0376dd)
				globals = [
					{
						set = cheat_starcolor
						value = 1
					}
					{
						set = star_set
						value = gold_stars
					}
				]
			}
		]
	}
	{
		name = 'VocalFireball'
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
						set = cheat_vocalfireball
						value = 1
					}
				]
			}
			{
				text = qs(0x04e4f35f)
				globals = [
					{
						set = cheat_vocalfireball
						value = 2
					}
				]
			}
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
		global = cheat_superuser
		value = 1
	}
]
ui_cheats_settings = {
}

script ui_create_options_cheats 
	getglobaltags \{user_options}
	setarrayelement arrayname = guitar_hero_cheat_index globalarray index = 0 newvalue = <cheat_index0>
	setarrayelement arrayname = guitar_hero_cheat_index globalarray index = 1 newvalue = <cheat_index1>
	setarrayelement arrayname = guitar_hero_cheat_index globalarray index = 2 newvalue = <cheat_index2>
	setarrayelement arrayname = guitar_hero_cheat_index globalarray index = 3 newvalue = <cheat_index3>
	setarrayelement arrayname = guitar_hero_cheat_index globalarray index = 4 newvalue = <cheat_index4>
	setarrayelement arrayname = guitar_hero_cheat_index globalarray index = 5 newvalue = <cheat_index5>
	setarrayelement arrayname = guitar_hero_cheat_index globalarray index = 6 newvalue = <cheat_index6>
	setarrayelement arrayname = guitar_hero_cheat_index globalarray index = 7 newvalue = <cheat_index7>
	setarrayelement arrayname = guitar_hero_cheat_index globalarray index = 8 newvalue = <cheat_index8>
	setarrayelement arrayname = guitar_hero_cheat_index globalarray index = 9 newvalue = <cheat_index9>
	setarrayelement arrayname = guitar_hero_cheat_index globalarray index = 10 newvalue = <cheat_index10>
	setarrayelement arrayname = guitar_hero_cheat_index globalarray index = 11 newvalue = <cheat_index11>
	setarrayelement arrayname = guitar_hero_cheat_index globalarray index = 12 newvalue = <cheat_index12>
	setarrayelement arrayname = guitar_hero_cheat_index globalarray index = 13 newvalue = <cheat_index13>
	setarrayelement arrayname = guitar_hero_cheat_index globalarray index = 14 newvalue = <cheat_index14>
	setarrayelement arrayname = guitar_hero_cheat_index globalarray index = 15 newvalue = <cheat_index15>
	setarrayelement arrayname = guitar_hero_cheat_index globalarray index = 16 newvalue = <cheat_index16>
	setarrayelement arrayname = guitar_hero_cheat_index globalarray index = 17 newvalue = <cheat_index17>
	setarrayelement arrayname = guitar_hero_cheat_index globalarray index = 18 newvalue = <cheat_index18>
	setarrayelement arrayname = guitar_hero_cheat_index globalarray index = 19 newvalue = <cheat_index19>
	setarrayelement arrayname = guitar_hero_cheat_index globalarray index = 20 newvalue = <cheat_index20>
	make_menu_frontend \{screen = guitarist
		title = qs(0x3e3a98e6)
		item_scale = 1.75
		pad_back_script = ui_options_cheats_back}
	createscreenelement {
		type = spriteelement
		parent = <window_id>
		texture = triangle
		pos = (400.0, 110.0)
		rot_angle = -90
		just = [center center]
	}
	createscreenelement {
		type = spriteelement
		parent = <window_id>
		texture = triangle
		pos = (1050.0, 140.0)
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
	getarraysize \{$guitar_hero_cheats}
	i = 0
	begin
	formattext checksumname = cheat_unlocked 'unlock_Cheat_%a' a = ($guitar_hero_cheats [<i>].name)
	if gotparam <cheat_unlocked>
		<text> = qs(0xb8a0b6b7)
		unlocked = 0
		toggle = 1
		pad_choose_script = nullscript
		item_height = 50
		if ((<...>.<cheat_unlocked>) > 0)
			name = ($guitar_hero_cheats [<i>].name)
			var = ($guitar_hero_cheats [<i>].var)
			cheat_index = ($guitar_hero_cheat_index [<i>])
			option_struct = ($guitar_hero_cheats [<i>].options [<cheat_index>])
			text = (<option_struct>.text)
			pad_choose_params = {}
			if structurecontains structure = ($guitar_hero_cheats [<i>]) pad_choose_script
				pad_choose_script = ($guitar_hero_cheats [<i>].pad_choose_script)
				if structurecontains structure = ($guitar_hero_cheats [<i>]) pad_choose_params
					pad_choose_params = ($guitar_hero_cheats [<i>].pad_choose_params)
				endif
			else
				pad_choose_script = ui_options_cheat_toggle
			endif
			item_height = 100
			if structurecontains structure = ($guitar_hero_cheats [<i>]) not_toggle
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
				name = <name>
				var = <var>
				index = <i>
				unlocked = <unlocked>
				toggle = <toggle>
			}
		}
	endif
	i = (<i> + 1)
	repeat <array_size>
	<item_container_id> :se_setprops {
		event_handlers = [
			{focus ui_options_cheats_update_helper}
		]
	}
	menu_finish
	if NOT comparestructs \{struct1 = $ui_cheats_settings
			struct2 = {
			}}
		current_menu :settags \{user_options = $ui_cheats_settings}
	else
		ui_options_set_settings
		current_menu :getsingletag \{user_options}
		change ui_cheats_settings = <user_options>
	endif
endscript

script ui_destroy_options_cheats 
	generic_ui_destroy
endscript

script ui_deinit_options_cheats 
	change \{ui_cheats_settings = {
		}}
	check_car_unlocks
endscript

script ui_options_cheats_back 
	setspawninstancelimits \{max = 1
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
	gettags
	cheat_index = ($guitar_hero_cheat_index [<index>])
	<cheat_index> = (<cheat_index> + 1)
	option_array = ($guitar_hero_cheats [<index>].options)
	getarraysize <option_array>
	if (<cheat_index> >= <array_size>)
		<cheat_index> = 0
	endif
	setarrayelement arrayname = guitar_hero_cheat_index globalarray index = <index> newvalue = <cheat_index>
	getglobaltags \{user_options}
	formattext checksumname = cheat_idx 'cheat_index%a' a = <index>
	addparam structure_name = params name = <cheat_idx> value = <cheat_index>
	setglobaltags user_options params = <params>
	option_struct = (<option_array> [<cheat_index>])
	globals = (<option_struct>.globals)
	cheat_set_globals globals = <globals>
	text = (<option_struct>.text)
	se_setprops item_text = <text>
	exclude_option option_struct = <option_struct>
endscript

script cheat_set_globals 
	getglobaltags \{user_options}
	getarraysize <globals>
	<idx> = 0
	begin
	<entry> = (<globals> [<idx>])
	<set> = (<entry>.set)
	if structurecontains structure = <entry> value
		<set_value> = (<entry>.value)
	elseif structurecontains structure = <entry> global
		<global> = (<entry>.global)
		<value> = ($<global>)
		if structurecontains structure = <entry> scale
			<scale> = (<entry>.scale)
			<set_value> = (<value> * <scale>)
		else
			<set_value> = <value>
		endif
	endif
	if gotparam <set>
		addparam structure_name = params name = <set> value = <set_value>
	else
		change globalname = <set> newvalue = <set_value>
	endif
	<idx> = (<idx> + 1)
	repeat <array_size>
	if gotparam \{params}
		setglobaltags user_options params = <params>
	endif
endscript

script cheat_turnoffall 
	getarraysize \{$guitar_hero_cheats}
	<idx> = 0
	begin
	<var> = ($guitar_hero_cheats [<idx>].var)
	change globalname = <var> newvalue = 0
	<idx> = (<idx> + 1)
	repeat <array_size>
endscript

script cheat_turnoffalllocked 
	getarraysize \{$guitar_hero_cheats}
	<idx> = 0
	begin
	<var> = ($guitar_hero_cheats [<idx>].var)
	savegame = 0
	unlocked = 0
	begin
	getglobaltags savegame = <savegame> user_options
	formattext checksumname = cheat_idx 'cheat_index%a' a = <idx>
	if NOT (<...>.<cheat_idx> = 0)
		unlocked = 1
	endif
	savegame = (<savegame> + 1)
	repeat 4
	if (<unlocked> = 0)
		change globalname = <var> newvalue = 0
	endif
	<idx> = (<idx> + 1)
	repeat <array_size>
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
				exclude_array = ($guitar_hero_cheats [<idx>].options)
				setarrayelement arrayname = guitar_hero_cheat_index globalarray index = <idx> newvalue = 0
				getglobaltags \{user_options}
				formattext checksumname = cheat_idx 'cheat_index%a' a = <idx>
				addparam structure_name = params name = <cheat_idx> value = 0
				setglobaltags user_options params = <params>
				exclude_struct = (<exclude_array> [0])
				if NOT gotparam \{no_menu_update}
					text = (<exclude_struct>.text)
					setscreenelementprops id = {current_menu child = (<idx> + 1)} item_text = <text>
				endif
				globals = (<exclude_struct>.globals)
				cheat_set_globals globals = <globals>
			endif
			break
		endif
		<idx> = (<idx> + 1)
		repeat <array_size>
		<exclude_index> = (<exclude_index> + 1)
		repeat <exclude_array_size>
	endif
endscript

script ui_options_cheats_update_helper 
	gettags
	clean_up_user_control_helpers
	add_gamertag_helper \{exclusive_device = $primary_controller}
	if gotparam \{unlocked}
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
	getglobaltags savegame = <savegame> user_options
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
		unlock_profile id = `aaron steele` savegame = <savegame>
	endif
endscript
