locked_playlists = [
	{
		name = qs(0xf1d0a283)
		playlist = [
		]
	}
	{
		name = qs(0x9a8d617c)
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
			burn
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
			ghost
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
		name = qs(0x7b3448af)
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
		name = qs(0xf75ecc3f)
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
		name = qs(0x0b79e36d)
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
		name = qs(0x624dd095)
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
		name = qs(0x844907a0)
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
		name = qs(0xbca074ea)
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
		name = qs(0x50588d99)
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
		name = qs(0xfff3c9f1)
		suppress_unavailable_songs_warning = 1
		playlist = [
			poursomesugaronme
			jetcitywoman
			ghost
			unskinnybop
			moderndaycowboy
			rockinamerica
			burn
			indians
			batcountry
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
