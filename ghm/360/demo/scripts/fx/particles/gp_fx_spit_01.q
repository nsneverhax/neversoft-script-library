gp_fx_spit_01 = {
	pos = (0.0, 0.0, -0.0)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = textureribbontrail
	active
	createdatstart
	attach
	align
	applypositionoffset
	attachobject = vocalist
	bone = bone_tongue
	emitrangedims = (0.0, 0.0, 0.0)
	emit_target = (0.0, 1.0, 0.0)
	enablerotate
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, -5.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	radiate
	anglespread = 30.0
	liferange = (0.3, 0.6)
	emit_rate = 200.0
	max = 0
	timeseed = 0.0
	lifetime = 0.3
	emitnum = 0
	followemitter = 0.0
	fillpath
	emitfunction = constant
	emitperiod = 1.0
	sizerange = [
		(0.01, 0.01)
		(0.01, 0.01)
	]
	speedrange = (0.5, 4.0)
	rotvel = (0.5, -0.5)
	rotveltimescale = 0.5
	emitdelaystart = 0.0
	pathfollowtime = 0.0
	history = 3
	historylistcoordinatespace = object
	color = -170
	lod_default
	quickmaterial = {
		diffusetextureenabled
		diffusetexture = jow_spark01
		specularpower = 0
		alphacutoff = 1
		blendmode = add
		quadanimationfps = 0
	}
	knot = [
		(-13.43569, 0.0, 0.029422998)
		(-13.43569, 0.0, 0.029422998)
		(-12.927258, 0.0, 0.016345998)
		(-12.418823, 0.0, 0.003269)
		(-11.910389, 0.0, -0.009807999)
		(-8.93138, 0.0, -0.009807999)
		(-5.952371, 0.0, -0.009807999)
		(-2.973362, 0.0, -0.009807999)
		(2.9005432, 0.0, -0.009807999)
		(8.774445, 0.0, -0.009807999)
		(14.6483555, 0.0, -0.009807999)
		(14.6483555, 0.0, -0.009807999)
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
	vertexweight = [
		0.054329004
		0.37254798
		1.0
	]
}
