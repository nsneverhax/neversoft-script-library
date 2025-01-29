
script flashsounds 
	EnableRemoveSoundEntry \{enable}
	stars
	if NOT isngc
		printf \{qs(0x1565cdb1)}
		UnLoadPak \{'zones/global/global_sfx.pak'
			Heap = heap_audio
			localized}
		WaitUnloadPak \{'zones/global/global_sfx.pak'}
		LoadPak \{'zones/global/global_sfx.pak'
			no_vram
			Heap = heap_audio
			localized}
	endif
	stars
	printf \{qs(0x2f7fe05d)}
endscript
SfxPreviewEventTree_FAM = {
	Type = FAM
	[
		{
			Type = Source
			anim = sk9_skater_Default
		}
	]
}

script SfxCreateTestFAMObject 
	if CompositeObjectExists \{SfxPreviewEventObject}
		SfxPreviewEventObject :Die
	endif
	skater :Obj_GetPosition
	skater :Obj_GetQuat
	CreateCompositeObject Priority = COIM_Priority_Permanent Heap = Generic {
		components = [{component = SetDisplayMatrix} {component = AnimTree}
			{component = Skeleton} {component = Model}
			{component = Agent} {component = FAM} {component = Stream}]
		params = {Name = SfxPreviewEventObject Pos = <Pos> orientation = <Quat> cloneFrom = skater
			skeletonname = sk9_skater species = human voice_profile = TeenMaleSkater1 sex = male
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
	Pos = (<Pos> + (10 * <Quat>))
	CreateCompositeObject Priority = COIM_Priority_Permanent Heap = Generic {
		components = [{component = Sound}]
		params = {Name = SfxPreviewEventObject Pos = <Pos> orientation = <Quat>}
	}
endscript

script SfxDestroyTestObject 
	if CompositeObjectExists \{SfxPreviewEventObject}
		SfxPreviewEventObject :Die
	endif
endscript

script PreviewSoundEvent 
	ScriptAssert \{'PreviewSoundEvent: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript
