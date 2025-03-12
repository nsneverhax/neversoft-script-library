
script ui_band_name_is_valid 
	stringremovetrailingwhitespace string = <text>
	stringtochararray string = <new_string>
	getarraysize <char_array>
	if (<array_size> = 0)
		return \{false}
	else
		return \{true}
	endif
endscript
