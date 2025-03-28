net_faceoff_hud_2d_elements_solo = {
	offscreen_rock_pos = (660.0, -600.0)
	rock_pos = (660.0, 60.0)
	offscreen_score_pos = (-750.0, 100.0)
	score_pos = (280.0, 100.0)
	counter_pos = (293.0, 270.0)
	offscreen_score_pos_p2 = (1950.0, 100.0)
	score_pos_p2 = (1140.0, 100.0)
	counter_pos_p2 = (1153.0, 270.0)
	offscreen_note_streak_bar_off = (0.0, -400.0)
	Scale = 0.75
	small_bulb_scale = 0.7
	big_bulb_scale = 1.0
	z = 0
	score_frame_width = 175.0
	offscreen_gamertag_pos = (0.0, -400.0)
	final_gamertag_pos = (0.0, 0.0)
	elements = [
		{
			parent_container
			element_id = HUD2D_rock_container
			pos_type = offscreen_rock_pos
			create_once
		}
		{
			element_id = HUD2D_rock_body
			element_parent = HUD2D_rock_container
			texture = HUD_2p_c_rock_frame
			pos_off = (0.0, 0.0)
			zoff = 20
			Scale = 1.5
			create_once
		}
		{
			element_id = HUD2D_rock_BG_p1
			element_parent = HUD2D_rock_body
			texture = HUD_2p_c_rock_BG_p1
			pos_off = (0.0, 0.0)
			zoff = 16
			alpha = 0
			create_once
		}
		{
			element_id = HUD2D_rock_BG_p2
			element_parent = HUD2D_rock_body
			texture = HUD_2p_c_rock_BG_p2
			pos_off = (0.0, 0.0)
			zoff = 16
			alpha = 0
			create_once
		}
		{
			element_id = HUD2D_rock_BG_off
			element_parent = HUD2D_rock_body
			texture = HUD_2p_c_rock_BG_off
			pos_off = (0.0, 0.0)
			zoff = 15
			create_once
		}
		{
			element_id = HUD2D_rock_needle
			element_parent = HUD2D_rock_body
			texture = HUD_rock_needle
			pos_off = (132.0, 145.0)
			zoff = 19
			just = [
				0.5
				0.75
			]
			dims = (16.0, 100.0)
			create_once
		}
		{
			element_id = HUD2D_rock_crystal_p1
			element_parent = HUD2D_rock_body
			texture = HUD_2p_c_rock_crystal_p1
			pos_off = (64.0, 64.0)
			zoff = 21
			alpha = 0
			create_once
		}
		{
			element_id = HUD2D_rock_crystal_p2
			element_parent = HUD2D_rock_body
			texture = HUD_2p_c_rock_crystal_p2
			pos_off = (64.0, 64.0)
			zoff = 21
			alpha = 0
			create_once
		}
		{
			element_id = HUD2D_rock_crystal_off
			element_parent = HUD2D_rock_body
			texture = HUD_2p_c_rock_crystal_off
			pos_off = (64.0, 64.0)
			zoff = 20
			create_once
		}
		{
			parent_container
			element_id = HUD2D_score_container
			pos_type = offscreen_score_pos
		}
		{
			element_id = HUD2D_score_body
			element_parent = HUD2D_score_container
			texture = HUD_score_body
			pos_type = score_pos
			pos_off = (0.0, 0.0)
			zoff = 5
		}
		{
			parent_container
			element_id = HUD2D_bulb_container
			element_parent = HUD2D_score_container
			pos_off = (0.0, 0.0)
			rot = 90
			rot_p2 = 270
		}
		{
			element_id = HUD2D_rock_tube_1
			element_parent = HUD2D_bulb_container
			texture = HUD_rock_tube
			pos_off = (218.0, -260.0)
			pos_off_p2 = (-218.0, 10.0)
			element_dims = (64.0, 128.0)
			small_bulb
			zoff = 0
			just = [
				center
				center
			]
			container
			tube = {
				texture = HUD_rock_tube_glow_fill
				star_texture = HUD_rock_tube_glow_fill_b
				element_dims = (64.0, 16.0)
				pos_off = (0.0, 40.0)
				zoff = 0.1
				alpha = 1
			}
			full = {
				texture = HUD_rock_tube_glow_full
				star_texture = HUD_rock_tube_glow_full_b
				zoff = 0.2
				alpha = 0
			}
		}
		{
			element_id = HUD2D_rock_tube_2
			element_parent = HUD2D_bulb_container
			texture = HUD_rock_tube
			pos_off = (191.0, -260.0)
			pos_off_p2 = (-191.0, 10.0)
			element_dims = (64.0, 128.0)
			small_bulb
			zoff = 0
			just = [
				center
				center
			]
			container
			tube = {
				texture = HUD_rock_tube_glow_fill
				star_texture = HUD_rock_tube_glow_fill_b
				element_dims = (64.0, 16.0)
				pos_off = (0.0, 40.0)
				zoff = 0.1
				alpha = 1
			}
			full = {
				texture = HUD_rock_tube_glow_full
				star_texture = HUD_rock_tube_glow_full_b
				zoff = 0.2
				alpha = 0
			}
		}
		{
			element_id = HUD2D_rock_tube_3
			element_parent = HUD2D_bulb_container
			texture = HUD_rock_tube
			pos_off = (164.0, -260.0)
			pos_off_p2 = (-164.0, 10.0)
			element_dims = (64.0, 128.0)
			small_bulb
			zoff = 0
			just = [
				center
				center
			]
			container
			tube = {
				texture = HUD_rock_tube_glow_fill
				star_texture = HUD_rock_tube_glow_fill_b
				element_dims = (64.0, 16.0)
				pos_off = (0.0, 40.0)
				zoff = 0.1
				alpha = 1
			}
			full = {
				texture = HUD_rock_tube_glow_full
				star_texture = HUD_rock_tube_glow_full_b
				zoff = 0.2
				alpha = 0
			}
		}
		{
			element_id = HUD2D_rock_tube_4
			element_parent = HUD2D_bulb_container
			texture = HUD_rock_tube
			pos_off = (132.0, -270.0)
			initial_pos = (132.0, -100.0)
			pos_off_p2 = (-132.0, 0.0)
			initial_pos_p2 = (-132.0, 100.0)
			element_dims = (64.0, 128.0)
			big_bulb
			zoff = 0
			just = [
				center
				center
			]
			container
			tube = {
				texture = HUD_rock_tube_glow_fill
				star_texture = HUD_rock_tube_glow_fill_b
				element_dims = (64.0, 16.0)
				pos_off = (0.0, 32.0)
				zoff = 0.1
				alpha = 1
			}
			full = {
				texture = HUD_rock_tube_glow_full
				star_texture = HUD_rock_tube_glow_full_b
				zoff = 0.2
				alpha = 1
			}
		}
		{
			element_id = HUD2D_rock_tube_5
			element_parent = HUD2D_bulb_container
			texture = HUD_rock_tube
			pos_off = (92.0, -270.0)
			initial_pos = (92.0, -100.0)
			pos_off_p2 = (-92.0, 0.0)
			initial_pos_p2 = (-92.0, 100.0)
			element_dims = (64.0, 128.0)
			big_bulb
			zoff = 0
			just = [
				center
				center
			]
			container
			tube = {
				texture = HUD_rock_tube_glow_fill
				star_texture = HUD_rock_tube_glow_fill_b
				element_dims = (64.0, 16.0)
				pos_off = (0.0, 32.0)
				zoff = 0.1
				alpha = 1
			}
			full = {
				texture = HUD_rock_tube_glow_full
				star_texture = HUD_rock_tube_glow_full_b
				zoff = 0.2
				alpha = 1
			}
		}
		{
			element_id = HUD2D_rock_tube_6
			element_parent = HUD2D_bulb_container
			texture = HUD_rock_tube
			pos_off = (52.0, -270.0)
			initial_pos = (52.0, -100.0)
			pos_off_p2 = (-52.0, 0.0)
			initial_pos_p2 = (-52.0, 100.0)
			element_dims = (64.0, 128.0)
			big_bulb
			zoff = 0
			just = [
				center
				center
			]
			container
			tube = {
				texture = HUD_rock_tube_glow_fill
				star_texture = HUD_rock_tube_glow_fill_b
				element_dims = (64.0, 16.0)
				pos_off = (0.0, 32.0)
				zoff = 0.1
				alpha = 1
			}
			full = {
				texture = HUD_rock_tube_glow_full
				star_texture = HUD_rock_tube_glow_full_b
				zoff = 0.2
				alpha = 1
			}
		}
		{
			parent_container
			element_id = HUD2D_score_lights_container
			element_parent = HUD2D_score_container
			pos_off = (0.0, 0.0)
			rot = 0
			rot_p2 = 180
		}
		{
			element_id = HUD2D_score_light_unlit_1
			element_parent = HUD2D_score_lights_container
			texture = HUD_score_light_0
			pos_type = score_pos
			pos_off = (0.0, 200.0)
			pos_off_p2 = (-268.0, -232.0)
			zoff = 5
		}
		{
			element_id = HUD2D_score_light_unlit_2
			element_parent = HUD2D_score_lights_container
			texture = HUD_score_light_0
			pos_type = score_pos
			pos_off = (0.0, 170.0)
			pos_off_p2 = (-268.0, -202.0)
			zoff = 5
		}
		{
			element_id = HUD2D_score_light_unlit_3
			element_parent = HUD2D_score_lights_container
			texture = HUD_score_light_0
			pos_type = score_pos
			pos_off = (0.0, 140.0)
			pos_off_p2 = (-268.0, -172.0)
			zoff = 5
		}
		{
			element_id = HUD2D_score_light_unlit_4
			element_parent = HUD2D_score_lights_container
			texture = HUD_score_light_0
			pos_type = score_pos
			pos_off = (0.0, 110.0)
			pos_off_p2 = (-268.0, -142.0)
			zoff = 5
		}
		{
			element_id = HUD2D_score_light_unlit_5
			element_parent = HUD2D_score_lights_container
			texture = HUD_score_light_0
			pos_type = score_pos
			pos_off = (0.0, 80.0)
			pos_off_p2 = (-268.0, -112.0)
			zoff = 5
		}
		{
			element_id = HUD2D_score_light_halflit_1
			element_parent = HUD2D_score_lights_container
			texture = HUD_score_light_1
			pos_type = score_pos
			pos_off = (0.0, 200.0)
			pos_off_p2 = (-268.0, -232.0)
			zoff = 5.1
			alpha = 0
		}
		{
			element_id = HUD2D_score_light_halflit_2
			element_parent = HUD2D_score_lights_container
			texture = HUD_score_light_1
			pos_type = score_pos
			pos_off = (0.0, 170.0)
			pos_off_p2 = (-268.0, -202.0)
			zoff = 5.1
			alpha = 0
		}
		{
			element_id = HUD2D_score_light_halflit_3
			element_parent = HUD2D_score_lights_container
			texture = HUD_score_light_1
			pos_type = score_pos
			pos_off = (0.0, 140.0)
			pos_off_p2 = (-268.0, -172.0)
			zoff = 5.1
			alpha = 0
		}
		{
			element_id = HUD2D_score_light_halflit_4
			element_parent = HUD2D_score_lights_container
			texture = HUD_score_light_1
			pos_type = score_pos
			pos_off = (0.0, 110.0)
			pos_off_p2 = (-268.0, -142.0)
			zoff = 5.1
			alpha = 0
		}
		{
			element_id = HUD2D_score_light_halflit_5
			element_parent = HUD2D_score_lights_container
			texture = HUD_score_light_1
			pos_type = score_pos
			pos_off = (0.0, 80.0)
			pos_off_p2 = (-268.0, -112.0)
			zoff = 5.1
			alpha = 0
		}
		{
			element_id = HUD2D_score_light_allwaylit_1
			element_parent = HUD2D_score_lights_container
			texture = HUD_score_light_2
			pos_type = score_pos
			pos_off = (0.0, 200.0)
			pos_off_p2 = (-268.0, -232.0)
			zoff = 5.2
			alpha = 0
		}
		{
			element_id = HUD2D_score_light_allwaylit_2
			element_parent = HUD2D_score_lights_container
			texture = HUD_score_light_2
			pos_type = score_pos
			pos_off = (0.0, 170.0)
			pos_off_p2 = (-268.0, -202.0)
			zoff = 5.2
			alpha = 0
		}
		{
			element_id = HUD2D_score_light_allwaylit_3
			element_parent = HUD2D_score_lights_container
			texture = HUD_score_light_2
			pos_type = score_pos
			pos_off = (0.0, 140.0)
			pos_off_p2 = (-268.0, -172.0)
			zoff = 5.2
			alpha = 0
		}
		{
			element_id = HUD2D_score_light_allwaylit_4
			element_parent = HUD2D_score_lights_container
			texture = HUD_score_light_2
			pos_type = score_pos
			pos_off = (0.0, 110.0)
			pos_off_p2 = (-268.0, -142.0)
			zoff = 5.2
			alpha = 0
		}
		{
			element_id = HUD2D_score_light_allwaylit_5
			element_parent = HUD2D_score_lights_container
			texture = HUD_score_light_2
			pos_type = score_pos
			pos_off = (0.0, 80.0)
			pos_off_p2 = (-268.0, -112.0)
			zoff = 5.2
			alpha = 0
		}
		{
			element_id = HUD2D_score_nixie_1a
			element_parent = HUD2D_score_container
			texture = HUD_score_nixie_1a
			pos_type = score_pos
			pos_off = (70.0, 90.0)
			zoff = 4
			alpha = 0
		}
		{
			element_id = HUD2D_score_nixie_2a
			element_parent = HUD2D_score_container
			texture = HUD_score_nixie_2a
			pos_type = score_pos
			pos_off = (70.0, 90.0)
			zoff = 4
			alpha = 0
		}
		{
			element_id = HUD2D_score_nixie_2b
			element_parent = HUD2D_score_container
			texture = HUD_score_nixie_2b
			pos_type = score_pos
			pos_off = (70.0, 90.0)
			zoff = 4
			alpha = 0
		}
		{
			element_id = HUD2D_score_nixie_3a
			element_parent = HUD2D_score_container
			texture = HUD_score_nixie_3a
			pos_type = score_pos
			pos_off = (70.0, 90.0)
			zoff = 4
			alpha = 0
		}
		{
			element_id = HUD2D_score_nixie_4a
			element_parent = HUD2D_score_container
			texture = HUD_score_nixie_4a
			pos_type = score_pos
			pos_off = (70.0, 90.0)
			zoff = 4
			alpha = 0
		}
		{
			element_id = HUD2D_score_nixie_4b
			element_parent = HUD2D_score_container
			texture = HUD_score_nixie_4b
			pos_type = score_pos
			pos_off = (70.0, 90.0)
			zoff = 4
			alpha = 0
		}
		{
			element_id = HUD2D_score_nixie_6b
			element_parent = HUD2D_score_container
			texture = HUD_score_nixie_6b
			pos_type = score_pos
			pos_off = (70.0, 90.0)
			zoff = 4
			alpha = 0
		}
		{
			element_id = HUD2D_score_nixie_8b
			element_parent = HUD2D_score_container
			texture = HUD_score_nixie_8b
			pos_type = score_pos
			pos_off = (70.0, 90.0)
			zoff = 4
			alpha = 0
		}
		{
			parent_container
			element_id = HUD2D_note_container
			pos_type = counter_pos
			note_streak_bar
			pos_off = (0.0, 0.0)
		}
		{
			element_id = HUD2D_counter_body
			element_parent = HUD2D_note_container
			texture = HUD_counter_body
			pos_off = (-2.0, 0.0)
			zoff = 9
		}
		{
			element_id = HUD_counter_drum
			element_parent = HUD2D_note_container
			texture = HUD_counter_drum
			pos_off = (4.0, 40.0)
			zoff = 8
		}
		{
			element_id = HUD2D_counter_drum_icon
			element_parent = HUD2D_note_container
			texture = HUD_counter_drum_icon
			pos_off = (44.0, 40.0)
			zoff = 26
		}
		{
			element_id = HUD2D_score_flash
			element_parent = HUD2D_score_container
			texture = HUD_score_flash
			just = [
				center
				center
			]
			pos_type = score_pos
			pos_off = (128.0, 128.0)
			zoff = 20
			alpha = 0
		}
	]
}
