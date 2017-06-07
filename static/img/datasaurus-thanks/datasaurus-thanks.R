# datasaurus

library(ggplot2)
library(datasauRus)
library(dplyr)

dino <- datasaurus_dozen %>% 
  filter(dataset == "dino") %>% 
  mutate(xz = (x - mean(x))/sd(x))

# number of dinomates
n <- 9

# repeating data frames function
rep_df <- function(df, n) 
  as.data.frame(lapply(df, rep, n))

dinomates <- rep_df(dino, n) %>% 
  mutate(mate = rep(1:n, each = nrow(dino))) %>% 
  mutate(new_x = ifelse(mate %in% c(1:3, 7:9), -xz, xz))

ggplot(dinomates, aes(x = new_x, y = y)) +
  geom_point(aes(colour = y)) +
  facet_wrap(~ mate) +
  theme_void() +
  theme(strip.background = element_blank(),
        strip.text.x = element_blank(),
        panel.spacing = unit(0, "cm")) +
  scale_colour_gradient(low = "#8dbdb8", high = "#41716c", guide = FALSE) 

ggsave("datasaurus-thanks.png", width = 25.6, height = 14.4, units = "in")
