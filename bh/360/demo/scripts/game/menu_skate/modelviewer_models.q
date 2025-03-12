modelviewer_axel = {
	cas_body = {
		desc_id = gh4_car_male
	}
	cas_male_physique = {
		desc_id = malephysiqueuntouched
	}
	cas_male_torso = {
		desc_id = m_punk_torso_jacket
	}
	cas_male_legs = {
		desc_id = m_punk_legs_camo
	}
}
modelviewer_pros = [
	{
		text = qs(0xfe2ba776)
		profile = $modelviewer_axel
		animloadscript = animload_sk9_skater_acc
		skeletonname = gh3_guitarist_axel
		defaultanim = pedm_idle00_f
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
