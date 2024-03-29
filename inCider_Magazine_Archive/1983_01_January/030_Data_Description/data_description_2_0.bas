10 ONERR GOTO 2660
20 REM **************
30 REM * TITLE PAGE *
40 REM **************
50 D$ = CHR$ (4):N! = 0
60 DIM NAME$ (20),A(225.20).CT(225)VL(225)
70 TEXT : HOME : FOR I = 1 TO 20: PRINT "*=":: NEXT I: PRINT
80 PRINT "D A T A   D E S C R I P T I 0 N  2 . 0": PRINT : FOR I = 1 TO 20: PRINT "*=":: NEXT I
90 VTAB 23: INVERSE : PRINT "* (C) STEVEN A. SCHWARTZ. PH.D. 1982 *: NORMAL
100 FOR I = 1 TO 3000: NEXT I: HOME
110 VTAB 1: HTAB 1: CALL  - 958: PRINT "ENTER TITLE (2 LINES MAXIMUM):": PRINT : INPUT ":TITLE$
120 IF LEN (TITLE$) > 80 THEN 110
130 VTAB 6: HTAB 1: CALL - 958: INPUT "DATE  (E.G.. 03/04/82): ":DT$: IF LEN (DT$) < > 8 THEN 130
140 VTAB 8: HTAB 1: CALL - 868: PRINT "ENTER DATA FROM DISK (Y/N)? ":: GET Z$: PRINT Z$: IF Z$ < > "Y" AND Z$ < > "N" THEN 140
150 IF Z$ = "Y" THEN 1630
160 REM **********************************
170 REM * SET NO. OF VARIABLES AND CASES *
lBO REM **********************************
190 PRINT : INPUT "ENTER NUMBER OF VARIABLES: ":NVAR
200 IF NVAR < 1 THEN INVERSE : PRINT "NO. OF VARIABLES MUST BE AT LEAST 1.': NORMAL : GOTO 210 IF NVAR > 20 THEN INVERSE : PRINT "MAXIMUM NUMBER OF VARIABLES = 20": NORMAL : GOTO 190
220 PRINT : INPUT "ENTER NUMBER OF CASES:    ":CASE
230 IF CASE < = I THEN INVERSE : PRINT "YOU MUST HAVE MORE THAN 1 CASE.": NORMAL : GOTO 220
240 IF CASE > 225 THEN INVERSE : PRINT "MAXIMUM NUMBER OF CASES EXCEEDED (225)": NORMAL : GOTO 220
250 REM *****************************
160 REM * ASSIGN NAMES TO VARIABLES *
270 REM *****************************
280 HOHE : PRINT "VAR. NAMES (RETURN FOR DEFAULT)": PRINT : PRINT
290 FOR I = 1 TO NVAR
300 PRINT TAB( 5)"VAR. ":I: "=":
310 INPUT NAME$(I)
320 IF LEN (NAME$(I)) > 6 THEN INVERSE : PRINT "MAX. IS 6 CHARACTERS.": NORMAL : GOTO 300
330 IF NAME$(I) = "" THEN NAME$(I) = "VAR." + STR$ (I)
340 NEXT I
350 REM **************
360 REM * DATA INPUT *
370 REM **************
380 FOR I = N1 + 1 TO CASE: HOME : PRINT CHR$ (7):
390 PRINT "DATA FOR SUBJECT ":I
400 FOR J = 1 TO NVAR
410 VTAB 4: HTAB I: CALL - 958
420 PRINT NAME$(J):" = ":
430 INPUT A(I,J)
440 NEXT J
450 NEXT I
460 VTAB 11: HTAB 6: CALL - 958 : INVERSE : PRINT "EDIT/REVIEW THE DATA (Y/N))? ":: NORMAL : GET Z$: PRINT Z$: IF Z$ < > "Y" AND Z$ < > "N" THEN 460
470 IF Z$ = "Y" THEN GOSUB 2030
480 REM ************
490 REM * ANALYSES *
500 REM ************
510 FOR J = I TO NVAR
520 PR# 0: HOME : HTAB 9: FLASH : PRINT CHR$ (7): CHR$ (7))"PERFORMING CALCULATIONS": NORMAL
530 SUM = 0:M2 = 0:M3 = 0:M4 = 0
540 FOR I = 1 TO CASE
550 SUM = SUM + A(I,J):M2 = M2 + A(I,J) ^ 2:M3 = M3 + A(I,J) ^ 3:M4 = M4 + A(I,J) ^ 4
560 NEXT I
570 MEAN = SUM / CASE
580 MAX =A(I,J)
590 Z = 1
600 FOR I = 2 TO CASE
610 IF A(I,J) < =MAX THEN 640
620 Z = I
630 MAX = A(Z,J)
640 NEXT I
650 MN = A(I,J)
660 Z = 1
670 FOR I = 2 TO CASE
680 IF A(I,J) > = MN THEN 710
690 Z = 1
700 MN = A(Z,J)
710 NEXT I
720 RANGE = MAX - MN
J30 SS = 0
740 FOR I = 1 TO CASE
750 SS = SS + (A(I,J) - MEAN) ^ 2
760 NEXT I
770 S2 = SS / (CASE - 1)
780 SD = SQR (S2)
790 SE = SD / (SQR (CASE)))
800 H = ((M3 - 3 * SUM / CASE * M2 + 3 * (SUM / CASE) ^ 2 * SUM) / CASE) - (SUN / CASE) ^ 3
810 O = ((M2 - CASE * (SUM / CASE) ^ 2) / (CASE - 1)) ^ 1.5:SK = H / O
820 H = ((M4 - 4 * SUM / CASE * M3 + 6 * (SUM / CASE) ^ 2 * M2 - 4 * (SUM / CASE) ^ 3 * SUM) / CASE) + (SUM / CASE) ^ 4
830 O = ((M2 - CASE * SUM (SUM / CASE) ^ 2) / (CASE - 1) ^ 2: KR = H / O - 3
840 REM ******************
850 REM * HISTOGRAM SORT *
860 REM ******************
870 M = CASE
880 M = INT (M /2)
890 IF M = 0 THEN 1060
910 J1 = 1
920 I1 = J1
930 L1 = I1 + M
940 IF A(I1,J)) < A(L1,J) THEN 1000
950 T = A(I1,J)
960 A(I1,J) = A(L1,J)
970 A(L1,J) = T
980 I1 = I1 - M
990 IF I1 > = 1 THEN 930
1000 J1 = J1 + 1
1010 IF J1 > K THEN 880
1020 GOTO 920
1030 REM *******************
1040 REM * FREQUENCY COUNT *
1050 REM *******************
1060 CT(1) = 1:VL(1) = A(I,J):L = 1
1070 FOR I = 2 TO CASE: FOR I1 = 1 TO L
1080 IF A(I,J) = VL(II) THEN CT(II) = CT(II) + 1: GOTO 1110
1090 NEXT II
1100 L = L + 1:CT(L) = 1:VL(L) = A(I,J)
1110 NEXT I
1120 REM **********
1130 REM * OUTPUT *
1140 REM **********
1150 IF J = 1 THEN PR# 0: HOME : FLASH : PRINT CHR$ (7): CHR$ (7):"TURN ON PRINTER AND PRESS (RETURN).....":: NORMAL : GET Z$: PRINT Z$: IF Z$ < > CHR$ (13) THEN 1150
1160 PR# 1: PRINT CHR$ (15) + CHR$ (9) + "132N"
1170 GOSUB 1580
1180 PRINT
1190 PRINT "SUM     = ":SUM:: POKE 36,39: PRINT "VARIANCE    = ":S2
1200 PRINT "MEAN    = ":MEAN:: POKE 36,39: PRINT "STAND. DEV. = ":SD
1210 PRINT "MAXIMUM = ":MAX:: POKE 36,39: PRINT "STAND. ERR. = ":SE
1220 PRINT "MINIMUM = ":MN:: POKE 36,39: PRINT "SKEWNESS    = ":SK
1230 PRINT "RANGE   = ":RANGE:: POKE 36,39: PRINT "KURTOSIS    = ":KR
1240 PRINT : PRINT "NO. OF CASES = ":CASE
1250 PRINT
1260 REM *******************
1270 REM * PRINT HISTOGRAM *
1280 REM *******************
1290 PRINT "VALUE      COUNT     %       CUM. %":: POKE 36,39: PRINT "HISTOGRAM OF FREQUENCIES"
1300 PRINT "-----      -----     -       ------":: POKE 36,39: PRINT "------------------------": PRINT
1310 CPCT = 0
1320 FOR I = 1 TO L
1330 DOT = CT(I): IF CT(I) > 85 THEN DOT = 85
1340 PRINT VL(I):: POKE 36,13: PRINT CT(I):
1350 PCT = CT(I) / CASE:PCT = INT (PCT * 10000 + .5) / 100: IF PCT > = 10 AND PCT < 100 THEN POKE 36,20: GOTO 1390
1360 IF PCT < 1 THEN POKE 36,22: GOTO 1390
1370 IF PCT = 100 THEN POKE 36,19: PRINT "100.00":: GOTO 1410
1380 POKE 36,21
1390 X$ = STR$ (PCT): IF PCT = INT (PCT) THEN X$ = X$ + ".00"
1400 PRINT X$:
1410 CPCT = CPCT + PCT:CPCT = INT (CPCT * 100 + .5) / 100: IF I = L THEN CPCT = 100: POKE 36,29: GOTO 1450
1420 IF CPCT < 1 THEN POKE 36,32: GOTO 1450
1430 IF CPCT < 10 THEN POKE 36,31
1440 IF CPCT > = 10 AND CPCT < > 100 THEN POKE 36,30
1450 X$ = STR$ (CPCT): IF CPCT = INT (CPCT) THEN X$ = X$ + ".00"
1460 PRINT X$:
1470 POKE 36,39: FOR K1 = 1 TO DOT: PRINT "*":: NEXT K1: PRINT " (":CT(I):")"
1490 NEXT I
1490 PRINT : FOR I = 1 TO 132: PRINT "-":: NEXT I: PRINT : PRINT
1500 NEXT J
1510 PRINT CHR$ (12): PR# 0
1520 HOME : PRINT "SAVE DATA TO DISK (Y/N)? ":: SET Z$: PRINT Z$: IF Z$ < > "Y" AND Z$ < > "N" THEN 1520
1530 IF Z$ = "N" THEN END
1540 GOTO 1870
1550 REM ****************
1560 REM * PAGE HEADERS *
1570 REM ****************
1580 FOR I = 1 TO LEN (NAME(J)) + 4: PRINT "*":: NEXT I: POKE 36,131 - LEN (TITLE$): PRINT TITLE$
1590 PRINT "*":NAME$(J): " *":: POKE 36,126 - LEN ( STR$ (J)): PRINT "PAGE ":J
1600 FOR I = 1 TO LEN (NAME(J)) + 4: PRINT "*":: NEXT I: POKE 36,123 : PRINT DT$
1610 RETURN
1620 REM ******************************
1630 REM * DISK READ (PRIOR DATA SET) *
1640 REM ******************************
1650 ONERR GOTO 2460
1660 HOME : INVERSE : PRINT "NAME OF FILE:":: NORMAL : INPUT " " ":F$
1670 VTAB 3: PRINT "PRESS ANY KEY WHEN YOU ARE READY.......":: GET Z$: VTAB 6: HTAB 15: FLASH : PRINT " <<WORKING>>": NORMAL
1690 PRINT D$:"NOMON C,I,O"
1690 PRINT D$:"OPEN":F$
1700 PRINT D$:"READ":F$
1710 INPUT NVAR: INPUT N1
1720 FOR I = 1 TO NVAR: INPUT NAME$(I): NEXT
1730 FOR I = 1 TO N1: FOR J = 1 TO NVAR
1740 INPUT A(I,J)
1750 NEXT J
1760 NEXT I
1770 PRINT D$:"CLOSE"":F$
1780 ONERR GOTO 2660
1790 HOME : PRINT "ENTER ADDITIONAL DATA FROM KEYBOARD?": PRINT "(PRESS Y OR N): ":: GET Z$: PRINT Z$: IF Z$ < > "Y" AND Z$ < > "N" THEN 1790
1800 IF Z$ = "N" THEN CASE = N1: GOTO 460
1810 VTAB 5: HTAB 1: CALL  - 958: INVERSE : PRINT "NUMBER OF ADDITIONAL CASES:":: NORMAL : INPUT " " :N2
1820 CASE = N1 + N2: IF CASE > 225 THEN INVERSE: PRINT "MAXIMUM NUMBER OF CASES EXCEEDED (225)": NORMAL : FOR I = 1 TO 1500: NEXT I: GOTO 1810
1830 GOTO 380
1840 REM *********************
1850 REM * SAVE DATA TO DISK *
1860 REM *********************
1870 ONERR GOTO 2530
1880 HOME
1890 INVERSE : PRINT "NAME OF FILE:":: NORMAL : INPUT " ":F$: IF F$ ="" THEN 1890
1900 VTAB 3: PRINT "PRESS ANY KEY WHEN YOU ARE READY....... ":: SET Z$: VTAB 6: HTAB 15: FLASH : PRINT "<<WORKING>>": NORMAL
1910 PRINT D$:"OPEN":F$
1920 PRINT D$:"DELETE":F$
1930 PRINT D$:"OPEN":F$
1940 PRINT D$:"WRITE":F$
1950 PRINT NVAR: PRINT CASE
1960 FOR I = 1 TO NVAR: PRINT NAME$(I): NEXT
1970 FOR I = 1 TO CASE: FOR J = 1 TO NVAR: PRINT A(1,J): NEXT J: NEXT I
1980 PRINT D$ :"CLOSE":F$
1990 HOME : END
2000 REM ********************
2010 REM * EDIT/REVIEW DATA *
2020 REM ********************
2030 VTAB 14: HTAB 6: CALL  - 958: INVERSE : PRINT "(A)LL OR SELECTED CASES? ":: NORMAL : GET Z$: PRINT Z$: IF Z$ < > "A" AND Z$ < > "S" THEN 2030
2040 IF Z$ = "S" THEN 2270
2050 REM *************
2060 REM * All CASES *
2070 REM *************
2080 FOR I = 1 TO CASE: HOME
2090 INVERSE : PRINT " CASE #":I:" ": NORMAL : PRINT : PRINT
2100 FOR J = 1 TO NVAR
2110 PRINT NAME$(J): TAB( 8)"= ":A(I,J)
2120 IF NVAR > = J + 10 THEN PRINT TAB( 21)NAME$(J + 10): TAB( 28)"= ":A(I,J + 10):GOTO 2140
2130 PRINT
2140 IF J < 10 THEN NEXT J
2150 J = NVAR
2160 VTAB 24: HTAB 1: CALL  - 958: INVERSE : PRINT "  <ESC> TO EDIT: <RETURN> TO CONTINUE  ":: GET Z$: NORMAL : IF Z$ < > CHR$(13) and Z$ < > CHR$ (27) THEN 2160
2170 IF Z$ CHR$ (13) THEN NEXT I
2180 IF I > CASE THEN RETURN
2190 VTAB 23: HTAB 1: CALL  - 958: INVERSE : PRINT "CHANGE DATA FOR VARIABLE # (1-":NVAR:")? ":: NORMAL : INPUT "":V
2100 IF V < 1 OR V > NVAR THEN 2190
2110 VTAB 23: HTAB 1: CALL  - 958: INVERSE : PRINT "PRESENT VALUE FOR CASE #":I:" ":NAME$(V):" = ":A(I,V) : PRINT "CHANGE TO ?':: NORMAL : INPUT "" :A(I,V)
2220 I= I - 1: NEXT I
2231 RETURN
2240 REM ******************
2150 REM * SELECTED CASES *
1260 REM ******************
2170 HOME : INVERSE : PRINT "CASE # TO REVIEW (OR 0 TO END)?":: NORMAL : INPUT " ":C1
2280 IF C1 = 0 THEN RETURN
2290 IF C1 < 1 OR C1 > CASE THEN PRINT : PRINT CHR$ (7) : CHR$ (7) : "** CASE MUST BE BETWEEN 1 AND ":CASE:"***": FOR I = 1 to 1500: NEXT I: GOTO 2270
2300 HOME : INVERSE : PRINT " CASE # ":C1: NORMAL : PRINT : PRINT
2310 FOR J = 1 TO NVAR
2320 PRINT NAME$(J): TAB( 8)"= ":A(C1,J):
2330 IF NVAR > = J + 10 THEN PRINT TAB( 21)NAME$( J + 10): TAB( 28)"= ":A(C1,J + 10): GOTO 2350
2340 PRINT
2350 IF J < 10 THEN NEXT J
2360 J = NVAR
2370 VTAB 24: HTAB 1: CALL  - 958: INVERSE : PRINT " <ESC> TO EDIT: <RETURN> TO CONTINUE ":: GET Z$: NORMAL : IF Z$ < > CHR$(13) AND Z$ < > CHR$ (27) THEN 2370
2380 IF Z$ = CHR$ (13) THEN 2270
2390 VTAB 23: HTAB 1: CALL  - 958: INVERSE : PRINT "CHANGE DATA FOR VARIABLE # (1-":NVAR:")? ":: NORMAL : INPUT "":V
2400 IF V < 1 OR V > NVAR THEN 2390
2410 VTAB 23: HTAB 1: CALL  - 958: INVERSE : PRINT "PRESENT VALUE FOR CASE #": I: " ":NAME$(V):" = ":A(C1,V): PRINT "CHANGE TO?":: NORMAL : INPUT "":A(C1,V)
2420 GOTO 2300
2430 REM ***********************
2440 REM * (1) DISK READ ERROR *
2450 REM ***********************
2460 ERR = PEEK (222)
2470 IF ERR = 5 OR ERR = 6 OR ERR = 11 THEN PRINT D$:"DELETE":F$: HOME : FLASH : PRINT "FILE DOES NOT EXIST. SELECT AGAIN......": NORMAL : PRINT D$ :"CATALOG": FOR Z9 = 1 TO 10000: NEXT Z9: GOTO 1660
2480 IF ERR = 13 THEN HOME : FLASH : PRINT "WRONG FILE TYPE. SELECT AGAIN.........": NORMAL: PRINT D$:"CATALOG": FOR Z9 = 1 TO 10000 : NEXT Z9 : GOTO 1660
2490 GOTO 2660
2500 REM ************************
2510 REM * (1) DISK WRITE ERROR *
2520 REM ************************
2530 ERR = PEEK (222): HOME
2540 IF ERR = 4 THEN FLASH : PRINT "DISK IS WRITE-PROTECTED. INSERT ANOTHER": NORMAL : GOTO 1890
2550 IF ERR = 9 THEN PRINT D$ :"DELETE":F$: FLASH : PRINT "DISK FULL. INSERT ANOTHER AND TRY AGAIN": NORMAL : GOTO 1900
2560 IF ERR = 10 THEN FLASH : PRINT "FILE ALREADY EXISTS AND IS LOCKED......": INPUT " WRITE OVER IT (Y/N)":A$: IF A$ < > "Y" AND A$ < > "N" THEN 2560
2570 IF ERR = 10 THEN 2600
2580 IF ERR = 11 THEN FLASH : PRINT "ILLEGAL FILENAME. SELECT AGAIN.........": NORMAL : PRINT D$:"CATALOG": INPUT "NEW FILE NAME: " :F$: HOME : GOTO 1900
2590 GOTO 2660
2600 IF A$ = "Y" THEN PRINT D$: "UNLOCK":F$ : GOTO 1900
2610 IF A$ = "N" THEN INPUT "NEW FILE NAME (RETURN TO ABORT): ":F$: IF F$ = CHR$ (13)  THEN HOME: END
2620 HOME : GOTO 1900
2630 REM ************************
2640 REM * (3) ALL OTHER ERRORS *
2650 REM ************************
2660 PR# O:ERR = PEEK (222)
2670 IF ERR = 254 THEN PRINT : FLASH : PRINT "ILLEGAL INPUT...PLEASE TRY AGAIN.": NORMAL : RESUME
2680 HOME : PRINT "ERROR #":ERR:" AT LINE ": PEEK (218) + PEEK (219) * 256:".": END
