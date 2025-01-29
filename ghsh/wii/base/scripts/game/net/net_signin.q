NX_SignInComplete = 0
NX_SignedIn = 0

script StartNetworkPlatform 
endscript

script NetworkPlatformComplete 
	printf \{qs(0x2dc218ad)}
	Change \{NX_SignInComplete = 1}
	if GotParam \{SignedIn}
		Change \{NX_SignedIn = 1}
	endif
endscript
