locked_playlists = [
	{
		name = qs(0xf1d0a283)
		playlist = [
		]
	}
	{
		name = qs(0xa6c6381b)
		playlist = [
			0xe443019e
			0xd4079a1b
			0x301df215
			0xabd82191
			dontspeak
			0xe6c0e0dc
			justagirl
			0xa885319e
			0x58aabfeb
			0x878dc3db
			lovestory
			0x685e6b17
			picturetoburn
			0x3c78e175
			0xd0691b84
			0x3dc7acbb
			0x12330cfe
			0xcba77008
			0x56096622
			0x94a42d7a
			youbelongwithme
			0x875e4578
		]
	}
	{
		name = qs(0x8439eb4e)
		playlist = [
			0xf5fe8ca8
			0xcadbbe3d
			0x0633a1f3
			0xeb495d4b
			0xc0fd7289
			0xfacce756
			0x0e02bf53
			0x36ce830d
			0x55397d2a
			0x8afcd7a7
			0x222f6a10
			0x0bb63a7c
			0x2929c704
			hangmeuptodry
			0x563874d4
			0x3ede7cc8
			0x826f0248
			0x3504550d
			0x5749b512
			0xb494ce29
			0x1837c32d
			0xbd072e6b
			0xabd1e5b9
			0x7052b61b
			0x7c98e3c4
			0xd6b99fe2
			0xb3b66b06
			0x9ffeeaa0
			0x03726e6d
			prettywoman
			0xf8598272
			0x556ca3a6
			0x3ef936f4
			0x814b34d7
			0x1b75728f
			shewillbeloved
			0x4fbc9810
			0xf22a5fa8
			0x9a39c15d
			0x93aa4e4c
			0xc15cce84
			0x00d0eabb
			0xfce6fe2c
		]
	}
	{
		name = qs(0x1d50731a)
		playlist = [
			0xf5fe8ca8
			0xcadbbe3d
			0x0633a1f3
			0xeb495d4b
			0xc0fd7289
			0xfacce756
			0xe443019e
			0x0e02bf53
			0x36ce830d
			0xd4079a1b
			0x301df215
			0xabd82191
			0x55397d2a
			0x8afcd7a7
			dontspeak
			0x222f6a10
			0xe6c0e0dc
			0x0bb63a7c
			0x2929c704
			hangmeuptodry
			0x563874d4
			0x3ede7cc8
			0x826f0248
			0x3504550d
			0x5749b512
			0xb494ce29
			0x1837c32d
			justagirl
			0xbd072e6b
			0xabd1e5b9
			0xa885319e
			0x7052b61b
			0x7c98e3c4
			0x58aabfeb
			0xd6b99fe2
			0x878dc3db
			lovestory
			0xb3b66b06
			0x9ffeeaa0
			0x03726e6d
			prettywoman
			0x685e6b17
			0xf8598272
			picturetoburn
			0x556ca3a6
			0x3c78e175
			0x3ef936f4
			0x814b34d7
			0x1b75728f
			shewillbeloved
			0xd0691b84
			0x4fbc9810
			0xf22a5fa8
			0x9a39c15d
			0x93aa4e4c
			0x3dc7acbb
			0x12330cfe
			0xcba77008
			0x56096622
			0x94a42d7a
			0xc15cce84
			0x00d0eabb
			0xfce6fe2c
			youbelongwithme
			0x875e4578
		]
	}
]
custom_playlists = [
	{
		name = qs(0x3e8a16b2)
		playlist = [
		]
	}
	{
		name = qs(0x3e8a16b2)
		playlist = [
		]
	}
	{
		name = qs(0x3e8a16b2)
		playlist = [
		]
	}
	{
		name = qs(0x3e8a16b2)
		playlist = [
		]
	}
	{
		name = qs(0x3e8a16b2)
		playlist = [
		]
	}
	{
		name = qs(0x3e8a16b2)
		playlist = [
		]
	}
	{
		name = qs(0x3e8a16b2)
		playlist = [
		]
	}
	{
		name = qs(0x3e8a16b2)
		playlist = [
		]
	}
	{
		name = qs(0x3e8a16b2)
		playlist = [
		]
	}
	{
		name = qs(0x3e8a16b2)
		playlist = [
		]
	}
]

script get_first_empty_custom_playlist_slot 
	getarraysize \{$custom_playlists}
	<total_size> = <array_size>
	<i> = 0
	begin
	getarraysize ((($custom_playlists) [<i>]).playlist)
	if (<array_size> = 0)
		return true slot = <i>
	endif
	<i> = (<i> + 1)
	repeat <total_size>
	return \{false}
endscript

script is_playlist_slot_empty 
	requireparams \{[
			playlists
			slot
		]
		all}
	extendcrc <playlists> '_playlists' out = my_playlists
	getarraysize ($<my_playlists>)
	<total_size> = <array_size>
	if NOT ((<slot> >= 0) && (<slot> < <total_size>))
		scriptassert \{qs(0xd5938ad4)}
	endif
	getarraysize ((($<my_playlists>) [<slot>]).playlist)
	if (<array_size> = 0)
		return \{true}
	else
		return \{false}
	endif
endscript

script does_custom_playlist_exist 
	getarraysize \{$custom_playlists}
	<total_size> = <array_size>
	<i> = 0
	begin
	getarraysize ((($custom_playlists) [<i>]).playlist)
	if (<array_size> > 0)
		return \{true}
	endif
	<i> = (<i> + 1)
	repeat <total_size>
	return \{false}
endscript

script num_custom_playlists_that_exist 
	getarraysize \{$custom_playlists}
	<total_size> = <array_size>
	<num_custom_playlists> = 0
	<i> = 0
	begin
	getarraysize ((($custom_playlists) [<i>]).playlist)
	if (<array_size> > 0)
		<num_custom_playlists> = (<num_custom_playlists> + 1)
	endif
	<i> = (<i> + 1)
	repeat <total_size>
	return num_custom_playlists = <num_custom_playlists>
endscript

script delete_custom_playlist_slot 
	requireparams \{[
			slot
		]
		all}
	<playlist_entry> = {
		name = qs(0x3e8a16b2)
		playlist = []
	}
	setarrayelement arrayname = custom_playlists index = <slot> newvalue = <playlist_entry> globalarray
endscript

script fill_auto_save_playlist 
	<locked_entry> = {
		name = qs(0xf1d0a283)
		playlist = ($current_playlist)
	}
	setarrayelement arrayname = locked_playlists index = 0 newvalue = <locked_entry> globalarray
endscript

script validate_locked_playlists 
	getarraysize ($locked_playlists)
	<total_locked> = <array_size>
	removeparameter \{array_size}
	if (<total_locked> > 0)
		<i> = 0
		begin
		<playlist_array> = ((($locked_playlists) [<i>]).playlist)
		<dummy_array> = []
		getarraysize <playlist_array>
		if (<array_size> > 0)
			<j> = 0
			begin
			if NOT arraycontains array = <dummy_array> contains = (<playlist_array> [<j>])
				addarrayelement array = <dummy_array> element = (<playlist_array> [<j>])
				<dummy_array> = <array>
			else
				<playlist_name> = ((($locked_playlists) [<i>]).name)
				scriptassert qs(0x56036377) n = <playlist_name> i = <j>
			endif
			<j> = (<j> + 1)
			repeat <array_size>
		endif
		<i> = (<i> + 1)
		repeat <total_locked>
	endif
	printf \{qs(0xb9cdada0)}
endscript
