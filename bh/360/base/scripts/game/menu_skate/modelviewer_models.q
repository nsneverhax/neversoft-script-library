modelviewer_axel = {
	CAS_Body = {
		desc_id = GH4_CAR_Male
	}
	CAS_Male_Physique = {
		desc_id = MalePhysiqueUntouched
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
		text = qs(0xfe2ba776)
		Profile = $modelviewer_axel
		animLoadScript = animload_Sk9_skater_acc
		skeletonName = GH3_Guitarist_Axel
		Defaultanim = PedM_Idle00_F
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
		text = qs(0x2a410443)
		array = $modelviewer_pros
	}
	{
		text = qs(0xe393b161)
		array = $modelviewer_peds
	}
	{
		text = qs(0xe2dba683)
		array = $modelviewer_heads
	}
	{
		text = qs(0x4af4b224)
		array = $modelviewer_animals
	}
	{
		text = qs(0xff44cdfc)
		array = $modelviewer_cars
	}
]
