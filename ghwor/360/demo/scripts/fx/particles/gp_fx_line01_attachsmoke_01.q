gp_fx_line01_attachsmoke_01 = {
	pos = (-14.528249, 14.373307, -10.753295)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	attach
	attachobject = z_riothouse_gfx_fx_lineghost_01
	emitrangedims = (0.0, 0.0, 0.0)
	emit_target = (0.0, 1.0, 0.0)
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, 0.0, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	anglespread = 60.0
	dragcoeff = 0.0
	liferange = (1.0, 1.5)
	emit_rate = 10.0
	max = 0
	timeseed = 0.0
	lifetime = 1.5
	emitnum = 0
	followemitter = 0.0
	emitfunction = constant
	emitperiod = 1.0
	sizerange = [
		(2.0, 2.0)
		(7.0, 7.0)
	]
	speedrange = (0.5, 1.0)
	turbulence = (0.0, 0.0, 0.0)
	rotvel = (0.5, -0.5)
	rotveltimescale = 0.5
	emitdelaystart = 0.0
	pathfollowtime = 4.0
	history = 3
	historylistcoordinatespace = world
	color = -1245277096
	lod_default
	quickmaterial = {
		layoutn = 1
		layoutm = 1
		diffusetextureenabled
		diffusetexture = ph_smoke_singlepuff_blend_02
		specularpower = 0
		alphacutoff = 1
		blendmode = add
		softedge
		softedgescale = 0.2
		aoshadow = 0.0
		quadanimationfps = 0
		lightgroup = allgroups
		fadeoutnearplane = 0.0
		fadeoutdistance = 0.1
	}
	knot = [
		(-1.6138, 0.0, 0.10919201)
		(-1.6138, 0.0, 0.10919201)
		(-1.3613989, 0.0, 0.088114)
		(-1.108999, 0.0, 0.06703701)
		(-0.856598, 0.0, 0.045959)
		(-0.524241, 0.0, 0.0023400001)
		(-0.191884, 0.0, -0.041279998)
		(0.14047201, 0.0, -0.0849)
		(0.57821697, 0.0, -0.080017)
		(1.0159609, 0.0, -0.07513401)
		(1.453705, 0.0, -0.070251)
		(1.453705, 0.0, -0.070251)
	]
	particlecolor = [
		-256
		-256
		-1
		-1
		-1701143809
		1852731135
		-1701144064
		1852730880
	]
	burnpervertex = [
		0.0
		0.0
		1.0
		1.0
	]
	vertexweight = [
		0.246799
		0.57342905
		1.0
	]
}
