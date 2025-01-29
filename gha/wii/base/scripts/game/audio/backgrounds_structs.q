Skate8_SFX_Background_Areas_And_States = {
	FrontEnd = {
		Default = Silence_Front_End_Crowd_Loop
		Volume_Params = {
			Silence_Front_End_Crowd_Loop = 10
		}
		Fade_From = {
		}
	}
	Crowd_Stadium_Good = {
		Default = Heavy_Crowd_Loop_Good_02
		Volume_Params = {
			Heavy_Crowd_Loop_Good_02 = 40
		}
		Fade_From = {
		}
	}
	Crowd_Stadium_Nuetral = {
		Default = Heavy_Crowd_Loop_Nuetral_02
		Volume_Params = {
			Heavy_Crowd_Loop_Nuetral_02 = 160
		}
		Fade_From = {
		}
	}
	Crowd_Stadium_Bad = {
		Default = Heavy_Crowd_Loop_Bad_01
		Volume_Params = {
			Heavy_Crowd_Loop_Bad_01 = 135
		}
		Fade_From = {
		}
	}
	Crowd_Medium_Good1 = {
		Default = Medium_Crowd_Loop_Good_02
		Volume_Params = {
			Medium_Crowd_Loop_Good_02 = 70
		}
		Fade_From = {
		}
	}
	Crowd_Medium_Neutral = {
		Default = Medium_Crowd_Loop_Neutral_01
		Volume_Params = {
			Medium_Crowd_Loop_Neutral_01 = 100
		}
		Fade_From = {
		}
	}
	Crowd_Medium_Bad = {
		Default = Medium_Crowd_Loop_Bad_01
		Volume_Params = {
			Medium_Crowd_Loop_Bad_01 = 140
		}
		Fade_From = {
		}
	}
	Crowd_Small_Bad = {
		Default = Small_Crowd_Loop_Bad
		Volume_Params = {
			Small_Crowd_Loop_Bad = 60
		}
		Fade_From = {
		}
	}
	Crowd_Small_Good = {
		Default = Small_Crowd_Loop_Good
		Volume_Params = {
			Small_Crowd_Loop_Good = 88
		}
		Fade_From = {
		}
	}
	Crowd_Small_Neutral = {
		Default = Small_Crowd_Loop_Neutral
		Volume_Params = {
			Small_Crowd_Loop_Neutral = 16
		}
		Fade_From = {
		}
	}
	crowd_nipmuc_bad = {
		Default = nipmuc_crowd_loop_bad
		Volume_Params = {
			nipmuc_crowd_loop_bad = 120
		}
		Fade_From = {
		}
	}
	crowd_nipmuc_good = {
		Default = nipmuc_crowd_loop_good
		Volume_Params = {
			nipmuc_crowd_loop_good = 140
		}
		Fade_From = {
		}
	}
	crowd_nipmuc_neutral = {
		Default = nipmuc_crowd_loop_neutral
		Volume_Params = {
			nipmuc_crowd_loop_neutral = 60
		}
		Fade_From = {
		}
	}
	Crowd_Hell_Bad = {
		Default = Hell_Crowd_Loop_Bad
		Volume_Params = {
			Hell_Crowd_Loop_Bad = 250
		}
		Fade_From = {
		}
	}
	Crowd_Hell_Neutral = {
		Default = Hell_Crowd_Loop_Neutral
		Volume_Params = {
			Hell_Crowd_Loop_Neutral = 150
		}
		Fade_From = {
		}
	}
	Crowd_Hell_Good = {
		Default = Hell_Crowd_Loop_Good
		Volume_Params = {
			Hell_Crowd_Loop_Good = 150
		}
		Fade_From = {
		}
	}
	Crowd_Outdoor_Neutral = {
		Default = Outdoor_Crowd_Loop_Neutral
		Volume_Params = {
			Outdoor_Crowd_Loop_Neutral = 150
		}
		Fade_From = {
		}
	}
	Crowd_Outdoor_Good = {
		Default = Outdoor_Crowd_Loop_Good
		Volume_Params = {
			Outdoor_Crowd_Loop_Good = 250
		}
		Fade_From = {
		}
	}
	Crowd_Outdoor_Bad = {
		Default = Outdoor_Crowd_Loop_Bad
		Volume_Params = {
			Outdoor_Crowd_Loop_Bad = 300
		}
		Fade_From = {
		}
	}
}

script BG_Crowd_Large_Neutral 
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = Crowd_Stadium_Nuetral}
	One_Shot_SoundEvent \{SoundEvent = DoNothing_OneShot}
endscript

script BG_Crowd_Large_Good 
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = Crowd_Stadium_Good}
	One_Shot_SoundEvent \{SoundEvent = Crowd_OneShots_Cheer_Close
		waitTime = 5}
endscript

script BG_Crowd_Large_Bad 
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = Crowd_Stadium_Bad}
	One_Shot_SoundEvent \{SoundEvent = Crowd_OneShots_Boo_Close
		waitTime = 5}
endscript

script BG_Crowd_Medium_Neutral 
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = Crowd_Medium_Neutral}
	One_Shot_SoundEvent \{SoundEvent = DoNothing_OneShot}
endscript

script BG_Crowd_Medium_Good 
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = Crowd_Medium_Good1}
	One_Shot_SoundEvent \{SoundEvent = Crowd_OneShots_Cheer_Close
		waitTime = 5}
endscript

script BG_Crowd_Medium_Bad 
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = Crowd_Medium_Bad}
	One_Shot_SoundEvent \{SoundEvent = Crowd_OneShots_Boo_Close
		waitTime = 5}
endscript

script BG_Crowd_Small_Bad 
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = Crowd_Small_Bad}
	One_Shot_SoundEvent \{SoundEvent = Crowd_OneShots_Boo_Close
		waitTime = 5}
endscript

script BG_Crowd_Small_Good 
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = Crowd_Small_Good}
	One_Shot_SoundEvent \{SoundEvent = Crowd_OneShots_Cheer_Close
		waitTime = 5}
endscript

script BG_Crowd_Small_Neutral 
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = Crowd_Small_Neutral}
	One_Shot_SoundEvent \{SoundEvent = DoNothing_OneShot
		waitTime = 5}
endscript

script bg_crowd_nipmuc_bad 
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = crowd_nipmuc_bad}
	One_Shot_SoundEvent \{SoundEvent = Crowd_OneShots_Boo_Close
		waitTime = 5}
endscript

script bg_crowd_nipmuc_good 
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = crowd_nipmuc_good}
	One_Shot_SoundEvent \{SoundEvent = Crowd_OneShots_Cheer_Close
		waitTime = 5}
endscript

script bg_crowd_nipmuc_neutral 
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = crowd_nipmuc_neutral}
	One_Shot_SoundEvent \{SoundEvent = DoNothing_OneShot
		waitTime = 5}
endscript

script BG_Crowd_Hell_Bad 
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = Crowd_Hell_Bad}
	One_Shot_SoundEvent \{SoundEvent = Crowd_OneShots_Boo_Close
		waitTime = 5}
endscript

script BG_Crowd_Hell_Neutral 
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = Crowd_Hell_Neutral}
	One_Shot_SoundEvent \{SoundEvent = DoNothing_OneShot
		waitTime = 5}
endscript

script BG_Crowd_Hell_Good 
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = Crowd_Hell_Good}
	One_Shot_SoundEvent \{SoundEvent = Crowd_OneShots_Cheer_Close
		waitTime = 2}
endscript

script BG_Crowd_Front_End_Silence \{immediate = 0}
	Skate8_SFX_Backgrounds_New_Area BG_SFX_Area = FrontEnd immediate = <immediate>
	One_Shot_SoundEvent SoundEvent = DoNothing_OneShot waitTime = 5 immediate = <immediate>
endscript

script BG_Crowd_Outdoor_Neutral 
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = Crowd_Outdoor_Neutral}
	One_Shot_SoundEvent \{SoundEvent = DoNothing_OneShot
		waitTime = 5}
endscript

script BG_Crowd_Outdoor_Good 
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = Crowd_Outdoor_Good}
	One_Shot_SoundEvent \{SoundEvent = Crowd_OneShots_Cheer_Close
		waitTime = 5}
endscript

script BG_Crowd_Outdoor_Bad 
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = Crowd_Outdoor_Bad}
	One_Shot_SoundEvent \{SoundEvent = Crowd_OneShots_Boo_Close
		waitTime = 5}
endscript
