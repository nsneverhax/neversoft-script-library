
script UnHidePlayerAndDestroyFakes 
	KillSpawnedScript \{Name = _TestAnimSequence}
	if CompositeObjectExists \{Name = FakeCharacter}
		FakeCharacter :DIE
	endif
	if CompositeObjectExists \{Name = AnimTreePreviewObject}
		AnimTreePreviewObject :DIE
	endif
endscript

script TestAnim \{Skeleton = GH3_Guitarist_Axel}
	if GotParam \{OFF}
		UnHidePlayerAndDestroyFakes
	else
		ReloadAndTestAnim <...> Skeleton = <Skeleton>
	endif
endscript

script ReloadAndTestAnim 
	KillSpawnedScript \{Name = _TestAnimSequence}
	LaunchEvent \{Type = DrawRequested
		Data = {
			cycledown
		}}
	FormatText ChecksumName = AnimName '%s' S = <Anim> DontAssertForChecksums
	if GotParam \{DifferenceAnim}
		if (<DifferenceAnim> = "")
		else
			FormatText ChecksumName = DifferenceAnimName '%s' S = <DifferenceAnim>
		endif
	endif
	CreateFake \{Original = GUITARIST
		Skeleton = GH3_Guitarist_Axel
		Pos = (0.0, 2.0, 2.0)}
	if GotParam \{CYCLE}
		AnimTreePreviewObject :ModelViewer_PlayAnim Anim = <AnimName> BlendPeriod = 0 SPEED = <SPEED> CYCLE
	else
		AnimTreePreviewObject :ModelViewer_PlayAnim Anim = <AnimName> BlendPeriod = 0 SPEED = <SPEED>
	endif
	if GotParam \{DifferenceAnim}
		AnimTreePreviewObject :Obj_PoseControllerCommand Command = PlaySequence DifferenceAnimName = <DifferenceAnimName> differenceAnimAmount = <differenceAnimAmount>
	endif
	AnimTreePreviewObject :Obj_ForceUpdate
endscript

script CreateFake 
	if NOT CompositeObjectExists Name = <Original>
		return
	endif
	if CompositeObjectExists \{Name = AnimTreePreviewObject}
		AnimTreePreviewObject :DIE
	endif
	UpdateAnimCache \{CLEAR}
	<Original> :Obj_GetQuat
	CreateCompositeObject {
		Components = [
			{
				Component = Suspend
			}
			{
				Component = AnimTree
			}
			{
				Component = Skeleton
			}
			{
				Component = SetDisplayMatrix
			}
			{
				Component = Model
				CloneFrom = <Original>
			}
		]
		Params = {
			SkeletonName = <Skeleton>
			Name = AnimTreePreviewObject
			Pos = <Pos>
			Orientation = <Quat>
		}
	}
	AnimTreePreviewObject :ModelViewer_InitAnimTree
endscript

script AnimTreePreview 
	AnimTreePreview_NxCommon targetObject = GUITARIST Ragdoll = ragdoll_ped <...>
	if NOT CompositeObjectExists \{AnimTreePreviewObject}
		return
	endif
	AnimTreePreviewObject :UnPause
	if CompositeObjectExists \{GUITARIST}
		GUITARIST :Obj_SwitchScript \{guitarist_idle_animpreview}
	endif
	Change \{crowd_debug_mode = 1}
	PlayIGCCam \{Name = anim_preview_cam
		LockTo = GUITARIST
		Pos = (-0.9129459, 2.0256813, 2.383587)
		Quat = (0.045517996, 0.963656, -0.18475299)
		FOV = 72.0
		Play_hold
		interrupt_current}
endscript

script AnimTreePreviewRestore 
	UnHidePlayerAndDestroyFakes
	Change \{crowd_debug_mode = 0}
	KillSkaterCamAnim \{Name = anim_preview_cam}
	if CompositeObjectExists \{GUITARIST}
		GUITARIST :UnHide
	endif
endscript

script UpdateHeroDifferenceAnim 
	if (<DifferenceAnim> = "")
	else
		FormatText ChecksumName = DifferenceAnimName '%s' S = <DifferenceAnim>
		if CompositeObjectExists \{Name = AnimTreePreviewObject}
			AnimTreePreviewObject :UpdateDifferenceAnim DifferenceAnimName = <DifferenceAnimName> differenceAnimAmount = <differenceAnimAmount>
		endif
	endif
endscript

script _TestAnimSequence 
	if GotParam \{Animations}
		CreateFakePlayer \{Skeleton = GH3_Guitar}
		begin
		GetArraySize <Animations>
		<Index> = 0
		begin
		FormatText ChecksumName = AnimName '%s' S = (<Animations> [<Index>].Anim) DontAssertForChecksums
		AnimTreePreviewObject :ModelViewer_PlayAnim {
			Anim = <AnimName>
			SPEED = (<Animations> [<Index>].SPEED)
			BlendPeriod = (<Animations> [<Index>].BlendPeriod)
		}
		if (<Index> = 0)
			AnimTreePreviewObject :Obj_ForceUpdate
		endif
		AnimTreePreviewObject :ModelViewer_WaitAnimFinished
		<Index> = (<Index> + 1)
		repeat <array_Size>
		if NOT GotParam \{CYCLE}
			break
		endif
		repeat
		Wait \{1
			Second}
		SpawnScriptLater \{UnHidePlayerAndDestroyFakes}
	endif
endscript

script TestAnimSequence 
	KillSpawnedScript \{Name = _TestAnimSequence}
	SpawnScriptLater _TestAnimSequence Params = <...>
endscript

script KillAnimPreviewRefs 
	UnHidePlayerAndDestroyFakes
endscript
