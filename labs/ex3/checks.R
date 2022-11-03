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

q1_check <- function(ans) {
  if (NA %in% ans) {
    stop("NA set as answer, make sure you filled it out properly.")
  }
  hashes <- list(
    # There are multiple hashes for ans 1, 2 and 3  as the type might be numeric or integer
    c("33b1e01702aeb4ac9461279b50600522", "e866442adfc27e602e85fc539e54b2a2"),
    c("219870d1e5b7a069479ad227f916a47f", "0275d8a1a76528d5a9c4372664cb73cb"), 
    c("704d6af0611c6d93d5b0fe5898bcd121", "b24bd50a679ef9f43c714b29bd513600"), 
    c("68414ede506de2617b66af8260ae88d1")
  )
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

q3_check <- function(ans) {
  if (is.na(ans)) {
      stop("NA set as answer, make sure you filled it out properly.")
  }

  txt <- check_answer(as.character(ans), "135dd680a3af7fdafbe66f3417c9cba2")
  if (txt[[2]]) {
    cat(paste("Answer", dQuote(ans), "is correct.", txt[[1]], "\n"))
  } else {
    warning(paste("Answer", dQuote(ans), "is wrong.", txt[[1]]))
  }
}

q4_check <- function(ans) {
  if (is.na(ans)) {
    stop("NA set as answer, make sure you filled it out properly.")
  }
  hash <- "22c55dc705445bb530072d2f01d9d769"
  txt <- check_answer(sort(ans), hash)

  if (txt[[2]]) {
    cat(txt[[1]], "\n")
  } else {
    warning(paste(txt[[1]], "\n"))
  }
}


q5_check <- function(ans) {
  if (is.na(ans)) {
    stop("NA set as answer, make sure you filled it out properly.")
  }
  hash <- "ed448f3814b5815511d7d5babb8639e1"
  txt <- check_answer(sort(ans), hash)
  if (txt[[2]]) {
    cat(txt[[1]], "\n")
  } else {
    warning(txt[[1]])
  }
}


q7_check <- function(ans) {
  if (NA %in% ans) {
    stop("NA set as answer, make sure you filled it out properly.")
  }
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
    warning(sprintf("\nPlease revise the following answer(s): %s", paste((1:2)[!checks], collapse = ", ")))
  }
}


q8_check <- function(ans) {
  if (NA %in% ans) {
    stop("NA set as answer, make sure you filled it out properly.")
  }
  hashes <- c("4a5d7d50676e6d0ea065f445d8a5539d", "5e338704a8e069ebd8b38ca71991cf94")
  checks <- c()
  for (i in seq_along(ans)) {
    txt <- check_answer(as.numeric(ans[[i]]), hashes[[i]])
    cat(paste(sprintf("Answer %s:", i), txt[[1]]), "\n")
    checks <- c(checks, txt[[2]])
  }

  if (all(checks)) {
    cat("\nYou have succeeded!\n")
  } else {
    warning(sprintf("\nPlease revise the following answer(s): %s", paste((1:2)[!checks], collapse = ", ")))
  }
}


q9_check <- function(ans) {
  if (is.na(ans)) {
    stop("NA set as answer, make sure you filled it out properly.")
  }

  if (class(ans) != "character") cat(sprintf("Wrong format: '%s'", class(ans)), "\n")
  hash <- "ad302d7ad8870a0462c8fb0b62f679d5"
  txt <- check_answer(sort(ans), hash)
  if (txt[[2]]) {
    cat(txt[[1]], "\n")
  } else {
    warning(paste(txt[[1]], "\n"))
  }
}


q10_check <- function(ans) {
  if (NA %in% ans) {
    stop("NA set as answer, make sure you filled it out properly.")
  }
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
    warning(sprintf("\nPlease revise the following answer(s): %s", paste((1:2)[!checks], collapse = ", ")))
  }
}


q11_check <- function(ans) {
  if (is.na(ans)) {
    stop("NA set as answer, make sure you filled it out properly.")
  }

  if (class(ans) != "integer" || class(ans) != "numeric") {
    stop(paste("Give the NUMBER for the answer you thinks is right. Not ", class(ans)))
  }
  ans <- as.numeric(ans)
  txt <- check_answer(ans, "e5b57f323c7b3719bbaaf9f96b260d39")
  if (txt[[2]]) {
    cat(txt[[1]], "\n")
  } else {
    warning(paste(txt[[1]], "\n"))
  }
}


q12_check <- function(ans) {
  if (is.na(ans)) {
    stop("NA set as answer, make sure you filled it out properly.")
  }

  if (class(ans) != "data.frame") {
    stop(sprintf("Invalid class '%s'. The answer should be a 'data.frame'.", class(ans)))
  }

  if (any(dim(ans) != c(20, 3))) {
    stop(sprintf("Invalid dimensions %s, should be 20x3", paste(dim(ans), collapse = "x")))
  }

  if (!all(colnames(ans) == c("gene", "weight", "factor"))) {
    stop("Invalid column names. Should be 'gene', 'weight' and 'factor'")
  }

  hashes <- c(
    gene = "da1fbe2034e56944a7f74a6281894291",
    weight = "39819a727a1bb0da2f0e17b0776b3b55",
    factor = "c79c0f4fef754277307807afc6deb1f1"
  )
  checks <- c()
  for (i in seq_along(ans)) {
    name <- names(hashes)[i]

    # Normalize data to sorted array
    arr <- as.array(ans[,name])
    arr <- arr[order(arr)]
    hash <- hashes[name]

    txt <- check_answer(arr, hash)
    checks <- c(checks, txt[[2]])
  }

  if (all(checks)) {
    cat("\nYou have succeeded!\n")
  } else {
    warning(sprintf("Column(s) '%s'", paste0(c("gene", "weight", "factor")[!checks], collapse = ", ")), ifelse(sum(!checks) > 1, "are wrong.", "is wrong."))
    warning("\nPlease revise the answer.\n")
  }
}

q13_check <- function(ans) {
  if (NA %in% ans) {
    stop("NA set as answer, make sure you filled it out properly.")
  }

  hashes <- c("f2cc231f6fb7b06e4f4b1480dc4a5954", "4384228d77f8107753c2ff85195104f8")
  checks <- c()
  for (i in seq_along(ans)) {
    txt <- check_answer(ans[[i]], hashes[[i]])
    cat(paste(sprintf("Answer %s:", i), txt[[1]]), "\n")
    checks <- c(checks, txt[[2]])
  }

  if (all(checks)) {
    cat("\nYou have succeeded!\n")
  } else {
    warning(sprintf("\nPlease revise the following answer(s): %s", paste((1:2)[!checks], collapse = ", ")))
  }
}
