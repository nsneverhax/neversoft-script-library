
script ReloadAnimation 
	AllowAssetLoading \{On}
	PushAssetContext
	ReloadAnim FileName = <FileName> anim = <AnimName>
	PopAssetContext
	AllowAssetLoading \{OFF}
endscript
