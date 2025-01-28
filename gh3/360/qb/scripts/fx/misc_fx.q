jowblue = 717488127
jowgreen = 771697407
joworange = -6149377
jowred = -15061505
jowyellow = -3267073

script jow_stars 
	printf \{"*******************************************************************"}
	printf <...>
	printf \{"*******************************************************************"}
endscript

script safegetuniquecompositeobjectid \{preferredid = safefxid01}
	if NOT gotparam \{objid}
		getuniquecompositeobjectid preferredid = <preferredid>
		return uniqueid = <uniqueid>
	endif
	i = 0
	formattext textname = index '%i' i = <i>
	extendcrc <preferredid> <index> out = preferredid
	begin
	manglechecksums a = <preferredid> b = <objid>
	if NOT objectexists id = <mangled_id>
		return uniqueid = <preferredid>
	else
		i = (<i> + 1)
		formattext textname = index '%i' i = <i>
		extendcrc <preferredid> <index> out = preferredid
	endif
	repeat
endscript
