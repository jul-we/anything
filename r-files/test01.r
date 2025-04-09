n <- 100
x <- rep(1:20, length.out=n)
beta <- c(b0=1, b1=0.5)
X <- cbind(1, x)
mu <- X %*% beta
y <- rnorm(n, mean=mu, sd=1)

plot(x, y)
abline(mod <- lm(y~x))
mod
