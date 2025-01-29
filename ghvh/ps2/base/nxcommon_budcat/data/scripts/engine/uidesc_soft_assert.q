uidesc_soft_assert = {
	descversion = 1
	Name = uidesc_soft_assert
	rect = [
		0.0
		0.0
		1280.0
		720.0
	]
	aliases = [
		{
			path = [
				{
					validatelocalid = soft_assert_anchor
				}
				{
					index = 2
					validatelocalid = window
					includeparentowned = FALSE
				}
				{
					index = 0
					validatelocalid = menu
					includeparentowned = FALSE
				}
			]
			Name = alias_menu
			visiblename = 'alias_menu'
			help = 'soft_assert_anchor -> window -> menu'
		}
	]
	props = [
		{
			path = [
				{
					validatelocalid = soft_assert_anchor
				}
				{
					index = 2
					validatelocalid = window
					includeparentowned = FALSE
				}
				{
					index = 0
					validatelocalid = menu
					includeparentowned = FALSE
				}
				{
					index = 0
					validatelocalid = file
					includeparentowned = FALSE
				}
			]
			Name = file_text
			visiblename = 'file_text'
			help = 'soft_assert_anchor -> window -> menu -> file => text'
			target = text
			Type = string_wchar
		}
		{
			path = [
				{
					validatelocalid = soft_assert_anchor
				}
				{
					index = 2
					validatelocalid = window
					includeparentowned = FALSE
				}
				{
					index = 0
					validatelocalid = menu
					includeparentowned = FALSE
				}
				{
					index = 1
					validatelocalid = build
					includeparentowned = FALSE
				}
			]
			Name = build_text
			visiblename = 'build_text'
			help = 'soft_assert_anchor -> window -> menu -> build => text'
			target = text
			Type = string_wchar
		}
		{
			path = [
				{
					validatelocalid = soft_assert_anchor
				}
				{
					index = 2
					validatelocalid = window
					includeparentowned = FALSE
				}
				{
					index = 0
					validatelocalid = menu
					includeparentowned = FALSE
				}
				{
					index = 2
					validatelocalid = line
					includeparentowned = FALSE
				}
			]
			Name = line_text
			visiblename = 'line_text'
			help = 'soft_assert_anchor -> window -> menu -> line => text'
			target = text
			Type = string_wchar
		}
		{
			path = [
				{
					validatelocalid = soft_assert_anchor
				}
				{
					index = 2
					validatelocalid = window
					includeparentowned = FALSE
				}
				{
					index = 0
					validatelocalid = menu
					includeparentowned = FALSE
				}
				{
					index = 3
					validatelocalid = message
					includeparentowned = FALSE
				}
			]
			Name = message_text
			visiblename = 'message_text'
			help = 'soft_assert_anchor -> window -> menu -> message => text'
			target = text
			Type = string_wchar
		}
		{
			path = [
				{
					validatelocalid = soft_assert_anchor
				}
				{
					index = 2
					validatelocalid = window
					includeparentowned = FALSE
				}
				{
					index = 0
					validatelocalid = menu
					includeparentowned = FALSE
				}
				{
					index = 4
					validatelocalid = callstack
					includeparentowned = FALSE
				}
			]
			Name = callstack_text
			visiblename = 'callstack_text'
			help = 'soft_assert_anchor -> window -> menu -> callstack => text'
			target = text
			Type = string_wchar
		}
		{
			path = [
				{
					validatelocalid = soft_assert_anchor
				}
				{
					index = 3
					validatelocalid = helper
					includeparentowned = FALSE
				}
			]
			Name = helper_text
			visiblename = 'helper_text'
			help = 'soft_assert_anchor -> helper => text'
			target = text
			Type = string_wchar
		}
		{
			path = [
				{
					validatelocalid = soft_assert_anchor
				}
				{
					index = 2
					validatelocalid = window
					includeparentowned = FALSE
				}
				{
					index = 0
					validatelocalid = menu
					includeparentowned = FALSE
				}
				{
					index = 0
					validatelocalid = file
					includeparentowned = FALSE
				}
			]
			Name = text_font
			visiblename = 'text_font'
			help = 'soft_assert_anchor -> window -> menu -> file => font'
			target = font
			Type = checksum
		}
		{
			path = [
				{
					validatelocalid = soft_assert_anchor
				}
				{
					index = 2
					validatelocalid = window
					includeparentowned = FALSE
				}
				{
					index = 0
					validatelocalid = menu
					includeparentowned = FALSE
				}
				{
					index = 1
					validatelocalid = build
					includeparentowned = FALSE
				}
			]
			Name = text_font
			visiblename = 'text_font'
			help = 'soft_assert_anchor -> window -> menu -> build => font'
			target = font
			Type = checksum
		}
		{
			path = [
				{
					validatelocalid = soft_assert_anchor
				}
				{
					index = 2
					validatelocalid = window
					includeparentowned = FALSE
				}
				{
					index = 0
					validatelocalid = menu
					includeparentowned = FALSE
				}
				{
					index = 2
					validatelocalid = line
					includeparentowned = FALSE
				}
			]
			Name = text_font
			visiblename = 'text_font'
			help = 'soft_assert_anchor -> window -> menu -> line => font'
			target = font
			Type = checksum
		}
		{
			path = [
				{
					validatelocalid = soft_assert_anchor
				}
				{
					index = 2
					validatelocalid = window
					includeparentowned = FALSE
				}
				{
					index = 0
					validatelocalid = menu
					includeparentowned = FALSE
				}
				{
					index = 3
					validatelocalid = message
					includeparentowned = FALSE
				}
			]
			Name = text_font
			visiblename = 'text_font'
			help = 'soft_assert_anchor -> window -> menu -> message => font'
			target = font
			Type = checksum
		}
		{
			path = [
				{
					validatelocalid = soft_assert_anchor
				}
				{
					index = 2
					validatelocalid = window
					includeparentowned = FALSE
				}
				{
					index = 0
					validatelocalid = menu
					includeparentowned = FALSE
				}
				{
					index = 4
					validatelocalid = callstack
					includeparentowned = FALSE
				}
			]
			Name = text_font
			visiblename = 'text_font'
			help = 'soft_assert_anchor -> window -> menu -> callstack => font'
			target = font
			Type = checksum
		}
		{
			path = [
				{
					validatelocalid = soft_assert_anchor
				}
				{
					index = 1
					validatelocalid = soft_assertion
					includeparentowned = FALSE
				}
			]
			Name = text_font
			visiblename = 'text_font'
			help = 'soft_assert_anchor -> soft_assertion => font'
			target = font
			Type = checksum
		}
		{
			path = [
				{
					validatelocalid = soft_assert_anchor
				}
				{
					index = 3
					validatelocalid = helper
					includeparentowned = FALSE
				}
			]
			Name = text_font
			visiblename = 'text_font'
			help = 'soft_assert_anchor -> helper => font'
			target = font
			Type = checksum
		}
	]
	formatversion = 2
	elements = {
		props = {
			local_id = soft_assert_anchor
			Type = ContainerElement
			hiddenlocal = FALSE
			alpha = 1.0
			dims = (1280.0, 720.0)
			just = [
				-1.0
				-1.0
			]
			pos_anchor = [
				-1.0
				-1.0
			]
			Pos = (0.0, 0.0)
			z_priority = 10000.0
			Scale = (1.0, 1.0)
			rot_angle = 0.0
			rgba = [
				255
				255
				255
				255
			]
			events_blocked = 0
			preserve_local_orientation = FALSE
		}
		children = [
			{
				props = {
					texture = white
					blend = blend
					flip_h = FALSE
					flip_v = FALSE
					local_id = background
					Type = SpriteElement
					hiddenlocal = FALSE
					alpha = 1.0
					dims = (1280.0, 720.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					Pos = (0.0, 0.0)
					z_priority = 10001.0
					Scale = (1.0, 1.0)
					rot_angle = 0.0
					rgba = [
						0
						0
						0
						200
					]
					events_blocked = 0
					preserve_local_orientation = FALSE
				}
			}
			{
				props = {
					local_id = soft_assertion
					Type = TextBlockElement
					hiddenlocal = FALSE
					alpha = 1.0
					dims = (768.0, 36.75)
					just = [
						0.0
						1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					Pos = (640.0, 72.0)
					z_priority = 10002.0
					Scale = (1.0, 1.0)
					rot_angle = 0.0
					rgba = [
						255
						255
						255
						255
					]
					events_blocked = 0
					preserve_local_orientation = FALSE
					text = qs(0x715ceda6)
					font = debug
					single_line = FALSE
					fit_width = wrap
					fit_height = `scale	down	if	larger`
					scale_mode = proportional
					internal_just = [
						0.0
						1.0
					]
					internal_scale = (0.75, 0.75)
					blend = blend
					font_spacing = -1
					override_color_tag_alpha = true
					override_color_tag_rgba = FALSE
					use_shadow = FALSE
					shadow_rgba = [
						0
						0
						0
						255
					]
					shadow_offs = (0.0, 0.0)
					line_spacing = 1.0
				}
			}
			{
				props = {
					local_id = window
					Type = WindowElement
					hiddenlocal = FALSE
					alpha = 1.0
					dims = (768.0, 576.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					Pos = (256.0, 72.0)
					z_priority = 10001.0
					Scale = (1.0, 1.0)
					rot_angle = 0.0
					rgba = [
						255
						255
						255
						255
					]
					events_blocked = 0
					preserve_local_orientation = FALSE
				}
				children = [
					{
						props = {
							local_id = menu
							Type = menuelement
							hiddenlocal = FALSE
							alpha = 1.0
							dims = (768.0, 220.5)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							Pos = (0.0, 0.0)
							z_priority = 10001.0
							Scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								255
								255
								255
								255
							]
							events_blocked = 0
							preserve_local_orientation = FALSE
							isvertical = true
							internal_just = [
								-1.0
								-1.0
							]
							regular_space_amount = -1
							padding_scale = 1.0
							spacing_between = 0
							position_children = true
						}
						children = [
							{
								props = {
									local_id = file
									Type = TextBlockElement
									hiddenlocal = FALSE
									alpha = 1.0
									dims = (768.0, 36.75)
									just = [
										-1.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									Pos = (0.0, 18.374998)
									z_priority = 10002.0
									Scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										200
										200
										200
										255
									]
									events_blocked = 0
									preserve_local_orientation = FALSE
									text = qs(0x5d7df441)
									font = debug
									single_line = FALSE
									fit_width = wrap
									fit_height = `expand	dims`
									scale_mode = proportional
									internal_just = [
										-1.0
										-1.0
									]
									internal_scale = (0.75, 0.75)
									blend = blend
									font_spacing = -1
									override_color_tag_alpha = true
									override_color_tag_rgba = FALSE
									use_shadow = FALSE
									shadow_rgba = [
										0
										0
										0
										255
									]
									shadow_offs = (3.0, 3.0)
									line_spacing = 1.0
								}
							}
							{
								props = {
									local_id = build
									Type = TextBlockElement
									hiddenlocal = FALSE
									alpha = 1.0
									dims = (768.0, 36.75)
									just = [
										-1.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									Pos = (0.0, 55.125)
									z_priority = 10002.0
									Scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										200
										200
										200
										255
									]
									events_blocked = 0
									preserve_local_orientation = FALSE
									text = qs(0x16e1c60a)
									font = debug
									single_line = FALSE
									fit_width = wrap
									fit_height = `expand	dims`
									scale_mode = proportional
									internal_just = [
										-1.0
										-1.0
									]
									internal_scale = (0.75, 0.75)
									blend = blend
									font_spacing = -1
									override_color_tag_alpha = true
									override_color_tag_rgba = FALSE
									use_shadow = FALSE
									shadow_rgba = [
										0
										0
										0
										255
									]
									shadow_offs = (3.0, 3.0)
									line_spacing = 1.0
								}
							}
							{
								props = {
									local_id = line
									Type = TextBlockElement
									hiddenlocal = FALSE
									alpha = 1.0
									dims = (768.0, 36.75)
									just = [
										-1.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									Pos = (0.0, 91.875)
									z_priority = 10002.0
									Scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										200
										200
										200
										255
									]
									events_blocked = 0
									preserve_local_orientation = FALSE
									text = qs(0x557fdea3)
									font = debug
									single_line = FALSE
									fit_width = wrap
									fit_height = `expand	dims`
									scale_mode = proportional
									internal_just = [
										-1.0
										-1.0
									]
									internal_scale = (0.75, 0.75)
									blend = blend
									font_spacing = -1
									override_color_tag_alpha = true
									override_color_tag_rgba = FALSE
									use_shadow = FALSE
									shadow_rgba = [
										0
										0
										0
										255
									]
									shadow_offs = (3.0, 3.0)
									line_spacing = 1.0
								}
							}
							{
								props = {
									local_id = message
									Type = TextBlockElement
									hiddenlocal = FALSE
									alpha = 1.0
									dims = (768.0, 36.75)
									just = [
										-1.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									Pos = (0.0, 128.62502)
									z_priority = 10002.0
									Scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										200
										200
										200
										255
									]
									events_blocked = 0
									preserve_local_orientation = FALSE
									text = qs(0xdca379bf)
									font = debug
									single_line = FALSE
									fit_width = wrap
									fit_height = `expand	dims`
									scale_mode = proportional
									internal_just = [
										-1.0
										-1.0
									]
									internal_scale = (0.75, 0.75)
									blend = blend
									font_spacing = -1
									override_color_tag_alpha = true
									override_color_tag_rgba = FALSE
									use_shadow = FALSE
									shadow_rgba = [
										0
										0
										0
										255
									]
									shadow_offs = (3.0, 3.0)
									line_spacing = 1.0
								}
							}
							{
								props = {
									local_id = callstack
									Type = TextBlockElement
									hiddenlocal = FALSE
									alpha = 1.0
									dims = (768.0, 36.75)
									just = [
										-1.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									Pos = (0.0, 165.37502)
									z_priority = 10002.0
									Scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										200
										200
										200
										255
									]
									events_blocked = 0
									preserve_local_orientation = FALSE
									text = qs(0xdf520d3a)
									font = debug
									single_line = FALSE
									fit_width = wrap
									fit_height = `expand	dims`
									scale_mode = proportional
									internal_just = [
										-1.0
										-1.0
									]
									internal_scale = (0.75, 0.75)
									blend = blend
									font_spacing = -1
									override_color_tag_alpha = true
									override_color_tag_rgba = FALSE
									use_shadow = FALSE
									shadow_rgba = [
										0
										0
										0
										255
									]
									shadow_offs = (3.0, 3.0)
									line_spacing = 1.0
								}
							}
						]
					}
				]
			}
			{
				props = {
					local_id = helper
					Type = TextBlockElement
					hiddenlocal = FALSE
					alpha = 1.0
					dims = (768.0, 36.75)
					just = [
						0.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					Pos = (640.0, 648.0)
					z_priority = 10002.0
					Scale = (1.0, 1.0)
					rot_angle = 0.0
					rgba = [
						255
						255
						255
						255
					]
					events_blocked = 0
					preserve_local_orientation = FALSE
					text = qs(0x370c4dbd)
					font = debug
					single_line = FALSE
					fit_width = `scale	each	line	if	larger`
					fit_height = `scale	down	if	larger`
					scale_mode = proportional
					internal_just = [
						0.0
						1.0
					]
					internal_scale = (0.75, 0.75)
					blend = blend
					font_spacing = -1
					override_color_tag_alpha = true
					override_color_tag_rgba = FALSE
					use_shadow = FALSE
					shadow_rgba = [
						0
						0
						0
						255
					]
					shadow_offs = (0.0, 0.0)
					line_spacing = 1.0
				}
			}
		]
	}
}
uidesc_soft_assert_nxgui = {
	workspaceform = {
		expansionstate = [
		]
	}
}
