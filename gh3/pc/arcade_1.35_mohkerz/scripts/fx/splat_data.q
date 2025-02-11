Splat_Critical_Remaining_Polys_Pcnt = 0.5
Splat_Alpha_Degen_Rate = 8

script PreAllocSplats 
	printf \{"Initializing SplatHeap"}
	PreAllocTextureSplat \{Name = 'JOW_Grit01'
		material = sys_BloodSplat01_sys_BloodSplat01}
	PreAllocTextureSplat \{Name = 'JOW_Puff01'
		material = sys_BloodSplat02_sys_BloodSplat02}
	PreAllocTextureSplat \{Name = 'skidtrail'
		material = sys_skidmark_sys_skidmark}
endscript
