#install and import libraries
#install only used when you not have these packages.
#install.packages("ggplot2")
#install.packages('dplyr')
#install.packages("reshape")
#install.packages("tidyverse")

library(ggplot2)
library(dplyr)
library(reshape2)
library(cluster)
library(tidyverse)

rm(list = ls()) #clear data in environment
setwd("C:/Users/WENGCHENLONGJIE/Desktop/FIT3152/Assignment1") #set directory 
set.seed(29334152) # seed is student ID
cvbase = read.csv("PsyCoronaBaselineExtract.csv")
cvbase <- cvbase[sample(nrow(cvbase), 40000), ] # 40000 rows

# 1(a)
dim(cvbase)
str(cvbase) #see the variable type and some head data
summary(cvbase) #more detail about data.


#######################################################################################

# 1(b)

#now remove the na value for each variable use the median to instead it.
#affAnx
median_col1 <- median(cvbase$affAnx, na.rm = TRUE)
cvbase$affAnx[is.na(cvbase$affAnx)] <- median_col1
#affCalm
median_col1 <- median(cvbase$affCalm, na.rm = TRUE)
cvbase$affCalm[is.na(cvbase$affCalm)] <- median_col1
#affContent
median_col1 <- median(cvbase$affContent, na.rm = TRUE)
cvbase$affContent[is.na(cvbase$affContent)] <- median_col1
#affBor
median_col1 <- median(cvbase$affBor, na.rm = TRUE)
cvbase$affBor[is.na(cvbase$affBor)] <- median_col1
#affEnerg
median_col1 <- median(cvbase$affEnerg, na.rm = TRUE)
cvbase$affEnerg[is.na(cvbase$affEnerg)] <- median_col1
#affDepr
median_col1 <- median(cvbase$affDepr, na.rm = TRUE)
cvbase$affDepr[is.na(cvbase$affDepr)] <- median_col1
#affExc
median_col1 <- median(cvbase$affExc, na.rm = TRUE)
cvbase$affExc[is.na(cvbase$affExc)] <- median_col1
#affNerv
median_col1 <- median(cvbase$affNerv, na.rm = TRUE)
cvbase$affNerv[is.na(cvbase$affNerv)] <- median_col1
#affExh
median_col1 <- median(cvbase$affExh, na.rm = TRUE)
cvbase$affExh[is.na(cvbase$affExh)] <- median_col1
#affInsp
median_col1 <- median(cvbase$affInsp, na.rm = TRUE)
cvbase$affInsp[is.na(cvbase$affInsp)] <- median_col1
#affRel
median_col1 <- median(cvbase$affRel, na.rm = TRUE)
cvbase$affRel[is.na(cvbase$affRel)] <- median_col1
#PLRAC19
median_col1 <- median(cvbase$PLRAC19, na.rm = TRUE)
cvbase$PLRAC19[is.na(cvbase$PLRAC19)] <- median_col1
#PLRAEco
median_col1 <- median(cvbase$PLRAEco, na.rm = TRUE)
cvbase$PLRAEco[is.na(cvbase$PLRAEco)] <- median_col1
#disc01
cvbase$disc01[is.na(cvbase$disc01)] <- 0
#disc02
cvbase$disc02[is.na(cvbase$disc02)] <- 0
#disc03
cvbase$disc03[is.na(cvbase$disc03)] <- 0
#jbInsec01
cvbase$jbInsec01[is.na(cvbase$jbInsec01)] <- 0
#jbInsec02
cvbase$jbInsec02[is.na(cvbase$jbInsec02)] <- 0
#jbInsec03
cvbase$jbInsec03[is.na(cvbase$jbInsec03)] <- 0
#jbInsec04
cvbase$jbInsec04[is.na(cvbase$jbInsec04)] <- 0
#employstatus_1
cvbase$employstatus_1[is.na(cvbase$employstatus_1)] <- 0
#employstatus_2
cvbase$employstatus_2[is.na(cvbase$employstatus_2)] <- 0
#employstatus_3
cvbase$employstatus_3[is.na(cvbase$employstatus_3)] <- 0
#employstatus_4
cvbase$employstatus_4[is.na(cvbase$employstatus_4)] <- 0
#employstatus_5
cvbase$employstatus_5[is.na(cvbase$employstatus_5)] <- 0
#employstatus_6
cvbase$employstatus_6[is.na(cvbase$employstatus_6)] <- 0
#employstatus_7
cvbase$employstatus_7[is.na(cvbase$employstatus_7)] <- 0
#employstatus_8
cvbase$employstatus_8[is.na(cvbase$employstatus_8)] <- 0
#employstatus_9
cvbase$employstatus_9[is.na(cvbase$employstatus_9)] <- 0
#employstatus_10
cvbase$employstatus_10[is.na(cvbase$employstatus_10)] <- 0
#PFS01
cvbase$PFS01[is.na(cvbase$PFS01)] <- 0
#PFS02
cvbase$PFS02[is.na(cvbase$PFS02)] <- 0
#PFS03
cvbase$PFS03[is.na(cvbase$PFS03)] <- 0
#fail01
cvbase$fail01[is.na(cvbase$fail01)] <- 0
#fail02
cvbase$fail02[is.na(cvbase$fail02)] <- 0
#fail03
cvbase$fail03[is.na(cvbase$fail03)] <- 0
#happy
median_col1 <- median(cvbase$happy, na.rm = TRUE)
cvbase$happy[is.na(cvbase$happy)] <- median_col1
#lifeSat
median_col1 <- median(cvbase$lifeSat, na.rm = TRUE)
cvbase$lifeSat[is.na(cvbase$lifeSat)] <- median_col1
#MLQ
median_col1 <- median(cvbase$MLQ, na.rm = TRUE)
cvbase$MLQ[is.na(cvbase$MLQ)] <- median_col1
#c19NormShould
median_col1 <- median(cvbase$c19NormShould, na.rm = TRUE)
cvbase$c19NormShould[is.na(cvbase$c19NormShould)] <- median_col1
#c19NormDo
median_col1 <- median(cvbase$c19NormDo, na.rm = TRUE)
cvbase$c19NormDo[is.na(cvbase$c19NormDo)] <- median_col1
#c19IsStrict
median_col1 <- median(cvbase$c19IsStrict, na.rm = TRUE)
cvbase$c19IsStrict[is.na(cvbase$c19IsStrict)] <- median_col1
#c19IsPunish
median_col1 <- median(cvbase$c19IsPunish, na.rm = TRUE)
cvbase$c19IsPunish[is.na(cvbase$c19IsPunish)] <- median_col1
#c19IsOrg
median_col1 <- median(cvbase$c19IsOrg, na.rm = TRUE)
cvbase$c19IsOrg[is.na(cvbase$c19IsOrg)] <- median_col1
#trustGovCtry
median_col1 <- median(cvbase$trustGovCtry, na.rm = TRUE)
cvbase$trustGovCtry[is.na(cvbase$trustGovCtry)] <- median_col1
#trustGovState
median_col1 <- median(cvbase$trustGovState, na.rm = TRUE)
cvbase$trustGovState[is.na(cvbase$trustGovState)] <- median_col1
#gender
cvbase$gender[is.na(cvbase$gender)] <- 3
#age
median_col1 <- median(cvbase$age, na.rm = TRUE)
cvbase$age[is.na(cvbase$age)] <- median_col1
#edu 
median_col1 <- median(cvbase$edu, na.rm = TRUE)
cvbase$edu[is.na(cvbase$edu)] <- median_col1
#c19ProSo01
cvbase$c19ProSo01[is.na(cvbase$c19ProSo01)] <- 0
#c19ProSo02
cvbase$c19ProSo02[is.na(cvbase$c19ProSo02)] <- 0
#c19ProSo03
cvbase$c19ProSo03[is.na(cvbase$c19ProSo03)] <- 0
#c19ProSo04
cvbase$c19ProSo04[is.na(cvbase$c19ProSo04)] <- 0


########################################################################################

# 2(a)
attach(cvbase) #attach this data frame, then we can use the variable directly.

#here use the filter method(%>% is kind of pipe) to filter the focus country Iran as one dataframe and other countries as other data frame
Focus_country = cvbase %>% filter(coded_country == "Iran")
Other_countries = cvbase %>% filter(coded_country != "Iran")

#this one is to see the how other countries and focus country mean value in different variable
Focus_country = Focus_country %>% summarise_all(.funs = mean, na.rm = TRUE)
Focus_country$coded_country[1]="Iran"
Other_countries = Other_countries %>% summarise_all(.funs = mean, na.rm = TRUE)
Other_countries$coded_country[1]="Other"
merged_df <- rbind(Focus_country, Other_countries)

# use gather() to make the variable be tidy, make df change be to long format
df_tidy <- merged_df %>% gather(key = "variable", value = "value", -coded_country)

#this is use the ggplot to draw a bar chart, data is df_tidy, each variable is the x-axis, and value of that variable is the y, fill color with country
ggplot(data = df_tidy, aes(x = variable, y = value, fill = coded_country)) + #use dodge mean the bar is next to each other which make compare easier
  geom_bar(stat = "identity", position = "dodge") + #The stat = "identity" option means to use the actual value in the data instead of the default count statistics.
  labs(x = "Variable", y = "Value", fill = "Country") + #The labs() function is used to add chart titles and axis labels
  theme(axis.text.x = element_text(angle = -90, vjust = 0, hjust=0)) #The theme() function is used to change the Angle and position of the axis label.

detach()


#######################################################################################

# 2(b)
#here use the filter method(%>% is kind of pipe) to filter the focus country Iran as one dataframe and other countries as other data frame
Focus_country = cvbase %>% filter(coded_country == "Iran")
# Remove the coded_country column as all are Iran. there is two different way
#Focus_country = subset(Focus_country, select = -coded_country) 
Focus_country$coded_country = NULL

attach(Focus_country)

c19ProSo01.fit <-lm(c19ProSo01 ~ ., data = Focus_country)
summary(c19ProSo01.fit)
max(coef(c19ProSo01.fit))

c19ProSo02.fit <-lm(c19ProSo02 ~ ., data = Focus_country)
summary(c19ProSo02.fit)
max(coef(c19ProSo02.fit))

c19ProSo03.fit <-lm(c19ProSo03 ~ ., data = Focus_country)
summary(c19ProSo03.fit)
max(coef(c19ProSo03.fit))

c19ProSo04.fit <-lm(c19ProSo04 ~ ., data = Focus_country)
summary(c19ProSo04.fit)
max(coef(c19ProSo04.fit))

detach()

#######################################################################################

# 2(c)
# repeat what we do in 2b but now we use the other countries as the data
#here use the filter method(%>% is kind of pipe) to filter the focus country Iran as one dataframe and other countries as other data frame
Other_countries = cvbase %>% filter(coded_country != "Iran")
# Remove the coded_country column as all are not Iran. there is two different way
Other_countries = subset(Other_countries, select = -coded_country) 
#Focus_country$coded_country = NULL

attach(Other_countries)

c19ProSo01.fit <-lm(c19ProSo01 ~ ., data = Other_countries)
summary(c19ProSo01.fit)
max(coef(c19ProSo01.fit))

c19ProSo02.fit <-lm(c19ProSo02 ~ ., data = Other_countries)
summary(c19ProSo02.fit)
max(coef(c19ProSo02.fit))

c19ProSo03.fit <-lm(c19ProSo03 ~ ., data = Other_countries)
summary(c19ProSo03.fit)
max(coef(c19ProSo03.fit))

c19ProSo04.fit <-lm(c19ProSo04 ~ ., data = Other_countries)
summary(c19ProSo04.fit)
max(coef(c19ProSo04.fit))

#par(mfrow = c(2,2)) can be help for see the linear relation
#plot(c19ProSo01.fit)
#plot(c19ProSo02.fit)
#plot(c19ProSo03.fit)
#plot(c19ProSo04.fit)

detach()


######################################################################################

# 3(a)
#here is to make coded_country column to be last column
C = cvbase %>% select(-coded_country, everything(), coded_country)
attach(C)
#then here we group it by country names and calculate the each variables(we chooses) means
C = C %>% select(-everything(), c(c19ProSo01, c19ProSo02, c19ProSo03, c19ProSo04, jbInsec03, fail01, fail02, fail03, disc03, age, c19NormDo), coded_country)
C = C %>% group_by(`coded_country`) %>% summarise_all(mean, na.rm = TRUE)
detach()
#then we scaling the C data
C_scaled = scale(C[,-1])
#set the seed for nstart, if not set the seed, every time we do this will different
set.seed(29334152)
#here we need to find 3-7 similar countries from 112 countries, so we set as 35 clusters.
ckfit = kmeans(C_scaled, centers = 35, nstart = 20) #35
#the code below is used to find the cluster which contain the country Iran.
similar_countries <- C[ckfit$cluster == ckfit$cluster[which(C$coded_country == "Iran")], "coded_country"]
#then we print it out we can see which cluster contain Iran(focus country) and the similar coutries for Iran.
similar_countries

#this code below is print 3 which is the which cluster Iran in.
ckfit$cluster[which(C$coded_country == "Iran")]
T1=table(actual=C$coded_country, fitted=ckfit$cluster)
T1=as.data.frame.matrix(T1) #converts the table T1 into a data frame.
#then we look at the table in column 16 we can also see the similar country.
T1



#######################################################################################

# 3(b)
# repeat what we do in 2b but now we use the similar countries as the data
#here use the filter method(%>% is kind of pipe) to filter the focus country Iran as one dataframe and similar countries as other data frame
Similar_countries = cvbase %>% filter(coded_country %in% c("Bosnia and Herzegovina", "Hong Kong S.A.R.", "Moldova", "Poland", "Republic of Serbia", "Romania"))
# Remove the coded_country column as all are similar countries. there is two different way
Similar_countries = subset(Similar_countries, select = -coded_country) 
#Focus_country$coded_country = NULL

attach(Similar_countries)

c19ProSo01_similar.fit <-lm(c19ProSo01 ~ ., data = Similar_countries)
summary(c19ProSo01_similar.fit)
max(coef(c19ProSo01_similar.fit))

c19ProSo02_similar.fit <-lm(c19ProSo02 ~ ., data = Similar_countries)
summary(c19ProSo02_similar.fit)
max(coef(c19ProSo02_similar.fit))

c19ProSo03_similar.fit <-lm(c19ProSo03 ~ ., data = Similar_countries)
summary(c19ProSo03_similar.fit)
max(coef(c19ProSo03_similar.fit))

c19ProSo04_similar.fit <-lm(c19ProSo04 ~ ., data = Similar_countries)
summary(c19ProSo04_similar.fit)
max(coef(c19ProSo04_similar.fit))
detach()





