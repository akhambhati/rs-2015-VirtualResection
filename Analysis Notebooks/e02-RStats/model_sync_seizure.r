library(lme4)
library(MuMIn)
library(car)

sink('Synchronizability_Seizure_Analysis.txt')

print('Reading Population Synchronizability')
dat <- read.csv('/Users/akhambhati/Remotes/hoth_research/PeriphData/ds-VCR_PushPull/e02-Synchronizability/Population.csv')
dat <- within(dat, {
                Band_ID <- factor(Band_ID)
                Event_ID <- factor(Event_ID)
                Seizure_ID <- factor(Seizure_ID)
                Subject_ID <- factor(Subject_ID)
                })


cat('\n\n\n\n\n\n---Test All Freq---\n')
cat('\n\n\n---Preictal---\n')
dat_sel = dat[dat$Div_ID < 0,]
model1 <- lmer('MeanSync ~ 1 + (1 | Subject_ID / Band_ID)', data=dat_sel, REML=FALSE)
model2 <- lmer('MeanSync ~ 1 + Seizure_ID + (1 | Subject_ID / Band_ID)', data=dat_sel, REML=FALSE)
print(anova(model1, model2))
print(model2)
print(r.squaredGLMM(model1))
print(r.squaredGLMM(model2))

cat('\n\n\n---Ictal---\n')
dat_sel = dat[dat$Div_ID >= 0,]
model1 <- lmer('MeanSync ~ 1 + (1 | Subject_ID / Band_ID)', data=dat_sel, REML=FALSE)
model2 <- lmer('MeanSync ~ 1 + Seizure_ID + (1 | Subject_ID / Band_ID)', data=dat_sel, REML=FALSE)
print(anova(model1, model2))
print(model2)
print(r.squaredGLMM(model1))
print(r.squaredGLMM(model2))




cat('\n\n\n\n\n\n---Test AlphaTheta---\n')
dat_band = dat[dat$Band_ID == 'AlphaTheta',]
cat('\n\n\n---Preictal---\n')
dat_sel = dat_band[dat_band$Div_ID < 0,]
model1 <- lmer('MeanSync ~ 1 + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
model2 <- lmer('MeanSync ~ 1 + Seizure_ID + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
print(anova(model1, model2))
print(model2)
print(r.squaredGLMM(model1))
print(r.squaredGLMM(model2))

cat('\n\n\n---Ictal---\n')
dat_sel = dat_band[dat_band$Div_ID >= 0,]
model1 <- lmer('MeanSync ~ 1 + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
model2 <- lmer('MeanSync ~ 1 + Seizure_ID + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
print(anova(model1, model2))
print(model2)
print(r.squaredGLMM(model1))
print(r.squaredGLMM(model2))



cat('\n\n\n\n\n\n---Test Beta---\n')
dat_band = dat[dat$Band_ID == 'Beta',]
cat('\n\n\n---Preictal---\n')
dat_sel = dat_band[dat_band$Div_ID < 0,]
model1 <- lmer('MeanSync ~ 1 + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
model2 <- lmer('MeanSync ~ 1 + Seizure_ID + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
print(anova(model1, model2))
print(model2)
print(r.squaredGLMM(model1))
print(r.squaredGLMM(model2))

cat('\n\n\n---Ictal---\n')
dat_sel = dat_band[dat_band$Div_ID >= 0,]
model1 <- lmer('MeanSync ~ 1 + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
model2 <- lmer('MeanSync ~ 1 + Seizure_ID + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
print(anova(model1, model2))
print(model2)
print(r.squaredGLMM(model1))
print(r.squaredGLMM(model2))



cat('\n\n\n\n\n\n---Test LowGamma---\n')
dat_band = dat[dat$Band_ID == 'LowGamma',]
cat('\n\n\n---Preictal---\n')
dat_sel = dat_band[dat_band$Div_ID < 0,]
model1 <- lmer('MeanSync ~ 1 + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
model2 <- lmer('MeanSync ~ 1 + Seizure_ID + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
print(anova(model1, model2))
print(model2)
print(r.squaredGLMM(model1))
print(r.squaredGLMM(model2))

cat('\n\n\n---Ictal---\n')
dat_sel = dat_band[dat_band$Div_ID >= 0,]
model1 <- lmer('MeanSync ~ 1 + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
model2 <- lmer('MeanSync ~ 1 + Seizure_ID + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
print(anova(model1, model2))
print(model2)
print(r.squaredGLMM(model1))
print(r.squaredGLMM(model2))



cat('\n\n\n\n\n\n---Test HighGamma---\n')
dat_band = dat[dat$Band_ID == 'HighGamma',]
cat('\n\n\n---Preictal---\n')
dat_sel = dat_band[dat_band$Div_ID < 0,]
model1 <- lmer('MeanSync ~ 1 + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
model2 <- lmer('MeanSync ~ 1 + Seizure_ID + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
print(anova(model1, model2))
print(model2)
print(r.squaredGLMM(model1))
print(r.squaredGLMM(model2))

cat('\n\n\n---Ictal---\n')
dat_sel = dat_band[dat_band$Div_ID >= 0,]
model1 <- lmer('MeanSync ~ 1 + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
model2 <- lmer('MeanSync ~ 1 + Seizure_ID + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
print(anova(model1, model2))
print(model2)
print(r.squaredGLMM(model1))
print(r.squaredGLMM(model2))


sink()
