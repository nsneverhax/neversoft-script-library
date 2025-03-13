
script bandmember_sillhouette \{bandmember = vocalist
		flarepos = backleft
		flarecolor = [
			255
			255
			255
			200
		]}
	getpakmancurrentname \{map = zones}
	formattext checksumname = venue_bm_flare '%s_GFX_BM_Sill_Flare_01' s = <pakname> addtostringlookup = true
	switch <bandmember>
		case guitarist
		formattext checksumname = startnode '%s_GFX_StartNodeRef_guitarist' s = <pakname> addtostringlookup = true
		case vocalist
		formattext checksumname = startnode '%s_GFX_StartNodeRef_vocalist' s = <pakname> addtostringlookup = true
		case bassist
		formattext checksumname = startnode '%s_GFX_StartNodeRef_bassist' s = <pakname> addtostringlookup = true
		case drummer
		formattext checksumname = startnode '%s_GFX_StartNodeRef_drummer' s = <pakname> addtostringlookup = true
	endswitch
	if NOT iscreated <startnode>
		return
	endif
	if NOT iscreated <venue_bm_flare>
		return
	endif
	switch <flarepos>
		case backleft
		<venue_bm_flare> :obj_locktoobject objectname = <startnode> (-1.66, 1.938, -0.73199993)
		spawnscript bandmember_sillhouette_flarecolor params = {venueflare = <venue_bm_flare> flarecolor = <flarecolor>}
		case backcenter
		<venue_bm_flare> :obj_locktoobject objectname = <startnode> (0.0, 2.2, -1.0)
		spawnscript bandmember_sillhouette_flarecolor params = {venueflare = <venue_bm_flare> flarecolor = <flarecolor>}
		case backright
		<venue_bm_flare> :obj_locktoobject objectname = <startnode> (2.0609999, 1.8449999, -0.953)
		spawnscript bandmember_sillhouette_flarecolor params = {venueflare = <venue_bm_flare> flarecolor = <flarecolor>}
		case frontleft
		<venue_bm_flare> :obj_locktoobject objectname = <startnode> (-1.66, 0.64400005, 1.423)
		spawnscript bandmember_sillhouette_flarecolor params = {venueflare = <venue_bm_flare> flarecolor = <flarecolor>}
		case frontright
		<venue_bm_flare> :obj_locktoobject objectname = <startnode> (2.0609999, 0.73899996, 1.806)
		spawnscript bandmember_sillhouette_flarecolor params = {venueflare = <venue_bm_flare> flarecolor = <flarecolor>}
		default
		spawnscript bandmember_sillhouette_turnoffflare params = {venueflare = <venue_bm_flare>}
	endswitch
endscript

script bandmember_sillhouette_turnonflare 
	changepasscolor {
		objid = <venueflare>
		material = bm_silhouetteflares_sub_backleft
		parameter = m_pspass0materialcolor
		startcolor = [0 0 0 0]
		endcolor = [255 255 255 128]
		time = 0.2
	}
endscript

script bandmember_sillhouette_flarecolor 
	changepasscolor {
		objid = <venueflare>
		material = bm_silhouetteflares_sub_backleft
		parameter = m_pspass0materialcolor
		startcolor = [0 0 0 0]
		endcolor = <flarecolor>
		time = 0.2
	}
endscript

script bandmember_sillhouette_turnoffflare 
	getpakmancurrentname \{map = zones}
	formattext checksumname = venue_bm_flare '%s_GFX_BM_Sill_Flare_01' s = <pakname> addtostringlookup = true
	if NOT iscreated <venue_bm_flare>
		return
	endif
	changepasscolor {
		objid = <venue_bm_flare>
		material = bm_silhouetteflares_sub_backleft
		parameter = m_pspass0materialcolor
		startcolor = [255 255 255 128]
		endcolor = [0 0 0 0]
		time = 0.1
	}
endscript

script testtargetmove 
	z_punkstage_gfx_lh_frontspot01 :lightvolume_setfollowtargetname \{name = z_punkstage_gfx_testtarget}
	z_punkstage_gfx_testtarget :obj_movetopos \{(-4.3510904, 1.05167, 6.3861904)
		time = 2}
endscript

script bandmembermoments_pyro \{bandmember = vocalist
		pyrotype = flames
		pyropos = backleft
		timemultiplier = 1.0}
	getpakmancurrentname \{map = zones}
	switch <bandmember>
		case guitarist
		formattext checksumname = startnode '%s_GFX_StartNodeRef_guitarist' s = <pakname> addtostringlookup = true
		case vocalist
		formattext checksumname = startnode '%s_GFX_StartNodeRef_vocalist' s = <pakname> addtostringlookup = true
		case bassist
		formattext checksumname = startnode '%s_GFX_StartNodeRef_bassist' s = <pakname> addtostringlookup = true
		case drummer
		formattext checksumname = startnode '%s_GFX_StartNodeRef_drummer' s = <pakname> addtostringlookup = true
	endswitch
	if NOT iscreated <startnode>
		return
	endif
	<front> = 0
	switch <pyropos>
		case backleft
		<pyropos1> = (-2.0, 0.0, 0.0)
		<pyropos2> = (-0.8, 0.0, -1.0)
		<pyropos3> = (-2.0, 0.0, -1.0)
		<pyropos4> = (-0.8, 0.0, -3.0)
		switch <pyrotype>
			case sparks
			spawnscript bandmember_sillhouette_pyro_sparks params = {pos1 = <pyropos1> pos2 = <pyropos2> pos3 = <pyropos3> pos4 = <pyropos4> front = 0 startnode = <startnode>}
			case flames
			spawnscript bandmember_sillhouette_pyro_flames {
				params = {
					pos1 = <pyropos1>
					pos2 = <pyropos2>
					pos3 = <pyropos3>
					pos4 = <pyropos4>
					startnode = <startnode>
					front = 0
					newtime = <timemultiplier>
				}
			}
			case `default`
		endswitch
		case backcenter
		<pyropos1> = (1.0, 0.0, -2.0)
		<pyropos2> = (-1.0, 0.0, -2.0)
		<pyropos3> = (0.3, 0.0, -2.0)
		<pyropos4> = (-0.3, 0.0, -2.0)
		switch <pyrotype>
			case sparks
			spawnscript bandmember_sillhouette_pyro_sparks params = {pos1 = <pyropos1> pos2 = <pyropos2> pos3 = <pyropos3> pos4 = <pyropos4> front = 0 startnode = <startnode>}
			case flames
			spawnscript bandmember_sillhouette_pyro_flames {
				params = {
					pos1 = <pyropos1>
					pos2 = <pyropos2>
					pos3 = <pyropos3>
					pos4 = <pyropos4>
					startnode = <startnode>
					front = 0
					newtime = <timemultiplier>
				}
			}
			case `default`
		endswitch
		case backright
		<pyropos1> = (2.0, 0.0, 0.0)
		<pyropos2> = (0.8, 0.0, -1.0)
		<pyropos3> = (2.0, 0.0, -1.0)
		<pyropos4> = (0.8, 0.0, -3.0)
		switch <pyrotype>
			case sparks
			spawnscript bandmember_sillhouette_pyro_sparks params = {pos1 = <pyropos1> pos2 = <pyropos2> pos3 = <pyropos3> pos4 = <pyropos4> front = 0 startnode = <startnode>}
			case flames
			spawnscript bandmember_sillhouette_pyro_flames {
				params = {
					pos1 = <pyropos1>
					pos2 = <pyropos2>
					pos3 = <pyropos3>
					pos4 = <pyropos4>
					startnode = <startnode>
					front = 0
					newtime = <timemultiplier>
				}
			}
			case `default`
		endswitch
		case front
		<pyropos1> = (-1.0, 0.0, 1.0)
		<pyropos2> = (1.0, 0.0, 1.0)
		switch <pyrotype>
			case sparks
			spawnscript bandmember_sillhouette_pyro_sparks params = {pos1 = <pyropos1> pos2 = <pyropos2> front = 1 newtime = <timemultiplier> startnode = <startnode>}
			case flames
			spawnscript bandmember_sillhouette_pyro_flames params = {pos1 = <pyropos1> pos2 = <pyropos2> front = 1 newtime = <timemultiplier> startnode = <startnode>}
			case `default`
		endswitch
		case `default`
	endswitch
endscript

script bandmember_sillhouette_pyro_flames 
	<plumetime> = (1.3 * <newtime>)
	<bottomtime> = (1 * <newtime>)
	<glowtime> = ((4.1, 4.1) * <newtime>)
	getuniquecompositeobjectid \{preferredid = bmflames_01}
	createparticlesystem name = <uniqueid> objid = <startnode> params_script = {$gp_fx_fireplume_attach_01 lifetime = <plumetime> pos = <pos1>} groupid = zoneparticles
	getuniquecompositeobjectid \{preferredid = bmflames_02}
	createparticlesystem name = <uniqueid> objid = <startnode> params_script = {$gp_fx_fireplume_bottom_attach_01 lifetime = <bottomtime> pos = <pos1>} groupid = zoneparticles
	wait \{1
		frame}
	getuniquecompositeobjectid \{preferredid = bmflames_03}
	createparticlesystem name = <uniqueid> objid = <startnode> params_script = {$gp_fx_dragonfire_glow_attach_01 liferange = <glowtime> pos = <pos1>} groupid = zoneparticles
	wait \{1
		frame}
	getuniquecompositeobjectid \{preferredid = bmflames_04}
	createparticlesystem name = <uniqueid> objid = <startnode> params_script = {$gp_fx_fireplume_attach_01 lifetime = <plumetime> pos = <pos2>} groupid = zoneparticles
	getuniquecompositeobjectid \{preferredid = bmflames_05}
	createparticlesystem name = <uniqueid> objid = <startnode> params_script = {$gp_fx_fireplume_bottom_attach_01 lifetime = <bottomtime> pos = <pos2>} groupid = zoneparticles
	wait \{1
		frame}
	getuniquecompositeobjectid \{preferredid = bmflames_06}
	createparticlesystem name = <uniqueid> objid = <startnode> params_script = {$gp_fx_dragonfire_glow_attach_01 liferange = <glowtime> pos = <pos2>} groupid = zoneparticles
	if (<front> = 0)
		getuniquecompositeobjectid \{preferredid = bmflames_07}
		createparticlesystem name = <uniqueid> objid = <startnode> params_script = {$gp_fx_fireplume_attach_01 lifetime = <plumetime> pos = <pos3>} groupid = zoneparticles
		getuniquecompositeobjectid \{preferredid = bmflames_08}
		createparticlesystem name = <uniqueid> objid = <startnode> params_script = {$gp_fx_fireplume_bottom_attach_01 lifetime = <bottomtime> pos = <pos3>} groupid = zoneparticles
		wait \{1
			frame}
		getuniquecompositeobjectid \{preferredid = bmflames_09}
		createparticlesystem name = <uniqueid> objid = <startnode> params_script = {$gp_fx_dragonfire_glow_attach_01 liferange = <glowtime> pos = <pos3>} groupid = zoneparticles
		getuniquecompositeobjectid \{preferredid = bmflames_10}
		createparticlesystem name = <uniqueid> objid = <startnode> params_script = {$gp_fx_fireplume_attach_01 lifetime = <plumetime> pos = <pos4>} groupid = zoneparticles
		getuniquecompositeobjectid \{preferredid = bmflames_11}
		createparticlesystem name = <uniqueid> objid = <startnode> params_script = {$gp_fx_fireplume_bottom_attach_01 lifetime = <bottomtime> pos = <pos4>} groupid = zoneparticles
		wait \{1
			frame}
		getuniquecompositeobjectid \{preferredid = bmflames_12}
		createparticlesystem name = <uniqueid> objid = <startnode> params_script = {$gp_fx_dragonfire_glow_attach_01 liferange = <glowtime> pos = <pos4>} groupid = zoneparticles
	endif
endscript

script momentfx_pyrolights 
	getpakmancurrentname \{map = zones}
	formattext checksumname = moment_pyrolight '%s_LFX_MomentPyroLight' s = <pakname> addtostringlookup = true
	movelight name = <moment_pyrolight> pos = <newerpyrolightpos>
	callscriptonnode name = <moment_pyrolight> callback_script = momentfx_pyrolights_enable params = {}
	wait \{3
		seconds}
	callscriptonnode name = <moment_pyrolight> callback_script = momentfx_pyrolights_disable params = {}
endscript

script momentfx_modulatepyrolights 
	setlightintensityovertime name = <nodename> i = 1.3 time = 0.2
	wait <lightwaittime> seconds
	printf 'lightwaittime is %p' p = <lightwaittime>
	setlightintensityovertime name = <nodename> i = 0 time = 0.8
endscript

script momentfx_pyrolights_enable 
	enablelight name = <nodename>
endscript

script momentfx_pyrolights_disable 
	disablelight name = <name>
endscript

script bandmember_sillhouette_pyro_sparks 
	getuniquecompositeobjectid \{preferredid = bmsparks_01}
	createparticlesystem name = <uniqueid> objid = <startnode> params_script = {$gp_fx_fsc_frontflash_01 align applypositionoffset enablerotate pos = <pos1>} groupid = zoneparticles
	getuniquecompositeobjectid \{preferredid = bmsparks_02}
	createparticlesystem name = <uniqueid> objid = <startnode> params_script = {$gp_fx_pyro_baseflashes_01 align applypositionoffset enablerotate pos = <pos1>} groupid = zoneparticles
	wait \{1
		frame}
	getuniquecompositeobjectid \{preferredid = bmsparks_03}
	createparticlesystem name = <uniqueid> objid = <startnode> params_script = {$gp_fx_groundsparks_big_02 align applypositionoffset enablerotate pos = <pos1>} groupid = zoneparticles
	getuniquecompositeobjectid \{preferredid = bmsparks_04}
	createparticlesystem name = <uniqueid> objid = <startnode> params_script = {$gp_fx_groundsparks_big_03 align applypositionoffset enablerotate pos = <pos1>} groupid = zoneparticles
	getuniquecompositeobjectid \{preferredid = bmsparks_05}
	createparticlesystem name = <uniqueid> objid = <startnode> params_script = {$gp_fx_sparkfountain_frontglow_01 align applypositionoffset enablerotate pos = <pos1>} groupid = zoneparticles
	wait \{1
		frame}
	getuniquecompositeobjectid \{preferredid = bmsparks_06}
	createparticlesystem name = <uniqueid> objid = <startnode> params_script = {$gp_fx_groundsparks_insideglow_01 align applypositionoffset enablerotate pos = <pos1>} groupid = zoneparticles
	getuniquecompositeobjectid \{preferredid = bmsparks_07}
	createparticlesystem name = <uniqueid> objid = <startnode> params_script = {$gp_fx_fsc_frontflash_01 align applypositionoffset enablerotate pos = <pos2>} groupid = zoneparticles
	getuniquecompositeobjectid \{preferredid = bmsparks_08}
	createparticlesystem name = <uniqueid> objid = <startnode> params_script = {$gp_fx_pyro_baseflashes_01 align applypositionoffset enablerotate pos = <pos2>} groupid = zoneparticles
	wait \{1
		frame}
	getuniquecompositeobjectid \{preferredid = bmsparks_09}
	createparticlesystem name = <uniqueid> objid = <startnode> params_script = {$gp_fx_groundsparks_big_02 align applypositionoffset enablerotate pos = <pos2>} groupid = zoneparticles
	getuniquecompositeobjectid \{preferredid = bmsparks_10}
	createparticlesystem name = <uniqueid> objid = <startnode> params_script = {$gp_fx_groundsparks_big_03 align applypositionoffset enablerotate pos = <pos2>} groupid = zoneparticles
	getuniquecompositeobjectid \{preferredid = bmsparks_11}
	createparticlesystem name = <uniqueid> objid = <startnode> params_script = {$gp_fx_sparkfountain_frontglow_01 align applypositionoffset enablerotate pos = <pos2>} groupid = zoneparticles
	wait \{1
		frame}
	getuniquecompositeobjectid \{preferredid = bmsparks_12}
	createparticlesystem name = <uniqueid> objid = <startnode> params_script = {$gp_fx_groundsparks_insideglow_01 align applypositionoffset enablerotate pos = <pos2>} groupid = zoneparticles
	if (<front> = 0)
		getuniquecompositeobjectid \{preferredid = bmsparks_107}
		createparticlesystem name = <uniqueid> objid = <startnode> params_script = {$gp_fx_fsc_frontflash_01 align applypositionoffset enablerotate pos = <pos3>} groupid = zoneparticles
		getuniquecompositeobjectid \{preferredid = bmsparks_108}
		createparticlesystem name = <uniqueid> objid = <startnode> params_script = {$gp_fx_pyro_baseflashes_01 align applypositionoffset enablerotate pos = <pos3>} groupid = zoneparticles
		wait \{1
			frame}
		getuniquecompositeobjectid \{preferredid = bmsparks_109}
		createparticlesystem name = <uniqueid> objid = <startnode> params_script = {$gp_fx_groundsparks_big_02 align applypositionoffset enablerotate pos = <pos3>} groupid = zoneparticles
		getuniquecompositeobjectid \{preferredid = bmsparks_110}
		createparticlesystem name = <uniqueid> objid = <startnode> params_script = {$gp_fx_groundsparks_big_03 align applypositionoffset enablerotate pos = <pos3>} groupid = zoneparticles
		getuniquecompositeobjectid \{preferredid = bmsparks_111}
		createparticlesystem name = <uniqueid> objid = <startnode> params_script = {$gp_fx_sparkfountain_frontglow_01 align applypositionoffset enablerotate pos = <pos3>} groupid = zoneparticles
		wait \{1
			frame}
		getuniquecompositeobjectid \{preferredid = bmsparks_112}
		createparticlesystem name = <uniqueid> objid = <startnode> params_script = {$gp_fx_groundsparks_insideglow_01 align applypositionoffset enablerotate pos = <pos3>} groupid = zoneparticles
		getuniquecompositeobjectid \{preferredid = bmsparks_1072}
		createparticlesystem name = <uniqueid> objid = <startnode> params_script = {$gp_fx_fsc_frontflash_01 align applypositionoffset enablerotate pos = <pos4>} groupid = zoneparticles
		getuniquecompositeobjectid \{preferredid = bmsparks_1082}
		createparticlesystem name = <uniqueid> objid = <startnode> params_script = {$gp_fx_pyro_baseflashes_01 align applypositionoffset enablerotate pos = <pos4>} groupid = zoneparticles
		wait \{1
			frame}
		getuniquecompositeobjectid \{preferredid = bmsparks_1092}
		createparticlesystem name = <uniqueid> objid = <startnode> params_script = {$gp_fx_groundsparks_big_02 align applypositionoffset enablerotate pos = <pos4>} groupid = zoneparticles
		getuniquecompositeobjectid \{preferredid = bmsparks_1102}
		createparticlesystem name = <uniqueid> objid = <startnode> params_script = {$gp_fx_groundsparks_big_03 align applypositionoffset enablerotate pos = <pos4>} groupid = zoneparticles
		getuniquecompositeobjectid \{preferredid = bmsparks_1112}
		createparticlesystem name = <uniqueid> objid = <startnode> params_script = {$gp_fx_sparkfountain_frontglow_01 align applypositionoffset enablerotate pos = <pos4>} groupid = zoneparticles
		wait \{1
			frame}
		getuniquecompositeobjectid \{preferredid = bmsparks_1122}
		createparticlesystem name = <uniqueid> objid = <startnode> params_script = {$gp_fx_groundsparks_insideglow_01 align applypositionoffset enablerotate pos = <pos4>} groupid = zoneparticles
	endif
endscript

script crowdspots \{angle = (-1.2, 0.0, 0.0)
		speed = 100
		color = white
		intensitymultiplier = 1.0}
	getpakmancurrentname \{map = zones}
	<i> = 1
	<valid_lights_list> = []
	begin
	formattext checksumname = object_id '%s_GFX_LH_RotLight_0%i' s = <pakname> i = <i> addtostringlookup = true
	if iscreated <object_id>
		formattext checksumname = housing '%s_GFX_LH_RotLight_0%i' s = <pakname> i = (<i>) addtostringlookup = true
		formattext checksumname = dummy '%s_GFX_LH_RotLightDUMMY_0%i' s = <pakname> i = (<i>) addtostringlookup = true
		formattext checksumname = vertexspot '%s_GFX_LH_RotLightVS_0%i' s = <pakname> i = (<i>) addtostringlookup = true
		<light_objects_entry> = {housing = <housing> dummy = <dummy> vertexspot = <vertexspot>}
		<valid_lights_list> = (<valid_lights_list> + <light_objects_entry>)
	else
		break
	endif
	wait \{1
		gameframe}
	<i> = (<i> + 1)
	repeat
	getarraysize <valid_lights_list>
	if (<array_size> = 0)
		return
	endif
	<i> = 0
	begin
	<light_objects> = (<valid_lights_list> [<i>])
	(<light_objects>.housing) :lightvolume_getparams volumedensity = <volumedensity> hotspotintensity = <hotspotintensity> projectorintensity = <projectorintensity>
	callscriptonnode name = (<light_objects>.housing) callback_script = crowdspots_colorandintensity {
		params = {
			color = <color>
			newhotspotintensity = (<hotspotintensity> * <intensitymultiplier>)
			newprojectorintensity = (<projectorintensity> * <intensitymultiplier>)
			venue_rotatinglights_lhs = (<light_objects>.housing)
			venue_rotatinglights_vss = (<light_objects>.vertexspot)
		}
	}
	(<light_objects>.housing) :obj_locktoobject objectname = (<light_objects>.dummy) relangles = <angle>
	<myspeed> = (<speed> * Random (@ 0.75 @ -0.75 @ 1.25 @ -1.25 @ 1.0 @ -1.0 ))
	(<light_objects>.dummy) :obj_roty speed = <myspeed>
	callscriptonnode name = (<light_objects>.vertexspot) callback_script = crowdspots_dovertexspotrotation {
		params = {
			venue_rotatinglights_lhs = (<light_objects>.housing)
			venue_rotatinglights_vss = (<light_objects>.vertexspot)
		}
	}
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script crowdspots_dovertexspotrotation 
	begin
	if NOT ((iscreated <venue_rotatinglights_lhs>) && (iscreated <venue_rotatinglights_vss>))
		break
	endif
	<venue_rotatinglights_lhs> :obj_getorientationvectors
	<direction_vector> = ((0.0, 0.0, 0.0) - <front_vector>)
	setlightdirection name = <venue_rotatinglights_vss> vector = <direction_vector>
	wait \{1
		frame}
	repeat
endscript

script crowdspots_colorandintensity 
	switch <color>
		case white
		<lhcolor> = [200 , 200 , 200]
		<vscolor> = (0.7, 0.7, 0.7)
		case red
		<lhcolor> = [251 , 134 , 134]
		<vscolor> = (0.8, 0.52, 0.52)
		case green
		<lhcolor> = [121 , 255 , 118]
		<vscolor> = (0.47, 0.8, 0.46)
		case blue
		<lhcolor> = [146 , 213 , 252]
		<vscolor> = (0.57, 0.83, 0.97999996)
		case yellow
		<lhcolor> = [250 , 255 , 101]
		<vscolor> = (0.85, 0.8, 0.29)
		case black
		<lhcolor> = [0 , 0 , 0]
		<vscolor> = (0.0, 0.0, 0.0)
		default
		return
	endswitch
	<venue_rotatinglights_lhs> :lightvolume_setparams {
		volumecolor = <lhcolor>
		projectorcolor = <lhcolor>
		volumedensity = <newvolumedensity>
		hotspotintensity = <newhotspotintensity>
		projectorintensity = <newhotspotintensity>
	}
	setlightcolor name = <venue_rotatinglights_vss> {
		lightcolor = <vscolor>
	}
endscript

script crowdspots_off 
	getpakmancurrentname \{map = zones}
	<i> = 1
	<valid_lights_list> = []
	begin
	formattext checksumname = object_id '%s_GFX_LH_RotLight_0%i' s = <pakname> i = <i> addtostringlookup = true
	if iscreated <object_id>
		formattext checksumname = housing '%s_GFX_LH_RotLight_0%i' s = <pakname> i = (<i>) addtostringlookup = true
		formattext checksumname = dummy '%s_GFX_LH_RotLightDUMMY_0%i' s = <pakname> i = (<i>) addtostringlookup = true
		formattext checksumname = vertexspot '%s_GFX_LH_RotLightVS_0%i' s = <pakname> i = (<i>) addtostringlookup = true
		<light_objects_entry> = {housing = <housing> dummy = <dummy> vertexspot = <vertexspot>}
		<valid_lights_list> = (<valid_lights_list> + <light_objects_entry>)
	else
		break
	endif
	wait \{1
		gameframe}
	<i> = (<i> + 1)
	repeat
	getarraysize <valid_lights_list>
	if (<array_size> = 0)
		return
	endif
	<i> = 0
	begin
	<light_objects> = (<valid_lights_list> [<i>])
	callscriptonnode name = (<light_objects>.housing) callback_script = crowdspots_colorandintensity {
		params = {
			color = black
			venue_rotatinglights_lhs = (<light_objects>.housing)
			venue_rotatinglights_vss = (<light_objects>.vertexspot)
		}
	}
	(<light_objects>.housing) :obj_locktoobject objectname = (<light_objects>.dummy) relangles = <angle>
	(<light_objects>.dummy) :obj_roty speed = 0
	callscriptonnode name = (<light_objects>.vertexspot) callback_script = crowdspots_dovertexspotrotation {
		params = {
			venue_rotatinglights_lhs = (<light_objects>.housing)
			venue_rotatinglights_vss = (<light_objects>.vertexspot)
		}
	}
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script momentfx_singlefrontspot \{bandmember = vocalist
		smoke = 0}
	getpakmancurrentname \{map = zones}
	formattext checksumname = frontspot '%s_GFX_LH_FrontSpot' s = <pakname> addtostringlookup = true
	if NOT iscreated <frontspot>
		return
	endif
	<frontspot> :lightvolume_setparams {
		volumecolor = [255 , 255 , 255]
		projectorcolor = [255 , 255 , 255]
	}
	if NOT (<smoke> = 0)
		getuniquecompositeobjectid \{preferredid = momentsmoke_01}
		createparticlesystem name = <uniqueid> objid = <bandmember> params_script = $gp_p_momentsmoke_01 groupid = zoneparticles
	endif
endscript

script momentfx_singlefrontspot_off 
	getpakmancurrentname \{map = zones}
	formattext checksumname = frontspot '%s_GFX_LH_FrontSpot' s = <pakname> addtostringlookup = true
	if NOT iscreated <frontspot>
		return
	endif
	<frontspot> :lightvolume_setparams {
		volumecolor = [0 , 0 , 0]
		projectorcolor = [0 , 0 , 0]
	}
endscript

script bandmembersillhouette_getoffset 
	vocalist :obj_getposition
	printf 'vocalist pos is %p' p = <pos>
	bandmemberpos = <pos>
	z_subway_gfx_bm_sill_flare_frontright :obj_getposition
	printf 'flare pos is %p' p = <pos>
	flarepos = <pos>
	newflarepos = (<flarepos> - <bandmemberpos>)
	printf 'newflarepos is %p' p = <newflarepos>
endscript

script bandmembermoments_setdarksnapshot 
	lightshow_playsnapshot \{name = strobe01
		usesnapshotpositions = true
		save = true}
endscript
