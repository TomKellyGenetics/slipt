detectSL <-
function(query, datasetx){
    if(query %in% colnames(datasetx)){
      query.datax<-datasetx[,match(query, colnames(datasetx))]

      aa<-apply(datasetx,2, function(x) chisq.test(table(query.datax, x)))
      chi.pv<-lapply(aa, function(x) x$p.value)
      ee<-lapply(aa, function(x) x$expected)
      oo<-lapply(aa, function(x) x$observed)
      synleth<-lapply(aa, function(x) ifelse(x$observed[1,1]<x$expected[1,1],1,0))
      #Format Data for Output in CSV
      kp<-cbind(names(chi.pv),
                colnames(datasetx)[match(names(chi.pv),colnames(datasetx))],
                unlist(lapply(oo,function(x) x[1,1])),
                unlist(lapply(ee,function(x) x[1,1])),
                unlist(lapply(oo,function(x) x[1,3])),
                unlist(lapply(ee,function(x) x[1,3])),
                unlist(synleth),unlist(chi.pv),
                unlist(p.adjust(chi.pv)),
                unlist(p.adjust(chi.pv, method="BH"))
      )[order(unlist(chi.pv)),]
      colnames(kp)<-c("Probe","Gene","ObsLow","ExpLow","ObsHigh",
                      "ExpHigh","SynLethal","rawPval","adjPval_holm", "adjPval_FDR")
      return(kp)
    }
    else return(list(head(rownames(dataset), n=nrow(dataset)), "Query gene not contained in the dataset. Please enter the gene symbol in UPPER CASE, examples are shown below. Please contact the curator, Tom Kelly, for more information: kelsi602@student.otago.ac.nz."))
  }
