      ******************************************************************
      * Author: RjKO
      * Date: 03/12/2017
      * Purpose: Learning
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. Rubrica.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 DettagliStudente.
         05 Corso           PIC 9(5).
         05 Matricola       PIC 9(5).
         05 NomeStudente.
           10 Nome          PIC X(15).
           10 Cognome       PIC X(20).
         05 DataDiNascita.
           10 Giorno        PIC 99.
           10 Mese          PIC 99.
           10 Anno          PIC 9(4).
       01 CurrentDate.
         05 CurrentYear     PIC 9(4).
         05 CurrentMonth    PIC 99.
         05 CurrentDay      PIC 99.
       01 CurrentTime.
         05 CurrentHour     PIC 99.
         05 CurrentMinute   PIC 99.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
         DISPLAY "Inserisci nome: ".
         ACCEPT Nome.
         DISPLAY "Inserisci cognome: ".
         ACCEPT Cognome.
         DISPLAY "Inserisci data di nascita (ggmmaaaa): ".
         ACCEPT DataDiNascita.
         DISPLAY "Inserisci codice corso: ".
         ACCEPT Corso.
         DISPLAY "Inserisci matricola: ".
         ACCEPT Matricola.
         ACCEPT CurrentDate FROM DATE YYYYMMDD.
         ACCEPT CurrentTime FROM TIME.
         DISPLAY "Dati inseriti il: " CurrentDay "/" CurrentMonth
         "/" CurrentYear.
         DISPLAY "Alle " CurrentHour ":" CurrentMinute.
         DISPLAY "Nome: " Nome " " Cognome.
         DISPLAY "Nato il: " Giorno "/" Mese "/" Anno.
         DISPLAY "Matricola: " Corso, Matricola.

         STOP RUN.
       END PROGRAM Rubrica.
