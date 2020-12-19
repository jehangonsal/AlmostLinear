
### Data analysis in R course

### Let's have some fun with the titanic dataset

library(tidyverse)
library(ggstatsplot)
library(titanic)

df <- titanic::titanic_train

# Let's explore our data

View(df)

str(df)

# Quick correction

df <- df %>%
  mutate(Survived = as.factor(ifelse(Survived == 1, "Survived", "Died")),
         Sex = as.factor(Sex))

# Let's get some simple visualisations

df %>%
  ggplot(aes(x = Age)) +
  geom_histogram(fill = "lightblue", colour = "black")+
  theme_bw() +
  labs(title = "Histogram of the ages of the passengers on the Titanic",
       caption = "177 rows did not have values, they were missing :(")

df %>%
  ggplot(aes(x = Age)) +
  geom_density(fill = "lightblue", colour = "black")+
  theme_bw() +
  labs(title = "Histogram of the ages of the passengers on the Titanic",
       caption = "177 rows did not have values, they were missing :(")

df %>%
  ggplot(aes(x = Survived)) +
  geom_bar(fill = "lightblue", colour = "black") +
  theme_bw() 

df %>%
  group_by(Survived) %>%
  summarise(count = n()) %>%
  mutate(proportion = count/sum(count))

df %>%
  ggplot(aes(x = Sex, fill = Survived)) +
  geom_bar(colour = "black", position = "dodge") +
  theme_bw() +
  facet_wrap(~Sex, scales = "free") 




