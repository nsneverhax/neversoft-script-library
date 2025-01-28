
script ReloadAnimation 
	AllowAssetLoading \{ON}
	UpdateAnimCache \{CLEAR}
	PushAssetContext
	ReloadAnim FileName = <FileName> Anim = <AnimName>
	PopAssetContext
	AllowAssetLoading \{OFF}
endscript
