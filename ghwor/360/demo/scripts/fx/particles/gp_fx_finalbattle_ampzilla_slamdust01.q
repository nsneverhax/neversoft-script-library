gp_fx_finalbattle_ampzilla_slamdust01 = {
	pos = (-4.9950686, 0.0, 4.3706264)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	attach
	attachobject = z_finalbattle_trg_geo_ampzilla
	bone = bone_finger2_base_bend_l
	emitrangedims = (6.0, 0.1, 6.0)
	emit_target = (0.0, 1.0, 0.0)
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, 0.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	radiate
	elevspread = (95.0, 110.0)
	sweepspread = (0.0, 360.0)
	dragcoeff = 2.0
	liferange = (1.2, 1.8)
	emit_rate = 48.0
	max = 0
	timeseed = 0.6
	lifetime = 0.0
	emitnum = 48
	followemitter = 0.0
	emitfunction = constant
	emitperiod = 1.0
	sizerange = [
		(4.0, 4.0)
		(12.0, 12.0)
	]
	speedrange = (15.0, 17.0)
	turbulence = (1.0, 3.0, -3.0)
	rotvel = (0.0, 0.0)
	rotveltimescale = 0.0
	emitdelaystart = 0.0
	pathfollowtime = 0.0
	history = 2
	historylistcoordinatespace = world
	color = -1448895970
	lod_default
	quickmaterial = {
		layoutn = 1
		layoutm = 1
		diffusetextureenabled
		diffusetexture = ph_smoke_singlepuff_blend_02
		specularpower = 0
		alphacutoff = 1
		blendmode = blend
		softedge
		softedgescale = 1.0
		aoshadow = 0.0
		quadanimationfps = 0
		lightgroup = allgroups
		fadeoutnearplane = 0.0
		fadeoutdistance = 0.1
	}
	knot = [
		(-1.031919, 0.0, -0.0)
		(-1.031919, 0.0, -0.0)
		(-0.89152205, 0.0, -0.0)
		(-0.75112504, 0.0, -0.0)
		(-0.610728, 0.0, -0.0)
		(-0.427587, 0.0, -0.0)
		(-0.24444601, 0.0, -0.0)
		(-0.061306, 0.0, -0.0)
		(0.335862, 0.0, -0.0)
		(0.73302996, 0.0, -0.0)
		(1.130198, 0.0, -0.0)
		(1.130198, 0.0, -0.0)
	]
	particlecolor = [
		-256
		-256
		-1
		-1
		-1
		-1
		-256
		-256
	]
	burnpervertex = [
		1.0
		1.0
		1.0
		1.0
	]
	vertexweight = [
		0.194805
		0.44891798
		1.0
	]
}
