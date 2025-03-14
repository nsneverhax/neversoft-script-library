
script cutscene_subtitle_create 
	if getglobalflag flag = $NO_DISPLAY_CUTSCENE_SUBTITLES
		return
	endif
	if NOT gotparam text
		return
	endif
	if gotparam duration
		<duration> = (<duration> * 1000)
	endif
	<scale> = 0.8
	if french
		<scale> = 0.6
	elseif spanish
		<scale> = 0.8
	elseif german
		<scale> = 0.6
	elseif italian
		<scale> = 0.6
	endif
	create_panel_block {
		id = cutscene_subtitle
		text = <text>
		font_face = text_a1
		rgba = [220 200 180 255]
		pos = (600.0, 675.0)
		time = <duration>
		dims = (1200.0, 0.0)
		allow_expansion
		just = [center bottom]
		scale = <scale>
		internal_just = [center bottom]
		parent = root_window
		z_priority = 115
	}
endscript

script cutscene_subtitle_cleanup 
	if screenelementexists \{id = cutscene_subtitle}
		destroyscreenelement \{id = cutscene_subtitle}
	endif
endscript
c_r1_buildkick_intro_subtitles = [
	{
		text = "(Rube) Oh hey man, you gotta check this Jeff King vid out."
		time = 3.5
		duration = 6.9
	}
	{
		text = "(YOU) Yeah?  Well, let me see."
		time = 7.0
		duration = 1.4
	}
	{
		text = "(Jeff King) I wanna see what you guys come up with to shred."
		time = 9.0
		duration = 1.63
	}
	{
		text = "(Jeff King) So build something, film yourself skating it, and send in the video."
		time = 11.2
		duration = 3.2
	}
	{
		text = "(Jeff King) If you're stuff is on point, you might just get a visit from me."
		time = 14.6
		duration = 2.8
	}
	{
		text = "(Jeff King) Time to get to work!"
		time = 17.8
		duration = 1
	}
	{
		text = "(Rube) Oh, hell yeah! Man, we should totally do that contest."
		time = 18.9
		duration = 3.8
	}
	{
		text = "(YOU) And do what? Build something?"
		time = 22.8
		duration = 1.7
	}
	{
		text = "(Rube) Yeah!  Let's go find something we can trick out."
		time = 24.6
		duration = 2.6
	}
	{
		text = "(Rube) We can raid my dad's garage for tools."
		time = 27.3
		duration = 2.0
	}
	{
		text = "(YOU) As long as your pops don't mind, I'm down."
		time = 29.5
		duration = 1.7
	}
]
c_r1_buildkick_outro_subtitles = [
	{
		text = "(Rube) Our video's up on Jeff King's site."
		time = 1.1
		duration = 2.0
	}
	{
		text = "(Rube) Awesome."
		time = 3.1
		duration = 1.6
	}
	{
		text = "(YOU) There's a bunch of other vids, too."
		time = 4.7
		duration = 1.4
	}
	{
		text = "(YOU) You think we got a chance?"
		time = 6.3
		duration = 1.1
	}
	{
		text = "(Rube) Same as everybody else!"
		time = 7.5
		duration = 1.5
	}
	{
		text = "(Rube) Oh hey, I gotta jet."
		time = 9.3
		duration = 1.1
	}
	{
		text = "(Rube) ...but meet me back here later."
		time = 10.6
		duration = 1.2
	}
	{
		text = "(YOU) Yeah. When King calls, take a message for me."
		time = 12.0
		duration = 2.5
	}
]
c_r1_postvid_subtitles = [
	{
		text = "(Rube) Dude! You are not going to believe this!"
		time = 0.6
		duration = 2.7
	}
	{
		text = "(YOU) What happened?  You get a job or something?"
		time = 3.3
		duration = 1.7
	}
	{
		text = "(Rube) C'mon man."
		time = 5.1
		duration = 1.6
	}
	{
		text = "(Rube) No."
		time = 7.1
		duration = 0.6
	}
	{
		text = "(Rube) Jeff King!  He loved our video!"
		time = 7.9
		duration = 3.0
	}
	{
		text = "(Jeff King) Hey guys.  Great video! You got the right idea."
		time = 11.0
		duration = 2.4
	}
	{
		text = "(Jeff King) Listen up, cancel your plans 'cause I'm coming your way for a demo in Philly."
		time = 13.7
		duration = 3.3
	}
	{
		text = "(Jeff King) Oh yeah, and I'm crashing at your place tonight."
		time = 17.2
		duration = 1.8
	}
	{
		text = "(YOU) Oh man!  Are you kiddin' me!?!"
		time = 19.1
		duration = 2.1
	}
	{
		text = "(Rube) Dude! Jeff King is gonna be on your couch!"
		time = 21.5
		duration = 2.5
	}
	{
		text = "(Rube) We gotta get back to your place!"
		time = 24.8
		duration = 1.2
	}
]
c_r1_buildqp_intro_subtitles = [
	{
		text = "(Jeff King) What's up guys?"
		time = 1.1
		duration = 0.8
	}
	{
		text = "(YOU) Oh hey, you made it! C'mon in."
		time = 2.0
		duration = 2.1
	}
	{
		text = "(Rube) What's up Mr. King?"
		time = 4.1
		duration = 1.8
	}
	{
		text = "(Jeff King) Dude, call me Jeff."
		time = 6.1
		duration = 1.4
	}
	{
		text = "(Jeff King) Lemme guess, you're Rube."
		time = 7.6
		duration = 1.7
	}
	{
		text = "(YOU) So...you're here to do a demo?"
		time = 9.5
		duration = 2.0
	}
	{
		text = "(Jeff King) Yeah, just a shop demo."
		time = 11.5
		duration = 1.5
	}
	{
		text = "(Jeff King) You should come."
		time = 13.1
		duration = 1.0
	}
	{
		text = "(YOU) Totally man.  What else you wanna do?"
		time = 14.1
		duration = 2.1
	}
	{
		text = "(Jeff King) Well hell, I'm gonna show you guys how to build some killer rigs."
		time = 16.5
		duration = 3.0
	}
	{
		text = "(Rube) Sweet!"
		time = 19.6
		duration = 1.1
	}
	{
		text = "(Jeff King) So where's all your tools?"
		time = 20.8
		duration = 1.0
	}
	{
		text = "(YOU) Oh, Rube's dad has a whole garage full of tools to fix cars and stuff."
		time = 21.9
		duration = 3.6
	}
	{
		text = "(Jeff King) Woah, whoa.  It's never a good idea to mess with another man's tools."
		time = 25.6
		duration = 3.5
	}
	{
		text = "(Rube) Uh, then what do we do?"
		time = 29.1
		duration = 1.6
	}
	{
		text = "(Jeff King) Hey, no worries, I got ya covered."
		time = 30.7
		duration = 1.7
	}
	{
		text = "(Jeff King)  When I'm done with you guys you'll be rigging rails, quarter pipes, all that!"
		time = 32.5
		duration = 3.1
	}
]
c_r1_demo_intro_subtitles = [
	{
		text = "(Jeff King) There you are."
		time = 0.25
		duration = 0.9
	}
	{
		text = "(YOU) So what's up with this demo?  Is it gonna be awesome?"
		time = 1.2
		duration = 2.3
	}
	{
		text = "(Jeff King) I don't think so man."
		time = 3.6
		duration = 1.3
	}
	{
		text = "(Jeff King) Turns out they don't have anything to skate!"
		time = 5.0
		duration = 1.7
	}
	{
		text = "(YOU) Dude, what are you gonna do?"
		time = 7.4
		duration = 1.2
	}
	{
		text = "(Jeff King) Me?  Not me man.  YOU."
		time = 8.9
		duration = 2.5
	}
	{
		text = "(YOU) What?"
		time = 11.4
		duration = 0.5
	}
	{
		text = "(Jeff King) If you're gonna ride in the demo, then you have to make it happen."
		time = 12.0
		duration = 2.1
	}
	{
		text = "(YOU) Whoa, hold on.  Ride in the demo?"
		time = 14.3
		duration = 2.2
	}
	{
		text = "(Jeff King) Dude, you were killing it back at your place..."
		time = 16.7
		duration = 2.1
	}
	{
		text = "(Jeff King) ...help me build this and you can shred it."
		time = 18.6
		duration = 1.7
	}
]
c_r1_buildspine_intro_subtitles = [
	{
		text = "(Jeff King) All right. You know the basics, now it's time to add to your arsenal."
		time = 0.3
		duration = 3.1
	}
	{
		text = "(YOU) Right on.  So what are we making?"
		time = 3.5
		duration = 1.7
	}
	{
		text = "(Jeff King) Specifically?  Curved rails."
		time = 5.3
		duration = 1.7
	}
	{
		text = "(Jeff King) This is gonna open up so many possibilities!"
		time = 7.2
		duration = 2.0
	}
]
c_r1_showdown_intro_subtitles = [
	{
		text = "(Jeff King) Well, here it is. Ready?"
		time = 0.1
		duration = 1.6
	}
	{
		text = "(YOU) Totally.  So what does the winner get?"
		time = 1.8
		duration = 1.8
	}
	{
		text = "(Jeff King) Winner?"
		time = 3.8
		duration = 0.8
	}
	{
		text = "(Jeff King) Well, I guess there's a trophy or something."
		time = 4.9
		duration = 1.7
	}
	{
		text = "(Jeff King) That's not really the point though."
		time = 6.8
		duration = 1.2
	}
	{
		text = "(Jeff King) Guys like you and me come here to show off some crazy stuff, hang with everyone, and skate."
		time = 8.3
		duration = 3.5
	}
	{
		text = "(YOU) Okay.  So what's the game plan?"
		time = 12.0
		duration = 1.5
	}
	{
		text = "(Jeff King) There's gonna be some things the other teams designed and you're gonna add your own flavor to it."
		time = 13.8
		duration = 3.7
	}
	{
		text = "(Jeff King) Then we'll see who can kill it the most."
		time = 17.9
		duration = 1.4
	}
]
c_r1_showdown_outro_subtitles = [
	{
		text = "(Jeff King) Yeah man...I knew you'd clean up!"
		time = 4.5
		duration = 2.1
	}
	{
		text = "(Jeff King) You got the eye for this stuff."
		time = 6.6
		duration = 1.4
	}
	{
		text = "(YOU) Thanks, man.  Those setups were amazing and everyone was destroying 'em!"
		time = 8.1
		duration = 4.0
	}
	{
		text = "(Jeff King) Yeah, but you get to put that thing on your mantle."
		time = 12.2
		duration = 2.4
	}
	{
		text = "(Rube) Now you're gonna have to build a mantle."
		time = 14.7
		duration = 1.8
	}
	{
		text = "(Vanessa Torres) Hey Jeff.  (To YOU)  Hey, great job out there!"
		time = 16.8
		duration = 2.4
	}
	{
		text = "(Vanessa Torres) Were you here last year?"
		time = 19.3
		duration = 1.3
	}
	{
		text = "(YOU) Nah. This is my first time."
		time = 20.9
		duration = 1.5
	}
	{
		text = "(Daewon Song) First time?! You rocked it out there!"
		time = 22.6
		duration = 2.3
	}
	{
		text = "(Jeff King) He's a natural.  You aren't gonna believe the video this guy sent in."
		time = 25.2
		duration = 3.0
	}
	{
		text = "(Jeff King) This nutball Rube sent me a video of him and his bro gapping these jalopies."
		time = 28.1
		duration = 4.0
	}
	{
		text = "(Daewon Song) Jalopies?"
		time = 32.2
		duration = 1.2
	}
	{
		text = "(Jeff King) Oh man it was insane!"
		time = 33.4
		duration = 1.5
	}
	{
		text = "(Daewon Song) Man, I wanna check that out."
		time = 35.2
		duration = 1.5
	}
]
c_h1_bigpush_intro_subtitles = [
	{
		text = "(Bosco) Eh...don't look so bad."
		time = 4.2
		duration = 1.3
	}
	{
		text = "(YOU) Are we lookin' at the same gap?"
		time = 5.8
		duration = 1.3
	}
	{
		text = "(Bosco) You got this."
		time = 7.7
		duration = 0.8
	}
	{
		text = "(YOU) Whoa!"
		time = 25.2
		duration = 1.0
	}
	{
		text = "(YOU) Awesome!"
		time = 27.7
		duration = 0.88
	}
	{
		text = "(Mike V) C'mon man!"
		time = 29.0
		duration = 1.4
	}
	{
		text = "(Mike V) You tellin' me you can't clear that?"
		time = 30.3
		duration = 1.8
	}
	{
		text = "(YOU) I can't believe this.  Mike V watching me bust my ass!"
		time = 32.6
		duration = 3.6
	}
	{
		text = "(Mike V) You're skating at that gap like you're trying to do a kick flip."
		time = 36.6
		duration = 2.2
	}
	{
		text = "(YOU) I AM trying to do a kickflip."
		time = 39.0
		duration = 1.6
	}
	{
		text = "(Mike V) NO. You're trying to clear a huge gap, AND do a kickflip while you're at it."
		time = 40.9
		duration = 3.8
	}
	{
		text = "(Mike V) But you're never gonna do it unless you go faster."
		time = 45.1
		duration = 2.3
	}
	{
		text = "(YOU) Faster? How am I supposed to do that?"
		time = 47.8
		duration = 2.1
	}
	{
		text = "(Mike V) Come on. Let me show you..."
		time = 50.3
		duration = 1.1
	}
]
c_h1_bigpush_outro_subtitles = [
	{
		text = "(Mike V) Perfect! See! Speed's the key. "
		time = 1.1
		duration = 2.7
	}
	{
		text = "(YOU) You're right.  Those extra few pushes were the move."
		time = 3.9
		duration = 2.6
	}
	{
		text = "(Cooper) Hey, brothers.  I got that one on film right here. "
		time = 6.7
		duration = 2.8
	}
	{
		text = "(YOU) Yeah?  Lemme see."
		time = 9.6
		duration = 1.4
	}
	{
		text = "(Cooper) Well, you could look at it now, but you wouldn't see much."
		time = 11.1
		duration = 3.2
	}
	{
		text = "(Cooper) I gotta develop it first.  It's film, see."
		time = 14.3
		duration = 2.6
	}
	{
		text = "(Mike V) Oh, that's old school man."
		time = 17.2
		duration = 1.6
	}
	{
		text = "(Cooper) Hey dudes, is there any other way?"
		time = 19.0
		duration = 1.5
	}
	{
		text = "(Cooper) Hey, thanks for the show guys, I gotta run."
		time = 20.8
		duration = 2.0
	}
	{
		text = "(YOU) Hey!  What's your name?"
		time = 23.3
		duration = 1.5
	}
	{
		text = "(Cooper) Friends call me Cooper.  Stay stoked dudes."
		time = 25.1
		duration = 3.1
	}
	{
		text = "(Mike V) That dude's got the right idea."
		time = 28.8
		duration = 2.0
	}
	{
		text = "(Mike V) Hey, if you're up for it, meet me back here later and we'll skate some more."
		time = 31.1
		duration = 2.7
	}
]
c_h1_bigspines_outro_subtitles = [
	{
		text = "(Mike V) Holy cow those spines were huge!"
		time = 0.6
		duration = 2.0
	}
	{
		text = "(Andrew Reynolds) Brag brag brag."
		time = 2.7
		duration = 2.0
	}
	{
		text = "(Mike V) Andrew Reynolds.  What are you doing here, Boss?"
		time = 4.8
		duration = 3.1
	}
	{
		text = "(Andrew Reynolds) Oh, it's a business trip.  Some kids told me about a massive gap around here."
		time = 8.2
		duration = 3.7
	}
	{
		text = "(Mike V) I think I know the one.  Wanna hit it?"
		time = 12.0
		duration = 2.0
	}
	{
		text = "(Andrew Reynolds) Yeah, definitely.  Let's go skate it."
		time = 14.5
		duration = 1.5
	}
	{
		text = "(Mike V) C'mon kid.  Let's go."
		time = 16.0
		duration = 1.1
	}
]
c_h1_epicdrop_outro_subtitles = [
	{
		text = "(Andrew Reynolds) That was ridiculous!  We should hit it again sometime."
		time = 0.6
		duration = 3.4
	}
	{
		text = "(YOU) That's it?  You're not going to go get a camera crew or something?"
		time = 4.2
		duration = 4.0
	}
	{
		text = "(Andrew Reynolds) Alright, listen kid.  You don't always need to film.  You skate because you love it."
		time = 8.5
		duration = 3.9
	}
	{
		text = "(Mike V) Yeah.  You just did that gap, right?  So now you know you can do it."
		time = 12.6
		duration = 3.2
	}
	{
		text = "(Mike V) Who else do you need to impress?  Skating's not all about magazines and TV."
		time = 15.9
		duration = 4.3
	}
	{
		text = "(Mike V) Skating's about skating, man."
		time = 20.4
		duration = 1.7
	}
	{
		text = "(Andrew Reynolds) Alright, see you guys later."
		time = 22.4
		duration = 1.3
	}
]
c_h1_cutscene2_subtitles = [
	{
		text = "(YOU) All right!  All right!  I'm coming."
		time = 1.4
		duration = 2.1
	}
	{
		text = "(Bosco) Dude, have you seen this?"
		time = 3.9
		duration = 1.8
	}
	{
		text = "(YOU) '7PLY'?  This thing was huge when I first started skating."
		time = 6.2
		duration = 4.2
	}
	{
		text = "(YOU) It's been around forever."
		time = 10.4
		duration = 1.0
	}
	{
		text = "(Bosco) And YOU'RE in it!"
		time = 11.7
		duration = 1.3
	}
	{
		text = "(YOU) No way!  That's the sequence that Cooper guy shot of me, this must be his zine."
		time = 13.9
		duration = 4.8
	}
	{
		text = "(Mike V) What's that?  Lemme see that."
		time = 19.0
		duration = 1.1
	}
	{
		text = "(YOU) MIKE! Hey!  Check this out."
		time = 20.4
		duration = 1.7
	}
	{
		text = "(Mike V) No way!  They're still putting these out?  Dude! You're all over it!"
		time = 23.0
		duration = 3.2
	}
	{
		text = "(YOU) Yeah man."
		time = 26.4
		duration = 1.0
	}
	{
		text = "(Mike V) 7PLY.  Man, that brings back some memories."
		time = 27.5
		duration = 3.6
	}
	{
		text = "(Mike V) Good job kid!"
		time = 31.5
		duration = 1.0
	}
	{
		text = "(YOU) Alright, I'll meet you downtown and we'll skate."
		time = 32.7
		duration = 1.8
	}
	{
		text = "(Mike V) Yeah, come find me later."
		time = 34.8
		duration = 1.4
	}
	{
		text = "(YOU) Here, Bosco.  Thanks."
		time = 36.5
		duration = 1.1
	}
	{
		text = "(Bosco) No prob.  Later."
		time = 37.9
		duration = 1.4
	}
]
c_h1_boostpull_intro_subtitles = [
	{
		text = "(Mike V) Hey what's up?"
		time = 0.9
		duration = 1.0
	}
	{
		text = "(Cooper) If it ain't the little rippers from before."
		time = 1.9
		duration = 2.3
	}
	{
		text = "(Mike V) Who you callin' little?"
		time = 4.2
		duration = 1.1
	}
	{
		text = "(YOU) Dude!  Thanks for putting me in your zine. That's so cool!"
		time = 5.5
		duration = 3.3
	}
	{
		text = "(Cooper) Hey, no problem man."
		time = 9.0
		duration = 1.3
	}
	{
		text = "(Cooper) Funny thing, that's the last one."
		time = 10.9
		duration = 2.2
	}
	{
		text = "(YOU) What?  Why?"
		time = 13.2
		duration = 1.7
	}
	{
		text = "(Cooper) Time's have changed.  No one cares about zines anymore."
		time = 15.2
		duration = 3.6
	}
	{
		text = "(Cooper) I mean what am I supposed to do with all of these?"
		time = 19.5
		duration = 2.4
	}
	{
		text = "(Mike V) C'mon man!"
		time = 21.9
		duration = 1.4
	}
	{
		text = "(Mike V) Why don't you come with us and hit a few spots. You can drop off some zines along the way."
		time = 23.4
		duration = 4.5
	}
	{
		text = "(Cooper) Yeah sure.  Why not?"
		time = 28.2
		duration = 2.0
	}
	{
		text = "(Cooper) Maybe I can get some shots while I'm at it."
		time = 30.4
		duration = 2.0
	}
]
c_h1_finalepic_intro_subtitles = [
	{
		text = "(Mike V) That was intense."
		time = 0.1
		duration = 1.0
	}
	{
		text = "(Cooper) Man, that was fun!"
		time = 1.4
		duration = 1.2
	}
	{
		text = "(Cooper)  I got some good photos, too."
		time = 3.0
		duration = 1.7
	}
	{
		text = "(Cooper) I'd of put 'em in the next  7PLY  but the kids don't read anything on paper anymore."
		time = 4.8
		duration = 4.5
	}
	{
		text = "(YOU) Hold on.  Why not make it into a video-zine."
		time = 10.2
		duration = 3.1
	}
	{
		text = "(YOU) Like a show you put on the internet?!"
		time = 13.3
		duration = 1.6
	}
	{
		text = "(Mike V) That's a great idea, kid!  You should totally do it, Coop."
		time = 15.2
		duration = 3.0
	}
	{
		text = "(Cooper) I don't know about all that computer stuff."
		time = 18.5
		duration = 2.3
	}
	{
		text = "(YOU) But Bosco does!  He's a total nerd."
		time = 20.9
		duration = 2.7
	}
	{
		text = "(Cooper) Okay...you mean like I shoot it and he does the rest?"
		time = 24.1
		duration = 3.3
	}
	{
		text = "(Cooper) Okay.  Let's go!"
		time = 28.7
		duration = 1.8
	}
]
c_h1_finalepic_outro_subtitles = [
	{
		text = "(Bosco) Check it out!  The video's already got a hundred thousand hits!"
		time = 0.3
		duration = 3.0
	}
	{
		text = "(Cooper) C'mon man, you mean that many people have seen it?"
		time = 4.0
		duration = 2.3
	}
	{
		text = "(Mike V) Good skating is just good skating man..."
		time = 6.5
		duration = 2.2
	}
	{
		text = "(Mike V) ...it doesn't matter if its in a magazine or on the internet."
		time = 8.7
		duration = 2.4
	}
	{
		text = "(YOU) Yeah.  And now you're worldwide."
		time = 11.3
		duration = 2.1
	}
	{
		text = "(Cooper) Hey, you're the guys who made it happen...thanks."
		time = 13.7
		duration = 2.6
	}
]
c_tutorial_1_subtitles = [
	{
		text = "(Tony Hawk) Hey, you that kid Arto and \\nMike V have been talking about."
		time = 0.4
		duration = 2.2
	}
	{
		text = "(YOU) Hey Tony!  Maybe, what they been saying?"
		time = 2.9
		duration = 2.7
	}
	{
		text = "(Tony Hawk) Saying some kid they went skating with was an up and comer."
		time = 6.0
		duration = 2.7
	}
	{
		text = "(YOU) Yeah?"
		time = 8.8
		duration = 0.8
	}
	{
		text = "(Tony Hawk) Sounds like you can do it all.  Career ripper, Hardcore thrasher, rigging up your own spots."
		time = 9.3
		duration = 4.5
	}
	{
		text = "(YOU) That's me alright."
		time = 14.1
		duration = 1.1
	}
	{
		text = "(Tony Hawk) Just know there's lots more out there to do that'll help you progress your skating."
		time = 15.3
		duration = 3.6
	}
	{
		text = "(Tony Hawk) Here, Let me show you."
		time = 18.8
		duration = 1.0
	}
]
c_tutorial_2_subtitles = [
	{
		text = "(Tony Hawk) Grinds, manuals, hitting long lines..."
		time = 0.4
		duration = 2.3
	}
	{
		text = "(Tony Hawk) Skaters have left their marks for big airs, stalls, wallrides, Natas spins and more."
		time = 2.7
		duration = 4.7
	}
]
c_tutorial_3_subtitles = [
	{
		text = "(Tony Hawk) Good job!  Mike and Arto were right."
		time = 0.1
		duration = 2.6
	}
	{
		text = "(YOU) Thanks."
		time = 2.8
		duration = 0.8
	}
	{
		text = "(Tony Hawk) There's a whole world of possibilities out there for someone with your skills."
		time = 3.6
		duration = 3.1
	}
	{
		text = "(YOU) So, like, what should I do?"
		time = 7.1
		duration = 1.8
	}
	{
		text = "(Tony Hawk) Just stay true to yourself and you'll be fine."
		time = 9.1
		duration = 1.8
	}
	{
		text = "(Tony Hawk) You're officially on my radar now kid.  I'll be checking in with you from time to time."
		time = 11.7
		duration = 3.6
	}
	{
		text = "(YOU) Okay."
		time = 15.6
		duration = 0.8
	}
	{
		text = "(Tony Hawk) You got real potential."
		time = 16.4
		duration = 1.2
	}
	{
		text = "(Tony Hawk) Work hard enough and you could have your own team one day."
		time = 18.0
		duration = 2.5
	}
	{
		text = "(YOU) Get outta here."
		time = 20.6
		duration = 1.1
	}
	{
		text = "(Tony Hawk) I'm serious."
		time = 21.7
		duration = 1.1
	}
	{
		text = "(Tony Hawk) Keep hanging with Arto to get some career exposure..."
		time = 23.2
		duration = 2.3
	}
	{
		text = "(Tony Hawk) ...or go big with Mike V to build up your hardcore cred..."
		time = 25.6
		duration = 2.5
	}
	{
		text = "(Tony Hawk) ...and word is Jeff King was pretty impressed with the vid you sent in."
		time = 28.5
		duration = 3.0
	}
	{
		text = "(YOU) Yeah?"
		time = 31.7
		duration = 0.8
	}
	{
		text = "(Tony Hawk) Get ready kid, this is just the beginning."
		time = 32.6
		duration = 1.1
	}
	{
		text = "(Tony Hawk) The East Coast scene is huge and there's always pros around, who knows who you'll run into."
		time = 35.0
		duration = 4.9
	}
]
c_r2_climb_intro_subtitles = [
	{
		text = "(YOU) What's up Shayne?"
		time = 1.3
		duration = 1.2
	}
	{
		text = "(Shayne) Hey man, I'm on the lookout."
		time = 2.6
		duration = 1.6
	}
	{
		text = "(Shayne) I heard Bam's in town."
		time = 4.3
		duration = 1.3
	}
	{
		text = "(YOU) So?"
		time = 5.7
		duration = 1.0
	}
	{
		text = "(Shayne) He owes me money man, I need it."
		time = 6.5
		duration = 1.6
	}
	{
		text = "(YOU) I got ya covered..."
		time = 8.2
		duration = 1.1
	}
	{
		text = "(Shayne) Yeah...It's a hundred bucks."
		time = 9.5
		duration = 1.6
	}
	{
		text = "(YOU) You loaned money to Bam Margera? What're you, an idiot?"
		time = 11.1
		duration = 3.1
	}
	{
		text = "(Bam Margera) Look out, idiot!"
		time = 14.6
		duration = 1.6
	}
	{
		text = "(Shayne) Whoa! That's him! Let's get him!"
		time = 16.4
		duration = 2.2
	}
	{
		text = "(YOU) Great."
		time = 18.5
		duration = 1.0
	}
	{
		text = "(Bam Margera) Man! What the...?!"
		time = 30.6
		duration = 0.8
	}
	{
		text = "(Shayne) Remember me?!?"
		time = 31.3
		duration = 1.1
	}
	{
		text = "(Bam Margera) No!...Should I?"
		time = 32.3
		duration = 1.6
	}
	{
		text = "(Shayne) I gave you a hundred dollars last year.  So you could soap the Love fountain."
		time = 34.1
		duration = 3.5
	}
	{
		text = "(Shayne) Remember?"
		time = 37.6
		duration = 1.0
	}
	{
		text = "(Bam Margera) Oh, yeah. Hey! What's up, man?"
		time = 38.5
		duration = 2.6
	}
	{
		text = "(Shayne) What's up!? You owe me a hundred dollars!!"
		time = 41.4
		duration = 2.8
	}
	{
		text = "(Bam Margera) Oh.  Yeah.  Sure.  Just a second."
		time = 44.2
		duration = 2.5
	}
	{
		text = "(Bam Margera) Happy?"
		time = 48.5
		duration = 1.1
	}
	{
		text = "(YOU) Hey man, sorry for the hassle."
		time = 49.7
		duration = 2.1
	}
	{
		text = "(Bam Margera) I'm used to it."
		time = 51.8
		duration = 1.2
	}
	{
		text = "(Bam Margera) I'll tell you what.  I've got some time to kill while I'm in town and there's some spots I wanna hit."
		time = 53.2
		duration = 4.4
	}
	{
		text = "(Bam Margera) They're not easy to get to, but if you can keep up with me..."
		time = 57.5
		duration = 2.5
	}
	{
		text = "(Bam Margera) ...I'll let you tag along.  You dirtbags up for it?"
		time = 60.0
		duration = 3.0
	}
	{
		text = "(YOU and Shayne) Yeah!"
		time = 63.3
		duration = 1.2
	}
]
c_r2_climb_outro_subtitles = [
	{
		text = "(Bam Margera) That was comedy-plus, but listen, I gotta jet."
		time = 0.6
		duration = 4.0
	}
	{
		text = "(Bam Margera)  We're taping my show at the space museum in DC."
		time = 4.5
		duration = 3.0
	}
	{
		text = "(Bam Margera) It was sooo, soooo, awesome hanging with you, dude!  I mean, just sooo awesome!"
		time = 7.4
		duration = 5.5
	}
	{
		text = "(YOU) Ok...Ok...Yeah, dude.  It was...fun."
		time = 12.9
		duration = 2.9
	}
	{
		text = "(Bam Margera) Lets do this again.  Real soon."
		time = 15.9
		duration = 2.3
	}
	{
		text = "(Bam Margera) *Laughs*"
		time = 18.3
		duration = 1.2
	}
	{
		text = "(Shayne) Man!  What a cool day."
		time = 20.3
		duration = 2.1
	}
	{
		text = "(Shayne)  I got to hang out with Bam Margera and I got a hundred dollars for it!"
		time = 22.4
		duration = 4.1
	}
	{
		text = "(YOU) No you didn't, dude.  You're just back at zero."
		time = 26.4
		duration = 2.6
	}
	{
		text = "(Shayne) It was still cool."
		time = 29.0
		duration = 1.6
	}
	{
		text = "(YOU) No, it wasn't."
		time = 30.6
		duration = 1.4
	}
	{
		text = "(Shayne) huh?"
		time = 32.0
		duration = 1.0
	}
	{
		text = "(YOU) Bam just stole my wallet."
		time = 32.5
		duration = 1.8
	}
]
c_r2_breakin_intro_subtitles = [
	{
		text = "(YOU) Okay...all I gotta do is bust in and get my wallet back."
		time = 1.8
		duration = 3.1
	}
	{
		text = "(Shayne) Hold on!  There's, like, a bunch of dudes not letting people in."
		time = 5.0
		duration = 3.2
	}
	{
		text = "(YOU) Then we're gonna have to find another way in, right?  Come on!"
		time = 12.1
		duration = 2.3
	}
]
c_r2_skateoff_intro_subtitles = [
	{
		text = "(Bam Margera) Right here is a ridiculous spot for skating."
		time = 0.5
		duration = 2.5
	}
	{
		text = "(Bam Margera) We're gonna see what kind of mayhem we can get ourselves into."
		time = 2.9
		duration = 2.7
	}
	{
		text = "(YOU) aaaaaahhhhh."
		time = 5.6
		duration = 1.0
	}
	{
		text = "(Bam Margera) Hey."
		time = 7.1
		duration = 1.0
	}
	{
		text = "(Bam Margera) What are YOU doing here?"
		time = 8.0
		duration = 1.4
	}
	{
		text = "(YOU) Wallet."
		time = 10.0
		duration = 1.3
	}
	{
		text = "(Bam Margera) Come and get it!"
		time = 11.4
		duration = 1.2
	}
	{
		text = "(Bam Margera) Wooooo!!!  *laughs*"
		time = 13.0
		duration = 1.7
	}
	{
		text = "(Producer) Keep those cameras rolling!"
		time = 15.1
		duration = 1.2
	}
]
c_r2_skateoff_outro_subtitles = [
	{
		text = "(Bam Margera)  Argh!"
		time = 0.4
		duration = 1.5
	}
	{
		text = "(Bam Margera)  Are you gonna let him do that to me dude?  You're the producer!  Produce him out of here!  Now!"
		time = 1.6
		duration = 5.5
	}
	{
		text = "(Bam Margera)  I'll be in my trailer."
		time = 7.0
		duration = 2.3
	}
	{
		text = "(Producer)  Listen, kid.  That was great stuff."
		time = 9.6
		duration = 2.4
	}
	{
		text = "(YOU)  Huh?"
		time = 11.9
		duration = 0.8
	}
	{
		text = "(Producer)  I've never seen him get like that.  Fan-TAS-tic!"
		time = 12.5
		duration = 2.4
	}
	{
		text = "(Producer)  How'd you like to make some money?  Like some real big money?"
		time = 14.9
		duration = 3.6
	}
	{
		text = "(YOU)  Go on..."
		time = 18.8
		duration = 1.1
	}
	{
		text = "(Producer)  Just keep doing what you're doing."
		time = 20.0
		duration = 1.8
	}
	{
		text = "(Producer)  Here's a list of our next shooting locations.  I won't tell BAM anything."
		time = 21.7
		duration = 3.4
	}
	{
		text = "(YOU)  Wait, you want me to mess up your show?"
		time = 25.1
		duration = 2.5
	}
	{
		text = "(Producer)  Bingo!  Well...Do we have a deal?"
		time = 27.6
		duration = 2.8
	}
	{
		text = "(YOU)  You got it."
		time = 30.4
		duration = 0.9
	}
]
c_r2_show1_intro_subtitles = [
	{
		text = "(Shayne)  I guess this is the place."
		time = 0.5
		duration = 1.9
	}
	{
		text = "(Shayne)  Just do like that Producer guy said and cause some mayhem.."
		time = 2.5
		duration = 3.1
	}
]
c_r2_show1_outro_subtitles = [
	{
		text = "(Shayne)  Sweet!  You totally trashed his show!"
		time = 0.5
		duration = 2.7
	}
	{
		text = "(YOU)  Yeah!  Where to next?"
		time = 3.2
		duration = 2.1
	}
	{
		text = "(Shayne)  Next up is the bridge by Philly."
		time = 5.3
		duration = 2.0
	}
]
c_r2_show2_intro_subtitles = [
	{
		text = "(Shayne)  My guess is the show is happening near all those cameras and lights and stuff."
		time = 0.4
		duration = 4.4
	}
	{
		text = "(YOU)  Top notch Sherlock, top notch."
		time = 4.7
		duration = 2.9
	}
	{
		text = "(Shayne)  Thanks man."
		time = 7.7
		duration = 1.1
	}
]
c_r2_show2_outro_subtitles = [
	{
		text = "(Bam Margera)  That's it!  Forget it!  I'm done."
		time = 1.4
		duration = 2.4
	}
	{
		text = "(YOU)  Dude!  What's the deal?  Stop being such a baby."
		time = 4.5
		duration = 2.8
	}
	{
		text = "(Bam Margera)  I'M NOT BEING A BABY! You're wrecking my show!"
		time = 7.4
		duration = 2.6
	}
	{
		text = "(Producer)  Yeah, but it makes for great TV!"
		time = 10.1
		duration = 1.9
	}
	{
		text = "(Producer)  You should be thanking our young friend here."
		time = 11.9
		duration = 1.9
	}
	{
		text = "(Bam Margera)  What're you talking about?"
		time = 13.9
		duration = 1.4
	}
	{
		text = "(Producer)  Network loves the new stuff!"
		time = 15.4
		duration = 2.0
	}
	{
		text = "(Bam Margera)  Yeah, right.  Shut the hell up."
		time = 17.4
		duration = 1.7
	}
	{
		text = "(Producer)  This guy right here is a hit!"
		time = 19.1
		duration = 2.0
	}
	{
		text = "(YOU)  What?  Really?"
		time = 21.2
		duration = 1.5
	}
	{
		text = "(Producer)  Really."
		time = 22.6
		duration = 0.9
	}
	{
		text = "(Producer)  How would you like your own show?"
		time = 23.8
		duration = 1.6
	}
	{
		text = "(Bam and YOU)  WHAT?!?"
		time = 25.4
		duration = 0.8
	}
	{
		text = "(Producer)  You heard me.  Deals already in the works.  You on board?"
		time = 26.2
		duration = 2.9
	}
	{
		text = "(YOU)  You're serious?"
		time = 29.3
		duration = 1.1
	}
	{
		text = "(Bam Margera)  Hey kid, when they offer you a show, you don't say no. "
		time = 30.5
		duration = 3.3
	}
	{
		text = "(YOU)  Well yeah...yeah!"
		time = 33.9
		duration = 1.6
	}
	{
		text = "(Bam Margera)  That's the smartest thing you said all day."
		time = 35.7
		duration = 2.0
	}
	{
		text = "(Bam Margera)  Oh...And you can have this back.  It's a little light for my taste."
		time = 37.7
		duration = 3.2
	}
]
c_r3_museums_intro_subtitles = [
	{
		text = "(YOU)  Hey Rodney!  What're you doing in DC?"
		time = 1.3
		duration = 2.1
	}
	{
		text = "(Rodney Mullen)  Whaddya mean?  I'm waiting for you."
		time = 3.3
		duration = 1.6
	}
	{
		text = "(Daewon Song)  Hey, what's up?"
		time = 4.9
		duration = 1.0
	}
	{
		text = "(YOU)  Daewon Song?  Vanessa Torres?"
		time = 5.7
		duration = 2.3
	}
	{
		text = "(YOU)  What's going on here?"
		time = 8.0
		duration = 1.2
	}
	{
		text = "(Vanessa Torres)  We've seen what you've done over here on the East Coast."
		time = 9.2
		duration = 2.4
	}
	{
		text = "(Vanessa Torres)  All those banks, kickers, and rails you've been building."
		time = 11.6
		duration = 2.5
	}
	{
		text = "(YOU)  So?"
		time = 14.1
		duration = 0.9
	}
	{
		text = "(Daewon Song)  So...Focus mag is throwing out this creative challenge."
		time = 14.7
		duration = 3.4
	}
	{
		text = "(Daewon Song)  It's all around the cities in this area."
		time = 18.2
		duration = 1.9
	}
	{
		text = "(Daewon Song)  You're a local.  We like your stuff and want you in our group."
		time = 20.1
		duration = 3.3
	}
	{
		text = "(YOU)  So what's this challenge?"
		time = 23.4
		duration = 1.5
	}
	{
		text = "(Vanessa Torres)  Rig the World!"
		time = 24.9
		duration = 1.2
	}
	{
		text = "(Vanessa Torres)  They got a list of spots that they want people to change, make skateable, and get proof of'em skating it."
		time = 25.9
		duration = 4.5
	}
	{
		text = "(Daewon Song)  Sounds good, huh?"
		time = 30.5
		duration = 1.3
	}
	{
		text = "(YOU)  I think it's awesome."
		time = 31.7
		duration = 1.3
	}
	{
		text = "(Rodney Mullen)  Excellent.  Vanessa, Daewon, and I are going to split up and do some recon."
		time = 33.0
		duration = 4.0
	}
	{
		text = "(Rodney Mullen)  You and Daewon start here.  Vanessa and I will catch up with you later."
		time = 37.0
		duration = 3.7
	}
]
c_r3_monuments_outro_subtitles = [
	{
		text = "(Daewon Song)  I love doing this stuff.  Skateboarding's given me a lot.  It's good to give something back."
		time = 0.5
		duration = 4.9
	}
	{
		text = "(YOU)  I didn't really think about it that way.  That's cool, man."
		time = 5.5
		duration = 3.2
	}
	{
		text = "(Daewon Song)  Exactly.  Hey, Vanessa's waiting for you in Baltimore.  She's got it all figured out."
		time = 8.5
		duration = 5.0
	}
	{
		text = "(Daewon Song)  I'm meeting up with Rodney.  We'll catch up with you later."
		time = 13.6
		duration = 2.7
	}
	{
		text = "(YOU)  Alright.  Catch you later, Daewon."
		time = 16.3
		duration = 1.9
	}
]
c_r3_harbor_intro_subtitles = [
	{
		text = "(Vanessa Torres)  How did everything go in D.C.?"
		time = 0.5
		duration = 1.7
	}
	{
		text = "(YOU)  It was fun.  We built some crazy stuff."
		time = 2.2
		duration = 2.1
	}
	{
		text = "(Vanessa Torres)  Right on!"
		time = 4.2
		duration = 1.2
	}
	{
		text = "(Vanessa Torres)  I've been all over this town and I've found some insane spots to mess with.  You'll be psyched."
		time = 5.4
		duration = 3.7
	}
	{
		text = "(YOU)  Cool. Then what are we waiting for?"
		time = 9.1
		duration = 1.7
	}
	{
		text = "(Vanessa Torres)  I was waiting for you, sucker.  Come on."
		time = 10.8
		duration = 2.5
	}
]
c_r3_bcity_outro_subtitles = [
	{
		text = "(Vanessa Torres)  That was awesome."
		time = 0.5
		duration = 1.3
	}
	{
		text = "(YOU)  So what's left on that list?"
		time = 1.9
		duration = 1.5
	}
	{
		text = "(Vanessa Torres)  Just a few more spots.  Rodney's waiting for you in Philly.  Go get 'em!"
		time = 3.4
		duration = 4.4
	}
	{
		text = "(YOU)  You got it.  Hey, it's been fun hanging out."
		time = 7.9
		duration = 2.4
	}
	{
		text = "(Vanessa Torres)  You bet.  I'll catch up with you later. "
		time = 10.4
		duration = 2.5
	}
]
c_r3_slums_intro_subtitles = [
	{
		text = "(Rodney Mullen)  Hey, welcome home, buddy."
		time = 0.5
		duration = 1.6
	}
	{
		text = "(YOU)  So, you've been scoping spots for the challenge?"
		time = 2.0
		duration = 2.4
	}
	{
		text = "(Rodney Mullen)  Yeah. I've got a bunch lined up if you're down for it."
		time = 4.4
		duration = 2.6
	}
	{
		text = "(Rodney Mullen)  Not tired are you?"
		time = 7.0
		duration = 1.2
	}
	{
		text = "(YOU)  Hell no!  Let's do this!"
		time = 8.0
		duration = 2.0
	}
]
c_r3_bell_intro_subtitles = [
	{
		text = "(Rodney)  All right.  Here we are."
		time = 0.5
		duration = 1.4
	}
	{
		text = "(YOU)  The Liberty Bell!?  Are you crazy?"
		time = 1.8
		duration = 2.0
	}
	{
		text = "(Rodney Mullen)  What are you talking about?  Skateboarding is all about freedom."
		time = 3.8
		duration = 2.9
	}
	{
		text = "(Rodney Mullen)  Name a better place to express that than right here."
		time = 6.8
		duration = 2.4
	}
	{
		text = "(YOU)  OK, then.  Let's get to it."
		time = 9.3
		duration = 1.9
	}
]
c_r3_bell_outro_subtitles = [
	{
		text = "(Photographer)  Hey guys.  Congrats on the win!"
		time = 1.8
		duration = 2.0
	}
	{
		text = "(Vanessa Torres)  Thanks man.\\n(Rodney Mullen)  Totally.\\n(Daewon Song)  Yeah.  It was fun.\\n(YOU)  Hey, thanks."
		time = 3.9
		duration = 1.6
	}
	{
		text = "(Photographer)  What do you think of all the local rippers skating the spots you made?"
		time = 5.7
		duration = 3.0
	}
	{
		text = "(Vanessa Torres)  I think it's rad!"
		time = 8.7
		duration = 1.1
	}
	{
		text = "(Rodney Mullen)  Yeah, that's why we did it in the first place."
		time = 9.8
		duration = 2.1
	}
	{
		text = "(Photographer)  Alright.  Everybody say cheese."
		time = 12.1
		duration = 1.8
	}
	{
		text = "(Vanessa Torres)  CHEESE!\\n(Rodney Mullen)  CHEESE!\\n(Daewon Song)  CHEESE!\\n(YOU)  CHEESE!"
		time = 13.9
		duration = 1.3
	}
]
c_c3_photo2_intro_subtitles = [
	{
		text = "(YOU) Hey, Mel, did you see that?"
		time = 5.38
		duration = 1.5
	}
	{
		text = "(Mel) No."
		time = 7.2
		duration = 0.86
	}
	{
		text = "(YOU) I just killed that gap."
		time = 8.190001
		duration = 1.54
	}
	{
		text = "(Mel) Yeah?  You land it switch?"
		time = 9.85
		duration = 1.5
	}
	{
		text = "(YOU) Um..no."
		time = 11.63
		duration = 1.3199999
	}
	{
		text = "(Mel) Well, then I guess I didn't miss anything."
		time = 13.0
		duration = 1.92
	}
	{
		text = "(YOU) Ha ha."
		time = 15.05
		duration = 1.4
	}
	{
		text = "(YOU) Hey, that a new SLR?  That's nice."
		time = 16.65
		duration = 2.97
	}
	{
		text = "(Mel) Yeah, it's amazing, might even make you look good."
		time = 19.740002
		duration = 2.6699998
	}
	{
		text = "(YOU) Yeah, but you gotta aim it at something to actually take a picture."
		time = 22.449999
		duration = 3.03
	}
	{
		text = "(YOU) You just missed a prime opportunity."
		time = 25.66
		duration = 1.8
	}
	{
		text = "(Mel) Yeah, right."
		time = 27.53
		duration = 1.05
	}
	{
		text = "(YOU) How about I give you another shot?"
		time = 28.949999
		duration = 1.64
	}
	{
		text = "(Mel) You mean the chance to shoot you skating?"
		time = 30.84
		duration = 2.1899998
	}
	{
		text = "(Mel) What did I do to deserve this?"
		time = 33.05
		duration = 1.9399999
	}
	{
		text = "(YOU) I'm just saying it's a good way to practice with that new camera of yours."
		time = 35.05
		duration = 3.3799999
	}
	{
		text = "(Mel) Fine. I'll follow you to a few spots."
		time = 38.52
		duration = 2.01
	}
	{
		text = "(Mel) Maybe I can get some good pics of you bailing off something famous."
		time = 40.64
		duration = 2.84
	}
	{
		text = "(YOU) Yeah, very funny."
		time = 43.524002
		duration = 1.42
	}
]
c_c3_photosession_intro_subtitles = [
	{
		text = "(Mel) OK, I'm impressed."
		time = 0.8
		duration = 1.6800001
	}
	{
		text = "(Mel) These pictures are sweet!"
		time = 2.55
		duration = 1.4499999
	}
	{
		text = "(Stevie Williams) A-yo! What it look like?  Any good?"
		time = 4.03
		duration = 2.44
	}
	{
		text = "(YOU) Hell yeah, they're good."
		time = 6.55
		duration = 1.22
	}
	{
		text = "(Stevie Williams) Yeah, That's pretty sick."
		time = 7.84
		duration = 1.4599999
	}
	{
		text = "(Mel) STEVIE WILLIAMS! You're Stevie Williams!"
		time = 9.660001
		duration = 2.6599998
	}
	{
		text = "(Stevie Williams) Yeah. I am.  Nice shots."
		time = 12.34
		duration = 2.24
	}
	{
		text = "(Mel) Uh, thanks."
		time = 14.67
		duration = 1.51
	}
	{
		text = "(YOU) Your skating practically put this place on the map!"
		time = 16.230001
		duration = 2.6599998
	}
	{
		text = "(YOU) But don't you live in LA now? "
		time = 18.97
		duration = 1.8299999
	}
	{
		text = "(Stevie Williams) Yeah, dogs."
		time = 20.9
		duration = 1.1
	}
	{
		text = "(Stevie Williams) But I gotta do this thing for a magazine so they flew me back for a couple a days."
		time = 22.1
		duration = 3.56
	}
	{
		text = "(Stevie Williams) Gotta rep for Love. You know."
		time = 25.9
		duration = 1.2800001
	}
	{
		text = "(YOU) It's your park, bro. We'll bounce if you want."
		time = 27.18
		duration = 2.3799999
	}
	{
		text = "(Stevie Williams) Wait. I'm down with local Philly skaters. You seem like the real deal."
		time = 29.630001
		duration = 3.91
	}
	{
		text = "(Stevie Williams) Can I show your pics to my photographer?"
		time = 34.55
		duration = 1.63
	}
	{
		text = "(Stevie Williams) Yo, Bryce come check this out."
		time = 36.6
		duration = 1.8499999
	}
	{
		text = "(Bryce Kanights) Wow. These are some killer shots, my friend.  How long you been shooting?"
		time = 39.67
		duration = 3.73
	}
	{
		text = "(Mel) Um, well..."
		time = 43.649998
		duration = 1.75
	}
	{
		text = "(YOU) My girl just got that camera."
		time = 45.49
		duration = 1.7800001
	}
	{
		text = "(Stevie Williams) Damn, girl! Well, if you don't mind,"
		time = 47.24
		duration = 2.95
	}
	{
		text = "(Stevie Williams) we'd like your friend here to do some more skating."
		time = 50.25
		duration = 2.22
	}
	{
		text = "(YOU) What? With you?"
		time = 52.77
		duration = 1.3299999
	}
	{
		text = "(Stevie Williams) Hell Yeah."
		time = 54.17
		duration = 0.98999995
	}
	{
		text = "(Bryce Kanights) And you should tag along."
		time = 55.23
		duration = 1.23
	}
	{
		text = "(Bryce Kanights) Come see how it's done. You cool with that?"
		time = 56.6
		duration = 1.9399999
	}
	{
		text = "(Mel) Yeah, You kidding?"
		time = 58.54
		duration = 1.13
	}
	{
		text = "(Stevie Williams) OK, let's go my man."
		time = 59.7
		duration = 1.61
	}
]
c_c3_photothemed_intro_subtitles = [
	{
		text = "(Stevie Williams) Yo, I'm sure your girl got some good shots,"
		time = 0.15
		duration = 2.6499999
	}
	{
		text = "(Stevie Williams) but I bet my guy got like 20 banging sequences just now."
		time = 2.98
		duration = 3.09
	}
	{
		text = "(YOU) For Real?"
		time = 6.25
		duration = 0.87
	}
	{
		text = "(Stevie Williams) Yeah, man, for real.  You killed it."
		time = 7.19
		duration = 2.23
	}
	{
		text = "(Stevie Williams) I'm gonna have to pass the key to Love Park on to your narrow ass one day."
		time = 9.59
		duration = 2.87
	}
	{
		text = "(YOU) Nah, Stevie, Love'll always be yours."
		time = 12.64
		duration = 2.54
	}
]
c_c3_epicphoto4_outro_subtitles = [
	{
		text = "(YOU) Awww! That's a good one! I never saw that one. "
		time = 0.61
		duration = 2.1399999
	}
	{
		text = "(Mel) Yeah, Transworld wants that one."
		time = 3.01
		duration = 1.73
	}
	{
		text = "(Mel) Ever since you blew up with Stevie people are acting stupid to get whatever I got of you."
		time = 4.9100003
		duration = 4.2
	}
	{
		text = "(Stevie Williams) Hey, think fast."
		time = 9.469999
		duration = 1.1700001
	}
	{
		text = "(YOU) Stevie!  What the hell is this?"
		time = 11.13
		duration = 2.5
	}
	{
		text = "(Stevie Williams) Look at it."
		time = 14.14
		duration = 0.75
	}
	{
		text = "(Stevie Williams) It's like I promised. I'm giving you the key to Love Park."
		time = 15.28
		duration = 3.0
	}
	{
		text = "(YOU) What.."
		time = 18.61
		duration = 0.72999996
	}
	{
		text = "(Stevie Williams) You earned it, man."
		time = 19.57
		duration = 1.71
	}
	{
		text = "(YOU) Is this... Is this for real?"
		time = 22.54
		duration = 2.1
	}
	{
		text = "(Stevie Williams) You better believe it. I came out to tell you myself."
		time = 24.79
		duration = 3.1699998
	}
	{
		text = "(Stevie Williams) Congratulations. You deserve it."
		time = 28.27
		duration = 1.8399999
	}
	{
		text = "(Mel) Nice."
		time = 30.57
		duration = 0.88
	}
	{
		text = "(YOU) Philly, baby."
		time = 31.56
		duration = 1.3
	}
	{
		text = "(Stevie Williams) Come on, get in this one Mel."
		time = 32.95
		duration = 1.8499999
	}
	{
		text = "(Mel) Ahh, Yeah."
		time = 35.05
		duration = 1.25
	}
]
c_c3_epicphoto_subtitles = [
	{
		text = "(Stevie Williams) Man, you really kill it, kid. No joke."
		time = 0.92999995
		duration = 3.25
	}
	{
		text = "(YOU)  Thanks, Stevie.  That means a lot comin' from you."
		time = 4.42
		duration = 2.51
	}
	{
		text = "(YOU) Us Philly kids really look up to you, man."
		time = 7.02
		duration = 1.8399999
	}
	{
		text = "(Stevie Williams) You don't have to play it on the humble."
		time = 8.94
		duration = 1.47
	}
	{
		text = "(Stevie Williams) I'm just glad we still got kids like you coming out of here. You know what im sayin?"
		time = 10.75
		duration = 3.56
	}
	{
		text = "(Bryce Kanights) Man, I knew I could find you guys here."
		time = 14.71
		duration = 1.8599999
	}
	{
		text = "(Stevie Williams) You know I gotta have my cheesesteaks when I'm in Philly!"
		time = 16.56
		duration = 2.3899999
	}
	{
		text = "(Bryce Kanights) Man, you too were on fire."
		time = 19.56
		duration = 1.38
	}
	{
		text = "(Bryce Kanights) You gotta see all the pulls I got."
		time = 21.01
		duration = 1.6
	}
	{
		text = "(Bryce Kanights) At this rate we could put out the first two-skater issue ever."
		time = 22.89
		duration = 2.86
	}
	{
		text = "(Stevie Williams) I'm down for that."
		time = 25.91
		duration = 0.963
	}
	{
		text = "(YOU) That's never been done before?"
		time = 27.17
		duration = 1.2800001
	}
	{
		text = "(Stevie Williams) Nah, man. This is big time."
		time = 28.514
		duration = 1.88
	}
	{
		text = "(Bryce Kanights) You up for this? I mean, this could end up in a magazine you know."
		time = 30.9
		duration = 3.36
	}
	{
		text = "(YOU) East Coast Baby."
		time = 342.78
		duration = 1.3299999
	}
	{
		text = "(Stevie Williams) Yeah!"
		time = 36.19
		duration = 0.7
	}
]
c_h3_ntb_intro_subtitles = [
	{
		text = "(YOU) Hey man."
		time = 1.13
		duration = 0.693
	}
	{
		text = "(Mad Dog) Grunt"
		time = 1.89
		duration = 0.7
	}
	{
		text = "(YOU) Right. So what's going on back there?"
		time = 2.77
		duration = 3.1799998
	}
	{
		text = "(Mad Dog) Nothing, man. Nothing. Get the hell outta here!"
		time = 5.9500003
		duration = 2.3
	}
	{
		text = "(YOU) Whoa!  Is that Lance Mountain?"
		time = 13.14
		duration = 2.5
	}
	{
		text = "(YOU) Hey, take it easy, man!"
		time = 17.740002
		duration = 1.42
	}
	{
		text = "(Lance) Hey, sorry kid, we're just making sure our pool doesn't get blown out. You know what I mean?"
		time = 19.27
		duration = 3.3799999
	}
	{
		text = "(Mad Dog) Lance, this spot's screwed.  Should we get rid of him?"
		time = 22.69
		duration = 2.73
	}
	{
		text = "(YOU) What?  Wait a minute."
		time = 25.49
		duration = 1.47
	}
	{
		text = "(Lance) Hey, pool skaters only."
		time = 26.98
		duration = 1.3299999
	}
	{
		text = "(Lance) Make it quick Mad Dog."
		time = 28.66
		duration = 1.09
	}
	{
		text = "(YOU) Whoa No! Wait, look, I skate too! See!"
		time = 30.869999
		duration = 2.95
	}
	{
		text = "(Mad Dog) Yeah, whatever kid."
		time = 34.32
		duration = 1.06
	}
	{
		text = "(Lance) You skate? I mean, really skate?"
		time = 35.420002
		duration = 2.1899998
	}
	{
		text = "(YOU) Ummm... yeah.  Sure."
		time = 37.86
		duration = 2.75
	}
	{
		text = "(Lance) Okay.  Let's see what you got."
		time = 40.75
		duration = 1.42
	}
	{
		text = "(Mad Dog) I ain't hit nothing ALL day, so PLEASE screw this up."
		time = 44.21
		duration = 4.64
	}
]
c_h3_ntb_outro_subtitles = [
	{
		text = "(Mad Dog) Listen, punk. You tell anyone about this spot and you're dead."
		time = 1.02
		duration = 3.1499999
	}
	{
		text = "(Mad Dog) Anyone we don't know shows up here? It's gonna be you who told 'em. Get it?"
		time = 4.25
		duration = 5.0
	}
	{
		text = "(YOU) Chill, man.  It's cool.  It's cool."
		time = 9.33
		duration = 2.1899998
	}
	{
		text = "(Lance) You've got to admit, he ripped in there."
		time = 11.87
		duration = 1.8299999
	}
	{
		text = "(Mad Dog) Yeah. He was pretty good. For a punk."
		time = 13.79
		duration = 2.75
	}
	{
		text = "(Lance) Hey, little guy, listen. Quiksilver Bowlriders is going down at FDR this week. Wanna come?"
		time = 16.82
		duration = 5.5
	}
	{
		text = "(YOU) Hell yeah, I'm down."
		time = 22.49
		duration = 1.43
	}
	{
		text = "(Lance) Cool, let's go."
		time = 24.07
		duration = 0.74
	}
]
c_h3_bowlcomp_intro_subtitles = [
	{
		text = "(Lance) Pretty crazy huh?"
		time = 0.97999996
		duration = 1.5
	}
	{
		text = "(YOU) Woah!  It's like a mosh pit."
		time = 2.58
		duration = 1.8
	}
	{
		text = "(Lance) Go on. Get in there."
		time = 4.54
		duration = 1.09
	}
	{
		text = "(YOU) Are you kidding?  I'll get killed in there!"
		time = 5.82
		duration = 1.74
	}
	{
		text = "(Mad Dog) Nah, you just need the proper motivation."
		time = 7.74
		duration = 2.95
	}
]
c_h3_bowlcomp_outro_subtitles = [
	{
		text = "(Announcer) Here to announce the winner, LANCE MOUNTAIN!!!"
		time = 0.09
		duration = 3.8799999
	}
	{
		text = "(Lance) Hey everyone. Lots of crazy rippers out here tonight."
		time = 4.2599998
		duration = 2.54
	}
	{
		text = "(Lance) But out of all of you, the craziest is..."
		time = 7.08
		duration = 1.99
	}
	{
		text = "(Eddie) You don't need to tell these butt faces who's best."
		time = 9.120001
		duration = 3.08
	}
	{
		text = "(Eddie) They're looking at him."
		time = 12.35
		duration = 1.03
	}
	{
		text = "(Eddie) If anyone, any of you posers think they can take this cup from me?"
		time = 13.81
		duration = 3.94
	}
	{
		text = "(Eddie) Bring it, Bring it!"
		time = 18.07
		duration = 1.76
	}
	{
		text = "(Lance) I don't know Eddie. I've seen some new blood out there."
		time = 20.140001
		duration = 2.52
	}
	{
		text = "(Eddie) New blood!  More like, fresh crud."
		time = 22.736002
		duration = 4.2599998
	}
	{
		text = "(Lance) He was killing it in the jam session! He blew everyone away, Eddie."
		time = 26.99
		duration = 2.97
	}
	{
		text = "(Eddie) You think this punk bucket has anything on me! On me! "
		time = 30.08
		duration = 4.46
	}
	{
		text = "(Eddie) Mach 10 lines and bone shakin' grinds!"
		time = 35.309998
		duration = 2.4
	}
	{
		text = "(Eddie) Don't let me see your sorry ass at no bowls you crap cake!"
		time = 37.960003
		duration = 3.04
	}
]
c_h3_wallrides_intro_subtitles = [
	{
		text = "(Lance) The big comps are nice, but you've got to be an all-terrain skater."
		time = 1.15
		duration = 3.05
	}
]
c_h3_secret1_intro_subtitles = [
	{
		text = "(Mad Dog) Well, should we show him or what?"
		time = 0.36
		duration = 1.75
	}
	{
		text = "(Lance) Your call man."
		time = 2.87
		duration = 0.94
	}
	{
		text = "(Mad Dog) What the hell. He's earned it."
		time = 3.48
		duration = 2.06
	}
	{
		text = "(Mad Dog) Hey kid, come here."
		time = 5.74
		duration = 1.65
	}
	{
		text = "(Mad Dog) You feel that? You remember that. Cause if you tell anyone."
		time = 10.469999
		duration = 2.9
	}
	{
		text = "(Mad Dog) Anyone! What we're about to show you.."
		time = 13.52
		duration = 1.57
	}
	{
		text = "(YOU) Let me guess. You'll kill me?"
		time = 15.13
		duration = 2.1499999
	}
	{
		text = "(Lance) Some of the best spots aren't out in the open."
		time = 17.59
		duration = 1.71
	}
	{
		text = "(Lance) There's a whole lot more to skate around here than meets the eye."
		time = 19.449999
		duration = 2.23
	}
	{
		text = "(Mad Dog) And if you want to skate 'em? If you want to earn our respect?"
		time = 21.859999
		duration = 2.79
	}
	{
		text = "(Mad Dog)  If you want to be a true skater? No sell out?"
		time = 24.68
		duration = 2.96
	}
	{
		text = "(Mad Dog) Then you come with us."
		time = 28.240002
		duration = 1.42
	}
	{
		text = "(YOU) All right... Yeah, I'm in. "
		time = 29.94
		duration = 2.1399999
	}
]
c_h3_introtosecretspot2_subtitles = [
	{
		text = "(Lance) Here we are. Going up."
		time = 1.11
		duration = 2.09
	}
	{
		text = "(YOU) Where"
		time = 3.3799999
		duration = 0.69
	}
	{
		text = "(Lance) On the roof.  Let's Go."
		time = 3.48
		duration = 2.06
	}
	{
		text = "(Eddie) Ah, you've got to be kidding me."
		time = 11.7
		duration = 2.41
	}
	{
		text = "(Eddie) I thought I told this kook not to show up at any bowls!"
		time = 14.150001
		duration = 3.41
	}
	{
		text = "(Lance) Calm down man."
		time = 17.630001
		duration = 0.90999997
	}
	{
		text = "(Eddie) You calm down!"
		time = 18.56
		duration = 1.03
	}
	{
		text = "(Mad Dog) No one's hitting the kid but me."
		time = 20.08
		duration = 1.9599999
	}
	{
		text = "(Eddie) Whatever.  Just  get the hell outta my pool."
		time = 22.220001
		duration = 3.36
	}
	{
		text = "(Lance) Your pool? This kid can skate it as good as you."
		time = 25.65
		duration = 2.3899999
	}
	{
		text = "(Eddie) Yeah, right. I'd like to see that."
		time = 28.140001
		duration = 2.76
	}
	{
		text = "(Mad Dog) Alright. Our guy shows you up? You leave."
		time = 31.07
		duration = 4.05
	}
	{
		text = "(Mad Dog) You on this?"
		time = 35.53
		duration = 1.2
	}
	{
		text = "(YOU) On it."
		time = 36.86
		duration = 0.85
	}
]
c_h3_secret2_outro_subtitles = [
	{
		text = "(Mad Dog) Adios"
		time = 2.53
		duration = 1.09
	}
	{
		text = "(Eddie) But...This is my pool."
		time = 3.77
		duration = 2.1899998
	}
	{
		text = "(Lance) Not anymore, Eddie. Hit the bricks"
		time = 6.04
		duration = 2.54
	}
	{
		text = "(YOU) Looks like you need some motivation."
		time = 8.820001
		duration = 2.11
	}
	{
		text = "(Mad Dog) Hey kid, you wanna see something?"
		time = 21.31
		duration = 2.35
	}
	{
		text = "(YOU) Damn! That must have hurt."
		time = 24.48
		duration = 1.8299999
	}
	{
		text = "(Mad Dog) Yeah it did. We all got 'em."
		time = 26.39
		duration = 2.94
	}
	{
		text = "(YOU) We all who?"
		time = 29.7
		duration = 1.3399999
	}
	{
		text = "(Lance) All us pool skaters. Everyone in the crew."
		time = 31.220001
		duration = 1.91
	}
	{
		text = "(YOU) Oh, no way! Hell no!"
		time = 34.19
		duration = 2.49
	}
	{
		text = "(Mad Dog) This is the best day of your life, maggot."
		time = 37.21
		duration = 1.63
	}
	{
		text = "(Mad Dog) You're a man now! You need to remember this day!"
		time = 39.08
		duration = 3.3
	}
	{
		text = "(YOU) You guys don't have to do this. It's ok"
		time = 42.55
		duration = 2.43
	}
	{
		text = "(YOU) Oh, God. You really gonna do this?"
		time = 45.12
		duration = 2.47
	}
	{
		text = "(Mad Dog) Really..."
		time = 48.01
		duration = 1.22
	}
]
c_h2_boneless_intro_subtitles = [
	{
		text = "(YOU) What the?"
		time = 0.85300004
		duration = 0.78999996
	}
	{
		text = "(Dustin Dollin) Weird, right?"
		time = 1.8
		duration = 1.03
	}
	{
		text = "(YOU) Yeah. Why's this all blocked now?"
		time = 3.25
		duration = 1.8599999
	}
	{
		text = "(Dustin Dollin) Crazy Two One? That mean anything?"
		time = 5.4
		duration = 3.03
	}
	{
		text = "(YOU) No. Don't know. Never heard of it."
		time = 8.68
		duration = 2.59
	}
	{
		text = "(YOU) Probably just some stupid kid gang."
		time = 11.46
		duration = 1.8299999
	}
	{
		text = "(Dustin Dollin) Damn. I'm working on a video part.The guys filming me are in the van."
		time = 13.54
		duration = 3.57
	}
	{
		text = "(Dustin Dollin) Think you can find a way in there?"
		time = 17.2
		duration = 1.4
	}
	{
		text = "(YOU) I don't know.  You got any ideas?"
		time = 19.230001
		duration = 1.76
	}
	{
		text = "(YOU) Oh, no way! Hell no!"
		time = 34.19
		duration = 2.49
	}
	{
		text = "(Dustin Dollin) Maybe.  Follow me."
		time = 36.68
		duration = 1.57
	}
]
c_h2_boneless_cutscene_subtitles = [
	{
		text = "(Cam) So you think you can ride up in TWO ONE turf?"
		time = 5.2799997
		duration = 2.1399999
	}
	{
		text = "(YOU) You the guys who been writing their names all over?"
		time = 7.46
		duration = 2.09
	}
	{
		text = "(Cam) Yeah, money! The Crazy Two One, that's Blackjack!"
		time = 9.81
		duration = 3.6499999
	}
	{
		text = "(Cam) You hit it. The TWO ONE!  Man you better recognize!"
		time = 13.469999
		duration = 3.81
	}
	{
		text = "(YOU) Yeah? So what's up? I been skating here since jump. Since day one."
		time = 17.68
		duration = 3.51
	}
	{
		text = "(Cam) Well that's dead now. This is our spot homie.  We run FDR!"
		time = 21.49
		duration = 4.5
	}
	{
		text = "(YOU) Run FDR? It's a public park."
		time = 26.02
		duration = 2.02
	}
	{
		text = "(YOU) Yo! What the hell?"
		time = 28.84
		duration = 1.4
	}
	{
		text = "(Cam) Look, chump! Get out now or get that worse."
		time = 30.51
		duration = 3.61
	}
	{
		text = "(Cam) Like twenty times worse!"
		time = 34.260002
		duration = 1.73
	}
	{
		text = "(YOU) Chill, man. I ain't got no beef with you."
		time = 36.01
		duration = 2.1299999
	}
	{
		text = "(Cam) You up in FDR so you got beef with CAM!"
		time = 38.18
		duration = 2.92
	}
	{
		text = "(Cam) Ha Ha Ha Ha, yeah you better run!"
		time = 45.41
		duration = 2.9
	}
]
c_h2_boneless_outro_subtitles = [
	{
		text = "(Dustin Dollin) What's all that yelling? Did you find...Aw, man! Your nose is bleeding!"
		time = 0.43
		duration = 4.29
	}
	{
		text = "(YOU) I know! I got punched in the face!"
		time = 4.96
		duration = 2.34
	}
	{
		text = "(Dustin Dollin) What? By who?"
		time = 7.3500004
		duration = 1.74
	}
	{
		text = "(Dustin Dollin) The TWO CRAZY ONE'S?"
		time = 9.320001
		duration = 1.4499999
	}
	{
		text = "(YOU) Two? There's like, Twenty of them! And this guy, CAM, sucker punched me! "
		time = 10.87
		duration = 3.55
	}
	{
		text = "(Dustin Dollin) Fot What?"
		time = 14.58
		duration = 0.9
	}
	{
		text = "(YOU) For trying to skate FDR!"
		time = 15.53
		duration = 1.56
	}
	{
		text = "(Dustin Dollin) We'll smash those fools."
		time = 17.11
		duration = 2.27
	}
	{
		text = "(YOU) Are you listening to me? There's twenty of them! At least. You'll get killed!"
		time = 19.5
		duration = 3.45
	}
	{
		text = "(Dustin Dollin) They can't stop me from skating in there.  I came all the way from Oz to skate this place."
		time = 23.130001
		duration = 4.1
	}
	{
		text = "(Dustin Dollin) It's public, skaters built this."
		time = 27.230001
		duration = 2.04
	}
	{
		text = "(YOU) Well they just made it real private."
		time = 29.29
		duration = 1.89
	}
	{
		text = "(YOU) And what are we supposed to do? There's too many of them."
		time = 31.47
		duration = 2.52
	}
]
c_h2_learncheck_intro_subtitles = [
	{
		text = "(Dustin Dollin) They should be around here somewhere.."
		time = 0.75
		duration = 2.03
	}
	{
		text = "(Dustin Dollin) Hey where are you guys?  What?  WHAT?!?"
		time = 3.78
		duration = 3.76
	}
	{
		text = "(Dustin Dollin) That sounds bad man, but don't worry I'll take care of it."
		time = 7.65
		duration = 3.01
	}
	{
		text = "(YOU) What's going on Dustin?"
		time = 10.84
		duration = 1.2
	}
	{
		text = "(Dustin Dollin) How'd you like to do me a quick favor?"
		time = 12.03
		duration = 2.5
	}
]
c_h2_takefdr_outro_subtitles = [
	{
		text = "(Cam) CTO! Get your sorry asses up!"
		time = 4.8
		duration = 2.72
	}
	{
		text = "(Dustin Dollin) A little late to the party."
		time = 7.62
		duration = 2.4
	}
	{
		text = "(Dustin Dollin) Letting your piles take the beat-down, eh?"
		time = 10.120001
		duration = 2.3899999
	}
	{
		text = "(YOU) What were you guys thinking? I mean, this place was built by skaters. For skaters."
		time = 12.63
		duration = 3.78
	}
	{
		text = "(Dustin Dollin) You can't just take it over."
		time = 16.44
		duration = 1.26
	}
	{
		text = "(Cam) Man, this ain't about skateboarding!  It's about turf."
		time = 18.04
		duration = 3.3799999
	}
	{
		text = "(Cam) You skaters think you run this joint? Think again."
		time = 21.92
		duration = 3.41
	}
	{
		text = "(Cam) Just so you know, this ain't over!"
		time = 25.710001
		duration = 2.47
	}
	{
		text = "(Dustin Dollin) Good riddance.  That guy's a joke."
		time = 28.67
		duration = 2.0
	}
	{
		text = "(Dustin Dollin) Let's get back to business."
		time = 32.5
		duration = 1.31
	}
	{
		text = "(Dustin Dollin) I'm gonna head over to Baltimore to round up my crew."
		time = 33.920002
		duration = 2.3
	}
]
c_h2_clearbcity_intro_subtitles = [
	{
		text = "(Dustin Dollin) Hey mate!"
		time = 0.661
		duration = 0.94
	}
	{
		text = "(YOU) You find your crew yet?"
		time = 1.75
		duration = 1.19
	}
	{
		text = "(Dustin Dollin) Yo, what's up? You know Jereme Rogers?"
		time = 3.27
		duration = 2.42
	}
	{
		text = "(YOU) Hey. How's it going?"
		time = 6.02
		duration = 1.02
	}
	{
		text = "(Jereme Rogers) That gang. The Crazy Two One. They're out of control"
		time = 7.23
		duration = 2.47
	}
	{
		text = "(Jereme Rogers) They're running around the city beating up skaters and they're saying it's your friend's fault!"
		time = 9.79
		duration = 3.75
	}
	{
		text = "(Jereme Rogers) What the hell did you guys do?"
		time = 13.7
		duration = 1.49
	}
	{
		text = "(YOU) We kicked those punks out of FDR, that's what."
		time = 15.21
		duration = 2.2
	}
	{
		text = "(Jereme Rogers) Yeah, but now they're running around beating the crap out of everyone."
		time = 17.47
		duration = 2.71
	}
	{
		text = "(Jereme Rogers) You made this mess so you gotta fix it."
		time = 20.2
		duration = 2.05
	}
]
c_h2_clearbcity_outro_subtitles = [
	{
		text = "(Dustin Dollin) Yo!  Brother!"
		time = 0.36200002
		duration = 2.03
	}
	{
		text = "(YOU) Dustin! You find anymore of them?"
		time = 2.43
		duration = 1.58
	}
	{
		text = "(Dustin Dollin) Not a soul. It looks like they're gone."
		time = 4.12
		duration = 2.1599998
	}
	{
		text = "(Jereme Rogers) Hey! Hey!"
		time = 6.4
		duration = 0.71
	}
	{
		text = "(YOU) Jereme! What's going on?"
		time = 7.21
		duration = 1.3599999
	}
	{
		text = "(Jereme Rogers) My boys in DC are saying these gang punks trashed their spot."
		time = 8.75
		duration = 3.09
	}
	{
		text = "(Jereme Rogers) They even sledgehammered the coping."
		time = 11.99
		duration = 1.89
	}
	{
		text = "(Jereme Rogers) Dude, they're calling you out."
		time = 14.04
		duration = 1.49
	}
	{
		text = "(YOU) I thought we got them all."
		time = 15.7
		duration = 1.26
	}
	{
		text = "(Dustin Dollin) So what's it gonna be?"
		time = 17.0
		duration = 1.3
	}
	{
		text = "(YOU) Looks like we're going to DC."
		time = 18.39
		duration = 1.47
	}
	{
		text = "(Dustin Dollin) Right. I never been there anyway."
		time = 19.97
		duration = 2.05
	}
]
c_h2_clearmuseums_outro_subtitles = [
	{
		text = "(Dustin Dollin) Is that it? Did we do it?"
		time = 0.277
		duration = 1.43
	}
	{
		text = "(YOU) I think we did. There's no one left."
		time = 1.8399999
		duration = 1.8399999
	}
	{
		text = "(Dustin Dollin) Hey there homie!  You all set to go?  Great!  We'll be right there!"
		time = 4.5
		duration = 3.8799999
	}
	{
		text = "(YOU) What's up?"
		time = 8.7
		duration = 0.78999996
	}
	{
		text = "(Dustin Dollin) Just working on that video part."
		time = 9.64
		duration = 1.8299999
	}
	{
		text = "(YOU) Back in Philly, right."
		time = 11.59
		duration = 1.19
	}
	{
		text = "(Dustin Dollin) Yeah.  My crew's waiting in FDR, I better get moving!"
		time = 13.1
		duration = 3.07
	}
	{
		text = "(Dustin Dollin) You should come check it out!"
		time = 16.15
		duration = 1.41
	}
]
c_h2_bossbattle_intro_subtitles = [
	{
		text = "(Dustin Dollin) Where the hell are you guys?"
		time = 0.26
		duration = 1.62
	}
	{
		text = "(Dustin Dollin) You better not be slackin' again, especially without me!"
		time = 1.98
		duration = 3.11
	}
	{
		text = "(Dustin Dollin) First they say they're ready, and now they're nowhere.  Crap."
		time = 5.42
		duration = 3.7
	}
	{
		text = "(Cam) Hey, big man."
		time = 11.429999
		duration = 1.2800001
	}
	{
		text = "(YOU) I shoulda known a roach like you wouldn't just go away."
		time = 12.84
		duration = 2.53
	}
	{
		text = "(Cam) I knew you couldn't be happy just doin' your little tricks somewhere else."
		time = 15.74
		duration = 3.27
	}
	{
		text = "(Cam) I knew you'd be back."
		time = 19.31
		duration = 1.42
	}
	{
		text = "(YOU) Of course I'd be back. This is FDR. This is our spot."
		time = 20.82
		duration = 3.53
	}
	{
		text = "(Cam) Punk, You can't stop us."
		time = 24.52
		duration = 2.1299999
	}
	{
		text = "(YOU) You just went bust.  CTO!!!"
		time = 26.730001
		duration = 2.82
	}
]
c_h2_bossbattle_outro_subtitles = [
	{
		text = "(Cam) Man, bump that!"
		time = 7.07
		duration = 1.2800001
	}
	{
		text = "(Dustin Dollin) Screw you mate.  Your gang's a wreck!  The whole thing sucks. Now beat it!"
		time = 8.53
		duration = 3.87
	}
]
c_uber_rigger_igc_subtitles = [
	{
		text = "(Tony) What is the coolest thing for a rig guy like you?"
		time = 0.44
		duration = 2.43
	}
	{
		text = "(YOU) I dunno...skating some insane stuff?"
		time = 3.04
		duration = 2.27
	}
	{
		text = "(Tony) Right!  That's why you're here."
		time = 5.4700003
		duration = 1.87
	}
	{
		text = "(Tony) Someone challenged all the pros out there to"
		time = 7.3500004
		duration = 1.73
	}
	{
		text = "(Tony) create and skate the craziest stuff possible."
		time = 9.09
		duration = 2.54
	}
	{
		text = "(YOU) You mean like Bob's loop?"
		time = 11.98
		duration = 1.43
	}
	{
		text = "(Tony) Ouch.  No.  Listen,"
		time = 13.83
		duration = 1.97
	}
	{
		text = "(Tony) you're the best fab guy out there.  I've rented this whole place for you to setup anything you want."
		time = 15.99
		duration = 4.03
	}
	{
		text = "(Tony) Once you're done we'll make the video."
		time = 20.220001
		duration = 1.52
	}
]
c_uber_rigger_cutscene_subtitles = [
	{
		text = "(Tony) Nice!  This footage is killer!"
		time = 1.8199999
		duration = 2.1499999
	}
	{
		text = "(YOU) Thanks Tony."
		time = 4.09
		duration = 0.86
	}
	{
		text = "(Rodney) How did you build this thing?"
		time = 5.19
		duration = 1.8499999
	}
	{
		text = "(YOU) It was fun.  You ready to give it a go?"
		time = 7.34
		duration = 1.8399999
	}
	{
		text = "(Bam) If he don't I will!"
		time = 9.57
		duration = 1.43
	}
	{
		text = "(Jeff) Man, this thing looks insane!"
		time = 11.05
		duration = 1.51
	}
	{
		text = "(Bam) I saw it first!"
		time = 12.79
		duration = 1.13
	}
	{
		text = "(Tony) Hey guys, wait your turn!"
		time = 14.02
		duration = 1.59
	}
	{
		text = "(Daewon) Me first!"
		time = 15.820001
		duration = 0.89
	}
	{
		text = "(Tony) Looks like it's got a trumbs up.  Good job!"
		time = 16.9
		duration = 2.53
	}
]
c_uber_hardcore_igc_subtitles = [
	{
		text = "(Tony Hawk) Just the guy I've been looking for."
		time = 0.5
		duration = 2.0
	}
	{
		text = "(You) Yeah? What gives?"
		time = 2.5
		duration = 1.0
	}
	{
		text = "(Tony Hawk) Time to see how tough you really are."
		time = 3.5
		duration = 2.2
	}
	{
		text = "(You) Yeah? Well, you caught me on a good day. What you need?"
		time = 5.7
		duration = 2.6
	}
	{
		text = "(Tony Hawk) You aren't gonna believe this, but how'd you like to be in the movies?"
		time = 8.3
		duration = 3.7
	}
	{
		text = "(You) Get outta here."
		time = 12.0
		duration = 1.4
	}
]
c_uber_career_igc_subtitles = [
	{
		text = "(Tony Hawk) You made it.  Great!  Now, get in there!"
		time = 0.5
		duration = 2.1
	}
	{
		text = "(You) Whoa whoa.  What are you talkin' about?"
		time = 2.6
		duration = 2.1
	}
	{
		text = "(Tony Hawk) What do you think I'm talkin' about?  "
		time = 4.7
		duration = 1.6
	}
	{
		text = "(Tony Hawk) The biggest demo of the year!  "
		time = 6.3
		duration = 1.7
	}
	{
		text = "(You) What about the other guys?  "
		time = 8.0
		duration = 1.4
	}
	{
		text = "(Tony Hawk) Dude, you have killed the comps, had sick video parts and you got the cover of the mag!"
		time = 9.4
		duration = 4.3
	}
	{
		text = "(Tony Hawk) You're beyond ready!  Now get in there and show everyone how it's done."
		time = 13.7
		duration = 3.7
	}
]
c_c1_ntt_intro_subtitles = [
	{
		text = "(Spencer) Yo, man!  Check this out!"
		time = 1.3
		duration = 1.7
	}
	{
		text = "(Spencer) *Grunt*"
		time = 5.0
		duration = 3.0
	}
	{
		text = "(Spencer) Ugh! My legs are blown!"
		time = 8.9
		duration = 1.3
	}
	{
		text = "(YOU) Get up, or I'm going over you!"
		time = 10.6
		duration = 3.0
	}
	{
		text = "(Spencer) Screw you... I'm dying over here."
		time = 12.8
		duration = 2.7
	}
	{
		text = "(You) Me too.  But before we take off, I wanna nail this!"
		time = 15.5
		duration = 3.0
	}
	{
		text = "(Arto Saari) Yeah man!  That's what I wanna hear!"
		time = 18.6
		duration = 3.8
	}
	{
		text = "(Spencer) Hey!  Aren't you Arto Saari?!"
		time = 22.4
		duration = 4.3
	}
	{
		text = "(Spencer) Hey, what the hell you doing here?"
		time = 24.8
		duration = 1.9
	}
	{
		text = "(Arto Saari) On tour man, just doing some demos in town."
		time = 26.7
		duration = 2.7
	}
	{
		text = "(Arto Saari) Heard about this spot and wanted to check it out."
		time = 29.4
		duration = 2.8
	}
	{
		text = "(Arto Saari) You guys from around here?"
		time = 32.2
		duration = 1.5
	}
	{
		text = "(Spencer) I've been skating this spot for years..."
		time = 33.8
		duration = 1.8
	}
	{
		text = "(Spencer) Now fresh legs here's tryin' to show me up!"
		time = 35.6
		duration = 2.1
	}
	{
		text = "(You) C'mon Spence.  You still kill it."
		time = 37.7
		duration = 3.6
	}
	{
		text = "(Spencer) That's right!  And I'd smoke you if my knees weren't blown."
		time = 41.3
		duration = 3.0
	}
	{
		text = "(Spencer) You should check this guy out."
		time = 44.3
		duration = 1.5
	}
	{
		text = "(Arto Saari) Yeah?  Alright then.  Let's see what you got."
		time = 45.8
		duration = 3.2
	}
	{
		text = "(Spencer) You do that.  I gotta go collapse now..."
		time = 49.2
		duration = 2.7
	}
]
c_c1_invite_subtitles = [
	{
		text = "(Arto Saari) You ready to hit this demo?"
		time = 0.5
		duration = 1.3
	}
	{
		text = "(You) I'm down for watching you guys."
		time = 1.8
		duration = 1.7
	}
	{
		text = "(Arto Saari) No, man.  I'm saying you should skate IN the demo."
		time = 3.5
		duration = 2.6
	}
	{
		text = "(You) For real?"
		time = 6.1
		duration = 1.0
	}
	{
		text = "(Arto Saari) Defo man!!  I mean, it's not just up to me, but you should come by a little early and skate with the rest of the dudes."
		time = 7.1
		duration = 6.1
	}
	{
		text = "(Arto Saari) If they like you, you're in.  It's over in Baltimore."
		time = 13.2
		duration = 3.1
	}
	{
		text = "(Arto Saari) Just show up... you'll be alright."
		time = 16.3
		duration = 1.8
	}
	{
		text = "(You) I'll be there."
		time = 18.1
		duration = 1.6
	}
]
c_c1_impress_subtitles = [
	{
		text = "(Arto Saari) Alright man.  I told the guys about you, and they're cool with letting you skate with them."
		time = 0.3
		duration = 4.1
	}
	{
		text = "(Arto Saari) But they want to make sure you're the real deal before they throw you into the demo."
		time = 4.4
		duration = 3.8
	}
	{
		text = "(You) Ok.  I can handle this."
		time = 8.2
		duration = 2.1
	}
	{
		text = "(Arto Saari)Just make sure you don't blow it big time in front of my homies."
		time = 10.3
		duration = 2.8
	}
	{
		text = "(You) Great..."
		time = 13.1
		duration = 1.0
	}
]
c_c1_cutscene_2_subtitles = [
	{
		text = "(Arto Saari) Yo!"
		time = 4.6
		duration = 1.0
	}
	{
		text = "(YOU) Oh Hey... what's up?"
		time = 5.2
		duration = 1.5
	}
	{
		text = "(Arto Saari) Have you met Nyjah?"
		time = 6.7
		duration = 1.0
	}
	{
		text = "(Nyjah Huston) I gotta say, you were on your game out there.  Good stuff."
		time = 7.7
		duration = 3.4
	}
	{
		text = "(YOU) Thanks. I'm just glad I didn't mess up too bad in front of everybody."
		time = 11.1
		duration = 3.6
	}
	{
		text = "(Nyjah Huston) There's still plenty of time for that."
		time = 14.7
		duration = 1.6
	}
	{
		text = "(Nyjah Huston) The big show is just starting."
		time = 16.3
		duration = 1.7
	}
	{
		text = "(Announcer) Next up is Nyjah Huston!!!  Give it up, people!"
		time = 18.0
		duration = 3.2
	}
	{
		text = "(Nyjah Huston) See ya later."
		time = 21.3
		duration = 1.1
	}
	{
		text = "(Arto Saari) Hey man, so what do ya think of this circus?"
		time = 22.4
		duration = 2.3
	}
	{
		text = "(You) It's cool... I'm a little nervous though."
		time = 24.7
		duration = 2.3
	}
	{
		text = "(Arto Saari) Listen up, man."
		time = 27.1
		duration = 0.8
	}
	{
		text = "(Arto Saari) Rock this demo, and I might have another project for you."
		time = 27.9
		duration = 6.2
	}
	{
		text = "(You) Oh yeah?  What is it?"
		time = 31.4
		duration = 1.8
	}
	{
		text = "(Arto Saari) Let's just say it's a pretty big deal."
		time = 33.2
		duration = 2.0
	}
	{
		text = "(Arto Saari) Nyjah and I've been working on it for a while now."
		time = 35.2
		duration = 2.1
	}
	{
		text = "(Announcer) Nyjah is killing it!!!"
		time = 37.3
		duration = 1.2
	}
	{
		text = "(You) I gotta follow that!?"
		time = 41.0
		duration = 2.4
	}
	{
		text = "(Arto Saari) Damn right, you do.  Step it up!"
		time = 43.4
		duration = 2.7
	}
]
c_c1_cutscene_3_subtitles = [
	{
		text = "(You) Yeah, baby!!"
		time = 2.0
		duration = 1.3
	}
]
c_c1_Practice1_subtitles = [
	{
		text = "(Arto Saari) Here's the deal."
		time = 0.3
		duration = 1.5
	}
	{
		text = "(Arto Saari) I'm doing a huge new video."
		time = 1.2
		duration = 1.8
	}
	{
		text = "(Arto Saari) I think I want you in it."
		time = 3.0
		duration = 1.3
	}
	{
		text = "(You) We're filming a video? Sweet!"
		time = 4.3
		duration = 2.3
	}
	{
		text = "(Arto Saari) Wait a second.  You're gonna have to take it to the next level."
		time = 6.6
		duration = 2.6
	}
	{
		text = "(Arto Saari) I'm talking flip ins and outs.  Switch madness..."
		time = 9.2
		duration = 3.8
	}
	{
		text = "(Arto Saari) This thing's gonna be around for your grandkids to watch."
		time = 13.0
		duration = 2.5
	}
	{
		text = "(Arto Saari) And I'm not filming anything until you show me you can hack it."
		time = 15.5
		duration = 3.9
	}
	{
		text = "(Arto Saari) You ready?"
		time = 19.4
		duration = 2
	}
]
c_c1_Film1_subtitles = [
	{
		text = "(Arto Saari) So man...yeah.  You ready to kick out the jams?"
		time = 0.3
		duration = 2.8
	}
	{
		text = "(Arto Saari) Everyone else has already filmed their parts."
		time = 3.1
		duration = 2.2
	}
	{
		text = "(Arto Saari) Don't worry, I told 'em yours is gonna be the best one."
		time = 5.3
		duration = 2.7
	}
	{
		text = "(You) You've been hypin' me to your crew?"
		time = 8.0
		duration = 1.6
	}
	{
		text = "(You) Aw, man."
		time = 9.6
		duration = 1.7
	}
	{
		text = "(Nyjah Huston) Let's see if you can live up to it."
		time = 11.3
		duration = 1.6
	}
	{
		text = "(Nyjah Huston) All the guys have been rippin."
		time = 12.9
		duration = 2.4
	}
	{
		text = "(Arto Saari) Yeah, just don't suck."
		time = 15.3
		duration = 2.1
	}
]
c_c1_cutscene_4_subtitles = [
	{
		text = "(Spencer) Wow, man!  That was so cool!"
		time = 3.8
		duration = 2.1
	}
	{
		text = "(Spencer) Dude! You're famous!"
		time = 5.9
		duration = 1.2
	}
	{
		text = "(You) Not to shabby, huh?"
		time = 7.1
		duration = 1.7
	}
	{
		text = "(Nyjah Huston) Hey, my man."
		time = 8.8
		duration = 1.2
	}
	{
		text = "(You) Hey, what's up Nyjah?"
		time = 10.0
		duration = 1.5
	}
	{
		text = "(Nyjah Huston) Hey, your part was tight!"
		time = 11.5
		duration = 1.4
	}
	{
		text = "(You) Thanks, man."
		time = 12.9
		duration = 0.9
	}
	{
		text = "(Arto Saari) What's up, superstar?"
		time = 13.8
		duration = 1.6
	}
	{
		text = "(Both) Arto!"
		time = 15.4
		duration = 1.6
	}
	{
		text = "(Arto Saari) Sup, Spencer?"
		time = 17.0
		duration = 1.1
	}
	{
		text = "(Spencer) Was I right about this kid or what?"
		time = 18.1
		duration = 1.7
	}
	{
		text = "(Arto Saari) Dude, he's got the best part in the video!"
		time = 19.8
		duration = 2.4
	}
	{
		text = "(Spencer) Ha!  That's cause I wasn't in it."
		time = 22.2
		duration = 2.4
	}
	{
		text = "(You) Yeah...right."
		time = 24.6
		duration = 1.7
	}
	{
		text = "(Arto Saari) Seriously, that was an epic job."
		time = 26.3
		duration = 1.7
	}
	{
		text = "(Arto Saari) I'm proud of ya, kiddo."
		time = 28.4
		duration = 3.0
	}
]
c_c2_revman_intro_subtitles = [
	{
		text = "(Eric) Well well well...if it isn't demo boy. "
		time = 0.7
		duration = 3.9
	}
	{
		text = "(You) What's your problem Eric?"
		time = 4.7
		duration = 1.5
	}
	{
		text = "(You) All you do is talk smack."
		time = 6.2
		duration = 1.5
	}
	{
		text = "(Eric) Oh...whatever, kook.  Why don't you run off and entertain the kids down at the shop?"
		time = 7.7
		duration = 4.1
	}
	{
		text = "(Bob Burnquist) Hey! Hey! What's the deal?"
		time = 11.8
		duration = 1.8
	}
	{
		text = "(You) Oh!  You know what it is, Bob...THIS GUY!"
		time = 13.6
		duration = 2.6
	}
	{
		text = "(Bob Burnquist) Come on, Eric.  Why you always gotta be starting trouble?"
		time = 16.2
		duration = 2.4
	}
	{
		text = "(Eric) You know I got no beef with you, Bob.  You can skate."
		time = 18.6
		duration = 2.9
	}
	{
		text = "(Eric) I'm just sick of all these kids on the come-up who spend ten weeks trying to land something for a video part... "
		time = 21.5
		duration = 4.6
	}
	{
		text = "(Eric) But can't represent at contests!"
		time = 26.1
		duration = 1.7
	}
	{
		text = "(Bob Burnquist) But this kid's good though, Eric.  And it's not just me saying it."
		time = 27.8
		duration = 3.2
	}
	{
		text = "(Eric) Please... He wants to embarrass himself?"
		time = 31.0
		duration = 3.4
	}
	{
		text = "(Eric) Then bring his ass to the next Lansdowne contest."
		time = 34.4
		duration = 2.9
	}
	{
		text = "(Eric) Otherwise, don't let me see him."
		time = 37.3
		duration = 2.4
	}
]
c_c2_ntg_intro_subtitles = [
	{
		text = "(You) Whew, I think I got that down."
		time = 0.8
		duration = 2.3
	}
	{
		text = "(You) Man, drilling these tricks into my head...  I feel like I just ran a marathon."
		time = 3.1
		duration = 3.7
	}
	{
		text = "(Bob Burnquist) Good.  Once you get up there to take your run, and your heart starts pumping..."
		time = 6.8
		duration = 3.5
	}
	{
		text = "(Bob Burnquist) It's gonna feel like one."
		time = 10.3
		duration = 1.3
	}
	{
		text = "(You)Right on...  What's next?"
		time = 11.6
		duration = 1.8
	}
	{
		text = "(Bob Burnquist) Well, you can nail footwork all day, but I think it's time we switched it up."
		time = 13.4
		duration = 3.1
	}
]
c_c2_localcomp_intro_subtitles = [
	{
		text = "(Bob Burnquist) Alright, since this is Eric's local park he thinks he has it in the bag."
		time = 0.4
		duration = 4.5
	}
	{
		text = "(You) Well, yeah, all his friends are here."
		time = 4.9
		duration = 2.3
	}
	{
		text = "(Bob Burnquist) They've already seen Eric skate this place a zillion times."
		time = 7.2
		duration = 2.9
	}
	{
		text = "(Bob Burnquist) If you can pull some new lines?  Things they've never seen before?  You've got this."
		time = 10.1
		duration = 3.7
	}
	{
		text = "(Bob Burnquist) That's what you need to do."
		time = 13.8
		duration = 1.3
	}
	{
		text = "(Eric) What he needs to do is go home!"
		time = 15.1
		duration = 1.7
	}
	{
		text = "(Eric) I'm impressed you even showed up... But it's a waste of time."
		time = 16.8
		duration = 3.3
	}
	{
		text = "(Eric) I run this spot, kook.  There's no way I can lose."
		time = 20.1
		duration = 4.2
	}
	{
		text = "(Eric) Like lambs to the slaughter... see ya sucker!"
		time = 24.3
		duration = 3.2
	}
	{
		text = "(You) I don't like this."
		time = 27.5
		duration = 1.7
	}
	{
		text = "(Bob Burnquist) No.  It's OK."
		time = 29.2
		duration = 1.3
	}
	{
		text = "(Bob Burnquist) Just stick to the plan, anything Eric does, you're gonna do it better."
		time = 30.5
		duration = 3.8
	}
]
c_c2_localcomp_outro_subtitles = [
	{
		text = "(Announcer) The judges votes are in. We have a winner... "
		time = 0.01
		duration = 2.6
	}
	{
		text = "(Announcer) The winner of the Lansdowne competition is..."
		time = 2.7
		duration = 2.9
	}
	{
		text = "(Announcer) OUR BOY ERIC!"
		time = 5.6
		duration = 2.2
	}
	{
		text = "(Spencer) What? You gotta be kidding me!"
		time = 7.8
		duration = 2.2
	}
	{
		text = "(Eric) Yes!  Thank you. Thank you. Thank you all, that's right!  "
		time = 10.0
		duration = 4.4
	}
	{
		text = "(Eric) And to the other competitors and invaders, this is MY spot!"
		time = 14.4
		duration = 4.3
	}
	{
		text = "(Eric) This is for me and my boys. The LANSDOWNE posse! "
		time = 18.7
		duration = 3.0
	}
	{
		text = "(Spencer) This is bull!"
		time = 21.7
		duration = 2.3
	}
	{
		text = "(Bob Burnquist) Those guys ripped you off man, you won that."
		time = 24.0
		duration = 2.5
	}
	{
		text = "(Eric) Undisputed!!!"
		time = 28.1
		duration = 1.3
	}
	{
		text = "(You) Whatever."
		time = 30.2
		duration = 1.1
	}
	{
		text = "(Spencer) Screw that!  You won!"
		time = 31.3
		duration = 2.0
	}
	{
		text = "(Eric) What the hell you thinking?!"
		time = 40.2
		duration = 1.5
	}
	{
		text = "(Spencer) This whole thing was rigged!"
		time = 41.7
		duration = 1.4
	}
	{
		text = "(Ryan Sheckler) Yeah man.  That was bogus!"
		time = 43.1
		duration = 1.5
	}
	{
		text = "(Ryan Sheckler) Everyone knows this guy should've won!"
		time = 44.6
		duration = 1.8
	}
	{
		text = "(Eric) Whatever. You're all a bunch of suckers. "
		time = 46.4
		duration = 3.2
	}
	{
		text = "(Bob Burnquist) Really? If we're all suckers, why don't you try skating against him again?"
		time = 49.6
		duration = 3.7
	}
	{
		text = "(Bob Burnquist) Somewhere NOT in your backyard? "
		time = 53.3
		duration = 2.1
	}
	{
		text = "(Eric) Alright. Fine."
		time = 55.4
		duration = 0.8
	}
	{
		text = "(Eric) I'll beat your ass in the Tri City. "
		time = 56.2
		duration = 1.9
	}
	{
		text = "(Eric) You can pay for my window then, kooks"
		time = 58.1
		duration = 2.0
	}
	{
		text = "(Ryan Sheckler) The first comp is in Love.  It's all street, so I'll coach you through it and we'll put that punk in his place."
		time = 61.0
		duration = 5.8
	}
	{
		text = "(Ryan Sheckler) Meet me over there. "
		time = 67.0
		duration = 1.0
	}
]
c_c2_compstreet_intro_subtitles = [
	{
		text = "(Ryan Sheckler) You ready to beat this Eric kid?"
		time = 0.6
		duration = 1.7
	}
	{
		text = "(You) Yeah, man..."
		time = 2.3
		duration = 1.0
	}
	{
		text = "(Ryan Sheckler) Just keep your cool, out skate that jerk, and you've got this."
		time = 3.3
		duration = 3.5
	}
]
c_c2_compvert_intro_subtitles = [
	{
		text = "(Bob Burnquist) You're here... good."
		time = 0.8
		duration = 1.9
	}
	{
		text = "(Bob Burnquist) How'd the street comp go in Philly"
		time = 2.3
		duration = 1.5
	}
	{
		text = "(Eric) He got lucky!"
		time = 3.8
		duration = 1.2
	}
	{
		text = "(You) What he means is that I won."
		time = 5.0
		duration = 2.0
	}
	{
		text = "(Eric) Whatever.  It ain't gonna happen again."
		time = 7.0
		duration = 2.9
	}
	{
		text = "(Eric) I OWN vert.  Ya jerks!"
		time = 9.9
		duration = 2.1
	}
	{
		text = "(Tony Hawk) When did we start letting the trash back in?"
		time = 12.9
		duration = 1.7
	}
	{
		text = "(Bob Burnquist) Hey Tony."
		time = 14.9
		duration = 0.8
	}
	{
		text = "(Bob Burnquist) Don't worry about him, the new guy here is about to destroy him in the comp."
		time = 16.2
		duration = 3.2
	}
	{
		text = "(Tony Hawk) Right on...  Well as much as I hate to say it, that Eric kid goes big."
		time = 19.4
		duration = 4.1
	}
	{
		text = "(You) Yeah?"
		time = 23.5
		duration = 0.9
	}
	{
		text = "(Bob Burnquist) Don't worry about it, man..."
		time = 24.4
		duration = 1.5
	}
	{
		text = "(Bob Burnquist) We're gonna do some doubles runs that'll lock it up!  "
		time = 25.9
		duration = 2.1
	}
	{
		text = "(You) We are?!  Nice!"
		time = 28.0
		duration = 2.0
	}
]
c_c2_comppark_intro_subtitles = [
	{
		text = "(Bob Burnquist) Okay, it's the last event.  You ready?"
		time = 0.2
		duration = 2.8
	}
	{
		text = "(You) Yeah man.  Ready to kill it."
		time = 3.0
		duration = 1.8
	}
	{
		text = "(Eric) Oh...more like you're gonna GET killed.  Hahahaha!  Get it?"
		time = 4.8
		duration = 3.5
	}
	{
		text = "(You) Ah, geez.. Will you just shut up already?."
		time = 8.3
		duration = 3.1
	}
	{
		text = "(Eric) Whatever.  You don't like me spitting the truth, then fine."
		time = 11.4
		duration = 4.3
	}
	{
		text = "(You) Yeah, alright, I suck so bad?  Well then put your money where your mouth is."
		time = 15.7
		duration = 3.4
	}
	{
		text = "(You) WHEN I win today, I get your fancy car."
		time = 19.1
		duration = 3.0
	}
	{
		text = "(Eric) Why would I do that?  You ain't got nothing to put up when you lose! "
		time = 22.1
		duration = 3.4
	}
	{
		text = "(Bob Burnquist) He doesn't, but I do. Your car against mine."
		time = 25.5
		duration = 3.2
	}
	{
		text = "(You) Yo, Bob, you don't have to do this."
		time = 28.7
		duration = 2.8
	}
	{
		text = "(Bob Burnquist) So what's up Eric?"
		time = 31.5
		duration = 0.9
	}
	{
		text = "(Bob Burnquist) You're mouth suddenly out of crap to say?"
		time = 32.4
		duration = 1.8
	}
	{
		text = "(Eric) All right, Burnquist."
		time = 34.2
		duration = 1.7
	}
	{
		text = "(Eric) Just don't whine when I roll out in your whip."
		time = 35.9
		duration = 2.3
	}
	{
		text = "(Bob Burnquist) I'm not worried...he's gonna own you AND your car.  "
		time = 38.2
		duration = 2.8
	}
	{
		text = "(You) Yeah!!! "
		time = 41.0
		duration = 1.5
	}
	{
		text = "(Bob Burnquist) You got this, right?  ...  Right?"
		time = 42.5
		duration = 3.1
	}
]
c_c2_comppark_outro_subtitles = [
	{
		text = "(Announcer) And the Tri-City competition runner up is..."
		time = 0.4
		duration = 3.0
	}
	{
		text = "(Announcer) ERIC!!!"
		time = 3.4
		duration = 1.0
	}
	{
		text = "(Announcer) And that means, we got a new champion!"
		time = 4.4
		duration = 2.3
	}
	{
		text = "(Eric) What?!"
		time = 6.7
		duration = 0.8
	}
	{
		text = "(Bob Burnquist) Yeah!  You won, kid!"
		time = 7.5
		duration = 1.8
	}
	{
		text = "(You) Yesssss!"
		time = 9.3
		duration = 0.7
	}
	{
		text = "(Spencer) Undisputed!  Ha ha!"
		time = 10.0
		duration = 2.4
	}
	{
		text = "(Spencer) Ain't that how it goes?"
		time = 12.4
		duration = 1.4
	}
	{
		text = "(Bob Burnquist) You lost, Eric...Fair and Square"
		time = 13.8
		duration = 2.1
	}
	{
		text = "(Bob Burnquist) Give 'em up."
		time = 15.9
		duration = 0.7
	}
	{
		text = "(Eric) Give up what?  I ain't givin' you nothing!"
		time = 16.6
		duration = 2.5
	}
	{
		text = "(Ryan Sheckler) Hey, man."
		time = 19.1
		duration = 0.4
	}
	{
		text = "(Ryan Sheckler) You said you were playing for cars.  It's time to pay up, sucker!"
		time = 19.5
		duration = 3.0
	}
	{
		text = "(Bob Burnquist) Here you go.  You earned it."
		time = 24.9
		duration = 1.9
	}
	{
		text = "(You) Dude, I wouldn't be caught dead in a car like that."
		time = 26.8
		duration = 2.4
	}
	{
		text = "(You) Here you go Spence."
		time = 29.2
		duration = 1.3
	}
	{
		text = "(Spencer) Really man?!"
		time = 30.5
		duration = 1.2
	}
	{
		text = "(Spencer) Nice!  I've been wantin' to learn to drive stick."
		time = 31.7
		duration = 3.0
	}
	{
		text = "(Eric) Ah, you've gotta be kiddin' me."
		time = 34.7
		duration = 1.9
	}
	{
		text = "(Spencer) Why is there an extra pedal down here?"
		time = 36.6
		duration = 2.1
	}
	{
		text = "(Eric) Ugh! I can't watch."
		time = 38.7
		duration = 2.1
	}
	{
		text = "(Group) *Laugh*"
		time = 40.8
		duration = 2.2
	}
	{
		text = "(Eric) Ahh, this is just not fair!!!"
		time = 43.0
		duration = 2.6
	}
	{
		text = "(Eric) *weeps*"
		time = 45.6
		duration = 2.0
	}
]
c_uber_hardcore_cutscene_subtitles = [
	{
		text = "(Dustin Dollin) Cheers, mate."
		time = 3.3
		duration = 1.0
	}
	{
		text = "(Franklin) I hereby declare..."
		time = 6.2
		duration = 2.4
	}
	{
		text = "(MAD DOG) What is this?  Some kinda joke?"
		time = 8.4
		duration = 2.0
	}
	{
		text = "(Franklin) Franklin-bot ANGRY!"
		time = 10.4
		duration = 2.4
	}
	{
		text = "(Dustin Dollin) Is that supposed to be you?"
		time = 12.8
		duration = 2.0
	}
	{
		text = "(Lincoln) Why, hello young man."
		time = 15.6
		duration = 2.1
	}
	{
		text = "(Lincoln) Oh! My sweet sweet guts."
		time = 17.7
		duration = 3.1
	}
	{
		text = "(Mike V) What the... oh man, are you serious?!"
		time = 20.8
		duration = 2.5
	}
	{
		text = "(Group) *Laugh*"
		time = 27.4
		duration = 4.7
	}
	{
		text = "(You) Hey.  Hey!! Shut Up!"
		time = 32.1
		duration = 0.5
	}
	{
		text = "(You) Seriously guy, whaddya think?"
		time = 32.6
		duration = 2.5
	}
	{
		text = "(Group) *Laugh*"
		time = 35.1
		duration = 2.3
	}
	{
		text = "(Tony Hawk) Hey guys, did I miss anything??"
		time = 39.2
		duration = 41.1
	}
]
c_uber_career_outro_subtitles = [
	{
		text = "(Stevie Williams) When I first saw those shots, I just knew."
		time = 10.8
		duration = 3.0
	}
	{
		text = "(Stevie Williams) I was like...That's a superstar right there."
		time = 13.8
		duration = 2.7
	}
	{
		text = "(Aarto Saari) This kid rips.  His video part's EPIC!"
		time = 19.9
		duration = 2.7
	}
	{
		text = "(Eric) That chump knows he can't hang with THIS!"
		time = 25.1
		duration = 1.9
	}
	{
		text = "(Eric) That's the straight truth!"
		time = 27.0
		duration = 1.1
	}
	{
		text = "(Bob Burnquist) C'mon man.  Respect the kid who steps it up and kills competition."
		time = 28.4
		duration = 4.0
	}
]
