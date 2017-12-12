       IDENTIFICATION DIVISION.
       PROGRAM-ID.  Calcolatrice.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 Num1              PIC 9(3).
       01 Num2              PIC 9(3).
       01 Operatore         PIC X.
       01 Risultato         PIC 9(6).
       PROCEDURE DIVISION.
       DISPLAY "Inserire primo numero: ".
       ACCEPT Num1.
       DISPLAY "Inserire secondo numero: ".
       ACCEPT Num2.
       DISPLAY "Inserire l'operatore: ".
       ACCEPT Operatore.

       IF Operatore="+" THEN
       ADD Num1, Num2 GIVING Risultato.
       IF Operatore="-" THEN
       SUBTRACT Num1 FROM Num2 GIVING Risultato.
       IF Operatore="*" THEN
       MULTIPLY Num1 BY Num2 GIVING Risultato.
       IF Operatore="/" THEN
       DIVIDE Num1 BY Num2 GIVING Risultato.

       DISPLAY "Ilrisultato e': ", Risultato.
       STOP RUN.
