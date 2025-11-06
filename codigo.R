library(rio)
link1="https://github.com/MAGALLANESJoseManuel/examen/raw/refs/heads/main/reporte1.xlsx"
vivi=import(link1,skip=5,thousands=" ")

vivi=vivi[,-1]

vivi=vivi[complete.cases(vivi),]

str(vivi)

tail(names(vivi),5)

apply(vivi[,tail(names(vivi),5)],1,sum)

vivi$totalStatus= apply(vivi[,tail(names(vivi),5)],1,sum)

vivi$totalElec=vivi[,3]+vivi[,4]

grep("habi",names(vivi))

habis=grep("habi",names(vivi))

vivi$totalHabi=apply(vivi[,habis],1,sum)

vivi$vulneElec=vivi$`No tiene alumbrado eléctrico`/vivi$totalElec
vivi$vulneHab=vivi$`1 habitación`/vivi$totalHabi
vivi$vulneStatus=vivi$`Propia sin título de propiedad`/vivi$totalStatus

vulnes=grep("vulne",names(vivi))
summary(vivi[,vulnes])

vivivulne=vivi[,c(1,2,vulnes)]
