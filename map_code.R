# UTC Github Workshop 🤝 30 Day Map Challenge Day 14: OpenStreetMap
# November 14, 2025
# Author: Anna Duan, [fill in all participants' names]

#### Imports ####
library(tidyverse)
library(conflicted)
library(sf)


conflicted::conflict_prefer("filter", "dplyr")
conflicted::conflict_prefer("select", "dplyr")
#### Load data ####
data_centers_hex <- st_read("data/data_center_density.geojson")
basemap <- st_read("data/basemap.geojson")

#### Groups 1 and 2: Modify the map ####
ggplot() +
  geom_sf(data = basemap, fill = "black", color = "transparent", size = 0.01) + 
  geom_sf(
    data = data_centers_hex %>% filter(centers > 0),
    aes(fill = centers/10),
    color = "gray12"
  ) +
  geom_sf(data = data_centers_hex, color = "gray12", size = 0.5) +
  geom_sf(data = basemap, fill = "transparent", color = "gray22") +
  geom_polygon(aes(x,y),
               data = {h<-sqrt(10000)*1609.344/2; cx<-1581937; cy<-315796.5;
               data.frame(x=c(cx-h,cx+h,cx+h,cx-h),
                          y=c(cy-h,cy-h,cy+h,cy+h))},
               fill=NA, color="lightgoldenrod2") +
  geom_text(aes(label = str_wrap("Data Center Alley, Northern Virginia", 38), x = 3479603, y = 400000), size = 4, color = "lightgoldenrod1", family = "Satoshi", fontface = "bold", hjust = 1, vjust = 1) +
  geom_text(aes(label = str_wrap("Data Center Alley in Northern Virginia has the densest concentration of data centers in the world, with 300+ data centers and 4900 megawatts in energy capacity. Location just outside of Washington, D.C., this area handles, by most estimates, 22-30% of the world's internet traffic.  ", 50), x = 3479603, y = 250000), size = 3, color = "lightgoldenrod3", family = "Satoshi", hjust = 1, vjust = 1) +
  labs(
    title = "A quarter of global internet traffic passes through Virginia's Data Center Alley", hjust = 0.5,
    subtitle = "Data centers per 1000 square-mile hexagon grids as of November 2025, log-transformed", hjust = 0.5,
    caption = "#30DayMapChallenge Day 14: OpenStreetMap | Source: OpenSreetMap Contributors, 2025 | Anna Duan X Penn Urban Tech Club",
    fill = "Data center density\n(Log Centers/100sqmeters)",
    
  ) +
  scale_fill_viridis_c(
    option = "A",
    trans = "log",
    labels = scales::label_number()
  ) +
  theme_void() +
  theme(
    legend.position = c(0.1, 0.3),
    plot.background = element_rect(fill = "black"),
    text = element_text(color = "orchid3", family = "Satoshi"),
    plot.title.position = "plot",
    plot.title = element_text(
      face = "bold",
      size = 23,
      color = "#FFA400",
      margin = margin(b = 5),
      hjust = 0.5,
    ),
    
    plot.subtitle = element_text(
      size = 14,
      hjust = 0,
      color = "#DE8D00",
      margin = margin(b = 10)
    ),
    
    plot.caption.position = "plot",
    plot.caption = element_text(
      size = 11,
      hjust = 0.5,
      margin = margin(t = 10)
    ),
    legend.title = element_text(face = "bold"),
    plot.margin = margin(t = 20, r = 20, b = 20, l = 20)
  )

#### Group 3: Save the map #### 
ggsave("map.jpeg", width = 33, height = 20, units = "cm")
