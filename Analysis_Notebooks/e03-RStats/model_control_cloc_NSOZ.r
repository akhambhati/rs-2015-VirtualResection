library(lme4)
library(MuMIn)
library(car)

sink('PushPull_ControllerLoc_NSOZ_Analysis.txt')

print('Reading Population PushPull')
dat <- read.csv('/Users/akhambhati/Remotes/hoth_research/PeriphData/ds-VCR_PushPull/e03-VirtualResection/Population_ControlLoc_Stats.csv')
dat <- within(dat, {
                Band_ID <- factor(Band_ID)
                Event_ID <- factor(Event_ID)
                Epoch_ID <- factor(Epoch_ID)
                Seizure_ID <- factor(Seizure_ID)
                Subject_ID <- factor(Subject_ID)
                })


cat('\n\n\n---Mixed Effects Models---\n')

print('Band: AlphaTheta')
print('Epoch: Preictal')
print('CType: Desync')
dat_band = dat[dat$Band_ID == "AlphaTheta",]
dat_sel = dat_band[dat_band$Epoch_ID == "preictal",]
model1 <- lmer('Frac_Desync_NSOZ ~ 1 + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
model2 <- lmer('Frac_Desync_NSOZ ~ 1 + Seizure_ID + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
print(anova(model1, model2))
print(model2)
print(r.squaredGLMM(model1))
print(r.squaredGLMM(model2))

print('CType: Bulk')
model1 <- lmer('Frac_Bulk_NSOZ ~ 1 + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
model2 <- lmer('Frac_Bulk_NSOZ ~ 1 + Seizure_ID + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
print(anova(model1, model2))
print(model2)
print(r.squaredGLMM(model1))
print(r.squaredGLMM(model2))

print('CType: Sync')
model1 <- lmer('Frac_Sync_NSOZ ~ 1 + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
model2 <- lmer('Frac_Sync_NSOZ ~ 1 + Seizure_ID + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
print(anova(model1, model2))
print(model2)
print(r.squaredGLMM(model1))
print(r.squaredGLMM(model2))

cat('\n\n\n')

print('Band: AlphaTheta')
print('Epoch: Ictal')
print('CType: Desync')
dat_band = dat[dat$Band_ID == "AlphaTheta",]
dat_sel = dat_band[dat_band$Epoch_ID == "ictal",]
model1 <- lmer('Frac_Desync_NSOZ ~ 1 + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
model2 <- lmer('Frac_Desync_NSOZ ~ 1 + Seizure_ID + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
print(anova(model1, model2))
print(model2)
print(r.squaredGLMM(model1))
print(r.squaredGLMM(model2))

print('CType: Bulk')
model1 <- lmer('Frac_Bulk_NSOZ ~ 1 + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
model2 <- lmer('Frac_Bulk_NSOZ ~ 1 + Seizure_ID + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
print(anova(model1, model2))
print(model2)
print(r.squaredGLMM(model1))
print(r.squaredGLMM(model2))

print('CType: Sync')
model1 <- lmer('Frac_Sync_NSOZ ~ 1 + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
model2 <- lmer('Frac_Sync_NSOZ ~ 1 + Seizure_ID + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
print(anova(model1, model2))
print(model2)
print(r.squaredGLMM(model1))
print(r.squaredGLMM(model2))

cat('\n\n\n')

print('Band: Beta')
print('Epoch: Preictal')
print('CType: Desync')
dat_band = dat[dat$Band_ID == "Beta",]
dat_sel = dat_band[dat_band$Epoch_ID == "preictal",]
model1 <- lmer('Frac_Desync_NSOZ ~ 1 + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
model2 <- lmer('Frac_Desync_NSOZ ~ 1 + Seizure_ID + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
print(anova(model1, model2))
print(model2)
print(r.squaredGLMM(model1))
print(r.squaredGLMM(model2))

print('CType: Bulk')
model1 <- lmer('Frac_Bulk_NSOZ ~ 1 + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
model2 <- lmer('Frac_Bulk_NSOZ ~ 1 + Seizure_ID + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
print(anova(model1, model2))
print(model2)
print(r.squaredGLMM(model1))
print(r.squaredGLMM(model2))

print('CType: Sync')
model1 <- lmer('Frac_Sync_NSOZ ~ 1 + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
model2 <- lmer('Frac_Sync_NSOZ ~ 1 + Seizure_ID + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
print(anova(model1, model2))
print(model2)
print(r.squaredGLMM(model1))
print(r.squaredGLMM(model2))

cat('\n\n\n')

print('Band: Beta')
print('Epoch: Ictal')
print('CType: Desync')
dat_band = dat[dat$Band_ID == "Beta",]
dat_sel = dat_band[dat_band$Epoch_ID == "ictal",]
model1 <- lmer('Frac_Desync_NSOZ ~ 1 + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
model2 <- lmer('Frac_Desync_NSOZ ~ 1 + Seizure_ID + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
print(anova(model1, model2))
print(model2)
print(r.squaredGLMM(model1))
print(r.squaredGLMM(model2))

print('CType: Bulk')
model1 <- lmer('Frac_Bulk_NSOZ ~ 1 + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
model2 <- lmer('Frac_Bulk_NSOZ ~ 1 + Seizure_ID + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
print(anova(model1, model2))
print(model2)
print(r.squaredGLMM(model1))
print(r.squaredGLMM(model2))

print('CType: Sync')
model1 <- lmer('Frac_Sync_NSOZ ~ 1 + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
model2 <- lmer('Frac_Sync_NSOZ ~ 1 + Seizure_ID + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
print(anova(model1, model2))
print(model2)
print(r.squaredGLMM(model1))
print(r.squaredGLMM(model2))

cat('\n\n\n')

print('Band: LowGamma')
print('Epoch: Preictal')
print('CType: Desync')
dat_band = dat[dat$Band_ID == "LowGamma",]
dat_sel = dat_band[dat_band$Epoch_ID == "preictal",]
model1 <- lmer('Frac_Desync_NSOZ ~ 1 + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
model2 <- lmer('Frac_Desync_NSOZ ~ 1 + Seizure_ID + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
print(anova(model1, model2))
print(model2)
print(r.squaredGLMM(model1))
print(r.squaredGLMM(model2))

print('CType: Bulk')
model1 <- lmer('Frac_Bulk_NSOZ ~ 1 + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
model2 <- lmer('Frac_Bulk_NSOZ ~ 1 + Seizure_ID + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
print(anova(model1, model2))
print(model2)
print(r.squaredGLMM(model1))
print(r.squaredGLMM(model2))

print('CType: Sync')
model1 <- lmer('Frac_Sync_NSOZ ~ 1 + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
model2 <- lmer('Frac_Sync_NSOZ ~ 1 + Seizure_ID + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
print(anova(model1, model2))
print(model2)
print(r.squaredGLMM(model1))
print(r.squaredGLMM(model2))

cat('\n\n\n')

print('Band: LowGamma')
print('Epoch: Ictal')
print('CType: Desync')
dat_band = dat[dat$Band_ID == "LowGamma",]
dat_sel = dat_band[dat_band$Epoch_ID == "ictal",]
model1 <- lmer('Frac_Desync_NSOZ ~ 1 + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
model2 <- lmer('Frac_Desync_NSOZ ~ 1 + Seizure_ID + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
print(anova(model1, model2))
print(model2)
print(r.squaredGLMM(model1))
print(r.squaredGLMM(model2))

print('CType: Bulk')
model1 <- lmer('Frac_Bulk_NSOZ ~ 1 + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
model2 <- lmer('Frac_Bulk_NSOZ ~ 1 + Seizure_ID + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
print(anova(model1, model2))
print(model2)
print(r.squaredGLMM(model1))
print(r.squaredGLMM(model2))

print('CType: Sync')
model1 <- lmer('Frac_Sync_NSOZ ~ 1 + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
model2 <- lmer('Frac_Sync_NSOZ ~ 1 + Seizure_ID + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
print(anova(model1, model2))
print(model2)
print(r.squaredGLMM(model1))
print(r.squaredGLMM(model2))

cat('\n\n\n')

print('Band: HighGamma')
print('Epoch: Preictal')
print('CType: Desync')
dat_band = dat[dat$Band_ID == "HighGamma",]
dat_sel = dat_band[dat_band$Epoch_ID == "preictal",]
model1 <- lmer('Frac_Desync_NSOZ ~ 1 + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
model2 <- lmer('Frac_Desync_NSOZ ~ 1 + Seizure_ID + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
print(anova(model1, model2))
print(model2)
print(r.squaredGLMM(model1))
print(r.squaredGLMM(model2))

print('CType: Bulk')
model1 <- lmer('Frac_Bulk_NSOZ ~ 1 + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
model2 <- lmer('Frac_Bulk_NSOZ ~ 1 + Seizure_ID + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
print(anova(model1, model2))
print(model2)
print(r.squaredGLMM(model1))
print(r.squaredGLMM(model2))

print('CType: Sync')
model1 <- lmer('Frac_Sync_NSOZ ~ 1 + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
model2 <- lmer('Frac_Sync_NSOZ ~ 1 + Seizure_ID + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
print(anova(model1, model2))
print(model2)
print(r.squaredGLMM(model1))
print(r.squaredGLMM(model2))

cat('\n\n\n')

print('Band: HighGamma')
print('Epoch: Ictal')
print('CType: Desync')
dat_band = dat[dat$Band_ID == "HighGamma",]
dat_sel = dat_band[dat_band$Epoch_ID == "ictal",]
model1 <- lmer('Frac_Desync_NSOZ ~ 1 + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
model2 <- lmer('Frac_Desync_NSOZ ~ 1 + Seizure_ID + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
print(anova(model1, model2))
print(model2)
print(r.squaredGLMM(model1))
print(r.squaredGLMM(model2))

print('CType: Bulk')
model1 <- lmer('Frac_Bulk_NSOZ ~ 1 + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
model2 <- lmer('Frac_Bulk_NSOZ ~ 1 + Seizure_ID + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
print(anova(model1, model2))
print(model2)
print(r.squaredGLMM(model1))
print(r.squaredGLMM(model2))

print('CType: Sync')
model1 <- lmer('Frac_Sync_NSOZ ~ 1 + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
model2 <- lmer('Frac_Sync_NSOZ ~ 1 + Seizure_ID + (1 | Subject_ID)', data=dat_sel, REML=FALSE)
print(anova(model1, model2))
print(model2)
print(r.squaredGLMM(model1))
print(r.squaredGLMM(model2))

sink()
