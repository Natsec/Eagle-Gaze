#SingleInstance force
;#NoTrayIcon

sec := 1000
min := 60 * sec
target := 20 * min
afk_trigger := min

Loop{
	start := A_TickCount
	chrono := 0
	afk_time := 0
	i := 0
	While(chrono < target){
		Sleep, 10000
		if (A_TimeIdlePhysical > afk_trigger){
			chrono := chrono - afk_trigger
			afk_time := ++i * afk_trigger
		}
		else{
			chrono := A_TickCount - start - afk_time
		}
	}
	MsgBox, Look 20 meters away and wait for the second signal :-)
	SoundPlay, *48
	Sleep, 20000
	SoundPlay, *48
}
