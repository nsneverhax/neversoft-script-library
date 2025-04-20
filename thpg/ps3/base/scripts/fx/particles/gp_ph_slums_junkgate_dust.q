GP_PH_Slums_JunkGate_Dust = {
	pos = (-1.9555639, -3.8985639, -2.5343168)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	attach
	align
	applypositionoffset
	attachobject = Z_Slums_junkgate1
	emitrangedims = (0.05, 0.0, 0.05)
	emit_target = (0.0, 1.0, 0.0)
	enablerotate
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, -0.5, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	anglespread = 100.0
	liferange = (0.5, 1.0)
	emit_rate = 150.0
	max = 0
	timeseed = 0.0
	lifetime = 0.7
	emitnum = 0
	followemitter = 0.0
	fillpath
	emitfunction = constant
	emitperiod = 1.0
	sizerange = [
		(0.3, 0.3)
		(1.0, 1.0)
	]
	speedrange = (1.0, 1.0)
	rotvel = (1.0, -1.0)
	rotveltimescale = 1.0
	emitdelaystart = 0.0
	pathfollowtime = 0.05
	history = 1
	historylistcoordinatespace = world
	color = -1
	lod_default
	quickmaterial = {
		texturelayout = layout2x2
		diffusetextureenabled
		diffusetexture = jow_steam02
		specularpower = 0
		alphacutoff = 1
		blendmode = blend
		softedge
		softedgescale = 1.0
		quadanimationfps = 0
	}
	knot = [
		(-0.269531, 0.0, 0.25048798)
		(-0.269531, 0.0, 0.25048798)
		(-0.089844, 0.0, 0.083496)
		(0.089844, 0.0, -0.083496)
		(0.269531, 0.0, -0.25048798)
		(0.269531, 0.0, -0.25048798)
	]
	particlecolor = [
		-1517061889
		1817856767
		-1517062144
		1817856512
	]
	vertexweight = [
		1.0
	]
}
