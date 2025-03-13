gp_fx_line01_attachsparkribbons_01 = {
	pos = (-14.528249, 14.522113, -10.531492)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = textureribbontrail
	active
	attach
	attachobject = z_riothouse_gfx_fx_lineghost_01
	emitrangedims = (0.0, 0.0, 0.0)
	emit_target = (0.0, 1.0, 0.0)
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, -10.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	anglespread = 300.0
	dragcoeff = 0.0
	liferange = (0.3, 1.0)
	emit_rate = 200.0
	max = 0
	timeseed = 0.0
	lifetime = 1.0
	emitnum = 0
	followemitter = 0.0
	emitfunction = constant
	emitperiod = 0.1
	sizerange = [
		(0.06, 0.06)
		(0.02, 0.02)
	]
	speedrange = (5.0, 8.0)
	turbulence = (0.0, 0.0, 0.0)
	rotvel = (0.0, 0.0)
	rotveltimescale = 0.0
	emitdelaystart = 0.0
	pathfollowtime = 0.03
	history = 4
	historylistcoordinatespace = world
	color = -486558465
	lod_default
	quickmaterial = {
		layoutn = 1
		layoutm = 1
		diffusetextureenabled
		diffusetexture = jow_spark01
		specularpower = 0
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
		(-1.5869961, 0.0, 0.111724)
		(-1.5869961, 0.0, 0.111724)
		(-1.4003559, 0.0, 0.114843)
		(-1.213716, 0.0, 0.117961995)
		(-1.0270759, 0.0, 0.12108)
		(-0.36688104, 0.0, 0.070573)
		(0.293313, 0.0, 0.020066999)
		(0.953507, 0.0, -0.030439999)
		(1.189193, 0.0, -0.087748)
		(1.4248788, 0.0, -0.145055)
		(1.660564, 0.0, -0.20236202)
		(1.660564, 0.0, -0.20236202)
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
		0.171043
		0.777748
		1.0
	]
}
