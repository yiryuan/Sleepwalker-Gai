library(readxl)
library(rstanarm)
trial1_TBI <-read_csv("/Users/yirong/Desktop/TBI_TRIAL_ONE.csv")
trial1_ANTI <-read_csv("/Users/yirong/Desktop/ANTI_TRIAL_ONE.csv")
lm1<- stan_glm(Egg ~ Alive_day+ANTI, family = neg_binomial_2(link = 'log'), 
               data = trial1_ANTI,offset=No_fly,refresh=0)
lm2<- stan_glm(Egg ~ Alive_day+TBI, family = neg_binomial_2(link = 'log'), 
               data = trial1_TBI,offset=No_fly,refresh=0)
summary(lm1)
summary(lm2)
res1 <- resid(lm1)
res2 <- resid(lm2)
plot(fitted(lm1),res1)
plot(fitted(lm2),res1)