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
	0
]
guitar_hero_cheats = [
	{
		name = 'FreeDrum'
		name_text = qs(0x5e7cb182)
		var = cheat_freedrum
		unlock_pattern = [
			green
			green
			red
			red
			blue
			blue
			yellow
			yellow
		]
		options = [
			{
				text = qs(0x550f3cab)
				globals = [
					{
						set = cheat_freedrum
						value = 2
					}
				]
			}
			{
				text = qs(0xd2f31ac0)
				globals = [
					{
						set = cheat_freedrum
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
			blue
			yellow
			red
			green
			blue
			green
			green
			yellow
		]
		options = [
			{
				text = qs(0xb0a6c949)
				globals = [
					{
						set = cheat_alwaysslide
						value = 2
					}
				]
			}
			{
				text = qs(0x45f3600e)
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
		name = 'AirInstruments'
		name_text = qs(0x9de16fb4)
		var = cheat_airinstruments
		unlock_pattern = [
			yellow
			red
			blue
			green
			yellow
			red
			red
			red
		]
		options = [
			{
				text = qs(0xa5577049)
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
				text = qs(0x65e0afb4)
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
			blue
			red
			red
			red
			red
			yellow
			blue
			green
		]
		options = [
			{
				text = qs(0xebdc4b50)
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
				text = qs(0xb833b268)
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
			blue
			red
			yellow
			yellow
			red
			red
			yellow
			yellow
		]
		options = [
			{
				text = qs(0x1f7c38b9)
				globals = [
					{
						set = cheat_performancemode
						value = 2
					}
				]
			}
			{
				text = qs(0xcf593eeb)
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
			red
			green
			blue
			yellow
			green
			yellow
			red
			red
		]
		options = [
			{
				text = qs(0x80864530)
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
				text = qs(0xedb32e6a)
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
				text = qs(0xc69e7da9)
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
				text = qs(0xdf854ce8)
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
				text = qs(0x90c4da2f)
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
				text = qs(0x89dfeb6e)
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
			red
			green
			blue
			yellow
			green
			yellow
			red
			red
		]
		options = [
			{
				text = qs(0x4b5681b0)
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
				text = qs(0x4a397b58)
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
				text = qs(0x6114289b)
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
				text = qs(0x780f19da)
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
				text = qs(0x374e8f1d)
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
				text = qs(0x2e55be5c)
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
			red
			green
			blue
			yellow
			green
			yellow
			red
			red
		]
		options = [
			{
				text = qs(0xcd54061b)
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
				text = qs(0x74168efb)
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
				text = qs(0x5f3bdd38)
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
				text = qs(0x4620ec79)
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
				text = qs(0x09617abe)
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
				text = qs(0x107a4bff)
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
			blue
			green
			red
			yellow
			red
			yellow
			red
			yellow
		]
		options = [
			{
				text = qs(0x245e5380)
				globals = [
					{
						set = cheat_autokick
						value = 2
					}
				]
			}
			{
				text = qs(0xedb840ca)
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
		name = 'GemColor'
		name_text = qs(0xcf42ec40)
		var = cheat_gemcolor
		unlock_pattern = [
			red
			red
			red
			blue
			blue
			blue
			yellow
			green
		]
		options = [
			{
				text = qs(0x58ffd51f)
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
				text = qs(0x44095183)
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
				text = qs(0x146f5382)
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
				text = qs(0x6d1051a3)
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
				text = qs(0x1845c87b)
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
				text = qs(0xf2a04722)
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
				text = qs(0x487c9800)
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
				text = qs(0xdb9218fe)
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
				text = qs(0x77a6b066)
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
				text = qs(0x4016bda6)
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
				text = qs(0xc40e1fd4)
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
				text = qs(0x4a640418)
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
				text = qs(0x4a2315ae)
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
			yellow
			blue
			red
			green
			yellow
			red
			green
			blue
		]
		options = [
			{
				text = qs(0xda874595)
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
				text = qs(0x7e96999a)
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
				text = qs(0x250c327f)
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
				text = qs(0x93cacad3)
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
				text = qs(0x3a529f48)
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
				text = qs(0x4035e7a3)
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
				text = qs(0x2c281a6e)
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
			green
			red
			green
			yellow
			green
			blue
			yellow
			red
		]
		options = [
			{
				text = qs(0x017cec58)
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
				text = qs(0x64b0088e)
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
			green
			blue
			red
			red
			yellow
			yellow
			blue
			blue
		]
		options = [
			{
				text = qs(0x83ad7a92)
				globals = [
					{
						set = cheat_vocalfireball
						value = 1
					}
				]
			}
			{
				text = qs(0xd807e01b)
				globals = [
					{
						set = cheat_vocalfireball
						value = 2
					}
				]
			}
		]
	}
	{
		name = 'Line6Unlock'
		name_text = qs(0x32152a01)
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
				text = qs(0x32152a01)
				globals = [
					{
						set = cheat_line6unlock
						value = 1
					}
				]
			}
		]
	}
]
guitar_hero_hidden_cheats = [
	{
		name = 'SuperUser'
		name_text = qs(0x93a6ae81)
		var = cheat_superuser
		unlock_pattern = [
			blue
			blue
			yellow
			yellow
			red
			red
			green
			green
		]
		global = cheat_superuser
		value = 1
	}
]
ui_cheats_settings = {
}
ui_cheats_do_anim = 0

script ui_create_options_cheats 
	getarraysize ($guitar_hero_cheats)
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
	createscreenelement {
		parent = root_window
		id = cheatsinterface
		type = descinterface
		desc = 'new_cheat'
		pos_anchor = [left top]
		pos = (0.0, 0.0)
		new_cheat_alpha = 0.0
		exclusive_device = ($primary_controller)
	}
	if cheatsinterface :desc_resolvealias \{name = alias_menu}
		assignalias id = <resolved_id> alias = current_menu
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
	endif
	bx_createhighlightstars \{parent = cheatsinterface
		focuswaittime = 2}
	cheatsinterface :obj_spawnscriptnow \{bg_swap}
	add_generic_menu_text_item \{text = qs(0xde232315)
		pad_choose_script = generic_event_choose
		pad_choose_params = {
			state = uistate_options_cheats_new
		}
		focus_script = ui_options_cheats_focus
		fix_width_for_cheats}
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
	getarraysize \{$guitar_hero_cheats}
	i = 0
	begin
	formattext checksumname = cheat_unlocked 'unlock_Cheat_%a' a = ($guitar_hero_cheats [<i>].name)
	if gotparam <cheat_unlocked>
		rgba = (($g_menu_colors).menu_gold)
		<text> = qs(0xb8a0b6b7)
		unlocked = 0
		toggle = 1
		pad_choose_script = ui_bonus_videos_negative_sfx
		item_height = 50
		if ((<...>.<cheat_unlocked>) > 0)
			if structurecontains structure = ($guitar_hero_cheats [<i>]) options
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
			else
				pad_choose_script = ($guitar_hero_cheats [<i>].unlock_script)
				text = ($guitar_hero_cheats [<i>].name_text)
			endif
			item_height = 100
			if structurecontains structure = ($guitar_hero_cheats [<i>]) not_toggle
				toggle = 0
				item_height = 50
			endif
			unlocked = 1
			removeparameter \{rgba}
		endif
		add_generic_menu_text_item {
			text = <text>
			pad_choose_script = <pad_choose_script>
			pad_choose_params = <pad_choose_params>
			focus_script = ui_options_cheats_focus
			forceautoscale = true
			fix_width_for_cheats
		}
		<item_container_id> :se_getparentid
		<item_container_id> :se_setprops {
			generic_menu_smenu_textitem_text_rgba = <rgba>
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
	bx_refreshmenuitemsindexes \{vmenu_id = current_menu}
	bx_cheat_setupscrollbar num_items = <num_items>
	menu_finish
	cheatsinterface :settags array_size = (<i>)
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

script bx_resizetextforcheats 
	if (<width> > 630)
		<id> :se_setprops {
			generic_menu_smenu_textitem_text_dims = (((0.0, 1.0) * <height>) + (630.0, 0.0))
			generic_menu_smenu_textitem_text_fit_width = `scale each line if larger`
			generic_menu_smenu_textitem_text_fit_height = `scale to fit`
			generic_menu_smenu_textitem_text_scale_mode = `per axis`
		}
	endif
endscript

script ui_destroy_options_cheats 
	destroyscreenelement \{id = cheatsinterface}
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
	printstruct \{a = $cheat_alwaysslide
		b = $cheat_autokick
		c = $cheat_freedrum}
	change \{ui_cheats_do_anim = 0}
	menu_start_transition
	if (($cheat_alwaysslide = 1) || ($cheat_autokick = 1) || ($cheat_freedrum = 1))
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
	se_setprops \{generic_menu_smenu_textitem_text_text = qs(0x03ac90f0)
		generic_menu_smenu_textitem_text_fit_width = `expand dims`
		generic_menu_smenu_textitem_text_dims = (0.0, 50.0)}
	se_setprops generic_menu_smenu_textitem_text_text = <text>
	se_getprops
	width = (<generic_menu_smenu_textitem_text_dims> [0])
	height = (<generic_menu_smenu_textitem_text_dims> [1])
	obj_getid
	bx_resizetextforcheats id = <objid> width = <width> height = <height>
	wait \{1
		gameframe}
	bx_focushighlightstarson_genericmenu objid = <text_id>
	exclude_option option_struct = <option_struct>
	refresh_autokick_cheat
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
	removeparameter \{var}
	<var> = ($guitar_hero_cheats [<idx>].var)
	if gotparam \{var}
		change globalname = <var> newvalue = 0
	endif
	<idx> = (<idx> + 1)
	repeat <array_size>
endscript

script cheat_turnoffalllocked 
	getarraysize \{$guitar_hero_cheats}
	<idx> = 0
	begin
	removeparameter \{var}
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
		if gotparam \{var}
			change globalname = <var> newvalue = 0
		endif
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
		removeparameter \{var}
		<var> = ($guitar_hero_cheats [<idx>].var)
		if gotparam \{var}
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
						setscreenelementprops id = {current_menu child = (<idx> + 1)} generic_menu_smenu_textitem_text_text = <text>
					endif
					globals = (<exclude_struct>.globals)
					cheat_set_globals globals = <globals>
				endif
				break
			endif
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
endscript

script disable_because_of_cheats 
	disable = 0
	count_players_by_part \{part = drum}
	if (<players_by_part> > 0)
		if ($cheat_freedrum = 1)
			disable = 1
		endif
	endif
	count_players_by_part \{part = guitar}
	gtrs_cnt = <players_by_part>
	count_players_by_part \{part = bass}
	gtrs_cnt = (<players_by_part> + <gtrs_cnt>)
	if (<gtrs_cnt> > 0)
		if ($cheat_alwaysslide = 1)
			disable = 1
		endif
	endif
	return cheat_disable = <disable>
endscript

script ui_options_cheats_focus 
	obj_getid
	gettags
	cheatsinterface :getsingletag \{array_size}
	if (<index> < 0)
		change \{ui_cheats_do_anim = 1}
	else
		change \{ui_cheats_do_anim = 0}
	endif
	bx_cheat_updatescrollbar bx_scrollbar_index = <bx_scrollbar_index>
	wait \{1
		gameframe}
	se_setprops generic_menu_smenu_textitem_text_rgba = (($g_menu_colors).menu_title)
	bx_focushighlightstarson_genericmenu objid = <text_id>
endscript

script ui_options_cheats_anim_out 
	if ($ui_cheats_do_anim = 1)
		if screenelementexists \{id = cheatsinterface}
			cheatsinterface :se_setprops \{cheat_snake_r_pos = (75.0, 0.0)
				cheat_snake_l_pos = (-75.0, 0.0)
				cheat_alpha = 0.0
				new_cheat_alpha = 1.0
				title_pos = (0.0, 140.0)
				time = 0.1}
			cheatsinterface :se_waitprops
		endif
		change \{ui_cheats_do_anim = 0}
	endif
endscript

script bx_cheat_setupscrollbar 
	if cheatsinterface :desc_resolvealias \{name = alias_scroll_container}
		scrollbar_id = <resolved_id>
		cheatsinterface :settags scrollbar_id = <scrollbar_id>
		if cheatsinterface :desc_resolvealias \{name = alias_scrollthumb}
			scrollbar_thumb_id = <resolved_id>
			if gotparam \{initial_alpha}
				init_alpha = {initial_alpha = <initial_alpha>}
			else
				init_alpha = {}
			endif
			if gotparam \{no_update}
				dont_update = {no_update}
			else
				dont_update = {}
			endif
			bx_setupscrollbar {
				id = <scrollbar_id>
				thumb_top_pos = (0.0, -8.0)
				thumb_bottom_pos = (0.0, 335.0)
				thumb_id = <scrollbar_thumb_id>
				num_items = <num_items>
				default_index = <default_index>
				<init_alpha>
				<dont_update>
			}
		endif
	endif
endscript

script bx_cheat_updatescrollbar 
	cheatsinterface :getsingletag \{scrollbar_id}
	if gotparam \{scrollbar_id}
		bx_updatescrollbar id = <scrollbar_id> bx_scrollbar_index = <bx_scrollbar_index>
	endif
endscript
