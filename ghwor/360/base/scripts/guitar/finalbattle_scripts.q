g_finalbattle_data = {
	holywars = {
		outro = g_finalbattleoutro1
	}
	thisdaywefight = {
		outro = g_finalbattleoutro2
	}
}
g_finalbattle_performance_names = [
	z_finalbattleintro
	None
	demigod_intro
]
g_finalbattleintro1 = {
	time = 34700
	ScriptTable = [
		{
			time = 0
			Scr = Transition_StopRendering
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
			Scr = play_intro
			params = {
				FAST = 1
			}
		}
		{
			time = 1
			Scr = bandmanager_hideinstrument
			params = {
				Name = musician1
			}
		}
		{
			time = 1
			Scr = bandmanager_hideinstrument
			params = {
				Name = musician2
			}
		}
		{
			time = 1
			Scr = bandmanager_hideinstrument
			params = {
				Name = musician3
			}
		}
		{
			time = 1
			Scr = bandmanager_hideinstrument
			params = {
				Name = musician4
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
			Scr = z_finalbattle_createground
			params = {
			}
		}
		{
			time = 1
			Scr = z_finalbattle_createfinalbattlerocks
			params = {
			}
		}
		{
			time = 1
			Scr = z_finalbattle_move_ampzilla_offscreen
			params = {
			}
		}
		{
			time = 100
			Scr = start_preloaded_celeb_intro_stream
			params = {
			}
		}
		{
			time = 100
			Scr = audio_gameplay_intro_sfx_warmup
			params = {
			}
		}
		{
			time = 300
			Scr = Transition_StartRendering
			params = {
			}
		}
		{
			time = 5000
			Scr = finalbattle_intro01_grounddust
			params = {
			}
		}
		{
			time = 7000
			Scr = finalbattle_intro01_createlava
			params = {
			}
		}
		{
			time = 16000
			Scr = finalbattle_intro01_shakedust
			params = {
			}
		}
		{
			time = 17000
			Scr = z_finalbattle_unhidefinalbattlerocks
			params = {
			}
		}
		{
			time = 18000
			Scr = finalbattle_intro01_shakedust
			params = {
			}
		}
		{
			time = 23000
			Scr = finalbattle_intro01_killlava
			params = {
			}
		}
		{
			time = 23600
			Scr = finalbattle_intro01_rockdust
			params = {
			}
		}
		{
			time = 28066
			Scr = z_finalbattle_killfinalbattlerocks
			params = {
			}
		}
		{
			time = 32132
			Scr = bandmanager_unhideinstrument
			params = {
				Name = musician1
			}
		}
		{
			time = 32132
			Scr = bandmanager_unhideinstrument
			params = {
				Name = musician2
			}
		}
		{
			time = 32132
			Scr = bandmanager_unhideinstrument
			params = {
				Name = musician3
			}
		}
		{
			time = 32132
			Scr = bandmanager_unhideinstrument
			params = {
				Name = musician4
			}
		}
		{
			time = 32132
			Scr = z_finalbattle_destroyground
			params = {
			}
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}

script finalbattle_careeronlycheck 
	gamemode_gettype
	if (<Type> != career)
		KillSpawnedScript \{Name = finalbattle_careeronlycheck}
	endif
endscript

script z_finalbattle_move_ampzilla_offscreen 
	SafeKill \{nodeName = z_finalbattle_trg_geo_ampzilla}
	SafeKill \{nodeName = z_finalbattle_trg_geo_ampzillasoft}
	SafeCreate \{nodeName = z_finalbattle_trg_geo_ampzilla}
	SafeCreate \{nodeName = z_finalbattle_trg_geo_ampzillasoft}
	z_finalbattle_trg_geo_ampzilla :Obj_MoveToPos \{(0.0, -200.0, 0.0)}
	z_finalbattle_trg_geo_ampzillasoft :Obj_MoveToPos \{(0.0, -200.0, 0.0)}
	Wait \{1
		gameframe}
	finalbattle_outro02_killstatic
	Wait \{1
		gameframe}
	finalbattle_outro02_createstatic
endscript

script finalbattle_intro01_grounddust 
	SafeCreate \{nodeName = z_finalbattle_gfx_fx_intro01_grounddust01}
endscript

script finalbattle_intro01_createlava 
	SafeCreate \{nodeName = z_finalbattle_gfx_fx_intro01_poollavafire01}
	SafeCreate \{nodeName = z_finalbattle_gfx_fx_intro01_poollavasparks01}
endscript

script finalbattle_intro01_shakedust 
	GetUniqueCompositeobjectID \{preferredID = fxid_shakedust01}
	CreateParticleSystem Name = <uniqueID> Pos = (18.850798, -0.735962, 63.487804) params_Script = $gp_fx_intro01_shakedust01
endscript

script finalbattle_intro01_killlava 
	SafeKill \{nodeName = z_finalbattle_gfx_fx_intro01_poollavafire01}
	SafeKill \{nodeName = z_finalbattle_gfx_fx_intro01_poollavasparks01}
endscript

script finalbattle_intro01_rockdust 
	SafeCreate \{nodeName = z_finalbattle_gfx_fx_intro01_rockdust01}
	SafeCreate \{nodeName = z_finalbattle_gfx_fx_intro01_rockbits01}
endscript
g_finalbattleintro2 = {
	time = 133
	ScriptTable = [
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
			Scr = play_intro
			params = {
				FAST = 1
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
			time = 100
			Scr = Transition_StartRendering
		}
		{
			time = 100
			Scr = audio_gameplay_intro_sfx_warmup
		}
		{
			time = 100
			Scr = fadetoblack
			params = {
				OFF
				time = 0.75
				alpha = 1.0
				id = finalbattle_fade
			}
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
g_finalbattleintro3 = {
	time = 44433
	ScriptTable = [
		{
			time = 0
			Scr = Transition_StopRendering
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
			Scr = play_intro
			params = {
				FAST = 1
			}
		}
		{
			time = 0
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_moments'
				changenow
				Name = moment01
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
			Scr = demi_rockbreak_stateoff
			params = {
			}
		}
		{
			time = 1
			Scr = finalbattle_intro03_fx_setup
			params = {
			}
		}
		{
			time = 100
			Scr = Transition_StartRendering
			params = {
			}
		}
		{
			time = 100
			Scr = audio_gameplay_intro_sfx_warmup
			params = {
			}
		}
		{
			time = 4567
			Scr = z_finalbattle_createfinalbattlerocks
			params = {
			}
		}
		{
			time = 9000
			Scr = finalbattle_intro03_killbeambits
			params = {
			}
		}
		{
			time = 10500
			Scr = finalbattle_intro03_fx_createeyeglows
			params = {
			}
		}
		{
			time = 11800
			Scr = band_unhide
			params = {
				Name = GUITARIST
			}
		}
		{
			time = 11800
			Scr = demi_rockbreak_state
			params = {
			}
		}
		{
			time = 11800
			Scr = finalbattle_intro03_fx_killeyeglows
			params = {
			}
		}
		{
			time = 12000
			Scr = finalbattle_intro03_fx_bustdust01
			params = {
			}
		}
		{
			time = 12000
			Scr = finalbattle_intro03_fx_ax
			params = {
			}
		}
		{
			time = 13000
			Scr = finalbattle_intro03_fx_bustdust02
			params = {
			}
		}
		{
			time = 14800
			Scr = finalbattle_intro03_fx_rockdust01
			params = {
			}
		}
		{
			time = 16000
			Scr = z_finalbattle_killfinalbattlerocks
			params = {
			}
		}
		{
			time = 25000
			Scr = finalbattle_intro03_fx_axglow
			params = {
			}
		}
		{
			time = 31000
			Scr = finalbattle_intro03_fx_killbacksmoke
			params = {
			}
		}
		{
			time = 34000
			Scr = finalbattle_intro03_fx_createbacksmoke
			params = {
			}
		}
		{
			time = 36500
			Scr = finalbattle_intro03_fx_lightning
			params = {
			}
		}
		{
			time = 44432
			Scr = finalbattle_intro03_fx_cleanup
			params = {
			}
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}

script finalbattle_intro03_fx_setup 
	SafeCreate \{nodeName = z_finalbattle_gfx_fx_intro03_statue_beam01}
	SafeCreate \{nodeName = z_finalbattle_gfx_fx_intro03_statue_beam02}
	SpawnScriptLater \{finalbattle_intro03_fx_createbeambits}
endscript

script finalbattle_intro03_fx_createbeambits 
	n = [2 7 11 3 5 13 8 1 6 10 12 4 9 3 5 12 8 4]
	t = 1.0
	i = 0
	begin
	Wait <t> Seconds
	formatText checksumName = firename 'Z_FinalBattle_GFX_FX_Intro03_Statue_BeamBits%p' p = (<n> [<i>])
	SafeCreate nodeName = <firename>
	formatText checksumName = sparkname 'Z_FinalBattle_GFX_FX_Intro03_Statue_BeamDust%p' p = (<n> [<i>])
	SafeCreate nodeName = <sparkname>
	if (<t> < 0.2)
		t = 0.2
	else
		t = (<t> -0.1)
	endif
	if (<i> = 17)
		i = 0
	else
		i = (<i> + 1)
	endif
	repeat
endscript

script finalbattle_intro03_killbeambits 
	KillSpawnedScript \{Name = finalbattle_intro03_fx_createbeambits}
	i = 1
	begin
	formatText checksumName = sparkname 'Z_FinalBattle_GFX_FX_Intro03_Statue_BeamDust%i' i = <i>
	SafeKill nodeName = <sparkname>
	i = (<i> + 1)
	repeat 13
endscript

script finalbattle_intro03_fx_createeyeglows 
	engineconfig \{disablescreenfx = ambientocclusion}
	SafeCreate \{nodeName = z_finalbattle_demieyes}
	SafeCreate \{nodeName = z_finalbattle_sg_eye_glow}
	SpawnScriptLater \{changepasscolor
		id = fxid_demieyes
		params = {
			objID = z_finalbattle_demieyes
			material = demieyes_eyes
			parameter = m_psPass0MaterialColor
			startcolor = [
				0
				0
				0
				255
			]
			endcolor = [
				255
				255
				255
				255
			]
			time = 1.0
		}}
	SpawnScriptLater \{changepasscolor
		id = fxid_demieyes
		params = {
			objID = z_finalbattle_sg_eye_glow
			material = eyeglow_eyeglow
			parameter = m_psPass0MaterialColor
			startcolor = [
				0
				0
				0
				255
			]
			endcolor = [
				150
				150
				150
				255
			]
			time = 1.3
		}}
endscript

script finalbattle_intro03_fx_killeyeglows 
	KillSpawnedScript \{id = fxid_demieyes}
	engineconfig \{enablescreenfx = ambientocclusion}
	UpdateMaterialProperty \{object = z_finalbattle_demieyes
		material = demieyes_eyes
		parameter = m_psPass0MaterialColor
		value = [
			0
			0
			0
			255
		]}
	UpdateMaterialProperty \{object = z_finalbattle_sg_eye_glow
		material = eyeglow_eyeglow
		parameter = m_psPass0MaterialColor
		value = [
			0
			0
			0
			255
		]}
	SafeKill \{nodeName = z_finalbattle_demieyes}
	SafeKill \{nodeName = z_finalbattle_sg_eye_glow}
	SafeKill \{nodeName = z_finalbattle_gfx_fx_intro03_statue_beam01}
	SafeKill \{nodeName = z_finalbattle_gfx_fx_intro03_statue_beam02}
	KillSpawnedScript \{Name = finalbattle_intro03_fx_createbeambits}
endscript

script finalbattle_intro03_fx_bustdust01 
	SafeCreate \{nodeName = z_finalbattle_gfx_fx_intro03_statue_beam03}
	SafeCreate \{nodeName = z_finalbattle_gfx_fx_intro03_bustdust01}
	SafeCreate \{nodeName = z_finalbattle_gfx_fx_intro03_bustbits01}
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_bustdust01
		objID = GUITARIST}
	CreateParticleSystem Name = <uniqueID> objID = GUITARIST bone = Bone_Forearm_L params_Script = $gp_fx_intro03_dg_armdust01
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_bustdust02
		objID = GUITARIST}
	CreateParticleSystem Name = <uniqueID> objID = GUITARIST bone = Bone_Forearm_R params_Script = $gp_fx_intro03_dg_armdust01
endscript

script finalbattle_intro03_fx_ax 
	SpawnScriptNow \{finalbattle_intro03_fx_axwind}
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_ax01
		objID = GUITARIST}
	CreateParticleSystem Name = <uniqueID> groupID = fxid_axparticles objID = GUITARIST bone = bone_guitar_body params_Script = $gp_fx_intro03_ax_sparkles01
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_ax02
		objID = GUITARIST}
	CreateParticleSystem Name = <uniqueID> groupID = fxid_axparticles objID = GUITARIST bone = bone_guitar_body params_Script = $gp_fx_intro03_ax_glow01
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_ax03
		objID = GUITARIST}
	CreateParticleSystem Name = <uniqueID> groupID = fxid_axparticles objID = GUITARIST bone = bone_guitar_body params_Script = $gp_fx_intro03_ax_fire01
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_ax04
		objID = GUITARIST}
	CreateParticleSystem Name = <uniqueID> groupID = fxid_axparticles objID = GUITARIST bone = bone_guitar_body params_Script = $gp_fx_intro03_ax_wisps01
endscript

script finalbattle_intro03_fx_axwind 
	begin
	if IsCreated \{GUITARIST}
		GUITARIST :Obj_GetBonePosition \{bone = bone_guitar_body}
		EngineWind create = {
			Name = fxid_axwind
			Type = Point
			Pos = ((<X> * (1.0, 0.0, 0.0)) + (<y> * (0.0, 1.0, 0.0)) + (<z> * (0.0, 0.0, 1.0)))
			velocity = (1.0, 1.0, 1.0)
			speed = 3.0
			tangentWeight = 0.09
			Range = 20
			attenuation = 0
			time = 0
		}
	endif
	Wait \{0.1
		Seconds}
	repeat
endscript

script finalbattle_intro03_fx_bustdust02 
	SafeCreate \{nodeName = z_finalbattle_gfx_fx_intro03_bustdust02}
	SafeCreate \{nodeName = z_finalbattle_gfx_fx_intro03_bustbits02}
endscript

script finalbattle_intro03_fx_rockdust01 
	SafeCreate \{nodeName = z_finalbattle_gfx_fx_intro03_rockdust01}
endscript

script finalbattle_intro03_fx_axglow 
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_axglow01
		objID = GUITARIST}
	CreateParticleSystem Name = <uniqueID> objID = GUITARIST bone = bone_guitar_body params_Script = $gp_fx_intro03_ax_glow02
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_axglow02
		objID = GUITARIST}
	CreateParticleSystem Name = <uniqueID> objID = GUITARIST bone = bone_guitar_body params_Script = $gp_fx_intro03_ax_sparks01
endscript

script finalbattle_intro03_fx_killbacksmoke 
	DestroyParticlesByGroupID \{groupID = fxid_ampzillastaticbacksmoke
		ifEmpty = 1}
endscript

script finalbattle_intro03_fx_createbacksmoke 
	GetUniqueCompositeobjectID \{preferredID = fxid_ampzillastatic05}
	CreateParticleSystem groupID = fxid_ampzillastaticbacksmoke Name = <uniqueID> objID = z_finalbattle_trg_geo_ampzilla bone = Bone_Stomach_Lower params_Script = $gp_fx_finalbattle_ampzilla_static_backsmoke01
endscript

script finalbattle_intro03_fx_lightning 
	GetUniqueCompositeobjectID \{preferredID = fxid_lightning01}
	CreateParticleSystem Name = <uniqueID> Pos = (-83.8727, 38.6923, 0.212509) params_Script = $gp_fx_intro03_lightning01
	GetUniqueCompositeobjectID \{preferredID = fxid_lightning02}
	CreateParticleSystem Name = <uniqueID> Pos = (-83.8727, 38.6923, 0.212509) params_Script = $gp_fx_intro03_lightningglow01
endscript

script finalbattle_intro03_fx_cleanup 
	DestroyParticlesByGroupID \{groupID = fxid_axparticles}
	KillSpawnedScript \{Name = finalbattle_intro03_fx_guitarwind}
endscript

script finalbattle_intro03_fx_footstep \{objID = GUITARIST
		EmitNum = 12}
	GetUniqueCompositeobjectID \{preferredID = fxid_demigodstep01}
	CreateParticleSystem Name = <uniqueID> objID = <objID> bone = <bone> params_Script = {$gp_fx_intro03_dg_footdust01 EmitNum = <EmitNum>}
endscript

script demi_rockbreak_stateoff 
	ChangeNodeFlag \{LS_ENCORE_PRE
		1}
	ChangeNodeFlag \{LS_ENCORE_POST
		0}
endscript

script demi_rockbreak_state 
	scripteventsyncrenderer
	ChangeNodeFlag \{LS_ENCORE_PRE
		0}
	ChangeNodeFlag \{LS_ENCORE_POST
		1}
endscript

script z_finalbattle_createfinalbattlerocks 
	SafeCreate \{nodeName = z_finalbattle_trg_ven_finalbattle_rocks}
	z_finalbattle_trg_ven_finalbattle_rocks :Hide
endscript

script z_finalbattle_unhidefinalbattlerocks 
	z_finalbattle_trg_ven_finalbattle_rocks :unhide
endscript

script z_finalbattle_killfinalbattlerocks 
	kill \{Name = z_finalbattle_trg_ven_finalbattle_rocks}
endscript

script z_finalbattle_finalbattleintro_transitiondeinit 
	z_finalbattle_killfinalbattlerocks
endscript
default_finalbattleintro_transition = {
	time = 10000
	ScriptTable = [
	]
}
common_finalbattleintro_transition = {
}
g_finalbattleoutro1 = {
	time = 12000
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
			time = 1
			Scr = band_hide
			params = {
				Name = musician1
			}
		}
		{
			time = 1
			Scr = band_hide
			params = {
				Name = musician2
			}
		}
		{
			time = 1
			Scr = band_hide
			params = {
				Name = musician3
			}
		}
		{
			time = 1
			Scr = band_hide
			params = {
				Name = musician4
			}
		}
		{
			time = 1
			Scr = audio_play_preloaded_fb_scene_2_stream
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
			Scr = band_playclip
			params = {
				clip = transition1_gh6_ampzilla_near_death_c015
				startframe = 25
				endframe = 391
				timefactor = 1
				intro_event = 1
			}
		}
		{
			time = 1
			Scr = band_playclip
			params = {
				clip = transition1_gh6_ampzilla_near_death_c016
				startframe = 25
				endframe = 391
				timefactor = 1
				intro_event = 1
			}
		}
		{
			time = 1000
			Scr = z_finalbattle_hw_hita
			params = {
			}
		}
		{
			time = 5000
			Scr = finalbattle_outro01_armdust
			params = {
			}
		}
		{
			time = 9500
			Scr = fadetoblack
			params = {
				On
				time = 0.75
				alpha = 1.0
				z_priority = 0
				id = finalbattle_fade
			}
		}
		{
			time = 11999
			Scr = band_unhide
			params = {
				Name = musician1
			}
		}
		{
			time = 11999
			Scr = band_unhide
			params = {
				Name = musician2
			}
		}
		{
			time = 11999
			Scr = band_unhide
			params = {
				Name = musician3
			}
		}
		{
			time = 11999
			Scr = band_unhide
			params = {
				Name = musician4
			}
		}
	]
}

script finalbattle_outro01_armdust 
	SafeCreate \{nodeName = z_finalbattle_gfx_fx_outro01_armdust01}
endscript
transition1_gh6_ampzilla_near_death_c015 = {
	actors = [
		{
			Name = z_finalbattle_trg_geo_ampzilla
			startnode = 'ampzilla_start'
			anim = gh6_ampzilla_near_death
		}
	]
	cameras = [
		{
			slot = 0
			Name = 'TRG_Geo_Camera_Performance_AMPZILLA01'
			anim = gh6_ampzilla_near_death_c01
		}
	]
	commands = [
	]
}
transition1_gh6_ampzilla_near_death_c016 = {
	actors = [
		{
			Name = z_finalbattle_trg_geo_ampzillasoft
			startnode = 'ampzilla_start'
			anim = gh6_ampzilla_near_death
		}
	]
	commands = [
	]
}
g_finalbattleoutro2 = {
	time = 34433
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
			time = 1
			Scr = band_hide
			params = {
				Name = musician1
			}
		}
		{
			time = 1
			Scr = band_hide
			params = {
				Name = musician2
			}
		}
		{
			time = 1
			Scr = band_hide
			params = {
				Name = musician3
			}
		}
		{
			time = 1
			Scr = band_hide
			params = {
				Name = musician4
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
			Scr = z_finalbattle_hw_hita
			params = {
			}
		}
		{
			time = 1
			Scr = audio_play_preloaded_fb_scene_3_stream
			params = {
			}
		}
		{
			time = 1
			Scr = band_playclip
			params = {
				clip = transition2_gh6_ampzilla_shtdwn_rstrt_c023
				startframe = 13
				endframe = 56
				timefactor = 1
				intro_event = 1
			}
		}
		{
			time = 1
			Scr = band_playclip
			params = {
				clip = transition2_gh6_ampzilla_shtdwn_rstrt_c029
				startframe = 13
				endframe = 56
				timefactor = 1
				intro_event = 1
			}
		}
		{
			time = 1433
			Scr = band_playclip
			params = {
				clip = transition2_gh6_ampzilla_shtdwn_rstrt_c034
				startframe = 63
				endframe = 251
				timefactor = 1
				intro_event = 1
			}
		}
		{
			time = 1433
			Scr = band_playclip
			params = {
				clip = transition2_gh6_ampzilla_shtdwn_rstrt_c0310
				startframe = 63
				endframe = 251
				timefactor = 1
				intro_event = 1
			}
		}
		{
			time = 1500
			Scr = finalbattle_outro02_createbacksmoke
			params = {
			}
		}
		{
			time = 4000
			Scr = finalbattle_outro02_kneedust
			params = {
			}
		}
		{
			time = 5500
			Scr = finalbattle_outro02_headdust
			params = {
			}
		}
		{
			time = 6000
			Scr = finalbattle_outro02_bodydust
			params = {
			}
		}
		{
			time = 6000
			Scr = finalbattle_outro02_killstatic
			params = {
			}
		}
		{
			time = 7700
			Scr = band_playclip
			params = {
				clip = transition2_gh6_ampzilla_shtdwn_rstrt_c051
				startframe = 344
				endframe = 471
				timefactor = 1
				intro_event = 1
			}
		}
		{
			time = 7700
			Scr = band_playclip
			params = {
				clip = transition2_gh6_ampzilla_shtdwn_rstrt_c055
				startframe = 344
				endframe = 471
				timefactor = 1
				intro_event = 1
			}
		}
		{
			time = 8000
			Scr = finalbattle_outro02_killbacksmoke
			params = {
			}
		}
		{
			time = 11933
			Scr = band_playclip
			params = {
				clip = transition2_gh6_ampzilla_shtdwn_rstrt_c062
				startframe = 411
				endframe = 534
				timefactor = 1
				intro_event = 1
			}
		}
		{
			time = 11933
			Scr = band_playclip
			params = {
				clip = transition2_gh6_ampzilla_shtdwn_rstrt_c066
				startframe = 411
				endframe = 534
				timefactor = 1
				intro_event = 1
			}
		}
		{
			time = 13000
			Scr = finalbattle_outro02_createfinger
			params = {
			}
		}
		{
			time = 15500
			Scr = finalbattle_outro02_createstatic
			params = {
			}
		}
		{
			time = 16033
			Scr = band_playclip
			params = {
				clip = transition2_gh6_ampzilla_shtdwn_rstrt_c017
				startframe = 615
				endframe = 860
				timefactor = 1
				intro_event = 1
			}
		}
		{
			time = 16033
			Scr = band_playclip
			params = {
				clip = transition2_gh6_ampzilla_shtdwn_rstrt_c0111
				startframe = 615
				endframe = 860
				timefactor = 1
				intro_event = 1
			}
		}
		{
			time = 18700
			Scr = finalbattle_outro02_fistdust
			params = {
			}
		}
		{
			time = 24200
			Scr = band_playclip
			params = {
				clip = transition2_gh6_ampzilla_shtdwn_rstrt_c028
				startframe = 894
				endframe = 1201
				timefactor = 1
				intro_event = 1
			}
		}
		{
			time = 24200
			Scr = band_playclip
			params = {
				clip = transition2_gh6_ampzilla_shtdwn_rstrt_c0212
				startframe = 894
				endframe = 1201
				timefactor = 1
				intro_event = 1
			}
		}
		{
			time = 33000
			Scr = fadeoutandin
			params = {
				time = 2.5
				delay = 1.5
				z_priority = 0
			}
		}
		{
			time = 34432
			Scr = band_unhide
			params = {
				Name = musician1
			}
		}
		{
			time = 34432
			Scr = band_unhide
			params = {
				Name = musician2
			}
		}
		{
			time = 34432
			Scr = band_unhide
			params = {
				Name = musician3
			}
		}
		{
			time = 34432
			Scr = band_unhide
			params = {
				Name = musician4
			}
		}
	]
}

script finalbattle_outro02_kneedust 
	SafeCreate \{nodeName = z_finalbattle_gfx_fx_outro02_kneedust01}
endscript

script finalbattle_outro02_createbacksmoke 
	GetUniqueCompositeobjectID \{preferredID = fxid_ampzillabacksmoke01}
	CreateParticleSystem groupID = fxgid_ampzillabacksmoke Name = <uniqueID> objID = z_finalbattle_trg_geo_ampzilla bone = Bone_Stomach_Lower params_Script = $gp_fx_outro02_backsmoke01
endscript

script finalbattle_outro02_headdust 
	SafeCreate \{nodeName = z_finalbattle_gfx_fx_outro02_headdust01}
endscript

script finalbattle_outro02_bodydust 
	SafeCreate \{nodeName = z_finalbattle_gfx_fx_outro02_bodydust01}
endscript

script finalbattle_outro02_killstatic 
	DestroyParticlesByGroupID \{groupID = fxid_ampzillastatic
		ifEmpty = 1}
	DestroyParticlesByGroupID \{groupID = fxid_ampzillastaticbacksmoke
		ifEmpty = 1}
	SafeKill \{nodeName = z_finalbattle_lfx_trg_lh_ampzilla_eye01}
endscript

script finalbattle_outro02_killbacksmoke 
	DestroyParticlesByGroupID \{groupID = fxgid_ampzillabacksmoke
		ifEmpty = 1}
endscript

script finalbattle_outro02_createfinger 
	GetUniqueCompositeobjectID \{preferredID = fxid_ampzillafinger01}
	CreateParticleSystem groupID = fxid_ampzillastatic Name = <uniqueID> objID = z_finalbattle_trg_geo_ampzilla bone = bone_finger1_mid_bend_l params_Script = $gp_fx_outro02_fingerelectric01
endscript

script finalbattle_outro02_createstatic 
	z_finalbattle_trg_geo_ampzilla :Obj_SpawnScriptLater \{z_finalbattle_ampzilla_fx_static}
	SafeCreate \{nodeName = z_finalbattle_lfx_trg_lh_ampzilla_eye01}
	z_finalbattle_lfx_trg_lh_ampzilla_eye01 :Obj_LockToObject \{objectName = z_finalbattle_trg_geo_ampzilla
		bone = bone_head
		(1.3499999, 3.74, 0.53)
		relangles = (-0.9, 0.0, 0.0)}
endscript

script finalbattle_outro02_fistdust 
	SafeCreate \{nodeName = z_finalbattle_gfx_fx_outro02_fistdust01}
endscript
transition2_gh6_ampzilla_shtdwn_rstrt_c051 = {
	actors = [
		{
			Name = z_finalbattle_trg_geo_ampzilla
			startnode = 'ampzilla_start'
			anim = gh6_ampzilla_shtdwn_rstrt
		}
	]
	cameras = [
		{
			slot = 0
			Name = 'TRG_Geo_Camera_Performance_AMPZILLA01'
			anim = gh6_ampzilla_shtdwn_rstrt_c05
		}
	]
	commands = [
	]
}
transition2_gh6_ampzilla_shtdwn_rstrt_c062 = {
	actors = [
		{
			Name = z_finalbattle_trg_geo_ampzilla
			startnode = 'ampzilla_start'
			anim = gh6_ampzilla_shtdwn_rstrt
		}
	]
	cameras = [
		{
			slot = 0
			Name = 'TRG_Geo_Camera_Performance_AMPZILLA01'
			anim = gh6_ampzilla_shtdwn_rstrt_c06
		}
	]
	commands = [
	]
}
transition2_gh6_ampzilla_shtdwn_rstrt_c023 = {
	actors = [
		{
			Name = z_finalbattle_trg_geo_ampzilla
			startnode = 'ampzilla_start'
			anim = gh6_ampzilla_shtdwn_rstrt
		}
	]
	cameras = [
		{
			slot = 0
			Name = 'TRG_Geo_Camera_Performance_AMPZILLA01'
			anim = gh6_ampzilla_shtdwn_rstrt_c02
		}
	]
	commands = [
	]
}
transition2_gh6_ampzilla_shtdwn_rstrt_c034 = {
	actors = [
		{
			Name = z_finalbattle_trg_geo_ampzilla
			startnode = 'ampzilla_start'
			anim = gh6_ampzilla_shtdwn_rstrt
		}
	]
	cameras = [
		{
			slot = 0
			Name = 'TRG_Geo_Camera_Performance_AMPZILLA01'
			anim = gh6_ampzilla_shtdwn_rstrt_c03
		}
	]
	commands = [
	]
}
transition2_gh6_ampzilla_shtdwn_rstrt_c055 = {
	actors = [
		{
			Name = z_finalbattle_trg_geo_ampzillasoft
			startnode = 'ampzilla_start'
			anim = gh6_ampzilla_shtdwn_rstrt
		}
	]
	commands = [
	]
}
transition2_gh6_ampzilla_shtdwn_rstrt_c066 = {
	actors = [
		{
			Name = z_finalbattle_trg_geo_ampzillasoft
			startnode = 'ampzilla_start'
			anim = gh6_ampzilla_shtdwn_rstrt
		}
	]
	commands = [
	]
}
transition2_gh6_ampzilla_shtdwn_rstrt_c017 = {
	actors = [
		{
			Name = z_finalbattle_trg_geo_ampzilla
			startnode = 'ampzilla_start'
			anim = gh6_ampzilla_shtdwn_rstrt
		}
	]
	cameras = [
		{
			slot = 0
			Name = 'TRG_Geo_Camera_Performance_AMPZILLA01'
			anim = gh6_ampzilla_shtdwn_rstrt_c01
		}
	]
	commands = [
	]
}
transition2_gh6_ampzilla_shtdwn_rstrt_c028 = {
	actors = [
		{
			Name = z_finalbattle_trg_geo_ampzilla
			startnode = 'ampzilla_start'
			anim = gh6_ampzilla_shtdwn_rstrt
		}
	]
	cameras = [
		{
			slot = 0
			Name = 'TRG_Geo_Camera_Performance_AMPZILLA01'
			anim = gh6_ampzilla_shtdwn_rstrt_c02
		}
	]
	commands = [
	]
}
transition2_gh6_ampzilla_shtdwn_rstrt_c029 = {
	actors = [
		{
			Name = z_finalbattle_trg_geo_ampzillasoft
			startnode = 'ampzilla_start'
			anim = gh6_ampzilla_shtdwn_rstrt
		}
	]
	commands = [
	]
}
transition2_gh6_ampzilla_shtdwn_rstrt_c0310 = {
	actors = [
		{
			Name = z_finalbattle_trg_geo_ampzillasoft
			startnode = 'ampzilla_start'
			anim = gh6_ampzilla_shtdwn_rstrt
		}
	]
	commands = [
	]
}
transition2_gh6_ampzilla_shtdwn_rstrt_c0111 = {
	actors = [
		{
			Name = z_finalbattle_trg_geo_ampzillasoft
			startnode = 'ampzilla_start'
			anim = gh6_ampzilla_shtdwn_rstrt
		}
	]
	commands = [
	]
}
transition2_gh6_ampzilla_shtdwn_rstrt_c0212 = {
	actors = [
		{
			Name = z_finalbattle_trg_geo_ampzillasoft
			startnode = 'ampzilla_start'
			anim = gh6_ampzilla_shtdwn_rstrt
		}
	]
	commands = [
	]
}
default_finalbattleoutro_transition = {
	time = 10000
	ScriptTable = [
	]
}
common_finalbattleoutro_transition = {
}

script get_finalbattle_song_number 
	final_songs = ($quest_chapter_finale.songs)
	GetArraySize <final_songs>
	<i> = 0
	begin
	if ($quest_chapter_finale.songs [<i>] = <song>)
		break
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	if (<i> = <array_Size>)
		<i> = -1
	endif
	return song_number = <i>
endscript
suppress_finalbattle_from_band_select = 0

script use_finalbattle_intro_transition \{restarting = 0}
	gamemode_gettype
	if (<Type> = career)
		if quest_progression_is_chapter_finale
			if (<restarting> = 1)
				Change \{current_transition = fastintro}
				return \{true}
			endif
			if ($suppress_finalbattle_from_band_select = 1)
				Change \{suppress_finalbattle_from_band_select = 0}
				Change \{current_transition = fastintro}
				return \{true}
			endif
			<current_song> = None
			playlist_getcurrentsong
			get_finalbattle_song_number song = <current_song>
			if (<song_number> < 0)
				ScriptAssert \{'Unable to find current song in final chapter description'}
				return \{FALSE}
			endif
			formatText checksumName = trans 'g_finalbattleintro%a' a = (<song_number> + 1)
			Change \{current_transition = finalbattleintro}
			Change common_finalbattleintro_transition = ($<trans>)
			<new_time> = ($common_finalbattleintro_transition.time)
			<local_default> = $default_finalbattleintro_transition
			AddParam structure_name = local_default Name = time value = <new_time>
			Change default_finalbattleintro_transition = <local_default>
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script final_battle_change_level 
	Wait \{1
		Second}
	begin
	if NOT ScriptIsRunning \{ui_create_quest_breakdown}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	Wait \{1
		Second}
	Change \{current_level = load_z_credits}
	Change \{songtime_paused = 0}
	ui_destroy_quest_breakdown
	Change \{end_credits = 1}
	generic_event_choose \{state = uistate_end_credits
		data = {
		}}
endscript

script use_finalbattle_outro 
	<prev_song> = $last_song_played
	if StructureContains structure = $g_finalbattle_data <prev_song>
		<song_data> = ($g_finalbattle_data.<prev_song>)
		<trans> = (<song_data>.outro)
		Change common_finalbattleoutro_transition = ($<trans>)
		<new_time> = ($common_finalbattleoutro_transition.time)
		<local_default> = $default_finalbattleoutro_transition
		AddParam structure_name = local_default Name = time value = <new_time>
		Change default_finalbattleoutro_transition = <local_default>
		Change \{g_suppress_power_rocker_intro = 1}
		return \{true}
	endif
	return \{FALSE}
endscript

script gh6intro_fx_dg_attacka 
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sdattacka01}
	CreateParticleSystem Name = <uniqueID> objID = GUITARIST bone = bone_guitar_body params_Script = $gp_fx_sd_dg_attacka_glow01
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sdattacka02}
	CreateParticleSystem Name = <uniqueID> objID = GUITARIST bone = bone_guitar_body params_Script = $gp_fx_sd_dg_attacka_sparks01
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sdattacka03}
	CreateParticleSystem groupID = fxgid_finalattack Name = <uniqueID> objID = z_finalbattle_trg_geo_ampzilla bone = Bone_Stomach_Lower params_Script = $gp_fx_sd_dg_attackf_bodysparks01
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sdattacka04}
	CreateParticleSystem groupID = fxgid_finalattack Name = <uniqueID> objID = z_finalbattle_trg_geo_ampzilla bone = Bone_Stomach_Lower params_Script = $gp_fx_sd_dg_attackf_bodyelectric01
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sdattacka05}
	CreateParticleSystem groupID = fxgid_finalattack Name = <uniqueID> objID = z_finalbattle_trg_geo_ampzilla bone = Bone_Stomach_Lower params_Script = {
		$gp_fx_outro02_backsmoke01
		LifeTime = 1.0
	}
endscript

script gh6intro_fx_dg_attackf 
	SoundEvent \{event = z_finalbattle_hita}
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sdattackf01}
	CreateParticleSystem groupID = fxgid_finalattack Name = <uniqueID> objID = GUITARIST bone = bone_guitar_body params_Script = $gp_fx_sd_dg_attackf_glow01
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sdattackf02}
	CreateParticleSystem groupID = fxgid_finalattack Name = <uniqueID> objID = GUITARIST bone = bone_guitar_body params_Script = $gp_fx_sd_dg_attackf_sparks01
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sdattackf03}
	CreateParticleSystem groupID = fxgid_finalattack Name = <uniqueID> objID = GUITARIST bone = bone_guitar_body params_Script = $gp_fx_sd_dg_attackf_sparks02
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sdattackf04}
	CreateParticleSystem groupID = fxgid_finalattack Name = <uniqueID> objID = GUITARIST bone = bone_guitar_body params_Script = $gp_fx_sd_dg_attackf_electric01
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sdattackf05}
	CreateParticleSystem groupID = fxgid_finalattack Name = <uniqueID> objID = z_finalbattle_trg_geo_ampzilla bone = Bone_Stomach_Lower params_Script = $gp_fx_sd_dg_attackf_bodysparks01
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sdattackf06}
	CreateParticleSystem groupID = fxgid_finalattack Name = <uniqueID> objID = z_finalbattle_trg_geo_ampzilla bone = Bone_Stomach_Lower params_Script = $gp_fx_sd_dg_attackf_bodyelectric01
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sdattackf07}
	CreateParticleSystem groupID = fxgid_finalattack Name = <uniqueID> objID = z_finalbattle_trg_geo_ampzilla bone = Bone_Stomach_Lower params_Script = $gp_fx_outro02_backsmoke01
endscript

script gh6intro_fx_dg_attackf_cleanup 
	DestroyParticlesByGroupID \{groupID = fxgid_finalattack
		ifEmpty = 1}
endscript

script gh6intro_fx_dg_attackkick 
	SoundEvent \{event = z_finalbattle_hita}
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sdattackkick01}
	CreateParticleSystem groupID = fxgid_dgattackkick Name = <uniqueID> objID = GUITARIST bone = Bone_Toe_R params_Script = $gp_fx_sd_dg_attacka_glow01
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sdattackkick02}
	CreateParticleSystem groupID = fxgid_dgattackkick Name = <uniqueID> objID = GUITARIST bone = Bone_Toe_R params_Script = $gp_fx_sd_dg_attacka_sparks01
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sdattackkick03}
	CreateParticleSystem groupID = fxgid_dgattackkick Name = <uniqueID> objID = z_finalbattle_trg_geo_ampzilla bone = Bone_Stomach_Lower params_Script = $gp_fx_sd_dg_attackf_bodysparks01
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sdattackkick04}
	CreateParticleSystem groupID = fxgid_dgattackkick Name = <uniqueID> objID = z_finalbattle_trg_geo_ampzilla bone = Bone_Stomach_Lower params_Script = $gp_fx_sd_dg_attackf_bodyelectric01
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sdattackkick05}
	CreateParticleSystem groupID = fxgid_dgattackkick Name = <uniqueID> objID = z_finalbattle_trg_geo_ampzilla bone = Bone_Stomach_Lower params_Script = {
		$gp_fx_outro02_backsmoke01
		LifeTime = 1.0
	}
endscript

script gh6intro_fx_dg_attackkick_cleanup 
	DestroyParticlesByGroupID \{groupID = fxgid_dgattackkick
		ifEmpty = 0}
endscript

script gh6intro_fx_dg_attackpunch 
	SoundEvent \{event = z_finalbattle_hita}
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sdattackkick01}
	CreateParticleSystem Name = <uniqueID> objID = GUITARIST bone = bone_hand_index_top_r params_Script = $gp_fx_sd_dg_attacka_glow01
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sdattackkick02}
	CreateParticleSystem Name = <uniqueID> objID = GUITARIST bone = bone_hand_index_top_r params_Script = $gp_fx_sd_dg_attacka_sparks01
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sdattackkick03}
	CreateParticleSystem Name = <uniqueID> objID = z_finalbattle_trg_geo_ampzilla bone = Bone_Stomach_Lower params_Script = $gp_fx_sd_dg_attackf_bodysparks01
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sdattackkick04}
	CreateParticleSystem Name = <uniqueID> objID = z_finalbattle_trg_geo_ampzilla bone = Bone_Stomach_Lower params_Script = $gp_fx_sd_dg_attackf_bodyelectric01
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sdattackkick05}
	CreateParticleSystem Name = <uniqueID> objID = z_finalbattle_trg_geo_ampzilla bone = Bone_Stomach_Lower params_Script = {
		$gp_fx_outro02_backsmoke01
		LifeTime = 1.0
	}
endscript

script gh6intro_fx_dg_attackrush 
	SoundEvent \{event = z_finalbattle_hita}
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sdattackkick01}
	CreateParticleSystem Name = <uniqueID> objID = GUITARIST bone = Bone_Bicep_R params_Script = $gp_fx_sd_dg_attacka_glow01
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sdattackkick02}
	CreateParticleSystem Name = <uniqueID> objID = GUITARIST bone = Bone_Bicep_R params_Script = $gp_fx_sd_dg_attacka_sparks01
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sdattackkick03}
	CreateParticleSystem Name = <uniqueID> objID = z_finalbattle_trg_geo_ampzilla bone = Bone_Stomach_Lower params_Script = $gp_fx_sd_dg_attackf_bodysparks01
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sdattackkick04}
	CreateParticleSystem Name = <uniqueID> objID = z_finalbattle_trg_geo_ampzilla bone = Bone_Stomach_Lower params_Script = $gp_fx_sd_dg_attackf_bodyelectric01
endscript

script gh6intro_fx_dg_wallslam 
	SafeCreate \{nodeName = z_finalbattle_gfx_fx_sd_dg_walldust01}
endscript

script gh6intro_fx_dg_hita 
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sdhita01
		objID = GUITARIST}
	CreateParticleSystem Name = <uniqueID> objID = GUITARIST bone = bone_chest params_Script = $gp_fx_sd_dg_hita_rings01
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sdhita02
		objID = GUITARIST}
	CreateParticleSystem Name = <uniqueID> objID = GUITARIST bone = bone_chest params_Script = $gp_fx_sd_dg_hita_sparks01
endscript

script gh6intro_fx_dg_groundslam 
	SafeCreate \{nodeName = z_finalbattle_gfx_fx_sd_dg_grounddust01}
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sddust01
		objID = GUITARIST}
	CreateParticleSystem Name = <uniqueID> objID = GUITARIST bone = bone_head params_Script = $gp_fx_sd_dg_slidedust01
endscript

script gh6intro_fx_dg_slide 
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sddust01
		objID = GUITARIST}
	CreateParticleSystem Name = <uniqueID> objID = GUITARIST bone = bone_head params_Script = $gp_fx_sd_dg_slidedust01
endscript

script gh6intro_fx_ampzilla_extradamage 
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sdampdamage01
		objID = z_finalbattle_trg_geo_ampzilla}
	CreateParticleSystem groupID = fxgid_ampdamage Name = <uniqueID> objID = z_finalbattle_trg_geo_ampzilla bone = bone_shoulder_twist_l params_Script = $gp_fx_sd_ampzilla_smoke01
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sdampdamage01s
		objID = z_finalbattle_trg_geo_ampzilla}
	CreateParticleSystem groupID = fxgid_ampdamage Name = <uniqueID> objID = z_finalbattle_trg_geo_ampzilla bone = bone_shoulder_twist_l params_Script = $gp_fx_sd_ampzilla_sparks01
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sdampdamage01g
		objID = z_finalbattle_trg_geo_ampzilla}
	CreateParticleSystem groupID = fxgid_ampdamage Name = <uniqueID> objID = z_finalbattle_trg_geo_ampzilla bone = bone_shoulder_twist_l params_Script = $gp_fx_sd_ampzilla_glow01
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sdampdamage01e
		objID = z_finalbattle_trg_geo_ampzilla}
	CreateParticleSystem groupID = fxgid_ampdamage Name = <uniqueID> objID = z_finalbattle_trg_geo_ampzilla bone = bone_shoulder_twist_l params_Script = {
		$gp_fx_sd_ampzilla_electric01
		SizeRange = [(6.0, 6.0) (9.0, 9.0)]
		EmitRangeDims = (1.5, 1.5, 1.5)
	}
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sdampdamage02
		objID = z_finalbattle_trg_geo_ampzilla}
	CreateParticleSystem groupID = fxgid_ampdamage Name = <uniqueID> objID = z_finalbattle_trg_geo_ampzilla bone = bone_shoulder_lift_r params_Script = $gp_fx_sd_ampzilla_smoke01
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sdampdamage02s
		objID = z_finalbattle_trg_geo_ampzilla}
	CreateParticleSystem groupID = fxgid_ampdamage Name = <uniqueID> objID = z_finalbattle_trg_geo_ampzilla bone = bone_shoulder_lift_r params_Script = {
		$gp_fx_sd_ampzilla_sparks01
		EmitPeriod = 1.3
	}
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sdampdamage02g
		objID = z_finalbattle_trg_geo_ampzilla}
	CreateParticleSystem groupID = fxgid_ampdamage Name = <uniqueID> objID = z_finalbattle_trg_geo_ampzilla bone = bone_shoulder_lift_r params_Script = {
		$gp_fx_sd_ampzilla_glow01
		EmitPeriod = 1.3
	}
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sdampdamage02e
		objID = z_finalbattle_trg_geo_ampzilla}
	CreateParticleSystem groupID = fxgid_ampdamage Name = <uniqueID> objID = z_finalbattle_trg_geo_ampzilla bone = bone_shoulder_lift_r params_Script = {
		$gp_fx_sd_ampzilla_electric01
		EmitPeriod = 1.3
	}
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sdampdamage03
		objID = z_finalbattle_trg_geo_ampzilla}
	CreateParticleSystem groupID = fxgid_ampdamage Name = <uniqueID> objID = z_finalbattle_trg_geo_ampzilla bone = Bone_Knee_R params_Script = $gp_fx_sd_ampzilla_smoke01
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sdampdamage03s
		objID = z_finalbattle_trg_geo_ampzilla}
	CreateParticleSystem groupID = fxgid_ampdamage Name = <uniqueID> objID = z_finalbattle_trg_geo_ampzilla bone = Bone_Knee_R params_Script = {
		$gp_fx_sd_ampzilla_sparks01
		EmitPeriod = 2.1
	}
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sdampdamage03g
		objID = z_finalbattle_trg_geo_ampzilla}
	CreateParticleSystem groupID = fxgid_ampdamage Name = <uniqueID> objID = z_finalbattle_trg_geo_ampzilla bone = Bone_Knee_R params_Script = {
		$gp_fx_sd_ampzilla_glow01
		EmitPeriod = 2.1
	}
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sdampdamage03e
		objID = z_finalbattle_trg_geo_ampzilla}
	CreateParticleSystem groupID = fxgid_ampdamage Name = <uniqueID> objID = z_finalbattle_trg_geo_ampzilla bone = Bone_Knee_R params_Script = {
		$gp_fx_sd_ampzilla_electric01
		EmitPeriod = 2.1
		SizeRange = [(4.0, 4.0) (6.0, 6.0)]
		EmitRangeDims = (1.5, 1.5, 1.5)
	}
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sdampdamage04
		objID = z_finalbattle_trg_geo_ampzilla}
	CreateParticleSystem groupID = fxgid_ampdamage Name = <uniqueID> objID = z_finalbattle_trg_geo_ampzilla bone = bone_wrist_twist_l params_Script = $gp_fx_sd_ampzilla_smoke01
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sdampdamage04s
		objID = z_finalbattle_trg_geo_ampzilla}
	CreateParticleSystem groupID = fxgid_ampdamage Name = <uniqueID> objID = z_finalbattle_trg_geo_ampzilla bone = bone_wrist_twist_l params_Script = {
		$gp_fx_sd_ampzilla_sparks01
		EmitPeriod = 1.9
	}
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sdampdamage04g
		objID = z_finalbattle_trg_geo_ampzilla}
	CreateParticleSystem groupID = fxgid_ampdamage Name = <uniqueID> objID = z_finalbattle_trg_geo_ampzilla bone = bone_wrist_twist_l params_Script = {
		$gp_fx_sd_ampzilla_glow01
		EmitPeriod = 1.9
		EmitRangeDims = (1.0, 1.0, 1.0)
	}
	SafeGetUniqueCompositeObjectID \{preferredID = fxid_sdampdamage04e
		objID = z_finalbattle_trg_geo_ampzilla}
	CreateParticleSystem groupID = fxgid_ampdamage Name = <uniqueID> objID = z_finalbattle_trg_geo_ampzilla bone = bone_wrist_twist_l params_Script = {
		$gp_fx_sd_ampzilla_electric01
		EmitPeriod = 1.9
		SizeRange = [(6.0, 6.0) (9.0, 9.0)]
		EmitRangeDims = (1.5, 1.5, 1.5)
	}
endscript

script gh6intro_fx_ampzilla_grounddust 
	SafeCreate \{nodeName = z_finalbattle_gfx_fx_sd_ampzilla_grounddust01}
	SafeCreate \{nodeName = z_finalbattle_gfx_fx_sd_ampzilla_groundelectric01}
	SafeCreate \{nodeName = z_finalbattle_gfx_fx_sd_ampzilla_groundsparks01}
endscript

script gh6intro_fx_ampzilla_handdust 
	z_finalbattle_trg_geo_ampzilla :Obj_GetBonePosition \{bone = bone_palm_twist_r}
	Pos = (<X> * (1.0, 0.0, 0.0) + <y> * (0.0, 1.0, 0.0) + <z> * (0.0, 0.0, 1.0) - (0.0, 6.5, 0.0))
	GetUniqueCompositeobjectID \{preferredID = fxid_ampzillastep01}
	CreateParticleSystem Name = <uniqueID> Pos = <Pos> groupID = zoneparticles params_Script = {
		$gp_fx_finalbattle_ampzilla_footdust01
		EmitNum = 36
		EmitRangeDims = (10.0, 0.5, 10.0)
		SizeRange = [(5.0, 5.0) (10.0, 10.0)]
	}
endscript

script gh6intro_fx_cleanup 
	DestroyParticlesByGroupID \{groupID = fxgid_ampdamage
		ifEmpty = 0}
	DestroyParticlesByGroupID \{groupID = fxgid_finalattack
		ifEmpty = 0}
endscript
