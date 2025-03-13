gp_fx_hw_shota_muzzlesparks01 = {
	pos = (0.4, 0.0, -0.0)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	attach
	align
	applypositionoffset
	attachobject = musician1
	bone = bone_guitar_fret_pos
	emitrangedims = (0.1, 1.0, 1.0)
	emit_target = (1.0, 0.0, 0.0)
	enablerotate
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, 0.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	radiate
	elevspread = (90.0, 95.0)
	sweepspread = (0.0, 360.0)
	dragcoeff = 0.0
	liferange = (0.2, 0.25)
	emit_rate = 128.0
	max = 0
	timeseed = 0.0
	lifetime = 0.1
	emitnum = 0
	followemitter = 0.0
	emitfunction = constant
	emitperiod = 1.0
	sizerange = [
		(0.05, 0.05)
		(0.05, 0.05)
	]
	speedrange = (10.0, 12.0)
	turbulence = (0.0, 0.0, 0.0)
	rotvel = (-0.05, 1.0)
	rotveltimescale = 1.0
	emitdelaystart = 0.2
	alignwithpath
	pathfollowtime = 0.05
	history = 2
	historylistcoordinatespace = world
	color = -10987265
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
		(-0.81666, 0.0, -0.0)
		(-0.81666, 0.0, -0.0)
		(-0.7622169, 0.0, -0.0)
		(-0.707773, 0.0, -0.0)
		(-0.65333, 0.0, -0.0)
		(-0.517215, 0.0, -0.0)
		(-0.381101, 0.0, -0.0)
		(-0.24498601, 0.0, -0.0)
		(0.027229998, 0.0, -0.0)
		(0.299446, 0.0, -0.0)
		(0.571662, 0.0, -0.0)
		(0.571662, 0.0, -0.0)
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
		0.117646
		0.411773
		1.0
	]
}
