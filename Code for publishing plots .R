#code for creating plots
#Forest plots: overall and sub group ----
    
png("overall forest.png", width=3600, height=1700, res=390)
forest.meta(metalogit, 
            comb.random = T, 
            comb.fixed = T, 
            leftlabs =c("Study", "PE", "Total.COVID-19"),
            colgap.forest = c("6 mm"))
dev.off()
   
png("subgroup analysis.png", width=3500, height=2200, res=390)
forest.meta(subgroup ,
            print.subgroup.labels = T,
            col.by = "Black", 
            comb.random = T,
            comb.fixed = T, 
            leftlabs =c("Study", "PE", "Total.COVID-19"),
            colgap.forest = c("6 mm"))
dev.off()

  
#meta regression plot ----
    
png("Meta-regression-LOGIT transformed.png", width=808, height=725, res=101)
yi <- -1/reg_plogit$yi
bubble(reg_plogit,
       main = "Meta-regression-LOGIT transformed incidence",
       xlab = "Study design",
       ylab = "LOGIT transformed incidences",
       # col = "yellow",
       col.line = "red",
       lwd = 2.7, lty = 1,
       #ylim = c(0.1,0.705),
       ylim = c(-3.66,-0.4),
       studlab = T,cex.studlab =1,pos.studlab = 4,
       offset = 1.2 , pch = 21, cex = yi*2)
dev.off()

    
png("Meta-regression-backtransformed.png", width=808, height=725, res=101)
    yi1 <- reg_raw$yi.f
bubble(reg_raw,           
       main = "Meta-regression-Backtransformed incidence",
       xlab = "Study design",
       ylab = "Back-transformed incidences",
       # col = "yellow",
       col.line = "blue",
       lwd = 2.7, lty = 1,
       #ylim = c(0.1,0.705),
       #ylim = c(-4,-0.4),
       studlab = T,cex.studlab =1,pos.studlab = 4,
       offset = 1.2 , pch = 21, cex = yi1*14)
dev.off()
