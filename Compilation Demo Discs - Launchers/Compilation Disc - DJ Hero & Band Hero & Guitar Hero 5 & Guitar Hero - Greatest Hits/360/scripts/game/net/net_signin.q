NX_SignInComplete = 0
NX_SignedIn = 0

script StartNetworkPlatform 
	if IsPs3
		printf \{qs("\L--- StartNetworkPlatform ---")}
		if NOT CheckForSignIn
			DisplayNetplatformWarning
			begin
			if (1 = $NX_SignInComplete)
				printf \{qs("\L--- Sign in is complete ---")}
				break
			endif
			Wait \{1
				frame}
			repeat
			if (1 = $NX_SignedIn)
				change \{NX_SignInComplete = 0}
				change \{NX_SignedIn = 0}
				printf \{qs("\LWe are signed in")}
				return \{true}
			else
				change \{NX_SignInComplete = 0}
				change \{NX_SignedIn = 0}
				printf \{qs("\LWe are not signed in")}
				return \{false}
			endif
		endif
	endif
endscript

script NetworkPlatformComplete 
	printf \{qs("\LNetworkPlatformComplete")}
	change \{NX_SignInComplete = 1}
	if GotParam \{SignedIn}
		change \{NX_SignedIn = 1}
	endif
endscript
