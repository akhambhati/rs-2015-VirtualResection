library(lme4)
library(MuMIn)
library(car)

sink('Control_Degree_Centrality_Analysis.txt')

print('Reading Population Node Centrality Statistics')
dat <- read.csv('/Users/akhambhati/Remotes/hoth_research/PeriphData/ds-VCR_PushPull/e03-VirtualResection/Population_ControlStatistics.csv')
dat <- within(dat, {
                Band_ID <- factor(Band_ID)
                Event_ID <- factor(Event_ID)
                Subject_ID <- factor(Subject_ID)
                })


cat('\n\n\n---Test Random Effects---\n')
model1 <- lmer('Control_Centrality_Mean ~ 1 + (1 | Subject_ID / Event_ID / Band_ID)', data=dat, REML=FALSE)
model2 <- lmer('Control_Centrality_Mean ~ 1 + Degree_Centrality_Mean + (1 | Subject_ID / Event_ID / Band_ID)', data=dat, REML=FALSE)
print(anova(model1, model2))
print(r.squaredGLMM(model2))
print(model1)
print(model2)
sink()
