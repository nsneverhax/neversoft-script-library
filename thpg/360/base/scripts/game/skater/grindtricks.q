Trick_5050_params = {
	AnimData = $fiftyfifty_data
	score = 100
	type = Grind
	OneFoot = front
	grindbail = FiftyFiftyFall
}

script Trick_5050_BS \{name = "BS 50-50"}
	Grind {$Trick_5050_params name = <name> rootname = <rootname> backwardscript = Trick_5050_BS varial_script = Trick_5050_FS
		extratricks = Extra_BS_Grinds NoBlend = <NoBlend> isextra = <isextra> AnimOnly = <AnimOnly> no_anim = <no_anim>}
endscript

script Trick_5050_FS \{name = "FS 50-50"}
	Grind {$Trick_5050_params name = <name> rootname = <rootname> backwardscript = Trick_5050_FS varial_script = Trick_5050_BS
		extratricks = Extra_FS_Grinds NoBlend = <NoBlend> isextra = <isextra> AnimOnly = <AnimOnly> no_anim = <no_anim>}
endscript

script Trick_5050_BS_180 
	flipandrotate
	goto Trick_5050_BS params = {NoBlend = yes rootname = <rootname>}
endscript

script Trick_5050_FS_180 
	flipandrotate
	goto Trick_5050_FS params = {NoBlend = yes rootname = <rootname>}
endscript
Trick_Boardslide_FS_params = {
	AnimData = $fsboardslide_data
	score = 200
	GrindTweak = 14
	type = slide
	NoBlend = yes
	grindbail = BackwardsGrindBails
	extratricks = Extra_FS_Grinds
	OneFoot = FSBoard
}
Trick_Boardslide_BS_params = {
	AnimData = $bsboardslide_data
	score = 200
	GrindTweak = 14
	type = slide
	NoBlend = yes
	grindbail = GrindFallLR
	extratricks = Extra_BS_Grinds
	OneFoot = board
}

script Trick_BoardSlide_FS \{name = "FS Boardslide"
		stall_name = "FS Board Stall"}
	if NOT gotparam \{no_toggle}
		togglerailbackwards
	endif
	Grind {$Trick_Boardslide_FS_params name = <name> rootname = <rootname> stall_name = <stall_name> isextra = <isextra>
		backwardscript = Trick_Boardslide_BS varial_script = Trick_Boardslide_BS AnimOnly = <AnimOnly>}
endscript

script Trick_Boardslide_BS \{name = "BS Boardslide"
		stall_name = "BS Board Stall"}
	Grind {$Trick_Boardslide_BS_params name = <name> rootname = <rootname> stall_name = <stall_name> isextra = <isextra>
		backwardscript = trick_boardslide_backwards_bs varial_script = Trick_BoardSlide_FS AnimOnly = <AnimOnly>}
endscript

script trick_boardslide_backwards_bs 
	goto Trick_BoardSlide_FS params = {no_toggle rootname = <rootname> isextra = <isextra>}
endscript

script Trick_LipSlide_FS \{name = "FS Lipslide"
		stall_name = "FS Lip Stall"}
	Grind {$Trick_Boardslide_BS_params name = <name> rootname = <rootname> stall_name = <stall_name> isextra = <isextra>
		backwardscript = trick_lipslide_backwards_fs varial_script = Trick_LipSlide_BS AnimOnly = <AnimOnly>}
endscript

script Trick_LipSlide_BS \{name = "BS Lipslide"
		stall_name = "BS Lip Stall"}
	if NOT gotparam \{no_toggle}
		togglerailbackwards
	endif
	Grind {$Trick_Boardslide_FS_params name = <name> rootname = <rootname> stall_name = <stall_name> isextra = <isextra>
		backwardscript = Trick_LipSlide_FS varial_script = Trick_LipSlide_FS AnimOnly = <AnimOnly>}
endscript

script trick_lipslide_backwards_fs 
	goto Trick_LipSlide_BS params = {no_toggle rootname = <rootname> isextra = <isextra>}
endscript

script Trick_Tailslide_FS 
	if NOT flipped
		if ledgeleft
			if NOT ledgeright
				use_bs = 1
			elseif NOT ledgeleftlower
				use_bs = 1
			endif
		endif
	else
		if ledgeright
			if NOT ledgeleft
				use_bs = 1
			elseif ledgeleftlower
				use_bs = 1
			endif
		endif
	endif
	params = {isextra = <isextra> NoBlend = <NoBlend> rootname = <rootname> AnimOnly = <AnimOnly>}
	if gotparam use_bs
		goto Trick_Tailslide_BS_ok params = <params>
	else
		goto Trick_Tailslide_FS_ok params = <params>
	endif
endscript

script Trick_Tailslide_BS 
	if NOT flipped
		if ledgeright
			if NOT ledgeleft
				use_fs = 1
			elseif ledgeleftlower
				use_fs = 1
			endif
		endif
	else
		if ledgeleft
			if NOT ledgeright
				use_fs = 1
			elseif NOT ledgeleftlower
				use_fs = 1
			endif
		endif
	endif
	params = {isextra = <isextra> NoBlend = <NoBlend> rootname = <rootname> AnimOnly = <AnimOnly>}
	if gotparam use_fs
		goto Trick_Tailslide_FS_ok params = <params>
	else
		goto Trick_Tailslide_BS_ok params = <params>
	endif
endscript

script Trick_Tailslide_FS_ok \{name = "FS Tailslide"
		stall_name = "FS Tail Stall"}
	Grind {AnimData = $fstailslide_data name = <name> rootname = <rootname> stall_name = <stall_name> score = 150 GrindTweak = 11 type = slide NoBlend = <NoBlend>
		grindbail = GrindFallLR extratricks = Extra_FS_Grinds isextra = <isextra> OneFoot = front backwardscript = Trick_Tailslide_backwards_FS
		sparkspos = rear varial_script = Trick_Tailslide_BS_ok AnimOnly = <AnimOnly> nose_or_tail}
endscript

script Trick_Tailslide_BS_ok \{name = "BS Tailslide"
		stall_name = "BS Tail Stall"}
	Grind {AnimData = $bstailslide_data name = <name> rootname = <rootname> stall_name = <stall_name> score = 150 GrindTweak = 11 type = slide NoBlend = <NoBlend>
		grindbail = BackwardsGrindBails extratricks = Extra_BS_Grinds isextra = <isextra> OneFoot = front backwardscript = Trick_Tailslide_backwards_BS
		sparkspos = rear varial_script = Trick_Tailslide_FS_ok AnimOnly = <AnimOnly> nose_or_tail}
endscript

script Trick_TailSlide_FS_180 
	flipandrotate
	goto Trick_Tailslide_BS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_Tailslide_BS_180 
	flipandrotate
	goto Trick_Tailslide_FS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_Tailslide_backwards_FS 
	flip
	goto Trick_Tailslide_BS_ok params = {rootname = <rootname> AnimOnly = <AnimOnly> isextra = <isextra>}
endscript

script Trick_Tailslide_backwards_BS 
	flip
	goto Trick_Tailslide_FS_ok params = {rootname = <rootname> AnimOnly = <AnimOnly> isextra = <isextra>}
endscript

script Trick_Noseslide_FS 
	if NOT flipped
		if ledgeleft
			if NOT ledgeright
				use_bs = 1
			elseif NOT ledgeleftlower
				use_bs = 1
			endif
		endif
	else
		if ledgeright
			if NOT ledgeleft
				use_bs = 1
			elseif ledgeleftlower
				use_bs = 1
			endif
		endif
	endif
	params = {isextra = <isextra> NoBlend = <NoBlend> rootname = <rootname> AnimOnly = <AnimOnly>}
	if gotparam use_bs
		goto Trick_Noseslide_BS_ok params = <params>
	else
		goto Trick_Noseslide_FS_ok params = <params>
	endif
endscript

script Trick_Noseslide_BS 
	if NOT flipped
		if ledgeright
			if NOT ledgeleft
				use_fs = 1
			elseif ledgeleftlower
				use_fs = 1
			endif
		endif
	else
		if ledgeleft
			if NOT ledgeright
				use_fs = 1
			elseif NOT ledgeleftlower
				use_fs = 1
			endif
		endif
	endif
	params = {isextra = <isextra> NoBlend = <NoBlend> rootname = <rootname> AnimOnly = <AnimOnly>}
	if gotparam use_fs
		goto Trick_Noseslide_FS_ok params = <params>
	else
		goto Trick_Noseslide_BS_ok params = <params>
	endif
endscript

script Trick_Noseslide_FS_ok name = "FS Noseslide" stall_name = "FS Nose Stall"
	Grind {AnimData = $fsnoseslide_data name = <name> rootname = <rootname> stall_name = <stall_name> score = 150 GrindTweak = 11 type = slide Nollie = yes NoBlend = <NoBlend>
		grindbail = BackwardsGrindBails extratricks = Extra_FS_Grinds isextra = <isextra> OneFoot = back backwardscript = trick_noseslide_backwards_fs
		sparkspos = front varial_script = Trick_Noseslide_BS_ok AnimOnly = <AnimOnly> nose_or_tail}
endscript

script Trick_Noseslide_BS_ok name = "BS Noseslide" stall_name = "BS Nose Stall"
	Grind {AnimData = $bsnoseslide_data name = <name> rootname = <rootname> stall_name = <stall_name> score = 150 GrindTweak = 11 type = slide Nollie = yes NoBlend = <NoBlend>
		grindbail = GrindFallLR extratricks = Extra_BS_Grinds isextra = <isextra> OneFoot = back backwardscript = trick_noseslide_backwards_bs
		sparkspos = front varial_script = Trick_Noseslide_FS_ok AnimOnly = <AnimOnly> nose_or_tail}
endscript

script Trick_Noseslide_FS_180 
	flipandrotate
	goto Trick_Noseslide_BS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_Noseslide_BS_180 
	flipandrotate
	goto Trick_Noseslide_FS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script trick_noseslide_backwards_bs 
	flip
	goto Trick_Noseslide_FS params = {rootname = <rootname> AnimOnly = <AnimOnly> isextra = <isextra>}
endscript

script trick_noseslide_backwards_fs 
	flip
	goto Trick_Noseslide_BS params = {rootname = <rootname> AnimOnly = <AnimOnly> isextra = <isextra>}
endscript
Trick_NoseGrind_params = {
	AnimData = $nosegrind_data
	score = 100
	type = Grind
	sparkspos = front
	OneFoot = back
	grindbail = FiftyFiftyFall
	Nollie = yes
}

script Trick_NoseGrind_FS \{name = "FS Nosegrind"}
	Grind {$Trick_NoseGrind_params name = <name> rootname = <rootname> NoBlend = <NoBlend> extratricks = Extra_FS_Grinds
		isextra = <isextra> backwardscript = Trick_5_0_FS varial_script = Trick_NoseGrind_BS AnimOnly = <AnimOnly>}
endscript

script Trick_NoseGrind_BS \{name = "BS Nosegrind"}
	Grind {$Trick_NoseGrind_params name = <name> rootname = <rootname> NoBlend = <NoBlend> extratricks = Extra_BS_Grinds
		isextra = <isextra> backwardscript = Trick_5_0_BS varial_script = Trick_NoseGrind_FS AnimOnly = <AnimOnly>}
endscript

script Trick_NoseGrind_BS_180 
	flipandrotate
	goto Trick_NoseGrind_FS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_NoseGrind_FS_180 
	flipandrotate
	goto Trick_NoseGrind_BS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript
Trick_5_0_params = {
	AnimData = $fiveo_data
	score = 100
	type = Grind
	sparkspos = rear
	OneFoot = front
	grindbail = FiftyFiftyFall
}

script Trick_5_0_FS \{name = "FS 5-0"}
	Grind {$Trick_5_0_params name = <name> rootname = <rootname> NoBlend = <NoBlend> extratricks = Extra_FS_Grinds
		isextra = <isextra> backwardscript = Trick_NoseGrind_FS varial_script = Trick_5_0_BS AnimOnly = <AnimOnly>}
endscript

script Trick_5_0_BS \{name = "BS 5-0"}
	Grind {$Trick_5_0_params name = <name> rootname = <rootname> NoBlend = <NoBlend> extratricks = Extra_BS_Grinds
		isextra = <isextra> backwardscript = Trick_NoseGrind_BS varial_script = Trick_5_0_FS AnimOnly = <AnimOnly>}
endscript

script Trick_5_0_FS_180 
	flipandrotate
	goto Trick_5_0_BS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_5_0_BS_180 
	flipandrotate
	goto Trick_5_0_FS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript
Trick_Crooked_params = {
	score = 125
	GrindTweak = 9
	type = Grind
	sparkspos = front
	OneFoot = back
	grindbail = FiftyFiftyFall
	Nollie = yes
}

script Trick_Crooked_FS \{name = "FS Crooked"}
	Grind {$Trick_Crooked_params AnimData = $fscrook_data name = <name> rootname = <rootname> NoBlend = <NoBlend>
		extratricks = Extra_FS_Grinds isextra = <isextra> backwardscript = Trick_5_0_FS varial_script = Trick_Crooked_BS}
endscript

script Trick_Crooked_FS_rot 
	rotate
	goto Trick_Crooked_FS params = {rootname = <rootname>}
endscript

script Trick_Crooked_BS \{name = "BS Crooked"}
	Grind {$Trick_Crooked_params AnimData = $bscrook_data name = <name> rootname = <rootname> NoBlend = <NoBlend>
		extratricks = Extra_BS_Grinds isextra = <isextra> backwardscript = Trick_5_0_BS varial_script = Trick_Crooked_FS AnimOnly = <AnimOnly>}
endscript

script Trick_Crooked_FS_180 
	flipandrotate
	goto Trick_Crooked_BS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_Crooked_BS_180 
	flipandrotate
	goto Trick_Crooked_FS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_Overcrook_FS_rot 
	rotate
	goto Trick_Overcrook_FS params = {rootname = <rootname>}
endscript

script Trick_Overcrook_FS \{name = "FS Overcrook"}
	Grind {$Trick_Crooked_params AnimData = $bscrook_data name = <name> rootname = <rootname> NoBlend = <NoBlend>
		extratricks = Extra_FS_Grinds isextra = <isextra> backwardscript = Trick_5_0_FS varial_script = Trick_Overcrook_BS AnimOnly = <AnimOnly>}
endscript

script Trick_Overcrook_BS \{name = "BS Overcrook"}
	Grind {$Trick_Crooked_params AnimData = $fscrook_data name = <name> rootname = <rootname> NoBlend = <NoBlend>
		extratricks = Extra_BS_Grinds isextra = <isextra> backwardscript = Trick_5_0_BS varial_script = Trick_Overcrook_FS AnimOnly = <AnimOnly>}
endscript

script Trick_Overcrook_FS_180 
	flipandrotate
	goto Trick_Overcrook_BS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_Overcrook_BS_180 
	flipandrotate
	goto Trick_Overcrook_FS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript
Trick_Smith_params = {
	score = 125
	GrindTweak = 9
	type = Grind
	sparkspos = rear
	OneFoot = front
	grindbail = FiftyFiftyFall
}

script Trick_Smith_FS \{name = "FS Smith"}
	Grind {$Trick_Smith_params AnimData = $fssmith_data name = <name> rootname = <rootname> NoBlend = <NoBlend>
		extratricks = Extra_FS_Grinds isextra = <isextra> backwardscript = trick_smith_backwards_fs varial_script = Trick_Smith_BS AnimOnly = <AnimOnly>}
endscript

script Trick_Smith_FS_rot 
	rotate
	goto Trick_Smith_FS params = {rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_Smith_BS \{name = "BS Smith"}
	Grind {$Trick_Smith_params AnimData = $bssmith_data name = <name> rootname = <rootname> NoBlend = <NoBlend>
		extratricks = Extra_BS_Grinds isextra = <isextra> backwardscript = trick_smith_backwards_bs varial_script = Trick_Smith_FS AnimOnly = <AnimOnly>}
endscript

script Trick_Smith_FS_180 
	flipandrotate
	goto Trick_Smith_BS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_Smith_BS_180 
	flipandrotate
	goto Trick_Smith_FS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script trick_smith_backwards_fs 
	goto Trick_BoardSlide_FS params = {no_toggle rootname = <rootname> AnimOnly = <AnimOnly> isextra = <isextra>}
endscript

script trick_smith_backwards_bs 
	goto Trick_Boardslide_BS params = {rootname = <rootname> AnimOnly = <AnimOnly> isextra = <isextra>}
endscript

script Trick_Feeble_FS \{name = "FS Feeble"}
	Grind {$Trick_Smith_params AnimData = $bssmith_data name = <name> rootname = <rootname> NoBlend = <NoBlend>
		extratricks = Extra_FS_Grinds isextra = <isextra> backwardscript = Trick_Boardslide_BS varial_script = Trick_Feeble_BS AnimOnly = <AnimOnly>}
endscript

script Trick_Feeble_FS_rot 
	rotate
	goto Trick_Feeble_FS params = {rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_Feeble_BS \{name = "BS Feeble"}
	Grind {$Trick_Smith_params AnimData = $fssmith_data name = <name> rootname = <rootname> NoBlend = <NoBlend>
		extratricks = Extra_BS_Grinds isextra = <isextra> backwardscript = trick_smith_backwards_fs varial_script = Trick_Feeble_FS AnimOnly = <AnimOnly>}
endscript

script Trick_Feeble_FS_180 
	flipandrotate
	goto Trick_Feeble_BS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_Feeble_BS_180 
	flipandrotate
	goto Trick_Feeble_FS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_Bluntslide_BS 
	if NOT flipped
		if ledgeright
			goto Trick_Bluntslide_FS_ok params = {isextra = <isextra> NoBlend = <NoBlend> AnimOnly = <AnimOnly>}
		endif
	else
		if ledgeleft
			goto Trick_Bluntslide_FS_ok params = {isextra = <isextra> NoBlend = <NoBlend> AnimOnly = <AnimOnly>}
		endif
	endif
	goto Trick_Bluntslide_BS_ok params = {isextra = <isextra> NoBlend = <NoBlend> AnimOnly = <AnimOnly>}
endscript

script Trick_Bluntslide_FS 
	if NOT flipped
		if ledgeleft
			goto Trick_Bluntslide_BS_ok params = {isextra = <isextra> NoBlend = <NoBlend> AnimOnly = <AnimOnly>}
		endif
	else
		if ledgeright
			goto Trick_Bluntslide_BS_ok params = {isextra = <isextra> NoBlend = <NoBlend> AnimOnly = <AnimOnly>}
		endif
	endif
	goto Trick_Bluntslide_FS_ok params = {isextra = <isextra> NoBlend = <NoBlend> AnimOnly = <AnimOnly>}
endscript

script Trick_Bluntslide_BS_ok \{name = "BS Bluntslide"
		stall_name = "BS Blunt Stall"}
	Grind {name = <name> rootname = <rootname> stall_name = <stall_name> score = 250 GrindTweak = 18 AnimData = $BSBluntSlide_data type = slide NoBlend = <NoBlend>
		grindbail = GrindFallLR extratricks = Extra_BS_Grinds isextra = <isextra>
		sparkspos = rear backwardscript = Trick_NoseBluntSlide_BS varial_script = Trick_Bluntslide_FS_ok AnimOnly = <AnimOnly>}
endscript

script Trick_Bluntslide_FS_ok \{name = "FS Bluntslide"
		stall_name = "FS Blunt Stall"}
	Grind {name = <name> rootname = <rootname> stall_name = <stall_name> score = 250 GrindTweak = 18 AnimData = $FSBluntSlide_data type = slide NoBlend = <NoBlend>
		grindbail = BackwardsGrindBails extratricks = Extra_FS_Grinds isextra = <isextra>
		sparkspos = front backwardscript = Trick_NoseBluntSlide_FS varial_script = Trick_Bluntslide_BS_ok AnimOnly = <AnimOnly>}
endscript

script Trick_Bluntslide_BS_180 
	flipandrotate
	goto Trick_Bluntslide_BS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_Bluntslide_FS_180 
	rotate
	goto Trick_Bluntslide_FS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_NoseBluntSlide_BS 
	if NOT flipped
		if ledgeright
			goto Trick_NoseBluntslide_FS_ok params = {isextra = <isextra> NoBlend = <NoBlend> AnimOnly = <AnimOnly>}
		endif
	else
		if ledgeleft
			goto Trick_NoseBluntslide_FS_ok params = {isextra = <isextra> NoBlend = <NoBlend> AnimOnly = <AnimOnly>}
		endif
	endif
	goto Trick_NoseBluntslide_BS_ok params = {isextra = <isextra> NoBlend = <NoBlend> AnimOnly = <AnimOnly>}
endscript

script Trick_NoseBluntSlide_FS 
	if NOT flipped
		if ledgeleft
			goto Trick_NoseBluntslide_BS_ok params = {isextra = <isextra> NoBlend = <NoBlend> AnimOnly = <AnimOnly>}
		endif
	else
		if ledgeright
			goto Trick_NoseBluntslide_BS_ok params = {isextra = <isextra> NoBlend = <NoBlend> AnimOnly = <AnimOnly>}
		endif
	endif
	goto Trick_NoseBluntslide_FS_ok params = {isextra = <isextra> NoBlend = <NoBlend> AnimOnly = <AnimOnly>}
endscript

script Trick_NoseBluntslide_BS_ok name = "BS Nosebluntslide" stall_name = "BS Noseblunt Stall"
	Grind {name = <name> rootname = <rootname> stall_name = <stall_name> score = 250 GrindTweak = 18 AnimData = $BSNoseblunt_data type = slide NoBlend = <NoBlend>
		grindbail = BackwardsGrindBails extratricks = Extra_BS_Grinds isextra = <isextra> Nollie = yes
		sparkspos = rear backwardscript = Trick_Bluntslide_BS varial_script = Trick_NoseBluntslide_FS_ok AnimOnly = <AnimOnly>}
endscript

script Trick_NoseBluntslide_FS_ok name = "FS Nosebluntslide" stall_name = "FS Noseblunt Stall"
	Grind {name = <name> rootname = <rootname> stall_name = <stall_name> score = 250 GrindTweak = 18 AnimData = $FSNoseblunt_data type = slide NoBlend = <NoBlend>
		grindbail = GrindFallLR Nollie = yes isextra = <isextra> extratricks = Extra_FS_Grinds
		sparkspos = front backwardscript = Trick_Bluntslide_FS varial_script = Trick_NoseBluntslide_BS_ok AnimOnly = <AnimOnly>}
endscript

script Trick_Nosebluntslide_BS_180 
	rotate
	goto Trick_NoseBluntSlide_BS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_Nosebluntslide_FS_180 
	rotate
	goto Trick_NoseBluntSlide_FS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_DoubleBluntSlide2 
	Grind {name = "Double Blunt Slide" rootname = <rootname> score = $GRINDTAP_SCORE AnimData = $DoubleBlunt_data type = slide NoBlend = <NoBlend>
		grindbail = BackwardsGrindBails extratricks = Extra_FS_Grinds isatap isextra = <isextra> AnimOnly = <AnimOnly>}
endscript

script Trick_DoubleBluntSlide2_180 
	BackwardsGrind Grind = Trick_DoubleBluntSlide2 rootname = <rootname>
endscript

script Trick_Salad_FS \{name = "FS Salad"}
	Grind {name = <name> score = $GRINDTAP_SCORE rootname = <rootname> AnimData = $FSSaladGrind_data type = Grind NoBlend = <NoBlend>
		grindbail = BackwardsGrindBails extratricks = Extra_FS_Grinds isatap isextra = <isextra> OneFoot = front
		backwardscript = Trick_Overcrook_FS AnimOnly = <AnimOnly>}
endscript

script Trick_Salad_BS \{name = "BS Salad"}
	Grind {name = <name> score = $GRINDTAP_SCORE rootname = <rootname> AnimData = $BSSaladGrind_data type = Grind NoBlend = <NoBlend>
		grindbail = GrindFallLR extratricks = Extra_BS_Grinds isatap isextra = <isextra> OneFoot = front
		backwardscript = Trick_Overcrook_BS AnimOnly = <AnimOnly>}
endscript

script Trick_Salad_FS_180 
	flipandrotate
	goto Trick_Salad_BS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_Salad_BS_180 
	flipandrotate
	goto Trick_Salad_FS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_Hurricane_BS 
	Grind {name = "BS Hurricane" score = $GRINDTAP_SCORE rootname = <rootname> AnimData = $BSHurricane_data OutAnimBackwards = 1 NoBlend = <NoBlend>
		grindbail = GrindFallLR Nollie = yes extratricks = Extra_BS_Grinds isatap isextra = <isextra>
		type = Grind sparkspos = rear backwardscript = trick_hurricane_backwards_bs AnimOnly = <AnimOnly>}
endscript

script Trick_Hurricane_FS 
	Grind {name = "FS Hurricane" score = $GRINDTAP_SCORE rootname = <rootname> AnimData = $FSHurricane_data type = Grind NoBlend = NoBlend
		grindbail = BackwardsGrindBails isatap isextra = <isextra>
		backwardscript = Trick_Smith_FS fshurricanehack = 1 AnimOnly = <AnimOnly>}
endscript

script Trick_Hurricane_BS_180 
	rotate
	goto Trick_Hurricane_BS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_Hurricane_FS_180 
	rotate
	goto Trick_Hurricane_FS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script trick_hurricane_backwards_bs 
	BlendperiodOut \{0}
	flip
	goto Trick_Feeble_FS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly> isextra = <isextra>}
endscript

script trick_hurricane_backwards_fs 
	BlendperiodOut \{0}
	flip
	goto Trick_Feeble_BS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly> isextra = <isextra>}
endscript

script Trick_CrailSlide_BS 
	Grind {name = "BS Crail Slide" score = $GRINDTAP_SCORE rootname = <rootname> AnimData = $BSCrailSlide_data type = Grind NoBlend = <NoBlend>
		grindbail = FiftyFiftyFall extratricks = Extra_BS_Grinds OutAnimOnOllie extratricks = Extra_BS_Grinds isatap isextra = <isextra>
		backwardscript = trick_crailslide_backwards_fs AnimOnly = <AnimOnly>}
endscript

script Trick_CrailSlide_FS 
	Grind {name = "FS Crail Slide" score = $GRINDTAP_SCORE rootname = <rootname> AnimData = $CrailSlide_data type = Grind NoBlend = <NoBlend>
		grindbail = FiftyFiftyFall extratricks = Extra_FS_Grinds OutAnimOnOllie extratricks = Extra_BS_Grinds isatap isextra = <isextra>
		backwardscript = trick_crailslide_backwards_bs AnimOnly = <AnimOnly>}
endscript

script Trick_CrailSlide_BS_180 
	rotate
	goto Trick_CrailSlide_BS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_CrailSlide_FS_180 
	rotate
	goto Trick_CrailSlide_FS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script trick_crailslide_backwards_fs 
	BlendperiodOut \{0}
	flip
	goto Trick_CrailSlide_FS params = {rootname = <rootname> AnimOnly = <AnimOnly> isextra = <isextra>}
endscript

script trick_crailslide_backwards_bs 
	BlendperiodOut \{0}
	flip
	goto Trick_CrailSlide_BS params = {rootname = <rootname> AnimOnly = <AnimOnly> isextra = <isextra>}
endscript

script Trick_FiveOOverturn_BS 
	Grind {name = "BS 5-0 Overturn" score = $GRINDTAP_SCORE rootname = <rootname> AnimData = $GrindOverturn_data NoBlend = <NoBlend>
		grindbail = FiftyFiftyFall Nollie = 1 extratricks = Extra_Hurricane_BS_Grinds isatap isextra = <isextra>
		type = Grind sparkspos = rear backwardscript = Trick_FiveOOverturn_Backwards_BS AnimOnly = <AnimOnly> fshurricanehack = 1}
endscript

script Trick_FiveOOverturn_FS 
	Grind {name = "FS 5-0 Overturn" score = $GRINDTAP_SCORE rootname = <rootname> AnimData = $GrindOverturn_data NoBlend = <NoBlend>
		grindbail = FiftyFiftyFall Nollie = 1 extratricks = Extra_Hurricane_FS_Grinds isatap isextra = <isextra>
		type = Grind sparkspos = rear backwardscript = Trick_FiveOOverturn_Backwards_FS AnimOnly = <AnimOnly> fshurricanehack = 1}
endscript

script Trick_FiveOOverturn_BS_180 
	rotate
	goto Trick_FiveOOverturn_BS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_FiveOOverturn_FS_180 
	rotate
	goto Trick_FiveOOverturn_FS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_FiveOOverturn_Backwards_FS 
	BlendperiodOut \{0}
	flip
	goto Trick_5_0_BS params = {rootname = <rootname> AnimOnly = <AnimOnly> isextra = <isextra>}
endscript

script Trick_FiveOOverturn_Backwards_BS 
	BlendperiodOut \{0}
	flip
	goto Trick_5_0_FS params = {rootname = <rootname> AnimOnly = <AnimOnly> isextra = <isextra>}
endscript

script Trick_HangTenNoseGrind_BS 
	Grind {name = "Hang Ten Nosegrind" score = $GRINDTAP_SCORE rootname = <rootname> AnimData = $HangTenNoseGrind_data type = Grind NoBlend = <NoBlend>
		grindbail = FiftyFiftyFall extratricks = Extra_BS_Grinds Nollie extratricks = Extra_BS_Grinds isatap isextra = <isextra>
		backwardscript = Trick_5050_BS AnimOnly = <AnimOnly>}
endscript

script Trick_HangTenNoseGrind_FS 
	Grind {name = "Hang Ten Nosegrind" score = $GRINDTAP_SCORE rootname = <rootname> AnimData = $HangTenNoseGrind_data type = Grind NoBlend = <NoBlend>
		grindbail = FiftyFiftyFall extratricks = Extra_FS_Grinds Nollie extratricks = Extra_BS_Grinds isatap isextra = <isextra>
		backwardscript = Trick_5050_FS AnimOnly = <AnimOnly>}
endscript

script Trick_HangTenNoseGrind_BS_180 
	rotate
	goto Trick_HangTenNoseGrind_BS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_HangTenNoseGrind_FS_180 
	rotate
	goto Trick_HangTenNoseGrind_FS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_NosegrindPivot_BS 
	Grind {name = "Nosegrind to Pivot" score = $GRINDTAP_SCORE rootname = <rootname> AnimData = $NosegrindPivot_data NoBlend = NoBlend
		grindbail = FiftyFiftyFall boardrotate = yes extratricks = Extra_BS_Grinds isatap isextra = <isextra>
		type = Grind sparkspos = front backwardscript = Trick_5_0_BS AnimOnly = <AnimOnly>}
endscript

script Trick_NosegrindPivot_FS 
	goto Trick_NosegrindPivot_BS params = {isextra = isextra rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_NosegrindPivot_BS_180 
	rotate
	goto Trick_NosegrindPivot_BS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_NosegrindPivot_FS_180 
	goto Trick_NosegrindPivot_BS_180 params {rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_OneFootCrook_FS \{name = "FS One Foot Crook"}
	Grind {$Trick_Crooked_params AnimData = $FSOneFootCrooked_data name = <name> score = $GRINDTAP_SCORE rootname = <rootname> NoBlend = <NoBlend> extratricks = Extra_FS_Grinds isextra = <isextra>
		backwardscript = Trick_5_0_FS AnimOnly = <AnimOnly> isatap}
endscript

script Trick_OneFootCrook_BS \{name = "BS One Foot Crook"}
	Grind {$Trick_Crooked_params AnimData = $BSOneFootCrooked_data name = <name> score = $GRINDTAP_SCORE rootname = <rootname> NoBlend = <NoBlend> extratricks = Extra_BS_Grinds isextra = <isextra>
		backwardscript = Trick_5_0_BS AnimOnly = <AnimOnly> isatap}
endscript

script Trick_OneFootCrook_FS_180 
	flipandrotate
	goto Trick_OneFootCrook_BS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_OneFootCrook_BS_180 
	flipandrotate
	goto Trick_OneFootCrook_FS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_NoseslideTailgrab_FS 
	if NOT flipped
		if ledgeleft
			goto Trick_NoseslideTailgrab_BS_ok params = {isextra = <isextra> NoBlend = <NoBlend> rootname = <rootname> AnimOnly = <AnimOnly>}
		endif
	else
		if ledgeright
			goto Trick_NoseslideTailgrab_BS_ok params = {isextra = <isextra> NoBlend = <NoBlend> rootname = <rootname> AnimOnly = <AnimOnly>}
		endif
	endif
	goto Trick_NoseslideTailgrab_FS_ok params = {isextra = <isextra> NoBlend = <NoBlend> rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_NoseslideTailgrab_BS 
	if NOT flipped
		if ledgeright
			goto Trick_NoseslideTailgrab_FS_ok params = {isextra = <isextra> NoBlend = <NoBlend> rootname = <rootname> AnimOnly = <AnimOnly>}
		endif
	else
		if ledgeleft
			goto Trick_NoseslideTailgrab_FS_ok params = {isextra = <isextra> NoBlend = <NoBlend> rootname = <rootname> AnimOnly = <AnimOnly>}
		endif
	endif
	goto Trick_NoseslideTailgrab_BS_ok params = {isextra = <isextra> NoBlend = <NoBlend> rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_NoseslideTailgrab_FS_ok name = "FS Noseslide Tailgrab" stall_name = "FS Nose Stall Tailgrab"
	Grind {AnimData = $FSNoseSlideGrab_data name = <name> rootname = <rootname> stall_name = <stall_name> score = $GRINDTAP_SCORE GrindTweak = 11 type = slide Nollie = yes NoBlend = <NoBlend>
		grindbail = BackwardsGrindBails extratricks = Extra_FS_Grinds isextra = <isextra> OneFoot = back
		backwardscript = Trick_NoseslideTailgrab_backwards_FS AnimOnly = <AnimOnly> isatap}
endscript

script Trick_NoseslideTailgrab_BS_ok name = "BS Noseslide Tailgrab" stall_name = "BS Nose Stall Tailgrab"
	Grind {AnimData = $BSNoseSlideGrab_data name = <name> rootname = <rootname> stall_name = <stall_name> score = $GRINDTAP_SCORE GrindTweak = 11 type = slide Nollie = yes NoBlend = <NoBlend>
		grindbail = GrindFallLR extratricks = Extra_BS_Grinds isextra = <isextra> OneFoot = back
		backwardscript = Trick_NoseslideTailgrab_backwards_BS AnimOnly = <AnimOnly> isatap}
endscript

script Trick_NoseslideTailgrab_FS_180 
	flipandrotate
	goto Trick_NoseslideTailgrab_BS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_NoseslideTailgrab_BS_180 
	flipandrotate
	goto Trick_NoseslideTailgrab_FS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_NoseslideTailgrab_backwards_BS 
	BlendperiodOut \{0}
	flip
	goto Trick_NoseslideTailgrab_FS_ok params = {isextra = <isextra>}
endscript

script Trick_NoseslideTailgrab_backwards_FS 
	BlendperiodOut \{0}
	flip
	goto Trick_NoseslideTailgrab_BS_ok params = {isextra = <isextra>}
endscript
Trick_FiveOHandDrag_params = {
	AnimData = $HandDrag5O_data
	score = $GRINDTAP_SCORE
	type = Grind
	sparkspos = rear
	OneFoot = front
	grindbail = FiftyFiftyFall
}

script Trick_FiveOHandDrag_FS \{name = "FS 5-0 Hand Drag"}
	Grind {$Trick_FiveOHandDrag_params name = <name> rootname = <rootname> NoBlend = <NoBlend> extratricks = Extra_FS_Grinds isextra = <isextra>
		backwardscript = Trick_NoseGrind_FS AnimOnly = <AnimOnly> isatap}
endscript

script Trick_FiveOHandDrag_BS \{name = "BS 5-0 Hand Drag"}
	Grind {$Trick_FiveOHandDrag_params name = <name> rootname = <rootname> NoBlend = <NoBlend> extratricks = Extra_BS_Grinds isextra = <isextra>
		backwardscript = Trick_NoseGrind_BS AnimOnly = <AnimOnly> isatap}
endscript

script Trick_FiveOHandDrag_FS_180 
	flipandrotate
	goto Trick_FiveOHandDrag_BS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_FiveOHandDrag_BS_180 
	flipandrotate
	goto Trick_FiveOHandDrag_FS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript
Trick_TailblockSlide_params = {
	score = SPECIALGRIND_SCORE
	type = Grind
	OneFoot = front
	grindbail = FiftyFiftyFall
	isspecial
}

script Trick_TailblockSlide_BS \{name = "BS Tailblock Slide"}
	Grind {$Trick_TailblockSlide_params AnimData = $BSTailblockSlide_data name = <name> rootname = <rootname> extratricks = Extra_BS_Grinds NoBlend = <NoBlend> isextra = <isextra> AnimOnly = <AnimOnly> no_anim = <no_anim>
		backwardscript = Trick_TailblockSlide_backwards_BS AnimOnly = <AnimOnly>}
endscript

script Trick_TailblockSlide_FS \{name = "FS Tailblock Slide"}
	Grind {$Trick_TailblockSlide_params AnimData = $TailblockSlide_data name = <name> rootname = <rootname> extratricks = Extra_FS_Grinds NoBlend = <NoBlend> isextra = <isextra> AnimOnly = <AnimOnly> no_anim = <no_anim>
		backwardscript = Trick_TailblockSlide_backwards_FS AnimOnly = <AnimOnly>}
endscript

script Trick_TailblockSlide_BS_180 
	flipandrotate
	goto Trick_TailblockSlide_BS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_TailblockSlide_FS_180 
	flipandrotate
	goto Trick_TailblockSlide_FS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_TailblockSlide_backwards_BS 
	flip
	goto Trick_TailblockSlide_FS params = {rootname = <rootname> AnimOnly = <AnimOnly> isextra = <isextra>}
endscript

script Trick_TailblockSlide_backwards_FS 
	flip
	goto Trick_TailblockSlide_BS params = {rootname = <rootname> AnimOnly = <AnimOnly> isextra = <isextra>}
endscript
Trick_CrossfootBoard_params = {
	score = SPECIALGRIND_SCORE
	type = Grind
	OneFoot = front
	grindbail = FiftyFiftyFall
	isspecial
}

script Trick_CrossfootBoard_BS \{name = "BS Crossfoot Boardslide"}
	Grind {$Trick_CrossfootBoard_params AnimData = $BSCrossfootBoard_data name = <name> rootname = <rootname> extratricks = Extra_BS_Grinds NoBlend = <NoBlend> isextra = <isextra> AnimOnly = <AnimOnly> no_anim = <no_anim>
		backwardscript = Trick_CrossfootBoard_Backwards_BS AnimOnly = <AnimOnly>}
endscript

script Trick_CrossfootBoard_FS \{name = "FS Crossfoot Boardslide"}
	Grind {$Trick_CrossfootBoard_params AnimData = $CrossfootBoard_data name = <name> rootname = <rootname> extratricks = Extra_FS_Grinds NoBlend = <NoBlend> isextra = <isextra> AnimOnly = <AnimOnly> no_anim = <no_anim>
		backwardscript = Trick_CrossfootBoard_Backwards_FS AnimOnly = <AnimOnly>}
endscript

script Trick_CrossfootBoard_BS_180 
	flipandrotate
	goto Trick_CrossfootBoard_BS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_CrossfootBoard_FS_180 
	flipandrotate
	goto Trick_CrossfootBoard_FS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_CrossfootBoard_Backwards_BS 
	goto Trick_CrossfootBoard_FS params = {rootname = <rootname> AnimOnly = <AnimOnly> isextra = <isextra>}
endscript

script Trick_CrossfootBoard_Backwards_FS 
	goto Trick_CrossfootBoard_BS params = {rootname = <rootname> AnimOnly = <AnimOnly> isextra = <isextra>}
endscript
Trick_OneFootSmith_params = {
	score = SPECIALGRIND_SCORE
	type = Grind
	OneFoot = front
	grindbail = FiftyFiftyFall
	isspecial
}

script Trick_OneFootSmith_BS \{name = "BS One Foot Smith"}
	Grind {$Trick_OneFootSmith_params AnimData = $BSOneFootSmith_data name = <name> rootname = <rootname> extratricks = Extra_BS_Grinds NoBlend = <NoBlend> isextra = <isextra> AnimOnly = <AnimOnly> no_anim = <no_anim>
		backwardscript = trick_smith_backwards_bs AnimOnly = <AnimOnly>}
endscript

script Trick_OneFootSmith_FS \{name = "FS One Foot Smith"}
	Grind {$Trick_OneFootSmith_params AnimData = $OneFootSmith_data name = <name> rootname = <rootname> extratricks = Extra_FS_Grinds NoBlend = <NoBlend> isextra = <isextra> AnimOnly = <AnimOnly> no_anim = <no_anim>
		backwardscript = trick_smith_backwards_fs AnimOnly = <AnimOnly>}
endscript

script Trick_OneFootSmith_BS_180 
	flipandrotate
	goto Trick_OneFootSmith_BS params = {rootname = <rootname> NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_OneFootSmith_FS_180 
	flipandrotate
	goto Trick_OneFootSmith_FS params = {rootname = <rootname> NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_Darkslide_BS 
	Grind {name = "BS Darkslide" score = SPECIALGRIND_SCORE rootname = <rootname> AnimData = $Darkslide_data type = slide NoBlend = <NoBlend>
		grindbail = BackwardsGrindBails OutAnimOnOllie boardrotate = yes isspecial
		backwardscript = Trick_Darkslide_Backwards_BS AnimOnly = <AnimOnly> isextra = <isextra>}
endscript

script Trick_Darkslide_FS 
	Grind {name = "FS Darkslide" score = SPECIALGRIND_SCORE rootname = <rootname> AnimData = $FSDarkslide_data type = slide NoBlend = <NoBlend>
		grindbail = BackwardsGrindBails OutAnimOnOllie boardrotate = yes isspecial
		backwardscript = Trick_Darkslide_Backwards_FS AnimOnly = <AnimOnly> isextra = <isextra>}
endscript

script Trick_Darkslide_BS_180 
	rotate
	goto Trick_Darkslide_BS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_Darkslide_FS_180 
	rotate
	goto Trick_Darkslide_FS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_Darkslide_Backwards_BS 
	goto Trick_Darkslide_FS params = {rootname = <rootname> AnimOnly = <AnimOnly> isextra = 1}
endscript

script Trick_Darkslide_Backwards_FS 
	goto Trick_Darkslide_BS params = {rootname = <rootname> AnimOnly = <AnimOnly> isextra = 1}
endscript
Trick_SmithtoSmith_params = {
	AnimData = $SmithtoSmith_data
	score = SPECIALGRIND_SCORE
	type = Grind
	OneFoot = front
	grindbail = FiftyFiftyFall
	isspecial
}

script Trick_SmithtoSmith_BS \{name = "BS Chocolate Jammy"}
	Grind {$Trick_SmithtoSmith_params name = <name> rootname = <rootname> extratricks = Extra_BS_Grinds NoBlend = <NoBlend> isextra = <isextra> AnimOnly = <AnimOnly> no_anim = <no_anim>
		backwardscript = Trick_SmithtoSmith_Backwards_BS}
endscript

script Trick_SmithtoSmith_FS \{name = "FS Chocolate Jammy"}
	Grind {$Trick_SmithtoSmith_params name = <name> rootname = <rootname> extratricks = Extra_FS_Grinds NoBlend = <NoBlend> isextra = <isextra> AnimOnly = <AnimOnly> no_anim = <no_anim>
		backwardscript = Trick_SmithtoSmith_Backwards_FS}
endscript

script Trick_SmithtoSmith_BS_180 
	flipandrotate
	goto Trick_SmithtoSmith_BS params = {NoBlend = yes rootname = <rootname>}
endscript

script Trick_SmithtoSmith_FS_180 
	flipandrotate
	goto Trick_SmithtoSmith_FS params = {NoBlend = yes rootname = <rootname>}
endscript

script Trick_SmithtoSmith_Backwards_BS 
	goto Trick_SmithtoSmith_FS params = {rootname = <rootname> isextra = <isextra>}
endscript

script Trick_SmithtoSmith_Backwards_FS 
	goto Trick_SmithtoSmith_BS params = {rootname = <rootname> isextra = <isextra>}
endscript
Trick_Nose3flipFiveO_params = {
	AnimData = $Nose3flipFiveO_data
	score = SPECIALGRIND_SCORE
	type = Grind
	OneFoot = front
	grindbail = FiftyFiftyFall
	isspecial
}

script Trick_Nose3flipFiveO_BS \{name = "BS Nosegrind 360 Flip 5-0"}
	Grind {$Trick_Nose3flipFiveO_params name = <name> rootname = <rootname> extratricks = Extra_BS_Grinds NoBlend = <NoBlend> isextra = <isextra> AnimOnly = <AnimOnly> no_anim = <no_anim>
		backwardscript = Trick_Nose3flipFiveO_Backwards_BS}
endscript

script Trick_Nose3flipFiveO_FS \{name = "FS Nosegrind 360 Flip 5-0"}
	Grind {$Trick_Nose3flipFiveO_params name = <name> rootname = <rootname> extratricks = Extra_FS_Grinds NoBlend = <NoBlend> isextra = <isextra> AnimOnly = <AnimOnly> no_anim = <no_anim>
		backwardscript = Trick_Nose3flipFiveO_Backwards_FS}
endscript

script Trick_Nose3flipFiveO_BS_180 
	flipandrotate
	goto Trick_Nose3flipFiveO_BS params = {NoBlend = yes rootname = <rootname>}
endscript

script Trick_Nose3flipFiveO_FS_180 
	flipandrotate
	goto Trick_Nose3flipFiveO_FS params = {NoBlend = yes rootname = <rootname>}
endscript

script Trick_Nose3flipFiveO_Backwards_BS 
	goto Trick_Nose3flipFiveO_FS params = {rootname = <rootname> isextra = <isextra>}
endscript

script Trick_Nose3flipFiveO_Backwards_FS 
	goto Trick_Nose3flipFiveO_BS params = {rootname = <rootname> isextra = <isextra>}
endscript
Trick_BoardslideBodyVarial_params = {
	AnimData = $BoardslideBodyVarial_data
	score = SPECIALGRIND_SCORE
	type = Grind
	OneFoot = front
	grindbail = FiftyFiftyFall
	isspecial
}

script Trick_BoardslideBodyVarial_BS \{name = "BS Boardslide Body Varial"}
	Grind {$Trick_BoardslideBodyVarial_params name = <name> rootname = <rootname> extratricks = Extra_BS_Grinds NoBlend = <NoBlend> isextra = <isextra> AnimOnly = <AnimOnly> no_anim = <no_anim>}
endscript

script Trick_BoardslideBodyVarial_FS \{name = "FS Boardslide Body Varial"}
	Grind {$Trick_BoardslideBodyVarial_params name = <name> rootname = <rootname> extratricks = Extra_FS_Grinds NoBlend = <NoBlend> isextra = <isextra> AnimOnly = <AnimOnly> no_anim = <no_anim>}
endscript

script Trick_BoardslideBodyVarial_BS_180 
	flipandrotate
	goto Trick_BoardslideBodyVarial_BS params = {NoBlend = yes rootname = <rootname>}
endscript

script Trick_BoardslideBodyVarial_FS_180 
	flipandrotate
	goto Trick_BoardslideBodyVarial_FS params = {NoBlend = yes rootname = <rootname>}
endscript
Trick_TailslideBackflip_params = {
	AnimData = $TailslideBackflip_data
	score = SPECIALGRIND_SCORE
	type = Grind
	OneFoot = front
	grindbail = FiftyFiftyFall
	isspecial
}

script Trick_TailslideBackflip_BS \{name = "BS Tailslide Backflip"}
	Grind {$Trick_TailslideBackflip_params name = <name> rootname = <rootname> extratricks = Extra_BS_Grinds NoBlend = <NoBlend> isextra = <isextra> AnimOnly = <AnimOnly> no_anim = <no_anim>}
endscript

script Trick_TailslideBackflip_FS \{name = "FS Tailslide Backflip"}
	Grind {$Trick_TailslideBackflip_params name = <name> rootname = <rootname> extratricks = Extra_FS_Grinds NoBlend = <NoBlend> isextra = <isextra> AnimOnly = <AnimOnly> no_anim = <no_anim>}
endscript

script Trick_TailslideBackflip_BS_180 
	flipandrotate
	goto Trick_TailslideBackflip_BS params = {NoBlend = yes rootname = <rootname>}
endscript

script Trick_TailslideBackflip_FS_180 
	flipandrotate
	goto Trick_TailslideBackflip_FS params = {NoBlend = yes rootname = <rootname>}
endscript
Trick_CoffinGrind_params = {
	AnimData = $CoffinGrind_data
	score = SPECIALGRIND_SCORE
	type = Grind
	OneFoot = front
	grindbail = FiftyFiftyFall
	isspecial
}

script Trick_CoffinGrind_BS \{name = "BS Coffin Grind"}
	Grind {$Trick_CoffinGrind_params name = <name> rootname = <rootname> extratricks = Extra_BS_Grinds NoBlend = <NoBlend> isextra = <isextra> AnimOnly = <AnimOnly> no_anim = <no_anim>
		backwardscript = Trick_CoffinGrind_Backwards_BS}
endscript

script Trick_CoffinGrind_FS \{name = "FS Coffin Grind"}
	Grind {$Trick_CoffinGrind_params name = <name> rootname = <rootname> extratricks = Extra_FS_Grinds NoBlend = <NoBlend> isextra = <isextra> AnimOnly = <AnimOnly> no_anim = <no_anim>
		backwardscript = Trick_CoffinGrind_Backwards_FS}
endscript

script Trick_CoffinGrind_BS_180 
	flipandrotate
	goto Trick_CoffinGrind_BS params = {NoBlend = yes rootname = <rootname>}
endscript

script Trick_CoffinGrind_FS_180 
	flipandrotate
	goto Trick_CoffinGrind_FS params = {NoBlend = yes rootname = <rootname>}
endscript

script Trick_CoffinGrind_Backwards_BS 
	goto Trick_CoffinGrind_FS params = {rootname = <rootname> isextra = <isextra>}
endscript

script Trick_CoffinGrind_Backwards_FS 
	goto Trick_CoffinGrind_BS params = {rootname = <rootname> isextra = <isextra>}
endscript
Trick_WaxTheRail_params = {
	AnimData = $WaxingTheRail_data
	score = $GRINDTAP_SCORE
	type = Grind
	sparkspos = rear
	OneFoot = front
	grindbail = FiftyFiftyFall
}

script Trick_WaxTheRail_FS \{name = "Wax The Rail"}
	Grind {$Trick_WaxTheRail_params name = <name> rootname = <rootname> NoBlend = <NoBlend> extratricks = Extra_FS_Grinds isextra = <isextra>
		backwardscript = Trick_WaxTheRail_FS AnimOnly = <AnimOnly>}
endscript

script Trick_WaxTheRail_BS \{name = "Wax The Rail"}
	Grind {$Trick_WaxTheRail_params name = <name> rootname = <rootname> NoBlend = <NoBlend> extratricks = Extra_BS_Grinds isextra = <isextra>
		backwardscript = Trick_WaxTheRail_BS AnimOnly = <AnimOnly>}
endscript

script Trick_WaxTheRail_FS_180 
	flipandrotate
	goto Trick_WaxTheRail_BS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_WaxTheRail_BS_180 
	flipandrotate
	goto Trick_WaxTheRail_FS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript
Trick_BoardslideHandDrag_params = {
	score = SPECIALGRIND_SCORE
	type = Grind
	OneFoot = front
	grindbail = FiftyFiftyFall
	isspecial
}

script Trick_BoardslideHandDrag_BS \{name = "BS Boardslide Hand Drag"}
	Grind {$Trick_BoardslideHandDrag_params AnimData = $Boardslide_HandDrag_data name = <name> rootname = <rootname> extratricks = Extra_BS_Grinds NoBlend = <NoBlend> isextra = <isextra> AnimOnly = <AnimOnly> no_anim = <no_anim>
		backwardscript = Trick_BoardslideHandDrag_Backwards_BS AnimOnly = <AnimOnly>}
endscript

script Trick_BoardslideHandDrag_FS \{name = "FS Boardslide Hand Drag"}
	Grind {$Trick_BoardslideHandDrag_params AnimData = $Boardslide_HandDrag_data name = <name> rootname = <rootname> extratricks = Extra_FS_Grinds NoBlend = <NoBlend> isextra = <isextra> AnimOnly = <AnimOnly> no_anim = <no_anim>
		backwardscript = Trick_BoardslideHandDrag_Backwards_FS AnimOnly = <AnimOnly>}
endscript

script Trick_BoardslideHandDrag_BS_180 
	flipandrotate
	goto Trick_BoardslideHandDrag_BS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_BoardslideHandDrag_FS_180 
	flipandrotate
	goto Trick_BoardslideHandDrag_FS params = {NoBlend = yes rootname = <rootname> AnimOnly = <AnimOnly>}
endscript

script Trick_BoardslideHandDrag_Backwards_BS 
	goto Trick_BoardSlide_FS params = {rootname = <rootname> AnimOnly = <AnimOnly> isextra = <isextra>}
endscript

script Trick_BoardslideHandDrag_Backwards_FS 
	goto Trick_LipSlide_BS params = {rootname = <rootname> AnimOnly = <AnimOnly> isextra = <isextra>}
endscript
