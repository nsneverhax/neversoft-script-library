NX_SignInComplete = 0
NX_SignedIn = 0

script StartNetworkPlatform 
	if ISPS3
		Printf \{"--- StartNetworkPlatform ---"}
		if NOT CheckForSignIn
			DisplayNetplatformWarning
			begin
			if (1 = $NX_SignInComplete)
				Printf \{"--- Sign in is complete ---"}
				break
			endif
			Wait \{1
				Frame}
			repeat
			if (1 = $NX_SignedIn)
				Change \{NX_SignInComplete = 0}
				Change \{NX_SignedIn = 0}
				Printf \{"We are signed in"}
				return \{TRUE}
			else
				Change \{NX_SignInComplete = 0}
				Change \{NX_SignedIn = 0}
				Printf \{"We are not signed in"}
				return \{FALSE}
			endif
		endif
	endif
endscript

script NetworkPlatformComplete 
	Printf \{"NetworkPlatformComplete"}
	Change \{NX_SignInComplete = 1}
	if GotParam \{SignedIn}
		Change \{NX_SignedIn = 1}
	endif
endscript
