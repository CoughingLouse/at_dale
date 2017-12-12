      ******************************************************************
      * Author: RjKO
      * Date: 03/12/2017
      * Purpose: Sbeffeggiare
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. Elezioni.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01  CAND1NOME           PIC X(30) VALUE SPACES.
       01  CAND2NOME           PIC X(30) VALUE SPACES.
       01  CAND1VOTI           PIC 9 VALUE 0.
       01  CAND2VOTI           PIC 9 VALUE 0.

       01  scelta              PIC 9 VALUE 0.
       01  flag                PIC X VALUE "S".
       01  VotiVincitore       PIC 9 VALUE 0.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM Inizio THRU Inizio-exit.
           PERFORM Elabora THRU Elabora-exit.
           PERFORM Fine THRU Fine-exit.


       Inizio.
           DISPLAY ":: Elezioni politiche DuemilaMAI ::".
           DISPLAY "Nome Candidato1: ".
           ACCEPT CAND1NOME.
           DISPLAY "Nome Candidato2: ".
           ACCEPT CAND2NOME.
       Inizio-exit.
           EXIT.

       Elabora.
           PERFORM UNTIL flag = "N"
           OR CAND1VOTI = 9
             OR CAND2VOTI = 9
                 DISPLAY "Votare (1) " CAND1NOME "o (2) " CAND2NOME "? "
                 ACCEPT scelta
                 DISPLAY "[check: scelta = " scelta " ]"

                 IF scelta = 1
                    ADD 1 TO CAND1VOTI
                 ELSE
                   IF scelta = 2 THEN
                      ADD 1 TO CAND2VOTI
                   END-IF
                 END-IF
                 DISPLAY "CONTINUA > 'S', QUIT > 'N': "
                 ACCEPT flag
           END-PERFORM.
       Elabora-exit.
           EXIT.

       Fine.
           DISPLAY "Il vincitore e': " NO ADVANCING.
           IF CAND1VOTI > CAND2VOTI
               DISPLAY CAND1NOME
               ADD CAND1VOTI GIVING VotiVincitore
           ELSE
               DISPLAY CAND2NOME.
               ADD CAND2VOTI GIVING VotiVincitore.
       Fine-exit.
           EXIT.

       STOP RUN.
