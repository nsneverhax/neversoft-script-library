coop_career_hud_2d_elements = {
	offscreen_rock_pos = (730.0, -440.0)
	offscreen_score_pos = (730.0, -3000.0)
	rock_pos = (730.0, 440.0)
	score_pos = (730.0, 13.0)
	counter_pos = (750.0, 73.0)
	offscreen_note_streak_bar_off = (0.0, -600.0)
	scale = 0.75
	small_bulb_scale = 0.7
	big_bulb_scale = 1.0
	z = 0
	score_frame_width = 200.0
	offscreen_gamertag_pos = (0.0, -400.0)
	final_gamertag_pos = (0.0, 0.0)
	elements = [
		{
			parent_container
			element_id = hud2d_rock_container
			pos_type = offscreen_rock_pos
			create_once
		}
		{
			element_id = hud2d_2p_c_rock_shadow
			element_parent = hud2d_rock_container
			texture = hud_2p_c_rock_shadow
			dims = (128.0, 128.0)
			pos_off = (0.0, 0.0)
			zoff = -1
			create_once
		}
		{
			element_id = hud2d_rock_body
			element_parent = hud2d_rock_container
			texture = hud_2p_c_rock_body
			dims = (256.0, 256.0)
			pos_off = (0.0, 0.0)
			zoff = 5
			create_once
		}
		{
			element_id = hud2d_rock_lights_all
			element_parent = hud2d_rock_body
			texture = hud_2p_c_rock_lights_all
			pos_off = (0.0, 0.0)
			zoff = 1
			create_once
		}
		{
			element_id = hud2d_rock_lights_green
			element_parent = hud2d_rock_body
			texture = hud_2p_c_rock_light_green
			pos_off = (64.0, 16.0)
			zoff = 2
			just = [
				left
				top
			]
			alpha = 0
			create_once
		}
		{
			element_id = hud2d_rock_lights_red
			element_parent = hud2d_rock_body
			texture = hud_2p_c_rock_light_red
			pos_off = (0.0, 16.0)
			zoff = 2
			just = [
				left
				top
			]
			alpha = 0
			create_once
		}
		{
			element_id = hud2d_rock_lights_yellow
			element_parent = hud2d_rock_body
			texture = hud_2p_c_rock_light_yellow
			pos_off = (64.0, 16.0)
			zoff = 2
			just = [
				center
				top
			]
			alpha = 0
			create_once
		}
		{
			element_id = hud2d_rock_needle
			element_parent = hud2d_rock_body
			texture = hud_2p_needle
			pos_off = (68.0, 71.0)
			zoff = 3
			just = [
				0.5
				0.7
			]
			create_once
		}
		{
			parent_container
			element_id = hud2d_bulb_container_1
			element_parent = hud2d_rock_container
			pos_off = (128.0, 128.0)
			rot = -47.5
			create_once
		}
		{
			element_id = hud2d_rock_tube_1
			element_parent = hud2d_bulb_container_1
			texture = hud_rock_tube
			pos_off = (0.0, -155.0)
			element_dims = (64.0, 128.0)
			small_bulb
			zoff = 0
			just = [
				center
				center
			]
			container
			tube = {
				texture = hud_rock_tube_glow_fill
				star_texture = hud_rock_tube_glow_fill_b
				element_dims = (64.0, 16.0)
				pos_off = (0.0, 40.0)
				zoff = 0.1
				alpha = 1
			}
			full = {
				texture = hud_rock_tube_glow_full
				star_texture = hud_rock_tube_glow_full_b
				zoff = 0.2
				alpha = 0
			}
			create_once
		}
		{
			parent_container
			element_id = hud2d_bulb_container_2
			element_parent = hud2d_rock_container
			pos_off = (128.0, 128.0)
			rot = -33
			create_once
		}
		{
			element_id = hud2d_rock_tube_2
			element_parent = hud2d_bulb_container_2
			texture = hud_rock_tube
			pos_off = (0.0, -155.0)
			element_dims = (64.0, 128.0)
			small_bulb
			zoff = 0
			just = [
				center
				center
			]
			container
			tube = {
				texture = hud_rock_tube_glow_fill
				star_texture = hud_rock_tube_glow_fill_b
				element_dims = (64.0, 16.0)
				pos_off = (0.0, 40.0)
				zoff = 0.1
				alpha = 1
			}
			full = {
				texture = hud_rock_tube_glow_full
				star_texture = hud_rock_tube_glow_full_b
				zoff = 0.2
				alpha = 0
			}
			create_once
		}
		{
			parent_container
			element_id = hud2d_bulb_container_3
			element_parent = hud2d_rock_container
			pos_off = (128.0, 128.0)
			rot = -18.5
			create_once
		}
		{
			element_id = hud2d_rock_tube_3
			element_parent = hud2d_bulb_container_3
			texture = hud_rock_tube
			pos_off = (0.0, -155.0)
			element_dims = (64.0, 128.0)
			small_bulb
			zoff = 0
			just = [
				center
				center
			]
			container
			tube = {
				texture = hud_rock_tube_glow_fill
				star_texture = hud_rock_tube_glow_fill_b
				element_dims = (64.0, 16.0)
				pos_off = (0.0, 40.0)
				zoff = 0.1
				alpha = 1
			}
			full = {
				texture = hud_rock_tube_glow_full
				star_texture = hud_rock_tube_glow_full_b
				zoff = 0.2
				alpha = 0
			}
			create_once
		}
		{
			parent_container
			element_id = hud2d_bulb_container_4
			element_parent = hud2d_rock_container
			pos_off = (128.0, 128.0)
			rot = 0
			create_once
		}
		{
			element_id = hud2d_rock_tube_4
			element_parent = hud2d_bulb_container_4
			texture = hud_rock_tube
			pos_off = (0.0, -170.0)
			initial_pos = (0.0, 0.0)
			element_dims = (64.0, 128.0)
			big_bulb
			zoff = 0
			just = [
				center
				center
			]
			container
			tube = {
				texture = hud_rock_tube_glow_fill
				star_texture = hud_rock_tube_glow_fill_b
				element_dims = (64.0, 16.0)
				pos_off = (0.0, 32.0)
				zoff = 0.1
				alpha = 1
			}
			full = {
				texture = hud_rock_tube_glow_full
				star_texture = hud_rock_tube_glow_full_b
				zoff = 0.2
				alpha = 1
			}
			create_once
		}
		{
			parent_container
			element_id = hud2d_bulb_container_5
			element_parent = hud2d_rock_container
			pos_off = (128.0, 128.0)
			rot = 21
			create_once
		}
		{
			element_id = hud2d_rock_tube_5
			element_parent = hud2d_bulb_container_5
			texture = hud_rock_tube
			pos_off = (0.0, -170.0)
			initial_pos = (0.0, 0.0)
			element_dims = (64.0, 128.0)
			big_bulb
			zoff = 0
			just = [
				center
				center
			]
			container
			tube = {
				texture = hud_rock_tube_glow_fill
				star_texture = hud_rock_tube_glow_fill_b
				element_dims = (64.0, 16.0)
				pos_off = (0.0, 32.0)
				zoff = 0.1
				alpha = 1
			}
			full = {
				texture = hud_rock_tube_glow_full
				star_texture = hud_rock_tube_glow_full_b
				zoff = 0.2
				alpha = 1
			}
			create_once
		}
		{
			parent_container
			element_id = hud2d_bulb_container_6
			element_parent = hud2d_rock_container
			pos_off = (128.0, 128.0)
			rot = 42
			create_once
		}
		{
			element_id = hud2d_rock_tube_6
			element_parent = hud2d_bulb_container_6
			texture = hud_rock_tube
			pos_off = (0.0, -170.0)
			initial_pos = (0.0, 0.0)
			element_dims = (64.0, 128.0)
			big_bulb
			zoff = 0
			just = [
				center
				center
			]
			container
			tube = {
				texture = hud_rock_tube_glow_fill
				star_texture = hud_rock_tube_glow_fill_b
				element_dims = (64.0, 16.0)
				pos_off = (0.0, 32.0)
				zoff = 0.1
				alpha = 1
			}
			full = {
				texture = hud_rock_tube_glow_full
				star_texture = hud_rock_tube_glow_full_b
				zoff = 0.2
				alpha = 1
			}
			create_once
		}
		{
			parent_container
			element_id = hud2d_score_container
			pos_type = offscreen_score_pos
			create_once
		}
		{
			element_id = hud2d_score_body
			element_parent = hud2d_score_container
			texture = hud_2p_c_score_body
			dims = (256.0, 128.0)
			pos_off = (0.0, 0.0)
			zoff = 19
			create_once
		}
		{
			parent_container
			element_id = hud2d_light_container_1
			element_parent = hud2d_rock_container
			pos_off = (128.0, 128.0)
			rot = 223
			create_once
		}
		{
			element_id = hud2d_score_light_unlit_1
			element_parent = hud2d_light_container_1
			texture = hud_score_light_0
			dims = (32.0, 32.0)
			pos_off = (0.0, -80.0)
			element_dims = (32.0, 32.0)
			zoff = 0
			rot = 90
			just = [
				center
				center
			]
			create_once
			flags = {
				p1
				flip_h
			}
		}
		{
			parent_container
			element_id = hud2d_light_container_2
			element_parent = hud2d_rock_container
			pos_off = (128.0, 128.0)
			rot = 202
			create_once
		}
		{
			element_id = hud2d_score_light_unlit_2
			element_parent = hud2d_light_container_2
			texture = hud_score_light_0
			dims = (32.0, 32.0)
			pos_off = (0.0, -80.0)
			element_dims = (32.0, 32.0)
			zoff = 0
			rot = 90
			just = [
				center
				center
			]
			create_once
			flags = {
				p1
				flip_h
			}
		}
		{
			parent_container
			element_id = hud2d_light_container_3
			element_parent = hud2d_rock_container
			pos_off = (128.0, 128.0)
			rot = 181
			create_once
		}
		{
			element_id = hud2d_score_light_unlit_3
			element_parent = hud2d_light_container_3
			texture = hud_score_light_0
			dims = (32.0, 32.0)
			pos_off = (0.0, -80.0)
			element_dims = (32.0, 32.0)
			zoff = 0
			rot = 90
			just = [
				center
				center
			]
			create_once
			flags = {
				p1
				flip_h
			}
		}
		{
			parent_container
			element_id = hud2d_light_container_4
			element_parent = hud2d_rock_container
			pos_off = (128.0, 128.0)
			rot = 160
			create_once
		}
		{
			element_id = hud2d_score_light_unlit_4
			element_parent = hud2d_light_container_4
			texture = hud_score_light_0
			dims = (32.0, 32.0)
			pos_off = (0.0, -80.0)
			element_dims = (32.0, 32.0)
			zoff = 0
			rot = 90
			just = [
				center
				center
			]
			create_once
			flags = {
				p1
				flip_h
			}
		}
		{
			parent_container
			element_id = hud2d_light_container_5
			element_parent = hud2d_rock_container
			pos_off = (128.0, 128.0)
			rot = 139
			create_once
		}
		{
			element_id = hud2d_score_light_unlit_5
			element_parent = hud2d_light_container_5
			texture = hud_score_light_0
			dims = (32.0, 32.0)
			pos_off = (0.0, -80.0)
			element_dims = (32.0, 32.0)
			zoff = 0
			rot = 90
			just = [
				center
				center
			]
			create_once
			flags = {
				p1
				flip_h
			}
		}
		{
			element_id = hud2d_score_light_halflit_1
			element_parent = hud2d_light_container_1
			texture = hud_score_light_1
			dims = (32.0, 32.0)
			pos_off = (0.0, -80.0)
			element_dims = (32.0, 32.0)
			zoff = 1
			rot = 90
			just = [
				center
				center
			]
			create_once
			flags = {
				p1
				flip_h
			}
		}
		{
			element_id = hud2d_score_light_halflit_2
			element_parent = hud2d_light_container_2
			texture = hud_score_light_1
			dims = (32.0, 32.0)
			pos_off = (0.0, -80.0)
			element_dims = (32.0, 32.0)
			zoff = 1
			rot = 90
			just = [
				center
				center
			]
			create_once
			flags = {
				p1
				flip_h
			}
		}
		{
			element_id = hud2d_score_light_halflit_3
			element_parent = hud2d_light_container_3
			texture = hud_score_light_1
			dims = (32.0, 32.0)
			pos_off = (0.0, -80.0)
			element_dims = (32.0, 32.0)
			zoff = 1
			rot = 90
			just = [
				center
				center
			]
			create_once
			flags = {
				p1
				flip_h
			}
		}
		{
			element_id = hud2d_score_light_halflit_4
			element_parent = hud2d_light_container_4
			texture = hud_score_light_1
			dims = (32.0, 32.0)
			pos_off = (0.0, -80.0)
			element_dims = (32.0, 32.0)
			zoff = 1
			rot = 90
			just = [
				center
				center
			]
			create_once
			flags = {
				p1
				flip_h
			}
		}
		{
			element_id = hud2d_score_light_halflit_5
			element_parent = hud2d_light_container_5
			texture = hud_score_light_1
			dims = (32.0, 32.0)
			pos_off = (0.0, -80.0)
			element_dims = (32.0, 32.0)
			zoff = 1
			rot = 90
			just = [
				center
				center
			]
			create_once
			flags = {
				p1
				flip_h
			}
		}
		{
			element_id = hud2d_score_light_allwaylit_1
			element_parent = hud2d_light_container_1
			texture = hud_score_light_2
			dims = (32.0, 32.0)
			pos_off = (0.0, -80.0)
			element_dims = (32.0, 32.0)
			zoff = 2
			rot = 90
			just = [
				center
				center
			]
			create_once
			flags = {
				p1
				flip_h
			}
		}
		{
			element_id = hud2d_score_light_allwaylit_2
			element_parent = hud2d_light_container_2
			texture = hud_score_light_2
			dims = (32.0, 32.0)
			pos_off = (0.0, -80.0)
			element_dims = (32.0, 32.0)
			zoff = 2
			rot = 90
			just = [
				center
				center
			]
			create_once
			flags = {
				p1
				flip_h
			}
		}
		{
			element_id = hud2d_score_light_allwaylit_3
			element_parent = hud2d_light_container_3
			texture = hud_score_light_2
			dims = (32.0, 32.0)
			pos_off = (0.0, -80.0)
			element_dims = (32.0, 32.0)
			zoff = 2
			rot = 90
			just = [
				center
				center
			]
			create_once
			flags = {
				p1
				flip_h
			}
		}
		{
			element_id = hud2d_score_light_allwaylit_4
			element_parent = hud2d_light_container_4
			texture = hud_score_light_2
			dims = (32.0, 32.0)
			pos_off = (0.0, -80.0)
			element_dims = (32.0, 32.0)
			zoff = 2
			rot = 90
			just = [
				center
				center
			]
			create_once
			flags = {
				p1
				flip_h
			}
		}
		{
			element_id = hud2d_score_light_allwaylit_5
			element_parent = hud2d_light_container_5
			texture = hud_score_light_2
			dims = (32.0, 32.0)
			pos_off = (0.0, -80.0)
			element_dims = (32.0, 32.0)
			zoff = 2
			rot = 90
			just = [
				center
				center
			]
			create_once
			flags = {
				p1
				flip_h
			}
		}
		{
			element_id = hud2d_score_nixie_1a
			element_parent = hud2d_rock_container
			texture = hud_score_nixie_1a
			dims = (128.0, 128.0)
			pos_off = (70.0, 70.0)
			scale = 0.9
			zoff = 4
			alpha = 0
			create_once
		}
		{
			element_id = hud2d_score_nixie_2a
			element_parent = hud2d_rock_container
			texture = hud_score_nixie_2a
			dims = (128.0, 128.0)
			pos_off = (70.0, 70.0)
			scale = 0.9
			zoff = 4
			alpha = 0
			create_once
		}
		{
			element_id = hud2d_score_nixie_2b
			element_parent = hud2d_rock_container
			texture = hud_score_nixie_2b
			dims = (128.0, 128.0)
			pos_off = (70.0, 70.0)
			scale = 0.9
			zoff = 4
			alpha = 0
			create_once
		}
		{
			element_id = hud2d_score_nixie_3a
			element_parent = hud2d_rock_container
			texture = hud_score_nixie_3a
			dims = (128.0, 128.0)
			pos_off = (70.0, 70.0)
			scale = 0.9
			zoff = 4
			alpha = 0
			create_once
		}
		{
			element_id = hud2d_score_nixie_4a
			element_parent = hud2d_rock_container
			texture = hud_score_nixie_4a
			dims = (128.0, 128.0)
			pos_off = (70.0, 70.0)
			scale = 0.9
			zoff = 4
			alpha = 0
			create_once
		}
		{
			element_id = hud2d_score_nixie_4b
			element_parent = hud2d_rock_container
			texture = hud_score_nixie_4b
			dims = (128.0, 128.0)
			pos_off = (70.0, 70.0)
			scale = 0.9
			zoff = 4
			alpha = 0
			create_once
		}
		{
			element_id = hud2d_score_nixie_6b
			element_parent = hud2d_rock_container
			texture = hud_score_nixie_6b
			dims = (128.0, 128.0)
			pos_off = (70.0, 70.0)
			scale = 0.9
			zoff = 4
			alpha = 0
			create_once
		}
		{
			element_id = hud2d_score_nixie_8b
			element_parent = hud2d_rock_container
			texture = hud_score_nixie_8b
			dims = (128.0, 128.0)
			pos_off = (70.0, 70.0)
			scale = 0.9
			zoff = 4
			alpha = 0
			create_once
		}
		{
			element_id = hud2d_score_flash
			element_parent = hud2d_rock_container
			texture = hud_score_flash
			just = [
				center
				center
			]
			pos_off = (128.0, 128.0)
			zoff = 20
			alpha = 0
			create_once
		}
		{
			parent_container
			element_id = hud2d_note_container
			pos_type = counter_pos
			note_streak_bar
			pos_off = (0.0, 0.0)
			create_once
		}
		{
			element_id = hud2d_counter_body
			element_parent = hud2d_note_container
			texture = hud_counter_body
			dims = (256.0, 128.0)
			pos_off = (0.0, 0.0)
			zoff = 22
			create_once
		}
		{
			element_id = hud_counter_drum
			element_parent = hud2d_note_container
			texture = hud_counter_drum
			dims = (256.0, 64.0)
			pos_off = (4.0, 40.0)
			zoff = 21
			create_once
		}
		{
			element_id = hud2d_counter_drum_icon
			element_parent = hud2d_note_container
			texture = hud_counter_drum_icon
			dims = (64.0, 64.0)
			pos_off = (44.0, 40.0)
			zoff = 26
			create_once
		}
	]
}
