
script contact_settle_die 
	settags \{contact_made}
	contact_terraineffects <...>
endscript

script Contact_Settle_Die_Sparks 
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

script contact_go_cafe_chair 
	if (<skatercollision> = true)
		return
	endif
	contact_terraineffects <...>
	<objid1> :obj_getvelocity
	normalizevector <vel>
	if (<length> > 7)
		<objid1> :obj_getposition
		getuniquecompositeobjectid preferredid = chairexplodesound
		if createcompositeobject priority = coim_priority_sound heap = gameobj oldheap = com components = [{component = sound}] params = {
				name = <uniqueid>
				pos = <pos>
			}
			soundevent event = chair_break_sfx object = <uniqueid>
		endif
		wait 1 frame
		die
	endif
endscript

script Contact_SparkTerrainEffects 
	if (<skatercollision> = true)
		return
	endif
	<objid1> :obj_getvelocity
	normalizevector <vel>
	if (<length> < 3)
		return
	endif
	ter1 = (($terrain_types [<terrain1>]).checksum)
	ter2 = (($terrain_types [<terrain2>]).checksum)
	getterraintypeparam param = treadactions terrain = <ter2>
	if ($currainpuddlesintensity <= 0.2)
		switch <ter1>
			case terrain_default
			case terrain_chain
			case TERRAIN_CHAINLINNKFENCE
			case terrain_electricwire
			case terrain_mailbox
			case TERRAIN_METAIL
			case terrain_metalcar
			case TERRAIN_METALFLIMSY
			case terrain_metalgrate
			case terrain_metalpole
			case terrain_metalthin
			case terrain_metaltin
			switch <ter2>
				case terrain_default
				case terrain_asphaltrough
				case terrain_asphaltsmooth
				case terrain_brick
				case terrain_brick_6in
				case terrain_brick_1ft
				case terrain_brick_2ft
				case terrain_chain
				case TERRAIN_CHAINLINNKFENCE
				case terrain_cobblestone
				case terrain_concsmooth
				case terrain_concrough
				case terrain_concsmooth
				case terrain_electricwire
				case GLASS
				case MAILBOX
				case TERRAIN_METAIL
				case terrain_metalcar
				case TERRAIN_METALFLIMSY
				case terrain_metalgrate
				case terrain_metalpole
				case terrain_metalthin
				case terrain_metaltin
				case terrain_rooftop
				case terrain_shallowwaterpooltile
				case SIDEWALK
				case SIDEWALK_1FT
				case SIDEWALK_2FT
				case SIDEWALK_4FT
				case SIDEWALK_8FT
				case tile
				case TILE_6IN
				case TILE_2FT
				case TILE_4FT
				getuniquecompositeobjectid preferredid = bouncysparks01
				createglobalflexparticlesystem name = <uniqueid> pos = <pos> params_script = {$GP_Point_Rail_Sparks01 emit_target = ((-1 * <norm>) + (0.0, 0.25, 0.0))}
			endswitch
		endswitch
	endif
	contact_terraineffects <...>
endscript

script contact_terraineffects 
	if (<skatercollision> = true)
		return
	endif
	if ((($terrain_types [<terrain2>]).desc) = 'BouncyKill')
		die
	endif
	<objid1> :obj_getvelocity
	normalizevector <vel>
	if (<length> < 3)
		return
	endif
	ter1 = (($terrain_types [<terrain1>]).checksum)
	ter2 = (($terrain_types [<terrain2>]).checksum)
	getterraintypeparam param = treadactions terrain = <ter2>
	begin
	if ($currainpuddlesintensity <= 0.2)
		if NOT getnextarrayelement (<treadactions>.skaterjumplandparticleparms)
			break
		endif
	else
		if NOT getnextarrayelement (<treadactions>.SkaterJumpLandParticleParms_Wet)
			break
		endif
	endif
	getuniquecompositeobjectid preferredid = bounceterrain01
	createparticlesystem name = <uniqueid> params_script = <element> pos = <pos>
	repeat
endscript
