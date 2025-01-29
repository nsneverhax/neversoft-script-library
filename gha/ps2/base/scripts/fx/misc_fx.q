jowBlue = 717488127
jowGreen = 771697407
jowOrange = -6149377
jowRed = -15061505
jowYellow = -3267073

script JOW_Stars 



endscript

script SafeGetUniqueCompositeObjectID \{preferredID = safeFXID01}
	if NOT GotParam \{objID}
		GetUniqueCompositeobjectID preferredID = <preferredID>
		return uniqueID = <uniqueID>
	endif
	i = 0
	formatText TextName = index '%i' i = <i>
	ExtendCrc <preferredID> <index> out = preferredID
	begin
	MangleChecksums a = <preferredID> b = <objID>
	if NOT ObjectExists id = <mangled_ID>
		return uniqueID = <preferredID>
	else
		i = (<i> + 1)
		formatText TextName = index '%i' i = <i>
		ExtendCrc <preferredID> <index> out = preferredID
	endif
	repeat
endscript

script losefx_guitarsmoke_01 
	Obj_GetID
	GetUniqueCompositeobjectID \{preferredID = fx_losesmoke_01}
	CreateParticleSystem Name = <uniqueID> objID = <objID> bone = bone_guitar_body params_Script = $gp_fx_losesmoke_01
endscript

script losefx_guitarsparks_01 
	Obj_GetID
	GetUniqueCompositeobjectID \{preferredID = fx_losesparks_01}
	CreateParticleSystem Name = <uniqueID> objID = <objID> bone = bone_guitar_body params_Script = $gp_fx_losesparks_01
endscript
