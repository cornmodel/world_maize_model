## NEWTON ----

for(i in 1:N){
  #i=1 #ONLY FOR TEST
  cat("i=",i,sep = "") 
  #EXO. VARIALBES ----
  RICEP=data.matrix(RICEP_S0[i+gap,2:13])
  WHEAP=data.matrix(WHEAP_S0[i+gap,2:13])
  SOYBP=data.matrix(SOYBP_S0[i+gap,2:13])
  OTHGP=data.matrix(OTHGP_S0[i+gap,2:13])
  FERP=data.matrix(FERP_S0[i+gap,2:13])
  PINC=data.matrix(PGDP_S0[i+gap,2:13])
  PGDP=data.matrix(PGDP_S0[i+gap,2:13])
  POP=data.matrix(POP_S0[i+gap,2:13])
  PORK_PD=data.matrix(PORKPD_S0[i+gap,2:13])
  BEEF_PD=data.matrix(BEEFPD_S0[i+gap,2:13])
  POUT_PD=data.matrix(POUTPD_S0[i+gap,2:13])
  MILK_PD=data.matrix(MILKPD_S0[i+gap,2:13])
  STVCN=data.matrix(CSTV_S0[i+gap,2:13])
  GMO_AA=data.matrix(GMO_AA_S0[i+gap,2:13])
  GMO_YD=data.matrix(GMO_YD_S0[i+gap,2:13])
  OILP=data.matrix(OILPBE_S0[i+gap,2:7])
  PGDPBE=data.matrix(PGDPBE_S0[i+gap,2:7])
  #BEGINNING PRICE ----
  PWD_CORN=data.matrix(PWD_CORN_RESULT[i,])
  PWD_BE_ALL=data.matrix(PWD_BE_ALL_RESULT[i,])
  #REPEAT ----
  repeat {
    result=FX(PWD_CORN,PWD_BE_ALL)
    delta=result[[1]]
    delta1=delta[1,1]
    delta2=delta[1,2]
    ##Jacobian
    dp=matrix(0,2,2)
    J=matrix(0,2,2)
    dp[1,1]=1/2*STEP
    dp[2,2]=1/2*STEP
    #Price->Price0
    PWD_CORN0=PWD_CORN
    PWD_BE_ALL0=PWD_BE_ALL
    #1 F(p+dp)
    PWD_CORN=PWD_CORN0+dp[1,1]
    PWD_BE_ALL=PWD_BE_ALL0+dp[1,2] 
    result_plus=FX(PWD_CORN,PWD_BE_ALL)
    delta_plus=result_plus[[1]]
    #1 F(p-dp)
    PWD_CORN=PWD_CORN0-dp[1,1]
    PWD_BE_ALL=PWD_BE_ALL0-dp[1,2] 
    result_minus=FX(PWD_CORN,PWD_BE_ALL)
    delta_minus=result_minus[[1]]
    #df
    df=t(data.matrix(delta_plus))-t(data.matrix(delta_minus))/STEP
    J[,1]=df
    #2 F(p+dp)
    PWD_CORN=PWD_CORN0+dp[2,1]
    PWD_BE_ALL=PWD_BE_ALL0+dp[2,2] 
    result_plus=FX(PWD_CORN,PWD_BE_ALL)
    delta_plus=result_plus[[1]]
    #2 F(p-dp)
    PWD_CORN=PWD_CORN0-dp[2,1]
    PWD_BE_ALL=PWD_BE_ALL0-dp[2,2] 
    result_minus=FX(PWD_CORN,PWD_BE_ALL)
    delta_minus=result_minus[[1]]
    #df
    df=t(data.matrix(delta_plus))-t(data.matrix(delta_minus))/STEP
    J[,2]=df
    #Inverse J
    iJ=solve(J)
    #F0
    F0=t(data.matrix(delta))
    #NEW P
    NEWP=iJ%*%F0
    PWD_CORN=PWD_CORN0-NEWP[1,1]
    PWD_BE_ALL=PWD_BE_ALL0-NEWP[2,1]
    cat("delta1=",abs(delta1),sep = "") 
    cat("delta2=",abs(delta2),sep = "") 
    if (abs(delta1)<0.01&abs(delta2)<0.01){
      break
    }
  }
  #SAVE YEARLY RESULTS ----
  PDCORN=result[[2]]
  AA=result[[3]]
  YD=result[[4]]
  DMCORN=result[[5]]
  FOOD=result[[6]]
  PROC=result[[7]]
  FEED=result[[8]]
  SEED=result[[9]]
  LOSS=result[[10]]
  CSTV=result[[11]]
  NIMP=result[[12]]
  PD=result[[13]]
  DM=result[[14]]
  NIMPBE=result[[15]]
  PWD_CORN=result[[16]]
  PWD_BE_ALL=result[[17]]
  CORN_PRICE_PCS=result[[18]]
  CORN_PRICE_PPD=result[[19]]
  BE_PRICE_BE=result[[20]]
  
  PDCORN_RESULT[i+1,]=roundup(t(PDCORN),2)
  AA_RESULT[i+1,]=roundup(t(AA),2)
  YD_RESULT[i+1,]=roundup(t(YD),2)
  DMCORN_RESULT[i+1,]=roundup(t(DMCORN),2)
  FOOD_RESULT[i+1,]=roundup(t(FOOD),2)
  PROC_RESULT[i+1,]=roundup(t(PROC),2)
  FEED_RESULT[i+1,]=roundup(t(FEED),2)
  SEED_RESULT[i+1,]=roundup(t(SEED),2)
  LOSS_RESULT[i+1,]=roundup(t(LOSS),2)
  CSTV_RESULT[i+1,]=roundup(t(CSTV),2)
  NIMP_RESULT[i+1,]=roundup(t(NIMP),2)
  
  PD_RESULT[i+1,]=roundup(t(PD),2)
  DM_RESULT[i+1,]=roundup(t(DM),2)
  NIMPBE_RESULT[i+1,]=roundup(t(NIMPBE),2)
  
  PWD_CORN_RESULT[i+1,]=roundup(t(PWD_CORN),2)
  PWD_BE_ALL_RESULT[i+1,]=roundup(t(PWD_BE_ALL),2)
  CORN_PRICE_PCS_RESULT[i+1,]=roundup(t(CORN_PRICE_PCS),2)
  CORN_PRICE_PPD_RESULT[i+1,]=roundup(t(CORN_PRICE_PPD),2)
  BE_PRICE_BE_RESULT[i+1,]=roundup(t(BE_PRICE_BE),2)
  YEAR[i+1,]=by+i
}