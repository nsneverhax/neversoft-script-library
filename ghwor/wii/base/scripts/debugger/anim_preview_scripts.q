
script UnHidePlayerAndDestroyFakes 
	KillSpawnedScript \{Name = _TestAnimSequence}
	if CompositeObjectExists \{Name = FakeCharacter}
		FakeCharacter :Die
	endif
	if CompositeObjectExists \{Name = AnimTreePreviewObject}
		AnimTreePreviewObject :Die
	endif
endscript

script killanimpreviewrefs 
	UnHidePlayerAndDestroyFakes
endscript
