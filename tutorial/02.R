## ----Aufgabe 1-----------------------------------------------------------------------------------------------------------
ols_smoke <- lm(
  formula = cigs ~ lincome + lcigpric + educ + age + I(age^2) + restaurn, 
  data = wooldridge::smoke
)
summary(ols_smoke)


## ----Aufgabe 2-----------------------------------------------------------------------------------------------------------
# visuelle Überprüfung hier schwieriger, da mehrere Regressoren involviert sind
plot(wooldridge::smoke$lincome, residuals(ols_smoke)) 
abline(h = 0)

ols_smoke_white <- lm(
  formula = ols_smoke$residuals^2 ~ ols_smoke$fitted + I(ols_smoke$fitted^2)
)

summary(ols_smoke_white)


## ----Aufgabe 3-----------------------------------------------------------------------------------------------------------
### Schritt 1
u_hat <- residuals(ols_smoke)

### Schritt 2
model_helper <- lm(
  formula = I(log(u_hat^2)) ~ lincome + lcigpric + educ + age + I(age^2) + restaurn,
  data = wooldridge::smoke
)

### Schritt 3
fitted_values <- fitted(model_helper)
weights <- 1 / exp(fitted_values)

### Schritt 4
fgls_smoke <- lm(
  formula = cigs ~ lincome + lcigpric + educ + age + I(age^2) + restaurn, 
  data = wooldridge::smoke,
  weights = weights
)
summary(fgls_smoke)

### White-Test verwirft immer noch Homoskedastizität, jedoch ist der p-value gestiegen
fgls_smoke_white <- lm(
  formula = fgls_smoke$residuals^2 ~ fgls_smoke$fitted + I(fgls_smoke$fitted^2)
)
summary(fgls_smoke_white)


## ----Aufgabe 4-----------------------------------------------------------------------------------------------------------
crime <- lm(
  formula = crmrte ~ unem,
  data = wooldridge::crime2
)
coef(crime)

crime_fd <- lm(
  formula = ccrmrte ~ cunem, # prefix "c" steht für "change"
  data = wooldridge::crime2
)
coef(crime_fd)


## ----Aufgabe 6-----------------------------------------------------------------------------------------------------------
rental <- wooldridge::rental

### Bildung der Differenzen 
### (alternativ können die Variablen clrent, clpop, ... verwendet werden)
fd_lrent <- rental$lrent[rental$year == 90] - rental$lrent[rental$year == 80]
fd_lpop <- rental$lpop[rental$year == 90] - rental$lpop[rental$year == 80]
fd_lavginc <- rental$lavginc[rental$year == 90] - rental$lavginc[rental$year == 80]
fd_pctstu <- rental$pctstu[rental$year == 90] - rental$pctstu[rental$year == 80]

### Schätzung
ols_rental_fd <- lm(formula = fd_lrent ~ fd_lpop + fd_lavginc + fd_pctstu)
summary(ols_rental_fd)

