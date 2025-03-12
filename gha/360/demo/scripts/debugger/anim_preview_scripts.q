
script unhideplayeranddestroyfakes 
	killspawnedscript \{name = _testanimsequence}
	if compositeobjectexists \{name = fakecharacter}
		fakecharacter :die
	endif
	if compositeobjectexists \{name = animtreepreviewobject}
		animtreepreviewobject :die
	endif
endscript

script testanim \{skeleton = gh3_guitarist_axel}
	if gotparam \{off}
		unhideplayeranddestroyfakes
	else
		reloadandtestanim <...> skeleton = <skeleton>
	endif
endscript

script reloadandtestanim 
	killspawnedscript \{name = _testanimsequence}
	launchevent \{type = drawrequested
		data = {
			cycledown
		}}
	formattext checksumname = animname '%s' s = <anim> dontassertforchecksums
	if gotparam \{differenceanim}
		if (<differenceanim> = "")
		else
			formattext checksumname = differenceanimname '%s' s = <differenceanim>
		endif
	endif
	createfake \{original = guitarist
		skeleton = gh3_guitarist_axel
		pos = (0.0, 2.0, 2.0)}
	if gotparam \{cycle}
		animtreepreviewobject :modelviewer_playanim anim = <animname> blendperiod = 0 speed = <speed> cycle
	else
		animtreepreviewobject :modelviewer_playanim anim = <animname> blendperiod = 0 speed = <speed>
	endif
	if gotparam \{differenceanim}
		animtreepreviewobject :obj_posecontrollercommand command = playsequence differenceanimname = <differenceanimname> differenceanimamount = <differenceanimamount>
	endif
	animtreepreviewobject :obj_forceupdate
endscript

script createfake 
	if NOT compositeobjectexists name = <original>
		return
	endif
	if compositeobjectexists \{name = animtreepreviewobject}
		animtreepreviewobject :die
	endif
	updateanimcache \{clear}
	<original> :obj_getquat
	createcompositeobject {
		components = [
			{
				component = suspend
			}
			{
				component = animtree
			}
			{
				component = skeleton
			}
			{
				component = setdisplaymatrix
			}
			{
				component = model
				clonefrom = <original>
			}
		]
		params = {
			skeletonname = <skeleton>
			name = animtreepreviewobject
			pos = <pos>
			orientation = <quat>
		}
	}
	animtreepreviewobject :modelviewer_initanimtree
endscript

script animtreepreview 
	animtreepreview_nxcommon targetobject = guitarist ragdoll = ragdoll_ped <...>
	if NOT compositeobjectexists \{animtreepreviewobject}
		return
	endif
	animtreepreviewobject :unpause
	if compositeobjectexists \{guitarist}
		guitarist :unpause
		guitarist :obj_switchscript \{guitarist_idle_animpreview}
		wait \{1
			gameframe}
		guitarist :pause
	endif
	change \{crowd_debug_mode = 1}
	playigccam \{name = anim_preview_cam
		lockto = guitarist
		pos = (-0.9129459, 2.0256813, 2.383587)
		quat = (0.045517996, 0.963656, -0.18475299)
		fov = 72.0
		play_hold
		interrupt_current}
endscript

script animtreepreviewrestore 
	unhideplayeranddestroyfakes
	change \{crowd_debug_mode = 0}
	killskatercamanim \{name = anim_preview_cam}
	if compositeobjectexists \{guitarist}
		guitarist :unhide
	endif
endscript

script updateherodifferenceanim 
	if (<differenceanim> = "")
	else
		formattext checksumname = differenceanimname '%s' s = <differenceanim>
		if compositeobjectexists \{name = animtreepreviewobject}
			animtreepreviewobject :updatedifferenceanim differenceanimname = <differenceanimname> differenceanimamount = <differenceanimamount>
		endif
	endif
endscript

script _testanimsequence 
	if gotparam \{animations}
		createfakeplayer \{skeleton = gh3_guitar}
		begin
		getarraysize <animations>
		<index> = 0
		begin
		formattext checksumname = animname '%s' s = (<animations> [<index>].anim) dontassertforchecksums
		animtreepreviewobject :modelviewer_playanim {
			anim = <animname>
			speed = (<animations> [<index>].speed)
			blendperiod = (<animations> [<index>].blendperiod)
		}
		if (<index> = 0)
			animtreepreviewobject :obj_forceupdate
		endif
		animtreepreviewobject :modelviewer_waitanimfinished
		<index> = (<index> + 1)
		repeat <array_size>
		if NOT gotparam \{cycle}
			break
		endif
		repeat
		wait \{1
			second}
		spawnscriptlater \{unhideplayeranddestroyfakes}
	endif
endscript

script testanimsequence 
	killspawnedscript \{name = _testanimsequence}
	spawnscriptlater _testanimsequence params = <...>
endscript

script killanimpreviewrefs 
	unhideplayeranddestroyfakes
endscript
