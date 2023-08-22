
catch_error <- function(expr) {
  # Catch errors thrown by check and output message to student to try again.
  tryCatch(
    expr,
    error = function(e) {
      warning("Your solution raises the following error:\n")
      print(e$message)
      warning("Try again!")
    }
  )
}

check_exercise_1 <- function(vec) {
  check <- function(vec) {
    if (round(vec %*% c(1337,69,42,666,80085)) == 151677) {
      print("Great job! The answer is correct.")
    } else {
      warning("Your answer is sadly not correct, try again.")
    }
  }
  
  catch_error(check(vec))
}


check_exercise_2 <- function(sequence, answer) {
  check <- function(sequence, answer) {
    key <- cb(sequence)
    names(answer) <- toupper(answer)
    names(key) <- toupper(key)

    in_names <- as.vector(sapply(names(answer),
                          function(x){
                            x %in% names(key)
                          }))
    if (all(in_names)) {
      ordr_ans <- sort(names(answer))
      ordr_key <- sort(names(key))

      status <- all(answer[ordr_ans] == key[ordr_key])

      if (status) {
        print("Congrats you did it!")
      } else {
        warning("These are not the correct numbers...")
      }
    } else {
      warning("seems like you did not format you answer correctly!")
    }
  }

  catch_error(check(sequence, answer))
}

cb <- function(sequence) {
  nb <- c(A = 0, C = 0, T = 0, G = 0)
  for (c in sequence) {
    nb[c] <- nb[c] + 1
  }
  return(nb)
}

check_exercise_3 <- function(ans){
  check <- function(ans) {
    a1 <- decrypt(362026828)
    a2 <- decrypt(746595)
    a3 <- c("hqvj333334ba-45",
            "hqvj333334bab6a",
            "hqvj3333355a586",
            "hqvj333334baaa9",
            "huffc33463")
    
    a3 <- sapply(a3,
                 d_caesar)
    
    a3 <- as.vector(toupper(a3))
    
    key <- list(a1 = a1, a2 = a2, a3 = a3)
    score <- c()
    
    format_error <- FALSE
    if (!(all(sapply(names(ans),
                     function(x){ x %in% names(key)})))) {
      format_error <- TRUE
    }
    
    if (length(ans[["a3"]]) != length(key[["a3"]])) {
      format_error <- TRUE 
    } else if (!(all(sapply(names(ans[["a3"]]),
                            function(x){ x %in% names(key[["a3"]])})))) {
      format_error <- TRUE
    }
    
    if (format_error) {
      print("Format error, try again!")
    } else {
    
      for (k in c("a1","a2","a3")) {
        score <- c(score,all(ans[[k]] == key[[k]]))
      }
      if (all(score)) {
        print("well done, all answers are correct!")
      } else {
        for (f in which(score == F)) {
          print(sprintf("Question %d is incorrect, try again!",f))
        }
      }
    }
  }
  catch_error(check(ans))
}

encrypt <- function(x) {
  y <- (x^2 + 99)
  return(y)
}

decrypt <- function(y) {
  x <- sqrt(y - 99)
  return(x)
}

e_caesar <- function(x) {
 out <- c()
 legend <- c(letters,c(0:9),"-")
 ln <- length(legend)
 
 for (let in unlist(strsplit(tolower(x),""))){
  pos <- which(legend == let)
  pos <- (pos + 3) %% ln 
  pos <- ifelse(pos == 0, ln, pos)
  out <- c(out,legend[pos])
 }
 out <- paste0(out,collapse = "")
 return(out)
}

d_caesar <- function(x) {
 out <- c()
  legend <- c(letters,c(0:9),"-")
 ln <- length(legend)
 
 for (let in unlist(strsplit(tolower(x),""))){
  pos <- which(legend == let)
  pos <- (pos - 3) %% (ln)
  pos <- ifelse(pos == 0,ln,pos)
  out <- c(out,legend[pos])
 }
 out <- paste0(out,collapse = "")
 return(out)
}
