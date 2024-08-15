gw_rate <- function(site) {
  gw_depths <- data.frame(sitename = c("mountain", "prairie", "desert", "beach"),
                          depth = c(32, 41, 63, 2),
                          slope = c(11.2, 0.4, 0.8, 2.6))
  
  site_select <- filter(gw_depths, sitename == site)
  
  transport_rate <- 1.4*site_select$slope + 3.6*site_select$depth
  
  return(transport_rate)
}

gw_rate(site = "desert")
