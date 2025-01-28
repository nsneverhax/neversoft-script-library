Splat_Critical_Remaining_Polys_Pcnt = 0.5
Splat_Alpha_Degen_Rate = 8

script PreAllocSplats 
	Printf \{"Initializing SplatHeap"}
	PreAllocTextureSplat \{Name = 'JOW_Grit01'
		Material = sys_BloodSplat01_sys_BloodSplat01}
	PreAllocTextureSplat \{Name = 'JOW_Puff01'
		Material = sys_BloodSplat02_sys_BloodSplat02}
	PreAllocTextureSplat \{Name = 'skidtrail'
		Material = sys_skidmark_sys_skidmark}
endscript
