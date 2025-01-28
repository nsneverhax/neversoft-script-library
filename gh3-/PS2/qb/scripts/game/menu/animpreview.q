
script reloadanimation 
	allowassetloading \{on}
	updateanimcache \{clear}
	pushassetcontext
	reloadanim filename = <filename> anim = <animname>
	popassetcontext
	allowassetloading \{off}
endscript
