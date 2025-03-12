gp_fx_finalbattle_ampzilla_static_armelectric01 = {
	pos = (2.0, 0.0, -2.0)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	attach
	align
	applypositionoffset
	attachobject = z_finalbattle_trg_geo_ampzilla
	bone = bone_elbow_l
	emitrangedims = (0.0, 2.0, 0.0)
	emit_target = (0.0, 1.0, 0.0)
	enablerotate
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, 0.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	anglespread = 0.0
	dragcoeff = 0.0
	liferange = (0.2, 0.3)
	emit_rate = 36.0
	max = 0
	timeseed = 0.0
	lifetime = 0.0
	emitnum = 0
	followemitter = 1.0
	emitfunction = onoff
	emitperiod = 0.7
	sizerange = [
		(2.5, 2.5)
		(4.0, 4.0)
	]
	speedrange = (0.0, 0.0)
	turbulence = (0.0, 0.0, 0.0)
	rotvel = (-2.0, -1.0)
	rotveltimescale = 1.0
	emitdelaystart = 0.0
	pathfollowtime = 0.2
	history = 2
	historylistcoordinatespace = world
	align_to = (1.0, 0.0, 0.0)
	rotate3d
	color = 1452212101
	lod_default
	quickmaterial = {
		layoutn = 1
		layoutm = 1
		diffusetextureenabled
		diffusetexture = electriccircle_02
		specularpower = 0
		twoside
		bloom
		alphacutoff = 1
		blendmode = add
		aoshadow = 0.0
		quadanimationfps = 0
		lightgroup = allgroups
		fadeoutnearplane = 0.0
		fadeoutdistance = 0.1
	}
	knot = [
		(-0.998441, 0.0, -0.0)
		(-0.998441, 0.0, -0.0)
		(-0.838308, 0.0, -0.0)
		(-0.678174, 0.0, -0.0)
		(-0.518041, 0.0, -0.0)
		(-0.20208502, 0.0, -0.0)
		(0.11387099, 0.0, -0.0)
		(0.42982703, 0.0, -0.0)
		(0.530818, 0.0, -0.0)
		(0.631809, 0.0, -0.0)
		(0.73279995, 0.0, -0.0)
		(0.73279995, 0.0, -0.0)
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
		0.277489
		0.82499695
		1.0
	]
}
