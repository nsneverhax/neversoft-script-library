running_ped_dropoff_distance = 100

script spawnterrainsound \{action = ollie}
	if infrontend
		return
	endif
	skaterloopingsound_spawnterrainsoundnetworkbroadcast
	skaterloopingsound_spawnterrainsound
endscript

script SpawnTerrainSoundOld action = ollie
	switch <action>
		case roll
		TerrainSoundsStopAll
		obj_spawnscriptnow PlayRandomArrayLoopingSound params = {type = roll minspeed = 1 maxspeed = 20}
		case footpush
		if TerrainLogicIsLocalSkater
			if isinbail
				return
			endif
		endif
		obj_spawnscriptnow PlayfootPush params = {type = footpush minspeed = 1 maxspeed = 20}
		case ollie
		TerrainSoundsStopAll
		obj_spawnscriptnow PlayRandomArraySoundRange params = {type = ollie}
		if TerrainLogicIsLocalSkater
			obj_spawnscriptnow sk8_cas_ollie_grunts
		endif
		PlayExitSound
		PlayWheels
		TerrainLogicGetCurrentTerrainType
		if (debugterrainsfx = 1)
			if TerrainLogicIsLocalSkater
				printf "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
				printf "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!THIS TERRAIN IS %T!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" t = (($terrain_types [<terraintype>]).desc)
				printf "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
			endif
		endif
		case ollieland
		TerrainSoundsStopAll
		obj_spawnscriptnow PlayRandomArraySoundSpeedRange params = {type = ollieland minspeed = 1 maxspeed = 20}
		getskaterid
		<skaterid> = <objid>
		if NOT <skaterid> :isinbail
			obj_spawnscriptnow PlayRandomArrayLoopingSound params = {type = roll minspeed = 1 maxspeed = 20}
		endif
		case grindon
		TerrainSoundsStopAll
		obj_spawnscriptnow PlayRandomArraySoundSpeedRange params = {type = grindon minspeed = 1 maxspeed = 20}
		obj_spawnscriptnow PlayRandomArrayLoopingSound params = {type = Grind minspeed = 1 maxspeed = 20}
		TerrainLogicGetCurrentTerrainType
		if (debugterrainsfx = 1)
			if TerrainLogicIsLocalSkater
				printf "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
				printf "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!THIS TERRAIN IS %T!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" t = (($terrain_types [<terraintype>]).desc)
				printf "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
			endif
		endif
		case grindoff
		TerrainSoundsStopAll
		obj_spawnscriptnow PlayRandomArraySoundSpeedRange params = {type = grindoff minspeed = 1 maxspeed = 20}
		obj_spawnscriptnow PlayRandomArraySoundRange params = {type = ollie}
		if TerrainLogicIsLocalSkater
			obj_spawnscriptnow sk8_cas_ollie_grunts
		endif
		PlayWheels
		case Grind
		obj_spawnscriptnow PlayRandomArrayLoopingSound params = {type = Grind minspeed = 1 maxspeed = 20}
		case slideon
		TerrainSoundsStopAll
		obj_spawnscriptnow PlayRandomArraySoundSpeedRange params = {type = slideon minspeed = 1 maxspeed = 20}
		obj_spawnscriptnow PlayRandomArrayLoopingSound params = {type = slide minspeed = 1 maxspeed = 20}
		case slideoff
		TerrainSoundsStopAll
		obj_spawnscriptnow PlayRandomArraySoundSpeedRange params = {type = slideoff minspeed = 1 maxspeed = 20}
		obj_spawnscriptnow PlayRandomArraySoundRange params = {type = ollie}
		if TerrainLogicIsLocalSkater
			obj_spawnscriptnow sk8_cas_ollie_grunts
		endif
		PlayWheels
		case nadason
		TerrainSoundsStopAll
		obj_spawnscriptnow PlayRandomArraySoundSpeedRange params = {type = slideon minspeed = 1 maxspeed = 20}
		obj_spawnscriptnow PlayRandomArrayNadasSound params = {type = slide minspeed = 1 maxspeed = 20}
		case slide
		obj_spawnscriptnow PlayRandomArrayLoopingSound params = {type = slide minspeed = 1 maxspeed = 20}
		case revert
		obj_spawnscriptnow PlayRandomArraySoundSpeedRange params = {type = revert minspeed = 1 maxspeed = 20}
		case boardbounce
		obj_spawnscriptnow PlayRandomArraySoundSpeedRange params = {type = boardbounce minspeed = 1 maxspeed = 20}
		case rollin
		obj_spawnscriptnow PlayRandomArraySoundSpeedRange params = {type = rollin minspeed = 1 maxspeed = 10}
		case pogo
		obj_spawnscriptnow PlayRandomArraySoundRange params = {type = pogo}
		case footstep
		obj_spawnscriptnow PlayRandomArraySoundFootstepSpeedRange params = {type = footstep minspeed = 1 maxspeed = 8}
		if (debugterrainsfx = 1)
			if TerrainLogicIsLocalSkater
				TerrainLogicGetCurrentTerrainType
				printf "TERRAIN NUMBER %t" t = <terraintype>
				printf "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
				printf "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!THIS TERRAIN IS %T!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" t = (($terrain_types [<terraintype>]).desc)
				printf "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
			endif
		endif
		case footstepjump
		obj_spawnscriptnow PlayRandomArraySoundSpeedRange params = {type = footstepjump minspeed = 1 maxspeed = 10}
		case footstepland
		obj_spawnscriptnow PlayRandomArraySoundSpeedRange params = {type = footstepland minspeed = 1 maxspeed = 10}
		case scuff
		obj_spawnscriptnow PlayRandomArraySoundSpeedRange params = {type = scuff minspeed = 1 maxspeed = 10}
		case handplant
		obj_spawnscriptnow PlayRandomArraySoundSpeedRange params = {type = handplant minspeed = 1 maxspeed = 10}
		case bodyfall
		obj_spawnscriptnow PlayRandomArraySoundBodyFall params = {type = bodyfall minspeed = 1 maxspeed = 70 terraintype = <terrain> proj_velocity = <proj_velocity>}
		case armfall
		obj_spawnscriptnow PlayRandomArraySoundBodyFall params = {type = armfall minspeed = 1 maxspeed = 70 terraintype = <terrain> proj_velocity = <proj_velocity>}
		case legfall
		obj_spawnscriptnow PlayRandomArraySoundBodyFall params = {type = legfall minspeed = 1 maxspeed = 70 terraintype = <terrain> proj_velocity = <proj_velocity>}
		case headfall
		obj_spawnscriptnow PlayRandomArraySoundBodyFall params = {type = headfall minspeed = 1 maxspeed = 70 terraintype = <terrain> proj_velocity = <proj_velocity>}
		case nutsfall
		obj_spawnscriptnow PlayRandomArraySoundBodyFall params = {type = nutsfall minspeed = 1 maxspeed = 70 terraintype = <terrain> proj_velocity = <proj_velocity>}
		case slidefall
		obj_spawnscriptnow PlayRandomArraySlideFallSound params = {type = slidefall minspeed = 1 maxspeed = 6 velocity = <velocity> terraintype = <terrain>}
		case bonk
		obj_spawnscriptnow PlayRandomArraySoundBonk params = {type = bonk minspeed = 1 maxspeed = 5}
		if TerrainLogicIsLocalSkater
			obj_spawnscriptnow sk8_cas_bonk_grunts
		endif
		wait 0.13 seconds
		obj_spawnscriptnow PlayRandomArraySoundSpeedRange params = {type = ollieland minspeed = 1 maxspeed = 20}
		case bonkslide
		obj_spawnscriptnow PlayRandomArrayLoopingSound params = {type = bonkslide minspeed = 1 maxspeed = 20}
		case wallride
		obj_spawnscriptnow PlayRandomArraySoundSpeedRange params = {type = wallride minspeed = 1 maxspeed = 20}
		case Wallplant
		obj_spawnscriptnow PlayRandomArraySoundBonk params = {type = bonk minspeed = 1 maxspeed = 5}
		case boneless
		obj_spawnscriptnow PlayRandomArraySoundSpeedRange params = {type = boneless minspeed = 1 maxspeed = 20}
		case boardpickup
		TerrainSoundsStopAll
		obj_spawnscriptnow PlayRandomArraySoundSpeedRange params = {type = boardpickup minspeed = 1 maxspeed = 20}
		obj_spawnscriptnow PlayExitSound
		case boardputdown
		TerrainSoundsStopAll
		obj_spawnscriptnow PlayRandomArraySoundSpeedRange params = {type = boardputdown minspeed = 1 maxspeed = 20}
		obj_spawnscriptnow PlayRandomArrayLoopingSound params = {type = roll minspeed = 1 maxspeed = 20}
		case stopsounds
		TerrainSoundsStopAll
	endswitch
endscript
GlobalPedSkaterPitchChange = 1

script TerrainSoundsStopAll 
	obj_killspawnedscript name = PlaySFXLoopingSound
	obj_killspawnedscript name = ClickKlackLooper
	obj_killspawnedscript name = PlayRandomArrayLoopingSound
	obj_killspawnedscript name = FastLoopScript
	obj_killspawnedscript name = PlayRandomArrayNadasSound
	obj_killspawnedscript name = PlaySFXNadasSound
	obj_killspawnedscript name = PlayRandomArraySlideFallSound
	obj_killspawnedscript name = PlaySFXLoopingSoundSlideFall
	skaterloopingsound_gettag terrainsound_boardpushelement
	if NOT (<terrainsound_boardpushelement> = none)
		if obj_issoundplaying <terrainsound_boardpushelement>
			obj_stopsound <terrainsound_boardpushelement>
		endif
		skaterloopingsound_settag terrainsound_boardpushelement = none
	endif
	skaterloopingsound_gettag terrainsound_wheelselement
	if NOT (<terrainsound_wheelselement> = none)
		if obj_issoundplaying <terrainsound_wheelselement>
			obj_stopsound <terrainsound_wheelselement>
		endif
		skaterloopingsound_settag terrainsound_wheelselement = none
	endif
	skaterloopingsound_gettag terrainsound_fastloopelement
	if NOT (<terrainsound_fastloopelement> = none)
		if obj_issoundplaying <terrainsound_fastloopelement>
			obj_stopsound <terrainsound_fastloopelement>
		endif
		skaterloopingsound_settag terrainsound_fastloopelement = none
	endif
	skaterloopingsound_gettag terrainsound_currentsfxterrainelement
	if NOT (<terrainsound_currentsfxterrainelement> = none)
		if obj_issoundplaying <terrainsound_currentsfxterrainelement>
			obj_stopsound <terrainsound_currentsfxterrainelement>
		endif
		skaterloopingsound_settag terrainsound_currentsfxterrainelement = none
	endif
	skaterloopingsound_settag terrainsound_manualmemoryvariable = none
	skaterloopingsound_stopallloops
endscript

script PlayWheels 
	getspeed
	if (<speed> > 19)
		if TerrainLogicIsLocalSkater
			soundevent event = wheel_spin_speed_6 buss = wheelspins
		else
			soundevent event = wheel_spin_speed_6 buss = pedwheelspins
		endif
	else
		if (<speed> > 16)
			if TerrainLogicIsLocalSkater
				soundevent event = wheel_spin_speed_5 buss = wheelspins
			else
				soundevent event = wheel_spin_speed_5 buss = pedwheelspins
			endif
		else
			if (<speed> > 13)
				if TerrainLogicIsLocalSkater
					soundevent event = wheel_spin_speed_4 buss = wheelspins
				else
					soundevent event = wheel_spin_speed_4 buss = pedwheelspins
				endif
			else
				if (<speed> > 10)
					if TerrainLogicIsLocalSkater
						soundevent event = wheel_spin_speed_3 buss = wheelspins
					else
						soundevent event = wheel_spin_speed_3 buss = pedwheelspins
					endif
				else
					if (<speed> > 5)
						if TerrainLogicIsLocalSkater
							soundevent event = wheel_spin_speed_2 buss = wheelspins
						else
							soundevent event = wheel_spin_speed_2 buss = pedwheelspins
						endif
					else
						if TerrainLogicIsLocalSkater
							soundevent event = wheel_spin_speed_1 buss = wheelspins
						else
							soundevent event = wheel_spin_speed_1 buss = pedwheelspins
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script PlayManualWheels 
	getspeed
	if (<speed> > 15)
		if TerrainLogicIsLocalSkater
			soundevent event = wheel_spin_speed_3 buss = wheelspins
		else
			soundevent event = wheel_spin_speed_3 buss = pedwheelspins
		endif
	else
		if (<speed> > 10)
			if TerrainLogicIsLocalSkater
				soundevent event = wheel_spin_speed_2 buss = wheelspins
			else
				soundevent event = wheel_spin_speed_2 buss = pedwheelspins
			endif
		else
			if TerrainLogicIsLocalSkater
				soundevent event = wheel_spin_speed_1 buss = wheelspins
			else
				soundevent event = wheel_spin_speed_1 buss = pedwheelspins
			endif
		endif
	endif
endscript

script clickklack id = clickklack clackmeters = 40 minspeed = 1 maxspeed = 40 clickminpitch = 70 clickmaxpitch = 110 clickminvol = 0 clickmaxvol = 40 clickdropoff_function = linear
	getspeed
	if (<speed> > 1)
		BoardWait = (1 / <speed>)
		if (<BoardWait> > 0.4)
			BoardWait = 0.4
		endif
		TerrainSoundCalculatePitchAndVolFast minpitch = <clickminpitch> maxpitch = <clickmaxpitch> minvol = <clickminvol> maxvol = <clickmaxvol> volumecurve = inv_exponential minspeed = <minspeed> maxspeed = <maxspeed> clickdropoff_function = <clickdropoff_function>
		if (<speed> < 3)
			vol = 0
		endif
		getrandomarrayelement <clickklackfrontsound>
		if gotparam element
			skaterloopingsound_gettag terrainsound_manualmemoryvariable
			if (<terrainsound_manualmemoryvariable> = Manual)
				if TerrainLogicIsLocalSkater
					obj_playsound <element> vol = (<vol> * 1.5) pitch = <pitch> dropoff_function = <clickdropoff_function> buss = <clickskaterbuss>
				else
					obj_playsound <element> vol = (<vol> * 1.5) pitch = <pitch> dropoff = <clickdropoff> dropoff_function = <clickdropoff_function> buss = <clickpedbuss>
				endif
			else
				if TerrainLogicIsLocalSkater
					obj_playsound <element> vol = <vol> pitch = <pitch> dropoff_function = <clickdropoff_function> buss = <clickskaterbuss>
				else
					obj_playsound <element> vol = <vol> pitch = <pitch> dropoff = <clickdropoff> dropoff_function = <clickdropoff_function> buss = <clickpedbuss>
				endif
			endif
		endif
		wait <BoardWait> seconds
		removeparameter element
		getrandomarrayelement <clickklackbacksound>
		if gotparam element
			if NOT (<terrainsound_manualmemoryvariable> = Manual)
				if TerrainLogicIsLocalSkater
					obj_playsound <element> vol = <vol> pitch = <pitch> dropoff_function = <clickdropoff_function> buss = <clickskaterbuss>
				else
					obj_playsound <element> vol = <vol> pitch = <pitch> dropoff = <clickdropoff> dropoff_function = <clickdropoff_function> buss = <clickpedbuss>
				endif
			endif
		endif
	endif
	wait 1 gameframe
endscript

script ClickKlackLooper 
	begin
	getspeed
	if (<speed> > 3)
		delay = (<clackmeters> / <speed>)
		if (<delay> > 1.2)
			delay = 1.2
		endif
		obj_spawnscriptnow clickklack params = {minspeed = <minspeed> maxspeed = <maxspeed> clickminpitch = <clickminpitch> clickmaxpitch = <clickmaxpitch> clickminvol = <clickminvol> clickmaxvol = <clickmaxvol> clickklackfrontsound = <clickklackfrontsound> clickklackbacksound = <clickklackbacksound> clickdropoff_function = <clickdropoff_function> clickskaterbuss = <clickskaterbuss> clickpedbuss = <clickpedbuss>}
		wait <delay> seconds
	endif
	wait 1 gameframe
	repeat
endscript

script PlayExitSound exitdropoff_function = linear
	skaterloopingsound_gettag terrainsound_oldterrainsfxid
	terrain_id = <terrainsound_oldterrainsfxid>
	if NOT (<terrainsound_oldterrainsfxid> = none)
		addparams ($sfx_terrains.<terrain_id>.roll)
		getrandomarrayelement <exitsound>
		if gotparam element
			TerrainSoundCalculatePitchAndVolFast minpitch = <exitminpitch> maxpitch = <exitmaxpitch> minvol = <exitminvol> maxvol = <exitmaxvol> minspeed = 1 maxspeed = 20
			if TerrainLogicIsLocalSkater
				obj_playsound <element> vol = <vol> pitch = <pitch> dropoff_function = <exitdropoff_function> buss = <transskaterbuss>
			else
				obj_playsound <element> vol = <vol> pitch = <pitch> dropoff = <exitdropoff> dropoff_function = <exitdropoff_function> buss = <transpedbuss>
			endif
		endif
		skaterloopingsound_settag terrainsound_oldterrainsfxid = none
	endif
endscript

script FastLoopScript fastdropoff_function = linear
	<element> = <fastelement>
	if (<element> = blank)
		return
	endif
	if (<element> = newsound)
		getrandomarrayelement <fastsound>
		if TerrainLogicIsLocalSkater
			obj_playsound <element> vol = <fastminvol> pitch = <fastminpitch> fastdropoff_function = <fastdropoff_function> buss = <fastskaterbuss> num_loops = -1
		else
			obj_playsound <element> vol = <fastminvol> pitch = <fastminpitch> dropoff = <fastdropoff> fastdropoff_function = <fastdropoff_function> buss = <fastpedbuss> num_loops = -1
		endif
	endif
	skaterloopingsound_settag terrainsound_fastloopelement = <element>
	begin
	TerrainSoundCalculatePitchAndVolFast minvol = <fastminvol> maxvol = <fastmaxvol> minpitch = <fastminpitch> maxpitch = <fastmaxpitch> minspeed = 4 maxspeed = 18 pitchcurve = <fastpitchcurve> volumecurve = <fastvolumecurve> velocity = <velocity>
	if TerrainLogicIsLocalSkater
		if TerrainLogicInAir
			vol = 0
		endif
	endif
	if TerrainLogicIsLocalSkater
		obj_adjustsound <element> volumepercent = <vol> pitchpercent = <pitch>
	else
		obj_adjustsound <element> volumepercent = (<vol> / 2) pitchpercent = <pitch>
	endif
	wait 1 gameframe
	repeat
endscript

script PlayRandomArrayLoopingSound id = TerrainLoop clickklackontrans = off soundontrans = off clickklack = off soundonexit = off fastloop = off transdropoff_function = linear
	TerrainSound_CurrentSkaterRollingSound = none
	begin
	TerrainLogicGetCurrentTerrainType
	formattext checksumname = terrain_id 'sfx_id_%d' d = (($terrain_types [<terraintype>]).desc)
	if NOT (<TerrainSound_CurrentSkaterRollingSound> = <terrain_id>)
		TerrainSound_CurrentSkaterRollingSound = <terrain_id>
		if structurecontains structure = ($sfx_terrains.<terrain_id>) <type>
			addparams ($sfx_terrains.<terrain_id>.<type>)
		else
			if (debugterrainsfx = 1)
				if TerrainLogicIsLocalSkater
					printf "%s %a doesn't exist in terrainsounds.q using default %a" s = (($terrain_types [<terraintype>]).desc) a = <type>
				endif
			endif
			terrain_id = sfx_id_default
			addparams ($sfx_terrains.<terrain_id>.<type>)
		endif
		if NOT getrandomarrayelement <fastsound>
			<element> = blank
		endif
		skaterloopingsound_gettag terrainsound_fastloopelement
		if (<element> = <terrainsound_fastloopelement>)
			skaterloopingsound_settag terrainsound_fastloopelement = none
		else
			element = newsound
		endif
		fastelement = <element>
		if NOT getrandomarrayelement <sound>
			<element> = blank
		endif
		skaterloopingsound_gettag terrainsound_currentsfxterrainelement
		if (<element> = <terrainsound_currentsfxterrainelement>)
			skaterloopingsound_settag terrainsound_currentsfxterrainelement = none
		else
			element = newsound
		endif
		TerrainSoundsStopAll
		skaterloopingsound_settag terrainsound_currentsfxterrainelement = <terrainsound_currentsfxterrainelement>
		skaterloopingsound_settag terrainsound_fastloopelement = <terrainsound_fastloopelement>
		obj_spawnscriptnow PlaySFXLoopingSound params = {<...>}
		if (<clickklackontrans> = on)
			obj_spawnscriptnow clickklack params = {minspeed = <minspeed> maxspeed = <maxspeed> clickminpitch = <clickminpitch> clickmaxpitch = <clickmaxpitch> clickminvol = <clickminvol> clickmaxvol = (<clickmaxvol> * 1.2) clickklackfrontsound = <clickklackfrontsound> clickklackbacksound = <clickklackbacksound> clickdropoff_function = <clickdropoff_function> clickskaterbuss = <clickskaterbuss> clickpedbuss = <clickpedbuss>}
		endif
		if (<soundontrans> = on)
			getrandomarrayelement <transitionsound>
			if gotparam element
				TerrainSoundCalculatePitchAndVolFast minspeed = <minspeed> maxspeed = <maxspeed> minpitch = <transminpitch> maxpitch = <transmaxpitch> minvol = <transminvol> maxvol = <transmaxvol>
				if TerrainLogicIsLocalSkater
					obj_playsound <element> vol = <vol> pitch = <pitch> dropoff_function = <transdropoff_function> buss = <transskaterbuss>
				else
					obj_playsound <element> vol = <vol> pitch = <pitch> dropoff = <transdropoff> dropoff_function = <transdropoff_function> buss = <transpedbuss>
				endif
			endif
		endif
		obj_spawnscriptnow PlayExitSound
		if (<fastloop> = on)
			obj_spawnscriptnow {FastLoopScript
				params = {fastminvol = <fastminvol> fastmaxvol = <fastmaxvol> fastminpitch = <fastminpitch> fastmaxpitch = <fastmaxpitch>
					fastpitchcurve = <fastpitchcurve> fastvolumecurve = <fastvolumecurve>
					fastsound = <fastsound> fastelement = <fastelement> fastskaterbuss = <fastskaterbuss> fastpedbuss = <fastpedbuss>}}
		endif
		if (<soundonexit> = on)
			skaterloopingsound_settag terrainsound_oldterrainsfxid = <terrain_id>
		else
			skaterloopingsound_settag terrainsound_oldterrainsfxid = none
		endif
		if (<clickklack> = on)
			obj_spawnscriptnow ClickKlackLooper params = {clackmeters = <clackmeters> minspeed = <minspeed> maxspeed = <maxspeed> clickminpitch = <clickminpitch> clickmaxpitch = <clickmaxpitch> clickminvol = <clickminvol> clickmaxvol = <clickmaxvol> clickklackfrontsound = <clickklackfrontsound> clickklackbacksound = <clickklackbacksound> dropoff_function = <dropoff_function> clickskaterbuss = <clickskaterbuss> clickpedbuss = <clickpedbuss>}
		endif
	endif
	wait 1 gameframe
	repeat
endscript

script PlayRandomArraySlideFallSound id = TerrainLoop clickklackontrans = off soundontrans = off clickklack = off soundonexit = off terrainsweetener = off transdropoff_function = linear
	TerrainSound_CurrentSkaterRollingSound = none
	begin
	skaterloopingsound_gettag tagslidefallterrain
	terraintype = <tagslidefallterrain>
	tagslidefallvelocity = -1
	SFXFlagThisIsRagdoll = 1
	if (<terraintype> = -1)
		TerrainLogicGetCurrentTerrainType
	endif
	formattext checksumname = terrain_id 'sfx_id_%d' d = (($terrain_types [<terraintype>]).desc)
	if NOT (<TerrainSound_CurrentSkaterRollingSound> = <terrain_id>)
		TerrainSound_CurrentSkaterRollingSound = <terrain_id>
		if structurecontains structure = ($sfx_terrains.<terrain_id>) <type>
			addparams ($sfx_terrains.<terrain_id>.<type>)
		else
			if (debugterrainsfx = 1)
				if TerrainLogicIsLocalSkater
					printf "%s %a doesn't exist in terrainsounds.q using default %a" s = (($terrain_types [<terraintype>]).desc) a = <type>
				endif
			endif
			terrain_id = sfx_id_default
			addparams ($sfx_terrains.<terrain_id>.<type>)
		endif
		if NOT getrandomarrayelement <terrainsweetenersound>
			<element> = blank
		endif
		skaterloopingsound_gettag terrainsound_fastloopelement
		if (<element> = <terrainsound_fastloopelement>)
			skaterloopingsound_settag terrainsound_fastloopelement = none
		else
			element = newsound
		endif
		fastelement = <element>
		if NOT getrandomarrayelement <sound>
			<element> = blank
		endif
		skaterloopingsound_gettag terrainsound_currentsfxterrainelement
		if (<element> = <terrainsound_currentsfxterrainelement>)
			skaterloopingsound_settag terrainsound_currentsfxterrainelement = none
		else
			element = newsound
		endif
		TerrainSoundsStopAll
		skaterloopingsound_settag terrainsound_currentsfxterrainelement = <terrainsound_currentsfxterrainelement>
		skaterloopingsound_settag terrainsound_fastloopelement = <terrainsound_fastloopelement>
		obj_spawnscriptnow PlaySFXLoopingSoundSlideFall params = {<...>}
		if (<soundontrans> = on)
			getrandomarrayelement <transitionsound>
			if gotparam element
				TerrainSoundCalculatePitchAndVolFast minspeed = <minspeed> maxspeed = <maxspeed> minpitch = <transminpitch> maxpitch = <transmaxpitch> minvol = <transminvol> maxvol = <transmaxvol>
				if TerrainLogicIsLocalSkater
					obj_playsound <element> vol = <vol> pitch = <pitch> dropoff_function = <transdropoff_function> buss = <transskaterbuss>
				else
					obj_playsound <element> vol = <vol> pitch = <pitch> dropoff = <transdropoff> dropoff_function = <transdropoff_function> buss = <transpedbuss>
				endif
			endif
		endif
		obj_spawnscriptnow PlayExitSound
		if (<terrainsweetener> = on)
			obj_spawnscriptnow {FastLoopScript
				params = {fastminvol = <sweetminvol> fastmaxvol = <sweetmaxvol> fastminpitch = <sweetminpitch> fastmaxpitch = <sweetmaxpitch>
					fastpitchcurve = <sweetpitchcurve> fastvolumecurve = <sweetvolumecurve> fastdropoff_function = <SweetDropoff_funtion>
					fastsound = <terrainsweetenersound> fastelement = <fastelement> velocity = <velocity> fastskaterbuss = <fastskaterbuss> fastpedbuss = <fastpedbuss>}}
		endif
		if (<soundonexit> = on)
			skaterloopingsound_settag terrainsound_oldterrainsfxid = <terrain_id>
		else
			skaterloopingsound_settag terrainsound_oldterrainsfxid = none
		endif
	endif
	wait 1 gameframe
	repeat
endscript

script PlaySFXLoopingSound pitchchangepercentageonturning = 100 dropoff_function = linear volsmoothfactorup = 0 volsmoothfactordown = 0 SFXFlagThisIsRagdoll = 0
	if (<element> = blank)
		return
	endif
	if (<element> = newsound)
		getrandomarrayelement <sound>
		if gotparam element
			if TerrainLogicIsLocalSkater
				obj_playsound <element> vol = <minvol> pitch = <minpitch> dropoff_function = <dropoff_function> buss = <skaterbuss> num_loops = -1
			else
				obj_playsound <element> vol = <minvol> pitch = <minpitch> dropoff = <dropoff> dropoff_function = <dropoff_function> buss = <pedbuss> num_loops = -1
			endif
		else
			return
		endif
	endif
	skaterloopingsound_settag terrainsound_currentsfxterrainelement = <element>
	skaterloopingsound_gettag terrainsound_leftturningmemoryvariable
	skaterloopingsound_gettag terrainsound_rightturningmemoryvariable
	terrainsound_manualmemoryvariable = none
	TerrainSound_ManualPlayVariable = none
	TerrainSound_TurningPlayVariable = none
	vol = <minvol>
	volsmooth = <minvol>
	begin
	TerrainSoundCalculatePitchAndVolFast minvol = <minvol> maxvol = <maxvol> minpitch = <minpitch> maxpitch = <maxpitch> minspeed = <minspeed> maxspeed = <maxspeed> volumecurve = <volumecurve> pitchcurve = <pitchcurve> velocity = <velocity>
	if TerrainLogicIsLocalSkater
		if TerrainLogicInAir
			TerrainSoundsStopAll
			PlayExitSound
			PlayWheels
			return
		endif
		if leftpressed
			pitch = (<pitch> * (<pitchchangepercentageonturning> / 100.0))
			if NOT (<terrainsound_leftturningmemoryvariable> = left)
				if NOT TerrainLogicInAir
					TerrainSound_TurningPlayVariable = play
				endif
				terrainsound_leftturningmemoryvariable = left
				skaterloopingsound_settag terrainsound_leftturningmemoryvariable = left
			endif
		else
			if (<terrainsound_leftturningmemoryvariable> = left)
				terrainsound_leftturningmemoryvariable = none
				skaterloopingsound_settag terrainsound_leftturningmemoryvariable = none
			endif
		endif
		if rightpressed
			pitch = (<pitch> * (<pitchchangepercentageonturning> / 100.0))
			if NOT (<terrainsound_rightturningmemoryvariable> = right)
				if NOT TerrainLogicInAir
					TerrainSound_TurningPlayVariable = play
				endif
				skaterloopingsound_settag terrainsound_rightturningmemoryvariable = right
				terrainsound_rightturningmemoryvariable = right
			endif
		else
			if (<terrainsound_rightturningmemoryvariable> = right)
				skaterloopingsound_settag terrainsound_rightturningmemoryvariable = none
				terrainsound_rightturningmemoryvariable = none
			endif
		endif
	else
		<pitch> = <pitch>
	endif
	if TerrainLogicInManual
		pitch = (<pitch> * 1.3)
		vol = (<vol> * 0.7)
		if NOT (<terrainsound_manualmemoryvariable> = Manual)
			TerrainSound_ManualPlayVariable = play
			terrainsound_manualmemoryvariable = Manual
			skaterloopingsound_settag terrainsound_manualmemoryvariable = Manual
		endif
	else
		if (<terrainsound_manualmemoryvariable> = Manual)
			skaterloopingsound_settag terrainsound_manualmemoryvariable = none
			spawnterrainsound action = ollieland
		endif
	endif
	skaterloopingsound_gettag terrainsound_skaterispushing
	if (<terrainsound_skaterispushing> = true)
		vol = (<vol> * 1.2)
		pitch = (<pitch> * 1.3)
	endif
	if (<SFXFlagThisIsRagdoll> = 1)
		if ragdoll_isinair
			vol = 0
		endif
	endif
	if (<TerrainSound_TurningPlayVariable> = play)
		obj_spawnscriptnow sk8_boardsqueaks
		TerrainSound_TurningPlayVariable = none
	endif
	if (<TerrainSound_ManualPlayVariable> = play)
		obj_spawnscriptnow PlayManualWheels
		TerrainSound_ManualPlayVariable = none
	endif
	if (<vol> < <volsmooth>)
		volsmooth = ((<volsmooth> * <volsmoothfactordown> + <vol>) / (1 + <volsmoothfactordown>))
	else
		volsmooth = ((<volsmooth> * <volsmoothfactorup> + <vol>) / (1 + <volsmoothfactorup>))
	endif
	obj_adjustsound <element> volumepercent = <volsmooth> pitchpercent = <pitch>
	wait 1 gameframe
	repeat
endscript

script PlaySFXLoopingSoundSlideFall pitchchangepercentageonturning = 100 dropoff_function = linear volsmoothfactorup = 0 volsmoothfactordown = 0 SFXFlagThisIsRagdoll = 0
	if (<element> = blank)
		return
	endif
	if (<element> = newsound)
		getrandomarrayelement <sound>
		if gotparam element
			if TerrainLogicIsLocalSkater
				obj_playsound <element> vol = <minvol> pitch = <minpitch> dropoff_function = <dropoff_function> buss = <skaterbuss> num_loops = -1
			else
				obj_playsound <element> vol = <minvol> pitch = <minpitch> dropoff = <dropoff> dropoff_function = <dropoff_function> buss = <pedbuss> num_loops = -1
			endif
		else
			return
		endif
	endif
	skaterloopingsound_settag terrainsound_currentsfxterrainelement = <element>
	vol = <minvol>
	volsmooth = <minvol>
	begin
	skaterloopingsound_gettag tagslidefallvelocity
	velocity = <tagslidefallvelocity>
	if (<velocity> = -1)
		getspeed
		velocity = <speed>
	endif
	TerrainSoundCalculatePitchAndVolFast minvol = <minvol> maxvol = <maxvol> minpitch = <minpitch> maxpitch = <maxpitch> minspeed = <minspeed> maxspeed = <maxspeed> volumecurve = <volumecurve> pitchcurve = <pitchcurve> velocity = <velocity>
	if TerrainLogicInAir
		vol = 0
	endif
	if (<SFXFlagThisIsRagdoll> = 1)
		if ragdoll_isinair
			vol = 0
		endif
	endif
	if (<vol> < <volsmooth>)
		volsmooth = ((<volsmooth> * <volsmoothfactordown> + <vol>) / (1 + <volsmoothfactordown>))
	else
		volsmooth = ((<volsmooth> * <volsmoothfactorup> + <vol>) / (1 + <volsmoothfactorup>))
	endif
	if TerrainLogicIsLocalSkater
		obj_adjustsound <element> volumepercent = <volsmooth> pitchpercent = <pitch>
	else
		obj_adjustsound <element> volumepercent = <volsmooth> pitchpercent = <pitch>
	endif
	wait 1 gameframe
	repeat
endscript

script PlayRandomArraySoundBodyFall type = bodyfall minspeed = 1 maxspeed = 20 sweetdropoff_function = linear lowenddropoff_function = linear dropoff_function = linear terraintype = 0
	formattext checksumname = terrain_id 'sfx_id_%d' d = (($terrain_types [<terraintype>]).desc)
	if structurecontains structure = ($sfx_terrains.<terrain_id>) <type>
		addparams ($sfx_terrains.<terrain_id>.<type>)
	else
		if (debugterrainsfx = 1)
			if TerrainLogicIsLocalSkater
				printf "%s %a doesn't exist in terrainsounds.q using default %a" s = (($terrain_types [<terraintype>]).desc) a = <type>
			endif
		endif
		terrain_id = sfx_id_default
		addparams ($sfx_terrains.<terrain_id>.<type>)
	endif
	TerrainSoundCalculatePitchAndVolFast minvol = <minvol> maxvol = <maxvol> minpitch = <minpitch> maxpitch = <maxpitch> minspeed = <minspeed> maxspeed = <maxspeed> velocity = <proj_velocity> minspeed = 0 maxspeed = 200
	getrandomarrayelement <sound>
	if gotparam element
		if TerrainLogicIsLocalSkater
			obj_playsound <element> vol = <vol> pitch = <pitch> dropoff_function = <dropoff_function> buss = <skaterbuss>
		else
			obj_playsound <element> vol = <vol> pitch = <pitch> dropoff = <dropoff> dropoff_function = <dropoff_function> buss = <pedbuss>
		endif
	endif
	if (<LowEndSweetener> = on)
		TerrainSoundCalculatePitchAndVolFast minpitch = <lowendminpitch> maxpitch = <lowendmaxpitch> minvol = <lowendminvol> maxvol = <lowendmaxvol> velocity = <proj_velocity> minspeed = 80 maxspeed = 400
		getrandomarrayelement <lowendsweetsound>
		if gotparam element
			if TerrainLogicIsLocalSkater
				obj_playsound <element> vol = <vol> pitch = <pitch> dropoff_function = <lowenddropoff_function> buss = <lowendskaterbuss>
			else
				obj_playsound <element> vol = <vol> pitch = <pitch> dropoff = <lowenddropoff> dropoff_function = <lowenddropoff_function> buss = <lowendpedbuss>
			endif
		endif
	endif
	if (<sweetener> = on)
		TerrainSoundCalculatePitchAndVolFast minpitch = <sweetminpitch> maxpitch = <sweetmaxpitch> minvol = <sweetminvol> maxvol = <sweetmaxvol> velocity = <proj_velocity> minspeed = 0 maxspeed = 400
		getrandomarrayelement <sweetsound>
		if gotparam element
			wait <waittime> seconds
			getrandomvalue name = v a = 0 b = 99 integer
			if (<v> < <sweetpercentchance>)
				if TerrainLogicIsLocalSkater
					obj_playsound <element> vol = <vol> pitch = <pitch> dropoff_function = <sweetdropoff_function> buss = <sweetskaterbuss>
				else
					obj_playsound <element> vol = <vol> pitch = <pitch> dropoff = <sweetdropoff> dropoff_function = <sweetdropoff_function> buss = <sweetpedbuss>
				endif
			endif
		endif
	endif
endscript

script PlayRandomArraySoundBonk type = bodyfall minspeed = 1 maxspeed = 20 sweetdropoff_function = linear lowenddropoff_function = linear dropoff_function = linear terraintype = 0
	if TerrainLogicIsLocalSkater
		getlastbonkterrain
		terraintype = <terrain_num>
	else
		terraintype = 0
	endif
	if (debugterrainsfx = 1)
		if TerrainLogicIsLocalSkater
			printf "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
			printf "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!THIS TERRAIN IS %T!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" t = (($terrain_types [<terraintype>]).desc)
			printf "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
		endif
	endif
	getspeed
	if (<speed> < 0.1)
		<speed> = 0.1
	endif
	speed = ((1 / <speed>) * 2)
	formattext checksumname = terrain_id 'sfx_id_%d' d = (($terrain_types [<terraintype>]).desc)
	if structurecontains structure = ($sfx_terrains.<terrain_id>) <type>
		addparams ($sfx_terrains.<terrain_id>.<type>)
	else
		if (debugterrainsfx = 1)
			if TerrainLogicIsLocalSkater
				printf "%s %a doesn't exist in terrainsounds.q using default %a" s = (($terrain_types [<terraintype>]).desc) a = <type>
			endif
		endif
		terrain_id = sfx_id_default
		addparams ($sfx_terrains.<terrain_id>.<type>)
	endif
	TerrainSoundCalculatePitchAndVolFast minvol = <minvol> maxvol = <maxvol> minpitch = <minpitch> maxpitch = <maxpitch> minspeed = <minspeed> maxspeed = <maxspeed> velocity = <speed>
	getrandomarrayelement <sound>
	if gotparam element
		if TerrainLogicIsLocalSkater
			obj_playsound <element> vol = <vol> pitch = <pitch> dropoff_function = <dropoff_function> buss = <skaterbuss>
		else
			obj_playsound <element> vol = <vol> pitch = <pitch> dropoff = <dropoff> dropoff_function = <dropoff_function> buss = <pedbuss>
		endif
	endif
	if (<LowEndSweetener> = on)
		TerrainSoundCalculatePitchAndVolFast minpitch = <lowendminpitch> maxpitch = <lowendmaxpitch> minvol = <lowendminvol> maxvol = <lowendmaxvol> minspeed = <minspeed> maxspeed = <maxspeed> velocity = <speed>
		getrandomarrayelement <lowendsweetsound>
		if gotparam element
			if TerrainLogicIsLocalSkater
				obj_playsound <element> vol = <vol> pitch = <pitch> dropoff_function = <lowenddropoff_function> buss = <lowendskaterbuss>
			else
				obj_playsound <element> vol = <vol> pitch = <pitch> dropoff = <lowenddropoff> dropoff_function = <lowenddropoff_function> buss = <lowendpedbuss>
			endif
		endif
	endif
	if (<sweetener> = on)
		TerrainSoundCalculatePitchAndVolFast minpitch = <sweetminpitch> maxpitch = <sweetmaxpitch> minvol = <sweetminvol> maxvol = <sweetmaxvol> minspeed = <minspeed> maxspeed = <maxspeed> velocity = <speed>
		getrandomarrayelement <sweetsound>
		if gotparam element
			wait <waittime> seconds
			getrandomvalue name = v a = 0 b = 99 integer
			if (<v> < <sweetpercentchance>)
				if TerrainLogicIsLocalSkater
					obj_playsound <element> vol = <vol> pitch = <pitch> dropoff_function = <sweetdropoff_function> buss = <sweetskaterbuss>
				else
					obj_playsound <element> vol = <vol> pitch = <pitch> dropoff = <sweetdropoff> dropoff_function = <sweetdropoff_function> buss = <sweetpedbuss>
				endif
			endif
		endif
	endif
endscript

script PlayRandomArraySoundFootstepSpeedRange type = footstep minspeed = 1 maxspeed = 7 dropoff_function = linear layerdropoff_function = linear
	TerrainLogicGetCurrentTerrainType
	formattext checksumname = terrain_id 'sfx_id_%d' d = (($terrain_types [<terraintype>]).desc)
	if structurecontains structure = ($sfx_terrains.<terrain_id>) <type>
		addparams ($sfx_terrains.<terrain_id>.<type>)
	else
		if (debugterrainsfx = 1)
			if TerrainLogicIsLocalSkater
				printf "%s %a doesn't exist in terrainsounds.q using default %a" s = (($terrain_types [<terraintype>]).desc) a = <type>
			endif
		endif
		terrain_id = sfx_id_default
		addparams ($sfx_terrains.<terrain_id>.<type>)
	endif
	TerrainSoundCalculatePitchAndVolFast minvol = <minvol> maxvol = <maxvol> minpitch = <minpitch> maxpitch = <maxpitch> minspeed = <minspeed> maxspeed = <maxspeed>
	if (<alpha> < 0.8)
		sound = <walksound>
	else
		sound = <runsound>
	endif
	getarraysize <sound>
	if (<array_size> = 1)
		element = (<sound> [0])
	else
		TerrainSound_LastFootStep = 0
		getsingletag TerrainSound_LastFootStep
		getrandomvalue name = elementindex a = 0 b = (<array_size> -2) integer
		if ((<elementindex> > <TerrainSound_LastFootStep>) || (<elementindex> = <TerrainSound_LastFootStep>))
			<elementindex> = (<elementindex> + 1)
		endif
		element = (<sound> [<elementindex>])
		settags TerrainSound_LastFootStep = <elementindex>
	endif
	if TerrainLogicIsLocalSkater
		obj_playsound <element> vol = <vol> pitch = <pitch> dropoff_function = <dropoff_function> buss = <skaterbuss>
	else
		if (<alpha> > 0.8)
			obj_playsound <element> vol = <vol> pitch = <pitch> dropoff = ($running_ped_dropoff_distance) dropoff_function = inv_exponential buss = <pedbuss>
		else
			obj_playsound <element> vol = <vol> pitch = <pitch> dropoff = <dropoff> dropoff_function = <dropoff_function> buss = <pedbuss>
		endif
	endif
	if (<footsteplayer> = on)
		sound2 = <layersound>
		getrandomarrayelement <sound2>
		if gotparam element
			getrandomvalue name = v a = 0 b = 99 integer
			if (<v> < <layerpercentchance>)
				if TerrainLogicIsLocalSkater
					obj_playsound <element> vol = <layervol> pitch = <layerpitch> dropoff_function = <layerdropoff_function> buss = <layerskaterbuss>
				else
					obj_playsound <element> vol = <layervol> pitch = <layerpitch> dropoff = <layerdropoff> dropoff_function = <layerdropoff_function> buss = <layerpedbuss>
				endif
			endif
		endif
	endif
endscript

script PlayfootPush dropoff_function = linear
	TerrainLogicGetCurrentTerrainType
	skaterloopingsound_settag terrainsound_skaterispushing = true
	formattext checksumname = terrain_id 'sfx_id_%d' d = (($terrain_types [<terraintype>]).desc)
	if structurecontains structure = ($sfx_terrains.<terrain_id>) <type>
		addparams ($sfx_terrains.<terrain_id>.<type>)
	else
		if (debugterrainsfx = 1)
			if TerrainLogicIsLocalSkater
				printf "%s %a doesn't exist in terrainsounds.q using default %a" s = (($terrain_types [<terraintype>]).desc) a = <type>
			endif
		endif
		terrain_id = sfx_id_default
		addparams ($sfx_terrains.<terrain_id>.<type>)
	endif
	getspeed
	TerrainSoundCalculatePitchAndVolFast minpitch = <minpitch> maxpitch = <maxpitch> minvol = <minvol> maxvol = <maxvol> minspeed = <minspeed> maxspeed = <maxspeed>
	getrandomarrayelement <sound>
	if gotparam element
		if TerrainLogicIsLocalSkater
			obj_playsound <element> vol = <vol> pitch = <pitch> dropoff_function = <dropoff_function> buss = <skaterbuss>
			skaterloopingsound_settag terrainsound_boardpushelement = <element>
		else
			obj_playsound <element> vol = <vol> pitch = <pitch> dropoff = <dropoff> dropoff_function = <dropoff_function> buss = <pedbuss>
			skaterloopingsound_settag terrainsound_boardpushelement = <element>
		endif
		wait 0.4 seconds
	endif
	skaterloopingsound_settag terrainsound_skaterispushing = none
endscript

script PlayRandomArraySoundSpeedRange type = ollieland minspeed = 1 maxspeed = 20 dropoff_function = linear
	TerrainLogicGetCurrentTerrainType
	formattext checksumname = terrain_id 'sfx_id_%d' d = (($terrain_types [<terraintype>]).desc)
	if structurecontains structure = ($sfx_terrains.<terrain_id>) <type>
		addparams ($sfx_terrains.<terrain_id>.<type>)
	else
		if (debugterrainsfx = 1)
			if TerrainLogicIsLocalSkater
				printf "%s %a doesn't exist in terrainsounds.q using default %a" s = (($terrain_types [<terraintype>]).desc) a = <type>
			endif
		endif
		terrain_id = sfx_id_default
		addparams ($sfx_terrains.<terrain_id>.<type>)
	endif
	getspeed
	TerrainSoundCalculatePitchAndVolFast minpitch = <minpitch> maxpitch = <maxpitch> minvol = <minvol> maxvol = <maxvol> minspeed = <minspeed> maxspeed = <maxspeed>
	getrandomarrayelement <sound>
	if gotparam element
		if TerrainLogicIsLocalSkater
			obj_playsound <element> vol = <vol> pitch = <pitch> dropoff_function = <dropoff_function> buss = <skaterbuss>
		else
			obj_playsound <element> vol = <vol> pitch = <pitch> dropoff = <dropoff> dropoff_function = <dropoff_function> buss = <pedbuss>
		endif
	endif
endscript

script PlayRandomArraySoundRange type = ollie dropoff_function = linear
	if (<type> = ollie)
		if TerrainLogicInAir
			terrain_id = sfx_id_default
			addparams ($sfx_terrains.<terrain_id>.<type>)
		else
			TerrainLogicGetCurrentTerrainType
			formattext checksumname = terrain_id 'sfx_id_%d' d = (($terrain_types [<terraintype>]).desc)
			if structurecontains structure = ($sfx_terrains.<terrain_id>) <type>
				addparams (($sfx_terrains.<terrain_id>).<type>)
			else
				if (debugterrainsfx = 1)
					if TerrainLogicIsLocalSkater
						printf "%s %a doesn't exist in terrainsounds.q using default %a" s = (($terrain_types [<terraintype>]).desc) a = <type>
					endif
				endif
				terrain_id = sfx_id_default
				addparams ($sfx_terrains.<terrain_id>.<type>)
			endif
		endif
	else
		TerrainLogicGetCurrentTerrainType
		formattext checksumname = terrain_id 'sfx_id_%d' d = (($terrain_types [<terraintype>]).desc)
		if structurecontains structure = ($sfx_terrains.<terrain_id>) <type>
			addparams (($sfx_terrains.<terrain_id>).<type>)
		else
			if (debugterrainsfx = 1)
				if TerrainLogicIsLocalSkater
					printf "%s %a doesn't exist in terrainsounds.q using default %a" s = (($terrain_types [<terraintype>]).desc) a = <type>
				endif
			endif
			terrain_id = sfx_id_default
			addparams ($sfx_terrains.<terrain_id>.<type>)
		endif
	endif
	getrandomarrayelement <sound>
	if gotparam element
		getrandomvalue name = vol a = <minvol> b = <maxvol>
		getrandomvalue name = pitch a = <minpitch> b = <maxpitch>
		if TerrainLogicIsLocalSkater
			obj_playsound <element> vol = <vol> pitch = <pitch> dropoff_function = <dropoff_function> buss = <skaterbuss>
		else
			obj_playsound <element> vol = <vol> pitch = <pitch> dropoff = <dropoff> dropoff_function = <dropoff_function> buss = <pedbuss>
		endif
	endif
endscript

script CalculatePitchAndVol volumecurve = linear pitchcurve = linear minpitch = 100 maxpitch = 100 minvol = 0 maxvol = 60 minspeed = 1 maxspeed = 20
	getspeed
	if (gotparam velocity)
		speed = <velocity>
	endif
	PitchAlpha = ((<speed> - <minspeed>) / (<maxspeed> - <minspeed>))
	if (<PitchAlpha> < 0)
		<PitchAlpha> = 0
	endif
	if (<PitchAlpha> > 1)
		<PitchAlpha> = 1
	endif
	VolumeAlpha = ((<speed> - <minspeed>) / (<maxspeed> - <minspeed>))
	if (<VolumeAlpha> < 0)
		<VolumeAlpha> = 0
	endif
	if (<VolumeAlpha> > 1)
		<VolumeAlpha> = 1
	endif
	switch <volumecurve>
		case exponential
		VolumeAlpha = (<VolumeAlpha> * <VolumeAlpha>)
		case inv_exponential
		sqrt <VolumeAlpha>
		VolumeAlpha = <sqrt>
		default
	endswitch
	switch <pitchcurve>
		case exponential
		PitchAlpha = (<PitchAlpha> * <PitchAlpha>)
		case inv_exponential
		sqrt <PitchAlpha>
		PitchAlpha = <sqrt>
		default
	endswitch
	if (<speed> < <minspeed>)
		<pitch> = <minpitch>
		<vol> = <minvol>
	else
		if (<speed> > <maxspeed>)
			<pitch> = <maxpitch>
			<vol> = <maxvol>
		else
			<pitch> = (<minpitch> + <PitchAlpha> * (<maxpitch> - <minpitch>))
			<vol> = (<minvol> + <VolumeAlpha> * (<maxvol> - <minvol>))
		endif
	endif
	return pitch = <pitch> vol = <vol> alpha = <VolumeAlpha>
endscript

script PlayRandomArrayNadasSound id = TerrainLoop clickklackontrans = off soundontrans = off clickklack = off soundonexit = off fastloop = off transdropoff_function = linear
	TerrainSound_CurrentSkaterRollingSound = none
	begin
	TerrainLogicGetCurrentTerrainType
	formattext checksumname = terrain_id 'sfx_id_%d' d = (($terrain_types [<terraintype>]).desc)
	if NOT (<TerrainSound_CurrentSkaterRollingSound> = <terrain_id>)
		TerrainSound_CurrentSkaterRollingSound = <terrain_id>
		if structurecontains structure = ($sfx_terrains.<terrain_id>) <type>
			addparams ($sfx_terrains.<terrain_id>.<type>)
		else
			if (debugterrainsfx = 1)
				if TerrainLogicIsLocalSkater
					printf "%s %a doesn't exist in terrainsounds.q using default %a" s = (($terrain_types [<terraintype>]).desc) a = <type>
				endif
			endif
			terrain_id = sfx_id_default
			addparams ($sfx_terrains.<terrain_id>.<type>)
		endif
		if NOT getrandomarrayelement <sound>
			<element> = blank
		endif
		skaterloopingsound_gettag terrainsound_currentsfxterrainelement
		if (<element> = <terrainsound_currentsfxterrainelement>)
			skaterloopingsound_settag terrainsound_currentsfxterrainelement = none
		else
			element = newsound
		endif
		TerrainSoundsStopAll
		skaterloopingsound_settag terrainsound_currentsfxterrainelement = <terrainsound_currentsfxterrainelement>
		obj_spawnscriptnow PlaySFXNadasSound params = {<...>}
	endif
	wait 1 gameframe
	repeat
endscript

script PlaySFXNadasSound pitchchangepercentageonturning = 100 dropoff_function = linear
	if (<element> = blank)
		return
	endif
	if (<element> = newsound)
		getrandomarrayelement <sound>
		if TerrainLogicIsLocalSkater
			obj_playsound <element> vol = <vol> pitch = <pitch> dropoff_function = <dropoff_function> buss = <skaterbuss> num_loops = -1
		else
			obj_playsound <element> vol = <vol> pitch = <pitch> dropoff = <dropoff> dropoff_function = <dropoff_function> buss = <pedbuss> num_loops = -1
		endif
	endif
	skaterloopingsound_settag terrainsound_currentsfxterrainelement = <element>
	vol = ((<maxvol> - <minvol>) * 0.5 + <minvol>)
	pitch = 100
	begin
	if TerrainLogicIsLocalSkater
		obj_adjustsound <element> volumepercent = <vol> pitchpercent = <pitch>
	else
		obj_adjustsound <element> volumepercent = <vol> pitchpercent = <pitch>
	endif
	wait 1 gameframe
	repeat
endscript

script TerrainLogicIsLocalSkater 
	if obj_hascomponent \{skatercorephysics}
		if islocalskater
			return \{true}
		endif
	endif
	return \{false}
endscript

script TerrainLogicInAir 
	if obj_hascomponent \{navigation}
		if Navigation_IsFalling
			return \{true}
		endif
		return \{false}
	else
		if inair
			return \{true}
		endif
		return \{false}
	endif
	return \{false}
endscript

script TerrainLogicInManual 
	if obj_hascomponent \{animinfo}
		if InManual
			return \{true}
		endif
	else
		skaterloopingsound_gettag \{terrainsound_pedinmanual}
		if (<terrainsound_pedinmanual> = true)
			return \{true}
		endif
	endif
	return \{false}
endscript

script TerrainLogicGetCurrentTerrainType 
	if obj_hascomponent \{navigation}
		if agent_hasvehicle
			agent_getvehicle
			<vehicle> :getcurrentterraintype
			return terraintype = <terraintype>
		endif
	endif
	getcurrentterraintype
	return terraintype = <terraintype>
endscript
