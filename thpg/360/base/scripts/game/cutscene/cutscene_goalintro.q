
script CutsceneGoalIntro_Setup 
	startdelaysystemui
	sysnotify_remove_ps3_blackout
	requireparams [objectplaybackrefs] all
	if gotparam goalretry
		<transitionfromgame> = false
	endif
	if (<transitionfromgame> = true)
		playigccam play_hold name = placeholder_cut_freeze controlscript = CutsceneGoalIntro_CameraFreeze
	endif
	MakeSkaterGoto CutsceneGoalIntro_SkaterState
	CutsceneGoalIntro_DebugGoalSetup <...>
	spawnscriptnow IGC_audioparams_start
	cutscene_remove_rigger_pieces
	cut_gs_initheaps
	cut_gel_initobjectlist
	cut_gel_processrefobjects
	if NOT cd
		<padtime> = RandomRange (0.75, 1.25)
		wait <padtime> seconds
	endif
	cut_gel_loaddata
	cut_gel_waitloadfinished
	cutscene_preload_bink <...>
	cutscene_wait_bink <...>
	cut_gel_preloadaudiostream
	cut_gel_waitpreloadaudiostreamfinished
	CutsceneGoalIntro_ProcessTransition <...>
	cut_gel_createinstances
	cut_gel_pauserefobjects pause = true
	cutscene_start_bink <...>
	broadcastevent type = CutsceneSetupFinished
endscript

script CutsceneGoalIntro_Cleanup 
	broadcastevent type = CutsceneCleanupStarted
	stoprendering
	spawnscriptnow IGC_audioparams_end
	CutsceneGoalIntro_KillOverrideIGCCamera
	cut_gel_blendout time = 0
	cut_gs_restorerefobjects
	flushcutscenedestroylist
	cutscene_kill_bink <...>
	cut_gel_destroyinstances
	cut_gel_unloaddata
	cut_gel_waitunloadfinished
	cut_gel_destroydata
	cut_gs_destroyheaps
	tod_proxim_create_lightfx
	tod_proxim_reapply_lightfx
	cutscene_restore_rigger_pieces
	skater :enableplayerinput
	skater :enablecameracontrol
	enableactuators 1
	MakeSkaterGoto SkaterInit params = {walking}
	broadcastevent type = CutsceneCleanupFinished
	stopdelaysystemui
	igc_temporarily_disable_rendering 3 gameframes
endscript

script cut_refobj_getangle 
	obj_getorientationvectors
	rotatevector quat = <startquat> vector = (0.0, 0.0, 1.0)
	getangle vec1 = <front_vector> vec2 = <result_vector> rot_axis = y
	if ((<result_vector>.<left_vector>) < 0.0)
		<angle> = (0.0 - <angle>)
	endif
	return angle = <angle>
endscript

script cutscenegoalintro_staticposition 
	printf "=== CutsceneGoalIntro_StaticPosition"
	printstruct <...>
	if obj_hascomponent navigation
		navigation_enable off
		navigation_pauselinearmotionextraction
		navigation_pauserotationalmotionextraction
	endif
	if gotparam transitiontime
		obj_movetopos <startpos> time = <transitiontime>
		cut_refobj_getangle startquat = <startquat>
		obj_rotate relative = ((0.0, 1.0, 0.0) * <angle>) time = <transitiontime>
	else
		obj_setposition position = <startpos>
		obj_setorientation quat = <startquat>
	endif
endscript

script cutscenegoalintro_restorerefobject 
	printf \{"== CutsceneGoalIntro_RestoreRefObject"}
	anim_updatepose
	wait \{1
		gameframes}
	unpause
	wait \{1
		gameframes}
	if obj_hascomponent \{navigation}
		navigation_enable
		navigation_resumelinearmotionextraction
		navigation_resumerotationalmotionextraction
	endif
	cutscene_bounding_sphere_mondo_last_minute_Hack
endscript

script cutscenegoalintro_staticpositionskater 
	printf \{"CutsceneGoalIntro_StaticPositionSkater"}
	printstruct <...>
	if gotparam \{transitiontime}
		obj_movetopos <startpos> time = <transitiontime>
		cut_refobj_getangle startquat = <startquat>
		rotate y = <angle> duration = <transitiontime> seconds
	else
		obj_movetopos <startpos>
		setorientation quat = <startquat>
	endif
endscript

script CutsceneGoalIntro_SkaterState 
	SkaterInit ReturnControl no_lurch NoEndRun
	disableplayerinput
	disablecameracontrol
	vibrate off
	enableactuators 0
	pausephysics
	blend_in_below_body_ik blendduration = 0.0 strength = 0.0
	if anim_animnodeexists id = BodyPoseCapture
		anim_command {
			target = BodyPoseCapture
			command = posecapture_capture
		}
	endif
	<blendduration> = 0.2
	anim_command command = degenerateblend_setnextblendduration params = {<blendduration>}
	if NOT walking
		skater_playanim anim = sk8_w_sk8tostnd_stopped_f blendperiod = <blendduration> speed = 1.5
		skater_waitanimfinished
	endif
	skater_playanim anim = Sk8_Misc_IGC_Idle_Stand_F cycle blendperiod = <blendduration>
endscript

script cutscenegoalintro_restoreskater 
	printf \{"CutsceneGoalIntro_RestoreSkater"}
	anim_updatepose
	wait \{1
		gameframes}
	unpause
	wait \{1
		gameframes}
	obj_setboundingsphere \{10.0}
	unfreeze_skater_after_cinematic
endscript

script CutsceneGoalIntro_ProcessTransition 
	requireparams [transitionfromgame CameraMode] all
	if (<transitionfromgame> = true)
		requireparams [transitiontime] all
		cut_gs_calculatetransition transitionfromgame = true transitiontime = <transitiontime>
		if (<CameraMode> = cutscene)
			obj_spawnscriptnow CutsceneGoalIntroTransition_CutData params = <...>
		else
			scriptassert "dynamic camera is deprecated"
		endif
		<blend_time> = 0.35000002
		wait (<transitiontime> - (<blend_time> * 0.8)) seconds
		cut_gel_blendin time = <blend_time>
		block type = Cutscene_CameraTransitionFinished
	else
		cut_gs_calculatetransition transitionfromgame = false
		cut_gel_blendin time = 0
	endif
	if (<CameraMode> = cutscene)
		cut_gel_getcamerainfo set
		cut_gel_setoverridescamera true
	endif
endscript

script CutsceneGoalIntroTransition_CutData 
	requireparams \{[
			transitiontime
		]
		all}
	cut_gel_getcamerainfo \{set}
	playigccam {
		name = cutscene_intro_cam
		controlscript = CutsceneGoalIntroTransition_CutData_ControlScript
		params = {
			transitiontime = <transitiontime>
			pos = <pos>
			quat = <quat>
			fov = <fov>
		}
		play_hold
	}
	killcamanim \{name = placeholder_cut_freeze}
	block \{type = CutsceneCleanupStarted}
	killcamanim \{name = cutscene_intro_cam}
endscript

script CutsceneGoalIntroTransition_CutData_ControlScript 
	requireparams \{[
			pos
			quat
			fov
			transitiontime
		]
		all}
	ccam_domorph {
		usingcameracoordinates
		lockto = world
		pos = <pos>
		quat = <quat>
		fov = <fov>
		time = <transitiontime>
	}
	ccam_waitmorph
	broadcastevent \{type = Cutscene_CameraTransitionFinished}
endscript

script CutsceneGoalIntro_DebugGoalSetup 
	if gotparam \{from_menu}
		if gotparam \{DebugGoal}
			goal_track_debug_force_progression goal = <DebugGoal>
		endif
	endif
endscript

script CutsceneGoalIntro_CameraFreeze 
	igc_camera_movetoplayer
	ccam_enablehandcam \{shakeenabled = true
		driftenabled = true}
	ccam_domorph \{lookat = skater
		lookatbone = bone_chest
		fov = 62.0
		time = 2.0
		motion = ease_out}
endscript

script CutsceneGoalIntro_EnableCutsceneCamera 
	moviemembfunc \{name = cutscene
		func = cut_gel_setoverridescamera
		params = {
			true
		}}
endscript

script CutsceneGoalIntro_DisableCutsceneCamera 
	moviemembfunc \{name = cutscene
		func = cut_gel_setoverridescamera
		params = {
			false
		}}
endscript

script CutsceneGoalIntro_PlayOverrideIGCCamera 
	playigccam {
		<...>
		insert_before = cutscene
		name = cutscene_igc_override
	}
endscript

script CutsceneGoalIntro_KillOverrideIGCCamera 
	killcamanim \{name = cutscene_igc_override}
endscript
