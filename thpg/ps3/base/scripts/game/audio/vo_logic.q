votofacialanimmap = {
	c_pro_paulrodriguez_1 = SK9_Face_c_pro_paulrodriguez_1
	IGC_goalped_mechanic = SK9_Face_c_pro_paulrodriguez_1
	Photographer_impatient_01 = Photographer_Attention_06
	Photographer_impatient_02 = Photographer_Attention_07
	Photographer_impatient_03 = Photographer_Attention_08
	Photographer_impatient_04 = Photographer_Attention_09
	Photographer_impatient_05 = Photographer_Attention_10
}

script Master_Crowd_VO_CheerLand 
	if (<numpedsactivated> > 14)
		soundevent \{event = Crowd_Ped_AI_CheerLand_BIG
			object = null}
	else
		if (<numpedsactivated> > 9)
			soundevent \{event = Crowd_Ped_AI_CheerLand_MEDIUM
				object = null}
		else
			if (<numpedsactivated> > 1)
				soundevent \{event = Crowd_Ped_AI_CheerLand_SMALL
					object = null}
			endif
		endif
	endif
endscript

script Master_Crowd_VO_BooLand 
	if (<numpedsactivated> > 13)
	else
		if (<numpedsactivated> > 5)
		else
		endif
	endif
endscript
