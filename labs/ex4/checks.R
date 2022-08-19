check_answer <- function (
    ans, 
    hash,
    serialize = TRUE
) {
  success <- c("Fantastic!", "Great job!", "You are on fire!", "Hell yeah!", "Such wow!", "Awesome!")
  failure <- c("Try again...", "Better luck next time...", "Incorrect...", "Nope...", "Not quite right...", "You're doing it wrong...")
  if (digest::digest(ans, serialize = serialize) %in% hash) {
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
  hash <- "ad302d7ad8870a0462c8fb0b62f679d5"
  txt <- check_answer(sort(ans), hash)
  cat(txt[[1]], "\n")
}

q10_check <- function (
    ans
) {
  hashes <- c("6dceff630cda09b9c89c61a8944b5223", "bd639ff1cd7fa3b0d5e8ccb9949bb90d")
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
  
  if (class(ans) != "data.frame") {
    stop(sprintf("Invalid class '%s'. The answer should be a 'data.frame'.", class(ans)))
  }
  
  if (dim(ans) != c(20, 3)) {
    stop(sprintf("Invalid dimensions %s, should be 20x3", paste(dim(ans), collapse = "x")))
  }
  
  if (!all(colnames(ans) == c("gene", "weight", "factor"))) {
    stop("Invalid column names. Should be 'gene', 'weight' and 'factor'")
  }
  
  hashes <- c("dc64e67869e0d96edd717a1e190b2592", "a12d19bcace3651a80a3eb683f7159a2", "24406efdafd47e4d25082dce5b86cb52",
              "47dd7308f67a890c1ef5894a1cec881d", "a12d19bcace3651a80a3eb683f7159a2", "5f13b719daef0d2f89e307afee966f93")
  checks <- c()
  for (i in seq_along(ans)) {
    txt <- check_answer(as.character(ans[, i]), hashes)
    checks <- c(checks, txt[[2]])
  }
  
  if (all(checks)) {
    cat("\nYou have succeeded!\n")
  } else {
    cat(sprintf("Column(s) '%s'", paste0(c("gene", "weight", "factor")[!checks], collapse = ", ")), ifelse(sum(!checks) > 1, "are wrong.", "is wrong."))
    cat("\nPlease revise the answer.\n")
  }
}