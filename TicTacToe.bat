@echo off
cls
mode 1000
set userWins=0
set computerWins=0
set draws=0
call data.bat
title Tic Tac Toe!
goto home

:home
set option=null
set a=1
set b=2
set c=3
set d=4
set e=5
set f=6
set g=7
set h=8
set i=9
cls
echo User wins: %userWins%
echo Computer wins: %computerWins%
echo Draws: %draws%
echo 1= Play
echo 2= Resume game from ID
echo 3= Create ID from game
echo 4= Quit
set /p home= "-->"
if %home%==1 goto play
if %home%==2 goto resume
if %home%==3 goto createID
if %home%==4 exit
goto home

:createID
cls
echo 1 2 3
echo 4 5 6
echo 7 8 9
set /p a= "1: "
set /p b= "2: "
set /p c= "3: "
set /p d= "4: "
set /p e= "5: "
set /p f= "6: "
set /p g= "7: "
set /p h= "8: "
set /p i= "9: "
set /p go= "Whose go (x or o): "
set id=%a%%b%%c%%d%%e%%f%%g%%h%%i%%go%
goto fromID

:resume
cls
set /p id="ID: "
:fromID
SET a=%id:~0,1%
SET b=%id:~1,1%
SET c=%id:~2,1%
SET d=%id:~3,1%
SET e=%id:~4,1%
SET f=%id:~5,1%
SET g=%id:~6,1%
SET h=%id:~7,1%
SET i=%id:~8,1%
SET t=%id:~9,1%
if %t%==d (
set turn=Draw
)
if %t%==p (
set turn=O won
)
if %t%==y (
set turn=X won
)
set show=no
if %t%==x (
set turn=X goes next
set show=yes
)
if %t%==o (
set turn=O goes next
set show=yes
)
if %t%==X (
set turn=X goes next
set show=yes
)
if %t%==O (
set turn=O goes next
set show=yes
)
cls
echo Remember, X is user and O is computer!
echo ID: %id%
set aq=-
set bq=-
set cq=-
set dq=-
set eq=-
set fq=-
set gq=-
set hq=-
set iq=-
if %a% NEQ 1 set aq=%a%
if %b% NEQ 2 set bq=%b%
if %c% NEQ 3 set cq=%c%
if %d% NEQ 4 set dq=%d%
if %e% NEQ 5 set eq=%e%
if %f% NEQ 6 set fq=%f%
if %g% NEQ 7 set gq=%g%
if %h% NEQ 8 set hq=%h%
if %i% NEQ 9 set iq=%i%
echo [     %aq% %bq% %cq%     ]
echo [     %dq% %eq% %fq%     ]
echo [     %gq% %hq% %iq%     ]
echo %turn%
echo C= Copy ID to clipboard (right-click in the ID field to paste + enter)
echo 1= Go back to home
if %show%==yes (
echo 2= Continue game as X
)
set show=no
set resume=null
set /p resume="-->"
if %resume%==1 goto home
if %resume%==c goto copy
if %resume%==C goto copy
if %resume%==2 (
if "%turn%"=="X goes next" goto userGo
if "%turn%"=="O goes next" goto computerGo
)
goto fromID

:copy
( echo %id% )|clip
goto fromID

:play
set /a whoGoes=%RANDOM% * (2 - 0 + 1) / 32768 + 0
if %whoGoes%==2 goto userGo
if %whoGoes%==1 goto computerGo
goto play

:userGo
if %a%==%b% (
if %b%==%c% goto computerWon
)
if %d%==%e% (
if %e%==%f% goto computerWon
)
if %g%==%h% (
if %h%==%i% goto computerWon
)
if %a%==%d% (
if %d%==%g% goto computerWon
)
if %b%==%e% (
if %e%==%h% goto computerWon
)
if %c%==%f% (
if %f%==%i% goto computerWon
)
if %a%==%e% (
if %e%==%i% goto computerWon
)
if %c%==%e% (
if %e%==%g% goto computerWon
)
call :draw
cls
set id=%a%%b%%c%%d%%e%%f%%g%%h%%i%x
echo ID: %a%%b%%c%%d%%e%%f%%g%%h%%i%x
echo You: X
echo Computer: O
echo. 
echo [     %a% %b% %c%     ]
echo [     %d% %e% %f%     ]
echo [     %g% %h% %i%     ]
echo. 
echo Enter your option, or type 'info':
set /p option="-->"
if %option%==info goto fromID
if %option%==1 (
if %a%==1 goto ax
)
if %option%==2 (
if %b%==2 goto bx
)
if %option%==3 (
if %c%==3 goto cx
)
if %option%==4 (
if %d%==4 goto dx
)
if %option%==5 (
if %e%==5 goto ex
)
if %option%==6 (
if %f%==6 goto fx
)
if %option%==7 (
if %g%==7 goto gx
)
if %option%==8 (
if %h%==8 goto hx
)
if %option%==9 (
if %i%==9 goto ix
)
goto userGo
:ax
set a=X
goto computerGo
:bx
set b=X
goto computerGo
:cx
set c=X
goto computerGo
:dx
set d=X
goto computerGo
:ex
set e=X
goto computerGo
:fx
set f=X
goto computerGo
:gx
set g=X
goto computerGo
:hx
set h=X
goto computerGo
:ix
set i=X
goto computerGo

:computerGo
if %a%==%b% (
if %b%==%c% goto userWon
)
if %d%==%e% (
if %e%==%f% goto userWon
)
if %g%==%h% (
if %h%==%i% goto userWon
)
if %a%==%d% (
if %d%==%g% goto userWon
)
if %b%==%e% (
if %e%==%h% goto userWon
)
if %c%==%f% (
if %f%==%i% goto userWon
)
if %a%==%e% (
if %e%==%i% goto userWon
)
if %c%==%e% (
if %e%==%g% goto userWon
)
call :draw
cls
:compute
set opt=rnd
if %a%==%b% (
if %c%==3 set opt=c
)
if %b%==%c% (
if %a%==1 set opt=a
)
if %a%==%c% (
if %b%==2 set opt=f
)
if %d%==%e% (
if %f%==6 set opt=f
)
if %e%==%f% (
if %d%==4 set opt=d
)
if %d%==%f% (
if %e%==5 set opt=e
)
if %g%==%h% (
if %i%==9 set opt=i
)
if %h%==%i% (
if %g%==7 set opt=g
)
if %g%==%i% (
if %h%==8 set opt=h
)
if %a%==%d% (
if %g%==7 set opt=g
)
if %a%==%g% (
if %d%==4 set opt=d
)
if %d%==%g% (
if %a%==1 set opt=a
)
if %b%==%e% (
if %h%==8 set opt=h
)
if %b%==%h% (
if %e%==5 set opt=e
)
if %h%==%e% (
if %b%==2 set opt=b
)
if %c%==%f% (
if %i%==9 set opt=i
)
if %c%==%i% (
if %f%==6 set opt=f
)
if %i%==%f% (
if %c%==3 set opt=c
)
if %a%==%e% (
if %i%==9 set opt=i
)
if %a%==%i% (
if %e%==5 set opt=e
)
if %i%==%e% (
if %a%==1 set opt=a
)
if %c%==%e% (
if %g%==7 set opt=g
)
if %c%==%g% (
if %e%==5 set opt=e
)
if %g%==%e% (
if %c%==3 set opt=c
)
if %opt%==a (
if %a%==1 goto finishCompute
)
if %opt%==b (
if %b%==2 goto finishCompute
)
if %opt%==c (
if %c%==3 goto finishCompute
)
if %opt%==d (
if %d%==4 goto finishCompute
)
if %opt%==e (
if %e%==5 goto finishCompute
)
if %opt%==f (
if %f%==6 goto finishCompute
)
if %opt%==g (
if %g%==7 goto finishCompute
)
if %opt%==h (
if %h%==8 goto finishCompute
)
if %opt%==i (
if %i%==9 goto finishCompute
)
:computel
set /a randomInt=%RANDOM% * (9 - 0 + 1) / 32768 + 0
if %randomInt%==1 (
if %a% NEQ 1 goto compute
set a=O
goto userGo
)
if %randomInt%==2 (
if %b% NEQ 2 goto computel
set b=O
goto userGo
)
if %randomInt%==3 (
if %c% NEQ 3 goto computel
set c=O
goto userGo
)
if %randomInt%==4 (
if %d% NEQ 4 goto computel
set d=O
goto userGo
)
if %randomInt%==5 (
if %e% NEQ 5 goto computel
set e=O
goto userGo
)
if %randomInt%==6 (
if %f% NEQ 6 goto computel
set f=O
goto userGo
)
if %randomInt%==7 (
if %g% NEQ 7 goto computel
set g=O
goto userGo
)
if %randomInt%==8 (
if %h% NEQ 8 goto computel
set h=O
goto userGo
)
if %randomInt%==9 (
if %i% NEQ 9 goto computel
set i=O
goto userGo
)
goto computel
:finishCompute
if %opt%==a (
set a=O
goto userGo
)
if %opt%==b (
set b=O
goto userGo
)
if %opt%==c (
set c=O
goto userGo
)
if %opt%==d (
set d=O
goto userGo
)
if %opt%==e (
set e=O
goto userGo
)
if %opt%==f (
set f=O
goto userGo
)
if %opt%==g (
set g=O
goto userGo
)
if %opt%==h (
set h=O
goto userGo
)
if %opt%==i (
set i=O
goto userGo
)
exit

:computerWon
cls
set id=%a%%b%%c%%d%%e%%f%%g%%h%%i%p
echo ID: %a%%b%%c%%d%%e%%f%%g%%h%%i%p
echo You: X
echo Computer: O
echo. 
set aq=-
set bq=-
set cq=-
set dq=-
set eq=-
set fq=-
set gq=-
set hq=-
set iq=-
if %a% NEQ 1 set aq=%a%
if %b% NEQ 2 set bq=%b%
if %c% NEQ 3 set cq=%c%
if %d% NEQ 4 set dq=%d%
if %e% NEQ 5 set eq=%e%
if %f% NEQ 6 set fq=%f%
if %g% NEQ 7 set gq=%g%
if %h% NEQ 8 set hq=%h%
if %i% NEQ 9 set iq=%i%
echo [     %aq% %bq% %cq%     ]
echo [     %dq% %eq% %fq%     ]
echo [     %gq% %hq% %iq%     ]
echo. 
echo O has won!
set /a computerWins=%computerWins%+1
pause
goto save

:userWon
cls
set id=%a%%b%%c%%d%%e%%f%%g%%h%%i%y
echo ID: %a%%b%%c%%d%%e%%f%%g%%h%%i%y
echo You: X
echo Computer: O
echo. 
set aq=-
set bq=-
set cq=-
set dq=-
set eq=-
set fq=-
set gq=-
set hq=-
set iq=-
if %a% NEQ 1 set aq=%a%
if %b% NEQ 2 set bq=%b%
if %c% NEQ 3 set cq=%c%
if %d% NEQ 4 set dq=%d%
if %e% NEQ 5 set eq=%e%
if %f% NEQ 6 set fq=%f%
if %g% NEQ 7 set gq=%g%
if %h% NEQ 8 set hq=%h%
if %i% NEQ 9 set iq=%i%
echo [     %aq% %bq% %cq%     ]
echo [     %dq% %eq% %fq%     ]
echo [     %gq% %hq% %iq%     ]
echo. 
echo X has won!
set /a userWins=%userWins%+1
pause
goto save

:isDraw
cls
set id=%a%%b%%c%%d%%e%%f%%g%%h%%i%d
echo ID: %a%%b%%c%%d%%e%%f%%g%%h%%i%d
echo You: X
echo Computer: O
echo. 
set aq=-
set bq=-
set cq=-
set dq=-
set eq=-
set fq=-
set gq=-
set hq=-
set iq=-
if %a% NEQ 1 set aq=%a%
if %b% NEQ 2 set bq=%b%
if %c% NEQ 3 set cq=%c%
if %d% NEQ 4 set dq=%d%
if %e% NEQ 5 set eq=%e%
if %f% NEQ 6 set fq=%f%
if %g% NEQ 7 set gq=%g%
if %h% NEQ 8 set hq=%h%
if %i% NEQ 9 set iq=%i%
echo [     %aq% %bq% %cq%     ]
echo [     %dq% %eq% %fq%     ]
echo [     %gq% %hq% %iq%     ]
echo. 
echo Draw!
set /a draws=%draws%+1
pause
goto save

:save
(
echo set userWins=%userWins%
echo set computerWins=%computerWins%
echo set draws=%draws%
)>data.bat
goto fromID

:draw
set drawTest=t
if %a%==1 set drawTest=%drawTest%a
if %b%==2 set drawTest=%drawTest%b
if %c%==3 set drawTest=%drawTest%c
if %d%==4 set drawTest=%drawTest%d
if %e%==5 set drawTest=%drawTest%e
if %f%==6 set drawTest=%drawTest%f
if %g%==7 set drawTest=%drawTest%g
if %h%==8 set drawTest=%drawTest%h
if %i%==9 set drawTest=%drawTest%i
if %drawTest%==t goto isDraw