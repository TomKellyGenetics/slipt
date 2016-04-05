table_of_SL <-
function(x, significance = "fdr"){
  if(significance == "holm"){
    x[(x[,7]=="1" & as.numeric(x[,9])<0.05), ] #SL interactions & Holm Sig
  } else if(significance == "fdr"){
    x[(x[,7]=="1" & as.numeric(x[,10])<0.05), ] #SL interactions & FDR Sig
  } else if(significance == "raw"){
    x[(x[,7]=="1" & as.numeric(x[,8])<0.05), ] #SL interactions & raw Sig
  } else if(significance == "none" | is.null(significance) | missing(significance) | is.na(significance)){
    x[x[,7]=="1", ] #SL interactions without signficance
  } else if(significance %in% p.adjust.methods){
    x[(x[,7]=="1" & p.adjust(as.numeric(x[,8]), method = significance)<0.05), ] #SL interactions & custom Sig adjust
  } else {
    warning("Please give a valid significance condition: none, raw, or a valid method for p.adjust()")
  }
}
