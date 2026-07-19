
script flashsounds 
	EnableRemoveSoundEntry \{enable}
	stars
	printf \{qs("\LFlashing global_sfx pak")}
	UnloadPak \{'zones/global/global_sfx.pak'
		heap = heap_audio}
	WaitUnloadPak \{'zones/global/global_sfx.pak'}
	LoadPak \{'zones/global/global_sfx.pak'
		no_vram
		heap = heap_audio}
	stars
	printf \{qs("\LSfx Pak flashing done.")}
endscript
SfxPreviewEventTree_FAM = {
	type = FAM
	[
		{
			type = Source
			Anim = sk9_skater_Default
		}
	]
}

script SfxCreateTestFAMObject 
	if CompositeObjectExists \{SfxPreviewEventObject}
		SfxPreviewEventObject :Die
	endif
	skater :Obj_GetPosition
	skater :Obj_GetQuat
	CreateCompositeObject priority = COIM_Priority_Permanent heap = generic {
		Components = [{Component = SetDisplayMatrix} {Component = AnimTree}
			{Component = skeleton} {Component = Model}
			{Component = Agent} {Component = FAM}]
		params = {name = SfxPreviewEventObject pos = <pos> Orientation = <Quat> CloneFrom = skater
			SkeletonName = sk9_skater species = human voice_profile = TeenMaleSkater1 sex = Male
			notice_radius = 6.0 agent_stats = stats_player faction = $faction_test}
	}
	SfxPreviewEventObject :Anim_InitTree \{Tree = SfxPreviewEventTree_FAM
		NodeIdDeclaration = [
			FAM
		]}
endscript

script SfxCreateTestObject 
	if CompositeObjectExists \{SfxPreviewEventObject}
		SfxPreviewEventObject :Die
	endif
	GetCurrentCameraObject
	<camid> :Obj_GetPosition
	<camid> :Obj_GetQuat
	pos = (<pos> + (10 * <Quat>))
	CreateCompositeObject priority = COIM_Priority_Permanent heap = generic {
		Components = [{Component = Sound}]
		params = {name = SfxPreviewEventObject pos = <pos> Orientation = <Quat>}
	}
endscript

script SfxDestroyTestObject 
	if CompositeObjectExists \{SfxPreviewEventObject}
		SfxPreviewEventObject :Die
	endif
endscript

script PreviewSoundEvent 
	ExtendCRC <event> '_container' out = container_name
	if StructureContains Structure = $<container_name> command
		printf qs("\LPreviewing SoundEvent %s") s = <event>
		if ChecksumEquals a = ($<container_name>.command) b = PlaySound
			printf \{qs("\LPlaysound!")}
			SoundEvent event = <event>
		elseif ChecksumEquals a = ($<container_name>.command) b = Obj_PlaySound
			printf \{qs("\LObj_Playsound!")}
			SfxCreateTestObject
			SoundEvent event = <event> object = SfxPreviewEventObject
		elseif ChecksumEquals a = ($<container_name>.command) b = Agent_PlayVO
			printf \{qs("\LAgent_PlayVO!")}
			<buss> = Master
			SfxCreateTestFAMObject
			SoundEvent event = <event> object = SfxPreviewEventObject <...>
		else
			printf \{qs("\LSound Event Command is invalid")}
		endif
		waittime = 0
		begin
		if NOT (isSoundEventPlaying <event>)
			break
		endif
		if (<waittime> > 200)
			StopSoundEvent <event>
			break
		endif
		Wait \{0.1
			seconds}
		waittime = (<waittime> + 1)
		repeat
		SfxDestroyTestObject
	else
		printf qs("\Lsound event does not exist: %s") s = <container_name>
	endif
endscript
