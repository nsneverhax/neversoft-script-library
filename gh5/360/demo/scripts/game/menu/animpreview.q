
script reloadanimation 
	allowassetloading \{on}
	pushassetcontext
	reloadanim filename = <filename> anim = <animname>
	popassetcontext
	allowassetloading \{off}
endscript
