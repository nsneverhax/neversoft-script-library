
script is_regular_controller 
	if IsGuitarController controller = <controller>
		return \{FALSE}
	elseif isdrumcontroller controller = <controller>
		return \{FALSE}
	endif
	return \{true}
endscript
