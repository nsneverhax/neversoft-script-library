drum_blend_time_from_stickdown = 0.2
drum_blend_time_from_transition = 0.120000005
drum_blend_time_same_note = 0.075
drum_blend_time_kick = 0.2
drum_blend_out_time = 0.3
cymbal_blend_time = 0.2
drum_blend_time = 0.2
drummer_twist_rate = 0.04
drummer_arm_blend_out_delay = 0.0025000002
drummer_clear_arm_twist_value_delay = 0.005
drum_anim_lead_time = 567
kickevent_lead_time = 185
kickanim_lead_time = 200
cymbal_anim_lead_time = 100
stick_tap_lead_time = 640
drum_med_hit_time = 367
drum_hard_hit_time = 567
use_delayed_drum_hits = true
drum_soft_delay = 0.4
drum_med_delay = 0.2
drum_hard_delay = 0.0
drum_sets = {
	artdeco = drum_kit001
	wikker = drum_kit002
	budokan = drum_kit003
	`default` = drum_kit001
}
drummer_left_arm_twist_factors = {
	track_37 = 0.8
	track_38 = 0.7
	track_39 = 0.1
	track_40 = 0.0
	track_41 = 0.0
	track_42 = 0.0
	track_43 = 0.2
	track_44 = 0.1
	track_45 = 0.05
}
drummer_right_arm_twist_factors = {
	track_49 = 0.8
	track_50 = 0.0
	track_51 = 0.1
	track_52 = 0.0
	track_53 = 0.0
	track_54 = 0.0
	track_55 = 0.0
	track_56 = 0.1
	track_57 = 0.05
}
drummer_animations = {
	stance_a = {
		idle = {
			good = {
				fast = [
					gh3_drummer_fst_idle_01
					gh3_drummer_fst_idle_02
					gh3_drummer_fst_idle_03
				]
				med = [
					gh3_drummer_med_idle_01
					gh3_drummer_med_idle_02
					gh3_drummer_med_idle_03
				]
				slow = [
					gh3_drummer_slw_idle_01
					gh3_drummer_slw_idle_02
					gh3_drummer_slw_idle_03
				]
			}
			normal = {
				fast = [
					gh3_drummer_fst_idle_01
					gh3_drummer_fst_idle_02
					gh3_drummer_fst_idle_03
				]
				med = [
					gh3_drummer_med_idle_01
					gh3_drummer_med_idle_02
					gh3_drummer_med_idle_03
				]
				slow = [
					gh3_drummer_slw_idle_01
					gh3_drummer_slw_idle_02
					gh3_drummer_slw_idle_03
				]
			}
			bad = {
				fast = [
					gh3_drummer_fst_idle_01
					gh3_drummer_fst_idle_02
					gh3_drummer_fst_idle_03
				]
				med = [
					gh3_drummer_med_idle_01
					gh3_drummer_med_idle_02
					gh3_drummer_med_idle_03
				]
				slow = [
					gh3_drummer_slw_idle_01
					gh3_drummer_slw_idle_02
					gh3_drummer_slw_idle_03
				]
			}
		}
		transitions = {
		}
	}
	intro = {
		idle = {
			good = {
				fast = [
					gh3_drum_intro01
					gh3_drum_intro02
					gh3_drum_intro03
				]
				med = [
					gh3_drum_intro01
					gh3_drum_intro02
					gh3_drum_intro03
				]
				slow = [
					gh3_drum_intro01
					gh3_drum_intro02
					gh3_drum_intro03
				]
			}
			normal = {
				fast = [
					gh3_drum_intro01
					gh3_drum_intro02
					gh3_drum_intro03
				]
				med = [
					gh3_drum_intro01
					gh3_drum_intro02
					gh3_drum_intro03
				]
				slow = [
					gh3_drum_intro01
					gh3_drum_intro02
					gh3_drum_intro03
				]
			}
			bad = {
				fast = [
					gh3_drum_intro01
					gh3_drum_intro02
					gh3_drum_intro03
				]
				med = [
					gh3_drum_intro01
					gh3_drum_intro02
					gh3_drum_intro03
				]
				slow = [
					gh3_drum_intro01
					gh3_drum_intro02
					gh3_drum_intro03
				]
			}
		}
		transitions = {
		}
	}
	win = {
		idle = {
			good = {
				fast = [
					gh3_drum_win01
					gh3_drum_win02
				]
				med = [
					gh3_drum_win01
					gh3_drum_win02
				]
				slow = [
					gh3_drum_win01
					gh3_drum_win02
				]
			}
			normal = {
				fast = [
					gh3_drum_win01
					gh3_drum_win02
				]
				med = [
					gh3_drum_win01
					gh3_drum_win02
				]
				slow = [
					gh3_drum_win01
					gh3_drum_win02
				]
			}
			bad = {
				fast = [
					gh3_drum_win01
					gh3_drum_win02
				]
				med = [
					gh3_drum_win01
					gh3_drum_win02
				]
				slow = [
					gh3_drum_win01
					gh3_drum_win02
				]
			}
		}
		transitions = {
		}
	}
	lose = {
		idle = {
			good = {
				fast = [
					gh3_drum_lose01
					gh3_drum_lose02
				]
				med = [
					gh3_drum_lose01
					gh3_drum_lose02
				]
				slow = [
					gh3_drum_lose01
					gh3_drum_lose02
				]
			}
			normal = {
				fast = [
					gh3_drum_lose01
					gh3_drum_lose02
				]
				med = [
					gh3_drum_lose01
					gh3_drum_lose02
				]
				slow = [
					gh3_drum_lose01
					gh3_drum_lose02
				]
			}
			bad = {
				fast = [
					gh3_drum_lose01
					gh3_drum_lose02
				]
				med = [
					gh3_drum_lose01
					gh3_drum_lose02
				]
				slow = [
					gh3_drum_lose01
					gh3_drum_lose02
				]
			}
		}
		transitions = {
		}
	}
	bodytwist = gh3_drummer_bodytwist_d
}
cymbal_anims = [
	gh3_drum_cymbal_1
	gh3_drum_cymbal_2
	gh3_drum_cymbal_3
	gh3_drum_cymbal_hh
]
drummer_anims = {
	track_36 = gh3_drum_kick
	track_37 = {
		soft = {
			track_37 = gh3_drum_lh_flrtom_sftlp
			track_38 = gh3_drum_lh_tom02_2_flrtom
			track_39 = gh3_drum_lh_tom01_2_flrtm
			track_40 = gh3_drum_lh_snare_2_flrtm
			track_41 = gh3_drum_lh_hh_2_flrtm
			track_42 = gh3_drum_lh_hh_2_flrtm
			track_43 = gh3_drum_lh_ride_2_flrtm
			track_44 = gh3_drum_lh_crash01_2_flrtm
			track_45 = gh3_drum_lh_crash02_2_flrtm
		}
		med = {
			track_37 = gh3_drum_lh_flrtom_medlp
			track_38 = gh3_drum_lh_tom02_2_flrtom
			track_39 = gh3_drum_lh_tom01_2_flrtm
			track_40 = gh3_drum_lh_snare_2_flrtm
			track_41 = gh3_drum_lh_hh_2_flrtm
			track_42 = gh3_drum_lh_hh_2_flrtm
			track_43 = gh3_drum_lh_ride_2_flrtm
			track_44 = gh3_drum_lh_crash01_2_flrtm
			track_45 = gh3_drum_lh_crash02_2_flrtm
		}
		hard = {
			track_37 = gh3_drum_lh_flrtom_hrdlp
			track_38 = gh3_drum_lh_tom02_2_flrtom
			track_39 = gh3_drum_lh_tom01_2_flrtm
			track_40 = gh3_drum_lh_snare_2_flrtm
			track_41 = gh3_drum_lh_hh_2_flrtm
			track_42 = gh3_drum_lh_hh_2_flrtm
			track_43 = gh3_drum_lh_ride_2_flrtm
			track_44 = gh3_drum_lh_crash01_2_flrtm
			track_45 = gh3_drum_lh_crash02_2_flrtm
		}
	}
	track_38 = {
		soft = {
			track_37 = gh3_drum_lh_flrtom_2_tom02
			track_38 = gh3_drum_lh_tom02_sftlp
			track_39 = gh3_drum_lh_tom01_2_tom02
			track_40 = gh3_drum_lh_snare_2_tom02
			track_41 = gh3_drum_lh_hh_2_tom02
			track_42 = gh3_drum_lh_hh_2_tom02
			track_43 = gh3_drum_lh_ride_2_tom02
			track_44 = gh3_drum_lh_crash01_2_tom02
			track_45 = gh3_drum_lh_crash02_2_tom02
		}
		med = {
			track_37 = gh3_drum_lh_flrtom_2_tom02
			track_38 = gh3_drum_lh_tom02_medlp
			track_39 = gh3_drum_lh_tom01_2_tom02
			track_40 = gh3_drum_lh_snare_2_tom02
			track_41 = gh3_drum_lh_hh_2_tom02
			track_42 = gh3_drum_lh_hh_2_tom02
			track_43 = gh3_drum_lh_ride_2_tom02
			track_44 = gh3_drum_lh_crash01_2_tom02
			track_45 = gh3_drum_lh_crash02_2_tom02
		}
		hard = {
			track_37 = gh3_drum_lh_flrtom_2_tom02
			track_38 = gh3_drum_lh_tom02_hrdlp
			track_39 = gh3_drum_lh_tom01_2_tom02
			track_40 = gh3_drum_lh_snare_2_tom02
			track_41 = gh3_drum_lh_hh_2_tom02
			track_42 = gh3_drum_lh_hh_2_tom02
			track_43 = gh3_drum_lh_ride_2_tom02
			track_44 = gh3_drum_lh_crash01_2_tom02
			track_45 = gh3_drum_lh_crash02_2_tom02
		}
	}
	track_39 = {
		soft = {
			track_37 = gh3_drum_lh_flrtom_2_tom01
			track_38 = gh3_drum_lh_tom02_2_tom01
			track_39 = gh3_drum_lh_tom01_sftlp
			track_40 = gh3_drum_lh_snare_2_tom01
			track_41 = gh3_drum_lh_hh_2_tom01
			track_42 = gh3_drum_lh_hh_2_tom01
			track_43 = gh3_drum_lh_ride_2_tom01
			track_44 = gh3_drum_lh_crash01_2_tom01
			track_45 = gh3_drum_lh_crash02_2_tom01
		}
		med = {
			track_37 = gh3_drum_lh_flrtom_2_tom01
			track_38 = gh3_drum_lh_tom02_2_tom01
			track_39 = gh3_drum_lh_tom01_medlp
			track_40 = gh3_drum_lh_snare_2_tom01
			track_41 = gh3_drum_lh_hh_2_tom01
			track_42 = gh3_drum_lh_hh_2_tom01
			track_43 = gh3_drum_lh_ride_2_tom01
			track_44 = gh3_drum_lh_crash01_2_tom01
			track_45 = gh3_drum_lh_crash02_2_tom01
		}
		hard = {
			track_37 = gh3_drum_lh_flrtom_2_tom01
			track_38 = gh3_drum_lh_tom02_2_tom01
			track_39 = gh3_drum_lh_tom01_hrdlp
			track_40 = gh3_drum_lh_snare_2_tom01
			track_41 = gh3_drum_lh_hh_2_tom01
			track_42 = gh3_drum_lh_hh_2_tom01
			track_43 = gh3_drum_lh_ride_2_tom01
			track_44 = gh3_drum_lh_crash01_2_tom01
			track_45 = gh3_drum_lh_crash02_2_tom01
		}
	}
	track_40 = {
		soft = {
			track_37 = gh3_drum_lh_flrtom_2_snr
			track_38 = gh3_drum_lh_tom02_2_snr
			track_39 = gh3_drum_lh_tom01_2_snr
			track_40 = gh3_drum_lh_snare_sftlp
			track_41 = gh3_drum_lh_hh_2_snr
			track_42 = gh3_drum_lh_hh_2_snr
			track_43 = gh3_drum_lh_ride_2_snr
			track_44 = gh3_drum_lh_crash01_2_snr
			track_45 = gh3_drum_lh_crash02_2_snr
		}
		med = {
			track_37 = gh3_drum_lh_flrtom_2_snr
			track_38 = gh3_drum_lh_tom02_2_snr
			track_39 = gh3_drum_lh_tom01_2_snr
			track_40 = gh3_drum_lh_snare_medlp
			track_41 = gh3_drum_lh_hh_2_snr
			track_42 = gh3_drum_lh_hh_2_snr
			track_43 = gh3_drum_lh_ride_2_snr
			track_44 = gh3_drum_lh_crash01_2_snr
			track_45 = gh3_drum_lh_crash02_2_snr
		}
		hard = {
			track_37 = gh3_drum_lh_flrtom_2_snr
			track_38 = gh3_drum_lh_tom02_2_snr
			track_39 = gh3_drum_lh_tom01_2_snr
			track_40 = gh3_drum_lh_snare_hrdlp
			track_41 = gh3_drum_lh_hh_2_snr
			track_42 = gh3_drum_lh_hh_2_snr
			track_43 = gh3_drum_lh_ride_2_snr
			track_44 = gh3_drum_lh_crash01_2_snr
			track_45 = gh3_drum_lh_crash02_2_snr
		}
	}
	track_41 = {
		soft = {
			track_37 = gh3_drum_lh_flrtom_2_hh
			track_38 = gh3_drum_lh_tom02_2_hh
			track_39 = gh3_drum_lh_tom01_2_hh
			track_40 = gh3_drum_lh_snare_2_hh
			track_41 = gh3_drum_lh_hh_sftlp
			track_42 = gh3_drum_lh_hh_sftlp
			track_43 = gh3_drum_lh_ride_2_hh
			track_44 = gh3_drum_lh_crash01_2_hh
			track_45 = gh3_drum_lh_crash02_2_hh
		}
		med = {
			track_37 = gh3_drum_lh_flrtom_2_hh
			track_38 = gh3_drum_lh_tom02_2_hh
			track_39 = gh3_drum_lh_tom01_2_hh
			track_40 = gh3_drum_lh_snare_2_hh
			track_41 = gh3_drum_lh_hh_medlp
			track_42 = gh3_drum_lh_hh_medlp
			track_43 = gh3_drum_lh_ride_2_hh
			track_44 = gh3_drum_lh_crash01_2_hh
			track_45 = gh3_drum_lh_crash02_2_hh
		}
		hard = {
			track_37 = gh3_drum_lh_flrtom_2_hh
			track_38 = gh3_drum_lh_tom02_2_hh
			track_39 = gh3_drum_lh_tom01_2_hh
			track_40 = gh3_drum_lh_snare_2_hh
			track_41 = gh3_drum_lh_hh_hrdlp
			track_42 = gh3_drum_lh_hh_hrdlp
			track_43 = gh3_drum_lh_ride_2_hh
			track_44 = gh3_drum_lh_crash01_2_hh
			track_45 = gh3_drum_lh_crash02_2_hh
		}
	}
	track_42 = {
		soft = {
			track_37 = gh3_drum_lh_flrtom_2_hh
			track_38 = gh3_drum_lh_tom02_2_hh
			track_39 = gh3_drum_lh_tom01_2_hh
			track_40 = gh3_drum_lh_snare_2_hh
			track_41 = gh3_drum_lh_hh_sftlp
			track_42 = gh3_drum_lh_hh_sftlp
			track_43 = gh3_drum_lh_ride_2_hh
			track_44 = gh3_drum_lh_crash01_2_hh
			track_45 = gh3_drum_lh_crash02_2_hh
		}
		med = {
			track_37 = gh3_drum_lh_flrtom_2_hh
			track_38 = gh3_drum_lh_tom02_2_hh
			track_39 = gh3_drum_lh_tom01_2_hh
			track_40 = gh3_drum_lh_snare_2_hh
			track_41 = gh3_drum_lh_hh_medlp
			track_42 = gh3_drum_lh_hh_medlp
			track_43 = gh3_drum_lh_ride_2_hh
			track_44 = gh3_drum_lh_crash01_2_hh
			track_45 = gh3_drum_lh_crash02_2_hh
		}
		hard = {
			track_37 = gh3_drum_lh_flrtom_2_hh
			track_38 = gh3_drum_lh_tom02_2_hh
			track_39 = gh3_drum_lh_tom01_2_hh
			track_40 = gh3_drum_lh_snare_2_hh
			track_41 = gh3_drum_lh_hh_hrdlp
			track_42 = gh3_drum_lh_hh_hrdlp
			track_43 = gh3_drum_lh_ride_2_hh
			track_44 = gh3_drum_lh_crash01_2_hh
			track_45 = gh3_drum_lh_crash02_2_hh
		}
	}
	track_43 = {
		soft = {
			track_37 = gh3_drum_lh_flrtom_2_ride
			track_38 = gh3_drum_lh_tom02_2_ride
			track_39 = gh3_drum_lh_tom01_2_ride
			track_40 = gh3_drum_lh_snare_2_ride
			track_41 = gh3_drum_lh_hh_2_ride
			track_42 = gh3_drum_lh_hh_2_ride
			track_43 = gh3_drum_lh_ride_sftlp
			track_44 = gh3_drum_lh_crash01_2_ride
			track_45 = gh3_drum_lh_crash02_2_ride
		}
		med = {
			track_37 = gh3_drum_lh_flrtom_2_ride
			track_38 = gh3_drum_lh_tom02_2_ride
			track_39 = gh3_drum_lh_tom01_2_ride
			track_40 = gh3_drum_lh_snare_2_ride
			track_41 = gh3_drum_lh_hh_2_ride
			track_42 = gh3_drum_lh_hh_2_ride
			track_43 = gh3_drum_lh_ride_medlp
			track_44 = gh3_drum_lh_crash01_2_ride
			track_45 = gh3_drum_lh_crash02_2_ride
		}
		hard = {
			track_37 = gh3_drum_lh_flrtom_2_ride
			track_38 = gh3_drum_lh_tom02_2_ride
			track_39 = gh3_drum_lh_tom01_2_ride
			track_40 = gh3_drum_lh_snare_2_ride
			track_41 = gh3_drum_lh_hh_2_ride
			track_42 = gh3_drum_lh_hh_2_ride
			track_43 = gh3_drum_lh_ride_hrdlp
			track_44 = gh3_drum_lh_crash01_2_ride
			track_45 = gh3_drum_lh_crash02_2_ride
		}
	}
	track_44 = {
		soft = {
			track_37 = gh3_drum_lh_flrtom_2_crash01
			track_38 = gh3_drum_lh_tom02_2_crash01
			track_39 = gh3_drum_lh_tom01_2_crash01
			track_40 = gh3_drum_lh_snare_2_crash01
			track_41 = gh3_drum_lh_hh_2_crash01
			track_42 = gh3_drum_lh_hh_2_crash01
			track_43 = gh3_drum_lh_ride_2_crash01
			track_44 = gh3_drum_lh_crash01_sftlp
			track_45 = gh3_drum_lh_crash02_2_crsh01
		}
		med = {
			track_37 = gh3_drum_lh_flrtom_2_crash01
			track_38 = gh3_drum_lh_tom02_2_crash01
			track_39 = gh3_drum_lh_tom01_2_crash01
			track_40 = gh3_drum_lh_snare_2_crash01
			track_41 = gh3_drum_lh_hh_2_crash01
			track_42 = gh3_drum_lh_hh_2_crash01
			track_43 = gh3_drum_lh_ride_2_crash01
			track_44 = gh3_drum_lh_crash01_medlp
			track_45 = gh3_drum_lh_crash02_2_crsh01
		}
		hard = {
			track_37 = gh3_drum_lh_flrtom_2_crash01
			track_38 = gh3_drum_lh_tom02_2_crash01
			track_39 = gh3_drum_lh_tom01_2_crash01
			track_40 = gh3_drum_lh_snare_2_crash01
			track_41 = gh3_drum_lh_hh_2_crash01
			track_42 = gh3_drum_lh_hh_2_crash01
			track_43 = gh3_drum_lh_ride_2_crash01
			track_44 = gh3_drum_lh_crash01_hrdlp
			track_45 = gh3_drum_lh_crash02_2_crsh01
		}
	}
	track_45 = {
		soft = {
			track_37 = gh3_drum_lh_flrtom_2_crash02
			track_38 = gh3_drum_lh_tom02_2_crash02
			track_39 = gh3_drum_lh_tom01_2_crash02
			track_40 = gh3_drum_lh_snare_2_crash02
			track_41 = gh3_drum_lh_hh_2_crash02
			track_42 = gh3_drum_lh_hh_2_crash02
			track_43 = gh3_drum_lh_ride_2_crash02
			track_44 = gh3_drum_lh_crash01_2_crsh02
			track_45 = gh3_drum_lh_crash02_sftlp
		}
		med = {
			track_37 = gh3_drum_lh_flrtom_2_crash02
			track_38 = gh3_drum_lh_tom02_2_crash02
			track_39 = gh3_drum_lh_tom01_2_crash02
			track_40 = gh3_drum_lh_snare_2_crash02
			track_41 = gh3_drum_lh_hh_2_crash02
			track_42 = gh3_drum_lh_hh_2_crash02
			track_43 = gh3_drum_lh_ride_2_crash02
			track_44 = gh3_drum_lh_crash01_2_crsh02
			track_45 = gh3_drum_lh_crash02_medlp
		}
		hard = {
			track_37 = gh3_drum_lh_flrtom_2_crash02
			track_38 = gh3_drum_lh_tom02_2_crash02
			track_39 = gh3_drum_lh_tom01_2_crash02
			track_40 = gh3_drum_lh_snare_2_crash02
			track_41 = gh3_drum_lh_hh_2_crash02
			track_42 = gh3_drum_lh_hh_2_crash02
			track_43 = gh3_drum_lh_ride_2_crash02
			track_44 = gh3_drum_lh_crash01_2_crsh02
			track_45 = gh3_drum_lh_crash02_hrdlp
		}
	}
	track_48 = gh3_drum_kick
	track_49 = {
		soft = {
			track_49 = gh3_drum_rh_flrtom_sftlp
			track_50 = gh3_drum_rh_tom02_2_flrtom
			track_51 = gh3_drum_rh_tom01_2_flrtm
			track_52 = gh3_drum_rh_snare_2_flrtm
			track_53 = gh3_drum_rh_hh_2_flrtm
			track_54 = gh3_drum_rh_hh_2_flrtm
			track_55 = gh3_drum_rh_ride_2_flrtm
			track_56 = gh3_drum_rh_crash01_2_flrtm
			track_57 = gh3_drum_rh_crash02_2_flrtm
		}
		med = {
			track_49 = gh3_drum_rh_flrtom_medlp
			track_50 = gh3_drum_rh_tom02_2_flrtom
			track_51 = gh3_drum_rh_tom01_2_flrtm
			track_52 = gh3_drum_rh_snare_2_flrtm
			track_53 = gh3_drum_rh_hh_2_flrtm
			track_54 = gh3_drum_rh_hh_2_flrtm
			track_55 = gh3_drum_rh_ride_2_flrtm
			track_56 = gh3_drum_rh_crash01_2_flrtm
			track_57 = gh3_drum_rh_crash02_2_flrtm
		}
		hard = {
			track_49 = gh3_drum_rh_flrtom_hrdlp
			track_50 = gh3_drum_rh_tom02_2_flrtom
			track_51 = gh3_drum_rh_tom01_2_flrtm
			track_52 = gh3_drum_rh_snare_2_flrtm
			track_53 = gh3_drum_rh_hh_2_flrtm
			track_54 = gh3_drum_rh_hh_2_flrtm
			track_55 = gh3_drum_rh_ride_2_flrtm
			track_56 = gh3_drum_rh_crash01_2_flrtm
			track_57 = gh3_drum_rh_crash02_2_flrtm
		}
	}
	track_50 = {
		soft = {
			track_49 = gh3_drum_rh_flrtom_2_tom02
			track_50 = gh3_drum_rh_tom02_sftlp
			track_51 = gh3_drum_rh_tom01_2_tom02
			track_52 = gh3_drum_rh_snare_2_tom02
			track_53 = gh3_drum_rh_hh_2_tom02
			track_54 = gh3_drum_rh_hh_2_tom02
			track_55 = gh3_drum_rh_ride_2_tom02
			track_56 = gh3_drum_rh_crash01_2_tom02
			track_57 = gh3_drum_rh_crash02_2_tom02
		}
		med = {
			track_49 = gh3_drum_rh_flrtom_2_tom02
			track_50 = gh3_drum_rh_tom02_medlp
			track_51 = gh3_drum_rh_tom01_2_tom02
			track_52 = gh3_drum_rh_snare_2_tom02
			track_53 = gh3_drum_rh_hh_2_tom02
			track_54 = gh3_drum_rh_hh_2_tom02
			track_55 = gh3_drum_rh_ride_2_tom02
			track_56 = gh3_drum_rh_crash01_2_tom02
			track_57 = gh3_drum_rh_crash02_2_tom02
		}
		hard = {
			track_49 = gh3_drum_rh_flrtom_2_tom02
			track_50 = gh3_drum_rh_tom02_hrdlp
			track_51 = gh3_drum_rh_tom01_2_tom02
			track_52 = gh3_drum_rh_snare_2_tom02
			track_53 = gh3_drum_rh_hh_2_tom02
			track_54 = gh3_drum_rh_hh_2_tom02
			track_55 = gh3_drum_rh_ride_2_tom02
			track_56 = gh3_drum_rh_crash01_2_tom02
			track_57 = gh3_drum_rh_crash02_2_tom02
		}
	}
	track_51 = {
		soft = {
			track_49 = gh3_drum_rh_flrtom_2_tom01
			track_50 = gh3_drum_rh_tom02_2_tom01
			track_51 = gh3_drum_rh_tom01_sftlp
			track_52 = gh3_drum_rh_snare_2_tom01
			track_53 = gh3_drum_rh_hh_2_tom01
			track_54 = gh3_drum_rh_hh_2_tom01
			track_55 = gh3_drum_rh_ride_2_tom01
			track_56 = gh3_drum_rh_crash01_2_tom01
			track_57 = gh3_drum_rh_crash02_2_tom01
		}
		med = {
			track_49 = gh3_drum_rh_flrtom_2_tom01
			track_50 = gh3_drum_rh_tom02_2_tom01
			track_51 = gh3_drum_rh_tom01_medlp
			track_52 = gh3_drum_rh_snare_2_tom01
			track_53 = gh3_drum_rh_hh_2_tom01
			track_54 = gh3_drum_rh_hh_2_tom01
			track_55 = gh3_drum_rh_ride_2_tom01
			track_56 = gh3_drum_rh_crash01_2_tom01
			track_57 = gh3_drum_rh_crash02_2_tom01
		}
		hard = {
			track_49 = gh3_drum_rh_flrtom_2_tom01
			track_50 = gh3_drum_rh_tom02_2_tom01
			track_51 = gh3_drum_rh_tom01_hrdlp
			track_52 = gh3_drum_rh_snare_2_tom01
			track_53 = gh3_drum_rh_hh_2_tom01
			track_54 = gh3_drum_rh_hh_2_tom01
			track_55 = gh3_drum_rh_ride_2_tom01
			track_56 = gh3_drum_rh_crash01_2_tom01
			track_57 = gh3_drum_rh_crash02_2_tom01
		}
	}
	track_52 = {
		soft = {
			track_49 = gh3_drum_rh_flrtom_2_snr
			track_50 = gh3_drum_rh_tom02_2_snr
			track_51 = gh3_drum_rh_tom01_2_snr
			track_52 = gh3_drum_rh_snare_sftlp
			track_53 = gh3_drum_rh_hh_2_snr
			track_54 = gh3_drum_rh_hh_2_snr
			track_55 = gh3_drum_rh_ride_2_snr
			track_56 = gh3_drum_rh_crash01_2_snr
			track_57 = gh3_drum_rh_crash02_2_snr
		}
		med = {
			track_49 = gh3_drum_rh_flrtom_2_snr
			track_50 = gh3_drum_rh_tom02_2_snr
			track_51 = gh3_drum_rh_tom01_2_snr
			track_52 = gh3_drum_rh_snare_medlp
			track_53 = gh3_drum_rh_hh_2_snr
			track_54 = gh3_drum_rh_hh_2_snr
			track_55 = gh3_drum_rh_ride_2_snr
			track_56 = gh3_drum_rh_crash01_2_snr
			track_57 = gh3_drum_rh_crash02_2_snr
		}
		hard = {
			track_49 = gh3_drum_rh_flrtom_2_snr
			track_50 = gh3_drum_rh_tom02_2_snr
			track_51 = gh3_drum_rh_tom01_2_snr
			track_52 = gh3_drum_rh_snare_hrdlp
			track_53 = gh3_drum_rh_hh_2_snr
			track_54 = gh3_drum_rh_hh_2_snr
			track_55 = gh3_drum_rh_ride_2_snr
			track_56 = gh3_drum_rh_crash01_2_snr
			track_57 = gh3_drum_rh_crash02_2_snr
		}
	}
	track_53 = {
		soft = {
			track_49 = gh3_drum_rh_flrtom_2_hh
			track_50 = gh3_drum_rh_tom02_2_hh
			track_51 = gh3_drum_rh_tom01_2_hh
			track_52 = gh3_drum_rh_snare_2_hh
			track_53 = gh3_drum_rh_hh_sftlp
			track_54 = gh3_drum_rh_hh_sftlp
			track_55 = gh3_drum_rh_ride_2_hh
			track_56 = gh3_drum_rh_crash01_2_hh
			track_57 = gh3_drum_rh_crash02_2_hh
		}
		med = {
			track_49 = gh3_drum_rh_flrtom_2_hh
			track_50 = gh3_drum_rh_tom02_2_hh
			track_51 = gh3_drum_rh_tom01_2_hh
			track_52 = gh3_drum_rh_snare_2_hh
			track_53 = gh3_drum_rh_hh_medlp
			track_54 = gh3_drum_rh_hh_medlp
			track_55 = gh3_drum_rh_ride_2_hh
			track_56 = gh3_drum_rh_crash01_2_hh
			track_57 = gh3_drum_rh_crash02_2_hh
		}
		hard = {
			track_49 = gh3_drum_rh_flrtom_2_hh
			track_50 = gh3_drum_rh_tom02_2_hh
			track_51 = gh3_drum_rh_tom01_2_hh
			track_52 = gh3_drum_rh_snare_2_hh
			track_53 = gh3_drum_rh_hh_hrdlp
			track_54 = gh3_drum_rh_hh_hrdlp
			track_55 = gh3_drum_rh_ride_2_hh
			track_56 = gh3_drum_rh_crash01_2_hh
			track_57 = gh3_drum_rh_crash02_2_hh
		}
	}
	track_54 = {
		soft = {
			track_49 = gh3_drum_rh_flrtom_2_hh
			track_50 = gh3_drum_rh_tom02_2_hh
			track_51 = gh3_drum_rh_tom01_2_hh
			track_52 = gh3_drum_rh_snare_2_hh
			track_53 = gh3_drum_rh_hh_sftlp
			track_54 = gh3_drum_rh_hh_sftlp
			track_55 = gh3_drum_rh_ride_2_hh
			track_56 = gh3_drum_rh_crash01_2_hh
			track_57 = gh3_drum_rh_crash02_2_hh
		}
		med = {
			track_49 = gh3_drum_rh_flrtom_2_hh
			track_50 = gh3_drum_rh_tom02_2_hh
			track_51 = gh3_drum_rh_tom01_2_hh
			track_52 = gh3_drum_rh_snare_2_hh
			track_53 = gh3_drum_rh_hh_medlp
			track_54 = gh3_drum_rh_hh_medlp
			track_55 = gh3_drum_rh_ride_2_hh
			track_56 = gh3_drum_rh_crash01_2_hh
			track_57 = gh3_drum_rh_crash02_2_hh
		}
		hard = {
			track_49 = gh3_drum_rh_flrtom_2_hh
			track_50 = gh3_drum_rh_tom02_2_hh
			track_51 = gh3_drum_rh_tom01_2_hh
			track_52 = gh3_drum_rh_snare_2_hh
			track_53 = gh3_drum_rh_hh_hrdlp
			track_54 = gh3_drum_rh_hh_hrdlp
			track_55 = gh3_drum_rh_ride_2_hh
			track_56 = gh3_drum_rh_crash01_2_hh
			track_57 = gh3_drum_rh_crash02_2_hh
		}
	}
	track_55 = {
		soft = {
			track_49 = gh3_drum_rh_flrtom_2_ride
			track_50 = gh3_drum_rh_tom02_2_ride
			track_51 = gh3_drum_rh_tom01_2_ride
			track_52 = gh3_drum_rh_snare_2_ride
			track_53 = gh3_drum_rh_hh_2_ride
			track_54 = gh3_drum_rh_hh_2_ride
			track_55 = gh3_drum_rh_ride_sftlp
			track_56 = gh3_drum_rh_crash01_2_ride
			track_57 = gh3_drum_rh_crash02_2_ride
		}
		med = {
			track_49 = gh3_drum_rh_flrtom_2_ride
			track_50 = gh3_drum_rh_tom02_2_ride
			track_51 = gh3_drum_rh_tom01_2_ride
			track_52 = gh3_drum_rh_snare_2_ride
			track_53 = gh3_drum_rh_hh_2_ride
			track_54 = gh3_drum_rh_hh_2_ride
			track_55 = gh3_drum_rh_ride_medlp
			track_56 = gh3_drum_rh_crash01_2_ride
			track_57 = gh3_drum_rh_crash02_2_ride
		}
		hard = {
			track_49 = gh3_drum_rh_flrtom_2_ride
			track_50 = gh3_drum_rh_tom02_2_ride
			track_51 = gh3_drum_rh_tom01_2_ride
			track_52 = gh3_drum_rh_snare_2_ride
			track_53 = gh3_drum_rh_hh_2_ride
			track_54 = gh3_drum_rh_hh_2_ride
			track_55 = gh3_drum_rh_ride_hrdlp
			track_56 = gh3_drum_rh_crash01_2_ride
			track_57 = gh3_drum_rh_crash02_2_ride
		}
	}
	track_56 = {
		soft = {
			track_49 = gh3_drum_rh_flrtom_2_crash01
			track_50 = gh3_drum_rh_tom02_2_crash01
			track_51 = gh3_drum_rh_tom01_2_crash01
			track_52 = gh3_drum_rh_snare_2_crash01
			track_53 = gh3_drum_rh_hh_2_crash01
			track_54 = gh3_drum_rh_hh_2_crash01
			track_55 = gh3_drum_rh_ride_2_crash01
			track_56 = gh3_drum_rh_crash01_sftlp
			track_57 = gh3_drum_rh_crash02_2_crsh01
		}
		med = {
			track_49 = gh3_drum_rh_flrtom_2_crash01
			track_50 = gh3_drum_rh_tom02_2_crash01
			track_51 = gh3_drum_rh_tom01_2_crash01
			track_52 = gh3_drum_rh_snare_2_crash01
			track_53 = gh3_drum_rh_hh_2_crash01
			track_54 = gh3_drum_rh_hh_2_crash01
			track_55 = gh3_drum_rh_ride_2_crash01
			track_56 = gh3_drum_rh_crash01_medlp
			track_57 = gh3_drum_rh_crash02_2_crsh01
		}
		hard = {
			track_49 = gh3_drum_rh_flrtom_2_crash01
			track_50 = gh3_drum_rh_tom02_2_crash01
			track_51 = gh3_drum_rh_tom01_2_crash01
			track_52 = gh3_drum_rh_snare_2_crash01
			track_53 = gh3_drum_rh_hh_2_crash01
			track_54 = gh3_drum_rh_hh_2_crash01
			track_55 = gh3_drum_rh_ride_2_crash01
			track_56 = gh3_drum_rh_crash01_hrdlp
			track_57 = gh3_drum_rh_crash02_2_crsh01
		}
	}
	track_57 = {
		soft = {
			track_49 = gh3_drum_rh_flrtom_2_crash02
			track_50 = gh3_drum_rh_tom02_2_crash02
			track_51 = gh3_drum_rh_tom01_2_crash02
			track_52 = gh3_drum_rh_snare_2_crash02
			track_53 = gh3_drum_rh_hh_2_crash02
			track_54 = gh3_drum_rh_hh_2_crash02
			track_55 = gh3_drum_rh_ride_2_crash02
			track_56 = gh3_drum_rh_crash01_2_crsh02
			track_57 = gh3_drum_rh_crash02_sftlp
		}
		med = {
			track_49 = gh3_drum_rh_flrtom_2_crash02
			track_50 = gh3_drum_rh_tom02_2_crash02
			track_51 = gh3_drum_rh_tom01_2_crash02
			track_52 = gh3_drum_rh_snare_2_crash02
			track_53 = gh3_drum_rh_hh_2_crash02
			track_54 = gh3_drum_rh_hh_2_crash02
			track_55 = gh3_drum_rh_ride_2_crash02
			track_56 = gh3_drum_rh_crash01_2_crsh02
			track_57 = gh3_drum_rh_crash02_medlp
		}
		hard = {
			track_49 = gh3_drum_rh_flrtom_2_crash02
			track_50 = gh3_drum_rh_tom02_2_crash02
			track_51 = gh3_drum_rh_tom01_2_crash02
			track_52 = gh3_drum_rh_snare_2_crash02
			track_53 = gh3_drum_rh_hh_2_crash02
			track_54 = gh3_drum_rh_hh_2_crash02
			track_55 = gh3_drum_rh_ride_2_crash02
			track_56 = gh3_drum_rh_crash01_2_crsh02
			track_57 = gh3_drum_rh_crash02_hrdlp
		}
	}
	sticktap_into_l = gh3_drummer_hitstix_into_l
	sticktap_into_r = gh3_drummer_hitstix_into_r
	sticktap_l = gh3_drummer_hitstix_l
	sticktap_r = gh3_drummer_hitstix_r
	stickdown_l = gh3_drummer_stickdown_l
	stickdown_r = gh3_drummer_stickdown_r
	countoff_hihat_r = gh3_drum_rh_hh_medlp
}
drummer_animations_joeyk = {
	stance_a = {
		idle = {
			good = {
				fast = [
					gh3_drummer_joeyk_fst_idle_01
					gh3_drummer_joeyk_fst_idle_02
					gh3_drummer_joeyk_fst_idle_03
				]
				med = [
					gh3_drummer_joeyk_med_idle_01
					gh3_drummer_joeyk_med_idle_02
					gh3_drummer_joeyk_med_idle_03
				]
				slow = [
					gh3_drummer_joeyk_slw_idle_01
					gh3_drummer_joeyk_slw_idle_02
					gh3_drummer_joeyk_slw_idle_03
				]
			}
			normal = {
				fast = [
					gh3_drummer_joeyk_fst_idle_01
					gh3_drummer_joeyk_fst_idle_02
					gh3_drummer_joeyk_fst_idle_03
				]
				med = [
					gh3_drummer_joeyk_med_idle_01
					gh3_drummer_joeyk_med_idle_02
					gh3_drummer_joeyk_med_idle_03
				]
				slow = [
					gh3_drummer_joeyk_slw_idle_01
					gh3_drummer_joeyk_slw_idle_02
					gh3_drummer_joeyk_slw_idle_03
				]
			}
			bad = {
				fast = [
					gh3_drummer_joeyk_fst_idle_01
					gh3_drummer_joeyk_fst_idle_02
					gh3_drummer_joeyk_fst_idle_03
				]
				med = [
					gh3_drummer_joeyk_med_idle_01
					gh3_drummer_joeyk_med_idle_02
					gh3_drummer_joeyk_med_idle_03
				]
				slow = [
					gh3_drummer_joeyk_slw_idle_01
					gh3_drummer_joeyk_slw_idle_02
					gh3_drummer_joeyk_slw_idle_03
				]
			}
		}
		transitions = {
		}
	}
	intro = {
		idle = {
			good = {
				fast = [
					gh3_drum_joeyk_intro01
					gh3_drum_joeyk_intro02
					gh3_drum_joeyk_intro03
				]
				med = [
					gh3_drum_joeyk_intro01
					gh3_drum_joeyk_intro02
					gh3_drum_joeyk_intro03
				]
				slow = [
					gh3_drum_joeyk_intro01
					gh3_drum_joeyk_intro02
					gh3_drum_joeyk_intro03
				]
			}
			normal = {
				fast = [
					gh3_drum_joeyk_intro01
					gh3_drum_joeyk_intro02
					gh3_drum_joeyk_intro03
				]
				med = [
					gh3_drum_joeyk_intro01
					gh3_drum_joeyk_intro02
					gh3_drum_joeyk_intro03
				]
				slow = [
					gh3_drum_joeyk_intro01
					gh3_drum_joeyk_intro02
					gh3_drum_joeyk_intro03
				]
			}
			bad = {
				fast = [
					gh3_drum_joeyk_intro01
					gh3_drum_joeyk_intro02
					gh3_drum_joeyk_intro03
				]
				med = [
					gh3_drum_joeyk_intro01
					gh3_drum_joeyk_intro02
					gh3_drum_joeyk_intro03
				]
				slow = [
					gh3_drum_joeyk_intro01
					gh3_drum_joeyk_intro02
					gh3_drum_joeyk_intro03
				]
			}
		}
		transitions = {
		}
	}
	facial_anims = {
		idle = [
			gh3_drummer_joeyk_faceidle
			gh3_drummer_joeyk_faceidle02
			gh3_drummer_joeyk_faceidle03
		]
	}
	win = {
		idle = {
			good = {
				fast = [
					gh3_drum_joeyk_win01
					gh3_drum_joeyk_win02
				]
				med = [
					gh3_drum_joeyk_win01
					gh3_drum_joeyk_win02
				]
				slow = [
					gh3_drum_joeyk_win01
					gh3_drum_joeyk_win02
				]
			}
			normal = {
				fast = [
					gh3_drum_joeyk_win01
					gh3_drum_joeyk_win02
				]
				med = [
					gh3_drum_joeyk_win01
					gh3_drum_joeyk_win02
				]
				slow = [
					gh3_drum_joeyk_win01
					gh3_drum_joeyk_win02
				]
			}
			bad = {
				fast = [
					gh3_drum_joeyk_win01
					gh3_drum_joeyk_win02
				]
				med = [
					gh3_drum_joeyk_win01
					gh3_drum_joeyk_win02
				]
				slow = [
					gh3_drum_joeyk_win01
					gh3_drum_joeyk_win02
				]
			}
		}
		transitions = {
		}
	}
	lose = {
		idle = {
			good = {
				fast = [
					gh3_drum_joeyk_lose01
					gh3_drum_joeyk_lose02
				]
				med = [
					gh3_drum_joeyk_lose01
					gh3_drum_joeyk_lose02
				]
				slow = [
					gh3_drum_joeyk_lose01
					gh3_drum_joeyk_lose02
				]
			}
			normal = {
				fast = [
					gh3_drum_joeyk_lose01
					gh3_drum_joeyk_lose02
				]
				med = [
					gh3_drum_joeyk_lose01
					gh3_drum_joeyk_lose02
				]
				slow = [
					gh3_drum_joeyk_lose01
					gh3_drum_joeyk_lose02
				]
			}
			bad = {
				fast = [
					gh3_drum_joeyk_lose01
					gh3_drum_joeyk_lose02
				]
				med = [
					gh3_drum_joeyk_lose01
					gh3_drum_joeyk_lose02
				]
				slow = [
					gh3_drum_joeyk_lose01
					gh3_drum_joeyk_lose02
				]
			}
		}
		transitions = {
		}
	}
	bodytwist = gh3_drummer_joeyk_bodytwist_d
}
cymbal_anims_joeyk = [
	gh3_drum_joeyk_cymbal_1
	gh3_drum_joeyk_cymbal_2
	gh3_drum_joeyk_cymbal_3
	gh3_drum_joeyk_cymbal_hh
]
drummer_anims_joeyk = {
	track_36 = gh3_drum_joeyk_kick
	track_37 = {
		soft = {
			track_37 = gh3_drum_joeyk_lh_flrtom_sftlp
			track_38 = gh3_drum_joeyk_lh_tom02_2_flrtom
			track_39 = gh3_drum_joeyk_lh_tom01_2_flrtm
			track_40 = gh3_drum_joeyk_lh_snare_2_flrtm
			track_41 = gh3_drum_joeyk_lh_hh_2_flrtm
			track_42 = gh3_drum_joeyk_lh_hh_2_flrtm
			track_43 = gh3_drum_joeyk_lh_ride_2_flrtm
			track_44 = gh3_drum_joeyk_lh_crash01_2_flrtm
			track_45 = gh3_drum_joeyk_lh_crash02_2_flrtm
		}
		med = {
			track_37 = gh3_drum_joeyk_lh_flrtom_medlp
			track_38 = gh3_drum_joeyk_lh_tom02_2_flrtom
			track_39 = gh3_drum_joeyk_lh_tom01_2_flrtm
			track_40 = gh3_drum_joeyk_lh_snare_2_flrtm
			track_41 = gh3_drum_joeyk_lh_hh_2_flrtm
			track_42 = gh3_drum_joeyk_lh_hh_2_flrtm
			track_43 = gh3_drum_joeyk_lh_ride_2_flrtm
			track_44 = gh3_drum_joeyk_lh_crash01_2_flrtm
			track_45 = gh3_drum_joeyk_lh_crash02_2_flrtm
		}
		hard = {
			track_37 = gh3_drum_joeyk_lh_flrtom_hrdlp
			track_38 = gh3_drum_joeyk_lh_tom02_2_flrtom
			track_39 = gh3_drum_joeyk_lh_tom01_2_flrtm
			track_40 = gh3_drum_joeyk_lh_snare_2_flrtm
			track_41 = gh3_drum_joeyk_lh_hh_2_flrtm
			track_42 = gh3_drum_joeyk_lh_hh_2_flrtm
			track_43 = gh3_drum_joeyk_lh_ride_2_flrtm
			track_44 = gh3_drum_joeyk_lh_crash01_2_flrtm
			track_45 = gh3_drum_joeyk_lh_crash02_2_flrtm
		}
	}
	track_38 = {
		soft = {
			track_37 = gh3_drum_joeyk_lh_flrtom_2_tom02
			track_38 = gh3_drum_joeyk_lh_tom02_sftlp
			track_39 = gh3_drum_joeyk_lh_tom01_2_tom02
			track_40 = gh3_drum_joeyk_lh_snare_2_tom02
			track_41 = gh3_drum_joeyk_lh_hh_2_tom02
			track_42 = gh3_drum_joeyk_lh_hh_2_tom02
			track_43 = gh3_drum_joeyk_lh_ride_2_tom02
			track_44 = gh3_drum_joeyk_lh_crash01_2_tom02
			track_45 = gh3_drum_joeyk_lh_crash02_2_tom02
		}
		med = {
			track_37 = gh3_drum_joeyk_lh_flrtom_2_tom02
			track_38 = gh3_drum_joeyk_lh_tom02_medlp
			track_39 = gh3_drum_joeyk_lh_tom01_2_tom02
			track_40 = gh3_drum_joeyk_lh_snare_2_tom02
			track_41 = gh3_drum_joeyk_lh_hh_2_tom02
			track_42 = gh3_drum_joeyk_lh_hh_2_tom02
			track_43 = gh3_drum_joeyk_lh_ride_2_tom02
			track_44 = gh3_drum_joeyk_lh_crash01_2_tom02
			track_45 = gh3_drum_joeyk_lh_crash02_2_tom02
		}
		hard = {
			track_37 = gh3_drum_joeyk_lh_flrtom_2_tom02
			track_38 = gh3_drum_joeyk_lh_tom02_hrdlp
			track_39 = gh3_drum_joeyk_lh_tom01_2_tom02
			track_40 = gh3_drum_joeyk_lh_snare_2_tom02
			track_41 = gh3_drum_joeyk_lh_hh_2_tom02
			track_42 = gh3_drum_joeyk_lh_hh_2_tom02
			track_43 = gh3_drum_joeyk_lh_ride_2_tom02
			track_44 = gh3_drum_joeyk_lh_crash01_2_tom02
			track_45 = gh3_drum_joeyk_lh_crash02_2_tom02
		}
	}
	track_39 = {
		soft = {
			track_37 = gh3_drum_joeyk_lh_flrtom_2_tom01
			track_38 = gh3_drum_joeyk_lh_tom02_2_tom01
			track_39 = gh3_drum_joeyk_lh_tom01_sftlp
			track_40 = gh3_drum_joeyk_lh_snare_2_tom01
			track_41 = gh3_drum_joeyk_lh_hh_2_tom01
			track_42 = gh3_drum_joeyk_lh_hh_2_tom01
			track_43 = gh3_drum_joeyk_lh_ride_2_tom01
			track_44 = gh3_drum_joeyk_lh_crash01_2_tom01
			track_45 = gh3_drum_joeyk_lh_crash02_2_tom01
		}
		med = {
			track_37 = gh3_drum_joeyk_lh_flrtom_2_tom01
			track_38 = gh3_drum_joeyk_lh_tom02_2_tom01
			track_39 = gh3_drum_joeyk_lh_tom01_medlp
			track_40 = gh3_drum_joeyk_lh_snare_2_tom01
			track_41 = gh3_drum_joeyk_lh_hh_2_tom01
			track_42 = gh3_drum_joeyk_lh_hh_2_tom01
			track_43 = gh3_drum_joeyk_lh_ride_2_tom01
			track_44 = gh3_drum_joeyk_lh_crash01_2_tom01
			track_45 = gh3_drum_joeyk_lh_crash02_2_tom01
		}
		hard = {
			track_37 = gh3_drum_joeyk_lh_flrtom_2_tom01
			track_38 = gh3_drum_joeyk_lh_tom02_2_tom01
			track_39 = gh3_drum_joeyk_lh_tom01_hrdlp
			track_40 = gh3_drum_joeyk_lh_snare_2_tom01
			track_41 = gh3_drum_joeyk_lh_hh_2_tom01
			track_42 = gh3_drum_joeyk_lh_hh_2_tom01
			track_43 = gh3_drum_joeyk_lh_ride_2_tom01
			track_44 = gh3_drum_joeyk_lh_crash01_2_tom01
			track_45 = gh3_drum_joeyk_lh_crash02_2_tom01
		}
	}
	track_40 = {
		soft = {
			track_37 = gh3_drum_joeyk_lh_flrtom_2_snr
			track_38 = gh3_drum_joeyk_lh_tom02_2_snr
			track_39 = gh3_drum_joeyk_lh_tom01_2_snr
			track_40 = gh3_drum_joeyk_lh_snare_sftlp
			track_41 = gh3_drum_joeyk_lh_hh_2_snr
			track_42 = gh3_drum_joeyk_lh_hh_2_snr
			track_43 = gh3_drum_joeyk_lh_ride_2_snr
			track_44 = gh3_drum_joeyk_lh_crash01_2_snr
			track_45 = gh3_drum_joeyk_lh_crash02_2_snr
		}
		med = {
			track_37 = gh3_drum_joeyk_lh_flrtom_2_snr
			track_38 = gh3_drum_joeyk_lh_tom02_2_snr
			track_39 = gh3_drum_joeyk_lh_tom01_2_snr
			track_40 = gh3_drum_joeyk_lh_snare_medlp
			track_41 = gh3_drum_joeyk_lh_hh_2_snr
			track_42 = gh3_drum_joeyk_lh_hh_2_snr
			track_43 = gh3_drum_joeyk_lh_ride_2_snr
			track_44 = gh3_drum_joeyk_lh_crash01_2_snr
			track_45 = gh3_drum_joeyk_lh_crash02_2_snr
		}
		hard = {
			track_37 = gh3_drum_joeyk_lh_flrtom_2_snr
			track_38 = gh3_drum_joeyk_lh_tom02_2_snr
			track_39 = gh3_drum_joeyk_lh_tom01_2_snr
			track_40 = gh3_drum_joeyk_lh_snare_hrdlp
			track_41 = gh3_drum_joeyk_lh_hh_2_snr
			track_42 = gh3_drum_joeyk_lh_hh_2_snr
			track_43 = gh3_drum_joeyk_lh_ride_2_snr
			track_44 = gh3_drum_joeyk_lh_crash01_2_snr
			track_45 = gh3_drum_joeyk_lh_crash02_2_snr
		}
	}
	track_41 = {
		soft = {
			track_37 = gh3_drum_joeyk_lh_flrtom_2_hh
			track_38 = gh3_drum_joeyk_lh_tom02_2_hh
			track_39 = gh3_drum_joeyk_lh_tom01_2_hh
			track_40 = gh3_drum_joeyk_lh_snare_2_hh
			track_41 = gh3_drum_joeyk_lh_hh_sftlp
			track_42 = gh3_drum_joeyk_lh_hh_sftlp
			track_43 = gh3_drum_joeyk_lh_ride_2_hh
			track_44 = gh3_drum_joeyk_lh_crash01_2_hh
			track_45 = gh3_drum_joeyk_lh_crash02_2_hh
		}
		med = {
			track_37 = gh3_drum_joeyk_lh_flrtom_2_hh
			track_38 = gh3_drum_joeyk_lh_tom02_2_hh
			track_39 = gh3_drum_joeyk_lh_tom01_2_hh
			track_40 = gh3_drum_joeyk_lh_snare_2_hh
			track_41 = gh3_drum_joeyk_lh_hh_medlp
			track_42 = gh3_drum_joeyk_lh_hh_medlp
			track_43 = gh3_drum_joeyk_lh_ride_2_hh
			track_44 = gh3_drum_joeyk_lh_crash01_2_hh
			track_45 = gh3_drum_joeyk_lh_crash02_2_hh
		}
		hard = {
			track_37 = gh3_drum_joeyk_lh_flrtom_2_hh
			track_38 = gh3_drum_joeyk_lh_tom02_2_hh
			track_39 = gh3_drum_joeyk_lh_tom01_2_hh
			track_40 = gh3_drum_joeyk_lh_snare_2_hh
			track_41 = gh3_drum_joeyk_lh_hh_hrdlp
			track_42 = gh3_drum_joeyk_lh_hh_hrdlp
			track_43 = gh3_drum_joeyk_lh_ride_2_hh
			track_44 = gh3_drum_joeyk_lh_crash01_2_hh
			track_45 = gh3_drum_joeyk_lh_crash02_2_hh
		}
	}
	track_42 = {
		soft = {
			track_37 = gh3_drum_joeyk_lh_flrtom_2_hh
			track_38 = gh3_drum_joeyk_lh_tom02_2_hh
			track_39 = gh3_drum_joeyk_lh_tom01_2_hh
			track_40 = gh3_drum_joeyk_lh_snare_2_hh
			track_41 = gh3_drum_joeyk_lh_hh_sftlp
			track_42 = gh3_drum_joeyk_lh_hh_sftlp
			track_43 = gh3_drum_joeyk_lh_ride_2_hh
			track_44 = gh3_drum_joeyk_lh_crash01_2_hh
			track_45 = gh3_drum_joeyk_lh_crash02_2_hh
		}
		med = {
			track_37 = gh3_drum_joeyk_lh_flrtom_2_hh
			track_38 = gh3_drum_joeyk_lh_tom02_2_hh
			track_39 = gh3_drum_joeyk_lh_tom01_2_hh
			track_40 = gh3_drum_joeyk_lh_snare_2_hh
			track_41 = gh3_drum_joeyk_lh_hh_medlp
			track_42 = gh3_drum_joeyk_lh_hh_medlp
			track_43 = gh3_drum_joeyk_lh_ride_2_hh
			track_44 = gh3_drum_joeyk_lh_crash01_2_hh
			track_45 = gh3_drum_joeyk_lh_crash02_2_hh
		}
		hard = {
			track_37 = gh3_drum_joeyk_lh_flrtom_2_hh
			track_38 = gh3_drum_joeyk_lh_tom02_2_hh
			track_39 = gh3_drum_joeyk_lh_tom01_2_hh
			track_40 = gh3_drum_joeyk_lh_snare_2_hh
			track_41 = gh3_drum_joeyk_lh_hh_hrdlp
			track_42 = gh3_drum_joeyk_lh_hh_hrdlp
			track_43 = gh3_drum_joeyk_lh_ride_2_hh
			track_44 = gh3_drum_joeyk_lh_crash01_2_hh
			track_45 = gh3_drum_joeyk_lh_crash02_2_hh
		}
	}
	track_43 = {
		soft = {
			track_37 = gh3_drum_joeyk_lh_flrtom_2_ride
			track_38 = gh3_drum_joeyk_lh_tom02_2_ride
			track_39 = gh3_drum_joeyk_lh_tom01_2_ride
			track_40 = gh3_drum_joeyk_lh_snare_2_ride
			track_41 = gh3_drum_joeyk_lh_hh_2_ride
			track_42 = gh3_drum_joeyk_lh_hh_2_ride
			track_43 = gh3_drum_joeyk_lh_ride_sftlp
			track_44 = gh3_drum_joeyk_lh_crash01_2_ride
			track_45 = gh3_drum_joeyk_lh_crash02_2_ride
		}
		med = {
			track_37 = gh3_drum_joeyk_lh_flrtom_2_ride
			track_38 = gh3_drum_joeyk_lh_tom02_2_ride
			track_39 = gh3_drum_joeyk_lh_tom01_2_ride
			track_40 = gh3_drum_joeyk_lh_snare_2_ride
			track_41 = gh3_drum_joeyk_lh_hh_2_ride
			track_42 = gh3_drum_joeyk_lh_hh_2_ride
			track_43 = gh3_drum_joeyk_lh_ride_medlp
			track_44 = gh3_drum_joeyk_lh_crash01_2_ride
			track_45 = gh3_drum_joeyk_lh_crash02_2_ride
		}
		hard = {
			track_37 = gh3_drum_joeyk_lh_flrtom_2_ride
			track_38 = gh3_drum_joeyk_lh_tom02_2_ride
			track_39 = gh3_drum_joeyk_lh_tom01_2_ride
			track_40 = gh3_drum_joeyk_lh_snare_2_ride
			track_41 = gh3_drum_joeyk_lh_hh_2_ride
			track_42 = gh3_drum_joeyk_lh_hh_2_ride
			track_43 = gh3_drum_joeyk_lh_ride_hrdlp
			track_44 = gh3_drum_joeyk_lh_crash01_2_ride
			track_45 = gh3_drum_joeyk_lh_crash02_2_ride
		}
	}
	track_44 = {
		soft = {
			track_37 = gh3_drum_joeyk_lh_flrtom_2_crash01
			track_38 = gh3_drum_joeyk_lh_tom02_2_crash01
			track_39 = gh3_drum_joeyk_lh_tom01_2_crash01
			track_40 = gh3_drum_joeyk_lh_snare_2_crash01
			track_41 = gh3_drum_joeyk_lh_hh_2_crash01
			track_42 = gh3_drum_joeyk_lh_hh_2_crash01
			track_43 = gh3_drum_joeyk_lh_ride_2_crash01
			track_44 = gh3_drum_joeyk_lh_crash01_sftlp
			track_45 = gh3_drum_joeyk_lh_crash02_2_crsh01
		}
		med = {
			track_37 = gh3_drum_joeyk_lh_flrtom_2_crash01
			track_38 = gh3_drum_joeyk_lh_tom02_2_crash01
			track_39 = gh3_drum_joeyk_lh_tom01_2_crash01
			track_40 = gh3_drum_joeyk_lh_snare_2_crash01
			track_41 = gh3_drum_joeyk_lh_hh_2_crash01
			track_42 = gh3_drum_joeyk_lh_hh_2_crash01
			track_43 = gh3_drum_joeyk_lh_ride_2_crash01
			track_44 = gh3_drum_joeyk_lh_crash01_medlp
			track_45 = gh3_drum_joeyk_lh_crash02_2_crsh01
		}
		hard = {
			track_37 = gh3_drum_joeyk_lh_flrtom_2_crash01
			track_38 = gh3_drum_joeyk_lh_tom02_2_crash01
			track_39 = gh3_drum_joeyk_lh_tom01_2_crash01
			track_40 = gh3_drum_joeyk_lh_snare_2_crash01
			track_41 = gh3_drum_joeyk_lh_hh_2_crash01
			track_42 = gh3_drum_joeyk_lh_hh_2_crash01
			track_43 = gh3_drum_joeyk_lh_ride_2_crash01
			track_44 = gh3_drum_joeyk_lh_crash01_hrdlp
			track_45 = gh3_drum_joeyk_lh_crash02_2_crsh01
		}
	}
	track_45 = {
		soft = {
			track_37 = gh3_drum_joeyk_lh_flrtom_2_crash02
			track_38 = gh3_drum_joeyk_lh_tom02_2_crash02
			track_39 = gh3_drum_joeyk_lh_tom01_2_crash02
			track_40 = gh3_drum_joeyk_lh_snare_2_crash02
			track_41 = gh3_drum_joeyk_lh_hh_2_crash02
			track_42 = gh3_drum_joeyk_lh_hh_2_crash02
			track_43 = gh3_drum_joeyk_lh_ride_2_crash02
			track_44 = gh3_drum_joeyk_lh_crash01_2_crsh02
			track_45 = gh3_drum_joeyk_lh_crash02_sftlp
		}
		med = {
			track_37 = gh3_drum_joeyk_lh_flrtom_2_crash02
			track_38 = gh3_drum_joeyk_lh_tom02_2_crash02
			track_39 = gh3_drum_joeyk_lh_tom01_2_crash02
			track_40 = gh3_drum_joeyk_lh_snare_2_crash02
			track_41 = gh3_drum_joeyk_lh_hh_2_crash02
			track_42 = gh3_drum_joeyk_lh_hh_2_crash02
			track_43 = gh3_drum_joeyk_lh_ride_2_crash02
			track_44 = gh3_drum_joeyk_lh_crash01_2_crsh02
			track_45 = gh3_drum_joeyk_lh_crash02_medlp
		}
		hard = {
			track_37 = gh3_drum_joeyk_lh_flrtom_2_crash02
			track_38 = gh3_drum_joeyk_lh_tom02_2_crash02
			track_39 = gh3_drum_joeyk_lh_tom01_2_crash02
			track_40 = gh3_drum_joeyk_lh_snare_2_crash02
			track_41 = gh3_drum_joeyk_lh_hh_2_crash02
			track_42 = gh3_drum_joeyk_lh_hh_2_crash02
			track_43 = gh3_drum_joeyk_lh_ride_2_crash02
			track_44 = gh3_drum_joeyk_lh_crash01_2_crsh02
			track_45 = gh3_drum_joeyk_lh_crash02_hrdlp
		}
	}
	track_48 = gh3_drum_joeyk_kick
	track_49 = {
		soft = {
			track_49 = gh3_drum_joeyk_rh_flrtom_sftlp
			track_50 = gh3_drum_joeyk_rh_tom02_2_flrtom
			track_51 = gh3_drum_joeyk_rh_tom01_2_flrtm
			track_52 = gh3_drum_joeyk_rh_snare_2_flrtm
			track_53 = gh3_drum_joeyk_rh_hh_2_flrtm
			track_54 = gh3_drum_joeyk_rh_hh_2_flrtm
			track_55 = gh3_drum_joeyk_rh_ride_2_flrtm
			track_56 = gh3_drum_joeyk_rh_crash01_2_flrtm
			track_57 = gh3_drum_joeyk_rh_crash02_2_flrtm
		}
		med = {
			track_49 = gh3_drum_joeyk_rh_flrtom_medlp
			track_50 = gh3_drum_joeyk_rh_tom02_2_flrtom
			track_51 = gh3_drum_joeyk_rh_tom01_2_flrtm
			track_52 = gh3_drum_joeyk_rh_snare_2_flrtm
			track_53 = gh3_drum_joeyk_rh_hh_2_flrtm
			track_54 = gh3_drum_joeyk_rh_hh_2_flrtm
			track_55 = gh3_drum_joeyk_rh_ride_2_flrtm
			track_56 = gh3_drum_joeyk_rh_crash01_2_flrtm
			track_57 = gh3_drum_joeyk_rh_crash02_2_flrtm
		}
		hard = {
			track_49 = gh3_drum_joeyk_rh_flrtom_hrdlp
			track_50 = gh3_drum_joeyk_rh_tom02_2_flrtom
			track_51 = gh3_drum_joeyk_rh_tom01_2_flrtm
			track_52 = gh3_drum_joeyk_rh_snare_2_flrtm
			track_53 = gh3_drum_joeyk_rh_hh_2_flrtm
			track_54 = gh3_drum_joeyk_rh_hh_2_flrtm
			track_55 = gh3_drum_joeyk_rh_ride_2_flrtm
			track_56 = gh3_drum_joeyk_rh_crash01_2_flrtm
			track_57 = gh3_drum_joeyk_rh_crash02_2_flrtm
		}
	}
	track_50 = {
		soft = {
			track_49 = gh3_drum_joeyk_rh_flrtom_2_tom02
			track_50 = gh3_drum_joeyk_rh_tom02_sftlp
			track_51 = gh3_drum_joeyk_rh_tom01_2_tom02
			track_52 = gh3_drum_joeyk_rh_snare_2_tom02
			track_53 = gh3_drum_joeyk_rh_hh_2_tom02
			track_54 = gh3_drum_joeyk_rh_hh_2_tom02
			track_55 = gh3_drum_joeyk_rh_ride_2_tom02
			track_56 = gh3_drum_joeyk_rh_crash01_2_tom02
			track_57 = gh3_drum_joeyk_rh_crash02_2_tom02
		}
		med = {
			track_49 = gh3_drum_joeyk_rh_flrtom_2_tom02
			track_50 = gh3_drum_joeyk_rh_tom02_medlp
			track_51 = gh3_drum_joeyk_rh_tom01_2_tom02
			track_52 = gh3_drum_joeyk_rh_snare_2_tom02
			track_53 = gh3_drum_joeyk_rh_hh_2_tom02
			track_54 = gh3_drum_joeyk_rh_hh_2_tom02
			track_55 = gh3_drum_joeyk_rh_ride_2_tom02
			track_56 = gh3_drum_joeyk_rh_crash01_2_tom02
			track_57 = gh3_drum_joeyk_rh_crash02_2_tom02
		}
		hard = {
			track_49 = gh3_drum_joeyk_rh_flrtom_2_tom02
			track_50 = gh3_drum_joeyk_rh_tom02_hrdlp
			track_51 = gh3_drum_joeyk_rh_tom01_2_tom02
			track_52 = gh3_drum_joeyk_rh_snare_2_tom02
			track_53 = gh3_drum_joeyk_rh_hh_2_tom02
			track_54 = gh3_drum_joeyk_rh_hh_2_tom02
			track_55 = gh3_drum_joeyk_rh_ride_2_tom02
			track_56 = gh3_drum_joeyk_rh_crash01_2_tom02
			track_57 = gh3_drum_joeyk_rh_crash02_2_tom02
		}
	}
	track_51 = {
		soft = {
			track_49 = gh3_drum_joeyk_rh_flrtom_2_tom01
			track_50 = gh3_drum_joeyk_rh_tom02_2_tom01
			track_51 = gh3_drum_joeyk_rh_tom01_sftlp
			track_52 = gh3_drum_joeyk_rh_snare_2_tom01
			track_53 = gh3_drum_joeyk_rh_hh_2_tom01
			track_54 = gh3_drum_joeyk_rh_hh_2_tom01
			track_55 = gh3_drum_joeyk_rh_ride_2_tom01
			track_56 = gh3_drum_joeyk_rh_crash01_2_tom01
			track_57 = gh3_drum_joeyk_rh_crash02_2_tom01
		}
		med = {
			track_49 = gh3_drum_joeyk_rh_flrtom_2_tom01
			track_50 = gh3_drum_joeyk_rh_tom02_2_tom01
			track_51 = gh3_drum_joeyk_rh_tom01_medlp
			track_52 = gh3_drum_joeyk_rh_snare_2_tom01
			track_53 = gh3_drum_joeyk_rh_hh_2_tom01
			track_54 = gh3_drum_joeyk_rh_hh_2_tom01
			track_55 = gh3_drum_joeyk_rh_ride_2_tom01
			track_56 = gh3_drum_joeyk_rh_crash01_2_tom01
			track_57 = gh3_drum_joeyk_rh_crash02_2_tom01
		}
		hard = {
			track_49 = gh3_drum_joeyk_rh_flrtom_2_tom01
			track_50 = gh3_drum_joeyk_rh_tom02_2_tom01
			track_51 = gh3_drum_joeyk_rh_tom01_hrdlp
			track_52 = gh3_drum_joeyk_rh_snare_2_tom01
			track_53 = gh3_drum_joeyk_rh_hh_2_tom01
			track_54 = gh3_drum_joeyk_rh_hh_2_tom01
			track_55 = gh3_drum_joeyk_rh_ride_2_tom01
			track_56 = gh3_drum_joeyk_rh_crash01_2_tom01
			track_57 = gh3_drum_joeyk_rh_crash02_2_tom01
		}
	}
	track_52 = {
		soft = {
			track_49 = gh3_drum_joeyk_rh_flrtom_2_snr
			track_50 = gh3_drum_joeyk_rh_tom02_2_snr
			track_51 = gh3_drum_joeyk_rh_tom01_2_snr
			track_52 = gh3_drum_joeyk_rh_snare_sftlp
			track_53 = gh3_drum_joeyk_rh_hh_2_snr
			track_54 = gh3_drum_joeyk_rh_hh_2_snr
			track_55 = gh3_drum_joeyk_rh_ride_2_snr
			track_56 = gh3_drum_joeyk_rh_crash01_2_snr
			track_57 = gh3_drum_joeyk_rh_crash02_2_snr
		}
		med = {
			track_49 = gh3_drum_joeyk_rh_flrtom_2_snr
			track_50 = gh3_drum_joeyk_rh_tom02_2_snr
			track_51 = gh3_drum_joeyk_rh_tom01_2_snr
			track_52 = gh3_drum_joeyk_rh_snare_medlp
			track_53 = gh3_drum_joeyk_rh_hh_2_snr
			track_54 = gh3_drum_joeyk_rh_hh_2_snr
			track_55 = gh3_drum_joeyk_rh_ride_2_snr
			track_56 = gh3_drum_joeyk_rh_crash01_2_snr
			track_57 = gh3_drum_joeyk_rh_crash02_2_snr
		}
		hard = {
			track_49 = gh3_drum_joeyk_rh_flrtom_2_snr
			track_50 = gh3_drum_joeyk_rh_tom02_2_snr
			track_51 = gh3_drum_joeyk_rh_tom01_2_snr
			track_52 = gh3_drum_joeyk_rh_snare_hrdlp
			track_53 = gh3_drum_joeyk_rh_hh_2_snr
			track_54 = gh3_drum_joeyk_rh_hh_2_snr
			track_55 = gh3_drum_joeyk_rh_ride_2_snr
			track_56 = gh3_drum_joeyk_rh_crash01_2_snr
			track_57 = gh3_drum_joeyk_rh_crash02_2_snr
		}
	}
	track_53 = {
		soft = {
			track_49 = gh3_drum_joeyk_rh_flrtom_2_hh
			track_50 = gh3_drum_joeyk_rh_tom02_2_hh
			track_51 = gh3_drum_joeyk_rh_tom01_2_hh
			track_52 = gh3_drum_joeyk_rh_snare_2_hh
			track_53 = gh3_drum_joeyk_rh_hh_sftlp
			track_54 = gh3_drum_joeyk_rh_hh_sftlp
			track_55 = gh3_drum_joeyk_rh_ride_2_hh
			track_56 = gh3_drum_joeyk_rh_crash01_2_hh
			track_57 = gh3_drum_joeyk_rh_crash02_2_hh
		}
		med = {
			track_49 = gh3_drum_joeyk_rh_flrtom_2_hh
			track_50 = gh3_drum_joeyk_rh_tom02_2_hh
			track_51 = gh3_drum_joeyk_rh_tom01_2_hh
			track_52 = gh3_drum_joeyk_rh_snare_2_hh
			track_53 = gh3_drum_joeyk_rh_hh_medlp
			track_54 = gh3_drum_joeyk_rh_hh_medlp
			track_55 = gh3_drum_joeyk_rh_ride_2_hh
			track_56 = gh3_drum_joeyk_rh_crash01_2_hh
			track_57 = gh3_drum_joeyk_rh_crash02_2_hh
		}
		hard = {
			track_49 = gh3_drum_joeyk_rh_flrtom_2_hh
			track_50 = gh3_drum_joeyk_rh_tom02_2_hh
			track_51 = gh3_drum_joeyk_rh_tom01_2_hh
			track_52 = gh3_drum_joeyk_rh_snare_2_hh
			track_53 = gh3_drum_joeyk_rh_hh_hrdlp
			track_54 = gh3_drum_joeyk_rh_hh_hrdlp
			track_55 = gh3_drum_joeyk_rh_ride_2_hh
			track_56 = gh3_drum_joeyk_rh_crash01_2_hh
			track_57 = gh3_drum_joeyk_rh_crash02_2_hh
		}
	}
	track_54 = {
		soft = {
			track_49 = gh3_drum_joeyk_rh_flrtom_2_hh
			track_50 = gh3_drum_joeyk_rh_tom02_2_hh
			track_51 = gh3_drum_joeyk_rh_tom01_2_hh
			track_52 = gh3_drum_joeyk_rh_snare_2_hh
			track_53 = gh3_drum_joeyk_rh_hh_sftlp
			track_54 = gh3_drum_joeyk_rh_hh_sftlp
			track_55 = gh3_drum_joeyk_rh_ride_2_hh
			track_56 = gh3_drum_joeyk_rh_crash01_2_hh
			track_57 = gh3_drum_joeyk_rh_crash02_2_hh
		}
		med = {
			track_49 = gh3_drum_joeyk_rh_flrtom_2_hh
			track_50 = gh3_drum_joeyk_rh_tom02_2_hh
			track_51 = gh3_drum_joeyk_rh_tom01_2_hh
			track_52 = gh3_drum_joeyk_rh_snare_2_hh
			track_53 = gh3_drum_joeyk_rh_hh_medlp
			track_54 = gh3_drum_joeyk_rh_hh_medlp
			track_55 = gh3_drum_joeyk_rh_ride_2_hh
			track_56 = gh3_drum_joeyk_rh_crash01_2_hh
			track_57 = gh3_drum_joeyk_rh_crash02_2_hh
		}
		hard = {
			track_49 = gh3_drum_joeyk_rh_flrtom_2_hh
			track_50 = gh3_drum_joeyk_rh_tom02_2_hh
			track_51 = gh3_drum_joeyk_rh_tom01_2_hh
			track_52 = gh3_drum_joeyk_rh_snare_2_hh
			track_53 = gh3_drum_joeyk_rh_hh_hrdlp
			track_54 = gh3_drum_joeyk_rh_hh_hrdlp
			track_55 = gh3_drum_joeyk_rh_ride_2_hh
			track_56 = gh3_drum_joeyk_rh_crash01_2_hh
			track_57 = gh3_drum_joeyk_rh_crash02_2_hh
		}
	}
	track_55 = {
		soft = {
			track_49 = gh3_drum_joeyk_rh_flrtom_2_ride
			track_50 = gh3_drum_joeyk_rh_tom02_2_ride
			track_51 = gh3_drum_joeyk_rh_tom01_2_ride
			track_52 = gh3_drum_joeyk_rh_snare_2_ride
			track_53 = gh3_drum_joeyk_rh_hh_2_ride
			track_54 = gh3_drum_joeyk_rh_hh_2_ride
			track_55 = gh3_drum_joeyk_rh_ride_sftlp
			track_56 = gh3_drum_joeyk_rh_crash01_2_ride
			track_57 = gh3_drum_joeyk_rh_crash02_2_ride
		}
		med = {
			track_49 = gh3_drum_joeyk_rh_flrtom_2_ride
			track_50 = gh3_drum_joeyk_rh_tom02_2_ride
			track_51 = gh3_drum_joeyk_rh_tom01_2_ride
			track_52 = gh3_drum_joeyk_rh_snare_2_ride
			track_53 = gh3_drum_joeyk_rh_hh_2_ride
			track_54 = gh3_drum_joeyk_rh_hh_2_ride
			track_55 = gh3_drum_joeyk_rh_ride_medlp
			track_56 = gh3_drum_joeyk_rh_crash01_2_ride
			track_57 = gh3_drum_joeyk_rh_crash02_2_ride
		}
		hard = {
			track_49 = gh3_drum_joeyk_rh_flrtom_2_ride
			track_50 = gh3_drum_joeyk_rh_tom02_2_ride
			track_51 = gh3_drum_joeyk_rh_tom01_2_ride
			track_52 = gh3_drum_joeyk_rh_snare_2_ride
			track_53 = gh3_drum_joeyk_rh_hh_2_ride
			track_54 = gh3_drum_joeyk_rh_hh_2_ride
			track_55 = gh3_drum_joeyk_rh_ride_hrdlp
			track_56 = gh3_drum_joeyk_rh_crash01_2_ride
			track_57 = gh3_drum_joeyk_rh_crash02_2_ride
		}
	}
	track_56 = {
		soft = {
			track_49 = gh3_drum_joeyk_rh_flrtom_2_crash01
			track_50 = gh3_drum_joeyk_rh_tom02_2_crash01
			track_51 = gh3_drum_joeyk_rh_tom01_2_crash01
			track_52 = gh3_drum_joeyk_rh_snare_2_crash01
			track_53 = gh3_drum_joeyk_rh_hh_2_crash01
			track_54 = gh3_drum_joeyk_rh_hh_2_crash01
			track_55 = gh3_drum_joeyk_rh_ride_2_crash01
			track_56 = gh3_drum_joeyk_rh_crash01_sftlp
			track_57 = gh3_drum_joeyk_rh_crash02_2_crsh01
		}
		med = {
			track_49 = gh3_drum_joeyk_rh_flrtom_2_crash01
			track_50 = gh3_drum_joeyk_rh_tom02_2_crash01
			track_51 = gh3_drum_joeyk_rh_tom01_2_crash01
			track_52 = gh3_drum_joeyk_rh_snare_2_crash01
			track_53 = gh3_drum_joeyk_rh_hh_2_crash01
			track_54 = gh3_drum_joeyk_rh_hh_2_crash01
			track_55 = gh3_drum_joeyk_rh_ride_2_crash01
			track_56 = gh3_drum_joeyk_rh_crash01_medlp
			track_57 = gh3_drum_joeyk_rh_crash02_2_crsh01
		}
		hard = {
			track_49 = gh3_drum_joeyk_rh_flrtom_2_crash01
			track_50 = gh3_drum_joeyk_rh_tom02_2_crash01
			track_51 = gh3_drum_joeyk_rh_tom01_2_crash01
			track_52 = gh3_drum_joeyk_rh_snare_2_crash01
			track_53 = gh3_drum_joeyk_rh_hh_2_crash01
			track_54 = gh3_drum_joeyk_rh_hh_2_crash01
			track_55 = gh3_drum_joeyk_rh_ride_2_crash01
			track_56 = gh3_drum_joeyk_rh_crash01_hrdlp
			track_57 = gh3_drum_joeyk_rh_crash02_2_crsh01
		}
	}
	track_57 = {
		soft = {
			track_49 = gh3_drum_joeyk_rh_flrtom_2_crash02
			track_50 = gh3_drum_joeyk_rh_tom02_2_crash02
			track_51 = gh3_drum_joeyk_rh_tom01_2_crash02
			track_52 = gh3_drum_joeyk_rh_snare_2_crash02
			track_53 = gh3_drum_joeyk_rh_hh_2_crash02
			track_54 = gh3_drum_joeyk_rh_hh_2_crash02
			track_55 = gh3_drum_joeyk_rh_ride_2_crash02
			track_56 = gh3_drum_joeyk_rh_crash01_2_crsh02
			track_57 = gh3_drum_joeyk_rh_crash02_sftlp
		}
		med = {
			track_49 = gh3_drum_joeyk_rh_flrtom_2_crash02
			track_50 = gh3_drum_joeyk_rh_tom02_2_crash02
			track_51 = gh3_drum_joeyk_rh_tom01_2_crash02
			track_52 = gh3_drum_joeyk_rh_snare_2_crash02
			track_53 = gh3_drum_joeyk_rh_hh_2_crash02
			track_54 = gh3_drum_joeyk_rh_hh_2_crash02
			track_55 = gh3_drum_joeyk_rh_ride_2_crash02
			track_56 = gh3_drum_joeyk_rh_crash01_2_crsh02
			track_57 = gh3_drum_joeyk_rh_crash02_medlp
		}
		hard = {
			track_49 = gh3_drum_joeyk_rh_flrtom_2_crash02
			track_50 = gh3_drum_joeyk_rh_tom02_2_crash02
			track_51 = gh3_drum_joeyk_rh_tom01_2_crash02
			track_52 = gh3_drum_joeyk_rh_snare_2_crash02
			track_53 = gh3_drum_joeyk_rh_hh_2_crash02
			track_54 = gh3_drum_joeyk_rh_hh_2_crash02
			track_55 = gh3_drum_joeyk_rh_ride_2_crash02
			track_56 = gh3_drum_joeyk_rh_crash01_2_crsh02
			track_57 = gh3_drum_joeyk_rh_crash02_hrdlp
		}
	}
	sticktap_into_l = gh3_drummer_joeyk_hitstix_into_l
	sticktap_into_r = gh3_drummer_joeyk_hitstix_into_r
	sticktap_l = gh3_drummer_joeyk_hitstix_l
	sticktap_r = gh3_drummer_joeyk_hitstix_r
	stickdown_l = gh3_drummer_joeyk_stickdown_l
	stickdown_r = gh3_drummer_joeyk_stickdown_r
	countoff_hihat_r = gh3_drum_joeyk_rh_hh_medlp
}
