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
data_centers_hex$centers_bin <- cut(
  data_centers_hex$centers,
  breaks = 10,
  include.lowest = TRUE
)

ggplot() +
  geom_sf(data = basemap, fill = "black", color = "gray20", size=0.01) + 
  geom_sf(data = data_centers_hex %>% filter(centers >0), aes(fill = centers_bin),  color = NA) +
  labs(title = "A quarter of the world's internet traffic passes through Northern Virginia",
       subtitle = "Data Center Alley in N. has the densest concentration of data centers in the world, with 300+ data centers and 4900 megawatts in energy capacity.",
       caption = "Source: OpenStreetMap Contributors\nAuthor: Anna Duan and Penn Urban Tech Club",
       fill = "Data centers per square mile, 2025") + 
  scale_fill_viridis_d(option = "A") +
  theme_void() +
  theme(legend.position="bottom")


####

hex_states <- data_centers_hex %>%
  group_by(state) %>%
  summarize(geometry = st_union(x))

ggplot() +
  geom_sf(data = basemap, fill = "black", color = NA, size=0.01) + 
  geom_sf(data = data_centers_hex %>% filter(centers>0), aes(fill = centers),  color = NA) +
  geom_sf(data = data_centers_hex, color = "gray10", size=0.5) +
  geom_sf(data = basemap, fill = NA, color = "gray20") +
  labs(title = "A quarter of global internet traffic passes through Northern Virginia",
       subtitle = "Data Center Alley in Northern Virginia has the densest concentration of data centers in the world, with 300+ data centers and 4900 megawatts in energy capacity.",
       caption = "Source: OpenStreetMap Contributors\nAuthor: Anna Duan and Penn Urban Tech Club",
       fill = "Data center density\n(centers per 500sqmi)") + 
  scale_fill_viridis_b(
    option = "A",
    trans = "log",
    n.breaks = 6,                
    limits = c(1, 130),
    labels = scales::label_number()
  ) +
  theme_void() +
  theme(legend.position=c(0.2, 0.2),
        plot.caption.position = "panel",
        plot.background=element_rect(fill="black"),
        panel.border = element_rect(fill="black"),
        text = element_text(color="goldenrod1", family="Satoshi"),
        plot.subtitle = element_text(
          family = "Satoshi",
          size = 12
        ))


