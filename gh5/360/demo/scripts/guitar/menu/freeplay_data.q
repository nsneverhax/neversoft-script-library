freeplay_primary_vocalist = -1
freeplay_demo_quit_warning_shown = 0
freeplay_deferring_system_notification = false
freeplay_time_before_automatic_dropout = 130
sound_transitions = {
	playing = {
		paused = [
			'Game_To_Pause'
		]
		attract = [
			'Pause_To_Stage'
		]
		joining = [
			'Stage_To_Join'
		]
	}
	paused = {
		playing = [
			'Pause_To_Game'
		]
		joining = [
			'House_To_Join'
		]
		attract = [
			'Pause_To_Stage'
		]
	}
	joining = {
		playing = [
			'Join_To_Game'
		]
		attract = [
			'Join_To_Stage'
		]
	}
	attract = {
		joining = [
			'Stage_To_Join'
		]
		playing = [
			'Join_To_Game'
		]
	}
	start = {
		attract = [
			'Join_To_Stage'
		]
	}
}
attract_sound_state = unset
freeplay_menu_states = {
	base = {
		entries = [
			{
				text = qs(0xcb52880a)
				scr = freeplay_pause_menu_resume
			}
			{
				text = qs(0x55c34bc7)
				scr = freeplay_pause_menu_quit
			}
			{
				text = qs(0x0b6ccd33)
				scr = freeplay_menu_push
				params = {
					state = options
				}
				condition_scr = freeplay_condition_options
			}
			{
				text = qs(0x84359337)
				scr = freeplay_menu_push
				params = {
					state = difficulty
				}
				condition_scr = freeplay_condition_no_options
			}
			{
				text = qs(0x4993146c)
				scr = freeplay_menu_push
				params = {
					state = song
				}
			}
			{
				text = qs(0x480dff4d)
				scr = freeplay_pause_menu_calibrate_lag
				condition_scr = freeplay_condition_xblademo
			}
			{
				text = qs(0x83cfbd06)
				scr = freeplay_pause_menu_full_pause
			}
		]
	}
	quit = {
		entries = [
			{
				text = qs(0xdc8c7e07)
				scr = freeplay_pause_menu_dropout
			}
			{
				text = qs(0x894e1bd6)
				scr = ui_freeplay_main_menu
				condition_scr = freeplay_condition_notdemo
			}
		]
	}
	options = {
		entries = [
			{
				text = qs(0x84359337)
				scr = freeplay_menu_push
				params = {
					state = difficulty
				}
			}
			{
				text = qs(0x9d898e0a)
				scr = freeplay_menu_push
				params = {
					state = instrument
				}
				condition_scr = freeplay_condition_instrument
			}
			{
				text = qs(0x541fa14c)
				scr = freeplay_menu_push
				params = {
					state = lefty
				}
				condition_scr = freeplay_condition_lefty_flip
			}
		]
	}
	song = {
		entries = [
			{
				text = qs(0xc94db443)
				scr = freeplay_restart_song
			}
			{
				text = qs(0x1f04a125)
				scr = freeplay_skip_song
			}
			{
				text = qs(0xd9070aee)
				scr = freeplay_pause_menu_songlist_pause
				params = {
					pause_type = new_song
				}
			}
			{
				text = qs(0x95237711)
				scr = freeplay_pause_menu_songlist_pause
				params = {
					pause_type = edit_playlist
				}
				condition_scr = freeplay_condition_notdemo
			}
			{
				text = qs(0x2ff6a268)
				scr = freeplay_pause_menu_songlist_pause
				params = {
					pause_type = new_playlist
				}
				condition_scr = freeplay_condition_notdemo
			}
		]
	}
	difficulty = {
		entries = [
			{
				text = qs(0x25b2ecac)
				scr = freeplay_pause_choose_difficulty
				params = {
					difficulty = beginner
				}
			}
			{
				text = qs(0xbf7ffd2d)
				scr = freeplay_pause_choose_difficulty
				params = {
					difficulty = easy
				}
			}
			{
				text = qs(0xeac0f52d)
				scr = freeplay_pause_choose_difficulty
				params = {
					difficulty = medium
				}
			}
			{
				text = qs(0x63aae385)
				scr = freeplay_pause_choose_difficulty
				params = {
					difficulty = hard
				}
			}
			{
				text = qs(0xb778e780)
				scr = freeplay_pause_choose_difficulty
				params = {
					difficulty = expert
				}
			}
			{
				text = qs(0x739da581)
				scr = freeplay_pause_choose_difficulty
				params = {
					difficulty = expert_plus
				}
				condition_scr = freeplay_condition_expert_plus
			}
		]
		entry_focus_scr = freeplay_pause_difficulty_entry_focus
	}
	instrument = {
		entries = [
			{
				text = qs(0x11355666)
				scr = freeplay_pause_choose_instrument
				params = {
					part = guitar
				}
			}
			{
				text = qs(0x4f551cbe)
				scr = freeplay_pause_choose_instrument
				params = {
					part = bass
				}
			}
		]
		entry_focus_scr = freeplay_pause_instrument_entry_focus
	}
	lefty = {
		entries = [
			{
				text = qs(0x2a6154cc)
				scr = freeplay_pause_choose_lefty
				params = {
					lefty_flip = 0
				}
			}
			{
				text = qs(0x83adf584)
				scr = freeplay_pause_choose_lefty
				params = {
					lefty_flip = 1
				}
			}
		]
		entry_focus_scr = freeplay_pause_lefty_entry_focus
	}
}
highway_scale_chart = [
	{
		hw_x_scale = 1.0
		hw_y_scale = 1.0
		extra_offset_factor = 0.0
		center = {
			x_pos = 0
		}
		perspectivefact = 1.00108
		perspectiveexp = 1.00125
	}
	{
		hw_x_scale = 0.96999997
		hw_y_scale = 0.77
		extra_offset_factor = -0.4
		left = {
			x_pos = -288
		}
		center = {
			x_pos = 0
		}
		right = {
			x_pos = 288
		}
		perspectivefact = 1.00158
		perspectiveexp = 1.0005
	}
	{
		hw_x_scale = 0.87
		hw_y_scale = 0.77
		extra_offset_factor = -0.5
		left = {
			x_pos = -405
		}
		center = {
			x_pos = 0
		}
		right = {
			x_pos = 405
		}
		perspectivefact = 1.00168
		perspectiveexp = 1.00027
	}
	{
		hw_x_scale = 0.74
		hw_y_scale = 0.75
		extra_offset_factor = -0.9
		left = {
			x_pos = -446
		}
		leftcenter = {
			x_pos = -150
		}
		center = {
			x_pos = 0
		}
		rightcenter = {
			x_pos = 150
		}
		right = {
			x_pos = 446
		}
		perspectivefact = 1.00144
		perspectiveexp = 1.00028
	}
]
