
script venueintro_fx 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_awardshow
		spawnscriptlater \{0x20c0203a
			id = venuepyrofxkill}
		case z_cabo
		spawnscriptlater \{0x5857cba6
			id = venuepyrofxkill}
		case z_centralpark
		spawnscriptlater \{0x140e6738
			id = venuepyrofxkill}
		case z_easterisland
		spawnscriptlater \{0x4925ab31
			id = venuepyrofxkill}
		case z_gorge
		spawnscriptlater \{0xc3953c4a
			id = venuepyrofxkill}
		case 0x53d2aff0
		spawnscriptlater \{0xbf02c0a1
			id = venuepyrofxkill}
		case z_montreux
		spawnscriptlater \{0xc34b37cb
			id = venuepyrofxkill}
		case z_paris
		spawnscriptlater \{0x9bdd9834
			id = venuepyrofxkill}
		case z_tokyo
		spawnscriptlater \{0xc3b69f26
			id = venuepyrofxkill}
	endswitch
endscript

script 0x20c0203a 
	safekill \{nodename = 0xb6b820d4}
	safekill \{nodename = 0xc4ef0728}
	wait \{1.7
		seconds}
	lightshow_setparams \{mood = intro}
	lightshow_settime \{time = 0.2}
	i = 0
	begin
	i = (<i> + 1)
	if (<i> < 10)
		formattext checksumname = name 'Intro_0%d' d = <i>
	else
		formattext checksumname = name 'Intro_%d' d = <i>
	endif
	lightshow_playsnapshot name = <name> usesnapshotpositions = true save = true
	wait \{0.3
		seconds}
	repeat 16
	wait \{0.2
		seconds}
	spawnscriptlater \{0x7ba8adde
		id = venuepyrofxkill}
	0x7313ab1d
endscript

script 0x5857cba6 
	lightshow_setparams \{mood = intro}
	lightshow_settime \{time = 1}
	lightshow_playsnapshot \{name = intro01
		usesnapshotpositions = true
		save = true}
	wait \{1
		second}
	lightshow_playsnapshot \{name = intro02
		usesnapshotpositions = true
		save = true}
	wait \{1
		second}
	lightshow_playsnapshot \{name = intro03
		usesnapshotpositions = true
		save = true}
	wait \{1
		second}
	lightshow_settime \{time = 0.2}
	i = 4
	begin
	i = (<i> + 1)
	if (<i> < 10)
		formattext checksumname = name 'Intro0%d' d = <i>
	else
		formattext checksumname = name 'Intro%d' d = <i>
	endif
	lightshow_playsnapshot name = <name> usesnapshotpositions = true save = true
	wait \{0.45000002
		seconds}
	repeat 7
	spawnscriptlater \{0x6662ce12
		id = venuepyrofxkill}
endscript

script 0x140e6738 
	wait \{3
		seconds}
	lightshow_setparams \{mood = intro}
	lightshow_settime \{time = 0.8}
	lightshow_playsnapshot \{name = intro_01
		usesnapshotpositions = true
		save = true}
	wait \{0.8
		seconds}
	lightshow_playsnapshot \{name = intro_02
		usesnapshotpositions = true
		save = true}
	wait \{0.8
		seconds}
	lightshow_playsnapshot \{name = intro_03
		usesnapshotpositions = true
		save = true}
	wait \{0.8
		seconds}
	lightshow_playsnapshot \{name = 0x67061c58
		usesnapshotpositions = true
		save = true}
	wait \{1.5
		seconds}
	lightshow_settime \{time = 0.5}
	lightshow_playsnapshot \{name = 0x10012cce
		usesnapshotpositions = true
		save = true}
	wait \{0.2
		seconds}
	spawnscript \{0x2045a679
		id = venuepyrofxkill}
endscript

script 0x4925ab31 
	lightshow_setparams \{mood = intro}
	lightshow_settime \{time = 0.1}
	lightshow_playsnapshot \{name = intro01
		usesnapshotpositions = true
		save = true}
	wait \{3.5
		seconds}
	lightshow_settime \{time = 3}
	lightshow_playsnapshot \{name = intro02
		usesnapshotpositions = true
		save = true}
	wait \{3.5
		seconds}
	spawnscriptlater \{0x07113ab4
		id = venuepyrofxkill}
endscript

script 0xc3953c4a 
	printf \{qs(0xbdbab3d6)}
	0xef44e7d2
	wait \{6
		seconds}
	lightshow_setparams \{mood = intro}
	lightshow_settime \{time = 0.2}
	lightshow_playsnapshot \{name = intro01
		usesnapshotpositions = true
		save = true}
	wait \{0.7
		seconds}
	lightshow_playsnapshot \{name = intro02
		usesnapshotpositions = true
		save = true}
	wait \{0.7
		seconds}
	spawnscriptlater \{0xec955051
		id = venuepyrofxkill}
endscript

script 0xbf02c0a1 
	wait \{4
		seconds}
	lightshow_setparams \{mood = intro}
	lightshow_playsnapshot \{name = intro_01
		usesnapshotpositions = true
		save = true}
	wait \{0.5
		seconds}
	lightshow_settime \{time = 0.5}
	lightshow_playsnapshot \{name = intro_02
		usesnapshotpositions = true
		save = true}
	wait \{0.5
		seconds}
	lightshow_settime \{time = 0.5}
	lightshow_playsnapshot \{name = intro_03
		usesnapshotpositions = true
		save = true}
	wait \{0.5
		seconds}
	lightshow_settime \{time = 0.5}
	lightshow_playsnapshot \{name = 0x67061c58
		usesnapshotpositions = true
		save = true}
	wait \{0.5
		seconds}
	lightshow_settime \{time = 0.5}
	lightshow_playsnapshot \{name = 0x10012cce
		usesnapshotpositions = true
		save = true}
	wait \{0.5
		second}
	spawnscript \{0xb6540b2a
		id = venuepyrofxkill}
endscript

script 0xc34b37cb 
	lightshow_setparams \{mood = band_lobby}
	lightshow_playsnapshot \{name = band_lobby
		usesnapshotpositions = true
		save = true}
	wait \{2
		seconds}
	lightshow_setparams \{mood = intro}
	lightshow_playsnapshot \{name = intro01
		usesnapshotpositions = true
		save = true}
	wait \{1
		seconds}
	lightshow_settime \{time = 1}
	lightshow_playsnapshot \{name = intro02
		usesnapshotpositions = true
		save = true}
	wait \{1
		seconds}
	lightshow_settime \{time = 1}
	lightshow_playsnapshot \{name = intro03
		usesnapshotpositions = true
		save = true}
	wait \{0.4
		seconds}
	lightshow_settime \{time = 0.2}
	lightshow_playsnapshot \{name = intro04
		usesnapshotpositions = true
		save = true}
	wait \{0.22
		seconds}
	lightshow_settime \{time = 0.1}
	lightshow_playsnapshot \{name = intro03
		usesnapshotpositions = true
		save = true}
	wait \{0.22
		seconds}
	lightshow_settime \{time = 0.1}
	lightshow_playsnapshot \{name = intro04
		usesnapshotpositions = true
		save = true}
	wait \{0.22
		seconds}
	lightshow_settime \{time = 0.1}
	lightshow_playsnapshot \{name = intro03
		usesnapshotpositions = true
		save = true}
	wait \{0.22
		seconds}
	lightshow_settime \{time = 0.1}
	lightshow_playsnapshot \{name = intro04
		usesnapshotpositions = true
		save = true}
	wait \{0.22
		seconds}
	lightshow_settime \{time = 0.1}
	lightshow_playsnapshot \{name = intro03
		usesnapshotpositions = true
		save = true}
	wait \{0.22
		seconds}
	lightshow_settime \{time = 0.1}
	lightshow_playsnapshot \{name = intro04
		usesnapshotpositions = true
		save = true}
	wait \{0.2
		second}
	spawnscript \{0xc099d264
		id = venuepyrofxkill}
endscript

script 0x9bdd9834 
	0xb70c43ac
	wait \{6
		seconds}
	lightshow_setparams \{mood = intro}
	lightshow_settime \{time = 0.1}
	i = 0
	begin
	i = (<i> + 1)
	formattext checksumname = name 'Intro_0%d' d = <i>
	lightshow_playsnapshot name = <name> usesnapshotpositions = true save = true
	wait \{0.5
		seconds}
	repeat 5
	spawnscript \{0x113f9114
		id = venuepyrofxkill}
endscript

script 0xc3b69f26 
	printf \{qs(0xb52a4a61)}
	0xef6744be
	wait \{2
		seconds}
	lightshow_setparams \{mood = intro}
	lightshow_settime \{time = 1.0}
	lightshow_playsnapshot \{name = intro01
		usesnapshotpositions = true
		save = true}
	wait \{1
		second}
	lightshow_playsnapshot \{name = intro02
		usesnapshotpositions = true
		save = true}
	wait \{1
		second}
	lightshow_playsnapshot \{name = intro03
		usesnapshotpositions = true
		save = true}
	wait \{1
		second}
	lightshow_playsnapshot \{name = intro04
		usesnapshotpositions = true
		save = true}
	wait \{2
		seconds}
	lightshow_settime \{time = 0.1}
	lightshow_playsnapshot \{name = 0xb921833c
		usesnapshotpositions = true
		save = true}
	wait \{0.3
		second}
	lightshow_playsnapshot \{name = 0x2745169f
		usesnapshotpositions = true
		save = true}
	wait \{0.3
		second}
	lightshow_playsnapshot \{name = 0x50422609
		usesnapshotpositions = true
		save = true}
	wait \{0.3
		second}
	lightshow_playsnapshot \{name = 0xc94b77b3
		usesnapshotpositions = true
		save = true}
	spawnscriptlater \{0x68cabcca
		id = venuepyrofxkill}
endscript

script turnoffnodeflags 
	changenodeflag \{ls_mood_flare
		0}
	changenodeflag \{ls_mood_climax
		0}
	changenodeflag \{ls_mood_exposition
		0}
	changenodeflag \{ls_mood_falling
		0}
	changenodeflag \{ls_mood_prelude
		0}
	changenodeflag \{ls_mood_rising
		0}
	changenodeflag \{ls_mood_starpower
		0}
	changenodeflag \{ls_mood_resolution
		0}
	changenodeflag \{ls_mood_pyro
		0}
	changenodeflag \{ls_mood_blackout
		0}
	changenodeflag \{ls_mood_intro
		0}
	changenodeflag \{ls_mood_silhouette
		0}
	changenodeflag \{ls_mood_tension
		0}
	changenodeflag \{ls_mood_wash
		0}
	changenodeflag \{ls_mood_strobe
		0}
	changenodeflag \{ls_mood_menu
		0}
endscript

script turnoffencoregodray 
	if screenfx_fxinstanceexists \{viewport = bg_viewport
			name = godray}
		screenfx_updatefxinstanceparams \{viewport = bg_viewport
			name = godray
			scefname = godray
			type = godray
			on = 0
			lightsource = object}
	endif
endscript

script venuefastintro_fx 
	getpakmancurrent \{map = zones}
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
	killspawnedscript \{id = venuepyrofxkill}
	destroyparticlesbygroupid \{groupid = zoneparticles
		ifempty = 0}
	callscriptonnode \{prefix = 0xfdb32528
		callback_script = 0xdd513258
		params = {
		}}
endscript

script 0xb4a1dc26 
	killspawnedscript \{id = venuepyrofxkill}
	destroyparticlesbygroupid \{groupid = zoneparticles
		ifempty = 0}
	callscriptonnode \{prefix = 0x122a9972
		callback_script = 0x5fd297b8
		params = {
		}}
endscript

script 0xb38a39e9 
	killspawnedscript \{id = venuepyrofxkill}
	destroyparticlesbygroupid \{groupid = zoneparticles
		ifempty = 0}
	callscriptonnode \{prefix = 0x19d9c306
		callback_script = 0x9f3f9853
		params = {
		}}
endscript

script 0xb747d31f 
	killspawnedscript \{id = venuepyrofxkill}
	destroyparticlesbygroupid \{groupid = zoneparticles
		ifempty = 0}
	callscriptonnode \{prefix = 0x5087e26c
		callback_script = 0x4c44427e
		params = {
		}}
endscript

script 0xa3532039 
	killspawnedscript \{id = venuepyrofxkill}
	destroyparticlesbygroupid \{groupid = zoneparticles
		ifempty = 0}
	callscriptonnode \{prefix = 0x6e26bed7
		callback_script = 0x29a81673
		params = {
		}}
endscript

script 0xef6744be 
	destroyparticlesbygroupid \{groupid = zoneparticles
		ifempty = 0}
	callscriptonnode \{prefix = 0xc8401386
		callback_script = 0x226f0355
		params = {
		}}
	if NOT ($current_song_qpak = shewillbeloved)
		safekill \{nodename = 0x4ad46c23}
		safekill \{nodename = 0xd3dd3d99}
		safecreate \{nodename = 0x7efcb08d}
		safecreate \{nodename = 0xd8c34ffa}
	endif
endscript

script 0xb70c43ac 
	destroyparticlesbygroupid \{groupid = zoneparticles
		ifempty = 0}
	callscriptonnode \{prefix = 0x7e4cd4ff
		callback_script = 0xd99220f5
		params = {
		}}
	if NOT ($current_song_qpak = justagirl)
		safekill \{nodename = 0x293ee9fe}
	endif
endscript

script 0x7313ab1d 
	destroyparticlesbygroupid \{groupid = zoneparticles
		ifempty = 0}
	callscriptonnode \{prefix = 0xd9aa52f2
		callback_script = 0x68e7df4b
		params = {
		}}
	safekill \{nodename = 0xb6b820d4}
	safekill \{nodename = 0xc4ef0728}
	safekill \{nodename = 0x31a2b9c2}
	safekill \{nodename = 0xe7cd08f1}
	begin
	lightshow_waitfornextevent \{events = [
			snapshotchange
		]}
	lightshow_getparams
	0xf26908c1 0x491b3375 = <mood>
	repeat
endscript

script 0xef44e7d2 
	destroyparticlesbygroupid \{groupid = zoneparticles
		ifempty = 0}
	wait \{1
		frame}
	callscriptonnode \{prefix = 0xd50f5a45
		callback_script = 0xcdb863a3
		params = {
		}}
	safekill \{nodename = 0xdec4da09}
	safekill \{nodename = 0xd170ed93}
	safekill \{nodename = 0x4879bc29}
	safekill \{nodename = 0x169d4505}
	safekill \{nodename = 0xb9754681}
	safekill \{nodename = 0xa415ad66}
	safekill \{nodename = 0x45657654}
	safecreate \{nodename = 0xbf1297cc}
	safecreate \{nodename = 0x793cbb85}
	safecreate \{nodename = 0x7d271597}
endscript

script 0x08524974 
	callscriptonnode \{prefix = 0x81aff5cb
		callback_script = 0x2ed13cbf
		params = {
		}}
	0xb97b8616
	killspawnedscript \{id = 0x255ab4a1}
	0xa27dfcd3
endscript

script 0xf26908c1 
	getbandinfo \{1
		name}
	if (<0x491b3375> = exposition)
		if (($current_band = band_nodoubt_dontspeak) && ($current_song_qpak = dontspeak))
			safecreate \{nodename = 0xc4ef0728}
			safekill \{nodename = 0xb6b820d4}
		else
			safecreate \{nodename = 0xe7cd08f1}
			safekill \{nodename = 0x31a2b9c2}
		endif
	elseif (<0x491b3375> = blackout)
		if (($current_band = band_nodoubt_dontspeak) && ($current_song_qpak = dontspeak))
			safecreate \{nodename = 0xb6b820d4}
			safekill \{nodename = 0xc4ef0728}
		else
			safecreate \{nodename = 0x31a2b9c2}
			safekill \{nodename = 0xe7cd08f1}
		endif
	else
		safekill \{nodename = 0xb6b820d4}
		safekill \{nodename = 0xc4ef0728}
		safekill \{nodename = 0x31a2b9c2}
		safekill \{nodename = 0xe7cd08f1}
	endif
endscript

script songwon_fx 
	getpakmancurrent \{map = zones}
	switch <pak>
	endswitch
endscript

script celebintro_fx 
	getpakmancurrent \{map = zones}
	switch <pak>
	endswitch
endscript

script turnoffcelebintrospotlight 
	lightshow_enablespotlights \{enabled = false
		spots = [
			vocalist
		]}
endscript
