gp_fx_sd_ampzilla_sparks01 = {
	pos = (41.76185, 4.0, 80.60878)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	attach
	attachobject = z_finalbattle_trg_geo_ampzilla
	bone = bone_shoulder_lift_r
	emitrangedims = (1.0, 1.0, 1.0)
	emit_target = (1.0, 0.0, 0.0)
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, -9.81, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	radiate
	anglespread = 360.0
	dragcoeff = 0.5
	liferange = (1.5, 2.0)
	emit_rate = 64.0
	max = 0
	timeseed = 0.0
	lifetime = 0.0
	emitnum = 0
	followemitter = 0.0
	emitfunction = sin
	emitperiod = 1.7
	sizerange = [
		(0.2, 0.2)
		(0.1, 0.1)
	]
	speedrange = (12.0, 20.0)
	turbulence = (1.0, 3.0, -3.0)
	rotvel = (0.0, 0.0)
	rotveltimescale = 0.0
	emitdelaystart = 0.4
	pathfollowtime = 0.0
	history = 2
	historylistcoordinatespace = world
	color = -13026817
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
