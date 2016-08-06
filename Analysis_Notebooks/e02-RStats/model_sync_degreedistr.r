library(lme4)
library(MuMIn)
library(car)

sink('Synchronizability_DegreeDistrib_Analysis.txt')

print('Reading Population Synchronizability')
dat <- read.csv('/Users/akhambhati/Remotes/hoth_research/PeriphData/ds-VCR_PushPull/e02-Synchronizability/Population.csv')
dat <- within(dat, {
                Band_ID <- factor(Band_ID)
                Event_ID <- factor(Event_ID)
                Seizure_ID <- factor(Seizure_ID)
                Subject_ID <- factor(Subject_ID)
                })


cat('\n\n\n\n\n\n---Test Random Effects: Subjects, Events, Frequency Band---\n')
model1 <- lmer('MeanSync ~ 1 + (1 | Subject_ID / Event_ID / Band_ID)', data=dat, REML=FALSE)
model2 <- lmer('MeanSync ~ MeanDisp + (MeanDisp | Subject_ID / Event_ID / Band_ID)', data=dat, REML=FALSE)
print(anova(model1, model2))
print(r.squaredGLMM(model2))
print(model2)
sink()
