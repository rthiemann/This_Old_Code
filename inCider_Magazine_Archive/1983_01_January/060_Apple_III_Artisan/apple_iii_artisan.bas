10 HOME
1000 ON KBD GOTO 1420
1020 PREFIX$=".D1"
1040 OPEN#1,".GRAFIX''
1060 INVOKE"BGRAF.INV"
1070 PERFORM INITGRAFIX
1100 PCOLOR = 15 
1120 BUFFER = 1
1140 MODE = 2
1160 PERFORM GRAFIXMODE (%MODE, %BUFFER)
1180 PERFORM GRAFIXON
1200 PERFORM PENCOLOR (%PCOLOR)
1220 COLOR%=0
1240 PERFORM FILLCOLOR (%COLOR%)
1260 PERFORM FILLPORT
1280 FLAG=1
1300 Y%=PDL(3)*.74902: X%=PDL(2)*2.19216
1310 GOTO 5700
1420 IF KBD = 67 THEN PERFORM FILLCOLOR (%COLOR%): PERFORM FILLPORT
1425 IF KBD = 71 THEN PERFORM GSAVE."PIC" + STR$(COUNT): COUNT=COUNT+ 1
1430 IF KBD = 69 THEN 1520
1435 IF KBD = 68 THEN 5800
1440 IF KBD = 84 THEN 5000
1445 IF KBD = 80 THEN 5200
1460 ON KBD GOTO 1420
1480 RETURN
1500 REM _________________________
1510 REM
1520 FOR X=1 TO 4:PERFORM RELEASE: NEXT X
1540 CLOSE
1560 HOME:PRINT CHR$(15)
1580 END
5000 REM _________________________
5005 REM
5010 PERFORM PENCOLOR(%0):PERFORM DOTAT(%X%,%Y%): PERFORM PENCOLOR(%PCOLOR)
5020 GET A$
5030 IF A$=CHR$(7) THEN 1460
5040 IF ASC(A$)<32 THEN 5020
5050 PRINT#1;A$;
5060 GOTO 5020
5200 REM _________________________
5202 REM
5203 PERFORM PENCOLOR(%PCOLOR)
5205 IF BUTTON(2) < >0 THEN 1460
5210 Y% =PDL(3)*.74902:X% =PDL(2)* 2.19216
5220 PERFORM LINETO(%X%,%Y%)
5230 GOTO 5205
5600 REM _________________________
5602 REM
5603 PERFORM PENCOLOR(%COLOR)
5605 IF BUTTON(2)< >0 THEN 1460
5610 Y% =PDL(3)*.74902:X% = PDL(2)*2.19216
5660 PERFORM DOTAT(%X%,%Y%)
5670 GOTO 5605
5700 REM _________________________
5705 REM
5710 :
5715 PERFORM MOVETO(%X%,%Y%)
5720 DCOLR% =EXFN% .XYCOLOR
5730 :
5735 PERFORM PENCOLOR(%0):PERFORM DOTAT(%X%,%Y%)
5750 PERFORM PENCOLOR(%15):PERFORM DOTAT(%X%,%Y%)
5770 PERFORM PENCOLOR(%DCOLR%):PERFORM DOTAT(%X%,%Y%)
5780 :
5790 Y%=PDL(3)*.74902:X% =PDL(2)*2.19216
5795 GOTO 5700
