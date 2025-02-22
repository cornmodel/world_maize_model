#CLEAR ----
rm(list = ls())
#SET PATH ----
path=getwd()
setwd(path)
#Rounding function ----
roundup = function(x,n){sign(x)*trunc(abs(x)*10^n+0.5)/10^n}

#SETTINGS ----
#base year
by=2020
#ending year
ey=2030
#gap=2020-2016+1=5
gap=by-2016+1
#gap=5
#YEAR
N=ey-by
#N=37
#Sensitivity check: *1.01 1.025 1.05
sen=1
#SCENARIOS: #BASE=1, HIGH=1.01 LOW=0.99
snr=0.99
snr_name="LOW"

#READ DATA
source("./program/read_data_base_medium.R")

#ADJUST PARAMETER 根据基准方案的结果调整
source("./program/parameter_adjust.R")

#CALIBRATION
source("./program/calibration.R")

##CALIBRATION: CHECK ----
if (any(abs(CHECK_AA)<1e-10)==FALSE)
  stop("NOT BALANCE")
#if (any(abs(CHECK_YD)<1e-10)==FALSE)
#  stop("NOT BALANCE")
if (any(abs(CHECK_FOOD)<1e-10)==FALSE)
  stop("NOT BALANCE")
if (any(abs(CHECK_FEED)<1e-10)==FALSE)
  stop("NOT BALANCE")
if (any(abs(CHECK_LOSS)<1e-10)==FALSE)
  stop("NOT BALANCE")
if (any(abs(CHECK_SEED)<1e-10)==FALSE)
  stop("NOT BALANCE")
if (any(abs(CHECK_CSTV)<1e-10)==FALSE)
  stop("NOT BALANCE")
if (any(abs(CHECK_PD)<1e-10)==FALSE)
  stop("NOT BALANCE")
if (any(abs(CHECK_DM)<1e-10)==FALSE)
  stop("NOT BALANCE")
if (any(abs(CHECK_BESTV)<1e-10)==FALSE)
  stop("NOT BALANCE")
if (any(abs(CHECK_PROC)<1e-10)==FALSE)
  stop("NOT BALANCE")

###PROJECTION ----
source("./program/projection_settings.R")

##FUNCTIONS ----
source("./program/functions_base.R")

##CHANGE CONSTANT TERM ----
source("./program/constant_term_adjust.R")

##SOLVE NEW TON ----
source("./program/solve.R")

###OUTPUT RESULTS BY COUNTRY ----
source("./program/output_by_country.R")

#SHOW RESULTS ----
RESULTS_CHN_CORN
write.table(RESULTS_CHN_CORN,paste0("./results/RESULTS_CHN_CORN_medium_",snr_name,".csv"),row.names=FALSE,col.names=TRUE,sep=",")
#RESULTS_CHN_BE
#write.table(RESULTS_CHN_CORN,paste0("./results/RESULTS_CHN_BE_base_medium_",snr_name,".csv"),row.names=FALSE,col.names=TRUE,sep=",")
#RESULTS_CORN
write.table(RESULTS_CORN,paste0("./results/RESULTS_CORN_medium_",snr_name,".csv"),row.names=FALSE,col.names=TRUE,sep=",")
#RESULTS_BE
#write.table(RESULTS_CHN_CORN,paste0("./results/RESULTS_BE_base_medium_",snr_name,".csv"),row.names=FALSE,col.names=TRUE,sep=",")
