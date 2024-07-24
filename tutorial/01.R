## ----Aufgabe 3------------------------------------
data <- wooldridge::cps78_85


## ----Aufgabe 4------------------------------------
data$wage <- exp(data$lwage)


## ----Aufgabe 6------------------------------------
str(data)

plot(
  data$educ[data$y85 == 0], 
  data$wage[data$y85 == 0], 
  main = "Zusammenhang Ausbildung und Gehalt in 1978 vs. 1985", 
  xlab = "educ (Ausbildungszeit in Jahren)", 
  ylab = "wage (Stundenlohn in USD)",
  xlim = c(0, max(data$educ)),
  ylim = c(0, max(data$wage))
)
points(
  data$educ[data$y85 == 1] + 0.15, 
  data$wage[data$y85 == 1], 
  col = "red"
)
legend(
  "topleft", 
  legend = c("1978", "1985"), 
  col = c(1:2), 
  pch = "o"
)


## ----Aufgabe 7------------------------------------
model <- lm(formula = wage ~ educ, data = data)
summary(model)


## ----Aufgabe 8------------------------------------
plot(
  model$fitted, model$residuals,
  xlab = "angepasste Werte",
  ylab = "Residuen"
)
abline(h = 0)

white <- lm(formula = I(model$residuals^2) ~ model$fitted + I(model$fitted^2))
summary(white)


## ----Aufgabe 10-----------------------------------
model_log <- lm(formula = lwage ~ educ, data = data)
summary(model_log)

plot(
  model_log$fitted, model_log$residuals,
  xlab = "angepasste Werte (log Modell)",
  ylab = "Residuen (log Modell)"
)
abline(h = 0)

breusch_pagan <- lm(formula = I(model_log$residuals^2) ~ data$educ)
summary(breusch_pagan)

white <- lm(formula = I(model_log$residuals^2) ~ model_log$fitted + I(model_log$fitted^2))
summary(white)


## ----Aufgabe 11-----------------------------------
model_log_dummy <- lm(formula = lwage ~ educ + y85, data = data)
summary(model_log_dummy)


## ----Aufgabe 12-----------------------------------
model_log_dummy_interact <- lm(
  formula = lwage ~ educ + y85 + I(y85 * educ), data = data
)
summary(model_log_dummy_interact)


## ----Aufgabe 13-----------------------------------
model_pool <- lm(formula = lwage ~ educ, data = data)
summary(model_pool)
model_1978 <- lm(formula = lwage ~ educ, data = data, subset = (y85 == 0))
summary(model_1978)
model_1985 <- lm(formula = lwage ~ educ, data = data, subset = (y85 == 1))
summary(model_1985)


## ----Aufgabe 14-----------------------------------
### Teststatistik berechnen
SSR_pool <- sum(model_pool$residuals^2)
SSR_1978 <- sum(model_1978$residuals^2)
SSR_1985 <- sum(model_1985$residuals^2) 
n_1978 <- nobs(model_1978)
n_1985 <- nobs(model_1985)
K <- 1
F <- (SSR_pool - (SSR_1978 + SSR_1985)) / (SSR_1978 + SSR_1985) * 
  (n_1978 + n_1985 - 2 * (K + 1)) / (K + 1)

### Testdurchführung
alpha <- 0.05
quantil <- qf(1- alpha, K + 1, n_1978 + n_1985 - 2 * (K + 1))
F > quantil

### alternativ mit p-value
pvalue <- 1 - pf(F, K + 1, n_1978 + n_1985 - 2 * (K + 1))
pvalue > alpha

