1.
mpg %>%
  group_by(class) %>% 
  summarise(cty_mean = mean(city))
2.
mpg %>%
  group_by(class) %>% 
  summarise(cty_mean = mean(city)) %>%
  arrange(desc(cty_mean)) 
3.
mpg %>%
  group_by(manufacturer) %>%
  summarise(hwy_mean = mean(highway)) %>%
  arrange(desc(hwy_mean)) %>% 
  head(3)
4.
mpg %>%
  group_by(manufacturer) %>% 
  filter(class == "compact") %>% 
  summarise(cty_count = n()) %>%
  arrange(desc(cty_count))