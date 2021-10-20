#SingleInstance, Force
#Persistent
SetWorkingDir,%A_ScriptDir%
CoordMode,Mouse,screen
CoordMode,Pixel,screen
CoordMode, ToolTip

;Settings Reads
IniRead,ReadRunTimes,settings.ini,MainStatistics,FledTimes
IniRead,ReadShinyTimes,settings.ini,MainStatistics,ShinyTimes


;first tab start
Gui, 2: Color, Black
Gui, 2:Font, cwhite
Gui, 2:Add,Tab3, x0 y0 w280 h207, Main|BattleFrontier|Pattern|Statistics|Help|
Gui, 2:+AlwaysOnTop
Gui, 2:Add,Button, x10 y25 w150 h20 gStart, Start
Gui, 2:Add,Button, x10 y50 w150 h20 gGui_1, Unstuck
Gui, 2:Add, Button, x185 y125 w60 h40 gOpenGame , Open PokeOne
Gui, 2:Add,CheckBox, x180 y28 Checked vCheck1 gAlways_On_Top, Keep on top
Gui, 2:Add,CheckBox, x180 y51 cAqua vShinyCheck1 gShinyCheck, Shiny
Gui, 2:Add,CheckBox, x180 y72 vRunAlways1 gRunAlways, Always Flee
Gui, 2:Add,CheckBox, x180 y93 vCloseChat1 gCloseChat, Close Chat
Gui, 2:Add,Text, x10 y78, Press F5 to stop
Gui, 2: Font, underline
Gui, 2:Add,Text, x15 y100, Choose which move to use
Gui, 2: Font, norm
Gui, 2:Color, Black
Gui, 2:Add,Radio, x15 y124 Group vRad1 gRadio_Label, Move 1
Gui, 2:Add,Radio, x85 y124 vRad2 gRadio_Label, Move 2
Gui, 2:Add,Radio, x15 w60 y145 vRad3 gRadio_Label, Move 3
Gui, 2:Add,Radio, x85 w60 y145 vRad4 gRadio_Label, Move 4

Gui, 2:Font, c0xB91717
Gui, 2:Font, underline
Gui, 2:Add,Text, x95 w150 y180, Credits to Benoon

;Second tab starts below
Gui, 2:Tab, 2
Gui, 2:Font, c0xB91717
Gui, 2:Font, underline
Gui, 2:Add,Text, x95 w150 y180, Credits to Benoon
Gui, 2: Font, norm
Gui, 2:Font, cWhite
Gui, 2:Add, Button, x5 y20 w270 h150 gEdit, Under Construction.

;Third tab starts below
Gui, 2:Tab, 3
Gui, 2:Add,Text, x10 y63, 1) Tick Shiny and Always flee in main tab.
Gui, 2:Add,Text, x10 y80, 2) Choose Left:Right or Up:Down movement pattern.
Gui, 2:Add,Text, x10 y95, 3) Start.
Gui, 2:Add,Radio, x15 y140 Group vUpDown gMovement_Label, Up:Down
Gui, 2:Add,Radio, x150 y140 vLeftRight gMovement_Label, Left:Right
Gui, 2:Font, c0xB91717
Gui, 2:Font, underline
Gui, 2:Add,Text, x95 w150 y180, Credits to Benoon
Gui, 2: Font, norm
Gui, 2:Font, cWhite
Gui, 2:Add, Button, x5 y20 w270 h30 gPattern, Start

;Fourth tab starts below
Gui, 2:Tab, 4
Gui, 2:Font, cLime
Gui, 2:Add,Text, x8 y80, ----------------------------------------------------------------------------------
Gui, 2:Font, Bold cBlue
Gui, 2:Add,Text, x15 y100, Times Fled:
Gui, 2:Add,Text, x150 y100, Shinies Found:
Gui, 2: Font, norm cRed
Gui, 2:Add,Text, x85 y100 vReadRunTimes gRun_Counter, %ReadRunTimes%
Gui, 2:Add,Text, x235 y100 w50 vReadShinyTimes gShiny_Counter, %ReadShinyTimes%
Gui, 2:Font, cYellow s20
Gui, 2:Add, Text, x85 y35 w150 visRunning gisBotRunning, Waiting... %isRunning%

;Fifth tab starts below
Gui, 2:Tab, 5
Gui, 2: Font, norm cWhite s8
Gui, 2:Add,Text, x10 y20, Step 1: Set the settings however you like.
Gui, 2:Add,Text, x10 y35, Step 2: Place your character in the farming area.
Gui, 2:Add,Text, x10 y50, Step 3: Click unstuck. A Fight Button should appear.
Gui, 2:Add,Text, x10 y65, Step 4: Click start.
Gui, 2:Add,Text, x10 y80, Step 5: Spam right click untill the fight button disappears.
Gui, 2:Add,Text, x10 y95, Step 6: Do not touch anything. Happy farming.
Gui, 2:Add,Text, x35 y118, If you're still having trouble DM me on discord.
Gui, 2:Add,Text, x30 y144, Donations are very much appriciated on paypal:
Gui, 2:Font, cAqua
Gui, 2:Add,Text, x77 y163, benoony12@gmail.com
Gui, 2:Font, cRed
Gui, 2:Font, underline
Gui, 2:Add, Text, x85 y183, Discord: Benoon#9982
RunCounter = %ReadRunTimes%
ShinyCounter = %ReadShinyTimes%

;End gui modification
Gui, 2:Show, x1300 y180, PokeOne Bot
return


isBotRunning:
if (isRunning == 1)
{
	GuiControl,,isRunning, Running
}
else if (isRunning == 0)
{
	GuiControl,,isRunning, Waiting...
}
return

Shiny_Counter:
if(ShinyWasNotFound==0)
{
	ShinyCounter++
	IniWrite,%ShinyCounter%,settings.ini,MainStatistics,ShinyTimes
	IniRead,ReadShinyTimes,settings.ini,MainStatistics,ShinyTimes
	GuiControl,,ReadShinyTimes,%ReadShinyTimes%
}
return


Run_Counter:
Gui,Submit,NoHide
if(RunWasNotFound==0)
{
	RunCounter++
	IniWrite,%RunCounter%,settings.ini,MainStatistics,FledTimes
	IniRead,ReadRunTimes,settings.ini,MainStatistics,FledTimes
	GuiControl,,ReadRunTimes,%ReadRunTimes%
	
}
return




Edit:
MsgBox, Battlefrontier bot coming soon...
return




Movement_Label:
Gui, 2:Submit, NoHide
if(UpDown == 1)
{
	MovementUpDown:=1
	MovementLeftRight:=0
}
if(LeftRight==1)
{
	MovementUpDown:=0
	MovementLeftRight:=1
}
return

Pattern:
	isRunning = 1
	StopPattern=0
    gosub,isBotRunning
while(StopPattern==0)
{
	if(MovementUpDown==1)
	{
		ImageSearch, Loc_XOutside, Loc_YOutside, 0, 0, A_ScreenWidth, A_ScreenHeight, OutsideBTN.png
		if(ErrorLevel==0)
		{
		send, {Up down}
		sleep, 899
		send, {Up up}
		sleep, 50
		send, {Down down}
		sleep, 899
		send, {Down up}
		}
		else if(ErrorLevel==1)
	{
		gosub, ShinyCheck
		if(ShinyWasNotFound==0) ; ShinyWasFound
		{
		gosub, Shiny_Counter
		SoundPlay,Shiny.mp3
	    MsgBox,Shiny Found!
		return
		}
			if(ShinyWasNotFound==1)
		{
			MouseMove,	1022,1076,9
			MouseMove, 999 ,1042,8
			if(RunAlways1==1)
			{
			gosub,RunAlways
			if(RunWasNotFound==0)
			{
			Rx:=(Loc_XRun)
			Ry:=(Loc_YRun)
			MouseMove,%Rx%, %Ry%, 7
			click, %Rx%, %Ry%
			}
			}
		}
	}

	}
	else if(MovementLeftRight==1)
	{
		send, {Left down}
		sleep, 899
		send, {Left up}
		sleep, 50
		send, {Right down}
		sleep, 899
		send, {Right up}
		MouseMove,	1022,1076,9
		MouseMove, 999 ,1042,8
		gosub, ShinyCheck
		if(ShinyWasNotFound==0) ; ShinyWasFound
		{
		gosub, Shiny_Counter
		SoundPlay,Shiny.mp3
	    MsgBox,Shiny Found!
		return
		}
		else if(ShinyWasNotFound==1)
		{
			if(RunAlways1==1)
			{
			gosub,RunAlways
			if(RunWasNotFound==0)
			{
			Rx:=(Loc_XRun)
			Ry:=(Loc_YRun)
			MouseMove,%Rx%, %Ry%, 7
			click, %Rx%, %Ry%
			}
			}
		}
	}
}
return

;Keep on top Checkbox
Always_On_Top:
Gui, 2: Submit, NoHide
if(Check1==1)
	Gui, +AlwaysOnTop
else if(Check1==0)
	Gui, -AlwaysOnTop
return
;End of keep on top Checkbox



OpenGame:
IfWinNotExist, ahk_exe PokeOne.exe
{
	Run,C:\PokeOne\files\PokeOne
}                                                           ;Open the game BTN
IfWinExist, ahk_exe PokeOne.exe
{
	MsgBox, Already Running
}
return


CloseChat:
Gui,Submit, NoHide
if (CloseChat1==1)
{
	ImageSearch, Loc_XChat, Loc_YChat, 0,0, A_ScreenWidth, A_ScreenHeight, ChatBTN.png
	if(ErrorLevel==0)
	{
		ChatWasNotFound=0 ;ChatFound
		return
	}
	else if(ErrorLevel==1)
	{
		ChatWasNotFound=1 ;Was not found
		return
	}
}
if(CloseChat1==0)
{
	ChatWasNotFound=0
	return
}

ShinyCheck:
Gui,Submit, NoHide
if(ShinyCheck1==1)
{
    ImageSearch, Loc_XShiny, Loc_YShiny, 0,0, A_ScreenWidth, A_ScreenHeight, ShinyBTN.png
	if(ErrorLevel==0)
	{
		ShinyWasNotFound=0 ;Found
		return
    }
	else if(ErrorLevel==1)
	{
		ShinyWasNotFound=1 ;WasntFound
		return
	}
}

RunAlways:
Gui,Submit, NoHide
if(RunAlways1==1)
{
	ImageSearch, Loc_XRun, Loc_YRun, 0,0, A_ScreenWidth, A_ScreenHeight, RunBTN.png
	if(ErrorLevel==0) ;Run Was Found
	{
	RunWasNotFound=0
	gosub,Run_Counter
	return
	}
	else if (ErrorLevel==1) ;WasntFound
	{
		RunWasNotFound=1
		return
	}
}
if(RunAlways1==0)
{
	RunWasNotFound=1
	return
}


Radio_Label:
Gui, 2: Submit, NoHide
if(Rad1==1) ;move1
{
	Move1:=1
	Move2:=0
	Move3:=0
	Move4:=0
}
else if(Rad2==1) ;move2
{
	Move1:=0
	Move2:=1
	Move3:=0
	Move4:=0
}
else if(Rad3==1) ;move3
{
	Move1:=0
	Move2:=0
	Move3:=1
	Move4:=0
}
else if (Rad4==1) ;move4
{
	Move1:=0
	Move2:=0
	Move3:=0
	Move4:=1
}
return

2GuiClose:
ExitApp

Start:
isRunning = 1
gosub,isBotRunning
Stop = 0
while (Stop=0)
{
ImageSearch, Loc_X, Loc_Y, 0,0, A_ScreenWidth, A_ScreenHeight, FightBTN.png
if (ErrorLevel=2)
{
	MsgBox,ErrorLevel = 2`Something is wrong, place all the files in a folder on desktop.
	return
}
else if(ErrorLevel=1) ; did not find fight
{
	ImageSearch, LocAXIgulad, LocYIgulad, 0, 0, A_ScreenWidth,A_ScreenHeight, DuringFightBTN.png ;look for igulad
	if (ErrorLevel=0) ;Found Igulad
	{
		sleep,100
		if(Move1==1)
	{
		MouseMove,846 ,889, 10
		click,846,889
		sleep,9982
		MouseMove,	1022,1076,9
		MouseMove, 999 ,1042,9
	}
		if(Move2==1)
		{
		MouseMove, 1079 ,888, 10
		click, 1079,888
		sleep,9912
		MouseMove,	1022,1076,9
		MouseMove, 999 ,1042,9
		}

		if(Move3==1)
		{
		MouseMove,843,959, 10
		click, 843,959
		sleep,9630
		MouseMove,	1022,1076,9
		MouseMove, 999 ,1042,9
		}
		if(Move4==1)
		{
		MouseMove,1065,959, 10
		click, 1065, 959
		sleep,9413
		MouseMove,	1022,1076,9
		MouseMove, 999 ,1042,9
		}
	}
	else if (ErrorLevel=1) ; did not find igulad AND fight
	{
			ImageSearch, FaintBTNX, FaintBTNY, 0, 0, A_ScreenWidth,A_ScreenHeight, FaintBTN.png
			if(ErrorLevel=0) ;found FaintBTN
			{
				MouseMove,959,341,9
				click, 959,341
				MouseMove,959,401,9
				click, 959,401
				MouseMove,959,466,9
				click, 959,466
				MouseMove,959,522,9                                        ;****************SWITCH POKEMON UPON FAINT*****************
				click, 959,522
				MouseMove,959,582,9
				click, 959,582
				sleep,5000
				MouseMove, 877,882, 9                     ;notice this did not change after nayad
				click,877,882
				MouseMove, 876,991, 9
			}
			else if(ErrorLevel=1) ;Did not find ANYTHING
			{
				Random, RandomMSRC, 77, 125
				Random, RandomLeftWalk, 111,1331
            	Random, RandomRightWalk, 111,1331
				Random, RandomUpWalk, 1,784
				Random, RandomDownWalk, 1,784
				Random, MovementDecidor, 0,4 ;Randoming 1-4 included both
				if(MovementDecidor==1)
				{
				Send {Left down}
				Sleep,%RandomLeftWalk%
				Send,{Left up}
				Send {Right down}
				Sleep,%RandomRightWalk%
				Send,{Right up}
				Send,{Up down}
				Sleep,%RandomUpWalk%
				Send,{Up up}
				Send,{Down down}
				Sleep,%RandomDownWalk%
				Send,{Down up}
				MouseMove,	1022,1076,3
		        MouseMove, 999 ,1042,3
			}
			else if(MovementDecidor==2)
			{
				send {Left down}
				Sleep,%RandomLeftWalk%
				send {Left up}
				send {Up down}
				Sleep,%RandomUpWalk%
				send {Up up}
				send {Right down}
				Sleep,%RandomRightWalk%
				send {Right up}
				send {Down down}
				Sleep,%RandomDownWalk%
				send {Down up}
				MouseMove,	1022,1076,3
		        MouseMove, 999 ,1042,3
			}
			else if(MovementDecidor==3)
			{
				send {Right down}
				Sleep,%RandomRightWalk%
				send {Right up}
				send {Up down}
				Sleep,%RandomUpWalk%
				send {Up up}
				send {Left down}
				Sleep,%RandomLeftWalk%
				send {Left up}
				send {Down down}
				Sleep,%RandomDownWalk%
				send {Down up}
				MouseMove,	1022,1076,3
		        MouseMove, 999 ,1042,3
			}
			else if(MovementDecidor==4)
			{
				send {Right down}
				Sleep,%RandomRightWalk%
				send {Right up}
				send {Down down}
				Sleep,%RandomDownWalk%
				send {Down up}
				send {Left down}
				Sleep,%RandomLeftWalk%
				send {Left up}
				send {Up down}
				Sleep,%RandomUpWalk%
				send {Up up}
				MouseMove,	1022,1076,3
		        MouseMove, 999 ,1042,3
			}
		}
	}
}

else if (ErrorLevel=0) ; found fight
{
	if (ShinyCheck1==1)
	{
		gosub, ShinyCheck
		if(ShinyWasNotFound==1)
		{
		tx:=Loc_X+(posw//2) ;middle x of pic
     	ty:=Loc_Y+(posh//2) ;middle y of pic
     	MouseMove,%tx%, %ty%, 6
    	click, %tx%, %ty%
		}
		else if(ShinyWasNotFound==0) ; ShinyWasFound
		{
		gosub, Shiny_Counter
		SoundPlay,Shiny.mp3
	    MsgBox,Shiny Found!
		return
		}
	}
	if (CloseChat1==1)
	{
		gosub,CloseChat
		if(ChatWasNotFound==0) ;There IS chat on screen
		{
			Cx:=(Loc_XChat)
			Cy:=(Loc_YChat)
			MouseMove, %Cx%, %Cy%, 5
			click, %Cx%, %Cy%
	    }
	}
	
	if(RunAlways1==1)
	{
		gosub,RunAlways
		if(RunWasNotFound==0)
		{
      	Rx:=(Loc_XRun)
    	Ry:=(Loc_YRun)
    	MouseMove,%Rx%, %Ry%, 5
    	click, %Rx%, %Ry%
		}
	}

	else
	{
	tx:=Loc_X+(posw//2) ;middle x of pic
	ty:=Loc_Y+(posh//2) ;middle y of pic
	MouseMove,%tx%, %ty%, 6
	click, %tx%, %ty%
	}
}
} ;end of while

return


GuiContextMenu:
Gui, 1:Destroy
return

Move_Window:
Random,new_x, 0, A_ScreenWidth-posw
Random,new_y,0,A_ScreenHeight-posh
Gui,1:Show,x%New_x% y%new_y%
return

Gui_1()
{
	global
	Gui, 1:Destroy
	Gui, 1:Margin,0,0
	Gui, 1:+AlwaysOnTop -Caption +Owner2
	Gui, 1:Add,Picture,x0 y0 vClip_Picture gMove_Window, FightBTN.PNG
	GuiControlGet, Pos,1:Pos,Clip_Picture
	Gui,1:Show, Autosize
}

F5::
Stop=1
StopPattern=1
isRunning=0
gosub,isBotRunning
return
