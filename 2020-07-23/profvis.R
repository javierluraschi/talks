
add_numbers_for <- function(num) {
  total <- 0
  for (i in 1:num) {
    total <- total + i
  }
  total
}

add_numbers_sum <- function(num) {
  sum(1:num)
}

# profile
# profvis::profvis(add_numbers_for(10^7))
