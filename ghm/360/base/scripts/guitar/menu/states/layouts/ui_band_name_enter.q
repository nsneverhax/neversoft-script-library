
script ui_band_name_is_valid 
	StringRemoveTrailingWhitespace string = <text>
	StringToCharArray string = <new_string>
	GetArraySize <char_array>
	if (<array_Size> = 0)
		return \{FALSE}
	else
		return \{true}
	endif
endscript
