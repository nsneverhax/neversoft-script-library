
script 0xd962fd79 
	create_generic_backdrop
	createscreenelement {
		type = vscrollingmenu
		parent = pause_menu
		id = 0xb8e5e1f6
		just = [left top]
		dims = (400.0, 480.0)
		pos = (200.0, 10.0)
	}
	createscreenelement {
		type = vmenu
		parent = 0xb8e5e1f6
		id = 0x67423075
		pos = (0.0, 0.0)
		just = [left top]
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back ui_flow_manager_respond_to_action params = {action = go_back}}
		]
	}
	disable_pause
	createscreenelement {
		type = textelement
		parent = 0x67423075
		font = fontgrid_title_gh3
		scale = 0.8
		rgba = [210 210 210 250]
		text = "Disable GFX"
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose 0x07479fd8}
		]
	}
	createscreenelement {
		type = textelement
		parent = 0x67423075
		font = fontgrid_title_gh3
		scale = 0.8
		rgba = [210 210 210 250]
		text = "Enable GFX"
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose 0xcf6e488e}
		]
	}
	createscreenelement {
		type = textelement
		parent = 0x67423075
		id = 0x19944b2e
		font = fontgrid_title_gh3
		scale = 0.8
		rgba = [210 210 210 250]
		text = "Force Venue: Unknown"
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose 0xb31cc62c}
			{pad_right 0xb31cc62c}
			{pad_left 0xadf582f0}
		]
	}
	createscreenelement {
		type = textelement
		parent = 0x67423075
		id = 0x3651b743
		font = fontgrid_title_gh3
		scale = 0.8
		rgba = [210 210 210 250]
		text = "Band: Unknown"
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose 0x683a6b28}
		]
	}
	createscreenelement {
		type = textelement
		parent = 0x67423075
		id = 0xfe4dee3f
		font = fontgrid_title_gh3
		scale = 0.8
		rgba = [210 210 210 250]
		text = "Highway: Unknown"
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose 0xb75294f1}
		]
	}
	createscreenelement {
		type = textelement
		parent = 0x67423075
		id = 0xa81f1b17
		font = fontgrid_title_gh3
		scale = 0.8
		rgba = [210 210 210 250]
		text = "Real Crowd: Unknown"
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose 0xcfa4512d}
		]
	}
	createscreenelement {
		type = textelement
		parent = 0x67423075
		id = 0x32114ef4
		font = fontgrid_title_gh3
		scale = 0.8
		rgba = [210 210 210 250]
		text = "Stage: Unknown"
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose 0xc510cdba}
		]
	}
	createscreenelement {
		type = textelement
		parent = 0x67423075
		id = 0x31d4172b
		font = fontgrid_title_gh3
		scale = 0.8
		rgba = [210 210 210 250]
		text = "Stage Crew: Unknown"
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose 0xce1edec9}
		]
	}
	0xc73001ba
	launchevent {type = focus target = 0x67423075}
endscript

script 0x07479fd8 
	0x7f452bef
	0x13e89e06 0x6570b23c = <0x9fbd91f2>
	0x2fce367a 0x7462b0d9 = 0
	if NOT 0x96d3e8e1
		0x6daf7b74 highway_visible = 0
	endif
	0x32b0e91e 0xf4caa880 = 0
	0x4032093f 0x0fb657eb = 0
	0x330a66fa 0xf5702764 = 0
	0xc73001ba
endscript

script 0xcf6e488e 
	0x13e89e06 0x6570b23c = -1
	0x2fce367a 0x7462b0d9 = 1
	0x6daf7b74 highway_visible = 1
	0x32b0e91e 0xf4caa880 = 1
	0x4032093f 0x0fb657eb = 1
	0x330a66fa 0xf5702764 = 1
	0xc73001ba
endscript

script 0x683a6b28 
	0x0ba8765b
	0x2fce367a 0x7462b0d9 = (1 - <0x7462b0d9>)
	0xc73001ba
endscript

script 0xb75294f1 
	0x0088dcef
	0x6daf7b74 highway_visible = (1 - <highway_visible>)
	0xc73001ba
endscript

script 0xadf582f0 
	0xc9ef96bb
	get_levelzonearray_size
	if (<0x6570b23c> = -1)
		<0x6570b23c> = <array_size>
	endif
	<0x6570b23c> = (<0x6570b23c> - 1)
	0x13e89e06 0x6570b23c = <0x6570b23c>
	0xc73001ba
endscript

script 0x1ca6b4ca 
	if screenelementexists {id = 0xb8e5e1f6}
		destroyscreenelement {id = 0xb8e5e1f6}
	endif
	destroy_generic_backdrop
	kill_gem_scroller
	enable_pause
endscript

script 0xb31cc62c 
	0xc9ef96bb
	<0x6570b23c> = (<0x6570b23c> + 1)
	get_levelzonearray_size
	if (<0x6570b23c> >= <array_size>)
		<0x6570b23c> = -1
	endif
	0x13e89e06 0x6570b23c = <0x6570b23c>
	0xc73001ba
endscript

script 0xc73001ba 
	0x1055ab9d
	0xc9ef96bb
	if (<0x6570b23c> = -1)
		setscreenelementprops id = 0x19944b2e text = "Force Venue: Disabled"
		select_venue level = viewer norestart
		disable_pause
	else
		get_levelzonearray_checksum index = <0x6570b23c>
		formattext textname = 0xc2de70a6 "Force Venue: %a" a = ($levelzones.<level_checksum>.title)
		setscreenelementprops id = 0x19944b2e text = <0xc2de70a6>
		select_venue level = <level_checksum> norestart
		disable_pause
	endif
	0x0ba8765b
	if (<0x7462b0d9> = 1)
		setscreenelementprops id = 0x3651b743 text = "Band: Visible"
	else
		setscreenelementprops id = 0x3651b743 text = "Band: Not Visible"
	endif
	0x0088dcef
	if (<highway_visible> = 1)
		setscreenelementprops id = 0xfe4dee3f text = "Highway: Visible"
	else
		setscreenelementprops id = 0xfe4dee3f text = "Highway: Not Visible"
	endif
	0x87ba2127
	if (<0xf4caa880> = 1)
		setscreenelementprops id = 0xa81f1b17 text = "Real Crowd: Visible"
	else
		setscreenelementprops id = 0xa81f1b17 text = "Real Crowd: Not Visible"
	endif
	0x0c7f7f21
	if (<0x0fb657eb>)
		setscreenelementprops id = 0x32114ef4 text = "Stage: Visible"
	else
		setscreenelementprops id = 0x32114ef4 text = "Stage: Not Visible"
	endif
	0x8600aec3
	if (<0xf5702764> = 1)
		setscreenelementprops id = 0x31d4172b text = "Stage Crew: Visible"
	else
		setscreenelementprops id = 0x31d4172b text = "Stage Crew: Not Visible"
	endif
endscript
0xa060c819 = {
	create = 0xd962fd79
	destroy = 0x1ca6b4ca
	actions = [
		{
			action = go_back
			flow_state = 0x303ae628
			transition_left
		}
	]
}

script 0x7f452bef 
	if 0x96d3e8e1
		return 0x9fbd91f2 = 6
	else
		return 0x9fbd91f2 = 8
	endif
endscript

script 0x13e89e06 
	0x1e5afd34 $0x48930a91 params = {0x6570b23c = <0x6570b23c>}
endscript

script 0xc9ef96bb 
	0x6570b23c = -1
	getglobaltags $0x48930a91 noassert = 1
	get_levelzonearray_size
	if (<0x6570b23c> >= <array_size>)
		<0x6570b23c> = -1
	endif
	return 0x6570b23c = <0x6570b23c>
endscript
0x48930a91 = 0xfed2c1de

script 0x2fce367a 
	0x1e5afd34 $0x48930a91 params = {0x7462b0d9 = <0x7462b0d9>}
endscript

script 0x0ba8765b 
	0x7462b0d9 = 1
	getglobaltags $0x48930a91 noassert = 1
	return 0x7462b0d9 = <0x7462b0d9>
endscript

script 0x6daf7b74 
	0x1e5afd34 $0x48930a91 params = {highway_visible = <highway_visible>}
endscript

script 0x0088dcef 
	highway_visible = 1
	getglobaltags $0x48930a91 noassert = 1
	return highway_visible = <highway_visible>
endscript

script 0x32b0e91e 
	0x1e5afd34 $0x48930a91 params = {0xf4caa880 = <0xf4caa880>}
endscript

script 0x87ba2127 
	0xf4caa880 = 1
	getglobaltags $0x48930a91 noassert = 1
	return 0xf4caa880 = <0xf4caa880>
endscript

script 0x4032093f 
	0x1e5afd34 $0x48930a91 params = {0x0fb657eb = <0x0fb657eb>}
endscript

script 0x0c7f7f21 
	0x0fb657eb = 1
	getglobaltags $0x48930a91 noassert = 1
	return 0x0fb657eb = <0x0fb657eb>
endscript

script 0x330a66fa 
	0x1e5afd34 $0x48930a91 params = {0xf5702764 = <0xf5702764>}
endscript

script 0x8600aec3 
	0xf5702764 = 1
	getglobaltags $0x48930a91 noassert = 1
	return 0xf5702764 = <0xf5702764>
endscript

script 0x1055ab9d 
	0x0ba8765b
	if (<0x7462b0d9> = 0)
		0x781ed94c = off
	else
		0x781ed94c = on
	endif
	change bandvisible = <0x781ed94c>
	0x0088dcef
	if (<highway_visible> = 0)
		0x57aba4f4 = off
	else
		0x57aba4f4 = on
	endif
	change highwayvisible = <0x57aba4f4>
	0x87ba2127
	if (<0xf4caa880> = 0)
		0x5748de6d = off
	else
		0x5748de6d = on
	endif
	setarrayelement arrayname = hidebytype_visible globalarray index = 0 newvalue = <0x5748de6d>
	0x0c7f7f21
	if (<0x0fb657eb> = 0)
		0xac1287ec = off
	else
		0xac1287ec = on
	endif
	setarrayelement arrayname = hidebytype_visible globalarray index = 1 newvalue = <0xac1287ec>
	0x8600aec3
	if (<0xf5702764> = 0)
		0x8d11221b = off
	else
		0x8d11221b = on
	endif
	setarrayelement arrayname = hidebytype_visible globalarray index = 2 newvalue = <0x8d11221b>
	set_hidebytype
endscript

script 0xcfa4512d 
	0x87ba2127
	0x32b0e91e 0xf4caa880 = (1 - <0xf4caa880>)
	0xc73001ba
endscript

script 0xc510cdba 
	0x0c7f7f21
	0x4032093f 0x0fb657eb = (1 - <0x0fb657eb>)
	0xc73001ba
endscript

script 0xce1edec9 
	0x8600aec3
	0x330a66fa 0xf5702764 = (1 - <0xf5702764>)
	0xc73001ba
endscript
