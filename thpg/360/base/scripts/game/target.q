targettypes = {
	object = {
		priority = 0.0
		ReticleColor = [
			128
			128
			128
			128
		]
		inert
	}
	hostile = {
		priority = 1.0
		ReticleColor = [
			128
			16
			16
			128
		]
		autoaimactive
		deadeyeactive
		aimsticky
		desirable
		verydesirable
		validmeleetarget
	}
	ally = {
		priority = 0.7
		ReticleColor = [
			16
			128
			16
			128
		]
		validmeleetarget
	}
	bystander = {
		priority = 0.5
		ReticleColor = [
			16
			16
			128
			128
		]
		desirable
		validmeleetarget
	}
	Dynamite = {
		priority = 1.0
		ReticleColor = [
			128
			16
			16
			128
		]
		deadeyeactive
		aimsticky
		desirable
		pointcollisionwithreticleradius
	}
	Barrel = {
		priority = 1.0
		ReticleColor = [
			128
			16
			16
			128
		]
		aimsticky
		desirable
		pointcollisionwithreticleradius
	}
	ShootableObject = {
		priority = 0.5
		ReticleColor = [
			128
			128
			128
			128
		]
		desirable
		pointcollisionwithreticleradius
	}
	TriggerGeo = {
		ReticleColor = [
			128
			16
			16
			128
		]
	}
}
Object_TNTBarrel01_bounding_sphere_radius = 1
Object_WhiskeyBarrel01_bounding_sphere_radius = 1
Object_PowderKeg01_bounding_sphere_radius = 1
