freestyle_master_synthesizer_volume = 1.0
freestyle_master_stream_volume = 0.35000002
freestyle_preview_stream_volume = 0.5
freestyle_instrument_mix_levels_base = {
	guitar = 1.0
	drums = 1.0
	bass = 0.5
}
freestyle_instrument_mix_levels_rockandroll = {
	guitar = 0.45000002
	drums = 1.0
	bass = 1.0
}
freestyle_instrument_mix_levels_metal = {
	guitar = 0.38000003
	drums = 1.0
	bass = 1.0
}
freestyle_instrument_mix_levels_funk = {
	guitar = 0.41
	drums = 1.0
	bass = 1.0
}
freestyle_instrument_mix_levels_rock = {
	guitar = 0.375
	drums = 1.0
	bass = 0.7
}
freestyle_instrument_mix_levels_blues = {
	guitar = 0.4
	drums = 1.0
	bass = 1.0
}
freestyle_non_solo_volume_pct = 0.9
freestyle_synth_effects_rockandroll = [
	{
		id = echo
		Type = echo
		dry_mix = 1.0
		wet_mix = 0.625
		delay = 133.3
		decay_ratio = 0.5
	}
	{
		id = flange
		Type = flange
		dry_mix = 0.8
		wet_mix = 0.95
		DEPTH = 1.0
		rate = 0.15
	}
	{
		Type = wah
		id = wah_guitar
		resonance = 2.5
		cycle_time = 1.5
		freq_cutoff_lo = 800.0
		freq_cutoff_hi = 1750.0
	}
	{
		Type = wah
		id = wah_bass
		resonance = 2.5
		cycle_time = 1.5
		freq_cutoff_lo = 400.0
		freq_cutoff_hi = 1750.0
	}
]
freestyle_synth_effects_metal = [
	{
		id = echo
		Type = echo
		dry_mix = 1.0
		wet_mix = 0.625
		delay = 333.34
		decay_ratio = 0.5
	}
	{
		id = flange
		Type = flange
		dry_mix = 0.8
		wet_mix = 0.9
		DEPTH = 1.0
		rate = 0.15
	}
	{
		Type = wah
		id = wah_guitar
		resonance = 2.5
		cycle_time = 1.5
		freq_cutoff_lo = 800.0
		freq_cutoff_hi = 1750.0
	}
	{
		Type = wah
		id = wah_bass
		resonance = 2.5
		cycle_time = 1.5
		freq_cutoff_lo = 400.0
		freq_cutoff_hi = 1750.0
	}
]
freestyle_synth_effects_funk = [
	{
		id = echo
		Type = echo
		dry_mix = 1.0
		wet_mix = 0.7
		delay = 300.0
		decay_ratio = 0.6
	}
	{
		id = flange
		Type = flange
		dry_mix = 0.8
		wet_mix = 0.95
		DEPTH = 1.0
		rate = 0.15
	}
	{
		Type = wah
		id = wah_guitar
		resonance = 2.5
		cycle_time = 1.5
		freq_cutoff_lo = 800.0
		freq_cutoff_hi = 1750.0
	}
	{
		Type = wah
		id = wah_bass
		resonance = 2.5
		cycle_time = 1.5
		freq_cutoff_lo = 400.0
		freq_cutoff_hi = 1750.0
	}
]
freestyle_synth_effects_rock = [
	{
		id = echo
		Type = echo
		dry_mix = 1.0
		wet_mix = 0.7
		delay = 250.0
		decay_ratio = 0.5
	}
	{
		id = flange
		Type = flange
		dry_mix = 0.8
		wet_mix = 0.95
		DEPTH = 1.0
		rate = 0.15
	}
	{
		Type = wah
		id = wah_guitar
		resonance = 2.5
		cycle_time = 1.5
		freq_cutoff_lo = 800.0
		freq_cutoff_hi = 1750.0
	}
	{
		Type = wah
		id = wah_bass
		resonance = 2.5
		cycle_time = 1.5
		freq_cutoff_lo = 400.0
		freq_cutoff_hi = 1750.0
	}
]
freestyle_synth_effects_blues = [
	{
		id = echo
		Type = echo
		dry_mix = 1.0
		wet_mix = 0.8
		delay = 500.0
		decay_ratio = 0.5
	}
	{
		id = flange
		Type = flange
		dry_mix = 0.8
		wet_mix = 0.95
		DEPTH = 1.0
		rate = 0.15
	}
	{
		Type = wah
		id = wah_guitar
		resonance = 2.5
		cycle_time = 1.5
		freq_cutoff_lo = 800.0
		freq_cutoff_hi = 1750.0
	}
	{
		Type = wah
		id = wah_bass
		resonance = 2.5
		cycle_time = 1.5
		freq_cutoff_lo = 350.0
		freq_cutoff_hi = 1750.0
	}
]
freestyle_reverb_props_noreverb = {
	disable_reverb
}
freestyle_reverb_props_rockandroll = {
	envdiffusion = 0.5
	Room = -9250
	DecayTime = 0.4
	reflections = -2602.0
	ReverbDelay = 0.0
	modulationdepth = 0.5
}
freestyle_reverb_props_metal = {
	envdiffusion = 0.5
	Room = -9250
	DecayTime = 0.4
	reflections = -2602.0
	ReverbDelay = 0.0
	modulationdepth = 0.5
}
freestyle_reverb_props_funk = {
	envdiffusion = 0.5
	Room = -9000
	DecayTime = 0.4
	reflections = -2602.0
	ReverbDelay = 0.0
	modulationdepth = 0.5
}
freestyle_reverb_props_rock = {
	envdiffusion = 0.5
	Room = -9250
	DecayTime = 0.4
	reflections = -2602.0
	ReverbDelay = 0.0
	modulationdepth = 0.5
}
freestyle_reverb_props_blues = {
	envdiffusion = 0.5
	Room = -8750
	DecayTime = 0.4
	reflections = -2602.0
	ReverbDelay = 0.0
	modulationdepth = 0.5
}
freestyle_guitar_strum_scaled_velocity_ranges = [
	{
		src_min = 0.0
		src_max = 1.0
		dst_min = 1.0
		dst_max = 1.0
	}
]
freestyle_kit_drums_scaled_velocity_ranges = [
	{
		src_min = 0.0
		src_max = 0.85
		dst_min = 0.5
		dst_max = 1.0
	}
	{
		src_min = 0.85
		src_max = 1.0
		dst_min = 1.0
		dst_max = 1.0
	}
]
freestyle_air_drums_scaled_velocity_ranges = [
	{
		src_min = 0.0
		src_max = 1.0
		dst_min = 0.5
		dst_max = 1.0
	}
]
