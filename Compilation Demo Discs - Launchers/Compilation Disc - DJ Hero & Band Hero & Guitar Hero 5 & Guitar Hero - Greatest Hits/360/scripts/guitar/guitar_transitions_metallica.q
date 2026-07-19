
script CareerIntro_Transition_EcstacyOfGold 
	OnExitRun \{CareerIntro_Transition_EcstacyOfGold_Destroy}
	SoundEvent \{event = EcstacyOfGold}
	begin
	if NOT isSoundEventPlaying \{EcstacyOfGold}
		break
	endif
	Wait \{10
		gameframes}
	repeat
endscript

script CareerIntro_Transition_EcstacyOfGold_Destroy 
	StopSoundEvent \{EcstacyOfGold}
endscript

script CareerIntro_Transition_TitleCard 
	OnExitRun \{CareerIntro_Transition_TitleCard_Destroy}
	CreateScreenElement \{type = DescInterface
		parent = root_window
		id = careerintro
		desc = 'titlecard'
		logo_alpha = 0.0
		alpha_0 = 0.0
		alpha_1 = 0.0
		alpha_2 = 0.0}
	careerintro :SE_SetProps \{alpha_0 = 1.0
		time = 1.0}
	careerintro :SE_WaitProps
	Wait \{4.0
		seconds
		ignoreslomo}
	careerintro :SE_SetProps \{alpha_0 = 0.0
		time = 1.0}
	careerintro :SE_WaitProps
	Wait \{1.0
		seconds
		ignoreslomo}
	careerintro :SE_SetProps \{alpha_1 = 1.0
		time = 1.0}
	careerintro :SE_WaitProps
	Wait \{5.0
		seconds
		ignoreslomo}
	careerintro :SE_SetProps \{alpha_1 = 0.0
		time = 1.0}
	careerintro :SE_WaitProps
	Wait \{2.5
		seconds
		ignoreslomo}
	careerintro :SE_SetProps \{alpha_2 = 1.0
		time = 0.5}
	careerintro :SE_WaitProps
	Wait \{4.0
		seconds
		ignoreslomo}
	careerintro :SE_SetProps \{alpha_2 = 0.0
		time = 1.0}
	careerintro :SE_WaitProps
	Wait \{16.5
		seconds
		ignoreslomo}
	careerintro :SE_SetProps \{logo_alpha = 1.0
		time = 1.0}
	careerintro :SE_WaitProps
	Wait \{5.0
		seconds
		ignoreslomo}
	careerintro :SE_SetProps \{logo_alpha = 0.0
		time = 1.0}
	careerintro :SE_WaitProps
endscript

script CareerIntro_Transition_TitleCard_Destroy 
	if ScreenElementExists \{id = careerintro}
		DestroyScreenElement \{id = careerintro}
	endif
endscript

script CareerIntro_Transition_ResetSlomo 
	OnExitRun \{setslomo_intro}
	begin
	if ($transition_playing = false)
		enable_pause
		break
	endif
	Wait \{1
		gameframe
		ignoreslomo}
	repeat
endscript

script CareerIntro_Ignore 
	change \{Default_CareerIntro_Transition = {
			time = 5000
			ScriptTable = [
			]
		}}
	change \{Common_CareerIntro_Transition = {
			ScriptTable = [
				{
					time = 0
					Scr = Start_Preloaded_Celeb_Intro_Stream
				}
				{
					time = 0
					Scr = Transition_StopRendering
				}
				{
					time = 0
					Scr = Crowd_AllPlayAnim
					params = {
						Anim = Idle
					}
				}
				{
					time = 0
					Scr = Transition_CameraCut
					params = {
						changenow
					}
				}
				{
					time = 0
					Scr = play_intro
					params = {
					}
				}
				{
					time = 0
					Scr = play_intro_anims
					params = {
					}
				}
				{
					time = 100
					Scr = Transition_StartRendering
				}
			]
			EndWithDefaultCamera
			SyncWithNoteCameras
		}}
endscript

script z_forum_camera_encore_cleanup 
	SafeKill \{nodeName = z_Forum_TRG_Geo_Blacktruck}
endscript

script should_play_long_venue_intro 
	GetPakManCurrent \{map = zones}
	GetGlobalTags \{venue_intro_flags}
	if StructureContains Structure = <...> <pak>
		<venue_flag> = (<...>.<pak>)
		if (<venue_flag> = 1)
			printf \{qs("\Lshould_play_long_venue_intro - no")}
			return \{false}
		endif
	endif
	printf \{qs("\Lshould_play_long_venue_intro - yes")}
	AddParam name = <pak> value = 1 structure_name = newvalue
	SetGlobalTags venue_intro_flags params = <newvalue>
	return \{true}
endscript

script wait_for_careeritnro 
	SetScriptCannotPause
	GameMode_GetType
	begin
	RemoveParameter \{not_done}
	if (<type> = career)
		if NOT progression_check_intro_complete
			if ($transition_playing = true)
				if ($current_playing_transition = careerintro)
					not_done = 1
				endif
			endif
		endif
	endif
	if NOT GotParam \{not_done}
		return
	endif
	Wait \{1
		gameframes}
	repeat
endscript
metallica_intro_vo_data = {
	random_frequency = 0.1
	exclude_venues = [
		z_IceCave
		z_soundcheck
		z_soundcheck2
		z_studio
		z_studio2
	]
	exclude_songs = [
		nothingelsematters
	]
	random_sets = [
		{
			rhythm_anim_name = VO_James_Generic_03
		}
		{
			rhythm_anim_name = VO_James_Generic_05
		}
		{
			rhythm_anim_name = VO_James_Generic_08
		}
		{
			rhythm_anim_name = VO_James_Generic_13
		}
		{
			rhythm_anim_name = VO_James_Generic_09
		}
		{
			rhythm_anim_name = VO_James_Generic_06
		}
		{
			rhythm_anim_name = VO_James_Generic_04
		}
		{
			rhythm_anim_name = VO_James_Generic_16
		}
		{
			rhythm_anim_name = VO_James_Generic_02
		}
		{
			rhythm_anim_name = VO_James_Generic_07
		}
		{
			rhythm_anim_name = VO_James_Generic_10
		}
		{
			rhythm_anim_name = VO_James_Generic_11
		}
		{
			rhythm_anim_name = VO_James_Generic_12
		}
		{
			rhythm_anim_name = VO_James_Generic_14
		}
		{
			rhythm_anim_name = VO_James_Generic_15
		}
		{
			rhythm_anim_name = VO_James_Generic_17
		}
		{
			rhythm_anim_name = VO_James_Generic_19
		}
		{
			rhythm_anim_name = VO_James_Encore_02
		}
		{
			rhythm_anim_name = VO_James_Generic_18
		}
		{
			rhythm_anim_name = VO_James_Generic_20
		}
	]
	song_specific_sets = {
		disposeableheroes = {
			rhythm_anim_name = VO_James_Song_01
		}
		hitthelights = {
			rhythm_anim_name = VO_James_Song_02
		}
		kingnothing = {
			rhythm_anim_name = VO_James_Song_05
		}
		whiplash = {
			rhythm_anim_name = VO_James_Song_06
		}
	}
}
