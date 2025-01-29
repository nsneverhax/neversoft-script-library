facebook_img_test_update = qs(0x1a9c5e57)
facebook_img_career_complete = qs(0x5c69f8ad)
facebook_img_career_demigod = qs(0xd5e1c126)
facebook_img_career_axel = qs(0xf0f596f4)
facebook_img_career_casey = qs(0x21e15971)
facebook_img_career_johnny = qs(0x3b4af802)
facebook_img_career_judy = qs(0x47f6cbd1)
facebook_img_career_lars = qs(0x9f7ec997)
facebook_img_career_echo = qs(0xc5a45ace)
facebook_img_career_austin = qs(0xf141bee2)
facebook_img_career_pandora = qs(0xf16be249)
facebook_img_career_guitar = qs(0xf5245e1f)
facebook_img_uploaded_song = qs(0x465c78ee)
facebook_img_song_won_band = qs(0x711e7e1d)
facebook_img_song_won_bass = qs(0x26db089e)
facebook_img_song_won_drums = qs(0x5f4f77cd)
facebook_img_song_won_guitar = qs(0x1a9c5e57)
facebook_img_song_won_vocals = qs(0xc4d4d55e)
facebook_img_song_won_fc = qs(0x0dec0055)
facebook_img_song_100_percent = qs(0xba1faf67)
facebook_img_unlock_accessory = qs(0x40dccf77)
facebook_img_unlock_art_gallery = qs(0x69eff299)
facebook_img_unlock_character = qs(0x94ed24b8)
facebook_img_unlock_cheats = qs(0x9c77b215)
facebook_img_unlock_instrument = qs(0x28a8c266)
facebook_img_unlock_song = qs(0xb7966b0d)
facebook_img_unlock_venue = qs(0xd73a1501)
facebook_img_unlock_video = qs(0xb9156167)
facebook_img_challenge_alt_strum = qs(0x74e9c31c)
facebook_img_challenge_color_notes = qs(0xee6ae356)
facebook_img_challenge_open_notes = qs(0x1244386f)
facebook_img_challenge_down_strum = qs(0x3094f8b1)
facebook_img_challenge_accents = qs(0x7f4ad5f7)
facebook_img_challenge_hit_chords = qs(0x8232c0ae)
facebook_img_challenge_hit_hopos = qs(0x7f50f971)
facebook_img_challenge_hit_notes = qs(0x82b7228e)
facebook_img_challenge_hit_taps = qs(0x6f344fc3)
facebook_img_challenge_multiplier = qs(0x1d513064)
facebook_img_challenge_rockout = qs(0x03ee08ba)
facebook_img_challenge_high_score = qs(0x30cc21b8)
facebook_img_challenge_score_spower = qs(0xa4b3f467)
facebook_img_challenge_spoken = qs(0xd33fecf8)
facebook_img_challenge_spower_banked = qs(0xf6f31799)
facebook_img_challenge_spower_time = qs(0x6e72156f)
facebook_img_challenge_spower_relay = qs(0xb150ea5a)
facebook_img_challenge_streak = qs(0x7b56c91b)
facebook_img_challenge_sustain_hits = qs(0x9d7a6411)
facebook_img_challenge_sustain_time = qs(0x677eaf85)
facebook_img_challenge_tap_strum = qs(0x75bdfceb)
facebook_img_challenge_up_strum = qs(0xffcb2a0c)
facebook_img_challenge_whammy = qs(0x1c9a628e)
facebook_img_challenge_power_score = qs(0xddad23a7)
facebook_href_hub = qs(0x4ebbdde9)

script facebook_get_texture_from_url \{image_url = 0x69696969}
	fb_img = facebook_logo
	switch <image_url>
		case ($facebook_img_test_update)
		fb_img = fb_qp_session_guitar
		case ($facebook_img_career_complete)
		fb_img = fb_ca_ampzilla_defeat
		case ($facebook_img_career_demigod)
		fb_img = fb_ca_demigod
		case ($facebook_img_career_axel)
		fb_img = fb_ca_power_metal_axel
		case ($facebook_img_career_casey)
		fb_img = fb_ca_power_metal_casey
		case ($facebook_img_career_johnny)
		fb_img = fb_ca_power_metal_johnny
		case ($facebook_img_career_judy)
		fb_img = fb_ca_power_metal_judy
		case ($facebook_img_career_lars)
		fb_img = fb_ca_power_metal_lars
		case ($facebook_img_career_echo)
		fb_img = fb_ca_power_metal_newfemale
		case ($facebook_img_career_austin)
		fb_img = fb_ca_power_metal_newmale
		case ($facebook_img_career_pandora)
		fb_img = fb_ca_power_metal_pandora
		case ($facebook_img_career_guitar)
		fb_img = fb_ca_ultimate_guitar
		case ($facebook_img_uploaded_song)
		fb_img = fb_ghtracks_upload
		case ($facebook_img_song_won_band)
		fb_img = fb_qp_session_band
		case ($facebook_img_song_won_bass)
		fb_img = fb_qp_session_bass
		case ($facebook_img_song_won_drums)
		fb_img = fb_qp_session_drums
		case ($facebook_img_song_won_guitar)
		fb_img = fb_qp_session_guitar
		case ($facebook_img_song_won_vocals)
		fb_img = fb_qp_session_vocals
		case ($facebook_img_song_won_fc)
		fb_img = fb_qp_session_full_combo
		case ($facebook_img_song_100_percent)
		fb_img = fb_qp_session_song_100_percent
		case ($facebook_img_unlock_accessory)
		fb_img = fb_qp_unlock_accessory
		case ($facebook_img_unlock_art_gallery)
		fb_img = fb_qp_unlock_art_gallery
		case ($facebook_img_unlock_character)
		fb_img = fb_qp_unlock_character
		case ($facebook_img_unlock_cheats)
		fb_img = fb_qp_unlock_cheats
		case ($facebook_img_unlock_instrument)
		fb_img = fb_qp_unlock_instrument
		case ($facebook_img_unlock_song)
		fb_img = fb_qp_unlock_song
		case ($facebook_img_unlock_venue)
		fb_img = fb_qp_unlock_venue
		case ($facebook_img_unlock_video)
		fb_img = fb_qp_unlock_video
		case ($facebook_img_challenge_alt_strum)
		fb_img = fb_qp_alt_strum
		case ($facebook_img_challenge_color_notes)
		fb_img = fb_qp_color_notes
		case ($facebook_img_challenge_open_notes)
		fb_img = fb_qp_open_notes
		case ($facebook_img_challenge_down_strum)
		fb_img = fb_qp_down_strum
		case ($facebook_img_challenge_accents)
		fb_img = fb_qp_drum_accents
		case ($facebook_img_challenge_hit_chords)
		fb_img = fb_qp_hit_chords
		case ($facebook_img_challenge_hit_hopos)
		fb_img = fb_qp_hit_hopos
		case ($facebook_img_challenge_hit_notes)
		fb_img = fb_qp_hit_notes
		case ($facebook_img_challenge_hit_taps)
		fb_img = fb_qp_hit_taps
		case ($facebook_img_challenge_multiplier)
		fb_img = fb_qp_multiplier_time
		case ($facebook_img_challenge_rockout)
		fb_img = fb_qp_rockout_time
		case ($facebook_img_challenge_high_score)
		fb_img = fb_qp_score_points
		case ($facebook_img_challenge_score_spower)
		fb_img = fb_qp_score_spower
		case ($facebook_img_challenge_spoken)
		fb_img = fb_qp_spoken_notes
		case ($facebook_img_challenge_spower_banked)
		fb_img = fb_qp_spower_banked
		case ($facebook_img_challenge_spower_time)
		fb_img = fb_qp_spower_time
		case ($facebook_img_challenge_spower_relay)
		fb_img = fb_qp_spower_time_band
		case ($facebook_img_challenge_streak)
		fb_img = fb_qp_streak_notes
		case ($facebook_img_challenge_sustain_hits)
		fb_img = fb_qp_sustain_hits
		case ($facebook_img_challenge_sustain_time)
		fb_img = fb_qp_sustain_time
		case ($facebook_img_challenge_tap_strum)
		fb_img = fb_qp_tap_strum
		case ($facebook_img_challenge_up_strum)
		fb_img = fb_qp_up_strum
		case ($facebook_img_challenge_whammy)
		fb_img = fb_qp_whammy_time
		case ($facebook_img_challenge_power_score)
		fb_img = fb_qp_power_score
		default
		ScriptAssert \{qs(0x59880e34)}
	endswitch
	return fb_img = <fb_img>
endscript
