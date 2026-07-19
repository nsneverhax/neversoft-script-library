nx_signincomplete = 0
nx_signedin = 0

script startnetworkplatform 
	if isps3
		printf \{qs(0x609f1ede)}
		if NOT checkforsignin
			displaynetplatformwarning
			begin
			if (1 = $nx_signincomplete)
				printf \{qs(0xf308a87f)}
				break
			endif
			wait \{1
				frame}
			repeat
			if (1 = $nx_signedin)
				change \{nx_signincomplete = 0}
				change \{nx_signedin = 0}
				printf \{qs(0xd19971dd)}
				return \{true}
			else
				change \{nx_signincomplete = 0}
				change \{nx_signedin = 0}
				printf \{qs(0x087f09c7)}
				return \{false}
			endif
		endif
	endif
endscript

script networkplatformcomplete 
	printf \{qs(0x2dc218ad)}
	change \{nx_signincomplete = 1}
	if gotparam \{signedin}
		change \{nx_signedin = 1}
	endif
endscript
