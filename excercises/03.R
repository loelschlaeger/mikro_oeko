## ----Aufgabe 4--------------------------------------------------------------------------
unfaelle <- read.csv("unfaelle.csv")
str(unfaelle)


## ----Aufgabe 5--------------------------------------------------------------------------
pooled <- lm(
  formula = tote_p10k ~ biersteuer,
  data = unfaelle,
  subset = (jahr %in% c(1982, 1988))
)
summary(pooled)

# install.packages("plm")
library("plm")

fd <- plm(
  formula = tote_p10k ~ biersteuer,
  model = "fd",
  data = unfaelle,
  subset = (jahr %in% c(1982, 1988))
)
summary(fd)


## ----Aufgabe 6--------------------------------------------------------------------------
within <- plm(
  formula = tote_p10k ~ biersteuer + alo + lpkopf_einkom + alk_alter,
  model = "within",
  data = unfaelle
)
summary(within)


## ----Aufgabe 8--------------------------------------------------------------------------
random <- plm(
  formula = tote_p10k ~ biersteuer + alo + lpkopf_einkom + alk_alter,
  model = "random",
  data = unfaelle
)
summary(random)

