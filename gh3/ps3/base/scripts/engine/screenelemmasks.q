
script CreateMaskedScreenElements 
	if NOT GotParam \{mask_element}
		Script_Assert \{"Must pass mask_element to CreateMaskedScreenElements"}
	endif
	if NOT GotParam \{z_priority}
		<z_priority> = 0
	endif
	if NOT GotParam \{Elements}
		<Elements> = []
	endif
	GetScreenElementMaskParams
	if NOT GotParam \{Debug}
		CreateScreenElement {
			<mask_element>
			Type = SpriteElement
			rgba = <mask_rgba>
			Alpha = <mask_alpha>
			BLEND = Add
			z_priority = (<z_priority> + 1)
			base_pass
		}
	else
		CreateScreenElement {
			<mask_element>
			z_priority = (<z_priority> + 1)
		}
	endif
	if GotParam \{Elements}
		GetArraySize \{Elements}
		<I> = 0
		if (<array_Size> > 0)
			begin
			<Element> = (<Elements> [<I>])
			CreateMaskedScreenElement {
				<Element>
				z_priority = (<z_priority> + 2)
			}
			<I> = (<I> + 1)
			repeat <array_Size>
		endif
	endif
endscript

script CreateMaskedScreenElement 
	if NOT GotParam \{BLEND}
		GetScreenElementMaskParams
		<BLEND> = <multi_blend>
	endif
	CreateScreenElement {
		<...>
		no_zwrite
		BLEND = <BLEND>
		second_pass
	}
endscript

script GetScreenElementMaskParams 
	GetPlatform
	switch <Platform>
		case XENON
		case PS3
		<mask_rgba> = [128 128 128 0]
		<mask_alpha> = 0.0
		<multi_blend> = BLEND
		default
		<mask_rgba> = [128 128 128 128]
		<mask_alpha> = 1.0
		<multi_blend> = BlendPrev
	endswitch
	return {mask_rgba = <mask_rgba>
		mask_alpha = <mask_alpha>
		multi_blend = <multi_blend>
	}
endscript
