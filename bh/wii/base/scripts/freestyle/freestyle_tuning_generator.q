freestyle_button_order_single_notes = [
	0
	65536
	4096
	256
	16
	1
]
freestyle_button_order_2button_chords = [
	69632
	65792
	65552
	4352
	4112
	4097
	272
	257
	17
	65537
]
freestyle_button_order_3button_chords = [
	69888
	69648
	65808
	4368
	4353
	4113
	273
	69633
	65793
	65553
]
freestyle_button_order_fx_chords = [
	69904
	69649
	4369
	69905
]
freestyle_generate_steps_guitar = [
	{
		template_element = low_tilt_notes
		button_order = $freestyle_button_order_single_notes
		tilts = 1
		bank = guitar_notes
	}
	{
		template_element = mid_tilt_notes
		button_order = $freestyle_button_order_single_notes
		tilts = 16
		bank = guitar_notes
	}
	{
		template_element = two_button_chords
		button_order = $freestyle_button_order_2button_chords
		tilts = 17
		bank = guitar_chords2
	}
	{
		template_element = three_button_chords
		button_order = $freestyle_button_order_3button_chords
		tilts = 17
		bank = guitar_chords3
	}
	{
		template_element = fx_chords
		button_order = $freestyle_button_order_fx_chords
		tilts = 273
		bank = guitar_chords3
	}
	{
		template_element = two_button_riffs
		button_order = $freestyle_button_order_2button_chords
		tilts = 256
		bank = guitar_riffs
	}
	{
		template_element = three_button_riffs
		button_order = $freestyle_button_order_3button_chords
		tilts = 256
		bank = guitar_riffs
	}
	{
		template_element = licks
		button_order = $freestyle_button_order_single_notes
		tilts = 256
		bank = guitar_riffs
	}
]
freestyle_generate_steps_bass = [
	{
		template_element = low_tilt_notes
		button_order = $freestyle_button_order_single_notes
		tilts = 1
		bank = bass_notes
	}
	{
		template_element = mid_tilt_notes
		button_order = $freestyle_button_order_single_notes
		tilts = 16
		bank = bass_notes
	}
	{
		template_element = high_tilt_notes
		button_order = $freestyle_button_order_single_notes
		tilts = 256
		bank = bass_notes
	}
	{
		template_element = two_button_riffs
		button_order = $freestyle_button_order_2button_chords
		tilts = 273
		bank = bass_riffs
	}
	{
		template_element = three_button_riffs
		button_order = $freestyle_button_order_3button_chords
		tilts = 273
		bank = bass_riffs
	}
	{
		template_element = fx_chords
		button_order = $freestyle_button_order_fx_chords
		tilts = 273
		bank = bass_riffs
	}
]

script freestyle_generate_tuning 
	RequireParams \{[
			template
			instrument
		]
		all}
	tuning = []
	switch (<instrument>)
		case guitar
		steps = $freestyle_generate_steps_guitar
		case bass
		steps = $freestyle_generate_steps_bass
		default
		ScriptAssert 'Dont know how to generate tuning for instrument %a' a = <instrument>
		return tuning = <tuning>
	endswitch
	GetArraySize <steps>
	i = 0
	begin
	freestyle_generate_tuning_step {
		tuning = <tuning>
		template = <template>
		template_element = (<steps> [<i>].template_element)
		button_order = (<steps> [<i>].button_order)
		tilts = (<steps> [<i>].tilts)
		bank = (<steps> [<i>].bank)
	}
	tuning = <tuning_step>
	<i> = (<i> + 1)
	repeat <array_Size>
	return tuning = <tuning>
endscript

script freestyle_generate_tuning_step 
	RequireParams \{[
			tuning
			template
			template_element
			button_order
			tilts
			bank
		]
		all}
	if NOT StructureContains structure = <template> <template_element>
		return tuning_step = <tuning>
	endif
	template_array = (<template>.<template_element>)
	GetArraySize <template_array>
	template_size = <array_Size>
	GetArraySize <button_order>
	button_size = <array_Size>
	if (<template_size> != <button_size>)
		ScriptAssert {
			'Tuning template element %a does not have the right number of elements (has %b, needs %c)'
			a = <template_element>
			b = <template_size>
			c = <button_size>
		}
		return tuning_step = <tuning>
	endif
	unmerged_step = []
	createstructurearray array_name = unmerged_step size = <button_size>
	i = 0
	begin
	tuning_element = {
		tilts = <tilts>
		buttons = (<button_order> [<i>])
		note = (<template_array> [<i>])
		bank = <bank>
	}
	SetArrayElement ArrayName = unmerged_step index = <i> NewValue = <tuning_element>
	<i> = (<i> + 1)
	repeat <button_size>
	freestyle_merge_tunings tuning1 = <tuning> tuning2 = <unmerged_step>
	return tuning_step = <merged_tuning>
endscript

script freestyle_merge_tunings 
	RequireParams \{[
			tuning1
			tuning2
		]
		all}
	GetArraySize <tuning1>
	tuning1_size = <array_Size>
	GetArraySize <tuning2>
	tuning2_size = <array_Size>
	merged_size = (<tuning1_size> + <tuning2_size>)
	merged_tuning = []
	createstructurearray array_name = merged_tuning size = <merged_size>
	merged_index = 0
	if (<tuning1_size> > 0)
		source_index = 0
		begin
		SetArrayElement ArrayName = merged_tuning index = <merged_index> NewValue = (<tuning1> [<source_index>])
		<source_index> = (<source_index> + 1)
		<merged_index> = (<merged_index> + 1)
		repeat <tuning1_size>
	endif
	if (<tuning2_size> > 0)
		source_index = 0
		begin
		SetArrayElement ArrayName = merged_tuning index = <merged_index> NewValue = (<tuning2> [<source_index>])
		<source_index> = (<source_index> + 1)
		<merged_index> = (<merged_index> + 1)
		repeat <tuning2_size>
	endif
	return merged_tuning = <merged_tuning>
endscript

script freestyle_transpose_tuning 
	RequireParams \{[
			tuning
			original_tonic
			new_tonic
		]
		all}
	convertnotestringtonumber <original_tonic>
	original_tonic_number = <note_number>
	convertnotestringtonumber <new_tonic>
	new_tonic_number = <note_number>
	note_offset = (<new_tonic_number> - <original_tonic_number>)
	GetArraySize <tuning>
	i = 0
	begin
	convertnotestringtonumber (<tuning> [<i>].note)
	note_number = (<note_number> + <note_offset>)
	convertnotenumbertostring <note_number>
	setstructureparam array_name = tuning array_index = <i> param = note value = <note_string>
	<i> = (<i> + 1)
	repeat <array_Size>
	return transposed_tuning = <tuning>
endscript
