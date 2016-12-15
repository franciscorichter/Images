library(png)
library(dmea)
setwd("~/Dropbox/Reports/Images/The reconstructed tree on the MCEM")
logo <- readPNG("images.png")
logo2 <- as.raster(logo)
r <- nrow(logo2)/ncol(logo2) # aspect ratio
s <- 0.15 # symbol size

#library(ape)
rec1 = '((B:1,A:1):1,(F:1,C:1.5):0.5):0.5;'
rec1 = read.tree(text = rec1)
#plot(rec1,show.tip.label = F,edge.color = c("black","black","black","black","darkgreen","black"),edge.width = 2,edge.lty = c(rep(1,4),4,1))
par(mar=c(3,1,3,2))
# display plot to obtain its size
plot(rec1, edge.color = c("black","black","black","black","black","black"),
     edge.width = 2, edge.lty = c(rep(1,4),4,1),show.tip.label = F, root.edge = T)
lims <- par("usr") # plot area size
file_r <- (lims[2]-lims[1]) / (lims[4]-lims[3]) # aspect ratio for the file
file_s <- 480   # file size

# save tree with added symbol
png("tree_logo.png", height=file_s, width=file_s*file_r)
plot(rec1, show.tip.label = F,
     edge.color = c("black","black","black","black","black","black"),
     edge.width = 2, edge.lty = c(rep(1,4),4,1))
dev.off()
rasterImage(logo2, 1.53, 2.93, 1.53+s/r, 2.93+s)
# add axis
#axisPhylo()
axis(side=1,at=c(0,0.5,1,1.5,2),labels = FALSE)
mtext(expression(Delta*italic("t")["1"]), at = 0.25, side = 1,line = 1)
mtext(expression(Delta*italic("t")["2"]), at = 0.75, side = 1,line = 1)
mtext(expression(Delta*italic("t")["3"]), at = 1.25, side = 1,line = 1)
mtext(expression(Delta*italic("t")["4"]), at = 1.75, side = 1,line = 1)

points(x=1.51,y=3,pch = 21:25,bg=25)
points(x=2,y=4,pch = 21:25,bg=25)
points(x=2,y=1,pch = 21:25,bg=25)
points(x=2,y=2,pch = 21:25,bg=25)

