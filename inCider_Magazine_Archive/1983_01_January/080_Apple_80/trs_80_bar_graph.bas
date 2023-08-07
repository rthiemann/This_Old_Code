100 CLEAR 200:CLS:I=l:DIM N$(12),H(12):GOSUB 3000
110 PRINT @·0,"This bar graph can represent up to 12 quantities,"
120 PRINT "with values from 1 to 10 for each."
130 PRINT "You can either use the default quantities supplied with this"
140 PRINT "program, or type in your own.  Will you use mine (1) or"
150 PRINT "yours (2)? ";
160 K$=INKEY$:IF K$="" THEN 160
170 IF K$="1" THEN GOSUB 1000:GOTO 500
180 IF K$<>"2" THEN 160
190 CLS:GOSUB 3000
200 PRINT @ 0,"What will the title of your bar graph be";
210 INPUT T$
220 IF LEN(T$)=0 THEN T$="Bar Graph"
230 CLS:GOSUB 3000
240 PRINT@ 0,"Name";I;"(or enter 0 to end) ";
250 INPUT N$(I):IF N$(I)="0" THEN N$(I)="":GOTO 500
260 IF LEN(N$(I))=0 THEN 240
270 PRINT @ 0,"What is the value for ";N$(I);" (1-10) ";
280 INPUT H(I):IF H(I)<0 OR H(I)>10 THEN 270
290 IF LEN(N$(I))>4 THEN N$(I)=LEFT$(N$(I),4)
300 PRINT @ 0,STRING$(63,32)
310 IF I=12 THEN 500 ELSE I=I+1:GOTO 240
500 CLS:GOSUB 3000
510 PRINT @ 96-LEN(T$)/2,T$
520 FOR A=1 TO 12:W=l0*A-4
530 PRINT @ 963+5*(A-1),N$(A);
540 IF H(A)=0 THEN 590
550 FOR Y=1 TO H(A)*3
560 FOR X=W TO W+5
570 SET(X,45-Y)
580 NEXT X,Y
590 NEXT A
600 GOTO 600
1000 FOR I=1 TO 12:READ N$(I),H(I): NEXT I
1010 T$="Average Number of Pupils Absent Each Day"
1020 RETURN
1030 DATA Jan,10,Feb,11,Mar,8,Apr,5,May,2,Jun,2,Jul,0,Aug,0,Sep,1,Oct,2,Nov,5,Dec,9
3000 FOR X=4 TO 123:SET(X,44):NEXT X
3010 FOR Y=10 TO 1 STEP-1:PRINT@ 64*Y+256,11-Y;:NEXT Y
3020 RETURN
