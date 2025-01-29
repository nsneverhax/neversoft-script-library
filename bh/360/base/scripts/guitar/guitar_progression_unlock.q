new_unlockables = [
]
Unlock_Atoms = [
]
song_unlock_new_profile = [
	ABC
	TheAdventure
	AmericanPie
	AMillionWays
	AngelsOfTheSilences
	BadReputation
	BeautifulSoul
	Believe
	BlackCat
	BlackHorseCherryTree
	BringMeToLife
	DoYouReally
	Fascination
	Gasoline
	HandsDown
	HangMeUpToDry
	HappyTogether
	IfYouCouldOnlySee
	IHeardItThrough
	TheImpressionThatIGet
	InABigCountry
	LesArtistes
	LetsDance
	Lifeline
	LikeWhoa
	LipsOfAnAngel
	Naive
	OceanAve
	OurLipsAreSealed
	Paralyzer
	PicturesOfYou
	PrettyWoman
	Rockstar
	SantaMonica
	SheWillBeLoved
	StealMyKisses
	SugarWereGoingDown
	TakeAPicture
	TakeBackTheCity
	TakeWhatYouTake
	TurnOffTheLights
	WhenImGone
	WhipIt
]

script progression_get_new_unlocks 
	return {new_unlocks = ($new_unlockables)}
endscript

script progression_reset_new_unlocks 
	Change \{new_unlockables = [
		]}
endscript

script progression_check_for_5_stars \{part = 'guitar'}
	return \{false}
endscript

script progression_check_for_song_5_stars 
	return \{false}
endscript
