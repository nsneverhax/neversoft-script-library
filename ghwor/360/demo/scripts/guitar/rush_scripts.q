g_rush_setlist = [
	rush2112p1
	rush2112p2
	rush2112p3
	rush2112p4
	rush2112p5
	rush2112p6
	rush2112p7
]
g_rush_data = {
	rush2112p1 = {
		scene = main
		intro = rush_celeb_intro
		outro = g_rushoutro1
		stream = 'Rush_01'
		song = 1
	}
	rush2112p2 = {
		scene = temple
		intro = g_rushintro0
		outro = g_rushoutro2
		stream = 'Rush_02'
		song = 2
	}
	rush2112p3 = {
		scene = main
		intro = g_rushintro0
		outro = g_rushoutro3
		stream = 'Rush_03'
		song = 3
	}
	rush2112p4 = {
		scene = temple
		intro = g_rushintro0
		outro = g_rushoutro4
		stream = 'Rush_04'
		song = 4
	}
	rush2112p5 = {
		scene = dream
		intro = g_rushintro0
		outro = g_rushoutro5
		stream = 'Rush_05'
		song = 5
	}
	rush2112p6 = {
		scene = main
		intro = g_rushintro0
		outro = g_rushoutro6
		stream = 'Rush_06'
		song = 6
	}
	rush2112p7 = {
		scene = dream
		intro = g_rushintro0
		outro = g_rushoutro7
		song = 7
	}
}
default_rushintro_transition = {
	time = 1000
	scripttable = [
	]
}
common_rushintro_transition = {
}
default_rushoutro_transition = {
	time = 1000
	scripttable = [
	]
}
common_rushoutro_transition = {
}
g_rushintro0 = {
	time = 100
	scripttable = [
		{
			time = 0
			scr = rush_cameracut
		}
		{
			time = 0
			scr = play_intro
			params = {
				fast = 1
			}
		}
		{
			time = 0
			scr = do_rush_scene_swap
			params = {
			}
		}
		{
			time = 100
			scr = transition_startrendering
		}
		{
			time = 100
			scr = change_crowd_looping_sfx
			params = {
				crowd_looping_state = neutral
			}
		}
	]
	endwithdefaultcamera
	syncwithnotecameras
}
g_rushoutro1 = {
	time = 16890
	scripttable = [
		{
			time = 0
			scr = play_win_anims
			params = {
			}
		}
		{
			time = 0
			scr = scene_swap
			params = {
				name = temple
			}
		}
		{
			time = 0
			scr = save_rush_progess
			params = {
				song = 2
			}
		}
		{
			time = 1
			scr = band_hide
			params = {
				name = drummer
			}
		}
		{
			time = 1
			scr = band_hide
			params = {
				name = guitarist
			}
		}
		{
			time = 1
			scr = band_hide
			params = {
				name = bassist
			}
		}
		{
			time = 1
			scr = band_hide
			params = {
				name = vocalist
			}
		}
		{
			time = 1
			scr = change_crowd_state
			params = {
				new_state = mellow
			}
		}
		{
			time = 3600
			scr = transition_cameracut
			params = {
				prefix = 'cameras_moments'
				changenow
				name = moment01
			}
		}
		{
			time = 3600
			scr = momentcamera_playanim
			params = {
				anim = rush2112_intro01_c02
				lock_target = moment_cam_lock_target_01
				node = 'TRG_Geo_Camera_Performance_SING01'
			}
		}
		{
			time = 3725
			scr = cameracuts_applydof
			params = {
				dof = $dof_medium01_tod_manager
				time = 0.0
			}
		}
		{
			time = 11633
			scr = momentcamera_playanim
			params = {
				anim = rush2112_intro01_c03
				lock_target = moment_cam_lock_target_01
				node = 'TRG_Geo_Camera_Performance_SING01'
			}
		}
		{
			time = 13466
			scr = momentcamera_playanim
			params = {
				anim = rush2112_intro01_c04
				lock_target = moment_cam_lock_target_01
				node = 'TRG_Geo_Camera_Performance_SING01'
			}
		}
		{
			time = 16890
			scr = band_unhide
			params = {
				name = drummer
			}
		}
		{
			time = 16890
			scr = band_unhide
			params = {
				name = guitarist
			}
		}
		{
			time = 16890
			scr = band_unhide
			params = {
				name = bassist
			}
		}
		{
			time = 16890
			scr = band_unhide
			params = {
				name = vocalist
			}
		}
	]
}
g_rushoutro2 = {
	time = 18811
	scripttable = [
		{
			time = 0
			scr = crowd_allplayanim
			params = {
				anim = idle
			}
		}
		{
			time = 0
			scr = scene_swap
			params = {
				name = main
			}
		}
		{
			time = 0
			scr = save_rush_progess
			params = {
				song = 3
			}
		}
		{
			time = 0
			scr = band_hide
			params = {
				name = drummer
			}
		}
		{
			time = 0
			scr = band_hide
			params = {
				name = guitarist
			}
		}
		{
			time = 0
			scr = band_hide
			params = {
				name = bassist
			}
		}
		{
			time = 0
			scr = band_hide
			params = {
				name = vocalist
			}
		}
		{
			time = 2433
			scr = transition_cameracut
			params = {
				prefix = 'cameras_moments'
				changenow
				name = moment01
			}
		}
		{
			time = 2433
			scr = momentcamera_playanim
			params = {
				anim = rush2112_intro02_c02
				lock_target = moment_cam_lock_target_01
				node = 'TRG_Geo_Camera_Performance_SING01'
			}
		}
		{
			time = 10066
			scr = momentcamera_playanim
			params = {
				anim = rush2112_intro02_c03
				lock_target = moment_cam_lock_target_01
				node = 'TRG_Geo_Camera_Performance_SING01'
			}
		}
		{
			time = 18811
			scr = band_unhide
			params = {
				name = drummer
			}
		}
		{
			time = 18811
			scr = band_unhide
			params = {
				name = guitarist
			}
		}
		{
			time = 18811
			scr = band_unhide
			params = {
				name = bassist
			}
		}
		{
			time = 18811
			scr = band_unhide
			params = {
				name = vocalist
			}
		}
	]
}
g_rushoutro3 = {
	time = 24940
	scripttable = [
		{
			time = 0
			scr = play_win_anims
			params = {
			}
		}
		{
			time = 0
			scr = crowd_allplayanim
			params = {
				anim = idle
			}
		}
		{
			time = 0
			scr = scene_swap
			params = {
				name = temple
			}
		}
		{
			time = 0
			scr = save_rush_progess
			params = {
				song = 4
			}
		}
		{
			time = 0
			scr = band_hide
			params = {
				name = drummer
			}
		}
		{
			time = 0
			scr = band_hide
			params = {
				name = guitarist
			}
		}
		{
			time = 0
			scr = band_hide
			params = {
				name = bassist
			}
		}
		{
			time = 0
			scr = band_hide
			params = {
				name = vocalist
			}
		}
		{
			time = 1
			scr = change_crowd_state
			params = {
				new_state = mellow
			}
		}
		{
			time = 125
			scr = cameracuts_applydof
			params = {
				dof = $dof_medium01_tod_manager
				time = 0.0
			}
		}
		{
			time = 11200
			scr = fadeoutandin
			params = {
				time = 1.0
				delay = 1.0
				z_priority = 0
			}
		}
		{
			time = 11800
			scr = transition_cameracut
			params = {
				prefix = 'cameras_moments'
				changenow
				name = moment01
			}
		}
		{
			time = 11800
			scr = momentcamera_playanim
			params = {
				anim = rush2112_intro03_c04
				lock_target = moment_cam_lock_target_01
				node = 'TRG_Geo_Camera_Performance_SING01'
			}
		}
		{
			time = 22900
			scr = fadeoutandin
			params = {
				time = 1.0
				delay = 2.5
				z_priority = 0
			}
		}
		{
			time = 24940
			scr = band_unhide
			params = {
				name = drummer
			}
		}
		{
			time = 24940
			scr = band_unhide
			params = {
				name = guitarist
			}
		}
		{
			time = 24940
			scr = band_unhide
			params = {
				name = bassist
			}
		}
		{
			time = 24940
			scr = band_unhide
			params = {
				name = vocalist
			}
		}
	]
}
g_rushoutro4 = {
	time = 29776
	scripttable = [
		{
			time = 0
			scr = play_win_anims
			params = {
			}
		}
		{
			time = 0
			scr = crowd_allplayanim
			params = {
				anim = idle
			}
		}
		{
			time = 0
			scr = scene_swap
			params = {
				name = dream
			}
		}
		{
			time = 0
			scr = save_rush_progess
			params = {
				song = 5
			}
		}
		{
			time = 0
			scr = band_hide
			params = {
				name = drummer
			}
		}
		{
			time = 0
			scr = band_hide
			params = {
				name = guitarist
			}
		}
		{
			time = 0
			scr = band_hide
			params = {
				name = bassist
			}
		}
		{
			time = 0
			scr = band_hide
			params = {
				name = vocalist
			}
		}
		{
			time = 125
			scr = cameracuts_applydof
			params = {
				dof = $dof_medium01_tod_manager
				time = 0.0
			}
		}
		{
			time = 8000
			scr = fadeoutandin
			params = {
				time = 1.0
				delay = 1.0
				z_priority = 0
			}
		}
		{
			time = 8733
			scr = transition_cameracut
			params = {
				prefix = 'cameras_moments'
				changenow
				name = moment01
			}
		}
		{
			time = 8733
			scr = momentcamera_playanim
			params = {
				anim = rush2112_intro04_c02
				lock_target = moment_cam_lock_target_01
				node = 'TRG_Geo_Camera_Performance_SING01'
			}
		}
		{
			time = 8858
			scr = cameracuts_applydof
			params = {
				dof = $dof_medium01_tod_manager
				time = 0.0
			}
		}
		{
			time = 15800
			scr = fadeoutandin
			params = {
				time = 1.0
				delay = 1.0
				z_priority = 0
			}
		}
		{
			time = 16600
			scr = momentcamera_playanim
			params = {
				anim = rush2112_intro04_c03
				lock_target = moment_cam_lock_target_01
				node = 'TRG_Geo_Camera_Performance_SING01'
			}
		}
		{
			time = 16725
			scr = cameracuts_applydof
			params = {
				dof = $dof_medium01_tod_manager
				time = 0.0
			}
		}
		{
			time = 29776
			scr = band_unhide
			params = {
				name = drummer
			}
		}
		{
			time = 29776
			scr = band_unhide
			params = {
				name = guitarist
			}
		}
		{
			time = 29776
			scr = band_unhide
			params = {
				name = bassist
			}
		}
		{
			time = 29776
			scr = band_unhide
			params = {
				name = vocalist
			}
		}
	]
}
g_rushoutro5 = {
	time = 17237
	scripttable = [
		{
			time = 0
			scr = play_win_anims
			params = {
			}
		}
		{
			time = 0
			scr = crowd_allplayanim
			params = {
				anim = idle
			}
		}
		{
			time = 0
			scr = scene_swap
			params = {
				name = main
			}
		}
		{
			time = 0
			scr = save_rush_progess
			params = {
				song = 6
			}
		}
		{
			time = 0
			scr = band_hide
			params = {
				name = drummer
			}
		}
		{
			time = 0
			scr = band_hide
			params = {
				name = guitarist
			}
		}
		{
			time = 0
			scr = band_hide
			params = {
				name = bassist
			}
		}
		{
			time = 0
			scr = band_hide
			params = {
				name = vocalist
			}
		}
		{
			time = 6000
			scr = fadeoutandin
			params = {
				time = 2.0
				delay = 1.0
				z_priority = 0
			}
		}
		{
			time = 7166
			scr = transition_cameracut
			params = {
				prefix = 'cameras_moments'
				changenow
				name = moment01
			}
		}
		{
			time = 7166
			scr = momentcamera_playanim
			params = {
				anim = rush2112_intro05_c02
				lock_target = moment_cam_lock_target_01
				node = 'TRG_Geo_Camera_Performance_SING01'
			}
		}
		{
			time = 7291
			scr = cameracuts_applydof
			params = {
				dof = $dof_medium01_tod_manager
				time = 0.0
			}
		}
		{
			time = 12000
			scr = fadeoutandin
			params = {
				time = 2.0
				delay = 1.0
				z_priority = 0
			}
		}
		{
			time = 13066
			scr = momentcamera_playanim
			params = {
				anim = rush2112_intro05_c03
				lock_target = moment_cam_lock_target_01
				node = 'TRG_Geo_Camera_Performance_SING01'
			}
		}
		{
			time = 13191
			scr = cameracuts_applydof
			params = {
				dof = $dof_medium01_tod_manager
				time = 0.0
			}
		}
	]
}
g_rushoutro6 = {
	time = 8167
	scripttable = [
		{
			time = 0
			scr = play_win_anims
			params = {
			}
		}
		{
			time = 0
			scr = crowd_allplayanim
			params = {
				anim = idle
			}
		}
		{
			time = 0
			scr = scene_swap
			params = {
				name = dream
			}
		}
		{
			time = 0
			scr = save_rush_progess
			params = {
				song = 7
			}
		}
		{
			time = 0
			scr = band_hide
			params = {
				name = drummer
			}
		}
		{
			time = 0
			scr = band_hide
			params = {
				name = guitarist
			}
		}
		{
			time = 0
			scr = band_hide
			params = {
				name = bassist
			}
		}
		{
			time = 0
			scr = band_hide
			params = {
				name = vocalist
			}
		}
		{
			time = 125
			scr = cameracuts_applydof
			params = {
				dof = $dof_medium01_tod_manager
				time = 0.0
			}
		}
	]
}
g_rushoutro7 = {
	time = 29500
	scripttable = [
		{
			time = 0
			scr = stop_song_perf
			params = {
			}
		}
		{
			time = 0
			scr = play_win_anims
			params = {
			}
		}
		{
			time = 0
			scr = crowd_allplayanim
			params = {
				anim = idle
			}
		}
		{
			time = 0
			scr = save_rush_progess
			params = {
				song = 1
				complete = 1
			}
		}
		{
			time = 0
			scr = scene_swap
			params = {
				name = main
			}
		}
		{
			time = 0
			scr = z_modular_rush_axeguitarfx
			params = {
			}
		}
		{
			time = 0
			scr = z_modular_rush_cavelighting
			params = {
			}
		}
		{
			time = 1
			scr = z_modular_killgeo
			params = {
			}
		}
		{
			time = 1
			scr = z_modular_createdemirock
			params = {
			}
		}
		{
			time = 1
			scr = transition_cameracut
			params = {
				prefix = 'cameras_moments'
				changenow
				name = moment01
			}
		}
		{
			time = 1
			scr = bandmanager_hideinstrument
			params = {
				name = vocalist
			}
		}
		{
			time = 1
			scr = bandmanager_hideinstrument
			params = {
				name = guitarist
			}
		}
		{
			time = 1
			scr = bandmanager_hideinstrument
			params = {
				name = bassist
			}
		}
		{
			time = 1
			scr = bandmanager_hideinstrument
			params = {
				name = drummer
			}
		}
		{
			time = 1
			scr = band_playclip
			params = {
				clip = rushoutro_rush2112_outro01_011
				startframe = 9
				endframe = 100
				timefactor = 1
				intro_event = 1
			}
		}
		{
			time = 1
			scr = band_playclip
			params = {
				clip = rushoutro_rush2112_outro01_016
				startframe = 9
				endframe = 100
				timefactor = 1
				intro_event = 1
			}
		}
		{
			time = 1
			scr = start_preloaded_encore_event_stream
		}
		{
			time = 500
			scr = cameracuts_applydof
			params = {
				dof = $dof_medium01_tod_manager
				time = 0.0
			}
		}
		{
			time = 3333
			scr = band_playclip
			params = {
				clip = rushoutro_rush2112_outro01_022
				startframe = 6
				endframe = 199
				timefactor = 1
				intro_event = 1
			}
		}
		{
			time = 3333
			scr = band_playclip
			params = {
				clip = rushoutro_rush2112_outro01_027
				startframe = 6
				endframe = 199
				timefactor = 1
				intro_event = 1
			}
		}
		{
			time = 9967
			scr = band_playclip
			params = {
				clip = rushoutro_rush2112_outro01_033
				startframe = 12
				endframe = 94
				timefactor = 1
				intro_event = 1
			}
		}
		{
			time = 9967
			scr = band_playclip
			params = {
				clip = rushoutro_rush2112_outro01_038
				startframe = 12
				endframe = 94
				timefactor = 1
				intro_event = 1
			}
		}
		{
			time = 13100
			scr = scene_swap
			params = {
				name = dream
				sync = 1
			}
		}
		{
			time = 13100
			scr = bandmanager_setikchainstrength
			params = {
				name = drummer
				chain = bone_ik_hand_guitar_r
				strength = 0
			}
		}
		{
			time = 13100
			scr = bandmanager_setikchainstrength
			params = {
				name = drummer
				chain = bone_ik_hand_slave_r
				strength = 0
			}
		}
		{
			time = 13100
			scr = bandmanager_setikchainstrength
			params = {
				name = drummer
				chain = bone_ik_hand_guitar_l
				strength = 0
			}
		}
		{
			time = 13100
			scr = bandmanager_setikchainstrength
			params = {
				name = drummer
				chain = bone_ik_hand_slave_l
				strength = 0
			}
		}
		{
			time = 13100
			scr = band_playclip
			params = {
				clip = rushoutro_rush2112_outro02_ex4
				startframe = 10
				endframe = 89
				timefactor = 1
				intro_event = 1
			}
		}
		{
			time = 15733
			scr = band_playclip
			params = {
				clip = rushoutro_rush2112_outro02_019
				startframe = 137
				endframe = 245
				timefactor = 1
				intro_event = 1
			}
		}
		{
			time = 18000
			scr = z_modular_rush_dream_guitarfx
			params = {
			}
		}
		{
			time = 19333
			scr = band_playclip
			params = {
				clip = rushoutro_rush2112_outro02_025
				startframe = 6
				endframe = 311
				timefactor = 1
				intro_event = 1
			}
		}
		{
			time = 28500
			scr = fadeoutandin
			params = {
				time = 2.0
				delay = 1.0
				z_priority = 0
			}
		}
		{
			time = 29500
			scr = z_modular_rush_killwind
			params = {
			}
		}
		{
			time = 29500
			scr = z_modular_killdemi
			params = {
			}
		}
		{
			time = 29500
			scr = bandmanager_unhideinstrument
			params = {
				name = vocalist
			}
		}
		{
			time = 29500
			scr = bandmanager_unhideinstrument
			params = {
				name = guitarist
			}
		}
		{
			time = 29500
			scr = bandmanager_unhideinstrument
			params = {
				name = bassist
			}
		}
		{
			time = 29500
			scr = bandmanager_unhideinstrument
			params = {
				name = drummer
			}
		}
	]
}
rushoutro_rush2112_outro01_011 = {
	characters = [
		{
			name = vocalist
			startnode = 'vocalist_start'
			anim = rush2112_outro02_02_a
			startframe = 12
			endframe = 131
			timefactor = 1
			ik_targetl = slave
			ik_targetr = slave
			strum = false
			fret = false
			chord = false
		}
	]
	actors = [
		{
			name = z_modular_trg_geo_demi
			startnode = 'vocalist_start'
			anim = rush2112_outro01_demi_01
		}
	]
	cameras = [
		{
			slot = 0
			name = 'TRG_Geo_Camera_Performance_SING01'
			anim = rush2112_outro01_01_c01
		}
	]
	commands = [
	]
}
rushoutro_rush2112_outro01_022 = {
	characters = [
		{
			name = vocalist
			startnode = 'vocalist_start'
			anim = rush2112_outro02_02_a
			startframe = 12
			endframe = 131
			timefactor = 1
			ik_targetl = slave
			ik_targetr = slave
			strum = false
			fret = false
			chord = false
		}
	]
	actors = [
		{
			name = z_modular_trg_geo_demi
			startnode = 'vocalist_start'
			anim = rush2112_outro01_demi_02
		}
	]
	commands = [
	]
}
rushoutro_rush2112_outro01_033 = {
	characters = [
		{
			name = vocalist
			startnode = 'vocalist_start'
			anim = rush2112_outro02_02_a
			startframe = 12
			endframe = 131
			timefactor = 1
			ik_targetl = slave
			ik_targetr = slave
			strum = false
			fret = false
			chord = false
		}
	]
	actors = [
		{
			name = z_modular_trg_geo_demi
			startnode = 'vocalist_start'
			anim = rush2112_outro01_demi_03
		}
	]
	commands = [
	]
}
rushoutro_rush2112_outro02_ex4 = {
	charflags = [
		nsbsafe
	]
	characters = [
		{
			name = vocalist
			startnode = 'vocalist_start'
			anim = rush2112_outro02_ex_a
			startframe = 10
			endframe = 89
			timefactor = 1
			ik_targetl = slave
			ik_targetr = slave
			strum = false
			fret = false
			chord = false
		}
		{
			name = guitarist
			startnode = 'vocalist_start'
			anim = rush2112_outro02_ex_b
			startframe = 10
			endframe = 89
			timefactor = 1
			ik_targetl = slave
			ik_targetr = slave
			strum = false
			fret = false
			chord = false
		}
		{
			name = bassist
			startnode = 'vocalist_start'
			anim = rush2112_outro02_ex_c
			startframe = 10
			endframe = 89
			timefactor = 1
			ik_targetl = slave
			ik_targetr = slave
			strum = false
			fret = false
			chord = false
		}
		{
			name = drummer
			startnode = 'vocalist_start'
			anim = rush2112_outro02_ex_d
			startframe = 10
			endframe = 89
			timefactor = 1
			ik_targetl = slave
			ik_targetr = slave
		}
	]
	cameras = [
		{
			slot = 0
			name = 'TRG_Geo_Camera_Performance_SING01'
			anim = rush2112_outro02_ex_c01
		}
	]
	commands = [
	]
}
rushoutro_rush2112_outro02_025 = {
	charflags = [
		nsbsafe
	]
	characters = [
		{
			name = vocalist
			startnode = 'vocalist_start'
			anim = rush2112_outro02_02_a
			startframe = 6
			endframe = 311
			timefactor = 1
			ik_targetl = slave
			ik_targetr = slave
			strum = false
			fret = false
			chord = false
		}
		{
			name = guitarist
			startnode = 'vocalist_start'
			anim = rush2112_outro02_02_b
			startframe = 6
			endframe = 311
			timefactor = 1
			ik_targetl = slave
			ik_targetr = slave
			strum = false
			fret = false
			chord = false
		}
		{
			name = bassist
			startnode = 'vocalist_start'
			anim = rush2112_outro02_02_c
			startframe = 6
			endframe = 311
			timefactor = 1
			ik_targetl = slave
			ik_targetr = slave
			strum = false
			fret = false
			chord = false
		}
		{
			name = drummer
			startnode = 'vocalist_start'
			anim = rush2112_outro02_02_d
			startframe = 6
			endframe = 311
			timefactor = 1
			ik_targetl = slave
			ik_targetr = slave
		}
	]
	actors = [
		{
			name = z_modular_trg_geo_demi
			startnode = 'vocalist_start'
			anim = rush2112_outro02_demi_02
		}
	]
	cameras = [
		{
			slot = 0
			name = 'TRG_Geo_Camera_Performance_SING01'
			anim = rush2112_outro02_02_c01
		}
	]
	commands = [
	]
}
rushoutro_rush2112_outro01_016 = {
	characters = [
		{
			name = vocalist
			startnode = 'vocalist_start'
			anim = rush2112_outro02_02_a
			startframe = 12
			endframe = 131
			timefactor = 1
			ik_targetl = slave
			ik_targetr = slave
			strum = false
			fret = false
			chord = false
		}
	]
	actors = [
		{
			name = z_modular_trg_geo_rock
			startnode = 'vocalist_start'
			anim = rush2112_outro01_rock_01
		}
	]
	commands = [
	]
}
rushoutro_rush2112_outro01_027 = {
	characters = [
		{
			name = vocalist
			startnode = 'vocalist_start'
			anim = rush2112_outro02_02_a
			startframe = 12
			endframe = 131
			timefactor = 1
			ik_targetl = slave
			ik_targetr = slave
			strum = false
			fret = false
			chord = false
		}
	]
	actors = [
		{
			name = z_modular_trg_geo_rock
			startnode = 'vocalist_start'
			anim = rush2112_outro01_rock_02
		}
	]
	cameras = [
		{
			slot = 0
			name = 'TRG_Geo_Camera_Performance_SING01'
			anim = rush2112_outro01_02_c01
		}
	]
	commands = [
	]
}
rushoutro_rush2112_outro01_038 = {
	characters = [
		{
			name = vocalist
			startnode = 'vocalist_start'
			anim = rush2112_outro02_02_a
			startframe = 12
			endframe = 131
			timefactor = 1
			ik_targetl = slave
			ik_targetr = slave
			strum = false
			fret = false
			chord = false
		}
	]
	actors = [
		{
			name = z_modular_trg_geo_rock
			startnode = 'vocalist_start'
			anim = rush2112_outro01_rock_03
		}
	]
	cameras = [
		{
			slot = 0
			name = 'TRG_Geo_Camera_Performance_SING01'
			anim = rush2112_outro01_03_c01
		}
	]
	commands = [
	]
}
rushoutro_rush2112_outro02_019 = {
	charflags = [
		nsbsafe
	]
	characters = [
		{
			name = vocalist
			startnode = 'vocalist_start'
			anim = rush2112_outro02_01_a
			startframe = 137
			endframe = 245
			timefactor = 1
			ik_targetl = slave
			ik_targetr = slave
			strum = false
			fret = false
			chord = false
		}
		{
			name = guitarist
			startnode = 'vocalist_start'
			anim = rush2112_outro02_01_b
			startframe = 137
			endframe = 245
			timefactor = 1
			ik_targetl = slave
			ik_targetr = slave
			strum = false
			fret = false
			chord = false
		}
		{
			name = bassist
			startnode = 'vocalist_start'
			anim = rush2112_outro02_01_c
			startframe = 137
			endframe = 245
			timefactor = 1
			ik_targetl = slave
			ik_targetr = slave
			strum = false
			fret = false
			chord = false
		}
		{
			name = drummer
			startnode = 'vocalist_start'
			anim = rush2112_outro02_01_d
			startframe = 137
			endframe = 245
			timefactor = 1
			ik_targetl = slave
			ik_targetr = slave
		}
	]
	actors = [
		{
			name = z_modular_trg_geo_demi
			startnode = 'vocalist_start'
			anim = rush2112_outro02_demi_01
		}
	]
	cameras = [
		{
			slot = 0
			name = 'TRG_Geo_Camera_Performance_SING01'
			anim = rush2112_outro02_01_c01
		}
	]
	commands = [
	]
}

script transition_crowd_state 
	killspawnedscript \{name = crowd_playanim_spawned}
	crowd_kill_spawnscripts
	spawnscriptnow \{crowd_control}
	change_crowd_state <...>
endscript

script z_modular_creategeo 
	safecreate \{nodename = z_modular_gtr137_demi01}
	safecreate \{nodename = z_modular_ven_center_island01}
	safecreate \{nodename = z_modular_ven_center_island02}
	safekill \{nodename = z_modular_ven_anim_center_island}
endscript

script z_modular_killgeo 
	safekill \{nodename = z_modular_gtr137_demi01}
	safekill \{nodename = z_modular_ven_anim_demi_guitar}
	safekill \{nodename = z_modular_ven_center_island01}
	safekill \{nodename = z_modular_ven_center_island02}
endscript

script z_modular_createdemirock 
	safecreate \{nodename = z_modular_trg_geo_demi}
	safecreate \{nodename = z_modular_trg_geo_rock}
	safekill \{nodename = z_modular_ven_center_island02}
	safecreate \{nodename = z_modular_ven_anim_center_island}
endscript

script z_modular_createrock 
	safecreate \{nodename = z_modular_gtr137_demi01}
	safekill \{nodename = z_modular_ven_center_island02}
	safecreate \{nodename = z_modular_ven_anim_center_island}
endscript

script z_modular_killdemi 
	safekill \{nodename = z_modular_trg_geo_demi}
endscript

script use_rush_transition \{restarting = 0}
	<current_song> = none
	playlist_getcurrentsong
	if structurecontains structure = $g_rush_data <current_song>
		<song_data> = ($g_rush_data.<current_song>)
		<trans> = (<song_data>.intro)
		if ($continue_rush_set_transition != none)
			change current_transition = ($continue_rush_set_transition)
			change \{continue_rush_set_transition = none}
			return
		endif
		if (<restarting> = 1)
			return
		endif
		if (<trans> = rush_celeb_intro)
			change \{current_transition = celebintro}
			return \{true}
		endif
		change \{current_transition = rushintro}
		change common_rushintro_transition = ($<trans>)
		<new_time> = ($common_rushintro_transition.time)
		<local_default> = $default_rushintro_transition
		addparam structure_name = local_default name = time value = <new_time>
		change default_rushintro_transition = <local_default>
		return \{true}
	endif
	return \{false}
endscript
g_suppress_power_rocker_intro = 0

script use_rush_outro 
	<prev_song> = $last_song_played
	if structurecontains structure = $g_rush_data <prev_song>
		<song_data> = ($g_rush_data.<prev_song>)
		<trans> = (<song_data>.outro)
		change common_rushoutro_transition = ($<trans>)
		<new_time> = ($common_rushoutro_transition.time)
		<local_default> = $default_rushoutro_transition
		addparam structure_name = local_default name = time value = <new_time>
		change default_rushoutro_transition = <local_default>
		change \{g_suppress_power_rocker_intro = 1}
		return \{true}
	endif
	return \{false}
endscript

script ui_quest_map_choose_rush_set 
	get_savegame_from_controller controller = ($primary_controller)
	getglobaltags career_progression_tags params = rush_set_current_song savegame = <savegame>
	getglobaltags career_progression_tags params = rush_set_completed savegame = <savegame>
	if (<rush_set_current_song> > 1)
		<options> = [
			{
				func = continue_rush_set
				func_params = {song = <rush_set_current_song>}
				text = qs(0x182f0173)
			}
			{
				func = continue_rush_set
				func_params = {song = 1}
				text = qs(0xb8790f2f)
			}
		]
		formattext textname = bodytext qs(0xe1cc4cb3) a = <rush_set_current_song>
		create_dialog_box {
			no_background
			player_device = ($primary_controller)
			heading_text = qs(0xf5f741b6)
			body_text = <bodytext>
			options = <options>
			back_button_script = rush_continue_or_restart_back_script
		}
	else
		continue_rush_set song = <rush_set_current_song>
	endif
endscript

script ui_quest_map_choose_final_battle 
	generic_event_choose state = uistate_quest_band_select data = {chapter_name = <chapter_name>}
endscript

script rush_continue_or_restart_back_script 
	destroy_dialog_box
	launchevent \{type = focus
		target = current_menu}
	quest_map_add_event_handlers
	quest_map_add_helpers
endscript
continue_rush_set_transition = none

script continue_rush_set \{song = 1}
	change \{continue_rush_set_transition = fastintro}
	switch <song>
		case 1
		change \{continue_rush_set_transition = none}
		<song_array> = $g_rush_setlist
		case 2
		<song_array> = [rush2112p2 rush2112p3 rush2112p4 rush2112p5 rush2112p6 rush2112p7]
		case 3
		<song_array> = [rush2112p3 rush2112p4 rush2112p5 rush2112p6 rush2112p7]
		case 4
		<song_array> = [rush2112p4 rush2112p5 rush2112p6 rush2112p7]
		case 5
		<song_array> = [rush2112p5 rush2112p6 rush2112p7]
		case 6
		<song_array> = [rush2112p6 rush2112p7]
		case 7
		<song_array> = [rush2112p7]
		default
		scriptassert 'continue_rush_set unexpected value %i for rush_set_current_song' i = <song>
	endswitch
	playlist_clear
	playlist_addsongarray song_array = <song_array>
	<venue> = load_z_modular
	destroy_dialog_box
	if innetgame
		sendstructure callback = net_career_continue_rush_set data_to_send = {song = <song>}
	endif
	createscreenelement {
		parent = root_window
		id = questmapgiglistid
		type = descinterface
		desc = 'career_gig_select'
		alpha = 1.0
		z_priority = 50
		background_texture = gigselect_illo_guitar
		career_gig_select_action_safe_container_alpha = 0.0
		loading_special_alpha = 1.0
		loading_special_title_text = (($quest_chapter_midboss).load_screen_title)
		loading_special_body_text = (($quest_chapter_midboss).load_screen_text)
		loading_text_frame_alpha = 1.0
	}
	ui_event_add_params \{keep_ui_for_loading_screen = 1}
	create_empty_loading_screen \{use_ui_element = questmapgiglistid}
	generic_event_choose \{state = uistate_play_song}
endscript

script do_rush_scene_swap 
	<current_song> = none
	playlist_getcurrentsong
	if structurecontains structure = $g_rush_data <current_song>
		<song_data> = ($g_rush_data.<current_song>)
		scene_swap name = (<song_data>.scene)
		return \{true}
	endif
	return \{false}
endscript

script save_rush_progess \{song = 1
		complete = 0}
	get_savegame_from_controller controller = ($primary_controller)
	if console_is_net_career_client
		temp_struct = ($g_net_career_progression.career_progression_tags + {rush_set_current_song = <song>})
		appendstruct struct = g_net_career_progression field = career_progression_tags params = <temp_struct> globalstruct
	else
		setglobaltags career_progression_tags savegame = <savegame> params = {rush_set_current_song = <song>} progression = true
	endif
	if (<complete> = 1)
		if console_is_net_career_client
			temp_struct = ($g_net_career_progression.career_progression_tags + {rush_set_completed = 1})
			appendstruct struct = g_net_career_progression field = career_progression_tags params = <temp_struct> globalstruct
		else
			setglobaltags career_progression_tags savegame = <savegame> params = {rush_set_completed = 1} progression = true
		endif
	endif
endscript

script preload_rush_career_vo_stream 
	printf \{channel = sfx
		qs(0x415c56d7)}
	if (<streamname> = rush_intro)
		<streamname> = 'Rush_Intro'
	else
		<streamname> = 'none'
	endif
	if NOT ($celeb_intro_stream_id = none)
		stopsound unique_id = ($celeb_intro_stream_id)
		change \{celeb_intro_stream_id = none}
	endif
	if ($game_mode = career)
		<current_song> = none
		playlist_getcurrentsong
		if structurecontains structure = $g_rush_data <current_song>
			<song_data> = ($g_rush_data.<current_song>)
			if (<streamname> = 'Rush_Intro')
				printf \{channel = sfx
					qs(0x6530dbcd)}
			else
				<streamname> = (<song_data>.stream)
			endif
			if (<streamname> != 'none')
				formattext checksumname = localized_stream '%s' s = <streamname> addtostringlookup = true
				celeb_intro_checksum = <localized_stream>
				printf channel = sfx qs(0xc556794c) s = <celeb_intro_checksum>
				preloadstream <celeb_intro_checksum>
				change celeb_intro_stream_id = <unique_id>
				begin
				printf \{qs(0x72a82a9e)}
				if preloadstreamdone <unique_id>
					break
				endif
				wait \{1
					gameframe}
				repeat
			endif
		endif
	else
		printf \{channel = sfx
			qs(0x17ac5de7)}
	endif
endscript

script start_preloaded_rush_career_vo_stream 
	printf \{channel = sfx
		qs(0x853ea982)}
	if ($game_mode = career)
		if NOT ($celeb_intro_stream_id = none)
			audio_cutscene_get_vol_tweak_of_preloaded_stream streamname = <celeb_intro_vol_name>
			printf \{channel = sfx
				qs(0x46a1a2b7)}
			startpreloadedstream $celeb_intro_stream_id buss = encore_events forcesafepreload = 1 vol = <volumetweak> priority = 1
			change \{celeb_intro_stream_id = none}
		endif
	endif
endscript

script rush_vo_wait_to_start_next_song \{waittime = 0}
	printf qs(0xb314fe30) s = <waittime>
endscript

script stop_song_perf 
	killspawnedscript \{name = scriptevents_iterator}
	killspawnedscript \{name = cameracuts_iterator}
	killspawnedscript \{name = autocut_cameracuts_iterator}
endscript

script rush_cameracut 
endscript
