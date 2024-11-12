---
title: "Risikobereitschaft im Schach"
output: 
  pdf_document:
    template: ../template.tex
---

# Datensatz

Die Datei `berserk.csv` enthält Daten zur "berserking"-Entscheidung der Teilnehmer in der Bullet-Arena 2022 auf der Online-Schachplattform https://lichess.org. Folgenden Variablen sind enthalten: `player_id` und `game_id` identifizieren den Spieler beziehungsweise die Partie. `berserk` ist ein Indikator, ob der Spieler "berserkt" hat (siehe dazu auch https://lichess.org/tournament/help?system=arena). Weitere Indikatoren sind `white` (Hat der Spieler die weißen Steine in dieser Partie?), `lost` (Hat der Spieler die vergangene Runde verloren?) und `streak` (Hat der Spieler bereits mehrere Partien am Stück gewonnen?). Weitere Variablen sind `rating` (die Wertungszahl des Spielers), `rating_diff` (der Wertungsunterschied zum Gegner) und `min_rem` (die verleibenen Minuten im Turnier).

# Teil 1: Datenbeschreibung

Bitte beschreiben Sie 

1. die Art und Dimension des Datensatzes,

2. die relevanten Variablen (mit deskriptiven Statistiken und Visualisierungen), 

3. die Quelle und das (vermutliche) Ziel der Datenerhebung.

# Teil 2: Analysemethoden und Modellierung

1. Basierend auf der Art der Daten, welche Methoden und Modelle sind geeignet, um die Risikobereitschaft der Schachspieler zu modellieren? Bitte beschreiben Sie die Modelle und alle getroffenen Annahmen im Detail.

2. Welche Faktoren bestimmen die "berserking"-Entscheidung? Bitte beantworten Sie diese Frage auf Basis eines geeigneten Modells.



