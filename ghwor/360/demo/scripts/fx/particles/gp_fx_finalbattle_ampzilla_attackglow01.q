gp_fx_finalbattle_ampzilla_attackglow01 = {
	pos = (4.0, 0.0, -0.0)
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
	bone = bone_palm_twist_r
	emitrangedims = (2.0, 2.0, 2.0)
	emit_target = (1.0, 0.0, 0.0)
	enablerotate
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, 0.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	anglespread = 0.0
	dragcoeff = 0.0
	liferange = (0.3, 0.3)
	emit_rate = 16.0
	max = 0
	timeseed = 0.0
	lifetime = 1.5
	emitnum = 0
	followemitter = 1.0
	emitfunction = sawtooth
	emitperiod = 1.5
	sizerange = [
		(1.0, 1.0)
		(2.0, 2.0)
	]
	speedrange = (0.0, 0.0)
	turbulence = (0.0, 0.0, 0.0)
	rotvel = (0.0, 0.0)
	rotveltimescale = 1.0
	emitdelaystart = 0.0
	pathfollowtime = 0.2
	history = 2
	historylistcoordinatespace = world
	color = 1452212223
	lod_default
	quickmaterial = {
		layoutn = 1
		layoutm = 1
		diffusetextureenabled
		diffusetexture = ph_radialglow_01
		specularpower = 0
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
