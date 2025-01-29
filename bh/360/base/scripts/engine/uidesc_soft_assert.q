uidesc_soft_assert = {
	DescVersion = 1
	name = uidesc_soft_assert
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
					validateLocalID = soft_assert_anchor
				}
				{
					index = 2
					validateLocalID = window
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = Menu
					includeParentOwned = false
				}
			]
			name = alias_Menu
			visiblename = 'alias_menu'
			help = 'soft_assert_anchor -> window -> menu'
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = soft_assert_anchor
				}
				{
					index = 2
					validateLocalID = window
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = Menu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = file
					includeParentOwned = false
				}
			]
			name = file_text
			visiblename = 'file_text'
			help = 'soft_assert_anchor -> window -> menu -> file => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = soft_assert_anchor
				}
				{
					index = 2
					validateLocalID = window
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = Menu
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = build
					includeParentOwned = false
				}
			]
			name = build_text
			visiblename = 'build_text'
			help = 'soft_assert_anchor -> window -> menu -> build => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = soft_assert_anchor
				}
				{
					index = 2
					validateLocalID = window
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = Menu
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = line
					includeParentOwned = false
				}
			]
			name = line_text
			visiblename = 'line_text'
			help = 'soft_assert_anchor -> window -> menu -> line => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = soft_assert_anchor
				}
				{
					index = 2
					validateLocalID = window
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = Menu
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = message
					includeParentOwned = false
				}
			]
			name = message_text
			visiblename = 'message_text'
			help = 'soft_assert_anchor -> window -> menu -> message => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = soft_assert_anchor
				}
				{
					index = 2
					validateLocalID = window
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = Menu
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = callstack
					includeParentOwned = false
				}
			]
			name = callstack_text
			visiblename = 'callstack_text'
			help = 'soft_assert_anchor -> window -> menu -> callstack => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = soft_assert_anchor
				}
				{
					index = 3
					validateLocalID = helper
					includeParentOwned = false
				}
			]
			name = helper_text
			visiblename = 'helper_text'
			help = 'soft_assert_anchor -> helper => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = soft_assert_anchor
				}
				{
					index = 2
					validateLocalID = window
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = Menu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = file
					includeParentOwned = false
				}
			]
			name = text_font
			visiblename = 'text_font'
			help = 'soft_assert_anchor -> window -> menu -> file => font'
			target = font
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = soft_assert_anchor
				}
				{
					index = 2
					validateLocalID = window
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = Menu
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = build
					includeParentOwned = false
				}
			]
			name = text_font
			visiblename = 'text_font'
			help = 'soft_assert_anchor -> window -> menu -> build => font'
			target = font
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = soft_assert_anchor
				}
				{
					index = 2
					validateLocalID = window
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = Menu
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = line
					includeParentOwned = false
				}
			]
			name = text_font
			visiblename = 'text_font'
			help = 'soft_assert_anchor -> window -> menu -> line => font'
			target = font
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = soft_assert_anchor
				}
				{
					index = 2
					validateLocalID = window
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = Menu
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = message
					includeParentOwned = false
				}
			]
			name = text_font
			visiblename = 'text_font'
			help = 'soft_assert_anchor -> window -> menu -> message => font'
			target = font
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = soft_assert_anchor
				}
				{
					index = 2
					validateLocalID = window
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = Menu
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = callstack
					includeParentOwned = false
				}
			]
			name = text_font
			visiblename = 'text_font'
			help = 'soft_assert_anchor -> window -> menu -> callstack => font'
			target = font
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = soft_assert_anchor
				}
				{
					index = 1
					validateLocalID = soft_assertion
					includeParentOwned = false
				}
			]
			name = text_font
			visiblename = 'text_font'
			help = 'soft_assert_anchor -> soft_assertion => font'
			target = font
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = soft_assert_anchor
				}
				{
					index = 3
					validateLocalID = helper
					includeParentOwned = false
				}
			]
			name = text_font
			visiblename = 'text_font'
			help = 'soft_assert_anchor -> helper => font'
			target = font
			type = checksum
		}
	]
	FormatVersion = 2
	Elements = {
		props = {
			local_id = soft_assert_anchor
			type = ContainerElement
			hiddenLocal = false
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
			scale = (1.0, 1.0)
			rot_angle = 0.0
			rgba = [
				255
				255
				255
				255
			]
			events_blocked = 0
			preserve_local_orientation = false
		}
		children = [
			{
				props = {
					texture = white
					blend = blend
					flip_h = false
					flip_v = false
					local_id = background
					type = SpriteElement
					hiddenLocal = false
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
					scale = (1.0, 1.0)
					rot_angle = 0.0
					rgba = [
						0
						0
						0
						200
					]
					events_blocked = 0
					preserve_local_orientation = false
				}
			}
			{
				props = {
					local_id = soft_assertion
					type = TextBlockElement
					hiddenLocal = false
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
					scale = (1.0, 1.0)
					rot_angle = 0.0
					rgba = [
						255
						255
						255
						255
					]
					events_blocked = 0
					preserve_local_orientation = false
					text = qs(0x715ceda6)
					font = debug
					single_line = false
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
					override_color_tag_rgba = false
					use_shadow = false
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
					type = WindowElement
					hiddenLocal = false
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
					scale = (1.0, 1.0)
					rot_angle = 0.0
					rgba = [
						255
						255
						255
						255
					]
					events_blocked = 0
					preserve_local_orientation = false
				}
				children = [
					{
						props = {
							local_id = Menu
							type = MenuElement
							hiddenLocal = false
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
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								255
								255
								255
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							isVertical = true
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
									type = TextBlockElement
									hiddenLocal = false
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
									scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										200
										200
										200
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
									text = qs(0x5d7df441)
									font = debug
									single_line = false
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
									override_color_tag_rgba = false
									use_shadow = false
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
									type = TextBlockElement
									hiddenLocal = false
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
									scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										200
										200
										200
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
									text = qs(0x16e1c60a)
									font = debug
									single_line = false
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
									override_color_tag_rgba = false
									use_shadow = false
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
									type = TextBlockElement
									hiddenLocal = false
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
									scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										200
										200
										200
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
									text = qs(0x557fdea3)
									font = debug
									single_line = false
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
									override_color_tag_rgba = false
									use_shadow = false
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
									type = TextBlockElement
									hiddenLocal = false
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
									scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										200
										200
										200
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
									text = qs(0xdca379bf)
									font = debug
									single_line = false
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
									override_color_tag_rgba = false
									use_shadow = false
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
									type = TextBlockElement
									hiddenLocal = false
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
									scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										200
										200
										200
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
									text = qs(0xdf520d3a)
									font = debug
									single_line = false
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
									override_color_tag_rgba = false
									use_shadow = false
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
					type = TextBlockElement
					hiddenLocal = false
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
					scale = (1.0, 1.0)
					rot_angle = 0.0
					rgba = [
						255
						255
						255
						255
					]
					events_blocked = 0
					preserve_local_orientation = false
					text = qs(0x319a4e33)
					font = debug
					single_line = false
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
					override_color_tag_rgba = false
					use_shadow = false
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
	WorkspaceForm = {
		ExpansionState = [
		]
	}
}
