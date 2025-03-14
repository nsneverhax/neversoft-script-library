
script cas_handle_disqualifications 
	cas_disq_basic_exclusions part = <part> desc_id = <desc_id>
	cas_disq_remove_logo part = <part> desc_id = <desc_id>
	cas_disq_resolve_bare_torso part = <part> desc_id = <desc_id>
	cas_disq_resolve_lower_legs part = <part> desc_id = <desc_id>
	cas_disq_resolve_scalp part = <part> desc_id = <desc_id>
	cas_disq_resolve_body part = <part> desc_id = <desc_id>
	cas_disq_resolve_hands part = <part> desc_id = <desc_id>
	cas_disq_resolve_facial_hair part = <part> desc_id = <desc_id>
	cas_disq_resolve_belt_buckle part = <part> desc_id = <desc_id>
	cas_disq_resolve_hood_up part = <part> desc_id = <desc_id>
	cas_disq_propogate_head_color part = <part> desc_id = <desc_id>
	cas_handle_special_boards part = <part> desc_id = <desc_id>
	cas_disq_hide_parts part = <part> desc_id = <desc_id>
	cas_disq_resolve_hat_hair part = <part> desc_id = <desc_id>
	cas_disq_hidden_hat_fix new_part = <part> new_desc_id = <desc_id>
	return new_desc_id = <new_desc_id>
endscript

script cas_disq_resolve_bare_torso_type 
	GetCurrentSkaterProfileIndex
	GetSingleSkaterProfileInfo player = <currentskaterprofileindex> character_type
	GetCharacterPartFromType character_type = <character_type> part = CAS_CHAR_Torso
	torso_part = <character_part>
	GetCharacterPartFromType character_type = <character_type> part = CAS_CHAR_Bare_Torso
	bare_torso_part = <character_part>
	GetCharacterPartFromType character_type = <character_type> part = CAS_CHAR_Head
	head_part = <character_part>
	<need_disq> = 0
	if checksumequals a = <part> b = <torso_part>
		torso_desc_id = <desc_id>
		if GetPlayerAppearancePart part = <head_part>
			<need_disq> = 1
			<head_desc_id> = <desc_id>
		endif
	endif
	if checksumequals a = <part> b = <head_part>
		<head_desc_id> = <desc_id>
		if GetPlayerAppearancePart part = <torso_part>
			<need_disq> = 1
			<torso_desc_id> = <desc_id>
		endif
	endif
	if (<need_disq> = 1)
		if getactualcasoptionstruct part = <torso_part> desc_id = <torso_desc_id> dont_assert
			if gotparam force_bare_torso
				base_id = bare
				base_id = <force_bare_torso>
				CreateSkintoneID base_id = <base_id> head_desc_id = <head_desc_id>
				if gotparam skintone_id
					EditPlayerAppearance {
						profile = <currentskaterprofileindex>
						target = setpart
						targetparams = {part = <bare_torso_part> desc_id = <skintone_id>}
					}
				endif
			else
				EditPlayerAppearance {
					profile = <currentskaterprofileindex>
					target = setpart
					targetparams = {part = <bare_torso_part> desc_id = none}
				}
			endif
		endif
	endif
endscript

script cas_disq_resolve_bare_torso 
	foreachin $CAS_Character_ForEach_List do = cas_disq_resolve_bare_torso_type params = <...>
endscript

script cas_disq_resolve_lower_legs_type 
	GetCurrentSkaterProfileIndex
	GetSingleSkaterProfileInfo player = <currentskaterprofileindex> character_type
	GetCharacterPartFromType character_type = <character_type> part = CAS_CHAR_Legs
	legs_part = <character_part>
	GetCharacterPartFromType character_type = <character_type> part = CAS_CHAR_Lower_Legs
	lower_legs_part = <character_part>
	GetCharacterPartFromType character_type = <character_type> part = CAS_CHAR_Head
	head_part = <character_part>
	<need_disq> = 0
	if checksumequals a = <part> b = <legs_part>
		<need_disq> = 1
	endif
	if checksumequals a = <part> b = <head_part>
		<need_disq> = 1
		<part> = <legs_part>
		<head_desc_id> = <desc_id>
		if NOT GetPlayerAppearancePart part = <legs_part> player = <currentskaterprofileindex>
			return
		endif
	endif
	if (<need_disq> = 1)
		getactualcasoptionstruct part = <legs_part> desc_id = <desc_id>
		if gotparam force_lower_legs
			base_id = Lower
			base_id = <force_lower_legs>
			CreateSkintoneID base_id = <base_id> head_desc_id = <head_desc_id>
			if gotparam skintone_id
				EditPlayerAppearance {
					profile = <currentskaterprofileindex>
					target = setpart
					targetparams = {part = <lower_legs_part> desc_id = <skintone_id>}
				}
			endif
		else
			EditPlayerAppearance {
				profile = <currentskaterprofileindex>
				target = setpart
				targetparams = {part = <lower_legs_part> desc_id = none}
			}
		endif
	endif
endscript

script cas_disq_resolve_lower_legs 
	foreachin $CAS_Character_ForEach_List do = cas_disq_resolve_lower_legs_type params = <...>
endscript

script cas_disq_resolve_scalp_type 
	GetCurrentSkaterProfileIndex
	GetSingleSkaterProfileInfo player = <currentskaterprofileindex> character_type
	GetCharacterPartFromType character_type = <character_type> part = CAS_CHAR_Hair
	hair_part = <character_part>
	GetCharacterPartFromType character_type = <character_type> part = CAS_CHAR_Scalp
	scalp_part = <character_part>
	GetCharacterPartFromType character_type = <character_type> part = CAS_CHAR_Head
	head_part = <character_part>
	<need_disq> = 0
	if checksumequals a = <part> b = <hair_part>
		<need_disq> = 1
	endif
	if checksumequals a = <part> b = <head_part>
		<need_disq> = 1
		<part> = <hair_part>
		<head_desc_id> = <desc_id>
		if NOT GetPlayerAppearancePart part = <hair_part> player = <currentskaterprofileindex>
			return
		endif
	endif
	if (<need_disq> = 1)
		getactualcasoptionstruct part = <hair_part> desc_id = <desc_id>
		if gotparam force_scalp
			formattext checksumname = ScalpName 'Scalp %s' s = <force_scalp>
			CreateSkintoneID base_id = <ScalpName> head_desc_id = <head_desc_id>
			if gotparam skintone_id
				EditPlayerAppearance {
					profile = <currentskaterprofileindex>
					target = setpart
					targetparams = {part = <scalp_part> desc_id = <skintone_id>}
				}
			endif
		else
			EditPlayerAppearance {
				profile = <currentskaterprofileindex>
				target = setpart
				targetparams = {part = <scalp_part> desc_id = none}
			}
		endif
	endif
endscript

script cas_disq_resolve_scalp 
	foreachin $CAS_Character_ForEach_List do = cas_disq_resolve_scalp_type params = <...>
endscript

script cas_disq_resolve_body_type 
	GetCharacterPartFromType character_type = <character_type> part = CAS_CHAR_Head
	head_part = <character_part>
	GetCharacterPartFromType character_type = <character_type> part = CAS_CHAR_Torso
	torso_part = <character_part>
	<need_disq> = 0
	if checksumequals a = <part> b = cas_body
		<need_disq> = 1
	endif
	if checksumequals a = <part> b = <head_part>
		<need_disq> = 1
		<head_desc_id> = <desc_id>
	endif
	if checksumequals a = <part> b = <torso_part>
		<need_disq> = 1
	endif
	if (<need_disq> = 1)
		GetCharacterBodyName character_type = <character_type>
		CreateSkintoneID base_id = <bodyname> head_desc_id = <head_desc_id>
		if gotparam skintone_id
			EditPlayerAppearance {
				profile = <currentskaterprofileindex>
				target = setpart
				targetparams = {part = cas_body desc_id = <skintone_id>}
			}
		endif
	endif
endscript

script cas_disq_resolve_body 
	foreachin $CAS_Character_ForEach_List do = cas_disq_resolve_body_type params = <...>
endscript

script cas_disq_resolve_hands_type 
	GetCharacterPartFromType character_type = <character_type> part = CAS_CHAR_Head
	head_part = <character_part>
	GetCharacterPartFromType character_type = <character_type> part = CAS_CHAR_Hands
	hands_part = <character_part>
	GetCharacterPartFromType character_type = <character_type> part = CAS_CHAR_Torso
	torso_part = <character_part>
	<need_disq> = 0
	if checksumequals a = <part> b = <hands_part>
		<need_disq> = 1
	endif
	if checksumequals a = <part> b = <head_part>
		<need_disq> = 1
		<head_desc_id> = <desc_id>
	endif
	if checksumequals a = <part> b = <torso_part>
		<need_disq> = 1
	endif
	if (<need_disq> = 1)
		CreateSkintoneID base_id = hands head_desc_id = <head_desc_id>
		if gotparam skintone_id
			EditPlayerAppearance {
				profile = <currentskaterprofileindex>
				target = setpart
				targetparams = {part = <hands_part> desc_id = <skintone_id>}
			}
		endif
	endif
endscript

script cas_disq_resolve_hands 
	foreachin $CAS_Character_ForEach_List do = cas_disq_resolve_hands_type params = <...>
endscript

script cas_disq_resolve_hat_hair_type 
	GetCharacterPartFromType character_type = <character_type> part = CAS_CHAR_Hair
	hair_part = <character_part>
	GetCharacterPartFromType character_type = <character_type> part = CAS_CHAR_Hat
	hat_part = <character_part>
	GetCharacterPartFromType character_type = <character_type> part = CAS_CHAR_Hat_Hair
	hat_hair_part = <character_part>
	<need_disq> = 0
	orig_desc_id = <desc_id>
	if checksumequals a = <part> b = <hair_part>
		<need_disq> = 1
		hair_desc_id = <orig_desc_id>
		cas_propogate_hair_color reset = <new_desc_id>
	else
		if GetPlayerAppearancePart player = <currentskaterprofileindex> part = <hair_part>
			hair_desc_id = <desc_id>
		endif
	endif
	if checksumequals a = <part> b = <hat_part>
		<need_disq> = 1
		hat_desc_id = <orig_desc_id>
	else
		if GetPlayerAppearancePart player = <currentskaterprofileindex> part = <hat_part>
			hat_desc_id = <desc_id>
		else
			hat_desc_id = none
		endif
	endif
	if checksumequals a = <part> b = <hat_hair_part>
		<need_disq> = 1
	endif
	if (<need_disq> = 1)
		if cas_need_to_use_hat_hair hat_desc_id = <hat_desc_id> hair_part = <hair_part> hair_desc_id = <hair_desc_id>
			base_id = `hat hair`
			base_id = <hat_hair>
			printf 'Applying hat hair %s' s = <base_id>
			EditPlayerAppearance {
				profile = <currentskaterprofileindex>
				target = setpart
				targetparams = {part = <hat_hair_part> desc_id = <base_id>}
			}
			EditPlayerAppearance {
				profile = <currentskaterprofileindex>
				target = hidegeom
				targetparams = {part = <hair_part> hide_geom = 1}
			}
			cas_propogate_hair_color
		else
			EditPlayerAppearance {
				profile = <currentskaterprofileindex>
				target = setpart
				targetparams = {part = <hat_hair_part> desc_id = none}
			}
			EditPlayerAppearance {
				profile = <currentskaterprofileindex>
				target = hidegeom
				targetparams = {part = <hair_part> hide_geom = 0}
			}
		endif
	endif
endscript

script cas_disq_resolve_hat_hair 
	foreachin $CAS_Character_ForEach_List do = cas_disq_resolve_hat_hair_type params = <...>
endscript

script cas_disq_resolve_facial_hair 
	GetCurrentSkaterProfileIndex
	GetSingleSkaterProfileInfo player = <currentskaterprofileindex> character_type
	facial_hair_part = cas_facial_hair
	GetCharacterPartFromType character_type = <character_type> part = CAS_CHAR_Head
	head_part = <character_part>
	<need_disq> = 0
	if checksumequals a = <part> b = <facial_hair_part>
		<need_disq> = 1
		<facial_hair_desc_id> = <desc_id>
		GetPlayerAppearancePart part = <head_part>
		<head_desc_id> = <desc_id>
		set_facial_hair_part = 1
	endif
	if checksumequals a = <part> b = <head_part>
		<need_disq> = 1
		<head_desc_id> = <desc_id>
		if NOT GetPlayerAppearancePart part = <facial_hair_part>
			return
		else
			<facial_hair_desc_id> = <desc_id>
		endif
	endif
	if (<need_disq> = 1)
		if (<facial_hair_desc_id> = none)
			return
		endif
		if getactualcasoptionstruct part = <facial_hair_part> desc_id = <facial_hair_desc_id> dont_assert
			if gotparam parent_desc_id
				facial_hair_desc_id = <parent_desc_id>
			endif
			CreateHeadID base_id = <facial_hair_desc_id> head_desc_id = <head_desc_id>
			if gotparam head_id
				if NOT (<head_id> = <facial_hair_desc_id>)
					removeparameter parent_desc_id
					if getactualcasoptionstruct part = <facial_hair_part> desc_id = <head_id> dont_assert
						if NOT gotparam parent_desc_id
							scriptassert 'CAS_Facial_Hair part %s needs a parent_desc_id pointing to the desc_id of the base part' s = <head_id>
							return
						endif
					else
						softassert "Facial hair %f, for head %h missing" f = <facial_hair_desc_id> h = <head_desc_id>
						return
					endif
				endif
				EditPlayerAppearance {
					profile = <currentskaterprofileindex>
					target = setpart
					targetparams = {part = <facial_hair_part> desc_id = <head_id>}
				}
				if gotparam set_facial_hair_part
					return new_desc_id = <head_id>
				endif
			endif
		else
			softassert "Facial hair %f not found" f = <facial_hair_desc_id>
		endif
	endif
endscript

script cas_disq_resolve_belt_buckle_type 
	GetCurrentSkaterProfileIndex
	GetSingleSkaterProfileInfo player = <currentskaterprofileindex> character_type
	if checksumequals a = <part> b = cas_belt
		getactualcasoptionstruct part = cas_belt desc_id = <desc_id>
		if gotparam \{buckle}
			buckle_desc_id = <buckle>
			EditPlayerAppearance {
				profile = <currentskaterprofileindex>
				target = setpart
				targetparams = {part = CAS_Buckle desc_id = <buckle_desc_id>}
			}
		endif
	endif
endscript

script cas_disq_resolve_belt_buckle 
	foreachin $CAS_Character_ForEach_List do = cas_disq_resolve_belt_buckle_type params = <...>
endscript

script cas_disq_remove_logo 
	getactualcasoptionstruct part = <part> desc_id = <desc_id>
	GetCurrentSkaterProfileIndex
	ReverseResolveCharacterPart part = <part>
	if checksumequals a = <resolved_part> b = CAS_CHAR_Torso
		if NOT gotparam supports_logo
			GetCurrentSkaterProfileIndex
			EditPlayerAppearance {
				profile = <currentskaterprofileindex>
				target = clearpart
				targetparams = {part = CAS_Front_Logo}
			}
			EditPlayerAppearance {
				profile = <currentskaterprofileindex>
				target = clearpart
				targetparams = {part = CAS_Back_Logo}
			}
		else
			if gotparam no_back_logo
				EditPlayerAppearance {
					profile = <currentskaterprofileindex>
					target = clearpart
					targetparams = {part = CAS_Back_Logo}
				}
			endif
			if gotparam no_front_logo
				EditPlayerAppearance {
					profile = <currentskaterprofileindex>
					target = clearpart
					targetparams = {part = CAS_Front_Logo}
				}
			endif
		endif
	endif
	GetSingleSkaterProfileInfo player = <currentskaterprofileindex> character_type
	GetCharacterPartFromType character_type = <character_type> part = CAS_CHAR_Hat
	if (checksumequals a = <part> b = <character_part>)
		if NOT gotparam supports_logo
			EditPlayerAppearance {
				profile = <currentskaterprofileindex>
				target = clearpart
				targetparams = {part = CAS_Hat_Logo}
			}
		endif
	endif
endscript

script cas_disq_propogate_head_color 
	new_desc_id = <desc_id>
	changed_parts = [CAS_CHAR_Torso CAS_CHAR_Hair CAS_CHAR_Hat_Hair CAS_CHAR_Hat CAS_CHAR_Legs]
	GetCharacterPartFromType character_type = <character_type> part = CAS_CHAR_Head
	head_part = <character_part>
	needs_disq = 0
	if checksumequals a = <part> b = <head_part>
		cas_propogate_head_color reset = <new_desc_id>
	else
		getarraysize <changed_parts>
		i = 0
		begin
		GetCharacterPartFromType character_type = <character_type> part = (<changed_parts> [<i>])
		if checksumequals a = <part> b = <character_part>
			cas_propogate_head_color
			break
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script cas_propogate_head_color 
	other_parts = [CAS_CHAR_Bare_Torso CAS_CHAR_Hands CAS_CHAR_Lower_Legs CAS_CHAR_Scalp cas_body]
	GetCharacterPartFromType character_type = <character_type> part = CAS_CHAR_Head
	head_part = <character_part>
	cas_propogate_color_to_other_parts {
		color_part = <head_part>
		other_parts = <other_parts>
		reset = <reset>
	}
endscript

script cas_propogate_hair_color 
	other_parts = [cas_hat_hair]
	GetCharacterPartFromType character_type = <character_type> part = CAS_CHAR_Hair
	hair_part = <character_part>
	cas_propogate_color_to_other_parts {
		color_part = <hair_part>
		other_parts = <other_parts>
		reset = <reset>
	}
endscript

script cas_propogate_color_to_other_parts 
	GetCurrentSkaterProfileIndex
	if GetPlayerAppearancePart player = <currentskaterprofileindex> part = <color_part>
		should_use_h = 0
		should_use_s = 0
		should_use_v = 100
		should_use_default_diffuse = 0
		if gotparam use_default_diffuse
			if (<use_default_diffuse> = 1)
				should_use_default_diffuse = 1
			endif
		endif
		if NOT gotparam h
			should_use_default_diffuse = 1
		endif
		if gotparam reset
			should_use_default_diffuse = 1
			desc_id = <reset>
		endif
		if (<should_use_default_diffuse> = 0)
			if gotparam h
				should_use_h = <h>
				should_use_s = <s>
				should_use_v = <v>
			endif
		else
			getactualcasoptionstruct part = <color_part> desc_id = <desc_id>
			if gotparam default_diffuse
				if NOT isarray <default_diffuse>
					scriptassert 'Head default_diffuse must be an array'
				endif
				if NOT structurecontains structure = (<default_diffuse> [0]) h
					scriptassert 'Head default_diffuse has to have HSV entries'
				endif
				should_use_h = (<default_diffuse> [0].h)
				should_use_s = (<default_diffuse> [0].s)
				should_use_v = (<default_diffuse> [0].v)
				should_use_default_diffuse = 0
			endif
		endif
		getarraysize <other_parts>
		i = 0
		begin
		GetCharacterPartFromType character_type = <character_type> part = (<other_parts> [<i>])
		if GetPlayerAppearancePart player = <currentskaterprofileindex> part = <character_part>
			SetPlayerAppearanceColor {
				player = <currentskaterprofileindex>
				part = <character_part>
				use_default_diffuse = <should_use_default_diffuse>
				h = <should_use_h>
				s = <should_use_s>
				v = <should_use_v>
			}
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script cas_disq_resolve_hood_up 
	GetCharacterPartFromType character_type = <character_type> part = CAS_CHAR_Hair
	hair_part = <character_part>
	GetCharacterPartFromType character_type = <character_type> part = CAS_CHAR_Hat
	hat_part = <character_part>
	GetCharacterPartFromType character_type = <character_type> part = CAS_CHAR_Hat_Hair
	hat_hair_part = <character_part>
	GetCharacterPartFromType character_type = <character_type> part = CAS_CHAR_Torso
	torso_part = <character_part>
	<need_disq> = 0
	orig_desc_id = <desc_id>
	if checksumequals a = <part> b = <hair_part>
		<need_disq> = 1
		hair_desc_id = <orig_desc_id>
		cas_propogate_hair_color reset = <new_desc_id>
	else
		if GetPlayerAppearancePart player = <currentskaterprofileindex> part = <hair_part>
			hair_desc_id = <desc_id>
		else
			hair_desc_id = none
		endif
	endif
	if checksumequals a = <part> b = <hat_part>
		<need_disq> = 1
		hat_desc_id = <orig_desc_id>
	else
		if GetPlayerAppearancePart player = <currentskaterprofileindex> part = <hat_part>
			hat_desc_id = <desc_id>
		else
			hat_desc_id = none
		endif
	endif
	if checksumequals a = <part> b = <torso_part>
		<need_disq> = 1
		torso_desc_id = <orig_desc_id>
	else
		if GetPlayerAppearancePart player = <currentskaterprofileindex> part = <torso_part>
			torso_desc_id = <desc_id>
		else
			torso_desc_id = none
		endif
	endif
	if (<need_disq> = 1)
		use_hat_hair = 0
		getactualcasoptionstruct part = <torso_part> desc_id = <torso_desc_id>
		if gotparam hood_up
			EditPlayerAppearance {
				profile = <currentskaterprofileindex>
				target = setpart
				targetparams = {part = <hat_hair_part> desc_id = none}
			}
			EditPlayerAppearance {
				profile = <currentskaterprofileindex>
				target = setpart
				targetparams = {part = <hat_part> desc_id = none}
			}
			EditPlayerAppearance {
				profile = <currentskaterprofileindex>
				target = hidegeom
				targetparams = {part = <hair_part> hide_geom = 1}
			}
			cas_propogate_hair_color
			if checksumequals a = <part> b = <hat_part>
				return new_desc_id = none
			endif
		else
			if NOT cas_need_to_use_hat_hair hat_desc_id = <hat_desc_id> hair_part = <hair_part> hair_desc_id = <hair_desc_id>
				EditPlayerAppearance {
					profile = <currentskaterprofileindex>
					target = hidegeom
					targetparams = {part = <hair_part> hide_geom = 0}
				}
				EditPlayerAppearance {
					profile = <currentskaterprofileindex>
					target = setpart
					targetparams = {part = <hat_hair_part> desc_id = none}
				}
			endif
		endif
	endif
endscript

script cas_need_to_use_hat_hair 
	if NOT (<hat_desc_id> = none)
		getactualcasoptionstruct part = <hair_part> desc_id = <hair_desc_id>
		if gotparam \{hat_hair}
			return true hat_hair = <hat_hair>
		endif
	endif
endscript

script cas_disq_hidden_hat_fix 
	GetCurrentSkaterProfileIndex
	if GetPlayerAppearancePart player = <currentskaterprofileindex> part = cas_hat
		hat_desc_id = <desc_id>
		if checksumequals a = <new_part> b = cas_hat
			hat_desc_id = <new_desc_id>
		endif
		if checksumequals a = <new_part> b = cas_hair
			hair_desc_id = <new_desc_id>
		endif
		if (<hat_desc_id> = none)
			removeparameter hide_geom
		endif
		if gotparam hide_geom
			EditPlayerAppearance {
				profile = <currentskaterprofileindex>
				target = setpart
				targetparams = {part = cas_hat_hair desc_id = none}
			}
			EditPlayerAppearance {
				profile = <currentskaterprofileindex>
				target = hidegeom
				targetparams = {part = cas_hair hide_geom = 0}
			}
		else
			if GetPlayerAppearancePart player = <currentskaterprofileindex> part = cas_hair
				if NOT gotparam hair_desc_id
					hair_desc_id = <desc_id>
				endif
				if cas_need_to_use_hat_hair hat_desc_id = <hat_desc_id> hair_part = cas_hair hair_desc_id = <hair_desc_id>
					base_id = `hat hair`
					base_id = <hat_hair>
					if GetPlayerAppearancePart player = <currentskaterprofileindex> part = cas_hat_hair
						if NOT (<desc_id> = <base_id>)
							printf 'Applying hat hair %s' s = <base_id>
							EditPlayerAppearance {
								profile = <currentskaterprofileindex>
								target = setpart
								targetparams = {part = cas_hat_hair desc_id = <base_id>}
							}
							EditPlayerAppearance {
								profile = <currentskaterprofileindex>
								target = hidegeom
								targetparams = {part = cas_hair hide_geom = 1}
							}
							cas_propogate_hair_color
						endif
					endif
				else
					EditPlayerAppearance {
						profile = <currentskaterprofileindex>
						target = setpart
						targetparams = {part = cas_hat_hair desc_id = none}
					}
					EditPlayerAppearance {
						profile = <currentskaterprofileindex>
						target = hidegeom
						targetparams = {part = cas_hair hide_geom = 0}
					}
				endif
			endif
		endif
	endif
endscript

script cas_disq_basic_exclusions 
	if getactualcasoptionstruct part = <part> desc_id = <desc_id>
		build_master_editable_list
		if gotparam \{exclusions}
			foreachin <master_editable_list> do = cas_disq_basic_exclusions_per_part params = {exclusions = <exclusions>}
		endif
		foreachin <master_editable_list> do = cas_disq_reverse_exclusions_per_part params = {other_part = <part> other_desc_id = <desc_id>}
	endif
endscript

script cas_disq_reverse_exclusions_per_part 
	GetCurrentSkaterProfileIndex
	if GetPlayerAppearancePart player = <currentskaterprofileindex> part = <part>
		if getactualcasoptionstruct part = <part> desc_id = <desc_id>
			if gotparam exclusions
				if structurecontains structure = <exclusions> <other_part>
					exclusion = (<exclusions>.<other_part>)
					if structurecontains structure = <exclusion> reverse
						reverse_desc_id = (<exclusion>.reverse)
						if NOT gotparam reverse_desc_id
							reverse_desc_id = none
						endif
						if (<other_desc_id> = <reverse_desc_id>)
							return
						endif
						if cas_disq_matches_change_from exclusion = <exclusion> desc_id = <other_desc_id>
							change_to = <reverse_desc_id>
							printf 'cas_disq_reverse_exclusions_per_part - %s - %t->%u' s = <part> t = <desc_id> u = <change_to>
							cas_disq_hide_parts part = <part> desc_id = <change_to>
							EditPlayerAppearance {
								profile = <currentskaterprofileindex>
								target = setpart
								targetparams = {part = <part> desc_id = <change_to>}
							}
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script cas_disq_basic_exclusions_per_part 
	if structurecontains structure = <exclusions> <part>
		exclusion = (<exclusions>.<part>)
		GetCurrentSkaterProfileIndex
		if GetPlayerAppearancePart player = <currentskaterprofileindex> part = <part>
			if NOT structurecontains structure = <exclusion> change_to
				scriptassert 'Exclusions require a \'change_to\' to be set'
			endif
			if cas_disq_matches_change_from exclusion = <exclusion> desc_id = <desc_id>
				change_to = (<exclusion>.change_to)
				printf 'cas_disq_basic_exclusions_per_part - %s - %t->%u' s = <part> t = <desc_id> u = <change_to>
				cas_disq_hide_parts part = <part> desc_id = <change_to>
				EditPlayerAppearance {
					profile = <currentskaterprofileindex>
					target = setpart
					targetparams = {part = <part> desc_id = <change_to>}
				}
			endif
		endif
	endif
endscript

script cas_disq_matches_change_from 
	if NOT structurecontains structure = <exclusion> change_from
		return \{true}
	else
		change_from = (<exclusion>.change_from)
		if isarray (<change_from>)
			getarraysize <change_from>
			i = 0
			begin
			change_from_name = (<change_from> [<i>])
			if (<desc_id> = <change_from_name>)
				return \{true}
			endif
			i = (<i> + 1)
			repeat <array_size>
		elseif (<desc_id> = <change_from>)
			return \{true}
		endif
	endif
endscript
cas_disq_hide_parts_list = [
]

script cas_disq_hide_parts 
	change cas_disq_hide_parts_list = []
	build_master_editable_list
	foreachin <master_editable_list> do = cas_disq_get_current_hide_parts params = {except = <part>}
	if getactualcasoptionstruct part = <part> desc_id = <desc_id>
		if gotparam hide_parts
			new_hide_parts = <hide_parts>
			removeparameter hide_parts
		endif
	endif
	GetCurrentSkaterProfileIndex
	if GetPlayerAppearancePart player = <currentskaterprofileindex> part = <part>
		if getactualcasoptionstruct part = <part> desc_id = <desc_id>
			if gotparam hide_parts
				old_hide_parts = <hide_parts>
			endif
		endif
	endif
	if gotparam old_hide_parts
		printf 'Unhiding old stuff...'
		i = 0
		getarraysize <old_hide_parts>
		if (<array_size> > 0)
			begin
			if NOT arraycontains array = ($cas_disq_hide_parts_list) contains = (<old_hide_parts> [<i>])
				EditPlayerAppearance {
					profile = <currentskaterprofileindex>
					target = hidegeom
					targetparams = {part = (<old_hide_parts> [<i>]) hide_geom = 0}
				}
			endif
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
	if gotparam new_hide_parts
		printf 'Hiding new stuff...'
		i = 0
		getarraysize <new_hide_parts>
		if (<array_size> > 0)
			begin
			EditPlayerAppearance {
				profile = <currentskaterprofileindex>
				target = hidegeom
				targetparams = {part = (<new_hide_parts> [<i>]) hide_geom = 1}
			}
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
endscript

script cas_disq_get_current_hide_parts 
	GetCurrentSkaterProfileIndex
	if NOT checksumequals a = <part> b = <except>
		if GetPlayerAppearancePart player = <currentskaterprofileindex> part = <part>
			if getactualcasoptionstruct part = <part> desc_id = <desc_id> dont_assert
				if gotparam \{hide_parts}
					change cas_disq_hide_parts_list = (($cas_disq_hide_parts_list) + <hide_parts>)
				endif
			endif
		endif
	endif
endscript

script get_lockout_parts 
	GetCurrentSkaterProfileIndex
	getarraysize <parts>
	<index> = 0
	<found_parts> = []
	<found> = 0
	begin
	if GetPlayerAppearancePart player = <currentskaterprofileindex> part = (<parts> [<index>])
		getactualcasoptionstruct part = (<parts> [<index>]) desc_id = <desc_id>
		if gotparam lockout_parts
			<found_parts> = (<found_parts> + <lockout_parts>)
			<found> = 1
		endif
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	if (<found>)
		return lockout_parts = <found_parts>
	endif
endscript

script check_for_lockout_parts 
	<ret_val> = 1
	if ((gotparam parts) && (gotparam menu_parts))
		get_lockout_parts parts = <parts>
		if gotparam lockout_parts
			getarraysize <lockout_parts>
			<num_lockout_parts> = <array_size>
			getarraysize <menu_parts>
			<num_menu_parts> = <array_size>
			<index> = 0
			begin
			if (<ret_val> = 0)
				break
			endif
			<index2> = 0
			begin
			if checksumequals a = (<menu_parts> [<index2>]) b = (<lockout_parts> [<index>])
				<ret_val> = 0
				break
			endif
			<index2> = (<index2> + 1)
			repeat <num_menu_parts>
			<index> = (<index> + 1)
			repeat <num_lockout_parts>
		endif
	endif
	return is_enabled = <ret_val>
endscript

script check_if_part_editable 
	<retval> = 0
	GetCharacterPartFromType part = <part>
	if gotparam \{part}
		GetCurrentSkaterProfileIndex
		if GetPlayerAppearancePart player = <currentskaterprofileindex> part = <character_part>
			if (<desc_id> = none)
				<retval> = 0
			else
				<retval> = 1
			endif
		endif
	endif
	if (<retval>)
		if gotparam \{extra_script}
			<extra_script> <extra_script_params>
			<retval> = <is_enabled>
		endif
	endif
	return is_enabled = <retval>
endscript

script check_if_parts_editable 
	<retval> = 0
	if gotparam parts
		getarraysize <parts>
		<index> = 0
		GetCurrentSkaterProfileIndex
		begin
		GetCharacterPartFromType part = (<parts> [<index>])
		if GetPlayerAppearancePart player = <currentskaterprofileindex> part = <character_part>
			if (<desc_id> = none)
				<retval> = 0
			else
				<retval> = 1
				break
			endif
		endif
		<index> = (<index> + 1)
		repeat <array_size>
	endif
	return is_enabled = <retval>
endscript

script check_if_part_logoable 
	<retval> = 0
	if gotparam extra_script
		<extra_script> <extra_script_params>
		if (<is_enabled> = 0)
			return is_enabled = <is_enabled>
		endif
	endif
	if gotparam parts
		getarraysize <parts>
		<index> = 0
		begin
		GetCurrentSkaterProfileIndex
		GetCharacterPartFromType part = (<parts> [<index>])
		if GetPlayerAppearancePart player = <currentskaterprofileindex> part = <character_part>
			getactualcasoptionstruct part = <character_part> desc_id = <desc_id>
			if gotparam supports_logo
				<retval> = 1
				break
			else
				<retval> = 0
				break
			endif
		endif
		<index> = (<index> + 1)
		repeat <array_size>
	endif
	return is_enabled = <retval>
endscript

script check_if_part_front_logoable 
	if gotparam extra_script
		<extra_script> <extra_script_params>
		if (<is_enabled> = 0)
			return is_enabled = <is_enabled>
		endif
	endif
	check_if_part_logoable <...>
	if (<is_enabled> = 1)
		if gotparam parts
			getarraysize <parts>
			<index> = 0
			begin
			GetCharacterPartFromType part = (<parts> [<index>])
			GetCurrentSkaterProfileIndex
			if GetPlayerAppearancePart player = <currentskaterprofileindex> part = <character_part>
				getactualcasoptionstruct part = <character_part> desc_id = <desc_id>
				if gotparam no_front_logo
					return is_enabled = 0
				endif
			endif
			<index> = (<index> + 1)
			repeat <array_size>
		endif
	endif
	return is_enabled = <is_enabled>
endscript

script check_if_part_back_logoable 
	if gotparam extra_script
		<extra_script> <extra_script_params>
		if (<is_enabled> = 0)
			return is_enabled = <is_enabled>
		endif
	endif
	check_if_part_logoable <...>
	if (<is_enabled> = 1)
		if gotparam parts
			getarraysize <parts>
			<index> = 0
			begin
			GetCurrentSkaterProfileIndex
			GetCharacterPartFromType part = (<parts> [<index>])
			if GetPlayerAppearancePart player = <currentskaterprofileindex> part = <character_part>
				getactualcasoptionstruct part = <character_part> desc_id = <desc_id>
				if gotparam no_back_logo
					return is_enabled = 0
				endif
			endif
			<index> = (<index> + 1)
			repeat <array_size>
		endif
	endif
	return is_enabled = <is_enabled>
endscript

script check_if_part_logo_adjustable 
	<retval> = 0
	if gotparam parts
		getarraysize <parts>
		<index> = 0
		begin
		GetCurrentSkaterProfileIndex
		GetCharacterPartFromType part = (<parts> [<index>])
		if GetPlayerAppearancePart player = <currentskaterprofileindex> part = <character_part>
			getactualcasoptionstruct part = <character_part> desc_id = <desc_id>
			if gotparam <Adjust_Struct>
				<retval> = 1
				break
			else
				<retval> = 0
				break
			endif
		endif
		<index> = (<index> + 1)
		repeat <array_size>
	endif
	return is_enabled = <retval>
endscript

script check_if_item_accessible 
	<retval> = 1
	GetCurrentSkaterProfileIndex
	GetSingleSkaterProfileInfo player = <currentskaterprofileindex> lockout_flags
	GetCharacterPartFromType part = <part>
	getactualcasoptionstruct part = <character_part> desc_id = <desc_id>
	if gotparam \{lockout_flags}
		getarraysize <lockout_flags>
		<index> = 0
		begin
		if gotparam (<lockout_flags> [<index>])
			<retval> = 0
			break
		endif
		<index> = (<index> + 1)
		repeat <array_size>
	endif
	return is_enabled = <retval>
endscript

script check_if_has_belt 
	<retval> = 0
	GetCurrentSkaterProfileIndex
	if GetPlayerAppearancePart player = <currentskaterprofileindex> part = cas_belt
		if NOT (<desc_id> = none)
			<retval> = 1
		endif
	endif
	return is_enabled = <retval>
endscript

script check_if_part_colorable 
	<retval> = 0
	if gotparam extra_script
		<extra_script> <extra_script_params>
		if (<is_enabled> = 0)
			return is_enabled = <is_enabled>
		endif
	endif
	if gotparam parts
		getarraysize <parts>
		<index> = 0
		begin
		GetCurrentSkaterProfileIndex
		GetCharacterPartFromType part = (<parts> [<index>])
		if GetPlayerAppearancePart player = <currentskaterprofileindex> part = <character_part>
			if (<desc_id> = none)
				<retval> = 0
				break
			else
				if getactualcasoptionstruct part = <character_part> desc_id = <desc_id> dont_assert
					if gotparam color_all_materials
						<retval> = 1
						break
					else
						if gotparam materials
							getarraysize <materials>
							if (<array_size> > 0)
								<retval> = 1
							else
								<retval> = 0
							endif
						else
							<retval> = 0
						endif
						break
					endif
				endif
			endif
		endif
		<index> = (<index> + 1)
		repeat <array_size>
	endif
	return is_enabled = <retval>
endscript

script check_if_secondary_colorable 
	check_if_part_colorable <...>
	if (<is_enabled> = 0)
		return is_enabled = <is_enabled>
	endif
	if gotparam parts
		getarraysize <parts>
		<index> = 0
		begin
		GetCurrentSkaterProfileIndex
		GetCharacterPartFromType part = (<parts> [<index>])
		if GetPlayerAppearancePart player = <currentskaterprofileindex> part = <character_part>
			getactualcasoptionstruct part = <character_part> desc_id = <desc_id>
			if gotparam color_all_materials
				<retval> = 0
				break
			endif
			if gotparam materials
				getarraysize <materials>
				if (<array_size> > 1)
					<retval> = 1
				else
					<retval> = 0
				endif
			else
				<retval> = 0
			endif
			break
		endif
		<index> = (<index> + 1)
		repeat <array_size>
	endif
	return is_enabled = <retval>
endscript

script cas_handle_special_boards 
	GetCurrentSkaterProfileIndex
	if checksumequals a = <part> b = CAS_DECK_GRAPHIC
		deck_graphic_id = <desc_id>
		needs_disq = 1
		if cas_has_special_board
			remove_special_board = 1
		endif
	elseif checksumequals a = <part> b = cas_board
		needs_disq = 1
	elseif checksumequals a = <part> b = CAS_GRIPTAPE
		needs_disq = 1
	elseif checksumequals a = <part> b = CAS_WHEEL
		needs_disq = 1
	endif
	if gotparam needs_disq
		if NOT gotparam deck_graphic_id
			if NOT GetPlayerAppearancePart part = CAS_DECK_GRAPHIC player = <currentskaterprofileindex>
				return
			endif
			deck_graphic_id = <desc_id>
		endif
		getactualcasoptionstruct part = CAS_DECK_GRAPHIC desc_id = <deck_graphic_id>
		if gotparam special_board
			EditPlayerAppearance {
				profile = <currentskaterprofileindex>
				target = setpart
				targetparams = {part = cas_board desc_id = <special_board>}
			}
			EditPlayerAppearance {
				profile = <currentskaterprofileindex>
				target = setpart
				targetparams = {part = CAS_DECK_GRAPHIC desc_id = `default`}
			}
			EditPlayerAppearance {
				profile = <currentskaterprofileindex>
				target = setpart
				targetparams = {part = CAS_GRIPTAPE desc_id = none}
			}
			EditPlayerAppearance {
				profile = <currentskaterprofileindex>
				target = setpart
				targetparams = {part = CAS_WHEEL desc_id = none}
			}
		elseif gotparam remove_special_board
			EditPlayerAppearance {
				profile = <currentskaterprofileindex>
				target = setpart
				targetparams = {part = cas_board desc_id = `default`}
			}
		endif
	endif
endscript

script cas_has_special_board 
	GetCurrentSkaterProfileIndex
	if GetPlayerAppearancePart part = CAS_DECK_GRAPHIC player = <currentskaterprofileindex>
		getactualcasoptionstruct part = CAS_DECK_GRAPHIC desc_id = <desc_id>
		if gotparam \{special_board}
			return \{true}
		endif
	endif
	return \{false}
endscript

script check_if_cas_board_special 
	if cas_has_special_board
		return \{is_enabled = 0}
	else
		return \{is_enabled = 1}
	endif
endscript
