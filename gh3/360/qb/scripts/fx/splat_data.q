splat_critical_remaining_polys_pcnt = 0.5
splat_alpha_degen_rate = 8

script preallocsplats 
	printf \{"Initializing SplatHeap"}
	prealloctexturesplat \{name = 'JOW_Grit01'
		material = sys_bloodsplat01_sys_bloodsplat01}
	prealloctexturesplat \{name = 'JOW_Puff01'
		material = sys_bloodsplat02_sys_bloodsplat02}
	prealloctexturesplat \{name = 'skidtrail'
		material = sys_skidmark_sys_skidmark}
endscript
