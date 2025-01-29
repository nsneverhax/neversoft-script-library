roadie1_expressions = {
	example1 = {
		parts = [
			{
				Type = one_shot
				texture = `rb-roadie1-idle1`
				frame_length = 0.25
				num_uv_frames = (2.0, 2.0)
			}
			{
				Type = random_frames
				Duration = 5.0
				texture = `rb-roadie1-idle1`
				frame_length_range = [
					1.0
					2.0
				]
				num_uv_frames = (2.0, 2.0)
			}
			{
				Type = one_shot
				texture = `rb-roadie1-idle1`
				frame_length = [
					0.25
					0.25
					0.25
					1.5
				]
				num_uv_frames = (2.0, 2.0)
			}
		]
	}
	example2 = {
		parts = [
			{
				Type = custom
				props = {
					texture = `rb-roadie1-example2-1`
					Pos = {
						(0.0, -60.0)
						relative
					}
					time = 0.3
					motion = ease_out
				}
			}
			{
				Type = custom
				props = {
					texture = `rb-roadie1-example2-1`
					Pos = {
						(0.0, 60.0)
						relative
					}
					time = 0.3
					motion = ease_in
				}
			}
		]
	}
	Idle = {
		loop_all_parts
		parts = [
			{
				Type = one_shot
				texture = `rb-roadie1-idle1`
				dims = (256.0, 128.0)
				Scale = 0.6
				frame_length_range = [
					0.75
					3.5
				]
				num_uv_frames = (2.0, 1.0)
			}
			{
				Type = one_shot
				texture = `rb-roadie1-idle2`
				dims = (256.0, 256.0)
				Scale = 0.6
				frame_length_range = [
					0.75
					3.5
				]
				num_uv_frames = (2.0, 2.0)
			}
		]
	}
	sabotaged = {
		parts = [
			{
				Type = one_shot
				texture = `rb-roadie1-surprised1`
				dims = (256.0, 256.0)
				Scale = 0.6
				frame_length = [
					0.5
					0.5
					0.2
					0.25
				]
				num_uv_frames = (2.0, 2.0)
			}
			{
				Type = one_shot
				texture = `rb-roadie1-surprised2`
				dims = (256.0, 128.0)
				Scale = 0.6
				frame_length = [
					0.1
					0.1
				]
				num_uv_frames = (2.0, 1.0)
			}
			{
				Type = Loop
				Duration = 5.0
				texture = `rb-roadie1-surprised3`
				dims = (256.0, 128.0)
				Scale = 0.6
				frame_length = [
					0.5
					0.15
				]
				num_uv_frames = (2.0, 1.0)
			}
		]
	}
	repairing = {
		loop_all_parts
		resume_state = repairing
		parts = [
			{
				Type = one_shot
				texture = `rb-roadie1-upset1`
				dims = (256.0, 128.0)
				Scale = 0.6
				frame_length = [
					0.5
					0.5
				]
				num_uv_frames = (2.0, 1.0)
			}
			{
				Type = Loop
				Duration = 5
				texture = `rb-roadie1-upset2`
				dims = (256.0, 128.0)
				Scale = 0.6
				frame_length = [
					0.5
					0.5
				]
				num_uv_frames = (2.0, 1.0)
			}
		]
	}
	repair_complete = {
		resume_state = Idle
		parts = [
			{
				Type = one_shot
				texture = `rb-roadie1-happy1`
				dims = (256.0, 128.0)
				Scale = 0.6
				frame_length = [
					0.5
					0.5
				]
				num_uv_frames = (2.0, 1.0)
			}
		]
	}
	sabotaging = {
		loop_all_parts
		resume_state = sabotaging
		parts = [
			{
				Type = Loop
				Duration = 8.0
				texture = `rb-roadie1-sneaky1`
				dims = (256.0, 256.0)
				Scale = 0.6
				frame_length = [
					0.5
					0.5
					0.2
					0.25
				]
				num_uv_frames = (2.0, 2.0)
			}
		]
	}
	sabotage_complete = {
		resume_state = Idle
		parts = [
			{
				Type = one_shot
				texture = `rb-roadie1-laughing1`
				dims = (256.0, 256.0)
				Scale = 0.6
				frame_length = [
					0.5
					0.5
					0.2
					0.25
				]
				num_uv_frames = (2.0, 2.0)
			}
		]
	}
	running = {
		sfx_event = roadie_battle_roadie1_pant
		loop_all_parts
		Duration = 2.75
		parts = [
			{
				Type = one_shot
				texture = `rb-roadie1-running1`
				dims = (128.0, 128.0)
				Scale = 1.2
				frame_length = 0.05
				num_uv_frames = (1.0, 1.0)
			}
			{
				Type = one_shot
				texture = `rb-roadie1-running2`
				dims = (128.0, 128.0)
				Scale = 1.2
				frame_length = 0.05
				num_uv_frames = (1.0, 1.0)
			}
			{
				Type = one_shot
				texture = `rb-roadie1-running3`
				dims = (128.0, 128.0)
				Scale = 1.2
				frame_length = 0.05
				num_uv_frames = (1.0, 1.0)
			}
			{
				Type = one_shot
				texture = `rb-roadie1-running4`
				dims = (128.0, 128.0)
				Scale = 1.2
				frame_length = 0.05
				num_uv_frames = (1.0, 1.0)
			}
			{
				Type = one_shot
				texture = `rb-roadie1-running5`
				dims = (128.0, 128.0)
				Scale = 1.2
				frame_length = 0.05
				num_uv_frames = (1.0, 1.0)
			}
			{
				Type = one_shot
				texture = `rb-roadie1-running6`
				dims = (128.0, 128.0)
				Scale = 1.2
				frame_length = 0.05
				num_uv_frames = (1.0, 1.0)
			}
			{
				Type = one_shot
				texture = `rb-roadie1-running5`
				dims = (128.0, 128.0)
				Scale = 1.2
				frame_length = 0.05
				num_uv_frames = (1.0, 1.0)
			}
			{
				Type = one_shot
				texture = `rb-roadie1-running4`
				dims = (128.0, 128.0)
				Scale = 1.2
				frame_length = 0.05
				num_uv_frames = (1.0, 1.0)
			}
			{
				Type = one_shot
				texture = `rb-roadie1-running3`
				dims = (128.0, 128.0)
				Scale = 1.2
				frame_length = 0.05
				num_uv_frames = (1.0, 1.0)
			}
			{
				Type = one_shot
				texture = `rb-roadie1-running2`
				dims = (128.0, 128.0)
				Scale = 1.2
				frame_length = 0.05
				num_uv_frames = (1.0, 1.0)
			}
		]
	}
}
roadie2_expressions = {
	example1 = {
		parts = [
			{
				Type = one_shot
				texture = `rb-roadie2-idle1`
				frame_length = 0.25
				num_uv_frames = (2.0, 2.0)
			}
			{
				Type = random_frames
				Duration = 5.0
				texture = `rb-roadie2-idle1`
				frame_length_range = [
					1.0
					2.0
				]
				num_uv_frames = (2.0, 2.0)
			}
			{
				Type = one_shot
				texture = `rb-roadie2-idle1`
				frame_length = [
					0.25
					0.25
					0.25
					1.5
				]
				num_uv_frames = (2.0, 2.0)
			}
		]
	}
	example2 = {
		parts = [
			{
				Type = custom
				props = {
					texture = `rb-roadie2-example2-1`
					Pos = {
						(0.0, -60.0)
						relative
					}
					time = 0.3
					motion = ease_out
				}
			}
			{
				Type = custom
				props = {
					texture = `rb-roadie2-example2-1`
					Pos = {
						(0.0, 60.0)
						relative
					}
					time = 0.3
					motion = ease_in
				}
			}
		]
	}
	Idle = {
		loop_all_parts
		parts = [
			{
				Type = random_frames
				Duration = 5.0
				texture = `rb-roadie2-idle1`
				dims = (256.0, 128.0)
				Scale = 0.6
				frame_length_range = [
					0.3
					0.4
				]
				num_uv_frames = (2.0, 1.0)
			}
			{
				Type = one_shot
				texture = `rb-roadie2-idle2`
				dims = (256.0, 256.0)
				Scale = 0.6
				frame_length_range = [
					0.75
					0.5
					0.2
					0.25
				]
				num_uv_frames = (2.0, 2.0)
			}
			{
				Type = random_frames
				Duration = 5.0
				texture = `rb-roadie2-idle1`
				dims = (256.0, 128.0)
				Scale = 0.6
				frame_length_range = [
					0.3
					0.4
				]
				num_uv_frames = (2.0, 1.0)
			}
		]
	}
	sabotaged = {
		parts = [
			{
				Type = one_shot
				texture = `rb-roadie2-surprised1`
				dims = (256.0, 128.0)
				Scale = 0.6
				frame_length = [
					0.25
					0.25
				]
				num_uv_frames = (2.0, 1.0)
			}
			{
				Type = Loop
				Duration = 3.0
				texture = `rb-roadie2-surprised2`
				dims = (256.0, 128.0)
				Scale = 0.6
				frame_length = [
					0.1
					0.15
				]
				num_uv_frames = (2.0, 1.0)
			}
		]
	}
	repairing = {
		loop_all_parts
		resume_state = repairing
		parts = [
			{
				Type = Loop
				Duration = 8.0
				texture = `rb-roadie2-upset1`
				dims = (256.0, 256.0)
				Scale = 0.6
				frame_length_range = [
					0.75
					0.5
					0.2
					0.25
				]
				num_uv_frames = (2.0, 2.0)
			}
		]
	}
	repair_complete = {
		resume_state = Idle
		parts = [
			{
				Type = one_shot
				texture = `rb-roadie2-happy1`
				dims = (256.0, 256.0)
				Scale = 0.6
				frame_length = [
					0.5
					0.15
					0.5
					0.2
				]
				num_uv_frames = (2.0, 2.0)
			}
			{
				Type = Loop
				Duration = 3.0
				texture = `rb-roadie2-happy2`
				dims = (256.0, 128.0)
				Scale = 0.6
				frame_length = [
					0.5
					0.25
				]
				num_uv_frames = (2.0, 1.0)
			}
		]
	}
	sabotaging = {
		loop_all_parts
		resume_state = sabotaging
		parts = [
			{
				Type = Loop
				Duration = 8.0
				texture = `rb-roadie2-sneaky1`
				dims = (256.0, 256.0)
				Scale = 0.6
				frame_length = [
					0.5
					0.25
					0.2
					0.5
				]
				num_uv_frames = (2.0, 2.0)
			}
		]
	}
	sabotage_complete = {
		resume_state = Idle
		parts = [
			{
				Type = Loop
				Duration = 3.0
				texture = `rb-roadie2-laughing1`
				dims = (256.0, 256.0)
				Scale = 0.6
				frame_length = [
					0.5
					0.25
					0.2
					0.5
				]
				num_uv_frames = (2.0, 2.0)
			}
		]
	}
	running = {
		sfx_event = roadie_battle_roadie2_pant
		loop_all_parts
		Duration = 2.75
		parts = [
			{
				Type = one_shot
				texture = `rb-roadie2-running1`
				dims = (128.0, 128.0)
				Scale = 1.2
				frame_length = 0.05
				num_uv_frames = (1.0, 1.0)
			}
			{
				Type = one_shot
				texture = `rb-roadie2-running2`
				dims = (128.0, 128.0)
				Scale = 1.2
				frame_length = 0.05
				num_uv_frames = (1.0, 1.0)
			}
			{
				Type = one_shot
				texture = `rb-roadie2-running3`
				dims = (128.0, 128.0)
				Scale = 1.2
				frame_length = 0.05
				num_uv_frames = (1.0, 1.0)
			}
			{
				Type = one_shot
				texture = `rb-roadie2-running4`
				dims = (128.0, 128.0)
				Scale = 1.2
				frame_length = 0.05
				num_uv_frames = (1.0, 1.0)
			}
			{
				Type = one_shot
				texture = `rb-roadie2-running5`
				dims = (128.0, 128.0)
				Scale = 1.2
				frame_length = 0.05
				num_uv_frames = (1.0, 1.0)
			}
			{
				Type = one_shot
				texture = `rb-roadie2-running6`
				dims = (128.0, 128.0)
				Scale = 1.2
				frame_length = 0.05
				num_uv_frames = (1.0, 1.0)
			}
			{
				Type = one_shot
				texture = `rb-roadie2-running5`
				dims = (128.0, 128.0)
				Scale = 1.2
				frame_length = 0.05
				num_uv_frames = (1.0, 1.0)
			}
			{
				Type = one_shot
				texture = `rb-roadie2-running4`
				dims = (128.0, 128.0)
				Scale = 1.2
				frame_length = 0.05
				num_uv_frames = (1.0, 1.0)
			}
			{
				Type = one_shot
				texture = `rb-roadie2-running3`
				dims = (128.0, 128.0)
				Scale = 1.2
				frame_length = 0.05
				num_uv_frames = (1.0, 1.0)
			}
			{
				Type = one_shot
				texture = `rb-roadie2-running2`
				dims = (128.0, 128.0)
				Scale = 1.2
				frame_length = 0.05
				num_uv_frames = (1.0, 1.0)
			}
		]
	}
}
