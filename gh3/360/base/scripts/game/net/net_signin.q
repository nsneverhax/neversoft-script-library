nx_signincomplete = 0
nx_signedin = 0

script startnetworkplatform 
	if isps3
		printf \{"--- StartNetworkPlatform ---"}
		if NOT checkforsignin
			displaynetplatformwarning
			begin
			if (1 = $nx_signincomplete)
				printf \{"--- Sign in is complete ---"}
				break
			endif
			wait \{1
				frame}
			repeat
			if (1 = $nx_signedin)
				change \{nx_signincomplete = 0}
				change \{nx_signedin = 0}
				printf \{"We are signed in"}
				return \{true}
			else
				change \{nx_signincomplete = 0}
				change \{nx_signedin = 0}
				printf \{"We are not signed in"}
				return \{false}
			endif
		endif
	endif
endscript

script networkplatformcomplete 
	printf \{"NetworkPlatformComplete"}
	change \{nx_signincomplete = 1}
	if gotparam \{signedin}
		change \{nx_signedin = 1}
	endif
endscript
