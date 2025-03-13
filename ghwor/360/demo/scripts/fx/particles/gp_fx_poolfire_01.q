gp_fx_poolfire_01 = {
	pos = (3.645305, -2.4253852, 15.588816)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	splineemitter
	emitrangedims = (0.1, 0.1, 0.1)
	emit_target = (0.0, 1.0, 0.0)
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, 0.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	anglespread = 45.0
	dragcoeff = 0.0
	liferange = (1.0, 2.4)
	emit_rate = 100.0
	max = 0
	timeseed = 0.0
	lifetime = 0.0
	emitnum = 0
	followemitter = 0.0
	emitfunction = constant
	emitperiod = 1.0
	sizerange = [
		(1.5, 1.0)
		(1.3, 3.0)
	]
	speedrange = (0.1, 0.1)
	turbulence = (0.0, 0.0, 0.0)
	rotvel = (0.0, 0.0)
	rotveltimescale = 0.0
	emitdelaystart = 0.0
	pathfollowtime = 40.0
	history = 2
	historylistcoordinatespace = world
	color = -222
	lod_default
	quickmaterial = {
		texturelayout = layout2x2
		layoutn = 1
		layoutm = 1
		diffusetextureenabled
		diffusetexture = ph_fire_quad_01
		specularpower = 0
		bloom
		alphacutoff = 1
		blendmode = add
		aoshadow = 0.0
		quadanimationfps = 0
		lightgroup = allgroups
		fadeoutnearplane = 5.0
		fadeoutdistance = 4.0
	}
	knot = [
		(-3.984503, 0.0, -5.533207)
		(-3.984503, 0.0, -5.533207)
		(-1.6999589, 0.0, -2.715136)
		(0.46852, 0.0, -6.02917)
		(2.161654, 0.0, -3.276942)
		(3.043462, 0.0, -1.843544)
		(0.849208, 0.0, -0.68135697)
		(0.36884, 0.0, 0.279378)
		(-0.100504, 0.0, 1.218066)
		(3.249598, 0.0, 1.984641)
		(2.837657, 0.0, 3.444422)
		(2.173763, 0.0, 5.797038)
		(-3.1611867, 0.0, 5.8159695)
		(-3.1117518, 0.0, 8.197965)
		(-3.1117518, 0.0, 8.197965)
	]
	particlecolor = [
		900005632
		1560241920
		900005887
		1560242175
		900005887
		1560242175
		900005758
		1560242042
		900005632
		1560241920
	]
	burnpervertex = [
		1.0
		1.0
		1.0
		1.0
		1.0
	]
	vertexweight = [
		0.297075
		0.479014
		0.661789
		1.0
	]
}
