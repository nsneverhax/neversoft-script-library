
script UnHidePlayerAndDestroyFakes 
	killspawnedscript \{name = _TestAnimSequence}
	if CompositeObjectExists \{name = FakeCharacter}
		FakeCharacter :Die
	endif
	if CompositeObjectExists \{name = animtreepreviewobject}
		animtreepreviewobject :Die
	endif
endscript

script TestAnim \{Skeleton = GH3_Guitarist_Axel}
	if GotParam \{off}
		UnHidePlayerAndDestroyFakes
	else
		ReloadAndTestAnim <...> Skeleton = <Skeleton>
	endif
endscript

script ReloadAndTestAnim 
	killspawnedscript \{name = _TestAnimSequence}
	LaunchEvent \{type = DrawRequested
		data = {
			cycledown
		}}
	FormatText checksumname = AnimName '%s' s = <anim> DontAssertForChecksums
	if GotParam \{DifferenceAnim}
		if (<DifferenceAnim> = qs(0x03ac90f0))
		else
			FormatText checksumname = DifferenceAnimName '%s' s = <DifferenceAnim>
		endif
	endif
	CreateFake \{original = musician3
		Skeleton = GH3_Guitarist_Axel
		Pos = (0.0, 2.0, 2.0)}
	if GotParam \{Cycle}
		animtreepreviewobject :ModelViewer_PlayAnim anim = <AnimName> BlendPeriod = 0 speed = <speed> Cycle
	else
		animtreepreviewobject :ModelViewer_PlayAnim anim = <AnimName> BlendPeriod = 0 speed = <speed>
	endif
	if GotParam \{DifferenceAnim}
		animtreepreviewobject :Obj_PoseControllerCommand Command = PlaySequence DifferenceAnimName = <DifferenceAnimName> differenceAnimAmount = <differenceAnimAmount>
	endif
	animtreepreviewobject :Obj_ForceUpdate
endscript

script CreateFake 
	if NOT CompositeObjectExists name = <original>
		return
	endif
	if CompositeObjectExists \{name = animtreepreviewobject}
		animtreepreviewobject :Die
	endif
	UpdateAnimCache \{clear}
	<original> :Obj_GetQuat
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
				cloneFrom = <original>
			}
		]
		params = {
			skeletonName = <Skeleton>
			name = animtreepreviewobject
			Pos = <Pos>
			Orientation = <Quat>
		}
	}
	animtreepreviewobject :ModelViewer_InitAnimTree
endscript

script AnimTreePreview 
	AnimTreePreviewRestore
	printstruct <...>
	GetArraySize <trees>
	if (<array_size> > 0)
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
				SetArrayElement arrayName = trees index = <index> newValue = ((<trees> [<index>]) + {target_object = musician3})
			else
				SetArrayElement arrayName = trees index = <index> newValue = ((<trees> [<index>]) + {target_object = cas_player1})
			endif
		endif
		index = (<index> + 1)
		repeat <array_size>
	endif
	AnimTreePreview_NxCommon modelBuilderHeap = debugheap <...>
	if CompositeObjectExists \{musician3}
		musician3 :UnPause
		musician3 :Obj_SwitchScript \{guitarist_idle_animpreview}
		wait \{1
			gameframe}
		musician3 :Pause
	endif
	Change \{crowd_debug_mode = 1}
endscript

script AnimTreePreviewRestore 
	AnimTreePreviewRestore_NxCommon <...>
	Change \{crowd_debug_mode = 0}
	KillSkaterCamAnim \{name = anim_preview_cam}
endscript

script UpdateHeroDifferenceAnim 
	if (<DifferenceAnim> = qs(0x03ac90f0))
	else
		FormatText checksumname = DifferenceAnimName '%s' s = <DifferenceAnim>
		if CompositeObjectExists \{name = animtreepreviewobject}
			animtreepreviewobject :UpdateDifferenceAnim DifferenceAnimName = <DifferenceAnimName> differenceAnimAmount = <differenceAnimAmount>
		endif
	endif
endscript

script _TestAnimSequence 
	if GotParam \{Animations}
		CreateFakePlayer \{Skeleton = GH_Rocker_Male_original}
		begin
		GetArraySize <Animations>
		<index> = 0
		begin
		FormatText checksumname = AnimName '%s' s = (<Animations> [<index>].anim) DontAssertForChecksums
		animtreepreviewobject :ModelViewer_PlayAnim {
			anim = <AnimName>
			speed = (<Animations> [<index>].speed)
			BlendPeriod = (<Animations> [<index>].BlendPeriod)
		}
		if (<index> = 0)
			animtreepreviewobject :Obj_ForceUpdate
		endif
		animtreepreviewobject :ModelViewer_WaitAnimFinished
		<index> = (<index> + 1)
		repeat <array_size>
		if NOT GotParam \{Cycle}
			break
		endif
		repeat
		wait \{1
			second}
		spawnscriptlater \{UnHidePlayerAndDestroyFakes}
	endif
endscript

script TestAnimSequence 
	killspawnedscript \{name = _TestAnimSequence}
	spawnscriptlater _TestAnimSequence params = <...>
endscript

script killanimpreviewrefs 
	UnHidePlayerAndDestroyFakes
endscript
