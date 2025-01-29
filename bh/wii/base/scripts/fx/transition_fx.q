
script venueintro_fx 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_awardshow
		SpawnScriptLater \{0x20c0203a
			id = venuepyrofxkill}
		case z_cabo
		SpawnScriptLater \{0x5857cba6
			id = venuepyrofxkill}
		case z_centralpark
		SpawnScriptLater \{0x140e6738
			id = venuepyrofxkill}
		case z_easterisland
		SpawnScriptLater \{0x4925ab31
			id = venuepyrofxkill}
		case z_gorge
		SpawnScriptLater \{0xc3953c4a
			id = venuepyrofxkill}
		case 0x53d2aff0
		SpawnScriptLater \{0xbf02c0a1
			id = venuepyrofxkill}
		case z_montreux
		SpawnScriptLater \{0xc34b37cb
			id = venuepyrofxkill}
		case z_paris
		SpawnScriptLater \{0x9bdd9834
			id = venuepyrofxkill}
		case z_tokyo
		SpawnScriptLater \{0xc3b69f26
			id = venuepyrofxkill}
	endswitch
endscript

script 0x20c0203a 
	SafeKill \{nodeName = 0xb6b820d4}
	SafeKill \{nodeName = 0xc4ef0728}
	Wait \{1.7
		Seconds}
	LightShow_SetParams \{mood = Intro}
	LightShow_SetTime \{time = 0.2}
	i = 0
	begin
	i = (<i> + 1)
	if (<i> < 10)
		formatText checksumName = Name 'Intro_0%d' d = <i>
	else
		formatText checksumName = Name 'Intro_%d' d = <i>
	endif
	LightShow_PlaySnapshot Name = <Name> UseSnapshotPositions = true save = true
	Wait \{0.3
		Seconds}
	repeat 16
	Wait \{0.2
		Seconds}
	SpawnScriptLater \{0x7ba8adde
		id = venuepyrofxkill}
	0x7313ab1d
endscript

script 0x5857cba6 
	LightShow_SetParams \{mood = Intro}
	LightShow_SetTime \{time = 1}
	LightShow_PlaySnapshot \{Name = Intro01
		UseSnapshotPositions = true
		save = true}
	Wait \{1
		Second}
	LightShow_PlaySnapshot \{Name = intro02
		UseSnapshotPositions = true
		save = true}
	Wait \{1
		Second}
	LightShow_PlaySnapshot \{Name = intro03
		UseSnapshotPositions = true
		save = true}
	Wait \{1
		Second}
	LightShow_SetTime \{time = 0.2}
	i = 4
	begin
	i = (<i> + 1)
	if (<i> < 10)
		formatText checksumName = Name 'Intro0%d' d = <i>
	else
		formatText checksumName = Name 'Intro%d' d = <i>
	endif
	LightShow_PlaySnapshot Name = <Name> UseSnapshotPositions = true save = true
	Wait \{0.45000002
		Seconds}
	repeat 7
	SpawnScriptLater \{0x6662ce12
		id = venuepyrofxkill}
endscript

script 0x140e6738 
	Wait \{3
		Seconds}
	LightShow_SetParams \{mood = Intro}
	LightShow_SetTime \{time = 0.8}
	LightShow_PlaySnapshot \{Name = intro_01
		UseSnapshotPositions = true
		save = true}
	Wait \{0.8
		Seconds}
	LightShow_PlaySnapshot \{Name = intro_02
		UseSnapshotPositions = true
		save = true}
	Wait \{0.8
		Seconds}
	LightShow_PlaySnapshot \{Name = intro_03
		UseSnapshotPositions = true
		save = true}
	Wait \{0.8
		Seconds}
	LightShow_PlaySnapshot \{Name = 0x67061c58
		UseSnapshotPositions = true
		save = true}
	Wait \{1.5
		Seconds}
	LightShow_SetTime \{time = 0.5}
	LightShow_PlaySnapshot \{Name = 0x10012cce
		UseSnapshotPositions = true
		save = true}
	Wait \{0.2
		Seconds}
	spawnscript \{0x2045a679
		id = venuepyrofxkill}
endscript

script 0x4925ab31 
	LightShow_SetParams \{mood = Intro}
	LightShow_SetTime \{time = 0.1}
	LightShow_PlaySnapshot \{Name = Intro01
		UseSnapshotPositions = true
		save = true}
	Wait \{3.5
		Seconds}
	LightShow_SetTime \{time = 3}
	LightShow_PlaySnapshot \{Name = intro02
		UseSnapshotPositions = true
		save = true}
	Wait \{3.5
		Seconds}
	SpawnScriptLater \{0x07113ab4
		id = venuepyrofxkill}
endscript

script 0xc3953c4a 
	printf \{qs(0xbdbab3d6)}
	0xef44e7d2
	Wait \{6
		Seconds}
	LightShow_SetParams \{mood = Intro}
	LightShow_SetTime \{time = 0.2}
	LightShow_PlaySnapshot \{Name = Intro01
		UseSnapshotPositions = true
		save = true}
	Wait \{0.7
		Seconds}
	LightShow_PlaySnapshot \{Name = intro02
		UseSnapshotPositions = true
		save = true}
	Wait \{0.7
		Seconds}
	SpawnScriptLater \{0xec955051
		id = venuepyrofxkill}
endscript

script 0xbf02c0a1 
	Wait \{4
		Seconds}
	LightShow_SetParams \{mood = Intro}
	LightShow_PlaySnapshot \{Name = intro_01
		UseSnapshotPositions = true
		save = true}
	Wait \{0.5
		Seconds}
	LightShow_SetTime \{time = 0.5}
	LightShow_PlaySnapshot \{Name = intro_02
		UseSnapshotPositions = true
		save = true}
	Wait \{0.5
		Seconds}
	LightShow_SetTime \{time = 0.5}
	LightShow_PlaySnapshot \{Name = intro_03
		UseSnapshotPositions = true
		save = true}
	Wait \{0.5
		Seconds}
	LightShow_SetTime \{time = 0.5}
	LightShow_PlaySnapshot \{Name = 0x67061c58
		UseSnapshotPositions = true
		save = true}
	Wait \{0.5
		Seconds}
	LightShow_SetTime \{time = 0.5}
	LightShow_PlaySnapshot \{Name = 0x10012cce
		UseSnapshotPositions = true
		save = true}
	Wait \{0.5
		Second}
	spawnscript \{0xb6540b2a
		id = venuepyrofxkill}
endscript

script 0xc34b37cb 
	LightShow_SetParams \{mood = band_lobby}
	LightShow_PlaySnapshot \{Name = band_lobby
		UseSnapshotPositions = true
		save = true}
	Wait \{2
		Seconds}
	LightShow_SetParams \{mood = Intro}
	LightShow_PlaySnapshot \{Name = Intro01
		UseSnapshotPositions = true
		save = true}
	Wait \{1
		Seconds}
	LightShow_SetTime \{time = 1}
	LightShow_PlaySnapshot \{Name = intro02
		UseSnapshotPositions = true
		save = true}
	Wait \{1
		Seconds}
	LightShow_SetTime \{time = 1}
	LightShow_PlaySnapshot \{Name = intro03
		UseSnapshotPositions = true
		save = true}
	Wait \{0.4
		Seconds}
	LightShow_SetTime \{time = 0.2}
	LightShow_PlaySnapshot \{Name = intro04
		UseSnapshotPositions = true
		save = true}
	Wait \{0.22
		Seconds}
	LightShow_SetTime \{time = 0.1}
	LightShow_PlaySnapshot \{Name = intro03
		UseSnapshotPositions = true
		save = true}
	Wait \{0.22
		Seconds}
	LightShow_SetTime \{time = 0.1}
	LightShow_PlaySnapshot \{Name = intro04
		UseSnapshotPositions = true
		save = true}
	Wait \{0.22
		Seconds}
	LightShow_SetTime \{time = 0.1}
	LightShow_PlaySnapshot \{Name = intro03
		UseSnapshotPositions = true
		save = true}
	Wait \{0.22
		Seconds}
	LightShow_SetTime \{time = 0.1}
	LightShow_PlaySnapshot \{Name = intro04
		UseSnapshotPositions = true
		save = true}
	Wait \{0.22
		Seconds}
	LightShow_SetTime \{time = 0.1}
	LightShow_PlaySnapshot \{Name = intro03
		UseSnapshotPositions = true
		save = true}
	Wait \{0.22
		Seconds}
	LightShow_SetTime \{time = 0.1}
	LightShow_PlaySnapshot \{Name = intro04
		UseSnapshotPositions = true
		save = true}
	Wait \{0.2
		Second}
	spawnscript \{0xc099d264
		id = venuepyrofxkill}
endscript

script 0x9bdd9834 
	0xb70c43ac
	Wait \{6
		Seconds}
	LightShow_SetParams \{mood = Intro}
	LightShow_SetTime \{time = 0.1}
	i = 0
	begin
	i = (<i> + 1)
	formatText checksumName = Name 'Intro_0%d' d = <i>
	LightShow_PlaySnapshot Name = <Name> UseSnapshotPositions = true save = true
	Wait \{0.5
		Seconds}
	repeat 5
	spawnscript \{0x113f9114
		id = venuepyrofxkill}
endscript

script 0xc3b69f26 
	printf \{qs(0xb52a4a61)}
	0xef6744be
	Wait \{2
		Seconds}
	LightShow_SetParams \{mood = Intro}
	LightShow_SetTime \{time = 1.0}
	LightShow_PlaySnapshot \{Name = Intro01
		UseSnapshotPositions = true
		save = true}
	Wait \{1
		Second}
	LightShow_PlaySnapshot \{Name = intro02
		UseSnapshotPositions = true
		save = true}
	Wait \{1
		Second}
	LightShow_PlaySnapshot \{Name = intro03
		UseSnapshotPositions = true
		save = true}
	Wait \{1
		Second}
	LightShow_PlaySnapshot \{Name = intro04
		UseSnapshotPositions = true
		save = true}
	Wait \{2
		Seconds}
	LightShow_SetTime \{time = 0.1}
	LightShow_PlaySnapshot \{Name = 0xb921833c
		UseSnapshotPositions = true
		save = true}
	Wait \{0.3
		Second}
	LightShow_PlaySnapshot \{Name = 0x2745169f
		UseSnapshotPositions = true
		save = true}
	Wait \{0.3
		Second}
	LightShow_PlaySnapshot \{Name = 0x50422609
		UseSnapshotPositions = true
		save = true}
	Wait \{0.3
		Second}
	LightShow_PlaySnapshot \{Name = 0xc94b77b3
		UseSnapshotPositions = true
		save = true}
	SpawnScriptLater \{0x68cabcca
		id = venuepyrofxkill}
endscript

script turnoffnodeflags 
	ChangeNodeFlag \{LS_MOOD_FLARE
		0}
	ChangeNodeFlag \{ls_mood_climax
		0}
	ChangeNodeFlag \{ls_mood_exposition
		0}
	ChangeNodeFlag \{ls_mood_falling
		0}
	ChangeNodeFlag \{ls_mood_prelude
		0}
	ChangeNodeFlag \{ls_mood_rising
		0}
	ChangeNodeFlag \{ls_mood_starpower
		0}
	ChangeNodeFlag \{ls_mood_resolution
		0}
	ChangeNodeFlag \{ls_mood_pyro
		0}
	ChangeNodeFlag \{LS_MOOD_BLACKOUT
		0}
	ChangeNodeFlag \{ls_mood_intro
		0}
	ChangeNodeFlag \{ls_mood_silhouette
		0}
	ChangeNodeFlag \{ls_mood_tension
		0}
	ChangeNodeFlag \{ls_mood_wash
		0}
	ChangeNodeFlag \{LS_MOOD_STROBE
		0}
	ChangeNodeFlag \{ls_mood_menu
		0}
endscript

script turnoffencoregodray 
endscript

script venuefastintro_fx 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_tokyo
		0xef6744be
		case z_paris
		0xb70c43ac
		case z_awardshow
		0x7313ab1d
		case z_gorge
		0xef44e7d2
		case z_space
		0x08524974
		case z_cabo
		0x5012d818
		case z_centralpark
		0xb4a1dc26
		case z_easterisland
		0xb38a39e9
		case 0x53d2aff0
		0xb747d31f
		case z_montreux
		0xa3532039
	endswitch
endscript

script 0x5012d818 
	KillSpawnedScript \{id = venuepyrofxkill}
	DestroyParticlesByGroupID \{groupID = zoneparticles
		ifEmpty = 0}
endscript

script 0xb4a1dc26 
	KillSpawnedScript \{id = venuepyrofxkill}
	DestroyParticlesByGroupID \{groupID = zoneparticles
		ifEmpty = 0}
endscript

script 0xb38a39e9 
	KillSpawnedScript \{id = venuepyrofxkill}
	DestroyParticlesByGroupID \{groupID = zoneparticles
		ifEmpty = 0}
endscript

script 0xb747d31f 
	KillSpawnedScript \{id = venuepyrofxkill}
	DestroyParticlesByGroupID \{groupID = zoneparticles
		ifEmpty = 0}
endscript

script 0xa3532039 
	KillSpawnedScript \{id = venuepyrofxkill}
	DestroyParticlesByGroupID \{groupID = zoneparticles
		ifEmpty = 0}
endscript

script 0xef6744be 
	DestroyParticlesByGroupID \{groupID = zoneparticles
		ifEmpty = 0}
	if NOT ($current_song_qpak = shewillbeloved)
		SafeKill \{nodeName = 0x4ad46c23}
		SafeKill \{nodeName = 0xd3dd3d99}
		SafeCreate \{nodeName = 0x7efcb08d}
		SafeCreate \{nodeName = 0xd8c34ffa}
	endif
endscript

script 0xb70c43ac 
	DestroyParticlesByGroupID \{groupID = zoneparticles
		ifEmpty = 0}
	if NOT ($current_song_qpak = justagirl)
		SafeKill \{nodeName = 0x293ee9fe}
	endif
endscript

script 0x7313ab1d 
	DestroyParticlesByGroupID \{groupID = zoneparticles
		ifEmpty = 0}
	SafeKill \{nodeName = 0xb6b820d4}
	SafeKill \{nodeName = 0xc4ef0728}
	SafeKill \{nodeName = 0x31a2b9c2}
	SafeKill \{nodeName = 0xe7cd08f1}
	begin
	LightShow_WaitForNextEvent \{events = [
			snapshotchange
		]}
	LightShow_GetParams
	0xf26908c1 0x491b3375 = <mood>
	repeat
endscript

script 0xef44e7d2 
	DestroyParticlesByGroupID \{groupID = zoneparticles
		ifEmpty = 0}
	Wait \{1
		Frame}
	SafeKill \{nodeName = 0xdec4da09}
	SafeKill \{nodeName = 0xd170ed93}
	SafeKill \{nodeName = 0x4879bc29}
	SafeKill \{nodeName = 0x169d4505}
	SafeKill \{nodeName = 0xb9754681}
	SafeKill \{nodeName = 0xa415ad66}
	SafeKill \{nodeName = 0x45657654}
	SafeCreate \{nodeName = 0xbf1297cc}
	SafeCreate \{nodeName = 0x793cbb85}
	SafeCreate \{nodeName = 0x7d271597}
endscript

script 0x08524974 
	0xb97b8616
	KillSpawnedScript \{id = 0x255ab4a1}
	0xa27dfcd3
endscript

script 0xf26908c1 
	getbandinfo \{1
		Name}
	if (<0x491b3375> = exposition)
		if (($current_band = band_nodoubt_dontspeak) && ($current_song_qpak = dontspeak))
			SafeCreate \{nodeName = 0xc4ef0728}
			SafeKill \{nodeName = 0xb6b820d4}
		else
			SafeCreate \{nodeName = 0xe7cd08f1}
			SafeKill \{nodeName = 0x31a2b9c2}
		endif
	elseif (<0x491b3375> = blackout)
		if (($current_band = band_nodoubt_dontspeak) && ($current_song_qpak = dontspeak))
			SafeCreate \{nodeName = 0xb6b820d4}
			SafeKill \{nodeName = 0xc4ef0728}
		else
			SafeCreate \{nodeName = 0x31a2b9c2}
			SafeKill \{nodeName = 0xe7cd08f1}
		endif
	else
		SafeKill \{nodeName = 0xb6b820d4}
		SafeKill \{nodeName = 0xc4ef0728}
		SafeKill \{nodeName = 0x31a2b9c2}
		SafeKill \{nodeName = 0xe7cd08f1}
	endif
endscript

script songwon_fx 
	GetPakManCurrent \{map = zones}
	switch <pak>
	endswitch
endscript

script celebintro_fx 
	GetPakManCurrent \{map = zones}
	switch <pak>
	endswitch
endscript

script turnoffcelebintrospotlight 
	LightShow_EnableSpotlights \{Enabled = FALSE
		spots = [
			vocalist
		]}
endscript
