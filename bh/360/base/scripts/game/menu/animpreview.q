
script ReloadAnimation 
	AllowAssetLoading \{on}
	PushAssetContext
	ReloadAnim FileName = <FileName> anim = <AnimName>
	PopAssetContext
	AllowAssetLoading \{off}
endscript
