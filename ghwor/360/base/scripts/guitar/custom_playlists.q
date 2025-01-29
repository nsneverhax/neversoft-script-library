locked_playlists = [
	{
		Name = qs(0xf1d0a283)
		playlist = [
		]
	}
	{
		Name = qs(0x9a8d617c)
		suppress_unavailable_songs_warning = 1
		playlist = [
			rush2112p1
			rush2112p2
			rush2112p3
			rush2112p4
			rush2112p5
			rush2112p6
			rush2112p7
			again
			aqualung
			batcountry
			beencaughtstealing
			blackrain
			blackwidow
			bleeditout
			bloodlines
			bodies
			bohemianrhapsody
			Burn
			burninforyou
			callmethebreeze
			calling
			chemicalwarfare
			cherrybomb
			childrenofthegrave
			cryin
			dancedance
			dancingthroughsunday
			deadfall
			fascinationstreet
			feelgooddrag
			feelslikethefirsttime
			fortunateson
			freeride
			furyofthestorm
			getfree
			Ghost
			graduate
			hardtosee
			holywars
			howyouremindme
			iknowwhatiam
			imbroken
			imnotok
			prepareforwar
			indians
			interstatelovesong
			itsonlyanotherparsec
			jetcitywoman
			lasso
			listentoherheart
			losingmyreligion
			lovegun
			lunaticfringe
			machinehead
			moderndaycowboy
			moneyfornothing
			motivation
			moveitonover
			nemesis
			nomoremrniceguy
			nowayback
			theoutsider
			paranoid
			poursomesugaronme
			psychosocial
			ravenous
			reignition
			renegade
			rockininthefreeworld
			savior
			scumbagblues
			selfesteemgh6
			settingfire
			sevennationarmy
			sharpdressedman
			slowhands
			speeding
			straycatblues
			suddendeath
			suffocate
			spiderman
			nosecretsthisyear
			thisdaywefight
			ticktickboom
			tiesthatbind
			tonesofhome
			unskinnybop
			uprising
			waidmannsheil
			werenotgonnatakeit
			whatdoiget
			wish
			rockinamerica
		]
	}
	{
		Name = qs(0x7b3448af)
		suppress_unavailable_songs_warning = 1
		playlist = [
			whatdoiget
			werenotgonnatakeit
			cherrybomb
			selfesteemgh6
			motivation
			reignition
			blackrain
			spiderman
		]
	}
	{
		Name = qs(0xf75ecc3f)
		suppress_unavailable_songs_warning = 1
		playlist = [
			bleeditout
			ticktickboom
			getfree
			machinehead
			iknowwhatiam
			again
			lasso
			slowhands
			wish
			uprising
		]
	}
	{
		Name = qs(0x0b79e36d)
		suppress_unavailable_songs_warning = 1
		playlist = [
			bohemianrhapsody
			sevennationarmy
			fascinationstreet
			losingmyreligion
			tonesofhome
			nowayback
			graduate
			interstatelovesong
			howyouremindme
			beencaughtstealing
		]
	}
	{
		Name = qs(0x624dd095)
		suppress_unavailable_songs_warning = 1
		playlist = [
			lunaticfringe
			fortunateson
			listentoherheart
			straycatblues
			burninforyou
			freeride
			cryin
			moneyfornothing
			rockininthefreeworld
			childrenofthegrave
		]
	}
	{
		Name = qs(0x844907a0)
		suppress_unavailable_songs_warning = 1
		playlist = [
			suffocate
			imnotok
			nosecretsthisyear
			dancedance
			itsonlyanotherparsec
			feelgooddrag
			theoutsider
			savior
			bodies
		]
	}
	{
		Name = qs(0xbca074ea)
		suppress_unavailable_songs_warning = 1
		playlist = [
			waidmannsheil
			imbroken
			dancingthroughsunday
			hardtosee
			bloodlines
			ravenous
			psychosocial
			tiesthatbind
			calling
			paranoid
		]
	}
	{
		Name = qs(0x50588d99)
		suppress_unavailable_songs_warning = 1
		playlist = [
			lovegun
			nomoremrniceguy
			sharpdressedman
			scumbagblues
			feelslikethefirsttime
			aqualung
			moveitonover
			callmethebreeze
			renegade
		]
	}
	{
		Name = qs(0xfff3c9f1)
		suppress_unavailable_songs_warning = 1
		playlist = [
			poursomesugaronme
			jetcitywoman
			Ghost
			unskinnybop
			moderndaycowboy
			rockinamerica
			Burn
			indians
			batcountry
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
