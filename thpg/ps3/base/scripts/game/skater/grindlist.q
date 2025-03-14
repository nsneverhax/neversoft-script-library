SpecialGrindTricks = [
	{
		trigger = {
			TripleInOrder
			up
			right
			triangle
			400
		}
		duration = 400
		trickslot = SpGrind_U_R_Triangle
	}
	{
		trigger = {
			TripleInOrder
			up
			down
			triangle
			400
		}
		duration = 400
		trickslot = SpGrind_U_D_Triangle
	}
	{
		trigger = {
			TripleInOrder
			up
			left
			triangle
			400
		}
		duration = 400
		trickslot = SpGrind_U_L_Triangle
	}
	{
		trigger = {
			TripleInOrder
			right
			up
			triangle
			400
		}
		duration = 400
		trickslot = SpGrind_R_U_Triangle
	}
	{
		trigger = {
			TripleInOrder
			right
			down
			triangle
			400
		}
		duration = 400
		trickslot = SpGrind_R_D_Triangle
	}
	{
		trigger = {
			TripleInOrder
			right
			left
			triangle
			400
		}
		duration = 400
		trickslot = SpGrind_R_L_Triangle
	}
	{
		trigger = {
			TripleInOrder
			down
			up
			triangle
			400
		}
		duration = 400
		trickslot = SpGrind_D_U_Triangle
	}
	{
		trigger = {
			TripleInOrder
			down
			right
			triangle
			400
		}
		duration = 400
		trickslot = SpGrind_D_R_Triangle
	}
	{
		trigger = {
			TripleInOrder
			down
			left
			triangle
			400
		}
		duration = 400
		trickslot = SpGrind_D_L_Triangle
	}
	{
		trigger = {
			TripleInOrder
			left
			up
			triangle
			400
		}
		duration = 400
		trickslot = SpGrind_L_U_Triangle
	}
	{
		trigger = {
			TripleInOrder
			left
			right
			triangle
			400
		}
		duration = 400
		trickslot = SpGrind_L_R_Triangle
	}
	{
		trigger = {
			TripleInOrder
			left
			down
			triangle
			400
		}
		duration = 400
		trickslot = SpGrind_L_D_Triangle
	}
]
Trick_TailblockSlide = {
	params = {
		name = "Tailblock Slide"
		isspecial
	}
	template = $Template1
	prefix = 'Trick_TailblockSlide'
}
Trick_CrossfootBoard = {
	params = {
		name = "Crossfoot Boardslide"
		isspecial
	}
	template = $Template1
	prefix = 'Trick_CrossfootBoard'
}
Trick_OneFootSmith = {
	params = {
		name = "One Foot Smith"
		isspecial
	}
	template = $Template1
	prefix = 'Trick_OneFootSmith'
}
Trick_Darkslide = {
	params = {
		name = "Darkslide"
		isspecial
	}
	template = $Template1
	prefix = 'Trick_Darkslide'
}
Trick_SmithtoSmith = {
	params = {
		name = "Chocolate Jammy"
		isspecial
	}
	template = $Template1
	prefix = 'Trick_SmithtoSmith'
}
Trick_Nose3flipFiveO = {
	params = {
		name = "Nosegrind 360 Flip 5-0"
		isspecial
	}
	template = $Template1
	prefix = 'Trick_Nose3flipFiveO'
}
Trick_BoardslideBodyVarial = {
	params = {
		name = "Boardslide Body Varial"
		isspecial
	}
	template = $Template1
	prefix = 'Trick_BoardslideBodyVarial'
}
Trick_TailslideBackflip = {
	params = {
		name = "Tailslide Backflip"
		isspecial
	}
	template = $Template1
	prefix = 'Trick_TailslideBackflip'
}
Trick_CoffinGrind = {
	params = {
		name = "Coffin Grind"
		isspecial
	}
	template = $Template1
	prefix = 'Trick_CoffinGrind'
}
Trick_WaxTheRail = {
	params = {
		name = "Wax The Rail"
		isspecial
	}
	template = $Template1
	prefix = 'Trick_WaxTheRail'
}
Trick_BoardslideHandDrag = {
	params = {
		name = "Boardslide Hand Drag"
		isspecial
	}
	template = $Template1
	prefix = 'Trick_BoardslideHandDrag'
}
grindtricks = [
	{
		trigger = {
			TripleInOrder
			a = up
			b = up
			triangle
			400
		}
		duration = 1000
		template = $Template1
		prefix = 'Trick_Nosebluntslide'
	}
	{
		trigger = {
			TripleInOrder
			a = down
			b = down
			triangle
			400
		}
		duration = 1000
		template = $Template1
		prefix = 'Trick_Bluntslide'
	}
]
Template1 = [
	'_BS'
	'_FS'
	'_BS'
	'_FS'
	'_BS_180'
	'_FS_180'
	'_BS_180'
	'_FS_180'
	'_FS'
	'_BS'
	'_FS'
	'_BS'
	'_FS_180'
	'_BS_180'
	'_FS_180'
	'_BS_180'
]
Template2 = [
	''
	''
	''
	''
	'_180'
	'_180'
	'_180'
	'_180'
	''
	''
	''
	''
	'_180'
	'_180'
	'_180'
	'_180'
]
Template3 = [
	''
	''
	''
	''
	''
	''
	''
	''
	''
	''
	''
	''
	''
	''
	''
	''
]
grindtricklist = [
	[
		Trick_Boardslide_BS
		Trick_LipSlide_FS
		Trick_5050_BS
		Trick_5050_FS
		Trick_LipSlide_BS
		Trick_BoardSlide_FS
		Trick_5050_FS_180
		Trick_5050_BS_180
		Trick_LipSlide_FS
		Trick_Boardslide_BS
		Trick_5050_FS
		Trick_5050_BS
		Trick_BoardSlide_FS
		Trick_LipSlide_BS
		Trick_5050_FS_180
		Trick_5050_BS_180
	]
	[
		Trick_NoseGrind_BS
		Trick_NoseGrind_FS
		Trick_NoseGrind_BS
		Trick_NoseGrind_FS
		Trick_NoseGrind_BS_180
		Trick_NoseGrind_FS_180
		Trick_NoseGrind_BS_180
		Trick_NoseGrind_FS_180
		Trick_NoseGrind_FS
		Trick_NoseGrind_BS
		Trick_NoseGrind_FS
		Trick_NoseGrind_BS
		Trick_NoseGrind_FS_180
		Trick_NoseGrind_BS_180
		Trick_NoseGrind_FS_180
		Trick_NoseGrind_BS_180
	]
	[
		Trick_5_0_BS
		Trick_5_0_FS
		Trick_5_0_BS
		Trick_5_0_FS
		Trick_5_0_BS_180
		Trick_5_0_FS_180
		Trick_5_0_BS_180
		Trick_5_0_FS_180
		Trick_5_0_FS
		Trick_5_0_BS
		Trick_5_0_FS
		Trick_5_0_BS
		Trick_5_0_FS_180
		Trick_5_0_BS_180
		Trick_5_0_FS_180
		Trick_5_0_BS_180
	]
	[
		Trick_Boardslide_BS
		Trick_LipSlide_FS
		Trick_Tailslide_BS
		Trick_Noseslide_FS
		Trick_LipSlide_BS
		Trick_BoardSlide_FS
		Trick_Tailslide_BS_180
		Trick_Noseslide_FS_180
		Trick_LipSlide_FS
		Trick_Boardslide_BS
		Trick_Tailslide_FS
		Trick_Noseslide_BS
		Trick_BoardSlide_FS
		Trick_LipSlide_BS
		Trick_TailSlide_FS_180
		Trick_Noseslide_BS_180
	]
	[
		Trick_Boardslide_BS
		Trick_LipSlide_FS
		Trick_Noseslide_BS
		Trick_Tailslide_FS
		Trick_LipSlide_BS
		Trick_BoardSlide_FS
		Trick_Noseslide_BS_180
		Trick_TailSlide_FS_180
		Trick_LipSlide_FS
		Trick_Boardslide_BS
		Trick_Noseslide_FS
		Trick_Tailslide_BS
		Trick_BoardSlide_FS
		Trick_LipSlide_BS
		Trick_Noseslide_FS_180
		Trick_Tailslide_BS_180
	]
	[
		Trick_Overcrook_BS
		Trick_Crooked_FS
		Trick_Overcrook_BS
		Trick_Crooked_FS
		Trick_Overcrook_BS_180
		Trick_Crooked_FS_rot
		Trick_Overcrook_BS_180
		Trick_Crooked_FS_180
		Trick_Overcrook_FS
		Trick_Crooked_BS
		Trick_Overcrook_FS
		Trick_Crooked_BS
		Trick_Overcrook_FS_rot
		Trick_Crooked_BS_180
		Trick_Overcrook_FS_180
		Trick_Crooked_BS_180
	]
	[
		Trick_Crooked_BS
		Trick_Overcrook_FS
		Trick_Crooked_BS
		Trick_Overcrook_FS
		Trick_Crooked_BS_180
		Trick_Overcrook_FS_rot
		Trick_Crooked_BS_180
		Trick_Overcrook_FS_180
		Trick_Crooked_FS
		Trick_Overcrook_BS
		Trick_Crooked_FS
		Trick_Overcrook_BS
		Trick_Crooked_FS_rot
		Trick_Overcrook_BS_180
		Trick_Crooked_FS_180
		Trick_Overcrook_BS_180
	]
	[
		Trick_Smith_BS
		Trick_Feeble_FS
		Trick_Smith_BS
		Trick_Feeble_FS
		Trick_Smith_BS_180
		Trick_Feeble_FS_rot
		Trick_Smith_BS_180
		Trick_Feeble_FS_180
		Trick_Smith_FS
		Trick_Feeble_BS
		Trick_Smith_FS
		Trick_Feeble_BS
		Trick_Smith_FS_rot
		Trick_Feeble_BS_180
		Trick_Smith_FS_180
		Trick_Feeble_BS_180
	]
	[
		Trick_Feeble_BS
		Trick_Smith_FS
		Trick_Feeble_BS
		Trick_Smith_FS
		Trick_Feeble_BS_180
		Trick_Smith_FS_rot
		Trick_Feeble_BS_180
		Trick_Smith_FS_180
		Trick_Feeble_FS
		Trick_Smith_BS
		Trick_Feeble_FS
		Trick_Smith_BS
		Trick_Feeble_FS_rot
		Trick_Smith_BS_180
		Trick_Feeble_FS_180
		Trick_Smith_BS_180
	]
]
