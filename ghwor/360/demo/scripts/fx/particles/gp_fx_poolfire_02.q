gp_fx_poolfire_02 = {
	pos = (-3.8998058, -2.4253852, 13.919363)
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
	liferange = (1.5, 2.3)
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
	color = -238
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
		softedge
		softedgescale = 0.5
		aoshadow = 0.0
		quadanimationfps = 0
		lightgroup = allgroups
		fadeoutnearplane = 5.0
		fadeoutdistance = 4.0
	}
	knot = [
		(2.099135, 0.0, -6.600767)
		(2.099135, 0.0, -6.600767)
		(3.0673609, 0.0, -3.782696)
		(-2.8670259, -0.0, -5.1886907)
		(-3.9859443, 0.0, -2.0495582)
		(-4.568691, 0.0, -0.41465303)
		(-1.0638789, -0.0, -1.6750141)
		(-1.195971, -0.0, -0.057672996)
		(-1.3250309, -0.0, 1.5225528)
		(-5.253766, 0.0, 1.411595)
		(-4.841825, 0.0, 2.8713758)
		(-4.177931, 0.0, 5.2239895)
		(-0.88358, -0.0, 6.197103)
		(-0.933016, -0.0, 8.579093)
		(-0.933016, -0.0, 8.579093)
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
		0.34114796
		0.505455
		0.710736
		1.0
	]
}
