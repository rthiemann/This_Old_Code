10 HOME
20 DIM A3%(4,4,4)
30 FOR I=1 TO 4
40     II = I*100
50     FOR J=1 TO 4
60         JJ=J*10
70         FOR K=1 TO 4
80             A3%(I,J,K)=II+JJ+K
100        NEXT K
110    NEXT J
120 NEXT I
200 HOME
210 INPUT"VIEW WHICH PAGE? (0-4)...";P
220 IF P<0 OR P>4 THEN GOTO 200
230 IF P=0 THEN GOTO 340
240 PRINT
250 FOR I = 1 TO 4
260     FOR J = 1 TO 4
270         PRINT A3%(I,J,P);"  ";
280     NEXT J
290     PRINT
300 NEXT I
310 PRINT
320 INPUT"PRESS <RETURN> TO CONTINUE...";X$
330 GOTO 200
340 END
