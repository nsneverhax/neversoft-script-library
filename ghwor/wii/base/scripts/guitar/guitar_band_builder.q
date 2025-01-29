band_builder_current_setup = [
]
band_builder_current_gig_genre = None
use_worst_band = 0
band_default_object_names = {
	vocals = musician1
	drum = musician2
	guitar = musician3
	bass = musician4
}

script band_builder_clear_setup 
	Change \{band_builder_current_setup = [
		]}
endscript
wii_last_character_ids = [
	None
	None
	None
	None
]
wii_last_character_gender = [
	None
	None
	None
	None
]

script wii_clear_band_config 
	Change \{wii_last_character_ids = [
			None
			None
			None
			None
		]}
	Change \{wii_last_character_gender = [
			None
			None
			None
			None
		]}
endscript

script band_builder_remove_setup_entry 
	RequireParams \{[
			Name
		]
		all}
	i = 0
	GetArraySize \{$band_builder_current_setup}
	if (<array_Size> > 0)
		begin
		if (($band_builder_current_setup [<i>].Name) = <Name>)
			if GotParam \{found}
				ScriptAssert 'Duplicate %s found' s = <Name>
			endif
			found = <i>
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	if GotParam \{found}
		RemoveArrayElement array = ($band_builder_current_setup) index = <found>
		Change band_builder_current_setup = <array>
	else
	endif
endscript
