
script dismember bone = bone_head maxVel = 200 maxrotvel = 4
	obj_getid
	BodyChunkName = (<bone> + <objid>)
	if compositeobjectexists name = <BodyChunkName>
		<BodyChunkName> :die
	endif
	obj_getposition
	obj_getboneposition bone = <bone>
	ModelOffset = (<pos> - <x> * (1.0, 0.0, 0.0) - <y> * (0.0, 1.0, 0.0) - <z> * (0.0, 0.0, 1.0))
	obj_getquat
	createcompositeobject components = BodyChunkComponents params = {
		name = <BodyChunkName>
		pos = <pos>
		orientation = <quat>
		clonefrom = <objid>
		copyskeletonfrom = <objid>
		model_offset = <ModelOffset>
	}
	vel = (<maxVel> * RandomRange (-1.1, 1.1) * (1.0, 0.0, 0.0)
		+ <maxVel> * RandomRange (0.0, 1.1) * (0.0, 1.0, 0.0)
		+ <maxVel> * RandomRange (-1.1, 1.1) * (0.0, 0.0, 1.0)
	)
	rotvel = (<maxrotvel> * RandomRange (-1.1, 1.1) * (1.0, 0.0, 0.0)
		+ <maxrotvel> * RandomRange (-1.1, 1.1) * (0.0, 1.0, 0.0)
		+ <maxrotvel> * RandomRange (-1.1, 1.1) * (0.0, 0.0, 1.0)
	)
	<BodyChunkName> :rigidbody_kick vel = <vel> rotvel = <rotvel>
	<BodyChunkName> :obj_setbonescale bone = <bone> scale = 0.0 propagate_reverse force_update
	obj_setbonescale bone = <bone> scale = 0.0 propagate
	<BodyChunkName> :obj_updatemodel
endscript
BodyChunkComponents = [
	{
		component = suspend
	}
	{
		component = waitanddie
		lifetime = 3
	}
	{
		component = rigidbody
		box
		dimensions = (20.0, 20.0, 20.0)
	}
	{
		component = skeleton
	}
	{
		component = model
	}
]

script make_skater_explode frames = 5
	GetCurrentSkaterProfileIndex
	GetSkaterNumber
	stored_scales = [
		{group = head_bone_group x = 100 y = 100 z = 100}
		{group = headtop_bone_group x = 100 y = 100 z = 100}
		{group = nose_bone_group x = 100 y = 100 z = 100}
		{group = Jaw_bone_group x = 100 y = 100 z = 100}
		{group = stomach_bone_group x = 100 y = 100 z = 100}
		{group = torso_bone_group x = 100 y = 100 z = 100}
		{group = upper_arm_bone_group x = 100 y = 100 z = 100}
		{group = lower_arm_bone_group x = 100 y = 100 z = 100}
		{group = hands_bone_group x = 100 y = 100 z = 100}
		{group = upper_leg_bone_group x = 100 y = 100 z = 100}
		{group = lower_leg_bone_group x = 100 y = 100 z = 100}
		{group = feet_bone_group x = 100 y = 100 z = 100}
		{group = board_bone_group x = 100 y = 100 z = 100}
	]
	getarraysize <stored_scales>
	index = 0
	begin
	scalingmenu_get_xyz part = (<stored_scales> [<index>].group)
	setarrayelement arrayname = stored_scales index = <index> newvalue = {group = (<stored_scales> [<index>].group) x = <x> y = <y> z = <z>}
	index = (<index> + 1)
	repeat <array_size>
	onexitrun make_skater_explode_exit
	obj_spawnscriptlater make_skater_explode_cleanup params = <...>
	dismember bone = bone_head
	dismember bone = bone_bicep_r
	dismember bone = bone_bicep_l
	dismember bone = bone_thigh_r
	dismember bone = bone_thigh_l
	wait <frames> gameframes
	dismember bone = bone_pelvis
	wait 2 seconds
endscript

script make_skater_explode_exit 
	obj_getid
	launchevent type = CleanupSkaterExplode target = <objid>
endscript

script make_skater_explode_cleanup 
	waitforevent \{type = CleanupSkaterExplode}
	index = 0
	begin
	SetPlayerAppearanceScale {
		player = <currentskaterprofileindex>
		part = (<stored_scales> [<index>].group)
		x = ((<stored_scales> [<index>]).x)
		y = ((<stored_scales> [<index>]).y)
		z = ((<stored_scales> [<index>]).z)
	}
	index = (<index> + 1)
	repeat <array_size>
	RefreshSkaterScale skater = <skaternumber> profile = <currentskaterprofileindex>
endscript

script make_skater_lose_head 
	GetCurrentSkaterProfileIndex
	GetSkaterNumber
	stored_scales = [
		{group = head_bone_group x = 100 y = 100 z = 100}
		{group = headtop_bone_group x = 100 y = 100 z = 100}
		{group = nose_bone_group x = 100 y = 100 z = 100}
		{group = Jaw_bone_group x = 100 y = 100 z = 100}
	]
	getarraysize <stored_scales>
	index = 0
	begin
	scalingmenu_get_xyz part = (<stored_scales> [<index>].group)
	setarrayelement arrayname = stored_scales index = <index> newvalue = {group = (<stored_scales> [<index>].group) x = <x> y = <y> z = <z>}
	index = (<index> + 1)
	repeat <array_size>
	onexitrun make_skater_lose_head_exit
	obj_spawnscriptlater make_skater_lose_head_cleanup params = <...>
	dismember bone = bone_head
	skater_waitanimfinished
	launchevent type = SkaterLoseHeadCleanup
	onexitrun
	skater_playanim anim = WStandIdle3 speed = 2.0
endscript

script make_skater_lose_head_exit 
	obj_getid
	launchevent type = SkaterLoseHeadCleanup target = <objid>
endscript

script make_skater_lose_head_cleanup 
	waitforevent type = SkaterLoseHeadCleanup
	scale = 0.0
	begin
	scale = (<scale> + 0.02)
	if (<scale> > 1.0)
		scale = 1.0
	endif
	index = 0
	begin
	SetPlayerAppearanceScale {
		player = <currentskaterprofileindex>
		part = (<stored_scales> [<index>].group)
		x = (<scale> * ((<stored_scales> [<index>]).x))
		y = (<scale> * ((<stored_scales> [<index>]).y))
		z = (<scale> * ((<stored_scales> [<index>]).z))
	}
	index = (<index> + 1)
	repeat <array_size>
	RefreshSkaterScale skater = <skaternumber> profile = <currentskaterprofileindex>
	if (<scale> = 1.0)
		break
	endif
	wait 1 gameframes
	repeat
	skater_waitanimfinished
endscript
