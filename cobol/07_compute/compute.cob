      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. IncrementoDecremento.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 Num            PIC 99 VALUE 1.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
         DISPLAY "Valore iniziale: " Num.
         COMPUTE Num = Num * 10.
         DISPLAY "Valore finale: " Num.

         STOP RUN.
       END PROGRAM IncrementoDecremento.
