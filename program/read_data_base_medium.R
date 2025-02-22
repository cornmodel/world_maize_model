###READ DATA ----
CHN_CORN=read.csv("./balance_sheet/CHN_CORN.csv")
JPN_CORN=read.csv("./balance_sheet/JPN_CORN.csv")
KOR_CORN=read.csv("./balance_sheet/KOR_CORN.csv")
MEX_CORN=read.csv("./balance_sheet/MEX_CORN.csv")
EUN_CORN=read.csv("./balance_sheet/EUN_CORN.csv")
ROW_CORN=read.csv("./balance_sheet/ROW_CORN.csv")

USA_CORN=read.csv("./balance_sheet/USA_CORN.csv")
ARG_CORN=read.csv("./balance_sheet/ARG_CORN.csv")
BRA_CORN=read.csv("./balance_sheet/BRA_CORN.csv")
IND_CORN=read.csv("./balance_sheet/IND_CORN.csv")
UKR_CORN=read.csv("./balance_sheet/UKR_CORN.csv")
RUS_CORN=read.csv("./balance_sheet/RUS_CORN.csv")

CHN_BE=read.csv("./balance_sheet/CHN_BE.csv")
EUN_BE=read.csv("./balance_sheet/EUN_BE.csv")
ROW_BE=read.csv("./balance_sheet/ROW_BE.csv")

USA_BE=read.csv("./balance_sheet/USA_BE.csv")
BRA_BE=read.csv("./balance_sheet/BRA_BE.csv")
IND_BE=read.csv("./balance_sheet/IND_BE.csv")
###READ PARAMETERS ----
#PARAMETERS ----
CORN_AA=read.csv("./parameters/CORN_AA.csv")
CORN_AA[is.na(CORN_AA)] <- 0
CORN_YD=read.csv("./parameters/CORN_YD.csv")
CORN_YD[is.na(CORN_YD)] <- 0
CORN_YD[1,3] <- 0.02267
CORN_PFOOD=read.csv("./parameters/CORN_PFOOD.csv")
CORN_PFOOD[is.na(CORN_PFOOD)] <- 0
CORN_PROC=read.csv("./parameters/CORN_PROC.csv")
CORN_PROC[is.na(CORN_PROC)] <- 0
CORN_FEED=read.csv("./parameters/CORN_FEED.csv")
CORN_FEED[is.na(CORN_FEED)] <- 0
CORN_SEEDLOSS=read.csv("./parameters/CORN_SEEDLOSS.csv")
CORN_SEEDLOSS[is.na(CORN_SEEDLOSS)] <- 0
CORN_STV=read.csv("./parameters/CORN_STV.csv")
CORN_STV[is.na(CORN_STV)] <- 0
CORN_PRICE=read.csv("./parameters/CORN_PRICE.csv")
CORN_PRICE[is.na(CORN_PRICE)] <- 0
for(i in 1:12){
  CORN_PRICE$PCS[i]<-CORN_PRICE$PWD[i]*CORN_PRICE$EXCH[i]*(1+CORN_PRICE$DUTY[i]/100)
  CORN_PRICE$PPD[i]<-CORN_PRICE$PCS[i]+CORN_PRICE$MI[i]*CORN_PRICE$EXCH[i]
}

BE_PD=read.csv("./parameters/BE_PD.csv")
BE_PD[is.na(BE_PD)] <- 0
BE_DM=read.csv("./parameters/BE_DM.csv")
BE_DM[is.na(BE_DM)] <- 0
BE_STV=read.csv("./parameters/BE_STV.csv")
BE_STV[is.na(BE_STV)] <- 0

for(i in 1:12){
  CORN_PRICE$PCSBE[i]<-CORN_PRICE$PWDBE[i]*CORN_PRICE$EXCH[i]
}
BE_PRICE_BE_1=CORN_PRICE$PCSBE[1]
BE_PRICE_BE_2=CORN_PRICE$PCSBE[5]
BE_PRICE_BE_3=CORN_PRICE$PCSBE[6]
BE_PRICE_BE_4=CORN_PRICE$PCSBE[7]
BE_PRICE_BE_5=CORN_PRICE$PCSBE[9]
BE_PRICE_BE_6=CORN_PRICE$PCSBE[11]
BE_PRICE_BE=rbind(BE_PRICE_BE_1,BE_PRICE_BE_2,BE_PRICE_BE_3,BE_PRICE_BE_4,BE_PRICE_BE_5,BE_PRICE_BE_6)

BE_PRICE_CORN_1=CORN_PRICE$PCS[1]
BE_PRICE_CORN_2=CORN_PRICE$PCS[5]
BE_PRICE_CORN_3=CORN_PRICE$PCS[6]
BE_PRICE_CORN_4=CORN_PRICE$PCS[7]
BE_PRICE_CORN_5=CORN_PRICE$PCS[9]
BE_PRICE_CORN_6=CORN_PRICE$PCS[11]
BE_PRICE_CORN=rbind(BE_PRICE_CORN_1,BE_PRICE_CORN_2,BE_PRICE_CORN_3,BE_PRICE_CORN_4,BE_PRICE_CORN_5,BE_PRICE_CORN_6)

BE_PRICE=cbind(BE_PRICE_BE,BE_PRICE_CORN)
colnames(BE_PRICE) <- c('BE_PRICE_BE','BE_PRICE_CORN')
row.names(BE_PRICE) <- c('1','2','3','4','5','6')
BE_PRICE=data.frame(BE_PRICE)

#MATRIX ----
CORN_AA_PPD=data.matrix(CORN_AA$PPD)*sen
CORN_AA_RCE=data.matrix(CORN_AA$PPDC_RCE)*sen
CORN_AA_WHT=data.matrix(CORN_AA$PPDC_WHT)*sen
CORN_AA_SYB=data.matrix(CORN_AA$PPDC_SYB)*sen
CORN_AA_CG=data.matrix(CORN_AA$PPDC_CG)*sen
CORN_AA_FER=data.matrix(CORN_AA$PFER)*sen
CORN_PRICE_PPD=data.matrix(CORN_PRICE$PPD)*sen
CORN_YD_TECH=data.matrix(CORN_YD$TECH)*sen
CORN_PFOOD_PCS=data.matrix(CORN_PFOOD$PCS)*sen
CORN_PFOOD_RCE=data.matrix(CORN_PFOOD$PCS_RCE)*sen
CORN_PFOOD_WHT=data.matrix(CORN_PFOOD$PCS_WHT)*sen
CORN_PFOOD_CG=data.matrix(CORN_PFOOD$PCS_CG)*sen
CORN_PFOOD_PINC=data.matrix(CORN_PFOOD$PINC)*sen
CORN_PRICE_PCS=data.matrix(CORN_PRICE$PCS)*sen
CORN_FEED_PDPK=data.matrix(CORN_FEED$PDPK)*sen
CORN_FEED_PDBF=data.matrix(CORN_FEED$PDBF)*sen
CORN_FEED_PDPT=data.matrix(CORN_FEED$PDPT)*sen
CORN_FEED_PDMK=data.matrix(CORN_FEED$PDMK)*sen
CORN_LOSSRATE=data.matrix(CORN_SEEDLOSS$LOSSRATE)*sen
CORN_SEEDRATE=data.matrix(CORN_SEEDLOSS$SEEDRATE)*sen
CORN_PROC_PGDP=data.matrix(CORN_PROC$PGDP)*sen

BE_PD_POIL=matrix(BE_PD$POIL)*sen
BE_PD_PMZ=matrix(BE_PD$PMZ)*sen
BE_PD_PBE=matrix(BE_PD$PBE)*sen
BE_DM_POIL=matrix(BE_DM$POIL)*sen
BE_DM_PBE=matrix(BE_DM$PBE)*sen
BE_DM_PGDP=matrix(BE_DM$PGDP)*sen

PWD_CORN=data.matrix(CORN_PRICE$PWD)
PWD_BE_ALL=data.matrix(CORN_PRICE$PWDBE)

###READ EX. VAR. ----
#SCENARIO 0: BASE
POP_S0=read.csv("./macro/POP_S0.csv")
PGDP_S0=read.csv("./macro/PGDP_S0.csv")
EXCH_S0=read.csv("./macro/EXCH_S0.csv")
PORKPD_S0=read.csv("./macro/PORKPD_S0.csv")
BEEFPD_S0=read.csv("./macro/BEEFPD_S0.csv")
POUTPD_S0=read.csv("./macro/POUTPD_S0.csv")
MILKPD_S0=read.csv("./macro/POUTPD_S0.csv")
OILP_S0=read.csv("./macro/OILP_S0.csv")
RICEP_S0=read.csv("./macro/RICEP_S0.csv")
WHEAP_S0=read.csv("./macro/WHEAP_S0.csv")
SOYBP_S0=read.csv("./macro/SOYBP_S0.csv")
OTHGP_S0=read.csv("./macro/OTHGP_S0.csv")
CSTV_S0=read.csv("./macro/CSTV_S0.csv")
FERP_S0=read.csv("./macro/FERP_S0.csv")

PORKPD_S0=PORKPD_S0[,1:13]*10
BEEFPD_S0=BEEFPD_S0[,1:13]*10
POUTPD_S0=POUTPD_S0[,1:13]*10
MILKPD_S0=MILKPD_S0[,1:13]*10

#OILPBE_S0=read.csv("OILPBE_S0.csv")
#PGDPBE_S0=read.csv("PGDPBE_S0.csv")
#EXCHBE_S0=read.csv("EXCHBE_S0.csv")

OILPBE_S0_0=OILP_S0$YEAR
OILPBE_S0_1=OILP_S0$CHN
OILPBE_S0_2=OILP_S0$EUN
OILPBE_S0_3=OILP_S0$ROW
OILPBE_S0_4=OILP_S0$USA
OILPBE_S0_5=OILP_S0$BRA
OILPBE_S0_6=OILP_S0$IND
OILPBE_S0=cbind(OILPBE_S0_0,OILPBE_S0_1,OILPBE_S0_2,OILPBE_S0_3,OILPBE_S0_4,OILPBE_S0_5,OILPBE_S0_6)
colnames(OILPBE_S0) <- c('YEAR','CHN','EUN','ROW','USA','BRA','IND')
OILPBE_S0=data.frame(OILPBE_S0)

PGDPBE_S0_0=PGDP_S0$YEAR
PGDPBE_S0_1=PGDP_S0$CHN
PGDPBE_S0_2=PGDP_S0$EUN
PGDPBE_S0_3=PGDP_S0$ROW
PGDPBE_S0_4=PGDP_S0$USA
PGDPBE_S0_5=PGDP_S0$BRA
PGDPBE_S0_6=PGDP_S0$IND
PGDPBE_S0=cbind(PGDPBE_S0_0,PGDPBE_S0_1,PGDPBE_S0_2,PGDPBE_S0_3,PGDPBE_S0_4,PGDPBE_S0_5,PGDPBE_S0_6)
colnames(PGDPBE_S0) <- c('YEAR','CHN','EUN','ROW','USA','BRA','IND')
PGDPBE_S0=data.frame(PGDPBE_S0)

EXCHBE_S0_0=EXCH_S0$YEAR
EXCHBE_S0_1=EXCH_S0$CHN
EXCHBE_S0_2=EXCH_S0$EUN
EXCHBE_S0_3=EXCH_S0$ROW
EXCHBE_S0_4=EXCH_S0$USA
EXCHBE_S0_5=EXCH_S0$BRA
EXCHBE_S0_6=EXCH_S0$IND
EXCHBE_S0=cbind(EXCHBE_S0_0,EXCHBE_S0_1,EXCHBE_S0_2,EXCHBE_S0_3,EXCHBE_S0_4,EXCHBE_S0_5,EXCHBE_S0_6)
colnames(EXCHBE_S0) <- c('YEAR','CHN','EUN','ROW','USA','BRA','IND')
EXCHBE_S0=data.frame(EXCHBE_S0)

POP_S0=POP_S0*snr
PGDP_S0=PGDP_S0*snr
EXCH_S0=EXCH_S0*snr
PORKPD_S0=PORKPD_S0*snr
BEEFPD_S0=BEEFPD_S0*snr
POUTPD_S0=POUTPD_S0*snr
MILKPD_S0=MILKPD_S0*snr
OILP_S0=OILP_S0*snr
RICEP_S0=RICEP_S0*snr
WHEAP_S0=WHEAP_S0*snr
SOYBP_S0=SOYBP_S0*snr
OTHGP_S0=OTHGP_S0*snr
CSTV_S0=CSTV_S0*snr
FERP_S0=FERP_S0*snr
OILPBE_S0=OILPBE_S0*snr
PGDPBE_S0=PGDPBE_S0*snr
EXCHBE_S0=EXCHBE_S0*snr

# GMO
GMO_AA_S0=read.csv("./gmo/GMO_AA.csv")
GMO_YD_S0=read.csv("./gmo/GMO_YD.csv")