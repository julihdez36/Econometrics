setwd("C:/Users/Julian_Hdez/Desktop/Especializai�n econometr�a/Fundamentos de programaci�n/Taller/Bases")
getwd()

list.files()

library(readr)

#--------------------------------------------2017 Ocupados----------------------------------------------

abril_ocup_2017 <- read_delim("2017 Abril Ocupados.txt","\t", escape_double = FALSE, trim_ws = TRUE) 
agosto_ocup_2017 <- read_delim("2017 Agosto Ocupados.txt","\t", escape_double = FALSE, trim_ws = TRUE)
diciembre_ocup_2017 <- read_delim("2017 Diciembre Ocupados.txt","\t", escape_double = FALSE, trim_ws = TRUE)
enero_ocup_2017 <- read_delim("2017 Enero Ocupados.txt","\t", escape_double = FALSE, trim_ws = TRUE)
febrero_ocup_2017 <- read_delim("2017 Febrero Ocupados.txt","\t", escape_double = FALSE, trim_ws = TRUE)
julio_ocup_2017 <- read_delim("2017 Julio Ocupados.txt","\t", escape_double = FALSE, trim_ws = TRUE)
junio_ocup_2017 <- read_delim("2017 Junio Ocupados.txt","\t", escape_double = FALSE, trim_ws = TRUE)
marzo_ocup_2017 <- read_delim("2017 Marzo Ocupados.txt","\t", escape_double = FALSE, trim_ws = TRUE)
mayo_ocup_2017 <- read_delim("2017 Mayo Ocupados.txt","\t", escape_double = FALSE, trim_ws = TRUE)
noviembre_ocup_2017 <- read_delim("2017 Noviembre Ocupados.txt","\t", escape_double = FALSE, trim_ws = TRUE)
octubre_ocup_2017 <- read_delim("2017 Octubre Ocupados.txt","\t", escape_double = FALSE, trim_ws = TRUE)
septiembre_ocup_2017 <- read_delim("2017 Septiembre Ocupados.txt","\t", escape_double = FALSE, trim_ws = TRUE)

#------------------------------------------Punto 4----------------------------------------------------
#----------------------------------Base con variables de interés--------------------------------------

enero_ocup_2017_2 <- enero_ocup_2017[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                        "P7020", "P760", "P7028", "RAMA4D", "RAMA4DP8", "RAMA2DP8", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                        "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]
febrero_ocup_2017_2 <- febrero_ocup_2017[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                        "P7020", "P760", "P7028", "RAMA4D", "RAMA4DP8", "RAMA2DP8", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                        "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]
marzo_ocup_2017_2 <- marzo_ocup_2017[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                        "P7020", "P760", "P7028", "RAMA4D", "RAMA4DP8", "RAMA2DP8", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                        "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]
abril_ocup_2017_2 <- abril_ocup_2017[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                        "P7020", "P760", "P7028", "RAMA4D", "RAMA4DP8", "RAMA2DP8", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                        "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]
mayo_ocup_2017_2 <- mayo_ocup_2017[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                        "P7020", "P760", "P7028", "RAMA4D", "RAMA4DP8", "RAMA2DP8", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                        "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]
junio_ocup_2017_2 <- junio_ocup_2017[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                        "P7020", "P760", "P7028", "RAMA4D", "RAMA4DP8", "RAMA2DP8", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                        "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]
julio_ocup_2017_2 <- julio_ocup_2017[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                        "P7020", "P760", "P7028", "RAMA4D", "RAMA4DP8", "RAMA2DP8", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                        "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]
agosto_ocup_2017_2 <- agosto_ocup_2017[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                        "P7020", "P760", "P7028", "RAMA4D", "RAMA4DP8", "RAMA2DP8", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                        "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]
septiembre_ocup_2017_2 <- septiembre_ocup_2017[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                        "P7020", "P760", "P7028", "RAMA4D", "RAMA4DP8", "RAMA2DP8", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                        "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]
octubre_ocup_2017_2 <- octubre_ocup_2017[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                        "P7020", "P760", "P7028", "RAMA4D", "RAMA4DP8", "RAMA2DP8", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                        "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]
noviembre_ocup_2017_2 <- noviembre_ocup_2017[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                        "P7020", "P760", "P7028", "RAMA4D", "RAMA4DP8", "RAMA2DP8", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                        "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]
diciembre_ocup_2017_2 <- diciembre_ocup_2017[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                        "P7020", "P760", "P7028", "RAMA4D", "RAMA4DP8", "RAMA2DP8", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                        "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]

base_ocup_2017 <- rbind(abril_ocup_2017_2, agosto_ocup_2017_2, diciembre_ocup_2017_2, enero_ocup_2017_2, febrero_ocup_2017_2,
                        julio_ocup_2017_2, junio_ocup_2017_2, marzo_ocup_2017_2, mayo_ocup_2017_2, noviembre_ocup_2017_2, octubre_ocup_2017_2,
                        septiembre_ocup_2017_2)

rm(abril_ocup_2017, agosto_ocup_2017, diciembre_ocup_2017, enero_ocup_2017, febrero_ocup_2017,
   julio_ocup_2017, junio_ocup_2017, marzo_ocup_2017, mayo_ocup_2017, noviembre_ocup_2017, octubre_ocup_2017,
   septiembre_ocup_2017,abril_ocup_2017_2, agosto_ocup_2017_2, diciembre_ocup_2017_2, enero_ocup_2017_2, febrero_ocup_2017_2,
   julio_ocup_2017_2, junio_ocup_2017_2, marzo_ocup_2017_2, mayo_ocup_2017_2, noviembre_ocup_2017_2, octubre_ocup_2017_2,
   septiembre_ocup_2017_2)

#------------------------------------------------Punto 5----------------------------------------------
#---------------------------------Asignación de nombres a las variables-------------------------------

nombres_ocup <- c("Directorio", "Secuencia_P", "Orden", "Hogar", "Regis", "Area", "Departamento", 
                  "Contrato", "Verbal", "Termino", "Salario", "Meses_Trabajo", "Horas_Extras",
                  "Trabajo_Antes", "Tiempo_Bus", "Clasi_Tra", "Rama4D", "Rama4DP8", "Rama2DP8", 
                  "INGLABO", "Mes", "DPTO", "fex_c_2011", "Eco_Vejez", "Pen_Obligatoria", "Pen_Voluntaria",
                  "Ahorro", "Inversiones", "Seguro", "Hijos", "Otro", "Cual", "Nada")

colnames(base_ocup_2017) <- nombres_ocup

#-----------------------------------------Características----------------------------------------------

abril_carac_2017 <- read_delim("2017 Abril Caracteristicas.txt","\t", escape_double = FALSE, trim_ws = TRUE) 
agosto_carac_2017 <- read_delim("2017 Agosto Caracteristicas.txt","\t", escape_double = FALSE, trim_ws = TRUE)
diciembre_carac_2017 <- read_delim("2017 Diciembre Caracteristicas.txt","\t", escape_double = FALSE, trim_ws = TRUE)
enero_carac_2017 <- read_delim("2017 Enero Caracteristicas.txt","\t", escape_double = FALSE, trim_ws = TRUE)
febrero_carac_2017 <- read_delim("2017 Febrero Caracteristicas.txt","\t", escape_double = FALSE, trim_ws = TRUE)
julio_carac_2017 <- read_delim("2017 Julio Caracteristicas.txt","\t", escape_double = FALSE, trim_ws = TRUE)
junio_carac_2017 <- read_delim("2017 Junio Caracteristicas.txt","\t", escape_double = FALSE, trim_ws = TRUE)
marzo_carac_2017 <- read_delim("2017 Marzo Caracteristicas.txt","\t", escape_double = FALSE, trim_ws = TRUE)
mayo_carac_2017 <- read_delim("2017 Mayo Caracteristicas.txt","\t", escape_double = FALSE, trim_ws = TRUE)
noviembre_carac_2017 <- read_delim("2017 Noviembre Caracteristicas.txt","\t", escape_double = FALSE, trim_ws = TRUE)
octubre_carac_2017 <- read_delim("2017 Octubre Caracteristicas.txt","\t", escape_double = FALSE, trim_ws = TRUE)
septiembre_carac_2017 <- read_delim("2017 Septiembre Caracteristicas.txt","\t", escape_double = FALSE, trim_ws = TRUE)

enero_carac_2017_2 <- enero_carac_2017[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                        "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]
febrero_carac_2017_2 <- febrero_carac_2017[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                            "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]
marzo_carac_2017_2 <- marzo_carac_2017[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                        "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]
abril_carac_2017_2 <- abril_carac_2017[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                        "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]
mayo_carac_2017_2 <- mayo_carac_2017[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                      "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]
junio_carac_2017_2 <- junio_carac_2017[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                        "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]
julio_carac_2017_2 <- julio_carac_2017[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                        "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]
agosto_carac_2017_2 <- agosto_carac_2017[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                          "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]
septiembre_carac_2017_2 <- septiembre_carac_2017[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                                  "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]
octubre_carac_2017_2 <- octubre_carac_2017[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                            "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]
noviembre_carac_2017_2 <- noviembre_carac_2017[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                                "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]
diciembre_carac_2017_2 <- diciembre_carac_2017[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                                "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]

base_carac_2017 <- rbind(abril_carac_2017_2, agosto_carac_2017_2, diciembre_carac_2017_2, enero_carac_2017_2, febrero_carac_2017_2,
                        julio_carac_2017_2, junio_carac_2017_2, marzo_carac_2017_2, mayo_carac_2017_2, noviembre_carac_2017_2, octubre_carac_2017_2,
                        septiembre_carac_2017_2)

rm(abril_carac_2017, agosto_carac_2017, diciembre_carac_2017, enero_carac_2017, febrero_carac_2017,
   julio_carac_2017, junio_carac_2017, marzo_carac_2017, mayo_carac_2017, noviembre_carac_2017, octubre_carac_2017,
   septiembre_carac_2017,abril_carac_2017_2, agosto_carac_2017_2, diciembre_carac_2017_2, enero_carac_2017_2, febrero_carac_2017_2,
   julio_carac_2017_2, junio_carac_2017_2, marzo_carac_2017_2, mayo_carac_2017_2, noviembre_carac_2017_2, octubre_carac_2017_2,
   septiembre_carac_2017_2)

nombres_carac <- c("Directorio", "Secuencia_P", "Orden", "Hogar", "Regis","Sexo", "Edad", "Est_Civil", 
                   "Sabe_Leer", "Nivel_Alcanzado","Titulo_Academico", "Area", "Años_Educ", "Mes", "DPTO", "fex_c_2011")

colnames(base_carac_2017) <- nombres_carac


#-----------------------------------------------Punto 6--------------------------------------------------
#---------------------------------Llave Área Características y Ocupados--------------------------------

base_carac_2017$Llave <- paste(base_carac_2017$Directorio,base_carac_2017$Secuencia_P,
                               base_carac_2017$Orden, base_carac_2017$Hogar,base_carac_2017$DPTO,
                               base_carac_2017$Mes, sep="-")

base_ocup_2017$Llave <- paste(base_ocup_2017$Directorio,base_ocup_2017$Secuencia_P,
                               base_ocup_2017$Orden, base_ocup_2017$Hogar,base_ocup_2017$DPTO,
                               base_ocup_2017$Mes, sep="-")

base_2017 <- merge(base_ocup_2017,base_carac_2017,by="Llave",all.x = TRUE)

names(base_2017)
base_2017$Directorio.y<-NULL
base_2017$Secuencia_P.y<-NULL
base_2017$Orden.y<-NULL
base_2017$Hogar.y<-NULL
base_2017$Regis.y<-NULL
base_2017$Area.y<-NULL
base_2017$Mes.y<-NULL
base_2017$DPTO.y<-NULL
base_2017$fex_c_2011.y<-NULL

rm(base_carac_2017, base_ocup_2017)

#------------------------------------------------2018---------------------------------------------------

abril_ocup_2018 <- read_delim("2018 Abril Ocupados.csv",";", escape_double = FALSE, trim_ws = TRUE) 
agosto_ocup_2018 <- read_delim("2018 Agosto Ocupados.csv",";", escape_double = FALSE, trim_ws = TRUE)
diciembre_ocup_2018 <- read_delim("2018 Diciembre Ocupados.csv",";", escape_double = FALSE, trim_ws = TRUE)
enero_ocup_2018 <- read_delim("2018 Enero Ocupados.csv",";", escape_double = FALSE, trim_ws = TRUE)
febrero_ocup_2018 <- read_delim("2018 Febrero Ocupados.csv",";", escape_double = FALSE, trim_ws = TRUE)
julio_ocup_2018 <- read_delim("2018 Julio Ocupados.csv",";", escape_double = FALSE, trim_ws = TRUE)
junio_ocup_2018 <- read_delim("2018 Junio Ocupados.csv",";", escape_double = FALSE, trim_ws = TRUE)
marzo_ocup_2018 <- read_delim("2018 Marzo Ocupados.csv",";", escape_double = FALSE, trim_ws = TRUE)
mayo_ocup_2018 <- read_delim("2018 Mayo Ocupados.csv",";", escape_double = FALSE, trim_ws = TRUE)
noviembre_ocup_2018 <- read_delim("2018 Noviembre Ocupados.csv",";", escape_double = FALSE, trim_ws = TRUE)
octubre_ocup_2018 <- read_delim("2018 Octubre Ocupados.csv",";", escape_double = FALSE, trim_ws = TRUE)
septiembre_ocup_2018 <- read_delim("2018 Septiembre Ocupados.csv",";", escape_double = FALSE, trim_ws = TRUE)

enero_ocup_2018_2 <- enero_ocup_2018[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                        "P7020", "P760", "P7028", "RAMA4D", "RAMA4DP8", "RAMA2DP8", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                        "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]
febrero_ocup_2018_2 <- febrero_ocup_2018[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                            "P7020", "P760", "P7028", "RAMA4D", "RAMA4DP8", "RAMA2DP8", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                            "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]
marzo_ocup_2018_2 <- marzo_ocup_2018[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                        "P7020", "P760", "P7028", "RAMA4D", "RAMA4DP8", "RAMA2DP8", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                        "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]
abril_ocup_2018_2 <- abril_ocup_2018[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                        "P7020", "P760", "P7028", "RAMA4D", "RAMA4DP8", "RAMA2DP8", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                        "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]
mayo_ocup_2018_2 <- mayo_ocup_2018[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                      "P7020", "P760", "P7028", "RAMA4D", "RAMA4DP8", "RAMA2DP8", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                      "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]
junio_ocup_2018_2 <- junio_ocup_2018[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                        "P7020", "P760", "P7028", "RAMA4D", "RAMA4DP8", "RAMA2DP8", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                        "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]
julio_ocup_2018_2 <- julio_ocup_2018[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                        "P7020", "P760", "P7028", "RAMA4D", "RAMA4DP8", "RAMA2DP8", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                        "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]
agosto_ocup_2018_2 <- agosto_ocup_2018[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                          "P7020", "P760", "P7028", "RAMA4D", "RAMA4DP8", "RAMA2DP8", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                          "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]
septiembre_ocup_2018_2 <- septiembre_ocup_2018[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                                  "P7020", "P760", "P7028", "RAMA4D", "RAMA4DP8", "RAMA2DP8", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                                  "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]
octubre_ocup_2018_2 <- octubre_ocup_2018[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                            "P7020", "P760", "P7028", "RAMA4D", "RAMA4DP8", "RAMA2DP8", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                            "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]
noviembre_ocup_2018_2 <- noviembre_ocup_2018[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                                "P7020", "P760", "P7028", "RAMA4D", "RAMA4DP8", "RAMA2DP8", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                                "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]
diciembre_ocup_2018_2 <- diciembre_ocup_2018[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                                "P7020", "P760", "P7028", "RAMA4D", "RAMA4DP8", "RAMA2DP8", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                                "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]

base_ocup_2018 <- rbind(abril_ocup_2018_2, agosto_ocup_2018_2, diciembre_ocup_2018_2, enero_ocup_2018_2, febrero_ocup_2018_2,
                        julio_ocup_2018_2, junio_ocup_2018_2, marzo_ocup_2018_2, mayo_ocup_2018_2, noviembre_ocup_2018_2, octubre_ocup_2018_2,
                        septiembre_ocup_2018_2)

rm(abril_ocup_2018, agosto_ocup_2018, diciembre_ocup_2018, enero_ocup_2018, febrero_ocup_2018,
   julio_ocup_2018, junio_ocup_2018, marzo_ocup_2018, mayo_ocup_2018, noviembre_ocup_2018, octubre_ocup_2018,
   septiembre_ocup_2018,abril_ocup_2018_2, agosto_ocup_2018_2, diciembre_ocup_2018_2, enero_ocup_2018_2, febrero_ocup_2018_2,
   julio_ocup_2018_2, junio_ocup_2018_2, marzo_ocup_2018_2, mayo_ocup_2018_2, noviembre_ocup_2018_2, octubre_ocup_2018_2,
   septiembre_ocup_2018_2)

#---------------------------------Asignación de nombres a las variables-------------------------------

nombres_ocup <- c("Directorio", "Secuencia_P", "Orden", "Hogar", "Regis", "Area", "Departamento", 
                  "Contrato", "Verbal", "Termino", "Salario", "Meses_Trabajo", "Horas_Extras",
                  "Trabajo_Antes", "Tiempo_Bus", "Clasi_Tra", "Rama4D", "Rama4DP8", "Rama2DP8", 
                  "INGLABO", "Mes", "DPTO", "fex_c_2011", "Eco_Vejez", "Pen_Obligatoria", "Pen_Voluntaria",
                  "Ahorro", "Inversiones", "Seguro", "Hijos", "Otro", "Cual", "Nada")

colnames(base_ocup_2018) <- nombres_ocup

#--------------------------------------------2018-------------------------------------------------------

abril_carac_2018 <- read_delim("2018 Abril Caracteristicas.csv",";", escape_double = FALSE, trim_ws = TRUE) 
agosto_carac_2018 <- read_delim("2018 Agosto Caracteristicas.csv",";", escape_double = FALSE, trim_ws = TRUE)
diciembre_carac_2018 <- read_delim("2018 Diciembre Caracteristicas.csv",";", escape_double = FALSE, trim_ws = TRUE)
enero_carac_2018 <- read_delim("2018 Enero Caracteristicas.csv",";", escape_double = FALSE, trim_ws = TRUE)
febrero_carac_2018 <- read_delim("2018 Febrero Caracteristicas.csv",";", escape_double = FALSE, trim_ws = TRUE)
julio_carac_2018 <- read_delim("2018 Julio Caracteristicas.csv",";", escape_double = FALSE, trim_ws = TRUE)
junio_carac_2018 <- read_delim("2018 Junio Caracteristicas.csv",";", escape_double = FALSE, trim_ws = TRUE)
marzo_carac_2018 <- read_delim("2018 Marzo Caracteristicas.csv",";", escape_double = FALSE, trim_ws = TRUE)
mayo_carac_2018 <- read_delim("2018 Mayo Caracteristicas.csv",";", escape_double = FALSE, trim_ws = TRUE)
noviembre_carac_2018 <- read_delim("2018 Noviembre Caracteristicas.csv",";", escape_double = FALSE, trim_ws = TRUE)
octubre_carac_2018 <- read_delim("2018 Octubre Caracteristicas.csv",";", escape_double = FALSE, trim_ws = TRUE)
septiembre_carac_2018 <- read_delim("2018 Septiembre Caracteristicas.csv",";", escape_double = FALSE, trim_ws = TRUE)

enero_carac_2018_2 <- enero_carac_2018[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                          "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]
febrero_carac_2018_2 <- febrero_carac_2018[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                              "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]
marzo_carac_2018_2 <- marzo_carac_2018[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                          "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]
abril_carac_2018_2 <- abril_carac_2018[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                          "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]
mayo_carac_2018_2 <- mayo_carac_2018[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                        "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]
junio_carac_2018_2 <- junio_carac_2018[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                          "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]
julio_carac_2018_2 <- julio_carac_2018[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                          "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]
agosto_carac_2018_2 <- agosto_carac_2018[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                            "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]
septiembre_carac_2018_2 <- septiembre_carac_2018[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                                    "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]
octubre_carac_2018_2 <- octubre_carac_2018[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                              "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]
noviembre_carac_2018_2 <- noviembre_carac_2018[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                                  "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]
diciembre_carac_2018_2 <- diciembre_carac_2018[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                                  "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]

base_carac_2018 <- rbind(abril_carac_2018_2, agosto_carac_2018_2, diciembre_carac_2018_2, enero_carac_2018_2, febrero_carac_2018_2,
                         julio_carac_2018_2, junio_carac_2018_2, marzo_carac_2018_2, mayo_carac_2018_2, noviembre_carac_2018_2, octubre_carac_2018_2,
                         septiembre_carac_2018_2)

rm(abril_carac_2018, agosto_carac_2018, diciembre_carac_2018, enero_carac_2018, febrero_carac_2018,
   julio_carac_2018, junio_carac_2018, marzo_carac_2018, mayo_carac_2018, noviembre_carac_2018, octubre_carac_2018,
   septiembre_carac_2018,abril_carac_2018_2, agosto_carac_2018_2, diciembre_carac_2018_2, enero_carac_2018_2, febrero_carac_2018_2,
   julio_carac_2018_2, junio_carac_2018_2, marzo_carac_2018_2, mayo_carac_2018_2, noviembre_carac_2018_2, octubre_carac_2018_2,
   septiembre_carac_2018_2)

nombres_carac <- c("Directorio", "Secuencia_P", "Orden", "Hogar", "Regis","Sexo", "Edad", "Est_Civil", 
                   "Sabe_Leer", "Nivel_Alcanzado","Titulo_Academico", "Area", "Años_Educ", "Mes", "DPTO", "fex_c_2011")

colnames(base_carac_2018) <- nombres_carac


#---------------------------------Llave Área Características y Ocupados--------------------------------

base_carac_2018$Llave <- paste(base_carac_2018$Directorio,base_carac_2018$Secuencia_P,
                               base_carac_2018$Orden, base_carac_2018$Hogar,base_carac_2018$DPTO,
                               base_carac_2018$Mes, sep="-")

base_ocup_2018$Llave <- paste(base_ocup_2018$Directorio,base_ocup_2018$Secuencia_P,
                              base_ocup_2018$Orden, base_ocup_2018$Hogar,base_ocup_2018$DPTO,
                              base_ocup_2018$Mes, sep="-")

base_2018 <- merge(base_ocup_2018,base_carac_2018,by="Llave",all.x = TRUE)

names(base_2018)
base_2018$Directorio.y<-NULL
base_2018$Secuencia_P.y<-NULL
base_2018$Orden.y<-NULL
base_2018$Hogar.y<-NULL
base_2018$Regis.y<-NULL
base_2018$Area.y<-NULL
base_2018$Mes.y<-NULL
base_2018$DPTO.y<-NULL
base_2018$fex_c_2011.y<-NULL

rm(base_carac_2018, base_ocup_2018)

#------------------------------------------2019-------------------------------------------------------

abril_ocup_2019 <- read_delim("2019 Abril Ocupados.csv",";", escape_double = FALSE, trim_ws = TRUE) 
agosto_ocup_2019 <- read_delim("2019 Agosto Ocupados.csv",";", escape_double = FALSE, trim_ws = TRUE)
diciembre_ocup_2019 <- read_delim("2019 Diciembre Ocupados.csv",";", escape_double = FALSE, trim_ws = TRUE)
enero_ocup_2019 <- read_delim("2019 Enero Ocupados.csv",";", escape_double = FALSE, trim_ws = TRUE)
febrero_ocup_2019 <- read_delim("2019 Febrero Ocupados.csv",";", escape_double = FALSE, trim_ws = TRUE)
julio_ocup_2019 <- read_delim("2019 Julio Ocupados.csv",";", escape_double = FALSE, trim_ws = TRUE)
junio_ocup_2019 <- read_delim("2019 Junio Ocupados.csv",";", escape_double = FALSE, trim_ws = TRUE)
marzo_ocup_2019 <- read_delim("2019 Marzo Ocupados.csv",";", escape_double = FALSE, trim_ws = TRUE)
mayo_ocup_2019 <- read_delim("2019 Mayo Ocupados.csv",";", escape_double = FALSE, trim_ws = TRUE)
noviembre_ocup_2019 <- read_delim("2019 Noviembre Ocupados.csv",";", escape_double = FALSE, trim_ws = TRUE)
octubre_ocup_2019 <- read_delim("2019 Octubre Ocupados.csv",";", escape_double = FALSE, trim_ws = TRUE)
septiembre_ocup_2019 <- read_delim("2019 Septiembre Ocupados.csv",";", escape_double = FALSE, trim_ws = TRUE)

enero_ocup_2019_2 <- enero_ocup_2019[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                        "P7020", "P760", "P7028", "RAMA4D", "RAMA4DP8", "RAMA2DP8", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                        "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]
febrero_ocup_2019_2 <- febrero_ocup_2019[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                            "P7020", "P760", "P7028", "RAMA4D", "RAMA4DP8", "RAMA2DP8", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                            "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]
marzo_ocup_2019_2 <- marzo_ocup_2019[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                        "P7020", "P760", "P7028", "RAMA4D", "RAMA4DP8", "RAMA2DP8", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                        "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]
abril_ocup_2019_2 <- abril_ocup_2019[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                        "P7020", "P760", "P7028", "RAMA4D", "RAMA4DP8", "RAMA2DP8", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                        "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]
mayo_ocup_2019_2 <- mayo_ocup_2019[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                      "P7020", "P760", "P7028", "RAMA4D", "RAMA4DP8", "RAMA2DP8", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                      "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]
junio_ocup_2019_2 <- junio_ocup_2019[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                        "P7020", "P760", "P7028", "RAMA4D", "RAMA4DP8", "RAMA2DP8", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                        "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]
julio_ocup_2019_2 <- julio_ocup_2019[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                        "P7020", "P760", "P7028", "RAMA4D", "RAMA4DP8", "RAMA2DP8", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                        "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]
agosto_ocup_2019_2 <- agosto_ocup_2019[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                          "P7020", "P760", "P7028", "RAMA4D", "RAMA4DP8", "RAMA2DP8", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                          "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]
septiembre_ocup_2019_2 <- septiembre_ocup_2019[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                                  "P7020", "P760", "P7028", "RAMA4D", "RAMA4DP8", "RAMA2DP8", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                                  "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]
octubre_ocup_2019_2 <- octubre_ocup_2019[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                            "P7020", "P760", "P7028", "RAMA4D", "RAMA4DP8", "RAMA2DP8", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                            "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]
noviembre_ocup_2019_2 <- noviembre_ocup_2019[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                                "P7020", "P760", "P7028", "RAMA4D", "RAMA4DP8", "RAMA2DP8", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                                "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]
diciembre_ocup_2019_2 <- diciembre_ocup_2019[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                                "P7020", "P760", "P7028", "RAMA4D", "RAMA4DP8", "RAMA2DP8", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                                "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]

base_ocup_2019 <- rbind(abril_ocup_2019_2, agosto_ocup_2019_2, diciembre_ocup_2019_2, enero_ocup_2019_2, febrero_ocup_2019_2,
                        julio_ocup_2019_2, junio_ocup_2019_2, marzo_ocup_2019_2, mayo_ocup_2019_2, noviembre_ocup_2019_2, octubre_ocup_2019_2,
                        septiembre_ocup_2019_2)

rm(abril_ocup_2019, agosto_ocup_2019, diciembre_ocup_2019, enero_ocup_2019, febrero_ocup_2019,
   julio_ocup_2019, junio_ocup_2019, marzo_ocup_2019, mayo_ocup_2019, noviembre_ocup_2019, octubre_ocup_2019,
   septiembre_ocup_2019,abril_ocup_2019_2, agosto_ocup_2019_2, diciembre_ocup_2019_2, enero_ocup_2019_2, febrero_ocup_2019_2,
   julio_ocup_2019_2, junio_ocup_2019_2, marzo_ocup_2019_2, mayo_ocup_2019_2, noviembre_ocup_2019_2, octubre_ocup_2019_2,
   septiembre_ocup_2019_2)



#---------------------------------Asignación de nombres a las variables-------------------------------

nombres_ocup <- c("Directorio", "Secuencia_P", "Orden", "Hogar", "Regis", "Area", "Departamento", 
                  "Contrato", "Verbal", "Termino", "Salario", "Meses_Trabajo", "Horas_Extras",
                  "Trabajo_Antes", "Tiempo_Bus", "Clasi_Tra", "Rama4D", "Rama4DP8", "Rama2DP8", 
                  "INGLABO", "Mes", "DPTO", "fex_c_2011", "Eco_Vejez", "Pen_Obligatoria", "Pen_Voluntaria",
                  "Ahorro", "Inversiones", "Seguro", "Hijos", "Otro", "Cual", "Nada")

colnames(base_ocup_2019) <- nombres_ocup

abril_carac_2019 <- read_delim("2019 Abril Caracteristicas.csv",";", escape_double = FALSE, trim_ws = TRUE) 
agosto_carac_2019 <- read_delim("2019 Agosto Caracteristicas.csv",";", escape_double = FALSE, trim_ws = TRUE)
diciembre_carac_2019 <- read_delim("2019 Diciembre Caracteristicas.csv",";", escape_double = FALSE, trim_ws = TRUE)
enero_carac_2019 <- read_delim("2019 Enero Caracteristicas.csv",";", escape_double = FALSE, trim_ws = TRUE)
febrero_carac_2019 <- read_delim("2019 Febrero Caracteristicas.csv",";", escape_double = FALSE, trim_ws = TRUE)
julio_carac_2019 <- read_delim("2019 Julio Caracteristicas.csv",";", escape_double = FALSE, trim_ws = TRUE)
junio_carac_2019 <- read_delim("2019 Junio Caracteristicas.csv",";", escape_double = FALSE, trim_ws = TRUE)
marzo_carac_2019 <- read_delim("2019 Marzo Caracteristicas.csv",";", escape_double = FALSE, trim_ws = TRUE)
mayo_carac_2019 <- read_delim("2019 Mayo Caracteristicas.csv",";", escape_double = FALSE, trim_ws = TRUE)
noviembre_carac_2019 <- read_delim("2019 Noviembre Caracteristicas.csv",";", escape_double = FALSE, trim_ws = TRUE)
octubre_carac_2019 <- read_delim("2019 Octubre Caracteristicas.csv",";", escape_double = FALSE, trim_ws = TRUE)
septiembre_carac_2019 <- read_delim("2019 Septiembre Caracteristicas.csv",";", escape_double = FALSE, trim_ws = TRUE)

enero_carac_2019_2 <- enero_carac_2019[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                          "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]
febrero_carac_2019_2 <- febrero_carac_2019[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                              "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]
marzo_carac_2019_2 <- marzo_carac_2019[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                          "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]
abril_carac_2019_2 <- abril_carac_2019[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                          "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]
mayo_carac_2019_2 <- mayo_carac_2019[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                        "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]
junio_carac_2019_2 <- junio_carac_2019[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                          "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]
julio_carac_2019_2 <- julio_carac_2019[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                          "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]
agosto_carac_2019_2 <- agosto_carac_2019[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                            "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]
septiembre_carac_2019_2 <- septiembre_carac_2019[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                                    "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]
octubre_carac_2019_2 <- octubre_carac_2019[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                              "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]
noviembre_carac_2019_2 <- noviembre_carac_2019[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                                  "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]
diciembre_carac_2019_2 <- diciembre_carac_2019[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                                  "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]

base_carac_2019 <- rbind(abril_carac_2019_2, agosto_carac_2019_2, diciembre_carac_2019_2, enero_carac_2019_2, febrero_carac_2019_2,
                         julio_carac_2019_2, junio_carac_2019_2, marzo_carac_2019_2, mayo_carac_2019_2, noviembre_carac_2019_2, octubre_carac_2019_2,
                         septiembre_carac_2019_2)

rm(abril_carac_2019, agosto_carac_2019, diciembre_carac_2019, enero_carac_2019, febrero_carac_2019,
   julio_carac_2019, junio_carac_2019, marzo_carac_2019, mayo_carac_2019, noviembre_carac_2019, octubre_carac_2019,
   septiembre_carac_2019,abril_carac_2019_2, agosto_carac_2019_2, diciembre_carac_2019_2, enero_carac_2019_2, febrero_carac_2019_2,
   julio_carac_2019_2, junio_carac_2019_2, marzo_carac_2019_2, mayo_carac_2019_2, noviembre_carac_2019_2, octubre_carac_2019_2,
   septiembre_carac_2019_2)

nombres_carac <- c("Directorio", "Secuencia_P", "Orden", "Hogar", "Regis","Sexo", "Edad", "Est_Civil", 
                   "Sabe_Leer", "Nivel_Alcanzado","Titulo_Academico", "Area", "Años_Educ", "Mes", "DPTO", "fex_c_2011")

colnames(base_carac_2019) <- nombres_carac

names(base_carac_2019)

#---------------------------------Llave Área Características y Ocupados--------------------------------

base_carac_2019$Llave <- paste(base_carac_2019$Directorio,base_carac_2019$Secuencia_P,
                               base_carac_2019$Orden, base_carac_2019$Hogar,base_carac_2019$DPTO,
                               base_carac_2019$Mes, sep="-")

base_ocup_2019$Llave <- paste(base_ocup_2019$Directorio,base_ocup_2019$Secuencia_P,
                              base_ocup_2019$Orden, base_ocup_2019$Hogar,base_ocup_2019$DPTO,
                              base_ocup_2019$Mes, sep="-")

base_2019 <- merge(base_ocup_2019,base_carac_2019,by="Llave",all.x = TRUE)

names(base_2019)
base_2019$Directorio.y<-NULL
base_2019$Secuencia_P.y<-NULL
base_2019$Orden.y<-NULL
base_2019$Hogar.y<-NULL
base_2019$Regis.y<-NULL
base_2019$Area.y<-NULL
base_2019$Mes.y<-NULL
base_2019$DPTO.y<-NULL
base_2019$fex_c_2011.y<-NULL

rm(base_carac_2019, base_ocup_2019)

#-------------------------------------------------2020--------------------------------------------------
#------------------------------Se eliminan los meses marzo a julio-------------------------------------

enero_ocup_2020 <- read_delim("2020 Enero Ocupados.csv",";", escape_double = FALSE, trim_ws = TRUE)
febrero_ocup_2020 <- read_delim("2020 Febrero Ocupados.csv",";", escape_double = FALSE, trim_ws = TRUE)
agosto_ocup_2020 <- read_delim("2020 Agosto Ocupados.csv",";", escape_double = FALSE, trim_ws = TRUE)
diciembre_ocup_2020 <- read_delim("2020 Diciembre Ocupados.csv",";", escape_double = FALSE, trim_ws = TRUE)
noviembre_ocup_2020 <- read_delim("2020 Noviembre Ocupados.csv",";", escape_double = FALSE, trim_ws = TRUE)
octubre_ocup_2020 <- read_delim("2020 Octubre Ocupados.csv",";", escape_double = FALSE, trim_ws = TRUE)
septiembre_ocup_2020 <- read_delim("2020 Septiembre Ocupados.csv",";", escape_double = FALSE, trim_ws = TRUE)

enero_ocup_2020_2 <- enero_ocup_2020[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                        "P7020", "P760", "P7028", "RAMA4D_R4", "RAMA4DP8_R4", "RAMA2D_R4", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                        "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]
febrero_ocup_2020_2 <- febrero_ocup_2020[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                            "P7020", "P760", "P7028", "RAMA4D_R4", "RAMA4DP8_R4", "RAMA2D_R4", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                            "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]
agosto_ocup_2020_2 <- agosto_ocup_2020[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                          "P7020", "P760", "P7028", "RAMA4D_R4", "RAMA4DP8_R4", "RAMA2D_R4", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                          "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]
septiembre_ocup_2020_2 <- septiembre_ocup_2020[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                                  "P7020", "P760", "P7028", "RAMA4D_R4", "RAMA4DP8_R4", "RAMA2D_R4", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                                  "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]
octubre_ocup_2020_2 <- octubre_ocup_2020[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                            "P7020", "P760", "P7028", "RAMA4D_R4", "RAMA4DP8_R4", "RAMA2D_R4", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                            "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]
noviembre_ocup_2020_2 <- noviembre_ocup_2020[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                                "P7020", "P760", "P7028", "RAMA4D_R4", "RAMA4DP8_R4", "RAMA2D_R4", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                                "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]
diciembre_ocup_2020_2 <- diciembre_ocup_2020[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                                "P7020", "P760", "P7028", "RAMA4D_R4", "RAMA4DP8_R4", "RAMA2D_R4", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                                "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]

base_ocup_2020 <- rbind(agosto_ocup_2020_2, diciembre_ocup_2020_2, enero_ocup_2020_2, febrero_ocup_2020_2,
                        noviembre_ocup_2020_2, octubre_ocup_2020_2, septiembre_ocup_2020_2)

rm(agosto_ocup_2020, diciembre_ocup_2020, enero_ocup_2020, febrero_ocup_2020,
   noviembre_ocup_2020, octubre_ocup_2020, septiembre_ocup_2020, agosto_ocup_2020_2,
   diciembre_ocup_2020_2, enero_ocup_2020_2, febrero_ocup_2020_2, noviembre_ocup_2020_2, 
   octubre_ocup_2020_2, septiembre_ocup_2020_2)



#---------------------------------Asignación de nombres a las variables-------------------------------

nombres_ocup <- c("Directorio", "Secuencia_P", "Orden", "Hogar", "Regis", "Area", "Departamento", 
                  "Contrato", "Verbal", "Termino", "Salario", "Meses_Trabajo", "Horas_Extras",
                  "Trabajo_Antes", "Tiempo_Bus", "Clasi_Tra", "Rama4D", "Rama4DP8", "Rama2DP8", 
                  "INGLABO", "Mes", "DPTO", "fex_c_2011", "Eco_Vejez", "Pen_Obligatoria", "Pen_Voluntaria",
                  "Ahorro", "Inversiones", "Seguro", "Hijos", "Otro", "Cual", "Nada")

colnames(base_ocup_2020) <- nombres_ocup

enero_carac_2020 <- read_delim("2020 Enero Caracteristicas.csv",";", escape_double = FALSE, trim_ws = TRUE)
febrero_carac_2020 <- read_delim("2020 Febrero Caracteristicas.csv",";", escape_double = FALSE, trim_ws = TRUE)
agosto_carac_2020 <- read_delim("2020 Agosto Caracteristicas.csv",";", escape_double = FALSE, trim_ws = TRUE)
diciembre_carac_2020 <- read_delim("2020 Diciembre Caracteristicas.csv",";", escape_double = FALSE, trim_ws = TRUE)
noviembre_carac_2020 <- read_delim("2020 Noviembre Caracteristicas.csv",";", escape_double = FALSE, trim_ws = TRUE)
octubre_carac_2020 <- read_delim("2020 Octubre Caracteristicas.csv",";", escape_double = FALSE, trim_ws = TRUE)
septiembre_carac_2020 <- read_delim("2020 Septiembre Caracteristicas.csv",";", escape_double = FALSE, trim_ws = TRUE)

enero_carac_2020_2 <- enero_carac_2020[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                          "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]
febrero_carac_2020_2 <- febrero_carac_2020[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                              "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]
agosto_carac_2020_2 <- agosto_carac_2020[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                            "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]
septiembre_carac_2020_2 <- septiembre_carac_2020[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                                    "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]
octubre_carac_2020_2 <- octubre_carac_2020[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                              "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]
noviembre_carac_2020_2 <- noviembre_carac_2020[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                                  "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]
diciembre_carac_2020_2 <- diciembre_carac_2020[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                                  "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]

base_carac_2020 <- rbind(agosto_carac_2020_2, diciembre_carac_2020_2, enero_carac_2020_2, febrero_carac_2020_2,
                         noviembre_carac_2020_2, octubre_carac_2020_2, septiembre_carac_2020_2)

rm(agosto_carac_2020, diciembre_carac_2020, enero_carac_2020, febrero_carac_2020,
   noviembre_carac_2020, octubre_carac_2020, septiembre_carac_2020,agosto_carac_2020_2, 
   diciembre_carac_2020_2, enero_carac_2020_2, febrero_carac_2020_2, noviembre_carac_2020_2, 
   octubre_carac_2020_2, septiembre_carac_2020_2)

nombres_carac <- c("Directorio", "Secuencia_P", "Orden", "Hogar", "Regis","Sexo", "Edad", "Est_Civil", 
                   "Sabe_Leer", "Nivel_Alcanzado","Titulo_Academico", "Area", "Años_Educ", "Mes", "DPTO", "fex_c_2011")

colnames(base_carac_2020) <- nombres_carac

names(base_carac_2020)

#---------------------------------Llave Área Características y Ocupados--------------------------------

base_carac_2020$Llave <- paste(base_carac_2020$Directorio,base_carac_2020$Secuencia_P,
                               base_carac_2020$Orden, base_carac_2020$Hogar,base_carac_2020$DPTO,
                               base_carac_2020$Mes, sep="-")

base_ocup_2020$Llave <- paste(base_ocup_2020$Directorio,base_ocup_2020$Secuencia_P,
                              base_ocup_2020$Orden, base_ocup_2020$Hogar,base_ocup_2020$DPTO,
                              base_ocup_2020$Mes, sep="-")

base_2020 <- merge(base_ocup_2020,base_carac_2020,by="Llave",all.x = TRUE)

names(base_2020)
base_2020$Directorio.y<-NULL
base_2020$Secuencia_P.y<-NULL
base_2020$Orden.y<-NULL
base_2020$Hogar.y<-NULL
base_2020$Regis.y<-NULL
base_2020$Area.y<-NULL
base_2020$Mes.y<-NULL
base_2020$DPTO.y<-NULL
base_2020$fex_c_2011.y<-NULL

rm(base_carac_2020, base_ocup_2020)

#---------------------------------------------------2021-----------------------------------------------

abril_ocup_2021 <- read.csv("2021 Abril Ocupados.csv")
enero_ocup_2021 <- read_delim("2021 Enero Ocupados.csv", delim = ";", escape_double = FALSE, trim_ws = TRUE)
febrero_ocup_2021 <- read_delim("2021 Febrero Ocupados.csv",";", escape_double = FALSE, trim_ws = TRUE)
julio_ocup_2021 <- read_delim("2021 Julio Ocupados.csv",";", escape_double = FALSE, trim_ws = TRUE)
junio_ocup_2021 <- read_delim("2021 Junio Ocupados.csv",";", escape_double = FALSE, trim_ws = TRUE)
marzo_ocup_2021 <- read_delim("2021 Marzo Ocupados.csv",";", escape_double = FALSE, trim_ws = TRUE)
mayo_ocup_2021 <- read_delim("2021 Mayo Ocupados.csv",";", escape_double = FALSE, trim_ws = TRUE)

enero_ocup_2021_2 <- enero_ocup_2021[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                        "P7020", "P760", "P7028", "RAMA4D_R4", "RAMA4DP8_R4", "RAMA2D_R4", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                        "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]
febrero_ocup_2021_2 <- febrero_ocup_2021[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                            "P7020", "P760", "P7028", "RAMA4D_R4", "RAMA4DP8_R4", "RAMA2D_R4", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                            "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]
marzo_ocup_2021_2 <- marzo_ocup_2021[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                        "P7020", "P760", "P7028", "RAMA4D_R4", "RAMA4DP8_R4", "RAMA2D_R4", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                        "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]
abril_ocup_2021_2 <- abril_ocup_2021[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                        "P7020", "P760", "P7028", "RAMA4D_R4", "RAMA4DP8_R4", "RAMA2D_R4", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                        "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]
mayo_ocup_2021_2 <- mayo_ocup_2021[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                      "P7020", "P760", "P7028", "RAMA4D_R4", "RAMA4DP8_R4", "RAMA2D_R4", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                      "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]
junio_ocup_2021_2 <- junio_ocup_2021[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                        "P7020", "P760", "P7028", "RAMA4D_R4", "RAMA4DP8_R4", "RAMA2D_R4", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                        "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]
julio_ocup_2021_2 <- julio_ocup_2021[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "AREA", "P388", "P6440", "P6450", "P6460", "P6500", "P6790", "P6640", 
                                        "P7020", "P760", "P7028", "RAMA4D_R4", "RAMA4DP8_R4", "RAMA2D_R4", "INGLABO", "MES", "DPTO", "fex_c_2011", "P6980", "P6980S1", "P6980S2",
                                        "P6980S3", "P6980S4", "P6980S5", "P6980S6", "P6980S7", "P6980S7A1", "P6980S8")]

base_ocup_2021 <- rbind(abril_ocup_2021_2, enero_ocup_2021_2, febrero_ocup_2021_2, marzo_ocup_2021_2, mayo_ocup_2021_2, julio_ocup_2021_2, 
                        junio_ocup_2021_2)
rm(abril_ocup_2021, enero_ocup_2021, febrero_ocup_2021, julio_ocup_2021, junio_ocup_2021, marzo_ocup_2021, mayo_ocup_2021, abril_ocup_2021_2, 
   enero_ocup_2021_2, febrero_ocup_2021_2, julio_ocup_2021_2,junio_ocup_2021_2, marzo_ocup_2021_2, mayo_ocup_2021_2)

#---------------------------------Asignacion de nombres a las variables-------------------------------

nombres_ocup <- c("Directorio", "Secuencia_P", "Orden", "Hogar", "Regis", "Area", "Departamento", 
                  "Contrato", "Verbal", "Termino", "Salario", "Meses_Trabajo", "Horas_Extras",
                  "Trabajo_Antes", "Tiempo_Bus", "Clasi_Tra", "Rama4D", "Rama4DP8", "Rama2DP8", 
                  "INGLABO", "Mes", "DPTO", "fex_c_2011", "Eco_Vejez", "Pen_Obligatoria", "Pen_Voluntaria",
                  "Ahorro", "Inversiones", "Seguro", "Hijos", "Otro", "Cual", "Nada")

colnames(base_ocup_2021) <- nombres_ocup
names(base_ocup_2021)

#---------------------------------Caracteristicas 2021--------------------------------

abril_carac_2021 <- read.csv("2021 Abril Caracteristicas.csv")
enero_carac_2021 <- read_delim("2021 Enero Caracteristicas.csv", delim = ";", escape_double = FALSE, trim_ws = TRUE)
febrero_carac_2021 <- read_delim("2021 Febrero Caracteristicas.csv",";", escape_double = FALSE, trim_ws = TRUE)
julio_carac_2021 <- read_delim("2021 Julio Caracteristicas.csv",";", escape_double = FALSE, trim_ws = TRUE)
junio_carac_2021 <- read_delim("2021 Junio Caracteristicas.csv",";", escape_double = FALSE, trim_ws = TRUE)

marzo_carac_2021 <- read_delim("2021 Marzo Caracteristicas.csv",";", escape_double = FALSE, trim_ws = TRUE)
mayo_carac_2021 <- read_delim("2021 Mayo Caracteristicas.csv",";", escape_double = FALSE, trim_ws = TRUE)

enero_carac_2021_2 <- enero_carac_2021[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                          "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]
febrero_carac_2021_2 <- febrero_carac_2021[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                              "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]
marzo_carac_2021_2 <- marzo_carac_2021[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                          "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]
abril_carac_2021_2 <- abril_carac_2021[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                          "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]
mayo_carac_2021_2 <- mayo_carac_2021[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                        "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]
junio_carac_2021_2 <- junio_carac_2021[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                          "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]
julio_carac_2021_2 <- julio_carac_2021[,c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "REGIS", "P6020", "P6040",
                                          "P6070", "P6160", "P6210", "P6220", "AREA", "ESC", "MES", "DPTO", "fex_c_2011")]

base_carac_2021 <- rbind(abril_carac_2021_2, enero_carac_2021_2, febrero_carac_2021_2, julio_carac_2021_2,
                         junio_carac_2021_2, marzo_carac_2021_2, mayo_carac_2021_2)

rm(abril_carac_2021, enero_carac_2021, febrero_carac_2021, julio_carac_2021, junio_carac_2021, 
   marzo_carac_2021, mayo_carac_2021, abril_carac_2021_2, enero_carac_2021_2, febrero_carac_2021_2,
   julio_carac_2021_2, junio_carac_2021_2, marzo_carac_2021_2, mayo_carac_2021_2)

nombres_carac <- c("Directorio", "Secuencia_P", "Orden", "Hogar", "Regis","Sexo", "Edad", "Est_Civil", 
                   "Sabe_Leer", "Nivel_Alcanzado","Titulo_Academico", "Area", "Años_Educ", "Mes", "DPTO", "fex_c_2011")

colnames(base_carac_2021) <- nombres_carac

base_carac_2021$Llave <- paste(base_carac_2021$Directorio,base_carac_2021$Secuencia_P,
                               base_carac_2021$Orden, base_carac_2021$Hogar,base_carac_2021$DPTO,
                               base_carac_2021$Mes, sep="-")

base_ocup_2021$Llave <- paste(base_ocup_2021$Directorio,base_ocup_2021$Secuencia_P,
                              base_ocup_2021$Orden, base_ocup_2021$Hogar,base_ocup_2021$DPTO,
                              base_ocup_2021$Mes, sep="-")

base_2021 <- merge(base_ocup_2021,base_carac_2021,by="Llave",all.x = TRUE)

names(base_2021)
base_2021$Directorio.y<-NULL
base_2021$Secuencia_P.y<-NULL
base_2021$Orden.y<-NULL
base_2021$Hogar.y<-NULL
base_2021$Regis.y<-NULL
base_2021$Area.y<-NULL
base_2021$Mes.y<-NULL
base_2021$DPTO.y<-NULL
base_2021$fex_c_2011.y<-NULL

names(base_2021)==names(base_2018)

rm(base_carac_2021, base_ocup_2021)



#------------------------------Unificacion de bases-------------------------

#------------------------- Agreguemos columna a�o-------------------------- 

base_2017$ano<-2017
base_2018$ano<-2018
base_2019$ano<-2019
base_2020$ano<-2020
base_2021$ano<-2021


names(base_2021)==names(base_2018)


panel2017_2021<-rbind(base_2017,base_2018,base_2019,base_2020,base_2021)


View(panel2017_2021)

#------------------------------- Archivo en RDS--------------------------------

saveRDS(panel2017_2021,file = "panel2017_2021.rds")


#--------------------------(Punto 8) VAriable formas de aseguramiento--------------------

#-------------------------- Dummizamos series-----------------------------------

table(is.na(panel2017_2021$Pen_Obligatoria))
panel2017_2021$Pen_Obligatoria_m<-0
panel2017_2021$Pen_Obligatoria_m[panel2017_2021$Pen_Obligatoria==1]<-1

table(is.na(panel2017_2021$Pen_Voluntaria))
panel2017_2021$Pen_Voluntaria_m<-0
panel2017_2021$Pen_Voluntaria_m[panel2017_2021$Pen_Voluntaria==1]<-1

table(is.na(panel2017_2021$Ahorro))
panel2017_2021$Ahorro_m<-0
panel2017_2021$Ahorro_m[panel2017_2021$Ahorro==1]<-1

table(is.na(panel2017_2021$Inversiones))
panel2017_2021$Inversiones_m<-0
panel2017_2021$Inversiones_m[panel2017_2021$Inversiones==1]<-1

table(is.na(panel2017_2021$Seguro))
panel2017_2021$Seguro_m<-0
panel2017_2021$Seguro_m[panel2017_2021$Seguro==1]<-1


View(panel2017_2021)

#------------------------ Construcci�n de contador--------------------------

panel2017_2021$Contador<-1

#-------------------------- Variables formas de aseguramiento----------------- 

panel2017_2021$form_ase<-panel2017_2021$Pen_Obligatoria_m+panel2017_2021$Pen_Voluntaria_m+panel2017_2021$Ahorro_m+panel2017_2021$Inversiones_m+panel2017_2021$Seguro_m


install.packages("doBy")
library(doBy)

table_ano<-doBy::summaryBy(Contador~ano+form_ase,data=panel2017_2021,FUN=sum)

View(table_ano)


formas_ase_ano<-doBy::summaryBy(form_ase+Pen_Obligatoria_m+Pen_Voluntaria_m+Ahorro_m+Inversiones_m+Seguro_m~ano,data=panel2017_2021,FUN=sum)     

View(formas_ase_ano)


formas_ase_ano$pen_obligatoria_p<-(formas_ase_ano$Pen_Obligatoria_m.sum/formas_ase_ano$form_ase.sum)*100
View(formas_ase_ano)

formas_ase_ano$pen_voluntaria_p<-(formas_ase_ano$Pen_Voluntaria_m.sum/formas_ase_ano$form_ase.sum)*100
View(formas_ase_ano)

formas_ase_ano$Ahorro_p<-(formas_ase_ano$Ahorro_m.sum/formas_ase_ano$form_ase.sum)*100
View(formas_ase_ano)

formas_ase_ano$Inversiones_p<-(formas_ase_ano$Inversiones_m.sum/formas_ase_ano$form_ase.sum)*100
View(formas_ase_ano)

formas_ase_ano$Seguro_p<-(formas_ase_ano$Seguro_m.sum/formas_ase_ano$form_ase.sum)*100
View(formas_ase_ano)

#-------------------------- An�lisis Ver word----------------------------------------

#--------------------------(Punto 9) Variable Dummie--------------------------------

View(panel2017_2021)

panel2017_2021$Dummie_aseguramiento<-1

panel2017_2021$Dummie_aseguramiento[which(panel2017_2021$form_ase==0)]<-0
   
#-------------------------(punto 10) G�nero y aseguramiento------------------------

# Tabla sexo y forma de aseguramiento 
genero_aseguramiento<-doBy::summaryBy(Contador~ano+form_ase+Sexo,data = panel2017_2021, FUN = sum)
View(genero_aseguramiento)

#Tabla sexo y variable Dummie aseguramiento

genero_aseguramientoDummie<-doBy::summaryBy(Contador~ano+Sexo+Dummie_aseguramiento,data = panel2017_2021, FUN = sum)
View(genero_aseguramientoDummie)

# Brecha de g�nero en aseguramiento


genero_aseguramientoDummie<-doBy::summaryBy(Contador~ano+Sexo+Dummie_aseguramiento,data = panel2017_2021, FUN = sum)

aseguramiento_sexo<-genero_aseguramientoDummie[which(genero_aseguramientoDummie$Dummie_aseguramiento==1),]

View(aseguramiento_sexo)   

View(panel2017_2021)
   
genero_ano<-doBy::summaryBy(Contador~ano+Sexo,data = panel2017_2021, FUN = sum)
View(genero_ano)
   
aseguramiento_sexo$porcentaje<-(aseguramiento_sexo$Contador.sum/genero_ano$Contador.sum)*100
View(aseguramiento_sexo)


#Falta brecha (diferencia porcentual)

#----------------------------------(punto 11) Aseguramiento Area------------------------------------

table(panel2017_2021$form_ase,panel2017_2021$Area.x)

Area_aseguramiento<-doBy::summaryBy(Contador~ano+Area.x+Dummie_aseguramiento,data = panel2017_2021,FUN = sum)
Area_aseguramiento_mes<-doBy::summaryBy(fex_c_2011.x~ano+Mes.x+Area.x+Dummie_aseguramiento,data = panel2017_2021,FUN = sum)

View(Area_aseguramiento) #analisis de tendencia

View(Area_aseguramiento_mes)



