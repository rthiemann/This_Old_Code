10 HOME
20 VPOS=5
30 HPOS=1
40 INPUT"What is your name ?",NAME$
50 HOME
60 VPOS=5
70 HPOS=1
80 PRINT"Hi there, ";NAME$
90 PRINT"Do me a favor, ";NAME$
100 PRINT "Would you please press the 'Y' key ?"
110 GET KEY$
120 VPOS=10
130 HPOS=1
140 PRINT"Thanks, ";NAME$
150 IF KEY$<>"Y" AND KEY$"y" THEN 200
160 PRINT"That was really nice of you..."
170 GOTO 300
200 PRINT"But I really wanted the 'Y' key"
210 PRINT"Want to learn the alphabet and"
220 PRINT"come back later."
300 END
