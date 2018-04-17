### For each of the feature look at the distribution when people have diabetes or not

features  = colnames(diabetes)[1:8]

barplot.ttest<-function(x,y,feature.name){
  ## x is feature's value
  ## y is the target (0 for no diabetes, 1 for diabetes)
  tmp.df = data.frame(value = x, Type=ifelse(y==1,"Diabetes","Normal"))
  tmp.df$Type = factor(tmp.df$Type,levels = c("Normal","Diabetes"))
  
  ## Doing both T-test and wilcox test ##
  rr = t.test(value~Type,data=tmp.df)
  rr2 = wilcox.test(value~Type,data=tmp.df)
  
  pvalue = round(rr$p.value,5)
  pvalue.wilcox = round(rr2$p.value,5)
  
  fc = round(rr$estimate[2]/rr$estimate[1],1)  ## Use mean
  tt = tmp.df %>% group_by(Type) %>%  
    summarise(median = median(value),ave = mean(value))
  fc.median = round(tt$median[2]/tt$median[1],1)
  
  ttext=paste0("P-Value(Rank sum):",pvalue.wilcox,"\n",
               "P-Value(t test):",pvalue,"\n",
               "Fold Change(mean):",fc,"\n",
               "Fold Change(median):",fc.median)
  
  
  md = tmp.df %>% group_by(Type) %>%
    summarise(N=n(),avg.exp=mean(value),
              sd=sd(value),
              se =sd(value)/sqrt(n())) %>%
    mutate(ci = se * qt(0.95/2+0.5,N-1))
  
  ymax = max(md$avg.exp+md$se)
  
  gg_color_hue <- function(n) {
    hues = seq(15, 375, length = n + 1)
    hcl(h = hues, l = 65, c = 100)[1:n]
  }  
  
  p =  ggplot(md, aes(x=Type, y=avg.exp, fill=Type)) + 
    geom_bar(position=position_dodge(), stat="identity",width = 0.5) +
    geom_errorbar(aes(ymin=avg.exp-se, ymax=avg.exp+se),
                  width=.1,                    # Width of the error bars
                  position=position_dodge(.9)) + 
    geom_text(x=.5,y=ymax/1.2,label=ttext,color='black',hjust=0,parse = FALSE)+
    ggtitle(feature.name)+
    xlab("") + ylab(label = "value") +
    scale_fill_manual(values=gg_color_hue(2)[2:1])+
    theme(axis.text=element_text(size=12),
          axis.title=element_text(size=14,face="bold"),
          legend.text=element_text(size=12))+labs(fill="")
  print(p)
}


for(f in features){
  barplot.ttest(x = diabetes[,f],diabetes$Outcome,f)
}
