
script VenueIntro_FX 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case Z_AwardShow
		spawnscriptlater \{VenueIntro_FX_AwardShow
			id = VenuePyroFXKill}
		case Z_Cabo
		spawnscriptlater \{VenueIntro_FX_Cabo
			id = VenuePyroFXKill}
		case Z_CentralPark
		spawnscriptlater \{VenueIntro_FX_CentralPark
			id = VenuePyroFXKill}
		case Z_EasterIsland
		spawnscriptlater \{VenueIntro_FX_EasterIsland
			id = VenuePyroFXKill}
		case Z_Gorge
		spawnscriptlater \{VenueIntro_FX_Gorge
			id = VenuePyroFXKill}
		case Z_Mall
		spawnscriptlater \{VenueIntro_FX_Mall
			id = VenuePyroFXKill}
		case Z_Montreux
		spawnscriptlater \{VenueIntro_FX_Montreux
			id = VenuePyroFXKill}
		case Z_Paris
		spawnscriptlater \{VenueIntro_FX_Paris
			id = VenuePyroFXKill}
		case Z_Tokyo
		spawnscriptlater \{VenueIntro_FX_Tokyo
			id = VenuePyroFXKill}
	endswitch
endscript

script VenueIntro_FX_AwardShow 
	safekill \{nodename = Z_AwardShow_g_Panel_Back_Glo_BlackO_NoDoubt}
	safekill \{nodename = Z_AwardShow_g_Panel_Back_Glo_Expo_NoDoubt}
	wait \{1.7
		seconds}
	LightShow_SetParams \{mood = intro}
	LightShow_SetTime \{time = 0.2}
	i = 0
	begin
	i = (<i> + 1)
	if (<i> < 10)
		FormatText checksumname = name 'Intro_0%d' d = <i>
	else
		FormatText checksumname = name 'Intro_%d' d = <i>
	endif
	LightShow_PlaySnapshot name = <name> UseSnapshotPositions = true save = true
	wait \{0.3
		seconds}
	repeat 16
	wait \{0.2
		seconds}
	spawnscriptlater \{Z_AwardShow_Pyro_Special
		id = VenuePyroFXKill}
	VenueFastIntro_FX_AwardShow
endscript

script VenueIntro_FX_Cabo 
	LightShow_SetParams \{mood = intro}
	LightShow_SetTime \{time = 1}
	LightShow_PlaySnapshot \{name = intro01
		UseSnapshotPositions = true
		save = true}
	wait \{1
		second}
	LightShow_PlaySnapshot \{name = intro02
		UseSnapshotPositions = true
		save = true}
	wait \{1
		second}
	LightShow_PlaySnapshot \{name = intro03
		UseSnapshotPositions = true
		save = true}
	wait \{1
		second}
	LightShow_SetTime \{time = 0.2}
	i = 4
	begin
	i = (<i> + 1)
	if (<i> < 10)
		FormatText checksumname = name 'Intro0%d' d = <i>
	else
		FormatText checksumname = name 'Intro%d' d = <i>
	endif
	LightShow_PlaySnapshot name = <name> UseSnapshotPositions = true save = true
	wait \{0.45000002
		seconds}
	repeat 7
	spawnscriptlater \{Z_cabo_Pyro_Special
		id = VenuePyroFXKill}
endscript

script VenueIntro_FX_CentralPark 
	wait \{3
		seconds}
	LightShow_SetParams \{mood = intro}
	LightShow_SetTime \{time = 0.8}
	LightShow_PlaySnapshot \{name = Intro_01
		UseSnapshotPositions = true
		save = true}
	wait \{0.8
		seconds}
	LightShow_PlaySnapshot \{name = Intro_02
		UseSnapshotPositions = true
		save = true}
	wait \{0.8
		seconds}
	LightShow_PlaySnapshot \{name = Intro_03
		UseSnapshotPositions = true
		save = true}
	wait \{0.8
		seconds}
	LightShow_PlaySnapshot \{name = Intro_04
		UseSnapshotPositions = true
		save = true}
	wait \{1.5
		seconds}
	LightShow_SetTime \{time = 0.5}
	LightShow_PlaySnapshot \{name = Intro_05
		UseSnapshotPositions = true
		save = true}
	wait \{0.2
		seconds}
	SpawnScript \{Z_centralPark_Pyro_Special
		id = VenuePyroFXKill}
endscript

script VenueIntro_FX_EasterIsland 
	LightShow_SetParams \{mood = intro}
	LightShow_SetTime \{time = 0.1}
	LightShow_PlaySnapshot \{name = intro01
		UseSnapshotPositions = true
		save = true}
	wait \{3.5
		seconds}
	LightShow_SetTime \{time = 3}
	LightShow_PlaySnapshot \{name = intro02
		UseSnapshotPositions = true
		save = true}
	wait \{3.5
		seconds}
	spawnscriptlater \{Z_EasterIsland_Pyro_Special
		id = VenuePyroFXKill}
endscript

script VenueIntro_FX_Gorge 
	printf \{qs(0xbdbab3d6)}
	VenueFastIntro_FX_gorge
	wait \{6
		seconds}
	LightShow_SetParams \{mood = intro}
	LightShow_SetTime \{time = 0.2}
	LightShow_PlaySnapshot \{name = intro01
		UseSnapshotPositions = true
		save = true}
	wait \{0.7
		seconds}
	LightShow_PlaySnapshot \{name = intro02
		UseSnapshotPositions = true
		save = true}
	wait \{0.7
		seconds}
	spawnscriptlater \{Z_Gorge_Pyro_Special
		id = VenuePyroFXKill}
endscript

script VenueIntro_FX_Mall 
	wait \{4
		seconds}
	LightShow_SetParams \{mood = intro}
	LightShow_PlaySnapshot \{name = Intro_01
		UseSnapshotPositions = true
		save = true}
	wait \{0.5
		seconds}
	LightShow_SetTime \{time = 0.5}
	LightShow_PlaySnapshot \{name = Intro_02
		UseSnapshotPositions = true
		save = true}
	wait \{0.5
		seconds}
	LightShow_SetTime \{time = 0.5}
	LightShow_PlaySnapshot \{name = Intro_03
		UseSnapshotPositions = true
		save = true}
	wait \{0.5
		seconds}
	LightShow_SetTime \{time = 0.5}
	LightShow_PlaySnapshot \{name = Intro_04
		UseSnapshotPositions = true
		save = true}
	wait \{0.5
		seconds}
	LightShow_SetTime \{time = 0.5}
	LightShow_PlaySnapshot \{name = Intro_05
		UseSnapshotPositions = true
		save = true}
	wait \{0.5
		second}
	SpawnScript \{z_Mall_Pyro_Special
		id = VenuePyroFXKill}
endscript

script VenueIntro_FX_Montreux 
	LightShow_SetParams \{mood = Band_Lobby}
	LightShow_PlaySnapshot \{name = Band_Lobby
		UseSnapshotPositions = true
		save = true}
	wait \{2
		seconds}
	LightShow_SetParams \{mood = intro}
	LightShow_PlaySnapshot \{name = intro01
		UseSnapshotPositions = true
		save = true}
	wait \{1
		seconds}
	LightShow_SetTime \{time = 1}
	LightShow_PlaySnapshot \{name = intro02
		UseSnapshotPositions = true
		save = true}
	wait \{1
		seconds}
	LightShow_SetTime \{time = 1}
	LightShow_PlaySnapshot \{name = intro03
		UseSnapshotPositions = true
		save = true}
	wait \{0.4
		seconds}
	LightShow_SetTime \{time = 0.2}
	LightShow_PlaySnapshot \{name = Intro04
		UseSnapshotPositions = true
		save = true}
	wait \{0.22
		seconds}
	LightShow_SetTime \{time = 0.1}
	LightShow_PlaySnapshot \{name = intro03
		UseSnapshotPositions = true
		save = true}
	wait \{0.22
		seconds}
	LightShow_SetTime \{time = 0.1}
	LightShow_PlaySnapshot \{name = Intro04
		UseSnapshotPositions = true
		save = true}
	wait \{0.22
		seconds}
	LightShow_SetTime \{time = 0.1}
	LightShow_PlaySnapshot \{name = intro03
		UseSnapshotPositions = true
		save = true}
	wait \{0.22
		seconds}
	LightShow_SetTime \{time = 0.1}
	LightShow_PlaySnapshot \{name = Intro04
		UseSnapshotPositions = true
		save = true}
	wait \{0.22
		seconds}
	LightShow_SetTime \{time = 0.1}
	LightShow_PlaySnapshot \{name = intro03
		UseSnapshotPositions = true
		save = true}
	wait \{0.22
		seconds}
	LightShow_SetTime \{time = 0.1}
	LightShow_PlaySnapshot \{name = Intro04
		UseSnapshotPositions = true
		save = true}
	wait \{0.2
		second}
	SpawnScript \{Z_montreux_Pyro_Special
		id = VenuePyroFXKill}
endscript

script VenueIntro_FX_Paris 
	VenueFastIntro_FX_Paris
	wait \{6
		seconds}
	LightShow_SetParams \{mood = intro}
	LightShow_SetTime \{time = 0.1}
	i = 0
	begin
	i = (<i> + 1)
	FormatText checksumname = name 'Intro_0%d' d = <i>
	LightShow_PlaySnapshot name = <name> UseSnapshotPositions = true save = true
	wait \{0.5
		seconds}
	repeat 5
	SpawnScript \{Z_paris_Pyro_Special
		id = VenuePyroFXKill}
endscript

script VenueIntro_FX_Tokyo 
	printf \{qs(0xb52a4a61)}
	VenueFastIntro_FX_Tokyo
	wait \{2
		seconds}
	LightShow_SetParams \{mood = intro}
	LightShow_SetTime \{time = 1.0}
	LightShow_PlaySnapshot \{name = intro01
		UseSnapshotPositions = true
		save = true}
	wait \{1
		second}
	LightShow_PlaySnapshot \{name = intro02
		UseSnapshotPositions = true
		save = true}
	wait \{1
		second}
	LightShow_PlaySnapshot \{name = intro03
		UseSnapshotPositions = true
		save = true}
	wait \{1
		second}
	LightShow_PlaySnapshot \{name = Intro04
		UseSnapshotPositions = true
		save = true}
	wait \{2
		seconds}
	LightShow_SetTime \{time = 0.1}
	LightShow_PlaySnapshot \{name = Intro13
		UseSnapshotPositions = true
		save = true}
	wait \{0.3
		second}
	LightShow_PlaySnapshot \{name = Intro14
		UseSnapshotPositions = true
		save = true}
	wait \{0.3
		second}
	LightShow_PlaySnapshot \{name = Intro15
		UseSnapshotPositions = true
		save = true}
	wait \{0.3
		second}
	LightShow_PlaySnapshot \{name = Intro16
		UseSnapshotPositions = true
		save = true}
	spawnscriptlater \{Z_tokyo_Pyro_Special
		id = VenuePyroFXKill}
endscript

script TurnOffNodeFlags 
	ChangeNodeFlag \{LS_MOOD_FLARE
		0}
	ChangeNodeFlag \{LS_MOOD_CLIMAX
		0}
	ChangeNodeFlag \{LS_MOOD_EXPOSITION
		0}
	ChangeNodeFlag \{LS_MOOD_FALLING
		0}
	ChangeNodeFlag \{LS_MOOD_PRELUDE
		0}
	ChangeNodeFlag \{LS_MOOD_RISING
		0}
	ChangeNodeFlag \{LS_MOOD_STARPOWER
		0}
	ChangeNodeFlag \{LS_MOOD_RESOLUTION
		0}
	ChangeNodeFlag \{LS_MOOD_PYRO
		0}
	ChangeNodeFlag \{LS_MOOD_BLACKOUT
		0}
	ChangeNodeFlag \{LS_MOOD_INTRO
		0}
	ChangeNodeFlag \{LS_MOOD_SILHOUETTE
		0}
	ChangeNodeFlag \{LS_MOOD_TENSION
		0}
	ChangeNodeFlag \{LS_MOOD_WASH
		0}
	ChangeNodeFlag \{LS_MOOD_STROBE
		0}
	ChangeNodeFlag \{LS_MOOD_MENU
		0}
endscript

script TurnOffEncoreGodray 
	if ScreenFX_FXInstanceExists \{viewport = bg_viewport
			name = GodRay}
		ScreenFX_UpdateFXInstanceParams \{viewport = bg_viewport
			name = GodRay
			scefName = GodRay
			type = GodRay
			on = 0
			lightsource = Object}
	endif
endscript

script VenueFastIntro_FX 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case Z_Tokyo
		VenueFastIntro_FX_Tokyo
		case Z_Paris
		VenueFastIntro_FX_Paris
		case Z_AwardShow
		VenueFastIntro_FX_AwardShow
		case Z_Gorge
		VenueFastIntro_FX_gorge
		case Z_Space
		VenueFastIntro_FX_Space
		case Z_Cabo
		VenueFastIntro_FX_Cabo
		case Z_CentralPark
		VenueFastIntro_FX_centralpark
		case Z_EasterIsland
		VenueFastIntro_FX_easterisland
		case Z_Mall
		VenueFastIntro_FX_Mall
		case Z_Montreux
		VenueFastIntro_FX_Montreux
	endswitch
endscript

script VenueFastIntro_FX_Cabo 
	killspawnedscript \{id = VenuePyroFXKill}
	DestroyParticlesByGroupID \{groupID = zoneparticles
		ifEmpty = 0}
	CallScriptOnNode \{prefix = Z_cabo_GFX_FX_PyroLight
		callback_Script = Z_cabo_PyroLights_Disable
		params = {
		}}
endscript

script VenueFastIntro_FX_centralpark 
	killspawnedscript \{id = VenuePyroFXKill}
	DestroyParticlesByGroupID \{groupID = zoneparticles
		ifEmpty = 0}
	CallScriptOnNode \{prefix = Z_CentralPark_GFX_FX_PyroLight
		callback_Script = Z_CentralPark_PyroLights_Disable
		params = {
		}}
endscript

script VenueFastIntro_FX_easterisland 
	killspawnedscript \{id = VenuePyroFXKill}
	DestroyParticlesByGroupID \{groupID = zoneparticles
		ifEmpty = 0}
	CallScriptOnNode \{prefix = Z_EasterIsland_GFX_FX_PyroLight
		callback_Script = Z_EasterIsland_PyroLights_Disable
		params = {
		}}
endscript

script VenueFastIntro_FX_Mall 
	killspawnedscript \{id = VenuePyroFXKill}
	DestroyParticlesByGroupID \{groupID = zoneparticles
		ifEmpty = 0}
	CallScriptOnNode \{prefix = Z_mall_GFX_FX_PyroLight
		callback_Script = Z_mall_PyroLights_Disable
		params = {
		}}
endscript

script VenueFastIntro_FX_Montreux 
	killspawnedscript \{id = VenuePyroFXKill}
	DestroyParticlesByGroupID \{groupID = zoneparticles
		ifEmpty = 0}
	CallScriptOnNode \{prefix = z_montreux_GFX_FX_PyroLight
		callback_Script = z_montreux_PyroLights_Disable
		params = {
		}}
endscript

script VenueFastIntro_FX_Tokyo 
	DestroyParticlesByGroupID \{groupID = zoneparticles
		ifEmpty = 0}
	CallScriptOnNode \{prefix = Z_tokyo_GFX_FX_PyroLight
		callback_Script = Z_tokyo_PyroLights_Disable
		params = {
		}}
	if NOT ($current_song_qpak = SheWillBeLoved)
		safekill \{nodename = Z_Tokyo_JP_TOK_Adam_Levine_01}
		safekill \{nodename = Z_Tokyo_JP_TOK_Adam_Levine_02}
		safecreate \{nodename = Z_Tokyo_JP_TOK_band_name}
		safecreate \{nodename = Z_Tokyo_JP_TOK_band_logo_01}
	endif
endscript

script VenueFastIntro_FX_Paris 
	DestroyParticlesByGroupID \{groupID = zoneparticles
		ifEmpty = 0}
	CallScriptOnNode \{prefix = Z_paris_GFX_FX_PyroLight
		callback_Script = Z_paris_PyroLights_Disable
		params = {
		}}
	if NOT ($current_song_qpak = JustaGirl)
		safekill \{nodename = Z_Paris_G_RM_NoDoubt_sign}
	endif
endscript

script VenueFastIntro_FX_AwardShow 
	DestroyParticlesByGroupID \{groupID = zoneparticles
		ifEmpty = 0}
	CallScriptOnNode \{prefix = Z_AwardShow_GFX_FX_PyroLight
		callback_Script = Z_AwardShow_PyroLights_Disable
		params = {
		}}
	safekill \{nodename = Z_AwardShow_g_Panel_Back_Glo_BlackO_NoDoubt}
	safekill \{nodename = Z_AwardShow_g_Panel_Back_Glo_Expo_NoDoubt}
	safekill \{nodename = Z_AwardShow_g_Panel_Back_Glo_BlackO}
	safekill \{nodename = Z_AwardShow_g_Panel_Back_Glo_Expo}
	begin
	LightShow_WaitForNextEvent \{events = [
			snapshotchange
		]}
	LightShow_GetParams
	Venue_Awardshow_MoodSignChange ioo_mood = <mood>
	repeat
endscript

script VenueFastIntro_FX_gorge 
	DestroyParticlesByGroupID \{groupID = zoneparticles
		ifEmpty = 0}
	wait \{1
		frame}
	CallScriptOnNode \{prefix = Z_Gorge_GFX_FX_PyroLight
		callback_Script = Z_Gorge_PyroLights_Disable
		params = {
		}}
	safekill \{nodename = Z_Gorge_JS_Stage_Wall_Taylor}
	safekill \{nodename = Z_Gorge_GFX_FX_taylorSmoke_01}
	safekill \{nodename = Z_Gorge_GFX_FX_taylorSmoke_02}
	safekill \{nodename = Z_Gorge_GFX_PH_TS_Godray}
	safekill \{nodename = Z_Gorge_GFX_FX_taylorstreaks_01}
	safekill \{nodename = Z_Gorge_GFX_FX_taylorsparks_01}
	safekill \{nodename = Z_Gorge_GFX_FX_SunFlare_02}
	safecreate \{nodename = Z_Gorge_JS_Stage_Taylor}
	safecreate \{nodename = Z_Gorge_JS_Stage_Neon_Taylor}
	safecreate \{nodename = Z_Gorge_JS_Stage_Neon_Base_Taylor}
endscript

script VenueFastIntro_FX_Space 
	CallScriptOnNode \{prefix = Z_space_GFX_FX_PyroLight
		callback_Script = Z_space_PyroLights_Disable
		params = {
		}}
	Z_Space_CreateSatelites
	killspawnedscript \{id = SpaceIntroFX}
	Z_Space_restartintro
endscript

script Venue_Awardshow_MoodSignChange 
	GetBandInfo \{1
		name}
	if (<ioo_mood> = exposition)
		if (($current_band = Band_NoDoubt_DontSpeak) && ($current_song_qpak = DontSpeak))
			safecreate \{nodename = Z_AwardShow_g_Panel_Back_Glo_Expo_NoDoubt}
			safekill \{nodename = Z_AwardShow_g_Panel_Back_Glo_BlackO_NoDoubt}
		else
			safecreate \{nodename = Z_AwardShow_g_Panel_Back_Glo_Expo}
			safekill \{nodename = Z_AwardShow_g_Panel_Back_Glo_BlackO}
		endif
	elseif (<ioo_mood> = blackout)
		if (($current_band = Band_NoDoubt_DontSpeak) && ($current_song_qpak = DontSpeak))
			safecreate \{nodename = Z_AwardShow_g_Panel_Back_Glo_BlackO_NoDoubt}
			safekill \{nodename = Z_AwardShow_g_Panel_Back_Glo_Expo_NoDoubt}
		else
			safecreate \{nodename = Z_AwardShow_g_Panel_Back_Glo_BlackO}
			safekill \{nodename = Z_AwardShow_g_Panel_Back_Glo_Expo}
		endif
	else
		safekill \{nodename = Z_AwardShow_g_Panel_Back_Glo_BlackO_NoDoubt}
		safekill \{nodename = Z_AwardShow_g_Panel_Back_Glo_Expo_NoDoubt}
		safekill \{nodename = Z_AwardShow_g_Panel_Back_Glo_BlackO}
		safekill \{nodename = Z_AwardShow_g_Panel_Back_Glo_Expo}
	endif
endscript

script SongWon_FX 
	GetPakManCurrent \{map = zones}
	switch <pak>
	endswitch
endscript

script CelebIntro_FX 
	GetPakManCurrent \{map = zones}
	switch <pak>
	endswitch
endscript

script TurnOffCelebIntroSpotlight 
	LightShow_EnableSpotlights \{enabled = false
		spots = [
			Vocalist
		]}
endscript
