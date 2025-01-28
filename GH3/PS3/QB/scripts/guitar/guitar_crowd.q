current_crowd = 1.0
average_crowd = 1.0
total_crowd = 0.0
max_crowd = 0.0
crowd_scale = 2.0
health_scale = 2.0
crowd_debug_mode = 0
viewercam_nofail = 0

script crowd_reset 
	if ($game_mode = Tutorial)
		return
	endif
	if GetNodeFlag \{LS_ENCORE_POST}
		Change \{current_crowd = 1.6666}
		Change \{average_crowd = 1.6666}
	else
		Change \{current_crowd = 1.0}
		Change \{average_crowd = 1.0}
	endif
	Change \{total_crowd = 0.0}
	Change \{max_crowd = 0.0}
	Change \{last_time_in_lead = 0.0}
	Change \{last_time_in_lead_player = -1}
	if (<Player> = 1)
		StopSoundEvent \{$CurrentlyPlayingOneShotSoundEvent}
		if ($game_mode = training)
			BG_Crowd_Front_End_Silence \{IMMEDIATE = 1}
		elseif ($end_credits = 1 ||
				GetNodeFlag LS_ENCORE_POST)
			Printf \{Channel = SFX
				"crowd_reset LS_ENCORE_POST"}
			Change_Crowd_Looping_SFX \{crowd_looping_state = GOOD}
		else
			Printf \{Channel = SFX
				"NOT - crowd_reset LS_ENCORE_POST"}
			Change_Crowd_Looping_SFX \{crowd_looping_state = neutral}
		endif
	endif
	if GetNodeFlag \{LS_ENCORE_POST}
		if NOT ($game_mode = p2_battle)
			Change StructureName = <player_status> current_health = 1.6666
		else
			Change StructureName = <player_status> current_health = 1.0
		endif
	else
		Change StructureName = <player_status> current_health = 1.0
	endif
	if ($game_mode = p2_battle && $battle_sudden_death = 1)
		Change StructureName = <player_status> current_health = ($<player_status>.save_health)
	endif
	CrowdReset
endscript

script forcescore 
	switch $debug_forcescore
		case POOR
		health = ($health_poor_medium / 2)
		case MEDIUM
		health = (($health_poor_medium + $health_medium_good) / 2)
		case GOOD
		health = (($health_medium_good + $health_scale) / 2)
		default
		health = ($health_poor_medium / 2)
	endswitch
	Change StructureName = <player_status> current_health = <health>
	Change current_crowd = <health>
endscript
z_wikker_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		Id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_wikker/z_wikker.tex`
		AssetContext = Z_Wikker
		TriggerScript = Z_Wikker_Crowd_Peds
		Params = {
			Name = crowd1
		}
	}
	{
		Name = Crowd2
		Camera = crowd2_cam
		Model = 'Real_Crowd\\Crowd_Ped_02.skin'
		Id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_wikker/z_wikker.tex`
		AssetContext = Z_Wikker
		TriggerScript = Z_Wikker_Crowd_Peds
		Params = {
			Name = Crowd2
		}
	}
	{
		Name = crowd3
		Camera = crowd3_cam
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		Id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_wikker/z_wikker.tex`
		AssetContext = Z_Wikker
		TriggerScript = Z_Wikker_Crowd_Peds
		Params = {
			Name = crowd3
		}
	}
	{
		Name = crowd4
		Camera = crowd4_cam
		Model = 'Real_Crowd\\Crowd_Ped_04.skin'
		Id = crowd4_cam_viewport
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_wikker/z_wikker.tex`
		AssetContext = Z_Wikker
		TriggerScript = Z_Wikker_Crowd_Peds
		Params = {
			Name = crowd4
		}
	}
	{
		Name = crowd5
		Camera = crowd5_cam
		Model = 'Real_Crowd\\crowd_pedF_1.skin'
		Id = crowd5_cam_viewport
		texture = viewport5
		textureasset = `tex/zones/Demo/tw_billboard05.dds`
		texdict = `zones/z_wikker/z_wikker.tex`
		AssetContext = Z_Wikker
		TriggerScript = Z_Wikker_Crowd_Peds
		Params = {
			Name = crowd5
		}
	}
	{
		Name = crowd6
		Camera = crowd6_cam
		Model = 'Real_Crowd\\crowd_pedF_2.skin'
		Id = crowd6_cam_viewport
		texture = viewport6
		textureasset = `tex/zones/Demo/tw_billboard06.dds`
		texdict = `zones/z_wikker/z_wikker.tex`
		AssetContext = Z_Wikker
		TriggerScript = Z_Wikker_Crowd_Peds
		Params = {
			Name = crowd6
		}
	}
]
z_dive_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		Id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_dive/z_dive.tex`
		AssetContext = Z_Dive
		TriggerScript = Z_Dive_Crowd_Peds
		Params = {
			Name = crowd1
		}
	}
	{
		Name = Crowd2
		Camera = crowd2_cam
		Model = 'Real_Crowd\\Crowd_Ped_02.skin'
		Id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_dive/z_dive.tex`
		AssetContext = Z_Dive
		TriggerScript = Z_Dive_Crowd_Peds
		Params = {
			Name = Crowd2
		}
	}
	{
		Name = crowd3
		Camera = crowd3_cam
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		Id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_dive/z_dive.tex`
		AssetContext = Z_Dive
		TriggerScript = Z_Dive_Crowd_Peds
		Params = {
			Name = crowd3
		}
	}
	{
		Name = crowd4
		Camera = crowd4_cam
		Model = 'Real_Crowd\\Crowd_Ped_04.skin'
		Id = crowd4_cam_viewport
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_dive/z_dive.tex`
		AssetContext = Z_Dive
		TriggerScript = Z_Dive_Crowd_Peds
		Params = {
			Name = crowd4
		}
	}
	{
		Name = crowd5
		Camera = crowd5_cam
		Model = 'Real_Crowd\\crowd_pedF_1.skin'
		Id = crowd5_cam_viewport
		texture = viewport5
		textureasset = `tex/zones/Demo/tw_billboard05.dds`
		texdict = `zones/z_dive/z_dive.tex`
		AssetContext = Z_Dive
		TriggerScript = Z_Dive_Crowd_Peds
		Params = {
			Name = crowd5
		}
	}
	{
		Name = crowd6
		Camera = crowd6_cam
		Model = 'Real_Crowd\\crowd_pedF_2.skin'
		Id = crowd6_cam_viewport
		texture = viewport6
		textureasset = `tex/zones/Demo/tw_billboard06.dds`
		texdict = `zones/z_dive/z_dive.tex`
		AssetContext = Z_Dive
		TriggerScript = Z_Dive_Crowd_Peds
		Params = {
			Name = crowd6
		}
	}
]
z_artdeco_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		Id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_artdeco/z_artdeco.tex`
		AssetContext = Z_ArtDeco
		TriggerScript = Z_ArtDeco_Crowd_Peds
		Params = {
			Name = crowd1
		}
	}
	{
		Name = Crowd2
		Camera = crowd2_cam
		Model = 'Real_Crowd\\Crowd_Ped_02.skin'
		Id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_artdeco/z_artdeco.tex`
		AssetContext = Z_ArtDeco
		TriggerScript = Z_ArtDeco_Crowd_Peds
		Params = {
			Name = Crowd2
		}
	}
	{
		Name = crowd3
		Camera = crowd3_cam
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		Id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_artdeco/z_artdeco.tex`
		AssetContext = Z_ArtDeco
		TriggerScript = Z_ArtDeco_Crowd_Peds
		Params = {
			Name = crowd3
		}
	}
	{
		Name = crowd4
		Camera = crowd4_cam
		Model = 'Real_Crowd\\Crowd_Ped_04.skin'
		Id = crowd4_cam_viewport
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_artdeco/z_artdeco.tex`
		AssetContext = Z_ArtDeco
		TriggerScript = Z_ArtDeco_Crowd_Peds
		Params = {
			Name = crowd4
		}
	}
	{
		Name = crowd5
		Camera = crowd5_cam
		Model = 'Real_Crowd\\crowd_pedF_1.skin'
		Id = crowd5_cam_viewport
		texture = viewport5
		textureasset = `tex/zones/Demo/tw_billboard05.dds`
		texdict = `zones/z_artdeco/z_artdeco.tex`
		AssetContext = Z_ArtDeco
		TriggerScript = Z_ArtDeco_Crowd_Peds
		Params = {
			Name = crowd5
		}
	}
	{
		Name = crowd6
		Camera = crowd6_cam
		Model = 'Real_Crowd\\crowd_pedF_2.skin'
		Id = crowd6_cam_viewport
		texture = viewport6
		textureasset = `tex/zones/Demo/tw_billboard06.dds`
		texdict = `zones/z_artdeco/z_artdeco.tex`
		AssetContext = Z_ArtDeco
		TriggerScript = Z_ArtDeco_Crowd_Peds
		Params = {
			Name = crowd6
		}
	}
]
z_prison_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		Model = 'Real_Crowd\\Crowd_Prison_01.skin'
		Id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_prison/z_prison.tex`
		AssetContext = Z_Prison
		TriggerScript = Z_Prison_Crowd_Peds
		Params = {
			Name = crowd1
		}
	}
	{
		Name = Crowd2
		Camera = crowd2_cam
		Model = 'Real_Crowd\\Crowd_Prison_02.skin'
		Id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_prison/z_prison.tex`
		AssetContext = Z_Prison
		TriggerScript = Z_Prison_Crowd_Peds
		Params = {
			Name = Crowd2
		}
	}
	{
		Name = crowd3
		Camera = crowd3_cam
		Model = 'Real_Crowd\\Crowd_Prison_01.skin'
		Id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_prison/z_prison.tex`
		AssetContext = Z_Prison
		TriggerScript = Z_Prison_Crowd_Peds
		Params = {
			Name = crowd3
		}
	}
	{
		Name = crowd4
		Camera = crowd4_cam
		Model = 'Real_Crowd\\Crowd_Prison_02.skin'
		Id = crowd4_cam_viewport
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_prison/z_prison.tex`
		AssetContext = Z_Prison
		TriggerScript = Z_Prison_Crowd_Peds
		Params = {
			Name = crowd4
		}
	}
	{
		Name = crowd5
		Camera = crowd5_cam
		Model = 'Real_Crowd\\Crowd_Prison_01.skin'
		Id = crowd5_cam_viewport
		texture = viewport5
		textureasset = `tex/zones/Demo/tw_billboard05.dds`
		texdict = `zones/z_prison/z_prison.tex`
		AssetContext = Z_Prison
		TriggerScript = Z_Prison_Crowd_Peds
		Params = {
			Name = crowd5
		}
	}
	{
		Name = crowd6
		Camera = crowd6_cam
		Model = 'Real_Crowd\\Crowd_Prison_02.skin'
		Id = crowd6_cam_viewport
		texture = viewport6
		textureasset = `tex/zones/Demo/tw_billboard06.dds`
		texdict = `zones/z_prison/z_prison.tex`
		AssetContext = Z_Prison
		TriggerScript = Z_Prison_Crowd_Peds
		Params = {
			Name = crowd6
		}
	}
]
z_party_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		Id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_party/z_party.tex`
		AssetContext = Z_Party
		TriggerScript = Z_Party_Crowd_Peds
		Params = {
			Name = crowd1
		}
	}
	{
		Name = Crowd2
		Camera = crowd2_cam
		Model = 'Real_Crowd\\Crowd_Ped_02.skin'
		Id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_party/z_party.tex`
		AssetContext = Z_Party
		TriggerScript = Z_Party_Crowd_Peds
		Params = {
			Name = Crowd2
		}
	}
	{
		Name = crowd3
		Camera = crowd3_cam
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		Id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_party/z_party.tex`
		AssetContext = Z_Party
		TriggerScript = Z_Party_Crowd_Peds
		Params = {
			Name = crowd3
		}
	}
	{
		Name = crowd4
		Camera = crowd4_cam
		Model = 'Real_Crowd\\Crowd_Ped_04.skin'
		Id = crowd4_cam_viewport
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_party/z_party.tex`
		AssetContext = Z_Party
		TriggerScript = Z_Party_Crowd_Peds
		Params = {
			Name = crowd4
		}
	}
	{
		Name = crowd5
		Camera = crowd5_cam
		Model = 'Real_Crowd\\crowd_pedF_1.skin'
		Id = crowd5_cam_viewport
		texture = viewport5
		textureasset = `tex/zones/Demo/tw_billboard05.dds`
		texdict = `zones/z_party/z_party.tex`
		AssetContext = Z_Party
		TriggerScript = Z_Party_Crowd_Peds
		Params = {
			Name = crowd5
		}
	}
	{
		Name = crowd6
		Camera = crowd6_cam
		Model = 'Real_Crowd\\crowd_pedF_2.skin'
		Id = crowd6_cam_viewport
		texture = viewport6
		textureasset = `tex/zones/Demo/tw_billboard06.dds`
		texdict = `zones/z_party/z_party.tex`
		AssetContext = Z_Party
		TriggerScript = Z_Party_Crowd_Peds
		Params = {
			Name = crowd6
		}
	}
]
z_hell_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		Model = 'Real_Crowd\\Crowd_Biker_01.skin'
		Id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_hell/z_hell.tex`
		AssetContext = Z_Hell
		TriggerScript = Z_Hell_Crowd_Peds
		Params = {
			Name = crowd1
		}
	}
	{
		Name = Crowd2
		Camera = crowd2_cam
		Model = 'Real_Crowd\\Crowd_Biker_02.skin'
		Id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_hell/z_hell.tex`
		AssetContext = Z_Hell
		TriggerScript = Z_Hell_Crowd_Peds
		Params = {
			Name = Crowd2
		}
	}
	{
		Name = crowd3
		Camera = crowd3_cam
		Model = 'Real_Crowd\\Crowd_Biker_01.skin'
		Id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_hell/z_hell.tex`
		AssetContext = Z_Hell
		TriggerScript = Z_Hell_Crowd_Peds
		Params = {
			Name = crowd3
		}
	}
	{
		Name = crowd4
		Camera = crowd4_cam
		Model = 'Real_Crowd\\Crowd_Biker_02.skin'
		Id = crowd4_cam_viewport
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_hell/z_hell.tex`
		AssetContext = Z_Hell
		TriggerScript = Z_Hell_Crowd_Peds
		Params = {
			Name = crowd4
		}
	}
	{
		Name = crowd5
		Camera = crowd5_cam
		Model = 'Real_Crowd\\crowd_Biker_01.skin'
		Id = crowd5_cam_viewport
		texture = viewport5
		textureasset = `tex/zones/Demo/tw_billboard05.dds`
		texdict = `zones/z_hell/z_hell.tex`
		AssetContext = Z_Hell
		TriggerScript = Z_Hell_Crowd_Peds
		Params = {
			Name = crowd5
		}
	}
	{
		Name = crowd6
		Camera = crowd6_cam
		Model = 'Real_Crowd\\crowd_biker_02.skin'
		Id = crowd6_cam_viewport
		texture = viewport6
		textureasset = `tex/zones/Demo/tw_billboard06.dds`
		texdict = `zones/z_hell/z_hell.tex`
		AssetContext = Z_Hell
		TriggerScript = Z_Hell_Crowd_Peds
		Params = {
			Name = crowd6
		}
	}
]
z_training_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		Model = 'Characters\\Musicians\\Sec_Barker.skin'
		Id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_training/z_training.tex`
		AssetContext = z_training
		TriggerScript = Z_Training_Crowd_Peds
	}
	{
		Name = Crowd2
		Camera = crowd2_cam
		Model = 'Characters\\Musicians\\Sec_Punk.skin'
		Id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_training/z_training.tex`
		AssetContext = z_training
		TriggerScript = Z_Training_Crowd_Peds
	}
	{
		Name = crowd3
		Camera = crowd3_cam
		Model = 'Characters\\Musicians\\Sec_Pro_Stabb.skin'
		Id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_training/z_training.tex`
		AssetContext = z_training
		TriggerScript = Z_Training_Crowd_Peds
	}
]
z_Budokan_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		Id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_Budokan/z_Budokan.tex`
		AssetContext = Z_Budokan
		TriggerScript = Z_Budokan_Crowd_Peds
		Params = {
			Name = crowd1
		}
	}
	{
		Name = Crowd2
		Camera = crowd2_cam
		Model = 'Real_Crowd\\Crowd_Ped_02.skin'
		Id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_Budokan/z_Budokan.tex`
		AssetContext = Z_Budokan
		TriggerScript = Z_Budokan_Crowd_Peds
		Params = {
			Name = Crowd2
		}
	}
	{
		Name = crowd3
		Camera = crowd3_cam
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		Id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_Budokan/z_Budokan.tex`
		AssetContext = Z_Budokan
		TriggerScript = Z_Budokan_Crowd_Peds
		Params = {
			Name = crowd3
		}
	}
	{
		Name = crowd4
		Camera = crowd4_cam
		Model = 'Real_Crowd\\Crowd_Ped_04.skin'
		Id = crowd4_cam_viewport
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_Budokan/z_Budokan.tex`
		AssetContext = Z_Budokan
		TriggerScript = Z_Budokan_Crowd_Peds
		Params = {
			Name = crowd4
		}
	}
	{
		Name = crowd5
		Camera = crowd5_cam
		Model = 'Real_Crowd\\crowd_pedF_1.skin'
		Id = crowd5_cam_viewport
		texture = viewport5
		textureasset = `tex/zones/Demo/tw_billboard05.dds`
		texdict = `zones/z_Budokan/z_Budokan.tex`
		AssetContext = Z_Budokan
		TriggerScript = Z_Budokan_Crowd_Peds
		Params = {
			Name = crowd5
		}
	}
	{
		Name = crowd6
		Camera = crowd6_cam
		Model = 'Real_Crowd\\crowd_pedF_2.skin'
		Id = crowd6_cam_viewport
		texture = viewport6
		textureasset = `tex/zones/Demo/tw_billboard06.dds`
		texdict = `zones/z_Budokan/z_Budokan.tex`
		AssetContext = Z_Budokan
		TriggerScript = Z_Budokan_Crowd_Peds
		Params = {
			Name = crowd6
		}
	}
]
z_video_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		Id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_video/z_video.tex`
		AssetContext = Z_Video
		TriggerScript = Z_Video_Crowd_Peds
		Params = {
			Name = crowd1
		}
		roty = -90
	}
	{
		Name = Crowd2
		Camera = crowd2_cam
		Model = 'Real_Crowd\\Crowd_Ped_02.skin'
		Id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_video/z_video.tex`
		AssetContext = Z_Video
		TriggerScript = Z_Video_Crowd_Peds
		Params = {
			Name = Crowd2
		}
		roty = -90
	}
	{
		Name = crowd3
		Camera = crowd3_cam
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		Id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_video/z_video.tex`
		AssetContext = Z_Video
		TriggerScript = Z_Video_Crowd_Peds
		Params = {
			Name = crowd3
		}
		roty = -90
	}
	{
		Name = crowd4
		Camera = crowd4_cam
		Model = 'Real_Crowd\\Crowd_Ped_04.skin'
		Id = crowd4_cam_viewport
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_video/z_video.tex`
		AssetContext = Z_Video
		TriggerScript = Z_Video_Crowd_Peds
		Params = {
			Name = crowd4
		}
	}
	{
		Name = crowd5
		Camera = crowd5_cam
		Model = 'Real_Crowd\\crowd_pedF_1.skin'
		Id = crowd5_cam_viewport
		texture = viewport5
		textureasset = `tex/zones/Demo/tw_billboard05.dds`
		texdict = `zones/z_video/z_video.tex`
		AssetContext = Z_Video
		TriggerScript = Z_Video_Crowd_Peds
		Params = {
			Name = crowd5
		}
	}
	{
		Name = crowd6
		Camera = crowd6_cam
		Model = 'Real_Crowd\\crowd_pedF_2.skin'
		Id = crowd6_cam_viewport
		texture = viewport6
		textureasset = `tex/zones/Demo/tw_billboard06.dds`
		texdict = `zones/z_video/z_video.tex`
		AssetContext = Z_Video
		TriggerScript = Z_Video_Crowd_Peds
		Params = {
			Name = crowd6
		}
	}
	{
		Name = crowd7
		Camera = crowd7_cam
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		Id = crowd7_cam_viewport
		texture = viewport7
		textureasset = `tex/zones/Demo/tw_billboard07.dds`
		texdict = `zones/z_video/z_video.tex`
		AssetContext = Z_Video
		TriggerScript = Z_Video_Crowd_Peds
		Params = {
			Name = crowd7
		}
		roty = 90
	}
	{
		Name = crowd8
		Camera = crowd8_cam
		Model = 'Real_Crowd\\Crowd_Ped_04.skin'
		Id = crowd8_cam_viewport
		texture = viewport8
		textureasset = `tex/zones/Demo/tw_billboard08.dds`
		texdict = `zones/z_video/z_video.tex`
		AssetContext = Z_Video
		TriggerScript = Z_Video_Crowd_Peds
		Params = {
			Name = crowd8
		}
		roty = 90
	}
]

script create_crowd_models 
	if ($disable_crowd = 1)
		return
	endif
	GetPakManCurrentName \{map = Zones}
	FormatText ChecksumName = crowd_models '%s_crowd_models' S = <pakname>
	if NOT GlobalExists Name = <crowd_models>
		return
	endif
	Change crowd_model_array = <crowd_models>
	GetArraySize $<crowd_models>
	array_count = 0
	begin
	Pos = ((-500.0, -200.0, 0.0) + (0.0, -100.0, 0.0) * <array_count>)
	viewport = ($<crowd_models> [<array_count>].Id)
	Camera = ($<crowd_models> [<array_count>].Camera)
	if NOT StructureContains Structure = ($<crowd_models> [<array_count>]) remap_only
		MemPushContext \{BottomUpHeap}
		CreateFromStructure {
			Pos = <Pos>
			Quat = (0.0, 1.0, 0.0)
			Class = GameObject
			Type = Ghost
			CreatedAtStart
			($<crowd_models> [<array_count>])
			SuspendDistance = 0
			lod_dist1 = 400
			lod_dist2 = 401
			Profile = $Profile_Ped_Crowd_Obj
			LightGroup = Crowd
			object_type = Crowd
			ProfileColor = 49344
			profilebudget = 200
			use_jq
		}
		model_id = ($<crowd_models> [<array_count>].Name)
		extra_model = 'Real_Crowd\\Crowd_HandL_Lighter.skin'
		<model_id> :AddGeom lhand_lighter Model = <extra_model> LightGroup = Crowd
		extra_model = 'Real_Crowd\\Crowd_HandL_Rock.skin'
		<model_id> :AddGeom lhand_rock Model = <extra_model> LightGroup = Crowd
		extra_model = 'Real_Crowd\\Crowd_HandL_Clap.skin'
		<model_id> :AddGeom lhand_clap Model = <extra_model> LightGroup = Crowd
		extra_model = 'Real_Crowd\\Crowd_HandL_Fist.skin'
		<model_id> :AddGeom lhand_fist Model = <extra_model> LightGroup = Crowd
		extra_model = 'Real_Crowd\\Crowd_HandR_Lighter.skin'
		<model_id> :AddGeom rhand_lighter Model = <extra_model> LightGroup = Crowd
		extra_model = 'Real_Crowd\\Crowd_HandR_Rock.skin'
		<model_id> :AddGeom rhand_rock Model = <extra_model> LightGroup = Crowd
		extra_model = 'Real_Crowd\\Crowd_HandR_Clap.skin'
		<model_id> :AddGeom rhand_clap Model = <extra_model> LightGroup = Crowd
		extra_model = 'Real_Crowd\\Crowd_HandR_Fist.skin'
		<model_id> :AddGeom rhand_fist Model = <extra_model> LightGroup = Crowd
		<model_id> :SwitchOffAtomic lhand_lighter
		<model_id> :SwitchOffAtomic lhand_rock
		<model_id> :SwitchOffAtomic lhand_fist
		<model_id> :SwitchOnAtomic lhand_clap
		<model_id> :SwitchOffAtomic rhand_lighter
		<model_id> :SwitchOffAtomic rhand_rock
		<model_id> :SwitchOffAtomic rhand_fist
		<model_id> :SwitchOnAtomic rhand_clap
		if StructureContains Structure = ($<crowd_models> [<array_count>]) roty
			($<crowd_models> [<array_count>].Name) :Obj_SetOrientation Y = ($<crowd_models> [<array_count>].roty)
			apply_correction = 0
		else
			apply_correction = 1
		endif
		MemPopContext \{BottomUpHeap}
		style = imposter_rendering
		if (<array_Size> <= 6)
			if IsXENON
				style = imposter_rendering_highres
			endif
		endif
		CreateScreenElement {
			PARENT = root_window
			just = [Center Center]
			Type = ViewportElement
			Id = <viewport>
			texture = ($<crowd_models> [<array_count>].texture)
			Pos = (2000.0, 200.0)
			Dims = (64.0, 64.0)
			Alpha = 1
			style = <style>
		}
		CreateCompositeObjectInstance {
			Priority = $COIM_Priority_Permanent
			Heap = Generic
			Components = [
				{Component = Camera}
			]
			Params = {
				Name = <Camera>
				viewport = <viewport>
				object_type = Crowd
				ProfileColor = 12632064
				profilebudget = 10
				use_jq
				far_clip = 20
			}
		}
		SetActiveCamera viewport = <viewport> Id = <Camera>
		<Camera> :SetHFOV hFOV = 20.0
		SetViewportProperties viewport = <viewport> no_resolve_depthstencilbuffer = TRUE
		AddCrowdModelCam Camera = <Camera> Pos = <Pos> viewport = <viewport> apply_correction = <apply_correction>
	endif
	SetSearchAllAssetContexts
	CreateViewportTextureOverride {
		Id = <viewport>
		viewportid = <viewport>
		texture = ($<crowd_models> [<array_count>].textureasset)
		texdict = ($<crowd_models> [<array_count>].texdict)
	}
	SetSearchAllAssetContexts \{OFF}
	<array_count> = (<array_count> + 1)
	repeat <array_Size>
endscript

script update_crowd_model_cam 
	crowd_scaler = 25
	begin
	GetViewportCameraOrient \{viewport = Bg_Viewport}
	GetVectorComponents <at>
	Angle = (<X> * <crowd_scaler>)
	RotateVector vector = <at> ry = <Angle>
	at = <result_vector>
	RotateVector vector = <LEFT> ry = <Angle>
	LEFT = <result_vector>
	RotateVector vector = <UP> ry = <Angle>
	UP = <result_vector>
	posdir = (<model_pos> + (0.0, 1.0, 0.0) + (<at> * 3.5))
	<Camera> :Obj_SetPosition Position = <posdir>
	<Camera> :Obj_SetOrientation Dir = <at> Only handles upright Cameras
	SetViewportCameraOrient viewport = <viewport> at = <at> LEFT = <LEFT> UP = <UP>
	<Camera> :UnPause
	Wait \{1
		GameFrame}
	repeat
endscript

script Destroy_Crowd_Models 
	ClearCrowdModelCams
	crowd_models = $crowd_model_array
	if (<crowd_models> = NONE)
		return
	endif
	GetArraySize <crowd_models>
	array_count = 0
	begin
	if NOT StructureContains Structure = (<crowd_models> [<array_count>]) remap_only
		KillSpawnedScript \{Name = update_crowd_model_cam}
		if CompositeObjectExists Name = (<crowd_models> [<array_count>].Camera)
			(<crowd_models> [<array_count>].Camera) :DIE
		endif
		if ScreenElementExists Id = (<crowd_models> [<array_count>].Id)
			SetSearchAllAssetContexts
			DestroyViewportTextureOverride Id = (<crowd_models> [<array_count>].Id)
			SetSearchAllAssetContexts \{OFF}
			DestroyScreenElement Id = (<crowd_models> [<array_count>].Id)
		endif
		if CompositeObjectExists Name = (<crowd_models> [<array_count>].Name)
			(<crowd_models> [<array_count>].Name) :DIE
		endif
	endif
	<array_count> = (<array_count> + 1)
	repeat <array_Size>
	Change \{crowd_model_array = NONE}
endscript

script set_crowd_hand \{Hand = LEFT
		Type = clap}
	Obj_GetID
	Name = <ObjID>
	if (<Hand> = LEFT)
		switch (<Type>)
			case lighter
			part = lhand_lighter
			case Rock
			part = lhand_rock
			case clap
			part = lhand_clap
			case fist
			part = lhand_fist
		endswitch
		<Name> :SwitchOffAtomic lhand_lighter
		<Name> :SwitchOffAtomic lhand_rock
		<Name> :SwitchOffAtomic lhand_clap
		<Name> :SwitchOffAtomic lhand_fist
		<Name> :SwitchOnAtomic <part>
	else
		switch (<Type>)
			case lighter
			part = rhand_lighter
			case Rock
			part = rhand_rock
			case clap
			part = rhand_clap
			case fist
			part = rhand_fist
		endswitch
		<Name> :SwitchOffAtomic rhand_lighter
		<Name> :SwitchOffAtomic rhand_rock
		<Name> :SwitchOffAtomic rhand_clap
		<Name> :SwitchOffAtomic rhand_fist
		<Name> :SwitchOnAtomic <part>
	endif
endscript

script Crowd_SetHand \{Name = crowd1
		Hand = LEFT
		Type = clap}
	if CompositeObjectExists <Name>
		<Name> :set_crowd_hand Hand = <Hand> Type = <Type>
	endif
endscript

script Crowd_StartLighters 
	KillSpawnedScript \{Name = crowd_monitor_performance}
	SpawnScriptNow \{crowd_monitor_performance}
endscript

script crowd_monitor_performance 
	lighters_on = FALSE
	begin
	get_skill_level
	if (<skill> != Bad)
		if (<lighters_on> = FALSE)
			Crowd_AllSetHand \{Hand = RIGHT
				Type = lighter}
			Crowd_AllPlayAnim \{Anim = Special}
			lighters_on = TRUE
			Crowd_ToggleLighters \{ON}
		endif
	else
		if (<lighters_on> = TRUE)
			Crowd_AllSetHand \{Hand = RIGHT
				Type = clap}
			Crowd_AllPlayAnim \{Anim = IDLE}
			lighters_on = FALSE
			Crowd_ToggleLighters \{OFF}
		endif
	endif
	Wait \{1
		GameFrame}
	repeat
endscript

script Crowd_StopLighters 
	KillSpawnedScript \{Name = crowd_monitor_performance}
	Crowd_AllSetHand \{Hand = RIGHT
		Type = clap}
	Crowd_AllPlayAnim \{Anim = IDLE}
	Crowd_ToggleLighters \{OFF}
endscript

script Crowd_AllSetHand 
	Crowd_SetHand Name = crowd1 Hand = <Hand> Type = <Type>
	Crowd_SetHand Name = Crowd2 Hand = <Hand> Type = <Type>
	Crowd_SetHand Name = crowd3 Hand = <Hand> Type = <Type>
	Crowd_SetHand Name = crowd4 Hand = <Hand> Type = <Type>
	Crowd_SetHand Name = crowd5 Hand = <Hand> Type = <Type>
	Crowd_SetHand Name = crowd6 Hand = <Hand> Type = <Type>
	Crowd_SetHand Name = crowd7 Hand = <Hand> Type = <Type>
	Crowd_SetHand Name = crowd8 Hand = <Hand> Type = <Type>
endscript

script Crowd_AllPlayAnim 
	Wait \{1
		GameFrame}
	Crowd_PlayAnim Name = crowd1 Anim = <Anim>
	Wait \{1
		GameFrame}
	Crowd_PlayAnim Name = Crowd2 Anim = <Anim>
	Wait \{1
		GameFrame}
	Crowd_PlayAnim Name = crowd3 Anim = <Anim>
	Wait \{1
		GameFrame}
	Crowd_PlayAnim Name = crowd4 Anim = <Anim>
	Wait \{1
		GameFrame}
	Crowd_PlayAnim Name = crowd5 Anim = <Anim>
	Wait \{1
		GameFrame}
	Crowd_PlayAnim Name = crowd6 Anim = <Anim>
	Wait \{1
		GameFrame}
	Crowd_PlayAnim Name = crowd7 Anim = <Anim>
	Wait \{1
		GameFrame}
	Crowd_PlayAnim Name = crowd8 Anim = <Anim>
endscript

script Crowd_PlayAnim \{Name = crowd1
		Anim = IDLE}
	if NOT CompositeObjectExists <Name>
		return
	endif
	if StructureContains Structure = ($Crowd_Profiles) Name = <Name>
		anim_set = ($Crowd_Profiles.<Name>.anim_set)
		<Name> :Obj_KillSpawnedScript Name = crowd_play_adjusting_random_anims
		<Name> :Obj_SpawnScriptNow crowd_play_adjusting_random_anims Params = {anim_set = <anim_set> Anim = <Anim>}
	else
		Printf Channel = Crowd "animset not found for %a......" A = <Name>
	endif
endscript

script Crowd_Create_Lighters 
	GetPakManCurrent \{map = Zones}
	if (<pak> = Z_ArtDeco)
		return
	endif
	GetPakManCurrentName \{map = Zones}
	Index = 0
	begin
	if (<Index> < 10)
		FormatText ChecksumName = crowd_lighter '%s_LIGHTER_Geo0%a' S = <pakname> A = <Index>
	else
		FormatText ChecksumName = crowd_lighter '%s_LIGHTER_Geo%a' S = <pakname> A = <Index>
	endif
	if CompositeObjectExists Name = <crowd_lighter>
		<crowd_lighter> :Hide
	else
		if IsInNodeArray <crowd_lighter>
			if NOT IsCreated <crowd_lighter>
				Create Name = <crowd_lighter>
				if CompositeObjectExists Name = <crowd_lighter>
					<crowd_lighter> :Hide
				else
					Printf "failed to create lighter object %a! ...." A = <crowd_lighter>
				endif
			else
			endif
		else
		endif
	endif
	Index = (<Index> + 1)
	if (<Index> = 15)
		break
	endif
	repeat
endscript

script Crowd_ToggleLighters 
	GetPakManCurrentName \{map = Zones}
	Index = 0
	begin
	if (<Index> < 10)
		FormatText ChecksumName = crowd_lighter '%s_LIGHTER_Geo0%a' S = <pakname> A = <Index>
	else
		FormatText ChecksumName = crowd_lighter '%s_LIGHTER_Geo%a' S = <pakname> A = <Index>
	endif
	if CompositeObjectExists Name = <crowd_lighter>
		if GotParam \{ON}
			<crowd_lighter> :UnHide
		elseif GotParam \{OFF}
			<crowd_lighter> :Hide
		endif
	endif
	Index = (<Index> + 1)
	if (<Index> = 15)
		break
	endif
	repeat
endscript

script Crowd_StageDiver_Hide \{Index = 1}
	GetPakManCurrentName \{map = Zones}
	FormatText ChecksumName = STAGEDIVER '%s_TRG_Ped_StageDive0%a' S = <pakname> A = <Index>
	if CompositeObjectExists Name = <STAGEDIVER>
		<STAGEDIVER> :Hide
	endif
endscript

script Crowd_StageDiver_Jump \{Index = 1}
	GetPakManCurrentName \{map = Zones}
	FormatText ChecksumName = STAGEDIVER '%s_TRG_Ped_StageDive0%a' S = <pakname> A = <Index>
	if CompositeObjectExists Name = <STAGEDIVER>
		<STAGEDIVER> :UnHide
		GetPakManCurrent \{map = Zones}
		if StructureContains Structure = ($stagediver_anims) Name = <pak>
			Anims = ($stagediver_anims.<pak>)
		else
			Anims = ($stagediver_anims.DEFAULT)
		endif
		GetArraySize <Anims>
		GetRandomValue Name = anim_index Integer A = 0 B = (<array_Size> - 1)
		anim_name = (<Anims> [<anim_index>])
		Printf Channel = Crowd "Playing stagedive anim %a ....." A = <anim_name>
		<STAGEDIVER> :GameObj_PlayAnim Anim = <anim_name>
		<STAGEDIVER> :GameObj_WaitAnimFinished
		<STAGEDIVER> :Hide
	else
		Printf \{Channel = Crowd
			"Stagediver not found........."}
	endif
endscript
