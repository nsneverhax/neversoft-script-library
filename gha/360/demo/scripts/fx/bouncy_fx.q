numplywoodsmall = 0
maxplywoodsmall = 4

script contact_settle_die 
	settags \{contact_made}
	contact_terraineffects <...>
endscript

script deactivate_settle_die 
	gettags
	if gotparam \{contact_made}
		removetags \{[
				contact_made
			]}
		removeparameter \{contact_made}
	endif
	wait RandomRange (2.0, 4.0) seconds
	gettags
	if NOT gotparam \{contact_made}
		die
	endif
endscript

script deactivate_plywoodsmall 
	gettags
	if gotparam \{contact_made}
		removetags \{[
				contact_made
			]}
		removeparameter \{contact_made}
	endif
	wait RandomRange (2.0, 4.0) seconds
	gettags
	if NOT gotparam \{contact_made}
		change numplywoodsmall = ($numplywoodsmall -1)
		die
	endif
endscript

script contact_go_cafe_chair 
	if (<skatercollision> = true)
		return
	endif
	contact_terraineffects <...>
	<objid1> :obj_getvelocity
	normalizevector <vel>
	if (<length> > 7)
		<objid1> :obj_getposition
		getuniquecompositeobjectid \{preferredid = go_cafe_chair_bits}
		createglobalflexparticlesystem name = <uniqueid> pos = <pos> params_script = $gp_ho_cafe_chair_bits
		getuniquecompositeobjectid \{preferredid = go_cafe_chair_dust}
		createglobalflexparticlesystem name = <uniqueid> pos = <pos> params_script = $gp_ho_cafe_chair_dust
		getuniquecompositeobjectid \{preferredid = chairexplodesound}
		if createcompositeobject priority = coim_priority_sound heap = gameobj oldheap = com components = [{component = sound}] params = {
				name = <uniqueid>
				pos = <pos>
			}
			soundevent event = chair_break_sfx object = <uniqueid>
		endif
		wait \{1
			frame}
		die
	endif
endscript

script contact_plywood 
	contact_terraineffects <...>
	<objid1> :obj_getvelocity
	normalizevector <vel>
	if (<length> > 7)
		if NOT getsingletag \{plywood_break}
			settags \{plywood_break}
			if (<skatercollision> = true)
				newtarget = (-1 * <norm>)
			else
				newtarget = <norm>
			endif
			<objid1> :obj_getposition
			getuniquecompositeobjectid \{preferredid = plywoodbits}
			createglobalflexparticlesystem name = <uniqueid> pos = <pos> params_script = $gp_plywood_bits01
			if iscreated <uniqueid>
				orient object = <uniqueid> relativeto = <objid1> offset = (0.0, 1.0, 0.0)
			endif
			getuniquecompositeobjectid \{preferredid = plywooddust}
			createglobalflexparticlesystem name = <uniqueid> pos = <pos> params_script = $gp_plywood_dust01
			if iscreated <uniqueid>
				orient object = <uniqueid> relativeto = <objid1> offset = (0.0, 1.0, 0.0)
			endif
			if ($numplywoodsmall < $maxplywoodsmall)
				begin
				getuniquecompositeobjectid \{preferredid = plywoodsmall01}
				createfromstructure {
					name = <uniqueid>
					pos = (<pos> + RandomRange (-1.0, 1.0) * (1.0, 0.0, 0.0) + RandomRange (-1.0, 1.0) * (0.0, 1.0, 0.0) + RandomRange (-1.0, 1.0) * (0.0, 0.0, 1.0))
					angles = (RandomRange (-3.1399999, 3.1399999) * (1.0, 0.0, 0.0) + RandomRange (-3.1399999, 3.1399999) * (0.0, 1.0, 0.0) + RandomRange (-3.1399999, 3.1399999) * (0.0, 0.0, 1.0))
					class = gameobject
					type = go_plywood_small_piece
					bouncy
					profile = $profile_go_plywood_small_piece
				}
				if iscreated <uniqueid>
					<uniqueid> :rigidbody_linearimpulse impulse = (2.5 * <length> * (<newtarget> + (0.0, 0.25, 0.0)))
					change numplywoodsmall = ($numplywoodsmall + 1)
					if NOT ($numplywoodsmall < $maxplywoodsmall)
						break
					endif
				endif
				repeat RandomRange (1.0, 2.0)
			endif
			getuniquecompositeobjectid \{preferredid = shortpottedplantexplodesound}
			if createcompositeobject priority = coim_priority_sound heap = gameobj oldheap = com components = [{component = sound}] params = {
					name = <uniqueid>
					pos = <pos>
				}
				soundevent event = plywood_break_sfx object = <uniqueid>
			endif
			wait \{1
				frame}
			die
		endif
	endif
endscript

script contact_pottedplant_short 
	if (<skatercollision> = true)
		return
	endif
	contact_terraineffects <...>
	<objid1> :obj_getvelocity
	normalizevector <vel>
	if (<length> > 7)
		<objid1> :obj_getposition
		getuniquecompositeobjectid \{preferredid = pottedplant_dirt}
		createglobalflexparticlesystem name = <uniqueid> pos = <pos> params_script = $gp_pot_dust01
		if iscreated <uniqueid>
			orient object = <uniqueid> relativeto = <objid1> offset = (0.0, 0.5, 0.0)
		endif
		getuniquecompositeobjectid \{preferredid = pottedplant_dirt}
		createglobalflexparticlesystem name = <uniqueid> pos = <pos> params_script = $gp_pot_bits01
		getuniquecompositeobjectid \{preferredid = pottedplant_leaves}
		createglobalflexparticlesystem name = <uniqueid> pos = <pos> params_script = $gp_leaves_short01
		if iscreated <uniqueid>
			orient object = <uniqueid> relativeto = <objid1> offset = (0.0, 1.0, 0.0)
		endif
		getuniquecompositeobjectid \{preferredid = shortpottedplantexplodesound}
		if createcompositeobject priority = coim_priority_sound heap = gameobj oldheap = com components = [{component = sound}] params = {
				name = <uniqueid>
				pos = <pos>
			}
			soundevent event = pottedplant_explode_sfx object = <uniqueid>
		endif
		wait \{1
			frame}
		die
	endif
endscript

script contact_pottedplant_tall 
	if (<skatercollision> = true)
		return
	endif
	contact_terraineffects <...>
	<objid1> :obj_getvelocity
	normalizevector <vel>
	if (<length> > 7)
		<objid1> :obj_getposition
		getuniquecompositeobjectid \{preferredid = pottedplant_dirt}
		createglobalflexparticlesystem name = <uniqueid> pos = <pos> params_script = $gp_pot_dust01
		if iscreated <uniqueid>
			orient object = <uniqueid> relativeto = <objid1> offset = (0.0, 0.7, 0.0)
		endif
		getuniquecompositeobjectid \{preferredid = pottedplant_dirt}
		createglobalflexparticlesystem name = <uniqueid> pos = <pos> params_script = $gp_pot_bits01
		getuniquecompositeobjectid \{preferredid = pottedplant_leaves}
		createglobalflexparticlesystem name = <uniqueid> pos = <pos> params_script = $gp_leaves_tall01
		if iscreated <uniqueid>
			orient object = <uniqueid> relativeto = <objid1> offset = (0.0, 2.0, 0.0)
		endif
		getuniquecompositeobjectid \{preferredid = shortpottedplantexplodesound}
		if createcompositeobject priority = coim_priority_sound heap = gameobj oldheap = com components = [{component = sound}] params = {
				name = <uniqueid>
				pos = <pos>
			}
			soundevent event = pottedplant_explode_sfx object = <uniqueid>
		endif
		wait \{1
			frame}
		die
	endif
endscript

script contact_terraineffects 
	if (<skatercollision> = true)
		return
	endif
	<objid1> :obj_getvelocity
	normalizevector <vel>
	if (<length> < 3)
		return
	endif
	terrain1 = (($terrain_types [<terrain1>]).checksum)
	terrain2 = (($terrain_types [<terrain2>]).checksum)
	getterraintypeparam param = treadactions terrain = <terrain2>
	begin
	if getnextarrayelement (<treadactions>.skaterjumplandparticleparms)
		getuniquecompositeobjectid \{preferredid = bounceterrain01}
		if ((<element>.type) = newflat)
			createglobalfastparticlesystem name = <uniqueid> params_script = <element> pos = <pos>
		else
			createglobalflexparticlesystem name = <uniqueid> params_script = <element> pos = <pos>
		endif
	else
		break
	endif
	repeat
	switch <terrain1>
		case terrain_metalcar
		case terrain_metal
		case terrain_metalpole
		case terrain_metaltin
		case terrain_metallockers
		case terrain_metalthin
		case terrain_metalpipelarge
		case terrain_mailbox
		case terrain_metalgrate
		switch <terrain2>
			case terrain_default
			case terrain_asphalt
			case terrain_asphaltrough
			case terrain_asphaltsmooth
			case terrain_asphaltsmooth_hf
			case terrain_brick
			case terrain_brick_1ft
			case terrain_brick_2ft
			case terrain_brick_4ft
			case terrain_brick_6in
			case terrain_cobblestone
			case terrain_concsmooth
			case terrain_concrough
			case terrain_goldcoins
			case terrain_highfriction
			case terrain_mailbox
			case terrain_metalcar
			case terrain_metal
			case terrain_metalgrate
			case terrain_metallockers
			case terrain_metalpipelarge
			case terrain_metalpole
			case terrain_metalthin
			case terrain_metaltin
			case terrain_shinglestile
			case terrain_sidewalk_1ft
			case terrain_sidewalk_2ft
			case terrain_sidewalk_4ft
			case terrain_sidewalk_4ft_hf
			case terrain_sidewalk_8ft
			case terrain_tile_2ft
			case terrain_tile_4ft
			case terrain_tile_6in
			getuniquecompositeobjectid \{preferredid = bouncysparks01}
			createglobalflexparticlesystem name = <uniqueid> pos = <pos> params_script = {$gp_bouncy_sparks01 emit_target = ((-1 * <norm>) + (0.0, 0.25, 0.0))}
		endswitch
	endswitch
endscript
