## ----Aufgabe 1---------------------------------------------------------------------------
set.seed(1)
data <- MASS::mvrnorm(n = 50, mu = c(0, 0, 0), Sigma = diag(3))
data <- as.data.frame(data)
colnames(data) <- c("x_1", "x_2", "u")
beta_0 <- 1
beta_1 <- 0.2
beta_2 <- -0.5
y <- beta_0 + data$x_1 * beta_1 + data$x_2 * beta_2 + data$u
data$y <- ifelse(y >= 0.5, 1, 0)

mod1 <- glm(y ~ x_1, data = data, family = binomial(link = "probit"))
mod2 <- glm(y ~ x_1 + x_2, data = data, family = binomial(link = "probit"))


## ----Aufgabe 2---------------------------------------------------------------------------
data.frame(
  "null.deviance" = c(mod1$null.deviance, mod2$null.deviance),
  "residual.deviance" = c(mod1$deviance, mod2$deviance),
  row.names = c("model 1", "model 2")
)


## ----Aufgabe 3---------------------------------------------------------------------------
# Modell 1: H_0 kann nicht verworfen werden
mod1$null.deviance - mod1$deviance > qchisq(p = 0.9, df = 1) 

# Modell 2: Verwerfe H_0
mod2$null.deviance - mod2$deviance > qchisq(p = 0.9, df = 2)


## ----Aufgabe 4---------------------------------------------------------------------------
pROC::roc(
  data$y, pnorm(predict(mod1)), plot = "TRUE", col = "red", quiet = TRUE
)
pROC::roc(
  data$y, pnorm(predict(mod2)), plot = "TRUE", col = "blue", quiet = TRUE,
  add = TRUE
)

