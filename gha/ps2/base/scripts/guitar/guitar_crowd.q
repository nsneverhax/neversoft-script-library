current_crowd = 1.0
average_crowd = 1.0
total_crowd = 0.0
max_crowd = 0.0
crowd_scale = 2.0
health_scale = 2.0
crowd_debug_mode = 0
viewercam_nofail = 0
crowd_ped_camera_dist = 3.5
crowd_ped_camera_height = 1.07
crowd_ped_camera_fov = 21

script crowd_reset 
	if ($game_mode = tutorial)
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
			BG_Crowd_Front_End_Silence \{immediate = 1}
		elseif ($end_credits = 1 ||
				GetNodeFlag LS_ENCORE_POST)

			Change_Crowd_Looping_SFX \{crowd_looping_state = good}
		else

			Change_Crowd_Looping_SFX \{crowd_looping_state = neutral}
		endif
	endif
	if GetNodeFlag \{LS_ENCORE_POST}
		if NOT ($game_mode = p2_battle)
			Change structurename = <player_status> current_health = 1.6666
		else
			Change structurename = <player_status> current_health = 1.0
		endif
	else
		Change structurename = <player_status> current_health = 1.0
	endif
	if ($game_mode = p2_battle && $battle_sudden_death = 1)
		Change structurename = <player_status> current_health = ($<player_status>.save_health)
	endif
	CrowdReset
endscript

script forcescore 
	switch $debug_forcescore
		case poor
		health = ($health_poor_medium / 2)
		case medium
		health = (($health_poor_medium + $health_medium_good) / 2)
		case good
		health = (($health_medium_good + $health_scale) / 2)
		default
		health = ($health_poor_medium / 2)
	endswitch
	Change structurename = <player_status> current_health = <health>
	Change current_crowd = <health>
endscript
z_maxskc_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		skeletonname = gh3_ped_skinny
		id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_maxskc/z_maxskc.tex`
		AssetContext = z_maxskc
		TriggerScript = z_maxskc_crowd_peds
		params = {
			Name = crowd1
		}
	}
	{
		Name = crowd2
		Camera = crowd2_cam
		Model = 'Real_Crowd\\Crowd_Pedf_1.skin'
		skeletonname = gh3_ped_skinny
		id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_maxskc/z_maxskc.tex`
		AssetContext = z_maxskc
		TriggerScript = z_maxskc_crowd_peds
		params = {
			Name = crowd2
		}
	}
	{
		Name = crowd3
		Camera = crowd3_cam
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		skeletonname = GH3_ped
		id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_maxskc/z_maxskc.tex`
		AssetContext = z_maxskc
		TriggerScript = z_maxskc_crowd_peds
		params = {
			Name = crowd3
		}
	}
	{
		Name = crowd4
		Camera = crowd4_cam
		Model = 'Real_Crowd\\Crowd_Pedf_2.skin'
		skeletonname = GH3_ped
		id = crowd4_cam_viewport
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_maxskc/z_maxskc.tex`
		AssetContext = z_maxskc
		TriggerScript = z_maxskc_crowd_peds
		params = {
			Name = crowd4
		}
	}
]
z_fenway_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_fenway/z_fenway.tex`
		AssetContext = z_fenway
		TriggerScript = z_fenway_crowd_peds
		params = {
			Name = crowd1
		}
	}
	{
		Name = crowd2
		Camera = crowd2_cam
		Model = 'Real_Crowd\\Crowd_Pedf_1.skin'
		id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_fenway/z_fenway.tex`
		AssetContext = z_fenway
		TriggerScript = z_fenway_crowd_peds
		param = {
			Name = crowd2
		}
	}
	{
		Name = crowd3
		Camera = crowd3_cam
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_fenway/z_fenway.tex`
		AssetContext = z_fenway
		TriggerScript = z_fenway_crowd_peds
		params = {
			Name = crowd3
		}
	}
	{
		Name = crowd4
		Camera = crowd4_cam
		Model = 'Real_Crowd\\Crowd_Pedf_2.skin'
		id = crowd4_cam_viewport
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_fenway/z_fenway.tex`
		AssetContext = z_fenway
		TriggerScript = z_fenway_crowd_peds
		param = {
			Name = crowd4
		}
	}
]
z_hof_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_hof/z_hof.tex`
		AssetContext = z_hof
		TriggerScript = z_hof_crowd_peds
		params = {
			Name = crowd1
		}
	}
	{
		Name = crowd2
		Camera = crowd2_cam
		Model = 'Real_Crowd\\Crowd_Pedf_1.skin'
		id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_hof/z_hof.tex`
		AssetContext = z_hof
		TriggerScript = z_hof_crowd_peds
		params = {
			Name = crowd2
		}
	}
	{
		Name = crowd3
		Camera = crowd3_cam
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_hof/z_hof.tex`
		AssetContext = z_hof
		TriggerScript = z_hof_crowd_peds
		params = {
			Name = crowd3
		}
	}
	{
		Name = crowd4
		Camera = crowd4_cam
		Model = 'Real_Crowd\\Crowd_Pedf_2.skin'
		id = crowd4_cam_viewport
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_hof/z_hof.tex`
		AssetContext = z_hof
		TriggerScript = z_hof_crowd_peds
		params = {
			Name = crowd4
		}
	}
]
z_nipmuc_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_nipmuc/z_nipmuc.tex`
		AssetContext = z_nipmuc
		TriggerScript = z_nipmuc_crowd_peds
		params = {
			Name = crowd1
		}
	}
	{
		Name = crowd2
		Camera = crowd2_cam
		Model = 'Real_Crowd\\Crowd_Pedf_1.skin'
		id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_nipmuc/z_nipmuc.tex`
		AssetContext = z_nipmuc
		TriggerScript = z_nipmuc_crowd_peds
		params = {
			Name = crowd2
		}
	}
	{
		Name = crowd3
		Camera = crowd3_cam
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_nipmuc/z_nipmuc.tex`
		AssetContext = z_nipmuc
		TriggerScript = z_nipmuc_crowd_peds
		params = {
			Name = crowd3
		}
	}
	{
		Name = crowd4
		Camera = crowd4_cam
		Model = 'Real_Crowd\\Crowd_Pedf_2.skin'
		id = crowd4_cam_viewport
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_nipmuc/z_nipmuc.tex`
		AssetContext = z_nipmuc
		TriggerScript = z_nipmuc_crowd_peds
		params = {
			Name = crowd4
		}
	}
]
z_jpplay_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_jpplay/z_jpplay.tex`
		AssetContext = z_jpplay
		TriggerScript = z_jpplay_crowd_peds
		params = {
			Name = crowd1
		}
	}
	{
		Name = crowd2
		Camera = crowd2_cam
		Model = 'Real_Crowd\\Crowd_Pedf_1.skin'
		id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_jpplay/z_jpplay.tex`
		AssetContext = z_jpplay
		TriggerScript = z_jpplay_crowd_peds
		params = {
			Name = crowd2
		}
	}
	{
		Name = crowd3
		Camera = crowd3_cam
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_jpplay/z_jpplay.tex`
		AssetContext = z_jpplay
		TriggerScript = z_jpplay_crowd_peds
		params = {
			Name = crowd3
		}
	}
	{
		Name = crowd4
		Camera = crowd4_cam
		Model = 'Real_Crowd\\Crowd_Pedf_2.skin'
		id = crowd4_cam_viewport
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_jpplay/z_jpplay.tex`
		AssetContext = z_jpplay
		TriggerScript = z_jpplay_crowd_peds
		params = {
			Name = crowd4
		}
	}
]
z_wikker_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_wikker/z_wikker.tex`
		AssetContext = z_wikker
		TriggerScript = Z_Wikker_Crowd_Peds
		params = {
			Name = crowd1
		}
	}
	{
		Name = crowd2
		Camera = crowd2_cam
		Model = 'Real_Crowd\\Crowd_PedF_1.skin'
		id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_wikker/z_wikker.tex`
		AssetContext = z_wikker
		TriggerScript = Z_Wikker_Crowd_Peds
		params = {
			Name = crowd2
		}
	}
	{
		Name = crowd3
		Camera = crowd3_cam
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_wikker/z_wikker.tex`
		AssetContext = z_wikker
		TriggerScript = Z_Wikker_Crowd_Peds
		params = {
			Name = crowd3
		}
	}
	{
		Name = crowd4
		Camera = crowd4_cam
		Model = 'Real_Crowd\\Crowd_PedF_2.skin'
		id = crowd4_cam_viewport
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_wikker/z_wikker.tex`
		AssetContext = z_wikker
		TriggerScript = Z_Wikker_Crowd_Peds
		params = {
			Name = crowd4
		}
	}
]
z_dive_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_dive/z_dive.tex`
		AssetContext = z_dive
		TriggerScript = Z_dive_Crowd_Peds
		params = {
			Name = crowd1
		}
	}
	{
		Name = crowd2
		Camera = crowd2_cam
		Model = 'Real_Crowd\\Crowd_PedF_1.skin'
		id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_dive/z_dive.tex`
		AssetContext = z_dive
		TriggerScript = Z_dive_Crowd_Peds
		params = {
			Name = crowd2
		}
	}
	{
		Name = crowd3
		Camera = crowd3_cam
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_dive/z_dive.tex`
		AssetContext = z_dive
		TriggerScript = Z_dive_Crowd_Peds
		params = {
			Name = crowd3
		}
	}
	{
		Name = crowd4
		Camera = crowd4_cam
		Model = 'Real_Crowd\\Crowd_PedF_2.skin'
		id = crowd4_cam_viewport
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_dive/z_dive.tex`
		AssetContext = z_dive
		TriggerScript = Z_dive_Crowd_Peds
		params = {
			Name = crowd4
		}
	}
]
z_artdeco_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_artdeco/z_artdeco.tex`
		AssetContext = z_artdeco
		TriggerScript = Z_artdeco_Crowd_Peds
		params = {
			Name = crowd1
		}
	}
	{
		Name = crowd2
		Camera = crowd2_cam
		Model = 'Real_Crowd\\Crowd_PedF_1.skin'
		id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_artdeco/z_artdeco.tex`
		AssetContext = z_artdeco
		TriggerScript = Z_artdeco_Crowd_Peds
		params = {
			Name = crowd2
		}
	}
	{
		Name = crowd3
		Camera = crowd3_cam
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_artdeco/z_artdeco.tex`
		AssetContext = z_artdeco
		TriggerScript = Z_artdeco_Crowd_Peds
		params = {
			Name = crowd3
		}
	}
	{
		Name = crowd4
		Camera = crowd4_cam
		Model = 'Real_Crowd\\Crowd_PedF_2.skin'
		id = crowd4_cam_viewport
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_artdeco/z_artdeco.tex`
		AssetContext = z_artdeco
		TriggerScript = Z_artdeco_Crowd_Peds
		params = {
			Name = crowd4
		}
	}
]
z_prison_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		Model = 'Real_Crowd\\Crowd_Prison_01.skin'
		id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_prison/z_prison.tex`
		AssetContext = z_prison
		TriggerScript = Z_prison_Crowd_Peds
		params = {
			Name = crowd1
		}
	}
	{
		Name = crowd2
		Camera = crowd2_cam
		Model = 'Real_Crowd\\Crowd_Prison_02.skin'
		id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_prison/z_prison.tex`
		AssetContext = z_prison
		TriggerScript = Z_prison_Crowd_Peds
		params = {
			Name = crowd2
		}
	}
	{
		Name = crowd3
		Camera = crowd3_cam
		Model = 'Real_Crowd\\Crowd_Prison_01.skin'
		id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_prison/z_prison.tex`
		AssetContext = z_prison
		TriggerScript = Z_prison_Crowd_Peds
		params = {
			Name = crowd3
		}
	}
	{
		Name = crowd4
		Camera = crowd4_cam
		Model = 'Real_Crowd\\Crowd_Prison_02.skin'
		id = crowd4_cam_viewport
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_prison/z_prison.tex`
		AssetContext = z_prison
		TriggerScript = Z_prison_Crowd_Peds
		params = {
			Name = crowd4
		}
	}
]
z_party_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_party/z_party.tex`
		AssetContext = z_party
		TriggerScript = Z_Party_Crowd_Peds
		params = {
			Name = crowd1
		}
	}
	{
		Name = crowd2
		Camera = crowd2_cam
		Model = 'Real_Crowd\\Crowd_PedF_1.skin'
		id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_party/z_party.tex`
		AssetContext = z_party
		TriggerScript = Z_Party_Crowd_Peds
		params = {
			Name = crowd2
		}
	}
	{
		Name = crowd3
		Camera = crowd3_cam
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_party/z_party.tex`
		AssetContext = z_party
		TriggerScript = Z_Party_Crowd_Peds
		params = {
			Name = crowd3
		}
	}
	{
		Name = crowd4
		Camera = crowd4_cam
		Model = 'Real_Crowd\\Crowd_PedF_2.skin'
		id = crowd4_cam_viewport
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_party/z_party.tex`
		AssetContext = z_party
		TriggerScript = Z_Party_Crowd_Peds
		params = {
			Name = crowd4
		}
	}
]
z_hell_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		Model = 'Real_Crowd\\Crowd_Biker_01.skin'
		id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_hell/z_hell.tex`
		AssetContext = z_hell
		TriggerScript = Z_Hell_Crowd_Peds
		params = {
			Name = crowd1
		}
	}
	{
		Name = crowd2
		Camera = crowd2_cam
		Model = 'Real_Crowd\\Crowd_Biker_02.skin'
		id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_hell/z_hell.tex`
		AssetContext = z_hell
		TriggerScript = Z_Hell_Crowd_Peds
		params = {
			Name = crowd2
		}
	}
	{
		Name = crowd3
		Camera = crowd3_cam
		Model = 'Real_Crowd\\Crowd_Biker_01.skin'
		id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_hell/z_hell.tex`
		AssetContext = z_hell
		TriggerScript = Z_Hell_Crowd_Peds
		params = {
			Name = crowd3
		}
	}
	{
		Name = crowd4
		Camera = crowd4_cam
		Model = 'Real_Crowd\\Crowd_Biker_02.skin'
		id = crowd4_cam_viewport
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_hell/z_hell.tex`
		AssetContext = z_hell
		TriggerScript = Z_Hell_Crowd_Peds
		params = {
			Name = crowd4
		}
	}
]
0x63dd9d85 = [
	{
		Name = crowd1
		Camera = crowd1_cam
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		0xc573fc3d = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_Budokan/z_Budokan.tex`
		AssetContext = z_budokan
		TriggerScript = Z_Budokan_Crowd_Peds
		params = {
			Name = crowd1
		}
	}
	{
		Name = crowd2
		Camera = crowd2_cam
		Model = 'Real_Crowd\\Crowd_PedF_1.skin'
		id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		0xc573fc3d = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_Budokan/z_Budokan.tex`
		AssetContext = z_budokan
		TriggerScript = Z_Budokan_Crowd_Peds
		params = {
			Name = crowd2
		}
	}
]
z_Budokan_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_Budokan/z_Budokan.tex`
		AssetContext = z_budokan
		TriggerScript = Z_Budokan_Crowd_Peds
		params = {
			Name = crowd1
		}
	}
	{
		Name = crowd2
		Camera = crowd2_cam
		Model = 'Real_Crowd\\Crowd_PedF_1.skin'
		id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_Budokan/z_Budokan.tex`
		AssetContext = z_budokan
		TriggerScript = Z_Budokan_Crowd_Peds
		params = {
			Name = crowd2
		}
	}
	{
		Name = crowd3
		Camera = crowd3_cam
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_Budokan/z_Budokan.tex`
		AssetContext = z_budokan
		TriggerScript = Z_Budokan_Crowd_Peds
		params = {
			Name = crowd3
		}
	}
	{
		Name = crowd4
		Camera = crowd4_cam
		Model = 'Real_Crowd\\Crowd_PedF_2.skin'
		id = crowd4_cam_viewport
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_Budokan/z_Budokan.tex`
		AssetContext = z_budokan
		TriggerScript = Z_Budokan_Crowd_Peds
		params = {
			Name = crowd4
		}
	}
]
z_video_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_video/z_video.tex`
		AssetContext = z_video
		TriggerScript = Z_Video_Crowd_Peds
		params = {
			Name = crowd1
		}
	}
	{
		Name = crowd2
		Camera = crowd2_cam
		Model = 'Real_Crowd\\Crowd_PedF_1.skin'
		id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_video/z_video.tex`
		AssetContext = z_video
		TriggerScript = Z_Video_Crowd_Peds
		params = {
			Name = crowd2
		}
	}
	{
		Name = crowd3
		Camera = crowd3_cam
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_video/z_video.tex`
		AssetContext = z_video
		TriggerScript = Z_Video_Crowd_Peds
		params = {
			Name = crowd3
		}
	}
	{
		Name = crowd4
		Camera = crowd4_cam
		Model = 'Real_Crowd\\Crowd_PedF_2.skin'
		id = crowd4_cam_viewport
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_video/z_video.tex`
		AssetContext = z_video
		TriggerScript = Z_Video_Crowd_Peds
		params = {
			Name = crowd4
		}
	}
]
z_nine_lives_crowd_models = [
	{
		Name = crowd1
		Camera = crowd1_cam
		Model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/Demo/tw_billboard01.dds`
		texdict = `zones/z_nine_lives/z_nine_lives.tex`
		AssetContext = z_nine_lives
		TriggerScript = z_nine_lives_crowd_peds
		params = {
			Name = crowd1
		}
	}
	{
		Name = crowd2
		Camera = crowd2_cam
		Model = 'Real_Crowd\\Crowd_Pedf_1.skin'
		id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/Demo/tw_billboard02.dds`
		texdict = `zones/z_nine_lives/z_nine_lives.tex`
		AssetContext = z_nine_lives
		TriggerScript = z_nine_lives_crowd_peds
		params = {
			Name = crowd2
		}
	}
	{
		Name = crowd3
		Camera = crowd3_cam
		Model = 'Real_Crowd\\Crowd_Ped_03.skin'
		id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/Demo/tw_billboard03.dds`
		texdict = `zones/z_nine_lives/z_nine_lives.tex`
		AssetContext = z_nine_lives
		TriggerScript = z_nine_lives_crowd_peds
		params = {
			Name = crowd3
		}
	}
	{
		Name = crowd4
		Camera = crowd4_cam
		Model = 'Real_Crowd\\Crowd_Pedf_2.skin'
		id = crowd4_cam_viewport
		texture = viewport4
		textureasset = `tex/zones/Demo/tw_billboard04.dds`
		texdict = `zones/z_nine_lives/z_nine_lives.tex`
		AssetContext = z_nine_lives
		TriggerScript = z_nine_lives_crowd_peds
		params = {
			Name = crowd4
		}
	}
]

script create_crowd_models 
	if ($disable_crowd = 1)
		return
	endif
	GetPakManCurrentName \{map = zones}
	formatText checksumName = crowd_models '%s_crowd_models' s = <pakname>
	if ($current_num_players = 2)
		formatText checksumName = 0xddd70000 '%s_crowd_models_2p' s = <pakname>
		if GlobalExists Name = <0xddd70000>
			crowd_models = <0xddd70000>
		endif
	endif

	if NOT GlobalExists Name = <crowd_models>

		return
	endif

	Change crowd_model_array = <crowd_models>
	GetArraySize $<crowd_models>
	array_count = 0
	begin
	Pos = ((-500.0, -200.0, 0.0) + (0.0, -100.0, 0.0) * <array_count>)
	viewport = ($<crowd_models> [<array_count>].id)
	Camera = ($<crowd_models> [<array_count>].Camera)
	if NOT StructureContains structure = ($<crowd_models> [<array_count>]) remap_only
		MemPushContext \{BottomUpHeap}
		CreateFromStructure {
			spouse = <viewport>
			Pos = <Pos>
			Quat = (0.0, 1.0, 0.0)
			Class = GameObject
			Type = Ghost
			CreatedAtStart
			Profile = $Profile_Ped_Crowd_Obj
			($<crowd_models> [<array_count>])
			SuspendDistance = 0
			lod_dist1 = 400
			lod_dist2 = 401
			LightGroup = Crowd
			object_type = Crowd
			ProfileColor = 49344
			profilebudget = 200
			use_jq
		}
		model_id = ($<crowd_models> [<array_count>].Name)
		extra_model = 'Real_Crowd\\Crowd_HandL_Lighter.skin'
		<model_id> :AddGeom lhand_lighter Model = <extra_model> LightGroup = Crowd spouse = <viewport>
		extra_model = 'Real_Crowd\\Crowd_HandL_Rock.skin'
		<model_id> :AddGeom lhand_rock Model = <extra_model> LightGroup = Crowd spouse = <viewport>
		extra_model = 'Real_Crowd\\Crowd_HandL_Clap.skin'
		<model_id> :AddGeom lhand_clap Model = <extra_model> LightGroup = Crowd spouse = <viewport>
		extra_model = 'Real_Crowd\\Crowd_HandR_Lighter.skin'
		<model_id> :AddGeom rhand_lighter Model = <extra_model> LightGroup = Crowd spouse = <viewport>
		extra_model = 'Real_Crowd\\Crowd_HandR_Rock.skin'
		<model_id> :AddGeom rhand_rock Model = <extra_model> LightGroup = Crowd spouse = <viewport>
		extra_model = 'Real_Crowd\\Crowd_HandR_Clap.skin'
		<model_id> :AddGeom rhand_clap Model = <extra_model> LightGroup = Crowd spouse = <viewport>
		extra_model = 'Real_Crowd\\Crowd_HandR_Fist.skin'
		<model_id> :AddGeom rhand_fist Model = <extra_model> LightGroup = Crowd spouse = <viewport>
		<model_id> :SwitchOffAtomic lhand_lighter
		<model_id> :SwitchOffAtomic lhand_rock
		<model_id> :SwitchOnAtomic lhand_clap
		<model_id> :SwitchOffAtomic rhand_lighter
		<model_id> :SwitchOffAtomic rhand_rock
		<model_id> :SwitchOffAtomic rhand_fist
		<model_id> :SwitchOnAtomic rhand_clap
		if StructureContains structure = ($<crowd_models> [<array_count>]) roty
			($<crowd_models> [<array_count>].Name) :Obj_SetOrientation y = ($<crowd_models> [<array_count>].roty)
			apply_correction = 0
		else
			apply_correction = 1
		endif
		MemPopContext \{BottomUpHeap}
		style = imposter_rendering
		if (<array_Size> <= 6)
			if isXenon
				style = imposter_rendering_highres
			endif
		endif
		CreateScreenElement {
			parent = root_window
			just = [center center]
			Type = ViewportElement
			id = <viewport>
			texture = ($<crowd_models> [<array_count>].texture)
			Pos = (2000.0, 200.0)
			dims = (64.0, 64.0)
			alpha = 1
			style = <style>
		}
		CreateCompositeObjectInstance {
			Priority = $COIM_Priority_Permanent
			Heap = Generic
			components = [
				{component = Camera}
			]
			params = {
				Name = <Camera>
				viewport = <viewport>
				object_type = Crowd
				ProfileColor = 12632064
				profilebudget = 10
				use_jq
				far_clip = 20
			}
		}
		SetActiveCamera viewport = <viewport> id = <Camera>
		<Camera> :SetHFOV hfov = $crowd_ped_camera_fov
		SetViewportProperties viewport = <viewport> no_resolve_depthstencilbuffer = true
		AddCrowdModelCam Camera = <Camera> Pos = <Pos> viewport = <viewport> apply_correction = <apply_correction>
	endif
	SetSearchAllAssetContexts
	CreateViewportTextureOverride {
		id = <viewport>
		viewportid = <viewport>
		texture = ($<crowd_models> [<array_count>].textureasset)
		texdict = ($<crowd_models> [<array_count>].texdict)
	}
	SetSearchAllAssetContexts \{OFF}
	GetPlatform
	if (<Platform> = PS2)
		SetViewportProperties viewport = <viewport> Priority = 10.0
	endif
	<array_count> = (<array_count> + 1)
	repeat <array_Size>

endscript

script update_crowd_model_cam 
	crowd_scaler = 25
	begin
	GetViewportCameraOrient \{viewport = bg_viewport}
	GetVectorComponents <at>
	angle = (<X> * <crowd_scaler>)
	RotateVector vector = <at> ry = <angle>
	at = <result_vector>
	RotateVector vector = <left> ry = <angle>
	left = <result_vector>
	RotateVector vector = <up> ry = <angle>
	up = <result_vector>
	posdir = (<model_pos> + (0.0, 1.0, 0.0) + (<at> * 3.5))
	<Camera> :Obj_SetPosition position = <posdir>
	<Camera> :Obj_SetOrientation Dir = <at> Only handles upright cameras
	SetViewportCameraOrient viewport = <viewport> at = <at> left = <left> up = <up>
	<Camera> :Unpause
	WaitOneGameFrame
	repeat
endscript

script destroy_crowd_models 
	ClearCrowdModelCams
	crowd_models = $crowd_model_array
	if (<crowd_models> = None)
		return
	endif
	GetArraySize <crowd_models>
	array_count = 0
	begin
	if NOT StructureContains structure = (<crowd_models> [<array_count>]) remap_only
		KillSpawnedScript \{Name = update_crowd_model_cam}
		if CompositeObjectExists Name = (<crowd_models> [<array_count>].Camera)
			(<crowd_models> [<array_count>].Camera) :Die
		endif
		if ScreenElementExists id = (<crowd_models> [<array_count>].id)
			SetSearchAllAssetContexts
			DestroyViewportTextureOverride id = (<crowd_models> [<array_count>].id)
			SetSearchAllAssetContexts \{OFF}
			DestroyScreenElement id = (<crowd_models> [<array_count>].id)
		endif
		if CompositeObjectExists Name = (<crowd_models> [<array_count>].Name)
			(<crowd_models> [<array_count>].Name) :Die
		endif
	endif
	<array_count> = (<array_count> + 1)
	repeat <array_Size>
	Change \{crowd_model_array = None}
endscript

script set_crowd_hand \{hand = left
		Type = clap}
	Obj_GetID
	Name = <objID>
	if (<hand> = left)
		switch (<Type>)
			case lighter
			part = lhand_lighter
			case rock
			part = lhand_rock
			case clap
			part = lhand_clap
			case fist
			return
			default
			return
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
			case rock
			part = rhand_rock
			case clap
			part = rhand_clap
			case fist
			part = rhand_fist
			default
			return
		endswitch
		<Name> :SwitchOffAtomic rhand_lighter
		<Name> :SwitchOffAtomic rhand_rock
		<Name> :SwitchOffAtomic rhand_clap
		<Name> :SwitchOffAtomic rhand_fist
		<Name> :SwitchOnAtomic <part>
	endif
endscript

script Crowd_SetHand \{Name = crowd1
		hand = left
		Type = clap}
	if CompositeObjectExists <Name>
		<Name> :set_crowd_hand hand = <hand> Type = <Type>
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
	if (<skill> != bad)
		if (<lighters_on> = FALSE)
			Crowd_AllSetHand \{hand = right
				Type = lighter}
			Crowd_AllPlayAnim \{anim = special}
			lighters_on = true
			Crowd_ToggleLighters \{On}
		endif
	else
		if (<lighters_on> = true)
			Crowd_AllSetHand \{hand = right
				Type = clap}
			Crowd_AllPlayAnim \{anim = Idle}
			lighters_on = FALSE
			Crowd_ToggleLighters \{OFF}
		endif
	endif
	WaitOneGameFrame
	repeat
endscript

script Crowd_StopLighters 
	KillSpawnedScript \{Name = crowd_monitor_performance}
	Crowd_AllSetHand \{hand = right
		Type = clap}
	Crowd_AllPlayAnim \{anim = Idle}
	Crowd_ToggleLighters \{OFF}
endscript

script Crowd_AllSetHand 
	Crowd_SetHand Name = crowd1 hand = <hand> Type = <Type>
	Crowd_SetHand Name = crowd2 hand = <hand> Type = <Type>
	Crowd_SetHand Name = crowd3 hand = <hand> Type = <Type>
	Crowd_SetHand Name = crowd4 hand = <hand> Type = <Type>
	Crowd_SetHand Name = crowd5 hand = <hand> Type = <Type>
	Crowd_SetHand Name = crowd6 hand = <hand> Type = <Type>
	Crowd_SetHand Name = crowd7 hand = <hand> Type = <Type>
	Crowd_SetHand Name = crowd8 hand = <hand> Type = <Type>
endscript

script Crowd_AllPlayAnim 
	WaitOneGameFrame
	Crowd_PlayAnim Name = crowd1 anim = <anim>
	WaitOneGameFrame
	Crowd_PlayAnim Name = crowd2 anim = <anim>
	WaitOneGameFrame
	Crowd_PlayAnim Name = crowd3 anim = <anim>
	WaitOneGameFrame
	Crowd_PlayAnim Name = crowd4 anim = <anim>
	WaitOneGameFrame
	Crowd_PlayAnim Name = crowd5 anim = <anim>
	WaitOneGameFrame
	Crowd_PlayAnim Name = crowd6 anim = <anim>
	WaitOneGameFrame
	Crowd_PlayAnim Name = crowd7 anim = <anim>
	WaitOneGameFrame
	Crowd_PlayAnim Name = crowd8 anim = <anim>
endscript

script Crowd_PlayAnim \{Name = crowd1
		anim = Idle}
	if NOT CompositeObjectExists <Name>
		return
	endif
	if StructureContains structure = ($Crowd_Profiles) Name = <Name>
		anim_set = ($Crowd_Profiles.<Name>.anim_set)
		<Name> :Obj_KillSpawnedScript Name = crowd_play_adjusting_random_anims
		<Name> :Obj_SpawnScriptNow crowd_play_adjusting_random_anims params = {anim_set = <anim_set> anim = <anim>}
	else

	endif
endscript

script Crowd_Create_Lighters 
	GetPakManCurrent \{map = zones}
	if (<pak> = z_artdeco)
		return
	endif
	GetPakManCurrentName \{map = zones}
	index = 0
	begin
	if (<index> < 10)
		formatText checksumName = crowd_lighter '%s_LIGHTER_Geo0%a' s = <pakname> a = <index>
	else
		formatText checksumName = crowd_lighter '%s_LIGHTER_Geo%a' s = <pakname> a = <index>
	endif
	if CompositeObjectExists Name = <crowd_lighter>
		<crowd_lighter> :Hide
	else
		if IsInNodeArray <crowd_lighter>
			if NOT IsCreated <crowd_lighter>
				create Name = <crowd_lighter>
				if CompositeObjectExists Name = <crowd_lighter>
					<crowd_lighter> :Hide
				else

				endif
			else
			endif
		else
		endif
	endif
	index = (<index> + 1)
	if (<index> = 15)
		break
	endif
	repeat
endscript

script Crowd_ToggleLighters 
	GetPakManCurrentName \{map = zones}
	index = 0
	begin
	if (<index> < 10)
		formatText checksumName = crowd_lighter '%s_LIGHTER_Geo0%a' s = <pakname> a = <index>
	else
		formatText checksumName = crowd_lighter '%s_LIGHTER_Geo%a' s = <pakname> a = <index>
	endif
	if CompositeObjectExists Name = <crowd_lighter>
		if GotParam \{On}
			<crowd_lighter> :unhide
		elseif GotParam \{OFF}
			<crowd_lighter> :Hide
		endif
	endif
	index = (<index> + 1)
	if (<index> = 15)
		break
	endif
	repeat
endscript

script Crowd_StageDiver_Hide \{index = 1}
	GetPakManCurrentName \{map = zones}
	formatText checksumName = stagediver '%s_TRG_Ped_StageDive0%a' s = <pakname> a = <index>
	if CompositeObjectExists Name = <stagediver>
		<stagediver> :Hide
	endif
endscript

script Crowd_StageDiver_Jump \{index = 1}
	GetPakManCurrentName \{map = zones}
	formatText checksumName = stagediver '%s_TRG_Ped_StageDive0%a' s = <pakname> a = <index>
	if CompositeObjectExists Name = <stagediver>
		<stagediver> :unhide
		GetPakManCurrent \{map = zones}
		if StructureContains structure = ($stagediver_anims) Name = <pak>
			anims = ($stagediver_anims.<pak>)
		else
			anims = ($stagediver_anims.Default)
		endif
		GetArraySize <anims>
		GetRandomValue Name = anim_index integer a = 0 b = (<array_Size> - 1)
		anim_name = (<anims> [<anim_index>])

		<stagediver> :GameObj_PlayAnim anim = <anim_name>
		<stagediver> :GameObj_WaitAnimFinished
		<stagediver> :Hide
	else

	endif
endscript
