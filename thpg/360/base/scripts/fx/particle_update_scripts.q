
script align_scale_to_vel_update objid = skater bone = bone_board_truck_back update_pos = 0 emit_offset = (0.0, 0.5, 0.0) emit_scale = -1.0 pos_offset = (0.0, -2.0, 0.0) base_vel = 800.0 min_vel_range = 4 max_vel_range = 8 base_emit_rate = 0.0
	pos0_offset = <pos_offset>
	<parentid> = <objid>
	begin
	if shouldemit
		<objid> :obj_getvelocity
		normalizevector <vel>
		<length> = (<length> / <base_vel>)
		setemittarget target = (<emit_offset> + (<emit_scale> * <norm>))
		setspeedrange min = (<min_vel_range> * <length>) max = (<max_vel_range> * <length>)
		emitrate rate = (<length> * <base_emit_rate>)
		if NOT (<update_pos> = 0)
			<x> = 0
			<y> = 0
			<z> = 0
			if gotparam get_bone_script
				<get_bone_script> objid = <parentid>
			endif
			<objid> :obj_getboneposition bone = <bone>
			<pos_offset> = (<pos0_offset> + <x> * (1.0, 0.0, 0.0))
			<pos_offset> = (<pos_offset> + <y> * (0.0, 1.0, 0.0))
			<pos_offset> = (<pos_offset> + <z> * (0.0, 0.0, 1.0))
			setpos pos = <pos_offset>
		endif
	else
		if (<base_emit_rate> > 0.0)
			<objid> :obj_getvelocity
			normalizevector <vel>
			<length> = (<length> / <base_vel>)
			emitrate rate = (<length> * <base_emit_rate>)
		endif
	endif
	wait 1 gameframe
	repeat
endscript

script align_scale_size_to_vel_update objid = skater bone = bone_board_truck_back update_pos = 0 emit_offset = (0.0, 0.5, 0.0) emit_scale = -1.0 pos_offset = (0.0, -2.0, 0.0) base_vel = 800.0 min_vel_range = 4 max_vel_range = 8 base_emit_rate = 0.0
	pos0_offset = <pos_offset>
	<parentid> = <objid>
	begin
	if shouldemit
		<objid> :obj_getvelocity
		normalizevector <vel>
		<length> = (<length> / <base_vel>)
		setemittarget target = (<emit_offset> + (<emit_scale> * <norm>))
		setspeedrange min = (<min_vel_range> * <length>) max = (<max_vel_range> * <length>)
		emitrate rate = (<length> * <base_emit_rate>)
		setparticlesizescale scalesize = <length>
		if NOT (<update_pos> = 0)
			<x> = 0
			<y> = 0
			<z> = 0
			if gotparam get_bone_script
				<get_bone_script> objid = <parentid>
			endif
			<objid> :obj_getboneposition bone = <bone>
			<pos_offset> = (<pos0_offset> + <x> * (1.0, 0.0, 0.0))
			<pos_offset> = (<pos_offset> + <y> * (0.0, 1.0, 0.0))
			<pos_offset> = (<pos_offset> + <z> * (0.0, 0.0, 1.0))
			setpos pos = <pos_offset>
		endif
	else
		if (<base_emit_rate> > 0.0)
			<objid> :obj_getvelocity
			normalizevector <vel>
			<length> = (<length> / <base_vel>)
			emitrate rate = (<length> * <base_emit_rate>)
		endif
	endif
	wait 1 gameframe
	repeat
endscript

script align_to_vel_update objid = skater bone = bone_board_truck_back update_pos = 0 emit_offset = (0.0, 0.5, 0.0) emit_scale = -1.0 pos_offset = (0.0, -2.0, 0.0)
	pos0_offset = <pos_offset>
	<parentid> = <objid>
	begin
	if shouldemit
		if compositeobjectexists name = <objid>
			<objid> :obj_getvelocity
			normalizevector <vel>
			setemittarget target = (<emit_offset> + (<emit_scale> * <norm>))
			if NOT (<update_pos> = 0)
				<x> = 0
				<y> = 0
				<z> = 0
				if gotparam get_bone_script
					<get_bone_script> objid = <parentid>
				endif
				<objid> :obj_getboneposition bone = <bone>
				<pos_offset> = (<pos0_offset> + <x> * (1.0, 0.0, 0.0))
				<pos_offset> = (<pos_offset> + <y> * (0.0, 1.0, 0.0))
				<pos_offset> = (<pos_offset> + <z> * (0.0, 0.0, 1.0))
				setpos pos = <pos_offset>
			endif
		endif
	endif
	wait 1 gameframe
	repeat
endscript

script align_to_obj_orient objid = skater bone = bone_board_truck_back update_pos = 0 pos_offset = (0.0, -2.0, 0.0) emit_scale = 1.0
	pos0_offset = <pos_offset>
	begin
	if shouldemit
		<objid> :obj_getorientation
		<orient> = ((<x> * (1.0, 0.0, 0.0)) + (<y> * (0.0, 1.0, 0.0)) + (<z> * (0.0, 0.0, 1.0)))
		normalizevector <orient>
		setemittarget target = ((<emit_scale> * <norm>))
		if NOT (<update_pos> = 0)
			<x> = 0
			<y> = 0
			<z> = 0
			<objid> :obj_getboneposition bone = <bone>
			<pos_offset> = (<pos0_offset> + <x> * (1.0, 0.0, 0.0))
			<pos_offset> = (<pos_offset> + <y> * (0.0, 1.0, 0.0))
			<pos_offset> = (<pos_offset> + <z> * (0.0, 0.0, 1.0))
			setpos pos = <pos_offset>
		endif
	endif
	wait 1 gameframe
	repeat
endscript

script emitrate_speed objid = skater minrate = 0 maxrate = 64 minspeed = 0 maxspeed = 12
	speeddiff = (<maxspeed> - <minspeed>)
	ratediff = (<maxrate> - <minrate>)
	if (<objid> = parent)
		lockobj_getparent
		objid = <parent>
	endif
	begin
	<objid> :obj_getvelocity
	normalizevector <vel>
	if (<length> < <minspeed>)
		newrate = <minrate>
	else
		if (<length> > <maxspeed>)
			newrate = <maxrate>
		else
			factor = ((<length> - <minspeed>) / <speeddiff>)
			newrate = (<minrate> + (<factor> * <ratediff>))
		endif
	endif
	emitrate rate = <newrate>
	wait 1 frame
	repeat
endscript

script emitrate_size_speed objid = skater minrate = 0 maxrate = 64 minstartsize = (0.4, 0.4) minendsize = (1.5, 1.5) maxstartsize = (0.8, 0.8) maxendsize = (3.0, 3.0) minspeed = 0 maxspeed = 12
	speeddiff = (<maxspeed> - <minspeed>)
	ratediff = (<maxrate> - <minrate>)
	sizediffstart = (<maxstartsize> - <minstartsize>)
	sizediffend = (<maxendsize> - <minendsize>)
	begin
	<objid> :obj_getvelocity
	normalizevector <vel>
	if (<length> < <minspeed>)
		newrate = <minrate>
		newstartsize = <minstartsize>
		newendsize = <minendsize>
	else
		if (<length> > <maxspeed>)
			newrate = <maxrate>
			newstartsize = <maxstartsize>
			newendsize = <maxendsize>
		else
			factor = ((<length> - <minspeed>) / <speeddiff>)
			newrate = (<minrate> + (<factor> * <ratediff>))
			newstartsize = (<minstartsize> + (<factor> * <sizediffstart>))
			newendsize = (<minendsize> + (<factor> * <sizediffend>))
		endif
	endif
	emitrate rate = <newrate>
	setparticlesize sw = (<newstartsize>.(1.0, 0.0)) sh = (<newstartsize>.(0.0, 1.0)) ew = (<newendsize>.(1.0, 0.0)) eh = (<newendsize>.(0.0, 1.0))
	wait 1 frame
	repeat
endscript

script rotdir_turn \{objid = skater
		minrot = 0.0
		maxrot = 0.3}
	begin
	if <objid> :isturningleft
		setrotate min = (-1 * <minrot>) max = (-1 * <maxrot>)
	elseif <objid> :isturningright
		setrotate min = <minrot> max = <maxrot>
	else
		setrotate min = (-1 * <minrot>) max = <minrot>
	endif
	wait \{0.1
		seconds}
	repeat
endscript
