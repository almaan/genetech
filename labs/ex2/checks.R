check_answer <- function(
    ans,
    hash,
    serialize = TRUE
) {
  success <- c(
    "Fantastic!",
    "Great job!",
    "You are on fire!",
    "Hell yeah!",
    "Such wow!",
    "Awesome!"
  )
  failure <- c(
    "Try again...",
    "Better luck next time...",
    "Incorrect...",
    "Nope...",
    "Not quite right...",
    "You're doing it wrong..."
  )
  if (digest::digest(ans, serialize = serialize) %in% hash) {
    return(list(sample(x = success, size = 1), TRUE))
  } else {
    return(list(sample(x = failure, size = 1), FALSE))
  }
}

check_q1 <- function(n.genes, n.cells) {
    if (is.na(n.genes) || is.na(n.cells)) {
        stop("NA set as answer, make sure you filled it out properly.")
    }
    n.genes <- as.integer(n.genes)
    n.cells <- as.integer(n.cells)

    n.genes.ans <- check_answer(n.genes, "020f8662ba67ae4e6818dc82c7399d69")
    n.cells.ans <- check_answer(n.cells, "ba94b2c2bcd58b70de63aa862704f573")

    if (n.genes.ans[[2]] && n.cells.ans[[2]]) {
        cat(paste("Correct number of genes and cells.", n.genes.ans[[1]]))
    } else if (n.cells.ans[[2]]) {
        warning(paste("Wrong number of genes.", n.genes.ans[[1]]))
    } else if (n.genes.ans[[2]]) {
        warning(paste("Wrong number of cells.", n.cells.ans[[1]]))
    } else {
        warning(paste("Wrong number of genes and cells.", n.genes.ans[[1]]))
    }
}

check_q6 <- function(n.genes, n.cells) {
    if (is.na(n.genes) || is.na(n.cells)) {
        stop("NA set as answer, make sure you filled it out properly.")
    }
    n.genes <- as.integer(n.genes)
    n.cells <- as.integer(n.cells)

    n.genes.ans <- check_answer(n.genes, "16deb10de6702d99ae9869269e99aec0")
    n.cells.ans <- check_answer(n.cells, "f6aed0d4654c9619dc37d40221e83612")

    if (n.genes.ans[[2]] && n.cells.ans[[2]]) {
        cat(paste("Correct number of genes and cells.", n.genes.ans[[1]]))
    } else if (n.cells.ans[[2]]) {
        warning(sprintf("Wrong number of genes (%s). %s", n.genes,  n.genes.ans[[1]]))
    } else if (n.genes.ans[[2]]) {
        warning(sprintf("Wrong number of cells (%s). %s", n.cells, n.cells.ans[[1]]))
    } else {
        warning(sprintf("Wrong number of genes (%s) and cells (%s). %s", n.genes, n.cells, n.genes.ans[[1]]))
    }
}

check_q7 <- function(n.clst) {
    if (is.na(n.clst)) {
        stop("NA set as answer, make sure you filled it out properly.")
    }
    n.clst <- as.integer(n.clst)
    n.clst <- check_answer(n.clst, "20e70f4a08bdc6a54e53ad0a7d1498b6")

    if (n.clst[[2]]) {
        cat(paste("Correct number of clusters.", n.clst[[1]]))
    } else {
        warning(paste("Wrong number of clusters.", n.clst[[1]]))
    }
}


check_q8 <- function(n.clst.0.3, n.clst.1.2) {
    if (is.na(n.clst.0.3) || is.na(n.clst.1.2)) {
        stop("NA set as answer, make sure you filled it out properly.")
    }
    n.clst.0.3 <- as.integer(n.clst.0.3)
    n.clst.1.2 <- as.integer(n.clst.1.2)

    n.clst.0.3 <- check_answer(n.clst.0.3, "e03a89536262b6a0e2beabd90a841c43")
    n.clst.1.2 <- check_answer(n.clst.1.2, "f92eebebcfea9ebd99a68de2cb409133")

    if (n.clst.0.3[[2]] && n.clst.1.2[[2]]) {
        cat(paste("Correct number of clusters.", n.clst.0.3[[1]]))
    } else if (n.clst.1.2[[2]]) {
        warning(paste("Wrong number of clusters at 0.3 resolution.", n.clst.0.3[[1]]))
    } else if (n.clst.0.3[[2]]) {
        warning(paste("Wrong number of clusters at 1.2 resolution.", n.clst.1.2[[1]]))
    } else {
        warning(paste("Wrong number of clusters at both resolutions.", n.clst.0.3[[1]]))
    }
}


check_q11 <- function(term_name, p_value) {
  if (is.na(term_name) || is.na(p_value)) {
    stop("NA set as answer, make sure you filled it out properly.")
  }
  
  if (!is.character(term_name)) {
    stop(paste("'term_name' should be of type 'character', is", type(term_name)))
  }
  
  if (!is.double(p_value)) {
    stop(paste("'p_value' should be of type 'double', is", type(p_value)))
  }
  
  term_name <- trimws(term_name)
  
  term_name <- check_answer(term_name, "6e822130aad241deeb4cfd5e6572c593")
  
  # TODO fix more accurate check here but I am worried that there might be 
  # float-point difference here that would make a normal hash check unstable
  p_value_corr <- p_value < 0.01
  
  if (term_name[[2]] && p_value_corr) {
    cat(paste("Correct!", term_name[[1]]))
  } else if (p_value_corr) {
    warning(paste("Wrong term name", term_name[[1]]))
  } else if (term_name[[2]]) {
    warning("Wrong p-value, try again.")
  } else {
    warning(paste("Wrong term name and p-value.", term_name[[1]]))
  }
}


check_q13 <- function(ans) {
    hashes <- c(
        "d271a2c3d1f8fc9f413d3421e516cb77",
        "9e3f307536c9b07c11f31bec3030a77f",
        "ef9c858d84af2093f1e1196e638e2482",
        "944ac12785129b75eb7bf66ae6556361"
    )
    if (NA %in% ans) {
        stop("NA found in vector, make sure you filled it out properly.")
    }

    checks <- c()
    for (i in seq_along(ans)) {
        # Normalize string
        celltype <- gsub(" ", "", tolower(ans[[i]]))

        check <- check_answer(celltype, hashes)
        checks <- c(checks, check[[2]])
    }

    if (all(checks)) {
        cat("Correct!")
    } else {
        # Get wrong cell types
        wrong.ans <- ans[!checks]
        warning(paste(
            "Unfortuenatly you have the wrong answer.",
            paste(lapply(wrong.ans, dQuote), collapse = " and "),
            "are not amoung the cell types we seek..."
        ))
    }
}