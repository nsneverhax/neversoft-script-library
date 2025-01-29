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
		Intro = rush_celeb_intro
		outro = g_rushoutro1
		Stream = 'Rush_01'
		song = 1
	}
	rush2112p2 = {
		scene = temple
		Intro = g_rushintro0
		outro = g_rushoutro2
		Stream = 'Rush_02'
		song = 2
	}
	rush2112p3 = {
		scene = main
		Intro = g_rushintro0
		outro = g_rushoutro3
		Stream = 'Rush_03'
		song = 3
	}
	rush2112p4 = {
		scene = temple
		Intro = g_rushintro0
		outro = g_rushoutro4
		Stream = 'Rush_04'
		song = 4
	}
	rush2112p5 = {
		scene = dream
		Intro = g_rushintro0
		outro = g_rushoutro5
		Stream = 'Rush_05'
		song = 5
	}
	rush2112p6 = {
		scene = main
		Intro = g_rushintro0
		outro = g_rushoutro6
		Stream = 'Rush_06'
		song = 6
	}
	rush2112p7 = {
		scene = dream
		Intro = g_rushintro0
		outro = g_rushoutro7
		song = 7
	}
}
default_rushintro_transition = {
	time = 1000
	ScriptTable = [
	]
}
common_rushintro_transition = {
}
default_rushoutro_transition = {
	time = 1000
	ScriptTable = [
	]
}
common_rushoutro_transition = {
}
g_rushintro0 = {
	time = 100
	ScriptTable = [
		{
			time = 0
			Scr = rush_cameracut
		}
		{
			time = 0
			Scr = play_intro
			params = {
				FAST = 1
			}
		}
		{
			time = 0
			Scr = do_rush_scene_swap
			params = {
			}
		}
		{
			time = 100
			Scr = Transition_StartRendering
		}
		{
			time = 100
			Scr = Change_Crowd_Looping_SFX
			params = {
				crowd_looping_state = neutral
			}
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
g_rushoutro1 = {
	time = 16890
	ScriptTable = [
		{
			time = 0
			Scr = play_win_anims
			params = {
			}
		}
		{
			time = 0
			Scr = scene_swap
			params = {
				Name = temple
			}
		}
		{
			time = 0
			Scr = save_rush_progess
			params = {
				song = 2
			}
		}
		{
			time = 1
			Scr = band_hide
			params = {
				Name = drummer
			}
		}
		{
			time = 1
			Scr = band_hide
			params = {
				Name = GUITARIST
			}
		}
		{
			time = 1
			Scr = band_hide
			params = {
				Name = BASSIST
			}
		}
		{
			time = 1
			Scr = band_hide
			params = {
				Name = vocalist
			}
		}
		{
			time = 1
			Scr = change_crowd_state
			params = {
				new_state = mellow
			}
		}
		{
			time = 3600
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_moments'
				changenow
				Name = moment01
			}
		}
		{
			time = 3600
			Scr = momentcamera_playanim
			params = {
				anim = rush2112_intro01_c02
				lock_target = moment_cam_lock_target_01
				node = 'TRG_Geo_Camera_Performance_SING01'
			}
		}
		{
			time = 3725
			Scr = CameraCuts_ApplyDOF
			params = {
				DOF = $DOF_Medium01_TOD_Manager
				time = 0.0
			}
		}
		{
			time = 11633
			Scr = momentcamera_playanim
			params = {
				anim = rush2112_intro01_c03
				lock_target = moment_cam_lock_target_01
				node = 'TRG_Geo_Camera_Performance_SING01'
			}
		}
		{
			time = 13466
			Scr = momentcamera_playanim
			params = {
				anim = rush2112_intro01_c04
				lock_target = moment_cam_lock_target_01
				node = 'TRG_Geo_Camera_Performance_SING01'
			}
		}
		{
			time = 16890
			Scr = band_unhide
			params = {
				Name = drummer
			}
		}
		{
			time = 16890
			Scr = band_unhide
			params = {
				Name = GUITARIST
			}
		}
		{
			time = 16890
			Scr = band_unhide
			params = {
				Name = BASSIST
			}
		}
		{
			time = 16890
			Scr = band_unhide
			params = {
				Name = vocalist
			}
		}
	]
}
g_rushoutro2 = {
	time = 18811
	ScriptTable = [
		{
			time = 0
			Scr = Crowd_AllPlayAnim
			params = {
				anim = Idle
			}
		}
		{
			time = 0
			Scr = scene_swap
			params = {
				Name = main
			}
		}
		{
			time = 0
			Scr = save_rush_progess
			params = {
				song = 3
			}
		}
		{
			time = 0
			Scr = band_hide
			params = {
				Name = drummer
			}
		}
		{
			time = 0
			Scr = band_hide
			params = {
				Name = GUITARIST
			}
		}
		{
			time = 0
			Scr = band_hide
			params = {
				Name = BASSIST
			}
		}
		{
			time = 0
			Scr = band_hide
			params = {
				Name = vocalist
			}
		}
		{
			time = 2433
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_moments'
				changenow
				Name = moment01
			}
		}
		{
			time = 2433
			Scr = momentcamera_playanim
			params = {
				anim = rush2112_intro02_c02
				lock_target = moment_cam_lock_target_01
				node = 'TRG_Geo_Camera_Performance_SING01'
			}
		}
		{
			time = 10066
			Scr = momentcamera_playanim
			params = {
				anim = rush2112_intro02_c03
				lock_target = moment_cam_lock_target_01
				node = 'TRG_Geo_Camera_Performance_SING01'
			}
		}
		{
			time = 18811
			Scr = band_unhide
			params = {
				Name = drummer
			}
		}
		{
			time = 18811
			Scr = band_unhide
			params = {
				Name = GUITARIST
			}
		}
		{
			time = 18811
			Scr = band_unhide
			params = {
				Name = BASSIST
			}
		}
		{
			time = 18811
			Scr = band_unhide
			params = {
				Name = vocalist
			}
		}
	]
}
g_rushoutro3 = {
	time = 24940
	ScriptTable = [
		{
			time = 0
			Scr = play_win_anims
			params = {
			}
		}
		{
			time = 0
			Scr = Crowd_AllPlayAnim
			params = {
				anim = Idle
			}
		}
		{
			time = 0
			Scr = scene_swap
			params = {
				Name = temple
			}
		}
		{
			time = 0
			Scr = save_rush_progess
			params = {
				song = 4
			}
		}
		{
			time = 0
			Scr = band_hide
			params = {
				Name = drummer
			}
		}
		{
			time = 0
			Scr = band_hide
			params = {
				Name = GUITARIST
			}
		}
		{
			time = 0
			Scr = band_hide
			params = {
				Name = BASSIST
			}
		}
		{
			time = 0
			Scr = band_hide
			params = {
				Name = vocalist
			}
		}
		{
			time = 1
			Scr = change_crowd_state
			params = {
				new_state = mellow
			}
		}
		{
			time = 125
			Scr = CameraCuts_ApplyDOF
			params = {
				DOF = $DOF_Medium01_TOD_Manager
				time = 0.0
			}
		}
		{
			time = 11200
			Scr = fadeoutandin
			params = {
				time = 1.0
				delay = 1.0
				z_priority = 0
			}
		}
		{
			time = 11800
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_moments'
				changenow
				Name = moment01
			}
		}
		{
			time = 11800
			Scr = momentcamera_playanim
			params = {
				anim = rush2112_intro03_c04
				lock_target = moment_cam_lock_target_01
				node = 'TRG_Geo_Camera_Performance_SING01'
			}
		}
		{
			time = 22900
			Scr = fadeoutandin
			params = {
				time = 1.0
				delay = 2.5
				z_priority = 0
			}
		}
		{
			time = 24940
			Scr = band_unhide
			params = {
				Name = drummer
			}
		}
		{
			time = 24940
			Scr = band_unhide
			params = {
				Name = GUITARIST
			}
		}
		{
			time = 24940
			Scr = band_unhide
			params = {
				Name = BASSIST
			}
		}
		{
			time = 24940
			Scr = band_unhide
			params = {
				Name = vocalist
			}
		}
	]
}
g_rushoutro4 = {
	time = 29776
	ScriptTable = [
		{
			time = 0
			Scr = play_win_anims
			params = {
			}
		}
		{
			time = 0
			Scr = Crowd_AllPlayAnim
			params = {
				anim = Idle
			}
		}
		{
			time = 0
			Scr = scene_swap
			params = {
				Name = dream
			}
		}
		{
			time = 0
			Scr = save_rush_progess
			params = {
				song = 5
			}
		}
		{
			time = 0
			Scr = band_hide
			params = {
				Name = drummer
			}
		}
		{
			time = 0
			Scr = band_hide
			params = {
				Name = GUITARIST
			}
		}
		{
			time = 0
			Scr = band_hide
			params = {
				Name = BASSIST
			}
		}
		{
			time = 0
			Scr = band_hide
			params = {
				Name = vocalist
			}
		}
		{
			time = 125
			Scr = CameraCuts_ApplyDOF
			params = {
				DOF = $DOF_Medium01_TOD_Manager
				time = 0.0
			}
		}
		{
			time = 8000
			Scr = fadeoutandin
			params = {
				time = 1.0
				delay = 1.0
				z_priority = 0
			}
		}
		{
			time = 8733
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_moments'
				changenow
				Name = moment01
			}
		}
		{
			time = 8733
			Scr = momentcamera_playanim
			params = {
				anim = rush2112_intro04_c02
				lock_target = moment_cam_lock_target_01
				node = 'TRG_Geo_Camera_Performance_SING01'
			}
		}
		{
			time = 8858
			Scr = CameraCuts_ApplyDOF
			params = {
				DOF = $DOF_Medium01_TOD_Manager
				time = 0.0
			}
		}
		{
			time = 15800
			Scr = fadeoutandin
			params = {
				time = 1.0
				delay = 1.0
				z_priority = 0
			}
		}
		{
			time = 16600
			Scr = momentcamera_playanim
			params = {
				anim = rush2112_intro04_c03
				lock_target = moment_cam_lock_target_01
				node = 'TRG_Geo_Camera_Performance_SING01'
			}
		}
		{
			time = 16725
			Scr = CameraCuts_ApplyDOF
			params = {
				DOF = $DOF_Medium01_TOD_Manager
				time = 0.0
			}
		}
		{
			time = 29776
			Scr = band_unhide
			params = {
				Name = drummer
			}
		}
		{
			time = 29776
			Scr = band_unhide
			params = {
				Name = GUITARIST
			}
		}
		{
			time = 29776
			Scr = band_unhide
			params = {
				Name = BASSIST
			}
		}
		{
			time = 29776
			Scr = band_unhide
			params = {
				Name = vocalist
			}
		}
	]
}
g_rushoutro5 = {
	time = 17237
	ScriptTable = [
		{
			time = 0
			Scr = play_win_anims
			params = {
			}
		}
		{
			time = 0
			Scr = Crowd_AllPlayAnim
			params = {
				anim = Idle
			}
		}
		{
			time = 0
			Scr = scene_swap
			params = {
				Name = main
			}
		}
		{
			time = 0
			Scr = save_rush_progess
			params = {
				song = 6
			}
		}
		{
			time = 0
			Scr = band_hide
			params = {
				Name = drummer
			}
		}
		{
			time = 0
			Scr = band_hide
			params = {
				Name = GUITARIST
			}
		}
		{
			time = 0
			Scr = band_hide
			params = {
				Name = BASSIST
			}
		}
		{
			time = 0
			Scr = band_hide
			params = {
				Name = vocalist
			}
		}
		{
			time = 6000
			Scr = fadeoutandin
			params = {
				time = 2.0
				delay = 1.0
				z_priority = 0
			}
		}
		{
			time = 7166
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_moments'
				changenow
				Name = moment01
			}
		}
		{
			time = 7166
			Scr = momentcamera_playanim
			params = {
				anim = rush2112_intro05_c02
				lock_target = moment_cam_lock_target_01
				node = 'TRG_Geo_Camera_Performance_SING01'
			}
		}
		{
			time = 7291
			Scr = CameraCuts_ApplyDOF
			params = {
				DOF = $DOF_Medium01_TOD_Manager
				time = 0.0
			}
		}
		{
			time = 12000
			Scr = fadeoutandin
			params = {
				time = 2.0
				delay = 1.0
				z_priority = 0
			}
		}
		{
			time = 13066
			Scr = momentcamera_playanim
			params = {
				anim = rush2112_intro05_c03
				lock_target = moment_cam_lock_target_01
				node = 'TRG_Geo_Camera_Performance_SING01'
			}
		}
		{
			time = 13191
			Scr = CameraCuts_ApplyDOF
			params = {
				DOF = $DOF_Medium01_TOD_Manager
				time = 0.0
			}
		}
	]
}
g_rushoutro6 = {
	time = 8167
	ScriptTable = [
		{
			time = 0
			Scr = play_win_anims
			params = {
			}
		}
		{
			time = 0
			Scr = Crowd_AllPlayAnim
			params = {
				anim = Idle
			}
		}
		{
			time = 0
			Scr = scene_swap
			params = {
				Name = dream
			}
		}
		{
			time = 0
			Scr = save_rush_progess
			params = {
				song = 7
			}
		}
		{
			time = 0
			Scr = band_hide
			params = {
				Name = drummer
			}
		}
		{
			time = 0
			Scr = band_hide
			params = {
				Name = GUITARIST
			}
		}
		{
			time = 0
			Scr = band_hide
			params = {
				Name = BASSIST
			}
		}
		{
			time = 0
			Scr = band_hide
			params = {
				Name = vocalist
			}
		}
		{
			time = 125
			Scr = CameraCuts_ApplyDOF
			params = {
				DOF = $DOF_Medium01_TOD_Manager
				time = 0.0
			}
		}
	]
}
g_rushoutro7 = {
	time = 29500
	ScriptTable = [
		{
			time = 0
			Scr = stop_song_perf
			params = {
			}
		}
		{
			time = 0
			Scr = play_win_anims
			params = {
			}
		}
		{
			time = 0
			Scr = Crowd_AllPlayAnim
			params = {
				anim = Idle
			}
		}
		{
			time = 0
			Scr = save_rush_progess
			params = {
				song = 1
				complete = 1
			}
		}
		{
			time = 0
			Scr = scene_swap
			params = {
				Name = main
			}
		}
		{
			time = 0
			Scr = z_modular_rush_axeguitarfx
			params = {
			}
		}
		{
			time = 0
			Scr = z_modular_rush_cavelighting
			params = {
			}
		}
		{
			time = 1
			Scr = z_modular_killgeo
			params = {
			}
		}
		{
			time = 1
			Scr = z_modular_createdemirock
			params = {
			}
		}
		{
			time = 1
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_moments'
				changenow
				Name = moment01
			}
		}
		{
			time = 1
			Scr = bandmanager_hideinstrument
			params = {
				Name = vocalist
			}
		}
		{
			time = 1
			Scr = bandmanager_hideinstrument
			params = {
				Name = GUITARIST
			}
		}
		{
			time = 1
			Scr = bandmanager_hideinstrument
			params = {
				Name = BASSIST
			}
		}
		{
			time = 1
			Scr = bandmanager_hideinstrument
			params = {
				Name = drummer
			}
		}
		{
			time = 1
			Scr = band_playclip
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
			Scr = band_playclip
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
			Scr = start_preloaded_encore_event_stream
		}
		{
			time = 500
			Scr = CameraCuts_ApplyDOF
			params = {
				DOF = $DOF_Medium01_TOD_Manager
				time = 0.0
			}
		}
		{
			time = 3333
			Scr = band_playclip
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
			Scr = band_playclip
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
			Scr = band_playclip
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
			Scr = band_playclip
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
			Scr = scene_swap
			params = {
				Name = dream
				sync = 1
			}
		}
		{
			time = 13100
			Scr = bandmanager_setikchainstrength
			params = {
				Name = drummer
				Chain = Bone_IK_Hand_Guitar_R
				Strength = 0
			}
		}
		{
			time = 13100
			Scr = bandmanager_setikchainstrength
			params = {
				Name = drummer
				Chain = Bone_IK_Hand_Slave_R
				Strength = 0
			}
		}
		{
			time = 13100
			Scr = bandmanager_setikchainstrength
			params = {
				Name = drummer
				Chain = Bone_IK_Hand_Guitar_L
				Strength = 0
			}
		}
		{
			time = 13100
			Scr = bandmanager_setikchainstrength
			params = {
				Name = drummer
				Chain = Bone_IK_Hand_Slave_L
				Strength = 0
			}
		}
		{
			time = 13100
			Scr = band_playclip
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
			Scr = band_playclip
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
			Scr = z_modular_rush_dream_guitarfx
			params = {
			}
		}
		{
			time = 19333
			Scr = band_playclip
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
			Scr = fadeoutandin
			params = {
				time = 2.0
				delay = 1.0
				z_priority = 0
			}
		}
		{
			time = 29500
			Scr = z_modular_rush_killwind
			params = {
			}
		}
		{
			time = 29500
			Scr = z_modular_killdemi
			params = {
			}
		}
		{
			time = 29500
			Scr = bandmanager_unhideinstrument
			params = {
				Name = vocalist
			}
		}
		{
			time = 29500
			Scr = bandmanager_unhideinstrument
			params = {
				Name = GUITARIST
			}
		}
		{
			time = 29500
			Scr = bandmanager_unhideinstrument
			params = {
				Name = BASSIST
			}
		}
		{
			time = 29500
			Scr = bandmanager_unhideinstrument
			params = {
				Name = drummer
			}
		}
	]
}
rushoutro_rush2112_outro01_011 = {
	characters = [
		{
			Name = vocalist
			startnode = 'vocalist_start'
			anim = rush2112_outro02_02_a
			startframe = 12
			endframe = 131
			timefactor = 1
			ik_targetl = slave
			ik_targetr = slave
			strum = FALSE
			fret = FALSE
			chord = FALSE
		}
	]
	actors = [
		{
			Name = z_modular_trg_geo_demi
			startnode = 'vocalist_start'
			anim = rush2112_outro01_demi_01
		}
	]
	cameras = [
		{
			slot = 0
			Name = 'TRG_Geo_Camera_Performance_SING01'
			anim = rush2112_outro01_01_c01
		}
	]
	commands = [
	]
}
rushoutro_rush2112_outro01_022 = {
	characters = [
		{
			Name = vocalist
			startnode = 'vocalist_start'
			anim = rush2112_outro02_02_a
			startframe = 12
			endframe = 131
			timefactor = 1
			ik_targetl = slave
			ik_targetr = slave
			strum = FALSE
			fret = FALSE
			chord = FALSE
		}
	]
	actors = [
		{
			Name = z_modular_trg_geo_demi
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
			Name = vocalist
			startnode = 'vocalist_start'
			anim = rush2112_outro02_02_a
			startframe = 12
			endframe = 131
			timefactor = 1
			ik_targetl = slave
			ik_targetr = slave
			strum = FALSE
			fret = FALSE
			chord = FALSE
		}
	]
	actors = [
		{
			Name = z_modular_trg_geo_demi
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
			Name = vocalist
			startnode = 'vocalist_start'
			anim = rush2112_outro02_ex_a
			startframe = 10
			endframe = 89
			timefactor = 1
			ik_targetl = slave
			ik_targetr = slave
			strum = FALSE
			fret = FALSE
			chord = FALSE
		}
		{
			Name = GUITARIST
			startnode = 'vocalist_start'
			anim = rush2112_outro02_ex_b
			startframe = 10
			endframe = 89
			timefactor = 1
			ik_targetl = slave
			ik_targetr = slave
			strum = FALSE
			fret = FALSE
			chord = FALSE
		}
		{
			Name = BASSIST
			startnode = 'vocalist_start'
			anim = rush2112_outro02_ex_c
			startframe = 10
			endframe = 89
			timefactor = 1
			ik_targetl = slave
			ik_targetr = slave
			strum = FALSE
			fret = FALSE
			chord = FALSE
		}
		{
			Name = drummer
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
			Name = 'TRG_Geo_Camera_Performance_SING01'
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
			Name = vocalist
			startnode = 'vocalist_start'
			anim = rush2112_outro02_02_a
			startframe = 6
			endframe = 311
			timefactor = 1
			ik_targetl = slave
			ik_targetr = slave
			strum = FALSE
			fret = FALSE
			chord = FALSE
		}
		{
			Name = GUITARIST
			startnode = 'vocalist_start'
			anim = rush2112_outro02_02_b
			startframe = 6
			endframe = 311
			timefactor = 1
			ik_targetl = slave
			ik_targetr = slave
			strum = FALSE
			fret = FALSE
			chord = FALSE
		}
		{
			Name = BASSIST
			startnode = 'vocalist_start'
			anim = rush2112_outro02_02_c
			startframe = 6
			endframe = 311
			timefactor = 1
			ik_targetl = slave
			ik_targetr = slave
			strum = FALSE
			fret = FALSE
			chord = FALSE
		}
		{
			Name = drummer
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
			Name = z_modular_trg_geo_demi
			startnode = 'vocalist_start'
			anim = rush2112_outro02_demi_02
		}
	]
	cameras = [
		{
			slot = 0
			Name = 'TRG_Geo_Camera_Performance_SING01'
			anim = rush2112_outro02_02_c01
		}
	]
	commands = [
	]
}
rushoutro_rush2112_outro01_016 = {
	characters = [
		{
			Name = vocalist
			startnode = 'vocalist_start'
			anim = rush2112_outro02_02_a
			startframe = 12
			endframe = 131
			timefactor = 1
			ik_targetl = slave
			ik_targetr = slave
			strum = FALSE
			fret = FALSE
			chord = FALSE
		}
	]
	actors = [
		{
			Name = z_modular_trg_geo_rock
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
			Name = vocalist
			startnode = 'vocalist_start'
			anim = rush2112_outro02_02_a
			startframe = 12
			endframe = 131
			timefactor = 1
			ik_targetl = slave
			ik_targetr = slave
			strum = FALSE
			fret = FALSE
			chord = FALSE
		}
	]
	actors = [
		{
			Name = z_modular_trg_geo_rock
			startnode = 'vocalist_start'
			anim = rush2112_outro01_rock_02
		}
	]
	cameras = [
		{
			slot = 0
			Name = 'TRG_Geo_Camera_Performance_SING01'
			anim = rush2112_outro01_02_c01
		}
	]
	commands = [
	]
}
rushoutro_rush2112_outro01_038 = {
	characters = [
		{
			Name = vocalist
			startnode = 'vocalist_start'
			anim = rush2112_outro02_02_a
			startframe = 12
			endframe = 131
			timefactor = 1
			ik_targetl = slave
			ik_targetr = slave
			strum = FALSE
			fret = FALSE
			chord = FALSE
		}
	]
	actors = [
		{
			Name = z_modular_trg_geo_rock
			startnode = 'vocalist_start'
			anim = rush2112_outro01_rock_03
		}
	]
	cameras = [
		{
			slot = 0
			Name = 'TRG_Geo_Camera_Performance_SING01'
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
			Name = vocalist
			startnode = 'vocalist_start'
			anim = rush2112_outro02_01_a
			startframe = 137
			endframe = 245
			timefactor = 1
			ik_targetl = slave
			ik_targetr = slave
			strum = FALSE
			fret = FALSE
			chord = FALSE
		}
		{
			Name = GUITARIST
			startnode = 'vocalist_start'
			anim = rush2112_outro02_01_b
			startframe = 137
			endframe = 245
			timefactor = 1
			ik_targetl = slave
			ik_targetr = slave
			strum = FALSE
			fret = FALSE
			chord = FALSE
		}
		{
			Name = BASSIST
			startnode = 'vocalist_start'
			anim = rush2112_outro02_01_c
			startframe = 137
			endframe = 245
			timefactor = 1
			ik_targetl = slave
			ik_targetr = slave
			strum = FALSE
			fret = FALSE
			chord = FALSE
		}
		{
			Name = drummer
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
			Name = z_modular_trg_geo_demi
			startnode = 'vocalist_start'
			anim = rush2112_outro02_demi_01
		}
	]
	cameras = [
		{
			slot = 0
			Name = 'TRG_Geo_Camera_Performance_SING01'
			anim = rush2112_outro02_01_c01
		}
	]
	commands = [
	]
}

script transition_crowd_state 
	KillSpawnedScript \{Name = crowd_playanim_spawned}
	crowd_kill_spawnscripts
	SpawnScriptNow \{crowd_control}
	change_crowd_state <...>
endscript

script z_modular_creategeo 
	SafeCreate \{nodeName = z_modular_gtr137_demi01}
	SafeCreate \{nodeName = z_modular_ven_center_island01}
	SafeCreate \{nodeName = z_modular_ven_center_island02}
	SafeKill \{nodeName = z_modular_ven_anim_center_island}
endscript

script z_modular_killgeo 
	SafeKill \{nodeName = z_modular_gtr137_demi01}
	SafeKill \{nodeName = z_modular_ven_anim_demi_guitar}
	SafeKill \{nodeName = z_modular_ven_center_island01}
	SafeKill \{nodeName = z_modular_ven_center_island02}
endscript

script z_modular_createdemirock 
	SafeCreate \{nodeName = z_modular_trg_geo_demi}
	SafeCreate \{nodeName = z_modular_trg_geo_rock}
	SafeKill \{nodeName = z_modular_ven_center_island02}
	SafeCreate \{nodeName = z_modular_ven_anim_center_island}
endscript

script z_modular_createrock 
	SafeCreate \{nodeName = z_modular_gtr137_demi01}
	SafeKill \{nodeName = z_modular_ven_center_island02}
	SafeCreate \{nodeName = z_modular_ven_anim_center_island}
endscript

script z_modular_killdemi 
	SafeKill \{nodeName = z_modular_trg_geo_demi}
endscript

script use_rush_transition \{restarting = 0}
	<current_song> = None
	playlist_getcurrentsong
	if StructureContains structure = $g_rush_data <current_song>
		<song_data> = ($g_rush_data.<current_song>)
		<trans> = (<song_data>.Intro)
		if ($continue_rush_set_transition != None)
			Change current_transition = ($continue_rush_set_transition)
			Change \{continue_rush_set_transition = None}
			return
		endif
		if (<restarting> = 1)
			return
		endif
		if (<trans> = rush_celeb_intro)
			Change \{current_transition = celebintro}
			return \{true}
		endif
		Change \{current_transition = rushintro}
		Change common_rushintro_transition = ($<trans>)
		<new_time> = ($common_rushintro_transition.time)
		<local_default> = $default_rushintro_transition
		AddParam structure_name = local_default Name = time value = <new_time>
		Change default_rushintro_transition = <local_default>
		return \{true}
	endif
	return \{FALSE}
endscript
g_suppress_power_rocker_intro = 0

script use_rush_outro 
	<prev_song> = $last_song_played
	if StructureContains structure = $g_rush_data <prev_song>
		<song_data> = ($g_rush_data.<prev_song>)
		<trans> = (<song_data>.outro)
		Change common_rushoutro_transition = ($<trans>)
		<new_time> = ($common_rushoutro_transition.time)
		<local_default> = $default_rushoutro_transition
		AddParam structure_name = local_default Name = time value = <new_time>
		Change default_rushoutro_transition = <local_default>
		Change \{g_suppress_power_rocker_intro = 1}
		return \{true}
	endif
	return \{FALSE}
endscript

script ui_quest_map_choose_rush_set 
	get_savegame_from_controller controller = ($primary_controller)
	GetGlobalTags career_progression_tags params = rush_set_current_song savegame = <savegame>
	GetGlobalTags career_progression_tags params = rush_set_completed savegame = <savegame>
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
		formatText TextName = bodytext qs(0xe1cc4cb3) a = <rush_set_current_song>
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
	LaunchEvent \{Type = focus
		target = current_menu}
	quest_map_add_event_handlers
	quest_map_add_helpers
endscript
continue_rush_set_transition = None

script continue_rush_set \{song = 1}
	Change \{continue_rush_set_transition = fastintro}
	switch <song>
		case 1
		Change \{continue_rush_set_transition = None}
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
		ScriptAssert 'continue_rush_set unexpected value %i for rush_set_current_song' i = <song>
	endswitch
	playlist_clear
	playlist_addsongarray song_array = <song_array>
	<venue> = load_z_modular
	destroy_dialog_box
	if InNetGame
		SendStructure callback = net_career_continue_rush_set data_to_send = {song = <song>}
	endif
	CreateScreenElement {
		parent = root_window
		id = questmapgiglistid
		Type = descinterface
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
	<current_song> = None
	playlist_getcurrentsong
	if StructureContains structure = $g_rush_data <current_song>
		<song_data> = ($g_rush_data.<current_song>)
		scene_swap Name = (<song_data>.scene)
		return \{true}
	endif
	return \{FALSE}
endscript

script save_rush_progess \{song = 1
		complete = 0}
	get_savegame_from_controller controller = ($primary_controller)
	if console_is_net_career_client
		temp_struct = ($g_net_career_progression.career_progression_tags + {rush_set_current_song = <song>})
		appendstruct struct = g_net_career_progression Field = career_progression_tags params = <temp_struct> globalstruct
	else
		SetGlobalTags career_progression_tags savegame = <savegame> params = {rush_set_current_song = <song>} Progression = true
	endif
	if (<complete> = 1)
		if console_is_net_career_client
			temp_struct = ($g_net_career_progression.career_progression_tags + {rush_set_completed = 1})
			appendstruct struct = g_net_career_progression Field = career_progression_tags params = <temp_struct> globalstruct
		else
			SetGlobalTags career_progression_tags savegame = <savegame> params = {rush_set_completed = 1} Progression = true
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
	if NOT ($celeb_intro_stream_id = None)
		stopsound unique_id = ($celeb_intro_stream_id)
		Change \{celeb_intro_stream_id = None}
	endif
	if ($game_mode = career)
		<current_song> = None
		playlist_getcurrentsong
		if StructureContains structure = $g_rush_data <current_song>
			<song_data> = ($g_rush_data.<current_song>)
			if (<streamname> = 'Rush_Intro')
				printf \{channel = sfx
					qs(0x6530dbcd)}
			else
				<streamname> = (<song_data>.Stream)
			endif
			if (<streamname> != 'none')
				formatText checksumName = localized_stream '%s' s = <streamname> AddToStringLookup = true
				celeb_intro_checksum = <localized_stream>
				printf channel = sfx qs(0xc556794c) s = <celeb_intro_checksum>
				PreloadStream <celeb_intro_checksum>
				Change celeb_intro_stream_id = <unique_id>
				begin
				printf \{qs(0x72a82a9e)}
				if PreloadStreamDone <unique_id>
					break
				endif
				Wait \{1
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
		if NOT ($celeb_intro_stream_id = None)
			audio_cutscene_get_vol_tweak_of_preloaded_stream streamname = <celeb_intro_vol_name>
			printf \{channel = sfx
				qs(0x46a1a2b7)}
			StartPreLoadedStream $celeb_intro_stream_id buss = Encore_Events forcesafepreload = 1 vol = <volumetweak> Priority = 1
			Change \{celeb_intro_stream_id = None}
		endif
	endif
endscript

script rush_vo_wait_to_start_next_song \{waitTime = 0}
	printf qs(0xb314fe30) s = <waitTime>
endscript

script stop_song_perf 
	KillSpawnedScript \{Name = scriptevents_iterator}
	KillSpawnedScript \{Name = cameracuts_iterator}
	KillSpawnedScript \{Name = autocut_cameracuts_iterator}
endscript

script rush_cameracut 
endscript
