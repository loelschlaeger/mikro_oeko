## ----Aufgabe 1------------------------------------------------------------------------------------------
ols_smoke <- lm(
  formula = cigs ~ lincome + lcigpric + educ + age + I(age^2) + restaurn, 
  data = wooldridge::smoke
)
summary(ols_smoke)


## ----Aufgabe 2------------------------------------------------------------------------------------------
ols_smoke_white <- lm(
  formula = ols_smoke$residuals^2 ~ ols_smoke$fitted + I(ols_smoke$fitted^2)
)
summary(ols_smoke_white)


## ----Aufgabe 3------------------------------------------------------------------------------------------
### Schritt 1
u <- residuals(ols_smoke)

### Schritt 2
log_u_sq <- log(u^2)

### Schritt 3
model_helper <- lm(
  formula = log_u_sq ~ lincome + lcigpric + educ + age + I(age^2) + restaurn,
  data = wooldridge::smoke
)

### Schritt 4
fitted_values <- model.matrix(model_helper) %*% coefficients(model_helper)

### Schritt 5
weights <- 1 / exp(fitted_values)

### Schritt 6
fgls_smoke <- lm(
  formula = cigs ~ lincome + lcigpric + educ + age + I(age^2) + restaurn, 
  data = wooldridge::smoke,
  weights = weights
)
summary(fgls_smoke)


## ----Aufgabe 4------------------------------------------------------------------------------------------
crime <- lm(
  formula = crmrte ~ unem,
  data = wooldridge::crime2,
  subset = year == 87
)
coef(crime)

crime_fd <- lm(
  formula = ccrmrte ~ cunem,
  data = wooldridge::crime2
)
coef(crime_fd)


## ----Aufgabe 6------------------------------------------------------------------------------------------
rental <- wooldridge::rental

### Bildung der Differenzen
fd_lrent <- rental$lrent[rental$year == 90] - rental$lrent[rental$year == 80]
fd_lpop <- rental$lpop[rental$year == 90] - rental$lpop[rental$year == 80]
fd_lavginc <- rental$lavginc[rental$year == 90] - rental$lavginc[rental$year == 80]
fd_pctstu <- rental$pctstu[rental$year == 90] - rental$pctstu[rental$year == 80]

### Schätzung
ols_rental_fd <- lm(formula = fd_lrent ~ fd_lpop + fd_lavginc + fd_pctstu)
summary(ols_rental_fd)

