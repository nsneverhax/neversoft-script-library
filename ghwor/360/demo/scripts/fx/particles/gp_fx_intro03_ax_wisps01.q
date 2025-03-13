gp_fx_intro03_ax_wisps01 = {
	pos = (13.106448, 0.0, 36.939472)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = textureribbontrail
	active
	attach
	align
	attachobject = guitarist
	bone = bone_guitar_body
	emitrangedims = (3.5, 2.0, 3.0)
	emit_target = (1.0, 0.0, 0.0)
	enablerotate
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, 0.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 20.0
	perparticlewind
	emittervelocityweight = 0.0
	anglespread = 360.0
	selectedwind = fxid_axwind
	dragcoeff = 0.0
	liferange = (3.0, 3.0)
	emit_rate = 10.0
	max = 0
	timeseed = 0.0
	lifetime = 12.0
	emitnum = 0
	followemitter = 0.0
	emitfunction = constant
	emitperiod = 1.0
	sizerange = [
		(0.25, 0.25)
		(0.2, 0.2)
	]
	speedrange = (8.0, 10.0)
	turbulence = (0.0, 0.0, 0.0)
	rotvel = (0.0, 0.0)
	rotveltimescale = 0.0
	emitdelaystart = 0.0
	pathfollowtime = 0.0
	history = 10
	historylistcoordinatespace = world
	color = -2250449
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
		softedge
		softedgescale = 0.2
		aoshadow = 0.0
		quadanimationfps = 0
		lightgroup = allgroups
		viewports = [
			all
		]
		fadeoutnearplane = 0.0
		fadeoutdistance = 0.1
	}
	knot = [
		(-0.41790798, 0.0, -0.016478999)
		(-0.41790798, 0.0, -0.016478999)
		(-0.35139, 0.0, -0.016478999)
		(-0.28487104, 0.0, -0.016478999)
		(-0.218353, 0.0, -0.016478999)
		(-0.073405, 0.0, -0.011515)
		(0.07154301, 0.0, -0.006551)
		(0.21649201, 0.0, -0.0015870001)
		(0.292745, 0.0, 0.010457)
		(0.368998, 0.0, 0.022502)
		(0.44525102, 0.0, 0.034546)
		(0.44525102, 0.0, 0.034546)
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
		0.23036602
		0.7326469
		1.0
	]
}
