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

ggplot(data = Grouped_Extraor_payments)+
  geom_bar(mapping = aes(x=`Autonomous Region`,y=Quantity,fill=Gender),stat = 'identity',position = 'dodge') + coord_flip() + ggtitle('Gross salary payments by gender and Autonomous Region')