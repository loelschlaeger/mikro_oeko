# Vorlesung 1

Ökonometrie bedeutet "Vermessen der Wirtschaft"

- Unterteilung: Makro (Aggregate, raumzeitliche Prozesse), Finance (Finanzinstrumente), Mikro (Verhalten von Individuen)

- Daten: Querschnitt (eine Beobachtung pro Individuum), Zeitreihe (mehrere Beobachtungen für ein Element), Panel (jedes Individuum wird zu verschiedenen Zeiten beobachtet)

- Modelle: lineare Modelle, diskrete Wahlmodelle, Modelle für Zähldaten, Modelle für zensierte Daten

# Vorlesung 2

Wiederholung "Einführung in die Ökonometrie"

- Koeffizienten im MLR-Modell können durch Minimierung der Fehlerquadratsumme geschätzt werden

- Annahmen: lineares Modell (MLR.1), zufällige Stichprobe (MLR.2), informativer Regressor (MLR.3), bedingte Unkorreliertheit der Fehler (MLR.4), Homoskedastizität (MLR.5), Normalität der Fehler (MLR.6)

- unter MLR.1-4 ist der KQ-Schätzer unverzerrt

- unter MLR.1-5 ist die Varianz des KQ-Schätzers $\sigma^2 (X'X)^{-1}$, sie kann unverzerrt geschätzt werden, der $j$-ten Komponente $\sigma^2 / (SST_j \cdot (1 - R_j^2))$, der Schätzer ist BLUS (Gauss-Markov Theorem)

- $R^2 = SSE / SST = 1 - SSR / SST$ gibt an, wie viel von der Variation der abhängigen Variable durch das Modell erklärt wird (kann für die Anzahl der Regressoren adjustiert werden)

# Vorlesung 3

Wiederholung "Einführung in die Ökonometrie"

- durch Vergleich der Koeffizienten mit den geschätzten Standardabweichungen können $t$-Tests auf die Nullhypothese, dass der Koeffizient Null ist, durchgeführt werden

- simultane Tests auf mehrere Koeffizienten können mit dem $F$-Test durchgeführt werden

- Modellsekeltion: haben wir eine Variable zu viel im Modell, steigt die Varianz der Koeffizienten, die Tests sind aber alle gültig; haben wir eine Variable zu wenig im Modell, erzeugt das möglicherweise eine Verzerrung, die Tests sind dann nicht mehr gültig

- ist die Homoskedastie-Annahme verletzt, dann stimmen die Formeln für die Varianz nicht, die Tests sind nicht mehr gültig und der KQ-Schätzer ist nicht mehr BLUS

- White-Test für Homoskedastie: regressiere Regressoren auf quadrierte Residuen aus dem ursprünglichen Modell

- im Fall von Heteroskedastizität kann man die Variablen transformieren (Logarithmieren) oder (F)GLS Schätzer verwenden (ist dann der BLUS)

# Vorlesung 4

Gepoolte Queerschnittsdaten: getrennt oder gemeinsam betrachten?




