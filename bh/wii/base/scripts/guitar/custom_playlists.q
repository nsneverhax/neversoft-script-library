locked_playlists = [
	{
		Name = qs(0xf1d0a283)
		playlist = [
		]
	}
	{
		Name = qs(0xa6c6381b)
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
		Name = qs(0x8439eb4e)
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
		Name = qs(0x1d50731a)
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
		Name = qs(0x3e8a16b2)
		playlist = [
		]
	}
	{
		Name = qs(0x3e8a16b2)
		playlist = [
		]
	}
	{
		Name = qs(0x3e8a16b2)
		playlist = [
		]
	}
	{
		Name = qs(0x3e8a16b2)
		playlist = [
		]
	}
	{
		Name = qs(0x3e8a16b2)
		playlist = [
		]
	}
	{
		Name = qs(0x3e8a16b2)
		playlist = [
		]
	}
	{
		Name = qs(0x3e8a16b2)
		playlist = [
		]
	}
	{
		Name = qs(0x3e8a16b2)
		playlist = [
		]
	}
	{
		Name = qs(0x3e8a16b2)
		playlist = [
		]
	}
	{
		Name = qs(0x3e8a16b2)
		playlist = [
		]
	}
]

script get_first_empty_custom_playlist_slot 
	GetArraySize \{$custom_playlists}
	<total_size> = <array_Size>
	<i> = 0
	begin
	GetArraySize ((($custom_playlists) [<i>]).playlist)
	if (<array_Size> = 0)
		return true slot = <i>
	endif
	<i> = (<i> + 1)
	repeat <total_size>
	return \{FALSE}
endscript

script is_playlist_slot_empty 
	RequireParams \{[
			playlists
			slot
		]
		all}
	ExtendCrc <playlists> '_playlists' out = my_playlists
	GetArraySize ($<my_playlists>)
	<total_size> = <array_Size>
	if NOT ((<slot> >= 0) && (<slot> < <total_size>))
		ScriptAssert \{qs(0xd5938ad4)}
	endif
	GetArraySize ((($<my_playlists>) [<slot>]).playlist)
	if (<array_Size> = 0)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script does_custom_playlist_exist 
	GetArraySize \{$custom_playlists}
	<total_size> = <array_Size>
	<i> = 0
	begin
	GetArraySize ((($custom_playlists) [<i>]).playlist)
	if (<array_Size> > 0)
		return \{true}
	endif
	<i> = (<i> + 1)
	repeat <total_size>
	return \{FALSE}
endscript

script num_custom_playlists_that_exist 
	GetArraySize \{$custom_playlists}
	<total_size> = <array_Size>
	<num_custom_playlists> = 0
	<i> = 0
	begin
	GetArraySize ((($custom_playlists) [<i>]).playlist)
	if (<array_Size> > 0)
		<num_custom_playlists> = (<num_custom_playlists> + 1)
	endif
	<i> = (<i> + 1)
	repeat <total_size>
	return num_custom_playlists = <num_custom_playlists>
endscript

script delete_custom_playlist_slot 
	RequireParams \{[
			slot
		]
		all}
	<playlist_entry> = {
		Name = qs(0x3e8a16b2)
		playlist = []
	}
	SetArrayElement ArrayName = custom_playlists index = <slot> NewValue = <playlist_entry> globalarray
endscript

script fill_auto_save_playlist 
	<locked_entry> = {
		Name = qs(0xf1d0a283)
		playlist = ($current_playlist)
	}
	SetArrayElement ArrayName = locked_playlists index = 0 NewValue = <locked_entry> globalarray
endscript

script validate_locked_playlists 
	GetArraySize ($locked_playlists)
	<total_locked> = <array_Size>
	RemoveParameter \{array_Size}
	if (<total_locked> > 0)
		<i> = 0
		begin
		<playlist_array> = ((($locked_playlists) [<i>]).playlist)
		<dummy_array> = []
		GetArraySize <playlist_array>
		if (<array_Size> > 0)
			<j> = 0
			begin
			if NOT ArrayContains array = <dummy_array> contains = (<playlist_array> [<j>])
				AddArrayElement array = <dummy_array> element = (<playlist_array> [<j>])
				<dummy_array> = <array>
			else
				<playlist_name> = ((($locked_playlists) [<i>]).Name)
				ScriptAssert qs(0x56036377) n = <playlist_name> i = <j>
			endif
			<j> = (<j> + 1)
			repeat <array_Size>
		endif
		<i> = (<i> + 1)
		repeat <total_locked>
	endif
	printf \{qs(0xb9cdada0)}
endscript
