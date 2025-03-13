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
	none
	demigod_intro
]
g_finalbattleintro1 = {
	time = 34700
	scripttable = [
		{
			time = 0
			scr = transition_stoprendering
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
			scr = play_intro
			params = {
				fast = 1
			}
		}
		{
			time = 1
			scr = bandmanager_hideinstrument
			params = {
				name = musician1
			}
		}
		{
			time = 1
			scr = bandmanager_hideinstrument
			params = {
				name = musician2
			}
		}
		{
			time = 1
			scr = bandmanager_hideinstrument
			params = {
				name = musician3
			}
		}
		{
			time = 1
			scr = bandmanager_hideinstrument
			params = {
				name = musician4
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
			scr = z_finalbattle_createground
			params = {
			}
		}
		{
			time = 1
			scr = z_finalbattle_createfinalbattlerocks
			params = {
			}
		}
		{
			time = 1
			scr = z_finalbattle_move_ampzilla_offscreen
			params = {
			}
		}
		{
			time = 100
			scr = start_preloaded_celeb_intro_stream
			params = {
			}
		}
		{
			time = 100
			scr = audio_gameplay_intro_sfx_warmup
			params = {
			}
		}
		{
			time = 300
			scr = transition_startrendering
			params = {
			}
		}
		{
			time = 5000
			scr = finalbattle_intro01_grounddust
			params = {
			}
		}
		{
			time = 7000
			scr = finalbattle_intro01_createlava
			params = {
			}
		}
		{
			time = 16000
			scr = finalbattle_intro01_shakedust
			params = {
			}
		}
		{
			time = 17000
			scr = z_finalbattle_unhidefinalbattlerocks
			params = {
			}
		}
		{
			time = 18000
			scr = finalbattle_intro01_shakedust
			params = {
			}
		}
		{
			time = 23000
			scr = finalbattle_intro01_killlava
			params = {
			}
		}
		{
			time = 23600
			scr = finalbattle_intro01_rockdust
			params = {
			}
		}
		{
			time = 28066
			scr = z_finalbattle_killfinalbattlerocks
			params = {
			}
		}
		{
			time = 32132
			scr = bandmanager_unhideinstrument
			params = {
				name = musician1
			}
		}
		{
			time = 32132
			scr = bandmanager_unhideinstrument
			params = {
				name = musician2
			}
		}
		{
			time = 32132
			scr = bandmanager_unhideinstrument
			params = {
				name = musician3
			}
		}
		{
			time = 32132
			scr = bandmanager_unhideinstrument
			params = {
				name = musician4
			}
		}
		{
			time = 32132
			scr = z_finalbattle_destroyground
			params = {
			}
		}
	]
	endwithdefaultcamera
	syncwithnotecameras
}

script finalbattle_careeronlycheck 
	gamemode_gettype
	if (<type> != career)
		killspawnedscript \{name = finalbattle_careeronlycheck}
	endif
endscript

script z_finalbattle_move_ampzilla_offscreen 
	safekill \{nodename = z_finalbattle_trg_geo_ampzilla}
	safekill \{nodename = z_finalbattle_trg_geo_ampzillasoft}
	safecreate \{nodename = z_finalbattle_trg_geo_ampzilla}
	safecreate \{nodename = z_finalbattle_trg_geo_ampzillasoft}
	z_finalbattle_trg_geo_ampzilla :obj_movetopos \{(0.0, -200.0, 0.0)}
	z_finalbattle_trg_geo_ampzillasoft :obj_movetopos \{(0.0, -200.0, 0.0)}
	wait \{1
		gameframe}
	finalbattle_outro02_killstatic
	wait \{1
		gameframe}
	finalbattle_outro02_createstatic
endscript

script finalbattle_intro01_grounddust 
	safecreate \{nodename = z_finalbattle_gfx_fx_intro01_grounddust01}
endscript

script finalbattle_intro01_createlava 
	safecreate \{nodename = z_finalbattle_gfx_fx_intro01_poollavafire01}
	safecreate \{nodename = z_finalbattle_gfx_fx_intro01_poollavasparks01}
endscript

script finalbattle_intro01_shakedust 
	getuniquecompositeobjectid \{preferredid = fxid_shakedust01}
	createparticlesystem name = <uniqueid> pos = (18.850798, -0.735962, 63.487804) params_script = $gp_fx_intro01_shakedust01
endscript

script finalbattle_intro01_killlava 
	safekill \{nodename = z_finalbattle_gfx_fx_intro01_poollavafire01}
	safekill \{nodename = z_finalbattle_gfx_fx_intro01_poollavasparks01}
endscript

script finalbattle_intro01_rockdust 
	safecreate \{nodename = z_finalbattle_gfx_fx_intro01_rockdust01}
	safecreate \{nodename = z_finalbattle_gfx_fx_intro01_rockbits01}
endscript
g_finalbattleintro2 = {
	time = 133
	scripttable = [
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
			scr = play_intro
			params = {
				fast = 1
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
			time = 100
			scr = transition_startrendering
		}
		{
			time = 100
			scr = audio_gameplay_intro_sfx_warmup
		}
		{
			time = 100
			scr = fadetoblack
			params = {
				off
				time = 0.75
				alpha = 1.0
				id = finalbattle_fade
			}
		}
	]
	endwithdefaultcamera
	syncwithnotecameras
}
g_finalbattleintro3 = {
	time = 44433
	scripttable = [
		{
			time = 0
			scr = transition_stoprendering
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
			scr = play_intro
			params = {
				fast = 1
			}
		}
		{
			time = 0
			scr = transition_cameracut
			params = {
				prefix = 'cameras_moments'
				changenow
				name = moment01
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
			scr = demi_rockbreak_stateoff
			params = {
			}
		}
		{
			time = 1
			scr = finalbattle_intro03_fx_setup
			params = {
			}
		}
		{
			time = 100
			scr = transition_startrendering
			params = {
			}
		}
		{
			time = 100
			scr = audio_gameplay_intro_sfx_warmup
			params = {
			}
		}
		{
			time = 4567
			scr = z_finalbattle_createfinalbattlerocks
			params = {
			}
		}
		{
			time = 9000
			scr = finalbattle_intro03_killbeambits
			params = {
			}
		}
		{
			time = 10500
			scr = finalbattle_intro03_fx_createeyeglows
			params = {
			}
		}
		{
			time = 11800
			scr = band_unhide
			params = {
				name = guitarist
			}
		}
		{
			time = 11800
			scr = demi_rockbreak_state
			params = {
			}
		}
		{
			time = 11800
			scr = finalbattle_intro03_fx_killeyeglows
			params = {
			}
		}
		{
			time = 12000
			scr = finalbattle_intro03_fx_bustdust01
			params = {
			}
		}
		{
			time = 12000
			scr = finalbattle_intro03_fx_ax
			params = {
			}
		}
		{
			time = 13000
			scr = finalbattle_intro03_fx_bustdust02
			params = {
			}
		}
		{
			time = 14800
			scr = finalbattle_intro03_fx_rockdust01
			params = {
			}
		}
		{
			time = 16000
			scr = z_finalbattle_killfinalbattlerocks
			params = {
			}
		}
		{
			time = 25000
			scr = finalbattle_intro03_fx_axglow
			params = {
			}
		}
		{
			time = 31000
			scr = finalbattle_intro03_fx_killbacksmoke
			params = {
			}
		}
		{
			time = 34000
			scr = finalbattle_intro03_fx_createbacksmoke
			params = {
			}
		}
		{
			time = 36500
			scr = finalbattle_intro03_fx_lightning
			params = {
			}
		}
		{
			time = 44432
			scr = finalbattle_intro03_fx_cleanup
			params = {
			}
		}
	]
	endwithdefaultcamera
	syncwithnotecameras
}

script finalbattle_intro03_fx_setup 
	safecreate \{nodename = z_finalbattle_gfx_fx_intro03_statue_beam01}
	safecreate \{nodename = z_finalbattle_gfx_fx_intro03_statue_beam02}
	spawnscriptlater \{finalbattle_intro03_fx_createbeambits}
endscript

script finalbattle_intro03_fx_createbeambits 
	n = [2 7 11 3 5 13 8 1 6 10 12 4 9 3 5 12 8 4]
	t = 1.0
	i = 0
	begin
	wait <t> seconds
	formattext checksumname = firename 'Z_FinalBattle_GFX_FX_Intro03_Statue_BeamBits%p' p = (<n> [<i>])
	safecreate nodename = <firename>
	formattext checksumname = sparkname 'Z_FinalBattle_GFX_FX_Intro03_Statue_BeamDust%p' p = (<n> [<i>])
	safecreate nodename = <sparkname>
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
	killspawnedscript \{name = finalbattle_intro03_fx_createbeambits}
	i = 1
	begin
	formattext checksumname = sparkname 'Z_FinalBattle_GFX_FX_Intro03_Statue_BeamDust%i' i = <i>
	safekill nodename = <sparkname>
	i = (<i> + 1)
	repeat 13
endscript

script finalbattle_intro03_fx_createeyeglows 
	engineconfig \{disablescreenfx = ambientocclusion}
	safecreate \{nodename = z_finalbattle_demieyes}
	safecreate \{nodename = z_finalbattle_sg_eye_glow}
	spawnscriptlater \{changepasscolor
		id = fxid_demieyes
		params = {
			objid = z_finalbattle_demieyes
			material = demieyes_eyes
			parameter = m_pspass0materialcolor
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
	spawnscriptlater \{changepasscolor
		id = fxid_demieyes
		params = {
			objid = z_finalbattle_sg_eye_glow
			material = eyeglow_eyeglow
			parameter = m_pspass0materialcolor
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
	killspawnedscript \{id = fxid_demieyes}
	engineconfig \{enablescreenfx = ambientocclusion}
	updatematerialproperty \{object = z_finalbattle_demieyes
		material = demieyes_eyes
		parameter = m_pspass0materialcolor
		value = [
			0
			0
			0
			255
		]}
	updatematerialproperty \{object = z_finalbattle_sg_eye_glow
		material = eyeglow_eyeglow
		parameter = m_pspass0materialcolor
		value = [
			0
			0
			0
			255
		]}
	safekill \{nodename = z_finalbattle_demieyes}
	safekill \{nodename = z_finalbattle_sg_eye_glow}
	safekill \{nodename = z_finalbattle_gfx_fx_intro03_statue_beam01}
	safekill \{nodename = z_finalbattle_gfx_fx_intro03_statue_beam02}
	killspawnedscript \{name = finalbattle_intro03_fx_createbeambits}
endscript

script finalbattle_intro03_fx_bustdust01 
	safecreate \{nodename = z_finalbattle_gfx_fx_intro03_statue_beam03}
	safecreate \{nodename = z_finalbattle_gfx_fx_intro03_bustdust01}
	safecreate \{nodename = z_finalbattle_gfx_fx_intro03_bustbits01}
	safegetuniquecompositeobjectid \{preferredid = fxid_bustdust01
		objid = guitarist}
	createparticlesystem name = <uniqueid> objid = guitarist bone = bone_forearm_l params_script = $gp_fx_intro03_dg_armdust01
	safegetuniquecompositeobjectid \{preferredid = fxid_bustdust02
		objid = guitarist}
	createparticlesystem name = <uniqueid> objid = guitarist bone = bone_forearm_r params_script = $gp_fx_intro03_dg_armdust01
endscript

script finalbattle_intro03_fx_ax 
	spawnscriptnow \{finalbattle_intro03_fx_axwind}
	safegetuniquecompositeobjectid \{preferredid = fxid_ax01
		objid = guitarist}
	createparticlesystem name = <uniqueid> groupid = fxid_axparticles objid = guitarist bone = bone_guitar_body params_script = $gp_fx_intro03_ax_sparkles01
	safegetuniquecompositeobjectid \{preferredid = fxid_ax02
		objid = guitarist}
	createparticlesystem name = <uniqueid> groupid = fxid_axparticles objid = guitarist bone = bone_guitar_body params_script = $gp_fx_intro03_ax_glow01
	safegetuniquecompositeobjectid \{preferredid = fxid_ax03
		objid = guitarist}
	createparticlesystem name = <uniqueid> groupid = fxid_axparticles objid = guitarist bone = bone_guitar_body params_script = $gp_fx_intro03_ax_fire01
	safegetuniquecompositeobjectid \{preferredid = fxid_ax04
		objid = guitarist}
	createparticlesystem name = <uniqueid> groupid = fxid_axparticles objid = guitarist bone = bone_guitar_body params_script = $gp_fx_intro03_ax_wisps01
endscript

script finalbattle_intro03_fx_axwind 
	begin
	if iscreated \{guitarist}
		guitarist :obj_getboneposition \{bone = bone_guitar_body}
		enginewind create = {
			name = fxid_axwind
			type = point
			pos = ((<x> * (1.0, 0.0, 0.0)) + (<y> * (0.0, 1.0, 0.0)) + (<z> * (0.0, 0.0, 1.0)))
			velocity = (1.0, 1.0, 1.0)
			speed = 3.0
			tangentweight = 0.09
			range = 20
			attenuation = 0
			time = 0
		}
	endif
	wait \{0.1
		seconds}
	repeat
endscript

script finalbattle_intro03_fx_bustdust02 
	safecreate \{nodename = z_finalbattle_gfx_fx_intro03_bustdust02}
	safecreate \{nodename = z_finalbattle_gfx_fx_intro03_bustbits02}
endscript

script finalbattle_intro03_fx_rockdust01 
	safecreate \{nodename = z_finalbattle_gfx_fx_intro03_rockdust01}
endscript

script finalbattle_intro03_fx_axglow 
	safegetuniquecompositeobjectid \{preferredid = fxid_axglow01
		objid = guitarist}
	createparticlesystem name = <uniqueid> objid = guitarist bone = bone_guitar_body params_script = $gp_fx_intro03_ax_glow02
	safegetuniquecompositeobjectid \{preferredid = fxid_axglow02
		objid = guitarist}
	createparticlesystem name = <uniqueid> objid = guitarist bone = bone_guitar_body params_script = $gp_fx_intro03_ax_sparks01
endscript

script finalbattle_intro03_fx_killbacksmoke 
	destroyparticlesbygroupid \{groupid = fxid_ampzillastaticbacksmoke
		ifempty = 1}
endscript

script finalbattle_intro03_fx_createbacksmoke 
	getuniquecompositeobjectid \{preferredid = fxid_ampzillastatic05}
	createparticlesystem groupid = fxid_ampzillastaticbacksmoke name = <uniqueid> objid = z_finalbattle_trg_geo_ampzilla bone = bone_stomach_lower params_script = $gp_fx_finalbattle_ampzilla_static_backsmoke01
endscript

script finalbattle_intro03_fx_lightning 
	getuniquecompositeobjectid \{preferredid = fxid_lightning01}
	createparticlesystem name = <uniqueid> pos = (-83.8727, 38.6923, 0.212509) params_script = $gp_fx_intro03_lightning01
	getuniquecompositeobjectid \{preferredid = fxid_lightning02}
	createparticlesystem name = <uniqueid> pos = (-83.8727, 38.6923, 0.212509) params_script = $gp_fx_intro03_lightningglow01
endscript

script finalbattle_intro03_fx_cleanup 
	destroyparticlesbygroupid \{groupid = fxid_axparticles}
	killspawnedscript \{name = finalbattle_intro03_fx_guitarwind}
endscript

script finalbattle_intro03_fx_footstep \{objid = guitarist
		emitnum = 12}
	getuniquecompositeobjectid \{preferredid = fxid_demigodstep01}
	createparticlesystem name = <uniqueid> objid = <objid> bone = <bone> params_script = {$gp_fx_intro03_dg_footdust01 emitnum = <emitnum>}
endscript

script demi_rockbreak_stateoff 
	changenodeflag \{ls_encore_pre
		1}
	changenodeflag \{ls_encore_post
		0}
endscript

script demi_rockbreak_state 
	scripteventsyncrenderer
	changenodeflag \{ls_encore_pre
		0}
	changenodeflag \{ls_encore_post
		1}
endscript

script z_finalbattle_createfinalbattlerocks 
	safecreate \{nodename = z_finalbattle_trg_ven_finalbattle_rocks}
	z_finalbattle_trg_ven_finalbattle_rocks :hide
endscript

script z_finalbattle_unhidefinalbattlerocks 
	z_finalbattle_trg_ven_finalbattle_rocks :unhide
endscript

script z_finalbattle_killfinalbattlerocks 
	kill \{name = z_finalbattle_trg_ven_finalbattle_rocks}
endscript

script z_finalbattle_finalbattleintro_transitiondeinit 
	z_finalbattle_killfinalbattlerocks
endscript
default_finalbattleintro_transition = {
	time = 10000
	scripttable = [
	]
}
common_finalbattleintro_transition = {
}
g_finalbattleoutro1 = {
	time = 12000
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
			time = 1
			scr = band_hide
			params = {
				name = musician1
			}
		}
		{
			time = 1
			scr = band_hide
			params = {
				name = musician2
			}
		}
		{
			time = 1
			scr = band_hide
			params = {
				name = musician3
			}
		}
		{
			time = 1
			scr = band_hide
			params = {
				name = musician4
			}
		}
		{
			time = 1
			scr = audio_play_preloaded_fb_scene_2_stream
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
			scr = band_playclip
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
			scr = band_playclip
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
			scr = z_finalbattle_hw_hita
			params = {
			}
		}
		{
			time = 5000
			scr = finalbattle_outro01_armdust
			params = {
			}
		}
		{
			time = 9500
			scr = fadetoblack
			params = {
				on
				time = 0.75
				alpha = 1.0
				z_priority = 0
				id = finalbattle_fade
			}
		}
		{
			time = 11999
			scr = band_unhide
			params = {
				name = musician1
			}
		}
		{
			time = 11999
			scr = band_unhide
			params = {
				name = musician2
			}
		}
		{
			time = 11999
			scr = band_unhide
			params = {
				name = musician3
			}
		}
		{
			time = 11999
			scr = band_unhide
			params = {
				name = musician4
			}
		}
	]
}

script finalbattle_outro01_armdust 
	safecreate \{nodename = z_finalbattle_gfx_fx_outro01_armdust01}
endscript
transition1_gh6_ampzilla_near_death_c015 = {
	actors = [
		{
			name = z_finalbattle_trg_geo_ampzilla
			startnode = 'ampzilla_start'
			anim = gh6_ampzilla_near_death
		}
	]
	cameras = [
		{
			slot = 0
			name = 'TRG_Geo_Camera_Performance_AMPZILLA01'
			anim = gh6_ampzilla_near_death_c01
		}
	]
	commands = [
	]
}
transition1_gh6_ampzilla_near_death_c016 = {
	actors = [
		{
			name = z_finalbattle_trg_geo_ampzillasoft
			startnode = 'ampzilla_start'
			anim = gh6_ampzilla_near_death
		}
	]
	commands = [
	]
}
g_finalbattleoutro2 = {
	time = 34433
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
			time = 1
			scr = band_hide
			params = {
				name = musician1
			}
		}
		{
			time = 1
			scr = band_hide
			params = {
				name = musician2
			}
		}
		{
			time = 1
			scr = band_hide
			params = {
				name = musician3
			}
		}
		{
			time = 1
			scr = band_hide
			params = {
				name = musician4
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
			scr = z_finalbattle_hw_hita
			params = {
			}
		}
		{
			time = 1
			scr = audio_play_preloaded_fb_scene_3_stream
			params = {
			}
		}
		{
			time = 1
			scr = band_playclip
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
			scr = band_playclip
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
			scr = band_playclip
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
			scr = band_playclip
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
			scr = finalbattle_outro02_createbacksmoke
			params = {
			}
		}
		{
			time = 4000
			scr = finalbattle_outro02_kneedust
			params = {
			}
		}
		{
			time = 5500
			scr = finalbattle_outro02_headdust
			params = {
			}
		}
		{
			time = 6000
			scr = finalbattle_outro02_bodydust
			params = {
			}
		}
		{
			time = 6000
			scr = finalbattle_outro02_killstatic
			params = {
			}
		}
		{
			time = 7700
			scr = band_playclip
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
			scr = band_playclip
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
			scr = finalbattle_outro02_killbacksmoke
			params = {
			}
		}
		{
			time = 11933
			scr = band_playclip
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
			scr = band_playclip
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
			scr = finalbattle_outro02_createfinger
			params = {
			}
		}
		{
			time = 15500
			scr = finalbattle_outro02_createstatic
			params = {
			}
		}
		{
			time = 16033
			scr = band_playclip
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
			scr = band_playclip
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
			scr = finalbattle_outro02_fistdust
			params = {
			}
		}
		{
			time = 24200
			scr = band_playclip
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
			scr = band_playclip
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
			scr = fadeoutandin
			params = {
				time = 2.5
				delay = 1.5
				z_priority = 0
			}
		}
		{
			time = 34432
			scr = band_unhide
			params = {
				name = musician1
			}
		}
		{
			time = 34432
			scr = band_unhide
			params = {
				name = musician2
			}
		}
		{
			time = 34432
			scr = band_unhide
			params = {
				name = musician3
			}
		}
		{
			time = 34432
			scr = band_unhide
			params = {
				name = musician4
			}
		}
	]
}

script finalbattle_outro02_kneedust 
	safecreate \{nodename = z_finalbattle_gfx_fx_outro02_kneedust01}
endscript

script finalbattle_outro02_createbacksmoke 
	getuniquecompositeobjectid \{preferredid = fxid_ampzillabacksmoke01}
	createparticlesystem groupid = fxgid_ampzillabacksmoke name = <uniqueid> objid = z_finalbattle_trg_geo_ampzilla bone = bone_stomach_lower params_script = $gp_fx_outro02_backsmoke01
endscript

script finalbattle_outro02_headdust 
	safecreate \{nodename = z_finalbattle_gfx_fx_outro02_headdust01}
endscript

script finalbattle_outro02_bodydust 
	safecreate \{nodename = z_finalbattle_gfx_fx_outro02_bodydust01}
endscript

script finalbattle_outro02_killstatic 
	destroyparticlesbygroupid \{groupid = fxid_ampzillastatic
		ifempty = 1}
	destroyparticlesbygroupid \{groupid = fxid_ampzillastaticbacksmoke
		ifempty = 1}
	safekill \{nodename = z_finalbattle_lfx_trg_lh_ampzilla_eye01}
endscript

script finalbattle_outro02_killbacksmoke 
	destroyparticlesbygroupid \{groupid = fxgid_ampzillabacksmoke
		ifempty = 1}
endscript

script finalbattle_outro02_createfinger 
	getuniquecompositeobjectid \{preferredid = fxid_ampzillafinger01}
	createparticlesystem groupid = fxid_ampzillastatic name = <uniqueid> objid = z_finalbattle_trg_geo_ampzilla bone = bone_finger1_mid_bend_l params_script = $gp_fx_outro02_fingerelectric01
endscript

script finalbattle_outro02_createstatic 
	z_finalbattle_trg_geo_ampzilla :obj_spawnscriptlater \{z_finalbattle_ampzilla_fx_static}
	safecreate \{nodename = z_finalbattle_lfx_trg_lh_ampzilla_eye01}
	z_finalbattle_lfx_trg_lh_ampzilla_eye01 :obj_locktoobject \{objectname = z_finalbattle_trg_geo_ampzilla
		bone = bone_head
		(1.3499999, 3.74, 0.53)
		relangles = (-0.9, 0.0, 0.0)}
endscript

script finalbattle_outro02_fistdust 
	safecreate \{nodename = z_finalbattle_gfx_fx_outro02_fistdust01}
endscript
transition2_gh6_ampzilla_shtdwn_rstrt_c051 = {
	actors = [
		{
			name = z_finalbattle_trg_geo_ampzilla
			startnode = 'ampzilla_start'
			anim = gh6_ampzilla_shtdwn_rstrt
		}
	]
	cameras = [
		{
			slot = 0
			name = 'TRG_Geo_Camera_Performance_AMPZILLA01'
			anim = gh6_ampzilla_shtdwn_rstrt_c05
		}
	]
	commands = [
	]
}
transition2_gh6_ampzilla_shtdwn_rstrt_c062 = {
	actors = [
		{
			name = z_finalbattle_trg_geo_ampzilla
			startnode = 'ampzilla_start'
			anim = gh6_ampzilla_shtdwn_rstrt
		}
	]
	cameras = [
		{
			slot = 0
			name = 'TRG_Geo_Camera_Performance_AMPZILLA01'
			anim = gh6_ampzilla_shtdwn_rstrt_c06
		}
	]
	commands = [
	]
}
transition2_gh6_ampzilla_shtdwn_rstrt_c023 = {
	actors = [
		{
			name = z_finalbattle_trg_geo_ampzilla
			startnode = 'ampzilla_start'
			anim = gh6_ampzilla_shtdwn_rstrt
		}
	]
	cameras = [
		{
			slot = 0
			name = 'TRG_Geo_Camera_Performance_AMPZILLA01'
			anim = gh6_ampzilla_shtdwn_rstrt_c02
		}
	]
	commands = [
	]
}
transition2_gh6_ampzilla_shtdwn_rstrt_c034 = {
	actors = [
		{
			name = z_finalbattle_trg_geo_ampzilla
			startnode = 'ampzilla_start'
			anim = gh6_ampzilla_shtdwn_rstrt
		}
	]
	cameras = [
		{
			slot = 0
			name = 'TRG_Geo_Camera_Performance_AMPZILLA01'
			anim = gh6_ampzilla_shtdwn_rstrt_c03
		}
	]
	commands = [
	]
}
transition2_gh6_ampzilla_shtdwn_rstrt_c055 = {
	actors = [
		{
			name = z_finalbattle_trg_geo_ampzillasoft
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
			name = z_finalbattle_trg_geo_ampzillasoft
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
			name = z_finalbattle_trg_geo_ampzilla
			startnode = 'ampzilla_start'
			anim = gh6_ampzilla_shtdwn_rstrt
		}
	]
	cameras = [
		{
			slot = 0
			name = 'TRG_Geo_Camera_Performance_AMPZILLA01'
			anim = gh6_ampzilla_shtdwn_rstrt_c01
		}
	]
	commands = [
	]
}
transition2_gh6_ampzilla_shtdwn_rstrt_c028 = {
	actors = [
		{
			name = z_finalbattle_trg_geo_ampzilla
			startnode = 'ampzilla_start'
			anim = gh6_ampzilla_shtdwn_rstrt
		}
	]
	cameras = [
		{
			slot = 0
			name = 'TRG_Geo_Camera_Performance_AMPZILLA01'
			anim = gh6_ampzilla_shtdwn_rstrt_c02
		}
	]
	commands = [
	]
}
transition2_gh6_ampzilla_shtdwn_rstrt_c029 = {
	actors = [
		{
			name = z_finalbattle_trg_geo_ampzillasoft
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
			name = z_finalbattle_trg_geo_ampzillasoft
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
			name = z_finalbattle_trg_geo_ampzillasoft
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
			name = z_finalbattle_trg_geo_ampzillasoft
			startnode = 'ampzilla_start'
			anim = gh6_ampzilla_shtdwn_rstrt
		}
	]
	commands = [
	]
}
default_finalbattleoutro_transition = {
	time = 10000
	scripttable = [
	]
}
common_finalbattleoutro_transition = {
}

script get_finalbattle_song_number 
	final_songs = ($quest_chapter_finale.songs)
	getarraysize <final_songs>
	<i> = 0
	begin
	if ($quest_chapter_finale.songs [<i>] = <song>)
		break
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	if (<i> = <array_size>)
		<i> = -1
	endif
	return song_number = <i>
endscript
suppress_finalbattle_from_band_select = 0

script use_finalbattle_intro_transition \{restarting = 0}
	gamemode_gettype
	if (<type> = career)
		if quest_progression_is_chapter_finale
			if (<restarting> = 1)
				change \{current_transition = fastintro}
				return \{true}
			endif
			if ($suppress_finalbattle_from_band_select = 1)
				change \{suppress_finalbattle_from_band_select = 0}
				change \{current_transition = fastintro}
				return \{true}
			endif
			<current_song> = none
			playlist_getcurrentsong
			get_finalbattle_song_number song = <current_song>
			if (<song_number> < 0)
				scriptassert \{'Unable to find current song in final chapter description'}
				return \{false}
			endif
			formattext checksumname = trans 'g_finalbattleintro%a' a = (<song_number> + 1)
			change \{current_transition = finalbattleintro}
			change common_finalbattleintro_transition = ($<trans>)
			<new_time> = ($common_finalbattleintro_transition.time)
			<local_default> = $default_finalbattleintro_transition
			addparam structure_name = local_default name = time value = <new_time>
			change default_finalbattleintro_transition = <local_default>
			return \{true}
		endif
	endif
	return \{false}
endscript

script final_battle_change_level 
	wait \{1
		second}
	begin
	if NOT scriptisrunning \{ui_create_quest_breakdown}
		break
	endif
	wait \{1
		gameframe}
	repeat
	wait \{1
		second}
	change \{current_level = load_z_credits}
	change \{songtime_paused = 0}
	ui_destroy_quest_breakdown
	change \{end_credits = 1}
	generic_event_choose \{state = uistate_end_credits
		data = {
		}}
endscript

script use_finalbattle_outro 
	<prev_song> = $last_song_played
	if structurecontains structure = $g_finalbattle_data <prev_song>
		<song_data> = ($g_finalbattle_data.<prev_song>)
		<trans> = (<song_data>.outro)
		change common_finalbattleoutro_transition = ($<trans>)
		<new_time> = ($common_finalbattleoutro_transition.time)
		<local_default> = $default_finalbattleoutro_transition
		addparam structure_name = local_default name = time value = <new_time>
		change default_finalbattleoutro_transition = <local_default>
		change \{g_suppress_power_rocker_intro = 1}
		return \{true}
	endif
	return \{false}
endscript

script gh6intro_fx_dg_attacka 
	safegetuniquecompositeobjectid \{preferredid = fxid_sdattacka01}
	createparticlesystem name = <uniqueid> objid = guitarist bone = bone_guitar_body params_script = $gp_fx_sd_dg_attacka_glow01
	safegetuniquecompositeobjectid \{preferredid = fxid_sdattacka02}
	createparticlesystem name = <uniqueid> objid = guitarist bone = bone_guitar_body params_script = $gp_fx_sd_dg_attacka_sparks01
	safegetuniquecompositeobjectid \{preferredid = fxid_sdattacka03}
	createparticlesystem groupid = fxgid_finalattack name = <uniqueid> objid = z_finalbattle_trg_geo_ampzilla bone = bone_stomach_lower params_script = $gp_fx_sd_dg_attackf_bodysparks01
	safegetuniquecompositeobjectid \{preferredid = fxid_sdattacka04}
	createparticlesystem groupid = fxgid_finalattack name = <uniqueid> objid = z_finalbattle_trg_geo_ampzilla bone = bone_stomach_lower params_script = $gp_fx_sd_dg_attackf_bodyelectric01
	safegetuniquecompositeobjectid \{preferredid = fxid_sdattacka05}
	createparticlesystem groupid = fxgid_finalattack name = <uniqueid> objid = z_finalbattle_trg_geo_ampzilla bone = bone_stomach_lower params_script = {
		$gp_fx_outro02_backsmoke01
		lifetime = 1.0
	}
endscript

script gh6intro_fx_dg_attackf 
	soundevent \{event = z_finalbattle_hita}
	safegetuniquecompositeobjectid \{preferredid = fxid_sdattackf01}
	createparticlesystem groupid = fxgid_finalattack name = <uniqueid> objid = guitarist bone = bone_guitar_body params_script = $gp_fx_sd_dg_attackf_glow01
	safegetuniquecompositeobjectid \{preferredid = fxid_sdattackf02}
	createparticlesystem groupid = fxgid_finalattack name = <uniqueid> objid = guitarist bone = bone_guitar_body params_script = $gp_fx_sd_dg_attackf_sparks01
	safegetuniquecompositeobjectid \{preferredid = fxid_sdattackf03}
	createparticlesystem groupid = fxgid_finalattack name = <uniqueid> objid = guitarist bone = bone_guitar_body params_script = $gp_fx_sd_dg_attackf_sparks02
	safegetuniquecompositeobjectid \{preferredid = fxid_sdattackf04}
	createparticlesystem groupid = fxgid_finalattack name = <uniqueid> objid = guitarist bone = bone_guitar_body params_script = $gp_fx_sd_dg_attackf_electric01
	safegetuniquecompositeobjectid \{preferredid = fxid_sdattackf05}
	createparticlesystem groupid = fxgid_finalattack name = <uniqueid> objid = z_finalbattle_trg_geo_ampzilla bone = bone_stomach_lower params_script = $gp_fx_sd_dg_attackf_bodysparks01
	safegetuniquecompositeobjectid \{preferredid = fxid_sdattackf06}
	createparticlesystem groupid = fxgid_finalattack name = <uniqueid> objid = z_finalbattle_trg_geo_ampzilla bone = bone_stomach_lower params_script = $gp_fx_sd_dg_attackf_bodyelectric01
	safegetuniquecompositeobjectid \{preferredid = fxid_sdattackf07}
	createparticlesystem groupid = fxgid_finalattack name = <uniqueid> objid = z_finalbattle_trg_geo_ampzilla bone = bone_stomach_lower params_script = $gp_fx_outro02_backsmoke01
endscript

script gh6intro_fx_dg_attackf_cleanup 
	destroyparticlesbygroupid \{groupid = fxgid_finalattack
		ifempty = 1}
endscript

script gh6intro_fx_dg_attackkick 
	soundevent \{event = z_finalbattle_hita}
	safegetuniquecompositeobjectid \{preferredid = fxid_sdattackkick01}
	createparticlesystem groupid = fxgid_dgattackkick name = <uniqueid> objid = guitarist bone = bone_toe_r params_script = $gp_fx_sd_dg_attacka_glow01
	safegetuniquecompositeobjectid \{preferredid = fxid_sdattackkick02}
	createparticlesystem groupid = fxgid_dgattackkick name = <uniqueid> objid = guitarist bone = bone_toe_r params_script = $gp_fx_sd_dg_attacka_sparks01
	safegetuniquecompositeobjectid \{preferredid = fxid_sdattackkick03}
	createparticlesystem groupid = fxgid_dgattackkick name = <uniqueid> objid = z_finalbattle_trg_geo_ampzilla bone = bone_stomach_lower params_script = $gp_fx_sd_dg_attackf_bodysparks01
	safegetuniquecompositeobjectid \{preferredid = fxid_sdattackkick04}
	createparticlesystem groupid = fxgid_dgattackkick name = <uniqueid> objid = z_finalbattle_trg_geo_ampzilla bone = bone_stomach_lower params_script = $gp_fx_sd_dg_attackf_bodyelectric01
	safegetuniquecompositeobjectid \{preferredid = fxid_sdattackkick05}
	createparticlesystem groupid = fxgid_dgattackkick name = <uniqueid> objid = z_finalbattle_trg_geo_ampzilla bone = bone_stomach_lower params_script = {
		$gp_fx_outro02_backsmoke01
		lifetime = 1.0
	}
endscript

script gh6intro_fx_dg_attackkick_cleanup 
	destroyparticlesbygroupid \{groupid = fxgid_dgattackkick
		ifempty = 0}
endscript

script gh6intro_fx_dg_attackpunch 
	soundevent \{event = z_finalbattle_hita}
	safegetuniquecompositeobjectid \{preferredid = fxid_sdattackkick01}
	createparticlesystem name = <uniqueid> objid = guitarist bone = bone_hand_index_top_r params_script = $gp_fx_sd_dg_attacka_glow01
	safegetuniquecompositeobjectid \{preferredid = fxid_sdattackkick02}
	createparticlesystem name = <uniqueid> objid = guitarist bone = bone_hand_index_top_r params_script = $gp_fx_sd_dg_attacka_sparks01
	safegetuniquecompositeobjectid \{preferredid = fxid_sdattackkick03}
	createparticlesystem name = <uniqueid> objid = z_finalbattle_trg_geo_ampzilla bone = bone_stomach_lower params_script = $gp_fx_sd_dg_attackf_bodysparks01
	safegetuniquecompositeobjectid \{preferredid = fxid_sdattackkick04}
	createparticlesystem name = <uniqueid> objid = z_finalbattle_trg_geo_ampzilla bone = bone_stomach_lower params_script = $gp_fx_sd_dg_attackf_bodyelectric01
	safegetuniquecompositeobjectid \{preferredid = fxid_sdattackkick05}
	createparticlesystem name = <uniqueid> objid = z_finalbattle_trg_geo_ampzilla bone = bone_stomach_lower params_script = {
		$gp_fx_outro02_backsmoke01
		lifetime = 1.0
	}
endscript

script gh6intro_fx_dg_attackrush 
	soundevent \{event = z_finalbattle_hita}
	safegetuniquecompositeobjectid \{preferredid = fxid_sdattackkick01}
	createparticlesystem name = <uniqueid> objid = guitarist bone = bone_bicep_r params_script = $gp_fx_sd_dg_attacka_glow01
	safegetuniquecompositeobjectid \{preferredid = fxid_sdattackkick02}
	createparticlesystem name = <uniqueid> objid = guitarist bone = bone_bicep_r params_script = $gp_fx_sd_dg_attacka_sparks01
	safegetuniquecompositeobjectid \{preferredid = fxid_sdattackkick03}
	createparticlesystem name = <uniqueid> objid = z_finalbattle_trg_geo_ampzilla bone = bone_stomach_lower params_script = $gp_fx_sd_dg_attackf_bodysparks01
	safegetuniquecompositeobjectid \{preferredid = fxid_sdattackkick04}
	createparticlesystem name = <uniqueid> objid = z_finalbattle_trg_geo_ampzilla bone = bone_stomach_lower params_script = $gp_fx_sd_dg_attackf_bodyelectric01
endscript

script gh6intro_fx_dg_wallslam 
	safecreate \{nodename = z_finalbattle_gfx_fx_sd_dg_walldust01}
endscript

script gh6intro_fx_dg_hita 
	safegetuniquecompositeobjectid \{preferredid = fxid_sdhita01
		objid = guitarist}
	createparticlesystem name = <uniqueid> objid = guitarist bone = bone_chest params_script = $gp_fx_sd_dg_hita_rings01
	safegetuniquecompositeobjectid \{preferredid = fxid_sdhita02
		objid = guitarist}
	createparticlesystem name = <uniqueid> objid = guitarist bone = bone_chest params_script = $gp_fx_sd_dg_hita_sparks01
endscript

script gh6intro_fx_dg_groundslam 
	safecreate \{nodename = z_finalbattle_gfx_fx_sd_dg_grounddust01}
	safegetuniquecompositeobjectid \{preferredid = fxid_sddust01
		objid = guitarist}
	createparticlesystem name = <uniqueid> objid = guitarist bone = bone_head params_script = $gp_fx_sd_dg_slidedust01
endscript

script gh6intro_fx_dg_slide 
	safegetuniquecompositeobjectid \{preferredid = fxid_sddust01
		objid = guitarist}
	createparticlesystem name = <uniqueid> objid = guitarist bone = bone_head params_script = $gp_fx_sd_dg_slidedust01
endscript

script gh6intro_fx_ampzilla_extradamage 
	safegetuniquecompositeobjectid \{preferredid = fxid_sdampdamage01
		objid = z_finalbattle_trg_geo_ampzilla}
	createparticlesystem groupid = fxgid_ampdamage name = <uniqueid> objid = z_finalbattle_trg_geo_ampzilla bone = bone_shoulder_twist_l params_script = $gp_fx_sd_ampzilla_smoke01
	safegetuniquecompositeobjectid \{preferredid = fxid_sdampdamage01s
		objid = z_finalbattle_trg_geo_ampzilla}
	createparticlesystem groupid = fxgid_ampdamage name = <uniqueid> objid = z_finalbattle_trg_geo_ampzilla bone = bone_shoulder_twist_l params_script = $gp_fx_sd_ampzilla_sparks01
	safegetuniquecompositeobjectid \{preferredid = fxid_sdampdamage01g
		objid = z_finalbattle_trg_geo_ampzilla}
	createparticlesystem groupid = fxgid_ampdamage name = <uniqueid> objid = z_finalbattle_trg_geo_ampzilla bone = bone_shoulder_twist_l params_script = $gp_fx_sd_ampzilla_glow01
	safegetuniquecompositeobjectid \{preferredid = fxid_sdampdamage01e
		objid = z_finalbattle_trg_geo_ampzilla}
	createparticlesystem groupid = fxgid_ampdamage name = <uniqueid> objid = z_finalbattle_trg_geo_ampzilla bone = bone_shoulder_twist_l params_script = {
		$gp_fx_sd_ampzilla_electric01
		sizerange = [(6.0, 6.0) (9.0, 9.0)]
		emitrangedims = (1.5, 1.5, 1.5)
	}
	safegetuniquecompositeobjectid \{preferredid = fxid_sdampdamage02
		objid = z_finalbattle_trg_geo_ampzilla}
	createparticlesystem groupid = fxgid_ampdamage name = <uniqueid> objid = z_finalbattle_trg_geo_ampzilla bone = bone_shoulder_lift_r params_script = $gp_fx_sd_ampzilla_smoke01
	safegetuniquecompositeobjectid \{preferredid = fxid_sdampdamage02s
		objid = z_finalbattle_trg_geo_ampzilla}
	createparticlesystem groupid = fxgid_ampdamage name = <uniqueid> objid = z_finalbattle_trg_geo_ampzilla bone = bone_shoulder_lift_r params_script = {
		$gp_fx_sd_ampzilla_sparks01
		emitperiod = 1.3
	}
	safegetuniquecompositeobjectid \{preferredid = fxid_sdampdamage02g
		objid = z_finalbattle_trg_geo_ampzilla}
	createparticlesystem groupid = fxgid_ampdamage name = <uniqueid> objid = z_finalbattle_trg_geo_ampzilla bone = bone_shoulder_lift_r params_script = {
		$gp_fx_sd_ampzilla_glow01
		emitperiod = 1.3
	}
	safegetuniquecompositeobjectid \{preferredid = fxid_sdampdamage02e
		objid = z_finalbattle_trg_geo_ampzilla}
	createparticlesystem groupid = fxgid_ampdamage name = <uniqueid> objid = z_finalbattle_trg_geo_ampzilla bone = bone_shoulder_lift_r params_script = {
		$gp_fx_sd_ampzilla_electric01
		emitperiod = 1.3
	}
	safegetuniquecompositeobjectid \{preferredid = fxid_sdampdamage03
		objid = z_finalbattle_trg_geo_ampzilla}
	createparticlesystem groupid = fxgid_ampdamage name = <uniqueid> objid = z_finalbattle_trg_geo_ampzilla bone = bone_knee_r params_script = $gp_fx_sd_ampzilla_smoke01
	safegetuniquecompositeobjectid \{preferredid = fxid_sdampdamage03s
		objid = z_finalbattle_trg_geo_ampzilla}
	createparticlesystem groupid = fxgid_ampdamage name = <uniqueid> objid = z_finalbattle_trg_geo_ampzilla bone = bone_knee_r params_script = {
		$gp_fx_sd_ampzilla_sparks01
		emitperiod = 2.1
	}
	safegetuniquecompositeobjectid \{preferredid = fxid_sdampdamage03g
		objid = z_finalbattle_trg_geo_ampzilla}
	createparticlesystem groupid = fxgid_ampdamage name = <uniqueid> objid = z_finalbattle_trg_geo_ampzilla bone = bone_knee_r params_script = {
		$gp_fx_sd_ampzilla_glow01
		emitperiod = 2.1
	}
	safegetuniquecompositeobjectid \{preferredid = fxid_sdampdamage03e
		objid = z_finalbattle_trg_geo_ampzilla}
	createparticlesystem groupid = fxgid_ampdamage name = <uniqueid> objid = z_finalbattle_trg_geo_ampzilla bone = bone_knee_r params_script = {
		$gp_fx_sd_ampzilla_electric01
		emitperiod = 2.1
		sizerange = [(4.0, 4.0) (6.0, 6.0)]
		emitrangedims = (1.5, 1.5, 1.5)
	}
	safegetuniquecompositeobjectid \{preferredid = fxid_sdampdamage04
		objid = z_finalbattle_trg_geo_ampzilla}
	createparticlesystem groupid = fxgid_ampdamage name = <uniqueid> objid = z_finalbattle_trg_geo_ampzilla bone = bone_wrist_twist_l params_script = $gp_fx_sd_ampzilla_smoke01
	safegetuniquecompositeobjectid \{preferredid = fxid_sdampdamage04s
		objid = z_finalbattle_trg_geo_ampzilla}
	createparticlesystem groupid = fxgid_ampdamage name = <uniqueid> objid = z_finalbattle_trg_geo_ampzilla bone = bone_wrist_twist_l params_script = {
		$gp_fx_sd_ampzilla_sparks01
		emitperiod = 1.9
	}
	safegetuniquecompositeobjectid \{preferredid = fxid_sdampdamage04g
		objid = z_finalbattle_trg_geo_ampzilla}
	createparticlesystem groupid = fxgid_ampdamage name = <uniqueid> objid = z_finalbattle_trg_geo_ampzilla bone = bone_wrist_twist_l params_script = {
		$gp_fx_sd_ampzilla_glow01
		emitperiod = 1.9
		emitrangedims = (1.0, 1.0, 1.0)
	}
	safegetuniquecompositeobjectid \{preferredid = fxid_sdampdamage04e
		objid = z_finalbattle_trg_geo_ampzilla}
	createparticlesystem groupid = fxgid_ampdamage name = <uniqueid> objid = z_finalbattle_trg_geo_ampzilla bone = bone_wrist_twist_l params_script = {
		$gp_fx_sd_ampzilla_electric01
		emitperiod = 1.9
		sizerange = [(6.0, 6.0) (9.0, 9.0)]
		emitrangedims = (1.5, 1.5, 1.5)
	}
endscript

script gh6intro_fx_ampzilla_grounddust 
	safecreate \{nodename = z_finalbattle_gfx_fx_sd_ampzilla_grounddust01}
	safecreate \{nodename = z_finalbattle_gfx_fx_sd_ampzilla_groundelectric01}
	safecreate \{nodename = z_finalbattle_gfx_fx_sd_ampzilla_groundsparks01}
endscript

script gh6intro_fx_ampzilla_handdust 
	z_finalbattle_trg_geo_ampzilla :obj_getboneposition \{bone = bone_palm_twist_r}
	pos = (<x> * (1.0, 0.0, 0.0) + <y> * (0.0, 1.0, 0.0) + <z> * (0.0, 0.0, 1.0) - (0.0, 6.5, 0.0))
	getuniquecompositeobjectid \{preferredid = fxid_ampzillastep01}
	createparticlesystem name = <uniqueid> pos = <pos> groupid = zoneparticles params_script = {
		$gp_fx_finalbattle_ampzilla_footdust01
		emitnum = 36
		emitrangedims = (10.0, 0.5, 10.0)
		sizerange = [(5.0, 5.0) (10.0, 10.0)]
	}
endscript

script gh6intro_fx_cleanup 
	destroyparticlesbygroupid \{groupid = fxgid_ampdamage
		ifempty = 0}
	destroyparticlesbygroupid \{groupid = fxgid_finalattack
		ifempty = 0}
endscript
