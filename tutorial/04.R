## ----Aufgabe 4----------------------------------------------------------------------
set.seed(1)
Sigma <- matrix(c(1, 0.7, 0.5, 0.7, 1, 0, 0.5, 0, 1), nrow = 3)
data <- MASS::mvrnorm(n = 100, mu = c(0, 0, 0), Sigma = Sigma)
data <- as.data.frame(data)
colnames(data) <- c("x", "z", "u")
beta_0 <- 1
beta_1 <- 2
data$y <- beta_0 + data$x * beta_1 + data$u

kq <- lm(y ~ x, data = data)
coef(kq)

(beta_1_iv <- cov(data$z, data$y) / cov(data$z, data$x))
(beta_0_iv <- mean(data$y) - beta_1_iv * mean(data$x))


## ----Aufgabe 5----------------------------------------------------------------------
### 2SLS
mod_first_stage <- lm(x ~ z, data = data)
summary(mod_first_stage) # z ist ein relevantes Instrument
fitted_x <- fitted(mod_first_stage)
mod_second_stage <- lm(y ~ fitted_x, data = data)
coef(mod_second_stage)

### mit der Paketfunktion
mod_iv <- AER::ivreg(y ~ x | z, data = data)
coef(mod_iv)

