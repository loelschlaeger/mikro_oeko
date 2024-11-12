---
title: "Preiselastizitäten beim Zigarettenkonsum"
output: 
  pdf_document:
    template: ../template.tex
---

# Datensatz

Die Datei `cigarettes.csv` enthält Daten zum Zigarettenkonsum in 48 Staaten der USA. Die Variable `nfrage` ist die nachgefragte Menge an Zigarettenschachteln pro Kopf, `preis` der durchschnittliche (bereinigte) Preis pro Schachtel in cents, `usteuer` die allgemeine Umsatzsteuer des Staates in cents pro Schachtel und `zsteuer` eine explizite Zigarettensteuer des Staates in cents pro Schachtel. 

# Teil 1: Datenbeschreibung

Bitte beschreiben Sie 

1. die Art und Dimension des Datensatzes,

2. die relevanten Variablen (mit deskriptiven Statistiken und Visualisierungen), 

3. das vermutliche Ziel der Datenerhebung.

# Teil 2: Analysemethoden und Modellierung

1. Basierend auf der Art der Daten, welche Methoden und Modelle sind geeignet, um den Zigarettenkonsum zu modellieren? Bitte beschreiben Sie die Modelle und alle getroffenen Annahmen im Detail.

2. Wie sehr lässt der Zigarettenkonsum im Zuge von Preiserhöhungen nach? Bitte beantworten Sie diese Frage auf Basis eines geeigneten Modells.

\noindent \textit{Hinweise:} Preiselastizitäten werden am besten mit einem log-log-Modell modelliert. Betrachten Sie `usteuer` und `zsteuer` als mögliche Instrumentvariablen für `preis`.



