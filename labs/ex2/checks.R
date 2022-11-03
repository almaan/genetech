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


check_q13 <- function(ans) {
    hashes <- c(
        "d271a2c3d1f8fc9f413d3421e516cb77",
        "9e3f307536c9b07c11f31bec3030a77f",
        "7ec0170b6497c85b83a6d25973d54430",
        "9c4d15daf98e3ba52b52dd161b571ad4"
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