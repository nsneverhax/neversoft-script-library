
script 0x80cd53de 
	dumppaks
	0x991feb25
	LoadPak \{'pak/sounds/crowd/sfx_crowd_fan_requests.pak'
		Heap = quota_sfx}
	dumppaks
	0x991feb25
endscript

script 0xc5567def 
	0x4fa4e00f
	formatText TextName = 0x1517e1d4 qs(0x76b3fda7) d = <0x4f648dbf> usecommas
	SpawnScriptNow 0x7a89b035 params = {0x4f648dbf = <0x4f648dbf>}
	0x4e291fb2
	GetArraySize <0x9db8032b>
	formatText TextName = 0xfff56481 qs(0x716eeeea) d = <array_Size> n = $0x00d685db
	0x47703340 = (((<0x4f648dbf> * 1.0) / ($0x8a7bf052 * $0x00d685db * $0xb79b38a8)) * 100)
	CastToInteger \{0x47703340}
	formatText TextName = 0xf1289e55 qs(0x720688b0) d = <0x47703340>
	0xe04ad7a7
	if (<0x380889a0> > 0)
		0xa065e6d9 = 1
		0x30a1eff2 = 0
	else
		0xa065e6d9 = 0
		0x30a1eff2 = 1
	endif
	CreateScreenElement {
		parent = root_window
		id = 0x8a776843
		Type = descinterface
		desc = 'fan_request_splash_screen'
		0x1517e1d4 = <0x1517e1d4>
		0xfff56481 = <0xfff56481>
		0xf1289e55 = <0xf1289e55>
		0xa065e6d9 = <0xa065e6d9>
		0x30a1eff2 = <0x30a1eff2>
		event_handlers = [
			{pad_choose 0x3f5b3a22}
			{pad_back 0x3cd696d5}
		]
	}
	AssignAlias id = <id> alias = current_menu
	<id> :desc_resolvealias Name = 0xde6a8e5a
	<resolved_id> :Obj_SpawnScriptNow 0xb454b71c
	<id> :desc_resolvealias Name = 0xfb1bdbf0
	<resolved_id> :se_setprops {
		texture = 0x258bfb1f
		use_animated_uvs = true
		top_down_v
		num_uv_frames = (8.0, 1.0)
		blend = blend
		dims = (512.0, 64.0)
		Scale = (0.125, 0.125)
		frame_length = 0.065
	}
	<id> :desc_resolvealias Name = 0x127a8603
	<resolved_id> :obj_spawnscript 0x3bb230a1 params = {0x971c66e7 = 1.5}
	0x8a776843 :se_setprops \{0x8f3d7c45 = 41.3}
	0x34bcda51
endscript

script 0x7a89b035 
	if (<0x4f648dbf> >= 1500000)
		SoundEvent \{event = 0x72547caa}
		Wait \{2
			Seconds}
		SoundEvent \{event = 0xaf66922c}
	elseif (<0x4f648dbf> >= 700000)
		SoundEvent \{event = 0xaf66922c}
		Wait \{2
			Seconds}
		SoundEvent \{event = 0x95f96621}
	elseif (<0x4f648dbf> >= 250000)
		SoundEvent \{event = 0x95f96621}
		Wait \{2
			Seconds}
		SoundEvent \{event = 0x4e78a5dc}
	elseif (<0x4f648dbf> = 0)
	else
		SoundEvent \{event = 0x4e78a5dc}
	endif
endscript

script 0x34bcda51 
	clean_up_user_control_helpers
	add_user_control_helper \{button = green
		text = qs(0x182f0173)
		z = 1000}
	add_user_control_helper \{button = red
		text = qs(0xaf4d5dd2)
		z = 1000}
endscript

script 0x3f5b3a22 
	generic_event_choose \{state = uistate_fan_requests}
endscript

script 0x3cd696d5 
	generic_event_back \{state = uistate_career_venue_select}
endscript

script 0x3f3c97b6 
	clean_up_user_control_helpers
	DestroyScreenElement \{id = 0x8a776843}
endscript

script 0x0f2fa626 
	UnLoadPak \{'pak/sounds/crowd/sfx_crowd_fan_requests.pak'}
endscript
0x3ab4abfa = 0.65000004
0x7afbd38c = 1.0
0xb58a93a5 = 0.5
0x0cac08d4 = 2.0
0xb082f0bc = 0.95
0x761a11f9 = 0.7
0xf9b16ed0 = [
	0
	0
]
0x29e5dd2c = 0.3
0x588a27c4 = 125

script 0xb454b71c 
	if NOT GotParam \{0x380889a0}
		0xe04ad7a7
		<0x379b36bc> = <0x380889a0>
		<0x380889a0> = (<0x380889a0> * 2)
	endif
	if (<0x380889a0> <= 0)
		return
	endif
	if (<0x380889a0> > 100)
		0x4918e9b2 = ((<0x380889a0> * 0.5) / 10)
		CastToInteger \{0x4918e9b2}
		<0x380889a0> = (<0x380889a0> - (<0x4918e9b2> * 10))
		0x3dde2649 = ((<0x380889a0> * 0.5) / 5)
		CastToInteger \{0x3dde2649}
		<0x380889a0> = (<0x380889a0> - (<0x3dde2649> * 5))
	else
		0x4918e9b2 = 0
		0x3dde2649 = 0
	endif
	0xeba2c56c = <0x380889a0>
	CastToInteger \{0xeba2c56c}
	0xb9542daf = (<0x4918e9b2> + <0x3dde2649> + <0xeba2c56c>)
	scale_factor = ($0x0cac08d4 - $0xb58a93a5)
	0x02dfd7ac = ($0x7afbd38c - $0x3ab4abfa)
	sqrt (<0xeba2c56c> + <0x3dde2649> + <0x4918e9b2>)
	round_float_to_int value = <sqrt>
	0xf6a6b8a5 = <rounded_value>
	0x2a58dc41 = <rounded_value>
	0x1c9c7258 = (0.25 / <0xf6a6b8a5>)
	0xd03672c6 = (0.25 / <0x2a58dc41>)
	Obj_GetID
	row = 0
	col = 0
	begin
	choices = []
	if (<0x4918e9b2> > 0)
		AddArrayElement array = <choices> element = 0xe1c635dc
		choices = <array>
	endif
	if (<0x3dde2649> > 0)
		AddArrayElement array = <choices> element = 0xc34d3334
		choices = <array>
	endif
	if (<0xeba2c56c> > 0)
		AddArrayElement array = <choices> element = single
		choices = <array>
	endif
	getrandomarrayelement <choices>
	Type = <element>
	switch <Type>
		case 0xe1c635dc
		<texture> = Random (@ 0x774bb4c4 @ 0xee42e57e )
		<dims> = (256.0, 128.0)
		<0x4918e9b2> = (<0x4918e9b2> - 1)
		case 0xc34d3334
		<texture> = Random (@ 0x3484f606 @ 0xad8da7bc )
		<dims> = (256.0, 128.0)
		<0x3dde2649> = (<0x3dde2649> - 1)
		case single
		<texture> = Random (@ 0x50e83302 @ 0xc9e162b8 @ 0xbee6522e )
		<dims> = (64.0, 128.0)
		<0xeba2c56c> = (<0xeba2c56c> - 1)
	endswitch
	y = ((<row> + 1) / (<0x2a58dc41> + 1.0))
	0xce839391 = ($0x761a11f9 + (<y> / ($0x761a11f9 * 2.0)))
	X = ((((<col> + 1) / (<0xf6a6b8a5> + 1.0)) * 2.0 - 1.0) * <0xce839391>)
	<y> = (<y> * 2.0 - $0xb082f0bc)
	GetRandomValue Name = x_diff a = (<0x1c9c7258> * -1) b = <0x1c9c7258>
	GetRandomValue Name = y_diff a = (<0xd03672c6> * -1) b = <0xd03672c6>
	<X> = (<X> + <x_diff>)
	<y> = (<y> + <y_diff>)
	dx = (<X> - ($0xf9b16ed0 [0]))
	0x966e8a3b = (<y> - ($0xf9b16ed0 [1]))
	sqrt (<dx> * <dx> + <0x966e8a3b> * <0x966e8a3b>)
	d = <sqrt>
	if (<d> >= $0x29e5dd2c)
		pos_anchor = [0.0 0.0]
		SetArrayElement ArrayName = pos_anchor index = 0 NewValue = <X>
		SetArrayElement ArrayName = pos_anchor index = 1 NewValue = <y>
		just = [0.0 0.0]
		SetArrayElement ArrayName = just index = 0 NewValue = (<X> * <y>)
		0xe8e85a22 = <y>
		if (<0xe8e85a22> > 0.0)
			0xe8e85a22 = 0.0
		endif
		SetArrayElement ArrayName = just index = 1 NewValue = <0xe8e85a22>
		Scale = ((<y> + 1.0) / 2.0)
		<Scale> = ((<Scale> * <scale_factor>) + $0xb58a93a5)
		Flip = Random (@ 0 @ 1 )
		<0xd0d9dd78> = <Scale>
		if (<Flip> = 1)
			<Scale> = ((-1.0, 1.0) * <Scale>)
		endif
		fade = ((<y> + 1.0) / 2.0)
		fade = ((<fade> * <0x02dfd7ac>) + $0x3ab4abfa)
		0x30e9d39e
		i = 0
		begin
		value = ((<rgba> [<i>]) * <fade>)
		CastToInteger \{value}
		SetArrayElement ArrayName = rgba index = <i> NewValue = <value>
		i = (<i> + 1)
		repeat 3
		CreateScreenElement {
			parent = <objID>
			Type = SpriteElement
			just = <just>
			pos_anchor = <pos_anchor>
			Pos = (0.0, 0.0)
			z_priority = (40 + <0xd0d9dd78>)
			Scale = <Scale>
			rgba = <rgba>
			texture = <texture>
			dims = <dims>
		}
		<id> :Obj_SpawnScriptNow 0x602c0587 params = {0xd0d9dd78 = <0xd0d9dd78> Type = <Type>}
	endif
	if (<col> >= (<0xf6a6b8a5> - 1))
		<col> = 0
		<row> = (<row> + 1)
	else
		<col> = (<col> + 1)
	endif
	repeat <0xb9542daf>
	if (<0x379b36bc> >= $0x588a27c4)
		Obj_SpawnScriptNow \{0xfd030c0e}
	endif
endscript
0x08e2c191 = 0.25
0x1a6925fe = 0.35000002
0x7fe5f107 = 0.35000002
0x6d6e1568 = 0.65000004

script 0xfd030c0e 
	Obj_GetID
	GetRandomValue \{Name = y
		a = $0x08e2c191
		b = $0x1a6925fe}
	GetRandomValue \{Name = X
		a = $0x7fe5f107
		b = $0x6d6e1568}
	0xce839391 = ($0x761a11f9 + (<y> / ($0x761a11f9 * 2.0)))
	<X> = ((<X> * 2.0 - 1.0) * <0xce839391>)
	<y> = (<y> * 2.0 - $0xb082f0bc)
	pos_anchor = [0.0 0.0]
	SetArrayElement ArrayName = pos_anchor index = 0 NewValue = <X>
	SetArrayElement ArrayName = pos_anchor index = 1 NewValue = <y>
	just = [0.0 0.0]
	SetArrayElement ArrayName = just index = 0 NewValue = (<X> * <y>)
	0xe8e85a22 = <y>
	if (<0xe8e85a22> > 0.0)
		0xe8e85a22 = 0.0
	endif
	SetArrayElement ArrayName = just index = 1 NewValue = <0xe8e85a22>
	scale_factor = ($0x0cac08d4 - $0xb58a93a5)
	Scale = ((<y> + 1.0) / 2.0)
	<Scale> = ((<Scale> * <scale_factor>) + $0xb58a93a5)
	Flip = Random (@ 0 @ 1 )
	<0xd0d9dd78> = <Scale>
	if (<Flip> = 1)
		<Scale> = ((-1.0, 1.0) * <Scale>)
	else
		<Scale> = ((1.0, 1.0) * <Scale>)
	endif
	fade = 1.0
	0x30e9d39e
	i = 0
	begin
	value = ((<rgba> [<i>]) * <fade>)
	CastToInteger \{value}
	SetArrayElement ArrayName = rgba index = <i> NewValue = <value>
	i = (<i> + 1)
	repeat 3
	CreateScreenElement {
		parent = <objID>
		Type = ContainerElement
		just = <just>
		pos_anchor = <pos_anchor>
		Pos = (0.0, 0.0)
		z_priority = (40 + <0xd0d9dd78>)
		Scale = <Scale>
		dims = (128.0, 64.0)
	}
	container_id = <id>
	CreateScreenElement {
		parent = <container_id>
		Type = SpriteElement
		just = [center bottom]
		pos_anchor = [center center]
		Pos = (0.0, -30.0)
		z_priority = (40 + <0xd0d9dd78>)
		Scale = 1.0
		rgba = <rgba>
		texture = 0xa351424a
		dims = (128.0, 64.0)
	}
	0x7cdc2775 = (((0.0, 1.0) * (<0xd0d9dd78> * 30)) + ((1.0, 0.0) * (<0xd0d9dd78> * 30 * (<Scale> [0]))))
	if ((<Scale> [0]) < 0)
		0x028b0b16 = -89
	else
		0x028b0b16 = 89
	endif
	<container_id> :se_setprops Pos = {(-1 * <0x7cdc2775>) relative} rot_angle = <0x028b0b16> alpha = 0
	<container_id> :se_setprops Pos = {<0x7cdc2775> relative} rot_angle = 0 time = 0.9 motion = smooth alpha = 1
	<container_id> :se_waitprops
	<id> :Obj_SpawnScriptNow 0xf2920fa8
endscript
0xd6c803ad = 1
0xeac53cf4 = 7

script 0xf2920fa8 \{time = 0.5}
	se_getparentid
	<parent_id> :Obj_SpawnScriptNow 0x0aa37ad9 params = {
		time = <time>
	}
	begin
	GetRandomValue \{Name = rot_amount
		a = $0xd6c803ad
		b = $0xeac53cf4}
	se_setprops rot_angle = <rot_amount> time = <time> motion = smooth
	se_waitprops
	se_setprops rot_angle = (-1 * <rot_amount>) time = <time> motion = smooth
	se_waitprops
	repeat
endscript
0x1ea18381 = 5
0x22acbcd8 = 20
0x5eb6fd41 = 5
0x62bbc218 = 10
0xbdf1f845 = 5
0x9a4a9f74 = 12

script 0x0aa37ad9 \{time = 0.5}
	se_getprops
	GetRandomValue \{Name = 0x71c85dc3
		a = $0xbdf1f845
		b = $0x9a4a9f74
		integer}
	Wait (<time> / 2.0) Seconds
	begin
	GetRandomValue \{Name = 0x328de2c8
		a = $0x5eb6fd41
		b = $0x62bbc218}
	<0xc07b356e> = (((<Scale> [0]) * <0x328de2c8>) * (0.0, 1.0))
	<0x69ad2b1d> = (((<Scale> [0]) * <0x328de2c8>) * (0.0, -1.0))
	GetRandomValue \{Name = 0xfc69b29e
		a = $0x1ea18381
		b = $0x22acbcd8}
	<0xfc69b29e> = (<0xfc69b29e> * (<Scale> [0]))
	<shift> = (<0xc07b356e> + (<0xfc69b29e> * (1.0, 0.0)))
	se_setprops Pos = {<shift> relative} time = <time> motion = smooth
	se_waitprops
	GetRandomValue \{Name = 0xfc69b29e
		a = $0x1ea18381
		b = $0x22acbcd8}
	<0xfc69b29e> = (<0xfc69b29e> * (<Scale> [0]))
	<shift> = (<0x69ad2b1d> + (<0xfc69b29e> * (1.0, 0.0)))
	se_setprops Pos = {<shift> relative} time = <time> motion = smooth
	se_waitprops
	repeat <0x71c85dc3>
	se_setprops Pos = {(5.0, 60.0) relative} time = <time> motion = ease_in alpha = 0
	se_waitprops
	se_getparentid
	<parent_id> :obj_spawnscript 0xfd030c0e
	Obj_GetID
	DestroyScreenElement id = <objID>
endscript
0xb13bd13c = [
	171
	137
	0
	255
]
0x28328086 = [
	213
	138
	0
	255
]
0x83430440 = 0.7
0x824f9ef4 = 1.0

script 0x30e9d39e 
	GetRandomValue \{Name = 0x18705394
		a = 0.0
		b = 1.0}
	GetRandomValue \{Name = darken
		a = $0x83430440
		b = $0x824f9ef4}
	rgba = [255 255 255 255]
	i = 0
	begin
	a = ($0xb13bd13c [<i>])
	diff = (($0x28328086 [<i>]) - <a>)
	value = ((<a> + (<0x18705394> * <diff>)) * <darken>)
	CastToInteger \{value}
	SetArrayElement ArrayName = rgba index = <i> NewValue = <value>
	<i> = (<i> + 1)
	repeat 3
	return rgba = <rgba>
endscript

script 0x602c0587 
	RequireParams \{[
			0xd0d9dd78
			Type
		]
		all}
	switch <Type>
		case 0xe1c635dc
		case 0xc34d3334
		0x7372f9d1 = [0x1e3a8089]
		case single
		0x7372f9d1 = [0x1e3a8089 0xe27e2b09]
	endswitch
	GetRandomValue \{Name = time
		a = 0.0
		b = 2.0}
	Wait <time> Seconds
	getrandomarrayelement <0x7372f9d1>
	Obj_SpawnScriptNow <element> params = {<...>}
endscript

script 0x1e3a8089 
	RequireParams \{[
			0xd0d9dd78
		]
		all}
	GetRandomValue \{Name = 0x6109b981
		a = 2
		b = 10
		integer}
	begin
	direction = Random (@ (1.0, 0.0) @ (-1.0, 0.0) )
	GetRandomValue \{Name = amt
		a = 2
		b = 6}
	GetRandomValue \{Name = speed
		a = 0.1
		b = 0.2}
	se_setprops Pos = {(<direction> * <amt> * <0xd0d9dd78>) relative} time = (<speed> * <amt>) motion = smooth
	se_waitprops
	se_setprops Pos = {(-1 * <direction> * <amt> * <0xd0d9dd78>) relative} time = (<speed> * <amt>) motion = smooth
	se_waitprops
	repeat <0x6109b981>
	Obj_SpawnScriptNow 0x602c0587 params = {<...>}
endscript

script 0xe27e2b09 
	RequireParams \{[
			0xd0d9dd78
		]
		all}
	GetRandomValue \{Name = 0x6109b981
		a = 4
		b = 20
		integer}
	begin
	GetRandomValue \{Name = time
		a = 0.75
		b = 1.0}
	se_setprops Pos = {((-3.0, -15.0) * <time> * <0xd0d9dd78>) relative} time = (0.4 * <time>) motion = ease_out
	se_waitprops
	se_setprops Pos = {((-3.0, 15.0) * <time> * <0xd0d9dd78>) relative} time = (0.4 * <time>) motion = ease_in
	se_waitprops
	se_setprops Pos = {((3.0, -15.0) * <time> * <0xd0d9dd78>) relative} time = (0.4 * <time>) motion = ease_out
	se_waitprops
	se_setprops Pos = {((3.0, 15.0) * <time> * <0xd0d9dd78>) relative} time = (0.4 * <time>) motion = ease_in
	se_waitprops
	repeat <0x6109b981>
	Obj_SpawnScriptNow 0x602c0587 params = {<...>}
endscript
