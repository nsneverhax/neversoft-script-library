skate_cutscene_info = [
	{
		menutext = "--TEST--"
		name = ' '
		spacer
	}
	{
		menutext = "TEST1"
		name = 'test1'
		playmode = full
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = PedA02_BODY
				gameobj = m_cutscene_01_ped_01
			}
			{
				cutobj = PedB02_BODY
				gameobj = m_cutscene_01_ped_02
			}
			{
				cutobj = PedC02_BODY
				gameobj = m_cutscene_01_ped_03
			}
			{
				cutobj = PedD02_BODY
				gameobj = m_cutscene_01_ped_04
			}
			{
				cutobj = PedE02_BODY
				gameobj = m_cutscene_01_ped_05
			}
			{
				cutobj = PedF02_BODY
				gameobj = m_cutscene_01_ped_06
			}
		]
	}
	{
		menutext = "TEST2"
		name = 'test2'
		playmode = full
		objectplaybackrefs = [
			{
				cutobj = _BODY
				gameobj = skater
			}
		]
	}
	{
		menutext = "TEST3"
		name = 'test3'
		playmode = full
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = Ped02_BODY
				gameobj = m_cutscene_01_ped_02
			}
		]
	}
	{
		menutext = "TEST4"
		name = 'test4'
		playmode = full
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = Ped01_BODY
				gameobj = m_cutscene_01_ped_01
			}
			{
				cutobj = Ped02_BODY
				gameobj = m_cutscene_01_ped_02
			}
			{
				cutobj = Ped03_BODY
				gameobj = m_cutscene_01_ped_05
			}
		]
	}
	{
		menutext = "R1_CUTSCENE_1"
		MenuCategory = rigger
		name = 'c_r1_buildkick_intro'
		zone = z_slums
		playmode = full
		SyncBink = 'c_r1_buildkick_intro'
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = Rube_BODY
				gameobj = m_cutscene_01_ped_04
			}
		]
	}
	{
		menutext = "R1_BuildKick_Outro"
		MenuCategory = rigger
		name = 'c_r1_buildkick_outro'
		zone = z_slums
		playmode = full
		SyncBink = 'c_r1_buildkick_outro'
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = _BODY
				gameobj = skater
			}
			{
				cutobj = Rube_BODY
				gameobj = m_cutscene_01_ped_04
			}
		]
	}
	{
		menutext = "R1_Post_Video_Submit"
		MenuCategory = rigger
		name = 'c_r1_postvid'
		zone = z_slums
		playmode = full
		SyncBink = 'c_r1_postvid'
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = _BODY
				gameobj = skater
			}
			{
				cutobj = Rube_BODY
				gameobj = m_cutscene_01_ped_04
			}
			{
				cutobj = Jeff_BODY
				gameobj = m_cutscene_01_ped_05
			}
		]
	}
	{
		menutext = "R1_cutscene_2"
		MenuCategory = rigger
		name = 'c_r1_buildqp_intro'
		zone = z_crib
		playmode = full
		SyncBink = 'c_r1_buildqp_intro'
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = _BODY
				gameobj = skater
			}
			{
				cutobj = Rube_BODY
				gameobj = m_cutscene_01_ped_04
			}
		]
	}
	{
		menutext = "R1_Demo_intro"
		MenuCategory = rigger
		name = 'c_r1_demo_intro'
		zone = z_harbor
		playmode = Goalintro
		SyncBink = 'c_r1_demo_intro'
		objectplaybackrefs = [
			{
				cutobj = _BODY
				gameobj = skater
			}
			{
				cutobj = Jeff_BODY
				gameobj = alias_goalped1
				relativescenecenter
			}
		]
		$CutsceneTemplate_GoalIntroStatic
	}
	{
		menutext = "R1_Buildspine_intro"
		MenuCategory = rigger
		name = 'c_r1_buildspine_intro'
		zone = z_bw_bridge
		playmode = Goalintro
		SyncBink = 'c_r1_buildspine_intro'
		objectplaybackrefs = [
			{
				cutobj = _BODY
				gameobj = skater
			}
			{
				cutobj = Jeff_BODY
				gameobj = alias_goalped1
				relativescenecenter
			}
		]
		$CutsceneTemplate_GoalIntroDynamic
	}
	{
		menutext = "R1_Showdown_intro"
		MenuCategory = rigger
		name = 'c_r1_showdown_intro'
		zone = z_monuments
		playmode = Goalintro
		SyncBink = 'c_r1_showdown_intro'
		objectplaybackrefs = [
			{
				cutobj = _BODY
				gameobj = skater
			}
			{
				cutobj = Jeff_BODY
				gameobj = alias_goalped1
				relativescenecenter
			}
		]
		$CutsceneTemplate_GoalIntroDynamic
	}
	{
		menutext = "R1_Showdown_outro"
		MenuCategory = rigger
		name = 'c_r1_showdown_outro'
		zone = z_monuments
		playmode = full
		SyncBink = 'c_r1_showdown_outro'
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = _BODY
				gameobj = skater
			}
			{
				cutobj = Jeff_BODY
				gameobj = alias_goalped1
			}
			{
				cutobj = Rube_BODY
				gameobj = m_cutscene_01_ped_04
			}
			{
				cutobj = FanA_BODY
				gameobj = RPed_Dummy_Gangster01
			}
			{
				cutobj = FanB_BODY
				gameobj = RPed_Skater_Teens_M
			}
			{
				cutobj = FanC_BODY
				gameobj = RPed_F_SkaterTeens_NoBoard01
			}
			{
				cutobj = FanD_BODY
				gameobj = RPed_M_SkaterTeens_NoBoard01
			}
			{
				cutobj = FanE_BODY
				gameobj = RPed_Dummy_M_SkaterTeens_NoBoard01
			}
			{
				cutobj = FanF_BODY
				gameobj = RPed_Dummy_Generic_Male01
			}
		]
	}
	{
		menutext = "R2_skateoff_intro"
		MenuCategory = rigger
		name = 'c_r2_skateoff_intro'
		SyncBink = 'c_r2_skateoff_intro'
		playmode = full
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = Bam_BODY
				gameobj = alias_goalped1
			}
			{
				cutobj = Producer_BODY
				gameobj = alias_goalped2
			}
		]
		$CutsceneTemplate_GoalIntroDynamic
	}
	{
		menutext = "R2_skateoff_outro"
		MenuCategory = rigger
		name = 'c_r2_skateoff_outro'
		zone = z_museums
		SyncBink = 'c_r2_skateoff_outro'
		playmode = full
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = Bam_BODY
				gameobj = alias_goalped1
			}
			{
				cutobj = Producer_BODY
				gameobj = alias_goalped2
			}
		]
		$CutsceneTemplate_GoalIntroDynamic
	}
	{
		menutext = "R2_show1_intro"
		MenuCategory = rigger
		name = 'c_r2_show1_intro'
		zone = z_bw_bridge
		SyncBink = 'c_r2_show1_intro'
		playmode = Goalintro
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = Shayne_BODY
				gameobj = alias_goalped1
				relativescenecenter
			}
		]
		$CutsceneTemplate_GoalIntroDynamic
	}
	{
		menutext = "R2_show1_outro"
		MenuCategory = rigger
		name = 'c_r2_show1_outro'
		SyncBink = 'c_r2_show1_outro'
		playmode = full
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = Shayne_BODY
				gameobj = alias_goalped1
			}
		]
		$CutsceneTemplate_GoalIntroDynamic
	}
	{
		menutext = "R2_show2_intro"
		MenuCategory = rigger
		name = 'c_r2_show2_intro'
		playmode = Goalintro
		SyncBink = 'c_r2_show2_intro'
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = Shayne_BODY
				gameobj = alias_goalped1
				relativescenecenter
			}
		]
		$CutsceneTemplate_GoalIntroDynamic
	}
	{
		menutext = "R2_show2_outro"
		MenuCategory = rigger
		name = 'c_r2_show2_outro'
		SyncBink = 'c_r2_show2_outro'
		playmode = full
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = _BODY
				gameobj = skater
			}
			{
				cutobj = Bam_BODY
				gameobj = alias_goalped1
			}
			{
				cutobj = Producer_BODY
				gameobj = RPed_Skater_Teens_M
			}
		]
	}
	{
		menutext = "R2_climb_intro"
		MenuCategory = rigger
		name = 'c_r2_climb_intro'
		zone = z_bell
		SyncBink = 'c_r2_climb_intro'
		playmode = full
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
		]
	}
	{
		menutext = "R2_climb_outro"
		MenuCategory = rigger
		name = 'c_r2_climb_outro'
		SyncBink = 'c_r2_climb_outro'
		playmode = full
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = Bam_BODY
				gameobj = alias_goalped1
			}
			{
				cutobj = Shayne_BODY
				gameobj = alias_goalped2
			}
		]
		$CutsceneTemplate_GoalIntroDynamic
	}
	{
		menutext = "R2_breakin_intro"
		MenuCategory = rigger
		name = 'c_r2_breakin_intro'
		zone = z_museums
		SyncBink = 'c_r2_breakin_intro'
		playmode = full
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = Shayne_BODY
				gameobj = alias_goalped1
			}
			{
				cutobj = Guard1_BODY
				gameobj = alias_goalped2
			}
			{
				cutobj = Guard2_BODY
				gameobj = alias_goalped3
			}
			{
				cutobj = ped_body
				gameobj = alias_goalped4
			}
		]
		$CutsceneTemplate_GoalIntroDynamic
	}
	{
		menutext = "R3_CUTSCENE_1"
		MenuCategory = rigger
		name = 'C_R3_Museums_intro'
		zone = z_museums
		playmode = full
		SyncBink = 'c_r3_museums_intro'
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = Rodney_BODY
				gameobj = alias_goalped1
			}
			{
				cutobj = Daewon_BODY
				gameobj = alias_goalped2
			}
		]
	}
	{
		menutext = "R3_Monuments_outro"
		MenuCategory = rigger
		name = 'C_R3_Monuments_outro'
		zone = z_monuments
		playmode = full
		SyncBink = 'c_r3_monuments_outro'
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = Daewon_BODY
				gameobj = alias_goalped1
			}
		]
	}
	{
		menutext = "R3_Harbor_intro"
		MenuCategory = rigger
		name = 'C_R3_Harbor_intro'
		zone = z_harbor
		playmode = Goalintro
		SyncBink = 'c_r3_harbor_intro'
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = Vanessa_BODY
				gameobj = alias_goalped1
				relativescenecenter
			}
		]
		$CutsceneTemplate_GoalIntroDynamic
	}
	{
		menutext = "R3_BCity_outro"
		MenuCategory = rigger
		name = 'C_R3_BCity_outro'
		zone = z_bcity
		playmode = full
		SyncBink = 'c_r3_bcity_outro'
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = Vanessa_BODY
				gameobj = alias_goalped1
				relativescenecenter
			}
		]
		$CutsceneTemplate_GoalIntroDynamic
	}
	{
		menutext = "R3_Slums_intro"
		MenuCategory = rigger
		name = 'C_R3_Slums_intro'
		zone = z_slums
		playmode = Goalintro
		SyncBink = 'c_r3_Slums_Intro'
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = Rodney_BODY
				gameobj = alias_goalped1
				relativescenecenter
			}
		]
		$CutsceneTemplate_GoalIntroDynamic
	}
	{
		menutext = "R3_Bell_intro"
		MenuCategory = rigger
		name = 'C_R3_Bell_intro'
		zone = z_bell
		playmode = Goalintro
		SyncBink = 'c_r3_bell_intro'
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = Rodney_BODY
				gameobj = alias_goalped1
				relativescenecenter
			}
		]
		$CutsceneTemplate_GoalIntroDynamic
	}
	{
		menutext = "R3_Bell_outro"
		MenuCategory = rigger
		name = 'C_R3_Bell_outro'
		zone = z_bell
		playmode = full
		SyncBink = 'c_r3_bell_outro'
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
		]
	}
	{
		menutext = "R3_Uber_Rigger_Cutscene"
		MenuCategory = rigger
		name = 'c_uber_rigger_cutscene'
		zone = z_slums
		SyncBink = 'c_uber_rigger_cutscene'
		playmode = full
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = _BODY
				gameobj = skater
			}
			{
				cutobj = Tony_BODY
				gameobj = m_cutscene_01_ped_01
			}
		]
	}
	{
		menutext = "C_Uber_Rigger_IGC"
		MenuCategory = rigger
		name = 'c_Uber_Rigger_IGC'
		zone = z_slums
		playmode = full
		SyncBink = 'c_Uber_Rigger_IGC'
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = Tony_BODY
				gameobj = m_cutscene_01_ped_01
			}
			{
				cutobj = Bam_BODY
				gameobj = m_cutscene_01_ped_02
			}
			{
				cutobj = Daewon_BODY
				gameobj = m_cutscene_01_ped_03
				cutobj = Jeff_BODY
				gameobj = m_cutscene_01_ped_04
			}
			{
				cutobj = Rodney_BODY
				gameobj = m_cutscene_01_ped_05
			}
		]
	}
	{
		menutext = "C1_CUTSCENE_1"
		MenuCategory = career
		name = 'c_c1_ntt_intro'
		zone = z_slums
		zone = z_slums
		playmode = full
		SyncBink = 'c_c1_ntt_intro'
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = _BODY
				gameobj = skater
			}
			{
				cutobj = Skater2_BODY
				gameobj = m_cutscene_01_ped_04
			}
			{
				cutobj = Arto_BODY
				gameobj = m_cutscene_01_ped_05
			}
		]
	}
	{
		menutext = "C1_Demo_Invite"
		MenuCategory = career
		name = 'c_c1_invite'
		zone = z_slums
		playmode = Goalintro
		SyncBink = 'C_C1_Invite'
		objectplaybackrefs = [
			{
				cutobj = Arto_BODY
				gameobj = alias_goalped1
				relativescenecenter
			}
			{
				cutobj = Prime_BODY
				gameobj = skater
			}
		]
		$CutsceneTemplate_GoalIntroDynamic
	}
	{
		menutext = "C1_Demo_Impress"
		MenuCategory = career
		name = 'c_c1_impress'
		zone = z_bcity
		playmode = full
		SyncBink = 'C_C1_Impress'
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = Arto_BODY
				gameobj = alias_goalped1
				relativescenecenter
			}
			{
				cutobj = Prime_BODY
				gameobj = skater
			}
		]
		$CutsceneTemplate_GoalIntroStatic
	}
	{
		menutext = "C1_CUTSCENE_2"
		MenuCategory = career
		name = 'C_C1_CUTSCENE_2'
		zone = z_bcity
		zone = z_bcity
		SyncBink = 'c_c1_impress_outro'
		playmode = full
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = Arto_BODY
				gameobj = alias_goalped1
			}
		]
	}
	{
		menutext = "C1_CUTSCENE_3"
		MenuCategory = career
		name = 'C_C1_CUTSCENE_3'
		zone = z_bcity
		playmode = full
		SyncBink = 'c_c1_cutscene_3'
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = Greg01b_BODY
				gameobj = m_cutscene_01_ped_01
			}
			{
				cutobj = Jeff02c_BODY
				gameobj = m_cutscene_01_ped_02
			}
			{
				cutobj = Kristina02c_BODY
				gameobj = m_cutscene_01_ped_03
			}
		]
	}
	{
		menutext = "C1_Demo_Practice"
		MenuCategory = career
		name = 'c_c1_practice1'
		zone = z_bw_bridge
		playmode = Goalintro
		SyncBink = 'C_C1_Practice1'
		objectplaybackrefs = [
			{
				cutobj = Arto_BODY
				gameobj = alias_goalped1
				relativescenecenter
			}
			{
				cutobj = Prime_BODY
				gameobj = skater
			}
		]
		$CutsceneTemplate_GoalIntroDynamic
	}
	{
		menutext = "C1_Demo_Film"
		MenuCategory = career
		name = 'c_c1_film1'
		zone = z_monuments
		playmode = Goalintro
		SyncBink = 'C_C1_Film1'
		objectplaybackrefs = [
			{
				cutobj = Arto_BODY
				gameobj = alias_goalped1
				relativescenecenter
			}
			{
				cutobj = Prime_BODY
				gameobj = skater
			}
			{
				cutobj = Nyjah_BODY
				gameobj = alias_goalped2
			}
		]
		$CutsceneTemplate_GoalIntroDynamic
	}
	{
		menutext = "C1_CUTSCENE_4"
		MenuCategory = career
		name = 'C_C1_CUTSCENE_4'
		zone = z_monuments
		SyncBink = 'c_c1_film1_outro'
		playmode = full
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
		]
	}
	{
		menutext = "C2_cutscene_1"
		MenuCategory = career
		name = 'c_c2_revman_intro'
		zone = z_harbor
		playmode = full
		SyncBink = 'c_c2_revman_intro'
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
		]
	}
	{
		menutext = "C2_NTG_intro"
		MenuCategory = career
		name = 'c_c2_NTG_intro'
		zone = z_harbor
		playmode = Goalintro
		SyncBink = 'C_C2_NTG'
		AduioBuss = IGCs
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = Bob_BODY
				gameobj = alias_goalped1
				relativescenecenter
			}
		]
		$CutsceneTemplate_GoalIntroDynamic
	}
	{
		menutext = "C2_Localcomp_intro"
		MenuCategory = career
		name = 'c_c2_localcomp_intro'
		zone = z_lansdowne
		playmode = Goalintro
		AduioBuss = IGCs
		SyncBink = 'c_c2_localcomp_intro'
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = Bob_BODY
				gameobj = alias_goalped1
				relativescenecenter
			}
			{
				cutobj = Eric_BODY
				gameobj = alias_goalped2
			}
		]
		$CutsceneTemplate_GoalIntroDynamic
	}
	{
		menutext = "C2_localcomp_outro"
		MenuCategory = career
		name = 'c_c2_localcomp_outro'
		zone = z_lansdowne
		playmode = full
		SyncBink = 'c_c2_localcomp_outro'
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
		]
	}
	{
		menutext = "C2_CompStreet_intro"
		MenuCategory = career
		name = 'c_c2_compstreet_intro'
		zone = z_love
		playmode = full
		SyncBink = 'c_c2_compstreet_intro'
		AduioBuss = IGCs
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = Sheckler_BODY
				gameobj = alias_goalped1
				relativescenecenter
			}
		]
		$CutsceneTemplate_GoalIntroDynamic
	}
	{
		menutext = "C2_Compvert_intro"
		MenuCategory = career
		name = 'c_c2_compvert_intro'
		zone = z_monuments
		playmode = Goalintro
		AduioBuss = IGCs
		SyncBink = 'c_c2_compvert_intro'
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = Bob_BODY
				gameobj = alias_goalped1
				relativescenecenter
			}
			{
				cutobj = Eric_BODY
				gameobj = alias_goalped2
			}
			{
				cutobj = Tony_BODY
				gameobj = alias_goalped3
			}
		]
		$CutsceneTemplate_GoalIntroDynamic
	}
	{
		menutext = "C2_Comppark_intro"
		MenuCategory = career
		name = 'c_c2_comppark_intro'
		zone = z_harbor
		SyncBink = 'c_c2_comppark_intro'
		playmode = full
		AduioBuss = IGCs
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = Bob_BODY
				gameobj = alias_goalped1
			}
			{
				cutobj = Eric_BODY
				gameobj = alias_goalped2
			}
		]
		$CutsceneTemplate_GoalIntroDynamic
	}
	{
		menutext = "C2_comppark_outro"
		MenuCategory = career
		name = 'c_c2_comppark_outro'
		zone = z_harbor
		playmode = full
		SyncBink = 'c_c2_comppark_outro'
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
		]
	}
	{
		menutext = "C3_CUTSCENE_1"
		MenuCategory = career
		name = 'c_c3_photo2_intro'
		zone = z_love
		playmode = full
		SyncBink = 'c_c3_photo2_intro'
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = _BODY
				gameobj = skater
			}
			{
				cutobj = Mel_BODY
				gameobj = m_cutscene_01_ped_05
			}
		]
	}
	{
		menutext = "C3_CUTSCENE_2"
		MenuCategory = career
		name = 'c_c3_photosession_intro'
		zone = z_love
		playmode = full
		SyncBink = 'c_c3_photosession_intro'
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = _BODY
				gameobj = skater
			}
			{
				cutobj = Mel_BODY
				gameobj = m_cutscene_01_ped_04
			}
			{
				cutobj = Stevie_BODY
				gameobj = m_cutscene_01_ped_06
			}
			{
				cutobj = Bryce_BODY
				gameobj = m_cutscene_01_ped_05
			}
		]
	}
	{
		menutext = "C3_PhotoThemed_intro"
		MenuCategory = career
		name = 'C_C3_photothemed_intro'
		zone = z_slums
		playmode = Goalintro
		SyncBink = 'c_c3_photothemed_intro'
		audiobuss = IGCs
		objectplaybackrefs = [
			{
				cutobj = Stevie_BODY
				gameobj = alias_goalped1
				relativescenecenter
			}
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
		]
		$CutsceneTemplate_GoalIntroDynamic
	}
	{
		menutext = "C3_EpicPhoto"
		MenuCategory = career
		name = 'C_C3_epicphoto'
		zone = z_slums
		playmode = full
		SyncBink = 'C_C3_Epicphoto1_intro'
		audiobuss = IGCs
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = Stevie_BODY
				gameobj = alias_goalped1
				relativescenecenter
			}
			{
				cutobj = Photog_BODY
				gameobj = alias_goalped2
			}
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
		]
	}
	{
		MenuCategory = career
		menutext = "C3_cutscene_3"
		MenuCategory = career
		name = 'c_c3_epicphoto4_outro'
		zone = z_love
		playmode = full
		SyncBink = 'c_c3_epicphoto4_outro'
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = Mel_BODY
				gameobj = m_cutscene_01_ped_05
			}
			{
				cutobj = Stevie_BODY
				gameobj = m_cutscene_01_ped_03
			}
		]
	}
	{
		menutext = "C_Uber_Career_IGC"
		MenuCategory = career
		name = 'c_Uber_Career_IGC'
		zone = z_monuments
		playmode = full
		SyncBink = 'c_Uber_Career_IGC'
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = Tony_BODY
				gameobj = m_cutscene_01_ped_01
			}
		]
	}
	{
		menutext = "C_Uber_Career_outro"
		MenuCategory = career
		name = 'c_Uber_Career_outro'
		zone = z_monuments
		playmode = full
		SyncBink = 'c_uber_career_Outro'
		UseFadeToBlack
		disableusermusic
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
		]
	}
	{
		menutext = "C_Uber_Career_Arto"
		MenuCategory = career
		name = 'c_uber_career_arto'
		zone = z_monuments
		playmode = full
		objectplaybackrefs = [
			{
				cutobj = Arto_BODY
				gameobj = m_cutscene_01_ped_01
			}
		]
	}
	{
		menutext = "C_Uber_Career_Stevie"
		MenuCategory = career
		name = 'c_uber_career_stevie'
		zone = z_monuments
		playmode = full
		objectplaybackrefs = [
			{
				cutobj = Stevie_BODY
				gameobj = m_cutscene_01_ped_01
			}
		]
	}
	{
		menutext = "C_Uber_Career_Eric_vs_Bob"
		MenuCategory = career
		name = 'c_uber_career_eric_vs_bob'
		zone = z_monuments
		playmode = full
		objectplaybackrefs = [
			{
				cutobj = Eric_BODY
				gameobj = m_cutscene_01_ped_01
			}
			{
				cutobj = Bob_BODY
				gameobj = m_cutscene_01_ped_02
			}
		]
	}
	{
		menutext = "H1_CUTSCENE_1"
		MenuCategory = hardcore
		name = 'c_h1_bigpush_intro'
		zone = z_slums
		playmode = full
		SyncBink = 'c_h1_bigpush_intro'
		UseFadeToBlack
		object
		mappings
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = MikeV_BODY
				gameobj = alias_goalped2
			}
			{
				cutobj = Bosco_BODY
				gameobj = alias_goalped1
			}
		]
	}
	{
		menutext = "H1_BigPush_outro"
		MenuCategory = hardcore
		name = 'C_H1_BigPush_outro'
		zone = z_slums
		playmode = full
		SyncBink = 'C_H1_BigPush_outro'
		audiobuss = IGCs
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = MikeV_BODY
				gameobj = alias_goalped1
				relativescenecenter
			}
			{
				cutobj = Cooper_BODY
				gameobj = alias_goalped2
			}
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
		]
	}
	{
		menutext = "H1_BigSpines_outro"
		MenuCategory = hardcore
		name = 'C_H1_BigSpines_outro'
		zone = z_love
		SyncBink = 'C_H1_Bigspines_Outro'
		playmode = full
		audiobuss = IGCs
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = MikeV_BODY
				gameobj = alias_goalped1
				relativescenecenter
			}
			{
				cutobj = Andrew_BODY
				gameobj = alias_goalped2
			}
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
		]
	}
	{
		menutext = "H1_EpicDrop_outro"
		MenuCategory = hardcore
		name = 'C_H1_EpicDrop_outro'
		zone = z_love
		playmode = full
		SyncBink = 'c_h1_epicdrop_outro'
		audiobuss = IGCs
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = MikeV_BODY
				gameobj = alias_goalped1
				relativescenecenter
			}
			{
				cutobj = Andrew_BODY
				gameobj = m_cutscene_01_ped_03
			}
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
		]
	}
	{
		menutext = "H1_CUTSCENE_2"
		MenuCategory = hardcore
		name = 'c_h1_cutscene2'
		zone = z_crib
		playmode = full
		SyncBink = 'c_h1_cutscene2'
		UseFadeToBlack
		object
		mappings
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = MikeV_BODY
				gameobj = alias_goalped2
			}
			{
				cutobj = Bosco_BODY
				gameobj = alias_goalped1
			}
		]
	}
	{
		menutext = "H1_BoostPull_intro"
		MenuCategory = hardcore
		name = 'C_H1_BoostPull_intro'
		zone = z_bell
		playmode = Goalintro
		SyncBink = 'c_h1_boostpull_intro'
		audiobuss = IGCs
		objectplaybackrefs = [
			{
				cutobj = MikeV_BODY
				gameobj = alias_goalped1
			}
			{
				cutobj = Cooper_BODY
				gameobj = alias_goalped2
			}
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
		]
		$CutsceneTemplate_GoalIntroStatic
	}
	{
		menutext = "H1_FinalEpic_intro"
		MenuCategory = hardcore
		name = 'C_H1_FinalEpic_intro'
		zone = z_monuments
		playmode = Goalintro
		audiobuss = IGCs
		SyncBink = 'c_h1_finalepic_intro'
		objectplaybackrefs = [
			{
				cutobj = MikeV_BODY
				gameobj = alias_goalped1
				relativescenecenter
			}
			{
				cutobj = Cooper_BODY
				gameobj = alias_goalped2
			}
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
		]
		$CutsceneTemplate_GoalIntroDynamic
	}
	{
		menutext = "H1_CUTSCENE_3"
		MenuCategory = hardcore
		name = 'c_h1_finalepic_outro'
		zone = z_museums
		playmode = full
		SyncBink = 'c_h1_finalepic_outro'
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = _BODY
				gameobj = skater
			}
			{
				cutobj = MikeV_BODY
				gameobj = m_cutscene_01_ped_05
			}
			{
				cutobj = Bosco_BODY
				gameobj = m_cutscene_01_ped_04
			}
			{
				cutobj = Cooper_BODY
				gameobj = m_cutscene_01_ped_03
			}
		]
	}
	{
		menutext = "H2_clearmuseums_outro"
		MenuCategory = hardcore
		name = 'c_h2_clearmuseums_outro'
		zone = z_monuments
		playmode = full
		audiobuss = IGCs
		SyncBink = 'c_h2_clearmuseums_outro'
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = Dustin_BODY
				gameobj = alias_goalped1
				relativescenecenter
			}
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = BodyA_BODY
				gameobj = BodyA
			}
			{
				cutobj = BodyB_BODY
				gameobj = BodyB
			}
			{
				cutobj = BodyC_BODY
				gameobj = BodyC
			}
		]
	}
	{
		menutext = "H2_learncheck_intro"
		MenuCategory = hardcore
		name = 'c_h2_learncheck_intro'
		zone = z_monuments
		playmode = Goalintro
		audiobuss = IGCs
		SyncBink = 'c_h2_learncheck_intro'
		objectplaybackrefs = [
			{
				cutobj = Dustin_BODY
				gameobj = alias_goalped1
				relativescenecenter
			}
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
		]
		$CutsceneTemplate_GoalIntroDynamic
	}
	{
		menutext = "H2_bossbattle_intro"
		MenuCategory = hardcore
		name = 'c_h2_bossbattle_intro'
		zone = z_fdr
		SyncBink = 'c_h2_bossbattle_intro'
		playmode = full
		audiobuss = IGCs
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = Dustin_BODY
				gameobj = alias_goalped1
				relativescenecenter
			}
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = Cam_BODY
				gameobj = alias_goalped2
			}
			{
				cutobj = Ped1_BODY
				gameobj = ped1
			}
			{
				cutobj = Ped2_BODY
				gameobj = ped2
			}
			{
				cutobj = Ped3_BODY
				gameobj = ped3
			}
			{
				cutobj = Ped4_BODY
				gameobj = ped4
			}
			{
				cutobj = Ped5_BODY
				gameobj = ped5
			}
			{
				cutobj = Ped6_BODY
				gameobj = ped6
			}
		]
	}
	{
		menutext = "H2_bossbattle_outro"
		MenuCategory = hardcore
		name = 'c_h2_bossbattle_outro'
		zone = z_fdr
		playmode = full
		SyncBink = 'c_h2_bossbattle_outro'
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
		]
	}
	{
		menutext = "H2_clearbcity_intro"
		MenuCategory = hardcore
		name = 'c_h2_clearbcity_intro'
		zone = z_monuments
		playmode = Goalintro
		audiobuss = IGCs
		SyncBink = 'c_h2_clearbcity_intro'
		objectplaybackrefs = [
			{
				cutobj = Dustin_BODY
				gameobj = alias_goalped1
				relativescenecenter
			}
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = Jereme_BODY
				gameobj = alias_goalped2
			}
		]
		$CutsceneTemplate_GoalIntroDynamic
	}
	{
		menutext = "H2_clearbcity_outro"
		MenuCategory = hardcore
		name = 'c_h2_clearbcity_outro'
		zone = z_monuments
		playmode = full
		audiobuss = IGCs
		SyncBink = 'c_h2_clearbcity_outro'
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = Dustin_BODY
				gameobj = alias_goalped1
				relativescenecenter
			}
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = Jereme_BODY
				gameobj = alias_goalped2
			}
		]
	}
	{
		menutext = "H2_boneless_intro"
		MenuCategory = hardcore
		name = 'c_h2_boneless_intro'
		zone = z_fdr
		playmode = full
		audiobuss = IGCs
		SyncBink = 'c_h2_boneless_intro'
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = Dustin_BODY
				gameobj = alias_goalped1
				relativescenecenter
			}
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
		]
	}
	{
		menutext = "H2_Boneless_Cutscene"
		MenuCategory = hardcore
		name = 'c_h2_boneless_cutscene'
		zone = z_fdr
		playmode = full
		SyncBink = 'c_h2_boneless_cutscene'
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = Cam_BODY
				gameobj = alias_goalped1
				relativescenecenter
			}
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
		]
	}
	{
		menutext = "H2_boneless_outro"
		MenuCategory = hardcore
		name = 'c_h2_boneless_outro'
		zone = z_fdr
		playmode = full
		audiobuss = IGCs
		SyncBink = 'c_h2_boneless_outro'
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = Dustin_BODY
				gameobj = alias_goalped1
				relativescenecenter
			}
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
		]
	}
	{
		menutext = "H2_Take_FDR_Outro"
		MenuCategory = hardcore
		name = 'c_h2_takefdr_outro'
		zone = z_fdr
		playmode = full
		UseDebugMemoryConfiguration
		SyncBink = 'c_h2_takefdr_outro'
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = _BODY
				gameobj = skater
			}
			{
				cutobj = Dustin_BODY
				gameobj = alias_goalped1
				relativescenecenter
			}
			{
				cutobj = Cam_BODY
				gameobj = alias_goalped2
			}
		]
	}
	{
		menutext = "H3_cutscene_1"
		MenuCategory = hardcore
		name = 'c_h3_NTB_intro'
		zone = z_bcity
		playmode = full
		UseDebugMemoryConfiguration
		SyncBink = 'c_h3_NTB_intro'
		UseFadeToBlack
		object
		mappings
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
		]
	}
	{
		menutext = "H3_NTB_outro"
		MenuCategory = hardcore
		name = 'C_H3_NTB_outro'
		zone = z_bcity
		playmode = full
		SyncBink = 'c_h3_ntb_outro'
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = Lance_BODY
				gameobj = alias_goalped1
			}
		]
	}
	{
		menutext = "H3_BowlComp_intro"
		MenuCategory = hardcore
		name = 'C_H3_BowlComp_intro'
		zone = z_fdr
		playmode = full
		SyncBink = 'C_H3_BowlComp_intro'
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = Lance_BODY
				gameobj = alias_goalped1
			}
			{
				cutobj = Ped_01_BODY
				gameobj = m_cutscene_01_ped_01
			}
			{
				cutobj = Ped_02_BODY
				gameobj = m_cutscene_01_ped_02
			}
			{
				cutobj = Ped_03_BODY
				gameobj = m_cutscene_01_ped_03
			}
		]
	}
	{
		menutext = "H3_CUTSCENE_2"
		MenuCategory = hardcore
		name = 'c_h3_bowlcomp_outro'
		zone = z_fdr
		playmode = full
		SyncBink = 'c_h3_bowlcomp_outro'
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = _BODY
				gameobj = skater
			}
			{
				cutobj = Lance_BODY
				gameobj = alias_goalped1
			}
			{
				cutobj = EddieX_BODY
				gameobj = m_cutscene_01_ped_08
			}
			{
				cutobj = FanA_BODY
				gameobj = m_cutscene_01_ped_01
			}
			{
				cutobj = FanB_BODY
				gameobj = m_cutscene_01_ped_05
			}
			{
				cutobj = FanC_BODY
				gameobj = m_cutscene_01_ped_03
			}
			{
				cutobj = FanD_BODY
				gameobj = m_cutscene_01_ped_04
			}
		]
	}
	{
		menutext = "H3_WallRides_intro"
		MenuCategory = hardcore
		name = 'C_H3_WallRides_intro'
		zone = z_bell
		playmode = Goalintro
		SyncBink = 'c_h3_wallrides_intro'
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = Lance_BODY
				gameobj = alias_goalped1
				relativescenecenter
			}
		]
		$CutsceneTemplate_GoalIntroDynamic
	}
	{
		menutext = "H3_Secret1_intro"
		MenuCategory = hardcore
		name = 'C_H3_Secret1_intro'
		zone = z_museums
		playmode = full
		SyncBink = 'c_h3_secret1_intro'
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = Lance_BODY
				gameobj = alias_goalped1
			}
		]
	}
	{
		menutext = "H3_secret2_intro"
		MenuCategory = hardcore
		name = 'C_H3_IntroToSecretSpot2'
		zone = z_bcity
		playmode = full
		SyncBink = 'c_h3_introtosecretspot2'
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = Lance_BODY
				gameobj = alias_goalped1
			}
			{
				cutobj = MadDog_BODY
				gameobj = m_cutscene_01_ped_05
			}
			{
				cutobj = EddieX_BODY
				gameobj = alias_goalped2
			}
		]
	}
	{
		menutext = "H3_cutscene_3"
		MenuCategory = hardcore
		name = 'c_h3_secret2_outro'
		zone = z_harbor
		playmode = full
		UseDebugMemoryConfiguration
		SyncBink = 'c_h3_secret2_outro'
		UseFadeToBlack
		object
		mappings
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
		]
	}
	{
		menutext = "C_Uber_Hardcore_IGC"
		MenuCategory = hardcore
		name = 'c_Uber_Hardcore_IGC'
		zone = z_bcity
		playmode = full
		SyncBink = 'c_Uber_Hardcore_IGC'
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = Tony_BODY
				gameobj = m_cutscene_01_ped_01
			}
		]
	}
	{
		menutext = "C_Uber_Hardcore_Cutscene"
		MenuCategory = hardcore
		name = 'c_uber_hardcore_cutscene'
		zone = z_crib
		playmode = full
		SyncBink = 'Hardcore_Uber_Cutscene'
		UseFadeToBlack
		disableusermusic
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
		]
	}
	{
		menutext = "C_Tutorial_1"
		name = 'c_tutorial_1'
		zone = z_slums
		SyncBink = 'c_tutorial_1'
		playmode = Goalintro
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = Tony_BODY
				gameobj = m_cutscene_01_ped_01
				relativescenecenter
			}
		]
		$CutsceneTemplate_GoalIntroDynamic
	}
	{
		menutext = "C_Tutorial_2"
		name = 'c_tutorial_2'
		zone = z_slums
		playmode = Goalintro
		SyncBink = 'c_tutorial2'
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = Tony_BODY
				gameobj = m_cutscene_01_ped_01
				relativescenecenter
			}
		]
		$CutsceneTemplate_GoalIntroDynamic
	}
	{
		menutext = "C_Tutorial_3"
		name = 'c_tutorial_3'
		zone = z_slums
		SyncBink = 'c_tutorial_3'
		playmode = full
		UseFadeToBlack
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = Tony_BODY
				gameobj = m_cutscene_01_ped_01
			}
		]
	}
	{
		menutext = "BinkSyncTEST"
		name = 'BinkSyncTEST'
		playmode = full
		SyncBink = 'bink_sync_test'
		objectplaybackrefs = [
			{
				cutobj = _BODY
				gameobj = skater
			}
		]
	}
	{
		menutext = "Ending - Career"
		name = 'C_Ending_career'
		playmode = full
		SyncBink = 'EndGame_Career'
		UseFadeToBlack
		fadetoblackcoverstartframes = 5
		object
		mappings
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = Ped01_BODY
				gameobj = alias_goalped01
			}
			{
				cutobj = Ped02_BODY
				gameobj = alias_goalped02
			}
			{
				cutobj = Ped03_BODY
				gameobj = alias_goalped03
			}
		]
	}
	{
		menutext = "Ending - Hardcore"
		name = 'C_Ending_hardcore'
		playmode = full
		SyncBink = 'EndGame_Hardcore'
		UseFadeToBlack
		fadetoblackcoverstartframes = 5
		object
		mappings
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = Ped01_BODY
				gameobj = alias_goalped01
			}
			{
				cutobj = Ped02_BODY
				gameobj = alias_goalped02
			}
			{
				cutobj = Ped03_BODY
				gameobj = alias_goalped03
			}
		]
	}
	{
		menutext = "Ending - Rigger"
		name = 'C_Ending_rigger'
		playmode = full
		SyncBink = 'EndGame_Rigger'
		UseFadeToBlack
		fadetoblackcoverstartframes = 5
		object
		mappings
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = Ped01_BODY
				gameobj = alias_goalped01
			}
			{
				cutobj = Ped02_BODY
				gameobj = alias_goalped02
			}
			{
				cutobj = Ped03_BODY
				gameobj = alias_goalped03
			}
		]
	}
	{
		menutext = "Crowd Test, Part A"
		name = 'crowd_test_a'
		playmode = full
		object
		mappings
		objectplaybackrefs = [
			{
				cutobj = Fan1_BODY
				gameobj = m_cutscene_01_ped_01
			}
			{
				cutobj = Fan2_BODY
				gameobj = m_cutscene_01_ped_02
			}
			{
				cutobj = Fan3_BODY
				gameobj = m_cutscene_01_ped_03
			}
			{
				cutobj = Fan4_BODY
				gameobj = m_cutscene_01_ped_04
			}
			{
				cutobj = Fan5_BODY
				gameobj = m_cutscene_01_ped_05
			}
			{
				cutobj = Fan6_BODY
				gameobj = m_cutscene_01_ped_06
			}
			{
				cutobj = Fan7_BODY
				gameobj = m_cutscene_01_ped_07
			}
			{
				cutobj = Fan8_BODY
				gameobj = m_cutscene_01_ped_08
			}
			{
				cutobj = Fan9_BODY
				gameobj = m_cutscene_01_ped_09
			}
		]
	}
	{
		menutext = ""
		name = ''
		spacer
	}
	{
		menutext = "TimingTEST"
		name = 'TimingTEST'
		playmode = full
		objectplaybackrefs = [
			{
				cutobj = PedA03_BODY
				gameobj = m_cutscene_timing_test_ped_hawk
			}
			{
				cutobj = PedB03_BODY
				gameobj = m_cutscene_timing_test_ped_mullen
			}
			{
				cutobj = PedC03_BODY
				gameobj = m_cutscene_timing_test_ped_burnquist
			}
		]
	}
	{
		menutext = ""
		name = ''
		spacer
	}
	{
		menutext = "Stress Test"
		name = 'Stress_Test'
		playmode = full
		object
		mappings
		objectplaybackrefs = [
			{
				cutobj = Fan1_BODY
				gameobj = m_cutscene_01_ped_01
			}
			{
				cutobj = Fan2_BODY
				gameobj = m_cutscene_01_ped_02
			}
			{
				cutobj = Fan3_BODY
				gameobj = m_cutscene_01_ped_03
			}
			{
				cutobj = Fan4_BODY
				gameobj = m_cutscene_01_ped_04
			}
			{
				cutobj = Fan5_BODY
				gameobj = m_cutscene_01_ped_05
			}
			{
				cutobj = Fan6_BODY
				gameobj = m_cutscene_01_ped_06
			}
			{
				cutobj = Fan7_BODY
				gameobj = m_cutscene_01_ped_07
			}
			{
				cutobj = Fan8_BODY
				gameobj = m_cutscene_01_ped_08
			}
			{
				cutobj = Fan9_BODY
				gameobj = m_cutscene_01_ped_09
			}
		]
	}
	{
		menutext = ""
		name = ''
		spacer
	}
	{
		menutext = "IGC TEST"
		name = 'rigger01'
		playmode = Goalintro
		audiostream = m_test_buildthere_intro
		audiobuss = IGCs
		objectplaybackrefs = [
			{
				cutobj = _BODY
				gameobj = alias_goalped1
				relativescenecenter
			}
		]
		$CutsceneTemplate_GoalIntroDynamic
	}
	{
		menutext = "IGC TEST"
		name = 'rigger02'
		playmode = Goalintro
		audiostream = m_test_buildgap_intro
		audiobuss = IGCs
		objectplaybackrefs = [
			{
				cutobj = _BODY
				gameobj = alias_goalped1
				relativescenecenter
			}
		]
		$CutsceneTemplate_GoalIntroDynamic
	}
	{
		menutext = "IGC TEST"
		name = 'rigger03'
		playmode = Goalintro
		audiostream = m_test_buildkill_intro
		audiobuss = IGCs
		objectplaybackrefs = [
			{
				cutobj = _BODY
				gameobj = alias_goalped1
				relativescenecenter
			}
		]
		$CutsceneTemplate_GoalIntroDynamic
	}
	{
		menutext = "IGC TEST"
		name = 'hardcore01'
		playmode = Goalintro
		audiostream = m_test2_thrash_intro
		audiobuss = IGCs
		objectplaybackrefs = [
			{
				cutobj = _BODY
				gameobj = alias_goalped1
				relativescenecenter
			}
		]
		$CutsceneTemplate_GoalIntroDynamic
	}
	{
		menutext = "IGC TEST"
		name = 'hardcore02'
		playmode = Goalintro
		audiostream = m_test2_line_intro
		audiobuss = IGCs
		objectplaybackrefs = [
			{
				cutobj = _BODY
				gameobj = alias_goalped1
				relativescenecenter
			}
		]
		$CutsceneTemplate_GoalIntroDynamic
	}
	{
		menutext = "IGC TEST"
		name = 'hardcore03'
		playmode = Goalintro
		audiostream = m_test2_escort_intro
		audiobuss = IGCs
		objectplaybackrefs = [
			{
				cutobj = Jeff_BODY
				gameobj = alias_goalped1
				relativescenecenter
			}
			{
				cutobj = Mike_BODY
				gameobj = skater
			}
		]
		$CutsceneTemplate_GoalIntroStatic
	}
	{
		menutext = "IGC Test"
		name = 'IGC_goalped_mechanic'
		playmode = full
	}
	{
		menutext = "Career Guy Intro"
		MenuCategory = career
		name = 'Career_Guy_Test'
		zone = z_love
		playmode = full
		object
		mappings
		objectplaybackrefs = [
			{
				cutobj = Skater_BODY
				gameobj = skater
			}
			{
				cutobj = DP_BODY
				gameobj = m_cutscene_01_ped_01
			}
			{
				cutobj = Agent_BODY
				gameobj = m_cutscene_01_ped_02
			}
			{
				cutobj = PA_no1_BODY
				gameobj = m_cutscene_01_ped_03
			}
			{
				cutobj = PA_no2_BODY
				gameobj = m_cutscene_01_ped_04
			}
			{
				cutobj = Fan_A_BODY
				gameobj = m_cutscene_01_ped_05
			}
			{
				cutobj = Fan_B_BODY
				gameobj = m_cutscene_01_ped_06
			}
			{
				cutobj = Fan1_BODY
				gameobj = m_cutscene_01_ped_07
			}
			{
				cutobj = Fan2_BODY
				gameobj = m_cutscene_01_ped_08
			}
		]
	}
	{
		menutext = "Intro_cine_career_part 2"
		name = 'Career_Guy_Test_pt2'
		playmode = full
		object
		mappings
		objectplaybackrefs = [
			{
				cutobj = _BODY
				gameobj = skater
			}
			{
				cutobj = Fan1_BODY
				gameobj = m_cutscene_01_ped_01
			}
			{
				cutobj = Fan2_BODY
				gameobj = m_cutscene_01_ped_02
			}
			{
				cutobj = Fan3_BODY
				gameobj = m_cutscene_01_ped_03
			}
			{
				cutobj = Fan4_BODY
				gameobj = m_cutscene_01_ped_04
			}
			{
				cutobj = Fan5_BODY
				gameobj = m_cutscene_01_ped_05
			}
			{
				cutobj = Fan6_BODY
				gameobj = m_cutscene_01_ped_06
			}
			{
				cutobj = Fan8_BODY
				gameobj = m_cutscene_01_ped_08
			}
		]
	}
	{
		menutext = "Intro_cine_rigger"
		name = 'RiggerIntro'
		playmode = full
	}
	{
		menutext = "Intro_cine_hardcore_part 2"
		name = 'Hardcore_Intro_2'
		playmode = full
		object
		mappings
		objectplaybackrefs = [
			{
				cutobj = skater
				gameobj = m_cutscene_01_ped_05
			}
			{
				cutobj = Spec01_BODY
				gameobj = m_cutscene_01_ped_03
			}
			{
				cutobj = Spec02_BODY
				gameobj = m_cutscene_01_ped_02
			}
			{
				cutobj = cam01_BODY
				gameobj = m_cutscene_01_ped_01
			}
			{
				cutobj = Spec03_BODY
				gameobj = m_cutscene_01_ped_04
			}
			{
				cutobj = Spec04_BODY
				gameobj = m_cutscene_01_ped_06
			}
		]
	}
	{
		menutext = "Love Flyaround"
		name = 'Love_Perimeter_Loop'
		playmode = full
	}
	{
		menutext = ""
		name = ''
		spacer
	}
	{
		menutext = "MUG"
		name = 'Bam_Mugging'
		playmode = full
		preload_bink = 'BamMugging'
		audio_params = {
			soundbuss_params = $Mugging_Scenes_Music_Up_BussSet
			music_track = Wolfmother___Woman___9___252
		}
	}
]

script trigger_bink_panel 
	getskatercamanimparams name = cutscene
	formattext checksumname = texdict '%p/%c/%o.tex' p = 'cutscenes' c = <cutname> o = 'cs_magazine'
	if istextureindictionary dictionary = <texdict> texture = `..\..\nxcommon\Data\Tex\Bink02.dds`
		texture = `..\..\nxcommon\Data\Tex\Bink02.dds`
	elseif istextureindictionary dictionary = <texdict> texture = `Tex\Bink02.dds`
		texture = `Tex\Bink02.dds`
	else
		scriptassert "Couldn't find bink02 texture....see Stuart"
	endif
	CutsceneMagazineSnapshot {
		objectname = 'cs_magazine'
		texture = <texture>
	}
endscript

script c_h3_bowlcomp_outro_begin 
	toggle_default_sceenfx
endscript

script c_h3_bowlcomp_outro_end 
	toggle_default_sceenfx
endscript

script c_h3_bowlcomp_intro_begin 
	toggle_default_sceenfx
endscript

script c_h3_bowlcomp_intro_end 
	toggle_default_sceenfx
endscript

script c_h2_takefdr_outro_begin 
	toggle_default_sceenfx
endscript

script c_h2_takefdr_outro_end 
	toggle_default_sceenfx
endscript

script c_c1_ntt_intro_begin 
	toggle_default_sceenfx
endscript

script c_c1_ntt_intro_end 
	toggle_default_sceenfx
endscript

script c_uber_hardcore_cutscene_begin 
	changenodeflag \{nodeflag_z_crib_chalk5
		0}
endscript

script c_uber_hardcore_cutscene_end 
	changenodeflag \{nodeflag_z_crib_chalk5
		1}
endscript

script c_c1_cutscene_3_begin 
	setshadowmapparams \{near = 11
		far = 14}
endscript
