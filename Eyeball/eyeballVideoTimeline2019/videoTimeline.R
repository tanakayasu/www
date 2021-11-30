source("C://Users//Pro//Documents//MEGA//eyeball analysis F2017//eyeball analysis 2017//libLoad.R")
boundaryMap <- "VIDEO_NAME	videoStart	region.start	region.end	videoEnd
BasketballF1	0	164	209	376
BasketballF2	0	166	211	261
BasketballM1	0	52	97	162
BasketballM2	0	186	231	237
TennisF1    	0	218	263	262
TennisF2    	0	272	317	317
TennisM1	    0	220	265	331
TennisM2	    0	170	215	236
WeightF1    	0	225	270	372
WeightF2    	0	84	129	203
WeightM1    	0	147	192	268
WeightM2    	0	187	232	255" %>% fread

boundaryMaplong <- melt(boundaryMap, id.vars= c("VIDEO_NAME", "region.start", "region.end"),
                        measure.vars = c("videoStart", "videoEnd"))
boundaryMaplong2 <- melt(boundaryMap, id.vars= c("VIDEO_NAME", "videoStart", "videoEnd"),
                        measure.vars = c("region.start", "region.end"))

ggplot() +
  geom_line(data = boundaryMaplong,
            aes(value, reorder(VIDEO_NAME, -boundaryMaplong2$value))) +
  geom_point(data = boundaryMaplong,
             aes(value, reorder(VIDEO_NAME, -boundaryMaplong2$value)),
             size = 3, shape="square") +
  geom_line(data = boundaryMaplong2,
            aes(value, VIDEO_NAME, colour = VIDEO_NAME), size = 2) +
  geom_point(data = boundaryMaplong2,
             aes(value, VIDEO_NAME, colour = VIDEO_NAME), size = 3) +
  theme(legend.position="none")
