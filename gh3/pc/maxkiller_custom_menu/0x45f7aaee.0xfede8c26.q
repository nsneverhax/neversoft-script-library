0x1411d6ea = {
	create = 0xbd2588c5
	destroy = 0x2c75f021
	actions = [
		{
			action = go_back
			flow_state = 0x303ae628
			transition_left
		}
	]
}

script 0xbd2588c5 
	create_generic_backdrop
	createscreenelement {
		type = textelement
		parent = pause_menu
		id = 0x74e5eb27
		font = fontgrid_title_gh3
		scale = 0.8
		rgba = [255 128 64 250]
		text = "Orange button: Unlock and register selected setlist"
		z_priority = 100.0
		just = [left top]
		pos = (240.0, 600.0)
		dims = (800.0, 40.0)
	}
	createscreenelement {
		type = vscrollingmenu
		parent = pause_menu
		id = 0x8fd2217c
		just = [left top]
		dims = (400.0, 480.0)
		pos = (500.0, 100.0)
	}
	createscreenelement {
		type = vmenu
		parent = 0x8fd2217c
		id = 0x7b232f98
		pos = (0.0, 0.0)
		just = [left top]
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back ui_flow_manager_respond_to_action params = {action = go_back}}
		]
	}
	disable_pause
	0xfd5a01fe
	getarraysize $<buttons>
	i = 0
	begin
	formattext textname = 0x1c3c072c "%a: Unknown" a = ($<buttons> [<i>].0x22c16690)
	createscreenelement {
		type = textelement
		parent = 0x7b232f98
		id = ($<buttons> [<i>].button_id)
		font = fontgrid_title_gh3
		scale = 0.8
		rgba = [210 210 210 250]
		text = <0x1c3c072c>
		z_priority = 100.0
		just = [left top]
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose 0x4952abed params = {index = <i>}}
			{pad_left 0xddd21140 params = {index = <i>}}
			{pad_right 0x4952abed params = {index = <i>}}
			{pad_l1 0x4b5f6d39 params = {index = <i>}}
		]
	}
	<i> = (<i> + 1)
	repeat <array_size>
	0x777d051e
	launchevent {type = focus target = 0x7b232f98}
endscript

script 0x2c75f021 
	if screenelementexists {id = 0x8fd2217c}
		destroyscreenelement {id = 0x8fd2217c}
	endif
	if screenelementexists {id = 0x74e5eb27}
		destroyscreenelement {id = 0x74e5eb27}
	endif
	destroy_generic_backdrop
	enable_pause
endscript

script 0x180a59f0 
	0x608667a0
	0x61fae3b5 = ($<0x2d28a222> [<index>].tag)
	tier_global = ($<0x61fae3b5>.tier_global)
	progression_global = ($<0x61fae3b5>.progression_global)
	return tier_global = <tier_global> progression_global = <progression_global>
endscript
0x336627be = [
	{
		0x22c16690 = "Global"
		button_id = 0x092187f2
	}
	{
		0x22c16690 = "Single Career"
		button_id = 0x344a57db
	}
	{
		0x22c16690 = "Coop Career"
		button_id = 0x42af6ee6
	}
	{
		0x22c16690 = "Quickplay"
		button_id = 0x744df7b2
	}
	{
		0x22c16690 = "Multiplayer"
		button_id = 0xd12efa4d
	}
	{
		0x22c16690 = "Multiplayer Coop"
		button_id = 0xf5e2fffe
	}
	{
		0x22c16690 = "Bonus"
		button_id = 0x1f31bce5
	}
	{
		0x22c16690 = "Download"
		button_id = 0xaea2766e
	}
]
0x37fcdfa1 = [
	{
		tag = p1_career_progression
		text = "Single Career"
	}
	{
		tag = p2_career_progression
		text = "Coop Career"
	}
	{
		tag = bonus_progression
		text = "Bonus"
	}
	{
		tag = download_progression
		text = "Download"
	}
	{
		tag = general_progression
		text = "Quickplay"
	}
	{
		tag = generalp2_progression
		text = "Multiplayer"
	}
	{
		tag = p2_coop_progression
		text = "Multiplayer Coop"
	}
	{
		tag = demo_progression_career
		text = "Demo Career"
	}
	{
		tag = demo_progression_coop
		text = "Demo Coop"
	}
	{
		tag = demo_progression_multiplayer
		text = "Demo Multiplayer"
	}
	{
		tag = demo_progression_quickplay
		text = "Demo Quickplay"
	}
]

script 0xddd21140 
	ui_menu_select_sfx
	0xf2679282 index = <index>
	if (<0xeec348e2> = -1)
		0x608667a0
		getarraysize ($<0x2d28a222>)
		<0xeec348e2> = <array_size>
	endif
	<0xeec348e2> = (<0xeec348e2> - 1)
	0x95d7ffe9 index = <index> 0xeec348e2 = <0xeec348e2>
	0x777d051e
endscript

script 0x4952abed 
	ui_menu_select_sfx
	0xf2679282 index = <index>
	<0xeec348e2> = (<0xeec348e2> + 1)
	0x608667a0
	getarraysize ($<0x2d28a222>)
	if (<0xeec348e2> >= <array_size>)
		<0xeec348e2> = -1
	endif
	0x95d7ffe9 index = <index> 0xeec348e2 = <0xeec348e2>
	0x777d051e
endscript

script 0x777d051e 
	0xfd5a01fe
	0x608667a0
	getarraysize $<buttons>
	i = 0
	begin
	0xf2679282 index = <i>
	if (<0xeec348e2> = -1)
		formattext textname = 0x1c3c072c "%a: No Force" a = ($<buttons> [<i>].0x22c16690)
	else
		formattext textname = 0x1c3c072c "%a: %b" a = ($<buttons> [<i>].0x22c16690) b = ($<0x2d28a222> [<0xeec348e2>].text)
	endif
	setscreenelementprops id = ($<buttons> [<i>].button_id) text = <0x1c3c072c>
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script 0xfd5a01fe 
	if 0x96d3e8e1
		return buttons = 0xb6031766
	else
		return buttons = 0x336627be
	endif
endscript

script 0x608667a0 
	if 0x96d3e8e1
		return 0x2d28a222 = 0xb299ef79
	else
		return 0x2d28a222 = 0x37fcdfa1
	endif
endscript
0xb6031766 = [
	{
		0x22c16690 = "Global"
		button_id = 0x092187f2
	}
	{
		0x22c16690 = "Single Career"
		button_id = 0x344a57db
	}
	{
		0x22c16690 = "Quickplay"
		button_id = 0x744df7b2
	}
	{
		0x22c16690 = "Bonus"
		button_id = 0x1f31bce5
	}
]
0xb299ef79 = [
	{
		tag = p1_career_progression
		text = "Single Career"
	}
	{
		tag = general_progression
		text = "Quickplay"
	}
	{
		tag = bonus_progression
		text = "Bonus"
	}
	{
		tag = download_progression
		text = "Download"
	}
	{
		tag = demo_progression_career
		text = "Demo Career"
	}
	{
		tag = demo_progression_coop
		text = "Demo Coop"
	}
	{
		tag = demo_progression_multiplayer
		text = "Demo Multiplayer"
	}
	{
		tag = demo_progression_quickplay
		text = "Demo Quickplay"
	}
]

script 0xde6ebabd 
	if (($<setlist>.num_tiers) != 0)
		0xde5f1042 = 0
		begin
		formattext checksumname = tier_checksum '%ptier%i' p = ($<setlist>.prefix) i = (<0xde5f1042> + 1)
		0x1e5afd34 <tier_checksum> params = {unlocked = 1 complete = 1
			encore_unlocked = 1
			boss_unlocked = 1
			num_songs_to_progress = 0}
		formattext checksumname = 0x8349647b 'tier%s' s = (<0xde5f1042> + 1)
		getarraysize ($<setlist>.<0x8349647b>.songs)
		if (<array_size> != 0)
			0xc92c6969 = 0
			begin
			formattext checksumname = song_checksum '%p_song%i_tier%s' p = ($<setlist>.prefix) i = (<0xc92c6969> + 1) s = (<0xde5f1042> + 1) addtostringlookup = true
			0x1e5afd34 <song_checksum> params = {unlocked = 1}
			0x1e5afd34 ($<setlist>.<0x8349647b>.songs [<0xc92c6969>]) params = {unlocked = 1}
			<0xc92c6969> = (<0xc92c6969> + 1)
			repeat <array_size>
		endif
		<0xde5f1042> = (<0xde5f1042> + 1)
		repeat ($<setlist>.num_tiers)
	endif
endscript

script 0x4b5f6d39 
	0xf2679282 index = <index>
	if (<0xeec348e2> != -1)
		ui_menu_select_sfx
		0x180a59f0 index = <0xeec348e2>
		0xde6ebabd setlist = <tier_global>
	endif
endscript

script 0xf2679282 
	0xeec348e2 = -1
	formattext checksumname = 0xb3bde5a6 'custom_menu_setlist_switcher_force_index_%a' a = <index>
	getglobaltags <0xb3bde5a6> noassert = 1
	return 0xeec348e2 = <0xeec348e2>
endscript

script 0x95d7ffe9 
	formattext checksumname = 0xb3bde5a6 'custom_menu_setlist_switcher_force_index_%a' a = <index>
	0x1e5afd34 <0xb3bde5a6> params = {0xeec348e2 = <0xeec348e2>}
endscript
