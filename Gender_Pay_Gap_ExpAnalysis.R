#Loading Libraries
 #library(tidyverse)
library(ggplot2)
library(purrr)
library(tibble)
library(dplyr)
library(readr)

#Loading data
data_female<- read_delim("Brut_Mon_sal_composition_Female.csv", 
                         "\t", escape_double = FALSE, col_names = FALSE, 
                         col_types = cols(X12 = col_skip()), trim_ws = TRUE
                         )
view(data_female)
                                                  
data_male<- read_delim("Brut_Mon_sal_composition_Male.csv", 
                         "\t", escape_double = FALSE, col_names = FALSE, 
                         col_types = cols(X12 = col_skip()), trim_ws = TRUE
)

data_bothgender<- read_delim("Brut_Mon_sal_composition_BothGender.csv", 
                             "\t", escape_double = FALSE, col_names = FALSE, 
                             col_types = cols(X12 = col_skip()), trim_ws = TRUE

)


names<-c('Autonomous Region','Basic Salary','Salary complements','Salary complements for reasons of night,sightseeing or working 
         during the weekend','Payments for overtime','Ordinary salary','Extraordinary payments','Gross Salary',
         'Social security contributions paid by the worker','Deductions IRPF','Net salary','Gender')

#Add Gender Variable
data_female$Gender<-'F'
data_male$Gender<-'M'
names(data_female)<-names
names(data_male)<-names
View(data_male)
View(data_female)

tidy_data<-rbind(data_female,data_male)

View(tidy_data)

write.csv(tidy_data,'tydi_data.csv')

#GATHERING DATA
Gathered_tidy_data<- tidy_data %>%
  gather('Basic Salary','Salary complements','Salary complements for reasons of night,sightseeing or working 
         during the weekend','Payments for overtime','Ordinary salary','Extraordinary payments','Gross Salary',
         'Social security contributions paid by the worker','Deductions IRPF','Net salary',
         key = 'Wage Type',value = 'Quantity')

View(Gathered_tidy_data)
write.csv(x = Gathered_tidy_data,'Gathered_tidy_data.csv',fileEncoding = 'utf8')


#START PLOTTING


#Basic Salary

Grouped_Basic_salary<-Gathered_tidy_data %>%
  filter(`Wage Type`=='Basic Salary') %>%
  group_by(Gender)
  
ggplot(data = Grouped_Basic_salary)+
  geom_bar(mapping = aes(x=`Autonomous Region`,y=Quantity,fill=Gender),stat = 'identity',position = 'dodge') + coord_flip() + ggtitle('Basic salary by gender and Autonomous Region')

#Net Salary

Grouped_Net_Salary <- Gathered_tidy_data %>%
  filter(`Wage Type`=='Net salary') %>%
  group_by(Gender)

ggplot(data = Grouped_Net_Salary)+
  geom_bar(mapping = aes(x=`Autonomous Region`,y=Quantity,fill=Gender),stat = 'identity',position = 'dodge') + coord_flip() + ggtitle('Net salary by gender and Autonomous Region')

#Extraordinary payments


Grouped_Extraor_payments <- Gathered_tidy_data %>%
  filter(`Wage Type`=='Extraordinary payments') %>%
  group_by(Gender)

ggplot(data = Grouped_Extraor_payments)+
  geom_bar(mapping = aes(x=`Autonomous Region`,y=Quantity,fill=Gender),stat = 'identity',position = 'dodge') + coord_flip() + ggtitle('Extraordinary payments by gender and Autonomous Region')

#Gross salary

Grouped_Gross_salary <- Gathered_tidy_data %>%
  filter(`Wage Type`=='Gross Salary') %>%
  group_by(Gender)

ggplot(data = Grouped_Extraor_payments)+
  geom_bar(mapping = aes(x=`Autonomous Region`,y=Quantity,fill=Gender),stat = 'identity',position = 'dodge') + coord_flip() + ggtitle('Gross salary payments by gender and Autonomous Region')

