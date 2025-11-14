# UTC Github Workshop 🤝 30 Day Map Challenge Day 14: OpenStreetMap
# November 14, 2025
# Author: Anna Duan, [fill in all participants' names]

#### Imports ####
library(tidyverse)
library(conflicted)

font_import()
loadfonts(device = "pdf")


conflicted::conflict_prefer("filter", "dplyr")
conflicted::conflict_prefer("select", "dplyr")
#### Load data ####
data_center_density <- st_read("data/data_center_density.geojson")
basemap <- st_read("data/basemap.geojson")

#### Map ####
hex_states <- data_centers_hex %>%
  group_by(state) %>%
  summarize(geometry = st_union(x))

ggplot() +
  geom_sf(data = basemap, fill = "black", color = NA, size = 0.01) + 
  geom_sf(
    data = data_centers_hex %>% filter(centers > 0),
    aes(fill = centers/10),
    color = "gray10"
  ) +
  geom_sf(data = data_centers_hex, color = "gray10", size = 0.5) +
  geom_sf(data = basemap, fill = NA, color = "gray20") +
  geom_text(aes(label = str_wrap("Data Center Alley, Northern Virginia", 38), x = 3179603, y = 3000), size = 4, color = "lightgoldenrod1", family = "Satoshi", fontface = "bold", hjust = 1, vjust = 1) +
  geom_text(aes(label = str_wrap("Data Center Alley in Northern Virginia has the densest concentration of data centers in the world, with 300+ data centers and 4900 megawatts in energy capacity.", 38), x = 3179603, y = 0), size = 3, color = "lightgoldenrod3", family = "Satoshi", hjust = 1, vjust = 1) +
  labs(
    title = "A qurter of global internet traffic passes through Virginia's Data Center Alley",
    subtitle = "Log-transformed data centers per 1000 square-mile hexogon grids as of November 2025",
    caption = "#30DayMapChallenge Day 14: OpenStreetMap\nSource: OpenStreetMap Contributors, 2025\nAnna Duan X Penn Urban Tech Club",
    fill = "Data center density\n(Centers/100sqmi)"
  ) +
  scale_fill_viridis_c(
    option = "A",
    trans = "log",
    labels = scales::label_number()
  ) +
  theme_void() +
  theme(
    legend.position = c(0.1, 0.2),
    plot.background = element_rect(fill = "black"),
    text = element_text(color = "orchid3", family = "Satoshi"),
    plot.title.position = "plot",
    plot.title = element_text(
      face = "bold",
      size = 21,
      color = "lightgoldenrod1",
      margin = margin(b = 5),
      hjust = 0,
    ),
    
    plot.subtitle = element_text(
      size = 14,
      hjust = 0,
      color = "lightgoldenrod3",
      margin = margin(b = 10)
    ),
    
    plot.caption.position = "plot",
    plot.caption = element_text(
      size = 9,
      hjust = 0.5,
      margin = margin(t = 10)
    ),
    plot.margin = margin(t = 20, r = 20, b = 20, l = 20)
  )
