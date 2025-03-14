Skill_Upgrade_Video = {
	container_params = {
		pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		just = [
			left
			top
		]
		child_anchor = [
			center
			center
		]
	}
	helper_params = {
		pos = (-30.0, 180.0)
		rgba = [
			140
			140
			140
			255
		]
	}
	movie_params = {
		movie = 'TRAIN_Upgrade_Skills'
		movie_ps3 = 'TRAIN_Upgrade_Skills_PS3'
		movie_ps3 = 'TRAIN_Upgrade_Skills_PS3X'
		start_frame = 0
		end_frame = 560
		pos = (-640.0, -360.0)
		just = [
			left
			top
		]
	}
	default_create_element = {
		type = textblockelement
		font = text_a1
		text = ""
		pos = (-75.0, 175.0)
		dims = (640.0, 0.0)
		just = [
			left
			center
		]
		internal_just = [
			center
			center
		]
		allow_expansion
		rgba = [
			200
			200
			200
			255
		]
		scale = (0.9, 0.9)
		alpha = 0.0
		shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
	}
	default_fade_in_params = {
		alpha = 1.0
		time = 0.5
	}
	default_fade_out_params = {
		alpha = 0.0
		time = 0.5
	}
	events = [
		{
			frame = 0
			create_element = {
				type = textblockelement
				font = text_a1
				text = "SKILL UPGRADE"
				pos = (100.0, -240.0)
				dims = (768.0, 576.0)
				just = [
					left
					top
				]
				internal_just = [
					left
					top
				]
			}
			fade_in_params = {
			}
		}
		{
			frame = 0
			wait_time = 0
		}
		{
			frame = 40
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 54
			create_element = {
				text = "Go into the my skater menu."
			}
			fade_in_params = {
			}
		}
		{
			frame = 55
			wait_time = 1
		}
		{
			frame = 56
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 111
			create_element = {
				text = "skills - stats:\\n\\nSkill screen is located here."
			}
			fade_in_params = {
			}
		}
		{
			frame = 112
			wait_time = 1.5
		}
		{
			frame = 113
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 240
			create_element = {
				text = "This describes the skill \\nand upgrades."
			}
			fade_in_params = {
			}
		}
		{
			frame = 241
			wait_time = 2
		}
		{
			frame = 242
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 328
			create_element = {
				text = "Use \\b4 / \\b7 to navigate\\nthrough the skills types."
			}
			fade_in_params = {
			}
		}
		{
			frame = 329
			wait_time = 1.5
		}
		{
			frame = 330
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 348
			create_element = {
				text = "Use \\b6 / \\b5 to navigate\\nthrough the skill upgrades."
			}
			fade_in_params = {
			}
		}
		{
			frame = 349
			wait_time = 1.5
		}
		{
			frame = 350
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 360
			create_element = {
				text = "Each upgrade requires\\nskill points to purchase."
			}
			fade_in_params = {
			}
		}
		{
			frame = 361
			wait_time = 1.5
		}
		{
			frame = 362
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 518
			create_element = {
				text = "Purchasing skill upgrade\\nunlocks additional skill\\nabilities."
			}
			fade_in_params = {
			}
		}
		{
			frame = 519
			wait_time = 2
		}
		{
			frame = 520
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 528
			create_element = {
				text = "Points available:\\n\\nList your current amount."
			}
			fade_in_params = {
			}
		}
		{
			frame = 529
			wait_time = 1.5
		}
		{
			frame = 530
			destroy_element
			fade_out_params = {
			}
		}
		{
			frame = 539
			create_element = {
				text = "Check mark shows skill\\nlevel attained."
			}
			fade_in_params = {
			}
		}
		{
			frame = 540
			wait_time = 1.5
		}
		{
			frame = 541
			destroy_element
			fade_out_params = {
			}
		}
	]
}
