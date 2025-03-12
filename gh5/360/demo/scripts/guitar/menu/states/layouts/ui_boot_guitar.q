
script is_regular_controller 
	if isguitarcontroller controller = <controller>
		return \{false}
	elseif isdrumcontroller controller = <controller>
		return \{false}
	endif
	return \{true}
endscript
