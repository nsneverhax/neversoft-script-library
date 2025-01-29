0xf8aac4ed = -1
0xa53d906e = 0
0x81bfdc7e = -1
0xdb92eeef = 0
0x07522fb3 = [
	230
	230
	230
	255
]
0xd8de2537 = [
	203
	151
	51
	255
]
0x667fdc5b = [
	203
	151
	51
	255
]
0x743e7c6a = [
	55
	55
	55
	255
]

script 0xf2d3e5f3 
	frontend_load_soundcheck
	cas_free_resources_camera_fix \{base_name = 'band_hub'
		alwaysfix}
	0xc30968ab
	0x63cba909
	0x6b650292
	0x3dd7e2c1 mode = <mode>
	destroy_loading_screen
	if ($menu_music_on_flag = 0)
		SpawnScriptNow \{menu_music_on_spawned}
	endif
	SpawnScriptLater \{0x647c20cc}
	return
endscript

script 0x647c20cc 
	Wait \{1
		gameframe}
	0x23fc9d2c :SetProps \{replace_handlers
		event_handlers = [
			{
				pad_up
				0x89f9a306
				params = {
					event_id = 1
				}
			}
			{
				pad_down
				0x89f9a306
				params = {
					event_id = 2
				}
			}
			{
				pad_choose
				0x89f9a306
				params = {
					event_id = 3
				}
			}
			{
				pad_back
				0x89f9a306
				params = {
					event_id = 4
				}
			}
			{
				pad_option2
				0x89f9a306
				params = {
					event_id = 5
				}
			}
			{
				pad_option
				0x89f9a306
				params = {
					event_id = 6
				}
			}
			{
				pad_start
				0x89f9a306
				params = {
					event_id = 8
				}
			}
		]}
endscript

script 0x981ef6bf 
	0xf58f6324
	if GotParam \{0xb4e99147}
		cas_destroy_all_characters
	endif
	if ScreenElementExists \{id = 0x23fc9d2c}
		0x23fc9d2c :GetSingleTag \{menus}
		GetArraySize <menus>
		i = 0
		begin
		if NOT GotParam \{0xb4e99147}
			0xe41bfcc2 menu_index = <i>
			if (<rocker_id> = None)
				cas_queue_kill_player Player = (<i> + 1)
			else
				get_musician_profile_struct_by_id id = <rocker_id> savegame = 0
				cas_queue_add_request appearance = (<profile_struct>.appearance) Player = (<i> + 1)
			endif
		endif
		i = (<i> + 1)
		repeat <array_Size>
		i = 0
		begin
		0x098ed7d6 menu_index = <i>
		i = (<i> + 1)
		repeat <array_Size>
		0x23fc9d2c :Die
	endif
	generic_ui_destroy
endscript

script 0x63cba909 
	cas_set_object_node_pos \{Player = 1
		node = z_soundcheck_trg_waypoint_player1_start}
	cas_set_object_node_pos \{Player = 2
		node = z_soundcheck_trg_waypoint_player2_start}
	cas_set_object_node_pos \{Player = 3
		node = z_soundcheck_trg_waypoint_player3_start}
	cas_set_object_node_pos \{Player = 4
		node = z_soundcheck_trg_waypoint_player4_start}
	gamemode_gettype
	if (<Type> = faceoff || <Type> = pro_faceoff || <Type> = battle)
		cas_set_object_node_pos \{Player = 2
			node = z_soundcheck_trg_waypoint_player4_start}
	endif
endscript

script 0xc30968ab 
	if NOT ScreenElementExists \{id = 0x23fc9d2c}
		SetScreenElementProps \{id = root_window
			event_handlers = [
			]
			replace_handlers}
		CreateScreenElement \{id = 0x23fc9d2c
			Type = descinterface
			parent = root_window
			desc = 'band_play'}
		LaunchEvent \{Type = focus
			target = 0x23fc9d2c}
		menu_array = []
		desc_array = []
		if NOT 0x23fc9d2c :desc_resolvealias \{Name = alias_hmenu}
			0x93d8d5cf \{'Unable to find the hmenu structure within the band_play ui descriptor'}
		endif
		band_hmenu = <resolved_id>
		<band_hmenu> :se_setprops Scale = (0.9, 1.0)
		i = 0
		begin
		ResolveScreenElementID id = [
			{id = <band_hmenu>}
			{index = <i>}
		]
		<resolved_id> :se_setprops reposition_pos = (0.0, 500.0)
		<resolved_id> :se_waitprops
		AddArrayElement array = <desc_array> element = <resolved_id>
		desc_array = <array>
		if NOT <resolved_id> :desc_resolvealias Name = alias_menu
			0x93d8d5cf \{'Unable to find the alias_menu structure within the band_hmenu ui descriptor'}
		endif
		<resolved_id> :SetTags {
			menu = join
			0xc4c72650 = None
		}
		AddArrayElement array = <menu_array> element = <resolved_id>
		menu_array = <array>
		i = (<i> + 1)
		repeat 4
		0x7b218542 \{part = guitar}
		GetArraySize \{0xe93a8721}
		0x23fc9d2c :SetTags {
			menus = <menu_array>
			descs = <desc_array>
			0xa66f59fe = 0
			0xe93a8721 = <0xe93a8721>
			0x46a803b9 = <array_Size>
		}
	endif
	return
endscript

script 0xba9c37d2 
	if NOT ScreenElementExists \{id = 0x23fc9d2c}
		0x93d8d5cf \{'qi must be initialized'}
	endif
	if NOT 0x23fc9d2c :GetSingleTag \{0xa66f59fe}
		0x93d8d5cf \{'cant find flag: headtohead.  is qi initialized?'}
	endif
	if (<0xa66f59fe> != 0)
		0x93d8d5cf \{'is head to head already initialized?'}
	endif
	if NOT 0x23fc9d2c :desc_resolvealias \{Name = alias_hmenu}
		0x93d8d5cf \{'cant find description alias: alias_hmenu'}
	endif
	band_hmenu = <resolved_id>
	<band_hmenu> :se_setprops spacing_between = 400
	i = 3
	begin
	ResolveScreenElementID id = [
		{id = <band_hmenu>}
		{index = <i>}
	]
	<resolved_id> :Die
	i = (<i> - 1)
	repeat 2
	Wait \{2
		gameframes}
	menu_array = []
	desc_array = []
	i = 0
	begin
	ResolveScreenElementID id = [
		{id = <band_hmenu>}
		{index = <i>}
	]
	AddArrayElement array = <desc_array> element = <resolved_id>
	desc_array = <array>
	if NOT <resolved_id> :desc_resolvealias Name = alias_menu
		0x93d8d5cf \{'Unable to find the alias_menu structure within the band_hmenu ui descriptor'}
	endif
	<resolved_id> :SetTags {
		menu = join
		0xc4c72650 = None
	}
	AddArrayElement array = <menu_array> element = <resolved_id>
	menu_array = <array>
	i = (<i> + 1)
	repeat 2
	0x23fc9d2c :SetTags {
		menus = <menu_array>
		descs = <desc_array>
		0xa66f59fe = 1
	}
endscript

script 0x098ed7d6 
	if NOT GotParam \{menu_index}
		return
		0x93d8d5cf \{'qi_create_menu needs argument: menu_index'}
	endif
	0x23fc9d2c :GetSingleTag \{menus}
	GetArraySize <menus>
	if (<menu_index> < 0 || <menu_index> >= <array_Size>)
		return
		0x93d8d5cf 'Illegal menu_index: %i  array_size: %s' i = <menu_index> s = <array_Size>
	endif
	current_menu = (<menus> [<menu_index>])
	0x931b6ce7 menu_index = <menu_index>
	0x7a32bb4f menu_index = <menu_index> 0x74f1b510
	if NOT GotParam \{0x80f7c4fa}
		0xefdfd1df menu_index = <menu_index>
	endif
	<current_menu> :Obj_SpawnScriptNow 0x1860d142 params = {0xb66264f5 = <0xb66264f5>}
	return
endscript

script 0x1860d142 
	Obj_GetID
	DestroyScreenElement id = <objID> preserve_parent
	if GotParam \{0xb66264f5}
		if NOT StructureContains structure = <0xb66264f5> Name = menu_name
			return
			0x93d8d5cf \{'menu_definition argument must contain: menu_name'}
		endif
		if NOT StructureContains structure = <0xb66264f5> Name = 0x97e4bd34
			return
			0x93d8d5cf \{'menu_definition argument must contain an array of elements (menu_elements)'}
		endif
		menu_name = (<0xb66264f5>.menu_name)
		0x97e4bd34 = (<0xb66264f5>.0x97e4bd34)
		GetArraySize <0x97e4bd34>
		text_scale = 0.6
		if (<array_Size> = 5)
			text_scale = 0.5
		elseif (<array_Size> = 6)
			text_scale = 0.4
		endif
		i = 0
		begin
		0x14b22443 = (<0x97e4bd34> [<i>])
		if NOT StructureContains structure = <0x14b22443> Name = text
			0x93d8d5cf 'current_element (%i) must contain a text element' i = <i>
		endif
		element_text = (<0x14b22443>.text)
		formatText TextName = element_id '%n%i' n = <menu_name> i = <i>
		CreateScreenElement {
			id = <element_id>
			Type = TextBlockElement
			fit_width = `scale	each	line	if	larger`
			fit_height = `scale	down	if	larger`
			parent = <objID>
			text = <element_text>
			font = fontgrid_bordello
			dims = (250.0, 30.0)
			rgba = $0xd8de2537
			internal_scale = <text_scale>
			just = [center bottom]
			internal_just = [center center]
			allow_expansion
			Shadow
			shadow_rgba = $UI_text_shadow_color
			shadow_offs = (3.0, 3.0)
		}
		i = (<i> + 1)
		repeat <array_Size>
		<objID> :SetTags {menu_name = <menu_name>}
	endif
	return
endscript

script 0x6b650292 
	if NOT ScreenElementExists \{id = 0x23fc9d2c}
		return
		0x93d8d5cf \{'qi must be initialized'}
	endif
	0x23fc9d2c :GetSingleTag \{descs}
	index = 0
	begin
	current_desc = (<descs> [<index>])
	<current_desc> :obj_spawnscript 0x6e4c6774
	<current_desc> :obj_spawnscript 0x7868a6f6
	index = (<index> + 1)
	repeat 4
	return
endscript

script 0x6e4c6774 
	if NOT desc_resolvealias \{Name = alias_highlight}
		return
		0x93d8d5cf \{'Cant find alias_highlight.'}
	endif
	if NOT GetScreenElementChildren id = <resolved_id>
		return
		0x93d8d5cf \{'No children found?  Highlight needs children to animate.'}
	endif
	Scale = (1.0, 1.0)
	screenelementpos = (0.0, 300.0)
	<resolved_id> :se_setprops Pos = <screenelementpos> Scale = <Scale>
	<resolved_id> :se_waitprops
	<resolved_id> :se_setprops rgba = [0 0 0 255]
	<resolved_id> :se_waitprops
	GetArraySize <children>
	current_index = 0
	begin
	(<children> [(<current_index>)]) :se_setprops alpha = 0.0
	GetRandomValue Name = 0x79819557 a = 0 b = (<array_Size> - 2) integer
	Mod a = (<current_index> + <0x79819557> + 1) b = <array_Size>
	current_index = <Mod>
	current_highlight = (<children> [<Mod>])
	<current_highlight> :se_setprops alpha = 1.0
	if ((Random (@ 0 @ 1 )) = 0)
		<current_highlight> :se_setprops flip_v = true
	else
		<current_highlight> :se_setprops flip_v = FALSE
	endif
	if ((Random (@ 0 @ 1 )) = 0)
		<current_highlight> :se_setprops flip_h = true
	else
		<current_highlight> :se_setprops flip_h = FALSE
	endif
	Wait \{0.1
		Second}
	repeat
endscript

script 0x7868a6f6 
	if NOT desc_resolvealias \{Name = alias_ready_banner}
		return
		0x93d8d5cf \{'Cant find alias_ready_banner.'}
	endif
	if NOT GetScreenElementChildren id = <resolved_id>
		return
		0x93d8d5cf \{'No children found?  Highlight needs children to animate.'}
	endif
	GetArraySize <children>
	current_index = 0
	begin
	(<children> [(<current_index>)]) :se_setprops alpha = 0.0
	GetRandomValue Name = 0x79819557 a = 0 b = (<array_Size> - 2) integer
	Mod a = (<current_index> + <0x79819557> + 1) b = <array_Size>
	current_index = <Mod>
	current_highlight = (<children> [<Mod>])
	<current_highlight> :se_setprops alpha = 1.0
	if ((Random (@ 0 @ 1 )) = 0)
		<current_highlight> :se_setprops flip_v = true
	else
		<current_highlight> :se_setprops flip_v = FALSE
	endif
	if ((Random (@ 0 @ 1 )) = 0)
		<current_highlight> :se_setprops flip_h = true
	else
		<current_highlight> :se_setprops flip_h = FALSE
	endif
	Wait \{0.1
		Second}
	repeat
endscript

script 0xf9e618d3 
	if NOT GotParam \{menu_index}
		return
		0x93d8d5cf \{'need param: menu_index'}
	endif
	0x23fc9d2c :GetSingleTag \{descs}
	GetArraySize <descs>
	if (<menu_index> < 0 || <menu_index> >= <array_Size>)
		return
		0x93d8d5cf 'Illegal menu_index: %i  array_size: %s' i = <menu_index> s = <array_Size>
	endif
	current_desc = (<descs> [<menu_index>])
	0x098ed7d6 menu_index = <menu_index>
	<current_desc> :Obj_KillSpawnedScript Name = 0x93fc812a
	<current_desc> :Obj_KillSpawnedScript Name = 0xff353deb
	<current_desc> :Obj_SpawnScriptNow 0x93fc812a
endscript

script 0xefdfd1df 
	if NOT GotParam \{menu_index}
		return
		0x93d8d5cf \{'need param: menu_index'}
	endif
	0x23fc9d2c :GetSingleTag \{descs}
	GetArraySize <descs>
	if (<menu_index> < 0 || <menu_index> >= <array_Size>)
		return
		0x93d8d5cf 'Illegal menu_index: %i  array_size: %s' i = <menu_index> s = <array_Size>
	endif
	current_desc = (<descs> [<menu_index>])
	<current_desc> :Obj_KillSpawnedScript Name = 0x93fc812a
	<current_desc> :Obj_KillSpawnedScript Name = 0xff353deb
	<current_desc> :Obj_SpawnScriptNow 0xff353deb
endscript

script 0x93fc812a 
	Obj_GetID
	<objID> :se_setprops ready_banner_pos = (0.0, -80.0) time = 0.1 motion = ease_out
	<objID> :se_waitprops
	Wait \{0.1
		Second}
	<objID> :se_setprops ready_banner_scale = 1.2 time = 0.1 motion = ease_out
	<objID> :se_waitprops
	<objID> :se_setprops ready_banner_scale = 0.9 time = 0.1 motion = ease_in
	<objID> :se_waitprops
	<objID> :se_setprops ready_banner_scale = 1.1 time = 0.1 motion = ease_out
	<objID> :se_waitprops
	<objID> :se_setprops ready_banner_scale = 1.0 time = 0.1 motion = ease_in
endscript

script 0xff353deb 
	Obj_GetID
	<objID> :se_setprops ready_banner_pos = (0.0, 500.0) time = 0.1 motion = ease_in
	<objID> :se_waitprops
endscript

script 0x74a9dbcd 
	if NOT GotParam \{menu_index}
		return
		0x93d8d5cf \{'need param: menu_index'}
	endif
	0x23fc9d2c :GetSingleTag \{descs}
	GetArraySize <descs>
	if (<menu_index> < 0 || <menu_index> >= <array_Size>)
		return
		0x93d8d5cf 'Illegal menu_index: %i  array_size: %s' i = <menu_index> s = <array_Size>
	endif
	current_desc = (<descs> [<menu_index>])
	<current_desc> :Obj_KillSpawnedScript Name = 0x7b3d6e40
	<current_desc> :Obj_SpawnScriptNow 0x7b3d6e40
endscript

script 0xda8ff095 
	if NOT GotParam \{menu_index}
		return
		0x93d8d5cf \{'need param: menu_index'}
	endif
	0x23fc9d2c :GetSingleTag \{descs}
	GetArraySize <descs>
	if (<menu_index> < 0 || <menu_index> >= <array_Size>)
		return
		0x93d8d5cf 'Illegal menu_index: %i  array_size: %s' i = <menu_index> s = <array_Size>
	endif
	current_desc = (<descs> [<menu_index>])
	<current_desc> :Obj_KillSpawnedScript Name = 0x7b3d6e40
	<current_desc> :Obj_SpawnScriptNow 0x7b3d6e40 params = {Hide}
endscript

script 0x7b3d6e40 
	Obj_GetID
	if GotParam \{Hide}
		<objID> :se_setprops reposition_pos = (0.0, 500.0) time = 0.1 motion = ease_in
	else
		<objID> :se_setprops reposition_pos = (0.0, 0.0) time = 0.1 motion = ease_out
	endif
	<objID> :se_waitprops
endscript

script 0xda68b2d3 
	if NOT GotParam \{menu_index}
		return
		0x93d8d5cf \{'need param: menu_index'}
	endif
	0x23fc9d2c :GetSingleTag \{descs}
	GetArraySize <descs>
	if (<menu_index> < 0 || <menu_index> >= <array_Size>)
		return
		0x93d8d5cf 'Illegal menu_index: %i  array_size: %s' i = <menu_index> s = <array_Size>
	endif
	current_desc = (<descs> [<menu_index>])
	if GotParam \{show}
		buttonchar = qs(0xac29f74c)
		buttonchar = qs(0xf44ae71a)
		if IsGuitarController controller = <menu_index>
			buttonchar = qs(0x9026221e)
		elseif isdrumcontroller controller = <menu_index>
			buttonchar = qs(0x0433a81f)
		endif
		join_text = (<buttonchar> + qs(0x7202e05d))
		<current_desc> :se_setprops join_text = <join_text>
	else
		<current_desc> :se_setprops join_text = qs(0x03ac90f0)
	endif
endscript

script 0x29b4ea99 
	if NOT GotParam \{menu_index}
		return
		0x93d8d5cf \{'Cant find param: menu_index'}
	endif
	if NOT GotParam \{0xbbaeec67}
		return
		0x93d8d5cf \{'Cant find param: element_index'}
	endif
	0x23fc9d2c :GetSingleTag \{menus}
	GetArraySize <menus>
	if (<menu_index> < 0 || <menu_index> >= <array_Size>)
		return
		0x93d8d5cf 'Illegal menu_index (menus): %i  array_size: %s' i = <menu_index> s = <array_Size>
	endif
	current_menu = (<menus> [<menu_index>])
	GetScreenElementChildren id = <current_menu>
	if NOT GotParam \{children}
		return
		0x93d8d5cf 'Trying to manipulate child (%e) when no children exist!' e = <0xbbaeec67>
	endif
	GetArraySize <children>
	if (<0xbbaeec67> < 0 || <0xbbaeec67> >= <array_Size>)
		return
		0x93d8d5cf 'Illegal menu_index: %i  array_size: %s' i = <0xbbaeec67> s = <array_Size>
	endif
	0x14b22443 = (<children> [<0xbbaeec67>])
	if GotParam \{disable}
		<0x14b22443> :SetTags {0x170c59d7 = 1}
		<0x14b22443> :SetProps rgba = $0x743e7c6a
	else
		<0x14b22443> :GetTags
		item_color = $0x667fdc5b
		if (GotParam 0xfe9b731c)
			if (<0xfe9b731c> = 1)
				item_color = (($g_menu_colors).menu_title)
			endif
		endif
		<0x14b22443> :SetTags {0x170c59d7 = 0}
		<0x14b22443> :SetProps rgba = <item_color>
	endif
	return
endscript

script 0x79ac86f3 \{offset = (0.0, 23.0)
		start_pos = (0.0, -122.0)
		0xbbaeec67 = -1}
	Wait \{1
		gameframes}
	Obj_GetID
	if NOT GotParam \{objID}
		return
		0x93d8d5cf \{'cant find the calling object?'}
	endif
	if NOT GotParam \{menu_index}
		return
		0x93d8d5cf \{'Cant find param: menu_index'}
	endif
	0x23fc9d2c :GetSingleTag \{menus}
	GetArraySize <menus>
	if (<menu_index> < 0 || <menu_index> >= <array_Size>)
		return
		0x93d8d5cf 'Illegal menu_index (menus): %i  array_size: %s' i = <menu_index> s = <array_Size>
	endif
	current_menu = (<menus> [<menu_index>])
	if (<0xbbaeec67> = -1)
		<objID> :se_setprops Pos = (0.0, 300.0)
	else
		GetScreenElementChildren id = <current_menu>
		if NOT GotParam \{children}
			return
			0x93d8d5cf 'Trying to focus child (%e) when no children exist!' e = <0xbbaeec67>
		endif
		GetArraySize <children>
		if (<0xbbaeec67> < 0 || <0xbbaeec67> >= <array_Size>)
			return
			0x93d8d5cf 'Illegal menu_index (elements): %i  array_size: %s' i = <0xbbaeec67> s = <array_Size>
		endif
		0x14b22443 = (<children> [<0xbbaeec67>])
		GetScreenElementDims id = <0x14b22443>
		Scale = (((0.9, 0.0) * (((<width> + 100.0) / 256.0))) + (0.0, 1.0))
		screenelementpos = (<start_pos> + (<offset> * <0xbbaeec67>))
		<objID> :se_setprops Pos = <screenelementpos> Scale = <Scale>
		<objID> :se_waitprops
		<objID> :se_setprops Pos = (<screenelementpos> + (0.0, -10.0)) time = 0.05
		<objID> :se_waitprops
		<objID> :se_setprops Pos = <screenelementpos> Scale = <Scale> time = 0.05
		<objID> :se_waitprops
	endif
endscript

script 0x931b6ce7 
	0x23fc9d2c :GetSingleTag \{descs}
	GetArraySize <descs>
	if (<menu_index> < 0 || <menu_index> >= <array_Size>)
		return
		0x93d8d5cf 'Illegal menu_index (descs): %i  array_size: %s' i = <menu_index> s = <array_Size>
	endif
	current_desc = (<descs> [<menu_index>])
	if <current_desc> :desc_resolvealias Name = alias_menu
		if (GetScreenElementChildren id = <resolved_id>)
			GetArraySize <children>
			counter = 0
			begin
			current_item = (<children> [<counter>])
			focus_color = (($g_menu_colors).menu_gold)
			<current_item> :GetTags
			<current_item> :se_setprops hiddenlocal = FALSE
			<current_item> :se_waitprops
			if GotParam \{0xbbaeec67}
				if (<0xbbaeec67> = <counter>)
					focus_color = (($g_menu_colors).menu_title)
					<current_item> :SetTags {0xfe9b731c = 1}
				else
					<current_item> :SetTags {0xfe9b731c = 0}
				endif
			elseif GotParam \{0xfe9b731c}
				if (<0xfe9b731c> = 1)
					focus_color = (($g_menu_colors).menu_title)
				endif
			endif
			0xee2eb70d = 1
			if GotParam \{0x170c59d7}
				if (<0x170c59d7> = 1)
					0xee2eb70d = 0
				endif
			endif
			if (<0xee2eb70d> = 1)
				<current_item> :se_setprops rgba = <focus_color>
				<current_item> :se_waitprops
			endif
			counter = (<counter> + 1)
			repeat <array_Size>
		endif
	endif
	return
endscript

script 0xf98ca72a 
	if NOT GotParam \{menu_index}
		return
		0x93d8d5cf \{'need param: menu_index'}
	endif
	0x23fc9d2c :GetSingleTag \{descs}
	GetArraySize \{descs}
	if (<menu_index> < 0 || <menu_index> >= <array_Size>)
		return
		0x93d8d5cf 'Illegal menu_index: %i  array_size: %s' i = <menu_index> s = <array_Size>
	endif
	if GotParam \{Hide}
		(<descs> [<menu_index>]) :se_setprops leader_indicator_alpha = 0.0
	else
		(<descs> [<menu_index>]) :se_setprops leader_indicator_alpha = 1.0
	endif
endscript

script 0x7dc4c295 \{instrument = -1}
	if NOT GotParam \{menu_index}
		return
		0x93d8d5cf \{'Must have param: menu_index'}
	endif
	0x23fc9d2c :GetSingleTag \{descs}
	GetArraySize \{descs}
	if (<menu_index> < 0 || <menu_index> >= <array_Size>)
		return
		0x93d8d5cf 'Illegal menu_index (%i) for array_size (%s)' i = <menu_index> s = <array_Size>
	endif
	switch <instrument>
		case 3
		instrument_checksum = logo_vocal
		case 2
		instrument_checksum = logo_drum
		case 1
		instrument_checksum = logo_bass
		case 0
		default
		instrument_checksum = logo_guitar
	endswitch
	if (<instrument> >= 0 && <instrument> < 4)
		instrument_alpha = 1.0
	else
		instrument_alpha = 0.0
	endif
	(<descs> [<menu_index>]) :se_setprops instrument_alpha = <instrument_alpha> instrument_texture = <instrument_checksum>
	return
endscript

script 0x2e06a6ea 
	if NOT GotParam \{menu_index}
		return
		0x93d8d5cf \{'need param: menu_index'}
	endif
	if NOT GotParam \{0x734dbcdd}
		0x734dbcdd = qs(0x00000000)
	endif
	0x23fc9d2c :GetSingleTag \{descs}
	GetArraySize \{descs}
	if ((<menu_index> < 0) || (<menu_index> >= <array_Size>))
		return
		0x93d8d5cf 'illegal menu_index (%i) in array size (%s)' i = <menu_index> s = <array_Size>
	endif
	current_desc = (<descs> [<menu_index>])
	<current_desc> :se_getprops
	if (<name_text> != <0x734dbcdd>)
		<current_desc> :Obj_KillSpawnedScript Name = 0xf7bd247f
		<current_desc> :se_setprops name_text = <0x734dbcdd> name_dims = (0.0, 40.0) namemenu_dims = (0.0, 40.0)
		<current_desc> :se_getprops
		X = ((248 - (<name_dims> [0])) / 2)
		<current_desc> :se_setprops name_pos = ((0.0, 20.0) + ((1.0, 0.0) * <X>))
		if ((<name_dims> [0]) >= 248)
			<current_desc> :Obj_SpawnScriptNow 0xf7bd247f
		endif
	endif
	return
endscript

script 0xf7bd247f 
	Wait \{2
		gameframes}
	se_getprops
	width = ((<namemenu_dims> [0]) + 100.0)
	Pos = ((0.5, 0.0) * <width>)
	time = (2.0 * (<width> / 500.0))
	begin
	se_setprops name_pos = {(-1.0 * <Pos>) relative} time = <time>
	Wait <time> Seconds ignoreslomo
	se_setprops name_pos = {<Pos> relative}
	repeat
endscript

script 0x944da186 
	if NOT GotParam \{menu_index}
		return
		0x93d8d5cf \{'need param: menu_index'}
	endif
	if NOT GotParam \{0x04646ef1}
		0x04646ef1 = qs(0x00000000)
	endif
	0x23fc9d2c :GetSingleTag \{descs}
	GetArraySize \{descs}
	if ((<menu_index> < 0) || (<menu_index> >= <array_Size>))
		return
		0x93d8d5cf 'illegal menu_index (%i) in array size (%s)' i = <menu_index> s = <array_Size>
	endif
	current_desc = (<descs> [<menu_index>])
	<current_desc> :se_getprops
	if (<gamertag_text> != <0x04646ef1>)
		<current_desc> :Obj_KillSpawnedScript Name = 0x9a6f1fe3
		<current_desc> :se_setprops gamertag_text = <0x04646ef1> gamertag_dims = (0.0, 40.0) gamertagmenu_dims = (0.0, 40.0)
		<current_desc> :se_getprops
		X = ((248 - (<gamertag_dims> [0])) / 2)
		<current_desc> :se_setprops gamertag_pos = ((0.0, -20.0) + ((1.0, 0.0) * <X>))
		if ((<gamertag_dims> [0]) >= 248)
			<current_desc> :Obj_SpawnScriptNow 0x9a6f1fe3
		endif
	endif
	return
endscript

script 0x9a6f1fe3 
	Wait \{2
		gameframes}
	se_getprops
	width = ((<gamertagmenu_dims> [0]) + 100)
	Pos = ((0.5, 0.0) * <width>)
	time = (2.0 * (<width> / 500.0))
	begin
	se_setprops gamertag_pos = {(-1.0 * <Pos>) relative} time = <time>
	Wait <time> Seconds ignoreslomo
	se_setprops gamertag_pos = {<Pos> relative}
	repeat
endscript

script 0xf58f6324 
	clean_up_user_control_helpers
	if GotParam \{select}
		add_user_control_helper \{all_buttons
			text = qs(0xc18d5e76)
			button = green
			z = 100000}
	endif
	if GotParam \{back}
		add_user_control_helper \{all_buttons
			text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
	endif
	if GotParam \{band_leader}
		add_user_control_helper \{all_buttons
			text = qs(0x6f9fb401)
			button = blue
			z = 100000}
	endif
	if GotParam \{continue}
		add_user_control_helper \{all_buttons
			text = qs(0x182f0173)
			button = start
			z = 100000}
	endif
	return
endscript

script 0x86c308c7 \{delay = 2}
	if NOT GotParam \{message}
		return
		0x93d8d5cf \{'Missing param: message'}
	endif
	ResolveScreenElementID \{id = [
			{
				id = 0x23fc9d2c
			}
			{
				local_id = band_menu_container
			}
			{
				local_id = online_ticker_window_element
			}
			{
				local_id = online_ticker_vert_text
			}
		]}
	if NOT GotParam \{resolved_id}
		return
		0x93d8d5cf \{'Cant find ticker'}
	endif
	<resolved_id> :se_getprops
	if (<text> != <message>)
		0x23fc9d2c :se_setprops \{online_ticker_window_element_alpha = 0.0
			time = 0.5}
		0x23fc9d2c :se_waitprops
		<resolved_id> :se_setprops dims = (800.0, 75.0) text = <message> alpha = 1.0
		<resolved_id> :se_waitprops
	endif
	0x23fc9d2c :se_setprops \{online_ticker_window_element_alpha = 1.0
		time = 0.5}
	0x23fc9d2c :se_waitprops
	Wait <delay> Second
	0x23fc9d2c :se_setprops \{online_ticker_window_element_alpha = 0.0
		time = 0.5}
	0x23fc9d2c :se_waitprops
	return
endscript

script 0x8bb957cd \{controller = 0}
	0x3694ef58 = qs(0x00000000)
	switch (<message_id>)
		case 0x310ad9c9
		0x3694ef58 = qs(0x1b9e496e)
		case 0xb925c87e
		0x3694ef58 = qs(0xce4db331)
		case 0x1afe4572
		user_control_helper_get_buttonchar button = start controller = <controller>
		formatText TextName = 0x3694ef58 qs(0x72f9ae62) b = <buttonchar>
		case more_players_needed
		0x3694ef58 = qs(0xf5f5bb37)
		case 0x15074ef0
		0x3694ef58 = qs(0xc8cc661c)
		case 0x6d57cd9e
		formatText \{TextName = 0x3694ef58
			qs(0x3220c43e)}
		case 0xce014b37
		formatText \{TextName = 0x3694ef58
			qs(0x149ff047)}
		case 0x19e3cb6f
		formatText \{TextName = 0x3694ef58
			qs(0x090ae390)}
		case 0x53dd4024
		formatText \{TextName = 0x3694ef58
			qs(0x59e198b5)}
		case has_guitar
		0x3694ef58 = qs(0x5a8163f8)
		case 0x019db780
		0x3694ef58 = qs(0x5b210181)
		case 0xc4c4ba50
		0x3694ef58 = qs(0xd679f884)
		case 0x4f07f25f
		0x3694ef58 = qs(0x2d14c74a)
		default
	endswitch
	return 0x3694ef58 = <0x3694ef58>
endscript

script 0x95ee358a 
	0x8bb957cd message_id = <message_id> controller = <controller>
	0x23fc9d2c :Obj_KillSpawnedScript \{Name = 0x86c308c7}
	0x23fc9d2c :Obj_SpawnScriptNow 0x86c308c7 params = {message = <0x3694ef58> delay = <delay>}
	return
endscript

script 0xccee9e29 
	SpawnScriptNow 0x948b7327 params = {menu_index = <menu_index>}
endscript

script 0x948b7327 
	if NOT GotParam \{menu_index}
		return
		0x93d8d5cf \{'need param: menu_index'}
	endif
	0x098ed7d6 menu_index = <menu_index>
	0x23fc9d2c :GetSingleTag \{menus}
	GetArraySize <menus>
	if (<menu_index> < 0 || <menu_index> >= <array_Size>)
		return
		0x93d8d5cf 'Illegal menu_index: %i  array_size: %s' i = <menu_index> s = <array_Size>
	endif
	current_menu = (<menus> [<menu_index>])
	<current_menu> :GetSingleTag 0xc4c72650
	if GotParam \{rocker_id}
		0xc4c72650 = <rocker_id>
	endif
	get_musician_profile_size \{savegame = 0}
	get_musician_profile_struct_by_id id = <0xc4c72650> savegame = 0
	character_id = (<profile_struct>.Name)
	get_car_photo_icon profile_struct = <profile_struct> character_id = <character_id> savegame = 0
	0x7a32bb4f menu_index = <menu_index> 0xaa2f352a
	CreateScreenElement {
		Type = descinterface
		desc = 'band_play_menu_char'
		parent = <current_menu>
		band_play_menu_char_icon_texture = <icon>
		just = [center bottom]
		dims = (80.0, 80.0)
	}
	return
endscript

script 0x41749df7 
	if NOT GotParam \{rocker_id}
		return
		0x93d8d5cf \{'need param: rocker_id'}
	endif
	if NOT GotParam \{menu_index}
		return
		0x93d8d5cf \{'need param: menu_index'}
	endif
	get_musician_profile_struct_by_id id = <rocker_id> savegame = 0
	if NOT GotParam \{profile_struct}
		return
		0x93d8d5cf 'unable to find rocker with rocker id: %r' r = <rocker_id>
	endif
	0x3abc240d rocker_id = <rocker_id> menu_index = <menu_index>
	0x23fc9d2c :GetSingleTag \{menus}
	GetArraySize <menus>
	if (<menu_index> < 0 || <menu_index> >= <array_Size>)
		return
		0x93d8d5cf 'Illegal menu_index: %i  array_size: %s' i = <menu_index> s = <array_Size>
	endif
	current_menu = (<menus> [<menu_index>])
	<current_menu> :Obj_KillSpawnedScript Name = 0x623496d8
	<current_menu> :Obj_SpawnScriptNow 0x623496d8 params = {delay = 0 appearance = (<profile_struct>.appearance) Player = (<menu_index> + 1)}
endscript

script 0x623496d8 \{delay = 1}
	if NOT GotParam \{appearance}
		return
		0x93d8d5cf \{'need param: appearance'}
	endif
	if NOT GotParam \{Player}
		return
		0x93d8d5cf \{'need param: player'}
	endif
	Wait <delay> Second
	cas_queue_add_request appearance = <appearance> Player = <Player>
endscript

script 0x3abc240d 
	if NOT GotParam \{rocker_id}
		return
		0x93d8d5cf \{'need param: rocker_id'}
	endif
	if NOT GotParam \{menu_index}
		return
		0x93d8d5cf \{'need param: menu_index'}
	endif
	0x23fc9d2c :GetSingleTag \{menus}
	GetArraySize <menus>
	if (<menu_index> < 0 || <menu_index> >= <array_Size>)
		return
		0x93d8d5cf 'Illegal menu_index: %i  array_size: %s' i = <menu_index> s = <array_Size>
	endif
	current_menu = (<menus> [<menu_index>])
	<current_menu> :SetTags {0xc4c72650 = <rocker_id>}
endscript

script 0xe41bfcc2 
	if NOT GotParam \{menu_index}
		return
		0x93d8d5cf \{'need param: menu_index'}
	endif
	0x23fc9d2c :GetSingleTag \{menus}
	GetArraySize <menus>
	if (<menu_index> < 0 || <menu_index> >= <array_Size>)
		return
		0x93d8d5cf 'Illegal menu_index: %i  array_size: %s' i = <menu_index> s = <array_Size>
	endif
	current_menu = (<menus> [<menu_index>])
	<current_menu> :GetSingleTag 0xc4c72650
	if NOT GotParam \{0xc4c72650}
		return
		0x93d8d5cf \{'cant find param: current_rocker_id  in current menu'}
	endif
	return rocker_id = <0xc4c72650>
endscript

script 0x90a5308e \{rocker_id = None
		delay = 0}
	if NOT GotParam \{menu_index}
		return
		0x93d8d5cf \{'need param: menu_index'}
	endif
	0x23fc9d2c :GetSingleTag \{menus}
	GetArraySize <menus>
	if (<menu_index> < 0 || <menu_index> >= <array_Size>)
		return
		0x93d8d5cf 'Illegal menu_index: %i  array_size: %s' i = <menu_index> s = <array_Size>
	endif
	current_menu = (<menus> [<menu_index>])
	<current_menu> :GetSingleTag 0xc4c72650
	if (<0xc4c72650> != <rocker_id>)
		<current_menu> :Obj_KillSpawnedScript Name = 0x623496d8
		if (<rocker_id> = None)
			cas_queue_kill_player Player = (<menu_index> + 1)
		endif
		0x2e06a6ea menu_index = <menu_index>
		0x3abc240d rocker_id = None menu_index = <menu_index>
	endif
	if (<rocker_id> != None)
		get_musician_profile_struct_by_id id = <rocker_id> savegame = 0
		if NOT GotParam \{profile_struct}
			return
			0x93d8d5cf 'rocker: %t  not found' t = <rocker_id>
		endif
		character_full_name = (<profile_struct>.fullname)
		0x2e06a6ea menu_index = <menu_index> 0x734dbcdd = <character_full_name>
		0x3abc240d rocker_id = <rocker_id> menu_index = <menu_index>
		<current_menu> :Obj_KillSpawnedScript Name = 0x623496d8
		<current_menu> :Obj_SpawnScriptNow 0x623496d8 params = {delay = <delay> appearance = (<profile_struct>.appearance) Player = (<menu_index> + 1)}
	endif
endscript

script 0x7b218542 
	if NOT GotParam \{part}
		0x93d8d5cf \{'need param: part'}
	endif
	get_musician_profile_size \{savegame = 0}
	0x892113ef = []
	Range = 0
	i = 0
	begin
	get_musician_profile_struct_by_index index = <i> savegame = 0
	if display_character_logic profile_struct = <profile_struct> savegame = 0 part = <part> bandplay 0x2f8e5ba4
		Range = (<Range> + 1)
		AddArrayElement array = <0x892113ef> element = (<profile_struct>.Name)
		0x892113ef = <array>
	endif
	i = (<i> + 1)
	repeat <array_Size>
	0x8dbdaee4 '%i unlocked, valid rockers to choose from' i = <Range>
	return 0xe93a8721 = <0x892113ef>
endscript

script 0x1a55bc3f 
	if NOT GotParam \{menu_index}
		return \{0x586b42cf = None}
		0x93d8d5cf \{'need param: menu_index'}
	endif
	if NOT GotParam \{0xc4c72650}
		return \{0x586b42cf = None}
		0x93d8d5cf \{'need param: current_rocker_id'}
	endif
	if NOT GotParam \{part}
		return \{0x586b42cf = None}
		0x93d8d5cf \{'need param: part'}
	endif
	0x23fc9d2c :GetSingleTag \{0xe93a8721}
	0x23fc9d2c :GetSingleTag \{0x46a803b9}
	i = 0
	begin
	if (<0xc4c72650> = (<0xe93a8721> [<i>]))
		break
	endif
	i = (<i> + 1)
	repeat <0x46a803b9>
	if (<i> < 0 || <i> >= <0x46a803b9>)
		return \{0x586b42cf = None}
		0x93d8d5cf 'profile not found in the array of selectable characters.  index: %i  valid_rocker_list_size: %s' i = <i> s = <0x46a803b9>
	endif
	0xe4eba106 = <i>
	if GotParam \{Increment}
		0xe4eba106 = (<0xe4eba106> + 1)
		Mod a = (<0x46a803b9> + <0xe4eba106>) b = <0x46a803b9>
		0xe4eba106 = <Mod>
		0x7a32bb4f params = {menu_index = <menu_index> down}
	elseif GotParam \{0x065242b0}
		0xe4eba106 = (<0xe4eba106> - 1)
		Mod a = (<0x46a803b9> + <0xe4eba106>) b = <0x46a803b9>
		0xe4eba106 = <Mod>
		0x7a32bb4f params = {menu_index = <menu_index> up}
	else
		return \{0x586b42cf = None}
		0x93d8d5cf \{'unhandled increment/decrement'}
	endif
	if (<0xe4eba106> < 0 || <0xe4eba106> >= <0x46a803b9>)
		return \{0x586b42cf = None}
		0x93d8d5cf 'Illegal next_rocker_index: %i  valid_rocker_list_size: %s' i = <0xe4eba106> s = <0x46a803b9>
	endif
	get_musician_profile_struct_by_id id = (<0xe93a8721> [<0xe4eba106>]) savegame = 0
	0x81f0e468 = (<profile_struct>.Name)
	0x948b7327 menu_index = <menu_index> rocker_id = <0x81f0e468>
	return 0x586b42cf = <0x81f0e468>
endscript

script 0x7f49a758 
	if NOT GotParam \{menu_index}
		return \{0xb6c55f94 = None}
		0x93d8d5cf \{'need param: menu_index'}
	endif
	if NOT GotParam \{0xd017ee55}
		return \{0xb6c55f94 = None}
		0x93d8d5cf \{'need param: exclude_id'}
	endif
	if NOT GotParam \{part}
		return \{0xb6c55f94 = None}
		0x93d8d5cf \{'need param: part'}
	endif
	0x23fc9d2c :GetSingleTag \{0xe93a8721}
	0x23fc9d2c :GetSingleTag \{0x46a803b9}
	0xc4d685d7 = -1
	i = 0
	begin
	0x6cc59b35 = (<0xe93a8721> [<i>])
	if (<0x6cc59b35> = <0xd017ee55>)
		0xc4d685d7 = <i>
	endif
	i = (<i> + 1)
	repeat <0x46a803b9>
	if (<0x46a803b9> < 2)
		return \{0xb6c55f94 = None}
		0x93d8d5cf \{'rocker list is hella tiny (handle it)'}
	endif
	Range = (<0x46a803b9> - 1)
	if (<0xc4d685d7> > -1)
		(<0x46a803b9> - 2)
	endif
	GetRandomValue Name = 0x33e4a1ec a = 0 b = <Range> integer
	rocker_id = (<0xe93a8721> [<0x33e4a1ec>])
	if (<0xd017ee55> = <rocker_id>)
		0x33e4a1ec = <Range>
		rocker_id = (<0xe93a8721> [<0x33e4a1ec>])
	endif
	return 0xb6c55f94 = <rocker_id>
endscript

script 0x7a32bb4f 
	if NOT GotParam \{menu_index}
		return
		0x93d8d5cf \{'need param: menu_index'}
	endif
	0x23fc9d2c :GetSingleTag \{descs}
	GetArraySize <descs>
	if (<menu_index> < 0 || <menu_index> >= <array_Size>)
		return
		0x93d8d5cf 'Illegal menu_index: %i  array_size: %s' i = <menu_index> s = <array_Size>
	endif
	current_desc = (<descs> [<menu_index>])
	<current_desc> :Obj_KillSpawnedScript Name = 0xfe450e75
	<current_desc> :Obj_SpawnScriptNow 0xfe450e75 params = {<...>}
endscript

script 0xfe450e75 
	Obj_GetID
	if GotParam \{0xaa2f352a}
		<objID> :se_setprops scroll_arrow_alpha = 1.0
	elseif GotParam \{0x74f1b510}
		<objID> :se_setprops scroll_arrow_alpha = 0.0
	endif
	0x5e655d4b = 0
	if GotParam \{up}
		<objID> :se_setprops name_arrow_up_scale = 1.0 time = 0.1
		0x5e655d4b = 1
	endif
	if GotParam \{down}
		<objID> :se_setprops name_arrow_down_scale = 1.0 time = 0.1
		0x5e655d4b = 1
	endif
	if (<0x5e655d4b> = 1)
		Wait \{0.1
			Second
			ignoreslomo}
	endif
	<objID> :se_setprops name_arrow_up_scale = 0.8 time = 0.1
	<objID> :se_setprops name_arrow_down_scale = 0.8 time = 0.1
	return
endscript

script 0x7fc24d06 
	0x8906069e = {
		menu_name = 'rocker'
		0x97e4bd34 = [
			{
				text = qs(0x095895d6)
			}
			{
				text = qs(0xebd11692)
			}
			{
				text = qs(0x7be2fdcb)
			}
		]
	}
	return menu = <0x8906069e>
endscript

script 0x68040a43 
	0x9777e44a = {
		menu_name = 'instrument'
		0x97e4bd34 = [
			{
				text = qs(0x9504b94a)
			}
			{
				text = qs(0x7d4f9214)
			}
			{
				text = qs(0x388cd3db)
			}
			{
				text = qs(0x1b9f6f84)
			}
		]
	}
	return menu = <0x9777e44a>
endscript

script 0x157884e8 
	0xea0b6ae1 = {
		menu_name = 'handedness'
		0x97e4bd34 = [
			{
				text = qs(0x7b0518c0)
			}
			{
				text = qs(0x2e9b1b43)
			}
		]
	}
	return menu = <0xea0b6ae1>
endscript

script 0x35bc6233 
	0x49381bea = {
		menu_name = 'vocaltext'
		0x97e4bd34 = [
			{
				text = qs(0x305014bd)
			}
			{
				text = qs(0x737839f5)
			}
		]
	}
	return menu = <0x49381bea>
endscript

script 0x68cc2d19 
	0x97bfc310 = {
		menu_name = 'difficulty'
		0x97e4bd34 = [
			{
				text = qs(0x74d6a0a0)
			}
			{
				text = qs(0x8d657387)
			}
			{
				text = qs(0x6ef11a01)
			}
			{
				text = qs(0x51b06d2f)
			}
			{
				text = qs(0x334908ac)
			}
		]
	}
	return menu = <0x97bfc310>
endscript

script 0x1d7b242a 
	0xe3585b2b = {
		menu_name = 'difficulty_plus'
		0x97e4bd34 = [
			{
				text = qs(0x74d6a0a0)
			}
			{
				text = qs(0x8d657387)
			}
			{
				text = qs(0x6ef11a01)
			}
			{
				text = qs(0x51b06d2f)
			}
			{
				text = qs(0x334908ac)
			}
			{
				text = qs(0x7a19b5f7)
			}
		]
	}
	return menu = <0xe3585b2b>
endscript

script 0x0724aede 
	0x97bfc310 = {
		menu_name = qs(0x3ff2155e)
		0x97e4bd34 = [
			{
				text = qs(0x8d657387)
			}
			{
				text = qs(0x6ef11a01)
			}
			{
				text = qs(0x51b06d2f)
			}
			{
				text = qs(0x334908ac)
			}
		]
	}
	return menu = <0x97bfc310>
endscript

script 0xfc36ff44 
	0xe3585b2b = {
		menu_name = qs(0x61658ea6)
		0x97e4bd34 = [
			{
				text = qs(0x8d657387)
			}
			{
				text = qs(0x6ef11a01)
			}
			{
				text = qs(0x51b06d2f)
			}
			{
				text = qs(0x334908ac)
			}
			{
				text = qs(0x7a19b5f7)
			}
		]
	}
	return menu = <0xe3585b2b>
endscript

script 0xd2893c9d 
	if NOT GotParam \{controller}
		0x93d8d5cf \{'need param: controller'}
	endif
	user_control_helper_get_buttonchar button = yellow controller = <controller>
	0x44f9b7d8 = {
		menu_name = 'add_vocalist'
		0x97e4bd34 = [
			{
				text = qs(0x00000000)
			}
			{
				text = qs(0x00000000)
			}
			{
				text = qs(0x00000000)
			}
			{
				text = qs(0x00000000)
			}
			{
				text = qs(0x00000000)
			}
			{
				text = (<buttonchar> + qs(0xcc207794))
			}
		]
	}
	menu = <0x44f9b7d8>
endscript

script 0x6b31782a 
	controller_text = qs(0x8bcc0ba3)
	if GotParam \{guitar}
		controller_text = qs(0x9504b94a)
	elseif GotParam \{drum}
		controller_text = qs(0x388cd3db)
	endif
	0x94429623 = {
		menu_name = 'disconnect'
		0x97e4bd34 = [
			{
				text = qs(0xcd188afe)
			}
			{
				text = qs(0x9691b59e)
			}
			{
				text = <controller_text>
			}
		]
	}
	return menu = <0x94429623>
endscript

script 0x3dd7e2c1 
	if NOT GotParam \{mode}
		0x93d8d5cf \{'need param: mode'}
	endif
	gamemode_gettype
	switch <Type>
		case faceoff
		case pro_faceoff
		case battle
		if (<mode> = character_hub)
			0x78e63fc5 \{direction = enter}
		elseif (<mode> = band_difficulty)
			0xe1ef6e7f \{direction = enter}
		else
			0x93d8d5cf \{'illegal mode'}
		endif
		case quickplay
		if (<mode> = band_mode)
			0x54ecda2b \{direction = enter}
		elseif (<mode> = band_difficulty)
			0xcde58b91 \{direction = enter}
		else
			0x93d8d5cf \{'illegal mode'}
		endif
		case career
		if (<mode> = band_mode)
			0xd7659270 \{direction = enter}
		elseif (<mode> = band_difficulty)
			0x4e6cc3ca \{direction = enter}
		else
			0x93d8d5cf \{'illegal mode'}
		endif
		default
		0x93d8d5cf \{'illegal game type'}
	endswitch
endscript

script 0x05f27c34 
	0x50228f94
	generic_event_back
endscript

script 0x50228f94 
	if cas_queue_is_busy
		create_loading_screen
		cas_queue_wait
	endif
endscript

script 0x54ecda2b 
	if NOT GotParam \{direction}
		0x93d8d5cf \{'need param: direction'}
	endif
	switch <direction>
		case enter
		0x8dbdaee4 \{'QUICKPLAY: A ~ ENTER'}
		0xda3c21ee \{0xfa27c33e = 0}
		0xda3c21ee \{0xfa27c33e = 1}
		case next
		0x8dbdaee4 \{'QUICKPLAY: A ~ NEXT'}
		0xda3c21ee \{0xfa27c33e = 2}
		0xda3c21ee \{0xfa27c33e = 3}
		0x981ef6bf
		SpawnScriptNow 0xbcb41c09 params = {num_ready = <num_ready>}
		case back
		0x8dbdaee4 \{'QUICKPLAY: A ~ BACK'}
		0xda3c21ee \{0xfa27c33e = 2}
		0xda3c21ee \{0xfa27c33e = 3}
		0x981ef6bf \{0xb4e99147}
		SpawnScriptNow \{0x05f27c34}
		default
		0x93d8d5cf \{'illegal direction'}
	endswitch
	return
endscript

script 0xbcb41c09 
	0x50228f94
	generic_event_choose no_sound state = uistate_setlist data = {use_all_controllers num_band_players = <num_ready> band_controller_types = <band_controller_types>}
endscript

script 0xcde58b91 
	if NOT GotParam \{direction}
		0x93d8d5cf \{'need param: direction'}
	endif
	switch <direction>
		case enter
		0x8dbdaee4 \{'QUICKPLAY: B ~ ENTER'}
		0xda3c21ee \{0xfa27c33e = 4}
		0xda3c21ee \{0xfa27c33e = 5}
		case next
		0x8dbdaee4 \{'QUICKPLAY: B ~ NEXT'}
		0xda3c21ee \{0xfa27c33e = 6}
		0xda3c21ee \{0xfa27c33e = 7}
		0x981ef6bf
		SpawnScriptNow \{0x853920cc}
		case back
		0x8dbdaee4 \{'QUICKPLAY: B ~ BACK'}
		0xda3c21ee \{0xfa27c33e = 6}
		0xda3c21ee \{0xfa27c33e = 7}
		0x981ef6bf
		SpawnScriptNow \{0x05f27c34}
		default
		0x93d8d5cf \{'illegal direction'}
	endswitch
	return
endscript

script 0x853920cc 
	create_loading_screen
	0x50228f94
	generic_event_choose \{state = uistate_play_song}
endscript

script 0x78e63fc5 
	if NOT GotParam \{direction}
		0x93d8d5cf \{'need param: direction'}
	endif
	switch <direction>
		case enter
		0x8dbdaee4 \{'HEADTOHEAD: A ~ ENTER'}
		0xba9c37d2
		0xda3c21ee \{0xfa27c33e = 0}
		0xda3c21ee \{0xfa27c33e = 1}
		case next
		0x8dbdaee4 \{'HEADTOHEAD: A ~ NEXT'}
		0xda3c21ee \{0xfa27c33e = 2}
		0xda3c21ee \{0xfa27c33e = 3}
		0x981ef6bf
		SpawnScriptNow \{0x9339ea9e}
		case back
		0x8dbdaee4 \{'HEADTOHEAD: A ~ BACK'}
		0xda3c21ee \{0xfa27c33e = 2}
		0xda3c21ee \{0xfa27c33e = 3}
		0x981ef6bf \{0xb4e99147}
		SpawnScriptNow \{0x05f27c34}
		default
		0x93d8d5cf \{'illegal direction'}
	endswitch
	return
endscript

script 0x9339ea9e 
	0x50228f94
	generic_event_choose \{no_sound
		state = uistate_setlist
		data = {
			no_jamsession
			use_all_controllers
		}}
endscript

script 0xe1ef6e7f 
	if NOT GotParam \{direction}
		0x93d8d5cf \{'need param: direction'}
	endif
	switch <direction>
		case enter
		0x8dbdaee4 \{'HEADTOHEAD: B ~ ENTER'}
		0xba9c37d2
		0xda3c21ee \{0xfa27c33e = 4}
		0xda3c21ee \{0xfa27c33e = 5}
		case next
		0x8dbdaee4 \{'HEADTOHEAD: B ~ NEXT'}
		0xda3c21ee \{0xfa27c33e = 6}
		0xda3c21ee \{0xfa27c33e = 7}
		0x981ef6bf
		SpawnScriptNow \{0xaab4d65b}
		case back
		0x8dbdaee4 \{'HEADTOHEAD: B ~ BACK'}
		0xda3c21ee \{0xfa27c33e = 6}
		0xda3c21ee \{0xfa27c33e = 7}
		0x981ef6bf
		SpawnScriptNow \{0x05f27c34}
		default
		0x93d8d5cf \{'illegal direction'}
	endswitch
	return
endscript

script 0xaab4d65b 
	create_loading_screen
	0x50228f94
	generic_event_choose \{state = uistate_play_song}
endscript

script 0xd7659270 
	if NOT GotParam \{direction}
		0x93d8d5cf \{'need param: direction'}
	endif
	switch <direction>
		case enter
		0x8dbdaee4 \{'CAREER PRE-INTRO: A ~ ENTER'}
		0xda3c21ee \{0xfa27c33e = 0}
		0xda3c21ee \{0xfa27c33e = 1}
		case next
		0x8dbdaee4 \{'CAREER PRE-INTRO: A ~ NEXT'}
		0xda3c21ee \{0xfa27c33e = 2}
		0xda3c21ee \{0xfa27c33e = 3}
		0x981ef6bf
		SpawnScriptNow \{0x4100eec2}
		case back
		0x8dbdaee4 \{'CAREER PRE-INTRO: A ~ BACK'}
		0xda3c21ee \{0xfa27c33e = 2}
		0xda3c21ee \{0xfa27c33e = 3}
		0x981ef6bf \{0xb4e99147}
		SpawnScriptNow \{0x05f27c34}
		default
		0x93d8d5cf \{'illegal direction'}
	endswitch
	return
endscript

script 0x4100eec2 
	0x50228f94
	generic_event_choose \{state = uistate_band_difficulty}
endscript

script 0x4e6cc3ca 
	if NOT GotParam \{direction}
		0x93d8d5cf \{'need param: direction'}
	endif
	switch <direction>
		case enter
		0x8dbdaee4 \{'CAREER PRE-INTRO: B ~ ENTER'}
		0xda3c21ee \{0xfa27c33e = 4}
		0xda3c21ee \{0xfa27c33e = 5}
		case next
		0x8dbdaee4 \{'CAREER PRE-INTRO: B ~ NEXT'}
		get_band_difficulty
		get_progression_globals ($current_progression_flag) game_mode = ($game_mode)
		format_globaltag_song_checksum part = ($<tier_global>.part) song = ($<tier_global>.tier1.songs [0]) difficulty = <band_difficulty>
		0xda3c21ee \{0xfa27c33e = 6}
		0xda3c21ee \{0xfa27c33e = 7}
		0x981ef6bf
		SpawnScriptNow \{0x788dd207}
		case back
		0x8dbdaee4 \{'CAREER PRE-INTRO: B ~ BACK'}
		0xda3c21ee \{0xfa27c33e = 6}
		0xda3c21ee \{0xfa27c33e = 7}
		0x981ef6bf \{0xb4e99147}
		SpawnScriptNow \{0x05f27c34}
		default
		0x93d8d5cf \{'illegal direction'}
	endswitch
	return
endscript

script 0x788dd207 
	create_loading_screen
	0x50228f94
	if GotParam \{unlocked}
		generic_event_choose \{state = uistate_play_song}
	else
		generic_event_choose state = uistate_play_song data = {progression_flag = ($current_progression_flag) gig_num = 1}
	endif
endscript

script 0x49c4e0fb 
	if NOT GotParam \{direction}
		0x93d8d5cf \{'need param: direction'}
	endif
	switch <direction>
		case enter
		0x8dbdaee4 \{'CAREER POST-INTRO: A ~ ENTER'}
		0xda3c21ee \{0xfa27c33e = 0}
		0xda3c21ee \{0xfa27c33e = 1}
		case next
		0x8dbdaee4 \{'CAREER POST-INTRO: A ~ NEXT'}
		0xda3c21ee \{0xfa27c33e = 2}
		0xda3c21ee \{0xfa27c33e = 3}
		0x981ef6bf
		SpawnScriptNow \{0x88d0ed76}
		case back
		0x8dbdaee4 \{'CAREER POST-INTRO: A ~ BACK'}
		0xda3c21ee \{0xfa27c33e = 2}
		0xda3c21ee \{0xfa27c33e = 3}
		0x981ef6bf \{0xb4e99147}
		SpawnScriptNow \{0x05f27c34}
		default
		0x93d8d5cf \{'illegal direction'}
	endswitch
	return
endscript

script 0x88d0ed76 
	0x50228f94
	generic_event_choose \{state = uistate_band_difficulty}
endscript

script 0xd0cdb141 
	if NOT GotParam \{direction}
		0x93d8d5cf \{'need param: direction'}
	endif
	switch <direction>
		case enter
		0x8dbdaee4 \{'CAREER POST-INTRO: B ~ ENTER'}
		0xda3c21ee \{0xfa27c33e = 4}
		0xda3c21ee \{0xfa27c33e = 5}
		case next
		0x8dbdaee4 \{'CAREER POST-INTRO: B ~ NEXT'}
		0xda3c21ee \{0xfa27c33e = 6}
		0xda3c21ee \{0xfa27c33e = 7}
		0x981ef6bf
		SpawnScriptNow \{0xb15dd1b3}
		case back
		0x8dbdaee4 \{'CAREER POST-INTRO: B ~ BACK'}
		0xda3c21ee \{0xfa27c33e = 6}
		0xda3c21ee \{0xfa27c33e = 7}
		0x981ef6bf \{0xb4e99147}
		SpawnScriptNow \{0x05f27c34}
		default
		0x93d8d5cf \{'illegal direction'}
	endswitch
	return
endscript

script 0xb15dd1b3 
	create_loading_screen
	0x50228f94
	generic_event_choose \{state = uistate_gig_posters}
endscript

script 0xc0a98a59 
	0xda3c21ee \{0xfa27c33e = 100}
endscript

script 0x549823c6 
	return \{true}
endscript

script 0xac77dfe2 
	0x7b65dd5a = FALSE
	if ScreenElementExists \{id = 0x23fc9d2c}
		0x23fc9d2c :GetSingleTag \{0xa66f59fe}
		if NOT GotParam \{0xa66f59fe}
			0x93d8d5cf \{'qi_main_menu doesnt have param: headtohead'}
		endif
		if (<0xa66f59fe> = 1)
			0x7b65dd5a = true
		endif
	endif
	return <0x7b65dd5a>
endscript

script 0x62d9f083 
	get_current_band_info
	GetGlobalTags <band_info>
	0x8dbdaee4 \{'*******************************'}
	0x8dbdaee4 \{'**** PRINTING SOME GLOBALS ****'}
	0x8dbdaee4 \{'*******************************'}
	0x8dbdaee4 \{''}
	0x567a0082 \{GlobalName = band_mode_menu_tags}
	0x567a0082 \{GlobalName = band_mode_actual_devices}
	0x567a0082 \{GlobalName = 0x2994109a}
	0x567a0082 \{GlobalName = player_status}
	0x567a0082 \{GlobalName = band_mode_menu_tags_instrument}
	0x567a0082 \{GlobalName = net_band_mode_menu}
	0x567a0082 \{GlobalName = net_band_members}
	0x567a0082 \{GlobalName = net_career_selected_song}
	0x567a0082 \{GlobalName = players_in_uistate}
	0x567a0082 \{GlobalName = band_info}
	0x567a0082 \{GlobalName = player_has_no_controller}
	0x567a0082 \{GlobalName = num_quickplay_song_list}
	0x567a0082 \{GlobalName = quickplay_song_list}
	0x567a0082 \{GlobalName = quickplay_song_list_current}
	0x567a0082 \{GlobalName = jam_curr_directory_listing}
	0x567a0082 \{GlobalName = jam_song_assets}
	i = 1
	begin
	getplayerinfo (<i>)
	i = (<i> + 1)
	repeat 4
	0x8dbdaee4 \{'*** DUMPING PLAYER STATUS ARRAY ***'}
	i = 1
	begin
	<player_status> = ($0x2994109a [<i>])
	0x8dbdaee4 '** PLAYER %i **' i = <i>
	i = (<i> + 1)
	repeat 8
	0x8dbdaee4 \{''}
	0x8dbdaee4 \{'*******************************'}
	0x8dbdaee4 \{'*******************************'}
endscript

script 0x567a0082 
	if (GlobalExists Name = <GlobalName>)
	else
		0x8dbdaee4 '%i not found' i = <GlobalName> donotresolve
	endif
	0x8dbdaee4 \{''}
	0x8dbdaee4 \{'***************'}
	0x8dbdaee4 \{''}
endscript
