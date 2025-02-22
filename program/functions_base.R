######F(X) ----
FX=function(PWD_CORN,PWD_BE_ALL){
  #PRICES ----
  I=matrix(1,12,1)
  CORN_PRICE_PCS=PWD_CORN*data.matrix(CORN_PRICE$EXCH)*(I+data.matrix(CORN_PRICE$DUTY)/100)
  CORN_PRICE_PPD=CORN_PRICE_PCS+data.matrix(CORN_PRICE$MI)*data.matrix(CORN_PRICE$EXCH)
  CORN_PRICE_ALL=cbind(CORN_PRICE_PCS,CORN_PRICE_PPD)
  CORN_PRICE_PCS=data.matrix(CORN_PRICE_ALL[,1])
  CORN_PRICE_PPD=data.matrix(CORN_PRICE_ALL[,2])
  BE_PRICE_CORN=data.matrix(CORN_PRICE_PCS[c(1,5,6,7,9,11),1])
  BE_PRICE_BE_ALL=PWD_BE_ALL*data.matrix(CORN_PRICE$EXCH)
  BE_PRICE_BE=data.matrix(BE_PRICE_BE_ALL[c(1,5,6,7,9,11),1])
  
  #AA/LOSS/SEED ----
  AA=exp(A_LNAA+CORN_AA_PPD*log(CORN_PRICE_PPD)+CORN_AA_RCE*t(log(RICEP))+CORN_AA_WHT*t(log(WHEAP))+CORN_AA_SYB*t(log(SOYBP))+CORN_AA_CG*t(log(OTHGP))+CORN_AA_FER*t(log(FERP)))
  LOSS=A_LOSS+CORN_LOSSRATE*AA
  SEED=A_SEED+CORN_SEEDRATE*AA
  #YD ----
  
  #YD=A_YD+data.matrix(YD_RESULT[i,])*(1+CORN_YD_TECH)
  YD=data.matrix(YD_RESULT[i,])*(1+CORN_YD_TECH)
  
  #PDCORN ----
  PDCORN=AA*YD/1000
  #PDCORN[1]=if (i<8) PDCORN[1] else AA[1]*5.78857*(i-7)/100*YD[1]*1.4418/1000+AA[1]*(100-5.78857*(i-7))/100*YD[1]/1000
  #PDCORN[1]=if (i<8) PDCORN[1] else PDCORN[1]+500
  
  #FOOD ----
  FOOD=exp(A_LNPFOOD+CORN_PFOOD_PCS*log(CORN_PRICE_PCS)+CORN_PFOOD_RCE*t(log(RICEP))+CORN_PFOOD_WHT*t(log(WHEAP))+CORN_PFOOD_CG*t(log(OTHGP))+CORN_PFOOD_PINC*t(log(PINC)))*t(POP)/1000
  
  #FEED ----
  FEED=A_FEED+CORN_FEED_PDPK*t(PORK_PD)+CORN_FEED_PDBF*t(BEEF_PD)+CORN_FEED_PDPT*t(POUT_PD)+CORN_FEED_PDMK*t(MILK_PD)
  
  #CSTV ----
  CSTV=t(STVCN)
  
  #PD ----
  CORNP=data.matrix(BE_PRICE_CORN)
  BEP=data.matrix(BE_PRICE_BE)
  PD=exp(A_LNPD+BE_PD_POIL*t(log(OILP))+BE_PD_PMZ*log(CORNP)+BE_PD_PBE*log(BEP))
  
  #DM ----
  DM=exp(A_LNDM+BE_DM_POIL*t(log(OILP))+BE_DM_PBE*log(BEP)+BE_DM_PGDP*t(log(PGDPBE)))
  
  #PROD ----
  PROC=A_PROC+exp(CORN_PROC_PGDP*t(log(PGDP)))
  PROC[1]=PROC[1]+PD[1]/300*100*0.7
  PROC[5]=PROC[5]+PD[2]/400*100*0.5
  PROC[6]=PROC[6]+PD[3]/400*100*0.5
  PROC[7]=PROC[7]+PD[4]/400*100*0.58
  
  #DMCORN ----
  DMCORN=FOOD+PROC+FEED+SEED+LOSS+CSTV
  
  #Constraints ----
  #Constraints begin
  #repeat {
  #ck1=DMCORN[1]
  #PROC[1]=if (PROC[1]/DMCORN[1]<0.3212) PROC[1] else DMCORN[1]*0.3212
  #DMCORN=FOOD+PROC+FEED+SEED+LOSS+CSTV
  #ck2=DMCORN[1]
  #delta_ck=ck2-ck1
  #if (abs(delta_ck)<0.01){
  #  break
  #}
  #}
  #Constraints end
  
  #NIMP ----
  NIMP=DMCORN-PDCORN
  delta1=colSums(NIMP)
  NIMPBE=DM-PD
  
  delta2=colSums(NIMPBE)
  delta=cbind(delta1,delta2)
  result=list(delta,PDCORN,AA,YD,DMCORN,FOOD,PROC,FEED,SEED,LOSS,CSTV,NIMP,PD,DM,NIMPBE,PWD_CORN,PWD_BE_ALL,CORN_PRICE_PCS,CORN_PRICE_PPD,BE_PRICE_BE)
  return(result)
}