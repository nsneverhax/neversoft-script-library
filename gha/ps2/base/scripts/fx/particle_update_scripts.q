
script align_scale_to_vel_update \{objID = skater
		bone = Bone_Board_Truck_Back
		update_pos = 0
		emit_offset = (0.0, 0.5, 0.0)
		emit_scale = -1.0
		pos_offset = (0.0, -2.0, 0.0)
		base_vel = 800.0
		min_vel_range = 4
		max_vel_range = 8
		base_emit_rate = 0.0}
	pos0_offset = <pos_offset>
	<parentId> = <objID>
	begin
	if ShouldEmit
		<objID> :Obj_GetVelocity
		NormalizeVector <vel>
		<length> = (<length> / <base_vel>)
		SetEmitTarget target = (<emit_offset> + (<emit_scale> * <norm>))
		SetSpeedRange min = (<min_vel_range> * <length>) Max = (<max_vel_range> * <length>)
		EmitRate rate = (<length> * <base_emit_rate>)
		if NOT (<update_pos> = 0)
			<X> = 0
			<y> = 0
			<z> = 0
			if GotParam \{get_bone_script}
				<get_bone_script> objID = <parentId>
			endif
			<objID> :Obj_GetBonePosition bone = <bone>
			<pos_offset> = (<pos0_offset> + <X> * (1.0, 0.0, 0.0))
			<pos_offset> = (<pos_offset> + <y> * (0.0, 1.0, 0.0))
			<pos_offset> = (<pos_offset> + <z> * (0.0, 0.0, 1.0))
			setpos Pos = <pos_offset>
		endif
	else
		if (<base_emit_rate> > 0.0)
			<objID> :Obj_GetVelocity
			NormalizeVector <vel>
			<length> = (<length> / <base_vel>)
			EmitRate rate = (<length> * <base_emit_rate>)
		endif
	endif
	WaitOneGameFrame
	repeat
endscript

script align_scale_size_to_vel_update \{objID = skater
		bone = Bone_Board_Truck_Back
		update_pos = 0
		emit_offset = (0.0, 0.5, 0.0)
		emit_scale = -1.0
		pos_offset = (0.0, -2.0, 0.0)
		base_vel = 800.0
		min_vel_range = 4
		max_vel_range = 8
		base_emit_rate = 0.0}
	pos0_offset = <pos_offset>
	<parentId> = <objID>
	begin
	if ShouldEmit
		<objID> :Obj_GetVelocity
		NormalizeVector <vel>
		<length> = (<length> / <base_vel>)
		SetEmitTarget target = (<emit_offset> + (<emit_scale> * <norm>))
		SetSpeedRange min = (<min_vel_range> * <length>) Max = (<max_vel_range> * <length>)
		EmitRate rate = (<length> * <base_emit_rate>)
		SetParticleSizeScale scaleSize = <length>
		if NOT (<update_pos> = 0)
			<X> = 0
			<y> = 0
			<z> = 0
			if GotParam \{get_bone_script}
				<get_bone_script> objID = <parentId>
			endif
			<objID> :Obj_GetBonePosition bone = <bone>
			<pos_offset> = (<pos0_offset> + <X> * (1.0, 0.0, 0.0))
			<pos_offset> = (<pos_offset> + <y> * (0.0, 1.0, 0.0))
			<pos_offset> = (<pos_offset> + <z> * (0.0, 0.0, 1.0))
			setpos Pos = <pos_offset>
		endif
	else
		if (<base_emit_rate> > 0.0)
			<objID> :Obj_GetVelocity
			NormalizeVector <vel>
			<length> = (<length> / <base_vel>)
			EmitRate rate = (<length> * <base_emit_rate>)
		endif
	endif
	WaitOneGameFrame
	repeat
endscript

script align_to_vel_update \{objID = skater
		bone = Bone_Board_Truck_Back
		update_pos = 0
		emit_offset = (0.0, 0.5, 0.0)
		emit_scale = -1.0
		pos_offset = (0.0, -2.0, 0.0)}
	pos0_offset = <pos_offset>
	<parentId> = <objID>
	begin
	if ShouldEmit
		if CompositeObjectExists Name = <objID>
			<objID> :Obj_GetVelocity
			NormalizeVector <vel>
			SetEmitTarget target = (<emit_offset> + (<emit_scale> * <norm>))
			if NOT (<update_pos> = 0)
				<X> = 0
				<y> = 0
				<z> = 0
				if GotParam \{get_bone_script}
					<get_bone_script> objID = <parentId>
				endif
				<objID> :Obj_GetBonePosition bone = <bone>
				<pos_offset> = (<pos0_offset> + <X> * (1.0, 0.0, 0.0))
				<pos_offset> = (<pos_offset> + <y> * (0.0, 1.0, 0.0))
				<pos_offset> = (<pos_offset> + <z> * (0.0, 0.0, 1.0))
				setpos Pos = <pos_offset>
			endif
		endif
	endif
	WaitOneGameFrame
	repeat
endscript

script align_to_obj_orient \{objID = skater
		bone = Bone_Board_Truck_Back
		update_pos = 0
		pos_offset = (0.0, -2.0, 0.0)
		emit_scale = 1.0}
	pos0_offset = <pos_offset>
	begin
	if ShouldEmit
		<objID> :Obj_GetOrientation
		<orient> = ((<X> * (1.0, 0.0, 0.0)) + (<y> * (0.0, 1.0, 0.0)) + (<z> * (0.0, 0.0, 1.0)))
		NormalizeVector <orient>
		SetEmitTarget target = ((<emit_scale> * <norm>))
		if NOT (<update_pos> = 0)
			<X> = 0
			<y> = 0
			<z> = 0
			<objID> :Obj_GetBonePosition bone = <bone>
			<pos_offset> = (<pos0_offset> + <X> * (1.0, 0.0, 0.0))
			<pos_offset> = (<pos_offset> + <y> * (0.0, 1.0, 0.0))
			<pos_offset> = (<pos_offset> + <z> * (0.0, 0.0, 1.0))
			setpos Pos = <pos_offset>
		endif
	endif
	WaitOneGameFrame
	repeat
endscript

script emitRate_Speed \{objID = skater
		minRate = 0
		maxRate = 64
		minSpeed = 0
		maxSpeed = 12}
	speedDiff = (<maxSpeed> - <minSpeed>)
	rateDiff = (<maxRate> - <minRate>)
	if (<objID> = parent)
		LockObj_GetParent

		objID = <parent>
	endif
	begin
	<objID> :Obj_GetVelocity
	NormalizeVector <vel>
	if (<length> < <minSpeed>)
		newRate = <minRate>
	else
		if (<length> > <maxSpeed>)
			newRate = <maxRate>
		else
			factor = ((<length> - <minSpeed>) / <speedDiff>)
			newRate = (<minRate> + (<factor> * <rateDiff>))
		endif
	endif
	EmitRate rate = <newRate>
	Wait \{1
		Frame}
	repeat
endscript

script emitRate_Size_Speed \{objID = skater
		minRate = 0
		maxRate = 64
		minStartSize = (0.4, 0.4)
		minEndSize = (1.5, 1.5)
		maxStartSize = (0.8, 0.8)
		maxEndSize = (3.0, 3.0)
		minSpeed = 0
		maxSpeed = 12}
	JOW_Stars \{'emitRate_Size_Speed'}
	speedDiff = (<maxSpeed> - <minSpeed>)
	rateDiff = (<maxRate> - <minRate>)
	JOW_Stars \{'calc size'}
	sizeDiffStart = (<maxStartSize> - <minStartSize>)
	sizeDiffEnd = (<maxEndSize> - <minEndSize>)

	JOW_Stars \{'begin'}
	begin
	<objID> :Obj_GetVelocity
	NormalizeVector <vel>
	if (<length> < <minSpeed>)
		newRate = <minRate>
		newSize = <minSize>
	else
		if (<length> > <maxSpeed>)
			newRate = <maxRate>
			newSize = <maxSize>
		else
			factor = ((<length> - <minSpeed>) / <speedDiff>)
			newRate = (<minRate> + (<factor> * <rateDiff>))
			newStartSize = (<minStartSize> + (<factor> * <sizeDiffStart>))
			newEndSize = (<minEndSize> + (<factor> * <sizeDiffEnd>))
		endif
	endif
	EmitRate rate = <newRate>
	SetParticleSize sw = (<newStartSize>.(1.0, 0.0)) sh = (<newStartSize>.(0.0, 1.0)) ew = (<newEndSize>.(1.0, 0.0)) eh = (<newEndSize>.(0.0, 1.0))
	Wait \{1
		Frame}
	repeat
endscript

script rotDir_Turn \{objID = skater
		minrot = 0.0
		maxrot = 0.3}
	begin
	if <objID> :IsTurningLeft
		SetRotate min = (-1 * <minrot>) Max = (-1 * <maxrot>)
	elseif <objID> :IsTurningRight
		SetRotate min = <minrot> Max = <maxrot>
	else
		SetRotate min = (-1 * <minrot>) Max = <minrot>
	endif
	Wait \{0.1
		Seconds}
	repeat
endscript

script starPower_Butterflies \{sMinW = 1.0
		sMaxW = 0.4
		eMinH = 0.2
		sMaxW = 0.1
		sMinH = 0.05
		sMaxH = 0.5
		eMinH = 0.02
		sMaxH = 0.1
		cycleTime = 0.5
		updateTime = 0.05}
	numSteps = (<cycleTime> / <updateTime>)
	sWStepSize = (2.0 * (<sMaxW> - <sMinW>) / <numSteps>)
	eWStepSize = (2.0 * (<eMaxW> - <eMinW>) / <numSteps>)
	sHStepSize = (2.0 * (<sMaxH> - <sMinH>) / <numSteps>)
	eHStepSize = (2.0 * (<eMaxH> - <eMinH>) / <numSteps>)
	f = <numSteps>
	CastToInteger \{f}
	f = (0.1 * RandomRange (0.0, 10.0) * <f>)
	sCurW = (<sMinW> + (<f> * <sHStepSize>))
	eCurW = (<eMinW> + (<f> * <sHStepSize>))
	sCurH = (<sMinH> + (<f> * <sHStepSize>))
	eCurH = (<eMinH> + (<f> * <sHStepSize>))
	factor = 1.0
	begin
	if (<sCurH> < <sMinH> || <eCurH> < <eMinH>)
		sCurW = <sMinW>
		eCurW = <eMinW>
		sCurH = <sMinH>
		eCurH = <eMinH>
		factor = (-1.0 * <factor>)
	elseif (<sCurH> > <sMaxH> || <eCurH> > <eMaxH>)
		sCurW = <sMaxW>
		eCurW = <eMaxW>
		sCurH = <sMaxH>
		eCurH = <eMaxH>
		factor = (-1.0 * <factor>)
	endif
	SetParticleSize sw = <sCurW> ew = <eCurW> sh = <sCurH> eh = <eCurH>
	sCurW = (<sCurW> + (<factor> * <sWStepSize>))
	eCurW = (<eCurW> + (<factor> * <eWStepSize>))
	sCurH = (<sCurH> + (<factor> * <sHStepSize>))
	eCurH = (<eCurH> + (<factor> * <eHStepSize>))
	Wait <updateTime> Seconds
	repeat
endscript
