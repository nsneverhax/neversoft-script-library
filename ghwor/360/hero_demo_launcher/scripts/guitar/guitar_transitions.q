transition_playing = false
current_playing_transition = none
finalbandintro_transition_playing = 0
skipping_jimmy_encore_anim = 0
metallica_intro_vo_order = [
]
metallica_intro_vo_index = 0
metallica_intro_vo_current_struct = {
}
careerintro_current_slomo = 1.0
transition_types = {
	careerintro = {
		textnl = 'careerintro'
	}
	intro = {
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
	encore = {
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
		intro = 'intro_lemmy'
		song = aceofspades
		part = no_replacements
		debug_preview_in_venue = load_z_tushino
	}
	{
		intro = 'intro_kingdiamond'
		song = evil
		part = no_replacements
		debug_preview_in_venue = load_z_tushino
	}
]
default_immediate_transition = {
	time = 0
	scripttable = [
	]
}
common_immediate_transition = {
	scripttable = [
		{
			time = 0
			scr = transition_cameracut
			params = {
				prefix = 'cameras'
				changenow
			}
		}
		{
			time = 0
			scr = bandmanager_setplayingintroanims
		}
		{
			time = 100
			scr = transition_startrendering
		}
	]
}
default_fastintro_transition = {
	time = 3000
	scripttable = [
	]
}
common_fastintro_transition = {
	scripttable = [
		{
			time = 0
			scr = transition_stoprendering
		}
		{
			time = 0
			scr = bandmanager_setplayingintroanims
		}
		{
			time = 0
			scr = transition_cameracut
			params = {
				prefix = 'cameras_fastintro'
				changenow
			}
		}
		{
			time = 0
			scr = play_intro
			params = {
				fast
			}
		}
		{
			time = 0
			scr = spirit_fadein
			params = {
			}
		}
		{
			time = 100
			scr = gh_sfx_intro_warmup_fast
		}
		{
			time = 0
			scr = band_playtransitionidles
			params = {
				from_restart = true
			}
		}
		{
			time = 100
			scr = transition_startrendering
		}
		{
			time = 100
			scr = enable_tutorial_pause
		}
	]
	endwithdefaultcamera
	syncwithnotecameras
}
default_fastintrotutorial_transition = {
	time = 3000
	scripttable = [
	]
}
common_fastintrotutorial_transition = {
	scripttable = [
		{
			time = 0
			scr = transition_stoprendering
		}
		{
			time = 0
			scr = bandmanager_setplayingintroanims
		}
		{
			time = 0
			scr = training_setup_camera
			params = {
				name = cameracutcam
			}
		}
		{
			time = 0
			scr = play_intro
			params = {
				fast
			}
		}
		{
			time = 0
			scr = band_playtransitionidles
		}
		{
			time = 100
			scr = transition_startrendering
		}
		{
			time = 100
			scr = enable_tutorial_pause
		}
	]
	endwithdefaultcamera
	syncwithnotecameras
}
default_restartencore_transition = {
	time = 3000
	scripttable = [
	]
}
common_restartencore_transition = {
	scripttable = [
		{
			time = 0
			scr = transition_stoprendering
		}
		{
			time = 0
			scr = bandmanager_setplayingintroanims
		}
		{
			time = 0
			scr = transition_cameracut
			params = {
				prefix = 'cameras_fastintro'
				changenow
			}
		}
		{
			time = 0
			scr = play_intro
			params = {
				fast
			}
		}
		{
			time = 0
			scr = band_playtransitionidles
			params = {
				from_restart = true
			}
		}
		{
			time = 100
			scr = transition_startrendering
		}
	]
	endwithdefaultcamera
	syncwithnotecameras
}
default_restartboss_transition = {
	time = 3000
	scripttable = [
	]
}
common_restartboss_transition = {
	scripttable = [
		{
			time = 0
			scr = transition_stoprendering
		}
		{
			time = 0
			scr = bandmanager_setplayingintroanims
		}
		{
			time = 0
			scr = transition_cameracut
			params = {
				prefix = 'cameras_fastintro'
				changenow
			}
		}
		{
			time = 0
			scr = play_intro
			params = {
				fast
			}
		}
		{
			time = 0
			scr = band_playtransitionidles
		}
		{
			time = 100
			scr = transition_startrendering
		}
	]
	endwithdefaultcamera
	syncwithnotecameras
}
default_practice_transition = {
	time = 5000
	scripttable = [
	]
}
common_practice_transition = {
	scripttable = [
		{
			time = 0
			scr = transition_stoprendering
		}
		{
			time = 0
			scr = bandmanager_setplayingintroanims
		}
		{
			time = 0
			scr = transition_cameracut
			params = {
				prefix = 'cameras_fastintro'
				changenow
			}
		}
		{
			time = 0
			scr = play_intro
			params = {
				practice
			}
		}
		{
			time = 100
			scr = transition_startrendering
		}
	]
	endwithdefaultcamera
	syncwithnotecameras
}
default_intro_transition = {
	time = 19500
	scripttable = [
	]
}
common_intro_transition = {
	scripttable = [
		{
			time = 0
			scr = start_preloaded_celeb_intro_stream
		}
		{
			time = 0
			scr = transition_stoprendering
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
			scr = transition_cameracut
			params = {
				changenow
			}
		}
		{
			time = 0
			scr = play_intro
			params = {
			}
		}
		{
			time = 0
			scr = play_intro_anims
			params = {
			}
		}
		{
			time = 100
			scr = transition_startrendering
		}
		{
			time = 100
			scr = gh_sfx_intro_warmup
		}
	]
	endwithdefaultcamera
	syncwithnotecameras
}
default_finalbandintro_transition = {
	time = 20000
	scripttable = [
	]
}
common_finalbandintro_transition = {
	scripttable = [
		{
			time = 0
			scr = start_preloaded_celeb_intro_stream
		}
		{
			time = 0
			scr = transition_cameracut
			params = {
				prefix = 'cameras_finalbandintro'
				changenow
			}
		}
		{
			time = 60
			scr = transition_startrendering
		}
	]
	endwithdefaultcamera
	syncwithnotecameras
}
default_preencore_transition = {
	time = 10000
	scripttable = [
		{
			time = 0
			scr = change_crowd_looping_sfx
			params = {
				crowd_looping_state = good
			}
		}
	]
}
common_preencore_transition = {
	scripttable = [
		{
			time = 0
			scr = play_win_anims
			params = {
			}
		}
		{
			time = 0
			scr = kill_gem_scroller
			params = {
				type = outro
				kill_cameracuts_iterator
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
			scr = transition_cameracut
			params = {
				prefix = 'cameras_win'
				changenow
			}
		}
		{
			time = 0
			scr = change_crowd_looping_sfx
			params = {
				crowd_looping_state = good
			}
		}
		{
			time = 10000
			scr = transition_cameracut
			params = {
				prefix = 'cameras_no_band'
				changenow
			}
		}
	]
	endwithdefaultcamera
}
default_encore_transition = {
	time = 5000
	scripttable = [
	]
}
common_encore_transition = {
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
			scr = start_preloaded_encore_event_stream
		}
		{
			time = 0
			scr = transition_stoprendering
		}
		{
			time = 0
			scr = transition_cameracut
			params = {
				prefix = 'cameras_encore'
				changenow
			}
		}
		{
			time = 0
			scr = play_intro
			params = {
			}
		}
		{
			time = 100
			scr = transition_startrendering
		}
	]
	endwithdefaultcamera
	syncwithnotecameras
}
default_preboss_transition = {
	time = 10000
	scripttable = [
	]
}
common_preboss_transition = {
	scripttable = [
		{
			time = 0
			scr = play_win_anims
			params = {
			}
		}
		{
			time = 0
			scr = kill_gem_scroller
			params = {
				type = outro
				kill_cameracuts_iterator
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
			scr = transition_cameracut
			params = {
				prefix = 'cameras_preboss'
				changenow
			}
		}
	]
	endwithdefaultcamera
}
default_boss_transition = {
	time = 8000
	scripttable = [
	]
}
common_boss_transition = {
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
			scr = transition_stoprendering
		}
		{
			time = 0
			scr = transition_cameracut
			params = {
				prefix = 'cameras_boss'
				changenow
			}
		}
		{
			time = 0
			scr = play_intro
			params = {
			}
		}
		{
			time = 0
			scr = play_intro_anims
			params = {
			}
		}
		{
			time = 100
			scr = transition_startrendering
		}
	]
	endwithdefaultcamera
	syncwithnotecameras
}
default_songwon_transition = {
	time = 7500
	scripttable = [
	]
}
common_songwon_transition = {
	scripttable = [
		{
			time = 0
			scr = play_win_anims
			params = {
			}
		}
		{
			time = 0
			scr = kill_gem_scroller
			params = {
				type = outro
				kill_cameracuts_iterator
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
			scr = transition_cameracut
			params = {
				prefix = 'cameras_win'
				changenow
			}
		}
	]
	endwithdefaultcamera
}
default_songlost_transition = {
	time = 8000
	scripttable = [
	]
}
common_songlost_transition = {
	scripttable = [
		{
			time = 0
			scr = play_lose_anims
			params = {
			}
		}
		{
			time = 0
			scr = change_crowd_looping_sfx
			params = {
				crowd_looping_state = bad
			}
		}
		{
			time = 0
			scr = kill_gem_scroller
			params = {
				type = outro
				kill_cameracuts_iterator
				song_failed_pitch_streams = 1
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
			scr = transition_cameracut
			params = {
				prefix = 'cameras_lose'
				changenow
			}
		}
	]
	endwithdefaultcamera
}
default_finalbandoutro_transition = {
	time = 10000
	scripttable = [
	]
}
common_finalbandoutro_transition = {
	scripttable = [
		{
			time = 0
			scr = kill_gem_scroller
			params = {
				type = outro
				kill_cameracuts_iterator
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
			scr = transition_cameracut
			params = {
				prefix = 'cameras_finalbandoutro'
				changenow
			}
		}
		{
			time = 0
			scr = start_preloaded_finalbandoutro_stream
		}
	]
	endwithdefaultcamera
}
default_loading_transition = {
	time = 10000
	scripttable = [
	]
}
common_loading_transition = {
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
			scr = transition_cameracut
			params = {
				prefix = 'cameras_no_band'
				changenow
			}
		}
		{
			time = 0
			scr = createinvenueloadingscreen
			params = {
			}
		}
		{
			time = 9900
			scr = pauseinvenueloadingscreen
			params = {
			}
		}
	]
}
default_loadingintro_transition = {
	time = 3000
	scripttable = [
	]
}
common_loadingintro_transition = {
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
			scr = bandmanager_setplayingintroanims
		}
		{
			time = 0
			scr = transition_cameracut
			params = {
				prefix = 'cameras_fastintro'
				changenow
			}
		}
		{
			time = 0
			scr = play_intro
			params = {
				fast
			}
		}
		{
			time = 0
			scr = band_playtransitionidles
		}
		{
			time = 100
			scr = transition_startrendering
		}
	]
	endwithdefaultcamera
	syncwithnotecameras
}
override_intro_lemmy_transition = {
	time = 10500
	scripttable = [
		{
			time = 1
			scr = band_playtransitionidles
		}
		{
			time = 1
			scr = lemmy_introfx
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
			scr = transition_playsimpleanim
			params = {
				name = vocalist
				anim = s_lemmy_intro_aceofspades
			}
		}
		{
			time = 1
			scr = specialcamera_playanim
			params = {
				obj = 'TRG_Geo_Camera_Performance_SING01'
				anim = s_lemmy_intro_aceofspades_c01
			}
		}
		{
			time = 1
			scr = transition_changeik
			params = {
				name = vocalist
				enabled = false
			}
		}
		{
			time = 10500
			scr = transition_changeik
			params = {
				name = vocalist
				enabled = true
			}
		}
		{
			time = 10500
			scr = band_unhide
			params = {
				name = guitarist
			}
		}
		{
			time = 10500
			scr = lemmy_introfx_kill
		}
	]
}
override_intro_kingdiamond_transition = {
	time = 13200
	scripttable = [
		{
			time = 1
			scr = band_playtransitionidles
		}
		{
			time = 1
			scr = kingdiamond_introfx
		}
		{
			time = 1
			scr = transition_playsimpleanim
			params = {
				name = vocalist
				anim = s_kingd_intro_evil
			}
		}
		{
			time = 1
			scr = specialcamera_playanim
			params = {
				obj = 'TRG_Geo_Camera_Performance_SING01'
				anim = s_kingd_intro_evil_c01
			}
		}
		{
			time = 1
			scr = transition_changeik
			params = {
				name = vocalist
				enabled = false
			}
		}
		{
			time = 13200
			scr = transition_changeik
			params = {
				name = vocalist
				enabled = true
			}
		}
		{
			time = 13200
			scr = kingdiamond_introfx_kill
		}
	]
}

script play_metallica_intro_slomo_anims 
	band_playidle \{name = guitarist
		restart
		no_wait}
	band_playidle \{name = bassist
		restart
		no_wait}
	band_playidle \{name = vocalist
		restart
		no_wait}
	band_playidle \{name = drummer
		restart
		no_wait}
	killspawnedscript \{name = band_movetostartnode}
	band_playclip \{clip = metallica_intro_underground_clip}
endscript
metallica_intro_slomo_clip = {
	anims = {
		vocalist = sbdg_slowmo_introtest_s
		guitarist = sbdg_slowmo_introtest_g
		bassist = sbdg_slowmo_introtest_b
		drummer = sbdg_slowmo_introtest_d
	}
	startnodes = {
		vocalist = 'drummer_start'
		guitarist = 'drummer_start'
		bassist = 'drummer_start'
		drummer = 'drummer_start'
	}
	arms = {
		vocalist = {
			ik_targetl = slave
			ik_targetr = slave
			strum = off
			fret = off
			chord = off
		}
		guitarist = {
			ik_targetl = slave
			ik_targetr = slave
			strum = off
			fret = off
			chord = off
		}
		bassist = {
			ik_targetl = slave
			ik_targetr = slave
			strum = off
			fret = off
			chord = off
		}
		drummer = {
			ik_targetl = slave
			ik_targetr = slave
			strum = off
			fret = off
			chord = off
		}
	}
	cameras = [
		{
			name = 'TRG_Geo_Camera_Performance_DRUM01'
			anim = sbdg_slowmo_introtest_c01
			weight = 1
		}
		{
			name = 'TRG_Geo_Camera_Performance_DRUM01'
			anim = sbdg_slowmo_introtest_c02
			weight = 1
		}
		{
			name = 'TRG_Geo_Camera_Performance_DRUM01'
			anim = sbdg_slowmo_introtest_c01
			weight = 1
		}
		{
			name = 'TRG_Geo_Camera_Performance_DRUM01'
			anim = sbdg_slowmo_introtest_c03
			weight = 1
		}
		{
			name = 'TRG_Geo_Camera_Performance_DRUM01'
			anim = sbdg_slowmo_introtest_c01
			weight = 1
		}
	]
}
metallica_intro_underground_clip = {
	anims = {
		vocalist = sbdg_slowmo_introtest_s_understage
		guitarist = sbdg_slowmo_introtest_g_understage
		bassist = sbdg_slowmo_introtest_b_understage
		drummer = sbdg_slowmo_introtest_d_understage
	}
	startnodes = {
		vocalist = 'drummer_start'
		guitarist = 'drummer_start'
		bassist = 'drummer_start'
		drummer = 'drummer_start'
	}
	arms = {
		vocalist = {
			ik_targetl = slave
			ik_targetr = slave
			strum = off
			fret = off
			chord = off
		}
		guitarist = {
			ik_targetl = slave
			ik_targetr = slave
			strum = off
			fret = off
			chord = off
		}
		bassist = {
			ik_targetl = slave
			ik_targetr = slave
			strum = off
			fret = off
			chord = off
		}
		drummer = {
			ik_targetl = slave
			ik_targetr = slave
			strum = off
			fret = off
			chord = off
		}
	}
}

script z_forum_camera_careerintro 
	printf \{qs(0x47761f37)}
	tod_proxim_apply_careerintrofx
	spawnscriptnow \{careerintro_introcamsnapshots}
	kill \{prefix = z_forum_gfx_fx_careerintrosunflare02
		noprefixwarning}
	create \{prefix = z_forum_gfx_fx_careerintrosunflare02
		noprefixwarning}
	safecreate \{nodename = z_forum_gfx_fx_careerintro_drumlh}
	cameracuts_calctime
	ccam_domorph \{lockto = world
		pos = (16.696894, 13.436276, -23.963196)
		quat = (0.184926, -0.262795, 0.051716)
		fov = 72.0}
	ccam_domorph \{lockto = world
		pos = (17.176004, 10.404304, -24.754778)
		quat = (0.142083, -0.26486, 0.039807998)
		fov = 72.0
		time = 5.72}
	ccam_waitmorph
	printf \{qs(0x44b53446)}
	lightshow_settime \{time = 0}
	lightshow_playsnapshot \{name = careerintro_cut1_02
		usesnapshotpositions = true
		save = true}
	safecreate \{nodename = z_forum_gfx_fx_careerintro_frontsmoke_01}
	safecreate \{nodename = z_forum_gfx_careerintro_dust_01}
	safecreate \{nodename = z_forum_gfx_fx_oneintro2_james_lh_06}
	safecreate \{nodename = z_forum_gfx_careerintro_smoke_01}
	kill \{prefix = z_forum_gfx_fx_party
		noprefixwarning}
	create \{prefix = z_forum_gfx_fx_careerintrosunflare
		noprefixwarning}
	tod_proxim_apply_careerintro_cut1_fx
	enablelight \{name = z_forum_gfx_careerintro_pyrolight_front_01}
	setlightintensity \{name = z_forum_gfx_careerintro_pyrolight_front_01
		intensity = 1.1}
	enablelight \{name = z_forum_gfx_careerintro_pyrolight_01}
	setlightintensity \{name = z_forum_gfx_careerintro_pyrolight_01
		intensity = 0}
	hide_glitch
	ccam_domorph \{lockto = moment_cam_lock_target_01
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		fov = 72.0
		time = 0}
	ccam_waitmorph
	wait \{10.03
		seconds
		ignoreslomo}
	printf \{qs(0xaf1f7cfb)}
	tod_proxim_apply_careerintro_02_fx
	safekill \{nodename = z_forum_js_walkway_pipes_intro}
	safekill \{nodename = z_forum_gfx_fx_careerintro_frontsmoke_01}
	lightshow_playsnapshot \{name = careerintro_01
		usesnapshotpositions = true
		save = true}
	enablelight \{name = z_forum_gfx_careerintro_pyrolight_01}
	safekill \{nodename = z_forum_gfx_fx_careerintro_drumlh}
	setlightintensity \{name = z_forum_gfx_careerintro_pyrolight_01
		intensity = 2}
	setlightintensity \{name = z_forum_gfx_careerintro_pyrolight_front_01
		intensity = 0}
	hide_glitch
	ccam_domorph \{lockto = moment_cam_lock_target_02
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		fov = 72.0
		time = 0}
	ccam_waitmorph
	wait \{9.89
		seconds
		ignoreslomo}
	printf \{qs(0xf6794490)}
	lightshow_playsnapshot \{name = careerintro_dark_02
		usesnapshotpositions = true
		save = true}
	setlightintensity \{name = z_forum_gfx_careerintro_pyrolight_01
		intensity = 2}
	hide_glitch
	ccam_domorph \{lockto = moment_cam_lock_target_03
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		fov = 72.0
		time = 0}
	ccam_waitmorph
	wait \{4.3666663
		seconds
		ignoreslomo}
	printf \{qs(0xa33aebc0)}
	hide_glitch
	ccam_domorph \{lockto = moment_cam_lock_target_04
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		time = 0}
	ccam_waitmorph
	wait \{13.0
		seconds
		ignoreslomo}
	printf \{qs(0xfa5cd3ab)}
	disablelight \{name = z_forum_gfx_careerintro_pyrolight_01}
	tod_proxim_apply_careerintro_cut1_fx
	spawnscriptnow \{careerintro_logocamsnapshots}
	hide_glitch
	setslomo \{0.25}
	ccam_domorph \{lockto = moment_cam_lock_target_05
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		time = 0}
	ccam_waitmorph
	wait \{9.0
		seconds
		ignoreslomo}
	setslomo \{1}
	printf \{qs(0x11f69b16)}
	one_introfx_forum_kill
	spawnscriptnow \{careerintro_cam6snapshots}
	safekill \{nodename = z_forum_careerintro_ground}
	safecreate \{nodename = z_forum_js_ground}
	tod_proxim_apply_careerintrofx
	safekill \{nodename = z_forum_gfx_fx_careerintro_frontsmoke_01}
	safekill \{nodename = z_forum_gfx_careerintro_dust_01}
	create \{prefix = z_forum_gfx_fx_party
		noprefixwarning}
	ccam_domorph \{lockto = world
		pos = (21.796865, 26.676044, 43.9552)
		quat = (0.09026301, -0.91221493, 0.28627703)
		fov = 72.0}
	ccam_waitmorph
	cameracuts_waitscript camera_songtime = <camera_songtime>
endscript

script setslomo_intro \{slomo_factor = 1.0}
	change careerintro_current_slomo = <slomo_factor>
	setslomo <slomo_factor>
endscript
default_careerintro_transition = {
	time = 17700
	scripttable = [
	]
}
common_careerintro_transition = {
	scripttable = [
		{
			time = 0
			scr = disable_pause
		}
		{
			time = 0
			scr = start_preloaded_celeb_intro_stream
		}
		{
			time = 0
			scr = transition_stoprendering
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
			scr = transition_cameracut
			params = {
				changenow
			}
		}
		{
			time = 0
			scr = play_intro
			params = {
			}
		}
		{
			time = 0
			scr = play_intro_anims
			params = {
			}
		}
		{
			time = 100
			scr = careerintro_transition_ecstacyofgold
		}
		{
			time = 100
			scr = careerintro_lightingandfx
		}
		{
			time = 100
			scr = band_playclip
			params = {
				clip = metallica_intro_underground_clip
			}
		}
		{
			time = 300
			scr = transition_startrendering
		}
		{
			time = 5800
			scr = band_playclip
			params = {
				clip = metallica_intro_slomo_clip
			}
		}
		{
			time = 5800
			scr = setslomo_intro
			params = {
				slomo_factor = 0.1
			}
		}
		{
			time = 5800
			scr = careerintro_transition_resetslomo
		}
		{
			time = 6300
			scr = careerintro_transition_titlecard
		}
		{
			time = 12000
			scr = band_playclip
			params = {
				clip = metallica_intro_underground_clip
			}
		}
	]
	endwithdefaultcamera
	syncwithnotecameras
}

script careerintro_lightingandfx 
	safekill \{nodename = z_forum_js_ground}
	safecreate \{nodename = z_forum_careerintro_ground}
	changenodeflag \{ls_mood_blackout
		0}
	safekill \{nodename = z_forum_tunnel_light}
	wait \{6.0
		seconds}
	wait \{1.3
		seconds}
	spawnscriptnow \{z_forumcareerintro_pyro}
	wait \{2.5
		seconds}
	z_forum_pyro_moments_front_1
	z_forum_pyro_moments_mid_2
	z_forum_pyro_moments_back_2
endscript

script careerintro_introcamsnapshots 
	lightshow_playsnapshot \{name = falling02
		usesnapshotpositions = true
		save = true}
	wait \{4
		seconds}
	lightshow_settime \{time = 1}
	lightshow_playsnapshot \{name = careerintro_cut1_02
		usesnapshotpositions = true
		save = true}
endscript

script careerintro_logocamsnapshots 
	lightshow_settime \{time = 0}
	lightshow_playsnapshot \{name = careerintro_dark_02
		usesnapshotpositions = true
		save = true}
	wait \{0.5
		seconds}
	lightshow_settime \{time = 0.4}
	lightshow_playsnapshot \{name = careerintro_logocam_dark_01
		usesnapshotpositions = true
		save = true}
endscript

script careerintro_cam6snapshots 
	wait \{1.3
		second}
	lightshow_settime \{time = 0.5}
	lightshow_playsnapshot \{name = careerintro_dark_02
		usesnapshotpositions = true
		save = true}
endscript

script careerintro_pyrolightmodulate 
	enablelight \{name = z_forum_gfx_careerintro_pyrolight_front_01}
	setlightintensity \{name = z_forum_gfx_careerintro_pyrolight_front_01
		i = 0}
	setlightintensityovertime \{name = z_forum_gfx_careerintro_pyrolight_front_01
		i = 2
		time = 0.2}
	setlightintensityovertime \{name = z_forum_gfx_careerintro_pyrolight_front_01
		i = 0
		time = 0.2}
	disablelight \{name = z_forum_gfx_careerintro_pyrolight_front_01}
endscript

script sunflareright 
	obj_rotz \{speed = 100}
endscript

script sunflareleft 
	obj_rotx \{speed = -100}
endscript
z_forumcareerintro_pyro_pos = [
	(9.64964, -1.33624, -15.3742)
	(10.7390995, -0.781065, -15.618501)
	(11.1995, -1.2849901, -14.436999)
	(12.541901, -1.11918, -14.3761)
]

script z_forumcareerintro_pyro 
	getuniquecompositeobjectid \{preferredid = fe_rocket_01}
	createparticlesystem_withscript name = <uniqueid> objid = z_forum_gfx_fx_fireworks_launchbox_01 params_script = $gp_fx_fe_fireworks_sparklerocq groupid = zoneparticles
	getuniquecompositeobjectid \{preferredid = fe_rocket_02}
	createparticlesystem_withscript name = <uniqueid> objid = z_forum_gfx_fx_fireworks_launchbox_01 params_script = $gp_fx_fe_fireworks_sparklerocket_top_01 groupid = zoneparticles
	wait \{1
		frame}
	getuniquecompositeobjectid \{preferredid = fe_rocket_05}
	createparticlesystem_withscript name = <uniqueid> objid = z_forum_gfx_fx_fireworks_launchbox_02 params_script = $gp_fx_fe_fireworks_sparklerocq groupid = zoneparticles
	getuniquecompositeobjectid \{preferredid = fe_rocket_06}
	createparticlesystem_withscript name = <uniqueid> objid = z_forum_gfx_fx_fireworks_launchbox_02 params_script = $gp_fx_fe_fireworks_sparklerocket_top_01 groupid = zoneparticles
	wait \{1
		frame}
	getuniquecompositeobjectid \{preferredid = fe_rocket_051}
	createparticlesystem_withscript name = <uniqueid> objid = z_forum_gfx_fx_fireworks_launchbox_05 params_script = $gp_fx_fe_fireworks_sparklerocq groupid = zoneparticles
	getuniquecompositeobjectid \{preferredid = fe_rocket_061}
	createparticlesystem_withscript name = <uniqueid> objid = z_forum_gfx_fx_fireworks_launchbox_05 params_script = $gp_fx_fe_fireworks_sparklerocket_top_01 groupid = zoneparticles
	wait \{1
		frame}
	getuniquecompositeobjectid \{preferredid = fe_rocket_052}
	createparticlesystem_withscript name = <uniqueid> objid = z_forum_gfx_fx_fireworks_launchbox_06 params_script = $gp_fx_fe_fireworks_sparklerocq groupid = zoneparticles
	getuniquecompositeobjectid \{preferredid = fe_rocket_062}
	createparticlesystem_withscript name = <uniqueid> objid = z_forum_gfx_fx_fireworks_launchbox_06 params_script = $gp_fx_fe_fireworks_sparklerocket_top_01 groupid = zoneparticles
	wait \{1
		frame}
	getuniquecompositeobjectid \{preferredid = fe_rocket_053}
	createparticlesystem_withscript name = <uniqueid> objid = z_forum_gfx_fx_fireworks_launchbox_07 params_script = $gp_fx_fe_fireworks_sparklerocq groupid = zoneparticles
	getuniquecompositeobjectid \{preferredid = fe_rocket_063}
	createparticlesystem_withscript name = <uniqueid> objid = z_forum_gfx_fx_fireworks_launchbox_07 params_script = $gp_fx_fe_fireworks_sparklerocket_top_01 groupid = zoneparticles
	if compositeobjectexists \{z_forum_gfx_fx_fireworks_launchbox_01}
		z_forum_gfx_fx_fireworks_launchbox_01 :obj_movetopos \{(9.70019, 6.8198104, -20.407299)
			time = 1}
		z_forum_gfx_fx_fireworks_launchbox_02 :obj_movetopos \{(15.811001, 8.627581, -13.018901)
			time = 1}
		z_forum_gfx_fx_fireworks_launchbox_05 :obj_movetopos \{(7.64603, 4.50002, -21.449202)
			time = 1}
		z_forum_gfx_fx_fireworks_launchbox_06 :obj_movetopos \{(10.5491, 8.120601, -17.01)
			time = 1}
		z_forum_gfx_fx_fireworks_launchbox_07 :obj_movetopos \{(17.361599, 5.06249, -14.971999)
			time = 1}
	endif
	getuniquecompositeobjectid \{preferredid = z_forumcareerintro_pyro_fsc06ww}
	createparticlesystem name = <uniqueid> pos = (16.4316, -0.37734798, -24.3222) params_script = $gp_careerintro_bigexplosion groupid = zoneparticles
	getuniquecompositeobjectid \{preferredid = z_forumcareerintro_pyro_fsc022sww3}
	createparticlesystem name = <uniqueid> pos = (10.0069, 4.23252, -12.061501) params_script = $gp_careerintro_widesparks_01 groupid = zoneparticles
	i = 0
	begin
	getuniquecompositeobjectid \{preferredid = z_forumcareerintro_pyro_fsc01}
	createparticlesystem name = <uniqueid> pos = ($z_forumcareerintro_pyro_pos [<i>]) params_script = $gp_fx_fsc_bottomglow_01 groupid = zoneparticles
	getuniquecompositeobjectid \{preferredid = z_forumcareerintro_pyro_fsc02}
	createparticlesystem name = <uniqueid> pos = ($z_forumcareerintro_pyro_pos [<i>]) params_script = $gp_fx_careerintro_pyroglow_01 groupid = zoneparticles
	wait \{1
		frame}
	getuniquecompositeobjectid \{preferredid = z_forumcareerintro_pyro_fsc03}
	createparticlesystem name = <uniqueid> pos = ($z_forumcareerintro_pyro_pos [<i>]) params_script = $gp_fx_careerintro_pyroglow_02 groupid = zoneparticles
	wait \{1
		frame}
	getuniquecompositeobjectid \{preferredid = z_forumcareerintro_pyro_fsc04}
	createparticlesystem name = <uniqueid> pos = ($z_forumcareerintro_pyro_pos [<i>]) params_script = $gp_fx_fsc_glowsmoke_01 groupid = zoneparticles
	wait \{1
		frame}
	getuniquecompositeobjectid \{preferredid = z_forumcareerintro_pyro_fsc05}
	createparticlesystem name = <uniqueid> pos = ($z_forumcareerintro_pyro_pos [<i>] + (0.0, 1.0, 0.0)) params_script = $gp_fx_careerintro_pyrosmoke_01 groupid = zoneparticles
	wait \{1
		frame}
	getuniquecompositeobjectid \{preferredid = z_forumcareerintro_pyro_fsc0555}
	createparticlesystem name = <uniqueid> pos = ($z_forumcareerintro_pyro_pos [<i>]) params_script = $gp_fx_fsc_greysmoke_column_01 groupid = zoneparticles
	i = (<i> + 1)
	wait \{1
		frame}
	repeat 4
endscript
default_metallicavointro_transition = {
	time = 9500
	scripttable = [
	]
}
common_metallicavointro_transition = {
	time = 9500
	scripttable = [
		{
			time = 0
			scr = start_preloaded_celeb_intro_stream
		}
		{
			time = 0
			scr = transition_stoprendering
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
			scr = transition_cameracut
			params = {
				prefix = 'cameras_MetallicaVOIntro'
				changenow
			}
		}
		{
			time = 0
			scr = play_intro
			params = {
			}
		}
		{
			time = 0
			scr = play_intro_anims
			params = {
			}
		}
		{
			time = 100
			scr = gh_metallicavo_intro_warmup
		}
		{
			time = 100
			scr = transition_startrendering
		}
	]
	endwithdefaultcamera
	syncwithnotecameras
}
default_cameras_metallicavointro = [
	{
		name = intro
		lockto = moment_cam_lock_target_01
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		fov = 71.0
	}
]

script playintrocam 
	if NOT gotparam \{anim}
		printf \{qs(0xb01d88d4)}
		return
	endif
	if NOT compositeobjectexists \{name = vocalist}
		printf \{qs(0x62a1827b)}
		return
	endif
	momentcamera_playanim lock_target = moment_cam_lock_target_01 node = 'TRG_Geo_Camera_Performance_SING01' anim = <anim>
endscript

script createinvenueloadingscreen 
	gamemode_gettype
	if NOT (($current_transition) = encore)
		if (($skipping_jimmy_encore_anim) = 1)
			ui_event_wait \{event = menu_change
				data = {
					state = uistate_encore_confirmation
				}}
		elseif (($is_network_game = 1 && <type> = career) || $is_network_game = 0)
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
		if (<type> = career)
			change \{songtime_paused = 1}
			cleargameover
			syncandlaunchnetgame
			broadcastevent \{type = done_loading}
			begin
			if ($net_ready_to_start)
				printf \{qs(0x8fbf033d)}
				break
			endif
			wait \{1
				gameframe}
			repeat
			change \{songtime_paused = 0}
		endif
		return
	endif
	if (($current_transition) = encore)
		return
	elseif (($skipping_jimmy_encore_anim) = 1)
		change \{skipping_jimmy_encore_anim = 0}
		return
	endif
	change \{songtime_paused = 1}
	begin
	if ($gem_scroller_all_data_has_loaded = 0)
		wait \{1
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
	if (($is_network_game = 1 && <type> = career) || $is_network_game = 0)
		if ((<type> = quickplay) && ($is_network_game = 0))
			return
		endif
		ui_event \{event = menu_back
			data = {
				state = uistate_gameplay
			}}
		if compositeobjectexists \{name = vocalist}
			vocalist :unhide
			vocalist :ragdoll_markforreset
		endif
	endif
endscript

script transition_selecttransition \{practice_intro = 0}
	change \{finalbandintro_transition_playing = 0}
	change \{show_boss_helper_screen = 0}
	change \{skipping_jimmy_encore_anim = 0}
	printf \{qs(0x298c7182)}
	if (<practice_intro> = 1)
		return
	endif
	if ($current_transition = debugintro)
		change \{current_transition = intro}
		return
	endif
	if ($coop_dlc_active = 1)
		change \{current_transition = fastintro}
		return
	endif
	if ($debug_encore = 1)
		change \{current_transition = encore}
		return
	endif
	if ($game_mode = p1_career ||
			$game_mode = p2_career ||
			$game_mode = p3_career ||
			$game_mode = p4_career)
		get_progression_globals ($current_progression_flag) use_current_tab = 1
		career_songs = <tier_global>
		tier = ($current_gig_number)
		if progression_isencoresong tier_global = <tier_global> tier = <tier> song = ($current_song)
			<is_encore> = true
			if getpakmancurrent \{map = zones}
				if (<pak> = z_atlantis || <pak> = z_quebec)
					<is_encore> = false
				endif
			endif
			if (<is_encore> = true)
				change \{current_transition = encore}
				return
			endif
		endif
		if NOT progression_check_intro_complete
			change \{current_transition = careerintro}
			return
		endif
		if transition_selectcelebtransition
			return
		endif
	endif
	if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || $game_mode = p2_battle)
		change \{current_transition = fastintro}
		return
	endif
	change \{current_transition = intro}
endscript

script transition_selectcelebtransition 
	getarraysize ($celeb_intro_transitions)
	index = 0
	begin
	valid = 1
	if structurecontains structure = ($celeb_intro_transitions [<index>]) song
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
	if structurecontains structure = ($celeb_intro_transitions [<index>]) boss_song
		boss_song = ($celeb_intro_transitions [<index>].intro)
		gamemode_getnumplayersshown
		if ((<num_players_shown> = 1) && ($player1_status.part = guitar))
			if (<boss_song> = false)
				valid = 0
			endif
		else
			if (<boss_song> = true)
				valid = 0
			endif
		endif
	endif
	if (<valid> = 1)
		formattext checksumname = transition '%s' s = ($celeb_intro_transitions [<index>].intro) addtostringlookup = true
		change current_transition = <transition>
		if structurecontains structure = ($celeb_intro_transitions [<index>]) show_boss_helper_screen
			change \{show_boss_helper_screen = 1}
		endif
		return \{true}
	endif
	index = (<index> + 1)
	repeat <array_size>
	return \{false}
endscript

script transition_randomizevointros 
	<result> = []
	getarraysize ($metallica_intro_vo_data.random_sets)
	<i> = 0
	begin
	addarrayelement array = <result> element = <i>
	<result> = <array>
	<i> = (<i> + 1)
	repeat <array_size>
	<i> = 0
	begin
	getrandomvalue a = 0 b = (<array_size> -1) integer name = newindex
	<temp> = (<result> [<i>])
	setarrayelement arrayname = result index = <i> newvalue = (<result> [<newindex>])
	setarrayelement arrayname = result index = <newindex> newvalue = <temp>
	<i> = (<i> + 1)
	repeat <array_size>
	change \{metallica_intro_vo_index = 0}
	change metallica_intro_vo_order = <result>
endscript

script transition_selectnextmetallicavoindex 
	change metallica_intro_vo_index = ($metallica_intro_vo_index + 1)
	getarraysize ($metallica_intro_vo_data.random_sets)
	if NOT ($metallica_intro_vo_index < <array_size>)
		transition_randomizevointros
	endif
endscript

script transition_shouldusevotransition 
	if structurecontains structure = ($metallica_intro_vo_data.song_specific_sets) <song>
		if progression_shouldplaysongspecificvo tier_global = <tier_global> song = <song>
			return {
				true
				transition_data = ($metallica_intro_vo_data.song_specific_sets.<song>)
			}
		else
		endif
	endif
	getarraysize ($metallica_intro_vo_data.exclude_venues)
	if (<array_size> > 0)
		<i> = 0
		begin
		if (<venue> = ($metallica_intro_vo_data.exclude_venues [<i>]))
			return \{false}
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	getarraysize ($metallica_intro_vo_data.exclude_songs)
	if (<array_size> > 0)
		<i> = 0
		begin
		if (<venue> = ($metallica_intro_vo_data.exclude_songs [<i>]))
			return \{false}
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	<rnd> = RandomFloat (0.0, 1.0)
	printf qs(0x26d9f4bd) f = <rnd>
	if (<rnd> > ($metallica_intro_vo_data.random_frequency))
		return \{false}
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
		if transition_shouldusevotransition tier_global = <tier_global> tier = <tier> song = <song> venue = <venue>
			if gotparam \{transition_data}
				change \{current_transition = metallicavointro}
				change metallica_intro_vo_current_struct = <transition_data>
			endif
		endif
		return \{true}
	endif
	return \{false}
endscript

script transition_gettransitionspecificanim 
	requireparams \{[
			type
			part
			key
			who
		]}
	if ($current_transition = <type>)
		<structure> = $metallica_intro_vo_current_struct
		if structurecontains structure = <structure> <key>
			return custom_anim_name = (<structure>.<key>)
		endif
	endif
endscript

script transition_killall 
	killspawnedscript \{id = transitions}
	change \{transition_playing = false}
	change \{current_playing_transition = none}
endscript

script transition_getprefix \{type = intro}
	celeb_intro = 0
	if structurecontains structure = $transition_types <type>
		printstruct <...>
		type_textnl = ($transition_types.<type>.textnl)
	else
		getarraysize ($celeb_intro_transitions)
		index = 0
		begin
		formattext checksumname = transition '%s' s = ($celeb_intro_transitions [<index>].intro)
		if (<type> = <transition>)
			type_textnl = ($celeb_intro_transitions [<index>].intro)
			celeb_intro = 1
			break
		endif
		index = (<index> + 1)
		repeat <array_size>
	endif
	if NOT gotparam \{type_textnl}
		printstruct <...>
		scriptassert \{qs(0xf6d7c577)}
	endif
	return type_textnl = <type_textnl> celeb_intro = <celeb_intro>
endscript

script transition_getprops 
	transition_getprefix <...>
	getpakmancurrentname \{map = zones}
	formattext checksumname = transition_props '%s_%p_Transition' p = <type_textnl> s = <pakname>
	if NOT globalexists name = <transition_props>
		formattext checksumname = transition_props 'override_%p_Transition' p = <type_textnl>
	endif
	if NOT globalexists name = <transition_props>
		formattext checksumname = transition_props 'default_%p_Transition' p = <type_textnl> s = <pakname>
	endif
	if (<celeb_intro> = 1)
		if NOT globalexists name = <transition_props>
			transition_props = default_intro_transition
		endif
	endif
	formattext checksumname = common_transition_props 'Common_%p_Transition' p = <type_textnl>
	common_type_textnl = <type_textnl>
	if (<celeb_intro> = 1)
		common_type_textnl = 'intro'
		if NOT globalexists name = <common_transition_props>
			common_transition_props = common_intro_transition
		endif
	endif
	return type_textnl = <type_textnl> common_type_textnl = <common_type_textnl> transition_props = <transition_props> common_transition_props = <common_transition_props>
endscript

script transition_gettime \{type = intro}
	transition_getprops type = <type>
	<transition_time> = ($<transition_props>.time)
	return transition_time = <transition_time>
endscript

script transition_play \{type = intro}
	printf 'Transition_Play type=%t' t = <type>
	transition_killall
	change current_playing_transition = <type>
	transition_getprops type = <type>
	getpakmancurrentname \{map = zones}
	formattext checksumname = event 'Common_%p_TransitionSetup' p = <common_type_textnl> s = <pakname>
	if scriptexists <event>
		<event>
	endif
	formattext checksumname = event '%s_%p_TransitionSetup' p = <type_textnl> s = <pakname>
	if scriptexists <event>
		spawnscriptnow <event>
	endif
	spawnscriptnow transition_play_spawned id = transitions params = {<...>}
	formattext checksumname = event 'GuitarEvent_Transition%s' s = <type_textnl>
	if scriptexists <event>
		spawnscriptnow <event>
	endif
endscript

script transition_play_spawned 
	change \{transition_playing = true}
	getpakmancurrentname \{map = zones}
	transition_gettime type = <type>
	spawnscriptnow transition_play_iterator id = transitions params = {<...>}
	spawnscriptnow transition_play_iterator id = transitions params = {<...> transition_props = <common_transition_props>}
	getsongtimems
	time_offset = (0 - <time>)
	begin
	getsongtimems time_offset = <time_offset>
	if (<transition_time> <= <time>)
		if ($songtime_paused = 0)
			change \{transition_playing = false}
			break
		endif
	endif
	wait \{1
		gameframe}
	repeat
	if structurecontains structure = ($<common_transition_props>) endwithdefaultcamera
		if ($finalbandintro_transition_playing = 1)
			if ($current_playing_transition = finalbandintro)
				change \{finalbandintro_transition_playing = 0}
			else
				stoprendering
			endif
		elseif ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || $game_mode = p2_battle || $boss_battle = 1 || $current_song = jamsession)
			cameracuts_enablechangecam \{enable = false}
			getfps
			delay_ms = (0.0 - $time_input_offset)
			ms_per_frame = (1000.0 / <fps>)
			frames = (<delay_ms> / <ms_per_frame>)
			casttointeger \{frames}
			wait <frames> gameframes
			if ($current_song = jamsession)
				cameracuts_setarrayprefix \{prefix = 'cameras_jam_mode'
					changenow}
			else
				cameracuts_setarrayprefix \{prefix = 'cameras_headtohead'
					changenow}
			endif
		else
			if structurecontains structure = ($<common_transition_props>) syncwithnotecameras
				cameracuts_getnextnotecameratime
				getsongtimems
				if (<camera_time> >= -200 &&
						<camera_time> - <time> < 2000)
					cameracuts_enablechangecam \{enable = false}
				else
					if NOT ($game_mode = training || $game_mode = tutorial || $game_mode = practice)
						cameracuts_setarrayprefix \{prefix = 'cameras'
							changenow}
					else
						cameracuts_enablechangecam \{enable = false}
					endif
				endif
			else
				if NOT ($game_mode = training || $game_mode = tutorial || $game_mode = practice)
					cameracuts_setarrayprefix \{prefix = 'cameras'
						changenow}
				else
					cameracuts_enablechangecam \{enable = false}
				endif
			endif
		endif
	endif
	formattext checksumname = event 'Common_%p_TransitionEnd' p = <type_textnl> s = <pakname>
	if scriptexists <event>
		spawnscriptnow <event>
	endif
	formattext checksumname = event '%s_%p_TransitionEnd' p = <type_textnl> s = <pakname>
	if scriptexists <event>
		spawnscriptnow <event>
	endif
	change \{current_playing_transition = none}
endscript

script istransitionplaying 
	if gotparam \{type}
		if (<type> = $current_playing_transition)
			return \{true}
		endif
	else
		if NOT (<type> = none)
			return \{true}
		endif
	endif
	return \{false}
endscript

script transition_play_iterator 
	getsongtimems
	time_offset = (0 - <time>)
	getarraysize ($<transition_props>.scripttable)
	if (<array_size> = 0)
		return
	endif
	getsongtimems time_offset = <time_offset>
	array_count = 0
	begin
	begin
	getsongtimems time_offset = <time_offset>
	if ($<transition_props>.scripttable [<array_count>].time <= <time>)
		break
	endif
	wait \{1
		gameframe}
	repeat
	if scriptexists ($<transition_props>.scripttable [<array_count>].scr)
		spawnscriptnow ($<transition_props>.scripttable [<array_count>].scr) id = transitions params = {transition_time = <transition_time> ($<transition_props>.scripttable [<array_count>].params)}
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
endscript

script transition_wait 
	begin
	if ($transition_playing = false)
		return
	endif
	wait \{1
		gameframe}
	repeat
endscript

script clipplaydrummercamera 
	if NOT gotparam \{anim}
		scriptassert \{qs(0xcdaa0a64)}
	endif
	if NOT gotparam \{index}
		scriptassert \{qs(0xd509756d)}
	endif
	if (<index> < 10)
		formattext checksumname = lock_target 'drummer_mocap_lock_target_0%i' i = <index>
	else
		formattext checksumname = lock_target 'drummer_mocap_lock_target_%i' i = <index>
	endif
	momentcamera_playanim {anim = <anim> $drumcam_params lock_target = <lock_target>}
endscript

script momentcamera_playanim \{cycle = 0
		start = 0.0
		blendduration = 0.0}
	if NOT compositeobjectexists name = <lock_target>
		printf channel = anim_info qs(0xb08c6979) a = <lock_target>
		return
	endif
	setsearchallassetcontexts
	getpakmancurrent \{map = zones}
	getpakmancurrentname \{map = zones}
	if gotparam \{start_node}
		extendcrc <pak> <start_node> out = start_node_id
		getwaypointpos name = <start_node_id>
		getwaypointdir name = <start_node_id>
		<lock_target> :obj_setposition position = <pos>
		<lock_target> :obj_setorientation dir = <dir>
	else
		suffix = ('_' + <node>)
		appendsuffixtochecksum base = <pak> suffixstring = <suffix>
		if compositeobjectexists name = <appended_id>
			<appended_id> :obj_getposition
			<lock_target> :obj_setposition position = <pos>
			<appended_id> :obj_getorientation
			dir = ((1.0, 0.0, 0.0) * <x> + (0.0, 1.0, 0.0) * <y> + (0.0, 0.0, 1.0) * <z>)
			<lock_target> :obj_setorientation dir = <dir>
		else
			printf channel = anim_info qs(0xc0212f38) a = <appended_id>
		endif
	endif
	if NOT gotparam \{tempo_anim}
		tempo_anim = <anim>
	endif
	if NOT compositeobjectexists name = <lock_target>
		scriptassert qs(0x9e08b783) a = <lock_target>
		return
	endif
	<lock_target> :obj_killspawnedscript name = momentcamera_playanim_spawned
	<lock_target> :obj_spawnscriptnow momentcamera_playanim_spawned params = {anim = <anim> tempoanim = <tempo_anim> cycle = <cycle> start = <start> blendduration = <blendduration>}
	setsearchallassetcontexts \{off}
endscript

script momentcamera_playanim_spawned \{start = 0.0
		speed = 1.0
		blendduration = -1.0}
	printf \{qs(0xc2684cb9)}
	begin
	setsearchallassetcontexts
	if NOT gotparam \{anim}
		anim_getdefaultanimname
		anim = <defaultanimname>
	endif
	if NOT gotparam \{tempoanim}
		tempoanim = anim
	endif
	removetags \{[
			animrequestedfovradians
		]}
	anim_enable
	anim_command target = body command = degenerateblend_addbranch params = {
		tree = $specialcamera_standardanimbranch
		blendduration = <blendduration>
		params = {
			anim = <anim>
			speed = <speed>
			timertype = tempo
			start = <start>
			animevents = on
			tempoanim = <tempoanim>
			allowbeatskipping = true
		}
	}
	anim_command \{target = bodytimer
		command = timer_waitanimcomplete}
	setsearchallassetcontexts \{off}
	if (<cycle> = 0)
		break
	endif
	repeat
endscript
specialcamera_objectcleanuplist = [
]

script specialcamera_addobjecttocleanuplist 
	<arr> = ($specialcamera_objectcleanuplist)
	addarrayelement array = <arr> element = <name>
	change specialcamera_objectcleanuplist = <array>
	printstruct 'SpecialCamera_ObjectCleanupList' ($specialcamera_objectcleanuplist)
endscript

script specialcamera_cleanupallobjects 
	getarraysize ($specialcamera_objectcleanuplist)
	if (<array_size> > 0)
		<i> = 0
		begin
		<name> = ($specialcamera_objectcleanuplist [<i>])
		printf qs(0xe0118dd3) s = <name>
		if compositeobjectexists name = <name>
			<name> :obj_switchscript specialcamera_cleanupobject
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	change \{specialcamera_objectcleanuplist = [
		]}
endscript

script specialcamera_cleanupobject 
	setsearchallassetcontexts
	anim_getdefaultanimname
	anim = <defaultanimname>
	anim_command target = body command = degenerateblend_addbranch params = {
		tree = $specialcamera_standardanimbranch
		blendduration = 0.0
		params = {
			timertype = play
			anim = <anim>
		}
	}
	setsearchallassetcontexts \{off}
endscript

script specialcamera_playanim \{cycle = 0
		start = 0.0}
	setsearchallassetcontexts
	getpakmancurrent \{map = zones}
	getpakmancurrentname \{map = zones}
	formattext textname = suffix '_%s' s = <obj>
	appendsuffixtochecksum base = <pak> suffixstring = <suffix>
	cameraname = (<pakname> + <suffix>)
	if compositeobjectexists name = <appended_id>
		specialcamera_addobjecttocleanuplist name = <appended_id>
		<appended_id> :obj_switchscript specialcamera_playanim_spawned params = {anim = <anim> cycle = <cycle> start = <start> blendduration = <blendduration>}
	else
		printf qs(0x5f796dcf) s = <cameraname>
	endif
	setsearchallassetcontexts \{off}
endscript

script specialcamera_playanim_spawned \{start = 0.0
		speed = 1.0
		blendduration = -1.0}
	begin
	setsearchallassetcontexts
	if NOT gotparam \{anim}
		anim_getdefaultanimname
		anim = <defaultanimname>
	endif
	if NOT gotparam \{tempoanim}
		tempoanim = anim
	endif
	printf qs(0x0c017022) a = <anim> b = <tempoanim>
	removetags \{[
			animrequestedfovradians
		]}
	anim_enable
	anim_command target = body command = degenerateblend_addbranch params = {
		tree = $specialcamera_standardanimbranch
		blendduration = <blendduration>
		params = {
			anim = <anim>
			speed = <speed>
			timertype = tempo
			start = <start>
			animevents = on
			tempoanim = <tempoanim>
			allowbeatskipping = true
		}
	}
	specialcamera_waitanimfinished
	setsearchallassetcontexts \{off}
	if (<cycle> = 0)
		break
	endif
	repeat
endscript

script specialcamera_waitanimfinished \{timer = bodytimer}
	anim_command target = <timer> command = timer_waitanimcomplete
endscript
specialcamera_standardanimbranch = {
	type = timertype
	id = bodytimer
	anim = anim
	tempo_anim = tempoanim
	anim_events = animevents
	allow_beat_skipping = allowbeatskipping
	speed = speed
	start = start
	[
		{
			type = source
			anim = anim
		}
	]
}

script transition_playanim \{cycle = 0}
	<obj> :obj_switchscript transition_playanim_spawned params = {anim = <anim> cycle = <cycle> blendduration = <blendduration>}
endscript

script transition_playanim_spawned 
	begin
	gameobj_playanim anim = <anim> blendduration = <blendduration>
	gameobj_waitanimfinished
	if (<cycle> = 0)
		break
	endif
	repeat
endscript

script transition_cameracut 
	if gotparam \{prefix}
		cameracuts_setarrayprefix <...> length = <transition_time>
	else
		if NOT ($current_playing_transition = none)
			transition_getprefix type = ($current_playing_transition)
		else
			transition_getprefix \{type = intro}
		endif
		getpakmancurrentname \{map = zones}
		formattext checksumname = cameras_array 'default_cameras_%t' t = <type_textnl>
		formattext textname = prefix 'cameras_%t' t = <type_textnl>
		if NOT globalexists name = <cameras_array>
			formattext checksumname = cameras_array '%s_cameras_%t' s = <pakname> t = <type_textnl>
			if NOT globalexists name = <cameras_array>
				prefix = 'cameras_intro'
			endif
		endif
		cameracuts_setarrayprefix <...> length = <transition_time>
	endif
endscript

script transition_stoprendering 
	printf \{qs(0x61460438)}
	stoprendering
endscript

script transition_startrendering 
	printf \{qs(0xeddd15af)}
	startrendering
	change \{is_changing_levels = 0}
	if ($blade_active = 1 && $current_playing_transition != careerintro)
		change \{blade_active = 0}
		if ($g_in_tutorial = 0)
			gh3_start_pressed \{from_handler}
		endif
	endif
endscript

script transition_printf 
	printf <...>
endscript

script transitions_resetzone 
	printf \{qs(0x119c40dd)}
	getpakmancurrentname \{map = zones}
	formattext checksumname = reset_func '%s_ResetTransition' s = <pakname>
	if scriptexists <reset_func>
		<reset_func>
	endif
	formattext checksumname = nodearray_checksum '%s_NodeArray' s = <pakname>
	if NOT globalexists name = <nodearray_checksum> type = array
		return
	endif
	getarraysize $<nodearray_checksum>
	array_count = 0
	begin
	resetvalid = true
	if gotparam \{profile}
		resetvalid = false
		if structurecontains structure = ($<nodearray_checksum> [<array_count>]) profile
			if comparestructs struct1 = ($<nodearray_checksum> [<array_count>].profile) struct2 = (<profile>)
				resetvalid = true
			endif
		endif
	endif
	if structurecontains structure = ($<nodearray_checksum> [<array_count>]) createdfromvariable
		resetvalid = false
	endif
	if structurecontains structure = ($<nodearray_checksum> [<array_count>]) createdonprogress
		resetvalid = false
	endif
	if structurecontains structure = ($<nodearray_checksum> [<array_count>]) class
		if NOT ($<nodearray_checksum> [<array_count>].class = gameobject ||
				$<nodearray_checksum> [<array_count>].class = levelgeometry ||
				$<nodearray_checksum> [<array_count>].class = levelobject)
			resetvalid = false
		endif
	else
		resetvalid = false
	endif
	if (<resetvalid> = true)
		printf qs(0x9f03166a) s = ($<nodearray_checksum> [<array_count>].name)
		kill name = ($<nodearray_checksum> [<array_count>].name)
		if structurecontains structure = ($<nodearray_checksum> [<array_count>]) createdatstart
			create name = ($<nodearray_checksum> [<array_count>].name)
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
endscript

script common_intro_transitionsetup 
	printf \{channel = sfx
		qs(0x0ea33ed5)}
	preload_celeb_intro_stream
endscript

script common_preencore_transitionsetup 
	change_crowd_looping_sfx \{crowd_looping_state = good}
endscript

script common_preencore_transitionend 
endscript

script finalbandintro_transitionsetup 
	printf \{channel = sfx
		qs(0x86acca66)}
	transition_getprefix type = ($current_playing_transition)
	if NOT ($celeb_intro_stream_id = none)
		stopsound unique_id = ($celeb_intro_stream_id)
		change \{celeb_intro_stream_id = none}
	endif
	preloadstream \{intro_finalgig}
	change celeb_intro_stream_id = <unique_id>
endscript

script common_finalbandoutro_transitionsetup 
	printf \{channel = sfx
		qs(0x52f3ee09)}
	if NOT ($celeb_intro_stream_id = none)
		stopsound unique_id = ($celeb_intro_stream_id)
		change \{celeb_intro_stream_id = none}
	endif
	preloadstream \{encore_finalgig}
	change celeb_intro_stream_id = <unique_id>
	begin
	printf \{qs(0xb1fb7278)}
	if preloadstreamdone <unique_id>
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script common_encore_transitionsetup 
	printf \{channel = sfx
		qs(0x456e2c58)}
	preload_encore_event_stream
endscript

script common_boss_transitionsetup 
endscript

script common_encore_transitionend 
endscript

script preload_encore_bink_audio \{movie_name = 'z_artdeco_encore_audio'}
endscript

script common_loading_transitionsetup 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_metalfest
		soundevent \{event = large_ext_crowd_song_transition}
		case z_newyork
		soundevent \{event = large_ext_crowd_song_transition}
		case z_goth
		soundevent \{event = medium_int_crowd_song_transition}
		case z_cathedral
		soundevent \{event = medium_int_crowd_song_transition}
		case z_fairgrounds
		soundevent \{event = medium_int_crowd_song_transition}
		case z_ballpark
		soundevent \{event = medium_int_crowd_song_transition}
		case z_castle
		soundevent \{event = medium_int_crowd_song_transition}
		case z_military
		soundevent \{event = medium_int_crowd_song_transition}
		case z_harbor
		soundevent \{event = medium_int_crowd_song_transition}
		case z_scifi
		soundevent \{event = medium_int_crowd_song_transition}
		case z_submarine
		soundevent \{event = medium_int_crowd_song_transition}
		default
		printf \{channel = sfx
			qs(0x21a8e0d5)}
	endswitch
	soundevent \{event = $current_crowd_swell_short_soundevent_l}
	soundevent \{event = $current_crowd_swell_short_soundevent_r}
	soundevent \{event = $current_crowd_swell_med_soundevent_l}
	soundevent \{event = $current_crowd_swell_med_soundevent_r}
	soundevent \{event = $current_crowd_swell_long_soundevent_l}
	soundevent \{event = $current_crowd_swell_long_soundevent_r}
	soundevent \{event = oneshotsbetweensongs}
	soundevent \{event = surgebetweensongs}
endscript
celeb_intro_stream_id = none

script preload_celeb_intro_stream 
	printf \{channel = sfx
		qs(0x9f3ca4a3)}
	transition_getprefix type = ($current_playing_transition)
	if NOT ($celeb_intro_stream_id = none)
		stopsound unique_id = ($celeb_intro_stream_id)
		change \{celeb_intro_stream_id = none}
	endif
	if (<celeb_intro> = 0)
		return
	endif
	celeb_intro_checksum = ($current_playing_transition)
	preloadstream <celeb_intro_checksum>
	change celeb_intro_stream_id = <unique_id>
	begin
	printf \{qs(0x50818c55)}
	if preloadstreamdone <unique_id>
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script start_preloaded_celeb_intro_stream 
	printf \{channel = sfx
		qs(0x9ff5df66)}
	if NOT ($celeb_intro_stream_id = none)
		startpreloadedstream \{$celeb_intro_stream_id
			buss = encore_events
			forcesafepreload = 1
			pitch = 100}
		change \{celeb_intro_stream_id = none}
	endif
endscript
encore_event_stream_id = none

script preload_encore_event_stream 
	printf \{channel = sfx
		qs(0x03f14c32)}
	if NOT ($encore_event_stream_id = none)
		stopsound unique_id = ($encore_event_stream_id)
		change \{encore_event_stream_id = none}
	endif
	getpakmancurrentname \{map = zones}
	formattext checksumname = encore_stream_name '%s_encore' s = <pakname> addtostringlookup = true
	preloadstream <encore_stream_name>
	change encore_event_stream_id = <unique_id>
	begin
	printf \{qs(0x93305209)}
	if preloadstreamdone <unique_id>
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script start_preloaded_encore_event_stream 
	printf \{channel = sfx
		qs(0x72abc744)}
	if NOT ($encore_event_stream_id = none)
		stopsoundevent \{$current_crowd_encore
			fade_time = 3
			fade_type = linear}
		printf \{channel = sfx
			qs(0x554dbcd0)}
		startpreloadedstream \{$encore_event_stream_id
			buss = encore_events
			forcesafepreload = 1
			pitch = 100}
		killspawnedscript \{name = loading_screen_crowd_swell}
		killspawnedscript \{name = crowd_loading_whistle}
		setsoundbussparams {crowd_beds = {vol = (($default_bussset.crowd_beds.vol))} time = 2}
		change \{encore_event_stream_id = none}
	endif
endscript

script start_preloaded_finalbandoutro_stream 
	printf \{channel = sfx
		qs(0x12d0a014)}
	if NOT ($celeb_intro_stream_id = none)
		stopsoundevent \{$current_crowd_encore
			fade_time = 2.5
			fade_type = log_slow}
		startpreloadedstream \{$celeb_intro_stream_id
			buss = encore_events
			forcesafepreload = 1
			pitch = 100}
		change \{celeb_intro_stream_id = none}
	endif
endscript

script kill_transition_preload_streams 
	killspawnedscript \{name = preload_encore_event_stream}
	killspawnedscript \{name = preload_celeb_intro_stream}
	change \{encore_event_stream_id = none}
	change \{celeb_intro_stream_id = none}
endscript

script default_camera_intro_lemmy 
	cameracuts_calctime
	getpakmancurrent \{map = zones}
	extendcrc <pak> '_TRG_Geo_Camera_Performance_SING01' out = cam_id
	ccam_domorph {
		lockto = <cam_id>
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		fov = 71.0
	}
	ccam_waitmorph
	cameracuts_waitscript camera_songtime = <camera_songtime>
endscript

script default_camera_intro_kingdiamond 
	cameracuts_calctime
	getpakmancurrent \{map = zones}
	extendcrc <pak> '_TRG_Geo_Camera_Performance_SING01' out = cam_id
	ccam_domorph {
		lockto = <cam_id>
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		fov = 71.0
	}
	ccam_waitmorph
	cameracuts_waitscript camera_songtime = <camera_songtime>
endscript
