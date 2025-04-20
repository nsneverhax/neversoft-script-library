
script Vehicle_DisableHeroAcquire 
	agent_gettype
	if NOT (<agent_type> = horse)
		if NOT (<agent_type> = mounted_horse)
			scriptassert \{"this only works with horses at the moment"}
		endif
	endif
	proximity_setactive \{inactive}
endscript

script Vehicle_EnableHeroAcquire 
	agent_gettype
	if NOT (<agent_type> = horse)
		if NOT (<agent_type> = mounted_horse)
			scriptassert \{"this only works with horses at the moment"}
		endif
	endif
	proximity_setactive
endscript
