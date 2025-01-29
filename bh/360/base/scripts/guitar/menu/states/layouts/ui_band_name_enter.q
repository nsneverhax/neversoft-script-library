
script ui_band_name_is_valid 
	StringRemoveTrailingWhitespace string = <text>
	StringToCharArray string = <new_string>
	GetArraySize <char_array>
	if (<array_size> = 0)
		return \{false}
	else
		return \{true}
	endif
endscript
