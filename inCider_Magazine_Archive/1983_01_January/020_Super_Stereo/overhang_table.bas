120 REM *********************************************************
130 REM *                                                       *
140 REM *                   OVERHANG TABLE                      *
150 REM *          PROGRAM TO CALCULATE THE REQUIRED            *
160 REM *          TONEARM OVERHANG AND OFFSET ANGLE            *
170 REM *          FOR MINIMUM DISTORTION                       *
180 REM *                                                       *
190 REM *********************************************************
200 TEXT
210 HOME : VTAB (10)
220 INPUT "START WITH WHAT LENGTH? ";MN
230 HOME
240 R1 = 60.325:R2 = 146.05
250 PRINT : PRINT "-----------------------------------"
260 PRINT "EFFECT.  STRAIGHT  OFFSET    OFFSET"
270 PRINT "LENGTH   UNDRHANG  OVHANG    ANGLE"
280 PRINT " (MM)      (MM)     (MM)     (DEG.)"
290 PRINT "-----------------------------------"
300 FOR L = MN TO MN + 15
310 PROD = R1 * R2:SUM = R1 + R2
320 S1 = R1 ©️ 2:S2 = R2 © 2
330 SO = S1 * S2 / (L * (S1 + S2))
340 OO = - (PROD / L) / (((SUM / 2) © 2 / PROD) + 1)
350 O1 = (SUM / L) /  (((SUM / 2) © 2 / PROD) + 1)
360 OA = 360 * (1 / 6.28) * ( ATN (01 / SQR ( - 01 * 01 + 1)))
370 B = ( INT (10 * SO + .5) / 10)
380 C = INT (10 * OO + .5) / 10
390 D = INT (10 * OA + .5) / 10
400 PRINT TAB( 2);L; TAB( 11);B; TAB( 20);C; TAB( 31);D
410 NEXT L

420 REM PROGRAM LISTING 2. OVERHANG TABLE PROGRAM. THIS PROGRAM WILL CALCULATE UNDERHAND OR OVERHANG FOR ANY TONE ARM SIZE, USING THE EQUATIONS DESCRIBED IN THE TEXT.