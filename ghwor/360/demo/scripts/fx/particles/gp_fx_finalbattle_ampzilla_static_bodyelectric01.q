gp_fx_finalbattle_ampzilla_static_bodyelectric01 = {
	pos = (5.0, 1.0, -0.0)
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
	bone = bone_stomach_lower
	emitrangedims = (1.0, 1.0, 3.0)
	emit_target = (1.0, 0.0, 0.0)
	enablerotate
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, 0.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	radiate
	elevspread = (80.0, 100.0)
	sweepspread = (0.0, 360.0)
	dragcoeff = 0.0
	liferange = (0.1, 0.1)
	emit_rate = 12.0
	max = 0
	timeseed = 0.0
	lifetime = 0.0
	emitnum = 0
	followemitter = 1.0
	emitfunction = onoff
	emitperiod = 1.5
	sizerange = [
		(2.0, 2.0)
		(6.0, 6.0)
	]
	speedrange = (0.0, 0.0)
	turbulence = (0.0, 0.0, 0.0)
	rotvel = (-5.0, 5.0)
	rotveltimescale = 1.0
	emitdelaystart = 0.0
	pathfollowtime = 0.0
	history = 2
	historylistcoordinatespace = world
	color = 1149435903
	lod_default
	quickmaterial = {
		layoutn = 1
		layoutm = 1
		diffusetextureenabled
		diffusetexture = ph_electricity_01
		specularpower = 0
		bloom
		fillburst
		alphacutoff = 1
		blendmode = add
		softedge
		softedgescale = 1.0
		aoshadow = 0.0
		quadanimationfps = 0
		lightgroup = allgroups
		fadeoutnearplane = 0.0
		fadeoutdistance = 0.1
	}
	knot = [
		(-0.64545804, 0.0, -0.0)
		(-0.64545804, 0.0, -0.0)
		(-0.47491202, 0.0, -0.0)
		(-0.304366, 0.0, -0.0)
		(-0.13382, 0.0, -0.0)
		(0.088232, 0.0, -0.0)
		(0.310284, 0.0, -0.0)
		(0.53233594, 0.0, -0.0)
		(0.53233594, 0.0, -0.0)
	]
	particlecolor = [
		-1
		-1
		-1
		-1
		-1
		-1
	]
	burnpervertex = [
		1.0
		1.0
		1.0
	]
	vertexweight = [
		0.43440402
		1.0
	]
}
