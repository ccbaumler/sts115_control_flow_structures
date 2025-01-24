# Learning Goals:

# Identify common control flow structures and their uses
# Evaluate conditions using comparison operators
# Write for- and while-loops to run code repeatedly
# Understand how iteration across lists and data frames differs

## Comparison Operators

# == , => , <= , > , <
# and the negative condition with !

x <- 5
y <- 5

x == y
x != y
x >= y
x <= y
x > y
x < y

y <- 7

x == y
x != y
x >= y
x <= y
x > y
x < y

# lexi

x <- "text"
y <- "test" #add f and x

x == y
x != y
x >= y
x <= y
x > y
x < y

# If-else conditional control flow structure

# without variables

if (7 > 5) {
  message("7 is greater than 5")
  print("7 is greater than 5")
  cat("7 is greater than 5")
}

# with one variable

x <- 7
if (x > 5) {
  message(x, " is greater than 5")
  print(paste(x, " is greater than 5"))
  cat(x, "is greater than 5")
}

# with two variables

x <- 7
y <- 5
if (x > y) {
  message(x, " is greater than ", y)
  print(paste(x, " is greater than ", y))
  cat(x, "is greater than", y)
}

# Adding the else

x <- 3
y <- 5

if (x > y) {
  message(x, " is greater than ", y)
  print(paste(x, " is greater than ", y))
  cat(x, "is greater than", y)
  } else {
    message(x, " is not greater than ", y)
    print(paste(x, " is not greater than ", y))
    cat(x, "is not greater than", y)
}

# Add else if and equal to statement

x <- 3
y <- 3

if (x > y) {
  message(x, " is greater than ", y)
  print(paste(x, " is greater than ", y))
  cat(x, "is greater than", y)
  } else if (x == y ) {
    message(x, " is equal to ", y)
    print(paste(x, " is equal to ", y))
    cat(x, "is equal to", y)
    } else {
      message(x, " is not greater than ", y)
      print(paste(x, " is not greater than ", y))
      cat(x, "is not greater than", y)
}

# Operating on a list

i <- c(0, 1, -1, 2, 0)

if ( i <= 0 ) {
  cat("non-positive")
} else {
  cat("positive")
}

ifelse(i <= 0, yes = "non-positive", no = "positive")

-1 <= 0
0 <= 0

1 <= 0

# Creating a nest for binary to tertiary operations

ifelse(i < 0, 
       yes = "negative", 
       no = ifelse(i == 0, 
                   yes = "zero", 
                   no = "positive" 
                   ) 
       )

-1 < 0

0 < 0
0 == 0

1 < 0
1 == 0

# which can do what ifelse does as well

i <- c(-2, 0, 3, -1, 0, 5)

which(i > 0)
which(i < 0)
which(i == 0)

zero_position <- which(i == 0)

result <- c()
#result <- c(length(i))
#result <- character(length(i))

result[which(i < 0)] <- "negative" # == result[c(2,5)] <- "negative"

result[which(i == 0)] <- "zero"

result[which(i > 0)] <- "positive"

result

# Switch control flow structure (key value pair)

# If-else and switch comparison

x <- "a"

if (x == "a") {
  "option 1"
} else if (x == "b") {
  "option 2" 
} else if (x == "c") {
  "option 3"
} else {
  stop("Invalid `x` value: Use 'a', 'b', or 'c'")
}

switch(x,
       a = "option 1",
       b = "option 2",
       c = "option 3",
       stop("Invalid `x` value: Use 'a', 'b', or 'c'")
)

s <- 2
switch(s, "red", "green", "blue")

# key greater than list length

s <- 4
switch(s, "red", "green", "blue")

# What is happening???

switch_result <- switch(s, "red", "green", "blue")
switch_result

# the issue with positional arguments!

s <- 4
switch(s, "red", 
          "green", 
          "blue", 
          stop("Is value greater than listed options? s = ", s))

s <- 5
switch(s, "red", 
          "green", 
          "blue", 
          stop("Is value greater than listed options? s = ", s))

s <- "hat"
switch(s, "red", 
       "green", 
       "blue", 
       stop("Is value greater than listed options?"))

s <- "b"
switch(s, r = "red", 
          g = "green", 
          b = "blue", 
          stop("Is value greater than listed options?"))

s <- "hat"
switch(s, r = "red", 
          g = "green", 
          b = "blue", 
          stop("Is value greater than listed options?"))

s <- 6
switch(s, r = "red", 
          g = "green", 
          b = "blue", 
          stop("Is value greater than listed options?"))

# Combining switch with if else for extended function

s <- 6

color_switch <- switch(s, r = "red", 
                          g = "green", 
                          b = "blue", 
                          stop("Is value greater than listed options?"))
color_switch

if ( is.null(color_switch) ) {
  stop("Is value greater than listed options?")
} else {
  color_switch
}

s <- "r"

color_switch <- switch(s, r = "red", 
                          g = "green", 
                          b = "blue", 
                          stop("Is value greater than listed options?"))
color_switch

if ( is.null(color_switch) ) {
  stop("Is value greater than listed options?")
} else {
  color_switch
}

# for on data from class

df <- read.csv("my_data.csv")

for ( i in df ) {
  message(i)
}

for ( i in df ) {
  print(sort(unique(i)))
}

nrow(df)

for ( i in 1:nrow(df) ) {
  cat(df$response[i], 
      "is associated with", 
      df$major[i], 
      "\n")
}

for ( i in 1:nrow(df) ) {
  cat(df[ i, 1 ], 
      "is associated with", 
      df[ i, 2 ], 
      "\n")
}

for (i in 1:nrow(df)) {
  if (df$major[i] == "ECS") {
    next
  }
  cat("Response:", 
      df$response[i], 
      "\n")
}

comp_majors <- c("ECS", "STS", "DSC", "STA", "BIT")

for (i in 1:nrow(df)) {
  if (df$major[i] %in% comp_majors) {
    next
  }
  cat("Response:", df$response[i], "\n")
}

# while

i <- 1
count <- 0
while (i <= nrow(df)) {
  if (df$distance.mi[i] < 1) {
    count <- count + 1
  }
  i <- i + 1
}
cat("Number of students with distance less than 1 mile:", 
    count, 
    "\n")

i <- 1
count <- 0
while (i <= nrow(df)) {
  if (df$pet[i] == 'Woof') {
    count <- count + 1
  } 
  i <- i + 1
}
cat("Number of students that prefer dogs:", 
    count, 
    "\n")

# repeat

i <- 1
repeat {
  if (df$time.min[i] > 10) {
    cat("Row", 
        i, 
        "was the first student willing to commute greater than 10 minutes:", 
        df$response[i], 
        "\n")
    break
  }
  i <- i + 1
}

i <- 1
repeat {
  if ( is.na(df$time.min[i]) ) {
    cat("Row", 
        i, 
        "contains an NA value. The reponse is:", 
        df$response[i], 
        "\n")
    break
  }
  i <- i + 1
}

# lapply operations - Call another function on each element of a vector or container

v <- c(1:10) + 1

lapply(v, \(x) (x^2))

summary(df)

lapply(df, summary)
lapply(df$distance.mi, summary) 

loc_lengths <- lapply(df$location, nchar)

loc_lengths
which.max(loc_lengths)
df$location[which.max(loc_lengths)]

max_loc_length <- max(unlist(loc_lengths))

normalized_loc_lengths <- lapply(loc_lengths, function(x) x/max_loc_length)

distance <- list(df$distance.mi)
lapply(distance, mean)
lapply(distance, quantile)

all_majors <- unique(df$major) # List of majors

ecs_major <- lapply(all_majors, grep, pattern = "ECS")

ecs_major

woof_count <- lapply(df$pet, function(x) sum(grepl("Woof", x)))

woof_count

lapply(df, function(column) sort(unique(column)))

# for script and output
knitr::stitch(script="control_flow_structures.R", system.file("misc", "knitr-template.Rhtml", package="knitr"))

#for only code
.knitr.author <- "Your Name"

knitr::opts_chunk$set(echo = TRUE, eval = FALSE)

# Run knitr::stitch with the script and template
knitr::stitch(
  script = "control_flow_structures.R", 
  template = system.file("misc", "knitr-template.Rhtml", package = "knitr")
)
