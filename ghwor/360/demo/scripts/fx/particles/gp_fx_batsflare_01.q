gp_fx_batsflare_01 = {
	pos = (-4.101298, 0.897644, 1.405295)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	attach
	align
	attachobject = rocker
	bone = bone_pelvis
	emitrangedims = (0.8, 0.4, 0.4)
	emit_target = (0.0, 1.0, 0.0)
	enablerotate
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, 0.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	anglespread = 45.0
	dragcoeff = 0.0
	liferange = (0.1, 0.2)
	emit_rate = 300.0
	max = 0
	timeseed = 0.0
	lifetime = 6.0
	emitnum = 0
	followemitter = 0.0
	emitfunction = sawtooth
	emitperiod = 12.0
	sizerange = [
		(1.0, 1.0)
		(4.0, 4.0)
	]
	speedrange = (0.0, 0.0)
	turbulence = (0.0, 0.0, 0.0)
	rotvel = (1.0, -1.0)
	rotveltimescale = 1.0
	emitdelaystart = 0.0
	pathfollowtime = 0.0
	history = 2
	historylistcoordinatespace = world
	color = -1631330049
	lod_default
	quickmaterial = {
		layoutn = 1
		layoutm = 1
		diffusetextureenabled
		diffusetexture = jow_flare02
		specularpower = 0
		alphacutoff = 1
		blendmode = add
		softedge
		softedgescale = 0.5
		sortgroup = 3
		draworder = 15.0
		aoshadow = 0.0
		quadanimationfps = 0
		lightgroup = allgroups
		fadeoutnearplane = 0.0
		fadeoutdistance = 0.1
	}
	knot = [
		(-0.652616, 0.0, -0.008775)
		(-0.652616, 0.0, -0.008775)
		(-0.56147397, 0.0, -0.008160001)
		(-0.470333, 0.0, -0.007544)
		(-0.379191, 0.0, -0.006928)
		(-0.119315, 0.0, -0.002001)
		(0.140561, 0.0, 0.0029250002)
		(0.40043703, 0.0, 0.007852)
		(0.477414, 0.0, 0.007852)
		(0.55439204, 0.0, 0.007852)
		(0.63136995, 0.0, 0.007852)
		(0.63136995, 0.0, 0.007852)
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
		0.21293001
		0.820164
		1.0
	]
}
