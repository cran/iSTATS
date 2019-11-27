
refreshval <- function() {


  #############  PLOT_INTERATIVO_SERVER.R RESET  #############

  peran_multi <- 0

  chkzoom_multi <- 1

  idb_multi <- 0

  testy_multi <<- data.frame(Chemical_Shift=CS_values_real[1,],Spectrum=NMRData[1,])

  ranges_multi$x <<- c(min(CS_values_real[1,]),(max(CS_values_real[1,])))

  ##############################################################################


  #############  SELECT_SIGNALS_SERVER.R RESET  #############

  NMRData <- NMRData

  NMRData_Mean <- colMeans(NMRData[,])

  spectrums$dat <- data.frame(Chemical_Shift=CS_values_real[1,],Spectrum=(NMRData_Mean[]))

  spectrums_sel$dat <- data.frame(Chemical_Shift=CS_values_real[1,],Spectrum=(NMRData_Mean[]))

  CS_selection$vranges <- c(-13131313,-131313)

  testy <<- data.frame(Chemical_Shift=CS_values_real[1,],Spectrum=NMRData_Mean[])

  col_select <- c()

  alr_click <- 0

  sel_ind <- 0

  peran <- 0

  exran <- c()

  exp_click <- 0

  ysup <- max(testy$Spectrum)

  yinf <- ysup*-0.03

  ysup <- ysup + ysup*0.03

  ranges_sel$y <- c(yinf, ysup)

  ranges_sel$x <- c(min(CS_values_real[1,]),(max(CS_values_real[1,])))

  ranges$y <- c(yinf, ysup)

  ranges$x <- c(min(CS_values_real[1,]),(max(CS_values_real[1,])))

  cor_cutoff <- 0.8

  ##############################################################################


  #############  STOCSY_I_SERVER.R RESET  #############

  ncor <-  1

  rr <- c()

  peran_stocsy_i <- 0

  chkzoom_stocsy_i <- 1

  idb_stocsy_i <- 0

  testy_stocsy_i <<- data.frame(Chemical_Shift=CS_values_real[1,])

  ranges_stocsy_i$x <- c(min(CS_values_real[1,]),(max(CS_values_real[1,])))

  facts <<- reactiveValues(fac_stocsy_i = c())

  ##############################################################################


  #############  STOCSY_IS_SERVER.R RESET  #############

  ncor <-  1

  Scaling_cor <- matrix()

  rr_is <- c()

  peran_stocsy_is <- 0

  chkzoom_stocsy_is <- 1

  idb_stocsy_is <- 0

  testy_stocsy_is <<- data.frame(Chemical_Shift=CS_values_real[1,])

  ranges_stocsy_is$x <- c(min(CS_values_real[1,]),(max(CS_values_real[1,])))

  facts_is <<- reactiveValues(fac_stocsy_is = c())

  ##############################################################################


  #############  STOCSY_RT_SERVER.R RESET  #############

  ncor_rt <-  1

  rr_rt <<- c()

  peran_stocsy_rt <- 0

  chkzoom_stocsy_rt <- 1

  idb_stocsy_rt <- 0

  testy_stocsy_rt <<- data.frame(Chemical_Shift=CS_values_real[1,])

  ranges_stocsy_rt$x <- c(min(CS_values_real[1,]),(max(CS_values_real[1,])))

  facts_rt <<- reactiveValues(fac_stocsy_rt = c())

  ##############################################################################

}
