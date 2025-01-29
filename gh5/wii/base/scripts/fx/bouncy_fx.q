numPlywoodSmall = 0
maxPlywoodSmall = 4

script Contact_Settle_Die 
	SetTags \{CONTACT_MADE}
	Contact_TerrainEffects <...>
endscript

script Deactivate_Settle_Die 
	ScriptAssert \{'Deactivate_Settle_Die: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script Deactivate_PlywoodSmall 
	GetTags
	if GotParam \{CONTACT_MADE}
		RemoveTags \{[
				CONTACT_MADE
			]}
		RemoveParameter \{CONTACT_MADE}
	endif
	Wait RandomFloat (2.0, 4.0) Seconds
	GetTags
	if NOT GotParam \{CONTACT_MADE}
		Change numPlywoodSmall = ($numPlywoodSmall -1)
		Die
	endif
endscript

script Contact_GO_Cafe_Chair 
	if (<SkaterCollision> = true)
		return
	endif
	Contact_TerrainEffects <...>
	<objID1> :Obj_GetVelocity
	NormalizeVector <vel>
	if (<length> > 7)
		<objID1> :Obj_GetPosition
		GetUniqueCompositeobjectID \{preferredID = GO_Cafe_Chair_Bits}
		CreateGlobalFlexParticleSystem Name = <uniqueID> Pos = <Pos> params_Script = $GP_HO_Cafe_Chair_Bits
		GetUniqueCompositeobjectID \{preferredID = GO_Cafe_Chair_Dust}
		CreateGlobalFlexParticleSystem Name = <uniqueID> Pos = <Pos> params_Script = $GP_HO_Cafe_Chair_Dust
		GetUniqueCompositeobjectID \{preferredID = ChairExplodeSound}
		if CreateCompositeObject Priority = COIM_Priority_Sound Heap = GameObj OldHeap = COM components = [{component = Sound}] params = {
				Name = <uniqueID>
				Pos = <Pos>
			}
			SoundEvent event = Chair_Break_SFX object = <uniqueID>
		endif
		Wait \{1
			Frame}
		Die
	endif
endscript

script Contact_Plywood 
	Contact_TerrainEffects <...>
	<objID1> :Obj_GetVelocity
	NormalizeVector <vel>
	if (<length> > 7)
		if NOT GetSingleTag \{PLYWOOD_BREAK}
			SetTags \{PLYWOOD_BREAK}
			if (<SkaterCollision> = true)
				newTarget = (-1 * <norm>)
			else
				newTarget = <norm>
			endif
			<objID1> :Obj_GetPosition
			GetUniqueCompositeobjectID \{preferredID = PlywoodBits}
			CreateGlobalFlexParticleSystem Name = <uniqueID> Pos = <Pos> params_Script = $GP_Plywood_Bits01
			if IsCreated <uniqueID>
				orient object = <uniqueID> relativeTo = <objID1> offset = (0.0, 1.0, 0.0)
			endif
			GetUniqueCompositeobjectID \{preferredID = PlywoodDust}
			CreateGlobalFlexParticleSystem Name = <uniqueID> Pos = <Pos> params_Script = $GP_Plywood_Dust01
			if IsCreated <uniqueID>
				orient object = <uniqueID> relativeTo = <objID1> offset = (0.0, 1.0, 0.0)
			endif
			if ($numPlywoodSmall < $maxPlywoodSmall)
				begin
				GetUniqueCompositeobjectID \{preferredID = PlywoodSmall01}
				CreateFromStructure {
					Name = <uniqueID>
					Pos = (<Pos> + RandomFloat (-1.0, 1.0) * (1.0, 0.0, 0.0) + RandomFloat (-1.0, 1.0) * (0.0, 1.0, 0.0) + RandomFloat (-1.0, 1.0) * (0.0, 0.0, 1.0))
					Angles = (RandomFloat (-3.1399999, 3.1399999) * (1.0, 0.0, 0.0) + RandomFloat (-3.1399999, 3.1399999) * (0.0, 1.0, 0.0) + RandomFloat (-3.1399999, 3.1399999) * (0.0, 0.0, 1.0))
					Class = GameObject
					Type = GO_Plywood_Small_Piece
					Bouncy
					Profile = $profile_GO_Plywood_Small_Piece
				}
				if IsCreated <uniqueID>
					<uniqueID> :RigidBody_LinearImpulse impulse = (2.5 * <length> * (<newTarget> + (0.0, 0.25, 0.0)))
					Change numPlywoodSmall = ($numPlywoodSmall + 1)
					if NOT ($numPlywoodSmall < $maxPlywoodSmall)
						break
					endif
				endif
				repeat RandomInteger (1.0, 2.0)
			endif
			GetUniqueCompositeobjectID \{preferredID = ShortPottedPlantExplodeSound}
			if CreateCompositeObject Priority = COIM_Priority_Sound Heap = GameObj OldHeap = COM components = [{component = Sound}] params = {
					Name = <uniqueID>
					Pos = <Pos>
				}
				SoundEvent event = Plywood_Break_SFX object = <uniqueID>
			endif
			Wait \{1
				Frame}
			Die
		endif
	endif
endscript

script Contact_PottedPlant_Short 
	if (<SkaterCollision> = true)
		return
	endif
	Contact_TerrainEffects <...>
	<objID1> :Obj_GetVelocity
	NormalizeVector <vel>
	if (<length> > 7)
		<objID1> :Obj_GetPosition
		GetUniqueCompositeobjectID \{preferredID = PottedPlant_Dirt}
		CreateGlobalFlexParticleSystem Name = <uniqueID> Pos = <Pos> params_Script = $GP_Pot_Dust01
		if IsCreated <uniqueID>
			orient object = <uniqueID> relativeTo = <objID1> offset = (0.0, 0.5, 0.0)
		endif
		GetUniqueCompositeobjectID \{preferredID = PottedPlant_Dirt}
		CreateGlobalFlexParticleSystem Name = <uniqueID> Pos = <Pos> params_Script = $GP_Pot_Bits01
		GetUniqueCompositeobjectID \{preferredID = PottedPlant_Leaves}
		CreateGlobalFlexParticleSystem Name = <uniqueID> Pos = <Pos> params_Script = $GP_Leaves_Short01
		if IsCreated <uniqueID>
			orient object = <uniqueID> relativeTo = <objID1> offset = (0.0, 1.0, 0.0)
		endif
		GetUniqueCompositeobjectID \{preferredID = ShortPottedPlantExplodeSound}
		if CreateCompositeObject Priority = COIM_Priority_Sound Heap = GameObj OldHeap = COM components = [{component = Sound}] params = {
				Name = <uniqueID>
				Pos = <Pos>
			}
			SoundEvent event = PottedPlant_Explode_SFX object = <uniqueID>
		endif
		Wait \{1
			Frame}
		Die
	endif
endscript

script Contact_PottedPlant_Tall 
	if (<SkaterCollision> = true)
		return
	endif
	Contact_TerrainEffects <...>
	<objID1> :Obj_GetVelocity
	NormalizeVector <vel>
	if (<length> > 7)
		<objID1> :Obj_GetPosition
		GetUniqueCompositeobjectID \{preferredID = PottedPlant_Dirt}
		CreateGlobalFlexParticleSystem Name = <uniqueID> Pos = <Pos> params_Script = $GP_Pot_Dust01
		if IsCreated <uniqueID>
			orient object = <uniqueID> relativeTo = <objID1> offset = (0.0, 0.7, 0.0)
		endif
		GetUniqueCompositeobjectID \{preferredID = PottedPlant_Dirt}
		CreateGlobalFlexParticleSystem Name = <uniqueID> Pos = <Pos> params_Script = $GP_Pot_Bits01
		GetUniqueCompositeobjectID \{preferredID = PottedPlant_Leaves}
		CreateGlobalFlexParticleSystem Name = <uniqueID> Pos = <Pos> params_Script = $GP_Leaves_Tall01
		if IsCreated <uniqueID>
			orient object = <uniqueID> relativeTo = <objID1> offset = (0.0, 2.0, 0.0)
		endif
		GetUniqueCompositeobjectID \{preferredID = ShortPottedPlantExplodeSound}
		if CreateCompositeObject Priority = COIM_Priority_Sound Heap = GameObj OldHeap = COM components = [{component = Sound}] params = {
				Name = <uniqueID>
				Pos = <Pos>
			}
			SoundEvent event = PottedPlant_Explode_SFX object = <uniqueID>
		endif
		Wait \{1
			Frame}
		Die
	endif
endscript

script Contact_TerrainEffects 
	if (<SkaterCollision> = true)
		return
	endif
	<objID1> :Obj_GetVelocity
	NormalizeVector <vel>
	if (<length> < 3)
		return
	endif
	terrain1 = (($Terrain_Types [<terrain1>]).checksum)
	terrain2 = (($Terrain_Types [<terrain2>]).checksum)
	GetTerrainTypeParam param = TreadActions terrain = <terrain2>
	begin
	if GetNextArrayElement (<TreadActions>.SkaterJumpLandParticleParms)
		GetUniqueCompositeobjectID \{preferredID = BounceTerrain01}
		if ((<element>.Type) = NewFlat)
			CreateGlobalFastParticleSystem Name = <uniqueID> params_Script = <element> Pos = <Pos>
		else
			CreateGlobalFlexParticleSystem Name = <uniqueID> params_Script = <element> Pos = <Pos>
		endif
	else
		break
	endif
	repeat
	switch <terrain1>
		case TERRAIN_METALCAR
		case TERRAIN_METAL
		case TERRAIN_METALPOLE
		case TERRAIN_METALTIN
		case TERRAIN_METALLOCKERS
		case TERRAIN_METALTHIN
		case TERRAIN_METALPIPELARGE
		case TERRAIN_MAILBOX
		case TERRAIN_METALGRATE
		switch <terrain2>
			case TERRAIN_DEFAULT
			case TERRAIN_ASPHALT
			case TERRAIN_ASPHALTROUGH
			case TERRAIN_ASPHALTSMOOTH
			case TERRAIN_ASPHALTSMOOTH_HF
			case TERRAIN_BRICK
			case TERRAIN_BRICK_1FT
			case TERRAIN_BRICK_2FT
			case TERRAIN_BRICK_4FT
			case TERRAIN_BRICK_6IN
			case TERRAIN_COBBLESTONE
			case TERRAIN_CONCSMOOTH
			case TERRAIN_CONCROUGH
			case TERRAIN_GOLDCOINS
			case TERRAIN_HIGHFRICTION
			case TERRAIN_MAILBOX
			case TERRAIN_METALCAR
			case TERRAIN_METAL
			case TERRAIN_METALGRATE
			case TERRAIN_METALLOCKERS
			case TERRAIN_METALPIPELARGE
			case TERRAIN_METALPOLE
			case TERRAIN_METALTHIN
			case TERRAIN_METALTIN
			case TERRAIN_SHINGLESTILE
			case TERRAIN_SIDEWALK_1FT
			case TERRAIN_SIDEWALK_2FT
			case TERRAIN_SIDEWALK_4FT
			case TERRAIN_SIDEWALK_4FT_HF
			case TERRAIN_SIDEWALK_8FT
			case TERRAIN_TILE_2FT
			case TERRAIN_TILE_4FT
			case TERRAIN_TILE_6IN
			GetUniqueCompositeobjectID \{preferredID = BouncySparks01}
			CreateGlobalFlexParticleSystem Name = <uniqueID> Pos = <Pos> params_Script = {$GP_Bouncy_Sparks01 Emit_Target = ((-1 * <norm>) + (0.0, 0.25, 0.0))}
		endswitch
	endswitch
endscript
