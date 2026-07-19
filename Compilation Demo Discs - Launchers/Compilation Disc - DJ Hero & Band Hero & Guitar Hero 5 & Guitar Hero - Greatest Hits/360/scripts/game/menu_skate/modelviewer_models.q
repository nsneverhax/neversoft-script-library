modelviewer_axel = {
	CAS_Body = {
		desc_id = GH4_CAR_Male
	}
	cas_physique = {
		desc_id = MalePhysique
	}
	CAS_Male_Torso = {
		desc_id = M_Punk_Torso_Jacket
	}
	CAS_Male_Legs = {
		desc_id = M_Punk_Legs_Camo
	}
}
modelviewer_pros = [
	{
		text = qs("\LAxel")
		profile = $modelviewer_axel
		animLoadScript = animload_Sk9_skater_acc
		SkeletonName = GH3_Guitarist_Axel
		defaultAnim = PedM_Idle00_F
	}
]
modelviewer_peds = [
]
modelviewer_heads = [
]
modelviewer_animals = [
]
modelviewer_cars = [
]
modelviewer_categories = [
	{
		text = qs("\LView Pros")
		array = $modelviewer_pros
	}
	{
		text = qs("\LView Peds")
		array = $modelviewer_peds
	}
	{
		text = qs("\LView Cutscene Heads")
		array = $modelviewer_heads
	}
	{
		text = qs("\LView Animals")
		array = $modelviewer_animals
	}
	{
		text = qs("\LView Cars")
		array = $modelviewer_cars
	}
]
