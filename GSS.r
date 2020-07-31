library(ggplot2)
library(dplyr)
library(statsr)
load("gss.rdata")
head(gss)
summary(gss)
dim(gss)
#subsettibg sccordinf to research question
df <- select(gss,year,region,consci) %>% na.omit() %>%
  mutate(negative=grepl("Hardly",consci)) %>%
mutate(recent=as.factor(ifelse(year>=2006,"R","H"))) 

#Now Exploratory Data analysis
#Before performing inference, we can perform some exploratory data analysis (EDA) using both summary statistics/tables and visual plots.


summary(df)
df_table <- table(df$region,df$negative)
df_table
#findind the probality for each region with respect to negative
prop.table(df_table)

#The table do seem to indicate that there is a difference between regions: while the count table shows consistency on the 
#magnitude of the ‘positive’ view of scientific community across the regions, using the proportion table highlights how they differ

#plots
g <- ggplot(df, aes(x=region,fill=negative)) +
  geom_bar(position = "fill")+
  xlab("Region across") +ylab("proportion for eacch region")+
  scale_fill_discrete(name="Opinion",labels=c("Positive","Negative"))
g

#This study also included a look at the recent data - defined as 2006 and beyond - since it could indicate broader societal changes that would be of interest.
#now consider data past 2006
since2006 <- filter(df,recent=="R")
summary(since2006)


since2006_table <- table(df$region,df$negative)
prop.table(since2006_table)
#Similar to the ‘DF’ data, the recent data shows a clear preference for ‘positive’ message, with some variations between regions.

#Now by plotting

h <- ggplot(since2006) + aes(x=region,fill=negative) + geom_bar(position = "fill") + 
  labs(x="Respondent's Region",y="Proportion",title="Impact of Region of Residence on Positive View of Scientific Community") +
  scale_fill_discrete(name="Opinion",labels=c("Positive","Negative"))
h

#combining both these plots
i <- ggplot(df) + aes(x=recent,fill=negative) + geom_bar(position = "fill") + facet_grid(.~region) +
  labs(x="Historical versus Recent",y="Proportion",title="Impact of Region of Residence on Positive View of Scientific Community") +
  scale_fill_discrete(name="Opinion",labels=c("Positive","Negative"))

i
# now step 4 : Statistical Infernce:

#In this section, we perform statistical inference on the results. This is done through a series of well-defined steps:
  
#1.Define hypothesis
#2.Choose statistical method
#3.Check for conditions
#4.Perform the inference tests
#5.Interpret the results
#Null Hypothesis :respondent's confidence in scientific community and their region of residence are independent variables.
#Alternative Hypothesis :  confidence in the scientific community does vary by region of residence.
str(df)
str(since2006)

#CHECKING FOR TWO CONDTIONS
study_table1 <- table(df$region,df$negative)
study_table1
sum(study_table1<=5)

study_table2 <- table(since2006$region,since2006$negative)
study_table2
sum(study_table2<=5)
#At this point, we can conclude both conditions have been met.
#chi square test
c_df <-chisq.test(df$region,df$negative)
c_df

c_since2006 <- chisq.test(since2006$region,since2006$negative)
c_since2006

#The high X-squared statistic in both cases - alltime and since2006 - with 8 degrees of freedom leads to very low p-values. Since the p-values are below alpha (0.05), we can conclude that there is sufficient evidence to reject H0 (null hypothesis).

#In the context of the research question, it mean that there is evidence that the confidence in scientific community varies by region.
