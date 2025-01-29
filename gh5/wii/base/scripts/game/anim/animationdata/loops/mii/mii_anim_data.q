freestyle_mii_anim_set = {
	guitar_stances = [
		guitar_idle_slow
		guitar_idle_med
		guitar_idle_fast
	]
	bass_stances = [
		bassist_idle_slow
		bassist_idle_fast
	]
	drummer_stance = rock_idle
	guitar_intro = [
		mii_guitarist_intro_1
		mii_guitarist_intro_2
	]
	bass_intro = [
		mii_bassist_intro_1
		mii_bassist_intro_2
	]
	guitar_outro = [
		mii_guitarist_outro
	]
	bass_outro = [
		mii_bassist_outro
	]
	solo_celebration = [
		mii_solo_celeb_1
		mii_solo_celeb_2
		mii_solo_celeb_3
		mii_solo_celeb_4
	]
	transitions = {
		Intro = {
			GUITARIST = mii_guitarist_intro_2_slow
			BASSIST = mii_bassist_intro_2_slow
		}
		solo = {
			GUITARIST = mii_guitarist_solo_2_slow
			BASSIST = mii_bassist_solo_2_slow
		}
	}
}
mii_anims_set = {
	Stance_A = {
		Idle = {
			good = {
				slow = [
					guitarist_mii_idle_med
				]
				med = [
					guitarist_mii_idle_med
				]
				FAST = [
					guitarist_mii_idle_med
				]
			}
			Normal = {
				slow = [
					guitarist_mii_idle_med
				]
				med = [
					guitarist_mii_idle_med
				]
				FAST = [
					guitarist_mii_idle_med
				]
			}
			bad = {
				slow = [
					guitarist_mii_idle_med
				]
				med = [
					guitarist_mii_idle_med
				]
				FAST = [
					guitarist_mii_idle_med
				]
			}
		}
	}
	guitar_idle_slow = {
		Idle = {
			good = {
				slow = [
					guitarist_mii_idle_slow
				]
				med = [
					guitarist_mii_idle_slow
				]
				FAST = [
					guitarist_mii_idle_slow
				]
			}
			Normal = {
				slow = [
					guitarist_mii_idle_slow
				]
				med = [
					guitarist_mii_idle_slow
				]
				FAST = [
					guitarist_mii_idle_slow
				]
			}
			bad = {
				slow = [
					guitarist_mii_idle_slow
				]
				med = [
					guitarist_mii_idle_slow
				]
				FAST = [
					guitarist_mii_idle_slow
				]
			}
		}
		transitions = {
			guitar_idle_med = mii_guitarist_slow_2_med
			guitar_idle_fast = mii_guitarist_slow_2_fast
		}
	}
	guitar_idle_med = {
		Idle = {
			good = {
				slow = [
					guitarist_mii_idle_med
				]
				med = [
					guitarist_mii_idle_med
				]
				FAST = [
					guitarist_mii_idle_med
				]
			}
			Normal = {
				slow = [
					guitarist_mii_idle_med
				]
				med = [
					guitarist_mii_idle_med
				]
				FAST = [
					guitarist_mii_idle_med
				]
			}
			bad = {
				slow = [
					guitarist_mii_idle_med
				]
				med = [
					guitarist_mii_idle_med
				]
				FAST = [
					guitarist_mii_idle_med
				]
			}
		}
		transitions = {
			guitar_idle_slow = mii_guitarist_med_2_slow
			guitar_idle_fast = mii_guitarist_med_2_fast
		}
	}
	guitar_idle_fast = {
		Idle = {
			good = {
				slow = [
					guitarist_mii_idle_fast
				]
				med = [
					guitarist_mii_idle_fast
				]
				FAST = [
					guitarist_mii_idle_fast
				]
			}
			Normal = {
				slow = [
					guitarist_mii_idle_fast
				]
				med = [
					guitarist_mii_idle_fast
				]
				FAST = [
					guitarist_mii_idle_fast
				]
			}
			bad = {
				slow = [
					guitarist_mii_idle_fast
				]
				med = [
					guitarist_mii_idle_fast
				]
				FAST = [
					guitarist_mii_idle_fast
				]
			}
		}
		transitions = {
			guitar_idle_slow = mii_guitarist_fast_2_slow
			guitar_idle_med = mii_guitarist_fast_2_med
		}
	}
	bassist_idle_slow = {
		Idle = {
			good = {
				slow = [
					bassist_mii_idle_slow
				]
				med = [
					bassist_mii_idle_slow
				]
				FAST = [
					bassist_mii_idle_slow
				]
			}
			Normal = {
				slow = [
					bassist_mii_idle_slow
				]
				med = [
					bassist_mii_idle_slow
				]
				FAST = [
					bassist_mii_idle_slow
				]
			}
			bad = {
				slow = [
					bassist_mii_idle_slow
				]
				med = [
					bassist_mii_idle_slow
				]
				FAST = [
					bassist_mii_idle_slow
				]
			}
		}
		transitions = {
			bassist_idle_fast = mii_bassist_slow_2_fast
		}
	}
	bassist_idle_fast = {
		Idle = {
			good = {
				slow = [
					bassist_mii_idle_fast
				]
				med = [
					bassist_mii_idle_fast
				]
				FAST = [
					bassist_mii_idle_fast
				]
			}
			Normal = {
				slow = [
					bassist_mii_idle_fast
				]
				med = [
					bassist_mii_idle_fast
				]
				FAST = [
					bassist_mii_idle_fast
				]
			}
			bad = {
				slow = [
					bassist_mii_idle_fast
				]
				med = [
					bassist_mii_idle_fast
				]
				FAST = [
					bassist_mii_idle_fast
				]
			}
		}
		transitions = {
			bassist_idle_slow = mii_bassist_fast_2_slow
		}
	}
}
