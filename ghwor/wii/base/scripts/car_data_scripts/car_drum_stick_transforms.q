
script cas_drum_stick_bake_transforms 
	printf \{'cas_drum_stick_bake_transforms'}
	printstruct <...>
	Skeleton_GetSkeletonName
	printf channel = mydebug qs(0x6f2e83c9) s = <skeletonname>
	switch <skeletonname>
		case gh_drummer_male
		case gh_rocker_male
		if (<material_index> = 0)
			Pos = (0.0, 0.0, 0.0)
			orientation = (0.0, 0.0, 0.0)
		else
			Pos = (0.0, 0.0, 0.0)
			orientation = (0.0, 0.0, 0.0)
		endif
		case gh_drummer_female
		case gh_rocker_female
		printf \{channel = mydebug
			qs(0x0111a0f9)}
		if (<material_index> = 0)
			printf \{channel = mydebug
				qs(0x40f6a61c)}
			Pos = (-0.09081, 0.09465001, 0.014779999)
			orientation = (0.0, 0.0, 0.0)
		else
			printf \{channel = mydebug
				qs(0xdc7f9334)}
			Pos = (0.09079, 0.09463001, 0.014779999)
			orientation = (0.0, 0.0, 0.0)
		endif
		case gh_drummer_axel_1
		case gh_drummer_axel_2
		case gh_drummer_axel_3
		case gh_drummer_axel_4
		case gh_rocker_axel_1
		case gh_rocker_axel_2
		case gh_rocker_axel_3
		case gh_rocker_axel_4
		axel_drumstick_offset <...>
		case gh_drummer_casey_1
		case gh_drummer_casey_2
		case gh_drummer_casey_3
		case gh_drummer_casey_4
		case gh_rocker_casey_1
		case gh_rocker_casey_2
		case gh_rocker_casey_3
		case gh_rocker_casey_4
		casey_drumstick_offset <...>
		case gh_drummer_clive_1
		case gh_drummer_clive_2
		case gh_drummer_clive_3
		case gh_drummer_clive_4
		case gh_rocker_clive_1
		case gh_rocker_clive_2
		case gh_rocker_clive_3
		case gh_rocker_clive_4
		clive_drumstick_offset <...>
		case gh_drummer_eddie_1
		case gh_drummer_eddie_2
		case gh_drummer_eddie_3
		case gh_drummer_eddie_4
		case gh_rocker_eddie_1
		case gh_rocker_eddie_2
		case gh_rocker_eddie_3
		case gh_rocker_eddie_4
		eddie_drumstick_offset <...>
		case gh_drummer_izzy_1
		case gh_drummer_izzy_2
		case gh_drummer_izzy_3
		case gh_drummer_izzy_4
		case gh_rocker_izzy_1
		case gh_rocker_izzy_2
		case gh_rocker_izzy_3
		case gh_rocker_izzy_4
		izzy_drumstick_offset <...>
		case gh_drummer_johnny_1
		case gh_drummer_johnny_2
		case gh_drummer_johnny_3
		case gh_drummer_johnny_4
		case gh_rocker_johnny_1
		case gh_rocker_johnny_2
		case gh_rocker_johnny_3
		case gh_rocker_johnny_4
		johnny_drumstick_offset <...>
		case gh_drummer_johnnycash_car
		case gh_rocker_johnnycash_car
		johnnycash_drumstick_offset <...>
		case gh_drummer_shirleymanson_1
		case gh_rocker_shirleymanson_1
		shirleymanson_drumstick_offset <...>
		case gh_drummer_judy_1
		case gh_drummer_judy_2
		case gh_drummer_judy_3
		case gh_drummer_judy_4
		case gh_rocker_judy_1
		case gh_rocker_judy_2
		case gh_rocker_judy_3
		case gh_rocker_judy_4
		judy_drumstick_offset <...>
		case gh_drummer_lars_1
		case gh_drummer_lars_2
		case gh_drummer_lars_3
		case gh_drummer_lars_4
		case gh_rocker_lars_1
		case gh_rocker_lars_2
		case gh_rocker_lars_3
		case gh_rocker_lars_4
		lars_drumstick_offset <...>
		case gh_drummer_minotaur_1
		case gh_rocker_minotaur_1
		minotaur_drumstick_offset <...>
		case gh_drummer_midori_1
		case gh_drummer_midori_2
		case gh_drummer_midori_3
		case gh_drummer_midori_4
		case gh_rocker_midori_1
		case gh_rocker_midori_2
		case gh_rocker_midori_3
		case gh_rocker_midori_4
		midori_drumstick_offset <...>
		case gh_drummer_pandora_1
		case gh_drummer_pandora_2
		case gh_drummer_pandora_3
		case gh_drummer_pandora_4
		case gh_rocker_pandora_1
		case gh_rocker_pandora_2
		case gh_rocker_pandora_3
		case gh_rocker_pandora_4
		pandora_drumstick_offset <...>
		case gh_drummer_frankenrocker_1
		case gh_drummer_frankenrocker_2
		case gh_drummer_frankenrocker_3
		case gh_drummer_frankenrocker_4
		case gh_rocker_frankenrocker_1
		case gh_rocker_frankenrocker_2
		case gh_rocker_frankenrocker_3
		case gh_rocker_frankenrocker_4
		frankenrocker_drumstick_offset <...>
		case gh_drummer_2009_1
		case gh_drummer_2009_2
		case gh_rocker_2009_1
		case gh_rocker_2009_2
		newfemale_drumstick_offset <...>
		case gh_drummer_newmale_1
		case gh_drummer_newmale_2
		case gh_rocker_newmale_1
		case gh_rocker_newmale_2
		newmale_drumstick_offset <...>
		case gh_drummer_arthas_1
		case gh_rocker_arthas_1
		arthas_drumstick_offset <...>
		case gh_drummer_demigod_1
		case gh_rocker_demigod_1
		demigod_drumstick_offset <...>
		case gh_drummer_avatar
		case gh_rocker_avatar
		avatar_drumstick_offset <...>
		default
		if (<material_index> = 0)
			Pos = (0.0, 0.0, 0.0)
			orientation = (0.0, 0.0, 0.0)
		else
			Pos = (0.0, 0.0, 0.0)
			orientation = (0.0, 0.0, 0.0)
		endif
	endswitch
	obj_baketransform material = <material> geom = <part> Pos = <Pos> orientation = <orientation>
endscript

script newfemale_drumstick_offset 
	printf \{channel = mydebug
		qs(0xfade82e4)}
	if (<material_index> = 0)
		Pos = (-0.091300905, 0.09368741, -0.014790599)
		orientation = (0.0, 0.0, 0.0)
	else
		Pos = (0.0912823, 0.0936723, -0.014792499)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script arthas_drumstick_offset 
	printf \{channel = mydebug
		qs(0x47b9119c)}
	if (<material_index> = 0)
		Pos = (0.159723, -0.021472199, 0.0023196302)
		orientation = (0.0, 0.0, 0.0)
	else
		Pos = (-0.159739, -0.021485498, 0.0023173601)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script demigod_drumstick_offset 
	printf \{channel = mydebug
		qs(0xdb494169)}
	if (<material_index> = 0)
		Pos = (0.159723, -0.021472199, 0.0023196302)
		orientation = (0.0, 0.0, 0.0)
	else
		Pos = (-0.159739, -0.021485498, 0.0023173601)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script newmale_drumstick_offset 
	printf \{channel = mydebug
		qs(0x8e522368)}
	if (<material_index> = 0)
		Pos = (0.029867498, -0.000279605, 0.0007670819)
		orientation = (0.0, 0.0, 0.0)
	else
		Pos = (-0.0298583, -0.00026875702, 0.00076697)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script axel_drumstick_offset 
	printf \{channel = mydebug
		qs(0xbd4803f3)}
	if (<material_index> = 0)
		Pos = (0.159723, -0.021472, 0.0023196302)
		orientation = (0.0, 0.0, 0.0)
	else
		Pos = (-0.159739, -0.0214857, 0.0023173501)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script casey_drumstick_offset 
	printf \{channel = mydebug
		qs(0x8ee531fb)}
	if (<material_index> = 0)
		Pos = (-0.09135061, 0.093663804, -0.0147257)
		orientation = (0.0, 0.0, 0.0)
	else
		Pos = (0.0913313, 0.09364941, -0.0147287)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script clive_drumstick_offset 
	printf \{channel = mydebug
		qs(0x09ed0fba)}
	if (<material_index> = 0)
		Pos = (0.0, 0.0, 0.0)
		orientation = (0.0, 0.0, 0.0)
	else
		Pos = (0.0, 0.0, 0.0)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script eddie_drumstick_offset 
	printf \{channel = mydebug
		qs(0x9c824f31)}
	if (<material_index> = 0)
		Pos = (0.029867498, -0.000279605, 0.0007670819)
		orientation = (0.0, 0.0, 0.0)
	else
		Pos = (-0.0298583, -0.00026875702, 0.00076697)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script izzy_drumstick_offset 
	printf \{channel = mydebug
		qs(0x79fd5399)}
	if (<material_index> = 0)
		Pos = (0.0, 0.0, 0.0)
		orientation = (0.0, 0.0, 0.0)
	else
		Pos = (0.0, 0.0, 0.0)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script johnny_drumstick_offset 
	printf \{channel = mydebug
		qs(0xff20fc33)}
	if (<material_index> = 0)
		Pos = (0.029867498, -0.000279605, 0.0007670819)
		orientation = (0.0, 0.0, 0.0)
	else
		Pos = (-0.0298583, -0.00026875702, 0.00076697)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script johnnycash_drumstick_offset 
	printf \{channel = mydebug
		qs(0x53bc0781)}
	if (<material_index> = 0)
		Pos = (0.029867599, -0.00027984398, 0.000767075)
		orientation = (0.0, 0.0, 0.0)
	else
		Pos = (-0.0298582, -0.00026875702, 0.00076712697)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script shirleymanson_drumstick_offset 
	printf \{channel = mydebug
		qs(0x1270c5a4)}
	if (<material_index> = 0)
		Pos = (-0.091300905, 0.09368741, -0.014790599)
		orientation = (0.0, 0.0, 0.0)
	else
		Pos = (0.0912823, 0.0936723, -0.014792499)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script judy_drumstick_offset 
	printf \{channel = mydebug
		qs(0x723699dd)}
	if (<material_index> = 0)
		Pos = (-0.09135061, 0.093663804, -0.0147257)
		orientation = (0.0, 0.0, 0.0)
	else
		Pos = (0.0913313, 0.09364941, -0.0147287)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script lars_drumstick_offset 
	printf \{channel = mydebug
		qs(0x3debd7a9)}
	if (<material_index> = 0)
		Pos = (0.12968501, -0.0029760003, 0.0201722)
		orientation = (0.0, 0.0, 0.0)
	else
		Pos = (-0.129701, -0.0029931702, 0.0201723)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script minotaur_drumstick_offset 
	printf \{channel = mydebug
		qs(0x727a7e27)}
	if (<material_index> = 0)
		Pos = (0.12968501, -0.0029760003, 0.0201722)
		orientation = (0.0, 0.0, 0.0)
	else
		Pos = (-0.129701, -0.0029931702, 0.0201723)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script midori_drumstick_offset 
	printf \{channel = mydebug
		qs(0x874b867c)}
	if (<material_index> = 0)
		Pos = (-0.091301, 0.09368741, -0.014790599)
		orientation = (0.0, 0.0, 0.0)
	else
		Pos = (0.091282204, 0.0936726, -0.014792499)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script pandora_drumstick_offset 
	printf \{channel = mydebug
		qs(0xd0967dbf)}
	if (<material_index> = 0)
		Pos = (-0.091076, 0.093792096, -0.0152557)
		orientation = (0.0, 0.0, 0.0)
	else
		Pos = (0.09105901, 0.093777, -0.015257399)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script frankenrocker_drumstick_offset 
	printf \{channel = mydebug
		qs(0xb81db2da)}
	if (<material_index> = 0)
		Pos = (0.159723, -0.021472, 0.0023196603)
		orientation = (0.0, 0.0, 0.0)
	else
		Pos = (-0.159739, -0.0214857, 0.0023173601)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript

script avatar_drumstick_offset 
	if (<material_index> = 0)
		Pos = (-0.01, 0.055, 0.0)
		orientation = (0.0, 0.0, 0.0)
	else
		Pos = (0.01, 0.055, 0.0)
		orientation = (0.0, 0.0, 0.0)
	endif
	return <...>
endscript
