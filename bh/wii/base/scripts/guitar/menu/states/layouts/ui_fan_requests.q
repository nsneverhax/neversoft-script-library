0xfb3f72b0 = [
]
0xfda1514a = [
]
0x8cffecf0 = [
	0
	0
	0
	0
]
0xf84b62e1 = 0.02
0x45b6d797 = 10
0xb79b38a8 = 5
0x14eefc6f = 0.25
0x2eb020f2 = (-8.0, 5.0)
0x4248bd13 = [
	[
		237
		244
		249
		255
	]
	[
		6
		43
		97
		255
	]
]
0x6aec0172 = 10
0x086e012e = 2
0x152ef484 = 1
0xd25d8243 = (2.0, 2.0)
0x5eb65feb = (3.0, 3.0)
0x2d8fafda = 1
0xce3c06fa = 1.3499999
0xa07cfcbb = 1000
0xafdb874b = 0.01
0xec24a480 = 2
0x26ecb447 = qs(0xcdbd164a)
0xe13c34d5 = qs(0xfdaac714)
0x6e1528ea = qs(0x7db4f592)
0x1897dff2 = qs(0xabaabdde)
0x3f9d48fa = qs(0x0b6a32ba)
0xb4735c89 = qs(0xf7723015)
0x35dfc21f = qs(0x0e41fe46)
0xbb18a4ac = qs(0x182f0173)
0x1fd2d776 = qs(0x63d864e2)
0xf1b8d2c2 = qs(0x615be94b)
0x5a580718 = qs(0x63d864e2)
0xaf6061b6 = qs(0x63d864e2)
0x3e7e25f4 = qs(0x7343df39)
0x986f1dc0 = qs(0x0d119c9b)
0x4813727f = qs(0x51bed763)
0x3a630e2a = qs(0xee1acae0)
0x7ddfffe9 = qs(0x8c319877)
0xa4ee7927 = qs(0xd7ae25d9)
0x26160526 = qs(0x50c3c667)
0x29d287d2 = qs(0x00a93373)
0xcdc418b9 = qs(0x84cb8da4)
0x8a0df682 = qs(0x4d0aec50)
0xda544a6a = qs(0x6cab35f9)
0x1bba6f3b = qs(0xfa05c8fd)
0xe5af4c2f = qs(0x23b6e962)
0xb4cae4e6 = qs(0xaf4d5dd2)
0x69fb98b9 = qs(0x6918149b)
0x265ee261 = qs(0x4d0aec50)
0xdd7bc27f = {
	Default = qs(0xfb546d37)
	difficulty = qs(0x1e6a3a72)
	title = qs(0x540dc565)
	instrument = qs(0x8694014b)
	0x5c9e5cb7 = qs(0xf395db78)
	0xf3ab8511 = qs(0xf1aa7c5d)
}
0xc60889e1 = qs(0x00000000)
0x36017cdc = FALSE
0xca04ea5f = 0xe3a65280

script 0x4cf0efff \{ds_name = qs(0x00000000)}
	Change 0xc60889e1 = <ds_name>
endscript

script 0x0b4e7781 
	GetArraySize ($0x426ce4d9)
	0x84b0a3be = [NULL]
	array = []
	if (<array_Size> > 0)
		begin
		array = (<array> + <0x84b0a3be>)
		repeat <array_Size>
	endif
	Change 0xfda1514a = <array>
	Change 0xfb3f72b0 = <array>
endscript

script 0x132e1000 
	0x81e18800
	0x798d6c72
	GetArraySize \{$0x426ce4d9}
	Change 0x191a06f6 = <array_Size>
	Change 0x8c776b95 = ($0x191a06f6 + 1)
	CreateScreenElement \{parent = root_window
		id = 0x99bbe0ac
		Type = descinterface
		desc = 'fan_requests'
		0xe473908e = fontgrid_text_a1
		0x0b3321b6 = fontgrid_text_a1
		0xfe084ec1 = fontgrid_text_a1
		0xd9636839 = fontgrid_text_a1
		0x6ebf9e5b = fontgrid_text_a1}
	0x99bbe0ac :desc_resolvealias \{Name = 0x9fb5c60c}
	<resolved_id> :obj_spawnscript 0x182aefab params = {0x971c66e7 = 0.3 Color = [61 218 250 200]}
	0x99bbe0ac :desc_resolvealias \{Name = 0x06bc97b6}
	<resolved_id> :obj_spawnscript 0x182aefab params = {0x971c66e7 = 0.3 Color = [61 218 250 200]}
	0x99bbe0ac :desc_resolvealias \{Name = 0x71bba720}
	<resolved_id> :obj_spawnscript 0x182aefab params = {0x971c66e7 = 0.3 Color = [61 218 250 200]}
	0x99bbe0ac :desc_resolvealias \{Name = background}
	<resolved_id> :obj_spawnscript ui_alphablast
	0x99bbe0ac :desc_resolvealias \{Name = 0x9afc3087}
	<resolved_id> :obj_spawnscript 0x3bb230a1 params = {0x971c66e7 = 1.5}
	if NOT is_ds_connected
		0x99bbe0ac :se_setprops ds_name_text = ($0x26ecb447)
	else
		0x99bbe0ac :se_setprops ds_name_text = ($0xc60889e1)
	endif
	formatText TextName = text qs(0x05185620) s = ($0xdd7bc27f.($0xda6118a7 [($0xa7957b85)])) usecommas
	0x99bbe0ac :se_setprops {
		sort_text = <text>
	}
	0x21a2e4ca
	0x99bbe0ac :desc_resolvealias \{Name = 0xb39c5eb9}
	<resolved_id> :se_setprops {
		event_handlers = [
			{pad_back 0x848c3c8b}
			{pad_L1 0x881044dd}
			{pad_start 0x1e67e5f4}
			{focus 0x96892fdc params = {list wii}}
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
	}
	0x99bbe0ac :desc_resolvealias \{Name = 0xb39c5eb9}
	0x99bbe0ac :SetTags current_menu = <resolved_id>
	0xe124200d
	0x39da73a8
	0x54dd6c0c
	LaunchEvent Type = focus target = <resolved_id>
	CreateScreenElement \{Type = ContainerElement
		id = ds_event_listener
		parent = 0x99bbe0ac
		event_handlers = [
			{
				ds_connect
				0x5650bca9
				params = {
					Stage = connected
				}
			}
			{
				ds_disconnect
				0xab89de3d
			}
		]}
endscript

script 0x1e201eff 
	RequireParams \{[
			Type
		]
		all}
	Obj_GetID
	if (<Type> = focus)
		<objID> :se_setprops {
			text_rgba = 0xaad894a8
			0x5789dcc0 = 0xaad894a8
			light_bar_alpha = 1
		}
		<objID> :desc_resolvealias Name = 0xc95b353d
		<resolved_id> :obj_spawnscript 0xdad049fe params = {0x971c66e7 = 0.15 start_dims = (8.0, 8.0) 0x3af134dc = 2}
		0x5b17d9fd index = <index>
	else
		<objID> :se_setprops {
			text_rgba = gh51_blue_lt
			0x5789dcc0 = gh51_blue_lt
			light_bar_alpha = 0
		}
		KillSpawnedScript \{Name = 0xdad049fe}
	endif
endscript

script 0x54dd6c0c 
	if is_ds_connected
		0x99bbe0ac :desc_resolvealias \{Name = 0x66a92f79}
		countscreenelementchildren id = <resolved_id>
		if NOT (<num_children> > 0)
			0x99bbe0ac :se_setprops {
				0x074e4093 = ($0xe13c34d5)
				0x48e6d48f = 0
			}
		else
			0x99bbe0ac :se_setprops \{0x074e4093 = qs(0x03ac90f0)
				0x48e6d48f = 1}
		endif
	else
		0x99bbe0ac :se_setprops {
			0x074e4093 = ($0x6e1528ea)
			0x48e6d48f = 0
		}
	endif
endscript

script 0x784f09ae 
	0x99bbe0ac :desc_resolvealias \{Name = 0xb39c5eb9}
	<resolved_id> :menu_getselectedindex
	countscreenelementchildren id = <resolved_id>
	percent = ((<selected_index> * 1.0) / (<num_children> -1))
	0x5d9269cf = (261 + 201)
	0xcd7332a1 = (<0x5d9269cf> * <percent>)
	0x97cd4cd5 = ((0.0, 1.0) * <0xcd7332a1>)
	0xc63a353a = ((0.0, -201.0) + <0x97cd4cd5>)
	0x99bbe0ac :se_setprops 0xce0e4346 = <0xc63a353a>
endscript

script 0xe124200d 
	0x99bbe0ac :desc_resolvealias \{Name = 0xb39c5eb9}
	wii_menu = <resolved_id>
	0xd65d545d \{sorted}
	0x5855c4bf = <list>
	GetArraySize <0x5855c4bf>
	if (<array_Size> > 0)
		i = 0
		begin
		0x792a4d09 = (<0x5855c4bf> [<i>])
		CreateScreenElement {
			parent = <wii_menu>
			just = [center center]
			Type = descinterface
			dims = (460.0, 100.0)
			desc = 'fan_request'
			event_handlers = [
				{focus 0x0305604a}
				{focus 0x1e201eff params = {Type = focus index = <0x792a4d09>}}
				{focus 0x784f09ae}
				{focus 0x88c206ac params = {index = <0x792a4d09>}}
				{unfocus 0x1e201eff params = {Type = unfocus}}
				{unfocus 0xb177aec3}
				{pad_choose 0xe3bbb8b0 params = {index = <0x792a4d09>}}
				{pad_option2 0xc178298c params = {index = <0x792a4d09>}}
			]
			0x4789e657 = fontgrid_text_a1
			0xd414b07d = ($0x426ce4d9 [<0x792a4d09>].display_text)
		}
		0x46fb9b68 id = <id>
		<id> :obj_spawnscript 0xc294254c params = {individual instrument = ($0x426ce4d9 [<0x792a4d09>].instrument)}
		SetArrayElement ArrayName = 0xfb3f72b0 index = <0x792a4d09> NewValue = <id> globalarray
		i = (<i> + 1)
		repeat <array_Size>
		0x39da73a8
		0x1a895b00
	else
		ScriptAssert 'Attempted Fan Request object creation on an empty list of fans. Current Sort Index: %i' i = ($0xa7957b85)
	endif
endscript

script 0x46fb9b68 
	RequireParams \{[
			id
		]
		all}
	<id> :desc_resolvealias Name = 0xef5c3f72
	parent = <resolved_id>
	i = 0
	begin
	CreateScreenElement {
		Type = SpriteElement
		parent = <parent>
		texture = 0x258bfb1f
		use_animated_uvs = true
		top_down_v
		frame_length = 340282347
		num_uv_frames = (8.0, 1.0)
		blend = blend
		dims = (512.0, 64.0)
		z_priority = 4
		loop_animated_uvs = true
		current_frames = (2.0, 0.0)
		Scale = (0.08, 0.08)
	}
	i = (<i> + 1)
	repeat ($0xb79b38a8)
endscript

script 0x0305604a 
	Obj_GetID
	<objID> :desc_resolvealias Name = 0xef5c3f72
	parent = <resolved_id>
	i = 0
	begin
	ResolveScreenElementID id = {<parent> child = <i>}
	if GotParam \{resolved_id}
		if ScreenElementExists id = <resolved_id>
			GetRandomValue \{Name = length
				a = 0.08
				b = 0.120000005}
			<resolved_id> :se_setprops frame_length = <length> current_frames = (3.0, 0.0)
		endif
	endif
	i = (<i> + 1)
	repeat ($0xb79b38a8)
endscript

script 0xb177aec3 
	Obj_GetID
	<objID> :desc_resolvealias Name = 0xef5c3f72
	parent = <resolved_id>
	i = 0
	begin
	ResolveScreenElementID id = {<parent> child = <i>}
	if GotParam \{resolved_id}
		if ScreenElementExists id = <resolved_id>
			<resolved_id> :se_setprops frame_length = 340282347 current_frames = (2.0, 0.0)
		endif
	endif
	i = (<i> + 1)
	repeat ($0xb79b38a8)
endscript

script 0xc178298c 
	RequireParams \{[
			index
		]
		all}
	0x99bbe0ac :desc_resolvealias \{Name = 0xb39c5eb9}
	LaunchEvent Type = unfocus target = <resolved_id>
	formatText TextName = Name qs(0xcffccebb) s = ($0x426ce4d9 [<index>].0x564259d1) usecommas
	SoundEvent \{event = gigboard_select}
	SoundEvent \{event = 0xf7e6895d}
	CreateScreenElement {
		parent = 0x99bbe0ac
		id = 0xf80916c6
		Type = descinterface
		desc = 'fan_request_quote_popup'
		0x56ef1b1a = <Name>
		title_text = ($0x426ce4d9 [<index>].display_text)
		0x569307b2 = ($0x426ce4d9 [<index>].0x948e340b)
		event_handlers = [
			{focus 0x96892fdc params = {0xf80916c6}}
			{pad_choose 0x8045a393}
		]
	}
	0xf80916c6 :desc_resolvealias \{Name = 0x7d316142}
	<resolved_id> :obj_spawnscript 0x182aefab params = {0x971c66e7 = 0.3 Color = [61 218 250 200]}
	0xf80916c6 :desc_resolvealias \{Name = 0xdc287239}
	parent = <resolved_id>
	GetArraySize ($0x4248bd13)
	if (<array_Size> > 0)
		i = 0
		current_pos = (0.0, 0.0)
		begin
		CreateScreenElement {
			Type = SpriteElement
			parent = <parent>
			Pos = <current_pos>
			pos_anchor = [center center]
			just = [center center]
			texture = 0x622b81cf
			use_animated_uvs = true
			top_down_v
			frame_length = 0.1
			num_uv_frames = (8.0, 1.0)
			blend = blend
			dims = (1024.0, 128.0)
			relative_z_priority = (<array_Size> - <i>)
			loop_animated_uvs = true
			current_frames = (0.0, 0.0)
			Scale = (0.185, 0.185)
			rgba = ($0x4248bd13 [<i>])
		}
		current_pos = (<current_pos> + ($0x2eb020f2))
		i = (<i> + 1)
		repeat <array_Size>
	endif
	LaunchEvent \{Type = focus
		target = 0xf80916c6}
endscript

script 0x8045a393 
	if ScreenElementExists \{id = 0xf80916c6}
		DestroyScreenElement \{id = 0xf80916c6}
		SoundEvent \{event = gigboard_select}
		0x99bbe0ac :desc_resolvealias \{Name = 0xb39c5eb9}
		LaunchEvent Type = focus target = <resolved_id>
	endif
endscript

script 0x39da73a8 
	0x99bbe0ac :desc_resolvealias \{Name = 0xb39c5eb9}
	wii_menu = <resolved_id>
	0x99bbe0ac :desc_resolvealias \{Name = 0x66a92f79}
	0x76de8a8d = <resolved_id>
	0xd65d545d \{sorted}
	GetArraySize <list>
	if (<array_Size> > 0)
		i = 0
		begin
		0x3c650d0e index = (<list> [<i>])
		i = (<i> + 1)
		repeat <array_Size>
		LaunchEvent Type = focus target = <wii_menu>
		if is_ds_connected
			0xd65d545d
			GetArraySize <list>
			if (<array_Size> > 0)
				i = 0
				begin
				0x59933c8a request_id = (<list> [<i>])
				0x27a7a380 = ($0xfda1514a [(<list> [<i>])])
				if (<0xaf597f85> = 1)
					if (<0x27a7a380> = NULL)
						CreateScreenElement {
							parent = <0x76de8a8d>
							just = [center center]
							Type = descinterface
							dims = (460.0, 38.0)
							Scale = (1.0, 1.0)
							desc = 'fan_request_ds'
							event_handlers = [
								{focus 0xa323fa10 params = {0x971c66e7 = 0.25 start_dims = (10.0, 10.0) 0x3af134dc = 2}}
								{focus 0x88c206ac params = {index = (<list> [<i>])}}
								{unfocus KillSpawnedScript params = {Name = 0xa323fa10}}
								{pad_option2 0xe3bbb8b0 params = {index = (<list> [<i>])}}
							]
							font = fontgrid_text_a1
							text = ($0x426ce4d9 [(<list> [<i>])].display_text)
						}
						<id> :SetTags 0x229b24db = (<list> [<i>])
						countscreenelementchildren id = <0x76de8a8d>
						<id> :SetTags index = (<num_children> -1)
						array = $0xfda1514a
						SetArrayElement ArrayName = array index = (<list> [<i>]) NewValue = <id>
						Change 0xfda1514a = <array>
						if GotParam \{0x75554508}
							Change 0x28bb80d6 = <id>
							<id> :obj_spawnscript 0x45b34567 params = {animated}
						else
							<id> :obj_spawnscript 0x45b34567
						endif
					endif
				elseif (<0x27a7a380> != NULL)
					if GotParam \{0x7d0d6036}
						<0x27a7a380> :GetTags index
						0x5336d0ce index = <index>
						<0x27a7a380> :obj_spawnscript 0x1e9d8d5a
						0x99bbe0ac :desc_resolvealias \{Name = 0xb39c5eb9}
						wii_menu = <resolved_id>
						<wii_menu> :menu_getselectedindex
						GetScreenElementChildren id = <wii_menu>
						0xb051f45e = (<children> [<selected_index>])
						LaunchEvent Type = unfocus target = <0xb051f45e>
						LaunchEvent Type = focus target = <0xb051f45e>
						SetArrayElement ArrayName = 0xfda1514a index = (<list> [<i>]) NewValue = NULL globalarray
					endif
				endif
				i = (<i> + 1)
				repeat <array_Size>
			endif
		else
			array = $0xfda1514a
			GetArraySize <array>
			if (<array_Size> > 0)
				i = 0
				begin
				if ((<array> [<i>]) != NULL)
					DestroyScreenElement id = (<array> [<i>])
					SetArrayElement ArrayName = array index = <i> NewValue = NULL
				endif
				i = (<i> + 1)
				repeat <array_Size>
				Change 0xfda1514a = <array>
			endif
		endif
		0xdb2cc67d
	else
		ScriptAssert \{'Tried to refresh menus even though the array of fan requests unlocked is empty'}
	endif
endscript

script 0xdb2cc67d 
	0x99bbe0ac :desc_resolvealias \{Name = 0x66a92f79}
	0x76de8a8d = <resolved_id>
	if is_ds_connected
		0xd65d545d
		GetArraySize <list>
		if (<array_Size> > 0)
			i = 0
			begin
			id = ($0xfb3f72b0 [(<list> [<i>])])
			if NOT (<id> = NULL)
				<id> :se_setprops 0xac964942 = qs(0x03ac90f0)
			endif
			i = (<i> + 1)
			repeat <array_Size>
			GetScreenElementChildren id = <0x76de8a8d>
			if GotParam \{children}
				GetArraySize <children>
				if (<array_Size> > 0)
					i = 0
					begin
					(<children> [<i>]) :GetTags 0x229b24db
					(<children> [<i>]) :SetTags index = <i>
					id = ($0xfb3f72b0 [<0x229b24db>])
					if NOT (<id> = NULL)
						formatText TextName = text qs(0x73307931) s = (<i> + 1)
						<id> :se_setprops 0xac964942 = <text>
					endif
					i = (<i> + 1)
					repeat <array_Size>
				endif
			endif
		endif
	else
		0xd65d545d
		GetArraySize <list>
		if (<array_Size> > 0)
			i = 0
			begin
			id = ($0xfb3f72b0 [(<list> [<i>])])
			if NOT (<id> = NULL)
				<id> :se_setprops 0xac964942 = qs(0x03ac90f0)
			endif
			i = (<i> + 1)
			repeat <array_Size>
		endif
	endif
endscript

script 0x5336d0ce 
	RequireParams \{[
			index
		]
		all}
	printf '%i' i = <index>
	0x99bbe0ac :desc_resolvealias \{Name = 0x66a92f79}
	countscreenelementchildren id = <resolved_id>
	iterations = (5 - <index>)
	if (<iterations> > 0)
		i = <index>
		begin
		formatText checksumName = alias 'num_%i' i = <i>
		if 0x99bbe0ac :desc_resolvealias Name = <alias>
			<resolved_id> :obj_spawnscript 0x3dad9bcb
		endif
		i = (<i> + 1)
		repeat <iterations>
	endif
endscript

script 0x3dad9bcb 
	Obj_GetID
	total_time = (($0x54ae0e20) + ($0x14eefc6f))
	<objID> :se_setprops {
		alpha = 0
		time = (<total_time> / 4)
	}
	Wait ((<total_time> * 3) / 4) Seconds
	<objID> :se_setprops {
		alpha = 1
		time = (<total_time> / 4)
	}
endscript

script 0x5b17d9fd 
	RequireParams \{[
			index
		]
		all}
	0x59933c8a request_id = <index>
	if (<0xaf597f85> = 1)
		user_control_helper_change_text \{button = green
			text = $0xda544a6a}
	else
		user_control_helper_change_text \{button = green
			text = $0x1bba6f3b}
	endif
endscript

script 0x3c650d0e 
	RequireParams \{[
			index
		]
		all}
	0x99bbe0ac :desc_resolvealias \{Name = 0xb39c5eb9}
	wii_menu = <resolved_id>
	request_id = ($0xfb3f72b0 [<index>])
	<request_id> :se_setprops {
		parent = 0x99bbe0ac
	}
	<request_id> :se_setprops {
		parent = <wii_menu>
	}
endscript

script 0x88c206ac 
	RequireParams \{[
			index
		]
		all}
	if ScreenElementExists \{id = 0x99bbe0ac}
		0x99bbe0ac :se_setprops {
			info_text = ($0x426ce4d9 [<index>].description)
		}
		0xc294254c instrument = ($0x426ce4d9 [<index>].instrument)
		GetArraySize ($0x426ce4d9 [<index>].difficulty)
		if (<array_Size> > 0)
			i = 0
			begin
			formatText checksumName = 0x9ab0c089 'alias_instrument_difficulty_%i' i = <i>
			0x99bbe0ac :desc_resolvealias Name = <0x9ab0c089>
			if scriptidisrunning <0x9ab0c089>
				KillSpawnedScript id = <0x9ab0c089>
				<resolved_id> :obj_spawnscript 0xe7d3cde4 id = <0x9ab0c089> params = {0x8c68f54c index = <i> 0x229b24db = <index>}
			else
				<resolved_id> :obj_spawnscript 0xe7d3cde4 id = <0x9ab0c089> params = {index = <i> 0x229b24db = <index>}
			endif
			i = (<i> + 1)
			repeat <array_Size>
		endif
	endif
endscript

script 0xe7d3cde4 
	RequireParams \{[
			index
		]
		all}
	Obj_GetID
	current_difficulty = ($0x426ce4d9 [<0x229b24db>].difficulty [<index>])
	0x3394d2a9 = ($0x8cffecf0 [<index>])
	SetArrayElement ArrayName = 0x8cffecf0 index = <index> NewValue = <current_difficulty> globalarray
	if (<current_difficulty> >= <0x3394d2a9>)
		difference = (<current_difficulty> - <0x3394d2a9>)
		if (<difference> > 0)
			0x8ef9fa81 = (($0xf84b62e1) / <difference>)
		else
			0x8ef9fa81 = 0
		endif
		i = 9
		begin
		if ((<i> >= 0) && (<i> < ($0x45b6d797)))
			if (((($0x45b6d797) - <i>) -1) <= (<current_difficulty> -1))
				ResolveScreenElementID id = {<objID> child = <i>}
				<resolved_id> :se_setprops alpha = 1
				time = <0x8ef9fa81>
			else
				ResolveScreenElementID id = {<objID> child = <i>}
				<resolved_id> :se_setprops alpha = 0.5
				time = 0
			endif
		endif
		if NOT GotParam \{0x8c68f54c}
			Wait <time> Seconds
		endif
		i = (<i> -1)
		repeat ($0x45b6d797)
		if GotParam \{0x8c68f54c}
			Wait ($0xf84b62e1) Seconds
		endif
	elseif (<current_difficulty> < <0x3394d2a9>)
		difference = (<0x3394d2a9> - <current_difficulty>)
		if (<difference> > 0)
			0x8ef9fa81 = (($0xf84b62e1) / <difference>)
		else
			0x8ef9fa81 = 0
		endif
		time = 0
		i = 0
		begin
		if ((<i> >= 0) && (<i> < ($0x45b6d797)))
			if ((<i>) >= ((($0x45b6d797) -1) - (<current_difficulty> -1)))
				ResolveScreenElementID id = {<objID> child = <i>}
				<resolved_id> :se_setprops alpha = 1
				time = <0x8ef9fa81>
			else
				ResolveScreenElementID id = {<objID> child = <i>}
				<resolved_id> :se_setprops alpha = 0.5
				time = 0
			endif
		endif
		if NOT GotParam \{0x8c68f54c}
			Wait <time> Seconds
		endif
		i = (<i> + 1)
		repeat ($0x45b6d797)
		if GotParam \{0x8c68f54c}
			Wait ($0xf84b62e1) Seconds
		endif
	endif
endscript

script 0x34d0e05f 
	RequireParams \{[
			stars
			id
		]
		all}
	if (<id> != NULL)
		counter = 0
		begin
		<id> :desc_resolvealias Name = 0xef5c3f72
		ResolveScreenElementID id = {<resolved_id> child = <counter>}
		<resolved_id> :se_setprops {
			alpha = 0
		}
		counter = (<counter> + 1)
		repeat 5
		if (<stars> > 0)
			counter = 0
			begin
			<id> :desc_resolvealias Name = 0xef5c3f72
			ResolveScreenElementID id = {<resolved_id> child = <counter>}
			<resolved_id> :se_setprops {
				alpha = 1
			}
			counter = (<counter> + 1)
			repeat <stars>
		elseif (<stars> < 0)
			ScriptAssert 'Bad number of %d given to create stars with' d = <stars>
		endif
	endif
endscript

script 0x1e67e5f4 {
		heading_text = $0x1fd2d776
		body_text = $0xf1b8d2c2
		options = [
			{
				func = 0x82e5a8fa
				text = ($0x3e7e25f4)
			}
			{
				func = 0x6baf2ba3
				text = ($0x5a580718)
			}
		]
		dlog_event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
	}
	if ScreenElementExists \{id = 0x99bbe0ac}
		destroy_dialog_box <...>
		if NOT is_ds_connected
			0x3639a982
		else
			0x99bbe0ac :desc_resolvealias \{Name = alias_menu}
			LaunchEvent Type = unfocus target = <resolved_id>
			create_dialog_box {
				use_all_controllers
				heading_text = <heading_text>
				body_text = <body_text>
				options = <options>
				dlog_event_handlers = <dlog_event_handlers>
			}
		endif
	endif
	SoundEvent \{event = gigboard_select}
endscript

script 0x3639a982 
	0x99bbe0ac :desc_resolvealias \{Name = 0xb39c5eb9}
	LaunchEvent Type = unfocus target = <resolved_id>
	CreateScreenElement \{parent = 0x99bbe0ac
		id = 0xb639cf2b
		Type = descinterface
		desc = 'fan_request_connection'
		z_priority = 500}
	0xb639cf2b :SetTags \{0xc6011d0c = -1}
	0xb639cf2b :SetTags \{0x68f5bd5f = FALSE}
	0xb639cf2b :desc_resolvealias \{Name = 0x3c4c514b}
	<resolved_id> :obj_spawnscript ui_alphablast
	0xb639cf2b :desc_resolvealias \{Name = 0x179e5690}
	<resolved_id> :obj_spawnscript 0x6407587e params = {time = 30.0 startPos = (0.0, 0.0)}
	<resolved_id> :se_setprops alpha = 0
	0x4fa4e00f
	formatText TextName = text qs(0xbfe3c946) d = <0x4f648dbf> usecommas
	0xb639cf2b :se_setprops 0x60a5a75a = <text>
	0xb639cf2b :SetTags 0x94423c13 = <0x4f648dbf>
	LaunchEvent \{Type = focus
		target = 0xb639cf2b}
	0x5650bca9 \{Stage = searching}
endscript

script 0x5650bca9 
	SoundEvent \{event = gigboard_select}
	RequireParams \{[
			Stage
		]
		all}
	if (<Stage> = 0xccce4aac)
		0xc6794ef5
		if (<0xf206c009> < 0)
			<Stage> = finished
		endif
	endif
	switch <Stage>
		case searching
		0xb639cf2b :obj_spawnscript \{0x26745167}
		0xb639cf2b :desc_resolvealias \{Name = 0x179e5690}
		<resolved_id> :se_setprops alpha = 0 time = 1
		0xb639cf2b :desc_resolvealias \{Name = 0x086b3a54}
		<resolved_id> :se_setprops alpha = 0
		KillSpawnedScript \{Name = 0xdad049fe}
		0xb639cf2b :desc_resolvealias \{Name = 0x5bbec413}
		<resolved_id> :obj_spawnscript 0xdad049fe params = {0x971c66e7 = 0.15 start_dims = (12.0, 12.0) 0x3af134dc = $0xec24a480}
		0xb639cf2b :desc_resolvealias \{Name = 0xc2b795a9}
		<resolved_id> :obj_spawnscript 0xdad049fe params = {0x971c66e7 = 0.15 start_dims = (12.0, 12.0) 0x3af134dc = $0xec24a480}
		0x96892fdc \{searching}
		0xb639cf2b :desc_resolvealias \{Name = 0x747477ec}
		<resolved_id> :se_setprops alpha = 0
		0xb639cf2b :se_setprops \{event_handlers = [
				{
					pad_back
					0xf130b13a
				}
				{
					pad_choose
					nullscript
				}
			]
			replace_handlers}
		0xb639cf2b :se_setprops \{0xb7cb86cc = 1
			0x2ea42409 = 0
			0x2f7a9fb1 = 0
			0xa55099ff = 0
			0xd10458b2 = 0
			0xb9ccbd56 = 0
			0x99a01339 = 0}
		case connected
		0x96892fdc \{0xbb0540a8}
		SoundEvent \{event = gig_challenge_complete}
		0xb639cf2b :desc_resolvealias \{Name = 0x086b3a54}
		<resolved_id> :se_setprops alpha = 1
		0xb639cf2b :desc_resolvealias \{Name = 0x086b3a54}
		<resolved_id> :obj_spawnscript 0xb1e00d5f
		0xb639cf2b :desc_resolvealias \{Name = 0xf929db22}
		<resolved_id> :obj_spawnscript 0xdad049fe params = {0x971c66e7 = 0.15 start_dims = (12.0, 12.0) 0x3af134dc = $0xec24a480}
		0xb639cf2b :desc_resolvealias \{Name = 0x60208a98}
		<resolved_id> :obj_spawnscript 0xdad049fe params = {0x971c66e7 = 0.15 start_dims = (12.0, 12.0) 0x3af134dc = $0xec24a480}
		0xb639cf2b :desc_resolvealias \{Name = 0x1727ba0e}
		<resolved_id> :obj_spawnscript 0xdad049fe params = {0x971c66e7 = 0.15 start_dims = (12.0, 12.0) 0x3af134dc = $0xec24a480}
		0xb639cf2b :se_setprops \{event_handlers = [
				{
					pad_back
					nullscript
				}
				{
					pad_choose
					0x5650bca9
					params = {
						Stage = updating
					}
				}
			]
			replace_handlers}
		0xb639cf2b :se_setprops \{0xb7cb86cc = 0
			0x2ea42409 = 1
			0x2f7a9fb1 = 0
			0xa55099ff = 0
			0xd10458b2 = 0
			0xb9ccbd56 = 0
			0x99a01339 = 0}
		0xb639cf2b :desc_resolvealias \{Name = 0x179e5690}
		<resolved_id> :se_setprops {
			alpha = 0.4
			time = 1.0
		}
		case updating
		clean_up_user_control_helpers
		0xb639cf2b :se_setprops \{event_handlers = [
				{
					pad_back
					nullscript
				}
				{
					pad_choose
					nullscript
				}
			]
			replace_handlers}
		0xb639cf2b :se_setprops \{0xb7cb86cc = 0
			0x2ea42409 = 0
			0x2f7a9fb1 = 1
			0xa55099ff = 0
			0xd10458b2 = 0
			0xb9ccbd56 = 0
			0x99a01339 = 0}
		0xff4de0ae
		0x9a065b1d
		0x29480f35
		Wait ($0x086e012e) Seconds
		0x4f7cfb59 = (($0x612dd249) * ($0x8a7bf052))
		if (<0x4f7cfb59> > 0)
			0x5650bca9 \{Stage = 0x4f7cfb59}
		else
			0x73802420
			GetArraySize <0x63b02abd>
			printstruct channel = clayton <...>
			if (<array_Size> > 0)
				0x5650bca9 \{Stage = 0xb8d12721}
			else
				0x5650bca9 \{Stage = 0x9fd19dcb}
			endif
		endif
		case 0x4f7cfb59
		KillSpawnedScript \{Name = 0xdad049fe}
		0x96892fdc \{0xbb0540a8}
		0xb639cf2b :desc_resolvealias \{Name = 0x5269d466}
		<resolved_id> :se_setprops alpha = 0
		0x4f7cfb59 = (($0x612dd249) * ($0x8a7bf052))
		formatText TextName = text qs(0x89a45773) d = <0x4f7cfb59> usecommas
		0xb639cf2b :se_setprops 0xeee2de23 = <text>
		if (<0x4f7cfb59> > 200000)
			SoundEvent \{event = 0xf7e6895d}
		endif
		if (<0x4f7cfb59> > 100000)
			SoundEvent \{event = 0xf7e6895d}
		endif
		SoundEvent \{event = 0xf7e6895d}
		SoundEvent \{event = 0xb19b9e7a}
		0xb639cf2b :obj_spawnscript \{0xa210b134
			params = {
				delay = 1.5
			}}
		0xb639cf2b :obj_spawnscript \{0xd364983b}
		0xb639cf2b :se_setprops \{event_handlers = [
				{
					pad_back
					nullscript
				}
				{
					pad_choose
					0x5650bca9
					params = {
						Stage = 0xe677556f
					}
				}
			]
			replace_handlers}
		0xb639cf2b :desc_resolvealias \{Name = 0x127a8603}
		<resolved_id> :obj_spawnscript 0x3bb230a1 params = {0x971c66e7 = 1.5}
		0xb639cf2b :se_setprops \{0xb7cb86cc = 0
			0x2ea42409 = 0
			0x2f7a9fb1 = 0
			0xa55099ff = 1
			0xd10458b2 = 0
			0xb9ccbd56 = 0
			0x99a01339 = 0}
		case 0x9fd19dcb
		SoundEvent \{event = SoundEvent
			event = menu_scroll_end}
		0xb639cf2b :obj_spawnscript \{0x554f7990
			params = {
				delay = 1.75
			}}
		KillSpawnedScript \{Name = 0xdad049fe}
		0x96892fdc \{0xbb0540a8}
		0xb639cf2b :se_setprops \{event_handlers = [
				{
					pad_back
					nullscript
				}
				{
					pad_choose
					0x5650bca9
					params = {
						Stage = 0xccce4aac
					}
				}
			]
			replace_handlers}
		0xb639cf2b :se_setprops \{0xb7cb86cc = 0
			0x2ea42409 = 0
			0x2f7a9fb1 = 0
			0xa55099ff = 0
			0xd10458b2 = 1
			0xb9ccbd56 = 0
			0x99a01339 = 0}
		case 0xb8d12721
		0xb639cf2b :se_setprops \{event_handlers = [
				{
					pad_back
					nullscript
				}
				{
					pad_choose
					0x5650bca9
					params = {
						Stage = 0xe677556f
					}
				}
			]
			replace_handlers}
		0x5650bca9 \{Stage = 0xe677556f}
		case 0xe677556f
		0x96892fdc \{0xbb0540a8}
		SoundEvent \{event = ui_unlock_item_sfx}
		0xb639cf2b :desc_resolvealias \{Name = 0x086b3a54}
		<resolved_id> :se_setprops alpha = 0
		0xb639cf2b :desc_resolvealias \{Name = 0x747477ec}
		<resolved_id> :se_setprops alpha = 0
		0xb639cf2b :se_setprops \{0xb7cb86cc = 0
			0x2ea42409 = 0
			0x2f7a9fb1 = 0
			0xa55099ff = 0
			0xd10458b2 = 0
			0xb9ccbd56 = 1
			0x99a01339 = 0}
		0xb639cf2b :GetTags \{0xc6011d0c}
		0xb639cf2b :GetTags \{0x68f5bd5f}
		0x9086063e
		GetArraySize <0x6f65eee2>
		if ((<0xc6011d0c> + 1) <= (<array_Size> - 1))
			0x807ec5ce 0xa80b3d08 = (<0x6f65eee2> [(<0xc6011d0c> + 1)].reward_type)
			0x308e8f15 0xa80b3d08 = (<0x6f65eee2> [(<0xc6011d0c> + 1)].reward_type)
			0xb639cf2b :se_setprops {
				0x1fa18bc0 = <string>
				0x0a1ec433 = ($0x09670ae3 [(<0xc6011d0c> + 1)].reward_name)
				0x76c4d4d9 = <texture>
			}
			0xb639cf2b :SetTags 0xc6011d0c = (<0xc6011d0c> + 1)
		else
			0x73802420
			GetArraySize <0x63b02abd>
			0xb639cf2b :GetTags \{0x68f5bd5f}
			if ((<array_Size> > 0) && (<0x68f5bd5f> = FALSE))
				0xb639cf2b :desc_resolvealias \{Name = 0xad760a78}
				CreateScreenElement {
					Type = SpriteElement
					parent = <resolved_id>
					Pos = (0.0, -32.0)
					pos_anchor = [center center]
					just = [center center]
					texture = 0x622b81cf
					use_animated_uvs = true
					top_down_v
					frame_length = 0.1
					num_uv_frames = (8.0, 1.0)
					blend = add
					dims = (1024.0, 128.0)
					loop_animated_uvs = true
					current_frames = (0.0, 0.0)
					Scale = (0.15, 0.15)
					rgba = ($0x4248bd13 [0])
				}
				if (<array_Size> = 1)
					0xb639cf2b :se_setprops \{0x1fa18bc0 = qs(0x03ac90f0)
						0x0a1ec433 = qs(0x4cf190e3)
						0x0b0d8d98 = 0}
				else
					formatText TextName = text qs(0x2c37932e) d = <array_Size>
					0xb639cf2b :se_setprops {
						0x1fa18bc0 = qs(0x03ac90f0)
						0x0a1ec433 = <text>
						0x0b0d8d98 = 0
					}
				endif
				SoundEvent \{event = 0xb19b9e7a}
				0xb639cf2b :SetTags \{0x68f5bd5f = true}
			else
				0x5650bca9 \{Stage = 0xccce4aac}
			endif
		endif
		case 0xccce4aac
		SoundEvent \{event = gigboard_select}
		0xc6794ef5
		formatText TextName = text qs(0x022ba492) d = (<0xf206c009> * ($0x8a7bf052)) usecommas
		0x96892fdc \{0xbb0540a8}
		0xb639cf2b :desc_resolvealias \{Name = 0x086b3a54}
		<resolved_id> :se_setprops alpha = 0
		0xb639cf2b :desc_resolvealias \{Name = 0x747477ec}
		<resolved_id> :se_setprops alpha = 0
		0xb639cf2b :desc_resolvealias \{Name = 0x0a9fac04}
		<resolved_id> :obj_spawnscript ui_alphablast
		0xb639cf2b :se_setprops {
			0x1d8cc907 = <text>
			event_handlers = [
				{pad_back nullscript}
				{pad_choose 0x5650bca9 params = {Stage = finished}}
			]
			replace_handlers
			0xb7cb86cc = 0
			0x2ea42409 = 0
			0x2f7a9fb1 = 0
			0xa55099ff = 0
			0xd10458b2 = 0
			0xb9ccbd56 = 0
			0x99a01339 = 1
		}
		case finished
		0x4f7cfb59 = (($0x612dd249) * ($0x8a7bf052))
		0x73802420
		GetArraySize <0x63b02abd>
		if (<0x4f7cfb59> > 0 || <array_Size> > 0)
			ui_memcard_autosave \{event = menu_back
				data = {
					state = uistate_fan_requests
				}}
		else
			0x39da73a8
			0x54dd6c0c
			0x99bbe0ac :se_setprops ds_name_text = ($0xc60889e1)
			DestroyScreenElement \{id = 0xb639cf2b}
			0x99bbe0ac :desc_resolvealias \{Name = 0xb39c5eb9}
			LaunchEvent Type = focus target = <resolved_id>
		endif
	endswitch
endscript

script 0x807ec5ce 
	RequireParams \{[
			0xa80b3d08
		]
		all}
	switch <0xa80b3d08>
		case character
		return \{texture = 0x750dec93}
		case cas
		return \{texture = 0x4b475fdb}
	endswitch
endscript

script 0x308e8f15 
	RequireParams \{[
			0xa80b3d08
		]
		all}
	switch <0xa80b3d08>
		case character
		return \{string = qs(0x4cb73fb8)}
		case cas
		return \{string = qs(0xdc734788)}
	endswitch
endscript

script 0xb1e00d5f 
	if NOT GotParam \{time}
		time = ($0x6aec0172)
	endif
	Obj_GetID
	<objID> :se_setprops {
		alpha = 1
		Scale = (1.0, 1.0)
	}
	begin
	<objID> :se_setprops {
		rot_angle = 360
		time = <time>
	}
	Wait <time> Seconds
	<objID> :se_setprops {
		rot_angle = 0
	}
	repeat
endscript

script 0xff4de0ae 
	0xb639cf2b :desc_resolvealias \{Name = 0x747477ec}
	<resolved_id> :se_setprops {
		alpha = 0
		Scale = (1.0, 1.0)
	}
	<resolved_id> :se_setprops {
		alpha = 1
		time = ($0x086e012e)
	}
endscript

script 0xd364983b 
	0xb639cf2b :desc_resolvealias \{Name = 0x5269d466}
	<resolved_id> :se_setprops {
		alpha = 0
		Scale = ($0x5eb65feb)
	}
	<resolved_id> :se_setprops {
		alpha = 1
		Scale = (1.0, 1.0)
		time = ($0x2d8fafda)
		motion = ease_in
	}
	Wait ($0x2d8fafda) Seconds
	0xb639cf2b :desc_resolvealias \{Name = 0x747477ec}
	<resolved_id> :obj_spawnscript 0xb1e00d5f params = {time = ($0x6aec0172 * 2)}
endscript

script 0x554f7990 
	RequireParams \{[
			delay
		]
		all}
	0xb639cf2b :desc_resolvealias \{Name = 0x086b3a54}
	circle = <resolved_id>
	0xb639cf2b :desc_resolvealias \{Name = 0x747477ec}
	0x3d9f5d8d = <resolved_id>
	<0x3d9f5d8d> :se_setprops alpha = 0
	<circle> :se_getprops
	<circle> :se_setprops {
		alpha = 1
		Scale = (1.0, 1.0)
		rot_angle = (<rot_angle> + 23)
		motion = ease_out
		time = <delay>
	}
	Wait <delay> Seconds
	<circle> :se_setprops {
		alpha = 0
		Scale = (0.0, 0.0)
		time = ($0xce3c06fa)
		motion = ease_out
	}
endscript

script 0xa210b134 
	if GotParam \{delay}
		Wait <delay> Seconds
	endif
	0xb639cf2b :GetTags \{0x94423c13}
	if GotParam \{0x94423c13}
		0x4f7cfb59 = (($0x612dd249) * ($0x8a7bf052))
		count = <0x94423c13>
		iterations = (<0x4f7cfb59> / ($0xa07cfcbb))
		i = 0
		begin
		count = (<count> + ($0xa07cfcbb))
		formatText TextName = text qs(0xbfe3c946) d = <count> usecommas
		0xb639cf2b :se_setprops 0x60a5a75a = <text>
		Wait ($0xafdb874b) Seconds
		SoundEvent \{event = colorwheel_rotate}
		repeat <iterations>
	endif
endscript

script 0xf130b13a 
	SoundEvent \{event = gigboard_select_back}
	DestroyScreenElement \{id = 0xb639cf2b}
	wiidscommunication :disconnect
	0x99bbe0ac :desc_resolvealias \{Name = 0xb39c5eb9}
	LaunchEvent Type = focus target = <resolved_id>
endscript

script 0x21a2e4ca 
	0x4fa4e00f
	formatText TextName = text qs(0x48c6d14c) d = <0x4f648dbf> usecommas
	0x99bbe0ac :se_setprops 0x1517e1d4 = <text>
endscript

script 0x82e5a8fa 
	destroy_dialog_box <...>
	0x99bbe0ac :GetTags \{current_menu}
	LaunchEvent Type = focus target = <current_menu>
	0x96892fdc \{list}
endscript

script 0xab89de3d 
	begin
	if 0x35aaaa58
		Wait \{1
			Frame}
	else
		break
	endif
	repeat
	begin
	if NOT ScreenElementExists \{id = dialog_box_desc_id}
		break
	endif
	Wait \{0.2
		Seconds}
	repeat
	0x8045a393
	if ScreenElementExists \{id = 0xb639cf2b}
		DestroyScreenElement \{id = 0xb639cf2b}
	endif
	0x99bbe0ac :desc_resolvealias \{Name = 0xb39c5eb9}
	LaunchEvent Type = unfocus target = <resolved_id>
	if ($0x36017cdc = true)
		heading_text = qs(0x63d864e2)
		body_text = qs(0xb5877c09)
		SoundEvent \{event = 0xf7e6895d}
	else
		heading_text = qs(0x79597197)
		body_text = qs(0xd36929f3)
	endif
	create_dialog_box {
		use_all_controllers
		heading_text = <heading_text>
		body_text = <body_text>
		options = [
			{
				func = ($0xca04ea5f)
				text = qs(0x0e41fe46)
			}
		]
		dlog_event_handlers = [
			{pad_up nullscript}
			{pad_down nullscript}
		]
	}
	Change \{0x36017cdc = FALSE}
endscript

script 0xe3a65280 
	destroy_dialog_box
	if ScreenElementExists \{id = 0x99bbe0ac}
		destroy_dialog_box
		0x99bbe0ac :se_setprops ds_name_text = ($0x26ecb447)
		0x39da73a8
		0x54dd6c0c
		0x99bbe0ac :desc_resolvealias \{Name = 0xb39c5eb9}
		LaunchEvent Type = focus target = <resolved_id>
	endif
endscript

script 0x3b80ccec 
	destroy_dialog_box
	0x848c3c8b
endscript

script 0x6baf2ba3 \{continue_script = 0xe3a65280}
	destroy_dialog_box
	Change \{0x36017cdc = true}
	Change 0xca04ea5f = <continue_script>
	0x9ff4f7dc
endscript

script 0x96892fdc 
	clean_up_user_control_helpers
	if GotParam \{list}
		if ScreenElementExists \{id = 0x99bbe0ac}
			if is_ds_connected
				add_user_control_helper text = ($0x1bba6f3b) button = green z = 100
				add_user_control_helper text = ($0xe5af4c2f) button = red z = 100
				add_user_control_helper text = ($0x26160526) button = yellow z = 100
				add_user_control_helper text = ($0x29d287d2) button = orange z = 100
				add_user_control_helper text = ($0x265ee261) button = start z = 100
			else
				add_user_control_helper text = ($0xb4cae4e6) button = red z = 100
				add_user_control_helper text = ($0x26160526) button = yellow z = 100
				add_user_control_helper text = ($0x29d287d2) button = orange z = 100
				add_user_control_helper text = ($0x69fb98b9) button = start z = 100
			endif
		endif
	elseif GotParam \{0xf80916c6}
		add_user_control_helper text = ($0x35dfc21f) button = green z = 1000
	elseif GotParam \{searching}
		add_user_control_helper text = ($0xb4735c89) button = red z = 1000
	elseif GotParam \{0xbb0540a8}
		add_user_control_helper text = ($0xbb18a4ac) button = green z = 1000
	endif
endscript

script 0x1a895b00 
	GetGlobalTags savegame = <savegame> career_linking_progression
	0x4ab021c1 = 0
	GetArraySize <0x0f424c6f>
	if (<array_Size> > 0)
		counter = 0
		begin
		if ((<0x0f424c6f> [<counter>]) >= 0)
			0x34d0e05f stars = (<0x0f424c6f> [<counter>]) id = ($0xfb3f72b0 [<counter>])
		endif
		counter = (<counter> + 1)
		repeat <array_Size>
	endif
endscript

script 0xe3bbb8b0 
	RequireParams \{[
			index
		]
		all}
	if ScreenElementExists \{id = 0x99bbe0ac}
		if is_ds_connected
			0x59933c8a request_id = <index>
			if (<0xaf597f85> = 1)
				if ($0x249ebeea = true)
					0x37de6160 request_id = <index>
					0x39da73a8 \{0x7d0d6036}
					0x54dd6c0c
					SoundEvent \{event = 0x8a152620}
				endif
			else
				if NOT 0x47451783
					if ScreenElementExists \{id = 0xef30c94e}
						return
					endif
					Obj_GetID
					Change 0x8231a4f9 = <objID>
					0x74cac607 request_id = <index>
					0x39da73a8 \{0x75554508}
					0x5b17d9fd index = <index>
					0x54dd6c0c
					SoundEvent \{event = 0xb5615044}
					SoundEvent \{event = 0xb19b9e7a}
					SoundEvent \{event = gigboard_select}
				else
					SoundEvent \{event = menu_scroll_end}
					0x99bbe0ac :desc_resolvealias \{Name = 0xb39c5eb9}
					LaunchEvent Type = unfocus target = <resolved_id>
					create_dialog_box {
						use_all_controllers
						heading_text = ($0x7ddfffe9)
						body_text = ($0xa4ee7927)
						options = [
							{
								func = 0x82e5a8fa
								text = ($0x35dfc21f)
							}
						]
						dlog_event_handlers = [
							{pad_up nullscript}
							{pad_down nullscript}
						]
						on_destroy_script = LaunchEvent
						on_destroy_script_params = {Type = focus target = <resolved_id>}
					}
				endif
			endif
		endif
	endif
endscript

script 0x881044dd 
	GetArraySize ($0xda6118a7)
	Change 0xa7957b85 = (($0xa7957b85) + 1)
	if (($0xa7957b85) >= <array_Size>)
		Change \{0xa7957b85 = 0}
		0xe8644705 = ($0xa6296784)
		0xef0e0206
		0x6e1b4b8d 0xc271e730 = <0xc271e730>
		setstructureparam struct_name = 0xe8644705 param = Default value = <sorted_array>
		Change 0xa6296784 = <0xe8644705>
	endif
	formatText TextName = text qs(0x05185620) s = ($0xdd7bc27f.($0xda6118a7 [($0xa7957b85)])) usecommas
	0x99bbe0ac :se_setprops {
		sort_text = <text>
	}
	0x99bbe0ac :desc_resolvealias \{Name = 0xb39c5eb9}
	wii_menu = <resolved_id>
	<wii_menu> :menu_getselectedindex
	GetScreenElementChildren id = <wii_menu>
	0xb051f45e = (<children> [<selected_index>])
	LaunchEvent Type = unfocus target = <0xb051f45e>
	0x39da73a8
	LaunchEvent Type = focus target = <0xb051f45e>
	SoundEvent \{event = sort_songlist}
	Wait \{0.1
		Seconds}
	0x784f09ae
endscript

script 0xbdcabf74 
	destroy_dialog_box <...>
	0x96892fdc \{list
		wii}
endscript

script 0x848c3c8b 
	if ScreenElementExists \{id = 0x99bbe0ac}
		if NOT is_ds_connected
			generic_event_choose \{state = 0x3348ab02}
		else
			0x1e67e5f4 {
				heading_text = qs(0xffee5658)
				body_text = qs(0x562550a1)
				options = [
					{
						func = 0x82e5a8fa
						text = ($0x3e7e25f4)
					}
					{
						func = 0x6baf2ba3
						func_params = {continue_script = 0x3b80ccec}
						text = qs(0xffee5658)
					}
				]
			}
		endif
	endif
endscript

script 0xc294254c 
	RequireParams \{[
			instrument
		]
		all}
	if GotParam \{individual}
		Obj_GetID
		id = <objID>
	else
		id = 0x99bbe0ac
	endif
	switch <instrument>
		case guitar
		<id> :desc_resolvealias Name = alias_mixer_icon_bass
		<resolved_id> :se_setprops alpha = 0.25
		<id> :desc_resolvealias Name = alias_mixer_icon_drums
		<resolved_id> :se_setprops alpha = 0.25
		<id> :desc_resolvealias Name = alias_mixer_icon_vox
		<resolved_id> :se_setprops alpha = 0.25
		<id> :desc_resolvealias Name = alias_mixer_icon_guitar
		<resolved_id> :se_setprops alpha = 1
		case drum
		<id> :desc_resolvealias Name = alias_mixer_icon_bass
		<resolved_id> :se_setprops alpha = 0.25
		<id> :desc_resolvealias Name = alias_mixer_icon_guitar
		<resolved_id> :se_setprops alpha = 0.25
		<id> :desc_resolvealias Name = alias_mixer_icon_vox
		<resolved_id> :se_setprops alpha = 0.25
		<id> :desc_resolvealias Name = alias_mixer_icon_drums
		<resolved_id> :se_setprops alpha = 1
		case bass
		<id> :desc_resolvealias Name = alias_mixer_icon_guitar
		<resolved_id> :se_setprops alpha = 0.25
		<id> :desc_resolvealias Name = alias_mixer_icon_drums
		<resolved_id> :se_setprops alpha = 0.25
		<id> :desc_resolvealias Name = alias_mixer_icon_vox
		<resolved_id> :se_setprops alpha = 0.25
		<id> :desc_resolvealias Name = alias_mixer_icon_bass
		<resolved_id> :se_setprops alpha = 1
		case vocals
		<id> :desc_resolvealias Name = alias_mixer_icon_bass
		<resolved_id> :se_setprops alpha = 0.25
		<id> :desc_resolvealias Name = alias_mixer_icon_drums
		<resolved_id> :se_setprops alpha = 0.25
		<id> :desc_resolvealias Name = alias_mixer_icon_guitar
		<resolved_id> :se_setprops alpha = 0.25
		<id> :desc_resolvealias Name = alias_mixer_icon_vox
		<resolved_id> :se_setprops alpha = 1
		case any
		<id> :desc_resolvealias Name = alias_mixer_icon_bass
		<resolved_id> :se_setprops alpha = 1
		<id> :desc_resolvealias Name = alias_mixer_icon_drums
		<resolved_id> :se_setprops alpha = 1
		<id> :desc_resolvealias Name = alias_mixer_icon_guitar
		<resolved_id> :se_setprops alpha = 1
		<id> :desc_resolvealias Name = alias_mixer_icon_vox
		<resolved_id> :se_setprops alpha = 1
		case None
		<id> :desc_resolvealias Name = alias_mixer_icon_bass
		<resolved_id> :se_setprops alpha = 0.25
		<id> :desc_resolvealias Name = alias_mixer_icon_drums
		<resolved_id> :se_setprops alpha = 0.25
		<id> :desc_resolvealias Name = alias_mixer_icon_guitar
		<resolved_id> :se_setprops alpha = 0.25
		<id> :desc_resolvealias Name = alias_mixer_icon_vox
		<resolved_id> :se_setprops alpha = 0.25
	endswitch
endscript

script 0x01de01b2 
	0x66ed2de5
	DestroyScreenElement \{id = 0x99bbe0ac}
	GetArraySize ($0x426ce4d9)
	0x84b0a3be = [NULL]
	array = []
	if (<array_Size> > 0)
		begin
		array = (<array> + <0x84b0a3be>)
		repeat <array_Size>
	endif
	Change 0xfda1514a = <array>
	Change 0xfb3f72b0 = <array>
endscript
