1 REM PROGRAM WITH REMARKS IS 3585 BYTES LONG ($0E01) OR 2816 BYTES WTHOUT REMARKS
2 REM ******* VARIABLE MAP ***********
3 REM A$=GENERIC STRING INPUT
4 REM B$ CONTAINS "BREAK EVEN POINT
5 REM CO$ CONTAINS "CONTRIBUTION MARGIN
6 REM C$ IS ARRAY WITH LABLES FOR INSTRUCTION SECTION
7 REM F$ CONTAINS "FIXED COSTS
8 REM V$ CONTAINS "VARIABLE COSTS
9 REM DB=DAILY BREAK EVEN POINT
10 REM BE=BREAK EVEN POINT (YEAR)
11 REM FC=FIXED COSTS PER DAY
12 REM PS=PROJECT SALES
13 REM TF=TOTAL FIXED COSTS
14 REM TV=TOTAL VARIABLE COST
15 REM THIS IS A PROGRAM TO TEACH ONE ABOUT BREAKEVEN ANALYSIS.
16 HOME
17 HTAB 10: PRINT "BREAK EVEN ANALYSIS"
18 HTAB 18: PRINT "BY"
19 HTAB 11: PRINT "COREY SCHOU, PH.D."
20 HTAB 11: PRINT "RONALD RUBIN, PH.D."
21 VTAB 7: PRINT "THIS PROGRAM DISCUSSES A SIMPLIFIED"
22 PRINT "METHOD OF CALCULATING THE BREAK-EVEN"
23 PRINT "POINT FOR A SMALL RETAIL OPERATION."
24 PRINT "BREAK-EVEN ANALYSIS IS AN EXCELLENT"
25 PRINT "STARTING POINT FOR FINDING OUT WHERE"
26 PRINT "A SMALL BUSINESS IS, AND MORE"
27 PRINT "IMPORTANTLY, WHERE IT CAN GO."
28 PRINT "IT PROVIDES A FINANCIAL PLANNING"
29 PRINT "TAKEOFF POINT FOR SMALL STORES."
30 GOSUB 139: REM ENDS COVER PAGE
31 HOME : HTAB 10: PRINT " WOULD YOU LIKE:"
32 VTAB 3: HTAB 7: PRINT "1. DEMONSTRATION OF TECHNIQUE"
33 HTAB 7: PRINT "2. BREAK-EVEN CALCULATIONS"
34 VTAB 24: HTAB 10: PRINT "TYPE 1 OR 2 ONLY";
35 GET A$: IF A$ = "1" THEN 39
36 IF A$ = "2" THEN 96
37 GOTO 31
38 REM END INDEX
39 HOME : REM BEGIN INSTRUCTION PORTION
40 LET F$ = "FIXED COSTS":V$ = "VARIABLE COSTS":B$ = "BREAK EVEN POINT":
CO$ = "CONTRIBUTION MARGIN"
41 DIM C$(10,2,2)
42 FOR Z = 1 TO 2: FOR X = 1 TO 7: FOR Y = 1 TO 2
43 READ C$(X,Y,Z)
44 NEXT Y,X,Z
45 INVERSE : PRINT "PROJECTED SALES = $51,000"
46 PRINT
47 FOR Z = 1 TO 2
48 INVERSE
49 IF Z = 1 THEN PRINT F$
50 IF Z = 2 THEN PRINT V$
51 NORMAL
52 FOR X = 1 TO 7
53 LET T = LEN (C$(X,1,Z)):T1 = LEN (C$(X,2,Z))
54 PRINT C$(X,1,Z); TAB( 39 - T1 + T2);C$(X,2,Z)
55 NEXT X
56 PRINT
57 NEXT Z
58 GOSUB 139
59 VTAB 20
60 HTAB 1
61 PRINT "               SALES=100.001"
62 PRINT "      VARIABLE COSTS= 60.121";
63 FLASH
64 PRINT "(30665/51000)"
65 VTAB 22
66 NORMAL
67 PRINT CO$;"= 39.88%"
68 VTAB 1: HTAB 20: FLASH: PRINT "51,000": NORMAL
69 VTAB 19: HTAB 34: FLASH : PRINT "30665": NORMAL
70 INVERSE
71 GOSUB 139: VTAB 23: HTAB 1: PRINT "NOW TO CALCULATE THE BREAK-EVEN POINT"
72 NORMAL
73 GOSUB 139
74 HOME
75 LET T = LEN (B$):T1 = LEN (F$):T2 = LEN (CO$)
76 VTAB 10
77 PRINT B$;"=";
78 FOR X = 1 TO 37 - T
79 PRINT "_";
80 NEXT X
81 PRINT "_"
82 VTAB 9: HTAB (39 - T): PRINT F$: VTAB 11: HTAB (39 - T2): PRINT CO$
83 VTAB 1
84 GOSUB 139
85 VTAB 7: HTAB
86 PRINT "WHICH IN OUR CASE IS:"
87 VTAB 9: HTAB (39 - T): PRINT SPC( T): VTAB 11: HTAB (39 - T2): PRINT SPC( T2)
88 PRINT
89 GOSUB 139
90 VTAB 9: HTAB (39 - T): PRINT 8910: VTAB 11: HTAB (39 - T2): PRINT .3988
91 VTAB 13: PRINT "BREAK EVEN POINT (YEAR)= 22342"
92 GOSUB 139
95 REM END INSTRUCTION PORTION
96 HOME : PRINT "NOW FOR YOUR BREAK-EVEN ANALYSIS"
97 REM BEGIN ANALYSIS PORTION
98 PRINT : INPUT "PROJECTED SALES? ";PS
99 INPUT "TOTAL FIXED COSTS? ";TF
100 INPUT "TOTAL VARIABLE COSTS? ";TV
101 LET A4 = 100 - (TV / PS * 100)
102 LET RD = A4: GOSUB 137:A4 = RD
103 FOR X = 1 TO 5: PRINT : NEXT X
104 PRINT "CONTRIBUTION MARGIN=";A4;"%"
105 PRINT "DO YOU WANT TO CHANGE THE CONTRIBUTION"
106 PRINT "MARGIN %"
107 VTAB 24: PRINT "ANSWER YES OR NO PLEASE";: GET A$
108 IF A$ = "N" GOTO 110
109 HOME : INPUT "THE CONTRIBUTION MARGIN %, SHOULD BE: ";A4: GOTO 110
110 HOME :BE = TF / (A4 * .01):RD =BE: GOSUB 137:BE = RD
11l PRINT "BREAK EVEN POINT (YEAR)=";BE
112 LET FC = TF / 254:RD = FC: GOSUB 137:FC = RD
113 PRINT "FIXED COSTS PER DAY=$";FC
ll4 PRINT "DAILY BREAK-EVEN POINT IS ";
115 LET DB = ((TF / 254) / A4) * 100
116 LET RD = DB: GOSUB 137:DB = RD
117 PRINT "$";DB
118 GOSUB 139
119 HOME : PRINT "DO YOU WISH TO DO MORE (YES OR NO)";: GET A$: IF A$= "Y" THEN 96
120 HOME
121 END : REM END OF PROGRAM...SUBROUTINES FOLLOW
122 DATA DEPRECIATION,1800
123 DATA INSURANCE,210
124 DATA RENT,4800
125 DATA INTEREST,840
126 DATA UTILITIES,900
127 DATA LAUNDRY & MAINT.,360
128 DATA TOTAL FIXED COSTS,8910
129 DATA COSTS OF GOODS SOLD,2755
130 DATA WAGES,20005
131 DATA SUPPLIES,4800
132 DATA PAYROLL TAXES,2015
133 DATA ULILITIES,610
134 DATA LAUNDRY & SHOP MAINTAINCE,610
135 DATA TOTAL VARIABLE COST,30665
136 REM ROUNDING ROUTINE
137 LET RD = (( INT (RD * 100 + .5)) I 100): RETURN
138 REM PAUSE FOR KEYPRESS PAGE
139 VTAB 24: HTAB 5: PRINT "PRESS ANY KEY TO CONTINUE";: GET A$: RETURN

