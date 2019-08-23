
dc <- c()

file_names <- c()

NMRData <- matrix(0, 2,2)

CS_values_real <- matrix(0, 2,2)


onStop(function() {

  message("Stopping iSTATS ...\n")

  clear_list <- c("CS_selection","gg","gr","buma","CS_values_real",
                  "facts","facts_is","facts_rt","NMRData","Scaling_cor",
                  "testy","testy_multi","testy_stocsy_i","alr_click",
                  "chkzoom","chkzoom_multi","chkzoom_stocsy_i","chkzoom_stocsy_is",
                  "chkzoom_stocsy_rt", "col_select","cor_cutoff","cor_cutoff_i",
                  "cor_cutoff_rt","dc","exp_click","exran","file_names","idb",
                  "idb_multi","idb_stocsy_i","idb_stocsy_is","idb_stocsy_rt",
                  "ncor","ncor_rt","ndpi","ndpis","peran_multi","peran_stocsy_i",
                  "peran_stocsy_is","peran_stocsy_rt","rr","rr_is","rr_rt","sel_ind",
                  "value","cor_pearson","cor_spearman","matr_cor","matr_selec",
                  "pos_map","reg_selec","up","upfile","col_select_2","CS_sel_real",
                  "CS_values","drv_pk","file_names_full","file_names_full",
                  "peran_sel","s_ind","z","das_multi","das_stocsy_i","das_stocsy_is",
                  "das_stocsy_rt","drv_pk_ois","drv_pk_oi","drv_pk_ort","s","tryton")

suppressWarnings(
  suppressMessages({
    garb <- try(sapply(clear_list, function(x) if (exists(x, envir = .GlobalEnv)) rm(list = x, envir = .GlobalEnv)), silent = TRUE)
    rm(garb)
  })
)

stopApp()

})
