
script CreateMaskedScreenElements 
	if NOT GotParam \{mask_element}
		script_assert \{qs(0x178b9b17)}
	endif
	if NOT GotParam \{z_priority}
		<z_priority> = 0
	endif
	if NOT GotParam \{Elements}
		<Elements> = []
	endif
	GetScreenElementMaskParams
	if NOT GotParam \{debug}
		CreateScreenElement {
			<mask_element>
			type = SpriteElement
			rgba = <mask_rgba>
			alpha = <mask_alpha>
			blend = add
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
		<i> = 0
		if (<array_size> > 0)
			begin
			<element> = (<Elements> [<i>])
			CreateMaskedScreenElement {
				<element>
				z_priority = (<z_priority> + 2)
			}
			<i> = (<i> + 1)
			repeat <array_size>
		endif
	endif
endscript

script CreateMaskedScreenElement 
	if NOT GotParam \{blend}
		GetScreenElementMaskParams
		<blend> = <multi_blend>
	endif
	CreateScreenElement {
		<...>
		no_zwrite
		blend = <blend>
		second_pass
	}
endscript

script GetScreenElementMaskParams 
	GetPlatform
	switch <Platform>
		case Xenon
		case PS3
		<mask_rgba> = [128 128 128 0]
		<mask_alpha> = 0.0
		<multi_blend> = blend
		default
		<mask_rgba> = [128 128 128 128]
		<mask_alpha> = 1.0
		<multi_blend> = blendPrev
	endswitch
	return {mask_rgba = <mask_rgba>
		mask_alpha = <mask_alpha>
		multi_blend = <multi_blend>
	}
endscript
