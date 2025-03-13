gp_fx_festival_encore_snortl01 = {
	pos = (0.04, 0.15, -0.01)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	attach
	align
	applypositionoffset
	attachobject = power_rocker
	bone = bone_head
	emitrangedims = (0.0, 0.0, 0.0)
	emit_target = (0.0, 1.0, 0.3)
	enablerotate
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, 1.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	anglespread = 5.0
	dragcoeff = 5.0
	liferange = (0.4, 0.4)
	emit_rate = 128.0
	max = 0
	timeseed = 0.0
	lifetime = 0.2
	emitnum = 0
	followemitter = 0.0
	emitfunction = invsawtooth
	emitperiod = 0.25
	sizerange = [
		(0.1, 0.1)
		(0.2, 0.2)
	]
	speedrange = (4.0, 4.2)
	turbulence = (1.0, 3.0, -3.0)
	rotvel = (-0.15, -0.05)
	rotveltimescale = 0.0
	emitdelaystart = 0.0
	pathfollowtime = 0.0
	history = 2
	historylistcoordinatespace = world
	color = -79
	lod_default
	quickmaterial = {
		layoutn = 1
		layoutm = 1
		diffusetextureenabled
		diffusetexture = ph_smoke_singlepuff_blend_02
		specularpower = 0
		lighting
		alphacutoff = 1
		blendmode = blend
		softedge
		softedgescale = 0.2
		burn
		burnvalue = 0.5
		aoshadow = 0.0
		quadanimationfps = 0
		lightgroup = fx
		fadeoutnearplane = 0.0
		fadeoutdistance = 0.1
	}
	knot = [
		(-0.41099, 0.0, -0.0)
		(-0.41099, 0.0, -0.0)
		(-0.36025003, 0.0, -0.0)
		(-0.30951104, 0.0, -0.0)
		(-0.258771, 0.0, -0.0)
		(-0.08371999, 0.0, -0.0)
		(0.091331005, 0.0, -0.0)
		(0.26638198, 0.0, -0.0)
		(0.312048, 0.0, -0.0)
		(0.35771304, 0.0, -0.0)
		(0.403379, 0.0, -0.0)
		(0.403379, 0.0, -0.0)
	]
	particlecolor = [
		-1
		-1
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
		0.18691601
		0.83177495
		1.0
	]
}
