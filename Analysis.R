#Loading Libraries
#library(tidyverse)
library(ggplot2)
library(purrr)
library(tibble)
library(dplyr)
library(readr)
library(tidyr)

Gathered_tidy_data <- read_csv("Gathered_tidy_data.csv", 
col_types = cols(X1 = col_skip()))
View(Gathered_tidy_data)


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
View(Grouped_Gross_salary)

ggplot(data = Grouped_Extraor_payments)+
  geom_bar(mapping = aes(x=`Autonomous Region`,y=Quantity,fill=Gender),stat = 'identity',position = 'dodge') + coord_flip() + ggtitle('Gross salary payments by gender and Autonomous Region')

#Calculating Gender paygap.


# Ungrouped_Gross_salary<-
#   Grouped_Gross_salary %>%
#   ungroup()

#I want To group By AR and Gender 
#Grouped_Gross_salary_gender_AR<-

  
 Grouped_Gross_salary %>%
  group_by(`Autonomous Region`) %>%
  arrange(`Autonomous Region`) %>%
    View()

 
Males_Gross_Salary<-subset(Grouped_Gross_salary,Gender == 'M')

# Males_Gross_Salary%>%
#   ungroup%>%
#   select(`Autonomous Region`,Quantity)

Females_Gross_salary<-subset(Grouped_Gross_salary,Gender == 'F')   

(Males_Gross_Salary$Quantity-Females_Gross_salary$Quantity)/Males_Gross_Salary$Quantity


Gender_paygap_table<-
  Gathered_tidy_data %>%
  select(`Autonomous Region`) %>%
  unique()


Males_Gross_Salary$Quantity-Females_Gross_salary$Quantity


Gender_paygap_table$Difference<-Males_Gross_Salary$Quantity-Females_Gross_salary$Quantity

Gender_paygap_table$Gender_paygap<-(Males_Gross_Salary$Quantity-Females_Gross_salary$Quantity)/Males_Gross_Salary$Quantity*100

Gender_paygap_table

Gender_paygap_table%>%
  filter(Gender_paygap<25)%>%
  summary

Gender_paygap_table%>%
  filter(Gender_paygap>25)%>%
  

#View(Grouped_Gross_salary_gender_AR)
