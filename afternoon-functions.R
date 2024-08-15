
# Now let's write a function that automatically switches depth based on
gw_rate <- function(site) {
  
  if(!site %in% c("mountain", "prairie", "desert", "beach")) {
    warning("site not included:(")
  }
  
  # Stored parameters for 4 different sites
  gw_depths <- data.frame(sitename = c("mountain", "prairie", "desert", "beach"),
                          depth = c(32, 41, 63, 2),
                          slope = c(11.2, 0.4, 0.8, 2.6))
  
  # Subset for just that site information (creates a 1-row data frame)
  site_select <- filter(gw_depths, sitename == site)
  
  # Calculate using values from that 1-row data frame
  transport_rate <- 1.4 * site_select$slope + 3.6 * site_select$depth
  
  # Return the output
  return(transport_rate)
  
}

gw_rate(site = "beach")



