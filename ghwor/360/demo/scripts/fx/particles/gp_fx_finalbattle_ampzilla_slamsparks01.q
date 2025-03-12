gp_fx_finalbattle_ampzilla_slamsparks01 = {
	pos = (-4.9995785, 0.0, 3.2017891)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	attach
	align
	attachobject = z_finalbattle_trg_geo_ampzilla
	bone = bone_wrist_bend_r
	emitrangedims = (8.0, 2.0, 2.0)
	emit_target = (1.0, 0.0, 0.0)
	enablerotate
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, -4.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	radiate
	elevspread = (100.0, 120.0)
	sweepspread = (0.0, 360.0)
	dragcoeff = 0.5
	liferange = (0.5, 0.7)
	emit_rate = 60.0
	max = 0
	timeseed = 0.0
	lifetime = 0.0
	emitnum = 60
	followemitter = 0.0
	emitfunction = constant
	emitperiod = 1.0
	sizerange = [
		(0.4, 0.4)
		(0.2, 0.2)
	]
	speedrange = (8.0, 24.0)
	turbulence = (0.0, 0.0, 0.0)
	rotvel = (0.0, 0.0)
	rotveltimescale = 0.0
	emitdelaystart = 0.0
	pathfollowtime = 0.2
	history = 2
	historylistcoordinatespace = world
	color = -2518017
	lod_default
	quickmaterial = {
		texturelayout = layout2x2
		layoutn = 1
		layoutm = 1
		diffusetextureenabled
		diffusetexture = ph_sparks_01
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
		(-0.998441, 0.0, -0.0)
		(-0.998441, 0.0, -0.0)
		(-0.838308, 0.0, -0.0)
		(-0.88197595, 0.0, -0.0)
		(-0.74664897, 0.0, -0.0)
		(-0.479638, 0.0, -0.0)
		(-0.09543601, 0.0, -0.0)
		(0.22051999, 0.0, -0.0)
		(0.32151103, 0.0, -0.0)
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
		0.14544
		0.704097
		1.0
	]
}
