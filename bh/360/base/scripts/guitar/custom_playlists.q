locked_playlists = [
	{
		name = qs(0xf1d0a283)
		playlist = [
		]
	}
	{
		name = qs(0xa6c6381b)
		playlist = [
			BadReputation
			BlackCat
			BlackHorseCherryTree
			BringMeToLife
			DontSpeak
			Fascination
			JustaGirl
			LesArtistes
			LikeWhoa
			LoveIsABattlefield
			LoveStory
			OurLipsAreSealed
			PictureToBurn
			PutYourRecordsOn
			SoYesterday
			TakeWhatYouTake
			TurnOffTheLights
			WalkingOnSunshine
			Wannabe
			WarwickAve
			YouBelongWithMe
			YouHadMe
		]
	}
	{
		name = qs(0x8439eb4e)
		playlist = [
			AMillionWays
			ABC
			TheAdventure
			AmericanPie
			AngelsOfTheSilences
			BackAgain
			BeautifulSoul
			Believe
			DirtyLittleSecret
			DoYouReally
			EveryRoseHasItsThorn
			Gasoline
			HandsDown
			HangMeUpToDry
			HappyTogether
			HonkeyTonkWomen
			IHeardItThrough
			IWantYouToWantMe
			IfYouCouldOnlySee
			TheImpressionThatIGet
			InABigCountry
			Kids
			KungFuFighting
			LetsDance
			Lifeline
			LipsOfAnAngel
			MrRoboto
			Naive
			OceanAve
			PrettyWoman
			Paralyzer
			PicturesOfYou
			Rio
			Rockstar
			SantaMonica
			SheWillBeLoved
			StealMyKisses
			SugarWereGoingDown
			TakeAPicture
			TakeBackTheCity
			WhenImGone
			WhipIt
			YMCA
		]
	}
	{
		name = qs(0x1d50731a)
		playlist = [
			AMillionWays
			ABC
			TheAdventure
			AmericanPie
			AngelsOfTheSilences
			BackAgain
			BadReputation
			BeautifulSoul
			Believe
			BlackCat
			BlackHorseCherryTree
			BringMeToLife
			DirtyLittleSecret
			DoYouReally
			DontSpeak
			EveryRoseHasItsThorn
			Fascination
			Gasoline
			HandsDown
			HangMeUpToDry
			HappyTogether
			HonkeyTonkWomen
			IHeardItThrough
			IWantYouToWantMe
			IfYouCouldOnlySee
			TheImpressionThatIGet
			InABigCountry
			JustaGirl
			Kids
			KungFuFighting
			LesArtistes
			LetsDance
			Lifeline
			LikeWhoa
			LipsOfAnAngel
			LoveIsABattlefield
			LoveStory
			MrRoboto
			Naive
			OceanAve
			PrettyWoman
			OurLipsAreSealed
			Paralyzer
			PictureToBurn
			PicturesOfYou
			PutYourRecordsOn
			Rio
			Rockstar
			SantaMonica
			SheWillBeLoved
			SoYesterday
			StealMyKisses
			SugarWereGoingDown
			TakeAPicture
			TakeBackTheCity
			TakeWhatYouTake
			TurnOffTheLights
			WalkingOnSunshine
			Wannabe
			WarwickAve
			WhenImGone
			WhipIt
			YMCA
			YouBelongWithMe
			YouHadMe
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
	GetArraySize \{$custom_playlists}
	<total_size> = <array_size>
	<i> = 0
	begin
	GetArraySize ((($custom_playlists) [<i>]).playlist)
	if (<array_size> = 0)
		return true Slot = <i>
	endif
	<i> = (<i> + 1)
	repeat <total_size>
	return \{false}
endscript

script is_playlist_slot_empty 
	RequireParams \{[
			playlists
			Slot
		]
		all}
	ExtendCrc <playlists> '_playlists' out = my_playlists
	GetArraySize ($<my_playlists>)
	<total_size> = <array_size>
	if NOT ((<Slot> >= 0) && (<Slot> < <total_size>))
		ScriptAssert \{qs(0xd5938ad4)}
	endif
	GetArraySize ((($<my_playlists>) [<Slot>]).playlist)
	if (<array_size> = 0)
		return \{true}
	else
		return \{false}
	endif
endscript

script does_custom_playlist_exist 
	GetArraySize \{$custom_playlists}
	<total_size> = <array_size>
	<i> = 0
	begin
	GetArraySize ((($custom_playlists) [<i>]).playlist)
	if (<array_size> > 0)
		return \{true}
	endif
	<i> = (<i> + 1)
	repeat <total_size>
	return \{false}
endscript

script num_custom_playlists_that_exist 
	GetArraySize \{$custom_playlists}
	<total_size> = <array_size>
	<num_custom_playlists> = 0
	<i> = 0
	begin
	GetArraySize ((($custom_playlists) [<i>]).playlist)
	if (<array_size> > 0)
		<num_custom_playlists> = (<num_custom_playlists> + 1)
	endif
	<i> = (<i> + 1)
	repeat <total_size>
	return num_custom_playlists = <num_custom_playlists>
endscript

script delete_custom_playlist_slot 
	RequireParams \{[
			Slot
		]
		all}
	<playlist_entry> = {
		name = qs(0x3e8a16b2)
		playlist = []
	}
	SetArrayElement arrayName = custom_playlists index = <Slot> newValue = <playlist_entry> GlobalArray
endscript

script fill_auto_save_playlist 
	<locked_entry> = {
		name = qs(0xf1d0a283)
		playlist = ($current_playlist)
	}
	SetArrayElement arrayName = locked_playlists index = 0 newValue = <locked_entry> GlobalArray
endscript

script validate_locked_playlists 
	GetArraySize ($locked_playlists)
	<total_locked> = <array_size>
	RemoveParameter \{array_size}
	if (<total_locked> > 0)
		<i> = 0
		begin
		<playlist_array> = ((($locked_playlists) [<i>]).playlist)
		<dummy_array> = []
		GetArraySize <playlist_array>
		if (<array_size> > 0)
			<j> = 0
			begin
			if NOT ArrayContains array = <dummy_array> contains = (<playlist_array> [<j>])
				AddArrayElement array = <dummy_array> element = (<playlist_array> [<j>])
				<dummy_array> = <array>
			else
				<playlist_name> = ((($locked_playlists) [<i>]).name)
				ScriptAssert qs(0x56036377) n = <playlist_name> i = <j>
			endif
			<j> = (<j> + 1)
			repeat <array_size>
		endif
		<i> = (<i> + 1)
		repeat <total_locked>
	endif
	printf \{qs(0xb9cdada0)}
endscript
