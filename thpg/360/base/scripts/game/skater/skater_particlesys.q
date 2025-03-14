
script initskaterparticles 
	obj_killspawnedscript \{name = SkaterParticles_CheckSkaterPuddle}
	obj_spawnscriptlater \{SkaterParticles_CheckSkaterPuddle}
	obj_killspawnedscript \{name = SkaterParticles_CheckBoardRotated}
	obj_spawnscriptlater \{SkaterParticles_CheckBoardRotated}
endscript
SkaterParticleHandlerExceptionTable = [
	{
		response = call_script
		event = onskaterstatechange
		scr = SkaterParticles_OnSkaterStateChange
	}
	{
		response = call_script
		event = onskaterphysicsstatechange
		scr = SkaterParticles_OnSkaterPhysicsStateChange
	}
	{
		response = call_script
		event = onskaterterrainchange
		scr = SkaterParticles_OnSkaterTerrainChange
	}
]

script set_skater_particle_handlers 
	reseteventhandlersfromtable \{SkaterParticleHandlerExceptionTable
		group = flexpartsys}
endscript

script destroy_particle_object 
	obj_getid
	manglechecksums a = <a> b = <objid>
	if gotparam b
		manglechecksums a = <mangled_id> b = <b>
	endif
	if objectexists id = <mangled_id>
		<mangled_id> :destroyparticles
		<mangled_id> :die
	else
		printf "Couldn't find %s %a %b to delete" s = <mangled_id> a = <a> b = <b>
	endif
endscript

script destroyskaterparticles 
	ResetSkaterParticleSystems
	obj_getid
	<objid> :destroy_particle_object a = skater_blood_system b = bone_head
	flushdeadobjects
endscript

script ResetSkaterParticleSystems 
	SkaterParticles_DestroySkatingGfx
	SkaterParticles_DestroyStepGfx
	SkaterParticles_DestroyGrindGfx
	SkaterParticles_DestroySlideGfx
	CleanUp_SpecialTrickParticles
	BloodParticlesOff
	SprayPaintOff
	SkaterSplashOff
	TurnSparksOff
endscript

script TurnSparksOn 
	SparksOn
	skaterparticles_sparkson type = <type>
endscript

script TurnSparksOff 
	SparksOff
	skaterparticles_sparksoff
endscript

script skaterparticles_sparkson \{type = Grind}
	if (<type> = Grind)
		SkaterParticles_CreateGrindGfx
	else
		SkaterParticles_CreateSlideGfx
	endif
endscript

script skaterparticles_sparksoff 
	SkaterParticles_DestroyGrindGfx
	SkaterParticles_DestroySlideGfx
endscript

script SetSparksTruckFromNollie 
	if innollie
		setsparkspos \{front}
	else
		setsparkspos \{rear}
	endif
endscript

script SkaterSplashOn 
	obj_getid
endscript

script SkaterSplashOff 
	obj_getid
	destroyflexibleparticlesystem name = skatersplash objid = <objid>
	destroyfastparticlesystem name = skatersplash2 attachobjid = <objid>
	destroyfastparticlesystem name = skatersplash3 attachobjid = <objid>
endscript

script SprayPaintOn 
	obj_getid
endscript

script SprayPaintOff 
	obj_getid
	destroyflexibleparticlesystem name = skater_SprayPaint_system objid = <objid>
endscript

script AcidParticlesOn 
	return
	begin
	if onrail
		break
	endif
	if walking
		break
	endif
	if onground
		if NOT InManual
			obj_getid
			ShakeCamera {
				duration = 0.25
				vert_amp = 0.625
				horiz_amp = 0.25
				vert_vel = 10
				horiz_vel = 10.92
			}
			vibrate actuator = 0 , percent = 1 , duration = 1 ,
			vibrate actuator = 1 , percent = 1 , duration = 1 ,
			wait 2 seconds
		endif
		break
	endif
	wait 1 gameframe
	repeat
endscript

script BloodParticlesOn \{bone = bone_head}
	obj_getid
	manglechecksums a = skater_blood_system b = <objid>
	manglechecksums a = <mangled_id> b = <bone>
	obj_spawnscriptlater SkaterBloodOn params = {name = <mangled_id> num = <num>}
endscript

script SkaterBloodOn num = 10
	if NOT gotparam name
		script_assert "No name parameter"
	endif
	alloc_blood_system name = <name>
	if objectexists id = <name>
		<name> :setemitscript name = <name> emitscript = skater_blood_emit_super
	endif
	begin
	if objectexists id = <name>
		<name> :emiton
	endif
	wait 1 gameframe
	repeat <num>
	if objectexists id = <name>
		<name> :emitoff
	endif
endscript

script BloodParticlesOff \{bone = bone_head}
	obj_getid
	manglechecksums a = skater_blood_system b = <objid>
	manglechecksums a = <mangled_id> b = bone_head
	SkaterBloodOff name = <mangled_id>
	if objectexists id = <mangled_id>
		<mangled_id> :emptysystem
	endif
endscript

script SkaterBloodOff 
	if NOT gotparam \{name}
		script_assert \{"No name parameter"}
	endif
	if objectexists id = <name>
		<name> :destroyparticles
	endif
endscript

script alloc_blood_system bone = bone_head
	obj_getid
	if NOT gotparam name
		script_assert "No <name> parameter"
	endif
	if NOT objectexists id = <name>
		createcompositeobject {
			components = [
				{component = suspend}
				{component = lockobj}
				{component = flexibleparticle}
			]
			params = {
				name = <name>
				localspace
				vel = <vel>
				params = {objid = <objid> bone = <bone> name = <name>}
				max = 25
				emitscript = skater_blood_emit
				texture = skater_blood
				blendmode = blend
				perm = 1
			}
		}
		<name> :obj_locktoobject bone = <bone> id = <objid> add_vel
	endif
endscript

script SkaterParticles_OnSkaterStateChange 
	SkaterParticles_DestroySkatingGfx
	SkaterParticles_DestroyGrindGfx
	SkaterParticles_DestroySlideGfx
	if onground
		SkaterParticles_CreateSkatingGfx
	endif
endscript

script SkaterParticles_OnSkaterPhysicsStateChange 
	SkaterParticles_DestroySkatingGfx
	SkaterParticles_DestroyGrindGfx
	SkaterParticles_DestroySlideGfx
	if skating
		SkaterParticles_CreateSkatingGfx
	endif
endscript

script SkaterParticles_OnSkaterTerrainChange 
	SkaterParticles_DestroySkatingGfx
	if skating
		if NOT inair
			SkaterParticles_CreateSkatingGfx
		endif
	endif
endscript

script SkaterParticles_CheckSkaterPuddle 
	skaterInPuddle = 0
	settags skaterInPuddle = <skaterInPuddle>
	begin
	if iswet
		inPuddle = 1
	else
		inPuddle = 0
	endif
	if ((<inPuddle> = 1) && ($currainpuddlesintensity > 0.2))
		if (<skaterInPuddle> = 0)
			settags skaterInPuddle = 1
			skaterInPuddle = 1
			if onground
				SkaterParticles_DestroySkatingGfx
				SkaterParticles_CreateSkatingGfx
			endif
		endif
	elseif (<skaterInPuddle> = 1)
		settags skaterInPuddle = 0
		skaterInPuddle = 0
		if onground
			SkaterParticles_DestroySkatingGfx
			SkaterParticles_CreateSkatingGfx
		endif
	endif
	wait 1 frame
	repeat
endscript

script SkaterParticles_CheckBoardRotated 
	if boardisrotated
		boardPos = 0
	else
		boardPos = 1
	endif
	begin
	oldBoardPos = <boardPos>
	if boardisrotated
		boardPos = 0
	else
		boardPos = 1
	endif
	if NOT (<boardPos> = <oldBoardPos>)
		if onground
			SkaterParticles_DestroySkatingGfx
			SkaterParticles_CreateSkatingGfx
		endif
	endif
	wait \{1
		gameframe}
	repeat
endscript

script SkaterParticles_BoardOnFire 
	obj_getid
	<objid> :settags SpecialTrickFX
	spawnscriptlater Create_Board_Fire_FX id = SpecialTrickFX params = {objid = <objid> NOSMOKE time = 0.5}
endscript

script SkaterParticles_OnRightFootstep 
	SkaterParticles_CreateStepFX \{bone = bone_ankle_r}
endscript

script SkaterParticles_OnLeftFootstep 
	SkaterParticles_CreateStepFX \{bone = bone_ankle_l}
endscript

script SkaterParticles_JumpLand 
	obj_spawnscriptlater \{SkaterParticles_CreateLandFX
		params = {
			JUMPLAND
		}}
endscript

script SkaterParticles_TerrainLand 
	obj_spawnscriptlater \{SkaterParticles_CreateLandFX
		params = {
			TERRAINLAND
		}}
endscript

script SkaterParticles_CreateLandFX 
	wait 0.1 seconds
	obj_getid
	getterrain
	if getterraintypeparam param = treadactions terrain_id = <terrain>
		obj_getposition
		gettags
		if NOT gotparam Indoor_Proxim
			Indoor_Proxim = 0
		endif
		manglechecksums a = terrain_Step b = <objid>
		<groupid> = <mangled_id>
		if iswet
			skaterInPuddle = 1
			soundevent event = puddle_splash_sfx
		else
			skaterInPuddle = 0
		endif
		begin
		if ((<Indoor_Proxim> < 1) && (<skaterInPuddle> = 1))
			if getnextarrayelement (<treadactions>.SkaterJumpLandParticleParms_Puddle)
				getuniquecompositeobjectid preferredid = JumpLandParticleSystem
				createparticlesystem name = <uniqueid> objid = <objid> groupid = <groupid> params_script = <element>
			else
				break
			endif
		elseif ((<Indoor_Proxim> < 1) && ($currainpuddlesintensity > 0.2))
			if getnextarrayelement (<treadactions>.SkaterJumpLandParticleParms_Wet)
				getuniquecompositeobjectid preferredid = JumpLandParticleSystem
				createparticlesystem name = <uniqueid> objid = <objid> groupid = <groupid> params_script = <element>
			else
				break
			endif
		elseif getnextarrayelement (<treadactions>.skaterjumplandparticleparms)
			obj_getboneposition bone = bone_pelvis
			newpos = (<x> * (1.0, 0.0, 0.0) + <pos> [1] * (0.0, 1.0, 0.0) + <z> * (0.0, 0.0, 1.0) + (0.0, 0.05, 0.0))
			getuniquecompositeobjectid preferredid = JumpLandParticleSystem
			createparticlesystem name = <uniqueid> pos = <newpos> groupid = <groupid> params_script = <element>
		else
			break
		endif
		repeat
	endif
endscript

script SkaterParticles_CreateSkatingGfx 
	if NOT skating
		return
	endif
	obj_getid
	obj_getvelocity
	normalizevector <vel>
	getterrain
	if getterraintypeparam param = treadactions terrain_id = <terrain>
		gettags
		if NOT gotparam Indoor_Proxim
			Indoor_Proxim = 0
		endif
		begin
		if ((<Indoor_Proxim> < 1) && (<skaterInPuddle> = 1) && (<length> >= 2.5))
			if iswet
				soundevent event = puddle_splash_sfx
			endif
			if NOT getnextarrayelement (<treadactions>.SkaterSkatingParticleParms_Puddle)
				break
			endif
		elseif ((<Indoor_Proxim> < 1) && ($currainpuddlesintensity > 0.2))
			if NOT getnextarrayelement (<treadactions>.SkaterSkatingParticleParms_Wet)
				break
			endif
		elseif NOT getnextarrayelement (<treadactions>.skaterskatingparticleparms)
			break
		endif
		formattext checksumname = tag 'terrain_skating%d' d = <index>
		manglechecksums a = <tag> b = <objid>
		<name> = <mangled_id>
		if NOT objectexists id = <name>
			manglechecksums a = terrain_skating b = <objid>
			<groupid> = <mangled_id>
			new_params = {(<element>.params) objid = <objid>}
			params_script = {(<element>) params = <new_params>}
			GetBoardBackBone objid = <objid>
			if nailthetrick_isinnailthex
				if ntx_flip_effect_bone
					<bone> = BONE_BOARD_TRUCK_NOSE
				else
					<bone> = bone_board_truck_back
				endif
			endif
			getparticletype parmas_Script = <element>
			if (<type> = fast)
				alloc_fast_particle params_script = <params_script> name = <name> bone = <bone> attachobjid = <objid> groupid = <groupid>
			else
				alloc_flexible_particle params_script = <params_script> name = <name> bone = <bone> objid = <objid> groupid = <groupid>
			endif
		endif
		repeat
		if nailthetrick_isinnailthex
			return
		endif
		begin
		if ((<Indoor_Proxim> < 1) && (<skaterInPuddle> = 1) && (<length> >= 2.5))
			if NOT getnextarrayelement (<treadactions>.SkaterSkatingFrontParticleParms_Puddle)
				break
			endif
		elseif ((<Indoor_Proxim> < 1) && ($currainpuddlesintensity > 0.2))
			if NOT getnextarrayelement (<treadactions>.SkaterSkatingFrontParticleParms_Wet)
				break
			endif
		elseif NOT getnextarrayelement (<treadactions>.SkaterSkatingFrontParticleParms)
			break
		endif
		formattext checksumname = tag 'terrain_skating%d_%d' d = <index>
		manglechecksums a = <tag> b = <objid>
		<name> = <mangled_id>
		if NOT objectexists id = <name>
			manglechecksums a = terrain_skating b = <objid>
			<groupid> = <mangled_id>
			new_params = {(<element>.params) objid = <objid>}
			params_script = {(<element>) params = <new_params>}
			GetBoardFrontBone objid = <objid>
			getparticletype parmas_Script = <element>
			if (<type> = fast)
				alloc_fast_particle params_script = <params_script> name = <name> bone = <bone> attachobjid = <objid> groupid = <groupid>
			else
				alloc_flexible_particle params_script = <params_script> name = <name> bone = <bone> objid = <objid> groupid = <groupid>
			endif
		endif
		repeat
	endif
endscript

script SkaterParticles_DestroySkatingGfx 
	obj_getid
	manglechecksums a = terrain_skating b = <objid>
	destroyparticlesbygroupid groupid = <mangled_id> ifempty = 1
endscript

script GetBoardFrontBone \{objid = skater}
	if <objid> :boardisrotated
		<bone> = bone_board_truck_back
	else
		<bone> = BONE_BOARD_TRUCK_NOSE
	endif
	return bone = <bone>
endscript

script GetBoardBackBone \{objid = skater}
	if <objid> :boardisrotated
		<bone> = BONE_BOARD_TRUCK_NOSE
	else
		<bone> = bone_board_truck_back
	endif
	return bone = <bone>
endscript

script SkaterParticles_CreateStepFX bone = bone_ankle_l systemlifetime = 400
	obj_getid
	getterrain
	if speedgreaterthan 3
		if getterraintypeparam param = treadactions terrain_id = <terrain>
			manglechecksums a = terrain_Step b = <objid>
			<groupid> = <mangled_id>
			obj_getposition
			gettags
			if NOT gotparam Indoor_Proxim
				Indoor_Proxim = 0
			endif
			begin
			if ((<Indoor_Proxim> < 1) && (<skaterInPuddle> = 1))
				if iswet
					soundevent event = puddle_splash_sfx
				endif
				if NOT getnextarrayelement (<treadactions>.SkaterRunParticleParms_Puddle)
					break
				endif
			elseif ((<Indoor_Proxim> < 1) && ($currainpuddlesintensity > 0.2))
				if NOT getnextarrayelement (<treadactions>.SkaterRunParticleParms_Wet)
					break
				endif
			elseif NOT getnextarrayelement (<treadactions>.skaterrunparticleparms)
				break
			endif
			getuniquecompositeobjectid preferredid = FootstepParticleSystem
			createparticlesystem name = <uniqueid> groupid = <groupid> objid = <objid> params_script = <element>
			repeat
		endif
	endif
endscript

script SkaterParticles_DestroyStepGfx 
	obj_getid
	manglechecksums a = terrain_Step b = <objid>
	destroyparticlesbygroupid groupid = <mangled_id> ifempty = 1
endscript

script SkaterParticles_CreateGrindGfx 
	obj_getid
	getterrain
	if getterraintypeparam param = treadactions terrain_id = <terrain>
		manglechecksums a = terrain_Grind b = <objid>
		<groupid> = <mangled_id>
		gettags
		if NOT gotparam Indoor_Proxim
			Indoor_Proxim = 0
		endif
		begin
		if ((<Indoor_Proxim> < 1) && (<skaterInPuddle> = 1))
			if NOT getnextarrayelement (<treadactions>.SkaterGrindParticleParms_Puddle)
				break
			endif
		elseif ((<Indoor_Proxim> < 1) && ($currainpuddlesintensity > 0.2))
			if NOT getnextarrayelement (<treadactions>.SkaterGrindParticleParms_Wet)
				break
			endif
		elseif NOT getnextarrayelement (<treadactions>.skatergrindparticleparms)
			break
		endif
		formattext checksumname = tag 'terrain_grind%d' d = <index>
		manglechecksums a = <tag> b = <objid>
		<name> = <mangled_id>
		if NOT objectexists id = <name>
			new_params = {(<element>.params) objid = <objid>}
			params_script = {(<element>) params = <new_params>}
			GetBoardGrindBone objid = <objid>
			getparticletype params_script = <element>
			if (<type> = fast)
				alloc_fast_particle name = <name> attachobjid = <objid> bone = <bone> groupid = <groupid> params_script = <params_script>
			else
				alloc_flexible_particle name = <name> objid = <objid> bone = <bone> groupid = <groupid> params_script = <params_script>
			endif
		endif
		repeat
	endif
endscript

script SkaterParticles_CreateNatasGfx 
	obj_getid
	getterrain
	if getterraintypeparam param = treadactions terrain_id = <terrain>
		manglechecksums a = terrain_Grind b = <objid>
		<groupid> = <mangled_id>
		obj_getposition
		gettags
		if NOT gotparam Indoor_Proxim
			Indoor_Proxim = 0
		endif
		begin
		if ((<Indoor_Proxim> < 1) && (<skaterInPuddle> = 1))
			if NOT getnextarrayelement (<treadactions>.SkaterNatasParticleParms_Puddle)
				break
			endif
		elseif ((<Indoor_Proxim> < 1) && ($currainpuddlesintensity > 0.2))
			if NOT getnextarrayelement (<treadactions>.SkaterNatasParticleParms_Wet)
				break
			endif
		elseif NOT getnextarrayelement (<treadactions>.skaternatasparticleparms)
			break
		endif
		getuniquecompositeobjectid preferredid = NatasFX
		createparticlesystem name = <uniqueid> groupid = <groupid> pos = <pos> params_script = <element>
		repeat
	endif
endscript

script SkaterParticles_DestroyGrindGfx 
	obj_getid
	manglechecksums a = terrain_Grind b = <objid>
	destroyparticlesbygroupid groupid = <mangled_id> ifempty = 1
endscript

script SkaterParticles_CreateSlideGfx 
	obj_getid
	getterrain
	if getterraintypeparam param = treadactions terrain_id = <terrain>
		gettags
		if NOT gotparam Indoor_Proxim
			Indoor_Proxim = 0
		endif
		begin
		if ((<Indoor_Proxim> < 1) && (<skaterInPuddle> = 1))
			if NOT getnextarrayelement (<treadactions>.SkaterSlideParticleParms_Puddle)
				break
			endif
		elseif ((<Indoor_Proxim> < 1) && ($currainpuddlesintensity > 0.2))
			if NOT getnextarrayelement (<treadactions>.SkaterSlideParticleParms_Wet)
				break
			endif
		elseif NOT getnextarrayelement (<treadactions>.skaterslideparticleparms)
			break
		endif
		formattext checksumname = tag 'terrain_slide%d' d = <index>
		manglechecksums a = <tag> b = <objid>
		<name> = <mangled_id>
		if NOT objectexists id = <name>
			manglechecksums a = terrain_slide b = <objid>
			<groupid> = <mangled_id>
			new_params = {(<element>.params) objid = <objid>}
			params_script = {(<element>) params = <new_params>}
			GetBoardGrindBone objid = <objid>
			getparticletype params_script = <element>
			if (<type> = fast)
				alloc_fast_particle name = <name> attachobjid = <objid> bone = <bone> groupid = <groupid> params_script = <params_script>
			else
				alloc_flexible_particle name = <name> objid = <objid> bone = <bone> groupid = <groupid> params_script = <params_script>
			endif
		endif
		repeat
	endif
endscript

script SkaterParticles_DestroySlideGfx 
	obj_getid
	manglechecksums a = terrain_slide b = <objid>
	destroyparticlesbygroupid groupid = <mangled_id> ifempty = 1
endscript
skater_particle_composite_structure = [
	{
		component = suspend
	}
	{
		component = particle
	}
	{
		component = lockobj
	}
]

script CleanUp_SpecialTrickParticles 
	obj_getid
	manglechecksums a = <objid> b = SpecialTrickParticles
	particle_id = <mangled_id>
	if objectexists id = <particle_id>
		<particle_id> :die
	endif
endscript

script Emit_SpecialTrickParticles \{bone = bone_head}
	obj_spawnscriptlater Emit_SpecialTrickParticles2 params = {<...>}
endscript

script Emit_SpecialTrickParticles2 
	obj_getid
	manglechecksums a = <objid> b = SpecialTrickParticles
	particle_id = <mangled_id>
	if objectexists id = <particle_id>
		<particle_id> :die
	endif
	wait 1 game frame
	printf "about to create .........................."
	if NOT gotparam dont_orient_toskater
		GetSkaterVelocity
		vel = (<vel_x> * (1.0, 0.0, 0.0) + <vel_y> * (0.0, 1.0, 0.0) + <vel_z> * (0.0, 0.0, 1.0))
		createcompositeobject {
			components = skater_particle_composite_structure
			params = {
				name = <particle_id>
				localspace
				enablerotate
				vel = <vel>
				<specialtrick_particles>
			}
		}
	else
		printf "Here?"
		createcompositeobject {
			components = skater_particle_composite_structure
			params = {
				name = <particle_id>
				localspace
				<specialtrick_particles>
			}
		}
	endif
	<particle_id> :obj_locktoobject bone = <bone> id = <objid>
	if gotparam StopEmitAt
		wait <StopEmitAt> seconds
		if objectexists id = <particle_id>
			<particle_id> :setemitrate 0
		endif
	endif
endscript

script skater_blood_emit 
	setlife min = 0.25 max = 1
	setanglespread spread = 0.1
	setspeedrange min = 4 max = 8
	setforce force = (0.0, -0.5, 0.0)
	setparticlesize sw = 2 sh = 2 ew = 2 eh = 2
	setcolor corner = 0 sr = 100 sg = 0 sb = 0 sa = 255 er = 80 eg = 0 eb = 0 ea = 0
	setcolor corner = 1 sr = 100 sg = 0 sb = 0 sa = 255 er = 80 eg = 0 eb = 0 ea = 0
	setcolor corner = 2 sr = 100 sg = 0 sb = 0 sa = 255 er = 80 eg = 0 eb = 0 ea = 0
	setcolor corner = 3 sr = 100 sg = 0 sb = 0 sa = 255 er = 80 eg = 0 eb = 0 ea = 0
	begin
	if <name> :shouldemit
		emit num = 1
	endif
	wait 1 gameframe
	repeat
endscript

script skater_blood_emit_super 
	setlife min = 0.25 max = 1
	setanglespread spread = 0.3
	setspeedrange min = 4 max = 10
	setforce force = (0.0, -0.5, 0.0)
	setparticlesize sw = 2 sh = 2 ew = 6 eh = 6
	setcolor corner = 0 sr = 50 sg = 0 sb = 0 sa = 255 er = 50 eg = 0 eb = 0 ea = 0
	setcolor corner = 1 sr = 50 sg = 0 sb = 0 sa = 255 er = 50 eg = 0 eb = 0 ea = 0
	setcolor corner = 2 sr = 50 sg = 0 sb = 0 sa = 255 er = 50 eg = 0 eb = 0 ea = 0
	setcolor corner = 3 sr = 50 sg = 0 sb = 0 sa = 255 er = 50 eg = 0 eb = 0 ea = 0
	begin
	if <name> :shouldemit
		emit num = 1
	endif
	wait 1 gameframe
	repeat
endscript
