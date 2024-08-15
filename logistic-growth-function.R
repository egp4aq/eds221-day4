# rm(list = ls())

# create logistic growth function ----

logistic_growth <- function(N0, K, r, time) {
  Nt <- K / (1 + ((K - N0) / N0) *exp(-r*time))
  return(Nt)
}

logistic_growth(N0 = 100, K = 6000, r = 0.27, time = 40) # runs logistic growth function for one time

time_vec <- seq(from = 0, to = 50, by = 0.1)

pop_1 <- logistic_growth(N0 = 100, K = 6000, r = 0.27, time = time_vec) # run function for a vector of times

# this gives us the same answer as what we did in line 14, but this will store each in the vector

pop_1_vec <- vector(mode = "numeric", length = length(time_vec))

for (i in seq_along(time_vec)) {
  population <- logistic_growth(N0 = 100, K = 6000, r = 0.27, time = time_vec[i])
  pop_1_vec[i] <- population
}

# create data frame with time vector and population estimates ----

pop_time_1 <- data.frame(time_vec, pop_1_vec)

# plotting basic logistic growth function ----

ggplot(data = pop_time_1, aes(x = time_vec, y = pop_1_vec)) +
  geom_line()

r_seq <- seq(from = 0.2, to = 0.4, by = 0.01)

out_matrix <- matrix(nrow = length(time_vec), ncol = length(r_seq)) # matrix with as many rows as time steps and 
# as many columns as r values

for (i in seq_along(r_seq)) { # outer loop of growth rates
  for (j in seq_along(time_vec)) { # inner loop of time steps
    population <- logistic_growth(N0 = 100, K = 6000, r = r_seq[i], time = time_vec[j])
    out_matrix[j,i] <- population
  }
}

# wrangling to make plot ----
out_df <- data.frame(out_matrix, time = time_vec) # turn matrix into data frame to add time
colnames(out_df) <- c(paste0("growth_rate_", r_seq), "time") # change column names in data frame

# pivot data from being wide to being tall
out_df_long <- out_df %>%
  pivot_longer(cols = -time, names_to = "growth_rate", values_to = "population_size")

ggplot(data = out_df_long, aes(x = time, y = population_size)) +
  geom_line(aes(color = growth_rate), show.legend = FALSE)
