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
	if getnodeflag \{ls_encore_post}
		change \{current_crowd = 1.6666}
		change \{average_crowd = 1.6666}
	else
		change \{current_crowd = 1.0}
		change \{average_crowd = 1.0}
	endif
	change \{total_crowd = 0.0}
	change \{max_crowd = 0.0}
	change \{last_time_in_lead = 0.0}
	change \{last_time_in_lead_player = -1}
	if (<player> = 1)
		stopsoundevent \{$currentlyplayingoneshotsoundevent}
		if ($game_mode = training)
			bg_crowd_front_end_silence \{immediate = 1}
		elseif ($end_credits = 1 ||
				getnodeflag ls_encore_post)
			printf \{channel = sfx
				"crowd_reset LS_ENCORE_POST"}
			change_crowd_looping_sfx \{crowd_looping_state = good}
		else
			printf \{channel = sfx
				"NOT - crowd_reset LS_ENCORE_POST"}
			change_crowd_looping_sfx \{crowd_looping_state = neutral}
		endif
	endif
	if getnodeflag \{ls_encore_post}
		if NOT ($game_mode = p2_battle)
			change structurename = <player_status> current_health = 1.6666
		else
			change structurename = <player_status> current_health = 1.0
		endif
	else
		change structurename = <player_status> current_health = 1.0
	endif
	if ($game_mode = p2_battle && $battle_sudden_death = 1)
		change structurename = <player_status> current_health = ($<player_status>.save_health)
	endif
	crowdreset
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
	change structurename = <player_status> current_health = <health>
	change current_crowd = <health>
endscript
z_maxskc_crowd_models = [
	{
		name = crowd1
		camera = crowd1_cam
		model = 'Real_Crowd\\Crowd_Ped_01.skin'
		skeletonname = gh3_ped_skinny
		id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/demo/tw_billboard01.dds`
		texdict = `zones/z_maxskc/z_maxskc.tex`
		assetcontext = z_maxskc
		triggerscript = z_maxskc_crowd_peds
		params = {
			name = crowd1
		}
	}
	{
		name = crowd2
		camera = crowd2_cam
		model = 'Real_Crowd\\Crowd_Ped_02.skin'
		skeletonname = gh3_ped_skinny
		id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/demo/tw_billboard02.dds`
		texdict = `zones/z_maxskc/z_maxskc.tex`
		assetcontext = z_maxskc
		triggerscript = z_maxskc_crowd_peds
		params = {
			name = crowd2
		}
	}
	{
		name = crowd3
		camera = crowd3_cam
		model = 'Real_Crowd\\Crowd_Ped_03.skin'
		skeletonname = gh3_ped_skinny
		id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/demo/tw_billboard03.dds`
		texdict = `zones/z_maxskc/z_maxskc.tex`
		assetcontext = z_maxskc
		triggerscript = z_maxskc_crowd_peds
		params = {
			name = crowd3
		}
	}
	{
		name = crowd4
		camera = crowd4_cam
		model = 'Real_Crowd\\Crowd_Ped_04.skin'
		skeletonname = gh3_ped_skinny
		id = crowd4_cam_viewport
		texture = viewport4
		textureasset = `tex/zones/demo/tw_billboard04.dds`
		texdict = `zones/z_maxskc/z_maxskc.tex`
		assetcontext = z_maxskc
		triggerscript = z_maxskc_crowd_peds
		params = {
			name = crowd4
		}
	}
	{
		name = crowd5
		camera = crowd5_cam
		model = 'Real_Crowd\\crowd_pedF_1.skin'
		skeletonname = gh3_ped_skinny
		id = crowd5_cam_viewport
		texture = viewport5
		textureasset = `tex/zones/demo/tw_billboard05.dds`
		texdict = `zones/z_maxskc/z_maxskc.tex`
		assetcontext = z_maxskc
		triggerscript = z_maxskc_crowd_peds
		params = {
			name = crowd5
		}
	}
	{
		name = crowd6
		camera = crowd6_cam
		model = 'Real_Crowd\\crowd_pedF_2.skin'
		skeletonname = gh3_ped_skinny
		id = crowd6_cam_viewport
		texture = viewport6
		textureasset = `tex/zones/demo/tw_billboard06.dds`
		texdict = `zones/z_maxskc/z_maxskc.tex`
		assetcontext = z_maxskc
		triggerscript = z_maxskc_crowd_peds
		params = {
			name = crowd6
		}
	}
]
z_fenway_crowd_models = [
	{
		name = crowd1
		camera = crowd1_cam
		model = 'Real_Crowd\\Crowd_Ped_01.skin'
		skeletonname = gh3_ped_skinny
		id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/demo/tw_billboard01.dds`
		texdict = `zones/z_fenway/z_fenway.tex`
		assetcontext = z_fenway
		triggerscript = z_fenway_crowd_peds
		params = {
			name = crowd1
		}
	}
	{
		name = crowd2
		camera = crowd2_cam
		model = 'Real_Crowd\\Crowd_Ped_02.skin'
		skeletonname = gh3_ped_skinny
		id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/demo/tw_billboard02.dds`
		texdict = `zones/z_fenway/z_fenway.tex`
		assetcontext = z_fenway
		triggerscript = z_fenway_crowd_peds
		param = {
			name = crowd2
		}
	}
	{
		name = crowd3
		camera = crowd3_cam
		model = 'Real_Crowd\\Crowd_Ped_03.skin'
		skeletonname = gh3_ped_skinny
		id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/demo/tw_billboard03.dds`
		texdict = `zones/z_fenway/z_fenway.tex`
		assetcontext = z_fenway
		triggerscript = z_fenway_crowd_peds
		params = {
			name = crowd3
		}
	}
	{
		name = crowd4
		camera = crowd4_cam
		model = 'Real_Crowd\\Crowd_Ped_04.skin'
		skeletonname = gh3_ped_skinny
		id = crowd4_cam_viewport
		texture = viewport4
		textureasset = `tex/zones/demo/tw_billboard04.dds`
		texdict = `zones/z_fenway/z_fenway.tex`
		assetcontext = z_fenway
		triggerscript = z_fenway_crowd_peds
		param = {
			name = crowd4
		}
	}
	{
		name = crowd5
		camera = crowd5_cam
		model = 'Real_Crowd\\crowd_pedF_1.skin'
		skeletonname = gh3_ped_skinny
		id = crowd5_cam_viewport
		texture = viewport5
		textureasset = `tex/zones/demo/tw_billboard05.dds`
		texdict = `zones/z_fenway/z_fenway.tex`
		assetcontext = z_fenway
		triggerscript = z_fenway_crowd_peds
		param = {
			name = crowd5
		}
	}
	{
		name = crowd6
		camera = crowd6_cam
		model = 'Real_Crowd\\crowd_pedF_2.skin'
		skeletonname = gh3_ped_skinny
		id = crowd6_cam_viewport
		texture = viewport6
		textureasset = `tex/zones/demo/tw_billboard06.dds`
		texdict = `zones/z_fenway/z_fenway.tex`
		assetcontext = z_fenway
		triggerscript = z_fenway_crowd_peds
		param = {
			name = crowd6
		}
	}
]
z_hof_crowd_models = [
	{
		name = crowd1
		camera = crowd1_cam
		model = 'Real_Crowd\\Crowd_Ped_01.skin'
		skeletonname = gh3_ped_skinny
		id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/demo/tw_billboard01.dds`
		texdict = `zones/z_hof/z_hof.tex`
		assetcontext = z_hof
		triggerscript = z_hof_crowd_peds
		params = {
			name = crowd1
		}
	}
	{
		name = crowd2
		camera = crowd2_cam
		model = 'Real_Crowd\\Crowd_Ped_02.skin'
		skeletonname = gh3_ped_skinny
		id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/demo/tw_billboard02.dds`
		texdict = `zones/z_hof/z_hof.tex`
		assetcontext = z_hof
		triggerscript = z_hof_crowd_peds
		params = {
			name = crowd2
		}
	}
	{
		name = crowd3
		camera = crowd3_cam
		model = 'Real_Crowd\\Crowd_Ped_03.skin'
		skeletonname = gh3_ped_skinny
		id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/demo/tw_billboard03.dds`
		texdict = `zones/z_hof/z_hof.tex`
		assetcontext = z_hof
		triggerscript = z_hof_crowd_peds
		params = {
			name = crowd3
		}
	}
	{
		name = crowd4
		camera = crowd4_cam
		model = 'Real_Crowd\\Crowd_Ped_04.skin'
		skeletonname = gh3_ped_skinny
		id = crowd4_cam_viewport
		texture = viewport4
		textureasset = `tex/zones/demo/tw_billboard04.dds`
		texdict = `zones/z_hof/z_hof.tex`
		assetcontext = z_hof
		triggerscript = z_hof_crowd_peds
		params = {
			name = crowd4
		}
	}
	{
		name = crowd5
		camera = crowd5_cam
		model = 'Real_Crowd\\crowd_pedF_1.skin'
		skeletonname = gh3_ped_skinny
		id = crowd5_cam_viewport
		texture = viewport5
		textureasset = `tex/zones/demo/tw_billboard05.dds`
		texdict = `zones/z_hof/z_hof.tex`
		assetcontext = z_hof
		triggerscript = z_hof_crowd_peds
		params = {
			name = crowd5
		}
	}
	{
		name = crowd6
		camera = crowd6_cam
		model = 'Real_Crowd\\crowd_pedF_2.skin'
		skeletonname = gh3_ped_skinny
		id = crowd6_cam_viewport
		texture = viewport6
		textureasset = `tex/zones/demo/tw_billboard06.dds`
		texdict = `zones/z_hof/z_hof.tex`
		assetcontext = z_hof
		triggerscript = z_hof_crowd_peds
		params = {
			name = crowd6
		}
	}
]
z_nipmuc_crowd_models = [
	{
		name = crowd1
		camera = crowd1_cam
		model = 'Real_Crowd\\Crowd_Ped_01.skin'
		skeletonname = gh3_ped_skinny
		id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/demo/tw_billboard01.dds`
		texdict = `zones/z_nipmuc/z_nipmuc.tex`
		assetcontext = z_nipmuc
		triggerscript = z_nipmuc_crowd_peds
		params = {
			name = crowd1
		}
	}
	{
		name = crowd2
		camera = crowd2_cam
		model = 'Real_Crowd\\Crowd_Ped_02.skin'
		skeletonname = gh3_ped_skinny
		id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/demo/tw_billboard02.dds`
		texdict = `zones/z_nipmuc/z_nipmuc.tex`
		assetcontext = z_nipmuc
		triggerscript = z_nipmuc_crowd_peds
		params = {
			name = crowd2
		}
	}
	{
		name = crowd3
		camera = crowd3_cam
		model = 'Real_Crowd\\Crowd_Ped_03.skin'
		skeletonname = gh3_ped_skinny
		id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/demo/tw_billboard03.dds`
		texdict = `zones/z_nipmuc/z_nipmuc.tex`
		assetcontext = z_nipmuc
		triggerscript = z_nipmuc_crowd_peds
		params = {
			name = crowd3
		}
	}
	{
		name = crowd4
		camera = crowd4_cam
		model = 'Real_Crowd\\Crowd_Ped_04.skin'
		skeletonname = gh3_ped_skinny
		id = crowd4_cam_viewport
		texture = viewport4
		textureasset = `tex/zones/demo/tw_billboard04.dds`
		texdict = `zones/z_nipmuc/z_nipmuc.tex`
		assetcontext = z_nipmuc
		triggerscript = z_nipmuc_crowd_peds
		params = {
			name = crowd4
		}
	}
	{
		name = crowd5
		camera = crowd5_cam
		model = 'Real_Crowd\\crowd_pedF_1.skin'
		skeletonname = gh3_ped_skinny
		id = crowd5_cam_viewport
		texture = viewport5
		textureasset = `tex/zones/demo/tw_billboard05.dds`
		texdict = `zones/z_nipmuc/z_nipmuc.tex`
		assetcontext = z_nipmuc
		triggerscript = z_nipmuc_crowd_peds
		params = {
			name = crowd5
		}
	}
	{
		name = crowd6
		camera = crowd6_cam
		model = 'Real_Crowd\\crowd_pedF_2.skin'
		skeletonname = gh3_ped_skinny
		id = crowd6_cam_viewport
		texture = viewport6
		textureasset = `tex/zones/demo/tw_billboard06.dds`
		texdict = `zones/z_nipmuc/z_nipmuc.tex`
		assetcontext = z_nipmuc
		triggerscript = z_nipmuc_crowd_peds
		params = {
			name = crowd6
		}
	}
]
z_jpplay_crowd_models = [
	{
		name = crowd1
		camera = crowd1_cam
		model = 'Real_Crowd\\Crowd_Ped_01.skin'
		skeletonname = gh3_ped_skinny
		id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/demo/tw_billboard01.dds`
		texdict = `zones/z_jpplay/z_jpplay.tex`
		assetcontext = z_jpplay
		triggerscript = z_jpplay_crowd_peds
		params = {
			name = crowd1
		}
	}
	{
		name = crowd2
		camera = crowd2_cam
		model = 'Real_Crowd\\Crowd_Ped_02.skin'
		skeletonname = gh3_ped_skinny
		id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/demo/tw_billboard02.dds`
		texdict = `zones/z_jpplay/z_jpplay.tex`
		assetcontext = z_jpplay
		triggerscript = z_jpplay_crowd_peds
		params = {
			name = crowd2
		}
	}
	{
		name = crowd3
		camera = crowd3_cam
		model = 'Real_Crowd\\Crowd_Ped_03.skin'
		skeletonname = gh3_ped_skinny
		id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/demo/tw_billboard03.dds`
		texdict = `zones/z_jpplay/z_jpplay.tex`
		assetcontext = z_jpplay
		triggerscript = z_jpplay_crowd_peds
		params = {
			name = crowd3
		}
	}
	{
		name = crowd4
		camera = crowd4_cam
		model = 'Real_Crowd\\Crowd_Ped_04.skin'
		skeletonname = gh3_ped_skinny
		id = crowd4_cam_viewport
		texture = viewport4
		textureasset = `tex/zones/demo/tw_billboard04.dds`
		texdict = `zones/z_jpplay/z_jpplay.tex`
		assetcontext = z_jpplay
		triggerscript = z_jpplay_crowd_peds
		params = {
			name = crowd4
		}
	}
	{
		name = crowd5
		camera = crowd5_cam
		model = 'Real_Crowd\\crowd_pedF_1.skin'
		skeletonname = gh3_ped_skinny
		id = crowd5_cam_viewport
		texture = viewport5
		textureasset = `tex/zones/demo/tw_billboard05.dds`
		texdict = `zones/z_jpplay/z_jpplay.tex`
		assetcontext = z_jpplay
		triggerscript = z_jpplay_crowd_peds
		params = {
			name = crowd5
		}
	}
	{
		name = crowd6
		camera = crowd6_cam
		model = 'Real_Crowd\\crowd_pedF_2.skin'
		skeletonname = gh3_ped_skinny
		id = crowd6_cam_viewport
		texture = viewport6
		textureasset = `tex/zones/demo/tw_billboard06.dds`
		texdict = `zones/z_jpplay/z_jpplay.tex`
		assetcontext = z_jpplay
		triggerscript = z_jpplay_crowd_peds
		params = {
			name = crowd6
		}
	}
]
z_wikker_crowd_models = [
	{
		name = crowd1
		camera = crowd1_cam
		model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/demo/tw_billboard01.dds`
		texdict = `zones/z_wikker/z_wikker.tex`
		assetcontext = z_wikker
		triggerscript = z_wikker_crowd_peds
		params = {
			name = crowd1
		}
	}
	{
		name = crowd2
		camera = crowd2_cam
		model = 'Real_Crowd\\Crowd_Ped_02.skin'
		id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/demo/tw_billboard02.dds`
		texdict = `zones/z_wikker/z_wikker.tex`
		assetcontext = z_wikker
		triggerscript = z_wikker_crowd_peds
		params = {
			name = crowd2
		}
	}
	{
		name = crowd3
		camera = crowd3_cam
		model = 'Real_Crowd\\Crowd_Ped_03.skin'
		id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/demo/tw_billboard03.dds`
		texdict = `zones/z_wikker/z_wikker.tex`
		assetcontext = z_wikker
		triggerscript = z_wikker_crowd_peds
		params = {
			name = crowd3
		}
	}
	{
		name = crowd4
		camera = crowd4_cam
		model = 'Real_Crowd\\Crowd_Ped_04.skin'
		id = crowd4_cam_viewport
		texture = viewport4
		textureasset = `tex/zones/demo/tw_billboard04.dds`
		texdict = `zones/z_wikker/z_wikker.tex`
		assetcontext = z_wikker
		triggerscript = z_wikker_crowd_peds
		params = {
			name = crowd4
		}
	}
	{
		name = crowd5
		camera = crowd5_cam
		model = 'Real_Crowd\\crowd_pedF_1.skin'
		id = crowd5_cam_viewport
		texture = viewport5
		textureasset = `tex/zones/demo/tw_billboard05.dds`
		texdict = `zones/z_wikker/z_wikker.tex`
		assetcontext = z_wikker
		triggerscript = z_wikker_crowd_peds
		params = {
			name = crowd5
		}
	}
	{
		name = crowd6
		camera = crowd6_cam
		model = 'Real_Crowd\\crowd_pedF_2.skin'
		id = crowd6_cam_viewport
		texture = viewport6
		textureasset = `tex/zones/demo/tw_billboard06.dds`
		texdict = `zones/z_wikker/z_wikker.tex`
		assetcontext = z_wikker
		triggerscript = z_wikker_crowd_peds
		params = {
			name = crowd6
		}
	}
]
z_dive_crowd_models = [
	{
		name = crowd1
		camera = crowd1_cam
		model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/demo/tw_billboard01.dds`
		texdict = `zones/z_dive/z_dive.tex`
		assetcontext = z_dive
		triggerscript = z_dive_crowd_peds
		params = {
			name = crowd1
		}
	}
	{
		name = crowd2
		camera = crowd2_cam
		model = 'Real_Crowd\\Crowd_Ped_02.skin'
		id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/demo/tw_billboard02.dds`
		texdict = `zones/z_dive/z_dive.tex`
		assetcontext = z_dive
		triggerscript = z_dive_crowd_peds
		params = {
			name = crowd2
		}
	}
	{
		name = crowd3
		camera = crowd3_cam
		model = 'Real_Crowd\\Crowd_Ped_03.skin'
		id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/demo/tw_billboard03.dds`
		texdict = `zones/z_dive/z_dive.tex`
		assetcontext = z_dive
		triggerscript = z_dive_crowd_peds
		params = {
			name = crowd3
		}
	}
	{
		name = crowd4
		camera = crowd4_cam
		model = 'Real_Crowd\\Crowd_Ped_04.skin'
		id = crowd4_cam_viewport
		texture = viewport4
		textureasset = `tex/zones/demo/tw_billboard04.dds`
		texdict = `zones/z_dive/z_dive.tex`
		assetcontext = z_dive
		triggerscript = z_dive_crowd_peds
		params = {
			name = crowd4
		}
	}
	{
		name = crowd5
		camera = crowd5_cam
		model = 'Real_Crowd\\crowd_pedF_1.skin'
		id = crowd5_cam_viewport
		texture = viewport5
		textureasset = `tex/zones/demo/tw_billboard05.dds`
		texdict = `zones/z_dive/z_dive.tex`
		assetcontext = z_dive
		triggerscript = z_dive_crowd_peds
		params = {
			name = crowd5
		}
	}
	{
		name = crowd6
		camera = crowd6_cam
		model = 'Real_Crowd\\crowd_pedF_2.skin'
		id = crowd6_cam_viewport
		texture = viewport6
		textureasset = `tex/zones/demo/tw_billboard06.dds`
		texdict = `zones/z_dive/z_dive.tex`
		assetcontext = z_dive
		triggerscript = z_dive_crowd_peds
		params = {
			name = crowd6
		}
	}
]
z_artdeco_crowd_models = [
	{
		name = crowd1
		camera = crowd1_cam
		model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/demo/tw_billboard01.dds`
		texdict = `zones/z_artdeco/z_artdeco.tex`
		assetcontext = z_artdeco
		triggerscript = z_artdeco_crowd_peds
		params = {
			name = crowd1
		}
	}
	{
		name = crowd2
		camera = crowd2_cam
		model = 'Real_Crowd\\Crowd_Ped_02.skin'
		id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/demo/tw_billboard02.dds`
		texdict = `zones/z_artdeco/z_artdeco.tex`
		assetcontext = z_artdeco
		triggerscript = z_artdeco_crowd_peds
		params = {
			name = crowd2
		}
	}
	{
		name = crowd3
		camera = crowd3_cam
		model = 'Real_Crowd\\Crowd_Ped_03.skin'
		id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/demo/tw_billboard03.dds`
		texdict = `zones/z_artdeco/z_artdeco.tex`
		assetcontext = z_artdeco
		triggerscript = z_artdeco_crowd_peds
		params = {
			name = crowd3
		}
	}
	{
		name = crowd4
		camera = crowd4_cam
		model = 'Real_Crowd\\Crowd_Ped_04.skin'
		id = crowd4_cam_viewport
		texture = viewport4
		textureasset = `tex/zones/demo/tw_billboard04.dds`
		texdict = `zones/z_artdeco/z_artdeco.tex`
		assetcontext = z_artdeco
		triggerscript = z_artdeco_crowd_peds
		params = {
			name = crowd4
		}
	}
	{
		name = crowd5
		camera = crowd5_cam
		model = 'Real_Crowd\\crowd_pedF_1.skin'
		id = crowd5_cam_viewport
		texture = viewport5
		textureasset = `tex/zones/demo/tw_billboard05.dds`
		texdict = `zones/z_artdeco/z_artdeco.tex`
		assetcontext = z_artdeco
		triggerscript = z_artdeco_crowd_peds
		params = {
			name = crowd5
		}
	}
	{
		name = crowd6
		camera = crowd6_cam
		model = 'Real_Crowd\\crowd_pedF_2.skin'
		id = crowd6_cam_viewport
		texture = viewport6
		textureasset = `tex/zones/demo/tw_billboard06.dds`
		texdict = `zones/z_artdeco/z_artdeco.tex`
		assetcontext = z_artdeco
		triggerscript = z_artdeco_crowd_peds
		params = {
			name = crowd6
		}
	}
]
z_prison_crowd_models = [
	{
		name = crowd1
		camera = crowd1_cam
		model = 'Real_Crowd\\Crowd_Prison_01.skin'
		id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/demo/tw_billboard01.dds`
		texdict = `zones/z_prison/z_prison.tex`
		assetcontext = z_prison
		triggerscript = z_prison_crowd_peds
		params = {
			name = crowd1
		}
	}
	{
		name = crowd2
		camera = crowd2_cam
		model = 'Real_Crowd\\Crowd_Prison_02.skin'
		id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/demo/tw_billboard02.dds`
		texdict = `zones/z_prison/z_prison.tex`
		assetcontext = z_prison
		triggerscript = z_prison_crowd_peds
		params = {
			name = crowd2
		}
	}
	{
		name = crowd3
		camera = crowd3_cam
		model = 'Real_Crowd\\Crowd_Prison_01.skin'
		id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/demo/tw_billboard03.dds`
		texdict = `zones/z_prison/z_prison.tex`
		assetcontext = z_prison
		triggerscript = z_prison_crowd_peds
		params = {
			name = crowd3
		}
	}
	{
		name = crowd4
		camera = crowd4_cam
		model = 'Real_Crowd\\Crowd_Prison_02.skin'
		id = crowd4_cam_viewport
		texture = viewport4
		textureasset = `tex/zones/demo/tw_billboard04.dds`
		texdict = `zones/z_prison/z_prison.tex`
		assetcontext = z_prison
		triggerscript = z_prison_crowd_peds
		params = {
			name = crowd4
		}
	}
	{
		name = crowd5
		camera = crowd5_cam
		model = 'Real_Crowd\\Crowd_Prison_01.skin'
		id = crowd5_cam_viewport
		texture = viewport5
		textureasset = `tex/zones/demo/tw_billboard05.dds`
		texdict = `zones/z_prison/z_prison.tex`
		assetcontext = z_prison
		triggerscript = z_prison_crowd_peds
		params = {
			name = crowd5
		}
	}
	{
		name = crowd6
		camera = crowd6_cam
		model = 'Real_Crowd\\Crowd_Prison_02.skin'
		id = crowd6_cam_viewport
		texture = viewport6
		textureasset = `tex/zones/demo/tw_billboard06.dds`
		texdict = `zones/z_prison/z_prison.tex`
		assetcontext = z_prison
		triggerscript = z_prison_crowd_peds
		params = {
			name = crowd6
		}
	}
]
z_party_crowd_models = [
	{
		name = crowd1
		camera = crowd1_cam
		model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/demo/tw_billboard01.dds`
		texdict = `zones/z_party/z_party.tex`
		assetcontext = z_party
		triggerscript = z_party_crowd_peds
		params = {
			name = crowd1
		}
	}
	{
		name = crowd2
		camera = crowd2_cam
		model = 'Real_Crowd\\Crowd_Ped_02.skin'
		id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/demo/tw_billboard02.dds`
		texdict = `zones/z_party/z_party.tex`
		assetcontext = z_party
		triggerscript = z_party_crowd_peds
		params = {
			name = crowd2
		}
	}
	{
		name = crowd3
		camera = crowd3_cam
		model = 'Real_Crowd\\Crowd_Ped_03.skin'
		id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/demo/tw_billboard03.dds`
		texdict = `zones/z_party/z_party.tex`
		assetcontext = z_party
		triggerscript = z_party_crowd_peds
		params = {
			name = crowd3
		}
	}
	{
		name = crowd4
		camera = crowd4_cam
		model = 'Real_Crowd\\Crowd_Ped_04.skin'
		id = crowd4_cam_viewport
		texture = viewport4
		textureasset = `tex/zones/demo/tw_billboard04.dds`
		texdict = `zones/z_party/z_party.tex`
		assetcontext = z_party
		triggerscript = z_party_crowd_peds
		params = {
			name = crowd4
		}
	}
	{
		name = crowd5
		camera = crowd5_cam
		model = 'Real_Crowd\\crowd_pedF_1.skin'
		id = crowd5_cam_viewport
		texture = viewport5
		textureasset = `tex/zones/demo/tw_billboard05.dds`
		texdict = `zones/z_party/z_party.tex`
		assetcontext = z_party
		triggerscript = z_party_crowd_peds
		params = {
			name = crowd5
		}
	}
	{
		name = crowd6
		camera = crowd6_cam
		model = 'Real_Crowd\\crowd_pedF_2.skin'
		id = crowd6_cam_viewport
		texture = viewport6
		textureasset = `tex/zones/demo/tw_billboard06.dds`
		texdict = `zones/z_party/z_party.tex`
		assetcontext = z_party
		triggerscript = z_party_crowd_peds
		params = {
			name = crowd6
		}
	}
]
z_hell_crowd_models = [
	{
		name = crowd1
		camera = crowd1_cam
		model = 'Real_Crowd\\Crowd_Biker_01.skin'
		id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/demo/tw_billboard01.dds`
		texdict = `zones/z_hell/z_hell.tex`
		assetcontext = z_hell
		triggerscript = z_hell_crowd_peds
		params = {
			name = crowd1
		}
	}
	{
		name = crowd2
		camera = crowd2_cam
		model = 'Real_Crowd\\Crowd_Biker_02.skin'
		id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/demo/tw_billboard02.dds`
		texdict = `zones/z_hell/z_hell.tex`
		assetcontext = z_hell
		triggerscript = z_hell_crowd_peds
		params = {
			name = crowd2
		}
	}
	{
		name = crowd3
		camera = crowd3_cam
		model = 'Real_Crowd\\Crowd_Biker_01.skin'
		id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/demo/tw_billboard03.dds`
		texdict = `zones/z_hell/z_hell.tex`
		assetcontext = z_hell
		triggerscript = z_hell_crowd_peds
		params = {
			name = crowd3
		}
	}
	{
		name = crowd4
		camera = crowd4_cam
		model = 'Real_Crowd\\Crowd_Biker_02.skin'
		id = crowd4_cam_viewport
		texture = viewport4
		textureasset = `tex/zones/demo/tw_billboard04.dds`
		texdict = `zones/z_hell/z_hell.tex`
		assetcontext = z_hell
		triggerscript = z_hell_crowd_peds
		params = {
			name = crowd4
		}
	}
	{
		name = crowd5
		camera = crowd5_cam
		model = 'Real_Crowd\\crowd_Biker_01.skin'
		id = crowd5_cam_viewport
		texture = viewport5
		textureasset = `tex/zones/demo/tw_billboard05.dds`
		texdict = `zones/z_hell/z_hell.tex`
		assetcontext = z_hell
		triggerscript = z_hell_crowd_peds
		params = {
			name = crowd5
		}
	}
	{
		name = crowd6
		camera = crowd6_cam
		model = 'Real_Crowd\\crowd_biker_02.skin'
		id = crowd6_cam_viewport
		texture = viewport6
		textureasset = `tex/zones/demo/tw_billboard06.dds`
		texdict = `zones/z_hell/z_hell.tex`
		assetcontext = z_hell
		triggerscript = z_hell_crowd_peds
		params = {
			name = crowd6
		}
	}
]
z_training_crowd_models = [
	{
		name = crowd1
		camera = crowd1_cam
		model = 'Characters\\Musicians\\Sec_Barker.skin'
		id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/demo/tw_billboard01.dds`
		texdict = `zones/z_training/z_training.tex`
		assetcontext = z_training
		triggerscript = z_training_crowd_peds
	}
	{
		name = crowd2
		camera = crowd2_cam
		model = 'Characters\\Musicians\\Sec_Punk.skin'
		id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/demo/tw_billboard02.dds`
		texdict = `zones/z_training/z_training.tex`
		assetcontext = z_training
		triggerscript = z_training_crowd_peds
	}
	{
		name = crowd3
		camera = crowd3_cam
		model = 'Characters\\Musicians\\Sec_Pro_Stabb.skin'
		id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/demo/tw_billboard03.dds`
		texdict = `zones/z_training/z_training.tex`
		assetcontext = z_training
		triggerscript = z_training_crowd_peds
	}
]
z_budokan_crowd_models = [
	{
		name = crowd1
		camera = crowd1_cam
		model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/demo/tw_billboard01.dds`
		texdict = `zones/z_budokan/z_budokan.tex`
		assetcontext = z_budokan
		triggerscript = z_budokan_crowd_peds
		params = {
			name = crowd1
		}
	}
	{
		name = crowd2
		camera = crowd2_cam
		model = 'Real_Crowd\\Crowd_Ped_02.skin'
		id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/demo/tw_billboard02.dds`
		texdict = `zones/z_budokan/z_budokan.tex`
		assetcontext = z_budokan
		triggerscript = z_budokan_crowd_peds
		params = {
			name = crowd2
		}
	}
	{
		name = crowd3
		camera = crowd3_cam
		model = 'Real_Crowd\\Crowd_Ped_03.skin'
		id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/demo/tw_billboard03.dds`
		texdict = `zones/z_budokan/z_budokan.tex`
		assetcontext = z_budokan
		triggerscript = z_budokan_crowd_peds
		params = {
			name = crowd3
		}
	}
	{
		name = crowd4
		camera = crowd4_cam
		model = 'Real_Crowd\\Crowd_Ped_04.skin'
		id = crowd4_cam_viewport
		texture = viewport4
		textureasset = `tex/zones/demo/tw_billboard04.dds`
		texdict = `zones/z_budokan/z_budokan.tex`
		assetcontext = z_budokan
		triggerscript = z_budokan_crowd_peds
		params = {
			name = crowd4
		}
	}
	{
		name = crowd5
		camera = crowd5_cam
		model = 'Real_Crowd\\crowd_pedF_1.skin'
		id = crowd5_cam_viewport
		texture = viewport5
		textureasset = `tex/zones/demo/tw_billboard05.dds`
		texdict = `zones/z_budokan/z_budokan.tex`
		assetcontext = z_budokan
		triggerscript = z_budokan_crowd_peds
		params = {
			name = crowd5
		}
	}
	{
		name = crowd6
		camera = crowd6_cam
		model = 'Real_Crowd\\crowd_pedF_2.skin'
		id = crowd6_cam_viewport
		texture = viewport6
		textureasset = `tex/zones/demo/tw_billboard06.dds`
		texdict = `zones/z_budokan/z_budokan.tex`
		assetcontext = z_budokan
		triggerscript = z_budokan_crowd_peds
		params = {
			name = crowd6
		}
	}
]
z_video_crowd_models = [
	{
		name = crowd1
		camera = crowd1_cam
		model = 'Real_Crowd\\Crowd_Ped_01.skin'
		id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/demo/tw_billboard01.dds`
		texdict = `zones/z_video/z_video.tex`
		assetcontext = z_video
		triggerscript = z_video_crowd_peds
		params = {
			name = crowd1
		}
		roty = -90
	}
	{
		name = crowd2
		camera = crowd2_cam
		model = 'Real_Crowd\\Crowd_Ped_02.skin'
		id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/demo/tw_billboard02.dds`
		texdict = `zones/z_video/z_video.tex`
		assetcontext = z_video
		triggerscript = z_video_crowd_peds
		params = {
			name = crowd2
		}
		roty = -90
	}
	{
		name = crowd3
		camera = crowd3_cam
		model = 'Real_Crowd\\Crowd_Ped_03.skin'
		id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/demo/tw_billboard03.dds`
		texdict = `zones/z_video/z_video.tex`
		assetcontext = z_video
		triggerscript = z_video_crowd_peds
		params = {
			name = crowd3
		}
		roty = -90
	}
	{
		name = crowd4
		camera = crowd4_cam
		model = 'Real_Crowd\\Crowd_Ped_04.skin'
		id = crowd4_cam_viewport
		texture = viewport4
		textureasset = `tex/zones/demo/tw_billboard04.dds`
		texdict = `zones/z_video/z_video.tex`
		assetcontext = z_video
		triggerscript = z_video_crowd_peds
		params = {
			name = crowd4
		}
	}
	{
		name = crowd5
		camera = crowd5_cam
		model = 'Real_Crowd\\crowd_pedF_1.skin'
		id = crowd5_cam_viewport
		texture = viewport5
		textureasset = `tex/zones/demo/tw_billboard05.dds`
		texdict = `zones/z_video/z_video.tex`
		assetcontext = z_video
		triggerscript = z_video_crowd_peds
		params = {
			name = crowd5
		}
	}
	{
		name = crowd6
		camera = crowd6_cam
		model = 'Real_Crowd\\crowd_pedF_2.skin'
		id = crowd6_cam_viewport
		texture = viewport6
		textureasset = `tex/zones/demo/tw_billboard06.dds`
		texdict = `zones/z_video/z_video.tex`
		assetcontext = z_video
		triggerscript = z_video_crowd_peds
		params = {
			name = crowd6
		}
	}
	{
		name = crowd7
		camera = crowd7_cam
		model = 'Real_Crowd\\Crowd_Ped_03.skin'
		id = crowd7_cam_viewport
		texture = viewport7
		textureasset = `tex/zones/demo/tw_billboard07.dds`
		texdict = `zones/z_video/z_video.tex`
		assetcontext = z_video
		triggerscript = z_video_crowd_peds
		params = {
			name = crowd7
		}
		roty = 90
	}
	{
		name = crowd8
		camera = crowd8_cam
		model = 'Real_Crowd\\Crowd_Ped_04.skin'
		id = crowd8_cam_viewport
		texture = viewport8
		textureasset = `tex/zones/demo/tw_billboard08.dds`
		texdict = `zones/z_video/z_video.tex`
		assetcontext = z_video
		triggerscript = z_video_crowd_peds
		params = {
			name = crowd8
		}
		roty = 90
	}
]
z_nine_lives_crowd_models = [
	{
		name = crowd1
		camera = crowd1_cam
		model = 'Real_Crowd\\Crowd_Ped_01.skin'
		skeletonname = gh3_ped_skinny
		id = crowd1_cam_viewport
		texture = viewport1
		textureasset = `tex/zones/demo/tw_billboard01.dds`
		texdict = `zones/z_nine_lives/z_nine_lives.tex`
		assetcontext = z_nine_lives
		triggerscript = z_nine_lives_crowd_peds
		params = {
			name = crowd1
		}
	}
	{
		name = crowd2
		camera = crowd2_cam
		model = 'Real_Crowd\\Crowd_Ped_02.skin'
		skeletonname = gh3_ped_skinny
		id = crowd2_cam_viewport
		texture = viewport2
		textureasset = `tex/zones/demo/tw_billboard02.dds`
		texdict = `zones/z_nine_lives/z_nine_lives.tex`
		assetcontext = z_nine_lives
		triggerscript = z_nine_lives_crowd_peds
		params = {
			name = crowd2
		}
	}
	{
		name = crowd3
		camera = crowd3_cam
		model = 'Real_Crowd\\Crowd_Ped_03.skin'
		skeletonname = gh3_ped_skinny
		id = crowd3_cam_viewport
		texture = viewport3
		textureasset = `tex/zones/demo/tw_billboard03.dds`
		texdict = `zones/z_nine_lives/z_nine_lives.tex`
		assetcontext = z_nine_lives
		triggerscript = z_nine_lives_crowd_peds
		params = {
			name = crowd3
		}
	}
	{
		name = crowd4
		camera = crowd4_cam
		model = 'Real_Crowd\\Crowd_Ped_04.skin'
		skeletonname = gh3_ped_skinny
		id = crowd4_cam_viewport
		texture = viewport4
		textureasset = `tex/zones/demo/tw_billboard04.dds`
		texdict = `zones/z_nine_lives/z_nine_lives.tex`
		assetcontext = z_nine_lives
		triggerscript = z_nine_lives_crowd_peds
		params = {
			name = crowd4
		}
	}
	{
		name = crowd5
		camera = crowd5_cam
		model = 'Real_Crowd\\crowd_pedF_1.skin'
		skeletonname = gh3_ped_skinny
		id = crowd5_cam_viewport
		texture = viewport5
		textureasset = `tex/zones/demo/tw_billboard05.dds`
		texdict = `zones/z_nine_lives/z_nine_lives.tex`
		assetcontext = z_nine_lives
		triggerscript = z_nine_lives_crowd_peds
		params = {
			name = crowd5
		}
	}
	{
		name = crowd6
		camera = crowd6_cam
		model = 'Real_Crowd\\crowd_pedF_2.skin'
		skeletonname = gh3_ped_skinny
		id = crowd6_cam_viewport
		texture = viewport6
		textureasset = `tex/zones/demo/tw_billboard06.dds`
		texdict = `zones/z_nine_lives/z_nine_lives.tex`
		assetcontext = z_nine_lives
		triggerscript = z_nine_lives_crowd_peds
		params = {
			name = crowd6
		}
	}
]

script create_crowd_models 
	if ($disable_crowd = 1)
		return
	endif
	getpakmancurrentname \{map = zones}
	formattext checksumname = crowd_models '%s_crowd_models' s = <pakname>
	if NOT globalexists name = <crowd_models>
		return
	endif
	change crowd_model_array = <crowd_models>
	getarraysize $<crowd_models>
	array_count = 0
	begin
	pos = ((-500.0, -200.0, 0.0) + (0.0, -100.0, 0.0) * <array_count>)
	viewport = ($<crowd_models> [<array_count>].id)
	camera = ($<crowd_models> [<array_count>].camera)
	if NOT structurecontains structure = ($<crowd_models> [<array_count>]) remap_only
		mempushcontext \{bottomupheap}
		createfromstructure {
			pos = <pos>
			quat = (0.0, 1.0, 0.0)
			class = gameobject
			type = ghost
			createdatstart
			profile = $profile_ped_crowd_obj
			($<crowd_models> [<array_count>])
			suspenddistance = 0
			lod_dist1 = 400
			lod_dist2 = 401
			lightgroup = crowd
			object_type = crowd
			profilecolor = 49344
			profilebudget = 200
			use_jq
		}
		model_id = ($<crowd_models> [<array_count>].name)
		extra_model = 'Real_Crowd\\Crowd_HandL_Lighter.skin'
		<model_id> :addgeom lhand_lighter model = <extra_model> lightgroup = crowd
		extra_model = 'Real_Crowd\\Crowd_HandL_Rock.skin'
		<model_id> :addgeom lhand_rock model = <extra_model> lightgroup = crowd
		extra_model = 'Real_Crowd\\Crowd_HandL_Clap.skin'
		<model_id> :addgeom lhand_clap model = <extra_model> lightgroup = crowd
		extra_model = 'Real_Crowd\\Crowd_HandL_Fist.skin'
		<model_id> :addgeom lhand_fist model = <extra_model> lightgroup = crowd
		extra_model = 'Real_Crowd\\Crowd_HandR_Lighter.skin'
		<model_id> :addgeom rhand_lighter model = <extra_model> lightgroup = crowd
		extra_model = 'Real_Crowd\\Crowd_HandR_Rock.skin'
		<model_id> :addgeom rhand_rock model = <extra_model> lightgroup = crowd
		extra_model = 'Real_Crowd\\Crowd_HandR_Clap.skin'
		<model_id> :addgeom rhand_clap model = <extra_model> lightgroup = crowd
		extra_model = 'Real_Crowd\\Crowd_HandR_Fist.skin'
		<model_id> :addgeom rhand_fist model = <extra_model> lightgroup = crowd
		<model_id> :switchoffatomic lhand_lighter
		<model_id> :switchoffatomic lhand_rock
		<model_id> :switchoffatomic lhand_fist
		<model_id> :switchonatomic lhand_clap
		<model_id> :switchoffatomic rhand_lighter
		<model_id> :switchoffatomic rhand_rock
		<model_id> :switchoffatomic rhand_fist
		<model_id> :switchonatomic rhand_clap
		if structurecontains structure = ($<crowd_models> [<array_count>]) roty
			($<crowd_models> [<array_count>].name) :obj_setorientation y = ($<crowd_models> [<array_count>].roty)
			apply_correction = 0
		else
			apply_correction = 1
		endif
		mempopcontext \{bottomupheap}
		style = imposter_rendering
		if (<array_size> <= 6)
			if isxenon
				style = imposter_rendering_highres
			endif
		endif
		createscreenelement {
			parent = root_window
			just = [center center]
			type = viewportelement
			id = <viewport>
			texture = ($<crowd_models> [<array_count>].texture)
			pos = (2000.0, 200.0)
			dims = (64.0, 64.0)
			alpha = 1
			style = <style>
		}
		createcompositeobjectinstance {
			priority = $coim_priority_permanent
			heap = generic
			components = [
				{component = camera}
			]
			params = {
				name = <camera>
				viewport = <viewport>
				object_type = crowd
				profilecolor = 12632064
				profilebudget = 10
				use_jq
				far_clip = 20
			}
		}
		setactivecamera viewport = <viewport> id = <camera>
		<camera> :sethfov hfov = $crowd_ped_camera_fov
		setviewportproperties viewport = <viewport> no_resolve_depthstencilbuffer = true
		addcrowdmodelcam camera = <camera> pos = <pos> viewport = <viewport> apply_correction = <apply_correction>
	endif
	setsearchallassetcontexts
	createviewporttextureoverride {
		id = <viewport>
		viewportid = <viewport>
		texture = ($<crowd_models> [<array_count>].textureasset)
		texdict = ($<crowd_models> [<array_count>].texdict)
	}
	setsearchallassetcontexts \{off}
	<array_count> = (<array_count> + 1)
	repeat <array_size>
endscript

script update_crowd_model_cam 
	crowd_scaler = 25
	begin
	getviewportcameraorient \{viewport = bg_viewport}
	getvectorcomponents <at>
	angle = (<x> * <crowd_scaler>)
	rotatevector vector = <at> ry = <angle>
	at = <result_vector>
	rotatevector vector = <left> ry = <angle>
	left = <result_vector>
	rotatevector vector = <up> ry = <angle>
	up = <result_vector>
	posdir = (<model_pos> + (0.0, 1.0, 0.0) + (<at> * 3.5))
	<camera> :obj_setposition position = <posdir>
	<camera> :obj_setorientation dir = <at> only handles upright cameras
	setviewportcameraorient viewport = <viewport> at = <at> left = <left> up = <up>
	<camera> :unpause
	wait \{1
		gameframe}
	repeat
endscript

script destroy_crowd_models 
	clearcrowdmodelcams
	crowd_models = $crowd_model_array
	if (<crowd_models> = none)
		return
	endif
	getarraysize <crowd_models>
	array_count = 0
	begin
	if NOT structurecontains structure = (<crowd_models> [<array_count>]) remap_only
		killspawnedscript \{name = update_crowd_model_cam}
		if compositeobjectexists name = (<crowd_models> [<array_count>].camera)
			(<crowd_models> [<array_count>].camera) :die
		endif
		if screenelementexists id = (<crowd_models> [<array_count>].id)
			setsearchallassetcontexts
			destroyviewporttextureoverride id = (<crowd_models> [<array_count>].id)
			setsearchallassetcontexts \{off}
			destroyscreenelement id = (<crowd_models> [<array_count>].id)
		endif
		if compositeobjectexists name = (<crowd_models> [<array_count>].name)
			(<crowd_models> [<array_count>].name) :die
		endif
	endif
	<array_count> = (<array_count> + 1)
	repeat <array_size>
	change \{crowd_model_array = none}
endscript

script set_crowd_hand \{hand = left
		type = clap}
	obj_getid
	name = <objid>
	if (<hand> = left)
		switch (<type>)
			case lighter
			part = lhand_lighter
			case rock
			part = lhand_rock
			case clap
			part = lhand_clap
			case fist
			part = lhand_fist
		endswitch
		<name> :switchoffatomic lhand_lighter
		<name> :switchoffatomic lhand_rock
		<name> :switchoffatomic lhand_clap
		<name> :switchoffatomic lhand_fist
		<name> :switchonatomic <part>
	else
		switch (<type>)
			case lighter
			part = rhand_lighter
			case rock
			part = rhand_rock
			case clap
			part = rhand_clap
			case fist
			part = rhand_fist
		endswitch
		<name> :switchoffatomic rhand_lighter
		<name> :switchoffatomic rhand_rock
		<name> :switchoffatomic rhand_clap
		<name> :switchoffatomic rhand_fist
		<name> :switchonatomic <part>
	endif
endscript

script crowd_sethand \{name = crowd1
		hand = left
		type = clap}
	if compositeobjectexists <name>
		<name> :set_crowd_hand hand = <hand> type = <type>
	endif
endscript

script crowd_startlighters 
	killspawnedscript \{name = crowd_monitor_performance}
	spawnscriptnow \{crowd_monitor_performance}
endscript

script crowd_monitor_performance 
	lighters_on = false
	begin
	get_skill_level
	if (<skill> != bad)
		if (<lighters_on> = false)
			crowd_allsethand \{hand = right
				type = lighter}
			crowd_allplayanim \{anim = special}
			lighters_on = true
			crowd_togglelighters \{on}
		endif
	else
		if (<lighters_on> = true)
			crowd_allsethand \{hand = right
				type = clap}
			crowd_allplayanim \{anim = idle}
			lighters_on = false
			crowd_togglelighters \{off}
		endif
	endif
	wait \{1
		gameframe}
	repeat
endscript

script crowd_stoplighters 
	killspawnedscript \{name = crowd_monitor_performance}
	crowd_allsethand \{hand = right
		type = clap}
	crowd_allplayanim \{anim = idle}
	crowd_togglelighters \{off}
endscript

script crowd_allsethand 
	crowd_sethand name = crowd1 hand = <hand> type = <type>
	crowd_sethand name = crowd2 hand = <hand> type = <type>
	crowd_sethand name = crowd3 hand = <hand> type = <type>
	crowd_sethand name = crowd4 hand = <hand> type = <type>
	crowd_sethand name = crowd5 hand = <hand> type = <type>
	crowd_sethand name = crowd6 hand = <hand> type = <type>
	crowd_sethand name = crowd7 hand = <hand> type = <type>
	crowd_sethand name = crowd8 hand = <hand> type = <type>
endscript

script crowd_allplayanim 
	wait \{1
		gameframe}
	crowd_playanim name = crowd1 anim = <anim>
	wait \{1
		gameframe}
	crowd_playanim name = crowd2 anim = <anim>
	wait \{1
		gameframe}
	crowd_playanim name = crowd3 anim = <anim>
	wait \{1
		gameframe}
	crowd_playanim name = crowd4 anim = <anim>
	wait \{1
		gameframe}
	crowd_playanim name = crowd5 anim = <anim>
	wait \{1
		gameframe}
	crowd_playanim name = crowd6 anim = <anim>
	wait \{1
		gameframe}
	crowd_playanim name = crowd7 anim = <anim>
	wait \{1
		gameframe}
	crowd_playanim name = crowd8 anim = <anim>
endscript

script crowd_playanim \{name = crowd1
		anim = idle}
	if NOT compositeobjectexists <name>
		return
	endif
	if structurecontains structure = ($crowd_profiles) name = <name>
		anim_set = ($crowd_profiles.<name>.anim_set)
		<name> :obj_killspawnedscript name = crowd_play_adjusting_random_anims
		<name> :obj_spawnscriptnow crowd_play_adjusting_random_anims params = {anim_set = <anim_set> anim = <anim>}
	else
		printf channel = crowd "animset not found for %a......" a = <name>
	endif
endscript

script crowd_create_lighters 
	getpakmancurrent \{map = zones}
	if (<pak> = z_artdeco)
		return
	endif
	getpakmancurrentname \{map = zones}
	index = 0
	begin
	if (<index> < 10)
		formattext checksumname = crowd_lighter '%s_LIGHTER_Geo0%a' s = <pakname> a = <index>
	else
		formattext checksumname = crowd_lighter '%s_LIGHTER_Geo%a' s = <pakname> a = <index>
	endif
	if compositeobjectexists name = <crowd_lighter>
		<crowd_lighter> :hide
	else
		if isinnodearray <crowd_lighter>
			if NOT iscreated <crowd_lighter>
				create name = <crowd_lighter>
				if compositeobjectexists name = <crowd_lighter>
					<crowd_lighter> :hide
				else
					printf "failed to create lighter object %a! ...." a = <crowd_lighter>
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

script crowd_togglelighters 
	getpakmancurrentname \{map = zones}
	index = 0
	begin
	if (<index> < 10)
		formattext checksumname = crowd_lighter '%s_LIGHTER_Geo0%a' s = <pakname> a = <index>
	else
		formattext checksumname = crowd_lighter '%s_LIGHTER_Geo%a' s = <pakname> a = <index>
	endif
	if compositeobjectexists name = <crowd_lighter>
		if gotparam \{on}
			<crowd_lighter> :unhide
		elseif gotparam \{off}
			<crowd_lighter> :hide
		endif
	endif
	index = (<index> + 1)
	if (<index> = 15)
		break
	endif
	repeat
endscript

script crowd_stagediver_hide \{index = 1}
	getpakmancurrentname \{map = zones}
	formattext checksumname = stagediver '%s_TRG_Ped_StageDive0%a' s = <pakname> a = <index>
	if compositeobjectexists name = <stagediver>
		<stagediver> :hide
	endif
endscript

script crowd_stagediver_jump \{index = 1}
	getpakmancurrentname \{map = zones}
	formattext checksumname = stagediver '%s_TRG_Ped_StageDive0%a' s = <pakname> a = <index>
	if compositeobjectexists name = <stagediver>
		<stagediver> :unhide
		getpakmancurrent \{map = zones}
		if structurecontains structure = ($stagediver_anims) name = <pak>
			anims = ($stagediver_anims.<pak>)
		else
			anims = ($stagediver_anims.`default`)
		endif
		getarraysize <anims>
		getrandomvalue name = anim_index integer a = 0 b = (<array_size> - 1)
		anim_name = (<anims> [<anim_index>])
		printf channel = crowd "Playing stagedive anim %a ....." a = <anim_name>
		<stagediver> :gameobj_playanim anim = <anim_name>
		<stagediver> :gameobj_waitanimfinished
		<stagediver> :hide
	else
		printf \{channel = crowd
			"Stagediver not found........."}
	endif
endscript
