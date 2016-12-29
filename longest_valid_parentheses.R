# Find longest valid parentheses
longest_valid_parentheses <- function(x) {
  
  stopifnot(is.character(x))
  
  x <- strsplit(x, "")[[1]] # split x into single characters
  dif <- 0
  len <- 0
  max_length <- 0
  
  # add 1 if parenthese opens, -1 if parentheses close
  for(i in seq_along(x)){
    len <- len + 1
    
    if(x[i] == "("){
      dif <- dif + 1
    } else {
      dif <- dif - 1
    }
    # if dif == 0 parenthese is valid, save length
    if(dif == 0){
      if(len > max_length){
        max_length <- len
      }
    }
    # if more parentheses closed than opened (dif < 0): parenthese is invalid
    if(dif < 0){
      dif <- 0
      len <- 0
    }
  }
  max_length
}

# Unit tests
library(testthat)

x <- ")(()))()(("
expect_equal(4, longestValidParentheses(x))

x <- "("
expect_equal(0, longestValidParentheses(x))

x <- "()"
expect_equal(2, longestValidParentheses(x))

x <- 3
expect_error(longestValidParentheses(x))
