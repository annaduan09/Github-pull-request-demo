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
    aes(fill = centers),
    color = "gray10"
  ) +
  geom_sf(data = data_centers_hex, color = "gray10", size = 0.5) +
  geom_sf(data = basemap, fill = NA, color = "gray20") +
  labs(
    title = "A quarter of global internet traffic passes through Northern Virginia",
    subtitle = "Data Center Alley in Northern Virginia has the densest concentration of data centers in the world, with 300+ data centers and 4900 megawatts in energy capacity.",
    caption = "Source: OpenStreetMap Contributors\nAuthor: Anna Duan and Penn Urban Tech Club",
    fill = "Data center density\n(centers per 500sqmi)"
  ) +
  scale_fill_viridis_b(
    option = "A",
    trans = "log",
    n.breaks = 6,
    limits = c(1, 130),
    labels = scales::label_number()
  ) +
  theme_void() +
  theme(
    legend.position = c(0.1, 0.2),
    plot.background = element_rect(fill = "black"),
    
    text = element_text(color = "goldenrod1", family = "Sans"),
    
    plot.title.position = "plot",
    plot.title = element_text(
      family = "Satoshi",
      face = "bold",
      size = 18,
      color = "goldenrod1",
      margin = margin(b = 5)
    ),
    
    plot.subtitle = element_text(
      family = "Satoshi",
      size = 14,
      color = "goldenrod2",
      margin = margin(b = 10)
    ),
    
    plot.caption.position = "plot",
    plot.caption = element_text(
      family = "Satoshi",
      size = 9,
      hjust = 0.5,
      color = "goldenrod3",
      margin = margin(t = 10)
    ),
    
    plot.margin = margin(t = 20, r = 10, b = 20, l = 10)
  )

