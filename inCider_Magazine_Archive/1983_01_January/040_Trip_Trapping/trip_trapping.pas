(*$S+*)
UNIT ENTRIES; INTRINSIC CODE 26;

INTERFACE
  TYPE RIGHT_ONES =· SET OF CHAR;
  FUNCTION GET_CHAR (PROMPT1, PROMPT2:STRING; ACCEPTABLE: RIGHT_ONES): CHAR;
  PROCEDURE GET_ENTRY (LEN: INTEGER; VAR ENTRY: STRING);
  FUNCTION VALUE (ENTRY: STRING): 'REAL;

IMPLEMENTATION

FUNCTION GET_CHAR; (*Parameters and result type declared in INTERFACE*)
VAR CH, ENTRY: CHAR;
BEGIN
  REPEAT
    WRITE (PROMPT1);
    IF PROMPT2 <> '' THEN BEGIN WRITELN; WRITE (PROMPT2); END;
    UNITCLEAR (1);                             (*Clear type-ahead buffer*)
    READ (ENTRY); IF ENTRY = CHR(27) THEN EXIT (PROGRAM); (*If <ESC> entered*)
    IF ENTRY IN ['a'..'z'] THEN ENTRY := CHR (ORD (ENTRY) - 32);
    IF NOT (ENTRY IN ACCEPTABLE) THEN
    BEGIN
      WRITELN; WRITELN; WRITELN;
      WRITELN ('""'',ENTRY,'" is not an acceptable entry.", CHR(7));WRITELN;
      FOR CH:=CHR(33) TO 'Z' DO IF CH IN ACCEPTABLE THEN WRITE ('"',CH,'", ');
      IF ' ' IN ACCEPTABLE THEN WRITE(' and <SPACE> ');
      WRITELN (' are appropriate entries at this point.'); WRITELN;
    END;
  UNTIL ENTRY IN ACCEPTABLE; WRITELN;
  GET_CHAR:=ENTRY;
END;  (*get-char*)

PROCEDURE GET_ENTRY; (*See INTERFACE for parameter declarations*)
VAR I: INTEGER;
    SPACE: CHAR;
BEGIN
  REPEAT
    (* The next two lines draw a blank of length LEN between brackets, put the cursor at the beginning of the blank, and read the entry.*)
    WRITELN; WRITE ('['); FOR I := 1 TO LEN DO WRITE('_'); WRITELN (']');
    WRITE(' ',CHR(31)); READLN (ENTRY); (*CHR(31) is "move cursor up"*)
    IF ENTRY<>'' THEN
    BEGIN
      IF (LENGTH (ENTRY)=1) AND (ENTRY[1]=CHR(27)) THEN EXIT (PROGRAM);
      IF LENGTH (ENTRY) > LEN THEN
      BEGIN
        WRITELN (CHR(7),ENTRY, ' IS ',LENGTH(ENTRY)-LEN,' TOO LONG!');
        WRITELN ('PRESS <SPACE> AND MAKE A SHORTER ENTRY.');
        READ (SPACE); WRITELN;
      END;
    END ELSE ENTRY:='';
  UNTIL LENGTH (ENTRY) <= LEN;
END;         (*get-entry*)

FUNCTION VALUE; (*See INTERFACE for parameter declaration, result type*)
VAR I, COMMA, NUMDIGITS, POINT, POWER, MAGNITUDE: INTEGER;
    STOREENTRY:STRING[10);
    DIGIT: STRING[1]; (*NOT the same as a CHAR, no matter what some books say*)
    NUMBER: PACKED ARRAY [1...10] OF INTEGER;
    LESSTHAN1, EXPONENT, NEGATIVE: BOOLEAN;
    DENOM, TEMP: REAL;

  PROCEDURE SHOW_ERROR;
  BEGIN
    WRITELN (CHR(7),STOREENTRY,' has a magnitude of ' ,MAGNITUDE,', which is outside the acceptable range.');
    WRITELN ('Enter a correct number (with a magnitude between +37 AND -37)');
    GET_ENTRY(10,ENTRY); VALUE:=VALUE(ENTRY); EXIT(VALUE);
  END;-

  PROCEDURE CHECK_LENGTH; (*Avoid value range error with NUMBER array*)
  VAR L: INTEGER;
  BEGIN
    REPEAT
    L:=LENGTH (ENTRY); IF L > 10 THEN
    BEGIN
      WRITELN (CHR(7),'The entry is ' ,L-10,' digits too long.');
      WRITELN ('Make a shorter entry.'); GET_ENTRY(10,ENTRY);
    END;
  UNTIL L<=10;
END;  (*check-length*)

  PROCEDURE CHECK_NUMERALS; (*Check for non-numeric characters*)
  VAR I: INTEGER;
  BEGIN
    FOR I:=1 TO LENGTH (ENTRY) DO
    BEGIN
      IF NOT (ENTRY[I) IN ['0'...'9', '.', '-', '+', ',', 'E'] THEN
    BEGIN
      WRITELN (ENTRY,' contains a non-numeric character, ',ENTRY[I],'.');
      WRITE (CHR(7), 'Please enter a corrected number. ');
      GET_ENTRY(10,ENTRY);  (*Length of ENTRY must be <= NUMBER array*)
      CHECK_NUMERALS; EXIT (CHECK_NUMERALS);
    END; - -
  END;
END;

PROCEDURE GET_EXPONENT;
VAR E, L: INTEGER;
    NUM: STRING[5];
BEGIN
  EXPONENT:=TRUE;E:=POS('E',ENTRY);
  LESSTHAN1:=COPY (ENTRY,E+1,1)='-'; (*Determine if negative exponent*)
  L:=LENGTH(ENTRY); NUM:=COPY(ENTRY,E+1,L-E);
  POWER:=ROUND(ABS(VALUE(NUM))); DELETE (ENTRY,E,L-E+1);
  IF POINT<>O THEN MAGNITUDE:=POINT-1
     ELSE MAGNITUDE:=LENGTH(ENTRY)-1;
  IF LESSTHAN1 THEN MAGNITUDE:=MAGNITUDE-POWER
         ELSE MAGNITUDE:=MAGNITUDE+POWER;
    IF (MAGNITUDE> 37) OR (MAGNITUDE< -37) THEN SHOW_ERROR;;
  END;

BEGIN   (*main value function*)
  IF ENTRY= '' THEN
  BEGIN
    WRITELN (CHR(7),'NO ENTRY WAS MADE!'); VALUE:=O; EXIT (VALUE);
  END;
  CHECK_LENGTH; CHECK_NUMERALS; STOREENTRY:=ENTRY; NEGATIVE:=ENTRY[1]='-';
  POINT-:= POS ('.', ENTRY);
  IF POINT <> 0 THEN DELETE (ENTRY, POINT, 1); (*remove decimal point if there*)
  IF POS('E',ENTRY)<>O THEN GET_EXPONENT ELSE EXPONENT:=FALSE;
  REPEAT -
    COMMA := POS (',', ENTRY);
    IF COMMA <> 0 THEN DELETE (ENTRY, COMMA, 1);
  UNTIL COMMA = 0;
  NUMDIGITS :=LENGTH (ENTRY);
  (*>>>>>> The following 4 lines are the central part of VALUE <<<<<*)
  FOR I := 1 TO NUMDIGITS DO
  BEGIN
    DIGIT := COPY (ENTRY, I, 1); NUMBER[I] := POS (DIGIT, '123456789');
  END;
  TEMP := 0; FOR I := 1 TO NUMDIGITS DO
    TEMP := TEMP + NUMBER[I] * PWROFTEN (NUMDIGITS - I);
  IF POINT <> 0 THEN DENOM := (PWROFTEN (NUMDIGITS- POINT+ 1))
     ELSE DENOM := 1;
  TEMP := TEMP /DENOM; IF NEGATIVE THEN TEMP := -1 * TEMP;
  IF EXPONENT THEN
  BEGIN
    IF LESSTHAN1 THEN
    BEGIN
      WHILE POWER > 38 DO     (*Avoid out of range error*)
      BEGIN
        POWER:=POWER-1; TEMP:=TEMP/10;
      END;
      TEMP:=TEMP/PWROFTEN(POWER) (*Negative exponent*)
    END ELSE TEMP:=TEMP*PWROFTEN(POWER);   (*Positive exponent*)
 END;
 VALUE := TEMP;
END; (*value*)

END. (*This indicates the end of the Unit; no BEGIN is necessary.*)
