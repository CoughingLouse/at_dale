      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CicloFor.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 Num        PIC 99 VALUE 1.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
         PERFORM 10 TIMES
           DISPLAY "Valore: " Num
           COMPUTE Num = Num + 1
         END-PERFORM.
         STOP RUN.
       END PROGRAM CicloFor.
