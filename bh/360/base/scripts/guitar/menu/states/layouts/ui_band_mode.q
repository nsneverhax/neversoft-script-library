
script ui_get_controller_parts_allowed 
	RequireParams \{[
			controller
		]
		all}
	if (($allow_controller_for_all_instruments) = 0)
		allowed = {}
		if isguitarcontroller controller = <controller>
			allowed = {guitar bass}
		elseif isdrumcontroller controller = <controller>
			allowed = {Drum}
		elseif IsMicrophonePluggedIn
			allowed = {vocals}
		endif
	else
		allowed = {guitar bass Drum vocals}
		if isguitarcontroller controller = <controller>
			allowed = {guitar bass}
		elseif isdrumcontroller controller = <controller>
			allowed = {Drum}
		elseif IsMicrophonePluggedIn
			allowed = {guitar bass Drum vocals}
		endif
	endif
	if is_regular_controller controller = <controller>
		if controller_has_headset controller = <controller>
			allowed = {<allowed> vocals}
		endif
	endif
	if GotParam \{filter_by_character}
		filter_allowed_parts_by_character_type allowed = <allowed> controller = <controller>
	endif
	return allowed = <allowed>
endscript

script get_controller_part 
	RequireParams \{[
			controller
		]
		all}
	if isguitarcontroller controller = <controller>
		return \{controller_part = guitar}
	elseif isdrumcontroller controller = <controller>
		return \{controller_part = Drum}
	else
		return \{controller_part = vocals}
	endif
endscript
