
script align_scale_to_vel_update \{ObjID = Skater
		Bone = Bone_Board_Truck_Back
		update_pos = 0
		emit_offset = (0.0, 0.5, 0.0)
		emit_scale = -1.0
		pos_offset = (0.0, -2.0, 0.0)
		base_vel = 800.0
		min_vel_range = 4
		max_vel_range = 8
		base_emit_rate = 0.0}
	pos0_offset = <pos_offset>
	<parentId> = <ObjID>
	begin
	if ShouldEmit
		<ObjID> :Obj_GetVelocity
		NormalizeVector <vel>
		<Length> = (<Length> / <base_vel>)
		SetEmitTarget Target = (<emit_offset> + (<emit_scale> * <norm>))
		SetSpeedRange Min = (<min_vel_range> * <Length>) MAX = (<max_vel_range> * <Length>)
		EmitRate RATE = (<Length> * <base_emit_rate>)
		if NOT (<update_pos> = 0)
			<X> = 0
			<Y> = 0
			<Z> = 0
			if GotParam \{get_bone_script}
				<get_bone_script> ObjID = <parentId>
			endif
			<ObjID> :Obj_GetBonePosition Bone = <Bone>
			<pos_offset> = (<pos0_offset> + <X> * (1.0, 0.0, 0.0))
			<pos_offset> = (<pos_offset> + <Y> * (0.0, 1.0, 0.0))
			<pos_offset> = (<pos_offset> + <Z> * (0.0, 0.0, 1.0))
			setpos Pos = <pos_offset>
		endif
	else
		if (<base_emit_rate> > 0.0)
			<ObjID> :Obj_GetVelocity
			NormalizeVector <vel>
			<Length> = (<Length> / <base_vel>)
			EmitRate RATE = (<Length> * <base_emit_rate>)
		endif
	endif
	Wait \{1
		GameFrame}
	repeat
endscript

script align_scale_size_to_vel_update \{ObjID = Skater
		Bone = Bone_Board_Truck_Back
		update_pos = 0
		emit_offset = (0.0, 0.5, 0.0)
		emit_scale = -1.0
		pos_offset = (0.0, -2.0, 0.0)
		base_vel = 800.0
		min_vel_range = 4
		max_vel_range = 8
		base_emit_rate = 0.0}
	pos0_offset = <pos_offset>
	<parentId> = <ObjID>
	begin
	if ShouldEmit
		<ObjID> :Obj_GetVelocity
		NormalizeVector <vel>
		<Length> = (<Length> / <base_vel>)
		SetEmitTarget Target = (<emit_offset> + (<emit_scale> * <norm>))
		SetSpeedRange Min = (<min_vel_range> * <Length>) MAX = (<max_vel_range> * <Length>)
		EmitRate RATE = (<Length> * <base_emit_rate>)
		SetParticleSizeScale scaleSize = <Length>
		if NOT (<update_pos> = 0)
			<X> = 0
			<Y> = 0
			<Z> = 0
			if GotParam \{get_bone_script}
				<get_bone_script> ObjID = <parentId>
			endif
			<ObjID> :Obj_GetBonePosition Bone = <Bone>
			<pos_offset> = (<pos0_offset> + <X> * (1.0, 0.0, 0.0))
			<pos_offset> = (<pos_offset> + <Y> * (0.0, 1.0, 0.0))
			<pos_offset> = (<pos_offset> + <Z> * (0.0, 0.0, 1.0))
			setpos Pos = <pos_offset>
		endif
	else
		if (<base_emit_rate> > 0.0)
			<ObjID> :Obj_GetVelocity
			NormalizeVector <vel>
			<Length> = (<Length> / <base_vel>)
			EmitRate RATE = (<Length> * <base_emit_rate>)
		endif
	endif
	Wait \{1
		GameFrame}
	repeat
endscript

script align_to_vel_update \{ObjID = Skater
		Bone = Bone_Board_Truck_Back
		update_pos = 0
		emit_offset = (0.0, 0.5, 0.0)
		emit_scale = -1.0
		pos_offset = (0.0, -2.0, 0.0)}
	pos0_offset = <pos_offset>
	<parentId> = <ObjID>
	begin
	if ShouldEmit
		if CompositeObjectExists Name = <ObjID>
			<ObjID> :Obj_GetVelocity
			NormalizeVector <vel>
			SetEmitTarget Target = (<emit_offset> + (<emit_scale> * <norm>))
			if NOT (<update_pos> = 0)
				<X> = 0
				<Y> = 0
				<Z> = 0
				if GotParam \{get_bone_script}
					<get_bone_script> ObjID = <parentId>
				endif
				<ObjID> :Obj_GetBonePosition Bone = <Bone>
				<pos_offset> = (<pos0_offset> + <X> * (1.0, 0.0, 0.0))
				<pos_offset> = (<pos_offset> + <Y> * (0.0, 1.0, 0.0))
				<pos_offset> = (<pos_offset> + <Z> * (0.0, 0.0, 1.0))
				setpos Pos = <pos_offset>
			endif
		endif
	endif
	Wait \{1
		GameFrame}
	repeat
endscript

script align_to_obj_orient \{ObjID = Skater
		Bone = Bone_Board_Truck_Back
		update_pos = 0
		pos_offset = (0.0, -2.0, 0.0)
		emit_scale = 1.0}
	pos0_offset = <pos_offset>
	begin
	if ShouldEmit
		<ObjID> :Obj_GetOrientation
		<Orient> = ((<X> * (1.0, 0.0, 0.0)) + (<Y> * (0.0, 1.0, 0.0)) + (<Z> * (0.0, 0.0, 1.0)))
		NormalizeVector <Orient>
		SetEmitTarget Target = ((<emit_scale> * <norm>))
		if NOT (<update_pos> = 0)
			<X> = 0
			<Y> = 0
			<Z> = 0
			<ObjID> :Obj_GetBonePosition Bone = <Bone>
			<pos_offset> = (<pos0_offset> + <X> * (1.0, 0.0, 0.0))
			<pos_offset> = (<pos_offset> + <Y> * (0.0, 1.0, 0.0))
			<pos_offset> = (<pos_offset> + <Z> * (0.0, 0.0, 1.0))
			setpos Pos = <pos_offset>
		endif
	endif
	Wait \{1
		GameFrame}
	repeat
endscript

script emitRate_Speed \{ObjID = Skater
		minRate = 0
		maxRate = 64
		minSpeed = 0
		maxSpeed = 12}
	speedDiff = (<maxSpeed> - <minSpeed>)
	rateDiff = (<maxRate> - <minRate>)
	if (<ObjID> = PARENT)
		LockObj_GetParent
		PrintStruct <PARENT>
		ObjID = <PARENT>
	endif
	begin
	<ObjID> :Obj_GetVelocity
	NormalizeVector <vel>
	if (<Length> < <minSpeed>)
		newRate = <minRate>
	else
		if (<Length> > <maxSpeed>)
			newRate = <maxRate>
		else
			factor = ((<Length> - <minSpeed>) / <speedDiff>)
			newRate = (<minRate> + (<factor> * <rateDiff>))
		endif
	endif
	EmitRate RATE = <newRate>
	Wait \{1
		Frame}
	repeat
endscript

script emitRate_Size_Speed \{ObjID = Skater
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
	PrintStruct <...>
	JOW_Stars \{'begin'}
	begin
	<ObjID> :Obj_GetVelocity
	NormalizeVector <vel>
	if (<Length> < <minSpeed>)
		newRate = <minRate>
		newSize = <minSize>
	else
		if (<Length> > <maxSpeed>)
			newRate = <maxRate>
			newSize = <maxSize>
		else
			factor = ((<Length> - <minSpeed>) / <speedDiff>)
			newRate = (<minRate> + (<factor> * <rateDiff>))
			newStartSize = (<minStartSize> + (<factor> * <sizeDiffStart>))
			newEndSize = (<minEndSize> + (<factor> * <sizeDiffEnd>))
		endif
	endif
	EmitRate RATE = <newRate>
	SetParticleSize sw = (<newStartSize>.(1.0, 0.0)) Sh = (<newStartSize>.(0.0, 1.0)) ew = (<newEndSize>.(1.0, 0.0)) Eh = (<newEndSize>.(0.0, 1.0))
	Wait \{1
		Frame}
	repeat
endscript

script rotDir_Turn \{ObjID = Skater
		minRot = 0.0
		maxRot = 0.3}
	begin
	if <ObjID> :IsTurningLeft
		SetRotate Min = (-1 * <minRot>) MAX = (-1 * <maxRot>)
	elseif <ObjID> :IsTurningRight
		SetRotate Min = <minRot> MAX = <maxRot>
	else
		SetRotate Min = (-1 * <minRot>) MAX = <minRot>
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
	F = <numSteps>
	CastToInteger \{F}
	F = (0.1 * RandomRange (0.0, 10.0) * <F>)
	sCurW = (<sMinW> + (<F> * <sHStepSize>))
	eCurW = (<eMinW> + (<F> * <sHStepSize>))
	sCurH = (<sMinH> + (<F> * <sHStepSize>))
	eCurH = (<eMinH> + (<F> * <sHStepSize>))
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
	SetParticleSize sw = <sCurW> ew = <eCurW> Sh = <sCurH> Eh = <eCurH>
	sCurW = (<sCurW> + (<factor> * <sWStepSize>))
	eCurW = (<eCurW> + (<factor> * <eWStepSize>))
	sCurH = (<sCurH> + (<factor> * <sHStepSize>))
	eCurH = (<eCurH> + (<factor> * <eHStepSize>))
	Wait <updateTime> Seconds
	repeat
endscript
