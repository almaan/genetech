check_answer <- function (
    ans, 
    hash
) {
  success <- c("Fantastic!", "Great job!", "You are on fire!", "Hell yeah!", "Such wow!", "Awesome!")
  failure <- c("Try again...", "Better luck next time...", "Incorrect...", "Nope...", "Not quite right...", "You're doing it wrong...")
  if (digest::digest(ans) == hash) {
    return(list(sample(x = success, size = 1), TRUE))
  } else {
    return(list(sample(x = failure, size = 1), FALSE))
  }
}

q1_check <- function (
    ans
) {
  hashes <- c("33b1e01702aeb4ac9461279b50600522", "219870d1e5b7a069479ad227f916a47f", 
              "704d6af0611c6d93d5b0fe5898bcd121", "68414ede506de2617b66af8260ae88d1")
  checks <- c()
  for (i in seq_along(ans)) {
    txt <- check_answer(ans[[i]], hashes[[i]])
    cat(paste(sprintf("Answer %s:", i), txt[[1]]), "\n")
    checks <- c(checks, txt[[2]])
  }
  
  if (all(checks)) {
    cat("\nYou have succeeded!\n")
  } else {
    cat(sprintf("\nPlease revise the following answer(s): %s", paste((1:4)[!checks], collapse = ", ")))
  }
}

q4_check <- function (
    ans
) {
  hash <- "22c55dc705445bb530072d2f01d9d769"
  txt <- check_answer(sort(ans), hash)
  cat(txt[[1]], "\n")
}


q5_check <- function (
    ans
) {
  hash <- "ed448f3814b5815511d7d5babb8639e1"
  txt <- check_answer(sort(ans), hash)
  cat(txt[[1]], "\n")
}

q7_check <- function (
    ans
) {
  hashes <- c("eaca5f783323cd3a0ebe04f752c86e3d", "1b9595f8f162c53cb175888d3b9f2502")
  checks <- c()
  for (i in seq_along(ans)) {
    txt <- check_answer(ans[[i]], hashes[[i]])
    cat(paste(sprintf("Answer %s:", i), txt[[1]]), "\n")
    checks <- c(checks, txt[[2]])
  }
  
  if (all(checks)) {
    cat("\nYou have succeeded!\n")
  } else {
    cat(sprintf("\nPlease revise the following answer(s): %s", paste((1:2)[!checks], collapse = ", ")))
  }
}

"4a5d7d50676e6d0ea065f445d8a5539d"

q8_check <- function (
    ans
) {
  hashes <- c("4a5d7d50676e6d0ea065f445d8a5539d", "5e338704a8e069ebd8b38ca71991cf94")
  checks <- c()
  for (i in seq_along(ans)) {
    txt <- check_answer(ans[[i]], hashes[[i]])
    cat(paste(sprintf("Answer %s:", i), txt[[1]]), "\n")
    checks <- c(checks, txt[[2]])
  }
  
  if (all(checks)) {
    cat("\nYou have succeeded!\n")
  } else {
    cat(sprintf("\nPlease revise the following answer(s): %s", paste((1:2)[!checks], collapse = ", ")))
  }
}

q9_check <- function (
    ans
) {
  if (class(ans) != "character") cat(sprintf("Wrong format: '%s'", class(ans)), "\n")
  hash <- "4197b9a263b6beab76570e8503dcaf53"
  txt <- check_answer(sort(ans), hash)
  cat(txt[[1]], "\n")
}

q10_check <- function (
    ans
) {
  hashes <- c("3602474f97c62de6d9d831fa7e497bab", "35e2f440809fcc4e703876eb592746c2")
  checks <- c()
  for (i in seq_along(ans)) {
    txt <- check_answer(ans[[i]], hashes[[i]])
    cat(paste(sprintf("Answer %s:", i), txt[[1]]), "\n")
    checks <- c(checks, txt[[2]])
  }
  
  if (all(checks)) {
    cat("\nYou have succeeded!\n")
  } else {
    cat(sprintf("\nPlease revise the following answer(s): %s", paste((1:2)[!checks], collapse = ", ")))
  }
}

q12_check <- function (
    ans
) {
  if (class(ans) != "data.frame") cat(sprintf("Wrong format: '%s'", class(ans)), "\n")
  hash <- "1c44f01e2086d437a31a6e020fe69388"
  txt <- check_answer(ans, hash)
  cat(txt[[1]], "\n")
}