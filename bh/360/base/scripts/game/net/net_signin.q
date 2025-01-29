NX_SignInComplete = 0
NX_SignedIn = 0

script StartNetworkPlatform 
	if IsPS3
		printf \{qs(0x609f1ede)}
		if NOT CheckForSignIn
			DisplayNetplatformWarning
			begin
			if (1 = $NX_SignInComplete)
				printf \{qs(0xf308a87f)}
				break
			endif
			wait \{1
				frame}
			repeat
			if (1 = $NX_SignedIn)
				Change \{NX_SignInComplete = 0}
				Change \{NX_SignedIn = 0}
				printf \{qs(0xd19971dd)}
				return \{true}
			else
				Change \{NX_SignInComplete = 0}
				Change \{NX_SignedIn = 0}
				printf \{qs(0x087f09c7)}
				return \{false}
			endif
		endif
	endif
endscript

script NetworkPlatformComplete 
	printf \{qs(0x2dc218ad)}
	Change \{NX_SignInComplete = 1}
	if GotParam \{SignedIn}
		Change \{NX_SignedIn = 1}
	endif
endscript
