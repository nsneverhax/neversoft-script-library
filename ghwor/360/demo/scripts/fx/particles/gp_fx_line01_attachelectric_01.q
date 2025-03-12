gp_fx_line01_attachelectric_01 = {
	pos = (-14.528249, 14.373307, -10.596434)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	attach
	attachobject = z_riothouse_gfx_fx_lineghost_01
	emitrangedims = (0.0, 0.0, 0.0)
	emit_target = (0.0, 1.0, 0.0)
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, 0.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	anglespread = 360.0
	dragcoeff = 0.0
	liferange = (0.1, 0.3)
	emit_rate = 300.0
	max = 0
	timeseed = 0.0
	lifetime = 1.0
	emitnum = 0
	followemitter = 0.0
	emitfunction = constant
	emitperiod = 1.0
	sizerange = [
		(0.3, 0.3)
		(1.0, 1.5)
	]
	speedrange = (0.2, 0.2)
	turbulence = (0.0, 0.0, 0.0)
	rotvel = (2.0, -2.0)
	rotveltimescale = 2.0
	emitdelaystart = 0.0
	pathfollowtime = 4.0
	history = 8
	historylistcoordinatespace = world
	align_to = (1.0, 0.0, 0.0)
	rotate3d
	color = -419446785
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
		softedge
		softedgescale = 0.2
		aoshadow = 0.0
		quadanimationfps = 0
		lightgroup = allgroups
		fadeoutnearplane = 0.0
		fadeoutdistance = 0.1
	}
	knot = [
		(-1.6138, 0.0, 0.10919201)
		(-1.6138, 0.0, 0.10919201)
		(-1.3613989, 0.0, 0.088114)
		(-1.108999, 0.0, 0.06703701)
		(-0.856598, 0.0, 0.045959)
		(-0.524241, 0.0, 0.0023400001)
		(-0.191884, 0.0, -0.041279998)
		(0.14047201, 0.0, -0.0849)
		(0.57821697, 0.0, -0.080017)
		(1.0159609, 0.0, -0.07513401)
		(1.453705, 0.0, -0.070251)
		(1.453705, 0.0, -0.070251)
	]
	particlecolor = [
		-256
		-256
		-256
		-256
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
		0.246799
		0.57342905
		1.0
	]
}
