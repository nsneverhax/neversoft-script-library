0xe2dbf193 = (4.0, 0.0)
0xf5a20ce8 = (0.0, 20.0)
0x59e52337 = 4
0x75403155 = 0.5
0x9b533436 = [
	255
	255
	255
	255
]
0x833dd9c8 = (0.2, 0.2)
0xf706c6f0 = (1.5, 1.5)
0xbf9bc526 = 1
0xcba0da1e = 0.75
0x7e578f08 = 0.01
0x778ef8db = (0.0, 0.0)
0xbd14aeea = (10.0, 0.0)
0x947d0e61 = 30
0xfaeb0baf = 1.0
0x8231a4f9 = NULL
0x28bb80d6 = NULL
0xd6c0075c = 32
0x249ebeea = true
0x54ae0e20 = 0.3
0x07c8c2fe = 1.5

script 0x798d6c72 
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		Pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		z_priority = 100
		id = fx_container
		just = [
			center
			center
		]}
endscript

script 0x66ed2de5 
	DestroyScreenElement \{id = fx_container}
endscript

script 0x8f7e7b99 \{0x971c66e7 = 2.0
		0x3af134dc = 2
		start_dims = (20.0, 20.0)}
	se_getprops
	Obj_GetID
	element_pos = <Pos>
	element_dims = <dims>
	<element_width> = (<element_dims>.(1.0, 0.0))
	<element_height> = (<element_dims>.(0.0, 1.0))
	CastToInteger \{element_width}
	CastToInteger \{element_height}
	($0x28bb80d6) :desc_resolvealias Name = 0xc69df006
	window_id = <resolved_id>
	<window_id> :se_getprops dims
	window_width = ((<dims> [0]) * (1.0, 0.0))
	($0x28bb80d6) :desc_resolvealias Name = alias_text
	text_id = <resolved_id>
	<text_id> :se_getprops dims
	text_width = (<dims> [0])
	0x9b9fb564 = (<text_width> / $0x947d0e61)
	CastToInteger \{0x9b9fb564}
	if (<0x9b9fb564> <= 0)
		0x9b9fb564 = 1
	endif
	Change 0xe2dbf193 = ((1.0, 0.0) * <0x9b9fb564>)
	Change 0x7e578f08 = (($0xfaeb0baf) / ($0x947d0e61))
	($0x28bb80d6) :desc_resolvealias Name = 0x5e2010e2
	0x3bb3a48b = <resolved_id>
	GetScreenElementPosition id = <window_id> absolute
	Change 0x778ef8db = (<screenelementpos> + <window_width> + $0xf5a20ce8)
	original_pos = $0x778ef8db
	begin
	GetRandomValue Name = 0x2f2ae477 integer a = 1 b = <element_width>
	GetRandomValue Name = 0x582dd4e1 integer a = 1 b = <element_height>
	Pos = (((1.0, 0.0) * <0x2f2ae477>) + ((0.0, 1.0) * <0x582dd4e1>))
	CreateScreenElement {
		Type = ContainerElement
		parent = <objID>
		just = [center center]
		Pos = <Pos>
		dims = <start_dims>
		alpha = 0
	}
	GetRandomValue Name = 0xea89ad40 a = 0 b = ($0x59e52337)
	0x6378cb63 = ((<screenelementpos> + ((0.0, 1.0) * <0xea89ad40>)) + ($0xf5a20ce8))
	<id> :obj_spawnscript 0x8c1400d4 params = {0x3bb3a48b = <0x3bb3a48b> original_pos = <original_pos> text_width = (<text_width> / 2) window_id = <window_id> text_id = <text_id> 0x3af134dc = <0x3af134dc> start_dims = <start_dims>}
	Wait \{$0x7e578f08
		Seconds}
	repeat
endscript

script 0x8c1400d4 
	Obj_GetID
	GetScreenElementPosition id = <objID> absolute
	GetRandomValue Name = 0xea89ad40 a = 0 b = ($0x59e52337)
	startPos = <screenelementpos>
	endPos = (($0x778ef8db) + ((0.0, 1.0) * <0xea89ad40>))
	distance = ((<endPos> [0]) - (<original_pos> [0]))
	if (<distance> <= <text_width>)
		Change 0x778ef8db = ($0x778ef8db + $0xe2dbf193)
		0x081e1ec4 = (<startPos> [0])
		0x11052f85 = (<startPos> [1])
		0x91174f7e = (<endPos> [0])
		0x880c7e3f = (<endPos> [1])
		0x95ae424a = (((<0x91174f7e> - <0x081e1ec4>) * (<0x91174f7e> - <0x081e1ec4>)) + ((<0x880c7e3f> - <0x11052f85>) * (<0x880c7e3f> - <0x11052f85>)))
		sqrt (<0x95ae424a>)
		magnitude = <sqrt>
		0xf6190146 = ((<0x081e1ec4> + <0x91174f7e>) / 2)
		0x811e31d0 = ((<0x11052f85> + <0x880c7e3f>) / 2)
		GetRandomValue Name = 0x2b077280 integer a = 0 b = (<magnitude> / 4)
		GetRandomValue Name = 0xea89ad40 integer a = 0 b = (<magnitude> / 4)
		multiplier_1 = Random (@ -1 @ 1 )
		multiplier_2 = Random (@ -1 @ 1 )
		0xf6190146 = (<0xf6190146> + (<0x2b077280> * <multiplier_1> * <multiplier_2>))
		0x811e31d0 = (<0x811e31d0> + (<0xea89ad40> * <multiplier_1> * <multiplier_2>))
		0xa5a9080e = (((1.0, 0.0) * <0xf6190146>) + ((0.0, 1.0) * <0x811e31d0>))
		time = (<0x3af134dc> * 0.5)
		CreateScreenElement {
			Type = SpriteElement
			parent = fx_container
			texture = circle_gradient_64
			rgba = $0x9b533436
			dims = <start_dims>
			just = (0.0, 0.0)
			alpha = 1
			Pos = <startPos>
			blend = add
			z_priority = 1000
		}
		rand_rot = Random (@ qs(0xa2e01ca3) @ qs(0xbbaa1ade) )
		switch <rand_rot>
			case qs(0xa2e01ca3)
			<id> :se_setprops Pos = <0xa5a9080e> alpha = $0xbf9bc526 Scale = $0x833dd9c8 time = <time> motion = ease_in rot_angle = 180
			Wait <time> Seconds
			<id> :se_setprops Pos = <endPos> alpha = $0xcba0da1e Scale = $0xf706c6f0 time = <time> motion = ease_out rot_angle = 359
			Wait <time> Seconds
			default
			<id> :se_setprops Pos = <0xa5a9080e> alpha = $0xbf9bc526 Scale = $0x833dd9c8 time = <time> motion = ease_in rot_angle = -180
			Wait <time> Seconds
			<id> :se_setprops Pos = <endPos> alpha = $0xcba0da1e Scale = $0xf706c6f0 time = <time> motion = ease_out rot_angle = -359
			Wait <time> Seconds
		endswitch
		<window_id> :se_getprops Pos
		Pos = (<Pos> + $0xe2dbf193)
		if ((<Pos> [0]) > <text_width>)
			Pos = (<text_width> * (1.0, 0.0))
		endif
		<window_id> :se_setprops Pos = <Pos>
		<0x3bb3a48b> :se_setprops Pos = (<Pos> * (-1))
		DestroyScreenElement id = <id>
		DestroyScreenElement id = <objID>
		if ((<Pos> [0]) >= <text_width>)
			KillSpawnedScript \{Name = 0x8f7e7b99}
			DestroyScreenElement \{id = 0xef30c94e}
			<window_id> :se_getprops dims
			window_width = ((<dims> [0]) * (1.0, 0.0))
			<window_id> :se_setprops Pos = <window_width>
			<0x3bb3a48b> :se_setprops Pos = (<window_width> * (-1))
			0x99bbe0ac :desc_resolvealias \{Name = 0xb39c5eb9}
			<resolved_id> :se_setprops unblock_events
			LaunchEvent Type = unfocus target = <resolved_id>
			LaunchEvent Type = focus target = <resolved_id>
		endif
	endif
endscript

script 0x45b34567 
	Obj_GetID
	if GotParam \{animated}
		($0x8231a4f9) :desc_resolvealias Name = 0xc95b353d
		GetScreenElementPosition id = <resolved_id> absolute
		<resolved_id> :se_getprops dims
		CreateScreenElement {
			Type = ContainerElement
			parent = 0x99bbe0ac
			Pos = <screenelementpos>
			dims = <dims>
			z_priority = 100
			id = 0xef30c94e
			just = [left top]
		}
		0xef30c94e :obj_spawnscript \{0x8f7e7b99
			params = {
				0x971c66e7 = 0.2
				start_dims = (10.0, 10.0)
				0x3af134dc = $0x75403155
			}}
	else
		<objID> :se_setprops Scale = (1.0, 1.0)
		<objID> :desc_resolvealias Name = 0xc69df006
		window_id = <resolved_id>
		<window_id> :se_getprops dims Pos
		window_width = ((<dims> [0]) * (1.0, 0.0))
		<window_id> :se_setprops Pos = (<Pos> + <window_width>)
		<objID> :desc_resolvealias Name = 0x5e2010e2
		0x3bb3a48b = <resolved_id>
		<0x3bb3a48b> :se_setprops Pos = ((<Pos> + <window_width>) * -1)
	endif
endscript

script 0x1e9d8d5a 
	if ($0x249ebeea = true)
		Obj_GetID
		<objID> :desc_resolvealias Name = alias_text
		<resolved_id> :se_getprops dims
		GetScreenElementPosition id = <resolved_id> absolute
		CreateScreenElement {
			Type = ContainerElement
			parent = fx_container
			Pos = <screenelementpos>
			dims = <dims>
			z_priority = 100
			just = [left top]
		}
		<id> :obj_spawnscript 0x56bf4a4b params = {
			0xf6543e9b = <objID>
			0x85c80a4b = <id>
		}
	endif
endscript

script 0x56bf4a4b \{start_dims = (12.0, 12.0)}
	RequireParams \{[
			0xf6543e9b
		]
		all}
	Change \{0x249ebeea = FALSE}
	Obj_GetID
	<0xf6543e9b> :desc_resolvealias Name = 0xc69df006
	window_id = <resolved_id>
	<0xf6543e9b> :desc_resolvealias Name = 0x5e2010e2
	0x3bb3a48b = <resolved_id>
	<0xf6543e9b> :desc_resolvealias Name = alias_text
	text_id = <resolved_id>
	<text_id> :se_getprops dims
	text_width = (<dims> [0])
	0x3907e7bd = (<text_width> / $0xd6c0075c)
	delta_time = ($0x54ae0e20 / $0xd6c0075c)
	<window_id> :se_getprops dims
	window_dims = <dims>
	0x4043a8dd = (((-1.0, 0.0) * (<window_dims> [0])) + ((0.0, 0.5) * <window_dims> [1]))
	wait_time = 0.0
	begin
	<0x3bb3a48b> :se_setprops Pos = {((-0.55, 0.0) * <0x3907e7bd>) relative}
	<window_id> :se_setprops Pos = {((0.55, 0.0) * <0x3907e7bd>) relative}
	<window_id> :se_getprops Pos
	Pos = (<Pos> + <0x4043a8dd>)
	GetRandomValue \{Name = Scale
		a = 1.0
		b = 1.5}
	CreateScreenElement {
		Type = SpriteElement
		parent = <objID>
		texture = circle_gradient_64
		rgba = [255 255 255 255]
		dims = <start_dims>
		just = (0.0, 0.0)
		alpha = 1.0
		Pos = <Pos>
		Scale = <Scale>
		blend = add
	}
	GetRandomValue \{Name = 0x999dca7e
		a = -300.0
		b = 200.0}
	GetRandomValue \{Name = 0xee9afae8
		a = -200.0
		b = -100.0}
	velocity = ((<0x999dca7e> * (1.0, 0.0)) + (<0xee9afae8> * (0.0, 1.0)))
	<id> :obj_spawnscript 0xb0ea6b7c params = {
		velocity = <velocity>
		0x5c1177e0 = $0x07c8c2fe
	}
	<wait_time> = (<wait_time> + <delta_time>)
	if (<wait_time> > 0.05)
		Wait <delta_time> Seconds
		<wait_time> = (<wait_time> - <delta_time>)
	endif
	repeat $0xd6c0075c
	DestroyScreenElement id = <0xf6543e9b>
	Change \{0x249ebeea = true}
	0xdb2cc67d
	0x54dd6c0c
	Wait \{$0x07c8c2fe
		Seconds}
	DestroyScreenElement id = <objID>
endscript

script 0xb0ea6b7c \{0x030669d2 = 0.083333
		velocity = (0.0, 0.0)
		0x5c1177e0 = 1.5
		gravity = (0.0, 40.0)}
	RequireParams \{[
			0x030669d2
			velocity
			0x5c1177e0
			gravity
		]
		all}
	se_getprops
	0x71033525 = (<Scale> / (<0x5c1177e0> / <0x030669d2>))
	<gravity> = (<gravity> * <0x030669d2>)
	<velocity> = (<velocity> * <0x030669d2>)
	begin
	<velocity> = (<velocity> + <gravity>)
	<Pos> = (<Pos> + <velocity>)
	<Scale> = (<Scale> - <0x71033525>)
	se_setprops Pos = <Pos> Scale = <Scale> time = <0x030669d2>
	se_waitprops
	<0x5c1177e0> = (<0x5c1177e0> - <0x030669d2>)
	if (<0x5c1177e0> <= 0)
		break
	endif
	repeat
	Obj_GetID
	DestroyScreenElement id = <objID>
endscript

script 0xdad049fe \{0x971c66e7 = 2.0
		0x3af134dc = 2
		start_dims = (20.0, 20.0)}
	se_getprops
	Obj_GetID
	element_pos = <Pos>
	element_dims = <dims>
	<element_width> = (<element_dims>.(1.0, 0.0))
	<element_height> = (<element_dims>.(0.0, 1.0))
	CastToInteger \{element_width}
	CastToInteger \{element_height}
	begin
	GetRandomValue Name = 0x2f2ae477 integer a = 1 b = <element_width>
	GetRandomValue Name = 0x582dd4e1 integer a = 1 b = <element_height>
	my_pos = (((1.0, 0.0) * <0x2f2ae477>) + ((0.0, 1.0) * <0x582dd4e1>))
	CreateScreenElement {
		Type = ContainerElement
		parent = <objID>
		just = [center center]
		Pos = <my_pos>
		dims = <start_dims>
		alpha = 0
	}
	<id> :obj_spawnscript 0xba232d28 params = {0x3af134dc = <0x3af134dc> start_dims = <start_dims>}
	GetRandomValue Name = r a = 0 b = <0x971c66e7>
	Wait <r> Seconds
	repeat
endscript

script 0xba232d28 
	Obj_GetID
	se_getprops
	startPos = <Pos>
	endPos = (<startPos> + (0.0, -64.0))
	0xa5a9080e = (<startPos> + (0.0, -32.0))
	time = (<0x3af134dc> * 0.5)
	pos_offset = Random (@ (0.0, 20.0) @ (5.0, 5.0) @ (-20.0, 0.0) @ (-5.0, -5.0) )
	CreateScreenElement {
		Type = SpriteElement
		parent = <objID>
		texture = circle_gradient_64
		rgba = [255 255 255 255]
		dims = <start_dims>
		just = (0.0, 0.0)
		alpha = 1
		Pos = <pos_offset>
		blend = add
	}
	rand_rot = Random (@ qs(0xa2e01ca3) @ qs(0xbbaa1ade) )
	switch <rand_rot>
		case qs(0xa2e01ca3)
		se_setprops Pos = <0xa5a9080e> alpha = 1 Scale = (0.2, 0.2) rot_angle = 180 time = <time> motion = ease_in
		Wait <time> Seconds
		se_setprops Pos = <endPos> alpha = 0 Scale = (1.0, 1.0) rot_angle = 359 time = <time> motion = ease_out
		Wait <time> Seconds
		default
		se_setprops Pos = <0xa5a9080e> alpha = 1 Scale = (0.2, 0.2) rot_angle = -180 time = <time> motion = ease_in
		Wait <time> Seconds
		se_setprops Pos = <endPos> alpha = 0 Scale = (1.0, 1.0) rot_angle = -359 time = <time> motion = ease_out
		Wait <time> Seconds
	endswitch
	DestroyScreenElement id = <objID>
endscript

script 0x35aaaa58 
	if ScreenElementExists \{id = 0xef30c94e}
		return \{true}
	endif
	return \{FALSE}
endscript
