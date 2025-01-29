transition_playing = FALSE
current_playing_transition = None
finalbandintro_transition_playing = 0
skipping_jimmy_encore_anim = 0
metallica_intro_vo_order = [
]
metallica_intro_vo_index = 0
metallica_intro_vo_current_struct = {
}
careerintro_current_slomo = 1.0
Transition_Types = {
	careerintro = {
		textnl = 'careerintro'
	}
	Intro = {
		textnl = 'intro'
	}
	fastintro = {
		textnl = 'fastintro'
	}
	fastintrotutorial = {
		textnl = 'fastintrotutorial'
	}
	practice = {
		textnl = 'practice'
	}
	preencore = {
		textnl = 'preencore'
	}
	ENCORE = {
		textnl = 'encore'
	}
	restartencore = {
		textnl = 'restartencore'
	}
	preboss = {
		textnl = 'preboss'
	}
	boss = {
		textnl = 'boss'
	}
	restartboss = {
		textnl = 'restartboss'
	}
	songwon = {
		textnl = 'songwon'
	}
	songlost = {
		textnl = 'songlost'
	}
	loading = {
		textnl = 'loading'
	}
	loadingintro = {
		textnl = 'loadingintro'
	}
	finalbandintro = {
		textnl = 'finalbandintro'
	}
	finalbandoutro = {
		textnl = 'finalbandoutro'
	}
	metallicavointro = {
		textnl = 'metallicavointro'
	}
}
celeb_intro_transitions = [
	{
		Intro = 'intro_lemmy'
		song = aceofspades
		part = no_replacements
		debug_preview_in_venue = load_z_tushino
	}
	{
		Intro = 'intro_kingdiamond'
		song = evil
		part = no_replacements
		debug_preview_in_venue = load_z_tushino
	}
]
Default_Immediate_Transition = {
	time = 0
	ScriptTable = [
	]
}
Common_Immediate_Transition = {
	ScriptTable = [
		{
			time = 0
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras'
				changenow
			}
		}
		{
			time = 0
			Scr = bandmanager_setplayingintroanims
		}
		{
			time = 100
			Scr = Transition_StartRendering
		}
	]
}
Default_FastIntro_Transition = {
	time = 3000
	ScriptTable = [
	]
}
Common_FastIntro_Transition = {
	ScriptTable = [
		{
			time = 0
			Scr = Transition_StopRendering
		}
		{
			time = 0
			Scr = bandmanager_setplayingintroanims
		}
		{
			time = 0
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_fastintro'
				changenow
			}
		}
		{
			time = 0
			Scr = play_intro
			params = {
				FAST
			}
		}
		{
			time = 0
			Scr = spirit_fadein
			params = {
			}
		}
		{
			time = 100
			Scr = gh_sfx_intro_warmup_fast
		}
		{
			time = 0
			Scr = band_playtransitionidles
			params = {
				from_restart = true
			}
		}
		{
			time = 100
			Scr = Transition_StartRendering
		}
		{
			time = 100
			Scr = enable_tutorial_pause
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
default_fastintrotutorial_transition = {
	time = 3000
	ScriptTable = [
	]
}
common_fastintrotutorial_transition = {
	ScriptTable = [
		{
			time = 0
			Scr = Transition_StopRendering
		}
		{
			time = 0
			Scr = bandmanager_setplayingintroanims
		}
		{
			time = 0
			Scr = training_setup_camera
			params = {
				Name = CameraCutCam
			}
		}
		{
			time = 0
			Scr = play_intro
			params = {
				FAST
			}
		}
		{
			time = 0
			Scr = band_playtransitionidles
		}
		{
			time = 100
			Scr = Transition_StartRendering
		}
		{
			time = 100
			Scr = enable_tutorial_pause
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
Default_RestartEncore_Transition = {
	time = 3000
	ScriptTable = [
	]
}
Common_RestartEncore_Transition = {
	ScriptTable = [
		{
			time = 0
			Scr = Transition_StopRendering
		}
		{
			time = 0
			Scr = bandmanager_setplayingintroanims
		}
		{
			time = 0
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_fastintro'
				changenow
			}
		}
		{
			time = 0
			Scr = play_intro
			params = {
				FAST
			}
		}
		{
			time = 0
			Scr = band_playtransitionidles
			params = {
				from_restart = true
			}
		}
		{
			time = 100
			Scr = Transition_StartRendering
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
Default_RestartBoss_Transition = {
	time = 3000
	ScriptTable = [
	]
}
Common_RestartBoss_Transition = {
	ScriptTable = [
		{
			time = 0
			Scr = Transition_StopRendering
		}
		{
			time = 0
			Scr = bandmanager_setplayingintroanims
		}
		{
			time = 0
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_fastintro'
				changenow
			}
		}
		{
			time = 0
			Scr = play_intro
			params = {
				FAST
			}
		}
		{
			time = 0
			Scr = band_playtransitionidles
		}
		{
			time = 100
			Scr = Transition_StartRendering
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
Default_Practice_Transition = {
	time = 5000
	ScriptTable = [
	]
}
Common_Practice_Transition = {
	ScriptTable = [
		{
			time = 0
			Scr = Transition_StopRendering
		}
		{
			time = 0
			Scr = bandmanager_setplayingintroanims
		}
		{
			time = 0
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_fastintro'
				changenow
			}
		}
		{
			time = 0
			Scr = play_intro
			params = {
				practice
			}
		}
		{
			time = 100
			Scr = Transition_StartRendering
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
Default_Intro_Transition = {
	time = 19500
	ScriptTable = [
	]
}
Common_Intro_Transition = {
	ScriptTable = [
		{
			time = 0
			Scr = start_preloaded_celeb_intro_stream
		}
		{
			time = 0
			Scr = Transition_StopRendering
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
			Scr = Transition_CameraCut
			params = {
				changenow
			}
		}
		{
			time = 0
			Scr = play_intro
			params = {
			}
		}
		{
			time = 0
			Scr = play_intro_anims
			params = {
			}
		}
		{
			time = 100
			Scr = Transition_StartRendering
		}
		{
			time = 100
			Scr = GH_SFX_Intro_WarmUp
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
default_finalbandintro_transition = {
	time = 20000
	ScriptTable = [
	]
}
common_finalbandintro_transition = {
	ScriptTable = [
		{
			time = 0
			Scr = start_preloaded_celeb_intro_stream
		}
		{
			time = 0
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_finalbandintro'
				changenow
			}
		}
		{
			time = 60
			Scr = Transition_StartRendering
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
Default_PreEncore_Transition = {
	time = 10000
	ScriptTable = [
		{
			time = 0
			Scr = Change_Crowd_Looping_SFX
			params = {
				crowd_looping_state = good
			}
		}
	]
}
Common_PreEncore_Transition = {
	ScriptTable = [
		{
			time = 0
			Scr = play_win_anims
			params = {
			}
		}
		{
			time = 0
			Scr = kill_gem_scroller
			params = {
				Type = outro
				kill_cameracuts_iterator
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
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_win'
				changenow
			}
		}
		{
			time = 0
			Scr = Change_Crowd_Looping_SFX
			params = {
				crowd_looping_state = good
			}
		}
		{
			time = 10000
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_no_band'
				changenow
			}
		}
	]
	EndWithDefaultCamera
}
Default_Encore_Transition = {
	time = 5000
	ScriptTable = [
	]
}
Common_Encore_Transition = {
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
			Scr = start_preloaded_encore_event_stream
		}
		{
			time = 0
			Scr = Transition_StopRendering
		}
		{
			time = 0
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_encore'
				changenow
			}
		}
		{
			time = 0
			Scr = play_intro
			params = {
			}
		}
		{
			time = 100
			Scr = Transition_StartRendering
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
Default_PreBoss_Transition = {
	time = 10000
	ScriptTable = [
	]
}
Common_PreBoss_Transition = {
	ScriptTable = [
		{
			time = 0
			Scr = play_win_anims
			params = {
			}
		}
		{
			time = 0
			Scr = kill_gem_scroller
			params = {
				Type = outro
				kill_cameracuts_iterator
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
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_preboss'
				changenow
			}
		}
	]
	EndWithDefaultCamera
}
Default_Boss_Transition = {
	time = 8000
	ScriptTable = [
	]
}
Common_Boss_Transition = {
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
			Scr = Transition_StopRendering
		}
		{
			time = 0
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_boss'
				changenow
			}
		}
		{
			time = 0
			Scr = play_intro
			params = {
			}
		}
		{
			time = 0
			Scr = play_intro_anims
			params = {
			}
		}
		{
			time = 100
			Scr = Transition_StartRendering
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
Default_SongWon_Transition = {
	time = 7500
	ScriptTable = [
	]
}
Common_SongWon_Transition = {
	ScriptTable = [
		{
			time = 0
			Scr = play_win_anims
			params = {
			}
		}
		{
			time = 0
			Scr = kill_gem_scroller
			params = {
				Type = outro
				kill_cameracuts_iterator
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
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_win'
				changenow
			}
		}
	]
	EndWithDefaultCamera
}
Default_SongLost_Transition = {
	time = 8000
	ScriptTable = [
	]
}
Common_SongLost_Transition = {
	ScriptTable = [
		{
			time = 0
			Scr = play_lose_anims
			params = {
			}
		}
		{
			time = 0
			Scr = Change_Crowd_Looping_SFX
			params = {
				crowd_looping_state = bad
			}
		}
		{
			time = 0
			Scr = kill_gem_scroller
			params = {
				Type = outro
				kill_cameracuts_iterator
				song_failed_pitch_streams = 1
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
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_lose'
				changenow
			}
		}
	]
	EndWithDefaultCamera
}
default_finalbandoutro_transition = {
	time = 10000
	ScriptTable = [
	]
}
common_finalbandoutro_transition = {
	ScriptTable = [
		{
			time = 0
			Scr = kill_gem_scroller
			params = {
				Type = outro
				kill_cameracuts_iterator
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
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_finalbandoutro'
				changenow
			}
		}
		{
			time = 0
			Scr = start_preloaded_finalbandoutro_stream
		}
	]
	EndWithDefaultCamera
}
default_loading_transition = {
	time = 10000
	ScriptTable = [
	]
}
common_loading_transition = {
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
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_no_band'
				changenow
			}
		}
		{
			time = 0
			Scr = createinvenueloadingscreen
			params = {
			}
		}
		{
			time = 9900
			Scr = pauseinvenueloadingscreen
			params = {
			}
		}
	]
}
default_loadingintro_transition = {
	time = 3000
	ScriptTable = [
	]
}
common_loadingintro_transition = {
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
			Scr = bandmanager_setplayingintroanims
		}
		{
			time = 0
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_fastintro'
				changenow
			}
		}
		{
			time = 0
			Scr = play_intro
			params = {
				FAST
			}
		}
		{
			time = 0
			Scr = band_playtransitionidles
		}
		{
			time = 100
			Scr = Transition_StartRendering
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
override_intro_lemmy_transition = {
	time = 10500
	ScriptTable = [
		{
			time = 1
			Scr = band_playtransitionidles
		}
		{
			time = 1
			Scr = lemmy_introfx
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
			Scr = transition_playsimpleanim
			params = {
				Name = vocalist
				anim = s_lemmy_intro_aceofspades
			}
		}
		{
			time = 1
			Scr = specialcamera_playanim
			params = {
				Obj = 'TRG_Geo_Camera_Performance_SING01'
				anim = s_lemmy_intro_aceofspades_c01
			}
		}
		{
			time = 1
			Scr = transition_changeik
			params = {
				Name = vocalist
				Enabled = FALSE
			}
		}
		{
			time = 10500
			Scr = transition_changeik
			params = {
				Name = vocalist
				Enabled = true
			}
		}
		{
			time = 10500
			Scr = band_unhide
			params = {
				Name = GUITARIST
			}
		}
		{
			time = 10500
			Scr = lemmy_introfx_kill
		}
	]
}
override_intro_kingdiamond_transition = {
	time = 13200
	ScriptTable = [
		{
			time = 1
			Scr = band_playtransitionidles
		}
		{
			time = 1
			Scr = kingdiamond_introfx
		}
		{
			time = 1
			Scr = transition_playsimpleanim
			params = {
				Name = vocalist
				anim = s_kingd_intro_evil
			}
		}
		{
			time = 1
			Scr = specialcamera_playanim
			params = {
				Obj = 'TRG_Geo_Camera_Performance_SING01'
				anim = s_kingd_intro_evil_c01
			}
		}
		{
			time = 1
			Scr = transition_changeik
			params = {
				Name = vocalist
				Enabled = FALSE
			}
		}
		{
			time = 13200
			Scr = transition_changeik
			params = {
				Name = vocalist
				Enabled = true
			}
		}
		{
			time = 13200
			Scr = kingdiamond_introfx_kill
		}
	]
}

script play_metallica_intro_slomo_anims 
	Band_PlayIdle \{Name = GUITARIST
		restart
		no_wait}
	Band_PlayIdle \{Name = BASSIST
		restart
		no_wait}
	Band_PlayIdle \{Name = vocalist
		restart
		no_wait}
	Band_PlayIdle \{Name = drummer
		restart
		no_wait}
	KillSpawnedScript \{Name = band_movetostartnode}
	band_playclip \{clip = metallica_intro_underground_clip}
endscript
metallica_intro_slomo_clip = {
	anims = {
		vocalist = sbdg_slowmo_introtest_s
		GUITARIST = sbdg_slowmo_introtest_g
		BASSIST = sbdg_slowmo_introtest_b
		drummer = sbdg_slowmo_introtest_d
	}
	startnodes = {
		vocalist = 'drummer_start'
		GUITARIST = 'drummer_start'
		BASSIST = 'drummer_start'
		drummer = 'drummer_start'
	}
	arms = {
		vocalist = {
			ik_targetl = slave
			ik_targetr = slave
			strum = OFF
			fret = OFF
			chord = OFF
		}
		GUITARIST = {
			ik_targetl = slave
			ik_targetr = slave
			strum = OFF
			fret = OFF
			chord = OFF
		}
		BASSIST = {
			ik_targetl = slave
			ik_targetr = slave
			strum = OFF
			fret = OFF
			chord = OFF
		}
		drummer = {
			ik_targetl = slave
			ik_targetr = slave
			strum = OFF
			fret = OFF
			chord = OFF
		}
	}
	cameras = [
		{
			Name = 'TRG_Geo_Camera_Performance_DRUM01'
			anim = sbdg_slowmo_introtest_c01
			weight = 1
		}
		{
			Name = 'TRG_Geo_Camera_Performance_DRUM01'
			anim = sbdg_slowmo_introtest_c02
			weight = 1
		}
		{
			Name = 'TRG_Geo_Camera_Performance_DRUM01'
			anim = sbdg_slowmo_introtest_c01
			weight = 1
		}
		{
			Name = 'TRG_Geo_Camera_Performance_DRUM01'
			anim = sbdg_slowmo_introtest_c03
			weight = 1
		}
		{
			Name = 'TRG_Geo_Camera_Performance_DRUM01'
			anim = sbdg_slowmo_introtest_c01
			weight = 1
		}
	]
}
metallica_intro_underground_clip = {
	anims = {
		vocalist = sbdg_slowmo_introtest_s_understage
		GUITARIST = sbdg_slowmo_introtest_g_understage
		BASSIST = sbdg_slowmo_introtest_b_understage
		drummer = sbdg_slowmo_introtest_d_understage
	}
	startnodes = {
		vocalist = 'drummer_start'
		GUITARIST = 'drummer_start'
		BASSIST = 'drummer_start'
		drummer = 'drummer_start'
	}
	arms = {
		vocalist = {
			ik_targetl = slave
			ik_targetr = slave
			strum = OFF
			fret = OFF
			chord = OFF
		}
		GUITARIST = {
			ik_targetl = slave
			ik_targetr = slave
			strum = OFF
			fret = OFF
			chord = OFF
		}
		BASSIST = {
			ik_targetl = slave
			ik_targetr = slave
			strum = OFF
			fret = OFF
			chord = OFF
		}
		drummer = {
			ik_targetl = slave
			ik_targetr = slave
			strum = OFF
			fret = OFF
			chord = OFF
		}
	}
}

script z_forum_camera_careerintro 
	printf \{qs(0x47761f37)}
	tod_proxim_apply_careerintrofx
	SpawnScriptNow \{careerintro_introcamsnapshots}
	kill \{prefix = z_forum_gfx_fx_careerintrosunflare02
		noprefixwarning}
	create \{prefix = z_forum_gfx_fx_careerintrosunflare02
		noprefixwarning}
	SafeCreate \{nodeName = z_forum_gfx_fx_careerintro_drumlh}
	CameraCuts_CalcTime
	CCam_DoMorph \{LockTo = World
		Pos = (16.696894, 13.436276, -23.963196)
		Quat = (0.184926, -0.262795, 0.051716)
		FOV = 72.0}
	CCam_DoMorph \{LockTo = World
		Pos = (17.176004, 10.404304, -24.754778)
		Quat = (0.142083, -0.26486, 0.039807998)
		FOV = 72.0
		time = 5.72}
	CCam_WaitMorph
	printf \{qs(0x44b53446)}
	LightShow_SetTime \{time = 0}
	LightShow_PlaySnapshot \{Name = careerintro_cut1_02
		UseSnapshotPositions = true
		save = true}
	SafeCreate \{nodeName = z_forum_gfx_fx_careerintro_frontsmoke_01}
	SafeCreate \{nodeName = z_forum_gfx_careerintro_dust_01}
	SafeCreate \{nodeName = z_forum_gfx_fx_oneintro2_james_lh_06}
	SafeCreate \{nodeName = z_forum_gfx_careerintro_smoke_01}
	kill \{prefix = z_forum_gfx_fx_party
		noprefixwarning}
	create \{prefix = z_forum_gfx_fx_careerintrosunflare
		noprefixwarning}
	tod_proxim_apply_careerintro_cut1_fx
	enablelight \{Name = z_forum_gfx_careerintro_pyrolight_front_01}
	setlightintensity \{Name = z_forum_gfx_careerintro_pyrolight_front_01
		Intensity = 1.1}
	enablelight \{Name = z_forum_gfx_careerintro_pyrolight_01}
	setlightintensity \{Name = z_forum_gfx_careerintro_pyrolight_01
		Intensity = 0}
	hide_glitch
	CCam_DoMorph \{LockTo = moment_cam_lock_target_01
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
		time = 0}
	CCam_WaitMorph
	Wait \{10.03
		Seconds
		ignoreslomo}
	printf \{qs(0xaf1f7cfb)}
	tod_proxim_apply_careerintro_02_fx
	SafeKill \{nodeName = z_forum_js_walkway_pipes_intro}
	SafeKill \{nodeName = z_forum_gfx_fx_careerintro_frontsmoke_01}
	LightShow_PlaySnapshot \{Name = careerintro_01
		UseSnapshotPositions = true
		save = true}
	enablelight \{Name = z_forum_gfx_careerintro_pyrolight_01}
	SafeKill \{nodeName = z_forum_gfx_fx_careerintro_drumlh}
	setlightintensity \{Name = z_forum_gfx_careerintro_pyrolight_01
		Intensity = 2}
	setlightintensity \{Name = z_forum_gfx_careerintro_pyrolight_front_01
		Intensity = 0}
	hide_glitch
	CCam_DoMorph \{LockTo = moment_cam_lock_target_02
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
		time = 0}
	CCam_WaitMorph
	Wait \{9.89
		Seconds
		ignoreslomo}
	printf \{qs(0xf6794490)}
	LightShow_PlaySnapshot \{Name = careerintro_dark_02
		UseSnapshotPositions = true
		save = true}
	setlightintensity \{Name = z_forum_gfx_careerintro_pyrolight_01
		Intensity = 2}
	hide_glitch
	CCam_DoMorph \{LockTo = moment_cam_lock_target_03
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
		time = 0}
	CCam_WaitMorph
	Wait \{4.3666663
		Seconds
		ignoreslomo}
	printf \{qs(0xa33aebc0)}
	hide_glitch
	CCam_DoMorph \{LockTo = moment_cam_lock_target_04
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		time = 0}
	CCam_WaitMorph
	Wait \{13.0
		Seconds
		ignoreslomo}
	printf \{qs(0xfa5cd3ab)}
	disablelight \{Name = z_forum_gfx_careerintro_pyrolight_01}
	tod_proxim_apply_careerintro_cut1_fx
	SpawnScriptNow \{careerintro_logocamsnapshots}
	hide_glitch
	setslomo \{0.25}
	CCam_DoMorph \{LockTo = moment_cam_lock_target_05
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		time = 0}
	CCam_WaitMorph
	Wait \{9.0
		Seconds
		ignoreslomo}
	setslomo \{1}
	printf \{qs(0x11f69b16)}
	one_introfx_forum_kill
	SpawnScriptNow \{careerintro_cam6snapshots}
	SafeKill \{nodeName = z_forum_careerintro_ground}
	SafeCreate \{nodeName = z_forum_js_ground}
	tod_proxim_apply_careerintrofx
	SafeKill \{nodeName = z_forum_gfx_fx_careerintro_frontsmoke_01}
	SafeKill \{nodeName = z_forum_gfx_careerintro_dust_01}
	create \{prefix = z_forum_gfx_fx_party
		noprefixwarning}
	CCam_DoMorph \{LockTo = World
		Pos = (21.796865, 26.676044, 43.9552)
		Quat = (0.09026301, -0.91221493, 0.28627703)
		FOV = 72.0}
	CCam_WaitMorph
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript

script setslomo_intro \{slomo_factor = 1.0}
	Change careerintro_current_slomo = <slomo_factor>
	setslomo <slomo_factor>
endscript
default_careerintro_transition = {
	time = 17700
	ScriptTable = [
	]
}
common_careerintro_transition = {
	ScriptTable = [
		{
			time = 0
			Scr = disable_pause
		}
		{
			time = 0
			Scr = start_preloaded_celeb_intro_stream
		}
		{
			time = 0
			Scr = Transition_StopRendering
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
			Scr = Transition_CameraCut
			params = {
				changenow
			}
		}
		{
			time = 0
			Scr = play_intro
			params = {
			}
		}
		{
			time = 0
			Scr = play_intro_anims
			params = {
			}
		}
		{
			time = 100
			Scr = careerintro_transition_ecstacyofgold
		}
		{
			time = 100
			Scr = careerintro_lightingandfx
		}
		{
			time = 100
			Scr = band_playclip
			params = {
				clip = metallica_intro_underground_clip
			}
		}
		{
			time = 300
			Scr = Transition_StartRendering
		}
		{
			time = 5800
			Scr = band_playclip
			params = {
				clip = metallica_intro_slomo_clip
			}
		}
		{
			time = 5800
			Scr = setslomo_intro
			params = {
				slomo_factor = 0.1
			}
		}
		{
			time = 5800
			Scr = careerintro_transition_resetslomo
		}
		{
			time = 6300
			Scr = careerintro_transition_titlecard
		}
		{
			time = 12000
			Scr = band_playclip
			params = {
				clip = metallica_intro_underground_clip
			}
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}

script careerintro_lightingandfx 
	SafeKill \{nodeName = z_forum_js_ground}
	SafeCreate \{nodeName = z_forum_careerintro_ground}
	ChangeNodeFlag \{LS_MOOD_BLACKOUT
		0}
	SafeKill \{nodeName = z_forum_tunnel_light}
	Wait \{6.0
		Seconds}
	Wait \{1.3
		Seconds}
	SpawnScriptNow \{z_forumcareerintro_pyro}
	Wait \{2.5
		Seconds}
	z_forum_pyro_moments_front_1
	z_forum_pyro_moments_mid_2
	z_forum_pyro_moments_back_2
endscript

script careerintro_introcamsnapshots 
	LightShow_PlaySnapshot \{Name = falling02
		UseSnapshotPositions = true
		save = true}
	Wait \{4
		Seconds}
	LightShow_SetTime \{time = 1}
	LightShow_PlaySnapshot \{Name = careerintro_cut1_02
		UseSnapshotPositions = true
		save = true}
endscript

script careerintro_logocamsnapshots 
	LightShow_SetTime \{time = 0}
	LightShow_PlaySnapshot \{Name = careerintro_dark_02
		UseSnapshotPositions = true
		save = true}
	Wait \{0.5
		Seconds}
	LightShow_SetTime \{time = 0.4}
	LightShow_PlaySnapshot \{Name = careerintro_logocam_dark_01
		UseSnapshotPositions = true
		save = true}
endscript

script careerintro_cam6snapshots 
	Wait \{1.3
		Second}
	LightShow_SetTime \{time = 0.5}
	LightShow_PlaySnapshot \{Name = careerintro_dark_02
		UseSnapshotPositions = true
		save = true}
endscript

script careerintro_pyrolightmodulate 
	enablelight \{Name = z_forum_gfx_careerintro_pyrolight_front_01}
	setlightintensity \{Name = z_forum_gfx_careerintro_pyrolight_front_01
		i = 0}
	setlightintensityovertime \{Name = z_forum_gfx_careerintro_pyrolight_front_01
		i = 2
		time = 0.2}
	setlightintensityovertime \{Name = z_forum_gfx_careerintro_pyrolight_front_01
		i = 0
		time = 0.2}
	disablelight \{Name = z_forum_gfx_careerintro_pyrolight_front_01}
endscript

script sunflareright 
	Obj_RotZ \{speed = 100}
endscript

script sunflareleft 
	Obj_RotX \{speed = -100}
endscript
z_forumcareerintro_pyro_pos = [
	(9.64964, -1.33624, -15.3742)
	(10.7390995, -0.781065, -15.618501)
	(11.1995, -1.2849901, -14.436999)
	(12.541901, -1.11918, -14.3761)
]

script z_forumcareerintro_pyro 
	GetUniqueCompositeobjectID \{preferredID = fe_rocket_01}
	createparticlesystem_withscript Name = <uniqueID> objID = z_forum_gfx_fx_fireworks_launchbox_01 params_Script = $gp_fx_fe_fireworks_sparklerocq groupID = zoneparticles
	GetUniqueCompositeobjectID \{preferredID = fe_rocket_02}
	createparticlesystem_withscript Name = <uniqueID> objID = z_forum_gfx_fx_fireworks_launchbox_01 params_Script = $gp_fx_fe_fireworks_sparklerocket_top_01 groupID = zoneparticles
	Wait \{1
		Frame}
	GetUniqueCompositeobjectID \{preferredID = fe_rocket_05}
	createparticlesystem_withscript Name = <uniqueID> objID = z_forum_gfx_fx_fireworks_launchbox_02 params_Script = $gp_fx_fe_fireworks_sparklerocq groupID = zoneparticles
	GetUniqueCompositeobjectID \{preferredID = fe_rocket_06}
	createparticlesystem_withscript Name = <uniqueID> objID = z_forum_gfx_fx_fireworks_launchbox_02 params_Script = $gp_fx_fe_fireworks_sparklerocket_top_01 groupID = zoneparticles
	Wait \{1
		Frame}
	GetUniqueCompositeobjectID \{preferredID = fe_rocket_051}
	createparticlesystem_withscript Name = <uniqueID> objID = z_forum_gfx_fx_fireworks_launchbox_05 params_Script = $gp_fx_fe_fireworks_sparklerocq groupID = zoneparticles
	GetUniqueCompositeobjectID \{preferredID = fe_rocket_061}
	createparticlesystem_withscript Name = <uniqueID> objID = z_forum_gfx_fx_fireworks_launchbox_05 params_Script = $gp_fx_fe_fireworks_sparklerocket_top_01 groupID = zoneparticles
	Wait \{1
		Frame}
	GetUniqueCompositeobjectID \{preferredID = fe_rocket_052}
	createparticlesystem_withscript Name = <uniqueID> objID = z_forum_gfx_fx_fireworks_launchbox_06 params_Script = $gp_fx_fe_fireworks_sparklerocq groupID = zoneparticles
	GetUniqueCompositeobjectID \{preferredID = fe_rocket_062}
	createparticlesystem_withscript Name = <uniqueID> objID = z_forum_gfx_fx_fireworks_launchbox_06 params_Script = $gp_fx_fe_fireworks_sparklerocket_top_01 groupID = zoneparticles
	Wait \{1
		Frame}
	GetUniqueCompositeobjectID \{preferredID = fe_rocket_053}
	createparticlesystem_withscript Name = <uniqueID> objID = z_forum_gfx_fx_fireworks_launchbox_07 params_Script = $gp_fx_fe_fireworks_sparklerocq groupID = zoneparticles
	GetUniqueCompositeobjectID \{preferredID = fe_rocket_063}
	createparticlesystem_withscript Name = <uniqueID> objID = z_forum_gfx_fx_fireworks_launchbox_07 params_Script = $gp_fx_fe_fireworks_sparklerocket_top_01 groupID = zoneparticles
	if CompositeObjectExists \{z_forum_gfx_fx_fireworks_launchbox_01}
		z_forum_gfx_fx_fireworks_launchbox_01 :Obj_MoveToPos \{(9.70019, 6.8198104, -20.407299)
			time = 1}
		z_forum_gfx_fx_fireworks_launchbox_02 :Obj_MoveToPos \{(15.811001, 8.627581, -13.018901)
			time = 1}
		z_forum_gfx_fx_fireworks_launchbox_05 :Obj_MoveToPos \{(7.64603, 4.50002, -21.449202)
			time = 1}
		z_forum_gfx_fx_fireworks_launchbox_06 :Obj_MoveToPos \{(10.5491, 8.120601, -17.01)
			time = 1}
		z_forum_gfx_fx_fireworks_launchbox_07 :Obj_MoveToPos \{(17.361599, 5.06249, -14.971999)
			time = 1}
	endif
	GetUniqueCompositeobjectID \{preferredID = z_forumcareerintro_pyro_fsc06ww}
	CreateParticleSystem Name = <uniqueID> Pos = (16.4316, -0.37734798, -24.3222) params_Script = $gp_careerintro_bigexplosion groupID = zoneparticles
	GetUniqueCompositeobjectID \{preferredID = z_forumcareerintro_pyro_fsc022sww3}
	CreateParticleSystem Name = <uniqueID> Pos = (10.0069, 4.23252, -12.061501) params_Script = $gp_careerintro_widesparks_01 groupID = zoneparticles
	i = 0
	begin
	GetUniqueCompositeobjectID \{preferredID = z_forumcareerintro_pyro_fsc01}
	CreateParticleSystem Name = <uniqueID> Pos = ($z_forumcareerintro_pyro_pos [<i>]) params_Script = $gp_fx_fsc_bottomglow_01 groupID = zoneparticles
	GetUniqueCompositeobjectID \{preferredID = z_forumcareerintro_pyro_fsc02}
	CreateParticleSystem Name = <uniqueID> Pos = ($z_forumcareerintro_pyro_pos [<i>]) params_Script = $gp_fx_careerintro_pyroglow_01 groupID = zoneparticles
	Wait \{1
		Frame}
	GetUniqueCompositeobjectID \{preferredID = z_forumcareerintro_pyro_fsc03}
	CreateParticleSystem Name = <uniqueID> Pos = ($z_forumcareerintro_pyro_pos [<i>]) params_Script = $gp_fx_careerintro_pyroglow_02 groupID = zoneparticles
	Wait \{1
		Frame}
	GetUniqueCompositeobjectID \{preferredID = z_forumcareerintro_pyro_fsc04}
	CreateParticleSystem Name = <uniqueID> Pos = ($z_forumcareerintro_pyro_pos [<i>]) params_Script = $gp_fx_fsc_glowsmoke_01 groupID = zoneparticles
	Wait \{1
		Frame}
	GetUniqueCompositeobjectID \{preferredID = z_forumcareerintro_pyro_fsc05}
	CreateParticleSystem Name = <uniqueID> Pos = ($z_forumcareerintro_pyro_pos [<i>] + (0.0, 1.0, 0.0)) params_Script = $gp_fx_careerintro_pyrosmoke_01 groupID = zoneparticles
	Wait \{1
		Frame}
	GetUniqueCompositeobjectID \{preferredID = z_forumcareerintro_pyro_fsc0555}
	CreateParticleSystem Name = <uniqueID> Pos = ($z_forumcareerintro_pyro_pos [<i>]) params_Script = $gp_fx_fsc_greysmoke_column_01 groupID = zoneparticles
	i = (<i> + 1)
	Wait \{1
		Frame}
	repeat 4
endscript
default_metallicavointro_transition = {
	time = 9500
	ScriptTable = [
	]
}
common_metallicavointro_transition = {
	time = 9500
	ScriptTable = [
		{
			time = 0
			Scr = start_preloaded_celeb_intro_stream
		}
		{
			time = 0
			Scr = Transition_StopRendering
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
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_MetallicaVOIntro'
				changenow
			}
		}
		{
			time = 0
			Scr = play_intro
			params = {
			}
		}
		{
			time = 0
			Scr = play_intro_anims
			params = {
			}
		}
		{
			time = 100
			Scr = gh_metallicavo_intro_warmup
		}
		{
			time = 100
			Scr = Transition_StartRendering
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
default_cameras_metallicavointro = [
	{
		Name = Intro
		LockTo = moment_cam_lock_target_01
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 71.0
	}
]

script playintrocam 
	if NOT GotParam \{anim}
		printf \{qs(0xb01d88d4)}
		return
	endif
	if NOT CompositeObjectExists \{Name = vocalist}
		printf \{qs(0x62a1827b)}
		return
	endif
	momentcamera_playanim lock_target = moment_cam_lock_target_01 node = 'TRG_Geo_Camera_Performance_SING01' anim = <anim>
endscript

script createinvenueloadingscreen 
	gamemode_gettype
	if NOT (($current_transition) = ENCORE)
		if (($skipping_jimmy_encore_anim) = 1)
			ui_event_wait \{event = menu_change
				data = {
					state = uistate_encore_confirmation
				}}
		elseif (($is_network_game = 1 && <Type> = career) || $is_network_game = 0)
			ui_event_wait \{event = menu_change
				data = {
					state = uistate_song_breakdown
				}}
		endif
	else
		ui_event_wait \{event = menu_change
			data = {
				state = uistate_encore_confirmation
			}}
	endif
endscript

script pauseinvenueloadingscreen 
	if ($is_network_game = 1)
		gamemode_gettype
		if (<Type> = career)
			Change \{songtime_paused = 1}
			cleargameover
			SyncAndLaunchNetGame
			broadcastevent \{Type = done_loading}
			begin
			if ($net_ready_to_start)
				printf \{qs(0x8fbf033d)}
				break
			endif
			Wait \{1
				gameframe}
			repeat
			Change \{songtime_paused = 0}
		endif
		return
	endif
	if (($current_transition) = ENCORE)
		return
	elseif (($skipping_jimmy_encore_anim) = 1)
		Change \{skipping_jimmy_encore_anim = 0}
		return
	endif
	Change \{songtime_paused = 1}
	begin
	if ($gem_scroller_all_data_has_loaded = 0)
		Wait \{1
			gameframe}
	else
		break
	endif
	repeat
	ui_song_breakdown_pause_between_songs
endscript

script common_loading_transitionend 
	printscriptinfo \{'Common_Loading_TransitionEnd'}
	gamemode_gettype
	if (($is_network_game = 1 && <Type> = career) || $is_network_game = 0)
		if ((<Type> = quickplay) && ($is_network_game = 0))
			return
		endif
		ui_event \{event = menu_back
			data = {
				state = Uistate_gameplay
			}}
		if CompositeObjectExists \{Name = vocalist}
			vocalist :unhide
			vocalist :Ragdoll_MarkForReset
		endif
	endif
endscript

script Transition_SelectTransition \{practice_intro = 0}
	Change \{finalbandintro_transition_playing = 0}
	Change \{show_boss_helper_screen = 0}
	Change \{skipping_jimmy_encore_anim = 0}
	printf \{qs(0x298c7182)}
	if (<practice_intro> = 1)
		return
	endif
	if ($current_transition = debugintro)
		Change \{current_transition = Intro}
		return
	endif
	if ($coop_dlc_active = 1)
		Change \{current_transition = fastintro}
		return
	endif
	if ($debug_encore = 1)
		Change \{current_transition = ENCORE}
		return
	endif
	if ($game_mode = p1_career ||
			$game_mode = p2_career ||
			$game_mode = p3_career ||
			$game_mode = p4_career)
		get_progression_globals ($current_progression_flag) use_current_tab = 1
		Career_Songs = <tier_global>
		Tier = ($current_gig_number)
		if Progression_IsEncoreSong tier_global = <tier_global> Tier = <Tier> song = ($current_song)
			<is_encore> = true
			if GetPakManCurrent \{map = zones}
				if (<pak> = z_atlantis || <pak> = z_quebec)
					<is_encore> = FALSE
				endif
			endif
			if (<is_encore> = true)
				Change \{current_transition = ENCORE}
				return
			endif
		endif
		if NOT progression_check_intro_complete
			Change \{current_transition = careerintro}
			return
		endif
		if transition_selectcelebtransition
			return
		endif
	endif
	if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || $game_mode = p2_battle)
		Change \{current_transition = fastintro}
		return
	endif
	Change \{current_transition = Intro}
endscript

script transition_selectcelebtransition 
	GetArraySize ($celeb_intro_transitions)
	index = 0
	begin
	valid = 1
	if StructureContains structure = ($celeb_intro_transitions [<index>]) song
		if NOT ($current_song = $celeb_intro_transitions [<index>].song)
			valid = 0
		endif
	else
		valid = 0
	endif
	gamemode_getnumplayersshown
	if (<num_players_shown> > 1)
		part = ($celeb_intro_transitions [<index>].part)
		switch <part>
			case guitar
			if is_any_player_on_part \{part = guitar}
				valid = 0
			endif
			case guitar_vocals
			if is_any_player_on_part \{part = guitar}
				if is_any_player_on_part \{part = vocals}
					valid = 0
				endif
			endif
			case bass_vocals
			if is_any_player_on_part \{part = bass}
				if is_any_player_on_part \{part = vocals}
					valid = 0
				endif
			endif
			case vocals
			if is_any_player_on_part \{part = vocals}
				valid = 0
			endif
			case drums
			if is_any_player_on_part \{part = drum}
				valid = 0
			endif
			case no_replacements
			valid = <valid>
			default
			valid = 0
		endswitch
	endif
	if StructureContains structure = ($celeb_intro_transitions [<index>]) boss_song
		boss_song = ($celeb_intro_transitions [<index>].Intro)
		gamemode_getnumplayersshown
		if ((<num_players_shown> = 1) && ($player1_status.part = guitar))
			if (<boss_song> = FALSE)
				valid = 0
			endif
		else
			if (<boss_song> = true)
				valid = 0
			endif
		endif
	endif
	if (<valid> = 1)
		formatText checksumName = transition '%s' s = ($celeb_intro_transitions [<index>].Intro) AddToStringLookup = true
		Change current_transition = <transition>
		if StructureContains structure = ($celeb_intro_transitions [<index>]) show_boss_helper_screen
			Change \{show_boss_helper_screen = 1}
		endif
		return \{true}
	endif
	index = (<index> + 1)
	repeat <array_Size>
	return \{FALSE}
endscript

script transition_randomizevointros 
	<Result> = []
	GetArraySize ($metallica_intro_vo_data.random_sets)
	<i> = 0
	begin
	AddArrayElement array = <Result> element = <i>
	<Result> = <array>
	<i> = (<i> + 1)
	repeat <array_Size>
	<i> = 0
	begin
	GetRandomValue a = 0 b = (<array_Size> -1) integer Name = newindex
	<temp> = (<Result> [<i>])
	SetArrayElement ArrayName = Result index = <i> NewValue = (<Result> [<newindex>])
	SetArrayElement ArrayName = Result index = <newindex> NewValue = <temp>
	<i> = (<i> + 1)
	repeat <array_Size>
	Change \{metallica_intro_vo_index = 0}
	Change metallica_intro_vo_order = <Result>
endscript

script transition_selectnextmetallicavoindex 
	Change metallica_intro_vo_index = ($metallica_intro_vo_index + 1)
	GetArraySize ($metallica_intro_vo_data.random_sets)
	if NOT ($metallica_intro_vo_index < <array_Size>)
		transition_randomizevointros
	endif
endscript

script transition_shouldusevotransition 
	if StructureContains structure = ($metallica_intro_vo_data.song_specific_sets) <song>
		if progression_shouldplaysongspecificvo tier_global = <tier_global> song = <song>
			return {
				true
				transition_data = ($metallica_intro_vo_data.song_specific_sets.<song>)
			}
		else
		endif
	endif
	GetArraySize ($metallica_intro_vo_data.exclude_venues)
	if (<array_Size> > 0)
		<i> = 0
		begin
		if (<venue> = ($metallica_intro_vo_data.exclude_venues [<i>]))
			return \{FALSE}
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	GetArraySize ($metallica_intro_vo_data.exclude_songs)
	if (<array_Size> > 0)
		<i> = 0
		begin
		if (<venue> = ($metallica_intro_vo_data.exclude_songs [<i>]))
			return \{FALSE}
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	<rnd> = RandomFloat (0.0, 1.0)
	printf qs(0x26d9f4bd) f = <rnd>
	if (<rnd> > ($metallica_intro_vo_data.random_frequency))
		return \{FALSE}
	endif
	<index> = ($metallica_intro_vo_order [$metallica_intro_vo_index])
	<transition_data> = ($metallica_intro_vo_data.random_sets [<index>])
	transition_selectnextmetallicavoindex
	return {
		true
		transition_data = <transition_data>
	}
endscript

script transition_selectmetallicavotransition 
	if is_current_band_metallica
		<venue> = ($current_level)
		if transition_shouldusevotransition tier_global = <tier_global> Tier = <Tier> song = <song> venue = <venue>
			if GotParam \{transition_data}
				Change \{current_transition = metallicavointro}
				Change metallica_intro_vo_current_struct = <transition_data>
			endif
		endif
		return \{true}
	endif
	return \{FALSE}
endscript

script transition_gettransitionspecificanim 
	RequireParams \{[
			Type
			part
			key
			who
		]}
	if ($current_transition = <Type>)
		<structure> = $metallica_intro_vo_current_struct
		if StructureContains structure = <structure> <key>
			return custom_anim_name = (<structure>.<key>)
		endif
	endif
endscript

script Transition_KillAll 
	KillSpawnedScript \{id = transitions}
	Change \{transition_playing = FALSE}
	Change \{current_playing_transition = None}
endscript

script transition_getprefix \{Type = Intro}
	celeb_intro = 0
	if StructureContains structure = $Transition_Types <Type>
		printstruct <...>
		type_textnl = ($Transition_Types.<Type>.textnl)
	else
		GetArraySize ($celeb_intro_transitions)
		index = 0
		begin
		formatText checksumName = transition '%s' s = ($celeb_intro_transitions [<index>].Intro)
		if (<Type> = <transition>)
			type_textnl = ($celeb_intro_transitions [<index>].Intro)
			celeb_intro = 1
			break
		endif
		index = (<index> + 1)
		repeat <array_Size>
	endif
	if NOT GotParam \{type_textnl}
		printstruct <...>
		ScriptAssert \{qs(0xf6d7c577)}
	endif
	return type_textnl = <type_textnl> celeb_intro = <celeb_intro>
endscript

script transition_getprops 
	transition_getprefix <...>
	GetPakManCurrentName \{map = zones}
	formatText checksumName = Transition_Props '%s_%p_Transition' p = <type_textnl> s = <pakname>
	if NOT GlobalExists Name = <Transition_Props>
		formatText checksumName = Transition_Props 'override_%p_Transition' p = <type_textnl>
	endif
	if NOT GlobalExists Name = <Transition_Props>
		formatText checksumName = Transition_Props 'default_%p_Transition' p = <type_textnl> s = <pakname>
	endif
	if (<celeb_intro> = 1)
		if NOT GlobalExists Name = <Transition_Props>
			Transition_Props = Default_Intro_Transition
		endif
	endif
	formatText checksumName = common_transition_props 'Common_%p_Transition' p = <type_textnl>
	common_type_textnl = <type_textnl>
	if (<celeb_intro> = 1)
		common_type_textnl = 'intro'
		if NOT GlobalExists Name = <common_transition_props>
			common_transition_props = Common_Intro_Transition
		endif
	endif
	return type_textnl = <type_textnl> common_type_textnl = <common_type_textnl> Transition_Props = <Transition_Props> common_transition_props = <common_transition_props>
endscript

script Transition_GetTime \{Type = Intro}
	transition_getprops Type = <Type>
	<transition_time> = ($<Transition_Props>.time)
	return transition_time = <transition_time>
endscript

script Transition_Play \{Type = Intro}
	printf 'Transition_Play type=%t' t = <Type>
	Transition_KillAll
	Change current_playing_transition = <Type>
	transition_getprops Type = <Type>
	GetPakManCurrentName \{map = zones}
	formatText checksumName = event 'Common_%p_TransitionSetup' p = <common_type_textnl> s = <pakname>
	if ScriptExists <event>
		<event>
	endif
	formatText checksumName = event '%s_%p_TransitionSetup' p = <type_textnl> s = <pakname>
	if ScriptExists <event>
		SpawnScriptNow <event>
	endif
	SpawnScriptNow Transition_Play_Spawned id = transitions params = {<...>}
	formatText checksumName = event 'GuitarEvent_Transition%s' s = <type_textnl>
	if ScriptExists <event>
		SpawnScriptNow <event>
	endif
endscript

script Transition_Play_Spawned 
	Change \{transition_playing = true}
	GetPakManCurrentName \{map = zones}
	Transition_GetTime Type = <Type>
	SpawnScriptNow Transition_Play_Iterator id = transitions params = {<...>}
	SpawnScriptNow Transition_Play_Iterator id = transitions params = {<...> Transition_Props = <common_transition_props>}
	GetSongTimeMs
	time_offset = (0 - <time>)
	begin
	GetSongTimeMs time_offset = <time_offset>
	if (<transition_time> <= <time>)
		if ($songtime_paused = 0)
			Change \{transition_playing = FALSE}
			break
		endif
	endif
	Wait \{1
		gameframe}
	repeat
	if StructureContains structure = ($<common_transition_props>) EndWithDefaultCamera
		if ($finalbandintro_transition_playing = 1)
			if ($current_playing_transition = finalbandintro)
				Change \{finalbandintro_transition_playing = 0}
			else
				StopRendering
			endif
		elseif ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || $game_mode = p2_battle || $boss_battle = 1 || $current_song = jamsession)
			CameraCuts_EnableChangeCam \{enable = FALSE}
			getfps
			delay_ms = (0.0 - $time_input_offset)
			ms_per_frame = (1000.0 / <fps>)
			frames = (<delay_ms> / <ms_per_frame>)
			CastToInteger \{frames}
			Wait <frames> gameframes
			if ($current_song = jamsession)
				CameraCuts_SetArrayPrefix \{prefix = 'cameras_jam_mode'
					changenow}
			else
				CameraCuts_SetArrayPrefix \{prefix = 'cameras_headtohead'
					changenow}
			endif
		else
			if StructureContains structure = ($<common_transition_props>) SyncWithNoteCameras
				CameraCuts_GetNextNoteCameraTime
				GetSongTimeMs
				if (<camera_time> >= -200 &&
						<camera_time> - <time> < 2000)
					CameraCuts_EnableChangeCam \{enable = FALSE}
				else
					if NOT ($game_mode = training || $game_mode = tutorial || $game_mode = practice)
						CameraCuts_SetArrayPrefix \{prefix = 'cameras'
							changenow}
					else
						CameraCuts_EnableChangeCam \{enable = FALSE}
					endif
				endif
			else
				if NOT ($game_mode = training || $game_mode = tutorial || $game_mode = practice)
					CameraCuts_SetArrayPrefix \{prefix = 'cameras'
						changenow}
				else
					CameraCuts_EnableChangeCam \{enable = FALSE}
				endif
			endif
		endif
	endif
	formatText checksumName = event 'Common_%p_TransitionEnd' p = <type_textnl> s = <pakname>
	if ScriptExists <event>
		SpawnScriptNow <event>
	endif
	formatText checksumName = event '%s_%p_TransitionEnd' p = <type_textnl> s = <pakname>
	if ScriptExists <event>
		SpawnScriptNow <event>
	endif
	Change \{current_playing_transition = None}
endscript

script istransitionplaying 
	if GotParam \{Type}
		if (<Type> = $current_playing_transition)
			return \{true}
		endif
	else
		if NOT (<Type> = None)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script Transition_Play_Iterator 
	GetSongTimeMs
	time_offset = (0 - <time>)
	GetArraySize ($<Transition_Props>.ScriptTable)
	if (<array_Size> = 0)
		return
	endif
	GetSongTimeMs time_offset = <time_offset>
	array_count = 0
	begin
	begin
	GetSongTimeMs time_offset = <time_offset>
	if ($<Transition_Props>.ScriptTable [<array_count>].time <= <time>)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if ScriptExists ($<Transition_Props>.ScriptTable [<array_count>].Scr)
		SpawnScriptNow ($<Transition_Props>.ScriptTable [<array_count>].Scr) id = transitions params = {transition_time = <transition_time> ($<Transition_Props>.ScriptTable [<array_count>].params)}
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
endscript

script Transition_Wait 
	begin
	if ($transition_playing = FALSE)
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script clipplaydrummercamera 
	if NOT GotParam \{anim}
		ScriptAssert \{qs(0xcdaa0a64)}
	endif
	if NOT GotParam \{index}
		ScriptAssert \{qs(0xd509756d)}
	endif
	if (<index> < 10)
		formatText checksumName = lock_target 'drummer_mocap_lock_target_0%i' i = <index>
	else
		formatText checksumName = lock_target 'drummer_mocap_lock_target_%i' i = <index>
	endif
	momentcamera_playanim {anim = <anim> $drumcam_params lock_target = <lock_target>}
endscript

script momentcamera_playanim \{cycle = 0
		start = 0.0
		BlendDuration = 0.0}
	if NOT CompositeObjectExists Name = <lock_target>
		printf channel = anim_info qs(0xb08c6979) a = <lock_target>
		return
	endif
	SetSearchAllAssetContexts
	GetPakManCurrent \{map = zones}
	GetPakManCurrentName \{map = zones}
	if GotParam \{start_node}
		ExtendCrc <pak> <start_node> out = start_node_id
		GetWaypointPos Name = <start_node_id>
		GetWaypointDir Name = <start_node_id>
		<lock_target> :Obj_SetPosition position = <Pos>
		<lock_target> :Obj_SetOrientation Dir = <Dir>
	else
		suffix = ('_' + <node>)
		AppendSuffixToChecksum Base = <pak> SuffixString = <suffix>
		if CompositeObjectExists Name = <appended_id>
			<appended_id> :Obj_GetPosition
			<lock_target> :Obj_SetPosition position = <Pos>
			<appended_id> :Obj_GetOrientation
			Dir = ((1.0, 0.0, 0.0) * <X> + (0.0, 1.0, 0.0) * <y> + (0.0, 0.0, 1.0) * <z>)
			<lock_target> :Obj_SetOrientation Dir = <Dir>
		else
			printf channel = anim_info qs(0xc0212f38) a = <appended_id>
		endif
	endif
	if NOT GotParam \{tempo_anim}
		tempo_anim = <anim>
	endif
	if NOT CompositeObjectExists Name = <lock_target>
		ScriptAssert qs(0x9e08b783) a = <lock_target>
		return
	endif
	<lock_target> :Obj_KillSpawnedScript Name = momentcamera_playanim_spawned
	<lock_target> :Obj_SpawnScriptNow momentcamera_playanim_spawned params = {anim = <anim> tempoanim = <tempo_anim> cycle = <cycle> start = <start> BlendDuration = <BlendDuration>}
	SetSearchAllAssetContexts \{OFF}
endscript

script momentcamera_playanim_spawned \{start = 0.0
		speed = 1.0
		BlendDuration = -1.0}
	printf \{qs(0xc2684cb9)}
	begin
	SetSearchAllAssetContexts
	if NOT GotParam \{anim}
		Anim_GetDefaultAnimName
		anim = <defaultAnimName>
	endif
	if NOT GotParam \{tempoanim}
		tempoanim = anim
	endif
	RemoveTags \{[
			animrequestedfovradians
		]}
	anim_enable
	Anim_Command target = Body Command = DegenerateBlend_AddBranch params = {
		Tree = $specialcamera_standardanimbranch
		BlendDuration = <BlendDuration>
		params = {
			anim = <anim>
			speed = <speed>
			TimerType = tempo
			start = <start>
			AnimEvents = On
			tempoanim = <tempoanim>
			allowbeatskipping = true
		}
	}
	Anim_Command \{target = BodyTimer
		Command = Timer_WaitAnimComplete}
	SetSearchAllAssetContexts \{OFF}
	if (<cycle> = 0)
		break
	endif
	repeat
endscript
specialcamera_objectcleanuplist = [
]

script specialcamera_addobjecttocleanuplist 
	<arr> = ($specialcamera_objectcleanuplist)
	AddArrayElement array = <arr> element = <Name>
	Change specialcamera_objectcleanuplist = <array>
	printstruct 'SpecialCamera_ObjectCleanupList' ($specialcamera_objectcleanuplist)
endscript

script specialcamera_cleanupallobjects 
	GetArraySize ($specialcamera_objectcleanuplist)
	if (<array_Size> > 0)
		<i> = 0
		begin
		<Name> = ($specialcamera_objectcleanuplist [<i>])
		printf qs(0xe0118dd3) s = <Name>
		if CompositeObjectExists Name = <Name>
			<Name> :Obj_SwitchScript specialcamera_cleanupobject
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	Change \{specialcamera_objectcleanuplist = [
		]}
endscript

script specialcamera_cleanupobject 
	SetSearchAllAssetContexts
	Anim_GetDefaultAnimName
	anim = <defaultAnimName>
	Anim_Command target = Body Command = DegenerateBlend_AddBranch params = {
		Tree = $specialcamera_standardanimbranch
		BlendDuration = 0.0
		params = {
			TimerType = Play
			anim = <anim>
		}
	}
	SetSearchAllAssetContexts \{OFF}
endscript

script specialcamera_playanim \{cycle = 0
		start = 0.0}
	SetSearchAllAssetContexts
	GetPakManCurrent \{map = zones}
	GetPakManCurrentName \{map = zones}
	formatText TextName = suffix '_%s' s = <Obj>
	AppendSuffixToChecksum Base = <pak> SuffixString = <suffix>
	cameraname = (<pakname> + <suffix>)
	if CompositeObjectExists Name = <appended_id>
		specialcamera_addobjecttocleanuplist Name = <appended_id>
		<appended_id> :Obj_SwitchScript specialcamera_playanim_spawned params = {anim = <anim> cycle = <cycle> start = <start> BlendDuration = <BlendDuration>}
	else
		printf qs(0x5f796dcf) s = <cameraname>
	endif
	SetSearchAllAssetContexts \{OFF}
endscript

script specialcamera_playanim_spawned \{start = 0.0
		speed = 1.0
		BlendDuration = -1.0}
	begin
	SetSearchAllAssetContexts
	if NOT GotParam \{anim}
		Anim_GetDefaultAnimName
		anim = <defaultAnimName>
	endif
	if NOT GotParam \{tempoanim}
		tempoanim = anim
	endif
	printf qs(0x0c017022) a = <anim> b = <tempoanim>
	RemoveTags \{[
			animrequestedfovradians
		]}
	anim_enable
	Anim_Command target = Body Command = DegenerateBlend_AddBranch params = {
		Tree = $specialcamera_standardanimbranch
		BlendDuration = <BlendDuration>
		params = {
			anim = <anim>
			speed = <speed>
			TimerType = tempo
			start = <start>
			AnimEvents = On
			tempoanim = <tempoanim>
			allowbeatskipping = true
		}
	}
	specialcamera_waitanimfinished
	SetSearchAllAssetContexts \{OFF}
	if (<cycle> = 0)
		break
	endif
	repeat
endscript

script specialcamera_waitanimfinished \{Timer = BodyTimer}
	Anim_Command target = <Timer> Command = Timer_WaitAnimComplete
endscript
specialcamera_standardanimbranch = {
	Type = TimerType
	id = BodyTimer
	anim = anim
	tempo_anim = tempoanim
	anim_events = AnimEvents
	allow_beat_skipping = allowbeatskipping
	speed = speed
	start = start
	[
		{
			Type = Source
			anim = anim
		}
	]
}

script Transition_PlayAnim \{cycle = 0}
	<Obj> :Obj_SwitchScript Transition_PlayAnim_Spawned params = {anim = <anim> cycle = <cycle> BlendDuration = <BlendDuration>}
endscript

script Transition_PlayAnim_Spawned 
	begin
	GameObj_PlayAnim anim = <anim> BlendDuration = <BlendDuration>
	GameObj_WaitAnimFinished
	if (<cycle> = 0)
		break
	endif
	repeat
endscript

script Transition_CameraCut 
	if GotParam \{prefix}
		CameraCuts_SetArrayPrefix <...> length = <transition_time>
	else
		if NOT ($current_playing_transition = None)
			transition_getprefix Type = ($current_playing_transition)
		else
			transition_getprefix \{Type = Intro}
		endif
		GetPakManCurrentName \{map = zones}
		formatText checksumName = Cameras_Array 'default_cameras_%t' t = <type_textnl>
		formatText TextName = prefix 'cameras_%t' t = <type_textnl>
		if NOT GlobalExists Name = <Cameras_Array>
			formatText checksumName = Cameras_Array '%s_cameras_%t' s = <pakname> t = <type_textnl>
			if NOT GlobalExists Name = <Cameras_Array>
				prefix = 'cameras_intro'
			endif
		endif
		CameraCuts_SetArrayPrefix <...> length = <transition_time>
	endif
endscript

script Transition_StopRendering 
	printf \{qs(0x61460438)}
	StopRendering
endscript

script Transition_StartRendering 
	printf \{qs(0xeddd15af)}
	StartRendering
	Change \{is_changing_levels = 0}
	if ($blade_active = 1 && $current_playing_transition != careerintro)
		Change \{blade_active = 0}
		if ($g_in_tutorial = 0)
			gh3_start_pressed \{from_handler}
		endif
	endif
endscript

script Transition_Printf 
	printf <...>
endscript

script Transitions_ResetZone 
	printf \{qs(0x119c40dd)}
	GetPakManCurrentName \{map = zones}
	formatText checksumName = reset_func '%s_ResetTransition' s = <pakname>
	if ScriptExists <reset_func>
		<reset_func>
	endif
	formatText checksumName = nodearray_checksum '%s_NodeArray' s = <pakname>
	if NOT GlobalExists Name = <nodearray_checksum> Type = array
		return
	endif
	GetArraySize $<nodearray_checksum>
	array_count = 0
	begin
	resetvalid = true
	if GotParam \{Profile}
		resetvalid = FALSE
		if StructureContains structure = ($<nodearray_checksum> [<array_count>]) Profile
			if comparestructs struct1 = ($<nodearray_checksum> [<array_count>].Profile) struct2 = (<Profile>)
				resetvalid = true
			endif
		endif
	endif
	if StructureContains structure = ($<nodearray_checksum> [<array_count>]) CreatedFromVariable
		resetvalid = FALSE
	endif
	if StructureContains structure = ($<nodearray_checksum> [<array_count>]) CreatedOnProgress
		resetvalid = FALSE
	endif
	if StructureContains structure = ($<nodearray_checksum> [<array_count>]) Class
		if NOT ($<nodearray_checksum> [<array_count>].Class = GameObject ||
				$<nodearray_checksum> [<array_count>].Class = LevelGeometry ||
				$<nodearray_checksum> [<array_count>].Class = LevelObject)
			resetvalid = FALSE
		endif
	else
		resetvalid = FALSE
	endif
	if (<resetvalid> = true)
		printf qs(0x9f03166a) s = ($<nodearray_checksum> [<array_count>].Name)
		kill Name = ($<nodearray_checksum> [<array_count>].Name)
		if StructureContains structure = ($<nodearray_checksum> [<array_count>]) CreatedAtStart
			create Name = ($<nodearray_checksum> [<array_count>].Name)
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
endscript

script common_intro_transitionsetup 
	printf \{channel = sfx
		qs(0x0ea33ed5)}
	preload_celeb_intro_stream
endscript

script Common_PreEncore_TransitionSetup 
	Change_Crowd_Looping_SFX \{crowd_looping_state = good}
endscript

script Common_PreEncore_TransitionEnd 
endscript

script finalbandintro_transitionsetup 
	printf \{channel = sfx
		qs(0x86acca66)}
	transition_getprefix Type = ($current_playing_transition)
	if NOT ($celeb_intro_stream_id = None)
		stopsound unique_id = ($celeb_intro_stream_id)
		Change \{celeb_intro_stream_id = None}
	endif
	PreloadStream \{intro_finalgig}
	Change celeb_intro_stream_id = <unique_id>
endscript

script common_finalbandoutro_transitionsetup 
	printf \{channel = sfx
		qs(0x52f3ee09)}
	if NOT ($celeb_intro_stream_id = None)
		stopsound unique_id = ($celeb_intro_stream_id)
		Change \{celeb_intro_stream_id = None}
	endif
	PreloadStream \{encore_finalgig}
	Change celeb_intro_stream_id = <unique_id>
	begin
	printf \{qs(0xb1fb7278)}
	if PreloadStreamDone <unique_id>
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script Common_Encore_TransitionSetup 
	printf \{channel = sfx
		qs(0x456e2c58)}
	preload_encore_event_stream
endscript

script Common_Boss_TransitionSetup 
endscript

script Common_Encore_TransitionEnd 
endscript

script Preload_Encore_Bink_Audio \{movie_name = 'z_artdeco_encore_audio'}
endscript

script common_loading_transitionsetup 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_metalfest
		SoundEvent \{event = large_ext_crowd_song_transition}
		case z_newyork
		SoundEvent \{event = large_ext_crowd_song_transition}
		case z_goth
		SoundEvent \{event = medium_int_crowd_song_transition}
		case z_cathedral
		SoundEvent \{event = medium_int_crowd_song_transition}
		case z_fairgrounds
		SoundEvent \{event = medium_int_crowd_song_transition}
		case z_ballpark
		SoundEvent \{event = medium_int_crowd_song_transition}
		case z_castle
		SoundEvent \{event = medium_int_crowd_song_transition}
		case z_military
		SoundEvent \{event = medium_int_crowd_song_transition}
		case Z_Harbor
		SoundEvent \{event = medium_int_crowd_song_transition}
		case z_scifi
		SoundEvent \{event = medium_int_crowd_song_transition}
		case z_submarine
		SoundEvent \{event = medium_int_crowd_song_transition}
		default
		printf \{channel = sfx
			qs(0x21a8e0d5)}
	endswitch
	SoundEvent \{event = $current_crowd_swell_short_soundevent_l}
	SoundEvent \{event = $current_crowd_swell_short_soundevent_r}
	SoundEvent \{event = $current_crowd_swell_med_soundevent_l}
	SoundEvent \{event = $current_crowd_swell_med_soundevent_r}
	SoundEvent \{event = $current_crowd_swell_long_soundevent_l}
	SoundEvent \{event = $current_crowd_swell_long_soundevent_r}
	SoundEvent \{event = oneshotsbetweensongs}
	SoundEvent \{event = surgebetweensongs}
endscript
celeb_intro_stream_id = None

script preload_celeb_intro_stream 
	printf \{channel = sfx
		qs(0x9f3ca4a3)}
	transition_getprefix Type = ($current_playing_transition)
	if NOT ($celeb_intro_stream_id = None)
		stopsound unique_id = ($celeb_intro_stream_id)
		Change \{celeb_intro_stream_id = None}
	endif
	if (<celeb_intro> = 0)
		return
	endif
	celeb_intro_checksum = ($current_playing_transition)
	PreloadStream <celeb_intro_checksum>
	Change celeb_intro_stream_id = <unique_id>
	begin
	printf \{qs(0x50818c55)}
	if PreloadStreamDone <unique_id>
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script start_preloaded_celeb_intro_stream 
	printf \{channel = sfx
		qs(0x9ff5df66)}
	if NOT ($celeb_intro_stream_id = None)
		StartPreLoadedStream \{$celeb_intro_stream_id
			buss = Encore_Events
			forcesafepreload = 1
			pitch = 100}
		Change \{celeb_intro_stream_id = None}
	endif
endscript
encore_event_stream_id = None

script preload_encore_event_stream 
	printf \{channel = sfx
		qs(0x03f14c32)}
	if NOT ($encore_event_stream_id = None)
		stopsound unique_id = ($encore_event_stream_id)
		Change \{encore_event_stream_id = None}
	endif
	GetPakManCurrentName \{map = zones}
	formatText checksumName = encore_stream_name '%s_encore' s = <pakname> AddToStringLookup = true
	PreloadStream <encore_stream_name>
	Change encore_event_stream_id = <unique_id>
	begin
	printf \{qs(0x93305209)}
	if PreloadStreamDone <unique_id>
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script start_preloaded_encore_event_stream 
	printf \{channel = sfx
		qs(0x72abc744)}
	if NOT ($encore_event_stream_id = None)
		StopSoundEvent \{$current_crowd_encore
			fade_time = 3
			fade_type = linear}
		printf \{channel = sfx
			qs(0x554dbcd0)}
		StartPreLoadedStream \{$encore_event_stream_id
			buss = Encore_Events
			forcesafepreload = 1
			pitch = 100}
		KillSpawnedScript \{Name = loading_screen_crowd_swell}
		KillSpawnedScript \{Name = crowd_loading_whistle}
		setsoundbussparams {Crowd_Beds = {vol = (($default_BussSet.Crowd_Beds.vol))} time = 2}
		Change \{encore_event_stream_id = None}
	endif
endscript

script start_preloaded_finalbandoutro_stream 
	printf \{channel = sfx
		qs(0x12d0a014)}
	if NOT ($celeb_intro_stream_id = None)
		StopSoundEvent \{$current_crowd_encore
			fade_time = 2.5
			fade_type = log_slow}
		StartPreLoadedStream \{$celeb_intro_stream_id
			buss = Encore_Events
			forcesafepreload = 1
			pitch = 100}
		Change \{celeb_intro_stream_id = None}
	endif
endscript

script kill_transition_preload_streams 
	KillSpawnedScript \{Name = preload_encore_event_stream}
	KillSpawnedScript \{Name = preload_celeb_intro_stream}
	Change \{encore_event_stream_id = None}
	Change \{celeb_intro_stream_id = None}
endscript

script default_camera_intro_lemmy 
	CameraCuts_CalcTime
	GetPakManCurrent \{map = zones}
	ExtendCrc <pak> '_TRG_Geo_Camera_Performance_SING01' out = cam_id
	CCam_DoMorph {
		LockTo = <cam_id>
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 71.0
	}
	CCam_WaitMorph
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript

script default_camera_intro_kingdiamond 
	CameraCuts_CalcTime
	GetPakManCurrent \{map = zones}
	ExtendCrc <pak> '_TRG_Geo_Camera_Performance_SING01' out = cam_id
	CCam_DoMorph {
		LockTo = <cam_id>
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 71.0
	}
	CCam_WaitMorph
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript
