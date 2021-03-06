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

       01  Candidato1.
           05 Nome             PIC X(30) VALUE SPACES.
           05 Voti           PIC 9     VALUE 0.

       01  Candidato2.
           05 Nome             PIC X(30) VALUE SPACES.
           05 Voti           PIC 9     VALUE 0.

       01  scelta              PIC 9 VALUE 0.
       01  flag                PIC X VALUE "S".
       01  VotiVincitore       PIC 9 VALUE 0.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM Pulisci THRU Pulisci-exit.
           PERFORM Inizio  THRU Inizio-exit.
           PERFORM Elabora THRU Elabora-exit.
           PERFORM Fine    THRU Fine-exit.

       Pulisci.
           INITIALIZE CANDIDATO1
                     CANDIDATO2.
      *     MOVE ZEROES TO Voti OF Candidato1.
      *     MOVE ZEROES TO Voti OF Candidato2.
           MOVE ZEROES TO VotiVincitore.
      *       MOVE SPACES TO Nome OF Candidato1.
      *       MOVE SPACES TO Nome OF Candidato2.
           MOVE SPACES TO flag.
       Pulisci-exit.
           EXIT.

       Inizio.
           DISPLAY ":: Elezioni politiche DuemilaMAI ::".

           DISPLAY "Inserire nome Candidato1: ".
           ACCEPT NOME OF Candidato1.

           DISPLAY "Inserire nome Candidato2: ".
           ACCEPT NOME OF Candidato2.

       Inizio-exit.
           EXIT.

       Elabora.
           PERFORM UNTIL flag = "N" OR "n"
              OR Voti OF Candidato1 = 9
              OR Voti OF Candidato2 = 9
           DISPLAY "Digita (1) per votare " Nome OF Candidato1
                 " o (2) per votare " Nome OF Candidato2 ": "
           ACCEPT   scelta
           DISPLAY "scelta=" scelta

           IF    scelta = 1
            ADD 1 TO Voti OF Candidato1
           ELSE
             IF scelta = 2
            ADD 1 TO Voti OF Candidato2
             END-IF
           END-IF
           DISPLAY "Per aggiungere un altro voto digita 'S'"
           " altrimenti 'N': "
                 ACCEPT flag
           END-PERFORM.
       Elabora-exit.
           EXIT.

       Fine.
           DISPLAY "Il vincitore e': "
           IF Voti OF Candidato1 > Voti OF Candidato2
               DISPLAY "IL VINCITORE E: " NOME OF Candidato1
           ELSE
             if voti of candidato2 > voti of candidato1
               DISPLAY "IL VINCITORE E: " NOME OF CANDIDATO2
             else
               display "nessun vincitore"
             end-if
           END-IF

               STOP RUN.
       Fine-exit.
           EXIT.
