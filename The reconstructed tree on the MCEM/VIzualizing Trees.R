library(png)
library(dmea)
setwd("~/Dropbox/Reports/Images/The reconstructed tree on the MCEM")
logo <- readPNG("images.png")
logo2 <- as.raster(logo)
r <- nrow(logo2)/ncol(logo2) # aspect ratio
s <- 0.1 # symbol size

#library(ape)
rec1 = '((B:1,A:1):1,(F:1,C:1.5):0.5):0.5;'
rec1 = read.tree(text = rec1)
#plot(rec1,show.tip.label = F,edge.color = c("black","black","black","black","darkgreen","black"),edge.width = 2,edge.lty = c(rep(1,4),4,1))
par(mar=c(3,1,3,2))
# display plot to obtain its size
plot(rec1, edge.color = c("black","black","black","black","black","black"),
     edge.width = 2, edge.lty = c(rep(1,4),1,1),show.tip.label = F, root.edge = T)
lims <- par("usr") # plot area size
file_r <- (lims[2]-lims[1]) / (lims[4]-lims[3]) # aspect ratio for the file
file_s <- 480   # file size

# save tree with added symbol
png("tree_logo.png", height=file_s, width=file_s*file_r)
plot(rec1, show.tip.label = F,
     edge.color = c("black","black","black","black","black","black"),
     edge.width = 2, edge.lty = c(rep(1,4),1,1))
dev.off()
rasterImage(logo2, 2.03, 2.96, 2.03+s/r, 2.96+s)
# add axis
#axisPhylo()
axis(side=1,at=c(0,0.5,1,1.5,2,2.5),labels = FALSE,tck=0.01)

mtext(expression(Delta*italic("t")["1"]), at = 0.25, side = 1,line = 1)
mtext(expression(Delta*italic("t")["2,1"]), at = 0.75, side = 1,line = 1)
mtext(expression(Delta*italic("t")["2,2"]), at = 1.25, side = 1,line = 1)
mtext(expression(Delta*italic("t")["3,1"]), at = 1.75, side = 1,line = 1)
mtext(expression(Delta*italic("t")["3,2"]), at = 2.25, side = 1,line = 1)
points(x=2,y=3,pch = 21:25,bg=25)
points(x=2.5,y=4,pch = 21:25,bg=25)
points(x=2.5,y=1,pch = 21:25,bg=25)
points(x=2.5,y=2,pch = 21:25,bg=25)
points(x=0.5,y=0.87,pch = 21:25,bg=25)






# complete/incomplete trees
comp = '((AB:1,(AA:0.6,AD:0.3):0.4):1,((AE:0.6,AF:0.8):0.2,AC:1.5):0.5):0.5;'
comp= read.tree(text = comp)
#plot(comp,show.tip.label = T, root.edge = TRUE)
rec1 = drop.fossil(comp)

par(mar=c(3,1,3,2))
# display plot to obtain its size
plot(rec1, edge.width = 2, show.tip.label = F, root.edge = T)
lims <- par("usr") # plot area size
file_r <- (lims[2]-lims[1]) / (lims[4]-lims[3]) # aspect ratio for the file
file_s <- 480   # file size

# save tree with added symbol
#png("tree_logo.png", height=file_s, width=file_s*file_r)
plot(rec1, show.tip.label = F,
     edge.color = c("black","black","black","black","black","black"),
     edge.width = 2, edge.lty = c(rep(1,4),1,1), root.edge = T)
#dev.off()
#rasterImage(logo2, 2.03, 2.93, 2.03+s/r, 2.93+s)
# add axis
#axisPhylo()
axis(side=1,at=c(0,0.5,1.5,2.5),labels = FALSE)

mtext(expression(Delta*italic("t")["1"]), at = 0.25, side = 1,line = 1)
mtext(expression(Delta*italic("t")["2"]), at = 1, side = 1,line = 1)
mtext(expression(Delta*italic("t")["3"]), at = 2, side = 1,line = 1)
#mtext(expression(Delta*italic("t")["4"]), at = 1.75, side = 1,line = 1)
#mtext(expression(Delta*italic("t")["5"]), at = 2.25, side = 1,line = 1)
#points(x=2,y=3,pch = 21:25,bg=25)
points(x=2.5,y=3,pch = 21:25,bg=25)
points(x=2.5,y=1,pch = 21:25,bg=25)
points(x=2.5,y=2,pch = 21:25,bg=25)

