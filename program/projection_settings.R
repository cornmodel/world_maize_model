#SETTINGS ----
#STEP
STEP=1
#LOOP
i=1
#BEGINNING PRICE
PWD_CORN=matrix(100,12,1)
PWD_BE_ALL=matrix(100,12,1)
#EXO. VARIALBES
RICEP=data.matrix(RICEP_S0[i+gap,2:13])
WHEAP=data.matrix(WHEAP_S0[i+gap,2:13])
SOYBP=data.matrix(SOYBP_S0[i+gap,2:13])
OTHGP=data.matrix(OTHGP_S0[i+gap,2:13])
PINC=data.matrix(PGDP_S0[i+gap,2:13])
PGDP=data.matrix(PGDP_S0[i+gap,2:13])
POP=data.matrix(POP_S0[i+gap,2:13])
PORK_PD=data.matrix(PORKPD_S0[i+gap,2:13])
BEEF_PD=data.matrix(BEEFPD_S0[i+gap,2:13])
POUT_PD=data.matrix(POUTPD_S0[i+gap,2:13])
MILK_PD=data.matrix(MILKPD_S0[i+gap,2:13])
STVCN=data.matrix(CSTV_S0[i+gap,2:13])
FERP=data.matrix(FERP_S0[i+gap,2:13])
OILP=data.matrix(OILPBE_S0[i+gap,2:7])
PGDPBE=data.matrix(PGDPBE_S0[i+gap,2:7])

#PROJECTIONS SAVING
PDCORN_RESULT=matrix(0,N+1,12)
AA_RESULT=matrix(0,N+1,12)
YD_RESULT=matrix(0,N+1,12)
DMCORN_RESULT=matrix(0,N+1,12)
FOOD_RESULT=matrix(0,N+1,12)
FEED_RESULT=matrix(0,N+1,12)
PROC_RESULT=matrix(0,N+1,12)
SEED_RESULT=matrix(0,N+1,12)
LOSS_RESULT=matrix(0,N+1,12)
CSTV_RESULT=matrix(0,N+1,12)
NIMP_RESULT=matrix(0,N+1,12)

PD_RESULT=matrix(0,N+1,6)
DM_RESULT=matrix(0,N+1,6)
BESTV_RESULT=matrix(0,N+1,6)
NIMPBE_RESULT=matrix(0,N+1,6)

PWD_CORN_RESULT=matrix(0,N+1,12)
PWD_BE_ALL_RESULT=matrix(0,N+1,12)

CORN_PRICE_PCS_RESULT=matrix(0,N+1,12)
CORN_PRICE_PPD_RESULT=matrix(0,N+1,12)

BE_PRICE_BE_RESULT=matrix(0,N+1,6)

YEAR=matrix(0,N+1,1)
#BASE YEAR RESULTS
PDCORN_RESULT[1,]=t(data.matrix(CORN_BY$PDMAZ))
AA_RESULT[1,]=t(data.matrix(CORN_BY$AA))
YD_RESULT[1,]=t(data.matrix(CORN_BY$YD))
DMCORN_RESULT[1,]=t(data.matrix(CORN_BY$DOMMAZ))
FOOD_RESULT[1,]=t(data.matrix(CORN_BY$FOOD))
FEED_RESULT[1,]=t(data.matrix(CORN_BY$FEED))
PROC_RESULT[1,]=t(data.matrix(CORN_BY$PROC))
SEED_RESULT[1,]=t(data.matrix(CORN_BY$SEED))
LOSS_RESULT[1,]=t(data.matrix(CORN_BY$LOSS))
CSTV_RESULT[1,]=t(data.matrix(CORN_BY$STV))
NIMP_RESULT[1,]=t(data.matrix(CORN_BY$NETIMP))

PD_RESULT[1,]=t(data.matrix(BE_BY$PDBE))
DM_RESULT[1,]=t(data.matrix(BE_BY$DOMBE))
BESTV_RESULT[1,]=t(data.matrix(BE_BY$STV))
NIMPBE_RESULT[1,]=t(data.matrix(BE_BY$NETIMP))

PWD_CORN_RESULT[1,]=t(data.matrix(CORN_PRICE$PWD))
PWD_BE_ALL_RESULT[1,]=t(data.matrix(CORN_PRICE$PWDBE))

CORN_PRICE_PCS_RESULT[1,]=t(data.matrix(CORN_PRICE$PCS))
CORN_PRICE_PPD_RESULT[1,]=t(data.matrix(CORN_PRICE$PPD))

BE_PRICE_BE_RESULT[1,]=t(data.matrix(BE_PRICE$BE_PRICE_BE))

YEAR[1,]=by #BASE YEAR