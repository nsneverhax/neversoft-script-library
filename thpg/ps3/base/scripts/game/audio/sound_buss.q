busstree = {
	master = {
		user_sfx = {
			sfx = {
				ingame = {
					skater = {
						SkateSounds = {
							balance = {
								leafnodes = [
									Grinding
									Sliding
								]
							}
							Lands = {
								leafnodes = [
									SkaterLands
									ONsOFFs
									PuddleLands
								]
							}
							leafnodes = [
								SkaterOllies
								Rolling
								ClickClacks
								Squeaks
								BoardPush
								TransitionSounds
								OlliesLands
								Reverts
								boneless
								BoardPickupPutdown
								pogo
								wallride
								VESkaterSounds
							]
						}
						Foley = {
							bails = {
								leafnodes = [
									BodyFalls
									Sweetners
									BailSlide
									LowEnd
									BoneBreaks
								]
							}
							BoardFoley = {
								leafnodes = [
									BoardMovement
									DropsBounces
									UpsDowns
									wheelspins
									FootJumpsLandsScuffs
								]
							}
							leafnodes = [
								Footsteps
								footsteplayer
								checking
							]
						}
						SkaterMisc = {
							leafnodes = [
								SkaterSpecialFX
								Foliage
								ExploLandFXSounds
							]
						}
					}
					ped = {
						PedFoley = {
							PedBails = {
								leafnodes = [
									PedSweetners
									PedBailSlide
									PedBodyFalls
									PedLowEnd
								]
							}
							PedBoardFoley = {
								leafnodes = [
									PedBoardMovement
									PedDropsBounces
									PedUpsDowns
									pedwheelspins
									PedFootJumpsLandsScuffs
								]
							}
							leafnodes = [
								PedFootsteps
								PedHits
								PedClaps
								PedFootstepLayer
							]
						}
						PedSkateSounds = {
							leafnodes = [
								PedOlliesLands
								PedRolling
								PedONsOFFs
								PedClickClacks
								PedSqueaks
								PedBoardPush
								PedTransitionSounds
								PedReverts
								PedBoneless
								PedBoardPickupPutdown
								PedPogo
								PedWallRide
								PedGrinding
								PedSliding
							]
						}
						leafnodes = [
							PedMisc
							crowd
						]
					}
					AreaSFX = {
						BGs = {
							leafnodes = [
								OneShots
							]
						}
						weather = {
							leafnodes = [
								rain
							]
						}
						leafnodes = [
							zonesfx
							Bouncy1
							vehicle
							Train
							AmbScenes
						]
					}
					DialogueInGame = {
						DialogueSkater = {
							leafnodes = [
								CAS_CAREER
								FocusBreaths
							]
						}
						DialoguePED = {
							leafnodes = [
								generic_male
							]
						}
						leafnodes = [
							IGCs
						]
					}
					LocalizedDialogue1 = {
						leafnodes = [
							GoalVO_WET
							PedCallouts_WET
							ProCallouts_WET
						]
					}
					leafnodes = [
						MissionSFX
						SpecialTricks
					]
				}
				ambience = {
					leafnodes = [
						Beds
					]
				}
				ui = {
					hud = {
						leafnodes = [
							GoalFeedback
							announcer
							TrickFeedback
							slomo
						]
					}
					GoalComplete = {
						leafnodes = [
							ClassicGoalHUD
							StoryGoalHUD
							GhettoJamHUD
							TurfWarHUD
							FilmerGoalHUD
							ProChallenge
							CompetitionHUD
						]
					}
					leafnodes = [
						frontend
						pausemenu
					]
				}
			}
			Dialogue = {
				DialogueUI = {
					leafnodes = [
						DialogueFrontEnd
						DialoguePauseMenu
						DialogueHUD
					]
				}
				LocalizedDialogue2 = {
					leafnodes = [
						GoalVO_DRY
						MS_Phonecalls
						PedCallouts_DRY
					]
				}
			}
			LinearPresentations = {
				leafnodes = [
					ProperCutScenes
					cutscenes
					binkcutscenes
				]
			}
			leafnodes = [
				`default`
				test_tones
			]
		}
		user_music = {
			MusicMisc = {
				leafnodes = [
					MusicInGame
					MusicHUDFrontEnd
				]
			}
			playlist = {
				leafnodes = [
					rock
					punk
					hiphop
					other
					electronic
					funk
					jazz
					metal
					reggae
					FreeMuzik
				]
			}
		}
	}
}
default_bussset = {
	master = {
		priority = 5
		vol = -4
		pitch = 0
		instance_rule = ignore
		max_instances = 64
	}
	sfx = {
		priority = 1
		vol = 0
		pitch = 0
		instance_rule = ignore
		max_instances = 500
	}
	ingame = {
		priority = 1
		vol = 0
		pitch = 0
		instance_rule = ignore
		max_instances = 500
	}
	skater = {
		priority = 1
		vol = 0
		pitch = 0
		instance_rule = ignore
		max_instances = 500
	}
	SkateSounds = {
		priority = 1
		vol = -6
		pitch = 0
	}
	balance = {
		priority = 1
		vol = 0
		pitch = 0
		instance_rule = furthest
		max_instances = 520
	}
	Grinding = {
		priority = 1
		vol = 3
		pitch = 0
		instance_rule = furthest
		max_instances = 520
	}
	Sliding = {
		priority = 1
		vol = 3
		pitch = 0
		instance_rule = oldest
		max_instances = 11
	}
	Lands = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Rolling = {
		priority = 1
		vol = 5
		pitch = 0
	}
	SkaterOllies = {
		priority = 1
		vol = 0
		pitch = 0
	}
	SkaterLands = {
		priority = 1
		vol = 4
		pitch = 0
	}
	PuddleLands = {
		priority = 1
		vol = 2
		pitch = 0
	}
	Foley = {
		priority = 1
		vol = -9
		pitch = 0
	}
	bails = {
		priority = 1
		vol = 5
		pitch = 0
	}
	BodyFalls = {
		priority = 1
		vol = 6
		pitch = 0
		instance_rule = ignore
		max_instances = 4
	}
	Sweetners = {
		priority = 1
		vol = 0
		pitch = 0
	}
	BoardFoley = {
		priority = 1
		vol = 0
		pitch = 0
	}
	BoardMovement = {
		priority = 1
		vol = 0
		pitch = 0
	}
	DropsBounces = {
		priority = 1
		vol = 0
		pitch = 0
	}
	UpsDowns = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Footsteps = {
		priority = 1
		vol = 6
		pitch = 0
	}
	SkaterMisc = {
		priority = 1
		vol = -12
		pitch = 0
	}
	SkaterSpecialFX = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Foliage = {
		priority = 1
		vol = 0
		pitch = 0
	}
	ped = {
		priority = 1
		vol = 0
		pitch = 0
		instance_rule = ignore
		max_instances = 16
	}
	PedFoley = {
		priority = 1
		vol = -7
		pitch = 0
	}
	PedBails = {
		priority = 1
		vol = 6
		pitch = 0
	}
	PedSweetners = {
		priority = 1
		vol = 0
		pitch = 0
	}
	PedBoardFoley = {
		priority = 1
		vol = 0
		pitch = 0
	}
	PedBoardMovement = {
		priority = 1
		vol = 0
		pitch = 0
	}
	PedDropsBounces = {
		priority = 1
		vol = 0
		pitch = 0
	}
	PedUpsDowns = {
		priority = 1
		vol = 0
		pitch = 0
	}
	PedFootsteps = {
		priority = 1
		vol = 0
		pitch = 0
	}
	PedBodyFalls = {
		priority = 1
		vol = -4
		pitch = 0
	}
	PedHits = {
		priority = 1
		vol = 0
		pitch = 0
	}
	PedClaps = {
		priority = 1
		vol = 0
		pitch = 0
	}
	PedSkateSounds = {
		priority = 1
		vol = -10
		pitch = 4
	}
	PedOlliesLands = {
		priority = 1
		vol = 0
		pitch = 0
	}
	PedRolling = {
		priority = 1
		vol = 10
		pitch = 0
	}
	PedONsOFFs = {
		priority = 1
		vol = -8
		pitch = 2
	}
	PedMisc = {
		priority = 1
		vol = -12
		pitch = 0
	}
	crowd = {
		priority = 1
		vol = -12
		pitch = 0
	}
	vehicle = {
		priority = 1
		vol = -11
		pitch = 0
	}
	Train = {
		priority = 1
		vol = -12
		pitch = 0
	}
	MissionSFX = {
		priority = 1
		vol = -12
		pitch = 0
	}
	AreaSFX = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Bouncy1 = {
		priority = 1
		vol = -1
		pitch = 0
	}
	BGs = {
		priority = 1
		vol = -12
		pitch = 0
	}
	weather = {
		priority = 1
		vol = -12
		pitch = 0
	}
	OneShots = {
		priority = 1
		vol = 6
		pitch = 0
		instance_rule = ignore
		max_instances = 1
	}
	rain = {
		priority = 1
		vol = -4
		pitch = 0
	}
	ambience = {
		priority = 1
		vol = 1
		pitch = 0
	}
	Beds = {
		priority = 1
		vol = 0
		pitch = 0
	}
	SpecialTricks = {
		priority = 1
		vol = -12
		pitch = 0
	}
	ui = {
		priority = 1
		vol = 0
		pitch = 0
	}
	hud = {
		priority = 1
		vol = -6
		pitch = 0
	}
	GoalFeedback = {
		priority = 1
		vol = 0
		pitch = 0
	}
	GoalComplete = {
		priority = 1
		vol = -12
		pitch = 0
	}
	ClassicGoalHUD = {
		priority = 1
		vol = 0
		pitch = 0
	}
	StoryGoalHUD = {
		priority = 1
		vol = 0
		pitch = 0
	}
	GhettoJamHUD = {
		priority = 1
		vol = 0
		pitch = 0
	}
	TurfWarHUD = {
		priority = 1
		vol = 0
		pitch = 0
	}
	FilmerGoalHUD = {
		priority = 1
		vol = 0
		pitch = 0
	}
	ProChallenge = {
		priority = 1
		vol = 0
		pitch = 0
	}
	CompetitionHUD = {
		priority = 1
		vol = 0
		pitch = 0
	}
	frontend = {
		priority = 1
		vol = -12
		pitch = 0
	}
	pausemenu = {
		priority = 1
		vol = -12
		pitch = 0
	}
	MusicMisc = {
		priority = 1
		vol = 0
		pitch = 0
	}
	MusicInGame = {
		priority = 1
		vol = -12
		pitch = 0
	}
	MusicHUDFrontEnd = {
		priority = 1
		vol = 0
		pitch = 0
	}
	playlist = {
		priority = 1
		vol = -10
		pitch = 0
	}
	rock = {
		priority = 1
		vol = 0
		pitch = 0
	}
	punk = {
		priority = 1
		vol = 0
		pitch = 0
	}
	hiphop = {
		priority = 1
		vol = 0
		pitch = 0
	}
	electronic = {
		priority = 1
		vol = 0
		pitch = 0
	}
	other = {
		priority = 1
		vol = 0
		pitch = 0
	}
	Dialogue = {
		priority = 1
		vol = 0
		pitch = 0
	}
	DialogueInGame = {
		priority = 1
		vol = 0
		pitch = 0
	}
	LocalizedDialogue1 = {
		priority = 1
		vol = 0
		pitch = 0
	}
	DialogueSkater = {
		priority = 1
		vol = -12
		pitch = 0
	}
	DialoguePED = {
		priority = 1
		vol = -12
		pitch = 0
	}
	IGCs = {
		priority = 1
		vol = 0
		pitch = 0
	}
	GoalVO_WET = {
		priority = 1
		vol = 0
		pitch = 0
	}
	announcer = {
		priority = 1
		vol = -6
		pitch = 0
		max_instances = 1
	}
	PedCallouts_WET = {
		priority = 1
		vol = -4
		pitch = 0
	}
	ProCallouts_WET = {
		priority = 1
		vol = 0
		pitch = 0
	}
	DialogueUI = {
		priority = 1
		vol = -12
		pitch = 0
	}
	LocalizedDialogue2 = {
		priority = 1
		vol = -12
		pitch = 0
	}
	DialogueFrontEnd = {
		priority = 1
		vol = 0
		pitch = 0
	}
	DialoguePauseMenu = {
		priority = 1
		vol = 0
		pitch = 0
	}
	DialogueHUD = {
		priority = 1
		vol = 0
		pitch = 0
	}
	GoalVO_DRY = {
		priority = 1
		vol = 0
		pitch = 0
	}
	PedCallouts_DRY = {
		priority = 1
		vol = 0
		pitch = 0
	}
	MS_Phonecalls = {
		priority = 1
		vol = 1
		pitch = 0
	}
	user_sfx = {
		priority = 1
		vol = 0
		pitch = 0
	}
	generic_male = {
		priority = 1
		vol = -6
		pitch = 0
	}
	user_music = {
		priority = 1
		vol = 0
		pitch = 0
	}
	`default` = {
		priority = 1
		vol = -12
		pitch = 0
	}
	test_tones = {
		priority = 1
		vol = 0
		pitch = 0
	}
	wheelspins = {
		priority = 1
		vol = -1
		pitch = 0
	}
	pedwheelspins = {
		priority = 1
		vol = -6
		pitch = 0
	}
	ClickClacks = {
		priority = 1
		vol = 3
		pitch = 0
		instance_rule = oldest
		max_instances = 10
	}
	PedClickClacks = {
		priority = 1
		vol = 0
		pitch = -5
	}
	Squeaks = {
		priority = 1
		vol = 0
		pitch = 0
	}
	PedSqueaks = {
		priority = 1
		vol = 0
		pitch = 0
	}
	footsteplayer = {
		priority = 1
		vol = 6
		pitch = 0
	}
	checking = {
		priority = 1
		vol = 0
		pitch = 0
	}
	PedFootstepLayer = {
		priority = 1
		vol = 0
		pitch = 0
	}
	BoardPush = {
		priority = 1
		vol = 4
		pitch = 0
	}
	PedBoardPush = {
		priority = 1
		vol = 0
		pitch = 0
	}
	TransitionSounds = {
		priority = 1
		vol = 0
		pitch = 0
	}
	PedTransitionSounds = {
		priority = 1
		vol = 0
		pitch = 0
	}
	PedBailSlide = {
		priority = 1
		vol = 6
		pitch = 0
	}
	PedBodyFalls = {
		priority = 1
		vol = -4
		pitch = 0
	}
	BailSlide = {
		priority = 1
		vol = -2
		pitch = 0
	}
	LowEnd = {
		priority = 1
		vol = 0
		pitch = 0
	}
	PedLowEnd = {
		priority = 1
		vol = 0
		pitch = 0
	}
	OlliesLands = {
		priority = 1
		vol = -10
		pitch = 0
	}
	ONsOFFs = {
		priority = 1
		vol = 3
		pitch = 2
	}
	Reverts = {
		priority = 1
		vol = 1
		pitch = 0
	}
	PedReverts = {
		priority = 1
		vol = 0
		pitch = 0
	}
	FootJumpsLandsScuffs = {
		priority = 1
		vol = 0
		pitch = 0
	}
	PedFootJumpsLandsScuffs = {
		priority = 1
		vol = 0
		pitch = 0
	}
	boneless = {
		priority = 1
		vol = 0
		pitch = 0
	}
	PedBoneless = {
		priority = 1
		vol = 0
		pitch = 0
	}
	BoardPickupPutdown = {
		priority = 1
		vol = 0
		pitch = 0
	}
	PedBoardPickupPutdown = {
		priority = 1
		vol = 0
		pitch = 0
	}
	pogo = {
		priority = 1
		vol = 0
		pitch = 0
	}
	PedPogo = {
		priority = 1
		vol = 0
		pitch = 0
	}
	wallride = {
		priority = 1
		vol = 3
		pitch = 0
	}
	VESkaterSounds = {
		priority = 1
		vol = 0
		pitch = 0
	}
	PedWallRide = {
		priority = 1
		vol = 0
		pitch = 0
	}
	funk = {
		priority = 1
		vol = 0
		pitch = 0
	}
	jazz = {
		priority = 1
		vol = 0
		pitch = 0
	}
	metal = {
		priority = 1
		vol = 0
		pitch = 0
	}
	FreeMuzik = {
		priority = 1
		vol = 0
		pitch = 0
	}
	reggae = {
		priority = 1
		vol = 0
		pitch = 0
	}
	CAS_CAREER = {
		priority = 1
		vol = -6
		pitch = 0
		instance_rule = ignore
		max_instances = 1
	}
	BoneBreaks = {
		priority = 1
		vol = 0
		pitch = 0
		instance_rule = ignore
		max_instances = 1
	}
	FocusBreaths = {
		priority = 1
		vol = -6
		pitch = 0
	}
	zonesfx = {
		priority = 1
		vol = -6
		pitch = 0
	}
	AmbScenes = {
		priority = 1
		vol = -6
		pitch = 0
	}
	TrickFeedback = {
		priority = 1
		vol = 0
		pitch = 0
	}
	slomo = {
		priority = 1
		vol = -2
		pitch = 0
	}
	ExploLandFXSounds = {
		priority = 1
		vol = 0
		pitch = 0
	}
	PedGrinding = {
		priority = 1
		vol = 0
		pitch = 0
	}
	PedSliding = {
		priority = 1
		vol = 0
		pitch = 0
	}
	LinearPresentations = {
		priority = 1
		vol = 0
		pitch = 0
	}
	ProperCutScenes = {
		priority = 1
		vol = 0
		pitch = 0
	}
	cutscenes = {
		priority = 1
		vol = 0
		pitch = 0
	}
	binkcutscenes = {
		priority = 1
		vol = 0
		pitch = 0
	}
}
Nail_The_Trick_Mode_BussSet = {
	ingame = {
		priority = 1
		vol = 0
		pitch = -10
		instance_rule = ignore
		max_instances = 500
	}
	SkateSounds = {
		priority = 1
		vol = 0
		pitch = 0
	}
	PuddleLands = {
		priority = 1
		vol = 11
		pitch = 0
	}
	TransitionSounds = {
		priority = 1
		vol = -9
		pitch = 10
	}
	Rolling = {
		priority = 1
		vol = 1
		pitch = 0
	}
	VESkaterSounds = {
		priority = 1
		vol = -100
		pitch = 0
	}
	ped = {
		priority = 1
		vol = -12
		pitch = 0
	}
	ambience = {
		priority = 1
		vol = -18
		pitch = -10
	}
	rain = {
		priority = 1
		vol = -8
		pitch = -7
	}
	playlist = {
		priority = 1
		vol = -38
		pitch = 0
	}
	LocalizedDialogue1 = {
		priority = 1
		vol = -2
		pitch = 10
	}
	DialogueInGame = {
		priority = 1
		vol = -2
		pitch = 10
	}
	announcer = {
		priority = 1
		vol = -9
		pitch = 0
		max_instances = 1
	}
	IGCs = {
		priority = 1
		vol = 0
		pitch = 5
	}
	binkcutscenes = {
		priority = 1
		vol = 0
		pitch = 0
	}
	vehicle = {
		priority = 1
		vol = -42
		pitch = 0
	}
	Train = {
		priority = 1
		vol = -42
		pitch = 0
	}
	AmbScenes = {
		priority = 1
		vol = -12
		pitch = 0
	}
}
Focus_Mode_BussSet = {
	ingame = {
		priority = 1
		vol = 0
		pitch = -10
		instance_rule = ignore
		max_instances = 500
	}
	SkateSounds = {
		priority = 1
		vol = 3
		pitch = 0
	}
	ped = {
		priority = 1
		vol = -12
		pitch = 0
	}
	ambience = {
		priority = 1
		vol = 0
		pitch = -10
	}
	playlist = {
		priority = 1
		vol = -38
		pitch = 0
	}
	LocalizedDialogue1 = {
		priority = 1
		vol = -4
		pitch = 10
	}
	LocalizedDialogue2 = {
		priority = 1
		vol = -16
		pitch = 0
	}
	DialogueInGame = {
		priority = 1
		vol = -4
		pitch = 10
	}
	announcer = {
		priority = 1
		vol = -9
		pitch = 10
		max_instances = 1
	}
	FocusBreaths = {
		priority = 1
		vol = -8
		pitch = -3
	}
	binkcutscenes = {
		priority = 1
		vol = 0
		pitch = 0
	}
	vehicle = {
		priority = 1
		vol = -42
		pitch = 0
	}
	Train = {
		priority = 1
		vol = -42
		pitch = 0
	}
	AmbScenes = {
		priority = 1
		vol = -12
		pitch = 0
	}
}
SkateCheck_SlowMo_BussSet = {
	ingame = {
		priority = 1
		vol = 0
		pitch = -10
		instance_rule = ignore
		max_instances = 500
	}
	ambience = {
		priority = 1
		vol = 0
		pitch = -10
	}
	SkateSounds = {
		priority = 1
		vol = 0
		pitch = -6
	}
	PedCallouts_WET = {
		priority = 1
		vol = -100
		pitch = 0
	}
	ProCallouts_WET = {
		priority = 1
		vol = -100
		pitch = 0
	}
	playlist = {
		priority = 1
		vol = -23
		pitch = 0
	}
	DialogueInGame = {
		priority = 1
		vol = 12
		pitch = -7
	}
	LocalizedDialogue1 = {
		priority = 1
		vol = 12
		pitch = -7
	}
}
Agro_Kick_Mode_BussSet = {
	skater = {
		priority = 1
		vol = 0
		pitch = 3
	}
	ped = {
		priority = 1
		vol = -6
		pitch = 0
	}
	Beds = {
		priority = 1
		vol = 6
		pitch = -6
	}
	OneShots = {
		priority = 1
		vol = -6
		pitch = 0
	}
	rain = {
		priority = 1
		vol = -14
		pitch = 0
	}
	zonesfx = {
		priority = 1
		vol = -12
		pitch = -3
	}
	AmbScenes = {
		priority = 1
		vol = -12
		pitch = 0
	}
	Bouncy1 = {
		priority = 1
		vol = -6
		pitch = 3
	}
	MissionSFX = {
		priority = 1
		vol = -9
		pitch = 0
	}
	binkcutscenes = {
		priority = 1
		vol = 0
		pitch = 0
	}
}
Goal_Presentation_Screen_BussSet = {
	playlist = {
		priority = 1
		vol = -25
		pitch = 0
	}
	PedCallouts_WET = {
		priority = 1
		vol = -100
		pitch = 0
	}
	ProCallouts_WET = {
		priority = 1
		vol = -100
		pitch = 0
	}
	binkcutscenes = {
		priority = 1
		vol = 0
		pitch = 0
	}
	AmbScenes = {
		priority = 1
		vol = -100
		pitch = 0
	}
}
Goal_ending_Screen_BussSet = {
	playlist = {
		priority = 1
		vol = -25
		pitch = 0
	}
	binkcutscenes = {
		priority = 1
		vol = 0
		pitch = 0
	}
	PedCallouts_WET = {
		priority = 1
		vol = -100
		pitch = 0
	}
	ProCallouts_WET = {
		priority = 1
		vol = -100
		pitch = 0
	}
	AmbScenes = {
		priority = 1
		vol = -100
		pitch = 0
	}
}
Generic_IGC_BussSet = {
	Beds = {
		priority = 1
		vol = -9
		pitch = 0
	}
	OneShots = {
		priority = 1
		vol = -9
		pitch = 0
	}
	rain = {
		priority = 1
		vol = -100
		pitch = 0
	}
	playlist = {
		priority = 1
		vol = -34
	}
	vehicle = {
		priority = 1
		vol = -20
		pitch = 0
	}
	Train = {
		priority = 1
		vol = -20
		pitch = 0
	}
	PedCallouts_WET = {
		priority = 1
		vol = -100
		pitch = 0
	}
	ProCallouts_WET = {
		priority = 1
		vol = -100
		pitch = 0
	}
	crowd = {
		priority = 1
		vol = -100
		pitch = 0
	}
	binkcutscenes = {
		priority = 1
		vol = 0
		pitch = 0
	}
	AmbScenes = {
		priority = 1
		vol = -100
		pitch = 0
	}
}
Goal_Presentation_BussSet = {
	Beds = {
		priority = 1
		vol = -9
		pitch = 0
	}
	PedCallouts_WET = {
		priority = 1
		vol = -100
		pitch = 0
	}
	ProCallouts_WET = {
		priority = 1
		vol = -100
		pitch = 0
	}
	GoalVO_DRY = {
		priority = 1
		vol = 2
		pitch = 0
	}
	GoalFeedback = {
		priority = 1
		vol = -4
		pitch = 0
	}
	PedClaps = {
		priority = 1
		vol = -4
		pitch = 0
	}
	OneShots = {
		priority = 1
		vol = -9
		pitch = 0
	}
	zonesfx = {
		priority = 1
		vol = -18
		pitch = 0
	}
	AmbScenes = {
		priority = 1
		vol = -100
		pitch = 0
	}
	rain = {
		priority = 1
		vol = -14
		pitch = 0
	}
	playlist = {
		priority = 1
		vol = -19
	}
	vehicle = {
		priority = 1
		vol = -24
		pitch = 0
	}
	Train = {
		priority = 1
		vol = -40
		pitch = 0
	}
	binkcutscenes = {
		priority = 1
		vol = 0
		pitch = 0
	}
	crowd = {
		priority = 1
		vol = -30
		pitch = 0
	}
}
Pause_Menu_BussSet = {
	playlist = {
		priority = 1
		vol = -24
		pitch = 0
	}
	Beds = {
		priority = 1
		vol = -12
		pitch = 0
	}
	OneShots = {
		priority = 1
		vol = -9
		pitch = 0
	}
	rain = {
		priority = 1
		vol = -20
		pitch = 0
	}
	DialogueInGame = {
		priority = 1
		vol = -24
		pitch = 0
	}
	LocalizedDialogue1 = {
		priority = 1
		vol = -24
		pitch = 0
	}
	GoalFeedback = {
		priority = 1
		vol = -100
		pitch = 0
	}
	DialogueUI = {
		priority = 1
		vol = -24
		pitch = 0
	}
	GoalVO_DRY = {
		priority = 1
		vol = -24
		pitch = 0
	}
	PedCallouts_DRY = {
		priority = 1
		vol = -24
		pitch = 0
	}
	PedCallouts_WET = {
		priority = 1
		vol = -100
		pitch = 0
	}
	ProCallouts_WET = {
		priority = 1
		vol = -100
		pitch = 0
	}
	TransitionSounds = {
		priority = 1
		vol = -100
		pitch = 0
	}
	binkcutscenes = {
		priority = 1
		vol = 0
		pitch = 0
	}
	AmbScenes = {
		priority = 1
		vol = -100
		pitch = 0
	}
}
no_music_at_all_bussset = {
	playlist = {
		priority = 1
		vol = -100
		pitch = 0
	}
	ambience = {
		priority = 1
		vol = -18
		pitch = 0
	}
	ingame = {
		priority = 1
		vol = -18
		pitch = 0
	}
	binkcutscenes = {
		priority = 1
		vol = 0
		pitch = 0
	}
	AmbScenes = {
		priority = 1
		vol = -100
		pitch = 0
	}
}
Cutscenes_No_Music_BussSet = {
	OneShots = {
		priority = 1
		vol = -100
		pitch = 0
	}
	Beds = {
		priority = 1
		vol = -100
		pitch = 0
	}
	rain = {
		priority = 1
		vol = -100
		pitch = 0
	}
	playlist = {
		priority = 1
		vol = -100
		pitch = 0
	}
	crowd = {
		priority = 1
		vol = -100
		pitch = 0
	}
	binkcutscenes = {
		priority = 1
		vol = 0
		pitch = 0
	}
	PedCallouts_WET = {
		priority = 1
		vol = -100
		pitch = 0
	}
	ProCallouts_WET = {
		priority = 1
		vol = -100
		pitch = 0
	}
	vehicle = {
		priority = 1
		vol = -40
		pitch = 0
	}
	Train = {
		priority = 1
		vol = -40
		pitch = 0
	}
	AmbScenes = {
		priority = 1
		vol = -100
		pitch = 0
	}
}
Loading_Bink_BussSet = {
	binkcutscenes = {
		priority = 1
		vol = -1
		pitch = 0
	}
	OneShots = {
		priority = 1
		vol = -100
		pitch = 0
	}
	ingame = {
		priority = 1
		vol = -100
		pitch = 0
	}
	Beds = {
		priority = 1
		vol = -100
		pitch = 0
	}
	rain = {
		priority = 1
		vol = -100
		pitch = 0
	}
	playlist = {
		priority = 1
		vol = -100
		pitch = 0
	}
	ped = {
		priority = 1
		vol = -100
		pitch = 0
	}
	binkcutscenes = {
		priority = 1
		vol = 0
		pitch = 0
	}
	vehicle = {
		priority = 1
		vol = -100
		pitch = 0
	}
	Train = {
		priority = 1
		vol = -100
		pitch = 0
	}
	AmbScenes = {
		priority = 1
		vol = -100
		pitch = 0
	}
}
Cell_Phone_FMV_BussSet = {
	playlist = {
		priority = 1
		vol = -100
		pitch = 0
	}
	ingame = {
		priority = 1
		vol = -100
		pitch = 0
	}
	vehicle = {
		priority = 1
		vol = -100
		pitch = 0
	}
	Train = {
		priority = 1
		vol = -100
		pitch = 0
	}
	ambience = {
		priority = 1
		vol = -100
		pitch = 0
	}
	binkcutscenes = {
		priority = 1
		vol = 0
		pitch = 0
	}
	PedCallouts_WET = {
		priority = 1
		vol = -100
		pitch = 0
	}
	ProCallouts_WET = {
		priority = 1
		vol = -100
		pitch = 0
	}
}
Mugging_Scenes_Music_Up_BussSet = {
	playlist = {
		priority = 1
		vol = -10
		pitch = 0
	}
	binkcutscenes = {
		priority = 1
		vol = 0
		pitch = 0
	}
}
Video_Editor_BussSet = {
	`default` = {
		priority = 1
		vol = -100
		pitch = 0
	}
	playlist = {
		priority = 1
		vol = -24
		pitch = 0
	}
	binkcutscenes = {
		priority = 1
		vol = 0
		pitch = 0
	}
	ambience = {
		priority = 1
		vol = -100
		pitch = 0
	}
	rain = {
		priority = 1
		vol = -100
		pitch = 0
	}
	AmbScenes = {
		priority = 1
		vol = -100
		pitch = 0
	}
}
Video_Editor_Playing_BussSet = {
	SkateSounds = {
		priority = 1
		vol = -9
		pitch = 0
	}
	ped = {
		priority = 1
		vol = -100
		pitch = 0
	}
	playlist = {
		priority = 1
		vol = -7
		pitch = 0
	}
	binkcutscenes = {
		priority = 1
		vol = 0
		pitch = 0
	}
	rain = {
		priority = 1
		vol = -14
		pitch = 0
	}
	AmbScenes = {
		priority = 1
		vol = -100
		pitch = 0
	}
}
Rage_1_BussSet = {
	ingame = {
		priority = 1
		vol = -1
		pitch = -1
	}
	TransitionSounds = {
		priority = 1
		vol = -9
		pitch = 0
	}
	ambience = {
		priority = 1
		vol = -6
		pitch = -1
	}
	rain = {
		priority = 1
		vol = -11
		pitch = -1
	}
}
Rage_2_BussSet = {
	ingame = {
		priority = 1
		vol = -1
		pitch = -2
	}
	ambience = {
		priority = 1
		vol = -7
		pitch = -2
	}
	rain = {
		priority = 1
		vol = -11
		pitch = -2
	}
	TransitionSounds = {
		priority = 1
		vol = -9
		pitch = 0
	}
}
Rage_3_BussSet = {
	ingame = {
		priority = 1
		vol = -1
		pitch = -3
	}
	ambience = {
		priority = 1
		vol = -7
		pitch = -3
	}
	rain = {
		priority = 1
		vol = -12
		pitch = -3
	}
	TransitionSounds = {
		priority = 1
		vol = -9
		pitch = 0
	}
}
Rage_4_BussSet = {
	ingame = {
		priority = 1
		vol = -2
		pitch = -4
	}
	ambience = {
		priority = 1
		vol = -8
		pitch = -3
	}
	rain = {
		priority = 1
		vol = -12
		pitch = -3
	}
	TransitionSounds = {
		priority = 1
		vol = -9
		pitch = 0
	}
}
Rage_5_BussSet = {
	ingame = {
		priority = 1
		vol = -2
		pitch = -5
	}
	ambience = {
		priority = 1
		vol = -8
		pitch = -4
	}
	rain = {
		priority = 1
		vol = -12
		pitch = -3
	}
	TransitionSounds = {
		priority = 1
		vol = -9
		pitch = 0
	}
}
Rage_6_BussSet = {
	ingame = {
		priority = 1
		vol = -2
		pitch = -6
	}
	ambience = {
		priority = 1
		vol = -9
		pitch = -4
	}
	rain = {
		priority = 1
		vol = -12
		pitch = -3
	}
	TransitionSounds = {
		priority = 1
		vol = -9
		pitch = 0
	}
}
Rage_7_BussSet = {
	ingame = {
		priority = 1
		vol = -3
		pitch = -7
	}
	ambience = {
		priority = 1
		vol = -9
		pitch = -5
	}
	rain = {
		priority = 1
		vol = -12
		pitch = -3
	}
	TransitionSounds = {
		priority = 1
		vol = -9
		pitch = 0
	}
}
Rage_8_BussSet = {
	ingame = {
		priority = 1
		vol = -3
		pitch = -8
	}
	ambience = {
		priority = 1
		vol = -10
		pitch = -5
	}
	rain = {
		priority = 1
		vol = -12
		pitch = -3
	}
	TransitionSounds = {
		priority = 1
		vol = -9
		pitch = 0
	}
}
Rage_9_BussSet = {
	ingame = {
		priority = 1
		vol = -3
		pitch = -9
	}
	ambience = {
		priority = 1
		vol = -10
		pitch = -6
	}
	rain = {
		priority = 1
		vol = -17
		pitch = -6
	}
	TransitionSounds = {
		priority = 1
		vol = -9
		pitch = 0
	}
}
Rage_10_BussSet = {
	ingame = {
		priority = 1
		vol = -3
		pitch = -10
	}
	ambience = {
		priority = 1
		vol = -11
		pitch = -6
	}
	rain = {
		priority = 1
		vol = -18
		pitch = -6
	}
	TransitionSounds = {
		priority = 1
		vol = -9
		pitch = 0
	}
}
Training_Binks_BussSet = {
	OneShots = {
		priority = 1
		vol = -6
		pitch = 0
	}
	Beds = {
		priority = 1
		vol = -12
		pitch = 0
	}
	rain = {
		priority = 1
		vol = -100
		pitch = 0
	}
	playlist = {
		priority = 1
		vol = -22
		pitch = 0
	}
	binkcutscenes = {
		priority = 1
		vol = 0
		pitch = 0
	}
	vehicle = {
		priority = 1
		vol = -100
		pitch = 0
	}
	Train = {
		priority = 1
		vol = -100
		pitch = 0
	}
	skater = {
		priority = 1
		vol = -100
		pitch = 0
	}
	ped = {
		priority = 1
		vol = -100
		pitch = 0
	}
	PedCallouts_WET = {
		priority = 1
		vol = -100
		pitch = 0
	}
	ProCallouts_WET = {
		priority = 1
		vol = -100
		pitch = 0
	}
}
