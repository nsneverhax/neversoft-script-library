Skate8_SFX_Background_Areas_And_States = {
	FrontEnd = {
		DEFAULT = Silence_Front_End_Crowd_Loop
		Volume_Params = {
			Silence_Front_End_Crowd_Loop = 10
		}
		Fade_From = {
		}
	}
	Crowd_Stadium_Good = {
		DEFAULT = Heavy_Crowd_Loop_Good_02
		Volume_Params = {
			Heavy_Crowd_Loop_Good_02 = 40
		}
		Fade_From = {
		}
	}
	Crowd_Stadium_Nuetral = {
		DEFAULT = Heavy_Crowd_Loop_Nuetral_02
		Volume_Params = {
			Heavy_Crowd_Loop_Nuetral_02 = 160
		}
		Fade_From = {
		}
	}
	Crowd_Stadium_Bad = {
		DEFAULT = Heavy_Crowd_Loop_Bad_01
		Volume_Params = {
			Heavy_Crowd_Loop_Bad_01 = 135
		}
		Fade_From = {
		}
	}
	Crowd_Medium_Good1 = {
		DEFAULT = Medium_Crowd_Loop_Good_02
		Volume_Params = {
			Medium_Crowd_Loop_Good_02 = 70
		}
		Fade_From = {
		}
	}
	Crowd_Medium_Neutral = {
		DEFAULT = Medium_Crowd_Loop_Neutral_01
		Volume_Params = {
			Medium_Crowd_Loop_Neutral_01 = 100
		}
		Fade_From = {
		}
	}
	Crowd_Medium_Bad = {
		DEFAULT = Medium_Crowd_Loop_Bad_01
		Volume_Params = {
			Medium_Crowd_Loop_Bad_01 = 140
		}
		Fade_From = {
		}
	}
	Crowd_Small_Bad = {
		DEFAULT = Small_Crowd_Loop_Bad
		Volume_Params = {
			Small_Crowd_Loop_Bad = 60
		}
		Fade_From = {
		}
	}
	Crowd_Small_Good = {
		DEFAULT = Small_Crowd_Loop_Good
		Volume_Params = {
			Small_Crowd_Loop_Good = 88
		}
		Fade_From = {
		}
	}
	Crowd_Small_Neutral = {
		DEFAULT = Small_Crowd_Loop_Neutral
		Volume_Params = {
			Small_Crowd_Loop_Neutral = 16
		}
		Fade_From = {
		}
	}
	Crowd_Hell_Bad = {
		DEFAULT = Hell_Crowd_Loop_Bad
		Volume_Params = {
			Hell_Crowd_Loop_Bad = 250
		}
		Fade_From = {
		}
	}
	Crowd_Hell_Neutral = {
		DEFAULT = Hell_Crowd_Loop_Neutral
		Volume_Params = {
			Hell_Crowd_Loop_Neutral = 150
		}
		Fade_From = {
		}
	}
	Crowd_Hell_Good = {
		DEFAULT = Hell_Crowd_Loop_Good
		Volume_Params = {
			Hell_Crowd_Loop_Good = 150
		}
		Fade_From = {
		}
	}
	Crowd_Outdoor_Neutral = {
		DEFAULT = Outdoor_Crowd_Loop_Neutral
		Volume_Params = {
			Outdoor_Crowd_Loop_Neutral = 150
		}
		Fade_From = {
		}
	}
	Crowd_Outdoor_Good = {
		DEFAULT = Outdoor_Crowd_Loop_Good
		Volume_Params = {
			Outdoor_Crowd_Loop_Good = 250
		}
		Fade_From = {
		}
	}
	Crowd_Outdoor_Bad = {
		DEFAULT = Outdoor_Crowd_Loop_Bad
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
		Waittime = 5}
endscript

script BG_Crowd_Large_Bad 
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = Crowd_Stadium_Bad}
	One_Shot_SoundEvent \{SoundEvent = Crowd_OneShots_Boo_Close
		Waittime = 5}
endscript

script BG_Crowd_Medium_Neutral 
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = Crowd_Medium_Neutral}
	One_Shot_SoundEvent \{SoundEvent = DoNothing_OneShot}
endscript

script BG_Crowd_Medium_Good 
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = Crowd_Medium_Good1}
	One_Shot_SoundEvent \{SoundEvent = Crowd_OneShots_Cheer_Close
		Waittime = 5}
endscript

script BG_Crowd_Medium_Bad 
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = Crowd_Medium_Bad}
	One_Shot_SoundEvent \{SoundEvent = Crowd_OneShots_Boo_Close
		Waittime = 5}
endscript

script BG_Crowd_Small_Bad 
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = Crowd_Small_Bad}
	One_Shot_SoundEvent \{SoundEvent = Crowd_OneShots_Boo_Close
		Waittime = 5}
endscript

script BG_Crowd_Small_Good 
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = Crowd_Small_Good}
	One_Shot_SoundEvent \{SoundEvent = Crowd_OneShots_Cheer_Close
		Waittime = 5}
endscript

script BG_Crowd_Small_Neutral 
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = Crowd_Small_Neutral}
	One_Shot_SoundEvent \{SoundEvent = DoNothing_OneShot
		Waittime = 5}
endscript

script BG_Crowd_Hell_Bad 
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = Crowd_Hell_Bad}
	One_Shot_SoundEvent \{SoundEvent = Crowd_OneShots_Boo_Close
		Waittime = 5}
endscript

script BG_Crowd_Hell_Neutral 
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = Crowd_Hell_Neutral}
	One_Shot_SoundEvent \{SoundEvent = DoNothing_OneShot
		Waittime = 5}
endscript

script BG_Crowd_Hell_Good 
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = Crowd_Hell_Good}
	One_Shot_SoundEvent \{SoundEvent = Crowd_OneShots_Cheer_Close
		Waittime = 2}
endscript

script BG_Crowd_Front_End_Silence \{IMMEDIATE = 0}
	Skate8_SFX_Backgrounds_New_Area BG_SFX_Area = FrontEnd IMMEDIATE = <IMMEDIATE>
	One_Shot_SoundEvent SoundEvent = DoNothing_OneShot Waittime = 5 IMMEDIATE = <IMMEDIATE>
endscript

script BG_Crowd_Outdoor_Neutral 
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = Crowd_Outdoor_Neutral}
	One_Shot_SoundEvent \{SoundEvent = DoNothing_OneShot
		Waittime = 5}
endscript

script BG_Crowd_Outdoor_Good 
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = Crowd_Outdoor_Good}
	One_Shot_SoundEvent \{SoundEvent = Crowd_OneShots_Cheer_Close
		Waittime = 5}
endscript

script BG_Crowd_Outdoor_Bad 
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = Crowd_Outdoor_Bad}
	One_Shot_SoundEvent \{SoundEvent = Crowd_OneShots_Boo_Close
		Waittime = 5}
endscript
