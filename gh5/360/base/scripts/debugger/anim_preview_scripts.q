
script UnHidePlayerAndDestroyFakes 
	KillSpawnedScript \{Name = _TestAnimSequence}
	if CompositeObjectExists \{Name = FakeCharacter}
		FakeCharacter :Die
	endif
	if CompositeObjectExists \{Name = AnimTreePreviewObject}
		AnimTreePreviewObject :Die
	endif
endscript

script TestAnim \{Skeleton = GH3_guitarist_axel}
	if GotParam \{OFF}
		UnHidePlayerAndDestroyFakes
	else
		ReloadAndTestAnim <...> Skeleton = <Skeleton>
	endif
endscript

script ReloadAndTestAnim 
	KillSpawnedScript \{Name = _TestAnimSequence}
	LaunchEvent \{Type = DrawRequested
		data = {
			cycledown
		}}
	formatText checksumName = AnimName '%s' s = <anim> DontAssertForChecksums
	if GotParam \{DifferenceAnim}
		if (<DifferenceAnim> = qs(0x03ac90f0))
		else
			formatText checksumName = DifferenceAnimName '%s' s = <DifferenceAnim>
		endif
	endif
	CreateFake \{Original = musician3
		Skeleton = GH3_guitarist_axel
		Pos = (0.0, 2.0, 2.0)}
	if GotParam \{cycle}
		AnimTreePreviewObject :ModelViewer_PlayAnim anim = <AnimName> BlendPeriod = 0 speed = <speed> cycle
	else
		AnimTreePreviewObject :ModelViewer_PlayAnim anim = <AnimName> BlendPeriod = 0 speed = <speed>
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
		AnimTreePreviewObject :Die
	endif
	UpdateAnimCache \{CLEAR}
	<Original> :Obj_GetQuat
	CreateCompositeObject {
		components = [
			{
				component = Suspend
			}
			{
				component = AnimTree
			}
			{
				component = Skeleton
			}
			{
				component = SetDisplayMatrix
			}
			{
				component = Model
				cloneFrom = <Original>
			}
		]
		params = {
			skeletonname = <Skeleton>
			Name = AnimTreePreviewObject
			Pos = <Pos>
			orientation = <Quat>
		}
	}
	AnimTreePreviewObject :ModelViewer_InitAnimTree
endscript

script AnimTreePreview 
	AnimTreePreviewRestore
	printstruct <...>
	GetArraySize <trees>
	if (<array_Size> > 0)
		index = 0
		begin
		use_default = 0
		if NOT StructureContains structure = (<trees> [<index>]) target_object
			use_default = 1
		endif
		if (((<trees> [<index>]).target_object) = Default)
			use_default = 1
		endif
		if (<use_default> = 1)
			if CompositeObjectExists \{musician3}
				SetArrayElement ArrayName = trees index = <index> NewValue = ((<trees> [<index>]) + {target_object = musician3})
			else
				SetArrayElement ArrayName = trees index = <index> NewValue = ((<trees> [<index>]) + {target_object = cas_player1})
			endif
		endif
		index = (<index> + 1)
		repeat <array_Size>
	endif
	AnimTreePreview_NxCommon modelbuilderheap = debugheap <...>
	if CompositeObjectExists \{musician3}
		musician3 :Unpause
		musician3 :Obj_SwitchScript \{guitarist_idle_animpreview}
		Wait \{1
			gameframe}
		musician3 :Pause
	endif
	Change \{crowd_debug_mode = 1}
endscript

script AnimTreePreviewRestore 
	animtreepreviewrestore_nxcommon <...>
	Change \{crowd_debug_mode = 0}
	KillSkaterCamAnim \{Name = anim_preview_cam}
endscript

script UpdateHeroDifferenceAnim 
	if (<DifferenceAnim> = qs(0x03ac90f0))
	else
		formatText checksumName = DifferenceAnimName '%s' s = <DifferenceAnim>
		if CompositeObjectExists \{Name = AnimTreePreviewObject}
			AnimTreePreviewObject :UpdateDifferenceAnim DifferenceAnimName = <DifferenceAnimName> differenceAnimAmount = <differenceAnimAmount>
		endif
	endif
endscript

script _TestAnimSequence 
	if GotParam \{Animations}
		CreateFakePlayer \{Skeleton = gh_rocker_male_original}
		begin
		GetArraySize <Animations>
		<index> = 0
		begin
		formatText checksumName = AnimName '%s' s = (<Animations> [<index>].anim) DontAssertForChecksums
		AnimTreePreviewObject :ModelViewer_PlayAnim {
			anim = <AnimName>
			speed = (<Animations> [<index>].speed)
			BlendPeriod = (<Animations> [<index>].BlendPeriod)
		}
		if (<index> = 0)
			AnimTreePreviewObject :Obj_ForceUpdate
		endif
		AnimTreePreviewObject :ModelViewer_WaitAnimFinished
		<index> = (<index> + 1)
		repeat <array_Size>
		if NOT GotParam \{cycle}
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
	SpawnScriptLater _TestAnimSequence params = <...>
endscript

script killanimpreviewrefs 
	UnHidePlayerAndDestroyFakes
endscript
