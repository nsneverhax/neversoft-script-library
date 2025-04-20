cutscene_frame_advance_delay = 10
todmanager_temp_tod_changed = 0
TODManagerActiveBeforeCutscene = 0
cutscene_old_game_framerate = 0
music_disable_track_timer = 0
cutscene_fademusic_time = 0.5
cutscene_fadetoblack_time = 0.3
cutscene_refobject_fallback = {
	profile = pro_hawk
}
cutscene_heapsize_small_main = 4127744
cutscene_heapsize_large_main = 5176320
cutscene_heapsize_small_vram = 4194304
cutscene_heapsize_large_vram = 6290432
cutscene_heapsize_slop_main = 0
cutscene_heapsize_slop_vram = 0
skate_cutscene_modes = [
	{
		name = full
		scr_setup = CutsceneFull_Setup
		scr_cleanup = CutsceneFull_Cleanup
	}
	{
		name = Goalintro
		scr_setup = CutsceneGoalIntro_Setup
		scr_cleanup = CutsceneGoalIntro_Cleanup
	}
]
cutscene_bink_textureslot = 2
cutscene_special_case_objects_kill = [
	Z_Love_GFX_Wind_Trash1
	Z_Love_GFX_Wind_Trash2
	Z_Love_GFX_Wind_Trash3
	Z_Love_GFX_Wind_Trash4
	Z_Love_GFX_Wind_Trash5
	Z_Love_GFX_Wind_Leaves1
	Z_Love_GFX_Wind_Leaves2
	Z_Love_GFX_Wind_Leaves3
	Z_Love_GFX_Wind_Leaves4
	Z_Love_GFX_Wind_Leaves5
	Z_Love_GFX_Wind_Leaves6
	Z_Monuments_GFX_Wind_Trash1
	Z_Monuments_GFX_Wind_Trash2
	Z_Monuments_GFX_Wind_Trash3
	Z_Monuments_GFX_Wind_Trash4
	Z_Monuments_GFX_Wind_Trash5
	Z_Monuments_GFX_Wind_Trash6
	Z_Monuments_GFX_Wind_Leaves1
	Z_Monuments_GFX_Wind_Leaves2
	Z_Monuments_GFX_Wind_Leaves3
	Z_Monuments_GFX_Wind_Leaves4
	Z_Monuments_GFX_Wind_Leaves5
	Z_Monuments_GFX_Wind_Leaves6
	Z_Monuments_GFX_Wind_Leaves7
	Z_Monuments_GFX_Wind_Leaves8
	Z_Monuments_GFX_Wind_Leaves9
	Z_Monuments_GFX_Wind_Leaves10
	Z_Monuments_GFX_Wind_FallingLeaves1
	Z_Monuments_GFX_Wind_FallingLeaves2
	Z_Monuments_GFX_Wind_FallingLeaves3
	Z_Monuments_GFX_Wind_FallingLeaves4
	Z_Monuments_GFX_Wind_FallingLeaves5
	Z_Monuments_GFX_Wind_FallingLeaves6
	Z_Monuments_GFX_Wind_FallingLeaves7
	Z_Monuments_GFX_Wind_FallingLeaves8
	Z_Monuments_GFX_Wind_FallingLeaves9
	Z_Museums_GFX_Wind_FallingLeaves1
	Z_Museums_GFX_Wind_FallingLeaves2
	Z_Museums_GFX_Wind_FallingLeaves3
	Z_Museums_GFX_Wind_FallingLeaves4
	Z_Museums_GFX_Wind_FallingLeaves5
	Z_Museums_GFX_Wind_FallingLeaves6
	Z_Museums_GFX_Wind_FallingLeaves7
	Z_Museums_GFX_Wind_FallingLeaves8
	Z_Museums_GFX_Wind_Leaves1
	Z_Museums_GFX_Wind_Leaves2
	Z_Museums_GFX_Wind_Leaves3
	Z_Museums_GFX_Wind_Leaves4
	Z_Museums_GFX_Wind_Leaves5
	Z_Museums_GFX_Wind_Leaves6
	Z_BCity_GFX_Wind_FallingLeaves1
	Z_BCity_GFX_Wind_FallingLeaves02
	Z_BCity_GFX_Wind_FallingLeaves03
	Z_BCity_GFX_Wind_Leaves1
	Z_BCity_GFX_Wind_Trash1
	Z_BCity_GFX_Wind_Trash02
	Z_Harbor_GFX_Wind_FallingLeaves1
	Z_Harbor_GFX_Wind_FallingLeaves2
	Z_Harbor_GFX_Wind_FallingLeaves3
	Z_Harbor_GFX_Wind_FallingLeaves4
	Z_Harbor_GFX_Wind_FallingLeaves5
	Z_Harbor_GFX_Wind_FallingLeaves6
	Z_Harbor_GFX_Wind_FallingLeaves7
	Z_Harbor_GFX_Wind_FallingLeaves8
	Z_Harbor_GFX_Wind_Leaves1
	Z_Harbor_GFX_Wind_Trash1
]
cutscene_special_case_objects_unpause = [
	Z_BCity_GFX_BCity_WaterSpray02
	Z_BCity_GFX_BCity_WaterSpray03
	Z_BCity_GFX_BCity_WaterSpray04
	Z_BCity_GFX_BCity_WaterSpray05
	Z_BCity_GFX_BCity_WaterSpray06
	Z_BCity_GFX_BCity_WaterSpray07
	Z_Love_GFX_PH_Love_Waterbits_01
	Z_Love_GFX_PH_Love_Waterbits_02
	Z_Love_GFX_PH_Love_WaterGurgle
	Z_Love_GFX_PH_WaterJet_01
	Z_Bcity_GFX_PH_Waterspray_A_A
	Z_Bcity_GFX_PH_Waterspray_A_B
	Z_Bcity_GFX_PH_Waterspray_A_C
	Z_Bcity_GFX_PH_Waterspray_A_D
	Z_Bcity_GFX_PH_Waterspray_B_A
	Z_Bcity_GFX_PH_Waterspray_B_B
	Z_Bcity_GFX_PH_Waterspray_B_C
	Z_Bcity_GFX_PH_Waterspray_B_D
	Z_Bcity_GFX_PH_Waterspray_C_A
	Z_Bcity_GFX_PH_Waterspray_C_B
	Z_Bcity_GFX_PH_Waterspray_C_C
	Z_Bcity_GFX_PH_Waterspray_C_D
	Z_Bcity_GFX_PH_Waterspray_tall_00
	Z_Bcity_GFX_PH_Waterspray_tall_01
	Z_Bcity_GFX_PH_Waterspray_tall_02
	Z_Bcity_GFX_PH_Waterspray_tall_03
	Z_Bcity_GFX_PH_Waterspray_tall_04
	Z_Bcity_GFX_PH_Waterspray_tall_05
	Z_Bcity_GFX_PH_Waterspray_tall_06
	Z_Bcity_GFX_PH_Waterspray_tall_07
	Z_Bcity_GFX_PH_Waterspray_tall_08
	Z_Bcity_GFX_PH_Waterspray_tall_09
	Z_Bcity_GFX_PH_Waterspray_tall_10
	Z_Bcity_GFX_PH_Waterspray_tall_11
]

script cutscene_preload_bink 
	if gotparam \{SyncBink}
		if structurecontains structure = ($cutscene_volume) <name_checksum>
			<sound_vol> = ($cutscene_volume.<name_checksum>)
		else
			<sound_vol> = 100
		endif
		preloadmovie movie = <SyncBink> textureslot = $cutscene_bink_textureslot no_hold no_looping sound_volume = <sound_vol>
	endif
endscript

script cutscene_wait_bink 
	if gotparam \{SyncBink}
		begin
		if ismoviepreloaded \{textureslot = $cutscene_bink_textureslot}
			break
		else
			wait \{1
				gameframes}
		endif
		repeat
	endif
endscript

script cutscene_start_bink 
	if gotparam \{SyncBink}
		startpreloadedmovie \{textureslot = $cutscene_bink_textureslot}
	endif
endscript

script cutscene_kill_bink 
	if gotparam \{SyncBink}
		killmovie \{textureslot = $cutscene_bink_textureslot}
	endif
endscript
intro_cutscene_soundbuss_active = 0

script CutscenePauseMusicAndPlaylistTimer 
	printf \{"CutscenePauseMusicAndPlaylistTimer"}
	pausesoundsbybuss \{user_music}
	change \{music_disable_track_timer = 1}
endscript

script CutsceneUnPauseMusicAndPlaylistTimer 
	printf \{"CutsceneUnPauseMusicAndPlaylistTimer"}
	unpausesoundsbybuss \{user_music}
	change \{music_disable_track_timer = 0}
endscript

script cutscene_handle_special_case_objects 
	getarraysize $cutscene_special_case_objects_kill
	if (<array_size> > 0)
		<i> = 0
		begin
		<obj> = ($cutscene_special_case_objects_kill [<i>])
		if gotparam start
			if compositeobjectexists name = <obj>
				kill name = <obj>
			endif
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	getarraysize $cutscene_special_case_objects_unpause
	if (<array_size> > 0)
		<i> = 0
		begin
		<obj> = ($cutscene_special_case_objects_unpause [<i>])
		if gotparam start
			if compositeobjectexists name = <obj>
				<obj> :unpause
			endif
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
endscript

script CutsceneApplyLightGroup 
	if compositeobjectexists <id>
		if <id> :obj_hascomponent proximtrigger
			<id> :proximtrigger_setactive active = 0
		endif
		applylightgroup id = <id> lightgroup = <lightgroup>
		if cutscenedestroylistactive
			manglechecksums a = <id> b = <lightgroup>
			addtocutscenedestroylist {
				destroy_func = CutsceneRemoveLightGroupFunc
				name = <mangled_id>
				destroy_params = {
					id = <id>
				}
			}
		endif
	else
		printf "cutscene error: setting light group on object that doesn't exist: %s" s = <id>
	endif
endscript

script CutsceneRemoveLightGroupFunc 
	if compositeobjectexists <id>
		RemoveCurLightGroup id = <id>
		if <id> :obj_hascomponent proximtrigger
			<id> :proximtrigger_setactive active = 1
		endif
	endif
endscript

script CutsceneSetLightFlag 
	setlightflag name = <name> shadow
	if cutscenedestroylistactive
		manglechecksums a = <name> b = shadow_flag
		removefromcutscenedestroylist name = <mangled_id>
		addtocutscenedestroylist {
			destroy_func = clearlightflag
			name = <mangled_id>
			destroy_params = {
				name = <name>
				shadow
			}
		}
	endif
endscript

script CutsceneClearLightFlag 
	clearlightflag name = <name> shadow
	if cutscenedestroylistactive
		manglechecksums a = <name> b = shadow_flag
		removefromcutscenedestroylist name = <mangled_id>
		addtocutscenedestroylist {
			destroy_func = setlightflag
			name = <mangled_id>
			destroy_params = {
				name = <name>
				shadow
			}
		}
	endif
endscript

script CutsceneEnableLightGroup 
	enablelightgroup name = <name>
	if cutscenedestroylistactive
		manglechecksums a = <name> b = lightgroup
		removefromcutscenedestroylist name = <mangled_id>
		addtocutscenedestroylist {
			destroy_func = disablelightgroup
			name = <mangled_id>
			destroy_params = {
				name = <name>
			}
		}
	endif
endscript

script CutsceneDisableLightGroup 
	disablelightgroup name = <name>
	if cutscenedestroylistactive
		manglechecksums a = <name> b = lightgroup
		removefromcutscenedestroylist name = <mangled_id>
		addtocutscenedestroylist {
			destroy_func = enablelightgroup
			name = <mangled_id>
			destroy_params = {
				name = <name>
			}
		}
	endif
endscript

script CutsceneStartFullscreenMovie {
		movie = 'ClassicGoal_Left'
		textureslot = 1
		loop_start = -1
		loop_end = -1
	}
	if istrue $output_cutscene_video
		return
	endif
	playmovie {
		movie = <movie>
		textureslot = <textureslot>
		texturepri = 0
		start_frame = <start_frame>
		loop_start = <loop_start>
		loop_end = <loop_end>
		nowait
	}
	if cutscenedestroylistactive
		addtocutscenedestroylist {
			destroy_func = CutsceneEndFullscreenMovieFunc
			name = fullscreen_bink
			destroy_params = {
				textureslot = <textureslot>
			}
		}
	endif
endscript

script CutsceneEndFullscreenMovie 
	if cutscenedestroylistactive
		removefromcutscenedestroylist \{name = fullscreen_bink
			run_destroy_func}
	endif
endscript

script CutsceneEndFullscreenMovieFunc 
	killmovie textureslot = <textureslot> nowait
endscript

script CutsceneMagazineSnapshot 
	spawnscriptnow CutsceneMagazineSnapshot_Spawned params = <...>
endscript

script CutsceneMagazineSnapshot_Spawned 
	requireparams [texture objectname] all
	pushassetcontext context = cutscene
	moviemembfunc {
		name = cutscene
		func = cut_gel_getcamerainfo
		params = {current}
	}
	CutsceneCreateViewport {
		texture = <texture>
		objectname = <objectname>
		controlscript = CutsceneMagazineSnapshot_ControlScript
		ControlScriptParams = {pos = <pos> quat = <quat> fov = <fov>}
		style = viewport_photo
		play_hold = 0
	}
	popassetcontext
	screenflash time = 0.5
endscript

script CutsceneMagazineSnapshot_ControlScript 
	ccam_domorph {
		pos = <pos>
		quat = <quat>
		fov = <fov>
		usingcameracoordinates
	}
	wait \{1
		gameframes}
endscript

script CutsceneCreateViewport {
		texturePath = 'tex/models/cutscenes'
		texDictPath = 'cutscenes'
		style = viewport_element
		play_hold = 1
	}
	if istrue $output_cutscene_video
		if gotparam objectname
			formattext checksumname = obj <objectname>
			<obj> :hide
		endif
		return
	endif
	printf "CutsceneCreateViewport"
	if gotparam objectname
		getskatercamanimparams name = cutscene
		if NOT gotparam texture
			formattext checksumname = texture '%p/%o.png' p = <texturePath> o = <objectname>
		endif
		formattext checksumname = texdict '%p/%c/%o.tex' p = <texDictPath> c = <cutname> o = <objectname>
	endif
	if NOT gotparam id
		manglechecksums a = <texture> b = viewport
		<id> = <mangled_id>
	endif
	if NOT gotparam texture
		scriptassert "need texture name"
	endif
	mempushcontext bottomupheap
	createviewport {
		id = <id>
		priority = 5
		style = <style>
	}
	createviewporttextureoverride {
		id = <id>
		viewportid = <id>
		texture = <texture>
		texdict = <texdict>
	}
	if gotparam controlscript
		manglechecksums a = <id> b = igccam
		<igccam> = <mangled_id>
		playigccam {
			name = <mangled_id>
			controlscript = <controlscript>
			params = <ControlScriptParams>
			viewport = <id>
			play_hold = <play_hold>
		}
	else
		setactivecamera id = skatercam0 viewport = <id>
	endif
	mempopcontext
	if NOT gotparam no_destroy_list
		if cutscenedestroylistactive
			addtocutscenedestroylist {
				destroy_func = CutsceneDestroyViewport
				name = <id>
				destroy_params = {
					id = <id>
					igccam = <igccam>
				}
			}
		endif
	endif
	return viewport_id = <id>
endscript

script CutsceneDestroyViewport \{id = foo}
	printf \{"CutsceneDestroyViewport"}
	if gotparam \{igccam}
		killskatercamanim name = <igccam>
	endif
	destroyviewporttextureoverride {
		id = <id>
	}
	destroyviewport {
		id = <id>
	}
endscript

script CutsceneCreateMovieSurface {
		movie = 'Houses'
		textureslot = 1
		loop_start = -1
		loop_end = -1
	}
	if istrue $output_cutscene_video
		if gotparam objectname
			formattext checksumname = obj <objectname>
			<obj> :hide
		endif
		return
	endif
	printf "CutsceneCreateMovieSurface"
	CutsceneCreateViewport {
		id = <id>
		texture = <texture>
		texdict = <texdict>
		objectname = <objectname>
		style = cutscene_movie_surface
		no_destroy_list
	}
	if NOT gotparam viewport_id
		scriptassert "expected viewport_id"
	endif
	playmovie {
		movie = <movie>
		textureslot = <textureslot>
		texturepri = 0
		start_frame = <start_frame>
		loop_start = <loop_start>
		loop_end = <loop_end>
		viewport = <viewport_id>
		nowait
	}
	if cutscenedestroylistactive
		manglechecksums a = <viewport_id> b = movie
		addtocutscenedestroylist {
			destroy_func = CutsceneDestroyMovieSurfaceFunc
			name = cutscene_bink_surface
			destroy_params = {
				textureslot = <textureslot>
				viewport_id = <viewport_id>
			}
		}
	endif
endscript

script CutsceneDestroyMovieSurface 
	if cutscenedestroylistactive
		pushassetcontext \{context = cutscene}
		removefromcutscenedestroylist \{name = cutscene_bink_surface
			run_destroy_func}
		popassetcontext
	endif
endscript

script CutsceneDestroyMovieSurfaceFunc 
	printf \{"CutsceneDestroyMovieSurfaceFunc"}
	killmovie textureslot = <textureslot> nowait
	CutsceneDestroyViewport id = <viewport_id>
endscript

script CutsceneCopyModelScale 
	if NOT gotparam from
		scriptassert "Missing param: from"
	endif
	if NOT gotparam to
		scriptassert "Missing param: to"
	endif
	if compositeobjectexists name = <from>
		if compositeobjectexists name = <to>
			<from> :obj_getscaling
			<to> :obj_applyscaling scale = <scaling>
		else
			printf "WARNING: unknown object %s" s = <to>
		endif
	else
		printf "WARNING: unknown object %s" s = <from>
	endif
endscript

script CutsceneFadeIn \{time = 0.0}
	printf \{"cutscene fade in..."}
	killspawnedscript \{name = FadeInCutscene}
	spawnscriptlater FadeInCutscene params = {fadein_time = <time>}
endscript

script CutsceneFadeOut \{time = 0.0}
	printf \{"cutscene fade out..."}
	FadeOutCutscene fadeout_time = <time>
endscript

script FadeInCutscene 
	if NOT gotparam \{fadein_time}
		script_assert \{"no fadein time"}
	endif
	if NOT (<fadein_time> = 0)
		fadetoblack \{on
			time = 0.0
			alpha = 1.0}
		fadetoblack off time = <fadein_time>
	else
		fadetoblack \{off
			time = 0.0}
	endif
endscript

script FadeOutCutscene 
	killspawnedscript \{name = FadeInCutscene}
	if NOT gotparam \{fadeout_time}
		script_assert \{"no fadeout time"}
	endif
	fadetoblack on time = <fadeout_time> alpha = 1.0
endscript

script CutsceneHideUI 
	if NOT gamemodeequals \{is_classic}
		ResetScore
	endif
	sysnotify_remove_ps3_blackout
	spawnscriptnow \{speech_box_exit
		params = {
			anchor_id = goal_start_dialog
			no_pad_start
		}}
	hide_all_hud_items \{dont_disable_screen_effects}
	if skater :isskaterfocused
		toggle_focus
	endif
	setslomo \{1}
	kill_start_key_binding
endscript

script CutsceneUnhideUI 
	sysnotify_remove_ps3_blackout
	show_all_hud_items
	restore_start_key_binding
endscript

script cutscene_debug_goal_load 
	printf "Loading goal main..."
	if Gman_GoalHasMainPak goal = <goal_id>
		GMan_GetPakInfo goal = <goal_id>
		if structurecontains structure = <pak_info> main
			formattext textname = pak_name 'missions/%s/%s.pak' s = (<pak_info>.goal_string)
			loadpak <pak_name>
			addtocutscenedestroylist {
				destroy_func = unloadpak
				name = debug_pak
				destroy_params = {
					<pak_name>
				}
			}
		endif
	endif
endscript

script cutscene_debug_kill_ped 
	<ped_id> :die
endscript

script cutscene_debug_goal_logic 
	if gotparam goal_id
		switch <goal_action>
			case activate
			case intro
			printf "Loading goal intro..."
			gman_initializegoal goal = <goal_id>
			GoalPakManager_WaitForPaks
			case main
			cutscene_debug_goal_load goal_id = <goal_id>
			case both
			printf "Loading both into and main..."
			gman_initializegoal goal = <goal_id>
			GoalPakManager_WaitForPaks
			cutscene_debug_goal_load goal_id = <goal_id>
		endswitch
		wait 2 gameframes
	endif
	if gotparam goal_debug_script
		printf "running additional goal debug script"
		<goal_debug_script>
	endif
endscript

script cutscene_process_transition_params_end 
	if gotparam \{hold_black_on_end}
		return
	endif
	fadetoblack \{off
		time = 0.0}
endscript

script cutscene_process_audio_params_start soundbuss_params = $Generic_IGC_BussSet
	<audio_wait_start_time> = 0
	if gotparam music_track
		PlayTrack <music_track>
	endif
	printpushpopdebuginfo push name = "cutscene_process_audio_params_start"
	pushsoundbussparams
	if ($global_user_sfx_number = 0)
		setsoundbussparams $default_bussset time = $cutscene_fademusic_time
	else
		if gotparam music_track
			setsoundbussparams <soundbuss_params> time = $cutscene_fademusic_time
		else
			setsoundbussparams $Cutscenes_No_Music_BussSet time = $cutscene_fademusic_time
			getstarttime
			<audio_wait_start_time> = <starttime>
		endif
	endif
	return audio_wait_start_time = <audio_wait_start_time>
endscript

script cutscene_process_audio_params_process_pause 
	if NOT (PauseOneshotsCheck = 1)
		change PauseOneshotsCheck = 1
	endif
	if gotparam music_track
		printf "! cutscene pausing sfx"
		pausesoundsbybuss ambience
	else
		if gotparam audio_wait_start_time
			begin
			getelapsedtime starttime = <audio_wait_start_time>
			<elapsedtime> = (<elapsedtime> / 1000.0)
			if (<elapsedtime> > $cutscene_fademusic_time)
				break
			else
				printf "...waiting for audio fade"
			endif
			wait 1 gameframes
			repeat
		endif
		printf "! cutscene pausing music"
		CutscenePauseMusicAndPlaylistTimer
		pausesoundsbybuss ambience
	endif
endscript

script cutscene_process_audio_params_end 
	if NOT (PauseOneshotsCheck = 0)
		change PauseOneshotsCheck = 0
	endif
	if gotparam music_track
		printf "! cutscene unpausing sfx"
		unpausesoundsbybuss ambience
	else
		printf "! cutscene unpausing music"
		CutsceneUnPauseMusicAndPlaylistTimer
		unpausesoundsbybuss ambience
	endif
	printpushpopdebuginfo pop name = "cutscene_process_audio_params_end"
	popsoundbussparams
endscript

script CutsceneEnableRelativeCamera 
	moviemembfunc \{name = cutscene
		func = cut_gel_enablerelativecamera
		params = {
			enable = true
		}}
endscript

script CutsceneDisableRelativeCamera 
	moviemembfunc \{name = cutscene
		func = cut_gel_enablerelativecamera
		params = {
			enable = false
		}}
endscript

script cutscene_remove_rigger_pieces 
	printf \{"cutscene_remove_rigger_pieces"}
	cap_finish
	cap_delete_all_pieces
	unloadpak \{'pak/rigger_pieces/rigger_pieces.pak'}
	waitunloadpak
endscript

script cutscene_restore_rigger_pieces 
	printf \{"cutscene_restore_rigger_pieces"}
	loadpak \{'pak/rigger_pieces/rigger_pieces.pak'
		heap = scratch}
endscript
cutscene_need_restore_peds = 0

script cutscene_kill_vehicles 
	if ($block_pedspawn = 1)
		change \{cutscene_need_restore_peds = 0}
	else
		change \{cutscene_need_restore_peds = 1}
		goal_kill_all_peds
	endif
	unloadpak \{'pak/vehicles/vehicles.pak'}
	waitunloadpak
endscript

script cutscene_restore_vehicles 
	loadpak \{'pak/vehicles/vehicles.pak'
		heap = scratch}
	if ($cutscene_need_restore_peds = 1)
		goal_restore_all_peds
	endif
endscript
cutscene_is_playing = 0

script PreCutscene allowusermusic = true
	spawnscriptnow EndBloom id = EndBloom_ScriptID
	CustsceneDisableFocusNTTBusses
	change cutscene_is_playing = 1
	blockpendingpakmanloads block_scripts = 1
	changenodeflag nodeflag_killed_in_cutscene 0
	skatercam0 :proximtrigger_setactive active = 0
	if (<allowusermusic> = true)
		enableusermusic
	else
		enableusermusic disable
	endif
	cutscene_deactivate_tod_manager
	skater :skaterloopingsound_turnoff
	printf "***Turned skater's looping sound off"
	RunScriptOnComponentType component = skaterloopingsound target = skaterloopingsound_turnoff
	printf "***Running scr on all SkaterLoopingSound components - SkaterLoopingSound_TurnOff!!!"
	skater :vibrate off
	enableactuators 0
	skater :obj_killspawnedscript name = BloodSmall
	skater :obj_killspawnedscript name = BloodSplat
	skater :obj_killspawnedscript name = SkaterBloodOn
	skater :ResetSkaterParticleSystems
	skater :SwitchOnBoard
	CutsceneHideUI
	if screenelementexists id = current_menu_anchor
		destroyscreenelement id = current_menu_anchor
	endif
	goalmanager_hidepoints
	gman_setcanstartgoal 0
	gman_pauseallgoals
	killspawnedscript name = FadeInCutscene
	if isxenon
		setshadowmapparams near = 4.0 far = 16.0
	endif
	PushShadowRenderingFlags
	startdelaysystemui
endscript

script cutscenestartvideo 
	if NOT cd
		ReQBRAll
	endif
	CutsceneHideUI
	fake_letterboxing
endscript

script CustsceneDisableFocusNTTBusses 
	if (($focus_mode_buss_set_active) = 1)
		change \{focus_mode_buss_set_active = 0}
		printpushpopdebuginfo \{pop
			name = "cutscene bullettime off pop"}
		popsoundbussparams
	endif
	if (($ntt_soundbuss_active) = 1)
		change \{ntt_soundbuss_active = 0}
		printpushpopdebuginfo \{pop
			name = "cutscene ntt off pop"}
		popsoundbussparams
	endif
endscript
cutscene_skaterparts_unloaded = 0

script cutscenekillobjects 
	if isarray cutsceneparticletextures
		getarraysize cutsceneparticletextures
		if (<array_size> = 0)
			printf "CutsceneParticleTextures array is empty!"
		else
			<index> = 0
			begin
			<nameString> = (cutsceneparticletextures [<index>])
			unloadtexture <nameString>
			<index> = (<index> + 1)
			repeat <array_size>
		endif
	endif
	if isarray CutsceneObjectNames
		getarraysize CutsceneObjectNames
		if (<array_size> = 0)
			printf "CutsceneObjectNames array is empty!"
		else
			<index> = 0
			begin
			<name> = (CutsceneObjectNames [<index>])
			if compositeobjectexists name = <name>
				<name> :die
			else
			endif
			<index> = (<index> + 1)
			repeat <array_size>
		endif
	endif
endscript

script postcutscene 
	PopShadowRenderingFlags
	kill_cutscene_panel
	kill_cutscene_camera_hud
	cutscene_subtitle_cleanup
	CutsceneUnhideUI
	cutscene_reactivate_tod_manager
	restore_start_key_binding
	enableusermusic
	enableactuators 1
	skatercam0 :proximtrigger_setactive active = 1
	skater :obj_disableambientlight
	skater :unhide
	skater :skeleton_setcustomboneunactivelist $custonunactivebonelist_skaterstandard
	UnhideAllPeds
	changenodeflag nodeflag_killed_in_cutscene 1
	printf "*** turning skater looping sound ON!!!"
	skater :skaterloopingsound_turnon
	printf "***Running scr on all SkaterLoopingSound components - SkaterLoopingSound_TurnOn!!!"
	RunScriptOnComponentType component = skaterloopingsound target = skaterloopingsound_turnon
	if gotparam RestartNode
		resetskaters node_name = <RestartNode>
	endif
	if gamemodeequals is_classic
		resetskaters
	endif
	if NOT gotparam dont_send_skater_to_hand_brake
		if NOT skater :isinbail
			if NOT skater :walking
				skater :OnGroundExceptions
				MakeSkaterGoto StoppedState
				skater :stopbalancetrick
			endif
		endif
	endif
	UnpauseObjects
	if gman_getactivatedgoalid
		gman_toggleallgoaltriggers hide = 1
	endif
	cutscene_handle_special_case_objects
	unpausespawnedscripts
	goalmanager_showpoints
	gman_setcanstartgoal 1
	gman_unpauseallgoals
	fake_letterboxing remove
	if isxenon
		ResetShadowMapParams
	endif
	change cutscene_is_playing = 0
	AllowBoneLOD allow = 1
	stopdelaysystemui
endscript

script cutscene_bounding_sphere_mondo_last_minute_Hack 
	begin
	if compositeobjectexists \{skater}
		skater :obj_setboundingsphere \{200.0}
	endif
	wait \{1
		gameframes}
	repeat (6 + 1)
endscript

script cutsceneobj_add_components 
	createcomponentfromstructure \{component = cutsceneupdate}
	if gotparam \{cutscenedummy}
		return
	endif
	if gotparam \{profile}
		skeletonname = ($<profile>.skeletonname)
	endif
	if gotparam \{skeletonname}
		createcomponentfromstructure component = skeleton <...>
	endif
	createcomponentfromstructure component = model <...> usemodellights max_scene_lights = 1
endscript

script cutscene_restore_skater_model_lights 
	printf \{"cutscene_restore_skater_model_lights"}
	obj_disableambientlight
	obj_disablediffuselight \{index = 0}
	obj_disablediffuselight \{index = 1}
endscript

script cutsceneobj_init_model 
	setsearchallassetcontexts
	if gotparam \{profile}
		if structurecontains structure = $<profile> random_parts
			CreateRandomAppearance profile = $<profile>
			obj_initmodelfromprofile struct = <profile> buildscript = create_ped_model_from_appearance
		else
			obj_initmodelfromprofile struct = $<profile> buildscript = create_ped_model_from_appearance
		endif
	endif
	setsearchallassetcontexts \{off}
endscript

script draw_cutscene_panel 
	if objectexists id = vo_line1
		setscreenelementprops {id = vo_line1 text = <line1>}
	else
		create_panel_message id = vo_line1 text = <line1> style = panel_message_viewobj_line params = {xy = (40.0, 60.0)}
		show_panel_messages
	endif
	if objectexists id = vo_line2
		setscreenelementprops {id = vo_line2 text = <line2>}
	else
		create_panel_message id = vo_line2 text = <line2> style = panel_message_viewobj_line params = {xy = (40.0, 80.0)}
		show_panel_messages
	endif
endscript

script kill_cutscene_panel 
	if objectexists \{id = vo_line1}
		runscriptonscreenelement \{id = vo_line1
			kill_panel_message}
	endif
	if objectexists \{id = vo_line2}
		runscriptonscreenelement \{id = vo_line2
			kill_panel_message}
	endif
endscript

script spawn_next_cutscene 
	PauseObjects
	spawnscriptlater start_next_cutscene params = <...>
endscript

script start_next_cutscene 
	UnpauseObjects
	if gman_getactivatedgoalid
		gman_toggleallgoaltriggers \{hide = 1}
	endif
	playcutscene name = <name> exitscript = <exitscript>
endscript
camera_hud_is_hidden = 0

script show_cutscene_camera_hud mins = 2 secs = 16 frames = 3
	if screenelementexists id = cutscene_camera_hud_anchor
		destroyscreenelement id = cutscene_camera_hud_anchor
	endif
	if gotparam for_goal
		mins = 0 secs = 0 frames = 0
		rec_alpha = 0
		rec_pos = (500.0, 90.0)
	else
		if gotparam play
			rec_alpha = 0
		else
			rec_alpha = 1
		endif
		rec_pos = (500.0, 50.0)
	endif
	setscreenelementlock off id = root_window
	createscreenelement {
		type = containerelement
		id = cutscene_camera_hud_anchor
		parent = root_window
		pos = (320.0, 240.0)
		dims = (640.0, 480.0)
	}
	createscreenelement {
		type = spriteelement
		parent = cutscene_camera_hud_anchor
		id = video_screen
		texture = white
		pos = (320.0, 240.0)
		just = [center center]
		scale = 0
		alpha = 0.3
	}
	createscreenelement {
		type = spriteelement
		id = camera_hud_line
		parent = cutscene_camera_hud_anchor
		texture = white2
		pos = (0.0, 0.0)
		just = [left center]
		scale = (100.0, 0.1)
		alpha = 0.5
	}
	if gotparam play
		createscreenelement {
			type = textelement
			parent = cutscene_camera_hud_anchor
			id = play
			pos = <rec_pos>
			text = "PLAY"
			font = text_a1
			just = [left top]
			scale = 1.5
			rgba = [100 100 100 128]
			alpha = 0.8
		}
	endif
	createscreenelement {
		type = containerelement
		id = rec_anchor
		parent = cutscene_camera_hud_anchor
		pos = (320.0, 240.0)
		dims = (640.0, 480.0)
		alpha = <rec_alpha>
	}
	createscreenelement {
		type = textelement
		parent = rec_anchor
		id = rec
		pos = <rec_pos>
		text = "REC"
		font = text_a1
		just = [left top]
		scale = 1.5
		rgba = [100 0 0 128]
		alpha = 0.8
	}
	GetStackedScreenElementPos x id = rec offset = (10.0, 16.0)
	createscreenelement {
		type = spriteelement
		id = rec_dot
		parent = rec_anchor
		texture = circle
		rgba = [100 0 0 128]
		pos = <pos>
		just = [left center]
		scale = 1.5
		alpha = 0.8
	}
	scale = 1.5
	alpha = 0.6
	font = text_a1
	createscreenelement {
		type = textelement
		parent = cutscene_camera_hud_anchor
		id = mins2
		pos = (450.0, 355.0)
		text = "0"
		font = <font>
		just = [right top]
		scale = <scale>
		alpha = <alpha>
		rgba = <rgba>
	}
	GetStackedScreenElementPos x id = <id> offset = (23.0, 0.0)
	createscreenelement {
		type = textelement
		parent = cutscene_camera_hud_anchor
		id = mins
		pos = <pos>
		text = "0"
		font = <font>
		just = [right top]
		scale = <scale>
		alpha = <alpha>
		rgba = <rgba>
	}
	GetStackedScreenElementPos x id = <id> offset = (5.0, -2.0)
	createscreenelement {
		type = textelement
		parent = cutscene_camera_hud_anchor
		pos = <pos>
		text = ":"
		font = <font>
		just = [left top]
		scale = <scale>
		alpha = <alpha>
		rgba = <rgba>
	}
	GetStackedScreenElementPos x id = <id> offset = (23.0, 2.0)
	createscreenelement {
		type = textelement
		parent = cutscene_camera_hud_anchor
		id = secs2
		pos = <pos>
		text = "0"
		font = <font>
		just = [right top]
		scale = <scale>
		alpha = <alpha>
		rgba = <rgba>
	}
	GetStackedScreenElementPos x id = <id> offset = (23.0, 0.0)
	createscreenelement {
		type = textelement
		parent = cutscene_camera_hud_anchor
		id = secs
		pos = <pos>
		text = "0"
		font = <font>
		just = [right top]
		scale = <scale>
		alpha = <alpha>
		rgba = <rgba>
	}
	GetStackedScreenElementPos x id = <id> offset = (5.0, -2.0)
	createscreenelement {
		type = textelement
		parent = cutscene_camera_hud_anchor
		pos = <pos>
		text = ":"
		font = <font>
		just = [left top]
		scale = <scale>
		alpha = <alpha>
		rgba = <rgba>
	}
	GetStackedScreenElementPos x id = <id> offset = (23.0, 2.0)
	createscreenelement {
		type = textelement
		parent = cutscene_camera_hud_anchor
		id = frames2
		pos = <pos>
		text = "0"
		font = <font>
		just = [right top]
		scale = <scale>
		alpha = <alpha>
		rgba = <rgba>
	}
	GetStackedScreenElementPos x id = <id> offset = (23.0, 0.0)
	createscreenelement {
		type = textelement
		parent = cutscene_camera_hud_anchor
		id = frames
		pos = <pos>
		text = "0"
		font = <font>
		just = [right top]
		scale = <scale>
		alpha = <alpha>
		rgba = <rgba>
	}
	mins2 = (<mins> / 10)
	mins1 = (<mins> - (<mins2> * 10))
	secs2 = (<secs> / 10)
	secs1 = (<secs> - (<secs2> * 10))
	frames2 = (<frames> / 10)
	frames1 = (<frames> - (<frames2> * 10))
	formattext textname = min_text "%m" m = <mins1>
	setscreenelementprops id = mins text = <min_text>
	formattext textname = min_text "%m" m = <mins2>
	setscreenelementprops id = mins2 text = <min_text>
	formattext textname = sec_text "%s" s = <secs1>
	setscreenelementprops id = secs text = <sec_text>
	formattext textname = sec_text "%s" s = <secs2>
	setscreenelementprops id = secs2 text = <sec_text>
	formattext textname = frame_text "%f" f = <frames1>
	setscreenelementprops id = frames text = <frame_text>
	formattext textname = frame_text "%f" f = <frames2>
	setscreenelementprops id = frames2 text = <frame_text>
	mins :settags frames = <frames> secs = <secs> mins = <mins>
	if gotparam fade
		runscriptonscreenelement id = rec_dot cutscene_camera_hud_fade_in
	endif
	runscriptonscreenelement id = video_screen flicker_video_screen
	runscriptonscreenelement id = camera_hud_line morph_camera_hud_line
	runscriptonscreenelement id = rec_dot blink_rec_dot
	if NOT gotparam for_goal
		runscriptonscreenelement id = secs camera_hud_count
	endif
endscript

script kill_cutscene_camera_hud 
	if gotparam \{fade}
		runscriptonscreenelement \{id = rec_dot
			fadetoblack
			params = {
				on
				time = 0.5
				alpha = 1.0
				z_priority = 5
			}}
		runscriptonscreenelement \{id = rec_dot
			really_kill_cutscene_camera_hud}
	else
		if screenelementexists \{id = cutscene_camera_hud_anchor}
			destroyscreenelement \{id = cutscene_camera_hud_anchor}
		endif
	endif
endscript

script cutscene_camera_hud_fade_in 
	fadetoblack \{on
		time = 0
		alpha = 1.0
		z_priority = 5}
	wait \{0.2
		seconds}
	fadetoblack \{off
		time = 0.5}
endscript

script really_kill_cutscene_camera_hud 
	wait \{0.7
		seconds}
	fadetoblack \{off
		time = 0}
	if screenelementexists \{id = cutscene_camera_hud_anchor}
		destroyscreenelement \{id = cutscene_camera_hud_anchor}
	endif
endscript

script blink_rec_dot 
	begin
	doscreenelementmorph \{id = rec_dot
		alpha = 0.8}
	wait \{0.5
		seconds}
	doscreenelementmorph \{id = rec_dot
		alpha = 0}
	wait \{0.5
		seconds}
	repeat
endscript

script flicker_video_screen \{time = 0.05}
	begin
	doscreenelementmorph id = video_screen alpha = 0.3 time = <time>
	wait <time> seconds
	doscreenelementmorph id = video_screen alpha = 0.225 time = <time>
	wait <time> seconds
	repeat
endscript

script morph_camera_hud_line \{time = 1.5}
	begin
	doscreenelementmorph id = camera_hud_line pos = (0.0, 480.0) time = <time>
	wait <time> seconds
	doscreenelementmorph \{id = camera_hud_line
		pos = (0.0, 0.0)}
	repeat
endscript

script camera_hud_count \{up = 1}
	if (<up> = 1)
		<action> = camera_hud_count_one
	else
		<action> = camera_hud_count_minus_one
	endif
	begin
	wait \{2
		gameframes}
	<action>
	if gotparam \{done}
		break
	endif
	repeat
	mins :gettags
	<callback> <callback_params>
endscript

script camera_hud_count_one 
	mins :gettags
	frames = (<frames> + 1)
	if (<frames> > 29)
		frames = 0
		secs = (<secs> + 1)
		if (<secs> > 59)
			secs = 0
			mins = (<mins> + 1)
			mins2 = (<mins> / 10)
			mins1 = (<mins> - (<mins2> * 10))
			formattext textname = min_text "%m" m = <mins1>
			setscreenelementprops id = mins text = <min_text>
			formattext textname = min_text "%m" m = <mins2>
			setscreenelementprops id = mins2 text = <min_text>
		endif
		secs2 = (<secs> / 10)
		secs1 = (<secs> - (<secs2> * 10))
		formattext textname = sec_text "%s" s = <secs1>
		setscreenelementprops id = secs text = <sec_text>
		formattext textname = sec_text "%s" s = <secs2>
		setscreenelementprops id = secs2 text = <sec_text>
	endif
	frames2 = (<frames> / 10)
	frames1 = (<frames> - (<frames2> * 10))
	formattext textname = frame_text "%f" f = <frames1>
	setscreenelementprops id = frames text = <frame_text>
	formattext textname = frame_text "%f" f = <frames2>
	setscreenelementprops id = frames2 text = <frame_text>
	mins :settags frames = <frames> secs = <secs> mins = <mins>
endscript

script camera_hud_count_minus_one 
	mins :gettags
	if (<mins> < 1)
		if (<secs> < 1)
			if (<frames> < 1)
				return done = done
			endif
		endif
	endif
	frames = (<frames> - 1)
	if (<frames> < 0)
		frames = 29
		secs = (<secs> - 1)
		if (<secs> < 0)
			secs = 59
			mins = (<mins> - 1)
			mins2 = (<mins> / 10)
			mins1 = (<mins> - (<mins2> * 10))
			formattext textname = min_text "%m" m = <mins1>
			setscreenelementprops id = mins text = <min_text>
			formattext textname = min_text "%m" m = <mins2>
			setscreenelementprops id = mins2 text = <min_text>
		endif
		secs2 = (<secs> / 10)
		secs1 = (<secs> - (<secs2> * 10))
		formattext textname = sec_text "%s" s = <secs1>
		setscreenelementprops id = secs text = <sec_text>
		formattext textname = sec_text "%s" s = <secs2>
		setscreenelementprops id = secs2 text = <sec_text>
	endif
	frames2 = (<frames> / 10)
	frames1 = (<frames> - (<frames2> * 10))
	formattext textname = frame_text "%f" f = <frames1>
	setscreenelementprops id = frames text = <frame_text>
	formattext textname = frame_text "%f" f = <frames2>
	setscreenelementprops id = frames2 text = <frame_text>
	mins :settags frames = <frames> secs = <secs> mins = <mins>
endscript

script really_kill_cutscene_hangover_hud 
	printf \{"Screen Blur Disabled, please fix to match new screen fx protocol"}
	wait \{0.7
		seconds}
	fadetoblack \{off
		time = 0}
	if screenelementexists \{id = cutscene_hangover_hud_anchor}
		destroyscreenelement \{id = cutscene_hangover_hud_anchor}
	endif
endscript

script flicker_textintro \{time = 0.05}
	begin
	doscreenelementmorph id = peralta_name alpha = 1 time = <time> pos = (150.0, 189.0)
	wait <time> seconds
	doscreenelementmorph id = peralta_name alpha = 0.7 time = <time> pos = (150.0, 190.0)
	wait <time> seconds
	repeat
endscript

script flicker_skullintro \{time = 0.05}
	begin
	doscreenelementmorph id = bg_icon alpha = 1 time = <time>
	wait <time> seconds
	doscreenelementmorph id = bg_icon alpha = 0.7 time = <time>
	wait <time> seconds
	repeat
endscript

script make_black_in 
	createscreenelement \{type = spriteelement
		parent = root_window
		id = videointro_black3
		texture = black
		pos = (320.0, 240.0)
		just = [
			center
			center
		]
		scale = (200.0, 200.0)
		rgba = [
			0
			0
			0
			128
		]
		z_priority = -5
		alpha = 0
		z_priority = 4560040}
	doscreenelementmorph \{id = videointro_black3
		alpha = 1
		time = 0}
endscript

script make_black_out 
	doscreenelementmorph \{id = videointro_black3
		alpha = 0
		time = 0.5}
endscript

script make_black_in2 
	createscreenelement \{type = spriteelement
		parent = root_window
		id = videointro_black4
		texture = black
		pos = (320.0, 240.0)
		just = [
			center
			center
		]
		scale = (200.0, 200.0)
		rgba = [
			0
			0
			0
			128
		]
		z_priority = -5
		alpha = 0
		z_priority = 160080}
	doscreenelementmorph \{id = videointro_black4
		alpha = 1
		time = 0}
endscript

script make_black_out2 
	doscreenelementmorph \{id = videointro_black4
		alpha = 0
		time = 0}
endscript

script underground_fly_in 
	wait \{1
		second}
	doscreenelementmorph \{id = under_1
		alpha = 0
		time = 0
		scale = 8}
	doscreenelementmorph \{id = under_1
		alpha = 0.9
		time = 0.3
		scale = 3}
	wait \{4.5
		second}
	doscreenelementmorph \{id = under_1
		alpha = 0
		scale = (20.0, 3.0)
		time = 0.2}
endscript

script underground_fly_in2 
	wait \{1
		second}
	doscreenelementmorph \{id = under_2
		alpha = 0
		time = 0
		pos = (700.0, 190.0)}
	doscreenelementmorph \{id = under_2
		alpha = 0.9
		time = 0.4
		pos = (52.0, 190.0)}
	wait \{3.0
		second}
	doscreenelementmorph \{id = under_2
		alpha = 0
		time = 0.2}
endscript

script skater_name_fly_1 
	doscreenelementmorph \{id = skater_name_1
		alpha = 0
		time = 0
		pos = (700.0, 70.0)}
	doscreenelementmorph \{id = skater_name_1
		alpha = 0.6
		time = 6.2
		scale = (5.0, 5.0)
		pos = (-650.0, 70.0)}
endscript

script skater_name_fly_2 
	doscreenelementmorph \{id = skater_name_2
		alpha = 0
		time = 0
		pos = (-200.0, 270.0)}
	doscreenelementmorph \{id = skater_name_2
		alpha = 0.5
		time = 5.8
		pos = (1000.0, 270.0)}
endscript

script skater_name_fly_3 
	doscreenelementmorph \{id = skater_name_3
		alpha = 0
		time = 0
		pos = (300.0, 600.0)}
	doscreenelementmorph \{id = skater_name_3
		alpha = 0.55
		time = 6.4
		pos = (300.0, -600.0)}
endscript

script skater_name_fly_4 
	doscreenelementmorph \{id = skater_name_4
		alpha = 0
		time = 0
		pos = (100.0, -600.0)}
	doscreenelementmorph \{id = skater_name_4
		alpha = 0.4
		time = 6.2
		scale = (4.8, 4.8)
		pos = (100.0, 600.0)}
endscript

script skater_name_fly_5 
	wait \{2
		second}
	doscreenelementmorph \{id = skater_name_5
		alpha = 0.7
		time = 0
		scale = 9
		pos = (320.0, 170.0)}
	doscreenelementmorph \{id = skater_name_5
		alpha = 0
		time = 3.5
		scale = 0
		pos = (320.0, 170.0)}
endscript

script star_fly_1 
	wait \{1
		second}
	doscreenelementmorph \{id = understar_1
		alpha = 0.5
		time = 0
		pos = (730.0, 210.0)
		rot_angle = 0}
	doscreenelementmorph \{id = understar_1
		alpha = 0.95
		time = 2.8
		scale = (2.3, 2.3)
		pos = (-250.0, 210.0)
		rot_angle = 720}
endscript

script star_fly_2 
	wait \{1.5
		second}
	doscreenelementmorph \{id = understar_2
		alpha = 0.5
		time = 0
		pos = (-250.0, 210.0)
		rot_angle = 0}
	doscreenelementmorph \{id = understar_2
		alpha = 0.8
		time = 1.8
		scale = (2.3, 2.3)
		pos = (720.0, 210.0)
		rot_angle = -720}
endscript

script fadeinout 
	wait \{0.6
		second}
	doscreenelementmorph \{id = underground_black2
		alpha = 0
		time = 0}
	doscreenelementmorph \{id = underground_black2
		alpha = 1
		time = 0.2}
	doscreenelementmorph \{id = underground_black2
		alpha = 0
		time = 0.1}
endscript

script cutscene_deactivate_tod_manager 
endscript

script cutscene_reactivate_tod_manager 
endscript

script cutscene_kill_spawned_script 
	killspawnedscript id = <id>
endscript

script destroy_digital_timer 
	if screenelementexists \{id = digital_timer_anchor}
		destroyscreenelement \{id = digital_timer_anchor}
	endif
endscript

script cutscene_error 
	<error_id> = cutscene_error_popup
	if (istrue <readerror>)
		net_view_goals_create_searching_text {
			text = "Loading..."
			just = [right bottom]
			pos = (940.0, 50.0)
			scale = 0.75
			parent = root_window
			id = <error_id>
		}
	endif
	if (istrue <fatalreaderror>)
		if screenelementexists id = <error_id>
			destroyscreenelement id = <error_id>
		endif
	endif
	if (istrue <readerrorrecovery>)
		if screenelementexists id = <error_id>
			destroyscreenelement id = <error_id>
		endif
	endif
endscript

script cutscene_screenfader_create 
	createscreenelement \{type = spriteelement
		parent = root_window
		id = cutscene_screenfader
		rgba = [
			0
			0
			0
			255
		]
		alpha = 0.0
		pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		just = [
			left
			top
		]
		z_priority = 9999}
endscript

script cutscene_screenfader_destroy 
	destroyscreenelement \{id = cutscene_screenfader}
endscript
