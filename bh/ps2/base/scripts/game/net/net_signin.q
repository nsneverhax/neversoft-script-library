NX_SignInComplete = 0
NX_SignedIn = 0

script StartNetworkPlatform 
endscript

script NetworkPlatformComplete 

	Change \{NX_SignInComplete = 1}
	if GotParam \{SignedIn}
		Change \{NX_SignedIn = 1}
	endif
endscript
