locked_playlists = [
	{
		Name = qs(0xf1d0a283)
		playlist = [
		]
	}
	{
		Name = qs(0x6f3f296a)
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
		Name = qs(0x537f1d06)
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
		Name = qs(0xdcb3254c)
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
		Name = qs(0x42806363)
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
		Name = qs(0x49df144d)
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
		Name = qs(0xf4bbf785)
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
		Name = qs(0xd074d466)
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
		Name = qs(0xf5d0c114)
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
		Name = qs(0xa8d755ff)
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
