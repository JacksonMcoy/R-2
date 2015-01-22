Cleaned.contacts <- read.csv("C:/Users/Simon/Desktop/oander/Cleaned contacts.csv")

Cleaned.contacts$E.mail.Address<-as.character(Cleaned.contacts$E.mail.Address)

Cleaned.contacts$domain<-sapply(Cleaned.contacts$E.mail.Address, FUN=function(x) {strsplit(x, split='[@]')[[1]][2]})

library(dplyr)
Cleaned.contacts$domain<-as.factor(Cleaned.contacts$domain)
Grouped.contacts<-group_by(Cleaned.contacts,domain)

domain.list<-summarise(Grouped.contacts,popularity=length(Title))
domain.list<-arrange(domain.list,popularity)

home.domains<-domain.list$domain[512:521]

home.domains<-as.character(home.domains)
home.domains<-c(home.domains,"outlook.com","blueyounder.co.uk","msn.com","nltworld.com","tiscali.co.uk","live.com","mail.com")

personal<-rep(0,1257)
Cleaned.contacts<-cbind(Cleaned.contacts,personal)

Cleaned.contacts$personal[Cleaned.contacts$domain %in% home.domains] <- 1

write.csv(Cleaned.contacts,file="Personalemails.csv")