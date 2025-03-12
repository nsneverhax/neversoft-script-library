tutorial_system_pre_vo_wait_time = 0
tutorial_system_post_vo_wait_time = 1
tutorial_system_post_title_wait_time = 3
tutorial_headers = [
	'gameplay'
	'guitar'
	'bass'
	'drum'
	'vocals'
	'band'
]
gameplay_tutorial_helper_text = qs(0x40f65c08)
gameplay_tutorials = [
	{
		id = 'gameplay_basics'
		title = qs(0x1f331fb3)
		helper_text = qs(0xefd0ddfc)
		lessons = [
			{
				id = 'lesson0'
				next_lesson = 'lesson1'
				title = qs(0x95cccb6e)
				helper_text = qs(0xd5026459)
				pages = [
					{
						id = 'page0'
						next_page = 'first_page'
						type = 'text'
						title_page
						time_shown = $tutorial_system_post_title_wait_time
						text = qs(0x95cccb6e)
					}
					{
						id = 'first_page'
						next_page = 'page1'
						type = 'text'
						time_shown = 1
						text = qs(0x9e44cd45)
						audio_stream = 'Tut_Gnr1_L01_01'
					}
					{
						id = 'page1'
						next_page = 'page2'
						type = 'text'
						time_shown = 1
						text = qs(0x96cd6237)
						audio_stream = 'Tut_Gnr1_L01_02'
					}
					{
						id = 'page2'
						next_page = 'page3'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x19749be2)
						audio_stream = 'Tut_Gnr1_L01_03'
						images = [
							{
								image = tutorial_general_highway
								time_shown = 1
							}
						]
					}
					{
						id = 'page3'
						next_page = 'page4'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x128c46fa)
						audio_stream = 'Tut_Gnr1_L01_04'
						images = [
							{
								image = tutorial_general_highway
								time_shown = 1
							}
						]
					}
					{
						id = 'page4'
						next_page = 'page5'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x49c13518)
						audio_stream = 'Tut_Gnr1_L01_05'
						images = [
							{
								image = tutorial_general_highway_notes
								time_shown = 1
							}
						]
					}
					{
						id = 'page5'
						next_page = 'page6'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x192e2903)
						audio_stream = 'Tut_Gnr1_L01_06'
						images = [
							{
								image = tutorial_general_rock_meter_yellow
								time_shown = 1
							}
						]
					}
					{
						id = 'page6'
						next_page = 'page7'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xb3c885c2)
						audio_stream = 'Tut_Gnr1_L01_07'
						images = [
							{
								image = tutorial_general_rock_meter_yellow
								time_shown = 1
							}
						]
					}
					{
						id = 'page7'
						next_page = 'page8'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xcf21fe59)
						audio_stream = 'Tut_Gnr1_L01_08'
						images = [
							{
								image = tutorial_general_rock_meter_yellow
								time_shown = 1
							}
						]
					}
					{
						id = 'page8'
						next_page = 'page9'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x4da29c7c)
						audio_stream = 'Tut_Gnr1_L01_09'
						images = [
							{
								image = tutorial_general_rock_meter_green
								time_shown = 1
							}
						]
					}
					{
						id = 'page9'
						next_page = 'page10'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x7859a449)
						audio_stream = 'Tut_Gnr1_L01_10'
						images = [
							{
								image = tutorial_general_rock_meter_red
								time_shown = 1
							}
						]
					}
					{
						id = 'page10'
						next_page = 'page11'
						type = 'text'
						time_shown = 1
						text = qs(0x7340f4b6)
						audio_stream = 'Tut_Gnr1_L01_11'
					}
					{
						id = 'page11'
						next_page = 'page12'
						type = 'text'
						time_shown = 1
						text = qs(0x42677bb2)
						audio_stream = 'Tut_Gnr1_L01_12'
					}
					{
						id = 'page12'
						type = 'text'
						time_shown = 1
						text = qs(0x46ec7f74)
						audio_stream = 'Tut_Gnr1_L01_13'
					}
				]
			}
			{
				id = 'lesson1'
				next_lesson = 'lesson2'
				title = qs(0xc1dd0f4f)
				helper_text = qs(0xe21aa242)
				pages = [
					{
						id = 'page0'
						next_page = 'first_page'
						title_page
						type = 'text'
						time_shown = $tutorial_system_post_title_wait_time
						text = qs(0xc1dd0f4f)
					}
					{
						id = 'first_page'
						next_page = 'page2'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xa563f5e8)
						audio_stream = 'Tut_Gnr1_L02_01'
						images = [
							{
								image = tutorial_general_score
								time_shown = 1
								scale = 1
							}
						]
					}
					{
						id = 'page2'
						next_page = 'page3'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xe5dc0e8d)
						audio_stream = 'Tut_Gnr1_L02_02'
						images = [
							{
								image = tutorial_general_score_zoom
								time_shown = 1
							}
						]
					}
					{
						id = 'page3'
						next_page = 'page4'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x61728bcd)
						audio_stream = 'Tut_Gnr1_L02_03'
						images = [
							{
								image = tutorial_general_score_zoom
								time_shown = 1
							}
						]
					}
					{
						id = 'page4'
						next_page = 'page5'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x90d227c7)
						audio_stream = 'Tut_Gnr1_L02_04'
						images = [
							{
								image = tutorial_general_multiplier
								time_shown = 1
							}
						]
					}
					{
						id = 'page5'
						next_page = 'page6'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x9f15effd)
						audio_stream = 'Tut_Gnr1_L02_05'
						images = [
							{
								image = tutorial_general_multiplier
								time_shown = 1
							}
						]
					}
					{
						id = 'page6'
						next_page = 'page7'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x12bfce5c)
						audio_stream = 'Tut_Gnr1_L02_06'
						images = [
							{
								image = tutorial_general_star_power_meter
								time_shown = 1
							}
						]
					}
					{
						id = 'page7'
						next_page = 'page9'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x0ad29e25)
						audio_stream = 'Tut_Gnr1_L02_07'
						images = [
							{
								image = tutorial_general_star_power_meter_half_fill
								time_shown = 1
							}
						]
					}
					{
						id = 'page9'
						next_page = 'page10'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x9b166a2d)
						audio_stream = 'Tut_Gnr1_L02_08'
						images = [
							{
								image = tutorial_general_star_power_meter_deploy
								time_shown = 1
							}
						]
					}
					{
						id = 'page10'
						next_page = 'page11'
						type = 'text'
						time_shown = 1
						text = qs(0x788efc87)
						audio_stream = 'Tut_Gnr1_L02_09'
					}
					{
						id = 'page11'
						next_page = 'page12'
						type = 'text'
						time_shown = 1
						text = qs(0x9fb7a099)
						audio_stream = 'Tut_Gnr1_L02_10'
					}
					{
						id = 'page12'
						next_page = 'page13'
						type = 'text'
						time_shown = 1
						text = qs(0x77ff9d35)
						audio_stream = 'Tut_Gnr1_L02_11'
					}
					{
						id = 'page13'
						next_page = 'page14'
						type = 'text'
						time_shown = 1
						text = qs(0xa9b91778)
						audio_stream = 'Tut_Gnr1_L02_12'
					}
					{
						id = 'page14'
						next_page = 'page15'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x618ef1a5)
						audio_stream = 'Tut_Gnr1_L02_13'
						images = [
							{
								image = tutorial_general_star_meter
								time_shown = 1
								scale = 1
							}
						]
					}
					{
						id = 'page15'
						next_page = 'page16'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x3d30fd67)
						audio_stream = 'Tut_Gnr1_L02_14'
						images = [
							{
								image = tutorial_general_star_meter_zoom
								time_shown = 1
							}
						]
					}
					{
						id = 'page16'
						next_page = 'page17'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x684b5067)
						audio_stream = 'Tut_Gnr1_L02_15'
						images = [
							{
								image = tutorial_general_star_meter_zoom
								time_shown = 1
							}
						]
					}
					{
						id = 'page17'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x871ed18f)
						audio_stream = 'Tut_Gnr1_L02_16'
						images = [
							{
								image = tutorial_general_star_meter_zoom
								time_shown = 1
							}
						]
					}
				]
			}
			{
				id = 'lesson2'
				title = qs(0xc14609f4)
				helper_text = qs(0x84dca08a)
				is_new
				pages = [
					{
						id = 'page0'
						next_page = 'first_page'
						title_page
						type = 'text'
						time_shown = $tutorial_system_post_title_wait_time
						text = qs(0xc14609f4)
					}
					{
						id = 'first_page'
						next_page = 'page1'
						type = 'text'
						time_shown = 1
						text = qs(0x70d707d9)
						audio_stream = 'Tut_Gnr1_L03_01'
					}
					{
						id = 'page1'
						next_page = 'page2'
						type = 'text'
						time_shown = 1
						text = qs(0x6abdc5e3)
						audio_stream = 'Tut_Gnr1_L03_02'
					}
					{
						id = 'page2'
						next_page = 'page3'
						type = 'text'
						time_shown = 1
						text = qs(0x681b6e80)
						audio_stream = 'Tut_Gnr1_L03_03'
					}
					{
						id = 'page3'
						next_page = 'page4'
						type = 'text'
						time_shown = 1
						text = qs(0x53e13598)
						audio_stream = 'Tut_Gnr1_L03_04'
					}
					{
						id = 'page4'
						next_page = 'page5'
						type = 'text'
						time_shown = 1
						text = qs(0x854b5ff3)
						audio_stream = 'Tut_Gnr1_L03_05'
					}
					{
						id = 'page5'
						next_page = 'page6'
						type = 'text'
						time_shown = 1
						text = qs(0x7cb197cf)
						audio_stream = 'Tut_Gnr1_L03_06'
					}
					{
						id = 'page6'
						next_page = 'page7'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x5f0907d3)
						audio_stream = 'Tut_Gnr1_L03_07'
						images = [
							{
								image = tutorial_general_challenge_instrument_icons
								time_shown = 1
							}
						]
					}
					{
						id = 'page7'
						next_page = 'page8'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x0d9990f9)
						audio_stream = 'Tut_Gnr1_L03_08'
						images = [
							{
								image = tutorial_general_challenge_instrument_icons
								time_shown = 1
							}
						]
					}
					{
						id = 'page8'
						next_page = 'page9'
						type = 'text_with_images'
						time_shown = 6
						text = qs(0x73ea9c66)
						audio_stream = 'Tut_Gnr1_L03_09'
						images = [
							{
								image = tutorial_general_challenge_meter
								time_shown = 1
								scale = 1
							}
						]
					}
					{
						id = 'page9'
						next_page = 'page10'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x1842d83a)
						audio_stream = 'Tut_Gnr1_L03_10'
						images = [
							{
								image = tutorial_general_challenge_meter_partial
								time_shown = 1
								scale = 1
							}
						]
					}
					{
						id = 'page10'
						next_page = 'page13'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x0a644d3c)
						audio_stream = 'Tut_Gnr1_L03_11'
						images = [
							{
								image = tutorial_general_challenge_meter_level
								time_shown = 1
								scale = 1
							}
						]
					}
					{
						id = 'page13'
						next_page = 'page14'
						type = 'text'
						time_shown = 1
						text = qs(0x433cb81a)
						audio_stream = 'Tut_Gnr1_L03_14'
					}
					{
						id = 'page14'
						next_page = 'page15'
						type = 'text'
						time_shown = 1
						text = qs(0xc5259b19)
						audio_stream = 'Tut_Gnr1_L03_15'
					}
					{
						id = 'page15'
						next_page = 'page16'
						type = 'text'
						time_shown = 1
						text = qs(0xf6009831)
						audio_stream = 'Tut_Gnr1_L03_16'
					}
					{
						id = 'page16'
						type = 'text'
						time_shown = 1
						text = qs(0xaf8ff185)
						audio_stream = 'Tut_Gnr1_L03_17'
					}
				]
			}
		]
	}
]
guitar_tutorial_helper_text = qs(0x9c318188)
guitar_tutorials = [
	{
		id = 'guitar_basics'
		helper_text = qs(0xf497712d)
		title = qs(0x1f331fb3)
		lessons = [
			{
				id = 'lesson0'
				next_lesson = 'lesson2'
				title = qs(0xbeb411bb)
				helper_text = qs(0x53f7a850)
				pages = [
					{
						id = 'page0'
						next_page = 'first_page'
						title_page
						type = 'text'
						time_shown = $tutorial_system_post_title_wait_time
						text = qs(0xbeb411bb)
					}
					{
						id = 'first_page'
						next_page = 'page2'
						type = 'text'
						time_shown = 1
						text = qs(0x15cd7af6)
						audio_stream = 'Tut_Gtr1_L01_01'
					}
					{
						id = 'page2'
						next_page = 'page3'
						type = 'text'
						time_shown = 1
						text = qs(0xf2e5e496)
						audio_stream = 'Tut_Gtr1_L01_02'
					}
					{
						id = 'page3'
						next_page = 'page4'
						type = 'text'
						time_shown = 1
						text = qs(0x5462fbc2)
						audio_stream = 'Tut_Gtr1_L01_03'
					}
					{
						id = 'page4'
						next_page = 'page5'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xd0b00365)
						audio_stream = 'Tut_Gtr1_L01_04'
						images = [
							{
								image = tutorial_guitar_horiz_nohands
								time_shown = 1
							}
						]
					}
					{
						id = 'page5'
						next_page = 'page6'
						type = 'text'
						time_shown = 1
						text = qs(0x64972e67)
						audio_stream = 'Tut_Gtr1_L01_07'
					}
					{
						id = 'page6'
						next_page = 'page7'
						type = 'text'
						time_shown = 1
						text = qs(0x01aea60a)
						audio_stream = 'Tut_Gtr1_L01_08'
					}
					{
						id = 'page7'
						next_page = 'page8'
						type = 'text_with_images'
						lefty_flip = 0
						time_shown = 1
						text = qs(0x751b097e)
						audio_stream = 'Tut_Gtr1_L01_09'
						images = [
							{
								image = tutorial_guitar_horiz_hands
								time_shown = 1
							}
						]
					}
					{
						id = 'page7'
						next_page = 'page7a'
						type = 'text_with_images'
						lefty_flip = 1
						time_shown = 1
						text = qs(0x751b097e)
						audio_stream = 'Tut_Gtr1_L01_09'
						images = [
							{
								image = tutorial_guitar_horiz_hands_lefty
								time_shown = 1
							}
						]
					}
					{
						id = 'page7a'
						next_page = 'page8'
						type = 'text_with_images'
						lefty_flip = 1
						time_shown = 1
						text = qs(0x9f1e3e0a)
						audio_stream = 'Tut_Gtr1_L01_10'
						images = [
							{
								image = tutorial_guitar_horiz_hands_lefty
								time_shown = 1
							}
						]
					}
					{
						id = 'page8'
						next_page = 'page9'
						type = 'text_with_images'
						lefty_flip = 0
						time_shown = 1
						text = qs(0x57dbcc31)
						audio_stream = 'Tut_Gtr1_L01_11'
						images = [
							{
								image = tutorial_guitar_horiz_hands
								time_shown = 1
							}
						]
					}
					{
						id = 'page8'
						next_page = 'page9'
						type = 'text_with_images'
						lefty_flip = 1
						time_shown = 1
						text = qs(0x57dbcc31)
						audio_stream = 'Tut_Gtr1_L01_11'
						images = [
							{
								image = tutorial_guitar_horiz_hands_lefty
								time_shown = 1
							}
						]
					}
					{
						id = 'page9'
						next_page = 'page10'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xa14f0886)
						audio_stream = 'Tut_Gtr1_L01_12'
						images = [
							{
								image = tutorial_guitar_torso_mid
								time_shown = 1
								scale = (1.0, 1.0)
							}
						]
					}
					{
						id = 'page10'
						next_page = 'page11'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x4787b1b8)
						audio_stream = 'Tut_Gtr1_L01_13'
						images = [
							{
								image = tutorial_guitar_torso_low
								time_shown = 1
								scale = (1.0, 1.0)
							}
						]
					}
					{
						id = 'page11'
						next_page = 'page12'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xd11b3da4)
						wait_for_user_input
						audio_stream = 'Tut_Gtr1_L01_14'
						images = [
							{
								image = tutorial_guitar_torso_low
								time_shown = 1
								scale = (1.0, 1.0)
							}
							{
								image = tutorial_guitar_torso_mid
								time_shown = 1
								scale = (1.0, 1.0)
							}
							{
								image = tutorial_guitar_torso_high
								time_shown = 1
								scale = (1.0, 1.0)
							}
							{
								image = tutorial_guitar_torso_mid
								time_shown = 1
								scale = (1.0, 1.0)
							}
						]
					}
					{
						id = 'page12'
						next_page = 'page13'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x000e7d1b)
						audio_stream = 'Tut_Gtr1_L01_15'
						images = [
							{
								image = tutorial_guitar_horiz_nohands
								time_shown = 1
							}
						]
					}
					{
						id = 'page13'
						next_page = 'page14'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xba4e4625)
						audio_stream = 'Tut_Gtr1_L01_16'
						images = [
							{
								image = tutorial_guitar_horiz_nohands
								time_shown = 1
							}
						]
					}
					{
						id = 'page14'
						next_page = 'page15'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x27d5b631)
						audio_stream = 'Tut_Gtr1_L01_17'
						images = [
							{
								image = tutorial_guitar_horiz_nohands
								time_shown = 1
							}
						]
					}
					{
						id = 'page15'
						next_page = 'page17'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xb3cbb58e)
						audio_stream = 'Tut_Gtr1_L01_18'
						images = [
							{
								image = tutorial_guitar_horiz_frets
								time_shown = 1
							}
						]
					}
					{
						id = 'page17'
						next_page = 'page19'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x52140474)
						audio_stream = 'Tut_Gtr1_L01_20'
						images = [
							{
								image = tutorial_guitar_horiz_strum
								time_shown = 1
							}
						]
					}
					{
						id = 'page19'
						next_page = 'page20'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xfbb36546)
						audio_stream = 'Tut_Gtr1_L01_21'
						images = [
							{
								image = tutorial_guitar_horiz_whammy
								time_shown = 1
							}
						]
					}
					{
						id = 'page20'
						next_page = 'page22'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xcbc89283)
						audio_stream = 'Tut_Gtr1_L01_22'
						images = [
							{
								image = tutorial_guitar_horiz_whammy_moved
								time_shown = 1
							}
						]
					}
					{
						id = 'page22'
						type = 'text'
						time_shown = 1
						text = qs(0x107c4ead)
						audio_stream = 'Tut_Gtr1_L01_24'
					}
				]
			}
			{
				id = 'lesson2'
				next_lesson = 'lesson3'
				title = qs(0xd54a59e8)
				helper_text = qs(0x59b497d8)
				pages = [
					{
						id = 'page0'
						next_page = 'first_page'
						title_page
						type = 'text'
						time_shown = $tutorial_system_post_title_wait_time
						text = qs(0xd54a59e8)
					}
					{
						id = 'first_page'
						next_page = 'page1'
						type = 'text'
						time_shown = 1
						text = qs(0x4a78ae18)
						audio_stream = 'Tut_Gtr1_L03_01'
					}
					{
						id = 'page1'
						next_page = 'page2'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x7264e1bb)
						audio_stream = 'Tut_Gtr1_L03_02'
						images = [
							{
								image = tutorial_guitar_fret_circles
								time_shown = 1
							}
						]
					}
					{
						id = 'page2'
						next_page = 'page3'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xf72f6a66)
						audio_stream = 'Tut_Gtr1_L03_03'
						images = [
							{
								image = tutorial_guitar_fret_preload
								time_shown = 1
							}
							{
								image = tutorial_guitar_notes_hit_strum
								time_shown = 1
							}
						]
					}
					{
						id = 'page3'
						next_page = 'page4'
						type = 'text'
						time_shown = 1
						text = qs(0xd516f378)
						audio_stream = 'Tut_Gtr1_L03_04'
					}
					{
						id = 'page4'
						next_page = 'page8'
						type = 'text'
						time_shown = 1
						text = qs(0x8335af14)
						audio_stream = 'Tut_Gtr1_L03_05'
					}
					{
						id = 'page8'
						next_page = 'page9'
						type = 'text'
						time_shown = 1
						text = qs(0xefa32930)
						audio_stream = 'Tut_Gtr1_L03_06'
					}
					{
						id = 'page9'
						next_page = 'page10'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x85f6612d)
						audio_stream = 'Tut_Gtr1_L03_07'
						images = [
							{
								image = tutorial_guitar_fret_preload
								time_shown = 1
							}
						]
					}
					{
						id = 'page10'
						next_page = 'page11'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x9d538b8e)
						audio_stream = 'Tut_Gtr1_L03_08'
						images = [
							{
								image = tutorial_guitar_fret_preload
								time_shown = 1
							}
						]
					}
					{
						id = 'page11'
						next_page = 'page11g'
						type = 'text'
						time_shown = 1
						text = qs(0x037b5997)
						audio_stream = 'Tut_Gtr1_L03_09'
					}
					{
						id = 'page11g'
						next_page = 'page12'
						type = 'gameplay'
						text = qs(0x037b5997)
						audio_stream = 'Tut_Gtr1_L03_09'
						song = tut_guitar_g_only
						stat_counter_func = count_notes
						stat_display_func = count_notes_display
						band_lesson = 0
					}
					{
						id = 'page12'
						next_page = 'page12g'
						type = 'text'
						time_shown = 1
						text = qs(0x91b3ea27)
						audio_stream = 'Tut_Gtr1_L03_10'
					}
					{
						id = 'page12g'
						next_page = 'page13'
						type = 'gameplay'
						text = qs(0x91b3ea27)
						audio_stream = 'Tut_Gtr1_L03_10'
						song = tut_guitar_gry
						stat_counter_func = count_notes
						stat_display_func = count_notes_display
						band_lesson = 0
					}
					{
						id = 'page13'
						next_page = 'page14'
						type = 'text'
						time_shown = 1
						text = qs(0x233301e3)
						audio_stream = 'Tut_Gtr1_L03_11'
					}
					{
						id = 'page14'
						type = 'text'
						time_shown = 1
						text = qs(0xab8d262d)
						audio_stream = 'Tut_Gtr1_L03_12'
					}
				]
			}
			{
				id = 'lesson3'
				next_lesson = 'lesson4'
				title = qs(0xde617256)
				helper_text = qs(0x767e6d25)
				pages = [
					{
						id = 'page0'
						next_page = 'first_page'
						title_page
						type = 'text'
						time_shown = $tutorial_system_post_title_wait_time
						text = qs(0xde617256)
					}
					{
						id = 'first_page'
						next_page = 'page1'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xbb6a05ed)
						audio_stream = 'Tut_Gtr1_L04_01'
						images = [
							{
								image = tutorial_guitar_chord_note
								time_shown = 1
							}
						]
					}
					{
						id = 'page1'
						next_page = 'page2'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x3afee243)
						audio_stream = 'Tut_Gtr1_L04_02'
						images = [
							{
								image = tutorial_guitar_chord_note
								time_shown = 1
							}
							{
								image = tutorial_guitar_chord_hit
								time_shown = 1
							}
						]
					}
					{
						id = 'page2'
						next_page = 'page2g'
						type = 'text'
						time_shown = 1
						text = qs(0xb641de11)
						audio_stream = 'Tut_Gtr1_L04_03'
					}
					{
						id = 'page2g'
						next_page = 'page3'
						type = 'gameplay'
						text = qs(0xb641de11)
						audio_stream = 'Tut_Gtr1_L04_03'
						song = tut_guitar_chords
						stat_counter_func = count_notes
						stat_display_func = count_notes_display
						band_lesson = 0
					}
					{
						id = 'page3'
						next_page = 'page4'
						type = 'text'
						time_shown = 1
						text = qs(0xf9a93804)
						audio_stream = 'Tut_Gtr1_L04_04'
					}
					{
						id = 'page4'
						next_page = 'page5'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x311454dd)
						audio_stream = 'Tut_Gtr1_L04_05'
						images = [
							{
								image = tutorial_guitar_sustained_note
								time_shown = 1
							}
						]
					}
					{
						id = 'page5'
						next_page = 'page6'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xe85acbbc)
						audio_stream = 'Tut_Gtr1_L04_06'
						images = [
							{
								image = tutorial_guitar_sustained_note
								time_shown = 1
							}
						]
					}
					{
						id = 'page6'
						next_page = 'page7'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x6771c267)
						audio_stream = 'Tut_Gtr1_L04_07'
						images = [
							{
								image = tutorial_guitar_sustained_note_held
								time_shown = 1
							}
						]
					}
					{
						id = 'page7'
						next_page = 'page8'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x4b92a2af)
						audio_stream = 'Tut_Gtr1_L04_08'
						images = [
							{
								image = tutorial_guitar_sustained_note_dropped
								time_shown = 1
							}
						]
					}
					{
						id = 'page8'
						next_page = 'page8g'
						type = 'text'
						time_shown = 1
						text = qs(0xc02039c8)
						audio_stream = 'Tut_Gtr1_L04_09'
					}
					{
						id = 'page8g'
						next_page = 'page9'
						type = 'gameplay'
						text = qs(0xe06b74e7)
						audio_stream = 'Tut_Gtr1_L04_09'
						song = tut_guitar_sustains
						stat_counter_func = count_notes
						stat_display_func = count_notes_display
						band_lesson = 0
					}
					{
						id = 'page9'
						next_page = 'page10'
						type = 'text'
						time_shown = 1
						text = qs(0x7e83769a)
						audio_stream = 'Tut_Gtr1_L04_10'
					}
					{
						id = 'page10'
						type = 'text'
						time_shown = 1
						text = qs(0xc12bee2d)
						audio_stream = 'Tut_Gtr1_L04_11'
					}
				]
			}
			{
				id = 'lesson4'
				title = qs(0x7b6dc4a0)
				helper_text = qs(0x6644998b)
				pages = [
					{
						id = 'page0'
						next_page = 'first_page'
						title_page
						type = 'text'
						time_shown = $tutorial_system_post_title_wait_time
						text = qs(0x7b6dc4a0)
					}
					{
						id = 'first_page'
						next_page = 'page1'
						type = 'text'
						time_shown = 1
						text = qs(0x142d33e0)
						audio_stream = 'Tut_Gtr1_L05_01'
					}
					{
						id = 'page1'
						next_page = 'page3'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xfa000a9c)
						audio_stream = 'Tut_Gtr1_L05_02'
						images = [
							{
								image = tutorial_guitar_spower_rockmult
								time_shown = 1
							}
						]
					}
					{
						id = 'page3'
						next_page = 'page4'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xf3ca2624)
						audio_stream = 'Tut_Gtr1_L05_03'
						images = [
							{
								image = tutorial_guitar_spower_meter
								time_shown = 1
							}
						]
					}
					{
						id = 'page4'
						next_page = 'page7'
						type = 'text_with_images'
						time_shown = 8
						text = qs(0x4a32f590)
						audio_stream = 'Tut_Gtr1_L05_04'
						images = [
							{
								image = tutorial_guitar_tilt_4_spower_a
								time_shown = 1
							}
							{
								image = tutorial_guitar_tilt_4_spower_b
								time_shown = 1
							}
						]
					}
					{
						id = 'page7'
						next_page = 'page10'
						type = 'text_with_images'
						time_shown = 1
						hardware = touchguitar
						text = qs(0x1d8c0a39)
						audio_stream = 'Tut_Gtr1_L05_06'
						images = [
							{
								image = tutorial_guitar_gh4_spbutton
								time_shown = 1
							}
						]
					}
					{
						id = 'page7'
						next_page = 'page10'
						type = 'text'
						time_shown = 0
						hardware = notouchguitar
					}
					{
						id = 'page10'
						next_page = 'page11'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xb078efde)
						audio_stream = 'Tut_Gtr1_L05_10'
						images = [
							{
								image = tutorial_guitar_sp_sequence
								time_shown = 1
							}
						]
					}
					{
						id = 'page11'
						next_page = 'page12'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x9a6182f4)
						audio_stream = 'Tut_Gtr1_L05_11'
						images = [
							{
								image = tutorial_guitar_sp_sequence
								time_shown = 1
							}
						]
					}
					{
						id = 'page12'
						next_page = 'page13'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x78ce4d6e)
						audio_stream = 'Tut_Gtr1_L05_12'
						images = [
							{
								image = tutorial_guitar_sp_sequence_complete
								time_shown = 1
							}
						]
					}
					{
						id = 'page13'
						next_page = 'page14'
						type = 'text'
						time_shown = 1
						text = qs(0xe216f280)
						audio_stream = 'Tut_Gtr1_L05_13'
					}
					{
						id = 'page14'
						next_page = 'page14g'
						type = 'text'
						time_shown = 1
						text = qs(0xb70c5c56)
						audio_stream = 'Tut_Gtr1_L05_14'
					}
					{
						id = 'page14g'
						next_page = 'page16'
						type = 'gameplay'
						text = qs(0xb70c5c56)
						audio_stream = 'Tut_Gtr1_L05_14'
						song = tut_guitar_sp
						stat_counter_func = count_notes
						stat_display_func = count_notes_display
						band_lesson = 0
					}
					{
						id = 'page16'
						next_page = 'page18'
						type = 'text'
						time_shown = 1
						text = qs(0x8dc89a02)
						audio_stream = 'Tut_Gtr1_L05_17'
					}
					{
						id = 'page18'
						next_page = 'page20'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xcb395d6e)
						audio_stream = 'Tut_Gtr1_L05_18'
						images = [
							{
								image = tutorial_guitar_sp_sustain
								time_shown = 1
							}
							{
								image = tutorial_guitar_sp_sustain_whammy
								time_shown = 1
							}
						]
					}
					{
						id = 'page20'
						next_page = 'page20ag'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xcc0cde7a)
						audio_stream = 'Tut_Gtr1_L05_19'
						images = [
							{
								image = tutorial_guitar_sp_sustain_whammy
								time_shown = 1
							}
						]
					}
					{
						id = 'page20ag'
						next_page = 'page21'
						type = 'gameplay'
						text = qs(0xcc0cde7a)
						audio_stream = 'Tut_Gtr1_L05_20'
						song = tut_guitar_sp_sustains
						stat_counter_func = count_notes
						stat_display_func = count_notes_display
						band_lesson = 0
					}
					{
						id = 'page21'
						next_page = 'page22'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xbcc980ca)
						audio_stream = 'Tut_Gtr1_L05_21'
						images = [
							{
								image = tutorial_guitar_whammy_types
								time_shown = 1
							}
						]
					}
					{
						id = 'page22'
						next_page = 'page23'
						type = 'text'
						time_shown = 1
						text = qs(0x0af56b49)
						audio_stream = 'Tut_Gtr1_L05_22'
					}
					{
						id = 'page23'
						next_page = 'page24'
						type = 'text'
						time_shown = 1
						text = qs(0x472fada0)
						audio_stream = 'Tut_Gtr1_L05_23'
					}
					{
						id = 'page24'
						next_page = 'page25'
						type = 'text'
						time_shown = 1
						text = qs(0xb4b6102f)
						audio_stream = 'Tut_Gtr1_L05_24'
					}
					{
						id = 'page25'
						type = 'text'
						time_shown = 1
						text = qs(0xfd8fcc50)
						audio_stream = 'Tut_Gtr1_L05_25'
					}
				]
			}
		]
	}
	{
		id = 'guitar_advanced'
		title = qs(0xd9705bfd)
		helper_text = qs(0xc8a780ff)
		lessons = [
			{
				id = 'lesson0'
				next_lesson = 'lesson1'
				title = qs(0x3c4d2c6d)
				helper_text = qs(0x6fe54b67)
				pages = [
					{
						id = 'page0'
						next_page = 'first_page'
						title_page
						type = 'text'
						time_shown = $tutorial_system_post_title_wait_time
						text = qs(0x3c4d2c6d)
					}
					{
						id = 'first_page'
						next_page = 'page1'
						type = 'text'
						time_shown = 1
						text = qs(0x8efdd504)
						audio_stream = 'Tut_Gtr2_L01_01'
					}
					{
						id = 'page1'
						next_page = 'page2'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x2614f871)
						audio_stream = 'Tut_Gtr2_L01_02'
						images = [
							{
								image = icon_difficulty_medium
								time_shown = 1
								scale = (3.0, 3.0)
							}
						]
					}
					{
						id = 'page2'
						next_page = 'page3'
						type = 'text'
						time_shown = 1
						text = qs(0xb0687fca)
						audio_stream = 'Tut_Gtr2_L01_03'
					}
					{
						id = 'page3'
						next_page = 'page4'
						type = 'text'
						time_shown = 1
						text = qs(0x83235ff2)
						audio_stream = 'Tut_Gtr2_L01_04'
					}
					{
						id = 'page4'
						next_page = 'page5'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x0d42c98d)
						audio_stream = 'Tut_Gtr2_L01_05'
						images = [
							{
								image = tutorial_guitar_override_1
								time_shown = 1
							}
							{
								image = tutorial_guitar_override_2
								time_shown = 1
							}
							{
								image = tutorial_guitar_override_3
								time_shown = 1
							}
						]
					}
					{
						id = 'page5'
						next_page = 'page6'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xd3676c0d)
						audio_stream = 'Tut_Gtr2_L01_06'
						images = [
							{
								image = tutorial_guitar_override_1
								time_shown = 1
							}
							{
								image = tutorial_guitar_override_2
								time_shown = 1
							}
							{
								image = tutorial_guitar_override_3
								time_shown = 1
							}
						]
					}
					{
						id = 'page6'
						next_page = 'page6g'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x6d49b214)
						audio_stream = 'Tut_Gtr2_L01_07'
						images = [
							{
								image = tutorial_guitar_override_1
								time_shown = 1
							}
							{
								image = tutorial_guitar_override_2
								time_shown = 1
							}
							{
								image = tutorial_guitar_override_3
								time_shown = 1
							}
						]
					}
					{
						id = 'page6g'
						next_page = 'page8'
						type = 'gameplay'
						text = qs(0x6d49b214)
						audio_stream = 'Tut_Gtr2_L01_07'
						song = tut_guitar_high_note
						stat_counter_func = count_notes
						stat_display_func = count_notes_display
						band_lesson = 0
					}
					{
						id = 'page8'
						next_page = 'page9'
						type = 'text'
						time_shown = 1
						text = qs(0xd7c57f6f)
						audio_stream = 'Tut_Gtr2_L01_08'
					}
					{
						id = 'page9'
						type = 'text'
						time_shown = 1
						text = qs(0xe36d383b)
						audio_stream = 'Tut_Gtr2_L01_09'
					}
				]
			}
			{
				id = 'lesson1'
				next_lesson = 'lesson2'
				title = qs(0x29549299)
				helper_text = qs(0xd300f92b)
				is_new
				pages = [
					{
						id = 'page0'
						next_page = 'first_page'
						title_page
						type = 'text'
						time_shown = $tutorial_system_post_title_wait_time
						text = qs(0x29549299)
					}
					{
						id = 'first_page'
						next_page = 'page1'
						type = 'text'
						time_shown = 1
						text = qs(0xef2d7ced)
						audio_stream = 'Tut_Gtr2_L02_01'
					}
					{
						id = 'page1'
						next_page = 'page2'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x83efe588)
						audio_stream = 'Tut_Gtr2_L02_02'
						images = [
							{
								image = tutorial_guitar_screen_hopo_start
								time_shown = 1
							}
						]
					}
					{
						id = 'page2'
						next_page = 'page3'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x0367574c)
						audio_stream = 'Tut_Gtr2_L02_03'
						images = [
							{
								image = tutorial_guitar_screen_hopo_start
								time_shown = 1
							}
						]
					}
					{
						id = 'page3'
						next_page = 'page4'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x98a0eb79)
						audio_stream = 'Tut_Gtr2_L02_04'
						images = [
							{
								image = tutorial_guitar_screen_hopo_start
								time_shown = 1
							}
						]
					}
					{
						id = 'page4'
						next_page = 'page6'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xbd1c520d)
						audio_stream = 'Tut_Gtr2_L02_05'
						images = [
							{
								image = tutorial_guitar_screen_hopo_nostrum
								time_shown = 1
							}
						]
					}
					{
						id = 'page6'
						next_page = 'page7'
						type = 'text'
						time_shown = 1
						text = qs(0xc591e124)
						audio_stream = 'Tut_Gtr2_L02_06'
					}
					{
						id = 'page7'
						next_page = 'page7g'
						type = 'text'
						time_shown = 1
						text = qs(0x7d72bc2d)
						audio_stream = 'Tut_Gtr2_L02_07'
					}
					{
						id = 'page7g'
						next_page = 'page8'
						type = 'gameplay'
						text = qs(0x7d72bc2d)
						audio_stream = 'Tut_Gtr2_L02_07'
						song = tut_guitar_hammeron
						stat_counter_func = count_notes
						stat_display_func = count_notes_display
						band_lesson = 0
					}
					{
						id = 'page8'
						next_page = 'page9'
						type = 'text'
						time_shown = 1
						text = qs(0xefb73903)
						audio_stream = 'Tut_Gtr2_L02_08'
					}
					{
						id = 'page9'
						next_page = 'page10'
						type = 'text'
						time_shown = 1
						text = qs(0xd9b69e1f)
						audio_stream = 'Tut_Gtr2_L02_09'
					}
					{
						id = 'page10'
						next_page = 'page11'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xb9e03bbf)
						audio_stream = 'Tut_Gtr2_L02_10'
						images = [
							{
								image = tutorial_guitar_screen_po
								time_shown = 1
							}
							{
								image = tutorial_guitar_screen_po_1hit
								time_shown = 0.75
							}
							{
								image = tutorial_guitar_screen_po_2hit
								time_shown = 0.75
							}
							{
								image = tutorial_guitar_screen_po_3hit
								time_shown = 0.75
							}
						]
					}
					{
						id = 'page11'
						next_page = 'page11g'
						type = 'text'
						time_shown = 1
						text = qs(0xad79ebed)
						audio_stream = 'Tut_Gtr2_L02_11'
					}
					{
						id = 'page11g'
						next_page = 'page13'
						type = 'gameplay'
						text = qs(0xf691a4db)
						audio_stream = 'Tut_Gtr2_L02_11'
						song = tut_guitar_pulloff
						stat_counter_func = count_notes
						stat_display_func = count_notes_display
						band_lesson = 0
					}
					{
						id = 'page13'
						next_page = 'page14'
						type = 'text'
						time_shown = 1
						text = qs(0xd7fb44bf)
						audio_stream = 'Tut_Gtr2_L02_13'
					}
					{
						id = 'page14'
						next_page = 'page15'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x407492aa)
						audio_stream = 'Tut_Gtr2_L02_14'
						images = [
							{
								image = tutorial_guitar_screen_po_chord
								time_shown = 1
							}
						]
					}
					{
						id = 'page15'
						next_page = 'page16'
						type = 'text'
						time_shown = 1
						text = qs(0x1ab8ef7b)
						audio_stream = 'Tut_Gtr2_L02_15'
					}
					{
						id = 'page16'
						next_page = 'page16g'
						type = 'text'
						time_shown = 1
						text = qs(0x32217b8e)
						audio_stream = 'Tut_Gtr2_L02_16'
					}
					{
						id = 'page16g'
						next_page = 'page18'
						type = 'gameplay'
						text = qs(0x4d70559e)
						audio_stream = 'Tut_Gtr2_L02_16'
						song = tut_guitar_hopochords
						stat_counter_func = count_notes
						stat_display_func = count_notes_display
						band_lesson = 0
					}
					{
						id = 'page18'
						type = 'text'
						time_shown = 1
						text = qs(0xcb19db08)
						audio_stream = 'Tut_Gtr2_L02_18'
					}
				]
			}
			{
				id = 'lesson2'
				next_lesson = 'lesson3'
				helper_text = qs(0x2a792514)
				title = qs(0xe0655830)
				pages = [
					{
						id = 'page0'
						next_page = 'first_page'
						title_page
						type = 'text'
						time_shown = $tutorial_system_post_title_wait_time
						text = qs(0xe0655830)
					}
					{
						id = 'first_page'
						next_page = 'page1'
						type = 'text'
						time_shown = 1
						text = qs(0xf21175df)
						audio_stream = 'Tut_Gtr2_L03_01'
					}
					{
						id = 'page1'
						next_page = 'page2'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x24f4e0a3)
						audio_stream = 'Tut_Gtr2_L03_02'
						images = [
							{
								image = tutorial_guitar_screen_tap_notes
								time_shown = 1
							}
						]
					}
					{
						id = 'page2'
						next_page = 'page4'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x0b0b7835)
						audio_stream = 'Tut_Gtr2_L03_03'
						images = [
							{
								image = tutorial_guitar_screen_tap_nostrum
								time_shown = 1
							}
						]
					}
					{
						id = 'page4'
						next_page = 'page4g'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xbda23f3c)
						audio_stream = 'Tut_Gtr2_L03_04'
						images = [
							{
								image = tutorial_guitar_screen_tap_nostrum
								time_shown = 1
							}
						]
					}
					{
						id = 'page4g'
						next_page = 'page6'
						type = 'gameplay'
						text = qs(0xbda23f3c)
						audio_stream = 'Tut_Gtr2_L03_04'
						song = tut_guitar_tapping
						stat_counter_func = count_notes
						stat_display_func = count_notes_display
						band_lesson = 0
					}
					{
						id = 'page6'
						next_page = 'page7'
						type = 'text'
						time_shown = 1
						text = qs(0x18d2cda8)
						audio_stream = 'Tut_Gtr2_L03_06'
					}
					{
						id = 'page7'
						next_page = 'page8'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x25134f2e)
						audio_stream = 'Tut_Gtr2_L03_07'
						images = [
							{
								image = tutorial_guitar_screen_tap_notes
								time_shown = 1
							}
						]
					}
					{
						id = 'page8'
						type = 'text'
						time_shown = 1
						text = qs(0xb39accfa)
						audio_stream = 'Tut_Gtr2_L03_08'
					}
				]
			}
			{
				id = 'lesson3'
				title = qs(0xe6a5f8d6)
				hardware = touchguitar
				helper_text = qs(0x3aed8f6d)
				pages = [
					{
						id = 'page0'
						next_page = 'first_page'
						title_page
						type = 'text'
						time_shown = $tutorial_system_post_title_wait_time
						text = qs(0xe6a5f8d6)
					}
					{
						id = 'first_page'
						next_page = 'page1'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x431d7084)
						audio_stream = 'Tut_Gtr2_L04_01'
						images = [
							{
								image = tutorial_guitar_slider
								time_shown = 1
							}
						]
					}
					{
						id = 'page1'
						next_page = 'page2'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xf25400d3)
						audio_stream = 'Tut_Gtr2_L04_02'
						images = [
							{
								image = tutorial_guitar_slider
								time_shown = 1
							}
						]
					}
					{
						id = 'page2'
						next_page = 'page3'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x6da86bf1)
						audio_stream = 'Tut_Gtr2_L04_03'
						images = [
							{
								image = tutorial_guitar_slider_tapnotes_1hit
								time_shown = 1
							}
							{
								image = tutorial_guitar_slider_tapnotes_2hit
								time_shown = 1
							}
							{
								image = tutorial_guitar_slider_tapnotes_3hit
								time_shown = 1
							}
						]
					}
					{
						id = 'page3'
						next_page = 'page4'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xb8c57ee8)
						audio_stream = 'Tut_Gtr2_L04_04'
						images = [
							{
								image = tutorial_guitar_slider_tapstrum_up
								time_shown = 1
							}
							{
								image = tutorial_guitar_slider_tapstrum_dn
								time_shown = 1
							}
						]
					}
					{
						id = 'page4'
						next_page = 'page5'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xa924e0df)
						audio_stream = 'Tut_Gtr2_L04_05'
						images = [
							{
								image = tutorial_guitar_slider_tapstrum_up
								time_shown = 1
							}
							{
								image = tutorial_guitar_slider_tapstrum_dn
								time_shown = 1
							}
						]
					}
					{
						id = 'page5'
						next_page = 'page6'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x84bdb9e7)
						audio_stream = 'Tut_Gtr2_L04_06'
						images = [
							{
								image = tutorial_guitar_slider_longnotes_pos1
								time_shown = 1
							}
							{
								image = tutorial_guitar_slider_longnotes_pos2
								time_shown = 1
							}
						]
					}
					{
						id = 'page6'
						next_page = 'page7'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x70c30c3e)
						audio_stream = 'Tut_Gtr2_L04_07'
						images = [
							{
								image = tutorial_guitar_slider_longnotes_pos1
								time_shown = 1
							}
							{
								image = tutorial_guitar_slider_longnotes_pos2
								time_shown = 1
							}
						]
					}
					{
						id = 'page7'
						next_page = 'page8'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xc568db31)
						audio_stream = 'Tut_Gtr2_L04_08'
						images = [
							{
								image = tutorial_guitar_slider_longnotes_pos1
								time_shown = 1
							}
							{
								image = tutorial_guitar_slider_longnotes_pos2
								time_shown = 1
							}
						]
					}
					{
						id = 'page8'
						next_page = 'page9'
						type = 'text'
						time_shown = 1
						text = qs(0x33315174)
						audio_stream = 'Tut_Gtr2_L04_09'
					}
					{
						id = 'page9'
						type = 'text'
						time_shown = 1
						text = qs(0xf7ff6ed6)
						audio_stream = 'Tut_Gtr2_L04_10'
					}
				]
			}
		]
	}
	{
		id = 'guitar_expert'
		title = qs(0xb519fe46)
		helper_text = qs(0x60497dc8)
		lessons = [
			{
				id = 'lesson0'
				next_lesson = 'lesson1'
				title = qs(0x1bc4c1af)
				helper_text = qs(0x6c4b5416)
				pages = [
					{
						id = 'page0'
						next_page = 'first_page'
						title_page
						type = 'text'
						time_shown = $tutorial_system_post_title_wait_time
						text = qs(0x1bc4c1af)
					}
					{
						id = 'first_page'
						next_page = 'page1'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x6823787d)
						audio_stream = 'Tut_Gtr3_L01_01'
						images = [
							{
								image = icon_difficulty_hard
								time_shown = 1
								scale = (3.0, 3.0)
							}
						]
					}
					{
						id = 'page1'
						next_page = 'page2'
						type = 'text'
						time_shown = 1
						text = qs(0x76ac3258)
						audio_stream = 'Tut_Gtr3_L01_03'
					}
					{
						id = 'page2'
						next_page = 'page3'
						type = 'text'
						time_shown = 1
						text = qs(0xbca315c7)
						audio_stream = 'Tut_Gtr3_L01_04'
					}
					{
						id = 'page3'
						next_page = 'page4'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x7e832647)
						audio_stream = 'Tut_Gtr3_L01_05'
						images = [
							{
								image = tutorial_guitar_hand_orange
								time_shown = 1
							}
						]
					}
					{
						id = 'page4'
						next_page = 'page5'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x038cda12)
						audio_stream = 'Tut_Gtr3_L01_06'
						images = [
							{
								image = tutorial_guitar_hand_blue
								time_shown = 1
							}
							{
								image = tutorial_guitar_hand_orange
								time_shown = 1
							}
						]
					}
					{
						id = 'page5'
						next_page = 'page6'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xc079f1a6)
						audio_stream = 'Tut_Gtr3_L01_07'
						images = [
							{
								image = tutorial_guitar_hand_orange
								time_shown = 1
							}
						]
					}
					{
						id = 'page6'
						next_page = 'page6g'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x9d78c9ff)
						audio_stream = 'Tut_Gtr3_L01_08'
						images = [
							{
								image = tutorial_guitar_hand_blue
								time_shown = 1
							}
							{
								image = tutorial_guitar_hand_orange
								time_shown = 1
							}
						]
					}
					{
						id = 'page6g'
						next_page = 'page7'
						type = 'gameplay'
						text = qs(0x9d78c9ff)
						audio_stream = 'Tut_Gtr3_L01_08'
						song = tut_guitar_fretting
						stat_counter_func = count_notes
						stat_display_func = count_notes_display
						band_lesson = 0
					}
					{
						id = 'page7'
						next_page = 'page8'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x13a004a3)
						audio_stream = 'Tut_Gtr3_L01_09'
						images = [
							{
								image = tutorial_guitar_hand_orange
								time_shown = 1
							}
						]
					}
					{
						id = 'page8'
						type = 'text'
						time_shown = 1
						text = qs(0x20361247)
						audio_stream = 'Tut_Gtr3_L01_10'
					}
				]
			}
			{
				id = 'lesson1'
				next_lesson = 'lesson2'
				title = qs(0x61ead4cf)
				helper_text = qs(0x83e8cc7f)
				pages = [
					{
						id = 'page0'
						next_page = 'first_page'
						title_page
						type = 'text'
						time_shown = $tutorial_system_post_title_wait_time
						text = qs(0x61ead4cf)
					}
					{
						id = 'first_page'
						next_page = 'page2'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x27398bed)
						audio_stream = 'Tut_Gtr3_L02_01'
						images = [
							{
								image = tutorial_guitar_exsustain
								time_shown = 1
							}
						]
					}
					{
						id = 'page2'
						next_page = 'page3'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xf7ada223)
						audio_stream = 'Tut_Gtr3_L02_02'
						images = [
							{
								image = tutorial_guitar_exsustain
								time_shown = 1
							}
						]
					}
					{
						id = 'page3'
						next_page = 'page4'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x7f0e8152)
						audio_stream = 'Tut_Gtr3_L02_03'
						images = [
							{
								image = tutorial_guitar_exsustain_1hit
								time_shown = 1
							}
						]
					}
					{
						id = 'page4'
						next_page = 'page5'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x16347f4e)
						audio_stream = 'Tut_Gtr3_L02_04'
						images = [
							{
								image = tutorial_guitar_exsustain_2hit
								time_shown = 1
							}
						]
					}
					{
						id = 'page5'
						next_page = 'page5g'
						type = 'text'
						time_shown = 1
						text = qs(0xa699e464)
						audio_stream = 'Tut_Gtr3_L02_05'
					}
					{
						id = 'page5g'
						next_page = 'page6'
						type = 'gameplay'
						text = qs(0xeffcadf8)
						audio_stream = 'Tut_Gtr3_L02_05'
						song = tut_guitar_extended
						stat_counter_func = count_notes
						stat_display_func = count_notes_display
						band_lesson = 0
					}
					{
						id = 'page6'
						next_page = 'page7'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xebdd223a)
						audio_stream = 'Tut_Gtr3_L02_06'
						images = [
							{
								image = tutorial_guitar_exsustain_1hit
								time_shown = 1
							}
							{
								image = tutorial_guitar_exsustain_2hit
								time_shown = 1
							}
						]
					}
					{
						id = 'page7'
						type = 'text'
						time_shown = 1
						text = qs(0x7feb7d82)
						audio_stream = 'Tut_Gtr3_L02_07'
					}
				]
			}
			{
				id = 'lesson2'
				next_lesson = 'lesson3'
				title = qs(0x78a18e54)
				helper_text = qs(0x5cdd8dc4)
				pages = [
					{
						id = 'page0'
						next_page = 'first_page'
						title_page
						type = 'text'
						time_shown = $tutorial_system_post_title_wait_time
						text = qs(0xcef088f9)
					}
					{
						id = 'first_page'
						next_page = 'page1'
						type = 'text'
						time_shown = 1
						text = qs(0x1d94094f)
						audio_stream = 'Tut_Gtr3_L03_01'
					}
					{
						id = 'page1'
						next_page = 'page2'
						type = 'text'
						time_shown = 1
						text = qs(0xd8074958)
						audio_stream = 'Tut_Gtr3_L03_02'
					}
					{
						id = 'page2'
						next_page = 'page3'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x2eb5451c)
						audio_stream = 'Tut_Gtr3_L03_03'
						images = [
							{
								image = tutorial_guitar_highway_rapid_notes
								time_shown = 1
							}
						]
					}
					{
						id = 'page3'
						next_page = 'page4'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xbba7e840)
						audio_stream = 'Tut_Gtr3_L03_04'
						images = [
							{
								image = tutorial_guitar_highway_altstrum_up
								time_shown = 1
							}
							{
								image = tutorial_guitar_highway_altstrum_dn
								time_shown = 1
							}
						]
					}
					{
						id = 'page4'
						next_page = 'page5'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xbdc9a797)
						audio_stream = 'Tut_Gtr3_L03_05'
						images = [
							{
								image = tutorial_guitar_highway_altstrum_up
								time_shown = 0.5
							}
							{
								image = tutorial_guitar_highway_altstrum_dn
								time_shown = 0.5
							}
						]
					}
					{
						id = 'page5'
						next_page = 'page6'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x2df29e9a)
						audio_stream = 'Tut_Gtr3_L03_06'
						images = [
							{
								image = tutorial_guitar_highway_altstrum_up
								time_shown = 0.5
							}
							{
								image = tutorial_guitar_highway_altstrum_dn
								time_shown = 0.5
							}
						]
					}
					{
						id = 'page6'
						next_page = 'page6g'
						type = 'text'
						time_shown = 1
						text = qs(0xc8975ac4)
						audio_stream = 'Tut_Gtr3_L03_07'
					}
					{
						id = 'page6g'
						next_page = 'page8'
						type = 'gameplay'
						text = qs(0xc8975ac4)
						audio_stream = 'Tut_Gtr3_L03_07'
						song = tut_guitar_altstrum
						stat_counter_func = count_notes
						stat_display_func = count_notes_display
						band_lesson = 0
					}
					{
						id = 'page8'
						next_page = 'page9'
						type = 'text'
						time_shown = 1
						text = qs(0xe4dd5dd5)
						audio_stream = 'Tut_Gtr3_L03_09'
					}
					{
						id = 'page9'
						type = 'text'
						time_shown = 1
						text = qs(0x87416bf2)
						audio_stream = 'Tut_Gtr3_L03_10'
					}
				]
			}
			{
				id = 'lesson3'
				title = qs(0x3b09bcba)
				helper_text = qs(0x84073301)
				pages = [
					{
						id = 'page0'
						next_page = 'first_page'
						title_page
						type = 'text'
						time_shown = $tutorial_system_post_title_wait_time
						text = qs(0x3b09bcba)
					}
					{
						id = 'first_page'
						next_page = 'page1'
						type = 'text'
						time_shown = 1
						text = qs(0x6b4c5874)
						audio_stream = 'Tut_Gtr3_L04_01'
					}
					{
						id = 'page1'
						next_page = 'page2'
						type = 'text'
						time_shown = 1
						text = qs(0x60d0c6d2)
						audio_stream = 'Tut_Gtr3_L04_02'
					}
					{
						id = 'page2'
						next_page = 'page3'
						type = 'text'
						time_shown = 1
						text = qs(0x2d24d8d0)
						audio_stream = 'Tut_Gtr3_L04_03'
					}
					{
						id = 'page3'
						next_page = 'page4'
						type = 'text'
						time_shown = 1
						text = qs(0x94f7950a)
						audio_stream = 'Tut_Gtr3_L04_04'
					}
					{
						id = 'page4'
						next_page = 'page5'
						type = 'text'
						time_shown = 1
						text = qs(0xad96ad5c)
						audio_stream = 'Tut_Gtr3_L04_05'
					}
					{
						id = 'page5'
						next_page = 'page6'
						type = 'text'
						time_shown = 1
						text = qs(0x7ee7c77c)
						audio_stream = 'Tut_Gtr3_L04_06'
					}
					{
						id = 'page6'
						next_page = 'page7'
						type = 'text'
						time_shown = 1
						text = qs(0xc1662f77)
						audio_stream = 'Tut_Gtr3_L04_07'
					}
					{
						id = 'page7'
						next_page = 'page8'
						type = 'text'
						time_shown = 1
						text = qs(0xf7094227)
						audio_stream = 'Tut_Gtr3_L04_08'
					}
					{
						id = 'page8'
						next_page = 'page9'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x4d2833e8)
						audio_stream = 'Tut_Gtr3_L04_09'
						images = [
							{
								image = tutorial_guitar_stretch_flex
								time_shown = 1
							}
						]
					}
					{
						id = 'page9'
						next_page = 'page10'
						type = 'text_with_images'
						time_shown = 6
						text = qs(0x7f571f87)
						audio_stream = 'Tut_Gtr3_L04_10'
						images = [
							{
								image = tutorial_guitar_stretch_laced
								time_shown = 0.5
							}
							{
								image = tutorial_guitar_stretch_laced_out
								time_shown = 0.8
							}
						]
					}
					{
						id = 'page10'
						next_page = 'page11'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x0a0704a8)
						audio_stream = 'Tut_Gtr3_L04_11'
						images = [
							{
								image = tutorial_guitar_stretch_push
								time_shown = 1
							}
						]
					}
					{
						id = 'page11'
						next_page = 'page12'
						type = 'text_with_images'
						time_shown = 6
						text = qs(0x9473cf3d)
						audio_stream = 'Tut_Gtr3_L04_12'
						images = [
							{
								image = tutorial_guitar_stretch_pull
								time_shown = 1
							}
						]
					}
					{
						id = 'page12'
						next_page = 'page13'
						type = 'text_with_images'
						time_shown = 6
						text = qs(0xa16ce7ea)
						audio_stream = 'Tut_Gtr3_L04_13'
						images = [
							{
								image = tutorial_guitar_stretch_shakeout_up
								time_shown = 0.2
							}
							{
								image = tutorial_guitar_stretch_shakeout
								time_shown = 0.2
							}
						]
					}
					{
						id = 'page13'
						type = 'text'
						time_shown = 1
						text = qs(0x295ff661)
						audio_stream = 'Tut_Gtr3_L04_14'
					}
				]
			}
		]
	}
]
bass_tutorial_helper_text = qs(0x54594388)
bass_tutorials = [
	{
		id = 'bass_basics'
		title = qs(0xd9705bfd)
		helper_text = qs(0x246c4936)
		lessons = [
			{
				id = 'lesson0'
				title = qs(0x7dab961a)
				helper_text = qs(0xe10d99bd)
				pages = [
					{
						id = 'page0'
						next_page = 'first_page'
						title_page
						type = 'text'
						time_shown = $tutorial_system_post_title_wait_time
						text = qs(0x7dab961a)
					}
					{
						id = 'first_page'
						next_page = 'page1'
						type = 'text'
						time_shown = 1
						text = qs(0x09382de5)
						audio_stream = 'Tut_Bss1_L01_01'
					}
					{
						id = 'page1'
						next_page = 'page2'
						type = 'text'
						time_shown = 1
						text = qs(0xdedd9f8a)
						audio_stream = 'Tut_Bss1_L01_02'
					}
					{
						id = 'page2'
						next_page = 'page3'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x857869a3)
						audio_stream = 'Tut_Bss1_L01_03'
						images = [
							{
								image = tutorial_guitar_highway_rapid_notes
								time_shown = 3
							}
						]
					}
					{
						id = 'page3'
						next_page = 'page4'
						type = 'text'
						time_shown = 1
						text = qs(0x487054b2)
						audio_stream = 'Tut_Bss1_L01_04'
					}
					{
						id = 'page4'
						next_page = 'page5'
						type = 'text'
						time_shown = 1
						text = qs(0xa925e921)
						audio_stream = 'Tut_Bss1_L01_05'
					}
					{
						id = 'page5'
						next_page = 'page6'
						type = 'text_with_images'
						time_shown = 3
						text = qs(0x1378e2ff)
						audio_stream = 'Tut_Bss1_L01_06'
						images = [
							{
								image = tutorial_guitar_highway_open_note
								time_shown = 3
							}
						]
					}
					{
						id = 'page6'
						next_page = 'page7'
						type = 'text_with_images'
						time_shown = 3
						text = qs(0xc25c3c06)
						audio_stream = 'Tut_Bss1_L01_07'
						images = [
							{
								image = tutorial_guitar_highway_openote_nofrets
								time_shown = 0.5
							}
							{
								image = tutorial_guitar_highway_openote_nofrets_strum
								time_shown = 0.5
							}
						]
					}
					{
						id = 'page7'
						next_page = 'page8'
						type = 'text_with_images'
						text = qs(0x993b0327)
						audio_stream = 'Tut_Bss1_L01_08'
						images = [
							{
								image = tutorial_guitar_highway_open_note_mix
								time_shown = 3
							}
						]
					}
					{
						id = 'page8'
						next_page = 'page8g'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xdf8ead9e)
						audio_stream = 'Tut_Bss1_L01_09'
						images = [
							{
								image = tutorial_guitar_highway_openote_nofrets
								time_shown = 0.5
							}
							{
								image = tutorial_guitar_highway_openote_nofrets_strum
								time_shown = 0.5
							}
						]
					}
					{
						id = 'page8g'
						next_page = 'page9'
						type = 'gameplay'
						text = qs(0xdf8ead9e)
						audio_stream = 'Tut_Bss1_L01_09'
						song = tut_bass_open
						stat_counter_func = count_notes
						stat_display_func = count_notes_display
						band_lesson = 0
					}
					{
						id = 'page9'
						next_page = 'page10'
						type = 'text'
						time_shown = 1
						text = qs(0x7cf44f95)
						audio_stream = 'Tut_Bss1_L01_10'
					}
					{
						id = 'page10'
						next_page = 'page11'
						type = 'text'
						time_shown = 1
						text = qs(0x747625c4)
						audio_stream = 'Tut_Bss1_L01_11'
					}
					{
						id = 'page11'
						type = 'text'
						time_shown = 1
						text = qs(0xbb28653b)
						audio_stream = 'Tut_Bss1_L01_12'
					}
				]
			}
		]
	}
]
drum_tutorial_helper_text = qs(0x99ca8747)
drum_tutorials = [
	{
		id = 'drum_basics'
		title = qs(0x1f331fb3)
		helper_text = qs(0x37f1974c)
		lessons = [
			{
				id = 'lesson0'
				next_lesson = 'lesson1'
				title = qs(0x1b621caa)
				helper_text = qs(0x7c37870d)
				pages = [
					{
						id = 'page0'
						next_page = 'first_page'
						title_page
						type = 'text'
						time_shown = $tutorial_system_post_title_wait_time
						text = qs(0x1b621caa)
					}
					{
						id = 'first_page'
						next_page = 'page0_b'
						type = 'text'
						time_shown = 1
						text = qs(0xc465841a)
						audio_stream = 'Tut_Drm1_L01_01'
					}
					{
						id = 'page0_b'
						next_page = 'page1'
						type = 'text'
						time_shown = 1
						text = qs(0x8b6c9977)
						audio_stream = 'Tut_Drm1_L01_02'
					}
					{
						id = 'page0_wii'
						next_page = 'page1'
						type = 'text'
						time_shown = 1
						text = qs(0x914af02c)
						audio_stream = 'Tut_Drm1_L01_03'
					}
					{
						id = 'page1'
						next_page = 'page2'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xae667f17)
						audio_stream = 'Tut_Drm1_L01_04'
						images = [
							{
								image = tutorial_drums_kit
								time_shown = 1
							}
						]
					}
					{
						id = 'page2'
						next_page = 'page3'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x2735e8d5)
						audio_stream = 'Tut_Drm1_L01_05'
						images = [
							{
								image = tutorial_drums_throne
								time_shown = 1
							}
						]
					}
					{
						id = 'page3'
						next_page = 'page4'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x440b3ee1)
						audio_stream = 'Tut_Drm1_L01_06'
						images = [
							{
								image = tutorial_drums_sit
								time_shown = 1
							}
						]
					}
					{
						id = 'page4'
						next_page = 'page5'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x33f53a1a)
						audio_stream = 'Tut_Drm1_L01_07'
						images = [
							{
								image = tutorial_drums_sit
								time_shown = 1
							}
						]
					}
					{
						id = 'page5'
						next_page = 'page6'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x8039d36e)
						audio_stream = 'Tut_Drm1_L01_08'
						images = [
							{
								image = tutorial_drums_sit
								time_shown = 1
							}
						]
					}
					{
						id = 'page6'
						next_page = 'page7'
						type = 'text'
						time_shown = 1
						text = qs(0xcd4e5c88)
						audio_stream = 'Tut_Drm1_L01_09'
					}
					{
						id = 'page7'
						next_page = 'page8'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x51a7653d)
						audio_stream = 'Tut_Drm1_L01_10'
						images = [
							{
								image = tutorial_drums_kit_height
								time_shown = 1
							}
						]
					}
					{
						id = 'page8'
						next_page = 'page9'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x1fe0bc7c)
						audio_stream = 'Tut_Drm1_L01_11'
						images = [
							{
								image = tutorial_drums_kit_table
								time_shown = 1
							}
						]
					}
					{
						id = 'page9'
						next_page = 'page10'
						type = 'text'
						time_shown = 1
						text = qs(0x7b5f9993)
						audio_stream = 'Tut_Drm1_L01_12'
						wait_for_user_input
					}
					{
						id = 'page10'
						next_page = 'page11'
						type = 'text'
						time_shown = 1
						text = qs(0x0c56ded9)
						audio_stream = 'Tut_Drm1_L01_13'
					}
					{
						id = 'page11'
						next_page = 'page12'
						type = 'text'
						time_shown = 1
						text = qs(0x445185b0)
						audio_stream = 'Tut_Drm1_L01_14'
					}
					{
						id = 'page11_a'
						next_page = 'page12'
						type = 'text'
						time_shown = 1
						text = qs(0x742dfab8)
						audio_stream = 'Tut_Drm1_L01_14a'
					}
					{
						id = 'page12'
						next_page = 'page13'
						type = 'text'
						time_shown = 1
						text = qs(0x566561a4)
						audio_stream = 'Tut_Drm1_L01_15'
					}
					{
						id = 'page13'
						next_page = 'page14'
						type = 'text'
						time_shown = 1
						text = qs(0x4b797ea4)
						audio_stream = 'Tut_Drm1_L01_16'
					}
					{
						id = 'page14'
						type = 'text'
						time_shown = 1
						text = qs(0x3f87cd0b)
						audio_stream = 'Tut_Drm1_L01_17'
					}
				]
			}
			{
				id = 'lesson1'
				next_lesson = 'lesson2'
				title = qs(0x2b55e6e2)
				helper_text = qs(0x6d0d2349)
				pages = [
					{
						id = 'page0'
						next_page = 'first_page'
						title_page
						type = 'text'
						time_shown = $tutorial_system_post_title_wait_time
						text = qs(0x2b55e6e2)
					}
					{
						id = 'first_page'
						next_page = 'page1'
						type = 'text'
						time_shown = 1
						text = qs(0x88aaf4e9)
						audio_stream = 'Tut_Drm1_L02_01'
					}
					{
						id = 'page1'
						next_page = 'page2'
						type = 'text'
						time_shown = 1
						text = qs(0xed7ee06f)
						audio_stream = 'Tut_Drm1_L02_02'
					}
					{
						id = 'page2'
						next_page = 'page3'
						type = 'text'
						time_shown = 1
						text = qs(0x5bf13c08)
						audio_stream = 'Tut_Drm1_L02_03'
					}
					{
						id = 'page3'
						next_page = 'page4'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xe38b19b8)
						audio_stream = 'Tut_Drm1_L02_04'
						images = [
							{
								image = tutorial_drums_stick
								time_shown = 1
							}
						]
					}
					{
						id = 'page4'
						next_page = 'page5'
						type = 'text'
						time_shown = 1
						text = qs(0xa4946d9b)
						audio_stream = 'Tut_Drm1_L02_05'
					}
					{
						id = 'page5'
						next_page = 'page6'
						type = 'text'
						time_shown = 1
						text = qs(0x92a50ab6)
						audio_stream = 'Tut_Drm1_L02_06'
					}
					{
						id = 'page6'
						next_page = 'page7'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xc2258d7a)
						audio_stream = 'Tut_Drm1_L02_07'
						images = [
							{
								image = tutorial_drums_find_com_1
								time_shown = 1
							}
							{
								image = tutorial_drums_find_com_2
								time_shown = 1
							}
							{
								image = tutorial_drums_find_com_3
								time_shown = 3
							}
						]
					}
					{
						id = 'page7'
						next_page = 'page8'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xb5846a7c)
						audio_stream = 'Tut_Drm1_L02_08'
						images = [
							{
								image = tutorial_drums_grip
								time_shown = 1
							}
						]
					}
					{
						id = 'page8'
						next_page = 'page9'
						type = 'text'
						time_shown = 1
						text = qs(0xab6588b4)
						audio_stream = 'Tut_Drm1_L02_09'
					}
					{
						id = 'page9'
						next_page = 'page10'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x6b9756d1)
						audio_stream = 'Tut_Drm1_L02_10'
						images = [
							{
								image = tutorial_drums_strike_1
								time_shown = 1
							}
							{
								image = tutorial_drums_strike_2
								time_shown = 0.1
							}
							{
								image = tutorial_drums_strike_3
								time_shown = 0.1
							}
							{
								image = tutorial_drums_strike_1
								time_shown = 1
							}
						]
					}
					{
						id = 'page10'
						next_page = 'page11'
						type = 'text'
						time_shown = 1
						text = qs(0x0daec5fd)
						audio_stream = 'Tut_Drm1_L02_11'
					}
					{
						id = 'page11'
						next_page = 'page12'
						type = 'text'
						time_shown = 1
						text = qs(0x0edbd901)
						audio_stream = 'Tut_Drm1_L02_12'
					}
					{
						id = 'page12'
						next_page = 'page13'
						type = 'text'
						time_shown = 1
						text = qs(0x1c785261)
						audio_stream = 'Tut_Drm1_L02_13'
						wait_for_user_input
					}
					{
						id = 'page13'
						next_page = 'page14'
						type = 'text'
						time_shown = 1
						text = qs(0x9e1efd73)
						audio_stream = 'Tut_Drm1_L02_14'
					}
					{
						id = 'page14'
						next_page = 'page15'
						lefty_flip = 0
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xfab31d03)
						audio_stream = 'Tut_Drm1_L02_15'
						images = [
							{
								image = tutorial_drums_hi_hat_snare_r
								time_shown = 1
							}
						]
					}
					{
						id = 'page14'
						next_page = 'page14_lefty'
						lefty_flip = 1
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xfab31d03)
						audio_stream = 'Tut_Drm1_L02_15'
						images = [
							{
								image = tutorial_drums_hi_hat_snare_l
								time_shown = 1
							}
						]
					}
					{
						id = 'page14_lefty'
						next_page = 'page15'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xe7e9ab1e)
						audio_stream = 'Tut_Drm1_L02_16'
						images = [
							{
								image = tutorial_drums_closed
								time_shown = 1
							}
						]
					}
					{
						id = 'page15'
						next_page = 'page16'
						type = 'text'
						time_shown = 1
						text = qs(0x92c5bb7b)
						audio_stream = 'Tut_Drm1_L02_17'
					}
					{
						id = 'page16'
						next_page = 'page17'
						type = 'text'
						time_shown = 1
						text = qs(0x67381f95)
						audio_stream = 'Tut_Drm1_L02_18'
					}
					{
						id = 'page17'
						type = 'text'
						time_shown = 1
						text = qs(0xa2beb2c5)
						audio_stream = 'Tut_Drm1_L02_19'
					}
				]
			}
			{
				id = 'lesson2'
				next_lesson = 'lesson3'
				title = qs(0x50e8c331)
				helper_text = qs(0x1ce1d923)
				pages = [
					{
						id = 'page0'
						next_page = 'first_page'
						title_page
						type = 'text'
						time_shown = $tutorial_system_post_title_wait_time
						text = qs(0x50e8c331)
					}
					{
						id = 'first_page'
						next_page = 'page1'
						type = 'text'
						time_shown = 1
						text = qs(0x0cd4d850)
						audio_stream = 'Tut_Drm1_L03_01'
					}
					{
						id = 'page1'
						next_page = 'page2'
						type = 'text'
						time_shown = 1
						text = qs(0xc9cef27a)
						audio_stream = 'Tut_Drm1_L03_02'
					}
					{
						id = 'page2'
						next_page = 'page3'
						type = 'text'
						time_shown = 1
						text = qs(0xd8930976)
						audio_stream = 'Tut_Drm1_L03_03'
					}
					{
						id = 'page3'
						next_page = 'page4'
						type = 'text'
						time_shown = 1
						text = qs(0x0e1d7680)
						audio_stream = 'Tut_Drm1_L03_04'
					}
					{
						id = 'page4'
						next_page = 'page10'
						type = 'text'
						time_shown = 1
						text = qs(0x3cc82442)
						audio_stream = 'Tut_Drm1_L03_05'
					}
					{
						id = 'page10'
						next_page = 'page11'
						type = 'text'
						time_shown = 1
						text = qs(0x6594019a)
						audio_stream = 'Tut_Drm1_L03_06'
					}
					{
						id = 'page11'
						next_page = 'page12'
						type = 'text'
						time_shown = 1
						text = qs(0x6ba214fd)
						audio_stream = 'Tut_Drm1_L03_07'
					}
					{
						id = 'page12'
						next_page = 'page12a'
						type = 'text'
						time_shown = 1
						text = qs(0x4282223e)
						audio_stream = 'Tut_Drm1_L03_08'
					}
					{
						id = 'page12a'
						next_page = 'page13'
						type = 'text'
						time_shown = 1
						text = qs(0x44ccdc59)
						audio_stream = 'Tut_Drm1_L03_09'
					}
					{
						id = 'page13'
						next_page = 'page14'
						type = 'gameplay'
						time_shown = 1
						text = qs(0x44ccdc59)
						audio_stream = 'Tut_Drm1_L03_09'
						song = tut_drums_easy
						stat_counter_func = count_notes
						stat_display_func = count_notes_display
						band_lesson = 0
					}
					{
						id = 'page14'
						type = 'text'
						time_shown = 1
						text = qs(0x19e37870)
						audio_stream = 'Tut_Drm1_L03_10'
					}
				]
			}
			{
				id = 'lesson3'
				next_lesson = 'lesson4'
				title = qs(0x538d108d)
				helper_text = qs(0x9b2f1688)
				pages = [
					{
						id = 'page0'
						next_page = 'first_page'
						title_page
						type = 'text'
						time_shown = $tutorial_system_post_title_wait_time
						text = qs(0x538d108d)
					}
					{
						id = 'first_page'
						next_page = 'page1'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x646543ac)
						audio_stream = 'Tut_Drm1_L04_01'
						images = [
							{
								image = tutorial_drums_kick
								time_shown = 1
							}
						]
					}
					{
						id = 'page1'
						next_page = 'page2'
						type = 'text'
						time_shown = 1
						text = qs(0xe3f4a2c8)
						audio_stream = 'Tut_Drm1_L04_02'
					}
					{
						id = 'page2'
						next_page = 'page3'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x6cc4eff2)
						audio_stream = 'Tut_Drm1_L04_03'
						images = [
							{
								image = tutorial_drums_kick_heeldown_u
								time_shown = 2
							}
							{
								image = tutorial_drums_kick_heeldown_d
								time_shown = 0.5
							}
						]
					}
					{
						id = 'page3'
						next_page = 'page4'
						type = 'text'
						time_shown = 1
						text = qs(0xaa885495)
						audio_stream = 'Tut_Drm1_L04_04'
					}
					{
						id = 'page4'
						next_page = 'page5'
						type = 'text'
						time_shown = 1
						text = qs(0xc19a8c1a)
						audio_stream = 'Tut_Drm1_L04_05'
					}
					{
						id = 'page5'
						next_page = 'page6'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x75754fc6)
						audio_stream = 'Tut_Drm1_L04_06'
						images = [
							{
								image = tutorial_drums_kick_heeldown_d
								time_shown = 2
							}
							{
								image = tutorial_drums_kick_heeldown_u
								time_shown = 0.5
							}
						]
					}
					{
						id = 'page6'
						next_page = 'page7'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x8b5057f5)
						audio_stream = 'Tut_Drm1_L04_07'
						images = [
							{
								image = tutorial_drums_kick_heeldown_d
								time_shown = 2
							}
							{
								image = tutorial_drums_kick_heeldown_u
								time_shown = 0.5
							}
						]
					}
					{
						id = 'page7'
						next_page = 'page8'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x3f75363f)
						audio_stream = 'Tut_Drm1_L04_08'
						images = [
							{
								image = tutorial_drums_kick_heelup_d
								time_shown = 2
							}
							{
								image = tutorial_drums_kick_heelup_u
								time_shown = 0.5
							}
						]
					}
					{
						id = 'page8'
						next_page = 'page9'
						type = 'text'
						time_shown = 1
						text = qs(0x7c0efc41)
						audio_stream = 'Tut_Drm1_L04_09'
					}
					{
						id = 'page9'
						next_page = 'page10'
						type = 'text'
						time_shown = 1
						text = qs(0x0b84f03f)
						audio_stream = 'Tut_Drm1_L04_10'
					}
					{
						id = 'page10'
						next_page = 'page11'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x39b7a395)
						audio_stream = 'Tut_Drm1_L04_11'
						images = [
							{
								image = tutorial_drums_kick_gem
								time_shown = 1
							}
						]
					}
					{
						id = 'page11'
						next_page = 'page11a'
						type = 'text'
						time_shown = 1
						text = qs(0xb65657fb)
						audio_stream = 'Tut_Drm1_L04_12'
					}
					{
						id = 'page11a'
						next_page = 'page12'
						type = 'text'
						time_shown = 1
						text = qs(0x2eec4bf6)
						audio_stream = 'Tut_Drm1_L04_13'
					}
					{
						id = 'page12'
						next_page = 'page13'
						type = 'gameplay'
						time_shown = 1
						text = qs(0x2eec4bf6)
						audio_stream = 'Tut_Drm1_L04_13'
						song = tut_drums_kick
						stat_counter_func = count_notes
						stat_display_func = count_notes_display
						band_lesson = 0
					}
					{
						id = 'page13'
						next_page = 'page15'
						type = 'text'
						time_shown = 1
						text = qs(0xb84343c9)
						audio_stream = 'Tut_Drm1_L04_14'
					}
					{
						id = 'page15'
						type = 'text'
						time_shown = 1
						text = qs(0xf35f5030)
						audio_stream = 'Tut_Drm1_L04_15'
					}
				]
			}
			{
				id = 'lesson4'
				title = qs(0x7b6dc4a0)
				helper_text = qs(0x1a7a9c74)
				pages = [
					{
						id = 'page0'
						next_page = 'first_page'
						title_page
						type = 'text'
						time_shown = $tutorial_system_post_title_wait_time
						text = qs(0x7b6dc4a0)
					}
					{
						id = 'first_page'
						next_page = 'page2'
						type = 'text'
						time_shown = 1
						text = qs(0xd88dcafe)
						audio_stream = 'Tut_Drm1_L05_01'
					}
					{
						id = 'page2'
						next_page = 'page3'
						type = 'text'
						time_shown = 1
						text = qs(0x30a8c257)
						audio_stream = 'Tut_Drm1_L05_02'
					}
					{
						id = 'page3'
						next_page = 'page4'
						type = 'text'
						time_shown = 1
						text = qs(0x3585d6af)
						audio_stream = 'Tut_Drm1_L05_03'
					}
					{
						id = 'page3_alt'
						next_page = 'page4'
						type = 'text'
						time_shown = 1
						text = qs(0xd52e9f7d)
						audio_stream = 'Tut_Drm1_L05_04'
					}
					{
						id = 'page4'
						next_page = 'page5'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xb5566a7d)
						audio_stream = 'Tut_Drm1_L05_05'
						images = [
							{
								image = tutorial_drums_sp_trigger
								time_shown = 1
							}
						]
					}
					{
						id = 'page4_alt1'
						next_page = 'page4_alt2'
						type = 'text'
						time_shown = 1
						text = qs(0x5e6d4b8b)
						audio_stream = 'Tut_Drm1_L05_06'
					}
					{
						id = 'page4_alt2'
						next_page = 'page4_alt3'
						type = 'text'
						time_shown = 1
						text = qs(0x9c69dfed)
						audio_stream = 'Tut_Drm1_L05_07'
					}
					{
						id = 'page4_alt3'
						next_page = 'page5'
						type = 'text'
						time_shown = 1
						text = qs(0x663e5c0b)
						audio_stream = 'Tut_Drm1_L05_08'
					}
					{
						id = 'page4_alt4'
						next_page = 'page5'
						type = 'text'
						time_shown = 1
						text = qs(0xf44799cc)
						audio_stream = 'Tut_Drm1_L05_05a'
					}
					{
						id = 'page4_alt5'
						next_page = 'page5'
						type = 'text'
						time_shown = 1
						text = qs(0xa3349927)
						audio_stream = 'Tut_Drm1_L05_06a'
					}
					{
						id = 'page5'
						next_page = 'page6'
						type = 'text'
						time_shown = 1
						text = qs(0x5941667f)
						audio_stream = 'Tut_Drm1_L05_09'
					}
					{
						id = 'page6'
						next_page = 'page6a'
						type = 'text'
						time_shown = 1
						text = qs(0x7dfb3430)
						audio_stream = 'Tut_Drm1_L05_10'
					}
					{
						id = 'page6a'
						next_page = 'page7'
						type = 'text'
						time_shown = 1
						text = qs(0xe0cc3d21)
						audio_stream = 'Tut_Drm1_L05_11'
					}
					{
						id = 'page7'
						next_page = 'page9'
						type = 'gameplay'
						time_shown = 1
						text = qs(0xe0cc3d21)
						audio_stream = 'Tut_Drm1_L05_11'
						song = tut_drums_sp
						stat_counter_func = count_notes
						stat_display_func = count_notes_display
						band_lesson = 0
					}
					{
						id = 'page9'
						next_page = 'page10'
						type = 'text'
						time_shown = 1
						text = qs(0xde5d7325)
						audio_stream = 'Tut_Drm1_L05_12'
					}
					{
						id = 'page10'
						type = 'text'
						time_shown = 1
						text = qs(0xdfbd7f69)
						audio_stream = 'Tut_Drm1_L05_13'
					}
				]
			}
		]
	}
	{
		id = 'drum_intermediate'
		title = qs(0xd9705bfd)
		helper_text = qs(0xcfda9d7e)
		lessons = [
			{
				id = 'lesson0'
				next_lesson = 'lesson1'
				title = qs(0xabf56447)
				helper_text = qs(0x6e4f5e5a)
				pages = [
					{
						id = 'page0'
						next_page = 'first_page'
						type = 'text'
						title_page
						time_shown = $tutorial_system_post_title_wait_time
						text = qs(0xabf56447)
					}
					{
						id = 'first_page'
						next_page = 'page1'
						type = 'text'
						time_shown = 1
						text = qs(0x778d9f74)
						audio_stream = 'Tut_Drm2_L01_01'
					}
					{
						id = 'page1'
						next_page = 'page2'
						type = 'text'
						time_shown = 1
						text = qs(0x34755b51)
						audio_stream = 'Tut_Drm2_L01_02'
					}
					{
						id = 'page2'
						next_page = 'page3'
						type = 'text'
						time_shown = 1
						text = qs(0xa87f27a3)
						audio_stream = 'Tut_Drm2_L01_03'
					}
					{
						id = 'page3'
						next_page = 'page4'
						type = 'text'
						time_shown = 1
						text = qs(0xe829c7f1)
						audio_stream = 'Tut_Drm2_L01_04'
					}
					{
						id = 'page4'
						next_page = 'page5'
						type = 'text'
						time_shown = 1
						text = qs(0x2e30e833)
						audio_stream = 'Tut_Drm2_L01_05'
					}
					{
						id = 'page5'
						next_page = 'page6'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x81a04abf)
						audio_stream = 'Tut_Drm2_L01_06'
						images = [
							{
								image = tutorial_drums_highway_beats
								time_shown = 1
							}
						]
					}
					{
						id = 'page6'
						next_page = 'page7'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xc208521a)
						audio_stream = 'Tut_Drm2_L01_07'
						images = [
							{
								image = tutorial_drums_highway
								time_shown = 1
							}
						]
					}
					{
						id = 'page7'
						next_page = 'page8'
						type = 'text'
						time_shown = 1
						text = qs(0x1513c2a5)
						audio_stream = 'Tut_Drm2_L01_08'
					}
					{
						id = 'page8'
						next_page = 'page9'
						type = 'text'
						time_shown = 1
						text = qs(0x3b2033ec)
						audio_stream = 'Tut_Drm2_L01_09'
					}
					{
						id = 'page9'
						next_page = 'page14'
						type = 'text'
						time_shown = 1
						text = qs(0xb025341b)
						audio_stream = 'Tut_Drm2_L01_10'
					}
					{
						id = 'page14'
						next_page = 'page14a'
						type = 'text'
						time_shown = 1
						text = qs(0xdc1819d4)
						audio_stream = 'Tut_Drm2_L01_15'
					}
					{
						id = 'page14a'
						next_page = 'page15'
						type = 'text'
						time_shown = 1
						text = qs(0x410e47d3)
						audio_stream = 'Tut_Drm2_L01_16'
					}
					{
						id = 'page15'
						next_page = 'page19'
						type = 'gameplay'
						time_shown = 1
						text = qs(0x410e47d3)
						audio_stream = 'Tut_Drm2_L01_16'
						song = tut_drums_basicbeat
						stat_counter_func = count_notes
						stat_display_func = count_notes_display
						band_lesson = 0
					}
					{
						id = 'page19'
						next_page = 'page20'
						type = 'text'
						time_shown = 1
						text = qs(0x3bbd147f)
						audio_stream = 'Tut_Drm2_L01_17'
					}
					{
						id = 'page20'
						next_page = 'page21'
						type = 'text'
						time_shown = 1
						text = qs(0x4bc0dd2d)
						audio_stream = 'Tut_Drm2_L01_18'
					}
					{
						id = 'page21'
						type = 'text'
						time_shown = 1
						text = qs(0xe7a58719)
						audio_stream = 'Tut_Drm2_L01_19'
					}
				]
			}
			{
				id = 'lesson1'
				next_lesson = 'lesson2'
				title = qs(0xe022d934)
				hardware = ghdrum
				helper_text = qs(0x7a6a8899)
				pages = [
					{
						id = 'page0'
						next_page = 'first_page'
						type = 'text'
						title_page
						time_shown = $tutorial_system_post_title_wait_time
						text = qs(0xe022d934)
					}
					{
						id = 'first_page'
						next_page = 'page1'
						type = 'text'
						time_shown = 1
						text = qs(0x5efb6ada)
						audio_stream = 'Tut_Drm2_L02_01'
					}
					{
						id = 'page1'
						next_page = 'page2'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x1ac22b75)
						audio_stream = 'Tut_Drm2_L02_02'
						images = [
							{
								image = tutorial_drums_accent_note
								time_shown = 1
							}
						]
					}
					{
						id = 'page2'
						next_page = 'page3'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x81003eb1)
						audio_stream = 'Tut_Drm2_L02_04'
						images = [
							{
								image = tutorial_drums_accent_note
								time_shown = 1
							}
						]
					}
					{
						id = 'page3'
						next_page = 'page4'
						type = 'text'
						time_shown = 1
						text = qs(0x91187539)
						audio_stream = 'Tut_Drm2_L02_05'
					}
					{
						id = 'page4'
						next_page = 'page4a'
						type = 'text'
						time_shown = 1
						text = qs(0x1dec1576)
						audio_stream = 'Tut_Drm2_L02_06'
					}
					{
						id = 'page4a'
						next_page = 'page5'
						type = 'text'
						time_shown = 1
						text = qs(0x695ff901)
						audio_stream = 'Tut_Drm2_L02_07'
					}
					{
						id = 'page5'
						next_page = 'page6'
						type = 'text'
						time_shown = 1
						text = qs(0xc8975ac4)
						audio_stream = 'Tut_Drm2_L02_08'
					}
					{
						id = 'page6'
						next_page = 'page7'
						type = 'gameplay'
						time_shown = 1
						text = qs(0x2626c36a)
						audio_stream = 'Tut_Drm2_L02_08'
						song = tut_drums_accent
						stat_counter_func = count_notes
						stat_display_func = count_notes_display
						band_lesson = 0
					}
					{
						id = 'page7'
						type = 'text'
						time_shown = 1
						text = qs(0xdcea50c5)
						audio_stream = 'Tut_Drm2_L02_09'
					}
					{
						id = 'page7_alt'
						type = 'text'
						time_shown = 1
						text = qs(0xddff8861)
						audio_stream = 'Tut_Drm2_L02_10'
					}
				]
			}
			{
				id = 'lesson2'
				next_lesson = 'lesson3'
				title = qs(0x49852cfd)
				helper_text = qs(0x6e436c39)
				pages = [
					{
						id = 'page0'
						next_page = 'first_page'
						type = 'text'
						title_page
						time_shown = $tutorial_system_post_title_wait_time
						text = qs(0x49852cfd)
					}
					{
						id = 'first_page'
						next_page = 'page1'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x4f88ae9d)
						audio_stream = 'Tut_Drm2_L03_01'
						images = [
							{
								image = tutorial_drums_swell
								time_shown = 1
							}
						]
					}
					{
						id = 'page1'
						next_page = 'page2'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xa4c0b61c)
						audio_stream = 'Tut_Drm2_L03_02'
						images = [
							{
								image = tutorial_drums_swell
								time_shown = 1
							}
						]
					}
					{
						id = 'page2'
						next_page = 'page4'
						type = 'text'
						time_shown = 1
						text = qs(0x91ffde8d)
						audio_stream = 'Tut_Drm2_L03_03'
					}
					{
						id = 'page4'
						next_page = 'page4a'
						type = 'text'
						time_shown = 1
						text = qs(0x16a769a4)
						audio_stream = 'Tut_Drm2_L03_05'
					}
					{
						id = 'page4a'
						next_page = 'page5'
						type = 'text'
						time_shown = 1
						text = qs(0xb49f33e4)
						audio_stream = 'Tut_Drm2_L03_06'
					}
					{
						id = 'page5'
						next_page = 'page7'
						type = 'gameplay'
						time_shown = 1
						text = qs(0xb49f33e4)
						audio_stream = 'Tut_Drm2_L03_06'
						song = tut_drums_swell
						stat_counter_func = count_notes
						stat_display_func = count_notes_display
						band_lesson = 0
					}
					{
						id = 'page7'
						type = 'text'
						time_shown = 1
						text = qs(0x4abb9e61)
						audio_stream = 'Tut_Drm2_L03_07'
					}
				]
			}
			{
				id = 'lesson3'
				title = qs(0x1cd6e13e)
				helper_text = qs(0x88bd3029)
				pages = [
					{
						id = 'page0'
						next_page = 'first_page'
						type = 'text'
						title_page
						time_shown = $tutorial_system_post_title_wait_time
						text = qs(0x1cd6e13e)
					}
					{
						id = 'first_page'
						next_page = 'page1'
						type = 'text'
						time_shown = 1
						text = qs(0x1c83a311)
						audio_stream = 'Tut_Drm2_L04_01'
					}
					{
						id = 'page1'
						next_page = 'page2'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x27428c5e)
						audio_stream = 'Tut_Drm2_L04_02'
						images = [
							{
								image = tutorial_drums_freeform
								time_shown = 1
							}
						]
					}
					{
						id = 'page2'
						next_page = 'page3'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x189ba296)
						audio_stream = 'Tut_Drm2_L04_03'
						images = [
							{
								image = tutorial_drums_freeform
								time_shown = 1
							}
						]
					}
					{
						id = 'page3'
						next_page = 'page4'
						type = 'text'
						time_shown = 1
						text = qs(0x5ebd7341)
						audio_stream = 'Tut_Drm2_L04_04'
					}
					{
						id = 'page4'
						next_page = 'page5'
						type = 'text'
						time_shown = 1
						text = qs(0xa261d8e3)
						audio_stream = 'Tut_Drm2_L04_05'
					}
					{
						id = 'page5'
						next_page = 'page6'
						type = 'text'
						time_shown = 1
						text = qs(0x396f8992)
						audio_stream = 'Tut_Drm2_L04_06'
					}
					{
						id = 'page6'
						next_page = 'page7'
						type = 'gameplay'
						time_shown = 1
						text = qs(0x396f8992)
						audio_stream = 'Tut_Drm2_L04_06'
						song = tut_drums_freeform
						stat_counter_func = count_notes
						stat_display_func = count_notes_display
						band_lesson = 0
					}
					{
						id = 'page7'
						next_page = 'page8'
						type = 'text'
						time_shown = 1
						text = qs(0x38b42f5d)
						audio_stream = 'Tut_Drm2_L04_07'
					}
					{
						id = 'page8'
						next_page = 'page9'
						type = 'text'
						time_shown = 1
						text = qs(0x6ccf462e)
						audio_stream = 'Tut_Drm2_L04_08'
					}
					{
						id = 'page9'
						next_page = 'page10'
						type = 'text'
						time_shown = 1
						text = qs(0xf02c7e22)
						audio_stream = 'Tut_Drm2_L04_09'
					}
					{
						id = 'page10'
						type = 'text'
						time_shown = 1
						text = qs(0x8a624212)
						audio_stream = 'Tut_Drm2_L04_10'
					}
				]
			}
		]
	}
	{
		id = 'drum_advanced'
		title = qs(0xb519fe46)
		helper_text = qs(0x60cc8301)
		lessons = [
			{
				id = 'lesson0'
				next_lesson = 'lesson1'
				title = qs(0xfd6bb005)
				helper_text = qs(0x4021fb94)
				pages = [
					{
						id = 'page0'
						next_page = 'first_page'
						type = 'text'
						title_page
						time_shown = $tutorial_system_post_title_wait_time
						text = qs(0xe797e00e)
					}
					{
						id = 'first_page'
						next_page = 'page1'
						type = 'text'
						time_shown = 1
						text = qs(0x6199dcac)
						audio_stream = 'Tut_Drm3_L01_01'
					}
					{
						id = 'page1'
						next_page = 'page2'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x9854a2c4)
						audio_stream = 'Tut_Drm3_L01_02'
						images = [
							{
								image = tutorial_drums_rolls
								time_shown = 1
							}
						]
					}
					{
						id = 'page2'
						next_page = 'page3'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x69bcf12d)
						audio_stream = 'Tut_Drm3_L01_03'
						images = [
							{
								image = tutorial_drums_rolls
								time_shown = 1
							}
						]
					}
					{
						id = 'page3'
						next_page = 'page4'
						type = 'text'
						time_shown = 1
						text = qs(0x37f2895f)
						audio_stream = 'Tut_Drm3_L01_04'
					}
					{
						id = 'page4'
						next_page = 'page5'
						type = 'text'
						time_shown = 1
						text = qs(0x1959dab1)
						audio_stream = 'Tut_Drm3_L01_05'
					}
					{
						id = 'page5'
						next_page = 'page5a'
						type = 'text'
						time_shown = 1
						text = qs(0x6a028ed3)
						audio_stream = 'Tut_Drm3_L01_06'
					}
					{
						id = 'page5a'
						next_page = 'page6'
						type = 'text'
						time_shown = 1
						text = qs(0x50a56b73)
						audio_stream = 'Tut_Drm3_L01_07'
					}
					{
						id = 'page6'
						next_page = 'page7'
						type = 'gameplay'
						time_shown = 1
						text = qs(0x50a56b73)
						audio_stream = 'Tut_Drm3_L01_07'
						song = tut_drums_roll
						stat_counter_func = count_notes
						stat_display_func = count_notes_display
						band_lesson = 0
					}
					{
						id = 'page7'
						next_page = 'page8'
						type = 'text'
						time_shown = 1
						text = qs(0xc0fc1616)
						audio_stream = 'Tut_Drm3_L01_08'
					}
					{
						id = 'page8'
						next_page = 'page9'
						type = 'text'
						time_shown = 1
						text = qs(0x8dbad929)
						audio_stream = 'Tut_Drm3_L01_09'
					}
					{
						id = 'page9'
						next_page = 'page10'
						type = 'text'
						time_shown = 1
						text = qs(0xf89c8f41)
						audio_stream = 'Tut_Drm3_L01_10'
					}
					{
						id = 'page10'
						next_page = 'page11'
						type = 'text'
						time_shown = 1
						text = qs(0x7e284a6c)
						audio_stream = 'Tut_Drm3_L01_11'
					}
					{
						id = 'page11'
						next_page = 'page11a'
						type = 'text'
						time_shown = 1
						text = qs(0xa14a209f)
						audio_stream = 'Tut_Drm3_L01_12'
					}
					{
						id = 'page11a'
						next_page = 'page12'
						type = 'text'
						time_shown = 1
						text = qs(0x86576066)
						audio_stream = 'Tut_Drm3_L01_13'
					}
					{
						id = 'page12'
						next_page = 'page13'
						type = 'gameplay'
						time_shown = 1
						text = qs(0xf98478f0)
						audio_stream = 'Tut_Drm3_L01_13'
						song = tut_drums_fill
						stat_counter_func = count_notes
						stat_display_func = count_notes_display
						band_lesson = 0
					}
					{
						id = 'page13'
						type = 'text'
						time_shown = 1
						text = qs(0x6869e55e)
						audio_stream = 'Tut_Drm3_L01_14'
					}
				]
			}
			{
				id = 'lesson1'
				next_lesson = 'lesson2'
				title = qs(0x3b09bcba)
				helper_text = qs(0x989fbaf1)
				pages = [
					{
						id = 'page0'
						next_page = 'first_page'
						type = 'text'
						title_page
						time_shown = $tutorial_system_post_title_wait_time
						text = qs(0x3b09bcba)
					}
					{
						id = 'first_page'
						next_page = 'page1'
						type = 'text'
						time_shown = 1
						text = qs(0x85eb7f72)
						audio_stream = 'Tut_Drm3_L02_01'
					}
					{
						id = 'page1'
						next_page = 'page2'
						type = 'text'
						time_shown = 1
						text = qs(0x5d34b9e4)
						audio_stream = 'Tut_Drm3_L02_02'
					}
					{
						id = 'page2'
						next_page = 'page3'
						type = 'text'
						time_shown = 1
						text = qs(0xab62863f)
						audio_stream = 'Tut_Drm3_L02_03'
					}
					{
						id = 'page3'
						next_page = 'page4'
						type = 'text'
						time_shown = 1
						text = qs(0xcb4e79b8)
						audio_stream = 'Tut_Drm3_L02_04'
					}
					{
						id = 'page4'
						next_page = 'page5'
						type = 'text_with_images'
						time_shown = 5
						text = qs(0xaf7608e5)
						audio_stream = 'Tut_Drm3_L02_05'
						images = [
							{
								image = tutorial_drums_wrist_pull
								time_shown = 1
							}
						]
					}
					{
						id = 'page5'
						next_page = 'page6'
						type = 'text_with_images'
						time_shown = 5
						text = qs(0x97e5e50f)
						audio_stream = 'Tut_Drm3_L02_06'
						images = [
							{
								image = tutorial_drums_wrist_push
								time_shown = 1
							}
						]
					}
					{
						id = 'page6'
						next_page = 'page7'
						type = 'text'
						time_shown = 1
						text = qs(0x1f6adaa7)
						audio_stream = 'Tut_Drm3_L02_07'
					}
					{
						id = 'page7'
						next_page = 'page8'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x24dae3a9)
						audio_stream = 'Tut_Drm3_L02_08'
						images = [
							{
								image = tutorial_drums_stretch_right
								time_shown = 1
							}
						]
					}
					{
						id = 'page8'
						next_page = 'page9'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xa958475a)
						audio_stream = 'Tut_Drm3_L02_09'
						images = [
							{
								image = tutorial_drums_stretch_left
								time_shown = 1
							}
						]
					}
					{
						id = 'page9'
						next_page = 'page10'
						type = 'text'
						time_shown = 1
						text = qs(0x82db69a5)
						audio_stream = 'Tut_Drm3_L02_10'
					}
					{
						id = 'page10'
						next_page = 'page11'
						type = 'text'
						time_shown = 1
						text = qs(0x601bf32c)
						audio_stream = 'Tut_Drm3_L02_11'
					}
					{
						id = 'page11'
						next_page = 'page12'
						type = 'text'
						time_shown = 1
						text = qs(0x0457d1bc)
						audio_stream = 'Tut_Drm3_L02_12'
					}
					{
						id = 'page12'
						next_page = 'page13'
						type = 'text'
						time_shown = 1
						text = qs(0x63c25ef5)
						audio_stream = 'Tut_Drm3_L02_13'
					}
					{
						id = 'page13'
						next_page = 'page14'
						type = 'text'
						time_shown = 1
						text = qs(0xd255ac02)
						audio_stream = 'Tut_Drm3_L02_14'
					}
					{
						id = 'page14'
						next_page = 'page15'
						type = 'text'
						time_shown = 1
						text = qs(0x2b6cc972)
						audio_stream = 'Tut_Drm3_L02_15'
					}
					{
						id = 'page15'
						next_page = 'page16'
						type = 'text'
						time_shown = 1
						text = qs(0x53c7fe88)
						audio_stream = 'Tut_Drm3_L02_16'
					}
					{
						id = 'page16'
						next_page = 'page17'
						type = 'text'
						time_shown = 1
						text = qs(0x0fae9c96)
						audio_stream = 'Tut_Drm3_L02_17'
					}
					{
						id = 'page17'
						type = 'text'
						time_shown = 1
						text = qs(0xce2182ca)
						audio_stream = 'Tut_Drm3_L02_18'
					}
				]
			}
			{
				id = 'lesson2'
				title = qs(0x2555f798)
				helper_text = qs(0xf05e6a5e)
				pages = [
					{
						id = 'page0'
						next_page = 'first_page'
						type = 'text'
						title_page
						time_shown = $tutorial_system_post_title_wait_time
						text = qs(0x739da581)
					}
					{
						id = 'first_page'
						next_page = 'page1'
						type = 'text'
						time_shown = 1
						text = qs(0xf8abed2a)
						audio_stream = 'Tut_Drm3_L03_01'
					}
					{
						id = 'page1'
						next_page = 'page2'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xba812245)
						audio_stream = 'Tut_Drm3_L03_02'
						images = [
							{
								image = icon_difficulty_expert_plus
								scale = (3.0, 3.0)
								time_shown = 1
							}
						]
					}
					{
						id = 'page2'
						next_page = 'page3'
						type = 'text'
						time_shown = 1
						text = qs(0x947ffde2)
						audio_stream = 'Tut_Drm3_L03_03'
					}
					{
						id = 'page3'
						next_page = 'page4'
						type = 'text'
						time_shown = 1
						text = qs(0x3122cc43)
						audio_stream = 'Tut_Drm3_L03_04'
					}
					{
						id = 'page4'
						next_page = 'page5'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xef058f9b)
						audio_stream = 'Tut_Drm3_L03_05'
						images = [
							{
								image = tutorial_drums_gh5kit_jacks
								time_shown = 1
							}
						]
					}
					{
						id = 'page5'
						next_page = 'page6'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xb5d27ac0)
						audio_stream = 'Tut_Drm3_L03_06'
						images = [
							{
								image = tutorial_drums_splitter
								time_shown = 1
							}
						]
					}
					{
						id = 'page6'
						next_page = 'page7'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x04839838)
						audio_stream = 'Tut_Drm3_L03_07'
						images = [
							{
								image = tutorial_drums_splitter
								time_shown = 1
							}
						]
					}
					{
						id = 'page7'
						next_page = 'page8'
						type = 'text'
						time_shown = 1
						text = qs(0x46ef6318)
						audio_stream = 'Tut_Drm3_L03_08'
					}
					{
						id = 'page8'
						next_page = 'page8a'
						type = 'text'
						time_shown = 1
						text = qs(0xc9b85901)
						audio_stream = 'Tut_Drm3_L03_09'
					}
					{
						id = 'page8a'
						next_page = 'page9'
						type = 'text'
						time_shown = 1
						text = qs(0x94813f45)
						audio_stream = 'Tut_Drm3_L03_10'
					}
					{
						id = 'page9'
						next_page = 'page10'
						type = 'gameplay'
						time_shown = 1
						text = qs(0x94813f45)
						audio_stream = 'Tut_Drm3_L03_10'
						song = tut_drums_doublekick
						stat_counter_func = count_notes
						stat_display_func = count_notes_display
						band_lesson = 0
					}
					{
						id = 'page10'
						next_page = 'page11'
						type = 'text'
						time_shown = 1
						text = qs(0x269868b7)
						audio_stream = 'Tut_Drm3_L03_11'
					}
					{
						id = 'page11'
						type = 'text'
						time_shown = 1
						text = qs(0xc82487db)
						audio_stream = 'Tut_Drm3_L03_12'
					}
				]
			}
		]
	}
]
vocals_tutorial_helper_text = qs(0xcdb5b2a1)
vocals_tutorials = [
	{
		id = 'vocal_basics'
		title = qs(0x1f331fb3)
		helper_text = qs(0xc5705535)
		lessons = [
			{
				id = 'lesson0'
				next_lesson = 'lesson1'
				title = qs(0x683f6d38)
				helper_text = qs(0xfdbbba77)
				pages = [
					{
						id = 'page0'
						next_page = 'first_page'
						type = 'text'
						title_page
						time_shown = $tutorial_system_post_title_wait_time
						text = qs(0x683f6d38)
					}
					{
						id = 'first_page'
						next_page = 'page1'
						type = 'text'
						time_shown = 1
						text = qs(0xc546a284)
						audio_stream = 'Tut_Vcl1_L01_01'
					}
					{
						id = 'page1'
						next_page = 'page2'
						type = 'text'
						time_shown = 1
						text = qs(0x4a24356f)
						audio_stream = 'Tut_Vcl1_L01_02'
					}
					{
						id = 'page2'
						next_page = 'page3'
						type = 'text'
						time_shown = 1
						text = qs(0x7753e71c)
						audio_stream = 'Tut_Vcl1_L01_03'
					}
					{
						id = 'page3'
						next_page = 'page4'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xf7f3709f)
						audio_stream = 'Tut_Vcl1_L01_04'
						images = [
							{
								image = tutorial_vocals_gh_mic
								time_shown = 1
							}
						]
					}
					{
						id = 'page4'
						next_page = 'page5'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x4bfd4a50)
						audio_stream = 'Tut_Vcl1_L01_05'
						images = [
							{
								image = tutorial_vocals_gh_mic_distance
								time_shown = 1
							}
						]
					}
					{
						id = 'page5'
						next_page = 'page6'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xd10ffec0)
						audio_stream = 'Tut_Vcl1_L01_06'
						images = [
							{
								image = tutorial_vocals_gh_mic_distance
								time_shown = 1
							}
						]
					}
					{
						id = 'page6'
						next_page = 'page6a'
						type = 'text'
						time_shown = 1
						text = qs(0xb10f4140)
						audio_stream = 'Tut_Vcl1_L01_07'
					}
					{
						id = 'page6a'
						next_page = 'page7'
						type = 'gameplay'
						time_shown = 1
						text = qs(0xb10f4140)
						song = tut_vox_blank
						stat_counter_func = count_notes
						stat_display_func = count_notes_display
						band_lesson = 0
					}
					{
						id = 'page7'
						next_page = 'page8'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x7421b518)
						audio_stream = 'Tut_Vcl1_L01_08'
						images = [
							{
								image = tutorial_controller_left_bumper
								time_shown = 1
							}
						]
					}
					{
						id = 'page8'
						next_page = 'page9'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x9051a099)
						audio_stream = 'Tut_Vcl1_L01_09'
						images = [
							{
								image = tutorial_controller_left_trigger
								time_shown = 1
							}
						]
					}
					{
						id = 'page9'
						next_page = 'page10'
						type = 'text'
						time_shown = 1
						text = qs(0x06b34a7e)
						audio_stream = 'Tut_Vcl1_L01_09a'
					}
					{
						id = 'page10'
						next_page = 'page11'
						type = 'text'
						time_shown = 1
						text = qs(0x778b28f0)
						audio_stream = 'Tut_Vcl1_L01_10'
					}
					{
						id = 'page11'
						type = 'text'
						time_shown = 1
						text = qs(0x47d6657c)
						audio_stream = 'Tut_Vcl1_L01_11'
					}
				]
			}
			{
				id = 'lesson1'
				next_lesson = 'lesson2'
				title = qs(0xe15c5fa1)
				helper_text = qs(0x4fbc060e)
				is_new
				pages = [
					{
						id = 'page0'
						next_page = 'first_page'
						type = 'text'
						title_page
						time_shown = $tutorial_system_post_title_wait_time
						text = qs(0xe15c5fa1)
					}
					{
						id = 'first_page'
						next_page = 'page1'
						type = 'text'
						time_shown = 1
						text = qs(0x2097c863)
						audio_stream = 'Tut_Vcl1_L02_01'
					}
					{
						id = 'page1'
						next_page = 'page2'
						type = 'text'
						time_shown = 1
						text = qs(0xd4ea9116)
						audio_stream = 'Tut_Vcl1_L02_02'
					}
					{
						id = 'page2'
						next_page = 'page3'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x5cd22a30)
						audio_stream = 'Tut_Vcl1_L02_03'
						images = [
							{
								image = tutorial_vocals_scrolling
								time_shown = 1
							}
						]
					}
					{
						id = 'page3'
						next_page = 'page5'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xbdb11e60)
						audio_stream = 'Tut_Vcl1_L02_04'
						images = [
							{
								image = tutorial_vocals_scrolling
								time_shown = 1
							}
						]
					}
					{
						id = 'page5'
						next_page = 'page6'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x6925c6e9)
						audio_stream = 'Tut_Vcl1_L02_05'
						images = [
							{
								image = tutorial_vocals_static
								time_shown = 1
							}
						]
					}
					{
						id = 'page6'
						next_page = 'page8'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xc7c9f54b)
						audio_stream = 'Tut_Vcl1_L02_06'
						images = [
							{
								image = tutorial_vocals_static
								time_shown = 1
							}
						]
					}
					{
						id = 'page8'
						next_page = 'page9'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x48d9fc27)
						audio_stream = 'Tut_Vcl1_L02_07'
						images = [
							{
								image = tutorial_vocals_karaoke
								time_shown = 1
							}
						]
					}
					{
						id = 'page9'
						next_page = 'page11'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x588b6d90)
						audio_stream = 'Tut_Vcl1_L02_08'
						images = [
							{
								image = tutorial_vocals_karaoke
								time_shown = 1
							}
						]
					}
					{
						id = 'page11'
						next_page = 'page14'
						type = 'text'
						time_shown = 1
						text = qs(0x2fb24358)
						audio_stream = 'Tut_Vcl1_L02_09'
					}
					{
						id = 'page14'
						next_page = 'page15'
						type = 'text'
						time_shown = 1
						text = qs(0xd49a834a)
						audio_stream = 'Tut_Vcl1_L02_10'
					}
					{
						id = 'page15'
						next_page = 'page16'
						type = 'text'
						time_shown = 1
						text = qs(0x726b5859)
						audio_stream = 'Tut_Vcl1_L02_11'
					}
					{
						id = 'page16'
						type = 'text'
						time_shown = 1
						text = qs(0x93004513)
						audio_stream = 'Tut_Vcl1_L02_12'
					}
				]
			}
			{
				id = 'lesson2'
				next_lesson = 'lesson3'
				title = qs(0xe2d747ab)
				helper_text = qs(0x5fefb69f)
				pages = [
					{
						id = 'page0'
						next_page = 'first_page'
						type = 'text'
						title_page
						time_shown = $tutorial_system_post_title_wait_time
						text = qs(0xe2d747ab)
					}
					{
						id = 'first_page'
						next_page = 'page1'
						type = 'text'
						time_shown = 1
						text = qs(0xa4ed87af)
						audio_stream = 'Tut_Vcl1_L03_01'
					}
					{
						id = 'page1'
						next_page = 'page2'
						type = 'text'
						time_shown = 1
						text = qs(0x8d0d7092)
						audio_stream = 'Tut_Vcl1_L03_02'
					}
					{
						id = 'page2'
						next_page = 'page3'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x18f6444d)
						audio_stream = 'Tut_Vcl1_L03_03'
						images = [
							{
								image = tutorial_vocals_comet
								time_shown = 1
							}
						]
					}
					{
						id = 'page3'
						next_page = 'page4'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x3b1276af)
						audio_stream = 'Tut_Vcl1_L03_04'
						images = [
							{
								image = tutorial_vocals_comet
								time_shown = 1
							}
						]
					}
					{
						id = 'page4'
						next_page = 'page4a'
						type = 'text'
						time_shown = 1
						text = qs(0xda3ebda7)
						audio_stream = 'Tut_Vcl1_L03_05'
					}
					{
						id = 'page4a'
						next_page = 'page6'
						type = 'gameplay'
						time_shown = 1
						text = qs(0xda3ebda7)
						song = tut_vox_blank
						stat_counter_func = count_notes
						stat_display_func = count_notes_display
						band_lesson = 0
					}
					{
						id = 'page6'
						next_page = 'page7'
						type = 'text'
						time_shown = 1
						text = qs(0x8d695141)
						audio_stream = 'Tut_Vcl1_L03_06'
					}
					{
						id = 'page7'
						next_page = 'page8'
						type = 'text'
						time_shown = 1
						text = qs(0x2bebcc65)
						audio_stream = 'Tut_Vcl1_L03_07'
					}
					{
						id = 'page8'
						next_page = 'page9'
						type = 'text'
						time_shown = 1
						text = qs(0xe321eb4f)
						audio_stream = 'Tut_Vcl1_L03_08'
					}
					{
						id = 'page9'
						next_page = 'page10'
						type = 'text'
						time_shown = 1
						text = qs(0x2358fb54)
						audio_stream = 'Tut_Vcl1_L03_09'
					}
					{
						id = 'page10'
						next_page = 'page11'
						type = 'text'
						time_shown = 1
						text = qs(0x70fd0426)
						audio_stream = 'Tut_Vcl1_L03_10'
					}
					{
						id = 'page11'
						next_page = 'page12'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xe0bf2e69)
						audio_stream = 'Tut_Vcl1_L03_11'
						images = [
							{
								image = tutorial_vocals_pitch_guides
								time_shown = 1
							}
						]
					}
					{
						id = 'page12'
						next_page = 'page15'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x6cf2fd2b)
						audio_stream = 'Tut_Vcl1_L03_12'
						images = [
							{
								image = tutorial_vocals_pitch_guides
								time_shown = 1
							}
						]
					}
					{
						id = 'page15'
						next_page = 'page16'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x806a11f9)
						audio_stream = 'Tut_Vcl1_L03_13'
						images = [
							{
								image = tutorial_vocals_off_pitch
								time_shown = 1
							}
						]
					}
					{
						id = 'page16'
						next_page = 'page17'
						type = 'text'
						time_shown = 1
						text = qs(0x9f868f00)
						audio_stream = 'Tut_Vcl1_L03_14'
					}
					{
						id = 'page17'
						next_page = 'page17a'
						type = 'text'
						time_shown = 1
						text = qs(0xac44899d)
						audio_stream = 'Tut_Vcl1_L03_15'
					}
					{
						id = 'page17a'
						next_page = 'page18'
						type = 'gameplay'
						time_shown = 1
						text = qs(0xac44899d)
						song = tut_vox_held
						stat_counter_func = count_notes
						stat_display_func = count_notes_display
						band_lesson = 0
					}
					{
						id = 'page18'
						next_page = 'page19'
						type = 'text'
						time_shown = 1
						text = qs(0x20bc494e)
						audio_stream = 'Tut_Vcl1_L03_16'
					}
					{
						id = 'page19'
						next_page = 'page19a'
						type = 'text'
						time_shown = 1
						text = qs(0xbf77fb7d)
						audio_stream = 'Tut_Vcl1_L03_17'
					}
					{
						id = 'page19a'
						next_page = 'page20'
						type = 'text'
						time_shown = 1
						text = qs(0xd22e6158)
						audio_stream = 'Tut_Vcl1_L03_Sng'
					}
					{
						id = 'page20'
						next_page = 'page20a'
						type = 'text'
						time_shown = 1
						text = qs(0x467e1f03)
						audio_stream = 'Tut_Vcl1_L03_18'
					}
					{
						id = 'page20a'
						next_page = 'page21'
						type = 'gameplay'
						time_shown = 1
						text = qs(0x467e1f03)
						song = tut_vox_tw
						stat_counter_func = count_notes
						stat_display_func = count_notes_display
						band_lesson = 0
					}
					{
						id = 'page21'
						next_page = 'page22'
						type = 'text'
						time_shown = 1
						text = qs(0x14f1341e)
						audio_stream = 'Tut_Vcl1_L03_19'
					}
					{
						id = 'page22'
						type = 'text'
						time_shown = 1
						text = qs(0x3b626151)
						audio_stream = 'Tut_Vcl1_L03_20'
					}
				]
			}
			{
				id = 'lesson3'
				next_lesson = 'lesson4'
				title = qs(0xcca17ee5)
				helper_text = qs(0x0168ef52)
				pages = [
					{
						id = 'page0'
						next_page = 'first_page'
						type = 'text'
						title_page
						time_shown = $tutorial_system_post_title_wait_time
						text = qs(0x4cb0f0b8)
					}
					{
						id = 'first_page'
						next_page = 'page1'
						type = 'text'
						time_shown = 1
						text = qs(0x06063352)
						audio_stream = 'Tut_Vcl1_L04_01'
					}
					{
						id = 'page1'
						next_page = 'page3'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x431687c6)
						audio_stream = 'Tut_Vcl1_L04_02'
						images = [
							{
								image = tutorial_vocals_phrase_meter
								time_shown = 1
							}
						]
					}
					{
						id = 'page3'
						next_page = 'page4'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x46cfb925)
						audio_stream = 'Tut_Vcl1_L04_04'
						images = [
							{
								image = tutorial_vocals_phrase_meter_partial
								time_shown = 1
							}
						]
					}
					{
						id = 'page4'
						next_page = 'page5'
						type = 'text'
						time_shown = 1
						text = qs(0xe3ca7b32)
						audio_stream = 'Tut_Vcl1_L04_05'
					}
					{
						id = 'page5'
						next_page = 'page6'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xa8610f86)
						audio_stream = 'Tut_Vcl1_L04_06'
						images = [
							{
								image = tutorial_vocals_phrase_excellent
								time_shown = 1
							}
						]
					}
					{
						id = 'page6'
						next_page = 'page7'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x0b6941e9)
						audio_stream = 'Tut_Vcl1_L04_07'
						images = [
							{
								image = tutorial_vocals_phrase_rough
								time_shown = 1
							}
						]
					}
					{
						id = 'page7'
						next_page = 'page8'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xffbedaeb)
						audio_stream = 'Tut_Vcl1_L04_08'
						images = [
							{
								image = tutorial_vocals_phrase_meter_full
								time_shown = 1
							}
						]
					}
					{
						id = 'page8'
						next_page = 'page8a'
						type = 'text'
						time_shown = 1
						text = qs(0x180ee069)
						audio_stream = 'Tut_Vcl1_L04_09'
					}
					{
						id = 'page8a'
						next_page = 'page9'
						type = 'gameplay'
						time_shown = 1
						text = qs(0xe3ca7b32)
						song = tut_vox_tw_short
						stat_counter_func = count_notes
						stat_display_func = count_notes_display
						band_lesson = 0
					}
					{
						id = 'page9'
						next_page = 'page10'
						type = 'text'
						time_shown = 1
						text = qs(0xdf54f9b6)
						audio_stream = 'Tut_Vcl1_L04_13'
					}
					{
						id = 'page10'
						next_page = 'page11'
						type = 'text'
						time_shown = 1
						text = qs(0xdc9edc90)
						audio_stream = 'Tut_Vcl1_L04_11'
					}
					{
						id = 'page11'
						type = 'text'
						time_shown = 1
						text = qs(0x48132087)
						audio_stream = 'Tut_Vcl1_L04_10'
					}
				]
			}
			{
				id = 'lesson4'
				title = qs(0x7b6dc4a0)
				helper_text = qs(0x45529bdd)
				pages = [
					{
						id = 'page0'
						next_page = 'first_page'
						type = 'text'
						title_page
						time_shown = $tutorial_system_post_title_wait_time
						text = qs(0x7b6dc4a0)
					}
					{
						id = 'first_page'
						next_page = 'page2'
						type = 'text'
						time_shown = 1
						text = qs(0x1128c5c0)
						audio_stream = 'Tut_Vcl1_L05_01'
					}
					{
						id = 'page2'
						next_page = 'page3'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x9f5af0c2)
						audio_stream = 'Tut_Vcl1_L05_02'
						images = [
							{
								image = tutorial_vocals_sp_phrase
								time_shown = 1
							}
						]
					}
					{
						id = 'page3'
						next_page = 'page4'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xcf5cff04)
						audio_stream = 'Tut_Vcl1_L05_03'
						images = [
							{
								image = tutorial_vocals_sp_phrase
								time_shown = 1
							}
						]
					}
					{
						id = 'page4'
						next_page = 'page5'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xdebd591a)
						audio_stream = 'Tut_Vcl1_L05_04'
						images = [
							{
								image = tutorial_vocals_sp_ready
								time_shown = 1
							}
						]
					}
					{
						id = 'page5'
						next_page = 'page6'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x60d78c3a)
						audio_stream = 'Tut_Vcl1_L05_05'
						images = [
							{
								image = tutorial_vocals_sp_ready
								time_shown = 1
							}
						]
					}
					{
						id = 'page6'
						next_page = 'page6a'
						type = 'text_with_images'
						time_shown = 7
						text = qs(0xd7f4e890)
						audio_stream = 'Tut_Vcl1_L05_06'
						images = [
							{
								image = tutorial_controller_face_buttons
								time_shown = 1
								scale = 1.3
							}
						]
					}
					{
						id = 'page6a'
						next_page = 'page7'
						type = 'gameplay'
						time_shown = 1
						text = qs(0xdebd591a)
						song = tut_vox_tw_sp
						stat_counter_func = count_notes
						stat_display_func = count_notes_display
						band_lesson = 0
					}
					{
						id = 'page7'
						next_page = 'page8'
						type = 'text'
						time_shown = 1
						text = qs(0x527bd4d4)
						audio_stream = 'Tut_Vcl1_L05_08'
					}
					{
						id = 'page8'
						type = 'text'
						time_shown = 1
						text = qs(0x5ff6d77d)
						audio_stream = 'Tut_Vcl1_L05_09'
					}
				]
			}
		]
	}
	{
		id = 'vocal_advanced'
		title = qs(0xb519fe46)
		helper_text = qs(0xfe36640f)
		lessons = [
			{
				id = 'lesson0'
				next_lesson = 'lesson1'
				title = qs(0x0019092c)
				helper_text = qs(0x07b1262f)
				pages = [
					{
						id = 'page0'
						next_page = 'first_page'
						type = 'text'
						title_page
						time_shown = $tutorial_system_post_title_wait_time
						text = qs(0x0019092c)
					}
					{
						id = 'first_page'
						next_page = 'page1'
						type = 'text'
						time_shown = 1
						text = qs(0x13aa8fd4)
						audio_stream = 'Tut_Vcl2_L01_01'
					}
					{
						id = 'page1'
						next_page = 'page2'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xd5617b59)
						audio_stream = 'Tut_Vcl2_L01_02'
						images = [
							{
								image = tutorial_vocals_spoken
								time_shown = 1
							}
						]
					}
					{
						id = 'page2'
						next_page = 'page3'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xa36b676f)
						audio_stream = 'Tut_Vcl2_L01_03'
						images = [
							{
								image = tutorial_vocals_spoken
								time_shown = 1
							}
						]
					}
					{
						id = 'page3'
						next_page = 'page4'
						type = 'text'
						time_shown = 1
						text = qs(0xbf78c3ab)
						audio_stream = 'Tut_Vcl2_L01_04'
					}
					{
						id = 'page4'
						next_page = 'page5'
						type = 'gameplay'
						time_shown = 1
						text = qs(0xbf78c3ab)
						audio_stream = 'Tut_Vcl2_L01_04'
						song = tut_vox_spoken
						stat_counter_func = count_notes
						stat_display_func = count_notes_display
						band_lesson = 0
					}
					{
						id = 'page5'
						next_page = 'page6'
						type = 'text'
						time_shown = 1
						text = qs(0xfe726017)
						audio_stream = 'Tut_Vcl2_L01_05'
					}
					{
						id = 'page6'
						next_page = 'page8'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x7c6a790f)
						audio_stream = 'Tut_Vcl2_L01_06'
						images = [
							{
								image = tutorial_vocals_freeform
								time_shown = 1
							}
						]
					}
					{
						id = 'page8'
						next_page = 'page9'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x62d9305a)
						audio_stream = 'Tut_Vcl2_L01_07'
						images = [
							{
								image = tutorial_vocals_freeform
								time_shown = 1
							}
						]
					}
					{
						id = 'page9'
						next_page = 'page10'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x65af1ed9)
						audio_stream = 'Tut_Vcl2_L01_08'
						images = [
							{
								image = tutorial_vocals_freeform
								time_shown = 1
							}
						]
					}
					{
						id = 'page10'
						next_page = 'page11'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x7eaff4c8)
						audio_stream = 'Tut_Vcl2_L01_09'
						images = [
							{
								image = tutorial_vocals_freeform
								time_shown = 1
							}
						]
					}
					{
						id = 'page11'
						next_page = 'page12'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x61ed6206)
						audio_stream = 'Tut_Vcl2_L01_10'
						images = [
							{
								image = tutorial_vocals_freeform
								time_shown = 1
							}
						]
					}
					{
						id = 'page12'
						next_page = 'page13'
						type = 'text'
						time_shown = 1
						text = qs(0x3f9a0075)
						audio_stream = 'Tut_Vcl2_L01_11'
					}
					{
						id = 'page13'
						next_page = 'page14'
						type = 'gameplay'
						time_shown = 1
						text = qs(0x07429a73)
						song = tut_vox_freeform
						stat_counter_func = count_notes
						stat_display_func = count_notes_display
						band_lesson = 0
					}
					{
						id = 'page14'
						next_page = 'page15'
						type = 'text'
						time_shown = 1
						text = qs(0xa6cc40d8)
						audio_stream = 'Tut_Vcl2_L01_13'
					}
					{
						id = 'page15'
						type = 'text'
						time_shown = 1
						text = qs(0x7824cd40)
						audio_stream = 'Tut_Vcl2_L01_14'
					}
				]
			}
			{
				id = 'lesson1'
				next_lesson = 'lesson2'
				title = qs(0xc7b11e30)
				helper_text = qs(0xa4734f1f)
				pages = [
					{
						id = 'page0'
						next_page = 'first_page'
						type = 'text'
						title_page
						time_shown = $tutorial_system_post_title_wait_time
						text = qs(0xc7b11e30)
					}
					{
						id = 'first_page'
						next_page = 'page1'
						type = 'text'
						time_shown = 1
						text = qs(0x75dc2294)
						audio_stream = 'Tut_Vcl2_L02_01'
					}
					{
						id = 'page1'
						next_page = 'page2'
						type = 'text'
						time_shown = 1
						text = qs(0xb9d20a71)
						audio_stream = 'Tut_Vcl2_L02_02'
					}
					{
						id = 'page2'
						next_page = 'page3'
						type = 'text'
						time_shown = 1
						text = qs(0x6f9f7e56)
						audio_stream = 'Tut_Vcl2_L02_03'
					}
					{
						id = 'page3'
						next_page = 'page4'
						type = 'text'
						time_shown = 1
						text = qs(0x2acb6737)
						audio_stream = 'Tut_Vcl2_L02_04'
					}
					{
						id = 'page4'
						next_page = 'page5'
						type = 'text'
						time_shown = 1
						text = qs(0x3589ed40)
						audio_stream = 'Tut_Vcl2_L02_05'
					}
					{
						id = 'page5'
						next_page = 'page6'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x4b63ef9a)
						audio_stream = 'Tut_Vcl2_L02_06'
						images = [
							{
								image = tutorial_vocals_posture
								time_shown = 1
							}
						]
					}
					{
						id = 'page6'
						next_page = 'page7'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x1e08b5cc)
						audio_stream = 'Tut_Vcl2_L02_07'
						images = [
							{
								image = tutorial_vocals_inhale
								time_shown = 1
							}
						]
					}
					{
						id = 'page7'
						next_page = 'page8'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x51e37ed8)
						audio_stream = 'Tut_Vcl2_L02_08'
						images = [
							{
								image = tutorial_vocals_inhale
								time_shown = 1
							}
						]
					}
					{
						id = 'page8'
						next_page = 'page9'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x942fe225)
						audio_stream = 'Tut_Vcl2_L02_09'
						images = [
							{
								image = tutorial_vocals_inhale
								time_shown = 1
							}
						]
					}
					{
						id = 'page9'
						next_page = 'page10'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x4b4390cf)
						audio_stream = 'Tut_Vcl2_L02_10'
						images = [
							{
								image = tutorial_vocals_exhale
								time_shown = 1
							}
						]
					}
					{
						id = 'page10'
						next_page = 'page11'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x63de89d3)
						audio_stream = 'Tut_Vcl2_L02_11'
						images = [
							{
								image = tutorial_vocals_exhale
								time_shown = 1
							}
						]
					}
					{
						id = 'page11'
						next_page = 'page12'
						type = 'text'
						time_shown = 1
						text = qs(0x4dfc6b66)
						audio_stream = 'Tut_Vcl2_L02_12'
					}
					{
						id = 'page12'
						next_page = 'page13'
						type = 'text'
						time_shown = 1
						text = qs(0x04a6cb9a)
						audio_stream = 'Tut_Vcl2_L02_13'
					}
					{
						id = 'page13'
						next_page = 'page14'
						type = 'text'
						time_shown = 1
						text = qs(0x45cddacb)
						audio_stream = 'Tut_Vcl2_L02_14'
					}
					{
						id = 'page14'
						type = 'text'
						time_shown = 1
						text = qs(0x0436d290)
						audio_stream = 'Tut_Vcl2_L02_15'
					}
				]
			}
			{
				id = 'lesson2'
				title = qs(0x581963f9)
				helper_text = qs(0xfee322a1)
				pages = [
					{
						id = 'page0'
						next_page = 'first_page'
						type = 'text'
						title_page
						time_shown = $tutorial_system_post_title_wait_time
						text = qs(0x581963f9)
					}
					{
						id = 'first_page'
						next_page = 'page1'
						type = 'text'
						time_shown = 1
						text = qs(0xf8dfafd2)
						audio_stream = 'Tut_Vcl2_L03_01'
					}
					{
						id = 'page1'
						next_page = 'page2'
						type = 'text'
						time_shown = 1
						text = qs(0xcbb08913)
						audio_stream = 'Tut_Vcl2_L03_02'
					}
					{
						id = 'page2'
						next_page = 'page3'
						type = 'text'
						time_shown = 1
						text = qs(0x6eafafe0)
						audio_stream = 'Tut_Vcl2_L03_03'
					}
					{
						id = 'page3'
						next_page = 'page4'
						type = 'text'
						time_shown = 1
						text = qs(0xc0d2fa20)
						audio_stream = 'Tut_Vcl2_L03_04'
					}
					{
						id = 'page4'
						next_page = 'page5'
						type = 'text'
						time_shown = 1
						text = qs(0x2aa2d1af)
						audio_stream = 'Tut_Vcl2_L03_05'
					}
					{
						id = 'page5'
						next_page = 'page6'
						type = 'text'
						time_shown = 1
						text = qs(0xa4f2eb39)
						audio_stream = 'Tut_Vcl2_L03_06'
					}
					{
						id = 'page6'
						next_page = 'page7'
						type = 'text'
						time_shown = 1
						text = qs(0x6ef02e47)
						audio_stream = 'Tut_Vcl2_L03_07'
					}
					{
						id = 'page7'
						next_page = 'page8'
						type = 'text'
						time_shown = 1
						text = qs(0xaef9b83c)
						audio_stream = 'Tut_Vcl2_L03_08'
					}
					{
						id = 'page8'
						next_page = 'page9'
						type = 'text'
						time_shown = 1
						text = qs(0xdd8f5a39)
						audio_stream = 'Tut_Vcl2_L03_09'
					}
					{
						id = 'page9'
						next_page = 'page10'
						type = 'text'
						time_shown = 1
						text = qs(0x171df496)
						audio_stream = 'Tut_Vcl2_L03_10'
					}
					{
						id = 'page10'
						next_page = 'page11'
						type = 'text'
						time_shown = 1
						text = qs(0x9661836d)
						audio_stream = 'Tut_Vcl2_L03_11'
					}
					{
						id = 'page11'
						next_page = 'page12'
						type = 'text'
						time_shown = 1
						text = qs(0x1ac029b4)
						audio_stream = 'Tut_Vcl2_L03_12'
					}
					{
						id = 'page12'
						next_page = 'page13'
						type = 'text'
						time_shown = 1
						text = qs(0x37a066da)
						audio_stream = 'Tut_Vcl2_L03_13'
					}
					{
						id = 'page13'
						next_page = 'page14'
						type = 'text'
						time_shown = 1
						text = qs(0x2b4c4d33)
						audio_stream = 'Tut_Vcl2_L03_14'
					}
					{
						id = 'page14'
						type = 'text'
						time_shown = 1
						text = qs(0x2938bc87)
						audio_stream = 'Tut_Vcl2_L03_15'
					}
				]
			}
		]
	}
]
band_tutorial_helper_text = qs(0x68bf295d)
band_tutorials = [
	{
		id = 'band_basics'
		title = qs(0x1f331fb3)
		helper_text = qs(0x48a9da6e)
		lessons = [
			{
				id = 'lesson0'
				next_lesson = 'lesson1'
				title = qs(0x43bc39c3)
				helper_text = qs(0x91dd73ca)
				is_new
				pages = [
					{
						id = 'page0'
						next_page = 'first_page'
						type = 'text'
						title_page
						time_shown = $tutorial_system_post_title_wait_time
						text = qs(0x43bc39c3)
					}
					{
						id = 'first_page'
						next_page = 'page1'
						type = 'text'
						time_shown = 1
						text = qs(0xeddad7c4)
						audio_stream = 'Tut_Bnd1_L01_01'
					}
					{
						id = 'page1'
						next_page = 'page2'
						type = 'text'
						time_shown = 1
						text = qs(0x8dc55634)
						audio_stream = 'Tut_Bnd1_L01_02'
					}
					{
						id = 'page2'
						next_page = 'page3'
						type = 'text'
						time_shown = 1
						text = qs(0xf68e3ef4)
						audio_stream = 'Tut_Bnd1_L01_03'
					}
					{
						id = 'page3'
						next_page = 'page4'
						type = 'text'
						time_shown = 1
						text = qs(0x92cc1f8a)
						audio_stream = 'Tut_Bnd1_L01_04'
					}
					{
						id = 'page4'
						next_page = 'page5'
						type = 'text'
						time_shown = 1
						text = qs(0x6fad42e1)
						audio_stream = 'Tut_Bnd1_L01_05'
					}
					{
						id = 'page5'
						next_page = 'page6'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xc7abe5ce)
						audio_stream = 'Tut_Bnd1_L01_06'
						images = [
							{
								image = tutorial_band_multiplier
								time_shown = 1
								scale = 1
							}
						]
					}
					{
						id = 'page6'
						next_page = 'page7'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x44e2123a)
						audio_stream = 'Tut_Bnd1_L01_07'
						images = [
							{
								image = tutorial_band_multiplier
								time_shown = 1
								scale = 1
							}
						]
					}
					{
						id = 'page7'
						next_page = 'page8'
						type = 'text'
						text = qs(0x088cb07f)
						audio_stream = 'Tut_Bnd1_L01_08'
					}
					{
						id = 'page8'
						next_page = 'page9'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x7ba96326)
						audio_stream = 'Tut_Bnd1_L01_09'
						images = [
							{
								image = tutorial_band_highway_single
								time_shown = 1
							}
						]
					}
					{
						id = 'page9'
						next_page = 'page10'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x1e8b6105)
						audio_stream = 'Tut_Bnd1_L01_10'
						images = [
							{
								image = tutorial_band_highway_double
								time_shown = 1
							}
						]
					}
					{
						id = 'page10'
						next_page = 'page11'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xf211cf62)
						audio_stream = 'Tut_Bnd1_L01_11'
						images = [
							{
								image = tutorial_band_highway_triple
								time_shown = 1
							}
						]
					}
					{
						id = 'page11'
						next_page = 'page12'
						type = 'text'
						text = qs(0xc475a170)
						audio_stream = 'Tut_Bnd1_L01_12'
					}
					{
						id = 'page12'
						next_page = 'page13'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x5e82407c)
						audio_stream = 'Tut_Bnd1_L01_13'
						images = [
							{
								image = tutorial_band_multiplier_star_power
								time_shown = 1
							}
						]
					}
					{
						id = 'page13'
						next_page = 'page14'
						type = 'text'
						time_shown = 1
						text = qs(0x8b8d92b2)
						audio_stream = 'Tut_Bnd1_L01_14'
					}
					{
						id = 'page14'
						next_page = 'page15'
						type = 'text'
						time_shown = 1
						text = qs(0x7e382c38)
						audio_stream = 'Tut_Bnd1_L01_15'
					}
					{
						id = 'page15'
						next_page = 'page16'
						type = 'text'
						time_shown = 1
						text = qs(0x2e679305)
						audio_stream = 'Tut_Bnd1_L01_16'
					}
					{
						id = 'page16'
						next_page = 'page17'
						type = 'text'
						time_shown = 1
						text = qs(0x4fff6360)
						audio_stream = 'Tut_Bnd1_L01_17'
					}
					{
						id = 'page17'
						next_page = 'page18'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xe57d9178)
						audio_stream = 'Tut_Bnd1_L01_18'
						images = [
							{
								image = tutorial_band_moment
								time_shown = 1
								scale = 1
							}
						]
					}
					{
						id = 'page18'
						next_page = 'page19'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x67e6d637)
						audio_stream = 'Tut_Bnd1_L01_19'
						images = [
							{
								image = tutorial_band_moment
								time_shown = 1
								scale = 1
							}
						]
					}
					{
						id = 'page19'
						next_page = 'page20'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xa666ead3)
						audio_stream = 'Tut_Bnd1_L01_20'
						images = [
							{
								image = tutorial_band_moment_hit
								time_shown = 1
								scale = 1
							}
						]
					}
					{
						id = 'page20'
						next_page = 'page21'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xb5acd2f8)
						audio_stream = 'Tut_Bnd1_L01_21'
						images = [
							{
								image = tutorial_band_moment_hit
								time_shown = 1
								scale = 1
							}
						]
					}
					{
						id = 'page21'
						next_page = 'page22'
						type = 'text'
						time_shown = 1
						text = qs(0x6cc52ef3)
						audio_stream = 'Tut_Bnd1_L01_24'
					}
					{
						id = 'page22'
						next_page = 'page23'
						type = 'text'
						time_shown = 1
						text = qs(0x3052f3af)
						audio_stream = 'Tut_Bnd1_L01_25'
					}
					{
						id = 'page23'
						next_page = 'page24'
						type = 'text'
						time_shown = 1
						text = qs(0xc1eaffe8)
						audio_stream = 'Tut_Bnd1_L01_26'
					}
					{
						id = 'page24'
						type = 'text'
						time_shown = 1
						text = qs(0x4b340e9f)
						audio_stream = 'Tut_Bnd1_L01_27'
					}
				]
			}
			{
				id = 'lesson1'
				next_lesson = 'lesson2'
				title = qs(0x48f79529)
				helper_text = qs(0x780e7c78)
				is_new
				pages = [
					{
						id = 'page0'
						next_page = 'first_page'
						type = 'text'
						title_page
						time_shown = $tutorial_system_post_title_wait_time
						text = qs(0x48f79529)
					}
					{
						id = 'first_page'
						next_page = 'page1'
						type = 'text'
						time_shown = 1
						text = qs(0x778bdf14)
						audio_stream = 'Tut_Bnd1_L02_01'
					}
					{
						id = 'page1'
						next_page = 'page2'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xde7509a3)
						audio_stream = 'Tut_Bnd1_L02_02'
						images = [
							{
								image = tutorial_band_sp_pre_overflow
								time_shown = 1
							}
						]
					}
					{
						id = 'page2'
						next_page = 'page3'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x8fb29ccc)
						audio_stream = 'Tut_Bnd1_L02_03'
						images = [
							{
								image = tutorial_band_sp_overflow
								time_shown = 1
								scale = 1
							}
						]
					}
					{
						id = 'page3'
						next_page = 'page4'
						type = 'text'
						time_shown = 1
						text = qs(0x26ad6601)
						audio_stream = 'Tut_Bnd1_L02_04'
					}
					{
						id = 'page4'
						next_page = 'page5'
						type = 'text'
						time_shown = 1
						text = qs(0x454a37c9)
						audio_stream = 'Tut_Bnd1_L02_05'
					}
					{
						id = 'page5'
						type = 'text'
						time_shown = 1
						text = qs(0xe8af1b21)
						audio_stream = 'Tut_Bnd1_L02_06'
					}
				]
			}
			{
				id = 'lesson2'
				next_lesson = 'lesson3'
				title = qs(0xfb8a864e)
				helper_text = qs(0x69be156b)
				is_new
				pages = [
					{
						id = 'page0'
						next_page = 'first_page'
						type = 'text'
						title_page
						time_shown = $tutorial_system_post_title_wait_time
						text = qs(0xfb8a864e)
					}
					{
						id = 'first_page'
						next_page = 'page2'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xb3603ef2)
						audio_stream = 'Tut_Bnd1_L03_01'
						images = [
							{
								image = tutorial_band_resurrection_pre_fail
								time_shown = 1
								scale = 1
							}
						]
					}
					{
						id = 'page2'
						next_page = 'page3'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x66c01362)
						audio_stream = 'Tut_Bnd1_L03_02'
						images = [
							{
								image = tutorial_band_resurrection_single_fail
								time_shown = 1
								scale = 1
							}
						]
					}
					{
						id = 'page3'
						next_page = 'page4'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0xa339cad2)
						audio_stream = 'Tut_Bnd1_L03_03'
						images = [
							{
								image = tutorial_band_resurrection_single_fail
								time_shown = 1
								scale = 1
							}
						]
					}
					{
						id = 'page3_a'
						next_page = 'page3_b'
						type = 'text'
						time_shown = 1
						text = qs(0xb8d60d76)
						audio_stream = 'Tut_Bnd1_L03_12'
					}
					{
						id = 'page3_b'
						next_page = 'page3_c'
						type = 'text'
						time_shown = 1
						text = qs(0xe85bec70)
						audio_stream = 'Tut_Bnd1_L03_13'
					}
					{
						id = 'page3_c'
						next_page = 'page4'
						type = 'text'
						time_shown = 1
						text = qs(0xaf013a35)
						audio_stream = 'Tut_Bnd1_L03_14'
					}
					{
						id = 'page4'
						next_page = 'page5'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x9dc8a997)
						audio_stream = 'Tut_Bnd1_L03_04'
						images = [
							{
								image = tutorial_band_resurrection
								time_shown = 1
								scale = 1
							}
						]
					}
					{
						id = 'page5'
						next_page = 'page6'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x1f5ea048)
						audio_stream = 'Tut_Bnd1_L03_05'
						images = [
							{
								image = tutorial_band_resurrection
								time_shown = 1
								scale = 1
							}
						]
					}
					{
						id = 'page6'
						next_page = 'page7'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x7e792e86)
						audio_stream = 'Tut_Bnd1_L03_06'
						images = [
							{
								image = tutorial_band_resurrection
								time_shown = 1
								scale = 1
							}
						]
					}
					{
						id = 'page7'
						next_page = 'page8'
						type = 'text'
						time_shown = 1
						text = qs(0xe5b3b27a)
						audio_stream = 'Tut_Bnd1_L03_07'
					}
					{
						id = 'page8'
						next_page = 'page9_a'
						type = 'text'
						time_shown = 1
						text = qs(0x7adb9762)
						audio_stream = 'Tut_Bnd1_L03_08'
					}
					{
						id = 'page9_a'
						next_page = 'page10'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x6a3ba37a)
						audio_stream = 'Tut_Bnd1_L03_10'
						images = [
							{
								image = tutorial_band_resurrection_fail
								time_shown = 1
								scale = 1
							}
						]
					}
					{
						id = 'page10'
						type = 'text'
						time_shown = 1
						text = qs(0xccec3eb5)
						audio_stream = 'Tut_Bnd1_L03_11'
					}
				]
			}
			{
				id = 'lesson3'
				title = qs(0x35adace5)
				helper_text = qs(0xe207961e)
				pages = [
					{
						id = 'page0'
						next_page = 'first_page'
						type = 'text'
						title_page
						time_shown = $tutorial_system_post_title_wait_time
						text = qs(0x35adace5)
					}
					{
						id = 'first_page'
						next_page = 'page1'
						type = 'text'
						time_shown = 1
						text = qs(0x42730fec)
						audio_stream = 'Tut_Bnd1_L04_01'
					}
					{
						id = 'page1'
						next_page = 'page2'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x26469ab9)
						audio_stream = 'Tut_Bnd1_L04_02'
						images = [
							{
								image = tutorial_guitar_icon
								time_shown = 1
							}
						]
					}
					{
						id = 'page2'
						next_page = 'page3'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x6cd3a015)
						audio_stream = 'Tut_Bnd1_L04_03'
						images = [
							{
								image = tutorial_vocal_icon
								time_shown = 1
							}
						]
					}
					{
						id = 'page3'
						next_page = 'page4'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x3ed5e116)
						audio_stream = 'Tut_Bnd1_L04_04'
						images = [
							{
								image = tutorial_vocal_icon
								time_shown = 1
							}
						]
					}
					{
						id = 'page4'
						next_page = 'page5'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x17837bd7)
						audio_stream = 'Tut_Bnd1_L04_05'
						images = [
							{
								image = tutorial_bass_icon
								time_shown = 1
							}
						]
					}
					{
						id = 'page5'
						next_page = 'page6'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x7c1a1872)
						audio_stream = 'Tut_Bnd1_L04_06'
						images = [
							{
								image = tutorial_bass_icon
								time_shown = 1
							}
						]
					}
					{
						id = 'page6'
						next_page = 'page8'
						type = 'text_with_images'
						time_shown = 1
						text = qs(0x96aad73f)
						audio_stream = 'Tut_Bnd1_L04_07'
						images = [
							{
								image = tutorial_drum_icon
								time_shown = 1
							}
						]
					}
					{
						id = 'page7'
						next_page = 'page8'
						type = 'text'
						time_shown = 1
						text = qs(0x5931adc8)
						audio_stream = 'Tut_Bnd1_L04_08'
					}
					{
						id = 'page8'
						next_page = 'page9'
						type = 'text'
						time_shown = 1
						text = qs(0x103a7c9e)
						audio_stream = 'Tut_Bnd1_L04_09'
					}
					{
						id = 'page8_a'
						next_page = 'page9'
						type = 'text'
						time_shown = 1
						text = qs(0xe54e0a17)
						audio_stream = 'Tut_Bnd1_L04_10'
					}
					{
						id = 'page9'
						type = 'text'
						time_shown = 1
						text = qs(0x7245eb16)
						audio_stream = 'Tut_Bnd1_L04_11'
					}
				]
			}
		]
	}
]
