uidesc_jam_audio_mixer = {
	descversion = 8
	Name = uidesc_jam_audio_mixer
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
					validatelocalid = audiomixer_master_container
				}
				{
					index = 0
					validatelocalid = audio_mixer_menu_container
					includeparentowned = FALSE
				}
				{
					index = 0
					validatelocalid = audio_mixer_menu
					includeparentowned = FALSE
				}
			]
			Name = alias_audio_mixer_menu
			visiblename = 'alias_audio_mixer_menu'
			help = 'AudioMixer_master_container -> audio_mixer_menu_container -> audio_mixer_menu'
		}
		{
			path = [
				{
					validatelocalid = audiomixer_master_container
				}
				{
					index = 1
					validatelocalid = faders_container
					includeparentowned = FALSE
				}
			]
			Name = alias_faders_container
			visiblename = 'alias_faders_container'
			help = 'AudioMixer_master_container -> faders_container'
		}
		{
			path = [
				{
					validatelocalid = audiomixer_master_container
				}
				{
					index = 2
					validatelocalid = vu_lights_container
					includeparentowned = FALSE
				}
			]
			Name = alias_vu_lights_container
			visiblename = 'alias_VU_lights_container'
			help = 'AudioMixer_master_container -> VU_lights_container'
		}
	]
	props = [
		{
			path = [
				{
					validatelocalid = audiomixer_master_container
				}
				{
					index = 4
					validatelocalid = info_area
					includeparentowned = FALSE
				}
				{
					index = 1
					validatelocalid = mixer_info
					includeparentowned = FALSE
				}
			]
			Name = mixer_info_text
			visiblename = 'mixer_info_text'
			help = 'AudioMixer_master_container -> info_area -> mixer_info => text'
			target = text
			Type = string_wchar
		}
		{
			path = [
				{
					validatelocalid = audiomixer_master_container
				}
				{
					index = 3
					validatelocalid = mixer_channel_lamp
					includeparentowned = FALSE
				}
			]
			Name = mixer_channel_lamp_pos
			visiblename = 'mixer_channel_lamp_pos'
			help = 'AudioMixer_master_container -> mixer_channel_lamp => pos'
			target = Pos
			Type = pair
		}
		{
			path = [
				{
					validatelocalid = audiomixer_master_container
				}
				{
					index = 0
					validatelocalid = audio_mixer_menu_container
					includeparentowned = FALSE
				}
				{
					index = 1
					validatelocalid = mixer_menu_highlight
					includeparentowned = FALSE
				}
			]
			Name = mixer_menu_highlight_pos
			visiblename = 'mixer_menu_highlight_pos'
			help = 'AudioMixer_master_container -> audio_mixer_menu_container -> mixer_menu_highlight => pos'
			target = Pos
			Type = pair
		}
		{
			path = [
				{
					validatelocalid = audiomixer_master_container
				}
				{
					index = 0
					validatelocalid = audio_mixer_menu_container
					includeparentowned = FALSE
				}
				{
					index = 1
					validatelocalid = mixer_menu_highlight
					includeparentowned = FALSE
				}
			]
			Name = mixer_menu_highlight_alpha
			visiblename = 'mixer_menu_highlight_alpha'
			help = 'AudioMixer_master_container -> audio_mixer_menu_container -> mixer_menu_highlight => alpha'
			target = alpha
			Type = float
		}
		{
			path = [
				{
					validatelocalid = audiomixer_master_container
				}
				{
					index = 3
					validatelocalid = mixer_channel_lamp
					includeparentowned = FALSE
				}
			]
			Name = mixer_channel_lamp_alpha
			visiblename = 'mixer_channel_lamp_alpha'
			help = 'AudioMixer_master_container -> mixer_channel_lamp => alpha'
			target = alpha
			Type = float
		}
	]
	materials = [
	]
	formatversion = 2
	elements = {
		props = {
			local_id = audiomixer_master_container
			Type = ContainerElement
			hiddenlocal = FALSE
			alpha = 1.0
			dims = (10.0, 10.0)
			just = [
				-1.0
				-1.0
			]
			pos_anchor = [
				-1.0
				-1.0
			]
			Pos = (0.0, 0.0)
			z_priority = 0.0
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
					local_id = audio_mixer_menu_container
					Type = ContainerElement
					hiddenlocal = FALSE
					alpha = 1.0
					dims = (30.0, 30.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					Pos = (309.0, 373.0)
					z_priority = 1.0
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
							local_id = audio_mixer_menu
							Type = menuelement
							hiddenlocal = FALSE
							alpha = 1.0
							dims = (120.0, 471.0)
							just = [
								0.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							Pos = (-7.23233, -230.7677)
							z_priority = 1.0
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
								0.0
								0.0
							]
							regular_space_amount = -1
							padding_scale = 1.0
							spacing_between = 15
							position_children = true
							fit_major = `expand	if	content	larger`
							fit_minor = `keep	dims`
							scale_mode = proportional
							allow_wrap = true
							allow_alternate_directional_events = FALSE
						}
						children = [
							{
								props = {
									local_id = menu_item_rhythm
									Type = TextBlockElement
									hiddenlocal = FALSE
									alpha = 1.0
									dims = (135.0, 30.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									Pos = (60.0, 145.5)
									z_priority = 3.0
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
									text = qs(0x1f0659c1)
									font = fontgrid_text_a3
									material = 0x00000000
									single_line = FALSE
									fit_width = `scale	each	line	if	larger`
									fit_height = `scale	down	if	larger`
									scale_mode = `per	axis`
									text_case = Original
									internal_just = [
										0.0
										0.0
									]
									internal_scale = (1.0, 1.0)
									blend = blend
									font_spacing = -1
									override_color_tag_alpha = true
									override_color_tag_rgba = FALSE
									use_shadow = true
									shadow_rgba = [
										0
										0
										0
										255
									]
									shadow_offs = (1.0, 1.0)
									line_spacing = 1.0
								}
							}
							{
								props = {
									local_id = menu_item_lead
									Type = TextBlockElement
									hiddenlocal = FALSE
									alpha = 1.0
									dims = (135.0, 30.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									Pos = (60.0, 190.5)
									z_priority = 3.0
									Scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										128
										128
										128
										255
									]
									events_blocked = 0
									preserve_local_orientation = FALSE
									text = qs(0x0cc7d9b2)
									font = fontgrid_text_a3
									material = 0x00000000
									single_line = FALSE
									fit_width = `scale	each	line	if	larger`
									fit_height = `scale	down	if	larger`
									scale_mode = `per	axis`
									text_case = Original
									internal_just = [
										0.0
										0.0
									]
									internal_scale = (1.0, 1.0)
									blend = blend
									font_spacing = -1
									override_color_tag_alpha = true
									override_color_tag_rgba = FALSE
									use_shadow = true
									shadow_rgba = [
										0
										0
										0
										255
									]
									shadow_offs = (1.0, 1.0)
									line_spacing = 1.0
								}
							}
							{
								props = {
									local_id = menu_item_bass
									Type = TextBlockElement
									hiddenlocal = FALSE
									alpha = 1.0
									dims = (135.0, 30.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									Pos = (60.0, 235.5)
									z_priority = 3.0
									Scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										128
										128
										128
										255
									]
									events_blocked = 0
									preserve_local_orientation = FALSE
									text = qs(0x7d4f9214)
									font = fontgrid_text_a3
									material = 0x00000000
									single_line = FALSE
									fit_width = `scale	each	line	if	larger`
									fit_height = `scale	down	if	larger`
									scale_mode = `per	axis`
									text_case = Original
									internal_just = [
										0.0
										0.0
									]
									internal_scale = (1.0, 1.0)
									blend = blend
									font_spacing = -1
									override_color_tag_alpha = true
									override_color_tag_rgba = FALSE
									use_shadow = true
									shadow_rgba = [
										0
										0
										0
										255
									]
									shadow_offs = (1.0, 1.0)
									line_spacing = 1.0
								}
							}
							{
								props = {
									local_id = menu_item_drums
									Type = TextBlockElement
									hiddenlocal = FALSE
									alpha = 1.0
									dims = (135.0, 30.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									Pos = (60.0, 280.5)
									z_priority = 3.0
									Scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										128
										128
										128
										255
									]
									events_blocked = 0
									preserve_local_orientation = FALSE
									text = qs(0x388cd3db)
									font = fontgrid_text_a3
									material = 0x00000000
									single_line = FALSE
									fit_width = `scale	each	line	if	larger`
									fit_height = `scale	down	if	larger`
									scale_mode = `per	axis`
									text_case = Original
									internal_just = [
										0.0
										0.0
									]
									internal_scale = (1.0, 1.0)
									blend = blend
									font_spacing = -1
									override_color_tag_alpha = true
									override_color_tag_rgba = FALSE
									use_shadow = true
									shadow_rgba = [
										0
										0
										0
										255
									]
									shadow_offs = (1.0, 1.0)
									line_spacing = 1.0
								}
							}
							{
								props = {
									local_id = menu_item_keyboard
									Type = TextBlockElement
									hiddenlocal = FALSE
									alpha = 1.0
									dims = (135.0, 30.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									Pos = (60.0, 325.5)
									z_priority = 3.0
									Scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										128
										128
										128
										255
									]
									events_blocked = 0
									preserve_local_orientation = FALSE
									text = qs(0x58ce03d1)
									font = fontgrid_text_a3
									material = 0x00000000
									single_line = FALSE
									fit_width = `scale	each	line	if	larger`
									fit_height = `scale	down	if	larger`
									scale_mode = `per	axis`
									text_case = Original
									internal_just = [
										0.0
										0.0
									]
									internal_scale = (1.0, 1.0)
									blend = blend
									font_spacing = -1
									override_color_tag_alpha = true
									override_color_tag_rgba = FALSE
									use_shadow = true
									shadow_rgba = [
										0
										0
										0
										255
									]
									shadow_offs = (1.0, 1.0)
									line_spacing = 1.0
								}
							}
						]
					}
					{
						props = {
							blend = blend
							texture = mixer_menu_highlight
							local_id = mixer_menu_highlight
							Type = SpriteElement
							hiddenlocal = FALSE
							alpha = 1.0
							dims = (170.0, 35.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							Pos = (-11.0, -84.0)
							z_priority = 2.0
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
					}
					{
						props = {
							local_id = tape_stops
							Type = ContainerElement
							hiddenlocal = FALSE
							alpha = 1.0
							dims = (100.0, 100.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							Pos = (100.0, 116.0)
							z_priority = 2.0
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
									blend = blend
									texture = mix_tape_001
									local_id = mix_tape_001
									Type = SpriteElement
									hiddenlocal = FALSE
									alpha = 1.0
									dims = (128.0, 64.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										0.0
										0.0
									]
									Pos = (7.686188, 13.974128)
									z_priority = 5.0
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
							}
							{
								props = {
									blend = blend
									texture = mix_tape_003
									local_id = mix_tape_003
									Type = SpriteElement
									hiddenlocal = FALSE
									alpha = 1.0
									dims = (128.0, 64.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										0.0
										0.0
									]
									Pos = (131.35529, 14.540093)
									z_priority = 5.0
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
							}
							{
								props = {
									blend = blend
									texture = mix_tape_004
									local_id = mix_tape_004
									Type = SpriteElement
									hiddenlocal = FALSE
									alpha = 1.0
									dims = (128.0, 64.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										0.0
										0.0
									]
									Pos = (254.09332, 19.534332)
									z_priority = 5.0
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
							}
							{
								props = {
									blend = blend
									texture = mix_tape_005
									local_id = mix_tape_005
									Type = SpriteElement
									hiddenlocal = FALSE
									alpha = 1.0
									dims = (128.0, 64.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										0.0
										0.0
									]
									Pos = (379.98288, 21.246368)
									z_priority = 5.0
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
							}
							{
								props = {
									blend = blend
									texture = mix_tape_006
									local_id = mix_tape_006
									Type = SpriteElement
									hiddenlocal = FALSE
									alpha = 1.0
									dims = (128.0, 64.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										0.0
										0.0
									]
									Pos = (504.97412, 19.290956)
									z_priority = 6.0
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
							}
						]
					}
				]
			}
			{
				props = {
					local_id = faders_container
					Type = menuelement
					hiddenlocal = FALSE
					alpha = 1.0
					dims = (650.0, 550.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					Pos = (371.92297, 41.92405)
					z_priority = 1.0
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
					isvertical = FALSE
					internal_just = [
						-1.0
						0.0
					]
					regular_space_amount = 125
					padding_scale = 1.0
					spacing_between = 0
					position_children = true
					fit_major = `expand	if	content	larger`
					fit_minor = `keep	dims`
					scale_mode = proportional
					allow_wrap = true
					allow_alternate_directional_events = FALSE
				}
				children = [
					{
						props = {
							local_id = fader_rhythm_desc
							Type = descinterface
							hiddenlocal = FALSE
							alpha = 1.0
							dims = (130.0, 550.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							Pos = (62.5, 275.0)
							z_priority = 2.0
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
							desc = 'options_audio_mixer_fader_desc'
							autosizedims = true
							knob_highlight_alpha = 0.0
							mixer_knob_rot_angle = 90.0
							mixer_fader_highlight_alpha = 0.0
							mixer_fader_pos = (0.0, 0.0)
							mixer_icon_texture = mixer_icon_guitar
							mixer_knob_detent_texture = mixer_knob_three
							mixer_knob_container_alpha = 1.0
							mixer_icon_alpha = 1.0
							knob_highlight_rgba = [
								0
								250
								154
								255
							]
							mixer_fader_highlight_rgba = [
								0
								250
								154
								255
							]
							knob_note_text = qs(0x00000000)
						}
					}
					{
						props = {
							local_id = fader_lead_desc
							Type = descinterface
							hiddenlocal = FALSE
							alpha = 1.0
							dims = (130.0, 550.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							Pos = (187.5, 275.0)
							z_priority = 2.0
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
							desc = 'options_audio_mixer_fader_desc'
							autosizedims = true
							knob_highlight_alpha = 0.0
							mixer_knob_rot_angle = 90.0
							mixer_fader_highlight_alpha = 0.0
							mixer_fader_pos = (0.0, 0.0)
							mixer_icon_texture = mixer_icon_guitar
							mixer_knob_detent_texture = mixer_knob_three
							mixer_knob_container_alpha = 1.0
							mixer_icon_alpha = 1.0
							knob_highlight_rgba = [
								0
								250
								154
								255
							]
							mixer_fader_highlight_rgba = [
								0
								250
								154
								255
							]
							knob_note_text = qs(0x00000000)
						}
					}
					{
						props = {
							local_id = fader_bass_desc
							Type = descinterface
							hiddenlocal = FALSE
							alpha = 1.0
							dims = (130.0, 550.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							Pos = (312.5, 275.0)
							z_priority = 2.0
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
							desc = 'options_audio_mixer_fader_desc'
							autosizedims = true
							knob_highlight_alpha = 0.0
							mixer_knob_rot_angle = 90.0
							mixer_fader_highlight_alpha = 0.0
							mixer_fader_pos = (0.0, 0.0)
							mixer_icon_texture = mixer_icon_bass
							mixer_knob_detent_texture = mixer_knob_three
							mixer_knob_container_alpha = 1.0
							mixer_icon_alpha = 1.0
							knob_highlight_rgba = [
								0
								250
								154
								255
							]
							mixer_fader_highlight_rgba = [
								0
								250
								154
								255
							]
							knob_note_text = qs(0x00000000)
						}
					}
					{
						props = {
							local_id = fader_drums_desc
							Type = descinterface
							hiddenlocal = FALSE
							alpha = 1.0
							dims = (130.0, 550.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							Pos = (437.5, 275.0)
							z_priority = 2.0
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
							desc = 'options_audio_mixer_fader_desc'
							autosizedims = true
							knob_highlight_alpha = 0.0
							mixer_knob_rot_angle = 90.0
							mixer_fader_highlight_alpha = 0.0
							mixer_fader_pos = (0.0, 0.0)
							mixer_icon_texture = mixer_icon_drums
							mixer_knob_detent_texture = mixer_knob_three
							mixer_knob_container_alpha = 1.0
							mixer_icon_alpha = 1.0
							knob_highlight_rgba = [
								0
								250
								154
								255
							]
							mixer_fader_highlight_rgba = [
								0
								250
								154
								255
							]
							knob_note_text = qs(0x00000000)
						}
					}
					{
						props = {
							local_id = fader_keyboard_desc
							Type = descinterface
							hiddenlocal = FALSE
							alpha = 1.0
							dims = (130.0, 550.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							Pos = (562.5, 275.0)
							z_priority = 2.0
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
							desc = 'options_audio_mixer_fader_desc'
							autosizedims = true
							knob_highlight_alpha = 0.0
							mixer_knob_rot_angle = 90.0
							mixer_fader_highlight_alpha = 0.0
							mixer_fader_pos = (0.0, 0.0)
							mixer_icon_texture = mixer_icon_crowd
							mixer_knob_detent_texture = mixer_knob_three
							mixer_knob_container_alpha = 1.0
							mixer_icon_alpha = 1.0
							knob_highlight_rgba = [
								0
								250
								154
								255
							]
							mixer_fader_highlight_rgba = [
								0
								250
								154
								255
							]
							knob_note_text = qs(0x00000000)
						}
					}
				]
			}
			{
				props = {
					local_id = vu_lights_container
					Type = menuelement
					hiddenlocal = FALSE
					alpha = 1.0
					dims = (20.0, 245.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					Pos = (1010.41907, 388.98288)
					z_priority = 1.0
					Scale = (1.0, 1.0)
					rot_angle = 180.0
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
						0.0
						0.0
					]
					regular_space_amount = -1
					padding_scale = 1.0
					spacing_between = 5
					position_children = true
					fit_major = `expand	if	content	larger`
					fit_minor = `keep	dims`
					scale_mode = proportional
					allow_wrap = true
					allow_alternate_directional_events = FALSE
				}
				children = [
					{
						props = {
							blend = blend
							texture = mixer_bulb
							local_id = mixer_bulb_01
							Type = SpriteElement
							hiddenlocal = FALSE
							alpha = 1.0
							dims = (20.0, 20.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							Pos = (10.0, 10.0)
							z_priority = 2.0
							Scale = (1.0, 1.0)
							rot_angle = 180.0
							rgba = [
								0
								250
								154
								255
							]
							events_blocked = 0
							preserve_local_orientation = FALSE
						}
					}
					{
						props = {
							blend = blend
							texture = mixer_bulb
							local_id = mixer_bulb_02
							Type = SpriteElement
							hiddenlocal = FALSE
							alpha = 1.0
							dims = (20.0, 20.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							Pos = (10.0, 35.0)
							z_priority = 2.0
							Scale = (1.0, 1.0)
							rot_angle = 180.0
							rgba = [
								0
								250
								154
								255
							]
							events_blocked = 0
							preserve_local_orientation = FALSE
						}
					}
					{
						props = {
							blend = blend
							texture = mixer_bulb
							local_id = mixer_bulb_03
							Type = SpriteElement
							hiddenlocal = FALSE
							alpha = 1.0
							dims = (20.0, 20.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							Pos = (10.0, 60.0)
							z_priority = 2.0
							Scale = (1.0, 1.0)
							rot_angle = 180.0
							rgba = [
								0
								250
								154
								255
							]
							events_blocked = 0
							preserve_local_orientation = FALSE
						}
					}
					{
						props = {
							blend = blend
							texture = mixer_bulb
							local_id = mixer_bulb_04
							Type = SpriteElement
							hiddenlocal = FALSE
							alpha = 1.0
							dims = (20.0, 20.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							Pos = (10.0, 85.0)
							z_priority = 2.0
							Scale = (1.0, 1.0)
							rot_angle = 180.0
							rgba = [
								0
								250
								154
								255
							]
							events_blocked = 0
							preserve_local_orientation = FALSE
						}
					}
					{
						props = {
							blend = blend
							texture = mixer_bulb
							local_id = mixer_bulb_05
							Type = SpriteElement
							hiddenlocal = FALSE
							alpha = 1.0
							dims = (20.0, 20.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							Pos = (10.0, 110.0)
							z_priority = 2.0
							Scale = (1.0, 1.0)
							rot_angle = 180.0
							rgba = [
								0
								250
								154
								255
							]
							events_blocked = 0
							preserve_local_orientation = FALSE
						}
					}
					{
						props = {
							blend = blend
							texture = mixer_bulb
							local_id = mixer_bulb_06
							Type = SpriteElement
							hiddenlocal = FALSE
							alpha = 1.0
							dims = (20.0, 20.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							Pos = (10.0, 135.0)
							z_priority = 2.0
							Scale = (1.0, 1.0)
							rot_angle = 180.0
							rgba = [
								0
								250
								154
								255
							]
							events_blocked = 0
							preserve_local_orientation = FALSE
						}
					}
					{
						props = {
							blend = blend
							texture = mixer_bulb
							local_id = mixer_bulb_07
							Type = SpriteElement
							hiddenlocal = FALSE
							alpha = 1.0
							dims = (20.0, 20.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							Pos = (10.0, 160.0)
							z_priority = 2.0
							Scale = (1.0, 1.0)
							rot_angle = 180.0
							rgba = [
								218
								165
								32
								255
							]
							events_blocked = 0
							preserve_local_orientation = FALSE
						}
					}
					{
						props = {
							blend = blend
							texture = mixer_bulb
							local_id = mixer_bulb_08
							Type = SpriteElement
							hiddenlocal = FALSE
							alpha = 1.0
							dims = (20.0, 20.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							Pos = (10.0, 185.0)
							z_priority = 2.0
							Scale = (1.0, 1.0)
							rot_angle = 180.0
							rgba = [
								218
								165
								32
								255
							]
							events_blocked = 0
							preserve_local_orientation = FALSE
						}
					}
					{
						props = {
							blend = blend
							texture = mixer_bulb
							local_id = mixer_bulb_09
							Type = SpriteElement
							hiddenlocal = FALSE
							alpha = 1.0
							dims = (20.0, 20.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							Pos = (10.0, 210.0)
							z_priority = 2.0
							Scale = (1.0, 1.0)
							rot_angle = 180.0
							rgba = [
								255
								128
								128
								255
							]
							events_blocked = 0
							preserve_local_orientation = FALSE
						}
					}
					{
						props = {
							blend = blend
							texture = mixer_bulb
							local_id = mixer_bulb_10
							Type = SpriteElement
							hiddenlocal = FALSE
							alpha = 1.0
							dims = (20.0, 20.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							Pos = (10.0, 235.0)
							z_priority = 2.0
							Scale = (1.0, 1.0)
							rot_angle = 180.0
							rgba = [
								255
								128
								128
								255
							]
							events_blocked = 0
							preserve_local_orientation = FALSE
						}
					}
				]
			}
			{
				props = {
					texture = mixer_channel_lamp
					blend = add
					local_id = mixer_channel_lamp
					Type = SpriteElement
					hiddenlocal = FALSE
					alpha = 1.0
					dims = (180.0, 650.0)
					just = [
						0.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					Pos = (436.35968, 0.0)
					z_priority = 3.0
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
			}
			{
				props = {
					local_id = info_area
					Type = ContainerElement
					hiddenlocal = FALSE
					alpha = 1.0
					dims = (100.0, 100.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					Pos = (702.43353, 598.3912)
					z_priority = 1.0
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
							blend = blend
							texture = mixer_info_area
							local_id = mixer_info_frame
							Type = SpriteElement
							hiddenlocal = FALSE
							alpha = 1.0
							dims = (760.0, 100.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							Pos = (50.265884, 50.26594)
							z_priority = 1.0
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
					}
					{
						props = {
							local_id = mixer_info
							Type = TextBlockElement
							hiddenlocal = FALSE
							alpha = 1.0
							dims = (600.00006, 70.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							Pos = (0.0, 0.0)
							z_priority = 2.0
							Scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								128
								64
								64
								255
							]
							events_blocked = 0
							preserve_local_orientation = FALSE
							text = qs(0xbc3aebfc)
							font = fontgrid_text_a6
							material = 0x00000000
							single_line = FALSE
							fit_width = wrap
							fit_height = `scale	down	if	larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								0.0
								0.0
							]
							internal_scale = (1.0, 1.0)
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
							line_spacing = 0.8
						}
					}
				]
			}
			{
				props = {
					blend = blend
					texture = mixer_bg
					local_id = mixer_bg
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
					z_priority = 1.0
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
			}
			{
				props = {
					local_id = mixer_screws
					Type = ContainerElement
					hiddenlocal = FALSE
					alpha = 1.0
					dims = (50.0, 50.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					Pos = (0.0, 0.0)
					z_priority = 3.0
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
							blend = blend
							texture = mixer_screw
							local_id = mixer_screw_tl
							Type = SpriteElement
							hiddenlocal = FALSE
							alpha = 1.0
							dims = (45.0, 45.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							Pos = (234.53175, 11.204512)
							z_priority = 3.0
							Scale = (1.0, 1.0)
							rot_angle = 15.0
							rgba = [
								255
								255
								255
								255
							]
							events_blocked = 0
							preserve_local_orientation = FALSE
						}
					}
					{
						props = {
							blend = blend
							texture = mixer_screw
							local_id = mixer_screw_br
							Type = SpriteElement
							hiddenlocal = FALSE
							alpha = 1.0
							dims = (40.0, 40.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							Pos = (997.60016, 658.43823)
							z_priority = 3.0
							Scale = (1.0, 1.0)
							rot_angle = 20.0
							rgba = [
								255
								255
								255
								255
							]
							events_blocked = 0
							preserve_local_orientation = FALSE
						}
					}
					{
						props = {
							blend = blend
							texture = mixer_screw
							local_id = mixer_screw_tr
							Type = SpriteElement
							hiddenlocal = FALSE
							alpha = 1.0
							dims = (40.0, 40.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							Pos = (996.50964, 16.558783)
							z_priority = 3.0
							Scale = (1.0, 1.0)
							rot_angle = -8.0
							rgba = [
								255
								255
								255
								255
							]
							events_blocked = 0
							preserve_local_orientation = FALSE
						}
					}
					{
						props = {
							blend = blend
							texture = mixer_screw
							local_id = mixer_screw_bl
							Type = SpriteElement
							hiddenlocal = FALSE
							alpha = 1.0
							dims = (55.0, 55.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							Pos = (230.9766, 655.83167)
							z_priority = 3.0
							Scale = (1.0, 1.0)
							rot_angle = 5.0
							rgba = [
								255
								255
								255
								255
							]
							events_blocked = 0
							preserve_local_orientation = FALSE
						}
					}
				]
			}
			{
				props = {
					local_id = dividers
					Type = ContainerElement
					hiddenlocal = FALSE
					alpha = 1.0
					dims = (100.0, 100.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					Pos = (100.0, 100.0)
					z_priority = 1.0
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
							blend = blend
							local_id = divider_01
							Type = SpriteElement
							hiddenlocal = FALSE
							alpha = 0.2
							dims = (3.0, 540.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							Pos = (329.962, 228.88602)
							z_priority = 2.0
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
					}
					{
						props = {
							blend = blend
							local_id = divider_02
							Type = SpriteElement
							hiddenlocal = FALSE
							alpha = 0.2
							dims = (3.0, 540.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							Pos = (442.962, 228.88602)
							z_priority = 2.0
							Scale = (1.0, 1.0)
							rot_angle = 1.5
							rgba = [
								255
								255
								255
								255
							]
							events_blocked = 0
							preserve_local_orientation = FALSE
						}
					}
					{
						props = {
							blend = blend
							local_id = divider_03
							Type = SpriteElement
							hiddenlocal = FALSE
							alpha = 0.2
							dims = (3.0, 540.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							Pos = (570.96204, 228.88602)
							z_priority = 2.0
							Scale = (1.0, 1.0)
							rot_angle = 1.0
							rgba = [
								255
								255
								255
								255
							]
							events_blocked = 0
							preserve_local_orientation = FALSE
						}
					}
					{
						props = {
							blend = blend
							local_id = divider_04
							Type = SpriteElement
							hiddenlocal = FALSE
							alpha = 0.2
							dims = (3.0, 540.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							Pos = (696.96204, 228.88602)
							z_priority = 2.0
							Scale = (1.0, 1.0)
							rot_angle = 2.0
							rgba = [
								255
								255
								255
								255
							]
							events_blocked = 0
							preserve_local_orientation = FALSE
						}
					}
					{
						props = {
							blend = blend
							local_id = divider_05
							Type = SpriteElement
							hiddenlocal = FALSE
							alpha = 0.2
							dims = (3.0, 540.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							Pos = (817.96204, 228.88602)
							z_priority = 2.0
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
					}
					{
						props = {
							blend = blend
							local_id = divider_06
							Type = SpriteElement
							hiddenlocal = FALSE
							alpha = 0.2
							dims = (3.0, 540.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							Pos = (935.96204, 228.88602)
							z_priority = 2.0
							Scale = (1.0, 1.0)
							rot_angle = 0.5
							rgba = [
								255
								255
								255
								255
							]
							events_blocked = 0
							preserve_local_orientation = FALSE
						}
					}
				]
			}
		]
	}
}
uidesc_jam_audio_mixer_nxgui = {
	workspaceform = {
		expansionstate = [
			1
			2
			9
			33
			37
			42
		]
	}
	editmaterialform = {
	}
}
