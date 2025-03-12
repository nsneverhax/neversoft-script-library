
script createmaskedscreenelements 
	if NOT gotparam \{mask_element}
		script_assert \{qs(0x178b9b17)}
	endif
	if NOT gotparam \{z_priority}
		<z_priority> = 0
	endif
	if NOT gotparam \{elements}
		<elements> = []
	endif
	getscreenelementmaskparams
	if NOT gotparam \{debug}
		createscreenelement {
			<mask_element>
			type = spriteelement
			rgba = <mask_rgba>
			alpha = <mask_alpha>
			blend = add
			z_priority = (<z_priority> + 1)
			base_pass
		}
	else
		createscreenelement {
			<mask_element>
			z_priority = (<z_priority> + 1)
		}
	endif
	if gotparam \{elements}
		getarraysize \{elements}
		<i> = 0
		if (<array_size> > 0)
			begin
			<element> = (<elements> [<i>])
			createmaskedscreenelement {
				<element>
				z_priority = (<z_priority> + 2)
			}
			<i> = (<i> + 1)
			repeat <array_size>
		endif
	endif
endscript

script createmaskedscreenelement 
	if NOT gotparam \{blend}
		getscreenelementmaskparams
		<blend> = <multi_blend>
	endif
	createscreenelement {
		<...>
		no_zwrite
		blend = <blend>
		second_pass
	}
endscript

script getscreenelementmaskparams 
	getplatform
	switch <platform>
		case xenon
		case ps3
		<mask_rgba> = [128 128 128 0]
		<mask_alpha> = 0.0
		<multi_blend> = blend
		default
		<mask_rgba> = [128 128 128 128]
		<mask_alpha> = 1.0
		<multi_blend> = blendprev
	endswitch
	return {mask_rgba = <mask_rgba>
		mask_alpha = <mask_alpha>
		multi_blend = <multi_blend>
	}
endscript
